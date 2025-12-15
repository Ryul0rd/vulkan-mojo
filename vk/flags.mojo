comptime MemoryUnmapFlagsKHR = MemoryUnmapFlags
comptime GeometryFlagsNV = GeometryFlagsKHR
comptime GeometryInstanceFlagsNV = GeometryInstanceFlagsKHR
comptime BuildAccelerationStructureFlagsNV = BuildAccelerationStructureFlagsKHR
comptime PrivateDataSlotCreateFlagsEXT = PrivateDataSlotCreateFlags
comptime DescriptorUpdateTemplateCreateFlagsKHR = DescriptorUpdateTemplateCreateFlags
comptime PipelineCreationFeedbackFlagsEXT = PipelineCreationFeedbackFlags
comptime SemaphoreWaitFlagsKHR = SemaphoreWaitFlags
comptime AccessFlags2KHR = AccessFlags2
comptime PipelineStageFlags2KHR = PipelineStageFlags2
comptime FormatFeatureFlags2KHR = FormatFeatureFlags2
comptime RenderingFlagsKHR = RenderingFlags
comptime PipelineCreateFlags2KHR = PipelineCreateFlags2
comptime BufferUsageFlags2KHR = BufferUsageFlags2
comptime PeerMemoryFeatureFlagsKHR = PeerMemoryFeatureFlags
comptime MemoryAllocateFlagsKHR = MemoryAllocateFlags
comptime CommandPoolTrimFlagsKHR = CommandPoolTrimFlags
comptime ExternalMemoryHandleTypeFlagsKHR = ExternalMemoryHandleTypeFlags
comptime ExternalMemoryFeatureFlagsKHR = ExternalMemoryFeatureFlags
comptime ExternalSemaphoreHandleTypeFlagsKHR = ExternalSemaphoreHandleTypeFlags
comptime ExternalSemaphoreFeatureFlagsKHR = ExternalSemaphoreFeatureFlags
comptime SemaphoreImportFlagsKHR = SemaphoreImportFlags
comptime ExternalFenceHandleTypeFlagsKHR = ExternalFenceHandleTypeFlags
comptime ExternalFenceFeatureFlagsKHR = ExternalFenceFeatureFlags
comptime FenceImportFlagsKHR = FenceImportFlags
comptime DescriptorBindingFlagsEXT = DescriptorBindingFlags
comptime ResolveModeFlagsKHR = ResolveModeFlags
comptime ToolPurposeFlagsEXT = ToolPurposeFlags
comptime SubmitFlagsKHR = SubmitFlags
comptime HostImageCopyFlagsEXT = HostImageCopyFlags
comptime PresentScalingFlagsEXT = PresentScalingFlagsKHR
comptime PresentGravityFlagsEXT = PresentGravityFlagsKHR


@register_passable("trivial")
struct FramebufferCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: FramebufferCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: FramebufferCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: FramebufferCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: FramebufferCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct FramebufferCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> FramebufferCreateFlags:
        return FramebufferCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct QueryPoolCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: QueryPoolCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: QueryPoolCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: QueryPoolCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: QueryPoolCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct QueryPoolCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> QueryPoolCreateFlags:
        return QueryPoolCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct RenderPassCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: RenderPassCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: RenderPassCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: RenderPassCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: RenderPassCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct RenderPassCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> RenderPassCreateFlags:
        return RenderPassCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct SamplerCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SamplerCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SamplerCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SamplerCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SamplerCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct SamplerCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SamplerCreateFlags:
        return SamplerCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineLayoutCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineLayoutCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineLayoutCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineLayoutCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineLayoutCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineLayoutCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineLayoutCreateFlags:
        return PipelineLayoutCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineCacheCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCacheCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineCacheCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineCacheCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineCacheCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineCacheCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineCacheCreateFlags:
        return PipelineCacheCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineDepthStencilStateCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineDepthStencilStateCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineDepthStencilStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineDepthStencilStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineDepthStencilStateCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineDepthStencilStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineDepthStencilStateCreateFlags:
        return PipelineDepthStencilStateCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineDynamicStateCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineDynamicStateCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineDynamicStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineDynamicStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineDynamicStateCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineDynamicStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineDynamicStateCreateFlags:
        return PipelineDynamicStateCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineColorBlendStateCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineColorBlendStateCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineColorBlendStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineColorBlendStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineColorBlendStateCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineColorBlendStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineColorBlendStateCreateFlags:
        return PipelineColorBlendStateCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineMultisampleStateCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineMultisampleStateCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineMultisampleStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineMultisampleStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineMultisampleStateCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineMultisampleStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineMultisampleStateCreateFlags:
        return PipelineMultisampleStateCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineRasterizationStateCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineRasterizationStateCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineRasterizationStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineRasterizationStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineRasterizationStateCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineRasterizationStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineRasterizationStateCreateFlags:
        return PipelineRasterizationStateCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineViewportStateCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineViewportStateCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineViewportStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineViewportStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineViewportStateCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineViewportStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineViewportStateCreateFlags:
        return PipelineViewportStateCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineTessellationStateCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineTessellationStateCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineTessellationStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineTessellationStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineTessellationStateCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineTessellationStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineTessellationStateCreateFlags:
        return PipelineTessellationStateCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineInputAssemblyStateCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineInputAssemblyStateCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineInputAssemblyStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineInputAssemblyStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineInputAssemblyStateCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineInputAssemblyStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineInputAssemblyStateCreateFlags:
        return PipelineInputAssemblyStateCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineVertexInputStateCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineVertexInputStateCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineVertexInputStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineVertexInputStateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineVertexInputStateCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineVertexInputStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineVertexInputStateCreateFlags:
        return PipelineVertexInputStateCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineShaderStageCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineShaderStageCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineShaderStageCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineShaderStageCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineShaderStageCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineShaderStageCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineShaderStageCreateFlags:
        return PipelineShaderStageCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct DescriptorSetLayoutCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DescriptorSetLayoutCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DescriptorSetLayoutCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DescriptorSetLayoutCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DescriptorSetLayoutCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DescriptorSetLayoutCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DescriptorSetLayoutCreateFlags:
        return DescriptorSetLayoutCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct BufferViewCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: BufferViewCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: BufferViewCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: BufferViewCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: BufferViewCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct BufferViewCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> BufferViewCreateFlags:
        return BufferViewCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct InstanceCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: InstanceCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: InstanceCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: InstanceCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: InstanceCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct InstanceCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> InstanceCreateFlags:
        return InstanceCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct DeviceCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DeviceCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DeviceCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DeviceCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DeviceCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DeviceCreateFlags:
        return DeviceCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct DeviceQueueCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceQueueCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DeviceQueueCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DeviceQueueCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DeviceQueueCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DeviceQueueCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DeviceQueueCreateFlags:
        return DeviceQueueCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct QueueFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: QueueFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: QueueFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: QueueFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: QueueFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime GRAPHICS = QueueFlagBits(value = 1 << 0)
    comptime COMPUTE = QueueFlagBits(value = 1 << 1)
    comptime TRANSFER = QueueFlagBits(value = 1 << 2)
    comptime SPARSE_BINDING = QueueFlagBits(value = 1 << 3)


@register_passable("trivial")
struct QueueFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> QueueFlags:
        return QueueFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct MemoryPropertyFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: MemoryPropertyFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: MemoryPropertyFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: MemoryPropertyFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: MemoryPropertyFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEVICE_LOCAL = MemoryPropertyFlagBits(value = 1 << 0)
    comptime HOST_VISIBLE = MemoryPropertyFlagBits(value = 1 << 1)
    comptime HOST_COHERENT = MemoryPropertyFlagBits(value = 1 << 2)
    comptime HOST_CACHED = MemoryPropertyFlagBits(value = 1 << 3)
    comptime LAZILY_ALLOCATED = MemoryPropertyFlagBits(value = 1 << 4)


@register_passable("trivial")
struct MemoryPropertyFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> MemoryPropertyFlags:
        return MemoryPropertyFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct MemoryHeapFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: MemoryHeapFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: MemoryHeapFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: MemoryHeapFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: MemoryHeapFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEVICE_LOCAL = MemoryHeapFlagBits(value = 1 << 0)


@register_passable("trivial")
struct MemoryHeapFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> MemoryHeapFlags:
        return MemoryHeapFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct AccessFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: AccessFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: AccessFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: AccessFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: AccessFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime INDIRECT_COMMAND_READ = AccessFlagBits(value = 1 << 0)
    comptime INDEX_READ = AccessFlagBits(value = 1 << 1)
    comptime VERTEX_ATTRIBUTE_READ = AccessFlagBits(value = 1 << 2)
    comptime UNIFORM_READ = AccessFlagBits(value = 1 << 3)
    comptime INPUT_ATTACHMENT_READ = AccessFlagBits(value = 1 << 4)
    comptime SHADER_READ = AccessFlagBits(value = 1 << 5)
    comptime SHADER_WRITE = AccessFlagBits(value = 1 << 6)
    comptime COLOR_ATTACHMENT_READ = AccessFlagBits(value = 1 << 7)
    comptime COLOR_ATTACHMENT_WRITE = AccessFlagBits(value = 1 << 8)
    comptime DEPTH_STENCIL_ATTACHMENT_READ = AccessFlagBits(value = 1 << 9)
    comptime DEPTH_STENCIL_ATTACHMENT_WRITE = AccessFlagBits(value = 1 << 10)
    comptime TRANSFER_READ = AccessFlagBits(value = 1 << 11)
    comptime TRANSFER_WRITE = AccessFlagBits(value = 1 << 12)
    comptime HOST_READ = AccessFlagBits(value = 1 << 13)
    comptime HOST_WRITE = AccessFlagBits(value = 1 << 14)
    comptime MEMORY_READ = AccessFlagBits(value = 1 << 15)
    comptime MEMORY_WRITE = AccessFlagBits(value = 1 << 16)


@register_passable("trivial")
struct AccessFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> AccessFlags:
        return AccessFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct BufferUsageFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: BufferUsageFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: BufferUsageFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: BufferUsageFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: BufferUsageFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime TRANSFER_SRC = BufferUsageFlagBits(value = 1 << 0)
    comptime TRANSFER_DST = BufferUsageFlagBits(value = 1 << 1)
    comptime UNIFORM_TEXEL_BUFFER = BufferUsageFlagBits(value = 1 << 2)
    comptime STORAGE_TEXEL_BUFFER = BufferUsageFlagBits(value = 1 << 3)
    comptime UNIFORM_BUFFER = BufferUsageFlagBits(value = 1 << 4)
    comptime STORAGE_BUFFER = BufferUsageFlagBits(value = 1 << 5)
    comptime INDEX_BUFFER = BufferUsageFlagBits(value = 1 << 6)
    comptime VERTEX_BUFFER = BufferUsageFlagBits(value = 1 << 7)
    comptime INDIRECT_BUFFER = BufferUsageFlagBits(value = 1 << 8)


@register_passable("trivial")
struct BufferUsageFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> BufferUsageFlags:
        return BufferUsageFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct BufferCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: BufferCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: BufferCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: BufferCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: BufferCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime SPARSE_BINDING = BufferCreateFlagBits(value = 1 << 0)
    comptime SPARSE_RESIDENCY = BufferCreateFlagBits(value = 1 << 1)
    comptime SPARSE_ALIASED = BufferCreateFlagBits(value = 1 << 2)


@register_passable("trivial")
struct BufferCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> BufferCreateFlags:
        return BufferCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ShaderStageFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ShaderStageFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ShaderStageFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ShaderStageFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ShaderStageFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ALL_GRAPHICS = ShaderStageFlagBits(value = 31)
    comptime ALL = ShaderStageFlagBits(value = 2147483647)
    comptime VERTEX = ShaderStageFlagBits(value = 1 << 0)
    comptime TESSELLATION_CONTROL = ShaderStageFlagBits(value = 1 << 1)
    comptime TESSELLATION_EVALUATION = ShaderStageFlagBits(value = 1 << 2)
    comptime GEOMETRY = ShaderStageFlagBits(value = 1 << 3)
    comptime FRAGMENT = ShaderStageFlagBits(value = 1 << 4)
    comptime COMPUTE = ShaderStageFlagBits(value = 1 << 5)


@register_passable("trivial")
struct ShaderStageFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ShaderStageFlags:
        return ShaderStageFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ImageUsageFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ImageUsageFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ImageUsageFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ImageUsageFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ImageUsageFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime TRANSFER_SRC = ImageUsageFlagBits(value = 1 << 0)
    comptime TRANSFER_DST = ImageUsageFlagBits(value = 1 << 1)
    comptime SAMPLED = ImageUsageFlagBits(value = 1 << 2)
    comptime STORAGE = ImageUsageFlagBits(value = 1 << 3)
    comptime COLOR_ATTACHMENT = ImageUsageFlagBits(value = 1 << 4)
    comptime DEPTH_STENCIL_ATTACHMENT = ImageUsageFlagBits(value = 1 << 5)
    comptime TRANSIENT_ATTACHMENT = ImageUsageFlagBits(value = 1 << 6)
    comptime INPUT_ATTACHMENT = ImageUsageFlagBits(value = 1 << 7)


@register_passable("trivial")
struct ImageUsageFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ImageUsageFlags:
        return ImageUsageFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ImageCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ImageCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ImageCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ImageCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ImageCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime SPARSE_BINDING = ImageCreateFlagBits(value = 1 << 0)
    comptime SPARSE_RESIDENCY = ImageCreateFlagBits(value = 1 << 1)
    comptime SPARSE_ALIASED = ImageCreateFlagBits(value = 1 << 2)
    comptime MUTABLE_FORMAT = ImageCreateFlagBits(value = 1 << 3)
    comptime CUBE_COMPATIBLE = ImageCreateFlagBits(value = 1 << 4)


@register_passable("trivial")
struct ImageCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ImageCreateFlags:
        return ImageCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ImageViewCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ImageViewCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ImageViewCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ImageViewCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ImageViewCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct ImageViewCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ImageViewCreateFlags:
        return ImageViewCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DISABLE_OPTIMIZATION = PipelineCreateFlagBits(value = 1 << 0)
    comptime ALLOW_DERIVATIVES = PipelineCreateFlagBits(value = 1 << 1)
    comptime DERIVATIVE = PipelineCreateFlagBits(value = 1 << 2)


@register_passable("trivial")
struct PipelineCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineCreateFlags:
        return PipelineCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ColorComponentFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ColorComponentFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ColorComponentFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ColorComponentFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ColorComponentFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime R = ColorComponentFlagBits(value = 1 << 0)
    comptime G = ColorComponentFlagBits(value = 1 << 1)
    comptime B = ColorComponentFlagBits(value = 1 << 2)
    comptime A = ColorComponentFlagBits(value = 1 << 3)


@register_passable("trivial")
struct ColorComponentFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ColorComponentFlags:
        return ColorComponentFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct FenceCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: FenceCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: FenceCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: FenceCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: FenceCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime SIGNALED = FenceCreateFlagBits(value = 1 << 0)


