from __future__ import annotations
from typing import Dict, List, Set, Tuple, Optional, TypeVar, Literal, Any, Type, Iterable
from dataclasses import dataclass, field
from collections import defaultdict
from xml.etree import ElementTree
from xml.etree.ElementTree import Element
import os
import re
from copy import deepcopy


def main():
    xml_registry = ElementTree.parse("vk.xml").getroot()
    registry = Registry(
        tags=parse_tags(xml_registry),
        types=parse_types(xml_registry),
        constants=parse_constants(xml_registry),
        enums=parse_enums(xml_registry),
        commands=parse_commands(xml_registry),
        features=parse_features(xml_registry),
        extensions=parse_extensions(xml_registry),
    )
    files: Dict[str, str] = {}

    bind_structs(files, registry)
    bind_constants(files, registry)
    bind_funcpointers(files, registry)
    bind_unions(files, registry)
    bind_enums(files, registry)
    bind_flags(files, registry)
    bind_handles(files, registry)
    bind_core_commands(files, registry)
    bind_extension_commands(files, registry)
    # emit_basetypes(files, lower_basetypes(parse_basetypes(registry)))
    # emit_external_types(files, lower_external_types(parse_external_types(registry)))
    # emit_enums(files, lower_enums(parse_enums(registry)))
    # emit_flags(files, lower_flags(parse_flags(registry)))
    # emit_handles(files, lower_handles(parse_handles(registry)))
    # emit_fn_types(files, lower_fn_types(parse_fn_types(registry)))
    # emit_structs(files, lower_structs(parse_structs(registry)))
    # emit_unions(files, lower_unions(parse_unions(registry)))
    # emit_command_loaders(files, lower_commands(parse_commands(registry)))

    OUTPUT_ROOT = "vk"
    for rel_path, content in files.items():
        path = os.path.join(OUTPUT_ROOT, rel_path)
        os.makedirs(os.path.dirname(path), exist_ok=True)
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)


@dataclass
class Registry:
    tags: List[RegistryTag]
    types: List[RegistryType]
    constants: List[RegistryConstant]
    enums: List[RegistryEnumDefinition]
    commands: List[RegistryCommand]
    features: List[RegistryFeature]
    extensions: List[RegistryExtension]


# --------------------------------
# Registry Tags
# --------------------------------


@dataclass
class RegistryTag:
    name: str
    author: str
    contact: str


def parse_tags(xml_registry: Element) -> List[RegistryTag]:
    tags_el = assert_type(Element, xml_registry.find("tags"))
    tags: List[RegistryTag] = []
    for tag_el in tags_el.findall("tag"):
        tags.append(RegistryTag(
            name=tag_el.attrib["name"],
            author=tag_el.attrib["author"],
            contact=tag_el.attrib["contact"],
        ))
    return tags


# --------------------------------
# Registry Types
# --------------------------------


@dataclass
class RegistryAlias:
    category: str
    name: str
    alias: str


@dataclass
class RegistryHandle:
    parent: Optional[str]
    objtypeenum: str
    type: Literal["VK_DEFINE_HANDLE", "VK_DEFINE_NON_DISPATCHABLE_HANDLE"]
    name: str


@dataclass
class RegistryEnum:
    name: str


@dataclass
class RegistryBitmask:
    api: Literal["vulkan", "vulkansc"]
    requires: Optional[str]
    type: Literal["VkFlags", "VkFlags64"]
    name: str


@dataclass
class RegistryStruct:
    name: str
    members: List[RegistryStructMember]


@dataclass
class RegistryStructMember:
    text: str
    optional: List[bool]
    len: Optional[str]


@dataclass
class RegistryFuncpointer:
    text: str


@dataclass
class RegistryUnion:
    name: str
    members: List[str]


RegistryType = (
    RegistryAlias
    | RegistryHandle
    | RegistryEnum
    | RegistryBitmask
    | RegistryStruct
    | RegistryFuncpointer
    | RegistryUnion
)


def parse_types(xml_registry: Element) -> List[RegistryType]:
    types_el = assert_type(Element, xml_registry.find("types"))
    types: List[RegistryType] = []
    for type_el in types_el.findall("type"):
        # Many <type> entries in vk.xml describe external/platform types and omit a category entirely (e.g. Display, HINSTANCE)
        category = type_el.attrib.get("category")
        if category is None:
            continue
        if "alias" in type_el.attrib:
            # For aliases, the name is in the 'name' attribute, not a child element
            name = assert_type(str, type_el.attrib.get("name"))
            types.append(RegistryAlias(
                category=category,
                name=name,
                alias=type_el.attrib["alias"],
            ))
        elif category == "handle":
            type = type_el.findtext("type")
            if type not in ("VK_DEFINE_HANDLE", "VK_DEFINE_NON_DISPATCHABLE_HANDLE"):
                raise ValueError("Unexpected value")
            name = assert_type(str, type_el.findtext("name"))
            types.append(RegistryHandle(
                parent=type_el.attrib.get("parent"),
                objtypeenum=type_el.attrib["objtypeenum"],
                type=type,
                name=name,
            ))
        elif category == "enum":
            name = assert_type(str, type_el.attrib.get("name"))
            types.append(RegistryEnum(name=name))
        elif category == "bitmask":
            api = type_el.attrib.get("api") or "vulkan"
            if api not in ("vulkan", "vulkansc"):
                raise ValueError("Unexpected value")
            # "bitvalues" is an old name for "requires"
            requires = type_el.attrib.get("requires") or type_el.attrib.get("bitvalues")
            type = type_el.findtext("type")
            if type not in ("VkFlags", "VkFlags64"):
                raise ValueError("Unexpected value")
            name = assert_type(str, type_el.findtext("name"))
            types.append(RegistryBitmask(
                api=api,
                requires=requires,
                type=type,
                name=name,
            ))
        elif category == "struct":
            name = type_el.attrib["name"]
            struct_members: List[RegistryStructMember] = []
            for member_el in type_el.findall("member"):
                optional = [s == "true" for s in (member_el.get("optional") or "").split(",")]
                struct_members.append(RegistryStructMember(
                    text="".join(member_el.itertext()).strip(),
                    optional=optional,
                    len=member_el.attrib.get("len"),
                ))
            types.append(RegistryStruct(name=name, members=struct_members))
        elif category == "funcpointer":
            types.append(RegistryFuncpointer("".join(type_el.itertext())))
        elif category == "union":
            name = type_el.attrib["name"]
            union_members = ["".join(member_el.itertext()) for member_el in type_el.findall("member")]
            types.append(RegistryUnion(name, union_members))
    return types


# --------------------------------
# Registry Constants
# --------------------------------


@dataclass
class RegistryConstant:
    """A constant from the API Constants section of vk.xml."""
    name: str
    type: str
    value: str
    comment: Optional[str]


def parse_constants(xml_registry: Element) -> List[RegistryConstant]:
    """Parse the API Constants section from vk.xml.
    
    Args:
        xml_registry: The root <registry> element of vk.xml.
        
    Returns:
        A list of RegistryConstant objects.
    """
    enums_el = assert_type(Element, xml_registry.find("enums[@name='API Constants']"))
    return [
        RegistryConstant(
            name=assert_type(str, enum_el.attrib.get("name")),
            type=assert_type(str, enum_el.attrib.get("type")),
            value=assert_type(str, enum_el.attrib.get("value")),
            comment=enum_el.attrib.get("comment"),
        )
        for enum_el in enums_el.findall("enum")
    ]


# --------------------------------
# Registry Enums
# --------------------------------


@dataclass
class RegistryEnumDefinition:
    name: str
    type: Literal["enum", "bitmask"]
    bitwidth: Literal[32, 64]
    values: List[RegistryEnumerator]


@dataclass
class RegistryValueEnumerator:
    name: str
    value: int
    comment: Optional[str]


@dataclass
class RegistryBitposEnumerator:
    name: str
    bitpos: int
    comment: Optional[str]


@dataclass
class RegistryEnumeratorAlias:
    name: str
    alias: str
    comment: Optional[str]


RegistryEnumerator = RegistryValueEnumerator | RegistryBitposEnumerator | RegistryEnumeratorAlias


def parse_enums(xml_registry: Element) -> List[RegistryEnumDefinition]:
    """Parse all <enums> blocks from the Vulkan registry.

    This extracts both regular enumerations (type="enum") and bitmask flags
    (type="bitmask"), including their enumerator values, bitpos definitions,
    and aliases.

    Args:
        xml_registry: The root <registry> element of vk.xml.

    Returns:
        A list of RegistryEnumDefinition objects, one for each enum/bitmask
        type found in the registry.
    """
    enums: List[RegistryEnumDefinition] = []
    for enums_el in xml_registry.findall("enums"):
        enums_type = enums_el.attrib.get("type")
        if enums_type not in ("enum", "bitmask"):
            continue
        name = assert_type(str, enums_el.attrib.get("name"))
        bitwidth_attr = enums_el.attrib.get("bitwidth")
        bitwidth: Literal[32, 64] = 64 if bitwidth_attr == "64" else 32
        values: List[RegistryEnumerator] = []
        for enum_el in enums_el.findall("enum"):
            if enum_el.attrib.get("deprecated") is not None:
                continue
            enum_name = assert_type(str, enum_el.attrib.get("name"))
            comment = enum_el.attrib.get("comment")
            if "alias" in enum_el.attrib:
                alias = assert_type(str, enum_el.attrib.get("alias"))
                values.append(RegistryEnumeratorAlias(name=enum_name, alias=alias, comment=comment))
            elif "bitpos" in enum_el.attrib:
                bitpos = int(enum_el.attrib["bitpos"])
                values.append(RegistryBitposEnumerator(name=enum_name, bitpos=bitpos, comment=comment))
            elif "value" in enum_el.attrib:
                value_str = enum_el.attrib["value"]
                if value_str.startswith("0x") or value_str.startswith("-0x"):
                    value = int(value_str, 16)
                else:
                    value = int(value_str)
                values.append(RegistryValueEnumerator(name=enum_name, value=value, comment=comment))
        enums.append(RegistryEnumDefinition(
            name=name,
            type=enums_type,
            bitwidth=bitwidth,
            values=values,
        ))
    return enums


