from __future__ import annotations
from typing import Dict, List, Set, Optional, TypeVar, Literal, Any, Type, Iterable
from dataclasses import dataclass, field
from xml.etree import ElementTree
from xml.etree.ElementTree import Element
import os
import re
from copy import deepcopy


def main():
    registry = ElementTree.parse("vk.xml").getroot()
    files: Dict[str, str] = {}

    emit_constants(files, lower_constants(parse_constants(registry)))
    emit_basetypes(files, lower_basetypes(parse_basetypes(registry)))
    emit_external_types(files, lower_external_types(parse_external_types(registry)))
    emit_enums(files, lower_enums(parse_enums(registry)))
    emit_flags(files, lower_flags(parse_flags(registry)))
    emit_handles(files, lower_handles(parse_handles(registry)))
    emit_fn_types(files, lower_fn_types(parse_fn_types(registry)))
    emit_structs(files, lower_structs(parse_structs(registry)))
    emit_unions(files, lower_unions(parse_unions(registry)))
    emit_command_loaders(files, lower_commands(parse_commands(registry)))

    OUTPUT_ROOT = "vk"
    for rel_path, content in files.items():
        path = os.path.join(OUTPUT_ROOT, rel_path)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)


# ----------------
# HIR
# ----------------


@dataclass
class TypeHIR:
    """High-level Vulkan/C type shape.

    Attributes:
        name: Base C type name (e.g., "uint32_t", "VkInstance", "char").
        const: Constness by pointer depth, from innermost outward. Index 0 is the
            innermost value; index 1 is the first pointer's pointee constness, etc.
            Constness of the outermost pointer itself is ignored.
        array_dims: Array dimensions from innermost to outermost (left to right).
    """
    name: str
    const: List[bool] = field(default_factory=list) # type: ignore[reportUnknownVariableType]
    array_dims: List[str] = field(default_factory=list) # type: ignore[reportUnknownVariableType]

    @property
    def ptr_level(self) -> int:
        return len(self.const)


@dataclass
class TypeAliasHIR:
    declared_type_name: str
    aliased_type_name: str


@dataclass
class ConstantHIR:
    name: str
    type: TypeHIR
    value: str


@dataclass
class BasetypeHIR:
    name: str
    type: TypeHIR


@dataclass
class ExternalTypeHIR:
    name: str
    type: TypeHIR | Literal["OPAQUE_TYPE"]


@dataclass
class EnumHIR:
    name: str
    values: List[EnumValueHIR]


@dataclass
class EnumValueHIR:
    name: str
    value: int
    comment: Optional[str] = None


@dataclass
class FlagsHIR:
    name: str
    flag_bits: FlagBitsHIR
    width: Literal[32, 64]


@dataclass
class FlagBitsHIR:
    name: str
    values: List[FlagValueHIR]
    bits: List[FlagBitHIR]


@dataclass
class FlagValueHIR:
    name: str
    value: int


@dataclass
class FlagBitHIR:
    name: str
    bitpos: int


@dataclass
class HandleHIR:
    name: str
    type: Literal["VK_DEFINE_HANDLE", "VK_DEFINE_NON_DISPATCHABLE_HANDLE"]


@dataclass
class FnTypeHIR:
    name: str
    return_type: TypeHIR
    params: List[FnParamHIR]


@dataclass
class FnParamHIR:
    name: str
    type: TypeHIR


@dataclass
class StructHIR:
    name: str
    members: List[StructMemberHIR]


@dataclass
class StructMemberHIR:
    name: str
    type: TypeHIR
    value: Optional[str]
    bit_width: Optional[int] = None


@dataclass
class UnionHIR:
    name: str
    member_types: List[TypeHIR]


Level = Literal["global", "instance", "device"]


@dataclass(frozen=True, order=True)
class Version:
    major: int
    minor: int


@dataclass
class CommandHIR:
    name: str
    return_type: TypeHIR
    params: List[CommandParamHIR]


@dataclass
class CommandParamHIR:
    name: str
    type: TypeHIR
    length: Optional[str]
    optional: bool


@dataclass
class VersionedCommandHIR:
    version_added: Version
    command: CommandHIR


@dataclass
class ExtensionCommandsHIR:
    name: str
    level: Literal["instance", "device"]
    commands: List[CommandHIR]


@dataclass
class CommandsHIR:
    core: List[VersionedCommandHIR]
    extension: List[ExtensionCommandsHIR]


# ----------------
# LIR
# ----------------


@dataclass
class TypeLIR:
    """Lowered type representation used for code emission.

    Attributes:
        name: Base lowered type name (e.g., "UInt32", "Ptr", "CStringSlice").
        origin: Base type origin for origin-parameterized wrappers
            (e.g., CStringSlice[origin]).
        ptr_origins: Pointer origins from innermost to outermost.
        array_dims: Array dimensions from innermost to outermost.
    """
    name: str
    origin: Optional[OriginLIR] = None
    ptr_origins: List[OriginLIR] = field(default_factory=list) # type: ignore[reportUnknownVariableType]
    array_dims: List[str] = field(default_factory=list) # type: ignore[reportUnknownVariableType]

    @property
    def ptr_level(self) -> int:
        return len(self.ptr_origins)


@dataclass
class OriginLIR:
    mut: bool
    kind: Literal["external", "any", "named"]
    name: Optional[str] = None


@dataclass
class TypeAliasLIR:
    declared_type_name: str
    aliased_type_name: str


@dataclass
class ConstantLIR:
    name: str
    type: TypeLIR
    value: str


@dataclass
class BasetypeLIR:
    name: str
    type: TypeLIR


@dataclass
class ExternalTypeLIR:
    name: str
    type: TypeLIR | Literal["OPAQUE_TYPE"]


@dataclass
class EnumLIR:
    name: str
    values: List[EnumValueLIR]


@dataclass
class EnumValueLIR:
    name: str
    value: int
    comment: Optional[str]
    result_error_message: Optional[str]


@dataclass
class FlagsLIR:
    name: str
    flag_bits: FlagBitsLIR
    width: Literal[32, 64]


@dataclass
class FlagBitsLIR:
    name: str
    values: List[FlagValueLIR]
    bits: List[FlagBitLIR]


@dataclass
class FlagValueLIR:
    name: str
    value: int


@dataclass
class FlagBitLIR:
    name: str
    bitpos: int


@dataclass
class HandleLIR:
    name: str
    underlying_type: Literal["UInt", "UInt64"]


@dataclass
class FnTypeLIR:
    name: str
    return_type: TypeLIR
    params: List[FnArgLIR]


@dataclass
class FnArgLIR:
    name: str
    type: TypeLIR


@dataclass
class StructLIR:
    name: str
    physical_fields: List[StructPhysicalFieldLIR]
    logical_fields: List[StructLogicalFieldLIR]


@dataclass
class StructPhysicalFieldLIR:
    name: str
    type: TypeLIR


@dataclass
class StructLogicalFieldLIR:
    name: str
    type: TypeLIR
    bitcast_to_type: Optional[TypeLIR]
    init_kind: Literal["arg", "packed_arg", "fixed"]
    fixed_init_expr: Optional[str] = None
    needs_copy: bool = False
    packing_info: Optional[StructFieldPackingInfoLIR] = None
    is_array_string: bool = False


@dataclass
class StructFieldPackingInfoLIR:
    group_index: int
    first_group_member: bool
    bit_width: int
    bit_offset: int


@dataclass
class UnionLIR:
    name: str
    member_types: List[TypeLIR]


@dataclass
class CommandLIR:
    name: str
    native_name: str
    return_type: TypeLIR
    args: List[CommandArgLIR]
    params: List[CommandParamLIR]
    two_call_helper: Optional[TwoCallHelperLIR]


@dataclass
class CommandArgLIR:
    name: str
    type: TypeLIR
    mut: bool
    ffi_takes_ptr: bool
    optional: bool
    length: Optional[str]


@dataclass
class TwoCallHelperLIR:
    return_type_kind: Literal["List", "ListResult"]
    return_element_type: TypeLIR
    args: List[CommandArgLIR]


ParameterType = Literal["MutOrigin", "ImmutOrigin"]


@dataclass
class CommandParamLIR:
    name: str
    type: ParameterType


@dataclass
class VersionedCommandLIR:
    version_added: Version
    command: CommandLIR


@dataclass
class CoreCommandLoaderLIR:
    level: Level
    version: Version
    previous_versions: List[Version] # inclusive
    traits: List[str]
    commands: List[VersionedCommandLIR]


@dataclass
class ExtensionCommandLoaderLIR:
    name: str
    tag: str
    level: Literal["instance", "device"]
    commands: List[CommandLIR]


@dataclass
class CommandLoadersLIR:
    core: List[CoreCommandLoaderLIR]
    extension: List[ExtensionCommandLoaderLIR]


# ----------------
# Parsing
# ----------------


def parse_constants(registry: Element) -> List[ConstantHIR]:
    constants: List[ConstantHIR] = []
    api_constants = next(el for el in registry.findall("enums") if el.get("name") == "API Constants")
    for constant_el in api_constants.findall("enum"):
        name = constant_el.attrib["name"]
        type = constant_el.attrib["type"]
        value = constant_el.attrib["value"]
        constants.append(ConstantHIR(name, TypeHIR(type), value))
    return constants


def parse_basetypes(registry: Element) -> List[BasetypeHIR]:
    # hardcoded because parsing these is way too complicated and there aren't many
    basetypes: List[BasetypeHIR] = [
        BasetypeHIR("VkSampleMask", TypeHIR("uint32_t")),
        BasetypeHIR("VkDeviceSize", TypeHIR("uint64_t")),
        BasetypeHIR("VkDeviceAddress", TypeHIR("uint64_t")),
        BasetypeHIR("VkRemoteAddressNV", TypeHIR("void", const=[False])),
    ]
    return basetypes