@register_passable("trivial")
struct FenceCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> FenceCreateFlags:
        return FenceCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct SemaphoreCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SemaphoreCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SemaphoreCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SemaphoreCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SemaphoreCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct SemaphoreCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SemaphoreCreateFlags:
        return SemaphoreCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct FormatFeatureFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: FormatFeatureFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: FormatFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: FormatFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: FormatFeatureFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime SAMPLED_IMAGE = FormatFeatureFlagBits(value = 1 << 0)
    comptime STORAGE_IMAGE = FormatFeatureFlagBits(value = 1 << 1)
    comptime STORAGE_IMAGE_ATOMIC = FormatFeatureFlagBits(value = 1 << 2)
    comptime UNIFORM_TEXEL_BUFFER = FormatFeatureFlagBits(value = 1 << 3)
    comptime STORAGE_TEXEL_BUFFER = FormatFeatureFlagBits(value = 1 << 4)
    comptime STORAGE_TEXEL_BUFFER_ATOMIC = FormatFeatureFlagBits(value = 1 << 5)
    comptime VERTEX_BUFFER = FormatFeatureFlagBits(value = 1 << 6)
    comptime COLOR_ATTACHMENT = FormatFeatureFlagBits(value = 1 << 7)
    comptime COLOR_ATTACHMENT_BLEND = FormatFeatureFlagBits(value = 1 << 8)
    comptime DEPTH_STENCIL_ATTACHMENT = FormatFeatureFlagBits(value = 1 << 9)
    comptime BLIT_SRC = FormatFeatureFlagBits(value = 1 << 10)
    comptime BLIT_DST = FormatFeatureFlagBits(value = 1 << 11)
    comptime SAMPLED_IMAGE_FILTER_LINEAR = FormatFeatureFlagBits(value = 1 << 12)


@register_passable("trivial")
struct FormatFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> FormatFeatureFlags:
        return FormatFeatureFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct QueryControlFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: QueryControlFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: QueryControlFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: QueryControlFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: QueryControlFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime PRECISE = QueryControlFlagBits(value = 1 << 0)


@register_passable("trivial")
struct QueryControlFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> QueryControlFlags:
        return QueryControlFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct QueryResultFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: QueryResultFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: QueryResultFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: QueryResultFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: QueryResultFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime N_64 = QueryResultFlagBits(value = 1 << 0)
    comptime WAIT = QueryResultFlagBits(value = 1 << 1)
    comptime WITH_AVAILABILITY = QueryResultFlagBits(value = 1 << 2)
    comptime PARTIAL = QueryResultFlagBits(value = 1 << 3)


@register_passable("trivial")
struct QueryResultFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> QueryResultFlags:
        return QueryResultFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ShaderModuleCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ShaderModuleCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ShaderModuleCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ShaderModuleCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ShaderModuleCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct ShaderModuleCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ShaderModuleCreateFlags:
        return ShaderModuleCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct EventCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: EventCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: EventCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: EventCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: EventCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct EventCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> EventCreateFlags:
        return EventCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct CommandPoolCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: CommandPoolCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: CommandPoolCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: CommandPoolCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: CommandPoolCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime TRANSIENT = CommandPoolCreateFlagBits(value = 1 << 0)
    comptime RESET_COMMAND_BUFFER = CommandPoolCreateFlagBits(value = 1 << 1)


@register_passable("trivial")
struct CommandPoolCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> CommandPoolCreateFlags:
        return CommandPoolCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct CommandPoolResetFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: CommandPoolResetFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: CommandPoolResetFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: CommandPoolResetFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: CommandPoolResetFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime RELEASE_RESOURCES = CommandPoolResetFlagBits(value = 1 << 0)


@register_passable("trivial")
struct CommandPoolResetFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> CommandPoolResetFlags:
        return CommandPoolResetFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct CommandBufferResetFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: CommandBufferResetFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: CommandBufferResetFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: CommandBufferResetFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: CommandBufferResetFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime RELEASE_RESOURCES = CommandBufferResetFlagBits(value = 1 << 0)


@register_passable("trivial")
struct CommandBufferResetFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> CommandBufferResetFlags:
        return CommandBufferResetFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct CommandBufferUsageFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: CommandBufferUsageFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: CommandBufferUsageFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: CommandBufferUsageFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: CommandBufferUsageFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ONE_TIME_SUBMIT = CommandBufferUsageFlagBits(value = 1 << 0)
    comptime RENDER_PASS_CONTINUE = CommandBufferUsageFlagBits(value = 1 << 1)
    comptime SIMULTANEOUS_USE = CommandBufferUsageFlagBits(value = 1 << 2)


@register_passable("trivial")
struct CommandBufferUsageFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> CommandBufferUsageFlags:
        return CommandBufferUsageFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct QueryPipelineStatisticFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: QueryPipelineStatisticFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: QueryPipelineStatisticFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: QueryPipelineStatisticFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: QueryPipelineStatisticFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime INPUT_ASSEMBLY_VERTICES = QueryPipelineStatisticFlagBits(value = 1 << 0)
    comptime INPUT_ASSEMBLY_PRIMITIVES = QueryPipelineStatisticFlagBits(value = 1 << 1)
    comptime VERTEX_SHADER_INVOCATIONS = QueryPipelineStatisticFlagBits(value = 1 << 2)
    comptime GEOMETRY_SHADER_INVOCATIONS = QueryPipelineStatisticFlagBits(value = 1 << 3)
    comptime GEOMETRY_SHADER_PRIMITIVES = QueryPipelineStatisticFlagBits(value = 1 << 4)
    comptime CLIPPING_INVOCATIONS = QueryPipelineStatisticFlagBits(value = 1 << 5)
    comptime CLIPPING_PRIMITIVES = QueryPipelineStatisticFlagBits(value = 1 << 6)
    comptime FRAGMENT_SHADER_INVOCATIONS = QueryPipelineStatisticFlagBits(value = 1 << 7)
    comptime TESSELLATION_CONTROL_SHADER_PATCHES = QueryPipelineStatisticFlagBits(value = 1 << 8)
    comptime TESSELLATION_EVALUATION_SHADER_INVOCATIONS = QueryPipelineStatisticFlagBits(value = 1 << 9)
    comptime COMPUTE_SHADER_INVOCATIONS = QueryPipelineStatisticFlagBits(value = 1 << 10)


@register_passable("trivial")
struct QueryPipelineStatisticFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> QueryPipelineStatisticFlags:
        return QueryPipelineStatisticFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct MemoryMapFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: MemoryMapFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: MemoryMapFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: MemoryMapFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: MemoryMapFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct MemoryMapFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> MemoryMapFlags:
        return MemoryMapFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct MemoryUnmapFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: MemoryUnmapFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: MemoryUnmapFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: MemoryUnmapFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: MemoryUnmapFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct MemoryUnmapFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> MemoryUnmapFlags:
        return MemoryUnmapFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ImageAspectFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ImageAspectFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ImageAspectFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ImageAspectFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ImageAspectFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime COLOR = ImageAspectFlagBits(value = 1 << 0)
    comptime DEPTH = ImageAspectFlagBits(value = 1 << 1)
    comptime STENCIL = ImageAspectFlagBits(value = 1 << 2)
    comptime METADATA = ImageAspectFlagBits(value = 1 << 3)


@register_passable("trivial")
struct ImageAspectFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ImageAspectFlags:
        return ImageAspectFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct SparseMemoryBindFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SparseMemoryBindFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SparseMemoryBindFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SparseMemoryBindFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SparseMemoryBindFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime METADATA = SparseMemoryBindFlagBits(value = 1 << 0)


@register_passable("trivial")
struct SparseMemoryBindFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SparseMemoryBindFlags:
        return SparseMemoryBindFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct SparseImageFormatFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SparseImageFormatFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SparseImageFormatFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SparseImageFormatFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SparseImageFormatFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime SINGLE_MIPTAIL = SparseImageFormatFlagBits(value = 1 << 0)
    comptime ALIGNED_MIP_SIZE = SparseImageFormatFlagBits(value = 1 << 1)
    comptime NONSTANDARD_BLOCK_SIZE = SparseImageFormatFlagBits(value = 1 << 2)


@register_passable("trivial")
struct SparseImageFormatFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SparseImageFormatFlags:
        return SparseImageFormatFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct SubpassDescriptionFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SubpassDescriptionFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SubpassDescriptionFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SubpassDescriptionFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SubpassDescriptionFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct SubpassDescriptionFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SubpassDescriptionFlags:
        return SubpassDescriptionFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineStageFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineStageFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineStageFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineStageFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineStageFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime TOP_OF_PIPE = PipelineStageFlagBits(value = 1 << 0)
    comptime DRAW_INDIRECT = PipelineStageFlagBits(value = 1 << 1)
    comptime VERTEX_INPUT = PipelineStageFlagBits(value = 1 << 2)
    comptime VERTEX_SHADER = PipelineStageFlagBits(value = 1 << 3)
    comptime TESSELLATION_CONTROL_SHADER = PipelineStageFlagBits(value = 1 << 4)
    comptime TESSELLATION_EVALUATION_SHADER = PipelineStageFlagBits(value = 1 << 5)
    comptime GEOMETRY_SHADER = PipelineStageFlagBits(value = 1 << 6)
    comptime FRAGMENT_SHADER = PipelineStageFlagBits(value = 1 << 7)
    comptime EARLY_FRAGMENT_TESTS = PipelineStageFlagBits(value = 1 << 8)
    comptime LATE_FRAGMENT_TESTS = PipelineStageFlagBits(value = 1 << 9)
    comptime COLOR_ATTACHMENT_OUTPUT = PipelineStageFlagBits(value = 1 << 10)
    comptime COMPUTE_SHADER = PipelineStageFlagBits(value = 1 << 11)
    comptime TRANSFER = PipelineStageFlagBits(value = 1 << 12)
    comptime BOTTOM_OF_PIPE = PipelineStageFlagBits(value = 1 << 13)
    comptime HOST = PipelineStageFlagBits(value = 1 << 14)
    comptime ALL_GRAPHICS = PipelineStageFlagBits(value = 1 << 15)
    comptime ALL_COMMANDS = PipelineStageFlagBits(value = 1 << 16)


@register_passable("trivial")
struct PipelineStageFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineStageFlags:
        return PipelineStageFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct SampleCountFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SampleCountFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SampleCountFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SampleCountFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SampleCountFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime N_1 = SampleCountFlagBits(value = 1 << 0)
    comptime N_2 = SampleCountFlagBits(value = 1 << 1)
    comptime N_4 = SampleCountFlagBits(value = 1 << 2)
    comptime N_8 = SampleCountFlagBits(value = 1 << 3)
    comptime N_16 = SampleCountFlagBits(value = 1 << 4)
    comptime N_32 = SampleCountFlagBits(value = 1 << 5)
    comptime N_64 = SampleCountFlagBits(value = 1 << 6)


@register_passable("trivial")
struct SampleCountFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SampleCountFlags:
        return SampleCountFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct AttachmentDescriptionFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: AttachmentDescriptionFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: AttachmentDescriptionFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: AttachmentDescriptionFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: AttachmentDescriptionFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime MAY_ALIAS = AttachmentDescriptionFlagBits(value = 1 << 0)


@register_passable("trivial")
struct AttachmentDescriptionFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> AttachmentDescriptionFlags:
        return AttachmentDescriptionFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct StencilFaceFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: StencilFaceFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: StencilFaceFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: StencilFaceFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: StencilFaceFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime FRONT_AND_BACK = StencilFaceFlagBits(value = 3)
    comptime FRONT = StencilFaceFlagBits(value = 1 << 0)
    comptime BACK = StencilFaceFlagBits(value = 1 << 1)


@register_passable("trivial")
struct StencilFaceFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> StencilFaceFlags:
        return StencilFaceFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct CullModeFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: CullModeFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: CullModeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: CullModeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: CullModeFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime NONE = CullModeFlagBits(value = 0)
    comptime FRONT_AND_BACK = CullModeFlagBits(value = 3)
    comptime FRONT = CullModeFlagBits(value = 1 << 0)
    comptime BACK = CullModeFlagBits(value = 1 << 1)


@register_passable("trivial")
struct CullModeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> CullModeFlags:
        return CullModeFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct DescriptorPoolCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DescriptorPoolCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DescriptorPoolCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DescriptorPoolCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DescriptorPoolCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime FREE_DESCRIPTOR_SET = DescriptorPoolCreateFlagBits(value = 1 << 0)


@register_passable("trivial")
struct DescriptorPoolCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DescriptorPoolCreateFlags:
        return DescriptorPoolCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct DescriptorPoolResetFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DescriptorPoolResetFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DescriptorPoolResetFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DescriptorPoolResetFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DescriptorPoolResetFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DescriptorPoolResetFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DescriptorPoolResetFlags:
        return DescriptorPoolResetFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct DependencyFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DependencyFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DependencyFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DependencyFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DependencyFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime BY_REGION = DependencyFlagBits(value = 1 << 0)


@register_passable("trivial")
struct DependencyFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DependencyFlags:
        return DependencyFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct SubgroupFeatureFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SubgroupFeatureFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SubgroupFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SubgroupFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SubgroupFeatureFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime BASIC = SubgroupFeatureFlagBits(value = 1 << 0)
    comptime VOTE = SubgroupFeatureFlagBits(value = 1 << 1)
    comptime ARITHMETIC = SubgroupFeatureFlagBits(value = 1 << 2)
    comptime BALLOT = SubgroupFeatureFlagBits(value = 1 << 3)
    comptime SHUFFLE = SubgroupFeatureFlagBits(value = 1 << 4)
    comptime SHUFFLE_RELATIVE = SubgroupFeatureFlagBits(value = 1 << 5)
    comptime CLUSTERED = SubgroupFeatureFlagBits(value = 1 << 6)
    comptime QUAD = SubgroupFeatureFlagBits(value = 1 << 7)


@register_passable("trivial")
struct SubgroupFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SubgroupFeatureFlags:
        return SubgroupFeatureFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct IndirectCommandsLayoutUsageFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: IndirectCommandsLayoutUsageFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: IndirectCommandsLayoutUsageFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: IndirectCommandsLayoutUsageFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: IndirectCommandsLayoutUsageFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime EXPLICIT_PREPROCESS_NV = IndirectCommandsLayoutUsageFlagBitsNV(value = 1 << 0)
    comptime INDEXED_SEQUENCES_NV = IndirectCommandsLayoutUsageFlagBitsNV(value = 1 << 1)
    comptime UNORDERED_SEQUENCES_NV = IndirectCommandsLayoutUsageFlagBitsNV(value = 1 << 2)


@register_passable("trivial")
struct IndirectCommandsLayoutUsageFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> IndirectCommandsLayoutUsageFlagsNV:
        return IndirectCommandsLayoutUsageFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct IndirectStateFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: IndirectStateFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: IndirectStateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: IndirectStateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: IndirectStateFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime FLAG_FRONTFACE_NV = IndirectStateFlagBitsNV(value = 1 << 0)


@register_passable("trivial")
struct IndirectStateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> IndirectStateFlagsNV:
        return IndirectStateFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct GeometryFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: GeometryFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: GeometryFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: GeometryFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: GeometryFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime OPAQUE_KHR = GeometryFlagBitsKHR(value = 1 << 0)
    comptime NO_DUPLICATE_ANY_HIT_INVOCATION_KHR = GeometryFlagBitsKHR(value = 1 << 1)


@register_passable("trivial")
struct GeometryFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> GeometryFlagsKHR:
        return GeometryFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct GeometryInstanceFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: GeometryInstanceFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: GeometryInstanceFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: GeometryInstanceFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: GeometryInstanceFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime TRIANGLE_FACING_CULL_DISABLE_KHR = GeometryInstanceFlagBitsKHR(value = 1 << 0)
    comptime TRIANGLE_FLIP_FACING_KHR = GeometryInstanceFlagBitsKHR(value = 1 << 1)
    comptime FORCE_OPAQUE_KHR = GeometryInstanceFlagBitsKHR(value = 1 << 2)
    comptime FORCE_NO_OPAQUE_KHR = GeometryInstanceFlagBitsKHR(value = 1 << 3)


@register_passable("trivial")
struct GeometryInstanceFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> GeometryInstanceFlagsKHR:
        return GeometryInstanceFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct ClusterAccelerationStructureGeometryFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ClusterAccelerationStructureGeometryFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ClusterAccelerationStructureGeometryFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ClusterAccelerationStructureGeometryFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ClusterAccelerationStructureGeometryFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime CULL_DISABLE_NV = ClusterAccelerationStructureGeometryFlagBitsNV(value = 1 << 0)
    comptime NO_DUPLICATE_ANYHIT_INVOCATION_NV = ClusterAccelerationStructureGeometryFlagBitsNV(value = 1 << 1)
    comptime OPAQUE_NV = ClusterAccelerationStructureGeometryFlagBitsNV(value = 1 << 2)