# --------------------------------
# Registry Commands
# --------------------------------


@dataclass
class RegistryCommand:
    name: str
    return_type: str
    params: List[RegistryCommandParam]


@dataclass
class RegistryCommandParam:
    name: str
    type: str
    text: str
    optional: bool
    len: Optional[str]


def parse_commands(xml_registry: Element) -> List[RegistryCommand]:
    commands_el = assert_type(Element, xml_registry.find("commands"))
    commands: List[RegistryCommand] = []
    for command_el in commands_el.findall("command"):
        if "alias" in command_el.attrib:
            continue
        proto_el = assert_type(Element, command_el.find("proto"))
        return_type = assert_type(str, proto_el.findtext("type"))
        name = assert_type(str, proto_el.findtext("name"))
        params: List[RegistryCommandParam] = []
        for param_el in command_el.findall("param"):
            param_type = assert_type(str, param_el.findtext("type"))
            param_name = assert_type(str, param_el.findtext("name"))
            param_text = "".join(param_el.itertext()).strip()
            optional = param_el.attrib.get("optional") == "true"
            param_len = param_el.attrib.get("len")
            params.append(RegistryCommandParam(param_name, param_type, param_text, optional, param_len))
        commands.append(RegistryCommand(name, return_type, params))
    return commands


# --------------------------------
# Registry Features / Extensions
# --------------------------------


@dataclass
class RegistryRequiredFeature:
    name: str
    struct: str


@dataclass
class RegistryRequiredType:
    name: str


@dataclass
class RegistryRequiredCommand:
    name: str


@dataclass
class RegistryRequiredOffsetEnum:
    name: str
    extends: str
    offset: int
    extnumber: int
    dir: int # 1 or -1
    comment: Optional[str]


@dataclass
class RegistryRequiredBitposEnum:
    name: str
    extends: str
    bitpos: int
    comment: Optional[str]


@dataclass
class RegistryRequiredValueEnum:
    name: str
    extends: str
    value: int
    comment: Optional[str]


@dataclass
class RegistryRequiredEnumAlias:
    name: str
    extends: str
    alias: str
    comment: Optional[str]


RegistryRequirement = (
    RegistryRequiredFeature 
    | RegistryRequiredType
    | RegistryRequiredCommand 
    | RegistryRequiredOffsetEnum
    | RegistryRequiredBitposEnum
    | RegistryRequiredValueEnum
    | RegistryRequiredEnumAlias
)


@dataclass
class RegistryFeature:
    name: str
    number: str
    depends: str
    api: List[Literal["vulkan", "vulkansc"]]
    requires: List[RegistryRequirement]


def parse_features(xml_registry: Element) -> List[RegistryFeature]:
    features: List[RegistryFeature] = []
    for feature_el in xml_registry.findall("feature"):
        name = assert_type(str, feature_el.attrib.get("name"))
        number = assert_type(str, feature_el.attrib.get("number"))
        depends = feature_el.attrib.get("depends") or ""
        api: List[Literal["vulkan", "vulkansc"]] = []
        for api_el in assert_type(str, feature_el.attrib.get("api")).split(","):
            if api_el not in ("vulkan", "vulkansc"):
                raise ValueError("Unexpected api")
            api.append(api_el)
        requires: List[RegistryRequirement] = []
        for require_el in feature_el.findall("require"):
            for type_el in require_el.findall("type"):
                type_name = assert_type(str, type_el.attrib.get("name"))
                requires.append(RegistryRequiredType(type_name))
            for cmd_el in require_el.findall("command"):
                cmd_name = assert_type(str, cmd_el.attrib.get("name"))
                requires.append(RegistryRequiredCommand(cmd_name))
            for enum_el in require_el.findall("enum"):
                enum_name = assert_type(str, enum_el.attrib.get("name"))
                extends = enum_el.attrib.get("extends")
                # Only enum additions that extend an existing enum type are requirements
                if extends is None:
                    continue
                comment = enum_el.attrib.get("comment")
                if "alias" in enum_el.attrib:
                    alias = assert_type(str, enum_el.attrib.get("alias"))
                    requires.append(RegistryRequiredEnumAlias(enum_name, extends, alias, comment))
                elif "bitpos" in enum_el.attrib:
                    bitpos = int(enum_el.attrib["bitpos"])
                    requires.append(RegistryRequiredBitposEnum(enum_name, extends, bitpos, comment))
                elif "offset" in enum_el.attrib:
                    offset = int(enum_el.attrib["offset"])
                    extnumber = int(assert_type(str, enum_el.attrib.get("extnumber")))
                    dir_attr = enum_el.attrib.get("dir")
                    dir_val = -1 if dir_attr == "-" else 1
                    requires.append(RegistryRequiredOffsetEnum(enum_name, extends, offset, extnumber, dir_val, comment))
                elif "value" in enum_el.attrib:
                    value_str = enum_el.attrib["value"]
                    if value_str.startswith("0x") or value_str.startswith("-0x"):
                        value = int(value_str, 16)
                    else:
                        value = int(value_str)
                    requires.append(RegistryRequiredValueEnum(enum_name, extends, value, comment))
        features.append(RegistryFeature(name, number, depends, api, requires))
    return features


@dataclass
class RegistryExtension:
    name: str
    number: int
    type: Optional[Literal["instance", "device"]]
    requires: List[RegistryRequirement]


def parse_extensions(xml_registry: Element) -> List[RegistryExtension]:
    extensions_el = assert_type(Element, xml_registry.find("extensions"))
    extensions: List[RegistryExtension] = []

    for extension_el in extensions_el.findall("extension"):
        supported = assert_type(str, extension_el.attrib.get("supported"))
        if supported == "disabled":
            continue
        name = assert_type(str, extension_el.attrib.get("name"))
        number = int(assert_type(str, extension_el.attrib.get("number")))
        ext_type = extension_el.attrib.get("type")
        if ext_type not in ("instance", "device", None):
            raise ValueError("Unexpected type value")
        requires: List[RegistryRequirement] = []
        for require_el in extension_el.findall("require"):
            for type_el in require_el.findall("type"):
                type_name = assert_type(str, type_el.attrib.get("name"))
                requires.append(RegistryRequiredType(type_name))
            for cmd_el in require_el.findall("command"):
                cmd_name = assert_type(str, cmd_el.attrib.get("name"))
                requires.append(RegistryRequiredCommand(cmd_name))
            for enum_el in require_el.findall("enum"):
                enum_name = assert_type(str, enum_el.attrib.get("name"))
                extends = enum_el.attrib.get("extends")
                # Only enum additions that extend an existing enum type are requirements
                if extends is None:
                    continue
                comment = enum_el.attrib.get("comment")
                if "alias" in enum_el.attrib:
                    alias = assert_type(str, enum_el.attrib.get("alias"))
                    requires.append(RegistryRequiredEnumAlias(enum_name, extends, alias, comment))
                elif "bitpos" in enum_el.attrib:
                    bitpos = int(enum_el.attrib["bitpos"])
                    requires.append(RegistryRequiredBitposEnum(enum_name, extends, bitpos, comment))
                elif "offset" in enum_el.attrib:
                    offset = int(enum_el.attrib["offset"])
                    extnumber = int(enum_el.attrib.get("extnumber", str(number)))
                    dir_attr = enum_el.attrib.get("dir")
                    dir_val = -1 if dir_attr == "-" else 1
                    requires.append(RegistryRequiredOffsetEnum(enum_name, extends, offset, extnumber, dir_val, comment))
                elif "value" in enum_el.attrib:
                    value_str = enum_el.attrib["value"]
                    if value_str.startswith("0x") or value_str.startswith("-0x"):
                        value = int(value_str, 16)
                    else:
                        value = int(value_str)
                    requires.append(RegistryRequiredValueEnum(enum_name, extends, value, comment))
        extensions.append(RegistryExtension(name, number, ext_type, requires))
    return extensions


# --------------------------------
# Types
# --------------------------------


MojoOriginLiteral = Literal["MutOrigin.external", "ImmutOrigin.external", "MutAnyOrigin", "ImmutAnyOrigin"]


@dataclass
class MojoBaseType:
    name: str
    parameters: List[MojoOriginLiteral | MojoParametricArgumentType | str] = field(default_factory=list) # type: ignore[reportUnknownVariableType]

    def __str__(self) -> str:
        if len(self.parameters) != 0:
            params_str = ", ".join([str(param) for param in self.parameters])
            return f"{self.name}[{params_str}]"
        return self.name


@dataclass
class MojoPointerType:
    pointee_type: MojoType
    origin: MojoOriginLiteral | MojoParametricArgumentType

    def __str__(self) -> str:
        return f"Ptr[{self.pointee_type}, {self.origin}]"


@dataclass
class MojoArrayType:
    element_type: MojoType
    length: str

    def __str__(self) -> str:
        return f"InlineArray[{self.element_type}, {self.length}]"


@dataclass
class MojoFnType:
    return_type: MojoType
    args: List[MojoArgument]

    def __str__(self) -> str:
        returns_none = isinstance(self.return_type, MojoBaseType) and self.return_type.name == "NoneType"
        return emit_fn_like(
            "fn",
            [str(arg) for arg in self.args],
            suffix="" if returns_none else f" -> {self.return_type}",
            no_one_liner=True,
        )


@dataclass
class MojoParametricArgumentType:
    name: str
    type: str # this could probably be modeled better

    def __str__(self) -> str:
        return self.name


