from __future__ import annotations
from typing import Dict, List, Optional, TypeVar, Literal, Any, Type, ClassVar, Iterable
from collections import defaultdict
from dataclasses import dataclass
from xml.etree import ElementTree
from xml.etree.ElementTree import Element
import os
import re


T = TypeVar("T")


def main():
    registry = ElementTree.parse("vk.xml").getroot()
    parsed_registry = parse_registry(registry)
    files = emit_bindings(parsed_registry)
    output_root = "vk"
    for rel_path, content in files.items():
        path = os.path.join(output_root, rel_path)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)


def parse_registry(registry: Element) -> ParsedRegistry:
    # constants
    constants: List[VkConstant] = []
    api_constants = next(el for el in registry.findall("enums") if el.get("name") == "API Constants")
    for constant_el in api_constants.findall("enum"):
        name = constant_el.attrib["name"]
        type = constant_el.attrib["type"]
        value = constant_el.attrib["value"]
        constants.append(VkConstant(name, type, value))

    # basetypes
    # hardcoded because parsing these is way too complicated and there aren't many
    basetypes: List[VkBasetype] = [
        VkBasetype("VkSampleMask", VkType("uint32_t")),
        VkBasetype("VkDeviceSize", VkType("uint64_t")),
        VkBasetype("VkDeviceAddress", VkType("uint64_t")),
        VkBasetype("VkRemoteAddressNV", VkType("void", ptr_level=1)),
    ]

    # external types
    # hardcoded because parsing these is way too complicated and there aren't many
    external_types: List[VkExternalType | VkEnum] = [
        # Platform types
        # Xlib / Xrandr
        VkExternalType("Display", None),
        VkExternalType("VisualID", "uint32_t"),
        VkExternalType("Window", "uint32_t"),
        VkExternalType("RROutput", "uint32_t"),
        # Wayland
        VkExternalType("wl_display", None),
        VkExternalType("wl_surface", None),
        # Win32
        VkExternalType("HINSTANCE", "size_t"),
        VkExternalType("HWND", "size_t"),
        VkExternalType("HMONITOR", "size_t"),
        VkExternalType("HANDLE", "size_t"),
        VkExternalType("SECURITY_ATTRIBUTES", None),
        VkExternalType("DWORD", "uint32_t"),
        VkExternalType("LPCWSTR", "size_t"),
        # XCB
        VkExternalType("xcb_connection_t", None),
        VkExternalType("xcb_visualid_t", "uint32_t"),
        VkExternalType("xcb_window_t", "uint32_t"),
        # DirectFB
        VkExternalType("IDirectFB", None),
        VkExternalType("IDirectFBSurface", None),
        # Fuchsia (Zircon)
        VkExternalType("zx_handle_t", "uint32_t"),
        # OpenHarmony / OHOS (WSI)
        VkExternalType("OHNativeWindow", None),
        # Google Games Platform (GGP)
        VkExternalType("GgpStreamDescriptor", "uint32_t"),
        VkExternalType("GgpFrameToken", "uint32_t"),
        # QNX Screen
        VkExternalType("screen_context_t", "size_t"),
        VkExternalType("screen_window_t", "size_t"),
        VkExternalType("screen_buffer_t", "size_t"),
        # NVIDIA SciSync / SciBuf
        VkExternalType("NvSciSyncAttrList", "size_t"),
        VkExternalType("NvSciSyncObj", "size_t"),
        VkExternalType("NvSciSyncFence", None),
        VkExternalType("NvSciBufAttrList", "size_t"),
        VkExternalType("NvSciBufObj", "size_t"),
        # Android NDK
        VkExternalType("ANativeWindow", None),
        VkExternalType("AHardwareBuffer", None),
        # Apple CoreAnimation / Metal / IOSurface (non-ObjC paths are opaque)
        VkExternalType("CAMetalLayer", None),
        VkExternalType("MTLDevice_id", "size_t"),
        VkExternalType("MTLCommandQueue_id", "size_t"),
        VkExternalType("MTLBuffer_id", "size_t"),
        VkExternalType("MTLTexture_id", "size_t"),
        VkExternalType("MTLSharedEvent_id", "size_t"),
        VkExternalType("IOSurfaceRef", "size_t"),
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
        VkExternalType("StdVideoH264SequenceParameterSet", None),
        VkExternalType("StdVideoH264PictureParameterSet", None),
        VkExternalType("StdVideoEncodeH264SliceHeader", None),
        VkExternalType("StdVideoEncodeH264PictureInfo", None),
        VkExternalType("StdVideoDecodeH264PictureInfo", None),
        VkExternalType("StdVideoEncodeH264ReferenceInfo", None),
        VkExternalType("StdVideoDecodeH264ReferenceInfo", None),
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
        VkExternalType("StdVideoH265VideoParameterSet", None),
        VkExternalType("StdVideoH265SequenceParameterSet", None),
        VkExternalType("StdVideoH265PictureParameterSet", None),
        VkExternalType("StdVideoEncodeH265SliceSegmentHeader", None),
        VkExternalType("StdVideoEncodeH265PictureInfo", None),
        VkExternalType("StdVideoDecodeH265PictureInfo", None),
        VkExternalType("StdVideoEncodeH265ReferenceInfo", None),
        VkExternalType("StdVideoDecodeH265ReferenceInfo", None),
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
        VkExternalType("StdVideoAV1SequenceHeader", None),
        VkExternalType("StdVideoAV1TimingInfo", None),
        VkExternalType("StdVideoAV1ColorConfig", None),
        VkExternalType("StdVideoAV1TileInfo", None),
        VkExternalType("StdVideoAV1Quantization", None),
        VkExternalType("StdVideoAV1Segmentation", None),
        VkExternalType("StdVideoAV1LoopFilter", None),
        VkExternalType("StdVideoAV1CDEF", None),
        VkExternalType("StdVideoAV1LoopRestoration", None),
        VkExternalType("StdVideoAV1FilmGrain", None),
        VkExternalType("StdVideoEncodeAV1PictureInfo", None),
        VkExternalType("StdVideoDecodeAV1PictureInfo", None),
        VkExternalType("StdVideoEncodeAV1ExtensionHeader", None),
        VkExternalType("StdVideoEncodeAV1DecoderModelInfo", None),
        VkExternalType("StdVideoEncodeAV1OperatingPointInfo", None),
        VkExternalType("StdVideoEncodeAV1ReferenceInfo", None),
        VkExternalType("StdVideoDecodeAV1ReferenceInfo", None),
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
        VkExternalType("StdVideoDecodeVP9PictureInfo", None),
    ]
    
    # enums
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

    # flags
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

    # handles
    handles: List[VkHandle] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "handle" or type_el.get("alias") is not None:
            continue
        name = assert_type(str, type_el.findtext("name"))
        type = assert_type(str, type_el.findtext("type"))
        if type not in ("VK_DEFINE_HANDLE", "VK_DEFINE_NON_DISPATCHABLE_HANDLE"):
            raise ValueError("Unexpected type value")
        handles.append(VkHandle(name, type))

    # fn types
    fn_types: List[VkFnType] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "funcpointer":
            continue
        name = assert_type(str, type_el.findtext("name"))
        type_text = assert_type(str, type_el.text)
        type_str = type_text.split()[1] if len(type_text.split()) > 1 else "void"
        return_type = type_str.strip("*")
        return_ptr_level = type_str.count("*")
        fn_ptr_args: List[VkFnArg] = []
        for arg_el in type_el.findall("type"):
            arg_name = (
                assert_type(str, arg_el.tail)
                .replace("*", "")
                .replace(",", "")
                .replace(";", "")
                .replace(")", "")
                .strip()
            )
            const = False
            if arg_name.endswith("const"):
                const = True
                arg_name = arg_name[:-5].strip()
            arg_base_type = assert_type(str, arg_el.text)
            arg_ptr_lvl = assert_type(str, arg_el.tail).count("*")
            fn_ptr_args.append(VkFnArg(arg_name, VkType(arg_base_type, arg_ptr_lvl), const))
        fn_types.append(VkFnType(name, VkType(return_type, return_ptr_level), fn_ptr_args))

    # structs
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
            name = assert_type(str, member_el.findtext("name"))
            base_type = assert_type(str, member_el.findtext("type"))
            ptr_level = assert_type(str, assert_type(Element, member_el.find("type")).tail).count("*")
            member_str = ElementTree.tostring(member_el, encoding="unicode")
            array_dim = None
            if m := re.search(r"</name>\[([^\]]+)\]", member_str):
                m2 = re.search(r"<enum>([^<]+)</enum>", m.group(1))
                array_dim = m2.group(1) if m2 else m.group(1)
            type = VkType(base_type, ptr_level, array_dim)
            value = None
            if base_type == "VkStructureType" and member_el.get("values") is not None:
                value = member_el.get("values")
            length = member_el.get("len")
            struct_members.append(VkStructMember(name, type, value, length))
        structs.append(VkStruct(struct_name, struct_members))

    # unions
    unions: List[VkUnion] = []
    for type_el in registry.findall("types/type"):
        if type_el.get("category") != "union" or type_el.get("alias") is not None:
            continue
        name = type_el.attrib["name"]
        member_types: List[VkType] = []
        for member_el in type_el.findall("member"):
            if member_el.get("api") == "vulkansc":
                continue
            base_type = assert_type(str, member_el.findtext("type"))
            ptr_level = (assert_type(Element, member_el.find("type")).tail or "").count("*")
            member_str = ElementTree.tostring(member_el, encoding="unicode")
            array_dim = None
            if m := re.search(r"</name>\[([^\]]+)\]", member_str):
                m2 = re.search(r"<enum>([^<]+)</enum>", m.group(1))
                array_dim = m2.group(1) if m2 else m.group(1)
            member_type = VkType(base_type, ptr_level, array_dim)
            if member_type not in member_types:
                member_types.append(member_type)
        unions.append(VkUnion(name, member_types))

    # functions/commands
    commands_by_name: Dict[str, VkCommand] = {}
    for command_el in registry.findall("commands/command"):
        if "alias" in command_el.attrib:
            continue
        if command_el.get("api") == "vulkansc":
            continue
        proto_el = assert_type(Element, command_el.find("proto"))
        name_el = assert_type(Element, proto_el.find("name"))
        name = assert_type(str, name_el.text)
        type_el = assert_type(Element, proto_el.find("type"))
        return_type_name = assert_type(str, type_el.text)
        return_ptr_level = "".join(proto_el.itertext()).count("*")
        return_type = VkType(return_type_name, return_ptr_level)
        args: List[VkCommandArg] = []
        for param_el in command_el.findall("param"):
            if param_el.get("api") == "vulkansc":
                continue
            arg_name_el = assert_type(Element, param_el.find("name"))
            arg_name = assert_type(str, arg_name_el.text)
            arg_type_el = assert_type(Element, param_el.find("type"))
            arg_type_name = assert_type(str, arg_type_el.text)
            arg_ptr_level = (arg_type_el.tail or "").count("*")
            arg_type = VkType(arg_type_name, arg_ptr_level)
            is_const = (param_el.text or "").startswith("const")
            length = param_el.get("len")
            raw_optional = param_el.get("optional")
            # an absent value is an implicit "false"
            if raw_optional is None:
                raw_optional = "false"
            if raw_optional not in ("false", "true", "false,true", "true,true"):
                raise ValueError("Unexpected optional value")
            optional = raw_optional.startswith("true")
            args.append(VkCommandArg(arg_name, arg_type, is_const, length, optional))
        commands_by_name[name] = VkCommand(name, return_type, args)
    
    for command_el in registry.findall("commands/command"):
        if "alias" not in command_el.attrib:
            continue
        if command_el.get("api") == "vulkansc":
            continue
        name = command_el.attrib["name"]
        alias = command_el.attrib["alias"]
        commands_by_name[name] = commands_by_name[alias]

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
            if len(command.args) == 0:
                raise ValueError("Expected command to have some args")
            first_arg_type = command.args[0].type
            if command.name == "vkGetInstanceProcAddr":
                core_commands["global"][version].append(versioned_command)
            elif first_arg_type.name in ("VkInstance", "VkPhysicalDevice") or command.name == "vkGetDeviceProcAddr":
                core_commands["instance"][version].append(versioned_command)
            elif first_arg_type.name in ("VkDevice", "VkQueue", "VkCommandBuffer"):
                core_commands["device"][version].append(versioned_command)
            else:
                core_commands["global"][version].append(versioned_command)

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

    return ParsedRegistry(
        constants,
        basetypes,
        external_types,
        enum_aliases, enums,
        flag_aliases, flags,
        handles,
        fn_types,
        struct_aliases, structs,
        unions,
        core_commands, extension_commands,
    )