@register_passable("trivial")
struct ClusterAccelerationStructureGeometryFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ClusterAccelerationStructureGeometryFlagsNV:
        return ClusterAccelerationStructureGeometryFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct ClusterAccelerationStructureClusterFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ClusterAccelerationStructureClusterFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ClusterAccelerationStructureClusterFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ClusterAccelerationStructureClusterFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ClusterAccelerationStructureClusterFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ALLOW_DISABLE_OPACITY_MICROMAPS_NV = ClusterAccelerationStructureClusterFlagBitsNV(value = 1 << 0)


@register_passable("trivial")
struct ClusterAccelerationStructureClusterFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ClusterAccelerationStructureClusterFlagsNV:
        return ClusterAccelerationStructureClusterFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct ClusterAccelerationStructureAddressResolutionFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ClusterAccelerationStructureAddressResolutionFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ClusterAccelerationStructureAddressResolutionFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ClusterAccelerationStructureAddressResolutionFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ClusterAccelerationStructureAddressResolutionFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime NONE_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(value = 0)
    comptime INDIRECTED_DST_IMPLICIT_DATA_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(value = 1 << 0)
    comptime INDIRECTED_SCRATCH_DATA_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(value = 1 << 1)
    comptime INDIRECTED_DST_ADDRESS_ARRAY_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(value = 1 << 2)
    comptime INDIRECTED_DST_SIZES_ARRAY_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(value = 1 << 3)
    comptime INDIRECTED_SRC_INFOS_ARRAY_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(value = 1 << 4)
    comptime INDIRECTED_SRC_INFOS_COUNT_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(value = 1 << 5)


@register_passable("trivial")
struct ClusterAccelerationStructureAddressResolutionFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ClusterAccelerationStructureAddressResolutionFlagsNV:
        return ClusterAccelerationStructureAddressResolutionFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct BuildAccelerationStructureFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: BuildAccelerationStructureFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: BuildAccelerationStructureFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: BuildAccelerationStructureFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: BuildAccelerationStructureFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ALLOW_UPDATE_KHR = BuildAccelerationStructureFlagBitsKHR(value = 1 << 0)
    comptime ALLOW_COMPACTION_KHR = BuildAccelerationStructureFlagBitsKHR(value = 1 << 1)
    comptime PREFER_FAST_TRACE_KHR = BuildAccelerationStructureFlagBitsKHR(value = 1 << 2)
    comptime PREFER_FAST_BUILD_KHR = BuildAccelerationStructureFlagBitsKHR(value = 1 << 3)
    comptime LOW_MEMORY_KHR = BuildAccelerationStructureFlagBitsKHR(value = 1 << 4)


@register_passable("trivial")
struct BuildAccelerationStructureFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> BuildAccelerationStructureFlagsKHR:
        return BuildAccelerationStructureFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct PrivateDataSlotCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PrivateDataSlotCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PrivateDataSlotCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PrivateDataSlotCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PrivateDataSlotCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PrivateDataSlotCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PrivateDataSlotCreateFlags:
        return PrivateDataSlotCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct AccelerationStructureCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: AccelerationStructureCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: AccelerationStructureCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: AccelerationStructureCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: AccelerationStructureCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEVICE_ADDRESS_CAPTURE_REPLAY_KHR = AccelerationStructureCreateFlagBitsKHR(value = 1 << 0)


@register_passable("trivial")
struct AccelerationStructureCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> AccelerationStructureCreateFlagsKHR:
        return AccelerationStructureCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct DescriptorUpdateTemplateCreateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DescriptorUpdateTemplateCreateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DescriptorUpdateTemplateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DescriptorUpdateTemplateCreateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DescriptorUpdateTemplateCreateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DescriptorUpdateTemplateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DescriptorUpdateTemplateCreateFlags:
        return DescriptorUpdateTemplateCreateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineCreationFeedbackFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCreationFeedbackFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineCreationFeedbackFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineCreationFeedbackFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineCreationFeedbackFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime VALID = PipelineCreationFeedbackFlagBits(value = 1 << 0)
    comptime APPLICATION_PIPELINE_CACHE_HIT = PipelineCreationFeedbackFlagBits(value = 1 << 1)
    comptime BASE_PIPELINE_ACCELERATION = PipelineCreationFeedbackFlagBits(value = 1 << 2)


@register_passable("trivial")
struct PipelineCreationFeedbackFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineCreationFeedbackFlags:
        return PipelineCreationFeedbackFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PerformanceCounterDescriptionFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PerformanceCounterDescriptionFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PerformanceCounterDescriptionFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PerformanceCounterDescriptionFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PerformanceCounterDescriptionFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime PERFORMANCE_IMPACTING_KHR = PerformanceCounterDescriptionFlagBitsKHR(value = 1 << 0)
    comptime CONCURRENTLY_IMPACTED_KHR = PerformanceCounterDescriptionFlagBitsKHR(value = 1 << 1)


@register_passable("trivial")
struct PerformanceCounterDescriptionFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PerformanceCounterDescriptionFlagsKHR:
        return PerformanceCounterDescriptionFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct AcquireProfilingLockFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: AcquireProfilingLockFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: AcquireProfilingLockFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: AcquireProfilingLockFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: AcquireProfilingLockFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct AcquireProfilingLockFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> AcquireProfilingLockFlagsKHR:
        return AcquireProfilingLockFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct SemaphoreWaitFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SemaphoreWaitFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SemaphoreWaitFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SemaphoreWaitFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SemaphoreWaitFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ANY = SemaphoreWaitFlagBits(value = 1 << 0)


@register_passable("trivial")
struct SemaphoreWaitFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SemaphoreWaitFlags:
        return SemaphoreWaitFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineCompilerControlFlagsAMD(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCompilerControlFlagBitsAMD):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineCompilerControlFlagBitsAMD) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineCompilerControlFlagBitsAMD) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineCompilerControlFlagBitsAMD) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineCompilerControlFlagBitsAMD(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineCompilerControlFlagsAMD:
        return PipelineCompilerControlFlagsAMD(value = self.value() | bit.value())


@register_passable("trivial")
struct ShaderCorePropertiesFlagsAMD(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ShaderCorePropertiesFlagBitsAMD):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ShaderCorePropertiesFlagBitsAMD) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ShaderCorePropertiesFlagBitsAMD) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ShaderCorePropertiesFlagBitsAMD) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct ShaderCorePropertiesFlagBitsAMD(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ShaderCorePropertiesFlagsAMD:
        return ShaderCorePropertiesFlagsAMD(value = self.value() | bit.value())


@register_passable("trivial")
struct DeviceDiagnosticsConfigFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceDiagnosticsConfigFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DeviceDiagnosticsConfigFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DeviceDiagnosticsConfigFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DeviceDiagnosticsConfigFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ENABLE_SHADER_DEBUG_INFO_NV = DeviceDiagnosticsConfigFlagBitsNV(value = 1 << 0)
    comptime ENABLE_RESOURCE_TRACKING_NV = DeviceDiagnosticsConfigFlagBitsNV(value = 1 << 1)
    comptime ENABLE_AUTOMATIC_CHECKPOINTS_NV = DeviceDiagnosticsConfigFlagBitsNV(value = 1 << 2)
    comptime ENABLE_SHADER_ERROR_REPORTING_NV = DeviceDiagnosticsConfigFlagBitsNV(value = 1 << 3)


@register_passable("trivial")
struct DeviceDiagnosticsConfigFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DeviceDiagnosticsConfigFlagsNV:
        return DeviceDiagnosticsConfigFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct RefreshObjectFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: RefreshObjectFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: RefreshObjectFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: RefreshObjectFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: RefreshObjectFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct RefreshObjectFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> RefreshObjectFlagsKHR:
        return RefreshObjectFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct AccessFlags2(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: AccessFlagBits2):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: AccessFlagBits2) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: AccessFlagBits2) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: AccessFlagBits2) -> Bool:
        return Bool(self.value() & bit.value())

    comptime NONE = AccessFlagBits2(value = 0)
    comptime INDIRECT_COMMAND_READ = AccessFlagBits2(value = 1 << 0)
    comptime INDEX_READ = AccessFlagBits2(value = 1 << 1)
    comptime VERTEX_ATTRIBUTE_READ = AccessFlagBits2(value = 1 << 2)
    comptime UNIFORM_READ = AccessFlagBits2(value = 1 << 3)
    comptime INPUT_ATTACHMENT_READ = AccessFlagBits2(value = 1 << 4)
    comptime SHADER_READ = AccessFlagBits2(value = 1 << 5)
    comptime SHADER_WRITE = AccessFlagBits2(value = 1 << 6)
    comptime COLOR_ATTACHMENT_READ = AccessFlagBits2(value = 1 << 7)
    comptime COLOR_ATTACHMENT_WRITE = AccessFlagBits2(value = 1 << 8)
    comptime DEPTH_STENCIL_ATTACHMENT_READ = AccessFlagBits2(value = 1 << 9)
    comptime DEPTH_STENCIL_ATTACHMENT_WRITE = AccessFlagBits2(value = 1 << 10)
    comptime TRANSFER_READ = AccessFlagBits2(value = 1 << 11)
    comptime TRANSFER_WRITE = AccessFlagBits2(value = 1 << 12)
    comptime HOST_READ = AccessFlagBits2(value = 1 << 13)
    comptime HOST_WRITE = AccessFlagBits2(value = 1 << 14)
    comptime MEMORY_READ = AccessFlagBits2(value = 1 << 15)
    comptime MEMORY_WRITE = AccessFlagBits2(value = 1 << 16)
    comptime SHADER_SAMPLED_READ = AccessFlagBits2(value = 1 << 32)
    comptime SHADER_STORAGE_READ = AccessFlagBits2(value = 1 << 33)
    comptime SHADER_STORAGE_WRITE = AccessFlagBits2(value = 1 << 34)


@register_passable("trivial")
struct AccessFlagBits2(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> AccessFlags2:
        return AccessFlags2(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineStageFlags2(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: PipelineStageFlagBits2):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineStageFlagBits2) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineStageFlagBits2) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineStageFlagBits2) -> Bool:
        return Bool(self.value() & bit.value())

    comptime NONE = PipelineStageFlagBits2(value = 0)
    comptime TOP_OF_PIPE = PipelineStageFlagBits2(value = 1 << 0)
    comptime DRAW_INDIRECT = PipelineStageFlagBits2(value = 1 << 1)
    comptime VERTEX_INPUT = PipelineStageFlagBits2(value = 1 << 2)
    comptime VERTEX_SHADER = PipelineStageFlagBits2(value = 1 << 3)
    comptime TESSELLATION_CONTROL_SHADER = PipelineStageFlagBits2(value = 1 << 4)
    comptime TESSELLATION_EVALUATION_SHADER = PipelineStageFlagBits2(value = 1 << 5)
    comptime GEOMETRY_SHADER = PipelineStageFlagBits2(value = 1 << 6)
    comptime FRAGMENT_SHADER = PipelineStageFlagBits2(value = 1 << 7)
    comptime EARLY_FRAGMENT_TESTS = PipelineStageFlagBits2(value = 1 << 8)
    comptime LATE_FRAGMENT_TESTS = PipelineStageFlagBits2(value = 1 << 9)
    comptime COLOR_ATTACHMENT_OUTPUT = PipelineStageFlagBits2(value = 1 << 10)
    comptime COMPUTE_SHADER = PipelineStageFlagBits2(value = 1 << 11)
    comptime ALL_TRANSFER = PipelineStageFlagBits2(value = 1 << 12)
    comptime BOTTOM_OF_PIPE = PipelineStageFlagBits2(value = 1 << 13)
    comptime HOST = PipelineStageFlagBits2(value = 1 << 14)
    comptime ALL_GRAPHICS = PipelineStageFlagBits2(value = 1 << 15)
    comptime ALL_COMMANDS = PipelineStageFlagBits2(value = 1 << 16)
    comptime COPY = PipelineStageFlagBits2(value = 1 << 32)
    comptime RESOLVE = PipelineStageFlagBits2(value = 1 << 33)
    comptime BLIT = PipelineStageFlagBits2(value = 1 << 34)
    comptime CLEAR = PipelineStageFlagBits2(value = 1 << 35)
    comptime INDEX_INPUT = PipelineStageFlagBits2(value = 1 << 36)
    comptime VERTEX_ATTRIBUTE_INPUT = PipelineStageFlagBits2(value = 1 << 37)
    comptime PRE_RASTERIZATION_SHADERS = PipelineStageFlagBits2(value = 1 << 38)


@register_passable("trivial")
struct PipelineStageFlagBits2(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineStageFlags2:
        return PipelineStageFlags2(value = self.value() | bit.value())


@register_passable("trivial")
struct AccelerationStructureMotionInfoFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: AccelerationStructureMotionInfoFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: AccelerationStructureMotionInfoFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: AccelerationStructureMotionInfoFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: AccelerationStructureMotionInfoFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct AccelerationStructureMotionInfoFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> AccelerationStructureMotionInfoFlagsNV:
        return AccelerationStructureMotionInfoFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct AccelerationStructureMotionInstanceFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: AccelerationStructureMotionInstanceFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: AccelerationStructureMotionInstanceFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: AccelerationStructureMotionInstanceFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: AccelerationStructureMotionInstanceFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct AccelerationStructureMotionInstanceFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> AccelerationStructureMotionInstanceFlagsNV:
        return AccelerationStructureMotionInstanceFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct FormatFeatureFlags2(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: FormatFeatureFlagBits2):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: FormatFeatureFlagBits2) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: FormatFeatureFlagBits2) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: FormatFeatureFlagBits2) -> Bool:
        return Bool(self.value() & bit.value())

    comptime SAMPLED_IMAGE = FormatFeatureFlagBits2(value = 1 << 0)
    comptime STORAGE_IMAGE = FormatFeatureFlagBits2(value = 1 << 1)
    comptime STORAGE_IMAGE_ATOMIC = FormatFeatureFlagBits2(value = 1 << 2)
    comptime UNIFORM_TEXEL_BUFFER = FormatFeatureFlagBits2(value = 1 << 3)
    comptime STORAGE_TEXEL_BUFFER = FormatFeatureFlagBits2(value = 1 << 4)
    comptime STORAGE_TEXEL_BUFFER_ATOMIC = FormatFeatureFlagBits2(value = 1 << 5)
    comptime VERTEX_BUFFER = FormatFeatureFlagBits2(value = 1 << 6)
    comptime COLOR_ATTACHMENT = FormatFeatureFlagBits2(value = 1 << 7)
    comptime COLOR_ATTACHMENT_BLEND = FormatFeatureFlagBits2(value = 1 << 8)
    comptime DEPTH_STENCIL_ATTACHMENT = FormatFeatureFlagBits2(value = 1 << 9)
    comptime BLIT_SRC = FormatFeatureFlagBits2(value = 1 << 10)
    comptime BLIT_DST = FormatFeatureFlagBits2(value = 1 << 11)
    comptime SAMPLED_IMAGE_FILTER_LINEAR = FormatFeatureFlagBits2(value = 1 << 12)
    comptime TRANSFER_SRC = FormatFeatureFlagBits2(value = 1 << 14)
    comptime TRANSFER_DST = FormatFeatureFlagBits2(value = 1 << 15)
    comptime SAMPLED_IMAGE_FILTER_MINMAX = FormatFeatureFlagBits2(value = 1 << 16)
    comptime MIDPOINT_CHROMA_SAMPLES = FormatFeatureFlagBits2(value = 1 << 17)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER = FormatFeatureFlagBits2(value = 1 << 18)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER = FormatFeatureFlagBits2(value = 1 << 19)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT = FormatFeatureFlagBits2(value = 1 << 20)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE = FormatFeatureFlagBits2(value = 1 << 21)
    comptime DISJOINT = FormatFeatureFlagBits2(value = 1 << 22)
    comptime COSITED_CHROMA_SAMPLES = FormatFeatureFlagBits2(value = 1 << 23)
    comptime STORAGE_READ_WITHOUT_FORMAT = FormatFeatureFlagBits2(value = 1 << 31)
    comptime STORAGE_WRITE_WITHOUT_FORMAT = FormatFeatureFlagBits2(value = 1 << 32)
    comptime SAMPLED_IMAGE_DEPTH_COMPARISON = FormatFeatureFlagBits2(value = 1 << 33)