MojoType = MojoBaseType | MojoPointerType | MojoArrayType | MojoFnType | MojoParametricArgumentType


@dataclass
class MojoTypeAlias:
    name: str
    alias: str

    def __str__(self) -> str:
        return f"comptime {self.name} = {self.alias}\n"


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


# --------------------------------
# Structs
# --------------------------------


@dataclass
class MojoStruct:
    name: str
    traits: List[str]
    fields: List[MojoField]
    methods: List[MojoMethod]

    def __str__(self) -> str:
        parts: List[str] = []
        traits_part = "" if len(self.traits) == 0 else f"({', '.join(self.traits)})"
        parts.append(f"struct {self.name}{traits_part}:\n")
        for field in self.fields:
            parts.append(f"    {field}\n")
        for method in self.methods:
            parts.append("\n")
            parts.append(str(method))
        return "".join(parts)


@dataclass
class MojoField:
    name: str
    type: MojoType

    def __str__(self) -> str:
        return f"var {self.name}: {self.type}"


@dataclass
class MojoMethod:
    name: str
    return_type: MojoType
    self_ref_kind: Literal["ref", "mut", "out"]
    arguments: List[MojoArgument]
    body_lines: List[str]
    docstring_lines: List[str]
    raises: bool = False

    def __str__(self) -> str:
        returns_none = isinstance(self.return_type, MojoBaseType) and self.return_type.name == "NoneType"
        parameters: List[str] = []
        for argument in self.arguments:
            parameters.extend(self._get_method_parameters_for_argument_type(argument.type))
        parts: List[str] = []
        self_arg = "self" if self.self_ref_kind == "ref" else f"{self.self_ref_kind} self"
        raises_part = " raises" if self.raises else ""
        return_part = "" if returns_none else f" -> {self.return_type}"
        suffix = f"{raises_part}{return_part}:\n"
        parts.append(emit_fn_like(
            f"fn {self.name}",
            [self_arg] + [str(arg) for arg in self.arguments],
            suffix=suffix,
            parameters=[param for param in parameters],
            base_indent_level=1,
        ))
        if len(self.docstring_lines) != 0:
            parts.append(f'        """{self.docstring_lines[0]}\n')
            for line in self.docstring_lines[1:]:
                parts.append(f"        {line}\n")
            parts.append('        """\n')
        for line in self.body_lines:
            parts.append(f"        {line}\n")
        return "".join(parts)
    
    @classmethod
    def _get_method_parameters_for_argument_type(cls, type: MojoType) -> List[str]:
        parameters: List[str] = []
        if isinstance(type, MojoParametricArgumentType):
            parameters.append(f"{type.name}: {type.type}")
        elif isinstance(type, MojoBaseType):
            for parameter in type.parameters:
                if isinstance(parameter, MojoParametricArgumentType):
                    parameters.append(f"{parameter.name}: {parameter.type}")
        elif isinstance(type, MojoPointerType) and isinstance(type.origin, MojoParametricArgumentType):
            parameters.append(f"{type.origin.name}: {type.origin.type}")
            parameters.extend(cls._get_method_parameters_for_argument_type(type.pointee_type))
        return parameters


@dataclass
class MojoArgument:
    name: str
    type: MojoType
    mut: bool = False

    def __str__(self) -> str:
        mut_part = "mut " if self.mut else ""
        return f"{mut_part}{self.name}: {self.type}"


@dataclass
class MojoPhysicalField:
    name: str
    type: MojoType
    packed: bool


@dataclass
class MojoLogicalField:
    name: str
    type: MojoType
    packing_data: Optional[FieldPackingData]


@dataclass
class FieldPackingData:
    group_index: int
    bit_width: int
    bit_offset: int


def parse_members(members: List[RegistryStructMember]) -> Tuple[List[MojoPhysicalField], List[MojoLogicalField]]:
    physical_fields: List[MojoPhysicalField] = []
    logical_fields: List[MojoLogicalField] = []
    packed_group_index = 0
    packed_offset = 0
    packed_active = False

    for member in members:
        decl = parse_declarator(member.text)
        field_name = pascal_to_snake(decl.name)

        if decl.bit_width is None:
            if packed_active:
                packed_group_index += 1
                packed_offset = 0
                packed_active = False
            physical_fields.append(MojoPhysicalField(
                name=field_name,
                type=decl.type,
                packed=False,
            ))
            logical_fields.append(MojoLogicalField(
                name=field_name,
                type=decl.type,
                packing_data=None,
            ))
            continue

        width = decl.bit_width
        if not packed_active:
            packed_active = True
            packed_offset = 0
            physical_fields.append(MojoPhysicalField(
                name=f"_packed{packed_group_index}",
                type=MojoBaseType("UInt32"),
                packed=True,
            ))
        if packed_offset + width > 32:
            packed_group_index += 1
            packed_offset = 0
            physical_fields.append(MojoPhysicalField(
                name=f"_packed{packed_group_index}",
                type=MojoBaseType("UInt32"),
                packed=True,
            ))
        logical_fields.append(MojoLogicalField(
            name=field_name,
            type=MojoBaseType("UInt32"),
            packing_data=FieldPackingData(
                group_index=packed_group_index,
                bit_width=width,
                bit_offset=packed_offset,
            ),
        ))
        packed_offset += width
        if packed_offset == 32:
            packed_group_index += 1
            packed_offset = 0
            packed_active = False
        
    return physical_fields, logical_fields


def bind_structs(files: Dict[str, str], registry: Registry):
    # lower aliases
    aliases: List[MojoTypeAlias] = []
    for registry_type in registry.types:
        if not isinstance(registry_type, RegistryAlias) or registry_type.category != "struct":
            continue
        registry_alias = registry_type
        aliases.append(MojoTypeAlias(
            name=c_type_name_to_mojo(registry_alias.name),
            alias=c_type_name_to_mojo(registry_type.alias),
        ))

    # lower structs
    structs: List[MojoStruct] = []
    for registry_type in registry.types:
        if not isinstance(registry_type, RegistryStruct):
            continue
        registry_struct = registry_type

        physical_fields, logical_fields = parse_members(registry_struct.members)
        fields = [MojoField(field.name, field.type) for field in physical_fields]
        init_body_lines: List[str] = []
        for field in physical_fields:
            init_value = "0" if field.packed else field.name
            init_body_lines.append(f"self.{field.name} = {init_value}")
        for field in logical_fields:
            if field.packing_data is not None:
                init_body_lines.append(f"self.set_{field.name}({field.name})")
        arguments = [MojoArgument(field.name, field.type) for field in logical_fields]
        methods: List[MojoMethod] = []
        methods.append(MojoMethod(
            name="__init__",
            return_type=MojoBaseType("NoneType"),
            self_ref_kind="out",
            arguments=arguments,
            body_lines=init_body_lines,
            docstring_lines=[],
        ))
        # getters and setters for packed fields
        for field in logical_fields:
            if field.packing_data is None:
                continue
            physical_field_name = f"_packed{field.packing_data.group_index}"
            width = field.packing_data.bit_width
            offset = field.packing_data.bit_offset
            methods.append(MojoMethod(
                name=f"get_{field.name}",
                return_type=MojoBaseType("UInt32"),
                self_ref_kind="ref",
                arguments=[],
                body_lines=[f"return get_packed_value[width={width}, offset={offset}](self.{physical_field_name})"],
                docstring_lines=[],
            ))
            methods.append(MojoMethod(
                name=f"set_{field.name}",
                return_type=MojoBaseType("NoneType"),
                self_ref_kind="mut",
                arguments=[MojoArgument("new_value", MojoBaseType("UInt32"))],
                body_lines=[f"set_packed_value[width={width}, offset={offset}](self.{physical_field_name}, new_value)"],
                docstring_lines=[],
            ))
        structs.append(MojoStruct(
            name=c_type_name_to_mojo(registry_struct.name),
            traits=["Copyable"],
            fields=fields,
            methods=methods,
        ))

    # emission
    parts: List[str] = []
    parts.append(
        # "from sys.ffi import CStringSlice, c_char\n"
        # "from .constants import *\n"
        # "from .basetypes import *\n"
        # "from .external_types import *\n"
        # "from .enums import *\n"
        # "from .flags import *\n"
        # "from .handles import *\n"
        # "from .fn_types import *\n"
        # "from .unions import *\n"
        # "from .misc import *\n"
        "\n\n"
        "comptime Ptr = UnsafePointer\n"
        "\n\n"
    )
    for alias in aliases:
        parts.append(str(alias))
    for struct in structs:
        parts.append("\n\n")
        parts.append(str(struct))
    files["structs.mojo"] = "".join(parts)


# --------------------------------
# Constants
# --------------------------------


@dataclass
class MojoConstant:
    """A lowered Mojo constant."""
    name: str
    type: str
    value: str
    comment: Optional[str]

    def __str__(self) -> str:
        comment_part = f" # {self.comment}" if self.comment is not None else ""
        return f"comptime {self.name}: {self.type} = {self.value}{comment_part}\n"


def bind_constants(files: Dict[str, str], registry: Registry):
    """Generate Mojo constants file from parsed API constants."""
    # Lower constants
    constants: List[MojoConstant] = []
    for constant in registry.constants:
        name = constant.name.removeprefix("VK_")
        type = c_type_name_to_mojo(constant.type)
        value = constant.value
        match = re.match(r'^\(~(\d+)([UL]*)\)$', value)
        if match:
            num = match.group(1)
            suffix = match.group(2)
            mojo_type = "UInt64" if "L" in suffix else "UInt32"
            value = f"~{mojo_type}({num})"
        elif constant.type == "float":
            value = value.rstrip("F")
        constants.append(MojoConstant(
            name=name,
            type=type,
            value=value,
            comment=constant.comment,
        ))
    
    # Emission
    parts: List[str] = []
    for constant in constants:
        parts.append(str(constant))
    files["constants.mojo"] = "".join(parts)


