from __future__ import annotations
from typing import Dict, List, Optional, TypeVar, Literal, Any, Type, Iterable
from dataclasses import dataclass, field
from collections import defaultdict
from xml.etree import ElementTree
from xml.etree.ElementTree import Element
import os
import re
from copy import deepcopy


def main():
    registry = ElementTree.parse("vk.xml").getroot()
    files: Dict[str, str] = {}

    emit_constants(files, parse_constants(registry))
    emit_basetypes(files, parse_basetypes(registry))
    emit_external_types(files, parse_external_types(registry))
    emit_enums(files, parse_enums(registry))
    emit_flags(files, parse_flags(registry))
    emit_handles(files, parse_handles(registry))
    emit_fn_types(files, parse_fn_types(registry))
    emit_structs(files, parse_structs(registry))
    emit_unions(files, parse_unions(registry))
    emit_commands(files, parse_commands(registry))

    OUTPUT_ROOT = "vk"
    for rel_path, content in files.items():
        path = os.path.join(OUTPUT_ROOT, rel_path)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)


# ----------------
# Data Types
# ----------------


VkLevel = Literal["global", "instance", "device"]


@dataclass
class VkType:
    """
    A parsed Vulkan C type as it appears in `vk.xml` (minus the parameter/member name).

    This is a small “shape” model used by the generator to reason about pointer depth,
    const-qualification, and fixed-size array suffixes.

    Attributes:
        name:
            The underlying (non-pointer, non-array) type token, e.g. `"VkDevice"`,
            `"void"`, `"uint32_t"`.

        ptr_level:
            Number of `*` indirections. For example:
              - `VkDevice`            -> 0
              - `VkDevice*`           -> 1
              - `const void* const*`  -> 2

        const:
            Const-qualification per indirection layer, ordered **outermost → innermost**.
            Its length should be `ptr_level + 1`.

            - `const[-1]` is the constness of the innermost pointee / base type.
            - `const[-2]` is the constness of the pointer to that pointee.
            - …and so on outward.

            This ordering is intended to line up with Vulkan's comma-separated `optional=`
            conventions (outer pointer first, then pointee/array elements).

        array_dims:
            If the type is a fixed-size C array, the bracket contents for each dimension,
            ordered **outermost → innermost**. For example:
              - `char[VK_UUID_SIZE]` -> `["VK_UUID_SIZE"]`
              - `float[3][4]`       -> `["3", "4"]`
            Otherwise this is an empty list.
    """
    name: str
    ptr_level: int = 0
    const: List[bool] = field(default_factory=lambda: [False])
    array_dims: List[str] = field(default_factory=list) # type: ignore[reportUnknownVariableType]


@dataclass
class VkConstant:
    name: str
    type: VkType
    value: str


@dataclass
class VkWrapperType:
    name: str
    underlying_type: VkType | Literal["OPAQUE_TYPE"]


@dataclass
class VkEnum:
    name: str
    values: List[VkEnumValue]


@dataclass
class VkEnumValue:
    name: str
    value: int


@dataclass
class VkTypeAlias:
    declared_type_name: str
    aliased_type_name: str


@dataclass
class VkFlags:
    flags_name: str
    flag_bits: VkFlagBits
    width: Literal[32, 64]


@dataclass
class VkFlagBits:
    name: str
    values: List[VkFlagValue]
    bits: List[VkFlagBit]


@dataclass
class VkFlagValue:
    name: str
    value: int


@dataclass
class VkFlagBit:
    name: str
    bitpos: int


@dataclass
class VkHandle:
    name: str
    type: Literal["VK_DEFINE_HANDLE", "VK_DEFINE_NON_DISPATCHABLE_HANDLE"]


@dataclass
class VkFnType:
    name: str
    return_type: VkType
    params: List[VkFnParam]


@dataclass
class VkFnParam:
    name: str
    type: VkType


@dataclass
class VkStruct:
    name: str
    members: List[VkStructMember]


@dataclass
class VkStructMember:
    name: str
    type: VkType
    value: Optional[str]
    bit_width: Optional[int] = None


@dataclass
class VkStructMemberPackingInfo:
    group_index: int
    width: int
    offset: int


@dataclass
class VkUnion:
    name: str
    member_types: List[VkType]


@dataclass
class VkVersionedCommand:
    version: VkVersion
    command: VkCommand


@dataclass(frozen=True)
class VkVersion:
    major: int
    minor: int


@dataclass
class VkCommand:
    name: str
    return_type: VkType
    params: List[VkCommandParam]


@dataclass
class VkCommandParam:
    # optional and length work here because our bindings only care about the optional and length of the outermost ptr
    name: str
    type: VkType
    length: Optional[str]
    optional: bool


@dataclass
class VkExtensionCommands:
    name: str
    type: Literal["instance", "device"]
    commands: List[VkCommand]


@dataclass
class VkParsedCommands:
    core_commands: Dict[VkLevel, Dict[VkVersion, List[VkVersionedCommand]]]
    extension_commands: Dict[str, List[VkExtensionCommands]]


# ----------------
# Parsing
# ----------------


def parse_constants(registry: Element) -> List[VkConstant]:
    constants: List[VkConstant] = []
    api_constants = next(el for el in registry.findall("enums") if el.get("name") == "API Constants")
    for constant_el in api_constants.findall("enum"):
        name = constant_el.attrib["name"]
        type = constant_el.attrib["type"]
        value = constant_el.attrib["value"]
        constants.append(VkConstant(name, VkType(type), value))
    return constants


def parse_basetypes(registry: Element) -> List[VkWrapperType]:
    # hardcoded because parsing these is way too complicated and there aren't many
    basetypes: List[VkWrapperType] = [
        VkWrapperType("VkSampleMask", VkType("uint32_t")),
        VkWrapperType("VkDeviceSize", VkType("uint64_t")),
        VkWrapperType("VkDeviceAddress", VkType("uint64_t")),
        VkWrapperType("VkRemoteAddressNV", VkType("void", ptr_level=1)),
    ]
    return basetypes