@register_passable("trivial")
struct FormatFeatureFlagBits2(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> FormatFeatureFlags2:
        return FormatFeatureFlags2(value = self.value() | bit.value())


@register_passable("trivial")
struct RenderingFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: RenderingFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: RenderingFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: RenderingFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: RenderingFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime CONTENTS_SECONDARY_COMMAND_BUFFERS = RenderingFlagBits(value = 1 << 0)
    comptime SUSPENDING = RenderingFlagBits(value = 1 << 1)
    comptime RESUMING = RenderingFlagBits(value = 1 << 2)


@register_passable("trivial")
struct RenderingFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> RenderingFlags:
        return RenderingFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct MemoryDecompressionMethodFlagsNV(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: MemoryDecompressionMethodFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: MemoryDecompressionMethodFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: MemoryDecompressionMethodFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: MemoryDecompressionMethodFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime GDEFLATE_1_0_NV = MemoryDecompressionMethodFlagBitsNV(value = 1 << 0)


@register_passable("trivial")
struct MemoryDecompressionMethodFlagBitsNV(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> MemoryDecompressionMethodFlagsNV:
        return MemoryDecompressionMethodFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct BuildMicromapFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: BuildMicromapFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: BuildMicromapFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: BuildMicromapFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: BuildMicromapFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime PREFER_FAST_TRACE_EXT = BuildMicromapFlagBitsEXT(value = 1 << 0)
    comptime PREFER_FAST_BUILD_EXT = BuildMicromapFlagBitsEXT(value = 1 << 1)
    comptime ALLOW_COMPACTION_EXT = BuildMicromapFlagBitsEXT(value = 1 << 2)


@register_passable("trivial")
struct BuildMicromapFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> BuildMicromapFlagsEXT:
        return BuildMicromapFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct MicromapCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: MicromapCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: MicromapCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: MicromapCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: MicromapCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEVICE_ADDRESS_CAPTURE_REPLAY_EXT = MicromapCreateFlagBitsEXT(value = 1 << 0)


@register_passable("trivial")
struct MicromapCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> MicromapCreateFlagsEXT:
        return MicromapCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct IndirectCommandsLayoutUsageFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: IndirectCommandsLayoutUsageFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: IndirectCommandsLayoutUsageFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: IndirectCommandsLayoutUsageFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: IndirectCommandsLayoutUsageFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime EXPLICIT_PREPROCESS_EXT = IndirectCommandsLayoutUsageFlagBitsEXT(value = 1 << 0)
    comptime UNORDERED_SEQUENCES_EXT = IndirectCommandsLayoutUsageFlagBitsEXT(value = 1 << 1)


@register_passable("trivial")
struct IndirectCommandsLayoutUsageFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> IndirectCommandsLayoutUsageFlagsEXT:
        return IndirectCommandsLayoutUsageFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct IndirectCommandsInputModeFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: IndirectCommandsInputModeFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: IndirectCommandsInputModeFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: IndirectCommandsInputModeFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: IndirectCommandsInputModeFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime VULKAN_INDEX_BUFFER_EXT = IndirectCommandsInputModeFlagBitsEXT(value = 1 << 0)
    comptime DXGI_INDEX_BUFFER_EXT = IndirectCommandsInputModeFlagBitsEXT(value = 1 << 1)


@register_passable("trivial")
struct IndirectCommandsInputModeFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> IndirectCommandsInputModeFlagsEXT:
        return IndirectCommandsInputModeFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct DirectDriverLoadingFlagsLUNARG(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DirectDriverLoadingFlagBitsLUNARG):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DirectDriverLoadingFlagBitsLUNARG) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DirectDriverLoadingFlagBitsLUNARG) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DirectDriverLoadingFlagBitsLUNARG) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DirectDriverLoadingFlagBitsLUNARG(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DirectDriverLoadingFlagsLUNARG:
        return DirectDriverLoadingFlagsLUNARG(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineCreateFlags2(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: PipelineCreateFlagBits2):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineCreateFlagBits2) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineCreateFlagBits2) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineCreateFlagBits2) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DISABLE_OPTIMIZATION = PipelineCreateFlagBits2(value = 1 << 0)
    comptime ALLOW_DERIVATIVES = PipelineCreateFlagBits2(value = 1 << 1)
    comptime DERIVATIVE = PipelineCreateFlagBits2(value = 1 << 2)
    comptime VIEW_INDEX_FROM_DEVICE_INDEX = PipelineCreateFlagBits2(value = 1 << 3)
    comptime DISPATCH_BASE = PipelineCreateFlagBits2(value = 1 << 4)
    comptime FAIL_ON_PIPELINE_COMPILE_REQUIRED = PipelineCreateFlagBits2(value = 1 << 8)
    comptime EARLY_RETURN_ON_FAILURE = PipelineCreateFlagBits2(value = 1 << 9)
    comptime NO_PROTECTED_ACCESS = PipelineCreateFlagBits2(value = 1 << 27)
    comptime PROTECTED_ACCESS_ONLY = PipelineCreateFlagBits2(value = 1 << 30)


@register_passable("trivial")
struct PipelineCreateFlagBits2(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineCreateFlags2:
        return PipelineCreateFlags2(value = self.value() | bit.value())


@register_passable("trivial")
struct BufferUsageFlags2(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: BufferUsageFlagBits2):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: BufferUsageFlagBits2) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: BufferUsageFlagBits2) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: BufferUsageFlagBits2) -> Bool:
        return Bool(self.value() & bit.value())

    comptime TRANSFER_SRC = BufferUsageFlagBits2(value = 1 << 0)
    comptime TRANSFER_DST = BufferUsageFlagBits2(value = 1 << 1)
    comptime UNIFORM_TEXEL_BUFFER = BufferUsageFlagBits2(value = 1 << 2)
    comptime STORAGE_TEXEL_BUFFER = BufferUsageFlagBits2(value = 1 << 3)
    comptime UNIFORM_BUFFER = BufferUsageFlagBits2(value = 1 << 4)
    comptime STORAGE_BUFFER = BufferUsageFlagBits2(value = 1 << 5)
    comptime INDEX_BUFFER = BufferUsageFlagBits2(value = 1 << 6)
    comptime VERTEX_BUFFER = BufferUsageFlagBits2(value = 1 << 7)
    comptime INDIRECT_BUFFER = BufferUsageFlagBits2(value = 1 << 8)


@register_passable("trivial")
struct BufferUsageFlagBits2(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> BufferUsageFlags2:
        return BufferUsageFlags2(value = self.value() | bit.value())


@register_passable("trivial")
struct TensorCreateFlagsARM(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: TensorCreateFlagBitsARM):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: TensorCreateFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: TensorCreateFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: TensorCreateFlagBitsARM) -> Bool:
        return Bool(self.value() & bit.value())

    comptime MUTABLE_FORMAT_ARM = TensorCreateFlagBitsARM(value = 1 << 0)
    comptime PROTECTED_ARM = TensorCreateFlagBitsARM(value = 1 << 1)


@register_passable("trivial")
struct TensorCreateFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> TensorCreateFlagsARM:
        return TensorCreateFlagsARM(value = self.value() | bit.value())


@register_passable("trivial")
struct TensorUsageFlagsARM(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: TensorUsageFlagBitsARM):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: TensorUsageFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: TensorUsageFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: TensorUsageFlagBitsARM) -> Bool:
        return Bool(self.value() & bit.value())

    comptime SHADER_ARM = TensorUsageFlagBitsARM(value = 1 << 1)
    comptime TRANSFER_SRC_ARM = TensorUsageFlagBitsARM(value = 1 << 2)
    comptime TRANSFER_DST_ARM = TensorUsageFlagBitsARM(value = 1 << 3)
    comptime IMAGE_ALIASING_ARM = TensorUsageFlagBitsARM(value = 1 << 4)


@register_passable("trivial")
struct TensorUsageFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> TensorUsageFlagsARM:
        return TensorUsageFlagsARM(value = self.value() | bit.value())


@register_passable("trivial")
struct TensorViewCreateFlagsARM(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: TensorViewCreateFlagBitsARM):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: TensorViewCreateFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: TensorViewCreateFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: TensorViewCreateFlagBitsARM) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct TensorViewCreateFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> TensorViewCreateFlagsARM:
        return TensorViewCreateFlagsARM(value = self.value() | bit.value())


@register_passable("trivial")
struct DataGraphPipelineSessionCreateFlagsARM(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: DataGraphPipelineSessionCreateFlagBitsARM):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DataGraphPipelineSessionCreateFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DataGraphPipelineSessionCreateFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DataGraphPipelineSessionCreateFlagBitsARM) -> Bool:
        return Bool(self.value() & bit.value())

    comptime PROTECTED_ARM = DataGraphPipelineSessionCreateFlagBitsARM(value = 1 << 0)


@register_passable("trivial")
struct DataGraphPipelineSessionCreateFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DataGraphPipelineSessionCreateFlagsARM:
        return DataGraphPipelineSessionCreateFlagsARM(value = self.value() | bit.value())


@register_passable("trivial")
struct DataGraphPipelineDispatchFlagsARM(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: DataGraphPipelineDispatchFlagBitsARM):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DataGraphPipelineDispatchFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DataGraphPipelineDispatchFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DataGraphPipelineDispatchFlagBitsARM) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DataGraphPipelineDispatchFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DataGraphPipelineDispatchFlagsARM:
        return DataGraphPipelineDispatchFlagsARM(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeRgbModelConversionFlagsVALVE(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeRgbModelConversionFlagBitsVALVE):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeRgbModelConversionFlagBitsVALVE) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeRgbModelConversionFlagBitsVALVE) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeRgbModelConversionFlagBitsVALVE) -> Bool:
        return Bool(self.value() & bit.value())

    comptime RGB_IDENTITY_VALVE = VideoEncodeRgbModelConversionFlagBitsVALVE(value = 1 << 0)
    comptime YCBCR_IDENTITY_VALVE = VideoEncodeRgbModelConversionFlagBitsVALVE(value = 1 << 1)
    comptime YCBCR_709_VALVE = VideoEncodeRgbModelConversionFlagBitsVALVE(value = 1 << 2)
    comptime YCBCR_601_VALVE = VideoEncodeRgbModelConversionFlagBitsVALVE(value = 1 << 3)
    comptime YCBCR_2020_VALVE = VideoEncodeRgbModelConversionFlagBitsVALVE(value = 1 << 4)


@register_passable("trivial")
struct VideoEncodeRgbModelConversionFlagBitsVALVE(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeRgbModelConversionFlagsVALVE:
        return VideoEncodeRgbModelConversionFlagsVALVE(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeRgbRangeCompressionFlagsVALVE(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeRgbRangeCompressionFlagBitsVALVE):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeRgbRangeCompressionFlagBitsVALVE) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeRgbRangeCompressionFlagBitsVALVE) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeRgbRangeCompressionFlagBitsVALVE) -> Bool:
        return Bool(self.value() & bit.value())

    comptime FULL_RANGE_VALVE = VideoEncodeRgbRangeCompressionFlagBitsVALVE(value = 1 << 0)
    comptime NARROW_RANGE_VALVE = VideoEncodeRgbRangeCompressionFlagBitsVALVE(value = 1 << 1)


@register_passable("trivial")
struct VideoEncodeRgbRangeCompressionFlagBitsVALVE(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeRgbRangeCompressionFlagsVALVE:
        return VideoEncodeRgbRangeCompressionFlagsVALVE(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeRgbChromaOffsetFlagsVALVE(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeRgbChromaOffsetFlagBitsVALVE):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeRgbChromaOffsetFlagBitsVALVE) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeRgbChromaOffsetFlagBitsVALVE) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeRgbChromaOffsetFlagBitsVALVE) -> Bool:
        return Bool(self.value() & bit.value())

    comptime COSITED_EVEN_VALVE = VideoEncodeRgbChromaOffsetFlagBitsVALVE(value = 1 << 0)
    comptime MIDPOINT_VALVE = VideoEncodeRgbChromaOffsetFlagBitsVALVE(value = 1 << 1)