# --------------------------------
# Basetypes
# --------------------------------


# --------------------------------
# External Types
# --------------------------------


# --------------------------------
# Funcpointers
# --------------------------------


@dataclass
class MojoFuncpointer:
    name: str
    return_type: MojoType
    args: List[MojoArgument]

    def __str__(self) -> str:
        returns_none = isinstance(self.return_type, MojoBaseType) and self.return_type.name == "NoneType"
        return emit_fn_like(
            f"comptime {self.name} = fn",
            [str(arg) for arg in self.args],
            suffix="" if returns_none else f" -> {self.return_type}"
        )


def bind_funcpointers(files: Dict[str, str], registry: Registry):
    # lower funcpointers
    funcpointers: List[MojoFuncpointer] = []
    fp_re = re.compile(
        r"""^typedef\s
            ((?P<ret>.+)\n)?
            \(VKAPI_PTR\s\*(?P<name>[A-Za-z_][A-Za-z0-9_]*)\)
            \((?P<args>.*?)\);$
        """,
        re.S | re.X,
    )
    for registry_type in registry.types:
        if not isinstance(registry_type, RegistryFuncpointer):
            continue
        funcpointer = registry_type
        m = fp_re.match(funcpointer.text)
        if not m:
            raise ValueError(f"Unrecognized funcpointer typedef: {funcpointer.text!r}")
        
        ret_text = m.group("ret")
        fp_name = m.group("name")
        args_text = m.group("args").strip()
        return_type = parse_declarator(f"{ret_text} __return").type # kinda hacky but whatever

        args: List[MojoArgument] = []
        for arg_text in args_text.split(","):
            if arg_text == "void":
                continue
            arg_text = " ".join(arg_text.split())
            arg_decl = parse_declarator(arg_text)
            args.append(MojoArgument(
                name=pascal_to_snake(arg_decl.name),
                type=arg_decl.type,
            ))
        funcpointers.append(MojoFuncpointer(
            name=c_type_name_to_mojo(fp_name),
            return_type=return_type,
            args=args,
        ))

    # emission
    parts: List[str] = []
    for funcpointer in funcpointers:
        parts.append("\n\n")
        parts.append(str(funcpointer))
    files["fn_types"] = "".join(parts) # TODO: change this file to `funcpointers.mojo`


# --------------------------------
# Unions
# --------------------------------


@dataclass
class MojoUnion:
    name: str
    align_type: Literal["UInt32", "UInt64", "UInt"]
    members: List[MojoUnionMember]

    def __str__(self) -> str:
        parts: List[str] = []
        parts.append("".join((
            f"\n\n",
            f"struct {self.name}(ImplicitlyCopyable):\n",
            f"    comptime _size = max(\n",
            *(f"        size_of[{member.type}](),\n" for member in self.members),
            f"    )\n",
            f"    comptime _AlignType = {self.align_type}\n",
            f"    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]\n",
            f"    var _value: Self._InnerType\n",
        )))
        for member in self.members:
            parts.append(
                f"\n"
                f"    fn __init__(out self, {member.name}: {member.type}):\n"
                f"        self._value = zero_init[Self._InnerType]()\n"
                f"        memcpy(\n"
                f"            dest = Ptr(to=self._value).bitcast[Byte](),\n"
                f"            src = Ptr(to={member.name}).bitcast[Byte](),\n"
                f"            count = size_of[{member.type}](),\n"
                f"        )\n"
            )
        return "".join(parts)


@dataclass
class MojoUnionMember:
    name: str
    type: MojoType


def bind_unions(files: Dict[str, str], registry: Registry):
    # Hardcode these since there aren't many
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
    # lower aliases
    aliases: List[MojoTypeAlias] = []
    for registry_type in registry.types:
        if not isinstance(registry_type, RegistryAlias) or registry_type.category != "union":
            continue
        aliases.append(MojoTypeAlias(
            name=c_type_name_to_mojo(registry_type.name),
            alias=c_type_name_to_mojo(registry_type.alias),
        ))

    # lower unions
    unions: List[MojoUnion] = []
    for registry_type in registry.types:
        if not isinstance(registry_type, RegistryUnion):
            continue
        union_name = c_type_name_to_mojo(registry_type.name)
        align_type = UNION_NAME_TO_ALIGN_TYPE[union_name]
        members: List[MojoUnionMember] = []
        for member_text in registry_type.members:
            decl = parse_declarator(member_text.strip())
            members.append(MojoUnionMember(decl.name, decl.type))
        unions.append(MojoUnion(
            name=union_name,
            align_type=align_type,
            members=members,
        ))

    # emission
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
        parts.append("\n\n")
        parts.append(str(union))
    files["unions"] = "".join(parts)


# --------------------------------
# Enums
# --------------------------------


@dataclass
class MojoEnum:
    name: str
    underlying_type: Literal["Int32", "Int64"]
    values: List[MojoEnumValue]

    def __str__(self) -> str:
        if self.name == "Result":
            return self.emit_result()
        parts: List[str] = []
        parts.append(
            f'@register_passable("trivial")\n'
            f"struct {self.name}(Equatable):\n"
            f"    var _value: {self.underlying_type}\n"
            f"\n"
            f"    fn __init__(out self, *, value: {self.underlying_type}):\n"
            f"        self._value = value\n"
            f"\n"
            f"    fn value(self) -> {self.underlying_type}:\n"
            f"        return self._value\n"
            f"\n"
            f"    fn __eq__(self, other: Self) -> Bool:\n"
            f"        return self._value == other._value\n"
            f"\n"
        )
        for value in self.values:
            parts.append(f"    comptime {value.name} = {self.name}(value = {value.value})\n")
        return "".join(parts)
    
    def emit_result(self) -> str:
        parts: List[str] = []
        parts.append(
            '@register_passable("trivial")\n'
            "struct Result(Equatable, Writable):\n"
            "    var _value: Int32\n"
            "\n"
            "    comptime _descriptions: Dict[Int32, StaticString] = {\n"
        )
        for value in self.values:
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
        for value in self.values:
            parts.append(f"    comptime {value.name} = {self.name}(value = {value.value})\n")
        return "".join(parts)


@dataclass
class MojoEnumValue:
    name: str
    value: int
    comment: Optional[str]
    result_error_message: Optional[str]


def extension_enum_value(extnumber: int, offset: int, direction: int) -> int:
    BASE = 1_000_000_000
    RANGE_SIZE = 1000
    value = BASE + (extnumber - 1) * RANGE_SIZE + offset
    return value * direction


def strip_enum_value_prefix(enum_name: str, value_name: str, tags: List[RegistryTag]) -> str:
    """Convert a Vulkan enum value name to a Mojo-friendly constant name.
    
    Examples:
        VkResult, VK_SUCCESS -> SUCCESS
        VkFormat, VK_FORMAT_R8G8B8A8_UNORM -> R8G8B8A8_UNORM
        VkAccessFlagBits2, VK_ACCESS_2_NONE -> NONE
        VkDebugReportFlagBitsEXT, VK_DEBUG_REPORT_INFORMATION_BIT_EXT -> INFORMATION_BIT
    """
    # calculate prefix
    # VkResult -> VK_RESULT_, VkFormat -> VK_FORMAT_, VkAccessFlagBits2 -> VK_ACCESS_
    tag_names = sorted([tag.name for tag in tags], key=lambda tag: len(tag), reverse=True)
    base_name = enum_name
    for tag in tag_names:
        if base_name.endswith(tag):
            base_name = base_name.removesuffix(tag)
            break
    base_name = base_name.removesuffix("FlagBits").replace("FlagBits2", "2")
    prefix = pascal_to_snake(base_name).upper() + "_"
    
    # Strip the prefix from the value name
    prefix = prefix if value_name.startswith(prefix) else "VK_"
    result = value_name.removeprefix(prefix)
    return result


