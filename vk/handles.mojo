comptime DescriptorUpdateTemplateKHR = DescriptorUpdateTemplate
comptime SamplerYcbcrConversionKHR = SamplerYcbcrConversion
comptime PrivateDataSlotEXT = PrivateDataSlot


struct Instance(TrivialRegisterType, Equatable, Writable):
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


struct PhysicalDevice(TrivialRegisterType, Equatable, Writable):
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


struct Device(TrivialRegisterType, Equatable, Writable):
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


struct Queue(TrivialRegisterType, Equatable, Writable):
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


struct CommandBuffer(TrivialRegisterType, Equatable, Writable):
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


struct DeviceMemory(TrivialRegisterType, Equatable, Writable):
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


struct CommandPool(TrivialRegisterType, Equatable, Writable):
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


struct Buffer(TrivialRegisterType, Equatable, Writable):
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


struct BufferView(TrivialRegisterType, Equatable, Writable):
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


struct Image(TrivialRegisterType, Equatable, Writable):
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


struct ImageView(TrivialRegisterType, Equatable, Writable):
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


struct ShaderModule(TrivialRegisterType, Equatable, Writable):
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


struct Pipeline(TrivialRegisterType, Equatable, Writable):
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


struct PipelineLayout(TrivialRegisterType, Equatable, Writable):
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


struct Sampler(TrivialRegisterType, Equatable, Writable):
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


struct DescriptorSet(TrivialRegisterType, Equatable, Writable):
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


struct DescriptorSetLayout(TrivialRegisterType, Equatable, Writable):
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


struct DescriptorPool(TrivialRegisterType, Equatable, Writable):
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


struct Fence(TrivialRegisterType, Equatable, Writable):
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


struct Semaphore(TrivialRegisterType, Equatable, Writable):
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


struct Event(TrivialRegisterType, Equatable, Writable):
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


struct QueryPool(TrivialRegisterType, Equatable, Writable):
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


struct Framebuffer(TrivialRegisterType, Equatable, Writable):
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


struct RenderPass(TrivialRegisterType, Equatable, Writable):
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


struct PipelineCache(TrivialRegisterType, Equatable, Writable):
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


struct PipelineBinaryKHR(TrivialRegisterType, Equatable, Writable):
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


struct IndirectCommandsLayoutNV(TrivialRegisterType, Equatable, Writable):
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


struct IndirectCommandsLayoutEXT(TrivialRegisterType, Equatable, Writable):
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


struct IndirectExecutionSetEXT(TrivialRegisterType, Equatable, Writable):
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


struct DescriptorUpdateTemplate(TrivialRegisterType, Equatable, Writable):
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


struct SamplerYcbcrConversion(TrivialRegisterType, Equatable, Writable):
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


struct ValidationCacheEXT(TrivialRegisterType, Equatable, Writable):
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


struct AccelerationStructureKHR(TrivialRegisterType, Equatable, Writable):
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


struct AccelerationStructureNV(TrivialRegisterType, Equatable, Writable):
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


struct PerformanceConfigurationINTEL(TrivialRegisterType, Equatable, Writable):
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


struct BufferCollectionFUCHSIA(TrivialRegisterType, Equatable, Writable):
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


struct DeferredOperationKHR(TrivialRegisterType, Equatable, Writable):
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


struct PrivateDataSlot(TrivialRegisterType, Equatable, Writable):
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


struct CuModuleNVX(TrivialRegisterType, Equatable, Writable):
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


struct CuFunctionNVX(TrivialRegisterType, Equatable, Writable):
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


struct OpticalFlowSessionNV(TrivialRegisterType, Equatable, Writable):
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


struct MicromapEXT(TrivialRegisterType, Equatable, Writable):
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


struct ShaderEXT(TrivialRegisterType, Equatable, Writable):
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


struct TensorARM(TrivialRegisterType, Equatable, Writable):
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


struct TensorViewARM(TrivialRegisterType, Equatable, Writable):
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


struct DataGraphPipelineSessionARM(TrivialRegisterType, Equatable, Writable):
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


struct DisplayKHR(TrivialRegisterType, Equatable, Writable):
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


struct DisplayModeKHR(TrivialRegisterType, Equatable, Writable):
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


struct SurfaceKHR(TrivialRegisterType, Equatable, Writable):
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


struct SwapchainKHR(TrivialRegisterType, Equatable, Writable):
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


struct DebugReportCallbackEXT(TrivialRegisterType, Equatable, Writable):
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


struct DebugUtilsMessengerEXT(TrivialRegisterType, Equatable, Writable):
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


struct VideoSessionKHR(TrivialRegisterType, Equatable, Writable):
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


struct VideoSessionParametersKHR(TrivialRegisterType, Equatable, Writable):
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


struct SemaphoreSciSyncPoolNV(TrivialRegisterType, Equatable, Writable):
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


struct CudaModuleNV(TrivialRegisterType, Equatable, Writable):
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


struct CudaFunctionNV(TrivialRegisterType, Equatable, Writable):
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


struct ExternalComputeQueueNV(TrivialRegisterType, Equatable, Writable):
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