@register_passable("trivial")
struct VideoEncodeRgbChromaOffsetFlagBitsVALVE(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeRgbChromaOffsetFlagsVALVE:
        return VideoEncodeRgbChromaOffsetFlagsVALVE(value = self.value() | bit.value())


@register_passable("trivial")
struct CompositeAlphaFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: CompositeAlphaFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: CompositeAlphaFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: CompositeAlphaFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: CompositeAlphaFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime OPAQUE_KHR = CompositeAlphaFlagBitsKHR(value = 1 << 0)
    comptime PRE_MULTIPLIED_KHR = CompositeAlphaFlagBitsKHR(value = 1 << 1)
    comptime POST_MULTIPLIED_KHR = CompositeAlphaFlagBitsKHR(value = 1 << 2)
    comptime INHERIT_KHR = CompositeAlphaFlagBitsKHR(value = 1 << 3)


@register_passable("trivial")
struct CompositeAlphaFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> CompositeAlphaFlagsKHR:
        return CompositeAlphaFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct DisplayPlaneAlphaFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DisplayPlaneAlphaFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DisplayPlaneAlphaFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DisplayPlaneAlphaFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DisplayPlaneAlphaFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime OPAQUE_KHR = DisplayPlaneAlphaFlagBitsKHR(value = 1 << 0)
    comptime GLOBAL_KHR = DisplayPlaneAlphaFlagBitsKHR(value = 1 << 1)
    comptime PER_PIXEL_KHR = DisplayPlaneAlphaFlagBitsKHR(value = 1 << 2)
    comptime PER_PIXEL_PREMULTIPLIED_KHR = DisplayPlaneAlphaFlagBitsKHR(value = 1 << 3)


@register_passable("trivial")
struct DisplayPlaneAlphaFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DisplayPlaneAlphaFlagsKHR:
        return DisplayPlaneAlphaFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct SurfaceTransformFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SurfaceTransformFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SurfaceTransformFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SurfaceTransformFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SurfaceTransformFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime IDENTITY_KHR = SurfaceTransformFlagBitsKHR(value = 1 << 0)
    comptime ROTATE_90_KHR = SurfaceTransformFlagBitsKHR(value = 1 << 1)
    comptime ROTATE_180_KHR = SurfaceTransformFlagBitsKHR(value = 1 << 2)
    comptime ROTATE_270_KHR = SurfaceTransformFlagBitsKHR(value = 1 << 3)
    comptime HORIZONTAL_MIRROR_KHR = SurfaceTransformFlagBitsKHR(value = 1 << 4)
    comptime HORIZONTAL_MIRROR_ROTATE_90_KHR = SurfaceTransformFlagBitsKHR(value = 1 << 5)
    comptime HORIZONTAL_MIRROR_ROTATE_180_KHR = SurfaceTransformFlagBitsKHR(value = 1 << 6)
    comptime HORIZONTAL_MIRROR_ROTATE_270_KHR = SurfaceTransformFlagBitsKHR(value = 1 << 7)
    comptime INHERIT_KHR = SurfaceTransformFlagBitsKHR(value = 1 << 8)


@register_passable("trivial")
struct SurfaceTransformFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SurfaceTransformFlagsKHR:
        return SurfaceTransformFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct SwapchainCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SwapchainCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SwapchainCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SwapchainCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SwapchainCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct SwapchainCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SwapchainCreateFlagsKHR:
        return SwapchainCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct DisplayModeCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DisplayModeCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DisplayModeCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DisplayModeCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DisplayModeCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DisplayModeCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DisplayModeCreateFlagsKHR:
        return DisplayModeCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct DisplaySurfaceCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DisplaySurfaceCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DisplaySurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DisplaySurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DisplaySurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DisplaySurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DisplaySurfaceCreateFlagsKHR:
        return DisplaySurfaceCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct AndroidSurfaceCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: AndroidSurfaceCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: AndroidSurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: AndroidSurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: AndroidSurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct AndroidSurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> AndroidSurfaceCreateFlagsKHR:
        return AndroidSurfaceCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct ViSurfaceCreateFlagsNN(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ViSurfaceCreateFlagBitsNN):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ViSurfaceCreateFlagBitsNN) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ViSurfaceCreateFlagBitsNN) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ViSurfaceCreateFlagBitsNN) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct ViSurfaceCreateFlagBitsNN(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ViSurfaceCreateFlagsNN:
        return ViSurfaceCreateFlagsNN(value = self.value() | bit.value())


@register_passable("trivial")
struct WaylandSurfaceCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: WaylandSurfaceCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: WaylandSurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: WaylandSurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: WaylandSurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct WaylandSurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> WaylandSurfaceCreateFlagsKHR:
        return WaylandSurfaceCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct Win32SurfaceCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: Win32SurfaceCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Win32SurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: Win32SurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: Win32SurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct Win32SurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> Win32SurfaceCreateFlagsKHR:
        return Win32SurfaceCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct XlibSurfaceCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: XlibSurfaceCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: XlibSurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: XlibSurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: XlibSurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct XlibSurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> XlibSurfaceCreateFlagsKHR:
        return XlibSurfaceCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct XcbSurfaceCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: XcbSurfaceCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: XcbSurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: XcbSurfaceCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: XcbSurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct XcbSurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> XcbSurfaceCreateFlagsKHR:
        return XcbSurfaceCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct DirectFBSurfaceCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DirectFBSurfaceCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DirectFBSurfaceCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DirectFBSurfaceCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DirectFBSurfaceCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DirectFBSurfaceCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DirectFBSurfaceCreateFlagsEXT:
        return DirectFBSurfaceCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct IOSSurfaceCreateFlagsMVK(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: IOSSurfaceCreateFlagBitsMVK):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: IOSSurfaceCreateFlagBitsMVK) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: IOSSurfaceCreateFlagBitsMVK) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: IOSSurfaceCreateFlagBitsMVK) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct IOSSurfaceCreateFlagBitsMVK(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> IOSSurfaceCreateFlagsMVK:
        return IOSSurfaceCreateFlagsMVK(value = self.value() | bit.value())


@register_passable("trivial")
struct MacOSSurfaceCreateFlagsMVK(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: MacOSSurfaceCreateFlagBitsMVK):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: MacOSSurfaceCreateFlagBitsMVK) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: MacOSSurfaceCreateFlagBitsMVK) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: MacOSSurfaceCreateFlagBitsMVK) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct MacOSSurfaceCreateFlagBitsMVK(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> MacOSSurfaceCreateFlagsMVK:
        return MacOSSurfaceCreateFlagsMVK(value = self.value() | bit.value())


@register_passable("trivial")
struct MetalSurfaceCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: MetalSurfaceCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: MetalSurfaceCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: MetalSurfaceCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: MetalSurfaceCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct MetalSurfaceCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> MetalSurfaceCreateFlagsEXT:
        return MetalSurfaceCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct ImagePipeSurfaceCreateFlagsFUCHSIA(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ImagePipeSurfaceCreateFlagBitsFUCHSIA):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ImagePipeSurfaceCreateFlagBitsFUCHSIA) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ImagePipeSurfaceCreateFlagBitsFUCHSIA) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ImagePipeSurfaceCreateFlagBitsFUCHSIA) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct ImagePipeSurfaceCreateFlagBitsFUCHSIA(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ImagePipeSurfaceCreateFlagsFUCHSIA:
        return ImagePipeSurfaceCreateFlagsFUCHSIA(value = self.value() | bit.value())


@register_passable("trivial")
struct StreamDescriptorSurfaceCreateFlagsGGP(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: StreamDescriptorSurfaceCreateFlagBitsGGP):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: StreamDescriptorSurfaceCreateFlagBitsGGP) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: StreamDescriptorSurfaceCreateFlagBitsGGP) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: StreamDescriptorSurfaceCreateFlagBitsGGP) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct StreamDescriptorSurfaceCreateFlagBitsGGP(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> StreamDescriptorSurfaceCreateFlagsGGP:
        return StreamDescriptorSurfaceCreateFlagsGGP(value = self.value() | bit.value())


@register_passable("trivial")
struct HeadlessSurfaceCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: HeadlessSurfaceCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: HeadlessSurfaceCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: HeadlessSurfaceCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: HeadlessSurfaceCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct HeadlessSurfaceCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> HeadlessSurfaceCreateFlagsEXT:
        return HeadlessSurfaceCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct ScreenSurfaceCreateFlagsQNX(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ScreenSurfaceCreateFlagBitsQNX):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ScreenSurfaceCreateFlagBitsQNX) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ScreenSurfaceCreateFlagBitsQNX) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ScreenSurfaceCreateFlagBitsQNX) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct ScreenSurfaceCreateFlagBitsQNX(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ScreenSurfaceCreateFlagsQNX:
        return ScreenSurfaceCreateFlagsQNX(value = self.value() | bit.value())


@register_passable("trivial")
struct PeerMemoryFeatureFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PeerMemoryFeatureFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PeerMemoryFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PeerMemoryFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PeerMemoryFeatureFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime COPY_SRC = PeerMemoryFeatureFlagBits(value = 1 << 0)
    comptime COPY_DST = PeerMemoryFeatureFlagBits(value = 1 << 1)
    comptime GENERIC_SRC = PeerMemoryFeatureFlagBits(value = 1 << 2)
    comptime GENERIC_DST = PeerMemoryFeatureFlagBits(value = 1 << 3)


@register_passable("trivial")
struct PeerMemoryFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PeerMemoryFeatureFlags:
        return PeerMemoryFeatureFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct MemoryAllocateFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: MemoryAllocateFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: MemoryAllocateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: MemoryAllocateFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: MemoryAllocateFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEVICE_MASK = MemoryAllocateFlagBits(value = 1 << 0)


@register_passable("trivial")
struct MemoryAllocateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> MemoryAllocateFlags:
        return MemoryAllocateFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct DeviceGroupPresentModeFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceGroupPresentModeFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DeviceGroupPresentModeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DeviceGroupPresentModeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DeviceGroupPresentModeFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime LOCAL_KHR = DeviceGroupPresentModeFlagBitsKHR(value = 1 << 0)
    comptime REMOTE_KHR = DeviceGroupPresentModeFlagBitsKHR(value = 1 << 1)
    comptime SUM_KHR = DeviceGroupPresentModeFlagBitsKHR(value = 1 << 2)
    comptime LOCAL_MULTI_DEVICE_KHR = DeviceGroupPresentModeFlagBitsKHR(value = 1 << 3)


@register_passable("trivial")
struct DeviceGroupPresentModeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DeviceGroupPresentModeFlagsKHR:
        return DeviceGroupPresentModeFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct DebugReportFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DebugReportFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DebugReportFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DebugReportFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DebugReportFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime INFORMATION_EXT = DebugReportFlagBitsEXT(value = 1 << 0)
    comptime WARNING_EXT = DebugReportFlagBitsEXT(value = 1 << 1)
    comptime PERFORMANCE_WARNING_EXT = DebugReportFlagBitsEXT(value = 1 << 2)
    comptime ERROR_EXT = DebugReportFlagBitsEXT(value = 1 << 3)
    comptime DEBUG_EXT = DebugReportFlagBitsEXT(value = 1 << 4)


@register_passable("trivial")
struct DebugReportFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DebugReportFlagsEXT:
        return DebugReportFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct CommandPoolTrimFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: CommandPoolTrimFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: CommandPoolTrimFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: CommandPoolTrimFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: CommandPoolTrimFlagBits) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct CommandPoolTrimFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> CommandPoolTrimFlags:
        return CommandPoolTrimFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ExternalMemoryHandleTypeFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalMemoryHandleTypeFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ExternalMemoryHandleTypeFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ExternalMemoryHandleTypeFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ExternalMemoryHandleTypeFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime OPAQUE_WIN32_NV = ExternalMemoryHandleTypeFlagBitsNV(value = 1 << 0)
    comptime OPAQUE_WIN32_KMT_NV = ExternalMemoryHandleTypeFlagBitsNV(value = 1 << 1)
    comptime D3D11_IMAGE_NV = ExternalMemoryHandleTypeFlagBitsNV(value = 1 << 2)
    comptime D3D11_IMAGE_KMT_NV = ExternalMemoryHandleTypeFlagBitsNV(value = 1 << 3)


@register_passable("trivial")
struct ExternalMemoryHandleTypeFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ExternalMemoryHandleTypeFlagsNV:
        return ExternalMemoryHandleTypeFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct ClusterAccelerationStructureIndexFormatFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ClusterAccelerationStructureIndexFormatFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ClusterAccelerationStructureIndexFormatFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ClusterAccelerationStructureIndexFormatFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ClusterAccelerationStructureIndexFormatFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime N_8BIT_NV = ClusterAccelerationStructureIndexFormatFlagBitsNV(value = 1 << 0)
    comptime N_16BIT_NV = ClusterAccelerationStructureIndexFormatFlagBitsNV(value = 1 << 1)
    comptime N_32BIT_NV = ClusterAccelerationStructureIndexFormatFlagBitsNV(value = 1 << 2)


@register_passable("trivial")
struct ClusterAccelerationStructureIndexFormatFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ClusterAccelerationStructureIndexFormatFlagsNV:
        return ClusterAccelerationStructureIndexFormatFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct ExternalMemoryFeatureFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalMemoryFeatureFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ExternalMemoryFeatureFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ExternalMemoryFeatureFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ExternalMemoryFeatureFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEDICATED_ONLY_NV = ExternalMemoryFeatureFlagBitsNV(value = 1 << 0)
    comptime EXPORTABLE_NV = ExternalMemoryFeatureFlagBitsNV(value = 1 << 1)
    comptime IMPORTABLE_NV = ExternalMemoryFeatureFlagBitsNV(value = 1 << 2)


@register_passable("trivial")
struct ExternalMemoryFeatureFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ExternalMemoryFeatureFlagsNV:
        return ExternalMemoryFeatureFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct ExternalMemoryHandleTypeFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalMemoryHandleTypeFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ExternalMemoryHandleTypeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ExternalMemoryHandleTypeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ExternalMemoryHandleTypeFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime OPAQUE_FD = ExternalMemoryHandleTypeFlagBits(value = 1 << 0)
    comptime OPAQUE_WIN32 = ExternalMemoryHandleTypeFlagBits(value = 1 << 1)
    comptime OPAQUE_WIN32_KMT = ExternalMemoryHandleTypeFlagBits(value = 1 << 2)
    comptime D3D11_TEXTURE = ExternalMemoryHandleTypeFlagBits(value = 1 << 3)
    comptime D3D11_TEXTURE_KMT = ExternalMemoryHandleTypeFlagBits(value = 1 << 4)
    comptime D3D12_HEAP = ExternalMemoryHandleTypeFlagBits(value = 1 << 5)
    comptime D3D12_RESOURCE = ExternalMemoryHandleTypeFlagBits(value = 1 << 6)


@register_passable("trivial")
struct ExternalMemoryHandleTypeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ExternalMemoryHandleTypeFlags:
        return ExternalMemoryHandleTypeFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ExternalMemoryFeatureFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalMemoryFeatureFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ExternalMemoryFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ExternalMemoryFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ExternalMemoryFeatureFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEDICATED_ONLY = ExternalMemoryFeatureFlagBits(value = 1 << 0)
    comptime EXPORTABLE = ExternalMemoryFeatureFlagBits(value = 1 << 1)
    comptime IMPORTABLE = ExternalMemoryFeatureFlagBits(value = 1 << 2)


@register_passable("trivial")
struct ExternalMemoryFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ExternalMemoryFeatureFlags:
        return ExternalMemoryFeatureFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ExternalSemaphoreHandleTypeFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalSemaphoreHandleTypeFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ExternalSemaphoreHandleTypeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ExternalSemaphoreHandleTypeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ExternalSemaphoreHandleTypeFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime OPAQUE_FD = ExternalSemaphoreHandleTypeFlagBits(value = 1 << 0)
    comptime OPAQUE_WIN32 = ExternalSemaphoreHandleTypeFlagBits(value = 1 << 1)
    comptime OPAQUE_WIN32_KMT = ExternalSemaphoreHandleTypeFlagBits(value = 1 << 2)
    comptime D3D12_FENCE = ExternalSemaphoreHandleTypeFlagBits(value = 1 << 3)
    comptime SYNC_FD = ExternalSemaphoreHandleTypeFlagBits(value = 1 << 4)


@register_passable("trivial")
struct ExternalSemaphoreHandleTypeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ExternalSemaphoreHandleTypeFlags:
        return ExternalSemaphoreHandleTypeFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ExternalSemaphoreFeatureFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalSemaphoreFeatureFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ExternalSemaphoreFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ExternalSemaphoreFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ExternalSemaphoreFeatureFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime EXPORTABLE = ExternalSemaphoreFeatureFlagBits(value = 1 << 0)
    comptime IMPORTABLE = ExternalSemaphoreFeatureFlagBits(value = 1 << 1)


@register_passable("trivial")
struct ExternalSemaphoreFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ExternalSemaphoreFeatureFlags:
        return ExternalSemaphoreFeatureFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct SemaphoreImportFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SemaphoreImportFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SemaphoreImportFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SemaphoreImportFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SemaphoreImportFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime TEMPORARY = SemaphoreImportFlagBits(value = 1 << 0)


@register_passable("trivial")
struct SemaphoreImportFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SemaphoreImportFlags:
        return SemaphoreImportFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ExternalFenceHandleTypeFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalFenceHandleTypeFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ExternalFenceHandleTypeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ExternalFenceHandleTypeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ExternalFenceHandleTypeFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime OPAQUE_FD = ExternalFenceHandleTypeFlagBits(value = 1 << 0)
    comptime OPAQUE_WIN32 = ExternalFenceHandleTypeFlagBits(value = 1 << 1)
    comptime OPAQUE_WIN32_KMT = ExternalFenceHandleTypeFlagBits(value = 1 << 2)
    comptime SYNC_FD = ExternalFenceHandleTypeFlagBits(value = 1 << 3)


@register_passable("trivial")
struct ExternalFenceHandleTypeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ExternalFenceHandleTypeFlags:
        return ExternalFenceHandleTypeFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ExternalFenceFeatureFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalFenceFeatureFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ExternalFenceFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ExternalFenceFeatureFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ExternalFenceFeatureFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime EXPORTABLE = ExternalFenceFeatureFlagBits(value = 1 << 0)
    comptime IMPORTABLE = ExternalFenceFeatureFlagBits(value = 1 << 1)


@register_passable("trivial")
struct ExternalFenceFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ExternalFenceFeatureFlags:
        return ExternalFenceFeatureFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct FenceImportFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: FenceImportFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: FenceImportFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: FenceImportFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: FenceImportFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime TEMPORARY = FenceImportFlagBits(value = 1 << 0)


@register_passable("trivial")
struct FenceImportFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> FenceImportFlags:
        return FenceImportFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct SurfaceCounterFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SurfaceCounterFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SurfaceCounterFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SurfaceCounterFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SurfaceCounterFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime VBLANK_EXT = SurfaceCounterFlagBitsEXT(value = 1 << 0)