def bind_enums(files: Dict[str, str], registry: Registry):
    # collect type aliases
    aliases: List[MojoTypeAlias] = []
    for registry_type in registry.types:
        if isinstance(registry_type, RegistryAlias) and registry_type.category == "enum":
            aliases.append(MojoTypeAlias(
                name=c_type_name_to_mojo(registry_type.name),
                alias=c_type_name_to_mojo(registry_type.alias),
            ))

    # Build a map of enum name -> list of additional enumerators from features/extensions
    additional_values: Dict[str, List[RegistryEnumerator]] = defaultdict(list)
    for feature in registry.features:
        for req in feature.requires:
            if isinstance(req, RegistryRequiredOffsetEnum):
                value = extension_enum_value(req.extnumber, req.offset, req.dir)
                additional_value = RegistryValueEnumerator(name=req.name, value=value, comment=req.comment)
                additional_values[req.extends].append(additional_value)
            elif isinstance(req, RegistryRequiredBitposEnum):
                additional_value = RegistryBitposEnumerator(name=req.name, bitpos=req.bitpos, comment=req.comment)
                additional_values[req.extends].append(additional_value)
            elif isinstance(req, RegistryRequiredValueEnum):
                additional_value = RegistryValueEnumerator(name=req.name, value=req.value, comment=req.comment)
                additional_values[req.extends].append(additional_value)
            elif isinstance(req, RegistryRequiredEnumAlias):
                additional_value = RegistryEnumeratorAlias(name=req.name, alias=req.alias, comment=req.comment)
                additional_values[req.extends].append(additional_value)
    for extension in registry.extensions:
        for req in extension.requires:
            if isinstance(req, RegistryRequiredOffsetEnum):
                value = extension_enum_value(req.extnumber, req.offset, req.dir)
                additional_value = RegistryValueEnumerator(name=req.name, value=value, comment=req.comment)
                additional_values[req.extends].append(additional_value)
            elif isinstance(req, RegistryRequiredBitposEnum):
                additional_value = RegistryBitposEnumerator(name=req.name, bitpos=req.bitpos, comment=req.comment)
                additional_values[req.extends].append(additional_value)
            elif isinstance(req, RegistryRequiredValueEnum):
                additional_value = RegistryValueEnumerator(name=req.name, value=req.value, comment=req.comment)
                additional_values[req.extends].append(additional_value)
            elif isinstance(req, RegistryRequiredEnumAlias):
                additional_value = RegistryEnumeratorAlias(name=req.name, alias=req.alias, comment=req.comment)
                additional_values[req.extends].append(additional_value)

    enums: List[MojoEnum] = []
    for enum_def in registry.enums:
        if not enum_def.type == "enum":
            continue
        
        # Collect all non-alias values and resolve aliases
        all_enumerators = list(enum_def.values) + additional_values.get(enum_def.name, [])
        name_to_value: Dict[str, int] = {}
        for enumerator in all_enumerators:
            if isinstance(enumerator, RegistryValueEnumerator):
                name_to_value[enumerator.name] = enumerator.value
            elif isinstance(enumerator, RegistryBitposEnumerator):
                name_to_value[enumerator.name] = 1 << enumerator.bitpos
        
        aliases_to_resolve = [e for e in all_enumerators if isinstance(e, RegistryEnumeratorAlias)]
        aliases_by_name = {e.name: e for e in all_enumerators if isinstance(e, RegistryEnumeratorAlias)}
        for alias_to_resolve in aliases_to_resolve:
            alias = alias_to_resolve
            while alias.alias not in name_to_value:
                alias = aliases_by_name[alias.alias]
            name_to_value[alias_to_resolve.name] = name_to_value[alias.alias]
        
        mojo_values: List[MojoEnumValue] = []
        for enumerator in all_enumerators:
            value = name_to_value[enumerator.name]
            stripped_name = strip_enum_value_prefix(enum_def.name, enumerator.name, registry.tags)
            result_error_message: Optional[str] = None
            if enum_def.name == "VkResult":
                result_error_message = f"{enumerator.name}: {enumerator.comment}"
            mojo_values.append(MojoEnumValue(
                name=stripped_name,
                value=value,
                comment=enumerator.comment,
                result_error_message=result_error_message,
            ))
        
        # Sort by value for consistent output
        mojo_values.sort(key=lambda v: (v.value >= 0, abs(v.value), v.name))
        underlying_type: Literal["Int32", "Int64"] = "Int64" if enum_def.bitwidth == 64 else "Int32"
        enums.append(MojoEnum(
            name=c_type_name_to_mojo(enum_def.name),
            underlying_type=underlying_type,
            values=mojo_values,
        ))

    # Emission
    parts: List[str] = []
    for alias in aliases:
        parts.append(str(alias))
    for enum in enums:
        parts.append("\n\n")
        parts.append(str(enum))
    files["enums.mojo"] = "".join(parts)


# --------------------------------
# Bitsets / Flags
# --------------------------------


@dataclass
class MojoFlags:
    """A Mojo flags type (e.g., FramebufferCreateFlags)."""
    name: str
    bits_name: str
    underlying_type: Literal["UInt32", "UInt64"]
    values: List[MojoFlagValue]

    def __str__(self) -> str:
        parts: List[str] = []
        parts.append(
            f'@register_passable("trivial")\n'
            f"struct {self.name}(Equatable):\n"
            f"    var _value: {self.underlying_type}\n"
            f"\n"
            f"    @implicit\n"
            f"    fn __init__(out self, *bits: {self.bits_name}):\n"
            f"        self._value = 0\n"
            f"        for bit in bits:\n"
            f"            self._value |= bit.value()\n"
            f"\n"
            f"    fn __init__(out self, *, value: {self.underlying_type}):\n"
            f"        self._value = value\n"
            f"\n"
            f"    fn value(self) -> {self.underlying_type}:\n"
            f"        return self._value\n"
            f"\n"
            f"    fn __bool__(self) -> Bool:\n"
            f"        return Bool(self._value)\n"
            f"\n"
            f"    fn __eq__(self, other: Self) -> Bool:\n"
            f"        return self._value == other._value\n"
            f"\n"
            f"    fn __or__(self, other: {self.name}) -> Self:\n"
            f"        return Self(value = self.value() | other.value())\n"
            f"\n"
            f"    fn __ror__(self, other: {self.name}) -> Self:\n"
            f"        return Self(value = self.value() | other.value())\n"
            f"\n"
            f"    fn __and__(self, other: {self.name}) -> Self:\n"
            f"        return Self(value = self.value() & other.value())\n"
            f"\n"
            f"    fn __rand__(self, other: {self.name}) -> Self:\n"
            f"        return Self(value = self.value() & other.value())\n"
            f"\n"
            f"    fn __contains__(self, bit: {self.bits_name}) -> Bool:\n"
            f"        return Bool(self.value() & bit.value())\n"
            f"\n"
            f"    fn is_subset(self, other: {self.name}) -> Bool:\n"
            f"        return self & other == self\n"
            f"\n"
            f"    fn is_superset(self, other: {self.name}) -> Bool:\n"
            f"        return self & other == other\n"
        )
        if self.values:
            parts.append("\n")
            for value in self.values:
                parts.append(f"    comptime {value.name} = Self(value = {self.bits_name}.{value.name}.value())\n")
        return "".join(parts)


@dataclass
class MojoFlagBits:
    """A Mojo flag bits type (e.g., FramebufferCreateFlagBits)."""
    name: str
    flags_name: str
    underlying_type: Literal["UInt32", "UInt64"]
    values: List[MojoFlagValue]

    def __str__(self) -> str:
        parts: List[str] = []
        parts.append(
            f'@register_passable("trivial")\n'
            f"struct {self.name}(Equatable):\n"
            f"    var _value: {self.underlying_type}\n"
            f"\n"
            f"    fn __init__(out self, *, value: {self.underlying_type}):\n"
            f"        self._value = value\n"
            f"\n"
            f"    fn value(self) -> {self.underlying_type}:\n"
            f"        return self._value\n"
            f"\n"
            f"    fn __eq__(self, other: Self) -> Bool:\n"
            f"        return self._value == other._value\n"
            f"\n"
            f"    fn __or__(self, other: Self) -> {self.flags_name}:\n"
            f"        return {self.flags_name}(value = self._value | other._value)\n"
        )
        if self.values:
            parts.append("\n")
            for value in self.values:
                parts.append(f"    comptime {value.name} = Self(value = {value})\n")
        return "".join(parts)


@dataclass
class MojoFlagValue:
    name: str
    value_kind: Literal["value", "bitpos"]
    value: int

    def __str__(self) -> str:
        if self.value_kind == "bitpos":
            return f"1 << {self.value}"
        return str(self.value)


def flag_bit_mojo_name(enum_name: str, value_name: str, tags: List[RegistryTag]) -> str:
    """Convert a Vulkan flag bits value name to a Mojo-friendly constant name.
    
    Examples:
        VkFramebufferCreateFlagBits, VK_FRAMEBUFFER_CREATE_IMAGELESS_BIT -> IMAGELESS
        VkAccessFlagBits2, VK_ACCESS_2_NONE -> NONE
        VkAccessFlagBits2, VK_ACCESS_2_INDIRECT_COMMAND_READ_BIT -> INDIRECT_COMMAND_READ
        VkSampleCountFlagBits, VK_SAMPLE_COUNT_1_BIT -> N_1
        VkIndirectCommandsLayoutUsageFlagBitsNV, VK_INDIRECT_COMMANDS_LAYOUT_USAGE_EXPLICIT_PREPROCESS_BIT_NV -> EXPLICIT_PREPROCESS
        VkClusterAccelerationStructureClusterFlagBitsNV, VK_CLUSTER_ACCELERATION_STRUCTURE_CLUSTER_ALLOW_DISABLE_OPACITY_MICROMAPS_BIT_NV -> ALLOW_DISABLE_OPACITY_MICROMAPS
        VkAccessFlagBits3KHR, VK_ACCESS_3_NONE_KHR -> NONE
    """
    tag_names = sorted([tag.name for tag in tags], key=lambda tag: len(tag), reverse=True)
    prefix = enum_name
    enum_tag: Optional[str] = None
    for tag in tag_names:
        if prefix.endswith(tag):
            enum_tag = tag
            prefix = prefix.removesuffix(tag)
            break
    prefix = re.sub(r'FlagBits(\d+)$', r'\1', prefix)
    prefix = prefix.removesuffix("FlagBits")
    prefix = pascal_to_snake(prefix).upper() + "_"

    result = value_name.removeprefix(prefix)
    result = result.removesuffix(f"_{enum_tag}")
    result = result.removesuffix("_BIT")
    if result and result[0].isdigit():
        result = "N_" + result
    
    return result


