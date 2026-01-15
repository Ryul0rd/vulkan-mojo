comptime DescriptorUpdateTemplateKHR = DescriptorUpdateTemplate
comptime SamplerYcbcrConversionKHR = SamplerYcbcrConversion
comptime PrivateDataSlotEXT = PrivateDataSlot


@register_passable("trivial")
struct Instance(Equatable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PhysicalDevice(Equatable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Device(Equatable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Queue(Equatable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CommandBuffer(Equatable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DeviceMemory(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CommandPool(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Buffer(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct BufferView(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Image(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct ImageView(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct ShaderModule(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Pipeline(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PipelineLayout(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Sampler(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DescriptorSet(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DescriptorSetLayout(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DescriptorPool(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Fence(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Semaphore(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Event(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct QueryPool(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Framebuffer(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct RenderPass(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PipelineCache(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PipelineBinaryKHR(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct IndirectCommandsLayoutNV(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct IndirectCommandsLayoutEXT(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct IndirectExecutionSetEXT(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DescriptorUpdateTemplate(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct SamplerYcbcrConversion(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct ValidationCacheEXT(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct AccelerationStructureKHR(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct AccelerationStructureNV(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PerformanceConfigurationINTEL(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct BufferCollectionFUCHSIA(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DeferredOperationKHR(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PrivateDataSlot(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CuModuleNVX(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CuFunctionNVX(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct OpticalFlowSessionNV(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct MicromapEXT(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct ShaderEXT(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct TensorARM(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct TensorViewARM(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DataGraphPipelineSessionARM(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DisplayKHR(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DisplayModeKHR(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct SurfaceKHR(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct SwapchainKHR(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DebugReportCallbackEXT(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DebugUtilsMessengerEXT(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct VideoSessionKHR(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct VideoSessionParametersKHR(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct SemaphoreSciSyncPoolNV(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CudaModuleNV(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CudaFunctionNV(Equatable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct ExternalComputeQueueNV(Equatable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __bool__(self) -> Bool:
        return self._value != 0

    fn __str__(self) -> String:
        return hex(self._value)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))