def emit_bindings(parsed_registry: ParsedRegistry) -> Dict[str, str]:
    files: Dict[str, str] = dict()
    module_init_writer = CodeWriter()
    module_init_writer.write_line("from .misc import zero_init, Bool32, Version")

    # constants
    constants_writer = CodeWriter()
    for constant in parsed_registry.constants:
        name = constant.name.removeprefix("VK_")
        type = new_type_name(constant.type)
        value = constant.value
        if value.endswith("F"):
            value = value[:-1]
        elif member := re.match(r"\(~([0-9]{1,9})ULL\)", value):
            value = f"~UInt64({member.group(1)})"
        elif member := re.match(r"\(~([0-9]{1,9})U\)", value):
            value = f"~UInt32({member.group(1)})"
        constants_writer.write_line(f"alias {name}: {type} = {value}")
    files["constants.mojo"] = constants_writer.content()
    module_init_writer.write_line("from .constants import *")

    # basetypes
    basetypes_writer = CodeWriter()
    basetypes_writer.write_line("alias Ptr = UnsafePointer")
    for basetype in parsed_registry.basetypes:
        name = new_type_name(basetype.name)
        underlying_type = mojo_type(basetype.underlying_type)
        basetypes_writer.newline(2)
        basetypes_writer.write_lines((
            f'@register_passable("trivial")',
            f"struct {name}:",
            f"    var _raw: {underlying_type}\n",
            f"    fn __init__(out self):",
            f"        self._raw = {underlying_type}()\n",
            f"    fn __init__(out self, *, raw: {underlying_type}):",
            f"        self._raw = raw\n",
            f"    fn raw(self) -> {underlying_type}:",
            f"        return self._raw",
        ))
    files["basetypes.mojo"] = basetypes_writer.content()
    module_init_writer.write_line("from .basetypes import *")

    # external types
    external_types_writer = CodeWriter()
    for external_type in parsed_registry.external_types:
        external_types_writer.newline(2)
        if isinstance(external_type, VkEnum):
            external_types_writer.write_lines((
                f'@register_passable("trivial")',
                f"struct {external_type.name}:",
                f"    var _raw: Int32\n",
                f"    fn __init__(out self, *, raw: Int32):",
                f"        self._raw = raw\n",
                f"    fn raw(self) -> Int32:",
                f"        return self._raw\n",
                f"    fn __eq__(self, other: Self) -> Bool:\n",
                f"        return self._raw == other._raw\n",
                f"    fn __ne__(self, other: Self) -> Bool:",
                f"        return self._raw != other._raw",
            ))
            if len(external_type.values) > 0:
                external_types_writer.newline()
            for value in external_type.values:
                external_types_writer.write_line(f"    alias {value.name} = {external_type.name}(raw = {value.value})")
        elif external_type.underlying_type is None:
            external_types_writer.write_lines((
                f"# remove Copyable and Movable traits once Collections no longer require it",
                f"struct {external_type.name}(Copyable, Movable):",
                f"    pass",
            ))
        else:
            underlying_type = new_type_name(external_type.underlying_type)
            external_types_writer.write_lines((
                f'@register_passable("trivial")',
                f"struct {external_type.name}:",
                f"    var _raw: {underlying_type}\n",
                f"    fn __init__(out self, *, raw: {underlying_type}):",
                f"        self._raw = raw\n",
                f"    fn raw(self) -> {underlying_type}:",
                f"        return self._raw",
            ))
    files["external_types.mojo"] = external_types_writer.content()
    module_init_writer.write_line("from .external_types import *")

    # enums
    enums_writer = CodeWriter()
    for enum_alias in parsed_registry.enum_aliases:
        declared_type_name = new_type_name(enum_alias.declared_type_name)
        aliased_type_name = new_type_name(enum_alias.aliased_type_name)
        enums_writer.write_line(f"alias {declared_type_name} = {aliased_type_name}")
    for enum in parsed_registry.enums:
        enum_name = new_type_name(enum.name)
        enums_writer.newline(2)
        enums_writer.write_line('@register_passable("trivial")')
        if enum.name == "VkResult":
            enums_writer.write_line("struct Result(EqualityComparable, Writable):")
        else:
            enums_writer.write_line(f"struct {enum_name}(EqualityComparable):")
        enum_body_writer = enums_writer.indented()
        enum_body_writer.write_lines((
            "var _raw: Int32\n",
            "fn __init__(out self, *, raw: Int32):",
            "    self._raw = raw\n",
            "fn raw(self) -> Int32:",
            "    return self._raw\n",
            "fn __eq__(self, other: Self) -> Bool:",
            "    return self._raw == other._raw\n",
        ))
        if enum.name == "VkResult":
            enum_body_writer.write_lines((
                "fn is_error(self) -> Bool:",
                "    return self.raw() < 0\n",
                "fn __str__(self) -> String:",
                "    return String.write(self)\n",
                "fn write_to[W: Writer](self, mut writer: W):",
                "    writer.write(self.raw())\n",
            ))
        for value in enum.values:
            if enum.name == "VkResult":
                value_name = value.name.removeprefix("VK_")
            else:
                prefix = pascal_to_snake(strip_extension_suffix(enum.name) + "_").upper()
                value_name = value.name.removeprefix(prefix)
            if value_name[0].isdigit():
                value_name = f"N_{value_name}"
            enum_name = new_type_name(enum.name)
            enum_body_writer.write_line(f"alias {value_name} = {enum_name}(raw = {value.value})")
    files["enums.mojo"] = enums_writer.content()
    module_init_writer.write_line("from .enums import *")

    # flags
    flags_writer = CodeWriter()
    for flag_alias in parsed_registry.flag_aliases:
        declared_type_name = new_type_name(flag_alias.declared_type_name)
        aliased_type_name = new_type_name(flag_alias.aliased_type_name)
        flags_writer.write_line(f"alias {declared_type_name} = {aliased_type_name}")
    for flags in parsed_registry.flags:
        flags_name = new_type_name(flags.flags_name)
        flag_bits_name = new_type_name(flags.flag_bits.name)
        flags_writer.newline(2)
        flags_writer.write_lines((
            f'@register_passable("trivial")',
            f"struct {flags_name}(EqualityComparable):",
        ))
        flags_body_writer = flags_writer.indented()
        flags_body_writer.write_lines((
            f"var _raw: UInt{flags.width}\n",
            f"@implicit",
            f"fn __init__(out self, *bits: {flag_bits_name}):",
            f"    self._raw = 0",
            f"    for bit in bits:",
            f"        self._raw |= bit.raw()\n",
            f"fn __init__(out self, *, raw: UInt{flags.width}):",
            f"    self._raw = raw\n",
            f"fn raw(self) -> UInt{flags.width}:",
            f"    return self._raw\n",
            f"fn __eq__(self, other: Self) -> Bool:",
            f"    return self._raw == other._raw\n",
            f"fn __or__(self, bit: {flag_bits_name}) -> Self:",
            f"    return Self(raw = self.raw() | bit.raw())\n",
            f"fn __ror__(self, bit: {flag_bits_name}) -> Self:",
            f"    return Self(raw = self.raw() | bit.raw())\n",
            f"fn __contains__(self, bit: {flag_bits_name}) -> Bool:",
            f"    return Bool(self.raw() & bit.raw())\n",
        ))
        if len(flags.flag_bits.values) > 0 or len(flags.flag_bits.bits) > 0:
            flags_writer.newline()
        for value in flags.flag_bits.values:
            prefix = pascal_to_snake(strip_extension_suffix(flags.flags_name).removesuffix("Flags") + "_").upper()
            value_name = value.name.removeprefix(prefix)
            flags_body_writer.write_line(f"alias {value_name} = {flag_bits_name}(raw = {value.value})")
        for bit in flags.flag_bits.bits:
            prefix = pascal_to_snake(strip_extension_suffix(flags.flags_name).removesuffix("Flags") + "_").upper()
            bit_name = bit.name.removeprefix(prefix).removesuffix("_BIT").replace("_BIT_", "_")
            if bit_name[0].isdigit():
                bit_name = f"N_{bit_name}"
            flags_body_writer.write_line(f"alias {bit_name} = {flag_bits_name}(raw = 1 << {bit.bitpos})")
        flags_writer.newline(2)
        flags_writer.write_lines((
            f'@register_passable("trivial")',
            f"struct {flag_bits_name}:",
            f"    var _raw: UInt{flags.width}\n",
            f"    fn __init__(out self, *, raw: UInt{flags.width}):",
            f"        self._raw = raw\n",
            f"    fn raw(self) -> UInt{flags.width}:",
            f"        return self._raw\n",
            f"    fn __eq__(self, other: Self) -> Bool:",
            f"        return self._raw == other._raw\n",
            f"    fn __ne__(self, other: Self) -> Bool:",
            f"        return self._raw != other._raw\n",
            f"    fn __or__(self, bit: Self) -> {flags_name}:",
            f"        return {flags_name}(raw = self.raw() | bit.raw())",
        ))
    files["flags.mojo"] = flags_writer.content()
    module_init_writer.write_line("from .flags import *")

    # handles
    handles_writer = CodeWriter()
    handle_type_mapping: Dict[str, Literal["UInt", "UInt64"]] = {
        "VK_DEFINE_HANDLE": "UInt",
        "VK_DEFINE_NON_DISPATCHABLE_HANDLE": "UInt64",
    }
    for handle in parsed_registry.handles:
        handle_name = new_type_name(handle.name)
        handle_type = handle_type_mapping[handle.type]
        handles_writer.newline(2)
        handles_writer.write_lines((
            f'@register_passable("trivial")',
            f"struct {handle_name}(EqualityComparable, Writable):",
            f"    var _raw: {handle_type}\n",
            f"    alias NULL = Self(raw = 0)\n",
            f"    fn __init__(out self, *, raw: {handle_type}):",
            f"        self._raw = raw\n",
            f"    fn raw(self) -> {handle_type}:",
            f"        return self._raw\n",
            f"    fn __eq__(self, other: {handle_name}) -> Bool:",
            f"        return self._raw == other._raw\n",
            f"    fn __str__(self) -> String:",
            f"        return hex(self._raw)\n",
            f"    fn write_to(self, mut writer: Some[Writer]):",
            f"        writer.write(String(self))",
        ))
    files["handles.mojo"] = handles_writer.content()
    module_init_writer.write_line("from .handles import *")

    # fn types
    fn_types_writer = CodeWriter()
    fn_types_writer.write_lines((
        "from .handles import *",
        "from .structs import *",
        "from .misc import *",
        "\n",
        "alias Ptr = UnsafePointer",
    ))
    fn_types_writer.newline()
    for fn_type in parsed_registry.fn_types:
        args_part = ", ".join(mojo_type(arg.type) for arg in fn_type.args)
        has_return = fn_type.return_type.name != "void"
        return_part = f" -> {mojo_type(fn_type.return_type)}" if has_return else ""
        one_liner = f"alias {fn_type.name} = fn({args_part}){return_part}"
        fn_types_writer.newline()
        if not fn_types_writer.line_too_long(one_liner):
            fn_types_writer.write_line(one_liner)
            continue
        fn_types_writer.write_line(f"alias {fn_type.name} = fn(")
        fn_type_args_writer = fn_types_writer.indented()
        for arg in fn_type.args:
            fn_type_args_writer.write_line(f"{mojo_type(arg.type)},")
        fn_types_writer.write_line(f"){return_part}")
    files["fn_types.mojo"] = fn_types_writer.content()
    module_init_writer.write_line("from .fn_types import *")

    # structs
    struct_writer = CodeWriter()
    struct_writer.write_lines((
        "from .constants import *",
        "from .basetypes import *",
        "from .external_types import *",
        "from .enums import *",
        "from .flags import *",
        "from .handles import *",
        "from .fn_types import *",
        "from .unions import *",
        "from .misc import *",
        "\n",
        "alias Ptr = UnsafePointer",
        "\n",
    ))
    for struct_alias in parsed_registry.struct_aliases:
        declared_type_name = new_type_name(struct_alias.declared_type_name)
        aliased_type_name = new_type_name(struct_alias.aliased_type_name)
        struct_writer.write_line(f"alias {declared_type_name} = {aliased_type_name}")
    for struct in parsed_registry.structs:
        struct_name = new_type_name(struct.name)
        struct_writer.newline(2)
        struct_writer.write_line(f"struct {struct_name}(ImplicitlyCopyable, Movable):")
        struct_body_writer = struct_writer.indented()
        if len(struct.members) == 0:
            struct_body_writer.write_line("pass")
            continue
        for member in struct.members:
            member_name = pascal_to_snake(member.name)
            is_version = member_name.endswith("version") and mojo_type(member.type) == "UInt32"
            member_type = "Version" if is_version else mojo_type(member.type)
            struct_body_writer.write_line(f"var {member_name}: {member_type}")
        # c style init method
        struct_body_writer.newline()
        struct_body_writer.write_line("fn __init__(")
        struct_init_writer = struct_body_writer.indented()
        struct_init_writer.write_line("out self,")
        for member in struct.members:
            if member.type.name == "VkStructureType" and member.value is not None:
                continue
            member_name = pascal_to_snake(member.name)
            is_version = member_name.endswith("version") and mojo_type(member.type) == "UInt32"
            member_type = "Version" if is_version else mojo_type(member.type)
            struct_init_writer.write_line(f"{member_name}: {member_type} = zero_init[{member_type}](),")
        struct_body_writer.write_line("):")
        for member in struct.members:
            member_name = pascal_to_snake(member.name)
            if member.type.name == "VkStructureType" and member.value is not None:
                member_value = f"StructureType.{member.value.removeprefix('VK_STRUCTURE_TYPE_')}"
                struct_init_writer.write_line(f"self.s_type = {member_value}")
            else:
                struct_init_writer.write_line(f"self.{member_name} = {member_name}")
        for member in struct.members:
            if member.type.array_dim is None or member.type.name != "char":
                continue
            member_name = pascal_to_snake(member.name)
            struct_body_writer.newline()
            struct_body_writer.write_lines((
                f"fn {member_name}_slice(self) -> StringSlice[__origin_of(self.{member_name})]:",
                f"    return StringSlice[__origin_of(self.{member_name})](unsafe_from_utf8_ptr = self.{member_name}.unsafe_ptr())",
            ))
        # span based init method
        # disabled because it seems footgunny atm
        # will revisit when better origin handling is here
        # member_names = {member.name for member in struct.members}
        # count_count: Dict[str, int] = defaultdict(int)
        # for member in struct.members:
        #     if member.length is not None and member.length in member_names:
        #         count_count[member.length] += 1
        # c_member_name_to_count_name: Dict[str, str] = {}
        # for member in struct.members:
        #     if member.length is not None and member.type.ptr_level == 1 and count_count[member.length] == 1:
        #         c_member_name_to_count_name[member.name] = member.length
        # count_name_to_c_member_name = {v: k for k, v in c_member_name_to_count_name.items()}
        # if len(count_name_to_c_member_name) > 0:
        #     struct_body_writer.newline()
        #     struct_body_writer.write_line("@staticmethod")
        #     struct_body_writer.write_line("fn from_spans[")
        #     from_span_writer = struct_body_writer.indented()
        #     for c_member_name in c_member_name_to_count_name.keys():
        #         member_name = pascal_to_snake(c_member_name).removeprefix("p_")
        #         from_span_writer.write_line(f"{member_name}_origin: ImmutableOrigin=ImmutableAnyOrigin,")
        #     struct_body_writer.write_line("](")
        #     for member in struct.members:
        #         if member.type.name == "VkStructureType" and member.value is not None:
        #             pass
        #         elif member.name in count_name_to_c_member_name:
        #             pass
        #         elif member.name in c_member_name_to_count_name:
        #             member_name = pascal_to_snake(member.name).removeprefix("p_")
        #             member_type = f"Span[{mojo_type(member.type, no_ptr=True)}, {member_name}_origin]"
        #             from_span_writer.write_line(f"{member_name}: {member_type} = zero_init[{member_type}](),")
        #         else:
        #             member_name = pascal_to_snake(member.name)
        #             is_version = member_name.endswith("version") and mojo_type(member.type) == "UInt32"
        #             member_type = "Version" if is_version else mojo_type(member.type)
        #             from_span_writer.write_line(f"{member_name}: {member_type} = zero_init[{member_type}](),")
        #     struct_body_writer.write_line(f") -> {struct_name}:")
        #     from_span_writer.write_line(f"return {struct_name}(")
        #     init_args_writer = from_span_writer.indented()
        #     for member in struct.members:
        #         member_name = pascal_to_snake(member.name)
        #         if member.type.name == "VkStructureType" and member.value is not None:
        #             pass
        #         elif member.name in count_name_to_c_member_name:
        #             span_name = pascal_to_snake(count_name_to_c_member_name[member.name]).removeprefix("p_")
        #             init_args_writer.write_line(f"{member_name} = len({span_name}),")
        #         elif member.name in c_member_name_to_count_name:
        #             span_name = member_name.removeprefix("p_")
        #             init_args_writer.write_line(f"{member_name} = {span_name}.unsafe_ptr(),")
        #         else:
        #             init_args_writer.write_line(f"{member_name} = {member_name},")
        #     from_span_writer.write_line(")")
    files["structs.mojo"] = struct_writer.content()
    module_init_writer.write_line("from .structs import *")

    # unions
    union_writer = CodeWriter()
    union_writer.write_lines((
        "from memory import memcpy",
        "from sys import size_of",
        "from .structs import *",
        "\n",
        "alias Ptr = UnsafePointer",
    ))
    union_name_to_align_type: Dict[str, Literal["UInt32", "UInt", "UInt64"]] = {
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
    for union in parsed_registry.unions:
        align_type = union_name_to_align_type[union.name]
        union_name = new_type_name(union.name)
        union_writer.newline(2)
        union_writer.write_line(f"struct {union_name}(ImplicitlyCopyable, Movable):")
        union_body_writer = union_writer.indented()
        union_body_writer.write_line("alias _size = max(")
        union_sizeof_writer = union_body_writer.indented()
        for member_type in union.member_types:
            union_sizeof_writer.write_line(f"size_of[{mojo_type(member_type)}](),")
        union_body_writer.write_lines((
            f")",
            f"alias _AlignType = {align_type}",
            f"alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]",
            f"var _value: Self._InnerType",
        ))
        for member_type in union.member_types:
            union_body_writer.newline()
            union_body_writer.write_lines((
                f"fn __init__(out self, value: {mojo_type(member_type)}):",
                f"    self._value = zero_init[Self._InnerType]()",
                f"    memcpy(",
                f"        dest = Ptr(to=self._value).bitcast[Byte](),",
                f"        src = Ptr(to=value).bitcast[Byte](),",
                f"        count = size_of[{mojo_type(member_type)}](),",
                f"    )",
            ))
    files["unions.mojo"] = union_writer.content()
    module_init_writer.write_line("from .unions import *")

    # functions/commands
    core_fns_writer = CodeWriter()
    core_fns_writer.write_lines((
        "from sys import DLHandle, RTLD",
        "from .fn_types import *",
        "from .handles import *",
        "from .structs import *",
        "from .misc import *",
        "\n",
        "alias Ptr = UnsafePointer",
        "\n",
        "trait GlobalFunctions:",
        "    fn handle(self) -> DLHandle:",
        "        ...",
    ))
    core_fn_imports: Dict[VkLevel, List[str]] = {
        "global": [],
        "instance": [],
        "device": [],
    }
    for command_level, core_versions in parsed_registry.core_commands.items():
        # per-version {level}Functions
        for core_version, versioned_commands in core_versions.items():
            fn_group_name = f"{command_level.capitalize()}FunctionsV{core_version.major}_{core_version.minor}"
            core_fn_imports[command_level].append(fn_group_name)
            traits = (["GlobalFunctions"] if command_level == "global" else []) + ["Copyable", "Movable"]
            trait_section = f"({', '.join(traits)})"
            addition_versions = list({cmd.version for cmd in versioned_commands})
            addition_versions.sort(key=lambda v: (v.major, v.minor))

            core_fns_writer.newline(2)
            core_fns_writer.write_line(f"struct {fn_group_name}{trait_section}:")
            core_fns_body_writer = core_fns_writer.indented()
            if command_level == "global":
                core_fns_body_writer.write_line("var _handle: DLHandle")
            for addition_version in addition_versions:
                req_ver_str = f"{addition_version.major}_{addition_version.minor}"
                core_fns_body_writer.write_line(f"var _v{req_ver_str}: {command_level.capitalize()}FunctionAdditionsV{req_ver_str}")
            core_fns_body_writer.newline()
            if command_level == "global":
                core_fns_body_writer.write_lines((
                    "fn __init__(out self) raises:",
                    '    self._handle = DLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL)',
                ))
            else:
                args = [
                    f"out self",
                    f"global_functions: GlobalFunctionsV{core_version.major}_{core_version.minor}",
                    f"{command_level}: {command_level.capitalize()}",
                ]
                core_fns_body_writer.write_line(f"fn __init__({', '.join(args)}) raises:")
            core_fns_init_body_writer = core_fns_body_writer.indented()
            for addition_version in addition_versions:
                req_ver_str = f"{addition_version.major}_{addition_version.minor}"
                args = "self._handle" if command_level == "global" else f"{command_level}, global_functions.handle()"
                core_fns_init_body_writer.write_line(
                    f"self._v{req_ver_str} = {command_level.capitalize()}FunctionAdditionsV{req_ver_str}({args})"
                )
            if command_level == "global":
                core_fns_body_writer.newline()
                core_fns_body_writer.write_lines((
                    "fn handle(self) -> DLHandle:",
                    "    return self._handle",
                ))
            for versioned_command in versioned_commands:
                generic_function_definition(core_fns_body_writer, versioned_command.command, versioned_command.version)
            
        # per-version {level}FunctionAdditions
        for core_version, versioned_commands in core_versions.items():
            new_commands = [cmd for cmd in versioned_commands if cmd.version == core_version]
            if len(new_commands) == 0:
                continue
            core_fns_writer.newline(2)
            core_fns_writer.write_line(
                f"struct {command_level.capitalize()}FunctionAdditionsV{core_version.major}_{core_version.minor}(Copyable, Movable):"
            )
            fn_addition_body_writer = core_fns_writer.indented()
            for new_command in new_commands:
                mojo_command_name = pascal_to_snake(new_command.command.name).removeprefix("vk_")
                args = ", ".join(f"{arg.name}: {mojo_type(arg.type)}" for arg in new_command.command.args)
                ret_type = mojo_type(new_command.command.return_type)
                sig_ret = f" -> {ret_type}" if ret_type != "NoneType" else ""
                fn_addition_body_writer.write_lines((
                    f"var {mojo_command_name}: fn(",
                    f"    {args}",
                    f"){sig_ret}",
                ))
            fn_addition_body_writer.newline()
            if command_level == "global":
                fn_addition_body_writer.write_line("fn __init__(out self, handle: DLHandle) raises:")
            else:
                fn_addition_body_writer.write_line(
                    f"fn __init__(out self, {command_level}: {command_level.capitalize()}, handle: DLHandle) raises:"
                )
            init_body_writer = fn_addition_body_writer.indented()
            get_proc_level = "instance" if command_level == "global" else command_level
            if len(versioned_commands) == 0:
                init_body_writer.write_line("pass")
            else:
                init_body_writer.write_lines((
                    f"get_{get_proc_level}_proc_addr = handle.get_function[",
                    f"    fn({get_proc_level}: {get_proc_level.capitalize()}, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction",
                    f']("vkGet{get_proc_level.capitalize()}ProcAddr")',
                ))
            for new_command in new_commands:
                mojo_command_name = pascal_to_snake(new_command.command.name).removeprefix("vk_")
                handle_arg = "Instance.NULL" if command_level == "global" else command_level
                init_body_writer.write_lines((
                    f"self.{mojo_command_name} = Ptr(to=get_{get_proc_level}_proc_addr(",
                    f'    {handle_arg}, "{new_command.command.name}".unsafe_ptr()',
                    f")).bitcast[__type_of(self.{mojo_command_name})]()[]",
                ))

    files["core_functions.mojo"] = core_fns_writer.content()
    module_init_writer.write_line("from .core_functions import (")
    module_init_core_fns_writer = module_init_writer.indented()
    line_fn_group_names: List[str] = []
    for command_level_fn_group_names in core_fn_imports.values():
        for fn_group_name in command_level_fn_group_names:
            import_item = f"{fn_group_name},"
            if len(line_fn_group_names) == 0:
                line_fn_group_names.append(import_item)
            elif module_init_core_fns_writer.line_too_long(" ".join(line_fn_group_names + [import_item])):
                module_init_core_fns_writer.write_line(" ".join(line_fn_group_names))
                line_fn_group_names = [import_item]
            else:
                line_fn_group_names.append(import_item)
        module_init_core_fns_writer.write_line(" ".join(line_fn_group_names))
        line_fn_group_names = []
    module_init_writer.write_line(")")

    extension_writers = {extension_tag: CodeWriter() for extension_tag in parsed_registry.extension_commands.keys()}
    for writer in extension_writers.values():
        writer.write_line("from vk.core_functions import GlobalFunctions")
    for extension_tag, extensions in parsed_registry.extension_commands.items():
        for extension in extensions:
            extension_writer = extension_writers[extension_tag]
            extension_name = "".join(word.capitalize() for word in extension.name.split("_")[2:])
            extension_writer.newline(2)
            extension_writer.write_line(f"struct {extension_name}(Copyable, Movable):")
            extension_body_writer = extension_writer.indented()
            for command in extension.commands:
                mojo_command_name = pascal_to_snake(command.name).removeprefix("vk_")
                args = ", ".join(f"{arg.name}: {mojo_type(arg.type)}" for arg in command.args)
                ret_type = mojo_type(command.return_type)
                sig_ret = f" -> {ret_type}" if ret_type != "NoneType" else ""
                extension_body_writer.write_lines((
                    f"var _{mojo_command_name}: fn(",
                    f"    {args}",
                    f"){sig_ret}",
                ))
            extension_body_writer.newline()
            extension_body_writer.write_line(
                f"fn __init__[T: GlobalFunctions](out self, global_fns: T, {extension.type}: {extension.type.capitalize()}):"
            )
            init_body_writer = extension_body_writer.indented()
            init_body_writer.write_lines((
                f"var get_{extension.type}_proc_addr = global_fns.handle().get_function[",
                f"    fn({extension.type}: {extension.type.capitalize()}, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction",
                f']("vkGet{extension.type.capitalize()}ProcAddr")',
            ))
            for command in extension.commands:
                mojo_command_name = pascal_to_snake(command.name).removeprefix("vk_")
                init_body_writer.write_lines((
                    f"self._{mojo_command_name} = Ptr(to=get_{extension.type}_proc_addr(",
                    f'    {extension.type}, "{command.name}".unsafe_ptr()',
                    f")).bitcast[__type_of(self._{mojo_command_name})]()[]",
                ))
            for command in extension.commands:
                generic_function_definition(extension_body_writer, command)

    extensions_module_writer = CodeWriter()
    for extension_tag in parsed_registry.extension_commands.keys():
        extensions_module_writer.write_line(f"import .{extension_tag.lower()}")
    files["extensions/__init__.mojo"] = extensions_module_writer.content()
    for extension_tag, writer in extension_writers.items():
        files[f"extensions/{extension_tag.lower()}.mojo"] = writer.content()
    module_init_writer.write_line("from .extensions import *")

    files["__init__.mojo"] = module_init_writer.content()
    return files


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


def new_type_name(old_name: str) -> str:
    """Convert a Vulkan C type name to a Mojo-friendly alias.

    Performs explicit remapping for common C types and Vulkan
    typedefs, and otherwise removes a leading 'Vk' prefix.

    Args:
        old_name: Original type name from vk.xml.

    Returns:
        A type name suitable for generated APIs.
    """
    mapping = {
        "void": "NoneType",
        "char": "UInt8",
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
        3DAtlas  -> 3_d_atlas
    """
    # Acronym -> word, e.g. "XMLHttp" -> "XML_Http"
    s = re.sub(r'([A-Z]+)([A-Z][a-z])', r'\1_\2', name)
    # lower -> Upper, e.g. "AccessFlags" -> "Access_Flags"
    s = re.sub(r'([a-z])([A-Z])', r'\1_\2', s)
    # lower -> digit only (do NOT split upper -> digit), e.g. "Access3" -> "Access_3", "AV1" stays "AV1"
    s = re.sub(r'([a-z])(\d)', r'\1_\2', s)
    # digit -> letter, e.g. "AV1Thing" -> "AV1_Thing", "3D" -> "3_D"
    s = re.sub(r'(\d)([A-Za-z])', r'\1_\2', s)
    return s.lower()


def mojo_type(vk_type: VkType, no_ptr: bool=False) -> str:
    # vk.xml spells QNX handles as `struct _screen_* *` because it can\u2019t use typedefs.
    # In QNX headers those are always typedef\u2019d to `screen_*_t`, which is what users see.
    # We special-case rewrite them so generated APIs match the public typedefs, not the
    # underscored struct tags.
    if vk_type.name in ("_screen_context", "_screen_window", "_screen_buffer") and vk_type.ptr_level == 1:
        return vk_type.name.removeprefix("_") + "_t"
    # typical path
    t = new_type_name(vk_type.name)
    if vk_type.array_dim is not None:
        return f"InlineArray[{t}, Int({vk_type.array_dim.removeprefix('VK_')})]"
    if not no_ptr:
        for _ in range(vk_type.ptr_level):
            t = f"Ptr[{t}]"
    return t


def generic_function_definition(fn_writer: CodeWriter | CodeWriterView, command: VkCommand, version: Optional[VkVersion]=None):
    # we special case this because it's the only command that deals with the Version type directly
    if command.name == "vkEnumerateInstanceVersion":
        fn_writer.newline()
        fn_writer.write_line("fn enumerate_instance_version(self, mut version: Version) -> Result:")
        body_writer = fn_writer.indented()
        body_writer.write_lines((
            '"""See official vulkan docs for details.\n',
            "https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html",
            '"""',
            "return self._v1_1.enumerate_instance_version(Ptr(to=version).bitcast[UInt32]())",
        ))
        return

    sig_arg_strs: List[str] = ["self"]
    ffi_call_args: List[str] = []
    wrapper_call_args: List[str] = []
    for arg in command.args:
        mojo_arg_name = pascal_to_snake(arg.name)
        is_qnx_type = arg.type.name in ("_screen_context", "_screen_window", "_screen_buffer") and arg.type.ptr_level == 1
        is_required_ptr_to_scalar = arg.type.ptr_level == 1 and arg.length is None and not arg.optional
        if is_qnx_type and arg.const:
            sig_arg_strs.append(f"{mojo_arg_name.removeprefix('p_')}: {mojo_type(arg.type)}")
            ffi_call_args.append(mojo_arg_name.removeprefix('p_'))
            wrapper_call_args.append(mojo_arg_name.removeprefix('p_'))
        elif is_qnx_type and not arg.const:
            sig_arg_strs.append(f"mut {mojo_arg_name.removeprefix('p_')}: {mojo_type(arg.type)}")
            ffi_call_args.append(mojo_arg_name.removeprefix('p_'))
            wrapper_call_args.append(mojo_arg_name.removeprefix('p_'))
        elif is_required_ptr_to_scalar and arg.const:
            sig_arg_strs.append(f"{mojo_arg_name.removeprefix('p_')}: {mojo_type(arg.type, no_ptr=True)}")
            ffi_call_args.append(f"Ptr(to={mojo_arg_name.removeprefix('p_')})")
            wrapper_call_args.append(mojo_arg_name.removeprefix('p_'))
        elif is_required_ptr_to_scalar and not arg.const:
            sig_arg_strs.append(f"mut {mojo_arg_name.removeprefix('p_')}: {mojo_type(arg.type, no_ptr=True)}")
            ffi_call_args.append(f"Ptr(to={mojo_arg_name.removeprefix('p_')})")
            wrapper_call_args.append(mojo_arg_name.removeprefix('p_'))
        else:
            sig_arg_strs.append(f"{mojo_arg_name}: {mojo_type(arg.type)}")
            ffi_call_args.append(mojo_arg_name)
            wrapper_call_args.append(mojo_arg_name)

    # function for wrapping raw c function
    mojo_command_name = pascal_to_snake(command.name).removeprefix("vk_")
    sig_return_section = "" if command.return_type.name == "void" else f" -> {mojo_type(command.return_type)}"

    fn_writer.newline()
    fn_writer.write_fn_sig_or_call(
        initial_line = f"fn {mojo_command_name}(",
        body_lines = sig_arg_strs,
        final_line = f"){sig_return_section}:",
    )
    body_writer = fn_writer.indented()
    body_writer.write_lines((
        '"""See official vulkan docs for details.\n',
        'https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html',
        '"""',
    ))
    version_part = f"v{version.major}_{version.minor}." if version else ""
    body_writer.write_fn_sig_or_call(
        initial_line = f"return self._{version_part}{mojo_command_name}(",
        body_lines = ffi_call_args,
        final_line = ")",
    )

    # convenience function for functions that use the 2 call pattern
    follows_2_call_pattern = False
    if len(command.args) >= 2:
        count_arg = command.args[-2]
        data_arg = command.args[-1]
        follows_2_call_pattern = (
            command.return_type.name in ("VkResult", "void")
            and count_arg.type.ptr_level == 1
            and count_arg.type.name in ("uint32_t", "size_t")
            and not count_arg.const
            and data_arg.type.ptr_level >= 1
            and not data_arg.const
            and data_arg.optional
            and data_arg.length == count_arg.name
        )
    if follows_2_call_pattern:
        has_result = command.return_type.name == "VkResult"
        count_type = mojo_type(command.args[-2].type, no_ptr=True)
        original_list_type = mojo_type(command.args[-1].type, no_ptr=True)
        two_call_sig_arg_strs = sig_arg_strs[:-2]
        if original_list_type == "NoneType":
            list_type = "UInt8"
            get_count_call_args = wrapper_call_args[:-2] + ["count", "Ptr[NoneType]()"]
            fill_buffer_call_args = wrapper_call_args[:-2] + ["count", "list.unsafe_ptr().bitcast[NoneType]()"]
        else:
            list_type = original_list_type
            get_count_call_args = wrapper_call_args[:-2] + ["count", f"Ptr[{list_type}]()"]
            fill_buffer_call_args = wrapper_call_args[:-2] + ["count", "list.unsafe_ptr()"]

        fn_writer.newline()
        if has_result:
            fn_writer.write_fn_sig_or_call(
                initial_line = f"fn {mojo_command_name}(",
                body_lines = two_call_sig_arg_strs,
                final_line = f") -> ListResult[{list_type}]:",
            )
            body_writer = fn_writer.indented()
            body_writer.write_lines((
                f'"""See official vulkan docs for details.\n',
                f'https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html',
                f'"""',
                f"var list = List[{list_type}]()",
                f"var count: {count_type} = 0",
                f"var result = Result.INCOMPLETE",
                f"while result == Result.INCOMPLETE:",
            ))
            loop_writer = body_writer.indented()
            loop_writer.write_fn_sig_or_call(
                initial_line = f"result = self.{mojo_command_name}(",
                body_lines = get_count_call_args,
                final_line = ")",
            )
            loop_writer.write_line("if result == Result.SUCCESS and count > 0:")
            if_block_writer = loop_writer.indented()
            if_block_writer.write_line("list.reserve(Int(count))")
            if_block_writer.write_fn_sig_or_call(
                initial_line = f"result = self.{mojo_command_name}(",
                body_lines = fill_buffer_call_args,
                final_line = ")",
            )
            body_writer.write_lines((
                f"list._len = Int(count)",
                f"return ListResult(list^, result)",
            ))
        else:
            fn_writer.write_fn_sig_or_call(
                initial_line = f"fn {mojo_command_name}(",
                body_lines = two_call_sig_arg_strs,
                final_line = f") -> List[{list_type}]:",
            )
            body_writer = fn_writer.indented()
            body_writer.write_lines((
                f'"""See official vulkan docs for details.\n',
                f'https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html',
                f'"""',
                f"var list = List[{list_type}]()",
                f"var count: {count_type} = 0",
            ))
            body_writer.write_fn_sig_or_call(
                initial_line = f"self.{mojo_command_name}(",
                body_lines = get_count_call_args,
                final_line = ")",
            )
            body_writer.write_line("if count > 0:")
            if_block_writer = body_writer.indented()
            if_block_writer.write_line("list.reserve(Int(count))")
            if_block_writer.write_fn_sig_or_call(
                initial_line = f"self.{mojo_command_name}(",
                body_lines = fill_buffer_call_args,
                final_line = ")",
            )
            body_writer.write_lines((
                f"list._len = Int(count)",
                f"return list^",
            ))