def bind_flags(files: Dict[str, str], registry: Registry):
    """Generate Mojo flags file from parsed bitmask types."""
    flags_aliases: List[MojoTypeAlias] = []
    for registry_type in registry.types:
        if isinstance(registry_type, RegistryAlias) and registry_type.category == "bitmask":
            flags_aliases.append(MojoTypeAlias(
                name=c_type_name_to_mojo(registry_type.name),
                alias=c_type_name_to_mojo(registry_type.alias),
            ))

    enum_defs_by_name = {enum_def.name: enum_def for enum_def in registry.enums}
    flags_list: List[MojoFlags] = []
    flagbits_list: List[MojoFlagBits] = []
    for registry_type in registry.types:
        if not isinstance(registry_type, RegistryBitmask):
            continue
        if registry_type.api != "vulkan":
            continue
        
        bitmask = registry_type
        flags_native_name = bitmask.name
        flags_mojo_name = c_type_name_to_mojo(flags_native_name)
        flags_underlying_type = "UInt64" if bitmask.type == "VkFlags64" else "UInt32"
        
        bits_native_name = flags_native_name.replace("Flags", "FlagBits")
        if bitmask.requires is not None and bitmask.requires != bits_native_name:
            raise ValueError("Unexpected value for bitmask.requires")
        bits_mojo_name = c_type_name_to_mojo(bits_native_name)
        
        base_values: List[RegistryEnumerator] = []
        if bits_native_name in enum_defs_by_name:
            base_values = enum_defs_by_name[bits_native_name].values
        
        mojo_values: List[MojoFlagValue] = []
        for enumerator in base_values:
            value_name = flag_bit_mojo_name(bits_native_name, enumerator.name, registry.tags)
            if isinstance(enumerator, RegistryValueEnumerator):
                mojo_values.append(MojoFlagValue(value_name, "value", enumerator.value))
            elif isinstance(enumerator, RegistryBitposEnumerator):
                mojo_values.append(MojoFlagValue(value_name, "bitpos", enumerator.bitpos))
        mojo_values.sort(key=lambda v: (v.value_kind == "bitpos", v.value))
        
        flags_list.append(MojoFlags(
            name=flags_mojo_name,
            bits_name=bits_mojo_name,
            underlying_type=flags_underlying_type,
            values=mojo_values,
        ))
        flagbits_list.append(MojoFlagBits(
            name=bits_mojo_name,
            flags_name=flags_mojo_name,
            underlying_type=flags_underlying_type,
            values=mojo_values,
        ))

    # Emission
    parts: List[str] = []
    for alias in flags_aliases:
        parts.append(str(alias))
    for flags, flagbits in zip(flags_list, flagbits_list):
        parts.append("\n\n")
        parts.append(str(flags))
        parts.append("\n\n")
        parts.append(str(flagbits))
    files["flags.mojo"] = "".join(parts)


# --------------------------------
# Handles
# --------------------------------


@dataclass
class MojoHandle:
    name: str
    underlying_type: Literal["UInt", "UInt64"]

    def __str__(self) -> str:
        return (
            f'@register_passable("trivial")\n'
            f"struct {self.name}(Equatable, Writable):\n"
            f"    var _value: {self.underlying_type}\n"
            f"    comptime NULL = Self(value = 0)\n"
            f"\n"
            f"    fn __init__(out self, *, value: {self.underlying_type}):\n"
            f"        self._value = value\n"
            f"\n"
            f"    fn value(self) -> {self.underlying_type}:\n"
            f"        return self._value\n"
            f"\n"
            f"    fn __eq__(self, other: Self) -> Bool:\n"
            f"        return self._value == other._value\n"
            f"\n"
            f"    fn __bool__(self) -> Bool:\n"
            f"        return self._value != 0\n"
            f"\n"
            f"    fn __str__(self) -> String:\n"
            f"        return hex(self._value)\n"
            f"\n"
            f"    fn write_to(self, mut writer: Some[Writer]):\n"
            f"        writer.write(String(self))\n"
        )


def bind_handles(files: Dict[str, str], registry: Registry):
    # lower aliases
    aliases: List[MojoTypeAlias] = []
    for registry_type in registry.types:
        if not isinstance(registry_type, RegistryAlias) or registry_type.category != "handle":
            continue
        aliases.append(MojoTypeAlias(
            name=c_type_name_to_mojo(registry_type.name),
            alias=c_type_name_to_mojo(registry_type.alias),
        ))

    # lower handles
    handles: List[MojoHandle] = []
    for registry_type in registry.types:
        if not isinstance(registry_type, RegistryHandle):
            continue
        underlying_type: Literal["UInt", "UInt64"] = "UInt" if registry_type.type == "VK_DEFINE_HANDLE" else "UInt64"
        handles.append(MojoHandle(
            name=c_type_name_to_mojo(registry_type.name),
            underlying_type=underlying_type,
        ))

    # emission
    parts: List[str] = []
    for alias in aliases:
        parts.append(str(alias))
    for handle in handles:
        parts.append("\n\n")
        parts.append(str(handle))
    files["handles.mojo"] = "".join(parts)


# --------------------------------
# Commands
# --------------------------------


VkLevel = Literal["global", "instance", "device"]


@dataclass
class Version:
    major: int
    minor: int


@dataclass
class VersionCommands:
    """Commands introduced in a specific Vulkan version at a specific level.
    
    Represents the set of commands that were newly added in a particular API
    version (e.g., 1.1, 1.2) for a given dispatch level (global, instance, device).
    """
    level: VkLevel
    version: Version
    commands: List[RegistryCommand]


@dataclass
class CumulativeVersionCommands:
    """Cumulative set of commands available at a specific version and level.
    
    Represents all commands available up to and including the specified version
    for a given dispatch level, along with version dependencies and the version
    each command was introduced in.
    """
    level: VkLevel
    version: Version
    dependencies: List[Version]
    commands: List[Tuple[Version, RegistryCommand]]


def collect_commands_by_version(
    registry: Registry,
) -> Tuple[List[VersionCommands], List[CumulativeVersionCommands]]:
    # version commands
    commands_by_name = {command.name: command for command in registry.commands}
    version_level_commands: Dict[Tuple[Version, VkLevel], List[RegistryCommand]] = defaultdict(list)
    for feature in registry.features:
        if "vulkan" not in feature.api:
            continue
        version_parts = feature.number.split(".")
        version = Version(int(version_parts[0]), int(version_parts[1]))
        for req in feature.requires:
            if not isinstance(req, RegistryRequiredCommand):
                continue
            command = commands_by_name[req.name]
            first_param_type = command.params[0].type
            if first_param_type in ("VkInstance", "VkPhysicalDevice") or command.name == "get_instance_proc_addr":
                level =  "instance"
            elif first_param_type in ("VkDevice", "VkQueue", "VkCommandBuffer"):
                level =  "device"
            else:
                level = "global"
            version_level_commands[(version, level)].append(command)
    
    version_commands: List[VersionCommands] = []
    for (version, level), commands in sorted(version_level_commands.items()):
        version_commands.append(VersionCommands(level, version, commands))

    # cumulative version commands
    version_commands_by_level: Dict[VkLevel, List[VersionCommands]] = defaultdict(list)
    for vc in version_commands:
        version_commands_by_level[vc.level].append(vc)
    for level in version_commands_by_level:
        version_commands_by_level[level].sort(key=lambda vc: (vc.version.major, vc.version.minor))
    
    cumulative_version_commands: List[CumulativeVersionCommands] = []
    for level, version_commands_list in version_commands_by_level.items():
        cumulative_commands: List[Tuple[Version, RegistryCommand]] = []
        seen_versions: List[Version] = []
        for vc in version_commands_list:
            for command in vc.commands:
                cumulative_commands.append((vc.version, command))
            seen_versions.append(vc.version)
            cumulative_version_commands.append(CumulativeVersionCommands(
                level=level,
                version=vc.version,
                dependencies=list(seen_versions),
                commands=list(cumulative_commands),
            ))
    cumulative_version_commands.sort(key=lambda c: (c.version.major, c.version.minor, c.level))

    return version_commands, cumulative_version_commands


def command_to_mojo_name(registry_command: RegistryCommand) -> str:
    return pascal_to_snake(registry_command.name.removeprefix("vk"))


def command_to_mojo_fn_type(registry_command: RegistryCommand) -> MojoFnType:
    return_type = parse_c_type(registry_command.return_type)
    arguments: List[MojoArgument] = []
    for param in registry_command.params:
        arg_name = pascal_to_snake(param.name)
        arg_type = parse_c_type(param.type)
        arguments.append(MojoArgument(arg_name, arg_type))
    return MojoFnType(return_type, arguments)


