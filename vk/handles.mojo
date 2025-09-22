

@register_passable("trivial")
struct Instance(EqualityComparable, Writable):
    var _raw: UInt

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw

    fn __eq__(self, other: Instance) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PhysicalDevice(EqualityComparable, Writable):
    var _raw: UInt

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw

    fn __eq__(self, other: PhysicalDevice) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Device(EqualityComparable, Writable):
    var _raw: UInt

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw

    fn __eq__(self, other: Device) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Queue(EqualityComparable, Writable):
    var _raw: UInt

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw

    fn __eq__(self, other: Queue) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CommandBuffer(EqualityComparable, Writable):
    var _raw: UInt

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw

    fn __eq__(self, other: CommandBuffer) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DeviceMemory(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DeviceMemory) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CommandPool(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: CommandPool) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Buffer(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Buffer) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct BufferView(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: BufferView) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Image(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Image) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct ImageView(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: ImageView) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct ShaderModule(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: ShaderModule) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Pipeline(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Pipeline) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PipelineLayout(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: PipelineLayout) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Sampler(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Sampler) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DescriptorSet(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DescriptorSet) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DescriptorSetLayout(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DescriptorSetLayout) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DescriptorPool(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DescriptorPool) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Fence(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Fence) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Semaphore(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Semaphore) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Event(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Event) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct QueryPool(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: QueryPool) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct Framebuffer(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Framebuffer) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct RenderPass(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: RenderPass) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PipelineCache(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: PipelineCache) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PipelineBinaryKHR(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: PipelineBinaryKHR) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct IndirectCommandsLayoutNV(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: IndirectCommandsLayoutNV) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct IndirectCommandsLayoutEXT(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: IndirectCommandsLayoutEXT) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct IndirectExecutionSetEXT(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: IndirectExecutionSetEXT) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DescriptorUpdateTemplate(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DescriptorUpdateTemplate) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct SamplerYcbcrConversion(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: SamplerYcbcrConversion) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct ValidationCacheEXT(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: ValidationCacheEXT) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct AccelerationStructureKHR(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: AccelerationStructureKHR) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct AccelerationStructureNV(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: AccelerationStructureNV) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PerformanceConfigurationINTEL(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: PerformanceConfigurationINTEL) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct BufferCollectionFUCHSIA(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: BufferCollectionFUCHSIA) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DeferredOperationKHR(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DeferredOperationKHR) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct PrivateDataSlot(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: PrivateDataSlot) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CuModuleNVX(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: CuModuleNVX) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CuFunctionNVX(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: CuFunctionNVX) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct OpticalFlowSessionNV(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: OpticalFlowSessionNV) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct MicromapEXT(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: MicromapEXT) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct ShaderEXT(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: ShaderEXT) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct TensorARM(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: TensorARM) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct TensorViewARM(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: TensorViewARM) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DataGraphPipelineSessionARM(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DataGraphPipelineSessionARM) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DisplayKHR(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DisplayKHR) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DisplayModeKHR(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DisplayModeKHR) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct SurfaceKHR(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: SurfaceKHR) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct SwapchainKHR(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: SwapchainKHR) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DebugReportCallbackEXT(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DebugReportCallbackEXT) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct DebugUtilsMessengerEXT(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: DebugUtilsMessengerEXT) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct VideoSessionKHR(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: VideoSessionKHR) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct VideoSessionParametersKHR(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: VideoSessionParametersKHR) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct SemaphoreSciSyncPoolNV(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: SemaphoreSciSyncPoolNV) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CudaModuleNV(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: CudaModuleNV) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct CudaFunctionNV(EqualityComparable, Writable):
    var _raw: UInt64

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: CudaFunctionNV) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))


@register_passable("trivial")
struct ExternalComputeQueueNV(EqualityComparable, Writable):
    var _raw: UInt

    alias NULL = Self(raw = 0)

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw

    fn __eq__(self, other: ExternalComputeQueueNV) -> Bool:
        return self._raw == other._raw

    fn __str__(self) -> String:
        return hex(self._raw)

    fn write_to(self, mut writer: Some[Writer]):
        writer.write(String(self))
