comptime DescriptorUpdateTemplateKHR = DescriptorUpdateTemplate
comptime SamplerYcbcrConversionKHR = SamplerYcbcrConversion
comptime PrivateDataSlotEXT = PrivateDataSlot


struct Instance(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct PhysicalDevice(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct Device(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct Queue(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct CommandBuffer(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DeviceMemory(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct CommandPool(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct Buffer(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct BufferView(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct Image(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct ImageView(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct ShaderModule(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct Pipeline(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct PipelineLayout(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct Sampler(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DescriptorSet(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DescriptorSetLayout(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DescriptorPool(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct Fence(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct Semaphore(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct Event(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct QueryPool(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct Framebuffer(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct RenderPass(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct PipelineCache(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct PipelineBinaryKHR(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct IndirectCommandsLayoutNV(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct IndirectCommandsLayoutEXT(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct IndirectExecutionSetEXT(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DescriptorUpdateTemplate(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct SamplerYcbcrConversion(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct ValidationCacheEXT(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct AccelerationStructureKHR(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct AccelerationStructureNV(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct PerformanceConfigurationINTEL(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct BufferCollectionFUCHSIA(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DeferredOperationKHR(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct PrivateDataSlot(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct CuModuleNVX(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct CuFunctionNVX(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct OpticalFlowSessionNV(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct MicromapEXT(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct ShaderEXT(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct TensorARM(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct TensorViewARM(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DataGraphPipelineSessionARM(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DisplayKHR(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DisplayModeKHR(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct SurfaceKHR(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct SwapchainKHR(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DebugReportCallbackEXT(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct DebugUtilsMessengerEXT(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct VideoSessionKHR(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct VideoSessionParametersKHR(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct SemaphoreSciSyncPoolNV(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct CudaModuleNV(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct CudaFunctionNV(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


struct ExternalComputeQueueNV(TrivialRegisterPassable, Equatable, Hashable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def __str__(self) -> String:
        return hex(self._value)

    def write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))