def registry_command_to_mojo_methods(registry_command: RegistryCommand, version_added: Optional[Version]=None) -> List[MojoMethod]:
    """Convert a registry command to Mojo method(s).
    
    This function generates wrapper methods that:
    - Convert single pointers to structs/primitives to by-value parameters
    - Add 'mut' modifier for output parameters
    - Generate proper bitcast conversions in the method body
    - Keep double pointers and array pointers as Ptr types
    - Convert const char* to CStringSlice[ImmutAnyOrigin]
    
    Args:
        registry_command: The Vulkan command from the registry
        version_added: If provided, indicates this is a core command added in the given
                      version, and the body should call through self._vX_Y.method_name.
                      If None, assumes extension command calling self.method_name directly.
    """
    methods: List[MojoMethod] = []
    native_name = registry_command.name
    name = command_to_mojo_name(registry_command)
    return_type = parse_c_type(registry_command.return_type)
    
    arguments: List[MojoArgument] = []
    call_args: List[str] = []
    for param in registry_command.params:
        decl = parse_declarator(param.text)
        arg_name = pascal_to_snake(decl.name)
        parsed_type = decl.type

        is_const_char_ptr = (
            isinstance(parsed_type, MojoPointerType)
            and parsed_type.origin == "ImmutOrigin.external"
            and isinstance(parsed_type.pointee_type, MojoBaseType)
            and parsed_type.pointee_type.name == "c_char"
        )
        is_void_ptr = (
            isinstance(parsed_type, MojoPointerType)
            and isinstance(parsed_type.pointee_type, MojoBaseType)
            and parsed_type.pointee_type.name == "NoneType"
        )
        should_strip_ptr = (
            isinstance(parsed_type, MojoPointerType)
            and not is_void_ptr
            and param.len is None
            and not param.optional
        )
        if is_const_char_ptr:
            argument = MojoArgument(arg_name, MojoBaseType("CStringSlice", ["ImmutAnyOrigin"]))
            call_arg = arg_name
        elif should_strip_ptr:
            parsed_type = assert_type(MojoPointerType, parsed_type)
            argument = MojoArgument(arg_name, parsed_type.pointee_type, mut=parsed_type.origin == "MutOrigin.external")
            call_arg = f"Ptr(to={arg_name}).bitcast[{parsed_type.pointee_type}]()[]"
        elif isinstance(parsed_type, MojoPointerType):
            new_origin: MojoOriginLiteral = "MutAnyOrigin" if parsed_type.origin == "MutOrigin.external" else "ImmutAnyOrigin"
            argument = MojoArgument(arg_name, MojoPointerType(parsed_type.pointee_type, new_origin))
            call_arg = arg_name
        else:
            argument = MojoArgument(arg_name, parsed_type)
            call_arg = arg_name
        arguments.append(argument)
        call_args.append(call_arg)
    
    if version_added is not None:
        version_field = f"_v{version_added.major}_{version_added.minor}"
        call_target = f"self.{version_field}.{name}"
    else:
        call_target = f"self.{name}"
    body_lines = emit_fn_like(
        f"return {call_target}",
        call_args,
        suffix="",
        base_indent_level=0,
    ).rstrip("\n").split("\n")

    docstring_lines = [
        'See official vulkan docs for details.',
        '',
        f'https://registry.khronos.org/vulkan/specs/latest/man/html/{native_name}.html',
    ]
    methods.append(MojoMethod(
        name=name,
        return_type=return_type,
        self_ref_kind="ref",
        arguments=arguments,
        body_lines=body_lines,
        docstring_lines=docstring_lines,
    ))

    # two call pattern helper method
    if len(registry_command.params) < 2:
        return methods
    count_param = registry_command.params[-2]
    count_arg_type = parse_c_type(count_param.text)
    data_param = registry_command.params[-1]
    data_arg_type = parse_c_type(data_param.text)
    follows_2_call_pattern = (
        # return type is right
        isinstance(return_type, MojoBaseType)
        and return_type.name in ("Result", "NoneType")
        # count param is right
        and isinstance(count_arg_type, MojoPointerType)
        and count_arg_type.origin == "MutOrigin.external"
        and isinstance(count_arg_type.pointee_type, MojoBaseType)
        and count_arg_type.pointee_type.name in ("UInt32", "UInt")
        # data param is right
        and isinstance(data_arg_type, MojoPointerType)
        and data_arg_type.origin == "MutOrigin.external"
        and data_param.optional
        and data_param.len == count_param.name
    )
    if not follows_2_call_pattern:
        return methods
    returns_result = registry_command.return_type == "VkResult"
    element_type = assert_type(MojoPointerType, data_arg_type).pointee_type
    if element_type == MojoBaseType("NoneType"):
        element_type = MojoBaseType("UInt8")
    element_type_str = str(element_type)
    if returns_result:
        two_call_return_type = MojoBaseType("ListResult", parameters=[element_type_str])
    else:
        two_call_return_type = MojoBaseType("List", parameters=[element_type_str])

    base_call_arg_names = [arg.name for arg in arguments[:-2]]
    two_call_body_lines: List[str] = []
    two_call_body_lines.append(f"var list = List[{element_type_str}]()")
    two_call_body_lines.append("var count: UInt32 = 0")
    
    if returns_result:
        two_call_body_lines.append("var result = Result.INCOMPLETE")
        two_call_body_lines.append("while result == Result.INCOMPLETE:")
        first_call_lines = emit_fn_like(
            f"result = self.{name}",
            base_call_arg_names + ["count", f"Ptr[{element_type_str}, MutOrigin.external]()"],
            suffix="",
            base_indent_level=1,
        ).rstrip("\n").split("\n")
        two_call_body_lines.extend(first_call_lines)
        two_call_body_lines.append("    if result == Result.SUCCESS:")
        two_call_body_lines.append("        list.reserve(Int(count))")
        second_call = emit_fn_like(
            f"result = self.{name}",
            base_call_arg_names + ["count", "list.unsafe_ptr()"],
            suffix="",
            base_indent_level=1,
        ).rstrip("\n").split("\n")
        two_call_body_lines.extend(second_call)
        two_call_body_lines.append("list._len = Int(count)")
        two_call_body_lines.append("return ListResult(list^, result)")
    else:
        first_call_lines = emit_fn_like(
            f"self.{name}",
            base_call_arg_names + ["count", f"Ptr[{element_type_str}, MutAnyOrigin]()"],
            suffix="",
            base_indent_level=0,
        ).rstrip("\n").split("\n")
        two_call_body_lines.extend(first_call_lines)
        two_call_body_lines.append("list.reserve(Int(count))")
        second_call = emit_fn_like(
            f"self.{name}",
            base_call_arg_names + ["count", "list.unsafe_ptr()"],
            suffix="",
        ).rstrip("\n").split("\n")
        two_call_body_lines.extend(second_call)
        two_call_body_lines.append("list._len = Int(count)")
        two_call_body_lines.append("return list^")

    methods.append(MojoMethod(
        name=name,
        return_type=two_call_return_type,
        self_ref_kind="ref",
        arguments=arguments[:-2],
        body_lines=two_call_body_lines,
        docstring_lines=docstring_lines,
    ))

    return methods