@register_passable("trivial")
struct SurfaceCounterFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SurfaceCounterFlagsEXT:
        return SurfaceCounterFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineViewportSwizzleStateCreateFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineViewportSwizzleStateCreateFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineViewportSwizzleStateCreateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineViewportSwizzleStateCreateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineViewportSwizzleStateCreateFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineViewportSwizzleStateCreateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineViewportSwizzleStateCreateFlagsNV:
        return PipelineViewportSwizzleStateCreateFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineDiscardRectangleStateCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineDiscardRectangleStateCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineDiscardRectangleStateCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineDiscardRectangleStateCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineDiscardRectangleStateCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineDiscardRectangleStateCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineDiscardRectangleStateCreateFlagsEXT:
        return PipelineDiscardRectangleStateCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineCoverageToColorStateCreateFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCoverageToColorStateCreateFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineCoverageToColorStateCreateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineCoverageToColorStateCreateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineCoverageToColorStateCreateFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineCoverageToColorStateCreateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineCoverageToColorStateCreateFlagsNV:
        return PipelineCoverageToColorStateCreateFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineCoverageModulationStateCreateFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCoverageModulationStateCreateFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineCoverageModulationStateCreateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineCoverageModulationStateCreateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineCoverageModulationStateCreateFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineCoverageModulationStateCreateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineCoverageModulationStateCreateFlagsNV:
        return PipelineCoverageModulationStateCreateFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineCoverageReductionStateCreateFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCoverageReductionStateCreateFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineCoverageReductionStateCreateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineCoverageReductionStateCreateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineCoverageReductionStateCreateFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineCoverageReductionStateCreateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineCoverageReductionStateCreateFlagsNV:
        return PipelineCoverageReductionStateCreateFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct ValidationCacheCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ValidationCacheCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ValidationCacheCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ValidationCacheCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ValidationCacheCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct ValidationCacheCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ValidationCacheCreateFlagsEXT:
        return ValidationCacheCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct DebugUtilsMessageSeverityFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DebugUtilsMessageSeverityFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DebugUtilsMessageSeverityFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DebugUtilsMessageSeverityFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DebugUtilsMessageSeverityFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime VERBOSE_EXT = DebugUtilsMessageSeverityFlagBitsEXT(value = 1 << 0)
    comptime INFO_EXT = DebugUtilsMessageSeverityFlagBitsEXT(value = 1 << 4)
    comptime WARNING_EXT = DebugUtilsMessageSeverityFlagBitsEXT(value = 1 << 8)
    comptime ERROR_EXT = DebugUtilsMessageSeverityFlagBitsEXT(value = 1 << 12)


@register_passable("trivial")
struct DebugUtilsMessageSeverityFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DebugUtilsMessageSeverityFlagsEXT:
        return DebugUtilsMessageSeverityFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct DebugUtilsMessageTypeFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DebugUtilsMessageTypeFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DebugUtilsMessageTypeFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DebugUtilsMessageTypeFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DebugUtilsMessageTypeFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime GENERAL_EXT = DebugUtilsMessageTypeFlagBitsEXT(value = 1 << 0)
    comptime VALIDATION_EXT = DebugUtilsMessageTypeFlagBitsEXT(value = 1 << 1)
    comptime PERFORMANCE_EXT = DebugUtilsMessageTypeFlagBitsEXT(value = 1 << 2)


@register_passable("trivial")
struct DebugUtilsMessageTypeFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DebugUtilsMessageTypeFlagsEXT:
        return DebugUtilsMessageTypeFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct DebugUtilsMessengerCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DebugUtilsMessengerCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DebugUtilsMessengerCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DebugUtilsMessengerCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DebugUtilsMessengerCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DebugUtilsMessengerCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DebugUtilsMessengerCreateFlagsEXT:
        return DebugUtilsMessengerCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct DebugUtilsMessengerCallbackDataFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DebugUtilsMessengerCallbackDataFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DebugUtilsMessengerCallbackDataFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DebugUtilsMessengerCallbackDataFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DebugUtilsMessengerCallbackDataFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DebugUtilsMessengerCallbackDataFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DebugUtilsMessengerCallbackDataFlagsEXT:
        return DebugUtilsMessengerCallbackDataFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct DeviceMemoryReportFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceMemoryReportFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DeviceMemoryReportFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DeviceMemoryReportFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DeviceMemoryReportFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct DeviceMemoryReportFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DeviceMemoryReportFlagsEXT:
        return DeviceMemoryReportFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineRasterizationConservativeStateCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineRasterizationConservativeStateCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineRasterizationConservativeStateCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineRasterizationConservativeStateCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineRasterizationConservativeStateCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineRasterizationConservativeStateCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineRasterizationConservativeStateCreateFlagsEXT:
        return PipelineRasterizationConservativeStateCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct DescriptorBindingFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DescriptorBindingFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DescriptorBindingFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DescriptorBindingFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DescriptorBindingFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime UPDATE_AFTER_BIND = DescriptorBindingFlagBits(value = 1 << 0)
    comptime UPDATE_UNUSED_WHILE_PENDING = DescriptorBindingFlagBits(value = 1 << 1)
    comptime PARTIALLY_BOUND = DescriptorBindingFlagBits(value = 1 << 2)
    comptime VARIABLE_DESCRIPTOR_COUNT = DescriptorBindingFlagBits(value = 1 << 3)


@register_passable("trivial")
struct DescriptorBindingFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DescriptorBindingFlags:
        return DescriptorBindingFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ConditionalRenderingFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ConditionalRenderingFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ConditionalRenderingFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ConditionalRenderingFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ConditionalRenderingFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime INVERTED_EXT = ConditionalRenderingFlagBitsEXT(value = 1 << 0)


@register_passable("trivial")
struct ConditionalRenderingFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ConditionalRenderingFlagsEXT:
        return ConditionalRenderingFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct ResolveModeFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ResolveModeFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ResolveModeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ResolveModeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ResolveModeFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime NONE = ResolveModeFlagBits(value = 0)
    comptime SAMPLE_ZERO = ResolveModeFlagBits(value = 1 << 0)
    comptime AVERAGE = ResolveModeFlagBits(value = 1 << 1)
    comptime MIN = ResolveModeFlagBits(value = 1 << 2)
    comptime MAX = ResolveModeFlagBits(value = 1 << 3)


@register_passable("trivial")
struct ResolveModeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ResolveModeFlags:
        return ResolveModeFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineRasterizationStateStreamCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineRasterizationStateStreamCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineRasterizationStateStreamCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineRasterizationStateStreamCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineRasterizationStateStreamCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineRasterizationStateStreamCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineRasterizationStateStreamCreateFlagsEXT:
        return PipelineRasterizationStateStreamCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct PipelineRasterizationDepthClipStateCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineRasterizationDepthClipStateCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PipelineRasterizationDepthClipStateCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PipelineRasterizationDepthClipStateCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PipelineRasterizationDepthClipStateCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct PipelineRasterizationDepthClipStateCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PipelineRasterizationDepthClipStateCreateFlagsEXT:
        return PipelineRasterizationDepthClipStateCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct SwapchainImageUsageFlagsANDROID(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SwapchainImageUsageFlagBitsANDROID):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SwapchainImageUsageFlagBitsANDROID) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SwapchainImageUsageFlagBitsANDROID) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SwapchainImageUsageFlagBitsANDROID) -> Bool:
        return Bool(self.value() & bit.value())

    comptime VK_SWAPCHAIN_IMAGE_USAGE_SHARED_ANDROID = SwapchainImageUsageFlagBitsANDROID(value = 1 << 0)


@register_passable("trivial")
struct SwapchainImageUsageFlagBitsANDROID(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SwapchainImageUsageFlagsANDROID:
        return SwapchainImageUsageFlagsANDROID(value = self.value() | bit.value())


@register_passable("trivial")
struct ToolPurposeFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ToolPurposeFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ToolPurposeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ToolPurposeFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ToolPurposeFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime VALIDATION = ToolPurposeFlagBits(value = 1 << 0)
    comptime PROFILING = ToolPurposeFlagBits(value = 1 << 1)
    comptime TRACING = ToolPurposeFlagBits(value = 1 << 2)
    comptime ADDITIONAL_FEATURES = ToolPurposeFlagBits(value = 1 << 3)
    comptime MODIFYING_FEATURES = ToolPurposeFlagBits(value = 1 << 4)


@register_passable("trivial")
struct ToolPurposeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ToolPurposeFlags:
        return ToolPurposeFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct SubmitFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SubmitFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SubmitFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SubmitFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SubmitFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime PROTECTED = SubmitFlagBits(value = 1 << 0)


@register_passable("trivial")
struct SubmitFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SubmitFlags:
        return SubmitFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct ImageFormatConstraintsFlagsFUCHSIA(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ImageFormatConstraintsFlagBitsFUCHSIA):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ImageFormatConstraintsFlagBitsFUCHSIA) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ImageFormatConstraintsFlagBitsFUCHSIA) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ImageFormatConstraintsFlagBitsFUCHSIA) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct ImageFormatConstraintsFlagBitsFUCHSIA(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ImageFormatConstraintsFlagsFUCHSIA:
        return ImageFormatConstraintsFlagsFUCHSIA(value = self.value() | bit.value())


@register_passable("trivial")
struct HostImageCopyFlags(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: HostImageCopyFlagBits):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: HostImageCopyFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: HostImageCopyFlagBits) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: HostImageCopyFlagBits) -> Bool:
        return Bool(self.value() & bit.value())

    comptime MEMCPY = HostImageCopyFlagBits(value = 1 << 0)


@register_passable("trivial")
struct HostImageCopyFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> HostImageCopyFlags:
        return HostImageCopyFlags(value = self.value() | bit.value())


@register_passable("trivial")
struct PartitionedAccelerationStructureInstanceFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PartitionedAccelerationStructureInstanceFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PartitionedAccelerationStructureInstanceFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PartitionedAccelerationStructureInstanceFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PartitionedAccelerationStructureInstanceFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime FLAG_TRIANGLE_FACING_CULL_DISABLE_NV = PartitionedAccelerationStructureInstanceFlagBitsNV(value = 1 << 0)
    comptime FLAG_TRIANGLE_FLIP_FACING_NV = PartitionedAccelerationStructureInstanceFlagBitsNV(value = 1 << 1)
    comptime FLAG_FORCE_OPAQUE_NV = PartitionedAccelerationStructureInstanceFlagBitsNV(value = 1 << 2)
    comptime FLAG_FORCE_NO_OPAQUE_NV = PartitionedAccelerationStructureInstanceFlagBitsNV(value = 1 << 3)
    comptime FLAG_ENABLE_EXPLICIT_BOUNDING_BOX_NV = PartitionedAccelerationStructureInstanceFlagBitsNV(value = 1 << 4)


@register_passable("trivial")
struct PartitionedAccelerationStructureInstanceFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PartitionedAccelerationStructureInstanceFlagsNV:
        return PartitionedAccelerationStructureInstanceFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct ImageConstraintsInfoFlagsFUCHSIA(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ImageConstraintsInfoFlagBitsFUCHSIA):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ImageConstraintsInfoFlagBitsFUCHSIA) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ImageConstraintsInfoFlagBitsFUCHSIA) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ImageConstraintsInfoFlagBitsFUCHSIA) -> Bool:
        return Bool(self.value() & bit.value())

    comptime CPU_READ_RARELY_FUCHSIA = ImageConstraintsInfoFlagBitsFUCHSIA(value = 1 << 0)
    comptime CPU_READ_OFTEN_FUCHSIA = ImageConstraintsInfoFlagBitsFUCHSIA(value = 1 << 1)
    comptime CPU_WRITE_RARELY_FUCHSIA = ImageConstraintsInfoFlagBitsFUCHSIA(value = 1 << 2)
    comptime CPU_WRITE_OFTEN_FUCHSIA = ImageConstraintsInfoFlagBitsFUCHSIA(value = 1 << 3)
    comptime PROTECTED_OPTIONAL_FUCHSIA = ImageConstraintsInfoFlagBitsFUCHSIA(value = 1 << 4)


@register_passable("trivial")
struct ImageConstraintsInfoFlagBitsFUCHSIA(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ImageConstraintsInfoFlagsFUCHSIA:
        return ImageConstraintsInfoFlagsFUCHSIA(value = self.value() | bit.value())


@register_passable("trivial")
struct GraphicsPipelineLibraryFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: GraphicsPipelineLibraryFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: GraphicsPipelineLibraryFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: GraphicsPipelineLibraryFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: GraphicsPipelineLibraryFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime VERTEX_INPUT_INTERFACE_EXT = GraphicsPipelineLibraryFlagBitsEXT(value = 1 << 0)
    comptime PRE_RASTERIZATION_SHADERS_EXT = GraphicsPipelineLibraryFlagBitsEXT(value = 1 << 1)
    comptime FRAGMENT_SHADER_EXT = GraphicsPipelineLibraryFlagBitsEXT(value = 1 << 2)
    comptime FRAGMENT_OUTPUT_INTERFACE_EXT = GraphicsPipelineLibraryFlagBitsEXT(value = 1 << 3)


@register_passable("trivial")
struct GraphicsPipelineLibraryFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> GraphicsPipelineLibraryFlagsEXT:
        return GraphicsPipelineLibraryFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct ImageCompressionFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ImageCompressionFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ImageCompressionFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ImageCompressionFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ImageCompressionFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEFAULT_EXT = ImageCompressionFlagBitsEXT(value = 0)
    comptime FIXED_RATE_DEFAULT_EXT = ImageCompressionFlagBitsEXT(value = 1 << 0)
    comptime FIXED_RATE_EXPLICIT_EXT = ImageCompressionFlagBitsEXT(value = 1 << 1)
    comptime DISABLED_EXT = ImageCompressionFlagBitsEXT(value = 1 << 2)


@register_passable("trivial")
struct ImageCompressionFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ImageCompressionFlagsEXT:
        return ImageCompressionFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct ImageCompressionFixedRateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ImageCompressionFixedRateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ImageCompressionFixedRateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ImageCompressionFixedRateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ImageCompressionFixedRateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime NONE_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 0)
    comptime N_1BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 0)
    comptime N_2BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 1)
    comptime N_3BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 2)
    comptime N_4BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 3)
    comptime N_5BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 4)
    comptime N_6BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 5)
    comptime N_7BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 6)
    comptime N_8BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 7)
    comptime N_9BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 8)
    comptime N_10BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 9)
    comptime N_11BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 10)
    comptime N_12BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 11)
    comptime N_13BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 12)
    comptime N_14BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 13)
    comptime N_15BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 14)
    comptime N_16BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 15)
    comptime N_17BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 16)
    comptime N_18BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 17)
    comptime N_19BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 18)
    comptime N_20BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 19)
    comptime N_21BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 20)
    comptime N_22BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 21)
    comptime N_23BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 22)
    comptime N_24BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(value = 1 << 23)


@register_passable("trivial")
struct ImageCompressionFixedRateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ImageCompressionFixedRateFlagsEXT:
        return ImageCompressionFixedRateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct ExportMetalObjectTypeFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ExportMetalObjectTypeFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ExportMetalObjectTypeFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ExportMetalObjectTypeFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ExportMetalObjectTypeFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime METAL_DEVICE_EXT = ExportMetalObjectTypeFlagBitsEXT(value = 1 << 0)
    comptime METAL_COMMAND_QUEUE_EXT = ExportMetalObjectTypeFlagBitsEXT(value = 1 << 1)
    comptime METAL_BUFFER_EXT = ExportMetalObjectTypeFlagBitsEXT(value = 1 << 2)
    comptime METAL_TEXTURE_EXT = ExportMetalObjectTypeFlagBitsEXT(value = 1 << 3)
    comptime METAL_IOSURFACE_EXT = ExportMetalObjectTypeFlagBitsEXT(value = 1 << 4)
    comptime METAL_SHARED_EVENT_EXT = ExportMetalObjectTypeFlagBitsEXT(value = 1 << 5)


@register_passable("trivial")
struct ExportMetalObjectTypeFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ExportMetalObjectTypeFlagsEXT:
        return ExportMetalObjectTypeFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct DeviceAddressBindingFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceAddressBindingFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: DeviceAddressBindingFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: DeviceAddressBindingFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: DeviceAddressBindingFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime INTERNAL_OBJECT_EXT = DeviceAddressBindingFlagBitsEXT(value = 1 << 0)


