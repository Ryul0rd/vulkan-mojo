comptime DescriptorUpdateTemplateKHR = DescriptorUpdateTemplate
comptime SamplerYcbcrConversionKHR = SamplerYcbcrConversion
comptime PrivateDataSlotEXT = PrivateDataSlot


struct Instance(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Instance(", hex(self._value), ")")


struct PhysicalDevice(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("PhysicalDevice(", hex(self._value), ")")


struct Device(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Device(", hex(self._value), ")")


struct Queue(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Queue(", hex(self._value), ")")


struct CommandBuffer(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("CommandBuffer(", hex(self._value), ")")


struct DeviceMemory(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DeviceMemory(", hex(self._value), ")")


struct CommandPool(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("CommandPool(", hex(self._value), ")")


struct Buffer(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Buffer(", hex(self._value), ")")


struct BufferView(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("BufferView(", hex(self._value), ")")


struct Image(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Image(", hex(self._value), ")")


struct ImageView(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("ImageView(", hex(self._value), ")")


struct ShaderModule(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("ShaderModule(", hex(self._value), ")")


struct Pipeline(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Pipeline(", hex(self._value), ")")


struct PipelineLayout(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("PipelineLayout(", hex(self._value), ")")


struct Sampler(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Sampler(", hex(self._value), ")")


struct DescriptorSet(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DescriptorSet(", hex(self._value), ")")


struct DescriptorSetLayout(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DescriptorSetLayout(", hex(self._value), ")")


struct DescriptorPool(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DescriptorPool(", hex(self._value), ")")


struct Fence(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Fence(", hex(self._value), ")")


struct Semaphore(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Semaphore(", hex(self._value), ")")


struct Event(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Event(", hex(self._value), ")")


struct QueryPool(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("QueryPool(", hex(self._value), ")")


struct Framebuffer(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("Framebuffer(", hex(self._value), ")")


struct RenderPass(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("RenderPass(", hex(self._value), ")")


struct PipelineCache(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("PipelineCache(", hex(self._value), ")")


struct PipelineBinaryKHR(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("PipelineBinaryKHR(", hex(self._value), ")")


struct IndirectCommandsLayoutNV(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("IndirectCommandsLayoutNV(", hex(self._value), ")")


struct IndirectCommandsLayoutEXT(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("IndirectCommandsLayoutEXT(", hex(self._value), ")")


struct IndirectExecutionSetEXT(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("IndirectExecutionSetEXT(", hex(self._value), ")")


struct DescriptorUpdateTemplate(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DescriptorUpdateTemplate(", hex(self._value), ")")


struct SamplerYcbcrConversion(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("SamplerYcbcrConversion(", hex(self._value), ")")


struct ValidationCacheEXT(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("ValidationCacheEXT(", hex(self._value), ")")


struct AccelerationStructureKHR(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("AccelerationStructureKHR(", hex(self._value), ")")


struct AccelerationStructureNV(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("AccelerationStructureNV(", hex(self._value), ")")


struct PerformanceConfigurationINTEL(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("PerformanceConfigurationINTEL(", hex(self._value), ")")


struct BufferCollectionFUCHSIA(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("BufferCollectionFUCHSIA(", hex(self._value), ")")


struct DeferredOperationKHR(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DeferredOperationKHR(", hex(self._value), ")")


struct PrivateDataSlot(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("PrivateDataSlot(", hex(self._value), ")")


struct CuModuleNVX(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("CuModuleNVX(", hex(self._value), ")")


struct CuFunctionNVX(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("CuFunctionNVX(", hex(self._value), ")")


struct OpticalFlowSessionNV(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("OpticalFlowSessionNV(", hex(self._value), ")")


struct MicromapEXT(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("MicromapEXT(", hex(self._value), ")")


struct ShaderEXT(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("ShaderEXT(", hex(self._value), ")")


struct TensorARM(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("TensorARM(", hex(self._value), ")")


struct TensorViewARM(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("TensorViewARM(", hex(self._value), ")")


struct DataGraphPipelineSessionARM(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DataGraphPipelineSessionARM(", hex(self._value), ")")


struct DisplayKHR(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DisplayKHR(", hex(self._value), ")")


struct DisplayModeKHR(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DisplayModeKHR(", hex(self._value), ")")


struct SurfaceKHR(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("SurfaceKHR(", hex(self._value), ")")


struct SwapchainKHR(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("SwapchainKHR(", hex(self._value), ")")


struct DebugReportCallbackEXT(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DebugReportCallbackEXT(", hex(self._value), ")")


struct DebugUtilsMessengerEXT(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("DebugUtilsMessengerEXT(", hex(self._value), ")")


struct VideoSessionKHR(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("VideoSessionKHR(", hex(self._value), ")")


struct VideoSessionParametersKHR(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("VideoSessionParametersKHR(", hex(self._value), ")")


struct SemaphoreSciSyncPoolNV(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("SemaphoreSciSyncPoolNV(", hex(self._value), ")")


struct CudaModuleNV(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("CudaModuleNV(", hex(self._value), ")")


struct CudaFunctionNV(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt64
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt64):
        self._value = value

    def value(self) -> UInt64:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("CudaFunctionNV(", hex(self._value), ")")


struct ExternalComputeQueueNV(TrivialRegisterPassable, Equatable, Hashable, Boolable, Writable):
    var _value: UInt
    comptime NULL = Self(value = 0)

    def __init__(out self, *, value: UInt):
        self._value = value

    def value(self) -> UInt:
        return self._value

    def __bool__(self) -> Bool:
        return self._value != 0

    def write_to(self, mut writer: Some[Writer]):
        writer.write("ExternalComputeQueueNV(", hex(self._value), ")")