def bind_core_commands(files: Dict[str, str], registry: Registry):
    version_commands, cumulative_commands = collect_commands_by_version(registry)
    core_command_addition_loaders: List[MojoStruct] = []
    for vc in version_commands:
        version_suffix = f"{vc.version.major}_{vc.version.minor}"
        level_name = vc.level.capitalize()
        struct_name = f"{level_name}FunctionsV{version_suffix}Additions"
        
        fields: List[MojoField] = []
        for command in vc.commands:
            fields.append(MojoField(
                name=command_to_mojo_name(command),
                type=command_to_mojo_fn_type(command),
            ))
        
        if vc.level == "global":
            init_arguments = [MojoArgument("dlhandle", MojoBaseType("ArcPointer", ["OwnedDLHandle"]))]
            init_body_lines: List[str] = []
            for command in vc.commands:
                mojo_name = command_to_mojo_name(command)
                init_body_lines.extend((
                    f'self.{mojo_name} = dlhandle[].get_function['
                    f'    {command_to_mojo_fn_type(command)}'
                    f']("{command.name}")'
                ))
        else:
            handle_type = "Instance" if vc.level == "instance" else "Device"
            init_arguments = [
                MojoArgument("dlhandle", MojoBaseType("ArcPointer", ["OwnedDLHandle"])),
                MojoArgument(vc.level, MojoBaseType(handle_type)),
            ]
            init_body_lines = [
                f'var get_{vc.level}_proc_addr = dlhandle[].get_function[',
                f'    fn({vc.level}: {handle_type}, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction',
                f']("vkGet{handle_type}ProcAddr")',
            ]
            for command in vc.commands:
                mojo_name = command_to_mojo_name(command)
                init_body_lines.extend((
                    f'self.{mojo_name} = get_{vc.level}_proc_addr('
                    f'    {vc.level}, "{command.name}".unsafe_cstr_ptr()'
                    f').bitcast[type_of(self.{mojo_name})]()',
                ))
        
        init_method = MojoMethod(
            name="__init__",
            return_type=MojoBaseType("NoneType"),
            self_ref_kind="out",
            arguments=init_arguments,
            body_lines=init_body_lines,
            docstring_lines=[],
        )
        core_command_addition_loaders.append(MojoStruct(
            name=struct_name,
            traits=["Copyable"],
            fields=fields,
            methods=[init_method],
        ))

    core_command_loaders: List[MojoStruct] = []
    for cvc in cumulative_commands:
        version_suffix = f"{cvc.version.major}_{cvc.version.minor}"
        level_name = cvc.level.capitalize()
        struct_name = f"{level_name}Functions{version_suffix}"
        
        fields: List[MojoField] = [MojoField("_dlhandle", MojoBaseType("ArcPointer", ["OwnedDLHandle"]))]
        for dep_version in cvc.dependencies:
            dep_suffix = f"{dep_version.major}_{dep_version.minor}"
            addition_type = MojoBaseType(f"{level_name}FunctionsV{dep_suffix}Addition")
            fields.append(MojoField(f"_v{dep_suffix}", addition_type))
        
        if cvc.level == "global":
            init_arguments = []
            init_body_lines = ['self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))']
            for dep_version in cvc.dependencies:
                dep_suffix = f"{dep_version.major}_{dep_version.minor}"
                addition_type = f"{level_name}Functions{dep_suffix}Addition"
                init_body_lines.append(f"self._v{dep_suffix} = {addition_type}(dlhandle)")
        else:
            init_arguments = [
                MojoArgument("dlhandle", MojoBaseType("ArcPointer", ["OwnedDLHandle"])),
                MojoArgument(cvc.level, MojoBaseType(cvc.level.capitalize())),
            ]
            init_body_lines = ["self._dlhandle = dlhandle"]
            for dep_version in cvc.dependencies:
                dep_suffix = f"{dep_version.major}_{dep_version.minor}"
                addition_type = f"{level_name}FunctionsV{dep_suffix}Addition"
                init_body_lines.append(f"self._v{dep_suffix} = {addition_type}(dlhandle, {cvc.level})")
        
        methods: List[MojoMethod] = []
        methods.append(MojoMethod(
            name="__init__",
            return_type=MojoBaseType("NoneType"),
            self_ref_kind="out",
            arguments=init_arguments,
            body_lines=init_body_lines,
            docstring_lines=[],
        ))
        if cvc.level == "global":
            methods.append(MojoMethod(
                name="get_dlhandle",
                return_type=MojoBaseType("ArcPointer", ["OwnedDLHandle"]),
                self_ref_kind="ref",
                arguments=[],
                body_lines=["return self._dlhandle"],
                docstring_lines=[],
            ))
        for version_added, command in cvc.commands:
            methods.extend(registry_command_to_mojo_methods(command, version_added))
        
        core_command_loaders.append(MojoStruct(
            name=struct_name,
            traits=["Copyable"],
            fields=fields,
            methods=methods,
        ))

    # core command loader emission
    core_loader_parts: List[str] = []
    core_loader_parts.append(
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
    for loader in core_command_addition_loaders:
        core_loader_parts.append("\n\n")
        core_loader_parts.append(str(loader))
    for loader in core_command_loaders:
        core_loader_parts.append("\n\n")
        core_loader_parts.append(str(loader))
    files["core_functions.mojo"] = "".join(core_loader_parts)


def bind_extension_commands(files: Dict[str, str], registry: Registry):
    # lowering
    commands_by_name = {command.name: command for command in registry.commands}
    extension_loaders_by_tag: Dict[str, List[MojoStruct]] = defaultdict(list)
    for extension in registry.extensions:
        if extension.type is None:
            continue

        required_commands: List[RegistryCommand] = []
        for requirement in extension.requires:
            if not isinstance(requirement, RegistryRequiredCommand):
                continue
            required_command = commands_by_name[requirement.name]
            required_commands.append(required_command)

        # names look like "VK_TAG_foo_bar"
        tag = extension.name.split("_")[1].lower()
        native_name_prefix = f"VK_{tag.upper()}_"
        name = snake_to_pascal(extension.name.removeprefix(native_name_prefix))
        traits = ["Copyable"]
        arguments = [
            MojoArgument("global_functions", MojoParametricArgumentType("T", "GlobalFunctions")),
            MojoArgument(extension.type, MojoBaseType(extension.type.capitalize())),
        ]
        init_body_lines = ["self._dlhandle = global_functions.get_dlhandle()"]
        for required_command in required_commands:
            init_body_lines.extend((
                f'var get_{extension.type}_proc_addr = global_functions.get_dlhandle()[].get_function[',
                f'    fn({extension.type}: {extension.type.capitalize()}, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction',
                f']("vkGet{extension.type.capitalize()}ProcAddr")',
            ))
        init_method = MojoMethod(
            "__init__",
            MojoBaseType("NoneType"),
            "out",
            arguments=arguments,
            body_lines=init_body_lines,
            docstring_lines=[],
        )
        fields = [MojoField("_dlhandle", MojoBaseType("ArcPointer", ["OwnedDLHandle"]))]
        methods = [init_method]
        for required_command in required_commands:
            fields.append(MojoField(
                name = command_to_mojo_name(required_command),
                type = command_to_mojo_fn_type(required_command),
            ))
            methods.extend(registry_command_to_mojo_methods(required_command))
        extension_loaders_by_tag[tag].append(MojoStruct(name, traits, fields, methods))

    # emission
    extension_module_init_parts = [f"import .{tag}\n" for tag in extension_loaders_by_tag.keys()]
    files["extensions/__init__.mojo"] = "".join(extension_module_init_parts)
    for tag, extension_loaders in extension_loaders_by_tag.items():
        extension_parts: List[str] = []
        extension_parts.append(
            "from sys.ffi import OwnedDLHandle, CStringSlice, c_char\n"
            "from memory import ArcPointer\n"
            "from vk.core_functions import GlobalFunctions\n"
        )
        for loader in extension_loaders:
            extension_parts.append("\n\n")
            extension_parts.append(str(loader))
        files[f"extensions/{tag}.mojo"] = "".join(extension_parts)


# --------------------------------
# Misc / Utils
# --------------------------------


@dataclass
class ParsedDeclarator:
    name: str
    type: MojoType
    bit_width: Optional[int]


def parse_declarator(declarator: str) -> ParsedDeclarator:
    """Parse a vk.xml member/parameter declarator into a Mojo type description.

    This function is intentionally **not** a general-purpose C declarator parser (it
    only supports the restricted patterns found in Vulkan's `vk.xml` for struct/union
    members and the pre-split text used for funcpointer arguments). :contentReference[oaicite:0]{index=0}

    Supported features (in the specific order this parser expects):
      - Optional trailing bit-field width: ``name:N`` (captures ``N`` as ``bit_width``).
      - One or more trailing array dimensions: ``name[DIM][DIM]...`` (captured from
        inner → outer, then wrapped to preserve C array nesting).
      - Pointer stars (``*``) with limited ``const`` handling to infer mutability of
        each pointee level (pointer constness itself is not represented).
      - Strips ``const``, ``struct``, and ``union`` keywords from the base type tokens.
      - Maps the base C type name to a Mojo type name via ``c_type_name_to_mojo``.
      - For array lengths, strips a leading ``"VK_"`` from the dimension string.
      - Special-cases certain QNX Screen handle pseudo-types (e.g. ``_screen_window``)
        by remapping to the corresponding ``screen_*_t`` typedef and treating them as
        non-pointers.

    Args:
        declarator: A C-like declarator string as it appears in `vk.xml` member text,
            such as ``"const VkFoo* bar[VK_MAX]"`` or ``"uint32_t flags:1"``.

    Returns:
        A ``ParsedDeclarator`` containing:
          - ``name``: the declared identifier
          - ``type``: a nested ``MojoType`` (base / pointer / array)
          - ``bit_width``: the bit-field width if present, otherwise ``None``

    Notes:
        Inputs outside this narrow subset (e.g. function declarators, complex nested
        parentheses, qualifiers in unusual positions) are not expected and may be
        parsed incorrectly rather than rejected.
    """
    s = declarator

    bit_width: Optional[int] = None
    m_bit = re.search(r":(\d+)$", s)
    if m_bit is not None:
        bit_width = int(m_bit.group(1))
        s = s[:m_bit.start()]

    array_dims: List[str] = []
    while True:
        m = re.search(r"\[([^\]]+?)\]$", s)
        if m is None:
            break
        array_dims.append(m.group(1))
        s = s[:m.start()]
    
    tokens = s.replace("*", " * ").split()
    name = tokens[-1]
    type_tokens = tokens[:-1]
    star_indices = [i for i, t in enumerate(type_tokens) if t == "*"]
    ptr_level = len(star_indices)
    base_tokens = type_tokens if ptr_level == 0 else type_tokens[:star_indices[0]]
    base_const = "const" in base_tokens
    base_nonconst = [t for t in base_tokens if t not in ("const", "struct", "union")]
    base_name = base_nonconst[-1]

    ptr_consts: List[bool] = []
    for star_idx in star_indices:
        ptr_is_const = star_idx + 1 < len(type_tokens) and type_tokens[star_idx + 1] == "const"
        ptr_consts.append(ptr_is_const)
    pointee_is_const: List[bool] = [] if ptr_level == 0 else ([base_const] + ptr_consts[:-1])

    QNX_SCREEN_HANDLE_MAP = {
        "_screen_context": "screen_context_t",
        "_screen_window": "screen_window_t",
        "_screen_buffer": "screen_buffer_t",
    }
    if ptr_level == 1 and base_name in QNX_SCREEN_HANDLE_MAP:
        base_name = QNX_SCREEN_HANDLE_MAP[base_name]
        ptr_level = 0
        pointee_is_const = []
        array_dims = []

    type: MojoType = MojoBaseType(c_type_name_to_mojo(base_name))
    for i in range(ptr_level):
        origin: MojoOriginLiteral = "MutOrigin.external" if not pointee_is_const[i] else "ImmutOrigin.external"
        type = MojoPointerType(pointee_type=type, origin=origin)
    for dim in array_dims:
        type = MojoArrayType(element_type=type, length=dim.removeprefix("VK_"))
    
    return ParsedDeclarator(name, type, bit_width)


def parse_c_type(c_type_str: str) -> MojoType:
    fake_decl_str = f"{c_type_str} _fakename"
    decl = parse_declarator(fake_decl_str)
    return decl.type


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


def pascal_to_snake(string: str) -> str:
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
    s = re.sub(r'([A-Z]+)([A-Z][a-z])', r'\1_\2', string)
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


def snake_to_pascal(string: str) -> str:
    return "".join((word.capitalize() for word in string.split("_")))


def emit_fn_like(
    prefix: str,
    arguments: Iterable[str],
    *,
    suffix: str = "",
    parameters: Iterable[str] = (),
    base_indent_level: int = 0,
    no_one_liner: bool = False,
) -> str:
    """
    Format and emit a function-like declaration or signature string with
    automatic line-wrapping and indentation.

    This utility is used to generate Mojo-style function definitions,
    function types, and comptime aliases while respecting a maximum line
    length and consistent indentation rules.

    The formatter attempts layouts in the following order:
      1. A single-line form if it fits within the maximum line length and
         `no_one_liner` is False.
      2. A multi-line form with arguments split across lines.
      3. A fully expanded multi-line form with generic parameters and
         arguments each on their own lines.

    Args:
        prefix:
            The leading text before the parameter list, such as
            ``"fn foo"``, ``"fn"``, or ``"comptime Bar = fn"``.
        arguments:
            Iterable of already-formatted argument strings to place inside
            the parentheses.
        suffix:
            Optional trailing text appended after the closing parenthesis,
            such as a return type annotation or ``":\\n"`` for function bodies.
        parameters:
            Optional iterable of generic or comptime parameter strings to be
            emitted in square brackets before the argument list.
        base_indent_level:
            Indentation level (in logical indents, not spaces) applied to the
            first line of output.
        no_one_liner:
            If True, forces multi-line formatting even when the entire
            signature would fit on a single line.

    Returns:
        A formatted string representing the function-like declaration,
        always ending with a newline.
    """
    SPACES_PER_INDENT = 4
    MAX_LINE_LENGTH = 100
    base_indent = " " * SPACES_PER_INDENT * base_indent_level
    inner_indent = " " * SPACES_PER_INDENT * (base_indent_level + 1)
    params_list = list(parameters)
    args_list = list(arguments)

    params_joined = f"[{', '.join(params_list)}]" if params_list else ""
    args_joined = ", ".join(args_list)

    # everything on one line
    one_liner = f"{base_indent}{prefix}{params_joined}({args_joined}){suffix}"
    if len(one_liner) <= MAX_LINE_LENGTH and not no_one_liner:
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