@register_passable("trivial")
struct DeviceAddressBindingFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> DeviceAddressBindingFlagsEXT:
        return DeviceAddressBindingFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct OpticalFlowGridSizeFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: OpticalFlowGridSizeFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: OpticalFlowGridSizeFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: OpticalFlowGridSizeFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: OpticalFlowGridSizeFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime UNKNOWN_NV = OpticalFlowGridSizeFlagBitsNV(value = 0)
    comptime N_1X1_NV = OpticalFlowGridSizeFlagBitsNV(value = 1 << 0)
    comptime N_2X2_NV = OpticalFlowGridSizeFlagBitsNV(value = 1 << 1)
    comptime N_4X4_NV = OpticalFlowGridSizeFlagBitsNV(value = 1 << 2)
    comptime N_8X8_NV = OpticalFlowGridSizeFlagBitsNV(value = 1 << 3)


@register_passable("trivial")
struct OpticalFlowGridSizeFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> OpticalFlowGridSizeFlagsNV:
        return OpticalFlowGridSizeFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct OpticalFlowUsageFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: OpticalFlowUsageFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: OpticalFlowUsageFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: OpticalFlowUsageFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: OpticalFlowUsageFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime UNKNOWN_NV = OpticalFlowUsageFlagBitsNV(value = 0)
    comptime INPUT_NV = OpticalFlowUsageFlagBitsNV(value = 1 << 0)
    comptime OUTPUT_NV = OpticalFlowUsageFlagBitsNV(value = 1 << 1)
    comptime HINT_NV = OpticalFlowUsageFlagBitsNV(value = 1 << 2)
    comptime COST_NV = OpticalFlowUsageFlagBitsNV(value = 1 << 3)
    comptime GLOBAL_FLOW_NV = OpticalFlowUsageFlagBitsNV(value = 1 << 4)


@register_passable("trivial")
struct OpticalFlowUsageFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> OpticalFlowUsageFlagsNV:
        return OpticalFlowUsageFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct OpticalFlowSessionCreateFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: OpticalFlowSessionCreateFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: OpticalFlowSessionCreateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: OpticalFlowSessionCreateFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: OpticalFlowSessionCreateFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ENABLE_HINT_NV = OpticalFlowSessionCreateFlagBitsNV(value = 1 << 0)
    comptime ENABLE_COST_NV = OpticalFlowSessionCreateFlagBitsNV(value = 1 << 1)
    comptime ENABLE_GLOBAL_FLOW_NV = OpticalFlowSessionCreateFlagBitsNV(value = 1 << 2)
    comptime ALLOW_REGIONS_NV = OpticalFlowSessionCreateFlagBitsNV(value = 1 << 3)
    comptime BOTH_DIRECTIONS_NV = OpticalFlowSessionCreateFlagBitsNV(value = 1 << 4)


@register_passable("trivial")
struct OpticalFlowSessionCreateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> OpticalFlowSessionCreateFlagsNV:
        return OpticalFlowSessionCreateFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct OpticalFlowExecuteFlagsNV(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: OpticalFlowExecuteFlagBitsNV):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: OpticalFlowExecuteFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: OpticalFlowExecuteFlagBitsNV) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: OpticalFlowExecuteFlagBitsNV) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DISABLE_TEMPORAL_HINTS_NV = OpticalFlowExecuteFlagBitsNV(value = 1 << 0)


@register_passable("trivial")
struct OpticalFlowExecuteFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> OpticalFlowExecuteFlagsNV:
        return OpticalFlowExecuteFlagsNV(value = self.value() | bit.value())


@register_passable("trivial")
struct FrameBoundaryFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: FrameBoundaryFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: FrameBoundaryFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: FrameBoundaryFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: FrameBoundaryFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime FRAME_END_EXT = FrameBoundaryFlagBitsEXT(value = 1 << 0)


@register_passable("trivial")
struct FrameBoundaryFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> FrameBoundaryFlagsEXT:
        return FrameBoundaryFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct PresentScalingFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PresentScalingFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PresentScalingFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PresentScalingFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PresentScalingFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ONE_TO_ONE_KHR = PresentScalingFlagBitsKHR(value = 1 << 0)
    comptime ASPECT_RATIO_STRETCH_KHR = PresentScalingFlagBitsKHR(value = 1 << 1)
    comptime STRETCH_KHR = PresentScalingFlagBitsKHR(value = 1 << 2)


@register_passable("trivial")
struct PresentScalingFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PresentScalingFlagsKHR:
        return PresentScalingFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct PresentGravityFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: PresentGravityFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PresentGravityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PresentGravityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PresentGravityFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime MIN_KHR = PresentGravityFlagBitsKHR(value = 1 << 0)
    comptime MAX_KHR = PresentGravityFlagBitsKHR(value = 1 << 1)
    comptime CENTERED_KHR = PresentGravityFlagBitsKHR(value = 1 << 2)


@register_passable("trivial")
struct PresentGravityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PresentGravityFlagsKHR:
        return PresentGravityFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct ShaderCreateFlagsEXT(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: ShaderCreateFlagBitsEXT):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: ShaderCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: ShaderCreateFlagBitsEXT) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: ShaderCreateFlagBitsEXT) -> Bool:
        return Bool(self.value() & bit.value())

    comptime LINK_STAGE_EXT = ShaderCreateFlagBitsEXT(value = 1 << 0)


@register_passable("trivial")
struct ShaderCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> ShaderCreateFlagsEXT:
        return ShaderCreateFlagsEXT(value = self.value() | bit.value())


@register_passable("trivial")
struct TileShadingRenderPassFlagsQCOM(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: TileShadingRenderPassFlagBitsQCOM):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: TileShadingRenderPassFlagBitsQCOM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: TileShadingRenderPassFlagBitsQCOM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: TileShadingRenderPassFlagBitsQCOM) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ENABLE_QCOM = TileShadingRenderPassFlagBitsQCOM(value = 1 << 0)
    comptime PER_TILE_EXECUTION_QCOM = TileShadingRenderPassFlagBitsQCOM(value = 1 << 1)


@register_passable("trivial")
struct TileShadingRenderPassFlagBitsQCOM(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> TileShadingRenderPassFlagsQCOM:
        return TileShadingRenderPassFlagsQCOM(value = self.value() | bit.value())


@register_passable("trivial")
struct PhysicalDeviceSchedulingControlsFlagsARM(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: PhysicalDeviceSchedulingControlsFlagBitsARM):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: PhysicalDeviceSchedulingControlsFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: PhysicalDeviceSchedulingControlsFlagBitsARM) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: PhysicalDeviceSchedulingControlsFlagBitsARM) -> Bool:
        return Bool(self.value() & bit.value())

    comptime SHADER_CORE_COUNT_ARM = PhysicalDeviceSchedulingControlsFlagBitsARM(value = 1 << 0)


@register_passable("trivial")
struct PhysicalDeviceSchedulingControlsFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> PhysicalDeviceSchedulingControlsFlagsARM:
        return PhysicalDeviceSchedulingControlsFlagsARM(value = self.value() | bit.value())


@register_passable("trivial")
struct SurfaceCreateFlagsOHOS(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: SurfaceCreateFlagBitsOHOS):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: SurfaceCreateFlagBitsOHOS) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: SurfaceCreateFlagBitsOHOS) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: SurfaceCreateFlagBitsOHOS) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct SurfaceCreateFlagBitsOHOS(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> SurfaceCreateFlagsOHOS:
        return SurfaceCreateFlagsOHOS(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoCodecOperationFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoCodecOperationFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoCodecOperationFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoCodecOperationFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoCodecOperationFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime NONE_KHR = VideoCodecOperationFlagBitsKHR(value = 0)


@register_passable("trivial")
struct VideoCodecOperationFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoCodecOperationFlagsKHR:
        return VideoCodecOperationFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoCapabilityFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoCapabilityFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoCapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoCapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoCapabilityFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime PROTECTED_CONTENT_KHR = VideoCapabilityFlagBitsKHR(value = 1 << 0)
    comptime SEPARATE_REFERENCE_IMAGES_KHR = VideoCapabilityFlagBitsKHR(value = 1 << 1)


@register_passable("trivial")
struct VideoCapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoCapabilityFlagsKHR:
        return VideoCapabilityFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoSessionCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoSessionCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoSessionCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoSessionCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoSessionCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime PROTECTED_CONTENT_KHR = VideoSessionCreateFlagBitsKHR(value = 1 << 0)


@register_passable("trivial")
struct VideoSessionCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoSessionCreateFlagsKHR:
        return VideoSessionCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoSessionParametersCreateFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoSessionParametersCreateFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoSessionParametersCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoSessionParametersCreateFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoSessionParametersCreateFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct VideoSessionParametersCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoSessionParametersCreateFlagsKHR:
        return VideoSessionParametersCreateFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoBeginCodingFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoBeginCodingFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoBeginCodingFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoBeginCodingFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoBeginCodingFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct VideoBeginCodingFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoBeginCodingFlagsKHR:
        return VideoBeginCodingFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEndCodingFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEndCodingFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEndCodingFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEndCodingFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEndCodingFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct VideoEndCodingFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEndCodingFlagsKHR:
        return VideoEndCodingFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoCodingControlFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoCodingControlFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoCodingControlFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoCodingControlFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoCodingControlFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime RESET_KHR = VideoCodingControlFlagBitsKHR(value = 1 << 0)


@register_passable("trivial")
struct VideoCodingControlFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoCodingControlFlagsKHR:
        return VideoCodingControlFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoDecodeUsageFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoDecodeUsageFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoDecodeUsageFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoDecodeUsageFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoDecodeUsageFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEFAULT_KHR = VideoDecodeUsageFlagBitsKHR(value = 0)
    comptime TRANSCODING_KHR = VideoDecodeUsageFlagBitsKHR(value = 1 << 0)
    comptime OFFLINE_KHR = VideoDecodeUsageFlagBitsKHR(value = 1 << 1)
    comptime STREAMING_KHR = VideoDecodeUsageFlagBitsKHR(value = 1 << 2)


@register_passable("trivial")
struct VideoDecodeUsageFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoDecodeUsageFlagsKHR:
        return VideoDecodeUsageFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoDecodeCapabilityFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoDecodeCapabilityFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoDecodeCapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoDecodeCapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoDecodeCapabilityFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DPB_AND_OUTPUT_COINCIDE_KHR = VideoDecodeCapabilityFlagBitsKHR(value = 1 << 0)
    comptime DPB_AND_OUTPUT_DISTINCT_KHR = VideoDecodeCapabilityFlagBitsKHR(value = 1 << 1)


@register_passable("trivial")
struct VideoDecodeCapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoDecodeCapabilityFlagsKHR:
        return VideoDecodeCapabilityFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoDecodeFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoDecodeFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoDecodeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoDecodeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoDecodeFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct VideoDecodeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoDecodeFlagsKHR:
        return VideoDecodeFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoDecodeH264PictureLayoutFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoDecodeH264PictureLayoutFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoDecodeH264PictureLayoutFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoDecodeH264PictureLayoutFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoDecodeH264PictureLayoutFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime PROGRESSIVE_KHR = VideoDecodeH264PictureLayoutFlagBitsKHR(value = 0)
    comptime INTERLACED_INTERLEAVED_LINES_KHR = VideoDecodeH264PictureLayoutFlagBitsKHR(value = 1 << 0)
    comptime INTERLACED_SEPARATE_PLANES_KHR = VideoDecodeH264PictureLayoutFlagBitsKHR(value = 1 << 1)


@register_passable("trivial")
struct VideoDecodeH264PictureLayoutFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoDecodeH264PictureLayoutFlagsKHR:
        return VideoDecodeH264PictureLayoutFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct VideoEncodeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeFlagsKHR:
        return VideoEncodeFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeUsageFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeUsageFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeUsageFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeUsageFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeUsageFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEFAULT_KHR = VideoEncodeUsageFlagBitsKHR(value = 0)
    comptime TRANSCODING_KHR = VideoEncodeUsageFlagBitsKHR(value = 1 << 0)
    comptime STREAMING_KHR = VideoEncodeUsageFlagBitsKHR(value = 1 << 1)
    comptime RECORDING_KHR = VideoEncodeUsageFlagBitsKHR(value = 1 << 2)
    comptime CONFERENCING_KHR = VideoEncodeUsageFlagBitsKHR(value = 1 << 3)


@register_passable("trivial")
struct VideoEncodeUsageFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeUsageFlagsKHR:
        return VideoEncodeUsageFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeContentFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeContentFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeContentFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeContentFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeContentFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEFAULT_KHR = VideoEncodeContentFlagBitsKHR(value = 0)
    comptime CAMERA_KHR = VideoEncodeContentFlagBitsKHR(value = 1 << 0)
    comptime DESKTOP_KHR = VideoEncodeContentFlagBitsKHR(value = 1 << 1)
    comptime RENDERED_KHR = VideoEncodeContentFlagBitsKHR(value = 1 << 2)


@register_passable("trivial")
struct VideoEncodeContentFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeContentFlagsKHR:
        return VideoEncodeContentFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeCapabilityFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeCapabilityFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeCapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeCapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeCapabilityFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime PRECEDING_EXTERNALLY_ENCODED_BYTES_KHR = VideoEncodeCapabilityFlagBitsKHR(value = 1 << 0)
    comptime INSUFFICIENT_BITSTREAM_BUFFER_RANGE_DETECTION_KHR = VideoEncodeCapabilityFlagBitsKHR(value = 1 << 1)


@register_passable("trivial")
struct VideoEncodeCapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeCapabilityFlagsKHR:
        return VideoEncodeCapabilityFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeFeedbackFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeFeedbackFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeFeedbackFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeFeedbackFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeFeedbackFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime BITSTREAM_BUFFER_OFFSET_KHR = VideoEncodeFeedbackFlagBitsKHR(value = 1 << 0)
    comptime BITSTREAM_BYTES_WRITTEN_KHR = VideoEncodeFeedbackFlagBitsKHR(value = 1 << 1)
    comptime BITSTREAM_HAS_OVERRIDES_KHR = VideoEncodeFeedbackFlagBitsKHR(value = 1 << 2)


@register_passable("trivial")
struct VideoEncodeFeedbackFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeFeedbackFlagsKHR:
        return VideoEncodeFeedbackFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeRateControlFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeRateControlFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeRateControlFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeRateControlFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeRateControlFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())


@register_passable("trivial")
struct VideoEncodeRateControlFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeRateControlFlagsKHR:
        return VideoEncodeRateControlFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeRateControlModeFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeRateControlModeFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeRateControlModeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeRateControlModeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeRateControlModeFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime DEFAULT_KHR = VideoEncodeRateControlModeFlagBitsKHR(value = 0)
    comptime DISABLED_KHR = VideoEncodeRateControlModeFlagBitsKHR(value = 1 << 0)
    comptime CBR_KHR = VideoEncodeRateControlModeFlagBitsKHR(value = 1 << 1)
    comptime VBR_KHR = VideoEncodeRateControlModeFlagBitsKHR(value = 1 << 2)


@register_passable("trivial")
struct VideoEncodeRateControlModeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeRateControlModeFlagsKHR:
        return VideoEncodeRateControlModeFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeIntraRefreshModeFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeIntraRefreshModeFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeIntraRefreshModeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeIntraRefreshModeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeIntraRefreshModeFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime NONE_KHR = VideoEncodeIntraRefreshModeFlagBitsKHR(value = 0)
    comptime PER_PICTURE_PARTITION_KHR = VideoEncodeIntraRefreshModeFlagBitsKHR(value = 1 << 0)
    comptime BLOCK_BASED_KHR = VideoEncodeIntraRefreshModeFlagBitsKHR(value = 1 << 1)
    comptime BLOCK_ROW_BASED_KHR = VideoEncodeIntraRefreshModeFlagBitsKHR(value = 1 << 2)
    comptime BLOCK_COLUMN_BASED_KHR = VideoEncodeIntraRefreshModeFlagBitsKHR(value = 1 << 3)


@register_passable("trivial")
struct VideoEncodeIntraRefreshModeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeIntraRefreshModeFlagsKHR:
        return VideoEncodeIntraRefreshModeFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoChromaSubsamplingFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoChromaSubsamplingFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoChromaSubsamplingFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoChromaSubsamplingFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoChromaSubsamplingFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime INVALID_KHR = VideoChromaSubsamplingFlagBitsKHR(value = 0)
    comptime MONOCHROME_KHR = VideoChromaSubsamplingFlagBitsKHR(value = 1 << 0)
    comptime N_420_KHR = VideoChromaSubsamplingFlagBitsKHR(value = 1 << 1)
    comptime N_422_KHR = VideoChromaSubsamplingFlagBitsKHR(value = 1 << 2)
    comptime N_444_KHR = VideoChromaSubsamplingFlagBitsKHR(value = 1 << 3)


@register_passable("trivial")
struct VideoChromaSubsamplingFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoChromaSubsamplingFlagsKHR:
        return VideoChromaSubsamplingFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoComponentBitDepthFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoComponentBitDepthFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoComponentBitDepthFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoComponentBitDepthFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoComponentBitDepthFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime INVALID_KHR = VideoComponentBitDepthFlagBitsKHR(value = 0)
    comptime N_8_KHR = VideoComponentBitDepthFlagBitsKHR(value = 1 << 0)
    comptime N_10_KHR = VideoComponentBitDepthFlagBitsKHR(value = 1 << 2)
    comptime N_12_KHR = VideoComponentBitDepthFlagBitsKHR(value = 1 << 4)


@register_passable("trivial")
struct VideoComponentBitDepthFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoComponentBitDepthFlagsKHR:
        return VideoComponentBitDepthFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeH264CapabilityFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH264CapabilityFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeH264CapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeH264CapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeH264CapabilityFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime HRD_COMPLIANCE_KHR = VideoEncodeH264CapabilityFlagBitsKHR(value = 1 << 0)
    comptime PREDICTION_WEIGHT_TABLE_GENERATED_KHR = VideoEncodeH264CapabilityFlagBitsKHR(value = 1 << 1)
    comptime ROW_UNALIGNED_SLICE_KHR = VideoEncodeH264CapabilityFlagBitsKHR(value = 1 << 2)
    comptime DIFFERENT_SLICE_TYPE_KHR = VideoEncodeH264CapabilityFlagBitsKHR(value = 1 << 3)
    comptime B_FRAME_IN_L0_LIST_KHR = VideoEncodeH264CapabilityFlagBitsKHR(value = 1 << 4)
    comptime B_FRAME_IN_L1_LIST_KHR = VideoEncodeH264CapabilityFlagBitsKHR(value = 1 << 5)
    comptime PER_PICTURE_TYPE_MIN_MAX_QP_KHR = VideoEncodeH264CapabilityFlagBitsKHR(value = 1 << 6)
    comptime PER_SLICE_CONSTANT_QP_KHR = VideoEncodeH264CapabilityFlagBitsKHR(value = 1 << 7)
    comptime GENERATE_PREFIX_NALU_KHR = VideoEncodeH264CapabilityFlagBitsKHR(value = 1 << 8)


@register_passable("trivial")
struct VideoEncodeH264CapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeH264CapabilityFlagsKHR:
        return VideoEncodeH264CapabilityFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeH264StdFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH264StdFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeH264StdFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeH264StdFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeH264StdFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime SEPARATE_COLOR_PLANE_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 0)
    comptime QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 1)
    comptime SCALING_MATRIX_PRESENT_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 2)
    comptime CHROMA_QP_INDEX_OFFSET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 3)
    comptime SECOND_CHROMA_QP_INDEX_OFFSET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 4)
    comptime PIC_INIT_QP_MINUS26_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 5)
    comptime WEIGHTED_PRED_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 6)
    comptime WEIGHTED_BIPRED_IDC_EXPLICIT_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 7)
    comptime WEIGHTED_BIPRED_IDC_IMPLICIT_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 8)
    comptime TRANSFORM_8X8_MODE_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 9)
    comptime DIRECT_SPATIAL_MV_PRED_FLAG_UNSET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 10)
    comptime ENTROPY_CODING_MODE_FLAG_UNSET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 11)
    comptime ENTROPY_CODING_MODE_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 12)
    comptime DIRECT_8X8_INFERENCE_FLAG_UNSET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 13)
    comptime CONSTRAINED_INTRA_PRED_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 14)
    comptime DEBLOCKING_FILTER_DISABLED_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 15)
    comptime DEBLOCKING_FILTER_ENABLED_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 16)
    comptime DEBLOCKING_FILTER_PARTIAL_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 17)
    comptime SLICE_QP_DELTA_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 19)
    comptime DIFFERENT_SLICE_QP_DELTA_KHR = VideoEncodeH264StdFlagBitsKHR(value = 1 << 20)