@dataclass
class CodeWriter:
    SPACES_PER_INDENT: ClassVar[int] = 4
    MAX_LINE_LEN: ClassVar[int] = 100
    parts: List[str]
    indent_level: int

    def __init__(self, indent_level: int=0):
        self.parts = []
        self.indent_level = max(0, indent_level)
    
    def content(self) -> str:
        return "".join(self.parts)

    def write_line(self, line: str, extra_indent: int=0):
        self.parts.append(" " * ((self.indent_level + extra_indent) * self.SPACES_PER_INDENT))
        self.parts.append(line)
        self.parts.append("\n")

    def write_lines(self, lines: Iterable[str], extra_indent: int=0):
        for line in lines:
            self.write_line(line, extra_indent)

    def write_fn_sig_or_call(self, initial_line: str, body_lines: Iterable[str], final_line: str):
        one_line_body = ", ".join(body_lines)
        one_liner = f"{initial_line}{one_line_body}{final_line}"
        if not self.line_too_long(one_liner):
            self.write_line(one_liner)
            return
        three_liner_lines = (
            initial_line,
            (" " * self.SPACES_PER_INDENT) + one_line_body,
            final_line,
        )
        if not any(self.line_too_long(line) for line in three_liner_lines):
            self.write_lines(three_liner_lines)
            return
        self.write_line(initial_line)
        self.indented().write_lines(f"{line}," for line in body_lines)
        self.write_line(final_line)
    
    def newline(self, n: int=1):
        self.parts.append("\n" * n)

    def line_too_long(self, line: str, extra_indent: int=0) -> bool:
        line_len = len(line) + (self.indent_level + extra_indent) * self.SPACES_PER_INDENT
        return line_len > self.MAX_LINE_LEN
    
    def indented(self, n_levels: int=1) -> CodeWriterView:
        return CodeWriterView(self, n_levels)


