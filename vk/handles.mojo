comptime DescriptorUpdateTemplateKHR = DescriptorUpdateTemplate
comptime SamplerYcbcrConversionKHR = SamplerYcbcrConversion
comptime PrivateDataSlotEXT = PrivateDataSlot


struct Instance(TrivialRegisterPassable, Equatable, Writable):
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


struct PhysicalDevice(TrivialRegisterPassable, Equatable, Writable):
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


struct Device(TrivialRegisterPassable, Equatable, Writable):
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


struct Queue(TrivialRegisterPassable, Equatable, Writable):
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


struct CommandBuffer(TrivialRegisterPassable, Equatable, Writable):
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


struct DeviceMemory(TrivialRegisterPassable, Equatable, Writable):
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


struct CommandPool(TrivialRegisterPassable, Equatable, Writable):
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


struct Buffer(TrivialRegisterPassable, Equatable, Writable):
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


struct BufferView(TrivialRegisterPassable, Equatable, Writable):
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


struct Image(TrivialRegisterPassable, Equatable, Writable):
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


struct ImageView(TrivialRegisterPassable, Equatable, Writable):
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


struct ShaderModule(TrivialRegisterPassable, Equatable, Writable):
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


struct Pipeline(TrivialRegisterPassable, Equatable, Writable):
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


struct PipelineLayout(TrivialRegisterPassable, Equatable, Writable):
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


struct Sampler(TrivialRegisterPassable, Equatable, Writable):
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


struct DescriptorSet(TrivialRegisterPassable, Equatable, Writable):
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


struct DescriptorSetLayout(TrivialRegisterPassable, Equatable, Writable):
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


struct DescriptorPool(TrivialRegisterPassable, Equatable, Writable):
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


struct Fence(TrivialRegisterPassable, Equatable, Writable):
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


struct Semaphore(TrivialRegisterPassable, Equatable, Writable):
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


struct Event(TrivialRegisterPassable, Equatable, Writable):
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


struct QueryPool(TrivialRegisterPassable, Equatable, Writable):
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


struct Framebuffer(TrivialRegisterPassable, Equatable, Writable):
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


struct RenderPass(TrivialRegisterPassable, Equatable, Writable):
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


struct PipelineCache(TrivialRegisterPassable, Equatable, Writable):
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


struct PipelineBinaryKHR(TrivialRegisterPassable, Equatable, Writable):
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


struct IndirectCommandsLayoutNV(TrivialRegisterPassable, Equatable, Writable):
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


struct IndirectCommandsLayoutEXT(TrivialRegisterPassable, Equatable, Writable):
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


struct IndirectExecutionSetEXT(TrivialRegisterPassable, Equatable, Writable):
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


struct DescriptorUpdateTemplate(TrivialRegisterPassable, Equatable, Writable):
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


struct SamplerYcbcrConversion(TrivialRegisterPassable, Equatable, Writable):
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


struct ValidationCacheEXT(TrivialRegisterPassable, Equatable, Writable):
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


struct AccelerationStructureKHR(TrivialRegisterPassable, Equatable, Writable):
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


struct AccelerationStructureNV(TrivialRegisterPassable, Equatable, Writable):
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


struct PerformanceConfigurationINTEL(TrivialRegisterPassable, Equatable, Writable):
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


struct BufferCollectionFUCHSIA(TrivialRegisterPassable, Equatable, Writable):
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


struct DeferredOperationKHR(TrivialRegisterPassable, Equatable, Writable):
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


struct PrivateDataSlot(TrivialRegisterPassable, Equatable, Writable):
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


struct CuModuleNVX(TrivialRegisterPassable, Equatable, Writable):
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


struct CuFunctionNVX(TrivialRegisterPassable, Equatable, Writable):
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


struct OpticalFlowSessionNV(TrivialRegisterPassable, Equatable, Writable):
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


struct MicromapEXT(TrivialRegisterPassable, Equatable, Writable):
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


struct ShaderEXT(TrivialRegisterPassable, Equatable, Writable):
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


struct TensorARM(TrivialRegisterPassable, Equatable, Writable):
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


struct TensorViewARM(TrivialRegisterPassable, Equatable, Writable):
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


struct DataGraphPipelineSessionARM(TrivialRegisterPassable, Equatable, Writable):
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


struct DisplayKHR(TrivialRegisterPassable, Equatable, Writable):
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


struct DisplayModeKHR(TrivialRegisterPassable, Equatable, Writable):
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


struct SurfaceKHR(TrivialRegisterPassable, Equatable, Writable):
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


struct SwapchainKHR(TrivialRegisterPassable, Equatable, Writable):
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


struct DebugReportCallbackEXT(TrivialRegisterPassable, Equatable, Writable):
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


struct DebugUtilsMessengerEXT(TrivialRegisterPassable, Equatable, Writable):
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


struct VideoSessionKHR(TrivialRegisterPassable, Equatable, Writable):
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


struct VideoSessionParametersKHR(TrivialRegisterPassable, Equatable, Writable):
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


struct SemaphoreSciSyncPoolNV(TrivialRegisterPassable, Equatable, Writable):
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


struct CudaModuleNV(TrivialRegisterPassable, Equatable, Writable):
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


struct CudaFunctionNV(TrivialRegisterPassable, Equatable, Writable):
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


struct ExternalComputeQueueNV(TrivialRegisterPassable, Equatable, Writable):
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