@register_passable("trivial")
struct VideoEncodeH264StdFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeH264StdFlagsKHR:
        return VideoEncodeH264StdFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeH264RateControlFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH264RateControlFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeH264RateControlFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeH264RateControlFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeH264RateControlFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ATTEMPT_HRD_COMPLIANCE_KHR = VideoEncodeH264RateControlFlagBitsKHR(value = 1 << 0)
    comptime REGULAR_GOP_KHR = VideoEncodeH264RateControlFlagBitsKHR(value = 1 << 1)
    comptime REFERENCE_PATTERN_FLAT_KHR = VideoEncodeH264RateControlFlagBitsKHR(value = 1 << 2)
    comptime REFERENCE_PATTERN_DYADIC_KHR = VideoEncodeH264RateControlFlagBitsKHR(value = 1 << 3)
    comptime TEMPORAL_LAYER_PATTERN_DYADIC_KHR = VideoEncodeH264RateControlFlagBitsKHR(value = 1 << 4)


@register_passable("trivial")
struct VideoEncodeH264RateControlFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeH264RateControlFlagsKHR:
        return VideoEncodeH264RateControlFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeH265CapabilityFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH265CapabilityFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeH265CapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeH265CapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeH265CapabilityFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime HRD_COMPLIANCE_KHR = VideoEncodeH265CapabilityFlagBitsKHR(value = 1 << 0)
    comptime PREDICTION_WEIGHT_TABLE_GENERATED_KHR = VideoEncodeH265CapabilityFlagBitsKHR(value = 1 << 1)
    comptime ROW_UNALIGNED_SLICE_SEGMENT_KHR = VideoEncodeH265CapabilityFlagBitsKHR(value = 1 << 2)
    comptime DIFFERENT_SLICE_SEGMENT_TYPE_KHR = VideoEncodeH265CapabilityFlagBitsKHR(value = 1 << 3)
    comptime B_FRAME_IN_L0_LIST_KHR = VideoEncodeH265CapabilityFlagBitsKHR(value = 1 << 4)
    comptime B_FRAME_IN_L1_LIST_KHR = VideoEncodeH265CapabilityFlagBitsKHR(value = 1 << 5)
    comptime PER_PICTURE_TYPE_MIN_MAX_QP_KHR = VideoEncodeH265CapabilityFlagBitsKHR(value = 1 << 6)
    comptime PER_SLICE_SEGMENT_CONSTANT_QP_KHR = VideoEncodeH265CapabilityFlagBitsKHR(value = 1 << 7)
    comptime MULTIPLE_TILES_PER_SLICE_SEGMENT_KHR = VideoEncodeH265CapabilityFlagBitsKHR(value = 1 << 8)
    comptime MULTIPLE_SLICE_SEGMENTS_PER_TILE_KHR = VideoEncodeH265CapabilityFlagBitsKHR(value = 1 << 9)


@register_passable("trivial")
struct VideoEncodeH265CapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeH265CapabilityFlagsKHR:
        return VideoEncodeH265CapabilityFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeH265StdFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH265StdFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeH265StdFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeH265StdFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeH265StdFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime SEPARATE_COLOR_PLANE_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 0)
    comptime SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 1)
    comptime SCALING_LIST_DATA_PRESENT_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 2)
    comptime PCM_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 3)
    comptime SPS_TEMPORAL_MVP_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 4)
    comptime INIT_QP_MINUS26_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 5)
    comptime WEIGHTED_PRED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 6)
    comptime WEIGHTED_BIPRED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 7)
    comptime LOG2_PARALLEL_MERGE_LEVEL_MINUS2_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 8)
    comptime SIGN_DATA_HIDING_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 9)
    comptime TRANSFORM_SKIP_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 10)
    comptime TRANSFORM_SKIP_ENABLED_FLAG_UNSET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 11)
    comptime PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 12)
    comptime TRANSQUANT_BYPASS_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 13)
    comptime CONSTRAINED_INTRA_PRED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 14)
    comptime ENTROPY_CODING_SYNC_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 15)
    comptime DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 16)
    comptime DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 17)
    comptime DEPENDENT_SLICE_SEGMENT_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 18)
    comptime SLICE_QP_DELTA_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 19)
    comptime DIFFERENT_SLICE_QP_DELTA_KHR = VideoEncodeH265StdFlagBitsKHR(value = 1 << 20)


@register_passable("trivial")
struct VideoEncodeH265StdFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeH265StdFlagsKHR:
        return VideoEncodeH265StdFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeH265RateControlFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH265RateControlFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeH265RateControlFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeH265RateControlFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeH265RateControlFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime ATTEMPT_HRD_COMPLIANCE_KHR = VideoEncodeH265RateControlFlagBitsKHR(value = 1 << 0)
    comptime REGULAR_GOP_KHR = VideoEncodeH265RateControlFlagBitsKHR(value = 1 << 1)
    comptime REFERENCE_PATTERN_FLAT_KHR = VideoEncodeH265RateControlFlagBitsKHR(value = 1 << 2)
    comptime REFERENCE_PATTERN_DYADIC_KHR = VideoEncodeH265RateControlFlagBitsKHR(value = 1 << 3)
    comptime TEMPORAL_SUB_LAYER_PATTERN_DYADIC_KHR = VideoEncodeH265RateControlFlagBitsKHR(value = 1 << 4)


@register_passable("trivial")
struct VideoEncodeH265RateControlFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeH265RateControlFlagsKHR:
        return VideoEncodeH265RateControlFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeH265CtbSizeFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH265CtbSizeFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeH265CtbSizeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeH265CtbSizeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeH265CtbSizeFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime N_16_KHR = VideoEncodeH265CtbSizeFlagBitsKHR(value = 1 << 0)
    comptime N_32_KHR = VideoEncodeH265CtbSizeFlagBitsKHR(value = 1 << 1)
    comptime N_64_KHR = VideoEncodeH265CtbSizeFlagBitsKHR(value = 1 << 2)


@register_passable("trivial")
struct VideoEncodeH265CtbSizeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeH265CtbSizeFlagsKHR:
        return VideoEncodeH265CtbSizeFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeH265TransformBlockSizeFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH265TransformBlockSizeFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeH265TransformBlockSizeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeH265TransformBlockSizeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeH265TransformBlockSizeFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime N_4_KHR = VideoEncodeH265TransformBlockSizeFlagBitsKHR(value = 1 << 0)
    comptime N_8_KHR = VideoEncodeH265TransformBlockSizeFlagBitsKHR(value = 1 << 1)
    comptime N_16_KHR = VideoEncodeH265TransformBlockSizeFlagBitsKHR(value = 1 << 2)
    comptime N_32_KHR = VideoEncodeH265TransformBlockSizeFlagBitsKHR(value = 1 << 3)


@register_passable("trivial")
struct VideoEncodeH265TransformBlockSizeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeH265TransformBlockSizeFlagsKHR:
        return VideoEncodeH265TransformBlockSizeFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeAV1CapabilityFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeAV1CapabilityFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeAV1CapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeAV1CapabilityFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeAV1CapabilityFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime PER_RATE_CONTROL_GROUP_MIN_MAX_Q_INDEX_KHR = VideoEncodeAV1CapabilityFlagBitsKHR(value = 1 << 0)
    comptime GENERATE_OBU_EXTENSION_HEADER_KHR = VideoEncodeAV1CapabilityFlagBitsKHR(value = 1 << 1)
    comptime PRIMARY_REFERENCE_CDF_ONLY_KHR = VideoEncodeAV1CapabilityFlagBitsKHR(value = 1 << 2)
    comptime FRAME_SIZE_OVERRIDE_KHR = VideoEncodeAV1CapabilityFlagBitsKHR(value = 1 << 3)
    comptime MOTION_VECTOR_SCALING_KHR = VideoEncodeAV1CapabilityFlagBitsKHR(value = 1 << 4)


@register_passable("trivial")
struct VideoEncodeAV1CapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeAV1CapabilityFlagsKHR:
        return VideoEncodeAV1CapabilityFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeAV1StdFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeAV1StdFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeAV1StdFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeAV1StdFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeAV1StdFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime UNIFORM_TILE_SPACING_FLAG_SET_KHR = VideoEncodeAV1StdFlagBitsKHR(value = 1 << 0)
    comptime SKIP_MODE_PRESENT_UNSET_KHR = VideoEncodeAV1StdFlagBitsKHR(value = 1 << 1)
    comptime PRIMARY_REF_FRAME_KHR = VideoEncodeAV1StdFlagBitsKHR(value = 1 << 2)
    comptime DELTA_Q_KHR = VideoEncodeAV1StdFlagBitsKHR(value = 1 << 3)


@register_passable("trivial")
struct VideoEncodeAV1StdFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeAV1StdFlagsKHR:
        return VideoEncodeAV1StdFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeAV1RateControlFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeAV1RateControlFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeAV1RateControlFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeAV1RateControlFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeAV1RateControlFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime REGULAR_GOP_KHR = VideoEncodeAV1RateControlFlagBitsKHR(value = 1 << 0)
    comptime TEMPORAL_LAYER_PATTERN_DYADIC_KHR = VideoEncodeAV1RateControlFlagBitsKHR(value = 1 << 1)
    comptime REFERENCE_PATTERN_FLAT_KHR = VideoEncodeAV1RateControlFlagBitsKHR(value = 1 << 2)
    comptime REFERENCE_PATTERN_DYADIC_KHR = VideoEncodeAV1RateControlFlagBitsKHR(value = 1 << 3)


@register_passable("trivial")
struct VideoEncodeAV1RateControlFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeAV1RateControlFlagsKHR:
        return VideoEncodeAV1RateControlFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct VideoEncodeAV1SuperblockSizeFlagsKHR(Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeAV1SuperblockSizeFlagBitsKHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: VideoEncodeAV1SuperblockSizeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: VideoEncodeAV1SuperblockSizeFlagBitsKHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: VideoEncodeAV1SuperblockSizeFlagBitsKHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime N_64_KHR = VideoEncodeAV1SuperblockSizeFlagBitsKHR(value = 1 << 0)
    comptime N_128_KHR = VideoEncodeAV1SuperblockSizeFlagBitsKHR(value = 1 << 1)


@register_passable("trivial")
struct VideoEncodeAV1SuperblockSizeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> VideoEncodeAV1SuperblockSizeFlagsKHR:
        return VideoEncodeAV1SuperblockSizeFlagsKHR(value = self.value() | bit.value())


@register_passable("trivial")
struct AccessFlags3KHR(Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, *bits: AccessFlagBits3KHR):
        self._value = 0
        for bit in bits:
            self._value |= bit.value()

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: AccessFlagBits3KHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __ror__(self, bit: AccessFlagBits3KHR) -> Self:
        return Self(value = self.value() | bit.value())

    fn __contains__(self, bit: AccessFlagBits3KHR) -> Bool:
        return Bool(self.value() & bit.value())

    comptime NONE_KHR = AccessFlagBits3KHR(value = 0)


@register_passable("trivial")
struct AccessFlagBits3KHR(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, bit: Self) -> AccessFlags3KHR:
        return AccessFlags3KHR(value = self.value() | bit.value())