def parse_external_types(registry: Element) -> List[VkWrapperType | VkEnum]:
    # hardcoded because parsing these is way too complicated
    external_types: List[VkWrapperType | VkEnum] = [
        # Platform types
        # Xlib / Xrandr
        VkWrapperType("Display", "OPAQUE_TYPE"),
        VkWrapperType("VisualID", VkType("uint32_t")),
        VkWrapperType("Window", VkType("uint32_t")),
        VkWrapperType("RROutput", VkType("uint32_t")),
        # Wayland
        VkWrapperType("wl_display", "OPAQUE_TYPE"),
        VkWrapperType("wl_surface", "OPAQUE_TYPE"),
        # Win32
        VkWrapperType("HINSTANCE", VkType("size_t")),
        VkWrapperType("HWND", VkType("size_t")),
        VkWrapperType("HMONITOR", VkType("size_t")),
        VkWrapperType("HANDLE", VkType("size_t")),
        VkWrapperType("SECURITY_ATTRIBUTES", "OPAQUE_TYPE"),
        VkWrapperType("DWORD", VkType("uint32_t")),
        VkWrapperType("LPCWSTR", VkType("size_t")),
        # XCB
        VkWrapperType("xcb_connection_t", "OPAQUE_TYPE"),
        VkWrapperType("xcb_visualid_t", VkType("uint32_t")),
        VkWrapperType("xcb_window_t", VkType("uint32_t")),
        # DirectFB
        VkWrapperType("IDirectFB", "OPAQUE_TYPE"),
        VkWrapperType("IDirectFBSurface", "OPAQUE_TYPE"),
        # Fuchsia (Zircon)
        VkWrapperType("zx_handle_t", VkType("uint32_t")),
        # OpenHarmony / OHOS (WSI)
        VkWrapperType("OHNativeWindow", "OPAQUE_TYPE"),
        # Google Games Platform (GGP)
        VkWrapperType("GgpStreamDescriptor", VkType("uint32_t")),
        VkWrapperType("GgpFrameToken", VkType("uint32_t")),
        # QNX Screen
        VkWrapperType("screen_context_t", VkType("size_t")),
        VkWrapperType("screen_window_t", VkType("size_t")),
        VkWrapperType("screen_buffer_t", VkType("size_t")),
        # NVIDIA SciSync / SciBuf
        VkWrapperType("NvSciSyncAttrList", VkType("size_t")),
        VkWrapperType("NvSciSyncObj", VkType("size_t")),
        VkWrapperType("NvSciSyncFence", "OPAQUE_TYPE"),
        VkWrapperType("NvSciBufAttrList", VkType("size_t")),
        VkWrapperType("NvSciBufObj", VkType("size_t")),
        # Android NDK
        VkWrapperType("ANativeWindow", "OPAQUE_TYPE"),
        VkWrapperType("AHardwareBuffer", "OPAQUE_TYPE"),
        # Apple CoreAnimation / Metal / IOSurface (non-ObjC paths are opaque)
        VkWrapperType("CAMetalLayer", "OPAQUE_TYPE"),
        VkWrapperType("MTLDevice_id", VkType("size_t")),
        VkWrapperType("MTLCommandQueue_id", VkType("size_t")),
        VkWrapperType("MTLBuffer_id", VkType("size_t")),
        VkWrapperType("MTLTexture_id", VkType("size_t")),
        VkWrapperType("MTLSharedEvent_id", VkType("size_t")),
        VkWrapperType("IOSurfaceRef", VkType("size_t")),
        # Video encoding types
        # H.264
        VkEnum("StdVideoH264ProfileIdc", [
            VkEnumValue("BASELINE", 66),
            VkEnumValue("MAIN", 77),
            VkEnumValue("HIGH", 100),
            VkEnumValue("HIGH_444_PREDICTIVE", 244),
            VkEnumValue("INVALID", 0x7FFFFFFF),
        ]),
        VkEnum("StdVideoH264LevelIdc", [
            VkEnumValue("LEVEL_1_0", 0),
            VkEnumValue("LEVEL_1_1", 1),
            VkEnumValue("LEVEL_1_2", 2),
            VkEnumValue("LEVEL_1_3", 3),
            VkEnumValue("LEVEL_2_0", 4),
            VkEnumValue("LEVEL_2_1", 5),
            VkEnumValue("LEVEL_2_2", 6),
            VkEnumValue("LEVEL_3_0", 7),
            VkEnumValue("LEVEL_3_1", 8),
            VkEnumValue("LEVEL_3_2", 9),
            VkEnumValue("LEVEL_4_0", 10),
            VkEnumValue("LEVEL_4_1", 11),
            VkEnumValue("LEVEL_4_2", 12),
            VkEnumValue("LEVEL_5_0", 13),
            VkEnumValue("LEVEL_5_1", 14),
            VkEnumValue("LEVEL_5_2", 15),
            VkEnumValue("LEVEL_6_0", 16),
            VkEnumValue("LEVEL_6_1", 17),
            VkEnumValue("LEVEL_6_2", 18),
            VkEnumValue("INVALID", 0x7FFFFFFF),
        ]),
        VkWrapperType("StdVideoH264SequenceParameterSet", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoH264PictureParameterSet", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeH264SliceHeader", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeH264PictureInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoDecodeH264PictureInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeH264ReferenceInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoDecodeH264ReferenceInfo", "OPAQUE_TYPE"),
        # H.265/HEVC
        VkEnum("StdVideoH265ProfileIdc", [
            VkEnumValue("MAIN", 1),
            VkEnumValue("MAIN_10", 2),
            VkEnumValue("MAIN_STILL_PICTURE", 3),
            VkEnumValue("FORMAT_RANGE_EXTENSIONS", 4),
            VkEnumValue("SCC_EXTENSIONS", 9),
            VkEnumValue("INVALID", 0x7FFFFFFF),
        ]),
        VkEnum("StdVideoH265LevelIdc", [
            VkEnumValue("LEVEL_1_0", 0),
            VkEnumValue("LEVEL_2_0", 1),
            VkEnumValue("LEVEL_2_1", 2),
            VkEnumValue("LEVEL_3_0", 3),
            VkEnumValue("LEVEL_3_1", 4),
            VkEnumValue("LEVEL_4_0", 5),
            VkEnumValue("LEVEL_4_1", 6),
            VkEnumValue("LEVEL_5_0", 7),
            VkEnumValue("LEVEL_5_1", 8),
            VkEnumValue("LEVEL_5_2", 9),
            VkEnumValue("LEVEL_6_0", 10),
            VkEnumValue("LEVEL_6_1", 11),
            VkEnumValue("LEVEL_6_2", 12),
            VkEnumValue("INVALID", 0x7FFFFFFF),
        ]),
        VkWrapperType("StdVideoH265VideoParameterSet", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoH265SequenceParameterSet", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoH265PictureParameterSet", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeH265SliceSegmentHeader", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeH265PictureInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoDecodeH265PictureInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeH265ReferenceInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoDecodeH265ReferenceInfo", "OPAQUE_TYPE"),
        # AV1
        VkEnum("StdVideoAV1Profile", [
            VkEnumValue("MAIN", 0),
            VkEnumValue("HIGH", 1),
            VkEnumValue("PROFESSIONAL", 2),
            VkEnumValue("INVALID", 0x7FFFFFFF),
        ]),
        VkEnum("StdVideoAV1Level", [
            VkEnumValue("LEVEL_2_0", 0),
            VkEnumValue("LEVEL_2_1", 1),
            VkEnumValue("LEVEL_2_2", 2),
            VkEnumValue("LEVEL_2_3", 3),
            VkEnumValue("LEVEL_3_0", 4),
            VkEnumValue("LEVEL_3_1", 5),
            VkEnumValue("LEVEL_3_2", 6),
            VkEnumValue("LEVEL_3_3", 7),
            VkEnumValue("LEVEL_4_0", 8),
            VkEnumValue("LEVEL_4_1", 9),
            VkEnumValue("LEVEL_4_2", 10),
            VkEnumValue("LEVEL_4_3", 11),
            VkEnumValue("LEVEL_5_0", 12),
            VkEnumValue("LEVEL_5_1", 13),
            VkEnumValue("LEVEL_5_2", 14),
            VkEnumValue("LEVEL_5_3", 15),
            VkEnumValue("LEVEL_6_0", 16),
            VkEnumValue("LEVEL_6_1", 17),
            VkEnumValue("LEVEL_6_2", 18),
            VkEnumValue("LEVEL_6_3", 19),
            VkEnumValue("LEVEL_7_0", 20),
            VkEnumValue("LEVEL_7_1", 21),
            VkEnumValue("LEVEL_7_2", 22),
            VkEnumValue("LEVEL_7_3", 23),
            VkEnumValue("INVALID", 0x7FFFFFFF),
        ]),
        VkWrapperType("StdVideoAV1SequenceHeader", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoAV1TimingInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoAV1ColorConfig", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoAV1TileInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoAV1Quantization", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoAV1Segmentation", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoAV1LoopFilter", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoAV1CDEF", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoAV1LoopRestoration", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoAV1FilmGrain", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeAV1PictureInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoDecodeAV1PictureInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeAV1ExtensionHeader", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeAV1DecoderModelInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeAV1OperatingPointInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoEncodeAV1ReferenceInfo", "OPAQUE_TYPE"),
        VkWrapperType("StdVideoDecodeAV1ReferenceInfo", "OPAQUE_TYPE"),
        # VP9
        VkEnum("StdVideoVP9Profile", [
            VkEnumValue("PROFILE_0", 0),
            VkEnumValue("PROFILE_1", 1),
            VkEnumValue("PROFILE_2", 2),
            VkEnumValue("PROFILE_3", 3),
            VkEnumValue("INVALID", 0x7FFFFFFF),
        ]),
        VkEnum("StdVideoVP9Level", [
            VkEnumValue("LEVEL_1_0", 0),
            VkEnumValue("LEVEL_1_1", 1),
            VkEnumValue("LEVEL_2_0", 2),
            VkEnumValue("LEVEL_2_1", 3),
            VkEnumValue("LEVEL_3_0", 4),
            VkEnumValue("LEVEL_3_1", 5),
            VkEnumValue("LEVEL_4_0", 6),
            VkEnumValue("LEVEL_4_1", 7),
            VkEnumValue("LEVEL_5_0", 8),
            VkEnumValue("LEVEL_5_1", 9),
            VkEnumValue("LEVEL_5_2", 10),
            VkEnumValue("LEVEL_6_0", 11),
            VkEnumValue("LEVEL_6_1", 12),
            VkEnumValue("LEVEL_6_2", 13),
            VkEnumValue("INVALID", 0x7FFFFFFF),
        ]),
        VkWrapperType("StdVideoDecodeVP9PictureInfo", "OPAQUE_TYPE"),
    ]
    return external_types


def parse_enums(registry: Element) -> List[VkEnum | VkTypeAlias]:
    enum_aliases: List[VkTypeAlias] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "enum" or "alias" not in type_el.attrib:
            continue
        declared_type_name = type_el.attrib["name"]
        aliased_type_name = type_el.attrib["alias"]
        enum_aliases.append(VkTypeAlias(declared_type_name, aliased_type_name))

    enums: List[VkEnum] = []
    for enums_el in registry.findall("enums"):
        if enums_el.get("type") != "enum":
            continue
        name = enums_el.attrib["name"]
        enum_values: List[VkEnumValue] = []
        for enum_el in enums_el.findall("enum"):
            if "deprecated" in enum_el.attrib:
                continue
            value_name = enum_el.attrib["name"]
            value = int(enum_el.attrib["value"], 0)
            enum_values.append(VkEnumValue(value_name, value))
        enums.append(VkEnum(name, enum_values))
    
    enums_by_name = {enum.name: enum for enum in enums}
    VK_EXT_BASE = 1_000_000_000
    VK_EXT_BLOCK_SIZE = 1000
    for feature_el in registry.findall("feature"):
        for require_el in feature_el.findall("require/enum"):
            if "extends" not in require_el.attrib:
                continue
            extends = require_el.attrib["extends"]
            if "FlagBits" in extends:
                continue
            enum_to_extend = enums_by_name[extends]
            name = require_el.attrib["name"]
            if "value" in require_el.attrib:
                value = int(require_el.attrib["value"], 0)
            elif "offset" in require_el.attrib and "extnumber" in require_el.attrib:
                extnumber = int(require_el.attrib["extnumber"])
                offset = int(require_el.attrib["offset"])
                dir = -1 if require_el.get("dir") == "-" else 1
                value = dir * (VK_EXT_BASE + (extnumber - 1) * VK_EXT_BLOCK_SIZE + offset)
            else:
                continue
            if any(v.name == name and v.value == value for v in enum_to_extend.values):
                continue
            enum_to_extend.values.append(VkEnumValue(name, value))
    for extension_el in registry.findall("extensions/extension"):
        extension_number = int(assert_type(str, extension_el.get("number")))
        for require_el in extension_el.findall("require/enum"):
            if "extends" not in require_el.attrib:
                continue
            extends = require_el.attrib["extends"]
            if "FlagBits" in extends:
                continue
            name = require_el.attrib["name"]
            if "value" in require_el.attrib:
                value = int(require_el.attrib["value"], 0)
            elif "offset" in require_el.attrib:
                maybe_extnumber = require_el.get("extnumber")
                extnumber = int(maybe_extnumber) if maybe_extnumber is not None else extension_number
                offset = int(assert_type(str, require_el.get("offset")))
                dir = -1 if require_el.get("dir") == "-" else 1
                value = dir * (VK_EXT_BASE + (extnumber - 1) * VK_EXT_BLOCK_SIZE + offset)
            else:
                continue
            enum_to_extend = enums_by_name[extends]
            if any(v.name == name and v.value == value for v in enum_to_extend.values):
                continue
            enum_to_extend.values.append(VkEnumValue(name, value))

    return enum_aliases + enums


def parse_flags(registry: Element) -> List[VkFlags | VkTypeAlias]:
    flag_aliases: List[VkTypeAlias] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "bitmask" or "alias" not in type_el.attrib:
            continue
        declared_type_name = type_el.attrib["name"]
        aliased_type_name = type_el.attrib["alias"]
        flag_aliases.append(VkTypeAlias(declared_type_name, aliased_type_name))

    flag_bits: List[VkFlagBits] = []
    for enums_el in registry.findall("enums"):
        if enums_el.get("type") != "bitmask":
            continue
        name = enums_el.attrib["name"]
        flag_values: List[VkFlagValue] = []
        bits: List[VkFlagBit] = []
        for enum_el in enums_el.findall("enum"):
            if "name" in enum_el.attrib and "value" in enum_el.attrib:
                value_name = enum_el.attrib["name"]
                value = int(enum_el.attrib["value"], 0)
                flag_values.append(VkFlagValue(value_name, value))
            elif "name" in enum_el.attrib and "bitpos" in enum_el.attrib:
                bit_name = enum_el.attrib["name"]
                bitpos = int(enum_el.attrib["bitpos"])
                bits.append(VkFlagBit(bit_name, bitpos))
        flag_bits.append(VkFlagBits(name, flag_values, bits))
    
    flags: List[VkFlags] = []
    flag_bits_by_name = {fb.name: fb for fb in flag_bits}
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "bitmask" or "alias" in type_el.attrib or type_el.get("api") == "vulkansc":
            continue
        flags_name = assert_type(str, type_el.findtext("name"))
        flag_bits_name = flags_name.replace("Flags", "FlagBits")
        width_mapping: Dict[str, Literal[32, 64]] = {"VkFlags": 32, "VkFlags64": 64}
        width = width_mapping[assert_type(str, type_el.findtext("type"))]
        current_flag_bits = flag_bits_by_name.get(flag_bits_name)
        if current_flag_bits is None:
            current_flag_bits = VkFlagBits(flag_bits_name, [], [])
        flags.append(VkFlags(flags_name, current_flag_bits, width))
    
    return flag_aliases + flags


def parse_handles(registry: Element) -> List[VkHandle]:
    handles: List[VkHandle] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "handle" or type_el.get("alias") is not None:
            continue
        name = assert_type(str, type_el.findtext("name"))
        type = assert_type(str, type_el.findtext("type"))
        if type not in ("VK_DEFINE_HANDLE", "VK_DEFINE_NON_DISPATCHABLE_HANDLE"):
            raise ValueError("Unexpected type value")
        handles.append(VkHandle(name, type))
    return handles


def parse_fn_types(registry: Element) -> List[VkFnType]:
    PATTERN = re.compile(
        r"typedef\s+(?P<ret>.+?)\s*\(\s*VKAPI_PTR\s*\*\s*(?P<name>\w+)\s*\)\s*\((?P<args>.*)\)\s*;",
        re.DOTALL,
    )

    fn_types: List[VkFnType] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "funcpointer":
            continue
        name = assert_type(str, type_el.findtext("name"))
        sig = "".join(type_el.itertext()).strip()
        m = PATTERN.fullmatch(sig)
        if m is None:
            raise ValueError(f"Unexpected fn_type string: {sig}")
        ret_str = assert_type(str, m.group("ret")).strip()
        args_str = assert_type(str, m.group("args")).strip()
        return_type = parse_type_str(ret_str)
        fn_ptr_args: List[VkFnParam] = []
        if args_str and args_str != "void":
            for arg in args_str.split(","):
                arg = arg.strip()
                tokens = arg.split()
                arg_name = tokens[-1]
                type_part = " ".join(tokens[:-1])
                arg_type = parse_type_str(type_part)
                fn_ptr_args.append(VkFnParam(arg_name, arg_type))
        fn_types.append(VkFnType(name, return_type, fn_ptr_args))
    return fn_types


def parse_structs(registry: Element) -> List[VkStruct | VkTypeAlias]:
    struct_aliases: List[VkTypeAlias] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "struct" or "alias" not in type_el.attrib:
            continue
        declared_type_name = type_el.attrib["name"]
        aliased_type_name = type_el.attrib["alias"]
        struct_aliases.append(VkTypeAlias(declared_type_name, aliased_type_name))
    
    structs: List[VkStruct] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "struct" or "alias" in type_el.attrib:
            continue
        struct_name = type_el.attrib["name"]
        struct_members: List[VkStructMember] = []
        for member_el in type_el.findall("member"):
            if member_el.get("api") == "vulkansc":
                continue
            name_el = assert_type(Element, member_el.find("name"))
            member_name = assert_type(str, name_el.text)
            member_type = parse_type(member_el)
            member_value = member_el.get("values")
            bit_width: Optional[int] = None
            if member_type.ptr_level == 0 and len(member_type.array_dims) == 0:
                m = re.match(r"^(?P<base>\w+)\s*:\s*(?P<bits>\d+)$", member_type.name)
                if m is not None:
                    member_type.name = m.group("base")
                    bit_width = int(m.group("bits"))
            struct_members.append(VkStructMember(member_name, member_type, member_value, bit_width))
        structs.append(VkStruct(struct_name, struct_members))

    return struct_aliases + structs


def parse_unions(registry: Element) -> List[VkUnion]:
    unions: List[VkUnion] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "union" or "alias" in type_el.attrib:
            continue
        union_name = type_el.attrib["name"]
        member_types: List[VkType] = []
        for member_el in type_el.findall("member"):
            if member_el.get("api") == "vulkansc":
                continue
            member_types.append(parse_type(member_el))
        unions.append(VkUnion(union_name, member_types))
    return unions


def parse_commands(registry: Element) -> VkParsedCommands:
    # Gather up all commands
    commands_by_name: Dict[str, VkCommand] = {}
    for command_el in registry.findall("commands/command"):
        if "alias" in command_el.attrib:
            continue
        if command_el.get("api") == "vulkansc":
            continue
        proto_el = assert_type(Element, command_el.find("proto"))
        name_el = assert_type(Element, proto_el.find("name"))
        name = assert_type(str, name_el.text)
        return_type = parse_type(proto_el)
        args: List[VkCommandParam] = []
        for param_el in command_el.findall("param"):
            if param_el.get("api") == "vulkansc":
                continue
            param_name_el = assert_type(Element, param_el.find("name"))
            param_name = assert_type(str, param_name_el.text)
            param_type = parse_type(param_el)
            length = param_el.get("len")
            raw_optional = param_el.get("optional")
            if raw_optional is None:
                # optional being excluded is implicitly false
                raw_optional = "false"
            if raw_optional not in ("false", "true", "false,true", "true,true"):
                raise ValueError("Unexpected optional value")
            # We only care about outermost optional
            optional = raw_optional.startswith("true")
            length = param_el.get("len")
            args.append(VkCommandParam(param_name, param_type, length, optional))
        commands_by_name[name] = VkCommand(name, return_type, args)

    # Duplicate commands if theyre aliased
    for command_el in registry.findall("commands/command"):
        if "alias" not in command_el.attrib:
            continue
        if command_el.get("api") == "vulkansc":
            continue
        name = command_el.attrib["name"]
        alias = command_el.attrib["alias"]
        commands_by_name[name] = commands_by_name[alias]

    # Attach version info to each command
    versioned_commands: List[VkVersionedCommand] = []
    for feature in registry.findall("feature"):
        if "vulkan" not in feature.attrib["api"].split(","):
            continue
        major_version = int(feature.attrib["name"].split("_")[-2])
        minor_version = int(feature.attrib["name"].split("_")[-1])
        version = VkVersion(major_version, minor_version)
        for command_el in feature.findall("require/command"):
            command_name = command_el.attrib["name"]
            command = commands_by_name[command_name]
            versioned_commands.append(VkVersionedCommand(version, command))

    # Organize commands by level and version such that commands are present for all versions they're included in.
    versions = list({vc.version for vc in versioned_commands})
    versions.sort(key=lambda v: (v.major, v.minor))
    core_commands: Dict[VkLevel, Dict[VkVersion, List[VkVersionedCommand]]] = {
        "global": {},
        "instance": {},
        "device": {},
    }
    for level in ("global", "instance", "device"):
        for version in versions:
            core_commands[level][version] = []
    for version in versions:
        for versioned_command in versioned_commands:
            command_version = versioned_command.version
            command_in_version = (command_version.major, command_version.minor) <= (version.major, version.minor)
            if not command_in_version:
                continue
            command = versioned_command.command
            if len(command.params) == 0:
                raise ValueError("Expected command to have some args")
            first_arg_type = command.params[0].type
            if command.name == "vkGetInstanceProcAddr":
                core_commands["global"][version].append(versioned_command)
            elif first_arg_type.name in ("VkInstance", "VkPhysicalDevice") or command.name == "vkGetDeviceProcAddr":
                core_commands["instance"][version].append(versioned_command)
            elif first_arg_type.name in ("VkDevice", "VkQueue", "VkCommandBuffer"):
                core_commands["device"][version].append(versioned_command)
            else:
                core_commands["global"][version].append(versioned_command)

    # Organize extension commands by extension
    extension_commands: Dict[str, List[VkExtensionCommands]] = defaultdict(list)
    for extension_el in registry.findall("extensions/extension"):
        if "vulkan" not in (extension_el.get("supported") or "").split(","):
            continue
        name = extension_el.attrib["name"]
        type = extension_el.attrib["type"]
        if type not in ("instance", "device"):
            raise ValueError("Unexpected extension_type value")
        commands: List[VkCommand] = []
        for command_el in extension_el.findall("require/command"):
            command_name = command_el.attrib["name"]
            command = commands_by_name[command_name]
            commands.append(command)
        if len(commands) == 0:
            continue
        extension_tag = name.split("_")[1]
        extension_commands[extension_tag].append(VkExtensionCommands(name, type, commands))

    return VkParsedCommands(core_commands, extension_commands)


# ----------------
# Parsing Helpers
# ----------------


T = TypeVar("T")


def assert_type(t: Type[T], value: Any) -> T:
    """Ensure that a value is of the expected type.

    Raises a TypeError if the value is not an instance of the given type.

    Args:
        t: The expected Python type.
        value: The object to validate.

    Returns:
        The value, typed as T, if validation succeeds.

    Raises:
        TypeError: If value is not an instance of t.
    """
    if not isinstance(value, t):
        raise TypeError(f"Expected {t.__name__}, got {type(value).__name__}")
    return value


def parse_type(parent_el: Element) -> VkType:
    """
    Parse a Vulkan XML <proto>, <param>, or <member> element into a VkType.
    """
    parts: List[str] = []
    if parent_el.text is not None:
        parts.append(parent_el.text)
    for child in parent_el:
        if child.tag == "name":
            break
        parts.extend(t for t in (child.text, child.tail) if t)
    type_part = "".join(parts).strip()

    name_el = assert_type(Element, parent_el.find("name"))
    children = list(parent_el)
    name_idx = children.index(name_el)
    suffix_parts = [name_el.tail or ""]
    for sib in children[name_idx+1:]:
        if sib.tag == "comment":
            suffix_parts.append(sib.tail if sib.tail else "")
        else:
            suffix_parts.extend(t for t in (sib.text, sib.tail) if t)
    suffix = "".join(suffix_parts).strip()

    return parse_type_str(type_part + suffix)
    

def parse_type_str(type: str) -> VkType:
    array_dims_reverse: List[str] = []
    while True:
        m = re.search(r"\[\s*([^\]]+?)\s*\]\s*$", type)
        if m is None:
            break
        array_dims_reverse.append(m.group(1).strip())
        type = type[:m.start()].rstrip()
    array_dims = list(reversed(array_dims_reverse))

    tokens = type.replace("*", " * ").split()
    star_indices = [i for i, t in enumerate(tokens) if t == "*"]
    ptr_level = len(star_indices)
    base_tokens = tokens if ptr_level == 0 else tokens[:star_indices[0]]
    base_const = "const" in base_tokens
    name = [t for t in base_tokens if t != "const"][-1]

    const_reverse: List[bool] = [base_const]
    for star_idx in star_indices:
        ptr_is_const = star_idx + 1 < len(tokens) and tokens[star_idx + 1] == "const"
        const_reverse.append(ptr_is_const)
    const = list(reversed(const_reverse))

    # We special case these because they're opaque types and we have handle types for them
    QNX_SCREEN_HANDLE_MAP = {
        "_screen_context": "screen_context_t",
        "_screen_window": "screen_window_t",
        "_screen_buffer": "screen_buffer_t",
    }
    if ptr_level == 1 and name in QNX_SCREEN_HANDLE_MAP:
        return VkType(
            name = QNX_SCREEN_HANDLE_MAP[name],
            ptr_level = 0,
            const = [False],
            array_dims = [],
        )

    return VkType(name, ptr_level, const, array_dims)


# ----------------
# Emission
# ----------------


def emit_constants(files: Dict[str, str], constants: List[VkConstant]):
    parts: List[str] = []
    for constant in constants:
        name = constant.name.removeprefix("VK_")
        type = emit_mojo_type(constant.type)
        value = constant.value
        if value.endswith("F"):
            value = value[:-1]
        elif member := re.match(r"\(~([0-9]{1,9})ULL\)", value):
            value = f"~UInt64({member.group(1)})"
        elif member := re.match(r"\(~([0-9]{1,9})U\)", value):
            value = f"~UInt32({member.group(1)})"
        parts.append(f"comptime {name}: {type} = {value}\n")
    files["constants.mojo"] = "".join(parts)


def emit_basetypes(files: Dict[str, str], basetypes: List[VkWrapperType]):
    parts: List[str] = []
    for basetype in basetypes:
        parts.append("\n\n")
        parts.append(emit_wrapper_type(basetype))
    files["basetypes.mojo"] = "".join(parts)


def emit_wrapper_type(wrapper_type: VkWrapperType) -> str:
    mojo_name = emit_mojo_type_name(wrapper_type.name)
    if wrapper_type.underlying_type == "OPAQUE_TYPE":
        return (
            f"struct {mojo_name}:\n"
            f"    pass\n"
        )
    mojo_type = emit_mojo_type(wrapper_type.underlying_type)
    return (
        f'@register_passable("trivial")\n'
        f"struct {mojo_name}:\n"
        f"    var _value: {mojo_type}\n"
        f"\n"
        f"    fn __init__(out self, *, value: {mojo_type}):\n"
        f"        self._value = value\n"
        f"\n"
        f"    fn raw(self) -> {mojo_type}:\n"
        f"        return self._value\n"
    )


def emit_external_types(files: Dict[str, str], external_types: List[VkWrapperType | VkEnum]):
    parts: List[str] = []
    for external_type in external_types:
        parts.append("\n\n")
        if isinstance(external_type, VkWrapperType):
            parts.append(emit_wrapper_type(external_type))
        else:
            parts.append(emit_enum(external_type))
    files["external_types.mojo"] = "".join(parts)


def emit_enum(enum: VkEnum) -> str:
    parts: List[str] = []
    enum_name = emit_mojo_type_name(enum.name)
    parts.append('@register_passable("trivial")\n')
    if enum.name == "VkResult":
        parts.append("struct Result(Equatable, Writable):\n")
    else:
        parts.append(f"struct {enum_name}(Equatable):\n")
    parts.append((
        "    var _raw: Int32\n"
        "\n"
        "    fn __init__(out self, *, raw: Int32):\n"
        "        self._raw = raw\n"
        "\n"
        "    fn raw(self) -> Int32:\n"
        "        return self._raw\n"
        "\n"
        "    fn __eq__(self, other: Self) -> Bool:\n"
        "        return self._raw == other._raw\n"
        "\n"
    ))
    if enum.name == "VkResult":
        parts.append((
            "    fn is_error(self) -> Bool:\n"
            "        return self.raw() < 0\n"
            "\n"
            "    fn __str__(self) -> String:\n"
            "        return String.write(self)\n"
            "\n"
            "    fn write_to[W: Writer](self, mut writer: W):\n"
            "        writer.write(self.raw())\n"
            "\n"
        ))
    for value in enum.values:
        if enum.name == "VkResult":
            value_name = value.name.removeprefix("VK_")
        else:
            prefix = pascal_to_snake(strip_extension_suffix(enum.name) + "_").upper()
            value_name = value.name.removeprefix(prefix)
        if value_name[0].isdigit():
            value_name = f"N_{value_name}"
        parts.append(f"    comptime {value_name} = {enum_name}(raw = {value.value})\n")
    return "".join(parts)


def emit_enums(files: Dict[str, str], enums: List[VkEnum | VkTypeAlias]):
    parts: List[str] = []
    for enum in enums:
        if isinstance(enum, VkTypeAlias):
            parts.append(emit_type_alias(enum))
    for enum in enums:
        if isinstance(enum, VkEnum):
            parts.append("\n\n")
            parts.append(emit_enum(enum))
    files["enums.mojo"] = "".join(parts)


def emit_type_alias(type_alias: VkTypeAlias) -> str:
    declared_type_name = emit_mojo_type_name(type_alias.declared_type_name)
    aliased_type_name = emit_mojo_type_name(type_alias.aliased_type_name)
    return f"comptime {declared_type_name} = {aliased_type_name}\n"


def emit_flags(files: Dict[str, str], flags: List[VkFlags | VkTypeAlias]):
    parts: List[str] = []
    for flag in flags:
        if isinstance(flag, VkTypeAlias):
            parts.append(emit_type_alias(flag))
    for flag in flags:
        if not isinstance(flag, VkFlags):
            continue
        flags_name = emit_mojo_type_name(flag.flags_name)
        flag_bits_name = emit_mojo_type_name(flag.flag_bits.name)
        parts.append((
            f"\n\n"
            f'@register_passable("trivial")\n'
            f"struct {flags_name}(Equatable):\n"
            f"    var _value: UInt{flag.width}\n"
            f"\n"
            f"    @implicit\n"
            f"    fn __init__(out self, *bits: {flag_bits_name}):\n"
            f"        self._value = 0\n"
            f"        for bit in bits:\n"
            f"            self._value |= bit.value()\n"
            f"\n"
            f"    fn __init__(out self, *, value: UInt{flag.width}):\n"
            f"        self._value = value\n"
            f"\n"
            f"    fn value(self) -> UInt{flag.width}:\n"
            f"        return self._value\n"
            f"\n"
            f"    fn __eq__(self, other: Self) -> Bool:\n"
            f"        return self._value == other._value\n"
            f"\n"
            f"    fn __or__(self, bit: {flag_bits_name}) -> Self:\n"
            f"        return Self(value = self.value() | bit.value())\n"
            f"\n"
            f"    fn __ror__(self, bit: {flag_bits_name}) -> Self:\n"
            f"        return Self(value = self.value() | bit.value())\n"
            f"\n"
            f"    fn __contains__(self, bit: {flag_bits_name}) -> Bool:\n"
            f"        return Bool(self.value() & bit.value())\n"
        ))
        if len(flag.flag_bits.values) > 0 or len(flag.flag_bits.bits) > 0:
            parts.append("\n")
        prefix = pascal_to_snake(strip_extension_suffix(flag.flags_name) + "_").replace("_flags", "").upper()
        for value in flag.flag_bits.values:
            value_name = value.name.removeprefix(prefix)
            parts.append(f"    comptime {value_name} = {flag_bits_name}(value = {value.value})\n")
        for bit in flag.flag_bits.bits:
            bit_name = bit.name.removeprefix(prefix).removesuffix("_BIT").replace("_BIT_", "_")
            if bit_name[0].isdigit():
                bit_name = f"N_{bit_name}"
            parts.append(f"    comptime {bit_name} = {flag_bits_name}(value = 1 << {bit.bitpos})\n")
        parts.append((
            "\n\n"
            f'@register_passable("trivial")\n'
            f"struct {flag_bits_name}(Equatable):\n"
            f"    var _value: UInt{flag.width}\n"
            f"\n"
            f"    fn __init__(out self, *, value: UInt{flag.width}):\n"
            f"        self._value = value\n"
            f"\n"
            f"    fn value(self) -> UInt{flag.width}:\n"
            f"        return self._value\n"
            f"\n"
            f"    fn __eq__(self, other: Self) -> Bool:\n"
            f"        return self._value == other._value\n"
            f"\n"
            f"    fn __or__(self, bit: Self) -> {flags_name}:\n"
            f"        return {flags_name}(value = self.value() | bit.value())\n"
        ))
    files["flags.mojo"] = "".join(parts)


def emit_handles(files: Dict[str, str], handles: List[VkHandle]):
    HANDLE_TYPE_MAPPING: Dict[str, Literal["UInt", "UInt64"]] = {
        "VK_DEFINE_HANDLE": "UInt",
        "VK_DEFINE_NON_DISPATCHABLE_HANDLE": "UInt64",
    }
    parts: List[str] = []
    for handle in handles:
        handle_name = emit_mojo_type_name(handle.name)
        handle_type = HANDLE_TYPE_MAPPING[handle.type]
        parts.append((
            f"\n\n"
            f'@register_passable("trivial")\n'
            f"struct {handle_name}(Equatable, Writable):\n"
            f"    var _value: {handle_type}\n"
            f"    comptime NULL = Self(value = 0)\n"
            f"\n"
            f"    fn __init__(out self, *, value: {handle_type}):\n"
            f"        self._value = value\n"
            f"\n"
            f"    fn value(self) -> {handle_type}:\n"
            f"        return self._value\n"
            f"\n"
            f"    fn __eq__(self, other: Self) -> Bool:\n"
            f"        return self._value == other._value\n"
            f"\n"
            f"    fn __str__(self) -> String:\n"
            f"        return hex(self._value)\n"
            f"\n"
            f"    fn write_to(self, mut writer: Some[Writer]):\n"
            f"        writer.write(String(self))\n"
        ))
    files["handles.mojo"] = "".join(parts)


def emit_fn_types(files: Dict[str, str], fn_types: List[VkFnType]):
    parts: List[str] = []
    parts.append((
        "from .handles import *\n"
        "from .structs import *\n"
        "from .misc import *\n"
        "\n"
        "comptime Ptr = UnsafePointer\n"
    ))
    for fn_type in fn_types:
        has_return = fn_type.return_type.name != "void"
        return_part = f" -> {emit_mojo_type(fn_type.return_type)}" if has_return else ""
        parts.append("\n\n")
        parts.append(emit_fn_like(
            f"comptime {fn_type.name} = fn(",
            [f"{pascal_to_snake(arg.name)}: {emit_mojo_type(arg.type)}" for arg in fn_type.params],
            f"){return_part}",
        ))
    files["fn_types.mojo"] = "".join(parts)


def emit_structs(files: Dict[str, str], structs: List[VkStruct | VkTypeAlias]):
    struct_names: set[str] = set()
    for struct in structs:
        if not isinstance(struct, VkStruct):
            continue
        struct_names.add(struct.name)

    parts: List[str] = []
    parts.append((
        "from sys.ffi import CStringSlice, c_char\n"
        "from .constants import *\n"
        "from .basetypes import *\n"
        "from .external_types import *\n"
        "from .enums import *\n"
        "from .flags import *\n"
        "from .handles import *\n"
        "from .fn_types import *\n"
        "from .unions import *\n"
        "from .misc import *\n"
        "\n\n"
        "comptime Ptr = UnsafePointer\n"
        "\n\n"
    ))
    for struct in structs:
        if isinstance(struct, VkTypeAlias):
            parts.append(emit_type_alias(struct))
    for struct in structs:
        if not isinstance(struct, VkStruct):
            continue
        struct_name = emit_mojo_type_name(struct.name)
        cstring_origin_by_member: Dict[str, str] = {}
        for member in struct.members:
            member_name = pascal_to_snake(member.name)
            is_const_char_ptr = (
                member.type.name == "char"
                and member.type.ptr_level == 1
                and len(member.type.array_dims) == 0
                and member.type.const[-1]
            )
            if is_const_char_ptr:
                cstring_origin_by_member[member_name] = f"{member_name}_origin"
        parts.append((
            f"\n\n"
            f"struct {struct_name}(Copyable):\n"
        ))
        if len(struct.members) == 0:
            parts.append("    pass\n")
            continue

        packing_info_by_member: Dict[str, VkStructMemberPackingInfo] = {}
        group_index = -1
        offset = 0
        in_pack = False
        for member in struct.members:
            if member.bit_width is None:
                in_pack = False
                offset = 0
                continue
            width = member.bit_width
            if not in_pack or offset + width > 32:
                group_index += 1
                offset = 0
                in_pack = True
            packing_info_by_member[member.name] = VkStructMemberPackingInfo(group_index, width, offset)
            offset += width

        fields: List[str] = []
        init_args: List[str] = ["out self"]
        init_lines: List[str] = []
        packed_init_lines: List[str] = []
        helper_methods: List[str] = []
        last_emitted_group_index: Optional[int] = None
        initted_group_indices: set[int] = set()
        for member in struct.members:
            member_name = pascal_to_snake(member.name)
            is_version = member_name.endswith("version") and emit_mojo_type(member.type) == "UInt32"
            if is_version:
                member_type = "Version"
            else:
                member_type = emit_mojo_type(member.type, use_any_origin=True, use_c_string_slice=False)
            is_stype = member.type.name == "VkStructureType" and member.value is not None
            is_array_string = len(member.type.array_dims) > 0 and member.type.name == "char"
            field_type_explicitly_copyable = (
                not is_version
                and member.type.ptr_level == 0
                and len(member.type.array_dims) == 0
                and member.type.name in struct_names
            )

            if member.bit_width is None:
                is_const_char_ptr = (
                    member.type.name == "char"
                    and member.type.ptr_level == 1
                    and len(member.type.array_dims) == 0
                    and member.type.const[-1]
                )
                fields.append(f"    var {member_name}: {member_type}\n")
                if is_stype:
                    stype = assert_type(str, member.value).removeprefix('VK_STRUCTURE_TYPE_')
                    init_lines.append(f"        self.s_type = StructureType.{stype}\n")
                elif is_const_char_ptr:
                    origin_param = cstring_origin_by_member[member_name]
                    init_args.append(f"{member_name}: CStringSlice[{origin_param}] = zero_init[CStringSlice[{origin_param}]]()")
                    init_lines.append(f"        self.{member_name} = {member_name}.unsafe_ptr()\n")
                else:
                    var_prefix = "var " if field_type_explicitly_copyable else ""
                    transfer = "^" if field_type_explicitly_copyable else ""
                    init_args.append(f"{var_prefix}{member_name}: {member_type} = zero_init[{member_type}]()")
                    init_lines.append(f"        self.{member_name} = {member_name}{transfer}\n")
                if is_array_string:
                    helper_methods.append((
                        f"\n"
                        f"    fn {member_name}_slice(self) -> CStringSlice[origin_of(self.{member_name})]:\n"
                        f"        return CStringSlice[origin_of(self.{member_name})](unsafe_from_ptr = self.{member_name}.unsafe_ptr())\n"
                    ))
            else:
                packing_info = packing_info_by_member[member.name]
                group_index = packing_info.group_index
                width = packing_info.width
                offset = packing_info.offset
                if last_emitted_group_index != group_index:
                    fields.append(f"    var _packed{group_index}: UInt32\n")
                    last_emitted_group_index = group_index
                init_args.append(f"{member_name}: {member_type} = zero_init[{member_type}]()")
                if packing_info.group_index not in initted_group_indices:
                    init_lines.append(f"        self._packed{group_index} = 0\n")
                    initted_group_indices.add(group_index)
                packed_init_lines.append(f"        self.set_{member_name}({member_name})\n")
                if member_type == "UInt32":
                    helper_methods.append((
                        f"\n"
                        f"    fn get_{member_name}(self) -> {member_type}:\n"
                        f"        return get_packed_value[width={width}, offset={offset}](self._packed{group_index})\n"
                        f"\n"
                        f"    fn set_{member_name}(mut self, new_value: {member_type}):\n"
                        f"        set_packed_value[width={width}, offset={offset}](self._packed{group_index}, new_value)\n"
                    ))
                else:
                    helper_methods.append((
                        f"\n"
                        f"    fn get_{member_name}(self) -> {member_type}:\n"
                        f"        return {member_type}(value = get_packed_value[width={width}, offset={offset}](self._packed{group_index}))\n"
                        f"\n"
                        f"    fn set_{member_name}(mut self, new_value: {member_type}):\n"
                        f"        set_packed_value[width={width}, offset={offset}](self._packed{group_index}, new_value.value())\n"
                    ))

        parts.extend(fields)
        parts.append("\n")
        if len(cstring_origin_by_member) == 0:
            parts.append(emit_fn_like(
                "fn __init__(",
                init_args,
                "):\n",
                base_indent_level = 1,
            ))
        else:
            parts.append("    fn __init__[\n")
            for origin in cstring_origin_by_member.values():
                parts.append(f"        {origin}: ImmutOrigin = ImmutAnyOrigin,\n")
            parts.append("    ](\n")
            for  arg in init_args:
                parts.append(f"        {arg},\n")
            parts.append("    ):\n")
        parts.extend(init_lines)
        parts.extend(packed_init_lines)
        parts.extend(helper_methods)

    files["structs.mojo"] = "".join(parts)


def emit_unions(files: Dict[str, str], unions: List[VkUnion]):
    UNION_NAME_TO_ALIGN_TYPE: Dict[str, Literal["UInt32", "UInt", "UInt64"]] = {
        "VkClearColorValue": "UInt32",
        "VkClearValue": "UInt32",
        "VkClusterAccelerationStructureOpInputNV": "UInt",
        "VkPerformanceCounterResultKHR": "UInt64",
        "VkPerformanceValueDataINTEL": "UInt64",
        "VkPipelineExecutableStatisticValueKHR": "UInt64",
        "VkDeviceOrHostAddressKHR": "UInt64",
        "VkDeviceOrHostAddressConstKHR": "UInt64",
        "VkDeviceOrHostAddressConstAMDX": "UInt64",
        "VkAccelerationStructureGeometryDataKHR": "UInt64",
        "VkIndirectExecutionSetInfoEXT": "UInt",
        "VkIndirectCommandsTokenDataEXT": "UInt",
        "VkDescriptorDataEXT": "UInt64",
        "VkAccelerationStructureMotionInstanceDataNV": "UInt64",
    }

    parts: List[str] = []
    parts.append((
        "from memory import memcpy\n"
        "from math import ceildiv\n"
        "from sys import size_of\n"
        "from .structs import *\n"
        "\n\n"
        "comptime Ptr = UnsafePointer\n"
    ))
    for union in unions:
        union_name = emit_mojo_type_name(union.name)
        align_type = UNION_NAME_TO_ALIGN_TYPE[union.name]
        unique_member_type_names: List[str] = []
        for member_type in union.member_types:
            if emit_mojo_type(member_type) not in unique_member_type_names:
                unique_member_type_names.append(emit_mojo_type(member_type))

        parts.append("".join((
            f"\n\n",
            f"struct {union_name}(ImplicitlyCopyable):\n",
            f"    comptime _size = max(\n",
            *(f"        size_of[{member_type_name}](),\n" for member_type_name in unique_member_type_names),
            f"    )\n",
            f"    comptime _AlignType = {align_type}\n",
            f"    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]\n",
            f"    var _value: Self._InnerType\n",
        )))
        for member_type_name in unique_member_type_names:
            parts.append((
                f"\n"
                f"    fn __init__(out self, value: {member_type_name}):\n"
                f"        self._value = zero_init[Self._InnerType]()\n"
                f"        memcpy(\n"
                f"            dest = Ptr(to=self._value).bitcast[Byte](),\n"
                f"            src = Ptr(to=value).bitcast[Byte](),\n"
                f"            count = size_of[{member_type_name}](),\n"
                f"        )\n"
            ))
    files["unions.mojo"] = "".join(parts)


def emit_commands(files: Dict[str, str], parsed_commands: VkParsedCommands):
    # Core Functions
    parts: List[str] = []
    parts.append((
        "from sys.ffi import OwnedDLHandle, _DLHandle, RTLD, CStringSlice, c_char\n"
        "from .fn_types import *\n"
        "from .handles import *\n"
        "from .structs import *\n"
        "from .misc import *\n"
        "\n\n"
        "comptime Ptr = UnsafePointer\n"
        "\n\n"
        "trait GlobalFunctions:\n"
        "    fn borrow_handle(self) -> _DLHandle:\n"
        "        ...\n"
    ))
    for command_level, core_versions in parsed_commands.core_commands.items():
        # per-version {level}Functions
        for core_version, versioned_commands in core_versions.items():
            fn_group_name = f"{command_level.capitalize()}FunctionsV{core_version.major}_{core_version.minor}"
            traits = (["GlobalFunctions"] if command_level == "global" else []) + ["Movable"]
            trait_section = f"({', '.join(traits)})"
            addition_versions = list({cmd.version for cmd in versioned_commands})
            addition_versions.sort(key=lambda v: (v.major, v.minor))

            parts.append((
                f"\n\n"
                f"struct {fn_group_name}{trait_section}:\n"
            ))
            if command_level == "global":
                parts.append(f"    var _handle: OwnedDLHandle\n")
            for addition_version in addition_versions:
                req_ver_str = f"{addition_version.major}_{addition_version.minor}"
                parts.append(f"    var _v{req_ver_str}: {command_level.capitalize()}FunctionAdditionsV{req_ver_str}\n")
            parts.append("\n")
            if command_level == "global":
                parts.append((
                    "    fn __init__(out self) raises:\n"
                    '        self._handle = OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL)\n'
                ))
            else:
                parts.append(emit_fn_like(
                    f"fn __init__(",
                    [
                        f"out self",
                        f"global_functions: GlobalFunctionsV{core_version.major}_{core_version.minor}",
                        f"{command_level}: {command_level.capitalize()}",
                    ],
                    f") raises:\n",
                    base_indent_level = 1,
                ))
            for addition_version in addition_versions:
                req_ver_str = f"{addition_version.major}_{addition_version.minor}"
                args = f"{command_level}, global_functions.borrow_handle()"
                if command_level == "global":
                    args = "self._handle.borrow()"
                parts.append(
                    f"        self._v{req_ver_str} = {command_level.capitalize()}FunctionAdditionsV{req_ver_str}({args})\n"
                )
            if command_level == "global":
                parts.append((
                    "\n"
                    "    fn borrow_handle(self) -> _DLHandle:\n"
                    "        return self._handle.borrow()\n"
                ))
            for versioned_command in versioned_commands:
                parts.append(emit_command_wrapper(versioned_command.command, versioned_command.version))

        # per-version {level}FunctionAdditions
        for core_version, versioned_commands in core_versions.items():
            new_commands = [cmd for cmd in versioned_commands if cmd.version == core_version]
            if len(new_commands) == 0:
                continue
            parts.append((
                f"\n\n"
                f"struct {command_level.capitalize()}FunctionAdditionsV{core_version.major}_{core_version.minor}(Copyable, Movable):\n"
            ))
            for new_command in new_commands:
                mojo_command_name = pascal_to_snake(new_command.command.name).removeprefix("vk_")
                ret_type = emit_mojo_type(new_command.command.return_type)
                sig_ret = f" -> {ret_type}" if ret_type != "NoneType" else ""
                parts.append(emit_fn_like(
                    f"var {mojo_command_name}: fn(",
                    [
                        f"{arg.name}: {emit_mojo_type(arg.type, use_any_origin=True, use_c_string_slice=False)}" 
                        for arg in new_command.command.params
                    ],
                    f"){sig_ret}\n",
                    base_indent_level = 1,
                ))
            parts.append("\n")
            if command_level == "global":
                parts.append("    fn __init__(out self, handle: _DLHandle) raises:\n")
            else:
                parts.append(
                    f"    fn __init__(out self, {command_level}: {command_level.capitalize()}, handle: _DLHandle) raises:\n"
                )
            get_proc_level = "instance" if command_level == "global" else command_level
            if len(versioned_commands) == 0:
                parts.append("pass")
            else:
                level_arg = f"{get_proc_level}: {get_proc_level.capitalize()}"
                parts.append((
                    f"        get_{get_proc_level}_proc_addr = handle.get_function[\n"
                    f"            fn({level_arg}, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction\n"
                    f'        ]("vkGet{get_proc_level.capitalize()}ProcAddr")\n'
                ))
            for new_command in new_commands:
                mojo_command_name = pascal_to_snake(new_command.command.name).removeprefix("vk_")
                handle_arg = "Instance.NULL" if command_level == "global" else command_level
                parts.append((
                    f"        self.{mojo_command_name} = Ptr(to=get_{get_proc_level}_proc_addr(\n"
                    f'            {handle_arg}, "{new_command.command.name}".unsafe_ptr()\n'
                    f"        )).bitcast[type_of(self.{mojo_command_name})]()[]\n"
                ))
    files["core_functions.mojo"] = "".join(parts)

    # Extension Functions
    extension_parts_by_tag: Dict[str, List[str]] = {extension_tag: [] for extension_tag in parsed_commands.extension_commands.keys()}
    for parts in extension_parts_by_tag.values():
        parts.append("from sys.ffi import CStringSlice, c_char\n")
        parts.append("from vk.core_functions import GlobalFunctions\n")
    for extension_tag, extensions in parsed_commands.extension_commands.items():
        for extension in extensions:
            extension_parts = extension_parts_by_tag[extension_tag]
            # eg. "VK_KHR_swapchain" -> "Swapchain" or "VK_EXT_debug_utils" -> "DebugUtils"
            extension_name = "".join(word.capitalize() for word in extension.name.split("_")[2:])
            extension_parts.append((
                f"\n\n"
                f"struct {extension_name}(Copyable):\n"
            ))
            for command in extension.commands:
                mojo_command_name = pascal_to_snake(emit_mojo_type_name(command.name)).removeprefix("vk_")
                ret_type = emit_mojo_type(command.return_type)
                sig_ret = f" -> {ret_type}" if ret_type != "NoneType" else ""
                extension_parts.append(emit_fn_like(
                    f"var _{mojo_command_name}: fn(",
                    [
                        f"{arg.name}: {emit_mojo_type(arg.type, use_any_origin=True, use_c_string_slice=False)}"
                        for arg in command.params
                    ],
                    f"){sig_ret}\n",
                    base_indent_level = 1,
                ))
            extension_parts.append((
                f"\n"
                f"    fn __init__[T: GlobalFunctions](out self, global_fns: T, {extension.type}: {extension.type.capitalize()}):\n"
                f"        var get_{extension.type}_proc_addr = global_fns.borrow_handle().get_function[\n"
                f"            fn({extension.type}: {extension.type.capitalize()}, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction\n"
                f'        ]("vkGet{extension.type.capitalize()}ProcAddr")\n'
            ))
            for command in extension.commands:
                mojo_command_name = pascal_to_snake(emit_mojo_type_name(command.name)).removeprefix("vk_")
                extension_parts.append((
                    f"        self._{mojo_command_name} = Ptr(to=get_{extension.type}_proc_addr(\n"
                    f'            {extension.type}, "{command.name}".unsafe_ptr()\n'
                    f"        )).bitcast[type_of(self._{mojo_command_name})]()[]\n"
                ))
            for command in extension.commands:
                extension_parts.append(emit_command_wrapper(command))

    extension_module_parts: List[str] = []
    for extension_tag in parsed_commands.extension_commands.keys():
        extension_module_parts.append(f"import .{extension_tag.lower()}\n")
    files["extensions/__init__.mojo"] = "".join(extension_module_parts)
    for extension_tag, extension_parts in extension_parts_by_tag.items():
        files[f"extensions/{extension_tag.lower()}.mojo"] = "".join(extension_parts)


def emit_command_wrapper(command: VkCommand, version: Optional[VkVersion]=None) -> str:
    # we special case this because it's the only command that deals with the Version type directly
    if command.name == "vkEnumerateInstanceVersion":
        return (
            "\n"
            "    fn enumerate_instance_version(self, mut version: Version) -> Result:\n"
            '        """See official vulkan docs for details.\n'
            "\n"
            "        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html\n"
            '        """\n'
            "        return self._v1_1.enumerate_instance_version(Ptr(to=version).bitcast[UInt32]())\n"
        )

    sig_arg_strs: List[str] = ["self"]
    ffi_call_args: List[str] = []
    wrapper_call_args: List[str] = []
    for arg in command.params:
        mojo_arg_name = pascal_to_snake(arg.name)
        is_required_ptr_to_scalar = (
            not arg.optional
            and arg.type.ptr_level == 1
            and arg.length is None
            and arg.type.name != "char"
        )
        if is_required_ptr_to_scalar:
            mut_prefix = "" if arg.type.const[-1] else "mut "
            sig_arg_strs.append(f"{mut_prefix}{mojo_arg_name.removeprefix('p_')}: {emit_mojo_type(arg.type, strip_ptr=True)}")
            ffi_call_args.append(f"Ptr(to={mojo_arg_name.removeprefix('p_')}).bitcast[{emit_mojo_type(arg.type, strip_ptr=True)}]()")
            wrapper_call_args.append(mojo_arg_name.removeprefix('p_'))
        else:
            is_string = (
                arg.type.ptr_level == 1
                and arg.type.const[-1]
                and arg.type.name == "char"
            )
            sig_arg_strs.append(f"{mojo_arg_name}: {emit_mojo_type(arg.type, use_any_origin=True, no_cstringslice_origin=True)}")
            ffi_call_args.append(f"{mojo_arg_name}.unsafe_ptr()" if is_string else mojo_arg_name)
            wrapper_call_args.append(mojo_arg_name)

    # function for wrapping raw c function
    mojo_command_name = pascal_to_snake(command.name).removeprefix("vk_")
    mojo_type = emit_mojo_type(command.return_type)
    sig_return_section = "" if mojo_type == "NoneType" else f" -> {emit_mojo_type(command.return_type)}"
    
    parts: List[str] = []
    parts.append("\n")
    parts.append(emit_fn_like(
        f"fn {mojo_command_name}(",
        sig_arg_strs,
        f"){sig_return_section}:\n",
        base_indent_level = 1,
    ))
    parts.append((
        f'        """See official vulkan docs for details.\n'
        f'\n'
        f'        https://registry.khronos.org/vulkan/specs/latest/man/html/{command.name}.html\n'
        f'        """\n'
    ))
    version_part = f"v{version.major}_{version.minor}." if version else ""
    parts.append(emit_fn_like(
        f"return self._{version_part}{mojo_command_name}(",
        ffi_call_args,
        f")\n",
        base_indent_level = 2,
    ))

    # convenience function for functions that use the 2 call pattern
    follows_2_call_pattern = False
    if len(command.params) >= 2:
        count_arg = command.params[-2]
        data_arg = command.params[-1]
        follows_2_call_pattern = (
            command.return_type.name in ("VkResult", "void")
            and count_arg.type.ptr_level == 1
            and count_arg.type.name in ("uint32_t", "size_t")
            and not count_arg.type.const[-1]
            and data_arg.type.ptr_level >= 1
            and not data_arg.type.const[-1]
            and data_arg.optional
            and data_arg.length == count_arg.name
        )
    if not follows_2_call_pattern:
        return "".join(parts)
    
    has_result = command.return_type.name == "VkResult"
    count_type = emit_mojo_type(command.params[-2].type, strip_ptr=True)
    original_list_type = emit_mojo_type(command.params[-1].type, strip_ptr=True)
    two_call_sig_arg_strs = sig_arg_strs[:-2]
    if original_list_type == "NoneType":
        list_type = "UInt8"
        get_count_call_args = wrapper_call_args[:-2] + ["count", "Ptr[NoneType, MutAnyOrigin]()"]
        fill_buffer_call_args = wrapper_call_args[:-2] + ["count", "list.unsafe_ptr().bitcast[NoneType]()"]
    else:
        list_type = original_list_type
        get_count_call_args = wrapper_call_args[:-2] + ["count", f"Ptr[{list_type}, MutAnyOrigin]()"]
        fill_buffer_call_args = wrapper_call_args[:-2] + ["count", "list.unsafe_ptr()"]

    parts.append("\n")
    if has_result:
        parts.append(emit_fn_like(
            f"fn {mojo_command_name}(",
            two_call_sig_arg_strs,
            f") -> ListResult[{list_type}]:\n",
            base_indent_level = 1,
        ))
        parts.append((
            f'        """See official vulkan docs for details.\n'
            f"\n"
            f'        https://registry.khronos.org/vulkan/specs/latest/man/html/{command.name}.html\n'
            f'        """\n'
            f"        var list = List[{list_type}]()\n"
            f"        var count: {count_type} = 0\n"
            f"        var result = Result.INCOMPLETE\n"
            f"        while result == Result.INCOMPLETE:\n"
        ))
        parts.append(emit_fn_like(
            f"result = self.{mojo_command_name}(",
            get_count_call_args,
            ")\n",
            base_indent_level = 3,  
        ))
        parts.append((
            "        if result == Result.SUCCESS and count > 0:\n"
            "            list.reserve(Int(count))\n"
        ))
        parts.append(emit_fn_like(
            f"result = self.{mojo_command_name}(",
            fill_buffer_call_args,
            ")\n",
            base_indent_level = 3,
        ))
        parts.append((
            f"        list._len = Int(count)\n"
            f"        return ListResult(list^, result)\n"
        ))
    else:
        parts.append(emit_fn_like(
            f"fn {mojo_command_name}(",
            two_call_sig_arg_strs,
            f") -> List[{list_type}]:\n",
            base_indent_level = 1,
        ))
        parts.append((
            f'        """See official vulkan docs for details.\n'
            f"\n"
            f'        https://registry.khronos.org/vulkan/specs/latest/man/html/{command.name}.html\n'
            f'        """\n'
            f"        var list = List[{list_type}]()\n"
            f"        var count: {count_type} = 0\n"
        ))
        parts.append(emit_fn_like(
            f"self.{mojo_command_name}(",
            get_count_call_args,
            ")\n",
            base_indent_level = 2,
        ))
        parts.append((
            "        if count > 0:\n"
            "            list.reserve(Int(count))\n"
        ))
        parts.append(emit_fn_like(
            f"self.{mojo_command_name}(",
            fill_buffer_call_args,
            ")\n",
            base_indent_level = 3,
        ))
        parts.append((
            f"        list._len = Int(count)\n"
            f"        return list^\n"
        ))

    return "".join(parts)


# ----------------
# Emission Helpers
# ----------------


def emit_mojo_type_name(old_name: str) -> str:
    mapping = {
        "void": "NoneType",
        "char": "c_char",
        "size_t": "UInt",
        "int": "Int32",
        "int8_t": "Int8",
        "int16_t": "Int16",
        "int32_t": "Int32",
        "int64_t": "Int64",
        "uint8_t": "UInt8",
        "uint16_t": "UInt16",
        "uint32_t": "UInt32",
        "uint64_t": "UInt64",
        "float": "Float32",
        "double": "Float64",
        "VkBool32": "Bool32",
    }
    if old_name in mapping:
        return mapping[old_name]
    return old_name.removeprefix("Vk")


def emit_mojo_type(
    type: VkType, 
    strip_ptr: bool = False,
    use_any_origin: bool = False, 
    use_c_string_slice: bool = True,
    no_cstringslice_origin: bool = False,
) -> str:
    MUT_ORIGIN = "MutAnyOrigin" if use_any_origin else "MutOrigin.external"
    IMMUT_ORIGIN = "ImmutAnyOrigin" if use_any_origin else "ImmutOrigin.external"

    _type = deepcopy(type)
    if strip_ptr:
        _type.ptr_level -= 1
        _type.const.pop(0)
    is_string = _type.ptr_level >= 1 and _type.const[-1] and _type.name == "char"
    if is_string and use_c_string_slice:
        _type.ptr_level -= 1
        _type.const.pop()

    mojo_type = emit_mojo_type_name(_type.name)
    if is_string and use_c_string_slice:
        mojo_type = "CStringSlice" if no_cstringslice_origin else f"CStringSlice[{IMMUT_ORIGIN}]"
    for i in range(1, _type.ptr_level+1):
        mojo_type = f"Ptr[{mojo_type}, {IMMUT_ORIGIN if _type.const[-i] else MUT_ORIGIN}]"
    if len(_type.array_dims) > 0:
        for dim in reversed(_type.array_dims):
            mojo_type = f"InlineArray[{mojo_type}, Int({dim.removeprefix('VK_')})]"

    return mojo_type


def emit_fn_like(
    initial_line: str, arg_lines: Iterable[str], final_line: str,
    spaces_per_indent: int=4, base_indent_level: int=0, max_line_len: Optional[int]=100,
) -> str:
    base_indent = " " * spaces_per_indent * base_indent_level
    inner_indent = " " * spaces_per_indent * (base_indent_level + 1)
    one_line_args = ", ".join(arg_lines)
    one_liner = base_indent + initial_line + one_line_args + final_line
    if max_line_len is None or len(one_liner) <= max_line_len:
        return one_liner
    lines: List[str] = [
        base_indent + initial_line,
        inner_indent + one_line_args,
        base_indent + final_line,
    ]
    if all(len(line) <= max_line_len for line in lines):
        return "\n".join(lines)
    lines = [base_indent, initial_line, "\n"]
    for arg_line in arg_lines:
        lines.append(inner_indent + arg_line + ",\n")
    lines.append(base_indent + final_line)
    return "".join(lines)


def strip_extension_suffix(name: str) -> str:
    """Remove a known Vulkan extension suffix (e.g., KHR, EXT) from a name.

    Also trims a trailing underscore left by registry naming conventions.
    Returns the original name if no known suffix is present.
    """
    SUFFIXES = (
        "KHR", "EXT",
        "NV", "NVX",
        "AMD", "AMDX",
        "ARM",
        "FUCHSIA",
        "GOOGLE",
        "HUAWEI",
        "QCOM", "QNX",
        "MSFT",
        "INTEL",
        "MVK",
        "IMG",
        "VALVE",
        "MESA",
        "SAMSUNG", "SEC",
        "TIZEN",
        "GGP",
        "NN",
        "APPLE",
        "LUNARG",
        "NOKIA",
    )
    for suffix in sorted(SUFFIXES, key=len, reverse=True):
        if name.endswith(suffix):
            return name.removesuffix(suffix).removesuffix("_")
    return name


def pascal_to_snake(name: str) -> str:
    """Convert a PascalCase/camelCase identifier to snake_case.

    Splits acronym-to-word, lower-to-Upper seams, and digit boundaries while
    preserving acronym blocks.

    Examples:
        XMLHttp  -> xml_http
        Access3  -> access_3
        AV1Thing -> av1_thing
        3DAtlas  -> 3d_atlas
        maxImageDimension1D -> max_image_dimension_1d
    """
    # Acronym -> word, e.g. "XMLHttp" -> "XML_Http"
    s = re.sub(r'([A-Z]+)([A-Z][a-z])', r'\1_\2', name)
    # lower -> Upper, e.g. "AccessFlags" -> "Access_Flags"
    s = re.sub(r'([a-z])([A-Z])', r'\1_\2', s)
    # lower -> digit only (do NOT split upper -> digit), e.g. "Access3" -> "Access_3", "AV1" stays "AV1"
    s = re.sub(r'([a-z])(\d)', r'\1_\2', s)
    # digit -> letter, e.g. "AV1Thing" -> "AV1_Thing"
    # Special-case dimension suffixes like "1D"/"2D"/"3D" so they stay together.
    s = re.sub(
        r'(\d)([A-Za-z])',
        lambda m: f"{m.group(1)}{m.group(2)}" if m.group(2) in ('D', 'd') else f"{m.group(1)}_{m.group(2)}",
        s,
    )
    return s.lower()


if __name__ == "__main__":
    main()