@dataclass
class CodeWriterView:
    base: CodeWriter
    extra_indent: int

    def write_line(self, line: str, extra_indent: int=0):
        self.base.write_line(line, self.extra_indent + extra_indent)
    
    def write_lines(self, lines: Iterable[str], extra_indent: int=0):
        self.base.write_lines(lines, self.extra_indent + extra_indent)
    
    def write_fn_sig_or_call(self, initial_line: str, body_lines: Iterable[str], final_line: str):
        one_line_body = ", ".join(body_lines)
        one_liner = f"{initial_line}{one_line_body}{final_line}"
        if not self.line_too_long(one_liner):
            self.write_line(one_liner)
            return
        three_liner_lines = (
            initial_line,
            (" " * self.base.SPACES_PER_INDENT) + one_line_body,
            final_line,
        )
        if not any(self.line_too_long(line) for line in three_liner_lines):
            self.write_lines(three_liner_lines)
            return
        self.write_line(initial_line)
        self.indented().write_lines(f"{line}," for line in body_lines)
        self.write_line(final_line)

    def newline(self, n: int=1):
        self.base.newline(n)
    
    def line_too_long(self, line: str, extra_indent: int=0) -> bool:
        return self.base.line_too_long(line, self.extra_indent + extra_indent)

    def indented(self, n_levels: int=1) -> CodeWriterView:
        return CodeWriterView(self.base, self.extra_indent + n_levels)