def parse_external_types(registry: Element) -> List[ExternalTypeHIR | EnumHIR]:
    # hardcoded because parsing these is way too complicated
    external_types: List[ExternalTypeHIR | EnumHIR] = [
        # Platform types
        # Xlib / Xrandr
        ExternalTypeHIR("Display", "OPAQUE_TYPE"),
        ExternalTypeHIR("VisualID", TypeHIR("uint32_t")),
        ExternalTypeHIR("Window", TypeHIR("uint32_t")),
        ExternalTypeHIR("RROutput", TypeHIR("uint32_t")),
        # Wayland
        ExternalTypeHIR("wl_display", "OPAQUE_TYPE"),
        ExternalTypeHIR("wl_surface", "OPAQUE_TYPE"),
        # Win32
        ExternalTypeHIR("HINSTANCE", TypeHIR("size_t")),
        ExternalTypeHIR("HWND", TypeHIR("size_t")),
        ExternalTypeHIR("HMONITOR", TypeHIR("size_t")),
        ExternalTypeHIR("HANDLE", TypeHIR("size_t")),
        ExternalTypeHIR("SECURITY_ATTRIBUTES", "OPAQUE_TYPE"),
        ExternalTypeHIR("DWORD", TypeHIR("uint32_t")),
        ExternalTypeHIR("LPCWSTR", TypeHIR("size_t")),
        # XCB
        ExternalTypeHIR("xcb_connection_t", "OPAQUE_TYPE"),
        ExternalTypeHIR("xcb_visualid_t", TypeHIR("uint32_t")),
        ExternalTypeHIR("xcb_window_t", TypeHIR("uint32_t")),
        # DirectFB
        ExternalTypeHIR("IDirectFB", "OPAQUE_TYPE"),
        ExternalTypeHIR("IDirectFBSurface", "OPAQUE_TYPE"),
        # Fuchsia (Zircon)
        ExternalTypeHIR("zx_handle_t", TypeHIR("uint32_t")),
        # OpenHarmony / OHOS (WSI)
        ExternalTypeHIR("OHNativeWindow", "OPAQUE_TYPE"),
        # Google Games Platform (GGP)
        ExternalTypeHIR("GgpStreamDescriptor", TypeHIR("uint32_t")),
        ExternalTypeHIR("GgpFrameToken", TypeHIR("uint32_t")),
        # QNX Screen
        ExternalTypeHIR("screen_context_t", TypeHIR("size_t")),
        ExternalTypeHIR("screen_window_t", TypeHIR("size_t")),
        ExternalTypeHIR("screen_buffer_t", TypeHIR("size_t")),
        # NVIDIA SciSync / SciBuf
        ExternalTypeHIR("NvSciSyncAttrList", TypeHIR("size_t")),
        ExternalTypeHIR("NvSciSyncObj", TypeHIR("size_t")),
        ExternalTypeHIR("NvSciSyncFence", "OPAQUE_TYPE"),
        ExternalTypeHIR("NvSciBufAttrList", TypeHIR("size_t")),
        ExternalTypeHIR("NvSciBufObj", TypeHIR("size_t")),
        # Android NDK
        ExternalTypeHIR("ANativeWindow", "OPAQUE_TYPE"),
        ExternalTypeHIR("AHardwareBuffer", "OPAQUE_TYPE"),
        # Apple CoreAnimation / Metal / IOSurface (non-ObjC paths are opaque)
        ExternalTypeHIR("CAMetalLayer", "OPAQUE_TYPE"),
        ExternalTypeHIR("MTLDevice_id", TypeHIR("size_t")),
        ExternalTypeHIR("MTLCommandQueue_id", TypeHIR("size_t")),
        ExternalTypeHIR("MTLBuffer_id", TypeHIR("size_t")),
        ExternalTypeHIR("MTLTexture_id", TypeHIR("size_t")),
        ExternalTypeHIR("MTLSharedEvent_id", TypeHIR("size_t")),
        ExternalTypeHIR("IOSurfaceRef", TypeHIR("size_t")),
        # Video encoding types
        # H.264
        EnumHIR("StdVideoH264ProfileIdc", [
            EnumValueHIR("BASELINE", 66),
            EnumValueHIR("MAIN", 77),
            EnumValueHIR("HIGH", 100),
            EnumValueHIR("HIGH_444_PREDICTIVE", 244),
            EnumValueHIR("INVALID", 0x7FFFFFFF),
        ]),
        EnumHIR("StdVideoH264LevelIdc", [
            EnumValueHIR("LEVEL_1_0", 0),
            EnumValueHIR("LEVEL_1_1", 1),
            EnumValueHIR("LEVEL_1_2", 2),
            EnumValueHIR("LEVEL_1_3", 3),
            EnumValueHIR("LEVEL_2_0", 4),
            EnumValueHIR("LEVEL_2_1", 5),
            EnumValueHIR("LEVEL_2_2", 6),
            EnumValueHIR("LEVEL_3_0", 7),
            EnumValueHIR("LEVEL_3_1", 8),
            EnumValueHIR("LEVEL_3_2", 9),
            EnumValueHIR("LEVEL_4_0", 10),
            EnumValueHIR("LEVEL_4_1", 11),
            EnumValueHIR("LEVEL_4_2", 12),
            EnumValueHIR("LEVEL_5_0", 13),
            EnumValueHIR("LEVEL_5_1", 14),
            EnumValueHIR("LEVEL_5_2", 15),
            EnumValueHIR("LEVEL_6_0", 16),
            EnumValueHIR("LEVEL_6_1", 17),
            EnumValueHIR("LEVEL_6_2", 18),
            EnumValueHIR("INVALID", 0x7FFFFFFF),
        ]),
        ExternalTypeHIR("StdVideoH264SequenceParameterSet", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoH264PictureParameterSet", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeH264SliceHeader", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeH264PictureInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoDecodeH264PictureInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeH264ReferenceInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoDecodeH264ReferenceInfo", "OPAQUE_TYPE"),
        # H.265/HEVC
        EnumHIR("StdVideoH265ProfileIdc", [
            EnumValueHIR("MAIN", 1),
            EnumValueHIR("MAIN_10", 2),
            EnumValueHIR("MAIN_STILL_PICTURE", 3),
            EnumValueHIR("FORMAT_RANGE_EXTENSIONS", 4),
            EnumValueHIR("SCC_EXTENSIONS", 9),
            EnumValueHIR("INVALID", 0x7FFFFFFF),
        ]),
        EnumHIR("StdVideoH265LevelIdc", [
            EnumValueHIR("LEVEL_1_0", 0),
            EnumValueHIR("LEVEL_2_0", 1),
            EnumValueHIR("LEVEL_2_1", 2),
            EnumValueHIR("LEVEL_3_0", 3),
            EnumValueHIR("LEVEL_3_1", 4),
            EnumValueHIR("LEVEL_4_0", 5),
            EnumValueHIR("LEVEL_4_1", 6),
            EnumValueHIR("LEVEL_5_0", 7),
            EnumValueHIR("LEVEL_5_1", 8),
            EnumValueHIR("LEVEL_5_2", 9),
            EnumValueHIR("LEVEL_6_0", 10),
            EnumValueHIR("LEVEL_6_1", 11),
            EnumValueHIR("LEVEL_6_2", 12),
            EnumValueHIR("INVALID", 0x7FFFFFFF),
        ]),
        ExternalTypeHIR("StdVideoH265VideoParameterSet", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoH265SequenceParameterSet", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoH265PictureParameterSet", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeH265SliceSegmentHeader", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeH265PictureInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoDecodeH265PictureInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeH265ReferenceInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoDecodeH265ReferenceInfo", "OPAQUE_TYPE"),
        # AV1
        EnumHIR("StdVideoAV1Profile", [
            EnumValueHIR("MAIN", 0),
            EnumValueHIR("HIGH", 1),
            EnumValueHIR("PROFESSIONAL", 2),
            EnumValueHIR("INVALID", 0x7FFFFFFF),
        ]),
        EnumHIR("StdVideoAV1Level", [
            EnumValueHIR("LEVEL_2_0", 0),
            EnumValueHIR("LEVEL_2_1", 1),
            EnumValueHIR("LEVEL_2_2", 2),
            EnumValueHIR("LEVEL_2_3", 3),
            EnumValueHIR("LEVEL_3_0", 4),
            EnumValueHIR("LEVEL_3_1", 5),
            EnumValueHIR("LEVEL_3_2", 6),
            EnumValueHIR("LEVEL_3_3", 7),
            EnumValueHIR("LEVEL_4_0", 8),
            EnumValueHIR("LEVEL_4_1", 9),
            EnumValueHIR("LEVEL_4_2", 10),
            EnumValueHIR("LEVEL_4_3", 11),
            EnumValueHIR("LEVEL_5_0", 12),
            EnumValueHIR("LEVEL_5_1", 13),
            EnumValueHIR("LEVEL_5_2", 14),
            EnumValueHIR("LEVEL_5_3", 15),
            EnumValueHIR("LEVEL_6_0", 16),
            EnumValueHIR("LEVEL_6_1", 17),
            EnumValueHIR("LEVEL_6_2", 18),
            EnumValueHIR("LEVEL_6_3", 19),
            EnumValueHIR("LEVEL_7_0", 20),
            EnumValueHIR("LEVEL_7_1", 21),
            EnumValueHIR("LEVEL_7_2", 22),
            EnumValueHIR("LEVEL_7_3", 23),
            EnumValueHIR("INVALID", 0x7FFFFFFF),
        ]),
        ExternalTypeHIR("StdVideoAV1SequenceHeader", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoAV1TimingInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoAV1ColorConfig", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoAV1TileInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoAV1Quantization", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoAV1Segmentation", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoAV1LoopFilter", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoAV1CDEF", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoAV1LoopRestoration", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoAV1FilmGrain", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeAV1PictureInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoDecodeAV1PictureInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeAV1ExtensionHeader", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeAV1DecoderModelInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeAV1OperatingPointInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoEncodeAV1ReferenceInfo", "OPAQUE_TYPE"),
        ExternalTypeHIR("StdVideoDecodeAV1ReferenceInfo", "OPAQUE_TYPE"),
        # VP9
        EnumHIR("StdVideoVP9Profile", [
            EnumValueHIR("PROFILE_0", 0),
            EnumValueHIR("PROFILE_1", 1),
            EnumValueHIR("PROFILE_2", 2),
            EnumValueHIR("PROFILE_3", 3),
            EnumValueHIR("INVALID", 0x7FFFFFFF),
        ]),
        EnumHIR("StdVideoVP9Level", [
            EnumValueHIR("LEVEL_1_0", 0),
            EnumValueHIR("LEVEL_1_1", 1),
            EnumValueHIR("LEVEL_2_0", 2),
            EnumValueHIR("LEVEL_2_1", 3),
            EnumValueHIR("LEVEL_3_0", 4),
            EnumValueHIR("LEVEL_3_1", 5),
            EnumValueHIR("LEVEL_4_0", 6),
            EnumValueHIR("LEVEL_4_1", 7),
            EnumValueHIR("LEVEL_5_0", 8),
            EnumValueHIR("LEVEL_5_1", 9),
            EnumValueHIR("LEVEL_5_2", 10),
            EnumValueHIR("LEVEL_6_0", 11),
            EnumValueHIR("LEVEL_6_1", 12),
            EnumValueHIR("LEVEL_6_2", 13),
            EnumValueHIR("INVALID", 0x7FFFFFFF),
        ]),
        ExternalTypeHIR("StdVideoDecodeVP9PictureInfo", "OPAQUE_TYPE"),
    ]
    return external_types


def parse_enums(registry: Element) -> List[EnumHIR | TypeAliasHIR]:
    enum_aliases: List[TypeAliasHIR] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "enum" or "alias" not in type_el.attrib:
            continue
        declared_type_name = type_el.attrib["name"]
        aliased_type_name = type_el.attrib["alias"]
        enum_aliases.append(TypeAliasHIR(declared_type_name, aliased_type_name))

    enums: List[EnumHIR] = []
    for enums_el in registry.findall("enums"):
        if enums_el.get("type") != "enum":
            continue
        name = enums_el.attrib["name"]
        enum_values: List[EnumValueHIR] = []
        for enum_el in enums_el.findall("enum"):
            if "deprecated" in enum_el.attrib:
                continue
            value_name = enum_el.attrib["name"]
            value = int(enum_el.attrib["value"], 0)
            comment = enum_el.get("comment")
            enum_values.append(EnumValueHIR(value_name, value, comment))
        enums.append(EnumHIR(name, enum_values))
    
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
            comment = require_el.get("comment")
            enum_to_extend.values.append(EnumValueHIR(name, value, comment))
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
            comment = require_el.get("comment")
            enum_to_extend.values.append(EnumValueHIR(name, value, comment))

    return enum_aliases + enums


def parse_flags(registry: Element) -> List[FlagsHIR | TypeAliasHIR]:
    flag_aliases: List[TypeAliasHIR] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "bitmask" or "alias" not in type_el.attrib:
            continue
        declared_type_name = type_el.attrib["name"]
        aliased_type_name = type_el.attrib["alias"]
        flag_aliases.append(TypeAliasHIR(declared_type_name, aliased_type_name))

    flag_bits: List[FlagBitsHIR] = []
    for enums_el in registry.findall("enums"):
        if enums_el.get("type") != "bitmask":
            continue
        name = enums_el.attrib["name"]
        flag_values: List[FlagValueHIR] = []
        bits: List[FlagBitHIR] = []
        for enum_el in enums_el.findall("enum"):
            if "name" in enum_el.attrib and "value" in enum_el.attrib:
                value_name = enum_el.attrib["name"]
                value = int(enum_el.attrib["value"], 0)
                flag_values.append(FlagValueHIR(value_name, value))
            elif "name" in enum_el.attrib and "bitpos" in enum_el.attrib:
                bit_name = enum_el.attrib["name"]
                bitpos = int(enum_el.attrib["bitpos"])
                bits.append(FlagBitHIR(bit_name, bitpos))
        flag_bits.append(FlagBitsHIR(name, flag_values, bits))
    
    flags: List[FlagsHIR] = []
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
            current_flag_bits = FlagBitsHIR(flag_bits_name, [], [])
        flags.append(FlagsHIR(flags_name, current_flag_bits, width))

    return flag_aliases + flags


def parse_handles(registry: Element) -> List[HandleHIR]:
    handles: List[HandleHIR] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "handle" or type_el.get("alias") is not None:
            continue
        name = assert_type(str, type_el.findtext("name"))
        type = assert_type(str, type_el.findtext("type"))
        if type not in ("VK_DEFINE_HANDLE", "VK_DEFINE_NON_DISPATCHABLE_HANDLE"):
            raise ValueError("Unexpected type value")
        handles.append(HandleHIR(name, type))
    return handles


def parse_fn_types(registry: Element) -> List[FnTypeHIR]:
    PATTERN = re.compile(
        r"typedef\s+(?P<ret>.+?)\s*\(\s*VKAPI_PTR\s*\*\s*(?P<name>\w+)\s*\)\s*\((?P<args>.*)\)\s*;",
        re.DOTALL,
    )

    fn_types: List[FnTypeHIR] = []
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
        fn_ptr_args: List[FnParamHIR] = []
        if args_str and args_str != "void":
            for arg in args_str.split(","):
                arg = arg.strip()
                tokens = arg.split()
                arg_name = tokens[-1]
                type_part = " ".join(tokens[:-1])
                arg_type = parse_type_str(type_part)
                fn_ptr_args.append(FnParamHIR(arg_name, arg_type))
        fn_types.append(FnTypeHIR(name, return_type, fn_ptr_args))
    return fn_types


def parse_structs(registry: Element) -> List[StructHIR | TypeAliasHIR]:
    struct_aliases: List[TypeAliasHIR] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "struct" or "alias" not in type_el.attrib:
            continue
        declared_type_name = type_el.attrib["name"]
        aliased_type_name = type_el.attrib["alias"]
        struct_aliases.append(TypeAliasHIR(declared_type_name, aliased_type_name))
    
    structs: List[StructHIR] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "struct" or "alias" in type_el.attrib:
            continue
        struct_name = type_el.attrib["name"]
        struct_members: List[StructMemberHIR] = []
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
            struct_members.append(StructMemberHIR(member_name, member_type, member_value, bit_width))
        structs.append(StructHIR(struct_name, struct_members))

    return struct_aliases + structs


def parse_unions(registry: Element) -> List[UnionHIR]:
    unions: List[UnionHIR] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "union" or "alias" in type_el.attrib:
            continue
        union_name = type_el.attrib["name"]
        member_types: List[TypeHIR] = []
        for member_el in type_el.findall("member"):
            if member_el.get("api") == "vulkansc":
                continue
            member_types.append(parse_type(member_el))
        unions.append(UnionHIR(union_name, member_types))
    return unions


def parse_commands(registry: Element) -> CommandsHIR:
    # Gather up all commands
    commands_by_name: Dict[str, CommandHIR] = {}
    for command_el in registry.findall("commands/command"):
        if "alias" in command_el.attrib:
            continue
        if command_el.get("api") == "vulkansc":
            continue
        proto_el = assert_type(Element, command_el.find("proto"))
        name_el = assert_type(Element, proto_el.find("name"))
        name = assert_type(str, name_el.text)
        return_type = parse_type(proto_el)
        params: List[CommandParamHIR] = []
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
                raise ValueError(f"Unexpected optional value: {raw_optional!r} on {name}.{param_name}")
            # We only care about outermost optional
            optional = raw_optional.startswith("true")
            params.append(CommandParamHIR(param_name, param_type, length, optional))
        commands_by_name[name] = CommandHIR(name, return_type, params)
    
    # Duplicate commands if they're aliased.
    for command_el in registry.findall("commands/command"):
        if "alias" not in command_el.attrib:
            continue
        if command_el.get("api") == "vulkansc":
            continue
        name = command_el.attrib["name"]
        alias = command_el.attrib["alias"]
        commands_by_name[name] = commands_by_name[alias]

    # Attach version info to each command
    versioned_commands: List[VersionedCommandHIR] = []
    for feature in registry.findall("feature"):
        if "vulkan" not in feature.attrib["api"].split(","):
            continue
        major_version = int(feature.attrib["name"].split("_")[-2])
        minor_version = int(feature.attrib["name"].split("_")[-1])
        version = Version(major_version, minor_version)
        for command_el in feature.findall("require/command"):
            command_name = command_el.attrib["name"]
            command = commands_by_name[command_name]
            versioned_commands.append(VersionedCommandHIR(version, command))

    # Organize extension commands by extension
    extension_commands: List[ExtensionCommandsHIR] = []
    for extension_el in registry.findall("extensions/extension"):
        if "vulkan" not in (extension_el.get("supported") or "").split(","):
            continue
        name = extension_el.attrib["name"]
        type = extension_el.attrib["type"]
        if type not in ("instance", "device"):
            raise ValueError("Unexpected extension_type value")
        commands: List[CommandHIR] = []
        for command_el in extension_el.findall("require/command"):
            command_name = command_el.attrib["name"]
            command = commands_by_name[command_name]
            commands.append(command)
        if len(commands) == 0:
            continue
        extension_commands.append(ExtensionCommandsHIR(name, type, commands))

    return CommandsHIR(versioned_commands, extension_commands)


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


def parse_type(parent_el: Element) -> TypeHIR:
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
    for sib in children[name_idx + 1 :]:
        if sib.tag == "comment":
            suffix_parts.append(sib.tail if sib.tail else "")
        else:
            suffix_parts.extend(t for t in (sib.text, sib.tail) if t)
    suffix = "".join(suffix_parts).strip()

    return parse_type_str(type_part + suffix)


def parse_type_str(type_str: str) -> TypeHIR:
    s = type_str
    array_dims: List[str] = []
    while True:
        m = re.search(r"\[\s*([^\]]+?)\s*\]\s*$", s)
        if m is None:
            break
        array_dims.append(m.group(1).strip())
        s = s[: m.start()].rstrip()

    tokens = s.replace("*", " * ").split()
    star_indices = [i for i, t in enumerate(tokens) if t == "*"]
    ptr_level = len(star_indices)

    base_tokens = tokens if ptr_level == 0 else tokens[: star_indices[0]]
    base_const = "const" in base_tokens
    base_nonconst = [t for t in base_tokens if t != "const"]
    if not base_nonconst:
        raise ValueError(f"Unexpected type string: {type_str!r}")
    name = base_nonconst[-1]

    ptr_consts: List[bool] = []
    for star_idx in star_indices:
        ptr_is_const = star_idx + 1 < len(tokens) and tokens[star_idx + 1] == "const"
        ptr_consts.append(ptr_is_const)
    const: List[bool] = [] if ptr_level == 0 else ([base_const] + ptr_consts[:-1])

    # We special case these because they're opaque types and we have handle types for them
    QNX_SCREEN_HANDLE_MAP = {
        "_screen_context": "screen_context_t",
        "_screen_window": "screen_window_t",
        "_screen_buffer": "screen_buffer_t",
    }
    if ptr_level == 1 and name in QNX_SCREEN_HANDLE_MAP:
        return TypeHIR(name=QNX_SCREEN_HANDLE_MAP[name], const=[], array_dims=[])
    
    return TypeHIR(name, const, array_dims)


# ----------------
# Lowering
# ----------------


def lower_type(
    type: TypeHIR,
    origin_kind: Literal["external", "any", "named"],
    *,
    origin_name: Optional[str] = None,
    strip_ptr: bool = False,
) -> TypeLIR:
    if origin_kind == "named" and not origin_name:
        raise ValueError("origin_name is required when origin_kind == 'named'")
    
    const = deepcopy(type.const)
    ptr_level = type.ptr_level
    if strip_ptr:
        if ptr_level <= 0:
            raise ValueError("strip_ptr=True but type has no pointers")
        const.pop()
        ptr_level -= 1

    base_name = c_type_name_to_mojo(type.name)
    base_origin: Optional[OriginLIR] = None
    array_dims = [array_dim.removeprefix("VK_") for array_dim in type.array_dims]

    is_string = ptr_level >= 1 and type.name == "char" and const[0]
    if is_string:
        base_name = "CStringSlice"
        base_origin = OriginLIR(mut=False, kind=origin_kind, name=origin_name)
        ptr_level -= 1
        const = const[1:]

    # dumb hack but I don't want to do another big refactor
    ptr_origin_kind: Literal["external", "any", "named"] = origin_kind
    ptr_origin_name: Optional[str] = origin_name
    if base_name == "CStringSlice" and ptr_level > 0:
        ptr_origin_kind = "any"
        ptr_origin_name = None

    ptr_origins: List[OriginLIR] = []
    for i in range(ptr_level):
        pointee_is_const = const[i] 
        ptr_origins.append(OriginLIR(mut=not pointee_is_const, kind=ptr_origin_kind, name=ptr_origin_name))
    
    return TypeLIR(
        name = base_name,
        origin = base_origin,
        ptr_origins = ptr_origins,
        array_dims = array_dims,
    )


def lower_type_alias(type_alias: TypeAliasHIR) -> TypeAliasLIR:
    return TypeAliasLIR(
        declared_type_name = c_type_name_to_mojo(type_alias.declared_type_name),
        aliased_type_name = c_type_name_to_mojo(type_alias.aliased_type_name),
    )


def lower_constants(constants_hir: List[ConstantHIR]) -> List[ConstantLIR]:
    constants_lir: List[ConstantLIR] = []
    for constant in constants_hir:
        name = constant.name.removeprefix("VK_")
        type = TypeLIR(c_type_name_to_mojo(constant.type.name))
        value = constant.value
        if value.endswith("F"):
            value = value[:-1]
        elif member := re.match(r"\(~([0-9]{1,9})ULL\)", value):
            value = f"~UInt64({member.group(1)})"
        elif member := re.match(r"\(~([0-9]{1,9})U\)", value):
            value = f"~UInt32({member.group(1)})"
        constants_lir.append(ConstantLIR(name, type, value))
    return constants_lir


def lower_basetypes(basetypes_hir: List[BasetypeHIR]) -> List[BasetypeLIR]:
    basetypes_lir: List[BasetypeLIR] = []
    for basetype in basetypes_hir:
        if basetype.type.ptr_level > 1:
            raise ValueError("Basetypes with multiple pointers currently not supported.")
        basetypes_lir.append(BasetypeLIR(
            name = c_type_name_to_mojo(basetype.name),
            type = lower_type(basetype.type, origin_kind="external"),
        ))
    return basetypes_lir


def lower_external_types(external_types_hir: List[ExternalTypeHIR | EnumHIR]) -> List[ExternalTypeLIR | EnumLIR]:
    external_types_lir: List[ExternalTypeLIR | EnumLIR] = []
    for external_type in external_types_hir:
        if isinstance(external_type, ExternalTypeHIR):
            if external_type.type == "OPAQUE_TYPE":
                type = "OPAQUE_TYPE"
            else:
                type = lower_type(external_type.type, origin_kind="external")
            external_types_lir.append(ExternalTypeLIR(c_type_name_to_mojo(external_type.name), type))
        else:
            external_types_lir.append(lower_enum(external_type))
    return external_types_lir


def lower_enum(enum: EnumHIR) -> EnumLIR:
    values_lir: List[EnumValueLIR] = []
    for value in enum.values:
        if enum.name == "VkResult":
            value_name = value.name.removeprefix("VK_")
            error_message_description = "" if value.comment is None else f" - {value.comment}"
            result_error_message = f"{value.name} ({value.value}){error_message_description}"
        else:
            prefix = pascal_to_snake(strip_extension_suffix(enum.name) + "_").upper()
            value_name = value.name.removeprefix(prefix)
            result_error_message = None
        if value_name[0].isdigit():
            value_name = f"N_{value_name}"
        values_lir.append(EnumValueLIR(
            name = value_name,
            value = value.value,
            comment = value.comment,
            result_error_message = result_error_message,
        ))
    return EnumLIR(name=c_type_name_to_mojo(enum.name), values=values_lir)


def lower_enums(enums_hir: List[EnumHIR | TypeAliasHIR]) -> List[EnumLIR | TypeAliasLIR]:
    enums_lir: List[EnumLIR | TypeAliasLIR] = []
    for enum in enums_hir:
        if isinstance(enum, TypeAliasHIR):
            enums_lir.append(lower_type_alias(enum))
        else:
            enums_lir.append(lower_enum(enum))
    return enums_lir


def lower_flags(flags_hir: List[FlagsHIR | TypeAliasHIR]) -> List[FlagsLIR | TypeAliasLIR]:
    flags_lir: List[FlagsLIR | TypeAliasLIR] = []

    for flags in flags_hir:
        if isinstance(flags, TypeAliasHIR):
            flags_lir.append(lower_type_alias(flags))
            continue

        base = strip_extension_suffix(flags.name)
        prefix = pascal_to_snake(base + "_").replace("_flags", "").upper()

        flag_values: List[FlagValueLIR] = []
        for value in flags.flag_bits.values:
            name = strip_extension_suffix(value.name.removeprefix(prefix)).removesuffix("_BIT")
            if name[0].isdigit():
                name = f"N_{name}"
            flag_values.append(FlagValueLIR(name, value.value))

        flag_bits: List[FlagBitLIR] = []
        for bit in flags.flag_bits.bits:
            name = strip_extension_suffix(bit.name.removeprefix(prefix)).removesuffix("_BIT")
            if name[0].isdigit():
                name = f"N_{name}"
            flag_bits.append(FlagBitLIR(name, bit.bitpos))

        flag_bits_lir = FlagBitsLIR(
            name = c_type_name_to_mojo(flags.flag_bits.name),
            values = flag_values,
            bits = flag_bits,
        )
        flags_lir.append(FlagsLIR(
            name = c_type_name_to_mojo(flags.name),
            flag_bits = flag_bits_lir,
            width = flags.width,
        ))
    
    return flags_lir


def lower_handles(handles_hir: List[HandleHIR]) -> List[HandleLIR]:
    HANDLE_TYPE_MAPPING: Dict[str, Literal["UInt", "UInt64"]] = {
        "VK_DEFINE_HANDLE": "UInt",
        "VK_DEFINE_NON_DISPATCHABLE_HANDLE": "UInt64",
    }
    handles_lir: List[HandleLIR] = []
    for handle in handles_hir:
        handles_lir.append(HandleLIR(
            name = c_type_name_to_mojo(handle.name),
            underlying_type = HANDLE_TYPE_MAPPING[handle.type],
        ))
    return handles_lir


def lower_fn_types(fn_types_hir: List[FnTypeHIR]) -> List[FnTypeLIR]:
    fn_types_lir: List[FnTypeLIR] = []
    for fn_type in fn_types_hir:
        params_lir: List[FnArgLIR] = []
        for p in fn_type.params:
            params_lir.append(FnArgLIR(
                name = pascal_to_snake(p.name),
                type = lower_type(p.type, "any"),
            ))
        fn_types_lir.append(FnTypeLIR(
            name = c_type_name_to_mojo(fn_type.name),
            return_type = lower_type(fn_type.return_type, "any"),
            params = params_lir,
        ))
    return fn_types_lir


def lower_structs(structs_hir: List[StructHIR | TypeAliasHIR]) -> List[StructLIR | TypeAliasLIR]:
    struct_names: Set[str] = set()
    structs_lir: List[StructLIR | TypeAliasLIR] = []
    for struct in structs_hir:
        if isinstance(struct, TypeAliasHIR):
            structs_lir.append(lower_type_alias(struct))
        else:
            struct_names.add(struct.name)

    for struct in structs_hir:
        if not isinstance(struct, StructHIR):
            continue
        packing_info_by_member: Dict[str, StructFieldPackingInfoLIR] = {}
        group_index = -1
        bit_offset = 0
        in_pack = False
        for member in struct.members:
            bit_width = member.bit_width
            if bit_width is None:
                in_pack = False
                bit_offset = 0
                continue
            if bit_width <= 0 or bit_width > 32:
                raise ValueError(f"Invalid bitfield width {bit_width} on {struct.name}.{member.name}")
            first_group_member = False
            if not in_pack or bit_offset + bit_width > 32:
                group_index += 1
                bit_offset = 0
                in_pack = True
                first_group_member = True
            packing_info_by_member[member.name] = StructFieldPackingInfoLIR(
                group_index = group_index,
                first_group_member = first_group_member,
                bit_width = bit_width,
                bit_offset = bit_offset,
            )
            bit_offset += bit_width

        physical_fields: List[StructPhysicalFieldLIR] = []
        for member in struct.members:
            is_version = member.name.lower().endswith("version") and member.type.name == "uint32_t"
            if member.name in packing_info_by_member:
                packing_info = packing_info_by_member[member.name]
                if not packing_info.first_group_member:
                    continue
                field_name = f"_packed{packing_info.group_index}"
                field_type_lir = TypeLIR("UInt32")
            elif is_version:
                field_name = pascal_to_snake(member.name)
                field_type_lir = TypeLIR("Version")
            else:
                field_name = pascal_to_snake(member.name)
                field_type_lir = lower_type(member.type, origin_kind="any")
            physical_fields.append(StructPhysicalFieldLIR(field_name, field_type_lir))

        logical_fields: List[StructLogicalFieldLIR] = []
        for member in struct.members:
            name = pascal_to_snake(member.name)
            is_string = member.type.name == "char" and member.type.ptr_level > 0
            is_version = member.name.lower().endswith("version") and member.type.name == "uint32_t"
            if member.name in packing_info_by_member:
                type = TypeLIR("UInt32")
                bitcast_to_type = None
            elif is_string:
                type = lower_type(member.type, origin_kind="named", origin_name=f"{name}_origin")
                bitcast_to_type = lower_type(member.type, origin_kind="any")
            elif is_version:
                type = TypeLIR("Version")
                bitcast_to_type = None
            else:
                type = lower_type(member.type, origin_kind="any")
                bitcast_to_type = None
            fixed_init_expr: Optional[str] = None
            if member.type.name == "VkStructureType" and member.value is not None:
                prefix = pascal_to_snake(strip_extension_suffix(member.type.name) + "_").upper()
                value_name = member.value.removeprefix(prefix)
                fixed_init_expr = f"{c_type_name_to_mojo(member.type.name)}.{value_name}"
            if member.name in packing_info_by_member:
                init_kind = "packed_arg"
            elif fixed_init_expr is not None:
                init_kind = "fixed"
            else:
                init_kind = "arg"
            needs_copy = (
                member.type.name in struct_names
                and member.type.ptr_level == 0
            )
            is_array_string = (
                member.type.name == "char"
                and len(member.type.array_dims) > 0
                and member.type.ptr_level == 0
            )
            logical_fields.append(StructLogicalFieldLIR(
                name = name,
                type = type,
                bitcast_to_type = bitcast_to_type,
                init_kind = init_kind,
                fixed_init_expr = fixed_init_expr,
                needs_copy = needs_copy,
                packing_info = packing_info_by_member.get(member.name),
                is_array_string = is_array_string,
            ))

        structs_lir.append(StructLIR(
            name = c_type_name_to_mojo(struct.name), 
            physical_fields = physical_fields,
            logical_fields = logical_fields,
        ))
    return structs_lir


def lower_unions(unions_hir: List[UnionHIR]) -> List[UnionLIR]:
    unions_lir: List[UnionLIR] = []
    for union in unions_hir:
        member_types_lir = [lower_type(t, origin_kind="any") for t in union.member_types]
        unions_lir.append(UnionLIR(
            name = c_type_name_to_mojo(union.name),
            member_types = member_types_lir,
        ))
    return unions_lir


def lower_commands(commands_hir: CommandsHIR) -> CommandLoadersLIR:
    versions = list({vc.version_added for vc in commands_hir.core})
    versions.sort(key=lambda v: (v.major, v.minor))

    core_by_level: Dict[Level, List[VersionedCommandHIR]] = {
        "global": [],
        "instance": [],
        "device": [],
    }
    for versioned_command in commands_hir.core:
        command = versioned_command.command
        if len(command.params) == 0:
            raise ValueError(f"Expected command to have params: {command.name}")
        first_arg_type = command.params[0].type.name
        if command.name == "vkGetInstanceProcAddr":
            level: Level = "global"
        elif first_arg_type in ("VkInstance", "VkPhysicalDevice") or command.name == "vkGetDeviceProcAddr":
            level = "instance"
        elif first_arg_type in ("VkDevice", "VkQueue", "VkCommandBuffer"):
            level = "device"
        else:
            level = "global"
        core_by_level[level].append(versioned_command)

    core_loaders: List[CoreCommandLoaderLIR] = []
    for level in ("global", "instance", "device"):
        traits = (["GlobalFunctions", "Movable"] if level == "global" else ["Movable"])
        for version in versions:
            included = [vc for vc in core_by_level[level] if vc.version_added <= version]
            previous_versions = list({vc.version_added for vc in included})
            previous_versions.sort(key=lambda v: (v.major, v.minor))
            commands_lir = [
                VersionedCommandLIR(
                    version_added=vc.version_added,
                    command=lower_command(vc.command),
                )
                for vc in included
            ]
            core_loaders.append(CoreCommandLoaderLIR(
                level=level,
                version=version,
                previous_versions=previous_versions,
                traits=traits,
                commands=commands_lir,
            ))

    extension_loaders: List[ExtensionCommandLoaderLIR] = []
    for ext in commands_hir.extension:
        parts = ext.name.split("_")
        if len(parts) < 3 or parts[0] != "VK":
            raise ValueError(f"Unexpected extension name: {ext.name}")
        tag = parts[1]
        name = "".join(p.capitalize() for p in parts[2:])
        commands = [lower_command(c) for c in ext.commands]
        extension_loaders.append(ExtensionCommandLoaderLIR(
            name=name,
            tag=tag,
            level=ext.level,
            commands=commands,
        ))
    
    return CommandLoadersLIR(core_loaders, extension_loaders)


def lower_command(command: CommandHIR) -> CommandLIR:
    name = pascal_to_snake(command.name).removeprefix("vk_")
    return_type = lower_type(command.return_type, origin_kind="any")
    args: List[CommandArgLIR] = []
    params: List[CommandParamLIR] = []
    for param in command.params:
        arg_name = pascal_to_snake(param.name)
        is_opaque_ptr = (param.type.ptr_level == 1 and param.type.name == "void")
        is_by_ref = (
            (not param.optional)
            and (param.type.ptr_level > 0)
            and (param.length is None)
            and (param.type.name != "char")
            and (not is_opaque_ptr)
        )
        if is_by_ref:
            if arg_name.startswith("pp_"):
                arg_name = arg_name.removeprefix("p")
            elif arg_name.startswith("p_"):
                arg_name = arg_name.removeprefix("p_")
        pointee_is_const = param.type.const[-param.type.ptr_level] if param.type.ptr_level > 0 else False
        mut = is_by_ref and not pointee_is_const
        type = lower_type(param.type, origin_kind="any", strip_ptr=is_by_ref)
        # We special case vkEnumerateInstanceVersion it's the only command that deals with the Version type directly
        if command.name == "vkEnumerateInstanceVersion" and param.name == "pApiVersion":
            type.name = "Version"
        args.append(CommandArgLIR(
            name = arg_name,
            type = type,
            mut = mut,
            ffi_takes_ptr = is_by_ref,
            optional = param.optional,
            length = param.length,
        ))

    two_call_helper: Optional[TwoCallHelperLIR] = None
    count_param = command.params[-2] if len(command.params) >= 2 else None
    data_param = command.params[-1] if len(command.params) >= 2 else None
    follows_2_call_pattern = (
        count_param is not None
        and data_param is not None
        and return_type.name in ("Result", "NoneType")
        and count_param.type.ptr_level == 1
        and count_param.type.name in ("uint32_t", "size_t")
        and (not count_param.type.const[-1])
        and data_param.type.ptr_level >= 1
        and (not data_param.type.const[-1])
        and data_param.optional
        and data_param.length == count_param.name
    )
    if follows_2_call_pattern:
        returns_result = command.return_type.name == "VkResult"
        data_param = assert_type(CommandParamHIR, data_param)
        element_type = lower_type(data_param.type, origin_kind="any", strip_ptr=True)
        if element_type.name == "NoneType":
            element_type = TypeLIR("UInt8")
        two_call_helper = TwoCallHelperLIR(
            return_type_kind = "ListResult" if returns_result else "List",
            return_element_type = element_type,
            args = args[:-2],
        )

    return CommandLIR(
        name = name,
        native_name = command.name,
        return_type = return_type,
        args = args,
        params = params,
        two_call_helper = two_call_helper,
    )


def c_type_name_to_mojo(c_type_name: str) -> str:
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
    if c_type_name in mapping:
        return mapping[c_type_name]
    return c_type_name.removeprefix("Vk")


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


# ----------------
# Emission
# ----------------


def emit_type(type: TypeLIR) -> str:
    t = type.name
    if type.origin is not None:
        t = f"{t}[{emit_origin(type.origin)}]"
    for ptr_origin in type.ptr_origins:
        t = f"Ptr[{t}, {emit_origin(ptr_origin)}]"
    for array_dim in type.array_dims:
        t = f"InlineArray[{t}, Int({array_dim})]"
    return t


def emit_origin(origin: OriginLIR) -> str:
    if origin.kind == "any":
        return "MutAnyOrigin" if origin.mut else "ImmutAnyOrigin"
    elif origin.kind == "external":
        return "MutOrigin.external" if origin.mut else "ImmutOrigin.external"
    else:
        return assert_type(str, origin.name)


def emit_type_alias(type_alias: TypeAliasLIR) -> str:
    return f"comptime {type_alias.declared_type_name} = {type_alias.aliased_type_name}\n"


def emit_constants(files: Dict[str, str], constants: List[ConstantLIR]):
    parts: List[str] = []
    for constant in constants:
        parts.append(f"comptime {constant.name}: {emit_type(constant.type)} = {constant.value}\n")
    files["constants.mojo"] = "".join(parts)


def emit_basetypes(files: Dict[str, str], basetypes: List[BasetypeLIR]):
    parts: List[str] = []
    for basetype in basetypes:
        parts.append(f"comptime {basetype.name} = {emit_type(basetype.type)}\n")
    files["basetypes.mojo"] = "".join(parts)


def emit_external_types(files: Dict[str, str], external_types: List[ExternalTypeLIR | EnumLIR]):
    parts: List[str] = []
    for external_type in external_types:
        parts.append("\n\n")
        if isinstance(external_type, EnumLIR):
            parts.append(emit_enum(external_type))
        else:
            if external_type.type == "OPAQUE_TYPE":
                parts.append(
                    f"struct {external_type.name}:\n"
                    f"    pass\n"
                )
            else:
                t = emit_type(external_type.type)
                parts.append(
                    f'@register_passable("trivial")\n'
                    f"struct {external_type.name}:\n"
                    f"    var _value: {t}\n"
                    f"\n"
                    f"    fn __init__(out self, *, value: {t}):\n"
                    f"        self._value = value\n"
                    f"\n"
                    f"    fn value(self) -> {t}:\n"
                    f"        return self._value\n"
                )
    files["external_types.mojo"] = "".join(parts)


def emit_enum(enum: EnumLIR) -> str:
    parts: List[str] = []
    if enum.name == "Result":
        parts.append(
            '@register_passable("trivial")\n'
            "struct Result(Equatable, Writable):\n"
            "    var _value: Int32\n"
            "\n"
            "    comptime _descriptions: Dict[Int32, StaticString] = {\n"
        )
        for value in enum.values:
            parts.append(f'        {value.value}: "{value.result_error_message}",\n')
        parts.append(
            "    }\n"
            "\n"
            "    fn __init__(out self, *, value: Int32):\n"
            "        self._value = value\n"
            "\n"
            "    fn value(self) -> Int32:\n"
            "        return self._value\n"
            "\n"
            "    fn __eq__(self, other: Self) -> Bool:\n"
            "        return self._value == other._value\n"
            "\n"
            "    fn is_error(self) -> Bool:\n"
            "        return self.value() < 0\n"
            "\n"
            "    fn raise_on_error(self) raises:\n"
            "        if self.is_error():\n"
            '            raise String(self)\n'
            "\n"
            "    fn __str__(self) -> String:\n"
            "        return String.write(self)\n"
            "\n"
            "    fn write_to[W: Writer](self, mut writer: W):\n"
            "        var description = materialize[Self._descriptions]().get(self.value())\n"
            "        if description:\n"
            "            writer.write(description.value())\n"
            "        else:\n"
            '            writer.write("Unknown Vulkan error code (", self.value(), ")")\n'
            "\n"
        )
    else:
        parts.append(
            '@register_passable("trivial")\n'
            f"struct {enum.name}(Equatable):\n"
            "    var _value: Int32\n"
            "\n"
            "    fn __init__(out self, *, value: Int32):\n"
            "        self._value = value\n"
            "\n"
            "    fn value(self) -> Int32:\n"
            "        return self._value\n"
            "\n"
            "    fn __eq__(self, other: Self) -> Bool:\n"
            "        return self._value == other._value\n"
            "\n"
        )
    for value in enum.values:
        parts.append(f"    comptime {value.name} = {enum.name}(value = {value.value})\n")
    return "".join(parts)


def emit_enums(files: Dict[str, str], enums: List[EnumLIR | TypeAliasLIR]):
    parts: List[str] = []
    for enum in enums:
        if isinstance(enum, TypeAliasLIR):
            parts.append(emit_type_alias(enum))
    for enum in enums:
        if isinstance(enum, EnumLIR):
            parts.append("\n\n")
            parts.append(emit_enum(enum))
    files["enums.mojo"] = "".join(parts)


def emit_flags(files: Dict[str, str], flags: List[FlagsLIR | TypeAliasLIR]):
    parts: List[str] = []
    for flag in flags:
        if isinstance(flag, TypeAliasLIR):
            parts.append(emit_type_alias(flag))
    for flag in flags:
        if not isinstance(flag, FlagsLIR):
            continue
        underlying = "UInt32" if flag.width == 32 else "UInt64"
        parts.append(
            f"\n\n"
            f'@register_passable("trivial")\n'
            f"struct {flag.name}(Equatable):\n"
            f"    var _value: {underlying}\n"
            f"\n"
            f"    @implicit\n"
            f"    fn __init__(out self, *bits: {flag.flag_bits.name}):\n"
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
            f"    fn __bool__(self) -> Bool:\n"
            f"        return Bool(self._value)\n"
            f"\n"
            f"    fn __eq__(self, other: Self) -> Bool:\n"
            f"        return self._value == other._value\n"
            f"\n"
            f"    fn __or__(self, other: {flag.name}) -> Self:\n"
            f"        return Self(value = self.value() | other.value())\n"
            f"\n"
            f"    fn __ror__(self, other: {flag.name}) -> Self:\n"
            f"        return Self(value = self.value() | other.value())\n"
            f"\n"
            f"    fn __and__(self, other: {flag.name}) -> Self:\n"
            f"        return Self(value = self.value() & other.value())\n"
            f"\n"
            f"    fn __rand__(self, other: {flag.name}) -> Self:\n"
            f"        return Self(value = self.value() & other.value())\n"
            f"\n"
            f"    fn __contains__(self, bit: {flag.flag_bits.name}) -> Bool:\n"
            f"        return Bool(self.value() & bit.value())\n"
            f"\n"
            f"    fn is_subset(self, other: {flag.name}) -> Bool:\n"
            f"        return self & other == self\n"
            f"\n"
            f"    fn is_superset(self, other: {flag.name}) -> Bool:\n"
            f"        return self & other == other\n"
        )
        if len(flag.flag_bits.values) > 0 or len(flag.flag_bits.bits) > 0:
            parts.append("\n")
        for value in flag.flag_bits.values:
            parts.append(f"    comptime {value.name} = Self(value = {flag.flag_bits.name}.{value.name}.value())\n")
        for bit in flag.flag_bits.bits:
            parts.append(f"    comptime {bit.name} = Self(value = {flag.flag_bits.name}.{bit.name}.value())\n")
        parts.append(
            "\n\n"
            '@register_passable("trivial")\n'
            f"struct {flag.flag_bits.name}(Equatable):\n"
            f"    var _value: {underlying}\n"
            "\n"
            f"    fn __init__(out self, *, value: {underlying}):\n"
            "        self._value = value\n"
            "\n"
            f"    fn value(self) -> {underlying}:\n"
            "        return self._value\n"
            "\n"
            "    fn __eq__(self, other: Self) -> Bool:\n"
            "        return self._value == other._value\n"
            "\n"
            f"    fn __or__(self, other: Self) -> {flag.name}:\n"
            f"        return {flag.name}(value = self._value | other._value)\n"
        )
        if len(flag.flag_bits.values) > 0 or len(flag.flag_bits.bits) > 0:
            parts.append("\n")
        for value in flag.flag_bits.values:
            parts.append(f"    comptime {value.name} = Self(value = {value.value})\n")
        for bit in flag.flag_bits.bits:
            parts.append(f"    comptime {bit.name} = Self(value = 1 << {bit.bitpos})\n")
    files["flags.mojo"] = "".join(parts)


def emit_handles(files: Dict[str, str], handles: List[HandleLIR]):
    parts: List[str] = []
    for handle in handles:
        parts.append(
            f"\n\n"
            f'@register_passable("trivial")\n'
            f'struct {handle.name}(Equatable, Writable):\n'
            f'    var _value: {handle.underlying_type}\n'
            f'    comptime NULL = Self(value = 0)\n'
            f'\n'
            f'    fn __init__(out self, *, value: {handle.underlying_type}):\n'
            f'        self._value = value\n'
            f'\n'
            f'    fn value(self) -> {handle.underlying_type}:\n'
            f'        return self._value\n'
            f'\n'
            f'    fn __eq__(self, other: Self) -> Bool:\n'
            f'        return self._value == other._value\n'
            f'\n'
            f'    fn __bool__(self) -> Bool:\n'
            f'        return self._value != 0\n'
            f'\n'
            f'    fn __str__(self) -> String:\n'
            f'        return hex(self._value)\n'
            f'\n'
            f'    fn write_to(self, mut writer: Some[Writer]):\n'
            f'        writer.write(String(self))\n'
        )
    files["handles.mojo"] = "".join(parts)


def emit_fn_types(files: Dict[str, str], fn_types: List[FnTypeLIR]):
    parts: List[str] = []
    for fn_type in fn_types:
        arg_strs = [f"{p.name}: {emit_type(p.type)}" for p in fn_type.params]
        ret = emit_type(fn_type.return_type)
        suffix = "" if ret == "NoneType" else f" -> {ret}"
        parts.append("\n\n")
        parts.append(emit_fn_like(
            f"comptime {fn_type.name} = fn",
            arg_strs,
            suffix,
        ))
    files["fn_types.mojo"] = "".join(parts)


def emit_structs(files: Dict[str, str], structs: List[StructLIR | TypeAliasLIR]):
    parts: List[str] = []
    parts.append(
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
    )
    for struct in structs:
        if isinstance(struct, TypeAliasLIR):
            parts.append(emit_type_alias(struct))
    for struct in structs:
        if not isinstance(struct, StructLIR):
            continue
        parts.append("\n\n")
        parts.append(f"struct {struct.name}(Copyable):\n")
        if len(struct.physical_fields) == 0:
            parts.append("    pass\n")
            continue
        for field in struct.physical_fields:
            parts.append(f"    var {field.name}: {emit_type(field.type)}\n")
        
        init_args: List[str] = ["out self"]
        for field in struct.logical_fields:
            if field.init_kind == "arg":
                init_args.append(f"{field.name}: {emit_type(field.type)} = zero_init[{emit_type(field.type)}]()")
            if field.init_kind == "packed_arg":
                init_args.append(f"{field.name}: UInt32 = 0")
        init_params: List[str] = []
        for field in struct.logical_fields:
            if field.type.origin is None or field.type.origin.kind != "named":
                continue
            if field.type.origin.mut:
                init_params.append(f"{field.type.origin.name}: MutOrigin = MutAnyOrigin")
            else:
                init_params.append(f"{field.type.origin.name}: ImmutOrigin = ImmutAnyOrigin")
        
        parts.append("\n")
        parts.append(emit_fn_like(
            "fn __init__",
            init_args,
            ":",
            params = init_params,
            base_indent_level = 1,
        ))
        for field in struct.logical_fields:
            if field.init_kind == "fixed":
                parts.append(f"        self.{field.name} = {field.fixed_init_expr}\n")
            if field.init_kind == "arg":
                if field.needs_copy:
                    rhs = f"{field.name}.copy()"
                elif field.bitcast_to_type is not None:
                    rhs = f"Ptr(to={field.name}).bitcast[{emit_type(field.bitcast_to_type)}]()[]"
                else:
                    rhs = field.name
                parts.append(f"        self.{field.name} = {rhs}\n")
            if field.init_kind == "packed_arg":
                packing_info = assert_type(StructFieldPackingInfoLIR, field.packing_info)
                if packing_info.first_group_member:
                    parts.append(f"        self._packed{packing_info.group_index} = 0\n")
        for field in struct.logical_fields:
            if field.init_kind == "packed_arg":
                parts.append(f"        self.set_{field.name}({field.name})\n")
        
        for field in struct.logical_fields:
            if field.is_array_string:
                parts.append(
                    f"\n"
                    f"    fn {field.name}_slice(self) -> CStringSlice[origin_of(self.{field.name})]:\n"
                    f"        return CStringSlice[origin_of(self.{field.name})](unsafe_from_ptr = self.{field.name}.unsafe_ptr())\n"
                )
            if field.packing_info is not None:
                group_index = field.packing_info.group_index
                width = field.packing_info.bit_width
                offset = field.packing_info.bit_offset
                parts.append(
                    f"\n"
                    f"    fn get_{field.name}(self) -> UInt32:\n"
                    f"        return get_packed_value[width={width}, offset={offset}](self._packed{group_index})\n"
                    f"\n"
                    f"    fn set_{field.name}(mut self, new_value: UInt32):\n"
                    f"        set_packed_value[width={width}, offset={offset}](self._packed{group_index}, new_value)\n"
                )
        
    files["structs.mojo"] = "".join(parts)


def emit_unions(files: Dict[str, str], unions: List[UnionLIR]):
    UNION_NAME_TO_ALIGN_TYPE: Dict[str, Literal["UInt32", "UInt", "UInt64"]] = {
        "ClearColorValue": "UInt32",
        "ClearValue": "UInt32",
        "ClusterAccelerationStructureOpInputNV": "UInt",
        "PerformanceCounterResultKHR": "UInt64",
        "PerformanceValueDataINTEL": "UInt64",
        "PipelineExecutableStatisticValueKHR": "UInt64",
        "DeviceOrHostAddressKHR": "UInt64",
        "DeviceOrHostAddressConstKHR": "UInt64",
        "DeviceOrHostAddressConstAMDX": "UInt64",
        "AccelerationStructureGeometryDataKHR": "UInt64",
        "IndirectExecutionSetInfoEXT": "UInt",
        "IndirectCommandsTokenDataEXT": "UInt",
        "DescriptorDataEXT": "UInt64",
        "AccelerationStructureMotionInstanceDataNV": "UInt64",
    }

    parts: List[str] = []
    parts.append(
        "from memory import memcpy\n"
        "from math import ceildiv\n"
        "from sys import size_of\n"
        "from .structs import *\n"
        "\n\n"
        "comptime Ptr = UnsafePointer\n"
    )
    for union in unions:
        union_name = union.name
        if union_name not in UNION_NAME_TO_ALIGN_TYPE:
            raise KeyError(f"Missing align-type mapping for union {union_name!r}")
        align_type = UNION_NAME_TO_ALIGN_TYPE[union_name]
        unique_member_type_names = list(dict.fromkeys(emit_type(member_type) for member_type in union.member_types))
        parts.append("".join((
            "\n\n",
            f"struct {union_name}(ImplicitlyCopyable):\n",
            "    comptime _size = max(\n",
            *(f"        size_of[{member_type_name}](),\n" for member_type_name in unique_member_type_names),
            "    )\n",
            f"    comptime _AlignType = {align_type}\n",
            "    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]\n",
            "    var _value: Self._InnerType\n",
        )))
        for member_type_name in unique_member_type_names:
            parts.append(
                "\n"
                f"    fn __init__(out self, value: {member_type_name}):\n"
                "        self._value = zero_init[Self._InnerType]()\n"
                "        memcpy(\n"
                "            dest = Ptr(to=self._value).bitcast[Byte](),\n"
                "            src = Ptr(to=value).bitcast[Byte](),\n"
                f"            count = size_of[{member_type_name}](),\n"
                "        )\n"
            )
    files["unions.mojo"] = "".join(parts)


def emit_command_loaders(files: Dict[str, str], command_loaders: CommandLoadersLIR):
    # Core Functions
    parts: List[str] = []
    parts.append(
        "from sys.ffi import OwnedDLHandle, RTLD, CStringSlice, c_char\n"
        "from memory import ArcPointer\n"
        "from .fn_types import *\n"
        "from .handles import *\n"
        "from .structs import *\n"
        "from .misc import *\n"
        "\n\n"
        "comptime Ptr = UnsafePointer\n"
        "\n\n"
        "trait GlobalFunctions:\n"
        "    fn get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:\n"
        "        ...\n"
    )

    # Core Functions
    for loader in command_loaders.core:
        parts.append(
            f"\n\n"
            f"struct {loader.level.capitalize()}FunctionsV{loader.version.major}_{loader.version.minor}({', '.join(loader.traits)}):\n"
            f"    var _dlhandle: ArcPointer[OwnedDLHandle]\n"
        )
        for required_version in loader.previous_versions:
            req_ver_str = f"{required_version.major}_{required_version.minor}"
            parts.append(f"    var _v{req_ver_str}: {loader.level.capitalize()}FunctionAdditionsV{req_ver_str}\n")
        parts.append("\n")
        if loader.level == "global":
            parts.append(
                "    fn __init__(out self) raises:\n"
                '        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))\n'
            )
        else:
            parts.append(emit_fn_like(
                f"fn __init__",
                [
                    f"out self",
                    f"global_functions: GlobalFunctionsV{loader.version.major}_{loader.version.minor}",
                    f"{loader.level}: {loader.level.capitalize()}",
                ],
                f":",
                base_indent_level = 1,
            ))
            parts.append(f"        self._dlhandle = global_functions.get_dlhandle()\n")
        for required_version in loader.previous_versions:
            req_ver_str = f"{required_version.major}_{required_version.minor}"
            if loader.level == "global":
                args = "self._dlhandle[]"
            else:
                args = f"{loader.level}, global_functions.get_dlhandle()[]"
            parts.append(
                f"        self._v{req_ver_str} = {loader.level.capitalize()}FunctionAdditionsV{req_ver_str}({args})\n"
            )
        if loader.level == "global":
            parts.append(
                "\n"
                "    fn get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:\n"
                "        return self._dlhandle\n"
            )
        for command in loader.commands:
            parts.append(emit_command(command.command, command.version_added))

    # Core Function Additions
    for loader in command_loaders.core:
        new_commands = [cmd.command for cmd in loader.commands if loader.version == cmd.version_added]
        if len(new_commands) == 0:
            continue
        parts.append(
            f"\n\n"
            f"struct {loader.level.capitalize()}FunctionAdditionsV{loader.version.major}_{loader.version.minor}(Movable):\n"
        )
        for command in new_commands:
            parts.append(emit_fn_like(
                f"var {command.name}: fn",
                [f"{arg.name}: {emit_type(arg.type)}" for arg in command.args],
                f"" if command.return_type.name == "NoneType" else f" -> {emit_type(command.return_type)}",
                base_indent_level = 1,
            ))
        parts.append("\n")
        if loader.level == "global":
            parts.append("    fn __init__(out self, dlhandle: OwnedDLHandle):\n")
        else:
            parts.append(
                f"    fn __init__(out self, {loader.level}: {loader.level.capitalize()}, dlhandle: OwnedDLHandle):\n"
            )
        get_proc_level = "instance" if loader.level == "global" else loader.level
        level_arg = f"{get_proc_level}: {get_proc_level.capitalize()}"
        parts.append(
            f"        get_{get_proc_level}_proc_addr = dlhandle.get_function[\n"
            f"            fn({level_arg}, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction\n"
            f'        ]("vkGet{get_proc_level.capitalize()}ProcAddr")\n'
        )
        for command in new_commands:
            handle_arg = "Instance.NULL" if loader.level == "global" else loader.level
            parts.append(
                f"        self.{command.name} = Ptr(to=get_{get_proc_level}_proc_addr(\n"
                f'            {handle_arg}, "{command.native_name}".unsafe_ptr()\n'
                f"        )).bitcast[type_of(self.{command.name})]()[]\n"
            )

    files["core_functions.mojo"] = "".join(parts)

    # Extension Functions
    loader_parts_by_tag: Dict[str, List[str]] = {extension.tag: [] for extension in command_loaders.extension}
    for parts in loader_parts_by_tag.values():
        parts.append(
            "from sys.ffi import OwnedDLHandle, CStringSlice, c_char\n"
            "from memory import ArcPointer\n"
            "from vk.core_functions import GlobalFunctions\n"
        )
    for loader in command_loaders.extension:
        loader_parts = loader_parts_by_tag[loader.tag]
        loader_parts.append(
            f"\n\n"
            f"struct {loader.name}(Copyable):\n"
            f"    var _dlhandle: ArcPointer[OwnedDLHandle]\n"
        )
        for command in loader.commands:
            loader_parts.append(emit_fn_like(
                f"var _{command.name}: fn",
                [f"{arg.name}: {emit_type(arg.type)}" for arg in command.args],
                f"" if command.return_type.name == "NoneType" else f" -> {emit_type(command.return_type)}",
                base_indent_level = 1,
            ))
        loader_parts.append(
            f"\n"
            f"    fn __init__[T: GlobalFunctions](out self, global_functions: T, {loader.level}: {loader.level.capitalize()}) raises:\n"
            f"        self._dlhandle = global_functions.get_dlhandle()\n"
            f"        var get_{loader.level}_proc_addr = global_functions.get_dlhandle()[].get_function[\n"
            f"            fn({loader.level}: {loader.level.capitalize()}, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction\n"
            f'        ]("vkGet{loader.level.capitalize()}ProcAddr")\n'
        )
        for command in loader.commands:
            loader_parts.append((
                f"        self._{command.name} = Ptr(to=get_{loader.level}_proc_addr(\n"
                f'            {loader.level}, "{command.native_name}".unsafe_ptr()\n'
                f"        )).bitcast[type_of(self._{command.name})]()[]\n"
            ))
        for command in loader.commands:
            loader_parts.append(emit_command(command))
    
    extension_module_parts: List[str] = []
    for extension in command_loaders.extension:
        extension_module_parts.append(f"import .{extension.tag.lower()}\n")
    files["extensions/__init__.mojo"] = "".join(extension_module_parts)
    for extension_tag, loader_parts in loader_parts_by_tag.items():
        files[f"extensions/{extension_tag.lower()}.mojo"] = "".join(loader_parts)


def emit_command(command: CommandLIR, version: Optional[Version] = None) -> str:
    parts: List[str] = []
    # function for wrapping raw c function
    parts.append("\n")
    parts.append(emit_fn_like(
        f"fn {command.name}",
        ["self"] + [f"{'mut ' if arg.mut else ''}{arg.name}: {emit_type(arg.type)}" for arg in command.args],
        ":" if command.return_type.name == "NoneType" else f" -> {emit_type(command.return_type)}:",
        base_indent_level = 1,
    ))
    parts.append(
        f'        """See official vulkan docs for details.\n'
        f'\n'
        f'        https://registry.khronos.org/vulkan/specs/latest/man/html/{command.native_name}.html\n'
        f'        """\n'
    )
    version_part = f"v{version.major}_{version.minor}." if version else ""
    ffi_call_args: List[str] = []
    for arg in command.args:
        if arg.ffi_takes_ptr:
            ffi_call_args.append(f"Ptr(to={arg.name}).bitcast[{emit_type(arg.type)}]()[]")
        else:
            ffi_call_args.append(arg.name)
    parts.append(emit_fn_like(
        f"return self._{version_part}{command.name}",
        ffi_call_args,
        "",
        base_indent_level = 2,
    ))

    # convenience function or functions that use the 2 call pattern
    helper = command.two_call_helper
    if helper is not None:
        count_arg = command.args[-2]
        data_arg = command.args[-1]
        element_type_str = emit_type(helper.return_element_type)
        count_type_str = emit_type(count_arg.type)
        get_count_call_args = [
            *[arg.name for arg in helper.args],
            "count",
            f"{emit_type(data_arg.type)}()",
        ]
        fill_buffer_call_args = [
            *[arg.name for arg in helper.args],
            "count",
            "list.unsafe_ptr().bitcast[NoneType]()" if data_arg.type.name == "NoneType" else "list.unsafe_ptr()",
        ]

        parts.append("\n")
        parts.append(emit_fn_like(
            f"fn {command.name}",
            ["self"] + [f"{'mut ' if arg.mut else ''}{arg.name}: {emit_type(arg.type)}" for arg in helper.args],
            f" -> {helper.return_type_kind}[{element_type_str}]:",
            base_indent_level=1,
        ))
        parts.append(
            f'        """See official vulkan docs for details.\n'
            f'\n'
            f'        https://registry.khronos.org/vulkan/specs/latest/man/html/{command.native_name}.html\n'
            f'        """\n'
            f"        var list = List[{element_type_str}]()\n"
            f"        var count: {count_type_str} = 0\n"
        )
        if helper.return_type_kind == "List":
            parts.append(emit_fn_like(
                f"self.{command.name}",
                get_count_call_args,
                "",
                base_indent_level = 2,
            ))
            parts.append("        list.reserve(Int(count))\n")
            parts.append(emit_fn_like(
                f"self.{command.name}",
                fill_buffer_call_args,
                "",
                base_indent_level = 2,
            ))
            parts.append(
                "        list._len = Int(count)\n"
                "        return list^\n"
            )
        else:
            parts.append(
                "        var result = Result.INCOMPLETE\n"
                "        while result == Result.INCOMPLETE:\n"
            )
            parts.append(emit_fn_like(
                f"result = self.{command.name}",
                get_count_call_args,
                "",
                base_indent_level = 3,
            ))
            parts.append(
                "            if result == Result.SUCCESS:\n"
                "                list.reserve(Int(count))\n"
            )
            parts.append(emit_fn_like(
                f"result = self.{command.name}",
                fill_buffer_call_args,
                "",
                base_indent_level = 3,
            ))
            parts.append(
                "        list._len = Int(count)\n"
                "        return ListResult(list^, result)\n"
            )

    return "".join(parts)


def emit_fn_like(
    prefix: str,
    args: Iterable[str],
    suffix: str,
    *,
    params: Iterable[str] = (),
    base_indent_level: int = 0,
) -> str:
    SPACES_PER_INDENT = 4
    MAX_LINE_LENGTH = 100
    base_indent = " " * SPACES_PER_INDENT * base_indent_level
    inner_indent = " " * SPACES_PER_INDENT * (base_indent_level + 1)
    params_list = list(params)
    args_list = list(args)

    params_joined = f"[{', '.join(params_list)}]" if params_list else ""
    args_joined = ", ".join(args_list)

    # everything on one line
    one_liner = f"{base_indent}{prefix}{params_joined}({args_joined}){suffix}"
    if len(one_liner) <= MAX_LINE_LENGTH:
        return one_liner + "\n"
    
    # args on their own line(s)
    args_line = f"{inner_indent}{args_joined}"
    if len(args_line) > MAX_LINE_LENGTH:
        arg_lines = (f"{inner_indent}{arg}," for arg in args_list)
    else:
        arg_lines = (args_line,)
    first_line = f"{base_indent}{prefix}{params_joined}("
    if len(first_line) <= MAX_LINE_LENGTH:
        lines = [
            first_line,
            *arg_lines,
            f"{base_indent}){suffix}",
        ]
        return "".join([line + "\n" for line in lines])
    
    # params on their own line(s)
    params_line = f"{inner_indent}{params_joined}"
    if len(params_line) > MAX_LINE_LENGTH:
        param_lines = (f"{inner_indent}{param}," for param in params_list)
    else:
        param_lines = (params_line,)
    lines = [
        f"{base_indent}{prefix}[",
        *param_lines,
        f"{base_indent}](",
        *arg_lines,
        f"{base_indent}){suffix}",
    ]
    return "".join([line + "\n" for line in lines])


if __name__ == "__main__":
    main()