VkLevel = Literal["global", "instance", "device"]


@dataclass
class ParsedRegistry:
    constants: List[VkConstant]
    basetypes: List[VkBasetype]
    external_types: List[VkExternalType | VkEnum]
    enum_aliases: List[VkTypeAlias]
    enums: List[VkEnum]
    flag_aliases: List[VkTypeAlias]
    flags: List[VkFlags]
    handles: List[VkHandle]
    fn_types: List[VkFnType]
    struct_aliases: List[VkTypeAlias]
    structs: List[VkStruct]
    unions: List[VkUnion]
    core_commands: Dict[VkLevel, Dict[VkVersion, List[VkVersionedCommand]]]
    extension_commands: Dict[str, List[VkExtensionCommands]]


@dataclass
class VkConstant:
    name: str
    type: str
    value: str


@dataclass
class VkBasetype:
    name: str
    underlying_type: VkType


@dataclass
class VkExternalType:
    name: str
    underlying_type: Optional[Literal["uint32_t", "size_t"]]


@dataclass
class VkType:
    name: str
    ptr_level: int = 0
    array_dim: Optional[str] = None


@dataclass
class VkTypeAlias:
    declared_type_name: str
    aliased_type_name: str


@dataclass
class VkEnum:
    name: str
    values: List[VkEnumValue]


@dataclass
class VkEnumValue:
    name: str
    value: int


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
    args: List[VkFnArg]


@dataclass
class VkFnArg:
    name: str
    type: VkType
    const: bool


@dataclass
class VkStruct:
    name: str
    members: List[VkStructMember]


@dataclass
class VkStructMember:
    name: str
    type: VkType
    value: Optional[str]
    length: Optional[str]


@dataclass
class VkUnion:
    name: str
    member_types: List[VkType]


@dataclass
class VkVersionedCommand:
    version: VkVersion
    command: VkCommand


@dataclass
class VkExtensionCommands:
    name: str
    type: Literal["instance", "device"]
    commands: List[VkCommand]


@dataclass(frozen=True)
class VkVersion:
    major: int
    minor: int


@dataclass
class VkCommand:
    name: str
    return_type: VkType
    args: List[VkCommandArg]


@dataclass
class VkCommandArg:
    name: str
    type: VkType
    const: bool
    length: Optional[str]
    optional: bool


if __name__ == "__main__":
    main()