alias MemoryUnmapFlagsKHR = MemoryUnmapFlags
alias GeometryFlagsNV = GeometryFlagsKHR
alias GeometryInstanceFlagsNV = GeometryInstanceFlagsKHR
alias BuildAccelerationStructureFlagsNV = BuildAccelerationStructureFlagsKHR
alias PrivateDataSlotCreateFlagsEXT = PrivateDataSlotCreateFlags
alias DescriptorUpdateTemplateCreateFlagsKHR = DescriptorUpdateTemplateCreateFlags
alias PipelineCreationFeedbackFlagsEXT = PipelineCreationFeedbackFlags
alias SemaphoreWaitFlagsKHR = SemaphoreWaitFlags
alias AccessFlags2KHR = AccessFlags2
alias PipelineStageFlags2KHR = PipelineStageFlags2
alias FormatFeatureFlags2KHR = FormatFeatureFlags2
alias RenderingFlagsKHR = RenderingFlags
alias PipelineCreateFlags2KHR = PipelineCreateFlags2
alias BufferUsageFlags2KHR = BufferUsageFlags2
alias PeerMemoryFeatureFlagsKHR = PeerMemoryFeatureFlags
alias MemoryAllocateFlagsKHR = MemoryAllocateFlags
alias CommandPoolTrimFlagsKHR = CommandPoolTrimFlags
alias ExternalMemoryHandleTypeFlagsKHR = ExternalMemoryHandleTypeFlags
alias ExternalMemoryFeatureFlagsKHR = ExternalMemoryFeatureFlags
alias ExternalSemaphoreHandleTypeFlagsKHR = ExternalSemaphoreHandleTypeFlags
alias ExternalSemaphoreFeatureFlagsKHR = ExternalSemaphoreFeatureFlags
alias SemaphoreImportFlagsKHR = SemaphoreImportFlags
alias ExternalFenceHandleTypeFlagsKHR = ExternalFenceHandleTypeFlags
alias ExternalFenceFeatureFlagsKHR = ExternalFenceFeatureFlags
alias FenceImportFlagsKHR = FenceImportFlags
alias DescriptorBindingFlagsEXT = DescriptorBindingFlags
alias ResolveModeFlagsKHR = ResolveModeFlags
alias ToolPurposeFlagsEXT = ToolPurposeFlags
alias SubmitFlagsKHR = SubmitFlags
alias HostImageCopyFlagsEXT = HostImageCopyFlags
alias PresentScalingFlagsEXT = PresentScalingFlagsKHR
alias PresentGravityFlagsEXT = PresentGravityFlagsKHR


@register_passable("trivial")
struct FramebufferCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: FramebufferCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: FramebufferCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: FramebufferCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: FramebufferCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct FramebufferCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> FramebufferCreateFlags:
        return FramebufferCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct QueryPoolCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: QueryPoolCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: QueryPoolCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: QueryPoolCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: QueryPoolCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct QueryPoolCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> QueryPoolCreateFlags:
        return QueryPoolCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct RenderPassCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: RenderPassCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: RenderPassCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: RenderPassCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: RenderPassCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct RenderPassCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> RenderPassCreateFlags:
        return RenderPassCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SamplerCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SamplerCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SamplerCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SamplerCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SamplerCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct SamplerCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SamplerCreateFlags:
        return SamplerCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineLayoutCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineLayoutCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineLayoutCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineLayoutCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineLayoutCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineLayoutCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineLayoutCreateFlags:
        return PipelineLayoutCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineCacheCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCacheCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineCacheCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineCacheCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineCacheCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineCacheCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineCacheCreateFlags:
        return PipelineCacheCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineDepthStencilStateCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineDepthStencilStateCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineDepthStencilStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineDepthStencilStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineDepthStencilStateCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineDepthStencilStateCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineDepthStencilStateCreateFlags:
        return PipelineDepthStencilStateCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineDynamicStateCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineDynamicStateCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineDynamicStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineDynamicStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineDynamicStateCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineDynamicStateCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineDynamicStateCreateFlags:
        return PipelineDynamicStateCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineColorBlendStateCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineColorBlendStateCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineColorBlendStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineColorBlendStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineColorBlendStateCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineColorBlendStateCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineColorBlendStateCreateFlags:
        return PipelineColorBlendStateCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineMultisampleStateCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineMultisampleStateCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineMultisampleStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineMultisampleStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineMultisampleStateCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineMultisampleStateCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineMultisampleStateCreateFlags:
        return PipelineMultisampleStateCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineRasterizationStateCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineRasterizationStateCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineRasterizationStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineRasterizationStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineRasterizationStateCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineRasterizationStateCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineRasterizationStateCreateFlags:
        return PipelineRasterizationStateCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineViewportStateCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineViewportStateCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineViewportStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineViewportStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineViewportStateCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineViewportStateCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineViewportStateCreateFlags:
        return PipelineViewportStateCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineTessellationStateCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineTessellationStateCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineTessellationStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineTessellationStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineTessellationStateCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineTessellationStateCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineTessellationStateCreateFlags:
        return PipelineTessellationStateCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineInputAssemblyStateCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineInputAssemblyStateCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineInputAssemblyStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineInputAssemblyStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineInputAssemblyStateCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineInputAssemblyStateCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineInputAssemblyStateCreateFlags:
        return PipelineInputAssemblyStateCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineVertexInputStateCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineVertexInputStateCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineVertexInputStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineVertexInputStateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineVertexInputStateCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineVertexInputStateCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineVertexInputStateCreateFlags:
        return PipelineVertexInputStateCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineShaderStageCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineShaderStageCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineShaderStageCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineShaderStageCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineShaderStageCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineShaderStageCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineShaderStageCreateFlags:
        return PipelineShaderStageCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DescriptorSetLayoutCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DescriptorSetLayoutCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DescriptorSetLayoutCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DescriptorSetLayoutCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DescriptorSetLayoutCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DescriptorSetLayoutCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DescriptorSetLayoutCreateFlags:
        return DescriptorSetLayoutCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct BufferViewCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: BufferViewCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: BufferViewCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: BufferViewCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: BufferViewCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct BufferViewCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> BufferViewCreateFlags:
        return BufferViewCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct InstanceCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: InstanceCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: InstanceCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: InstanceCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: InstanceCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct InstanceCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> InstanceCreateFlags:
        return InstanceCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DeviceCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DeviceCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DeviceCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DeviceCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DeviceCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DeviceCreateFlags:
        return DeviceCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DeviceQueueCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceQueueCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DeviceQueueCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DeviceQueueCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DeviceQueueCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DeviceQueueCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DeviceQueueCreateFlags:
        return DeviceQueueCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct QueueFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: QueueFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: QueueFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: QueueFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: QueueFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias GRAPHICS = QueueFlagBits(raw = 1 << 0)
    alias COMPUTE = QueueFlagBits(raw = 1 << 1)
    alias TRANSFER = QueueFlagBits(raw = 1 << 2)
    alias SPARSE_BINDING = QueueFlagBits(raw = 1 << 3)


@register_passable("trivial")
struct QueueFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> QueueFlags:
        return QueueFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct MemoryPropertyFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: MemoryPropertyFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: MemoryPropertyFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: MemoryPropertyFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: MemoryPropertyFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEVICE_LOCAL = MemoryPropertyFlagBits(raw = 1 << 0)
    alias HOST_VISIBLE = MemoryPropertyFlagBits(raw = 1 << 1)
    alias HOST_COHERENT = MemoryPropertyFlagBits(raw = 1 << 2)
    alias HOST_CACHED = MemoryPropertyFlagBits(raw = 1 << 3)
    alias LAZILY_ALLOCATED = MemoryPropertyFlagBits(raw = 1 << 4)


@register_passable("trivial")
struct MemoryPropertyFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> MemoryPropertyFlags:
        return MemoryPropertyFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct MemoryHeapFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: MemoryHeapFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: MemoryHeapFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: MemoryHeapFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: MemoryHeapFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEVICE_LOCAL = MemoryHeapFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct MemoryHeapFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> MemoryHeapFlags:
        return MemoryHeapFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct AccessFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: AccessFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: AccessFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: AccessFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: AccessFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias INDIRECT_COMMAND_READ = AccessFlagBits(raw = 1 << 0)
    alias INDEX_READ = AccessFlagBits(raw = 1 << 1)
    alias VERTEX_ATTRIBUTE_READ = AccessFlagBits(raw = 1 << 2)
    alias UNIFORM_READ = AccessFlagBits(raw = 1 << 3)
    alias INPUT_ATTACHMENT_READ = AccessFlagBits(raw = 1 << 4)
    alias SHADER_READ = AccessFlagBits(raw = 1 << 5)
    alias SHADER_WRITE = AccessFlagBits(raw = 1 << 6)
    alias COLOR_ATTACHMENT_READ = AccessFlagBits(raw = 1 << 7)
    alias COLOR_ATTACHMENT_WRITE = AccessFlagBits(raw = 1 << 8)
    alias DEPTH_STENCIL_ATTACHMENT_READ = AccessFlagBits(raw = 1 << 9)
    alias DEPTH_STENCIL_ATTACHMENT_WRITE = AccessFlagBits(raw = 1 << 10)
    alias TRANSFER_READ = AccessFlagBits(raw = 1 << 11)
    alias TRANSFER_WRITE = AccessFlagBits(raw = 1 << 12)
    alias HOST_READ = AccessFlagBits(raw = 1 << 13)
    alias HOST_WRITE = AccessFlagBits(raw = 1 << 14)
    alias MEMORY_READ = AccessFlagBits(raw = 1 << 15)
    alias MEMORY_WRITE = AccessFlagBits(raw = 1 << 16)


@register_passable("trivial")
struct AccessFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> AccessFlags:
        return AccessFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct BufferUsageFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: BufferUsageFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: BufferUsageFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: BufferUsageFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: BufferUsageFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias TRANSFER_SRC = BufferUsageFlagBits(raw = 1 << 0)
    alias TRANSFER_DST = BufferUsageFlagBits(raw = 1 << 1)
    alias UNIFORM_TEXEL_BUFFER = BufferUsageFlagBits(raw = 1 << 2)
    alias STORAGE_TEXEL_BUFFER = BufferUsageFlagBits(raw = 1 << 3)
    alias UNIFORM_BUFFER = BufferUsageFlagBits(raw = 1 << 4)
    alias STORAGE_BUFFER = BufferUsageFlagBits(raw = 1 << 5)
    alias INDEX_BUFFER = BufferUsageFlagBits(raw = 1 << 6)
    alias VERTEX_BUFFER = BufferUsageFlagBits(raw = 1 << 7)
    alias INDIRECT_BUFFER = BufferUsageFlagBits(raw = 1 << 8)


@register_passable("trivial")
struct BufferUsageFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> BufferUsageFlags:
        return BufferUsageFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct BufferCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: BufferCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: BufferCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: BufferCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: BufferCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias SPARSE_BINDING = BufferCreateFlagBits(raw = 1 << 0)
    alias SPARSE_RESIDENCY = BufferCreateFlagBits(raw = 1 << 1)
    alias SPARSE_ALIASED = BufferCreateFlagBits(raw = 1 << 2)


@register_passable("trivial")
struct BufferCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> BufferCreateFlags:
        return BufferCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ShaderStageFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ShaderStageFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ShaderStageFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ShaderStageFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ShaderStageFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ALL_GRAPHICS = ShaderStageFlagBits(raw = 31)
    alias ALL = ShaderStageFlagBits(raw = 2147483647)
    alias VERTEX = ShaderStageFlagBits(raw = 1 << 0)
    alias TESSELLATION_CONTROL = ShaderStageFlagBits(raw = 1 << 1)
    alias TESSELLATION_EVALUATION = ShaderStageFlagBits(raw = 1 << 2)
    alias GEOMETRY = ShaderStageFlagBits(raw = 1 << 3)
    alias FRAGMENT = ShaderStageFlagBits(raw = 1 << 4)
    alias COMPUTE = ShaderStageFlagBits(raw = 1 << 5)


@register_passable("trivial")
struct ShaderStageFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ShaderStageFlags:
        return ShaderStageFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ImageUsageFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ImageUsageFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ImageUsageFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ImageUsageFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ImageUsageFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias TRANSFER_SRC = ImageUsageFlagBits(raw = 1 << 0)
    alias TRANSFER_DST = ImageUsageFlagBits(raw = 1 << 1)
    alias SAMPLED = ImageUsageFlagBits(raw = 1 << 2)
    alias STORAGE = ImageUsageFlagBits(raw = 1 << 3)
    alias COLOR_ATTACHMENT = ImageUsageFlagBits(raw = 1 << 4)
    alias DEPTH_STENCIL_ATTACHMENT = ImageUsageFlagBits(raw = 1 << 5)
    alias TRANSIENT_ATTACHMENT = ImageUsageFlagBits(raw = 1 << 6)
    alias INPUT_ATTACHMENT = ImageUsageFlagBits(raw = 1 << 7)


@register_passable("trivial")
struct ImageUsageFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ImageUsageFlags:
        return ImageUsageFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ImageCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ImageCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ImageCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ImageCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ImageCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias SPARSE_BINDING = ImageCreateFlagBits(raw = 1 << 0)
    alias SPARSE_RESIDENCY = ImageCreateFlagBits(raw = 1 << 1)
    alias SPARSE_ALIASED = ImageCreateFlagBits(raw = 1 << 2)
    alias MUTABLE_FORMAT = ImageCreateFlagBits(raw = 1 << 3)
    alias CUBE_COMPATIBLE = ImageCreateFlagBits(raw = 1 << 4)


@register_passable("trivial")
struct ImageCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ImageCreateFlags:
        return ImageCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ImageViewCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ImageViewCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ImageViewCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ImageViewCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ImageViewCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct ImageViewCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ImageViewCreateFlags:
        return ImageViewCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DISABLE_OPTIMIZATION = PipelineCreateFlagBits(raw = 1 << 0)
    alias ALLOW_DERIVATIVES = PipelineCreateFlagBits(raw = 1 << 1)
    alias DERIVATIVE = PipelineCreateFlagBits(raw = 1 << 2)


@register_passable("trivial")
struct PipelineCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineCreateFlags:
        return PipelineCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ColorComponentFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ColorComponentFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ColorComponentFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ColorComponentFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ColorComponentFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias R = ColorComponentFlagBits(raw = 1 << 0)
    alias G = ColorComponentFlagBits(raw = 1 << 1)
    alias B = ColorComponentFlagBits(raw = 1 << 2)
    alias A = ColorComponentFlagBits(raw = 1 << 3)


@register_passable("trivial")
struct ColorComponentFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ColorComponentFlags:
        return ColorComponentFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct FenceCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: FenceCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: FenceCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: FenceCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: FenceCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias SIGNALED = FenceCreateFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct FenceCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> FenceCreateFlags:
        return FenceCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SemaphoreCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SemaphoreCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SemaphoreCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SemaphoreCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SemaphoreCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct SemaphoreCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SemaphoreCreateFlags:
        return SemaphoreCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct FormatFeatureFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: FormatFeatureFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: FormatFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: FormatFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: FormatFeatureFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias SAMPLED_IMAGE = FormatFeatureFlagBits(raw = 1 << 0)
    alias STORAGE_IMAGE = FormatFeatureFlagBits(raw = 1 << 1)
    alias STORAGE_IMAGE_ATOMIC = FormatFeatureFlagBits(raw = 1 << 2)
    alias UNIFORM_TEXEL_BUFFER = FormatFeatureFlagBits(raw = 1 << 3)
    alias STORAGE_TEXEL_BUFFER = FormatFeatureFlagBits(raw = 1 << 4)
    alias STORAGE_TEXEL_BUFFER_ATOMIC = FormatFeatureFlagBits(raw = 1 << 5)
    alias VERTEX_BUFFER = FormatFeatureFlagBits(raw = 1 << 6)
    alias COLOR_ATTACHMENT = FormatFeatureFlagBits(raw = 1 << 7)
    alias COLOR_ATTACHMENT_BLEND = FormatFeatureFlagBits(raw = 1 << 8)
    alias DEPTH_STENCIL_ATTACHMENT = FormatFeatureFlagBits(raw = 1 << 9)
    alias BLIT_SRC = FormatFeatureFlagBits(raw = 1 << 10)
    alias BLIT_DST = FormatFeatureFlagBits(raw = 1 << 11)
    alias SAMPLED_IMAGE_FILTER_LINEAR = FormatFeatureFlagBits(raw = 1 << 12)


@register_passable("trivial")
struct FormatFeatureFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> FormatFeatureFlags:
        return FormatFeatureFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct QueryControlFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: QueryControlFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: QueryControlFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: QueryControlFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: QueryControlFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias PRECISE = QueryControlFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct QueryControlFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> QueryControlFlags:
        return QueryControlFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct QueryResultFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: QueryResultFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: QueryResultFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: QueryResultFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: QueryResultFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias N_64 = QueryResultFlagBits(raw = 1 << 0)
    alias WAIT = QueryResultFlagBits(raw = 1 << 1)
    alias WITH_AVAILABILITY = QueryResultFlagBits(raw = 1 << 2)
    alias PARTIAL = QueryResultFlagBits(raw = 1 << 3)


@register_passable("trivial")
struct QueryResultFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> QueryResultFlags:
        return QueryResultFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ShaderModuleCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ShaderModuleCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ShaderModuleCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ShaderModuleCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ShaderModuleCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct ShaderModuleCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ShaderModuleCreateFlags:
        return ShaderModuleCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct EventCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: EventCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: EventCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: EventCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: EventCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct EventCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> EventCreateFlags:
        return EventCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct CommandPoolCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: CommandPoolCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: CommandPoolCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: CommandPoolCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: CommandPoolCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias TRANSIENT = CommandPoolCreateFlagBits(raw = 1 << 0)
    alias RESET_COMMAND_BUFFER = CommandPoolCreateFlagBits(raw = 1 << 1)


@register_passable("trivial")
struct CommandPoolCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> CommandPoolCreateFlags:
        return CommandPoolCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct CommandPoolResetFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: CommandPoolResetFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: CommandPoolResetFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: CommandPoolResetFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: CommandPoolResetFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias RELEASE_RESOURCES = CommandPoolResetFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct CommandPoolResetFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> CommandPoolResetFlags:
        return CommandPoolResetFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct CommandBufferResetFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: CommandBufferResetFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: CommandBufferResetFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: CommandBufferResetFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: CommandBufferResetFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias RELEASE_RESOURCES = CommandBufferResetFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct CommandBufferResetFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> CommandBufferResetFlags:
        return CommandBufferResetFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct CommandBufferUsageFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: CommandBufferUsageFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: CommandBufferUsageFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: CommandBufferUsageFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: CommandBufferUsageFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ONE_TIME_SUBMIT = CommandBufferUsageFlagBits(raw = 1 << 0)
    alias RENDER_PASS_CONTINUE = CommandBufferUsageFlagBits(raw = 1 << 1)
    alias SIMULTANEOUS_USE = CommandBufferUsageFlagBits(raw = 1 << 2)


@register_passable("trivial")
struct CommandBufferUsageFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> CommandBufferUsageFlags:
        return CommandBufferUsageFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct QueryPipelineStatisticFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: QueryPipelineStatisticFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: QueryPipelineStatisticFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: QueryPipelineStatisticFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: QueryPipelineStatisticFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias INPUT_ASSEMBLY_VERTICES = QueryPipelineStatisticFlagBits(raw = 1 << 0)
    alias INPUT_ASSEMBLY_PRIMITIVES = QueryPipelineStatisticFlagBits(raw = 1 << 1)
    alias VERTEX_SHADER_INVOCATIONS = QueryPipelineStatisticFlagBits(raw = 1 << 2)
    alias GEOMETRY_SHADER_INVOCATIONS = QueryPipelineStatisticFlagBits(raw = 1 << 3)
    alias GEOMETRY_SHADER_PRIMITIVES = QueryPipelineStatisticFlagBits(raw = 1 << 4)
    alias CLIPPING_INVOCATIONS = QueryPipelineStatisticFlagBits(raw = 1 << 5)
    alias CLIPPING_PRIMITIVES = QueryPipelineStatisticFlagBits(raw = 1 << 6)
    alias FRAGMENT_SHADER_INVOCATIONS = QueryPipelineStatisticFlagBits(raw = 1 << 7)
    alias TESSELLATION_CONTROL_SHADER_PATCHES = QueryPipelineStatisticFlagBits(raw = 1 << 8)
    alias TESSELLATION_EVALUATION_SHADER_INVOCATIONS = QueryPipelineStatisticFlagBits(raw = 1 << 9)
    alias COMPUTE_SHADER_INVOCATIONS = QueryPipelineStatisticFlagBits(raw = 1 << 10)


@register_passable("trivial")
struct QueryPipelineStatisticFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> QueryPipelineStatisticFlags:
        return QueryPipelineStatisticFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct MemoryMapFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: MemoryMapFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: MemoryMapFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: MemoryMapFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: MemoryMapFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct MemoryMapFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> MemoryMapFlags:
        return MemoryMapFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct MemoryUnmapFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: MemoryUnmapFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: MemoryUnmapFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: MemoryUnmapFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: MemoryUnmapFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct MemoryUnmapFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> MemoryUnmapFlags:
        return MemoryUnmapFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ImageAspectFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ImageAspectFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ImageAspectFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ImageAspectFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ImageAspectFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias COLOR = ImageAspectFlagBits(raw = 1 << 0)
    alias DEPTH = ImageAspectFlagBits(raw = 1 << 1)
    alias STENCIL = ImageAspectFlagBits(raw = 1 << 2)
    alias METADATA = ImageAspectFlagBits(raw = 1 << 3)


@register_passable("trivial")
struct ImageAspectFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ImageAspectFlags:
        return ImageAspectFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SparseMemoryBindFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SparseMemoryBindFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SparseMemoryBindFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SparseMemoryBindFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SparseMemoryBindFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias METADATA = SparseMemoryBindFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct SparseMemoryBindFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SparseMemoryBindFlags:
        return SparseMemoryBindFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SparseImageFormatFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SparseImageFormatFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SparseImageFormatFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SparseImageFormatFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SparseImageFormatFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias SINGLE_MIPTAIL = SparseImageFormatFlagBits(raw = 1 << 0)
    alias ALIGNED_MIP_SIZE = SparseImageFormatFlagBits(raw = 1 << 1)
    alias NONSTANDARD_BLOCK_SIZE = SparseImageFormatFlagBits(raw = 1 << 2)


@register_passable("trivial")
struct SparseImageFormatFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SparseImageFormatFlags:
        return SparseImageFormatFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SubpassDescriptionFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SubpassDescriptionFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SubpassDescriptionFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SubpassDescriptionFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SubpassDescriptionFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct SubpassDescriptionFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SubpassDescriptionFlags:
        return SubpassDescriptionFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineStageFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineStageFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineStageFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineStageFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineStageFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias TOP_OF_PIPE = PipelineStageFlagBits(raw = 1 << 0)
    alias DRAW_INDIRECT = PipelineStageFlagBits(raw = 1 << 1)
    alias VERTEX_INPUT = PipelineStageFlagBits(raw = 1 << 2)
    alias VERTEX_SHADER = PipelineStageFlagBits(raw = 1 << 3)
    alias TESSELLATION_CONTROL_SHADER = PipelineStageFlagBits(raw = 1 << 4)
    alias TESSELLATION_EVALUATION_SHADER = PipelineStageFlagBits(raw = 1 << 5)
    alias GEOMETRY_SHADER = PipelineStageFlagBits(raw = 1 << 6)
    alias FRAGMENT_SHADER = PipelineStageFlagBits(raw = 1 << 7)
    alias EARLY_FRAGMENT_TESTS = PipelineStageFlagBits(raw = 1 << 8)
    alias LATE_FRAGMENT_TESTS = PipelineStageFlagBits(raw = 1 << 9)
    alias COLOR_ATTACHMENT_OUTPUT = PipelineStageFlagBits(raw = 1 << 10)
    alias COMPUTE_SHADER = PipelineStageFlagBits(raw = 1 << 11)
    alias TRANSFER = PipelineStageFlagBits(raw = 1 << 12)
    alias BOTTOM_OF_PIPE = PipelineStageFlagBits(raw = 1 << 13)
    alias HOST = PipelineStageFlagBits(raw = 1 << 14)
    alias ALL_GRAPHICS = PipelineStageFlagBits(raw = 1 << 15)
    alias ALL_COMMANDS = PipelineStageFlagBits(raw = 1 << 16)


@register_passable("trivial")
struct PipelineStageFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineStageFlags:
        return PipelineStageFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SampleCountFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SampleCountFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SampleCountFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SampleCountFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SampleCountFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias N_1 = SampleCountFlagBits(raw = 1 << 0)
    alias N_2 = SampleCountFlagBits(raw = 1 << 1)
    alias N_4 = SampleCountFlagBits(raw = 1 << 2)
    alias N_8 = SampleCountFlagBits(raw = 1 << 3)
    alias N_16 = SampleCountFlagBits(raw = 1 << 4)
    alias N_32 = SampleCountFlagBits(raw = 1 << 5)
    alias N_64 = SampleCountFlagBits(raw = 1 << 6)


@register_passable("trivial")
struct SampleCountFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SampleCountFlags:
        return SampleCountFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct AttachmentDescriptionFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: AttachmentDescriptionFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: AttachmentDescriptionFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: AttachmentDescriptionFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: AttachmentDescriptionFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias MAY_ALIAS = AttachmentDescriptionFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct AttachmentDescriptionFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> AttachmentDescriptionFlags:
        return AttachmentDescriptionFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct StencilFaceFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: StencilFaceFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: StencilFaceFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: StencilFaceFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: StencilFaceFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias FRONT_AND_BACK = StencilFaceFlagBits(raw = 3)
    alias FRONT = StencilFaceFlagBits(raw = 1 << 0)
    alias BACK = StencilFaceFlagBits(raw = 1 << 1)


@register_passable("trivial")
struct StencilFaceFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> StencilFaceFlags:
        return StencilFaceFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct CullModeFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: CullModeFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: CullModeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: CullModeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: CullModeFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias NONE = CullModeFlagBits(raw = 0)
    alias FRONT_AND_BACK = CullModeFlagBits(raw = 3)
    alias FRONT = CullModeFlagBits(raw = 1 << 0)
    alias BACK = CullModeFlagBits(raw = 1 << 1)


@register_passable("trivial")
struct CullModeFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> CullModeFlags:
        return CullModeFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DescriptorPoolCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DescriptorPoolCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DescriptorPoolCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DescriptorPoolCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DescriptorPoolCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias FREE_DESCRIPTOR_SET = DescriptorPoolCreateFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct DescriptorPoolCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DescriptorPoolCreateFlags:
        return DescriptorPoolCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DescriptorPoolResetFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DescriptorPoolResetFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DescriptorPoolResetFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DescriptorPoolResetFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DescriptorPoolResetFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DescriptorPoolResetFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DescriptorPoolResetFlags:
        return DescriptorPoolResetFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DependencyFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DependencyFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DependencyFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DependencyFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DependencyFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias BY_REGION = DependencyFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct DependencyFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DependencyFlags:
        return DependencyFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SubgroupFeatureFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SubgroupFeatureFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SubgroupFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SubgroupFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SubgroupFeatureFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias BASIC = SubgroupFeatureFlagBits(raw = 1 << 0)
    alias VOTE = SubgroupFeatureFlagBits(raw = 1 << 1)
    alias ARITHMETIC = SubgroupFeatureFlagBits(raw = 1 << 2)
    alias BALLOT = SubgroupFeatureFlagBits(raw = 1 << 3)
    alias SHUFFLE = SubgroupFeatureFlagBits(raw = 1 << 4)
    alias SHUFFLE_RELATIVE = SubgroupFeatureFlagBits(raw = 1 << 5)
    alias CLUSTERED = SubgroupFeatureFlagBits(raw = 1 << 6)
    alias QUAD = SubgroupFeatureFlagBits(raw = 1 << 7)


@register_passable("trivial")
struct SubgroupFeatureFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SubgroupFeatureFlags:
        return SubgroupFeatureFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct IndirectCommandsLayoutUsageFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: IndirectCommandsLayoutUsageFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: IndirectCommandsLayoutUsageFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: IndirectCommandsLayoutUsageFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: IndirectCommandsLayoutUsageFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias EXPLICIT_PREPROCESS_NV = IndirectCommandsLayoutUsageFlagBitsNV(raw = 1 << 0)
    alias INDEXED_SEQUENCES_NV = IndirectCommandsLayoutUsageFlagBitsNV(raw = 1 << 1)
    alias UNORDERED_SEQUENCES_NV = IndirectCommandsLayoutUsageFlagBitsNV(raw = 1 << 2)


@register_passable("trivial")
struct IndirectCommandsLayoutUsageFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> IndirectCommandsLayoutUsageFlagsNV:
        return IndirectCommandsLayoutUsageFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct IndirectStateFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: IndirectStateFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: IndirectStateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: IndirectStateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: IndirectStateFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias FLAG_FRONTFACE_NV = IndirectStateFlagBitsNV(raw = 1 << 0)


@register_passable("trivial")
struct IndirectStateFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> IndirectStateFlagsNV:
        return IndirectStateFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct GeometryFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: GeometryFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: GeometryFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: GeometryFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: GeometryFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias OPAQUE_KHR = GeometryFlagBitsKHR(raw = 1 << 0)
    alias NO_DUPLICATE_ANY_HIT_INVOCATION_KHR = GeometryFlagBitsKHR(raw = 1 << 1)


@register_passable("trivial")
struct GeometryFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> GeometryFlagsKHR:
        return GeometryFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct GeometryInstanceFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: GeometryInstanceFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: GeometryInstanceFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: GeometryInstanceFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: GeometryInstanceFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias TRIANGLE_FACING_CULL_DISABLE_KHR = GeometryInstanceFlagBitsKHR(raw = 1 << 0)
    alias TRIANGLE_FLIP_FACING_KHR = GeometryInstanceFlagBitsKHR(raw = 1 << 1)
    alias FORCE_OPAQUE_KHR = GeometryInstanceFlagBitsKHR(raw = 1 << 2)
    alias FORCE_NO_OPAQUE_KHR = GeometryInstanceFlagBitsKHR(raw = 1 << 3)


@register_passable("trivial")
struct GeometryInstanceFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> GeometryInstanceFlagsKHR:
        return GeometryInstanceFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ClusterAccelerationStructureGeometryFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ClusterAccelerationStructureGeometryFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ClusterAccelerationStructureGeometryFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ClusterAccelerationStructureGeometryFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ClusterAccelerationStructureGeometryFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias CULL_DISABLE_NV = ClusterAccelerationStructureGeometryFlagBitsNV(raw = 1 << 0)
    alias NO_DUPLICATE_ANYHIT_INVOCATION_NV = ClusterAccelerationStructureGeometryFlagBitsNV(raw = 1 << 1)
    alias OPAQUE_NV = ClusterAccelerationStructureGeometryFlagBitsNV(raw = 1 << 2)


@register_passable("trivial")
struct ClusterAccelerationStructureGeometryFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ClusterAccelerationStructureGeometryFlagsNV:
        return ClusterAccelerationStructureGeometryFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ClusterAccelerationStructureClusterFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ClusterAccelerationStructureClusterFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ClusterAccelerationStructureClusterFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ClusterAccelerationStructureClusterFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ClusterAccelerationStructureClusterFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ALLOW_DISABLE_OPACITY_MICROMAPS_NV = ClusterAccelerationStructureClusterFlagBitsNV(raw = 1 << 0)


@register_passable("trivial")
struct ClusterAccelerationStructureClusterFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ClusterAccelerationStructureClusterFlagsNV:
        return ClusterAccelerationStructureClusterFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ClusterAccelerationStructureAddressResolutionFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ClusterAccelerationStructureAddressResolutionFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ClusterAccelerationStructureAddressResolutionFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ClusterAccelerationStructureAddressResolutionFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ClusterAccelerationStructureAddressResolutionFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias NONE_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(raw = 0)
    alias INDIRECTED_DST_IMPLICIT_DATA_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(raw = 1 << 0)
    alias INDIRECTED_SCRATCH_DATA_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(raw = 1 << 1)
    alias INDIRECTED_DST_ADDRESS_ARRAY_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(raw = 1 << 2)
    alias INDIRECTED_DST_SIZES_ARRAY_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(raw = 1 << 3)
    alias INDIRECTED_SRC_INFOS_ARRAY_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(raw = 1 << 4)
    alias INDIRECTED_SRC_INFOS_COUNT_NV = ClusterAccelerationStructureAddressResolutionFlagBitsNV(raw = 1 << 5)


@register_passable("trivial")
struct ClusterAccelerationStructureAddressResolutionFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ClusterAccelerationStructureAddressResolutionFlagsNV:
        return ClusterAccelerationStructureAddressResolutionFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct BuildAccelerationStructureFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: BuildAccelerationStructureFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: BuildAccelerationStructureFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: BuildAccelerationStructureFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: BuildAccelerationStructureFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ALLOW_UPDATE_KHR = BuildAccelerationStructureFlagBitsKHR(raw = 1 << 0)
    alias ALLOW_COMPACTION_KHR = BuildAccelerationStructureFlagBitsKHR(raw = 1 << 1)
    alias PREFER_FAST_TRACE_KHR = BuildAccelerationStructureFlagBitsKHR(raw = 1 << 2)
    alias PREFER_FAST_BUILD_KHR = BuildAccelerationStructureFlagBitsKHR(raw = 1 << 3)
    alias LOW_MEMORY_KHR = BuildAccelerationStructureFlagBitsKHR(raw = 1 << 4)


@register_passable("trivial")
struct BuildAccelerationStructureFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> BuildAccelerationStructureFlagsKHR:
        return BuildAccelerationStructureFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PrivateDataSlotCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PrivateDataSlotCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PrivateDataSlotCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PrivateDataSlotCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PrivateDataSlotCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PrivateDataSlotCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PrivateDataSlotCreateFlags:
        return PrivateDataSlotCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct AccelerationStructureCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: AccelerationStructureCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: AccelerationStructureCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: AccelerationStructureCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: AccelerationStructureCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEVICE_ADDRESS_CAPTURE_REPLAY_KHR = AccelerationStructureCreateFlagBitsKHR(raw = 1 << 0)


@register_passable("trivial")
struct AccelerationStructureCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> AccelerationStructureCreateFlagsKHR:
        return AccelerationStructureCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DescriptorUpdateTemplateCreateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DescriptorUpdateTemplateCreateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DescriptorUpdateTemplateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DescriptorUpdateTemplateCreateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DescriptorUpdateTemplateCreateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DescriptorUpdateTemplateCreateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DescriptorUpdateTemplateCreateFlags:
        return DescriptorUpdateTemplateCreateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineCreationFeedbackFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCreationFeedbackFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineCreationFeedbackFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineCreationFeedbackFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineCreationFeedbackFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VALID = PipelineCreationFeedbackFlagBits(raw = 1 << 0)
    alias APPLICATION_PIPELINE_CACHE_HIT = PipelineCreationFeedbackFlagBits(raw = 1 << 1)
    alias BASE_PIPELINE_ACCELERATION = PipelineCreationFeedbackFlagBits(raw = 1 << 2)


@register_passable("trivial")
struct PipelineCreationFeedbackFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineCreationFeedbackFlags:
        return PipelineCreationFeedbackFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PerformanceCounterDescriptionFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PerformanceCounterDescriptionFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PerformanceCounterDescriptionFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PerformanceCounterDescriptionFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PerformanceCounterDescriptionFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias PERFORMANCE_IMPACTING_KHR = PerformanceCounterDescriptionFlagBitsKHR(raw = 1 << 0)
    alias CONCURRENTLY_IMPACTED_KHR = PerformanceCounterDescriptionFlagBitsKHR(raw = 1 << 1)


@register_passable("trivial")
struct PerformanceCounterDescriptionFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PerformanceCounterDescriptionFlagsKHR:
        return PerformanceCounterDescriptionFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct AcquireProfilingLockFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: AcquireProfilingLockFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: AcquireProfilingLockFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: AcquireProfilingLockFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: AcquireProfilingLockFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct AcquireProfilingLockFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> AcquireProfilingLockFlagsKHR:
        return AcquireProfilingLockFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SemaphoreWaitFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SemaphoreWaitFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SemaphoreWaitFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SemaphoreWaitFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SemaphoreWaitFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ANY = SemaphoreWaitFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct SemaphoreWaitFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SemaphoreWaitFlags:
        return SemaphoreWaitFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineCompilerControlFlagsAMD(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCompilerControlFlagBitsAMD):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineCompilerControlFlagBitsAMD) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineCompilerControlFlagBitsAMD) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineCompilerControlFlagBitsAMD) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineCompilerControlFlagBitsAMD:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineCompilerControlFlagsAMD:
        return PipelineCompilerControlFlagsAMD(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ShaderCorePropertiesFlagsAMD(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ShaderCorePropertiesFlagBitsAMD):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ShaderCorePropertiesFlagBitsAMD) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ShaderCorePropertiesFlagBitsAMD) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ShaderCorePropertiesFlagBitsAMD) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct ShaderCorePropertiesFlagBitsAMD:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ShaderCorePropertiesFlagsAMD:
        return ShaderCorePropertiesFlagsAMD(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DeviceDiagnosticsConfigFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceDiagnosticsConfigFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DeviceDiagnosticsConfigFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DeviceDiagnosticsConfigFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DeviceDiagnosticsConfigFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ENABLE_SHADER_DEBUG_INFO_NV = DeviceDiagnosticsConfigFlagBitsNV(raw = 1 << 0)
    alias ENABLE_RESOURCE_TRACKING_NV = DeviceDiagnosticsConfigFlagBitsNV(raw = 1 << 1)
    alias ENABLE_AUTOMATIC_CHECKPOINTS_NV = DeviceDiagnosticsConfigFlagBitsNV(raw = 1 << 2)
    alias ENABLE_SHADER_ERROR_REPORTING_NV = DeviceDiagnosticsConfigFlagBitsNV(raw = 1 << 3)


@register_passable("trivial")
struct DeviceDiagnosticsConfigFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DeviceDiagnosticsConfigFlagsNV:
        return DeviceDiagnosticsConfigFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct RefreshObjectFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: RefreshObjectFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: RefreshObjectFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: RefreshObjectFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: RefreshObjectFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct RefreshObjectFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> RefreshObjectFlagsKHR:
        return RefreshObjectFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct AccessFlags2(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: AccessFlagBits2):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: AccessFlagBits2) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: AccessFlagBits2) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: AccessFlagBits2) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VK_ACCESS_2_NONE = AccessFlagBits2(raw = 0)
    alias VK_ACCESS_2_INDIRECT_COMMAND_READ = AccessFlagBits2(raw = 1 << 0)
    alias VK_ACCESS_2_INDEX_READ = AccessFlagBits2(raw = 1 << 1)
    alias VK_ACCESS_2_VERTEX_ATTRIBUTE_READ = AccessFlagBits2(raw = 1 << 2)
    alias VK_ACCESS_2_UNIFORM_READ = AccessFlagBits2(raw = 1 << 3)
    alias VK_ACCESS_2_INPUT_ATTACHMENT_READ = AccessFlagBits2(raw = 1 << 4)
    alias VK_ACCESS_2_SHADER_READ = AccessFlagBits2(raw = 1 << 5)
    alias VK_ACCESS_2_SHADER_WRITE = AccessFlagBits2(raw = 1 << 6)
    alias VK_ACCESS_2_COLOR_ATTACHMENT_READ = AccessFlagBits2(raw = 1 << 7)
    alias VK_ACCESS_2_COLOR_ATTACHMENT_WRITE = AccessFlagBits2(raw = 1 << 8)
    alias VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_READ = AccessFlagBits2(raw = 1 << 9)
    alias VK_ACCESS_2_DEPTH_STENCIL_ATTACHMENT_WRITE = AccessFlagBits2(raw = 1 << 10)
    alias VK_ACCESS_2_TRANSFER_READ = AccessFlagBits2(raw = 1 << 11)
    alias VK_ACCESS_2_TRANSFER_WRITE = AccessFlagBits2(raw = 1 << 12)
    alias VK_ACCESS_2_HOST_READ = AccessFlagBits2(raw = 1 << 13)
    alias VK_ACCESS_2_HOST_WRITE = AccessFlagBits2(raw = 1 << 14)
    alias VK_ACCESS_2_MEMORY_READ = AccessFlagBits2(raw = 1 << 15)
    alias VK_ACCESS_2_MEMORY_WRITE = AccessFlagBits2(raw = 1 << 16)
    alias VK_ACCESS_2_SHADER_SAMPLED_READ = AccessFlagBits2(raw = 1 << 32)
    alias VK_ACCESS_2_SHADER_STORAGE_READ = AccessFlagBits2(raw = 1 << 33)
    alias VK_ACCESS_2_SHADER_STORAGE_WRITE = AccessFlagBits2(raw = 1 << 34)


@register_passable("trivial")
struct AccessFlagBits2:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> AccessFlags2:
        return AccessFlags2(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineStageFlags2(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: PipelineStageFlagBits2):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineStageFlagBits2) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineStageFlagBits2) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineStageFlagBits2) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VK_PIPELINE_STAGE_2_NONE = PipelineStageFlagBits2(raw = 0)
    alias VK_PIPELINE_STAGE_2_TOP_OF_PIPE = PipelineStageFlagBits2(raw = 1 << 0)
    alias VK_PIPELINE_STAGE_2_DRAW_INDIRECT = PipelineStageFlagBits2(raw = 1 << 1)
    alias VK_PIPELINE_STAGE_2_VERTEX_INPUT = PipelineStageFlagBits2(raw = 1 << 2)
    alias VK_PIPELINE_STAGE_2_VERTEX_SHADER = PipelineStageFlagBits2(raw = 1 << 3)
    alias VK_PIPELINE_STAGE_2_TESSELLATION_CONTROL_SHADER = PipelineStageFlagBits2(raw = 1 << 4)
    alias VK_PIPELINE_STAGE_2_TESSELLATION_EVALUATION_SHADER = PipelineStageFlagBits2(raw = 1 << 5)
    alias VK_PIPELINE_STAGE_2_GEOMETRY_SHADER = PipelineStageFlagBits2(raw = 1 << 6)
    alias VK_PIPELINE_STAGE_2_FRAGMENT_SHADER = PipelineStageFlagBits2(raw = 1 << 7)
    alias VK_PIPELINE_STAGE_2_EARLY_FRAGMENT_TESTS = PipelineStageFlagBits2(raw = 1 << 8)
    alias VK_PIPELINE_STAGE_2_LATE_FRAGMENT_TESTS = PipelineStageFlagBits2(raw = 1 << 9)
    alias VK_PIPELINE_STAGE_2_COLOR_ATTACHMENT_OUTPUT = PipelineStageFlagBits2(raw = 1 << 10)
    alias VK_PIPELINE_STAGE_2_COMPUTE_SHADER = PipelineStageFlagBits2(raw = 1 << 11)
    alias VK_PIPELINE_STAGE_2_ALL_TRANSFER = PipelineStageFlagBits2(raw = 1 << 12)
    alias VK_PIPELINE_STAGE_2_BOTTOM_OF_PIPE = PipelineStageFlagBits2(raw = 1 << 13)
    alias VK_PIPELINE_STAGE_2_HOST = PipelineStageFlagBits2(raw = 1 << 14)
    alias VK_PIPELINE_STAGE_2_ALL_GRAPHICS = PipelineStageFlagBits2(raw = 1 << 15)
    alias VK_PIPELINE_STAGE_2_ALL_COMMANDS = PipelineStageFlagBits2(raw = 1 << 16)
    alias VK_PIPELINE_STAGE_2_COPY = PipelineStageFlagBits2(raw = 1 << 32)
    alias VK_PIPELINE_STAGE_2_RESOLVE = PipelineStageFlagBits2(raw = 1 << 33)
    alias VK_PIPELINE_STAGE_2_BLIT = PipelineStageFlagBits2(raw = 1 << 34)
    alias VK_PIPELINE_STAGE_2_CLEAR = PipelineStageFlagBits2(raw = 1 << 35)
    alias VK_PIPELINE_STAGE_2_INDEX_INPUT = PipelineStageFlagBits2(raw = 1 << 36)
    alias VK_PIPELINE_STAGE_2_VERTEX_ATTRIBUTE_INPUT = PipelineStageFlagBits2(raw = 1 << 37)
    alias VK_PIPELINE_STAGE_2_PRE_RASTERIZATION_SHADERS = PipelineStageFlagBits2(raw = 1 << 38)


@register_passable("trivial")
struct PipelineStageFlagBits2:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineStageFlags2:
        return PipelineStageFlags2(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct AccelerationStructureMotionInfoFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: AccelerationStructureMotionInfoFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: AccelerationStructureMotionInfoFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: AccelerationStructureMotionInfoFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: AccelerationStructureMotionInfoFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct AccelerationStructureMotionInfoFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> AccelerationStructureMotionInfoFlagsNV:
        return AccelerationStructureMotionInfoFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct AccelerationStructureMotionInstanceFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: AccelerationStructureMotionInstanceFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: AccelerationStructureMotionInstanceFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: AccelerationStructureMotionInstanceFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: AccelerationStructureMotionInstanceFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct AccelerationStructureMotionInstanceFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> AccelerationStructureMotionInstanceFlagsNV:
        return AccelerationStructureMotionInstanceFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct FormatFeatureFlags2(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: FormatFeatureFlagBits2):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: FormatFeatureFlagBits2) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: FormatFeatureFlagBits2) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: FormatFeatureFlagBits2) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VK_FORMAT_FEATURE_2_SAMPLED_IMAGE = FormatFeatureFlagBits2(raw = 1 << 0)
    alias VK_FORMAT_FEATURE_2_STORAGE_IMAGE = FormatFeatureFlagBits2(raw = 1 << 1)
    alias VK_FORMAT_FEATURE_2_STORAGE_IMAGE_ATOMIC = FormatFeatureFlagBits2(raw = 1 << 2)
    alias VK_FORMAT_FEATURE_2_UNIFORM_TEXEL_BUFFER = FormatFeatureFlagBits2(raw = 1 << 3)
    alias VK_FORMAT_FEATURE_2_STORAGE_TEXEL_BUFFER = FormatFeatureFlagBits2(raw = 1 << 4)
    alias VK_FORMAT_FEATURE_2_STORAGE_TEXEL_BUFFER_ATOMIC = FormatFeatureFlagBits2(raw = 1 << 5)
    alias VK_FORMAT_FEATURE_2_VERTEX_BUFFER = FormatFeatureFlagBits2(raw = 1 << 6)
    alias VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT = FormatFeatureFlagBits2(raw = 1 << 7)
    alias VK_FORMAT_FEATURE_2_COLOR_ATTACHMENT_BLEND = FormatFeatureFlagBits2(raw = 1 << 8)
    alias VK_FORMAT_FEATURE_2_DEPTH_STENCIL_ATTACHMENT = FormatFeatureFlagBits2(raw = 1 << 9)
    alias VK_FORMAT_FEATURE_2_BLIT_SRC = FormatFeatureFlagBits2(raw = 1 << 10)
    alias VK_FORMAT_FEATURE_2_BLIT_DST = FormatFeatureFlagBits2(raw = 1 << 11)
    alias VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_LINEAR = FormatFeatureFlagBits2(raw = 1 << 12)
    alias VK_FORMAT_FEATURE_2_TRANSFER_SRC = FormatFeatureFlagBits2(raw = 1 << 14)
    alias VK_FORMAT_FEATURE_2_TRANSFER_DST = FormatFeatureFlagBits2(raw = 1 << 15)
    alias VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_FILTER_MINMAX = FormatFeatureFlagBits2(raw = 1 << 16)
    alias VK_FORMAT_FEATURE_2_MIDPOINT_CHROMA_SAMPLES = FormatFeatureFlagBits2(raw = 1 << 17)
    alias VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER = FormatFeatureFlagBits2(raw = 1 << 18)
    alias VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER = FormatFeatureFlagBits2(raw = 1 << 19)
    alias VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT = FormatFeatureFlagBits2(raw = 1 << 20)
    alias VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE = FormatFeatureFlagBits2(raw = 1 << 21)
    alias VK_FORMAT_FEATURE_2_DISJOINT = FormatFeatureFlagBits2(raw = 1 << 22)
    alias VK_FORMAT_FEATURE_2_COSITED_CHROMA_SAMPLES = FormatFeatureFlagBits2(raw = 1 << 23)
    alias VK_FORMAT_FEATURE_2_STORAGE_READ_WITHOUT_FORMAT = FormatFeatureFlagBits2(raw = 1 << 31)
    alias VK_FORMAT_FEATURE_2_STORAGE_WRITE_WITHOUT_FORMAT = FormatFeatureFlagBits2(raw = 1 << 32)
    alias VK_FORMAT_FEATURE_2_SAMPLED_IMAGE_DEPTH_COMPARISON = FormatFeatureFlagBits2(raw = 1 << 33)


@register_passable("trivial")
struct FormatFeatureFlagBits2:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> FormatFeatureFlags2:
        return FormatFeatureFlags2(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct RenderingFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: RenderingFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: RenderingFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: RenderingFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: RenderingFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias CONTENTS_SECONDARY_COMMAND_BUFFERS = RenderingFlagBits(raw = 1 << 0)
    alias SUSPENDING = RenderingFlagBits(raw = 1 << 1)
    alias RESUMING = RenderingFlagBits(raw = 1 << 2)


@register_passable("trivial")
struct RenderingFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> RenderingFlags:
        return RenderingFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct MemoryDecompressionMethodFlagsNV(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: MemoryDecompressionMethodFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: MemoryDecompressionMethodFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: MemoryDecompressionMethodFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: MemoryDecompressionMethodFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias GDEFLATE_1_0_NV = MemoryDecompressionMethodFlagBitsNV(raw = 1 << 0)


@register_passable("trivial")
struct MemoryDecompressionMethodFlagBitsNV:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> MemoryDecompressionMethodFlagsNV:
        return MemoryDecompressionMethodFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct BuildMicromapFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: BuildMicromapFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: BuildMicromapFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: BuildMicromapFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: BuildMicromapFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias PREFER_FAST_TRACE_EXT = BuildMicromapFlagBitsEXT(raw = 1 << 0)
    alias PREFER_FAST_BUILD_EXT = BuildMicromapFlagBitsEXT(raw = 1 << 1)
    alias ALLOW_COMPACTION_EXT = BuildMicromapFlagBitsEXT(raw = 1 << 2)


@register_passable("trivial")
struct BuildMicromapFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> BuildMicromapFlagsEXT:
        return BuildMicromapFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct MicromapCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: MicromapCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: MicromapCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: MicromapCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: MicromapCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEVICE_ADDRESS_CAPTURE_REPLAY_EXT = MicromapCreateFlagBitsEXT(raw = 1 << 0)


@register_passable("trivial")
struct MicromapCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> MicromapCreateFlagsEXT:
        return MicromapCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct IndirectCommandsLayoutUsageFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: IndirectCommandsLayoutUsageFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: IndirectCommandsLayoutUsageFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: IndirectCommandsLayoutUsageFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: IndirectCommandsLayoutUsageFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias EXPLICIT_PREPROCESS_EXT = IndirectCommandsLayoutUsageFlagBitsEXT(raw = 1 << 0)
    alias UNORDERED_SEQUENCES_EXT = IndirectCommandsLayoutUsageFlagBitsEXT(raw = 1 << 1)


@register_passable("trivial")
struct IndirectCommandsLayoutUsageFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> IndirectCommandsLayoutUsageFlagsEXT:
        return IndirectCommandsLayoutUsageFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct IndirectCommandsInputModeFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: IndirectCommandsInputModeFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: IndirectCommandsInputModeFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: IndirectCommandsInputModeFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: IndirectCommandsInputModeFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VULKAN_INDEX_BUFFER_EXT = IndirectCommandsInputModeFlagBitsEXT(raw = 1 << 0)
    alias DXGI_INDEX_BUFFER_EXT = IndirectCommandsInputModeFlagBitsEXT(raw = 1 << 1)


@register_passable("trivial")
struct IndirectCommandsInputModeFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> IndirectCommandsInputModeFlagsEXT:
        return IndirectCommandsInputModeFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DirectDriverLoadingFlagsLUNARG(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DirectDriverLoadingFlagBitsLUNARG):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DirectDriverLoadingFlagBitsLUNARG) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DirectDriverLoadingFlagBitsLUNARG) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DirectDriverLoadingFlagBitsLUNARG) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DirectDriverLoadingFlagBitsLUNARG:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DirectDriverLoadingFlagsLUNARG:
        return DirectDriverLoadingFlagsLUNARG(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineCreateFlags2(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: PipelineCreateFlagBits2):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineCreateFlagBits2) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineCreateFlagBits2) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineCreateFlagBits2) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VK_PIPELINE_CREATE_2_DISABLE_OPTIMIZATION = PipelineCreateFlagBits2(raw = 1 << 0)
    alias VK_PIPELINE_CREATE_2_ALLOW_DERIVATIVES = PipelineCreateFlagBits2(raw = 1 << 1)
    alias VK_PIPELINE_CREATE_2_DERIVATIVE = PipelineCreateFlagBits2(raw = 1 << 2)
    alias VK_PIPELINE_CREATE_2_VIEW_INDEX_FROM_DEVICE_INDEX = PipelineCreateFlagBits2(raw = 1 << 3)
    alias VK_PIPELINE_CREATE_2_DISPATCH_BASE = PipelineCreateFlagBits2(raw = 1 << 4)
    alias VK_PIPELINE_CREATE_2_FAIL_ON_PIPELINE_COMPILE_REQUIRED = PipelineCreateFlagBits2(raw = 1 << 8)
    alias VK_PIPELINE_CREATE_2_EARLY_RETURN_ON_FAILURE = PipelineCreateFlagBits2(raw = 1 << 9)
    alias VK_PIPELINE_CREATE_2_NO_PROTECTED_ACCESS = PipelineCreateFlagBits2(raw = 1 << 27)
    alias VK_PIPELINE_CREATE_2_PROTECTED_ACCESS_ONLY = PipelineCreateFlagBits2(raw = 1 << 30)


@register_passable("trivial")
struct PipelineCreateFlagBits2:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineCreateFlags2:
        return PipelineCreateFlags2(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct BufferUsageFlags2(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: BufferUsageFlagBits2):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: BufferUsageFlagBits2) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: BufferUsageFlagBits2) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: BufferUsageFlagBits2) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VK_BUFFER_USAGE_2_TRANSFER_SRC = BufferUsageFlagBits2(raw = 1 << 0)
    alias VK_BUFFER_USAGE_2_TRANSFER_DST = BufferUsageFlagBits2(raw = 1 << 1)
    alias VK_BUFFER_USAGE_2_UNIFORM_TEXEL_BUFFER = BufferUsageFlagBits2(raw = 1 << 2)
    alias VK_BUFFER_USAGE_2_STORAGE_TEXEL_BUFFER = BufferUsageFlagBits2(raw = 1 << 3)
    alias VK_BUFFER_USAGE_2_UNIFORM_BUFFER = BufferUsageFlagBits2(raw = 1 << 4)
    alias VK_BUFFER_USAGE_2_STORAGE_BUFFER = BufferUsageFlagBits2(raw = 1 << 5)
    alias VK_BUFFER_USAGE_2_INDEX_BUFFER = BufferUsageFlagBits2(raw = 1 << 6)
    alias VK_BUFFER_USAGE_2_VERTEX_BUFFER = BufferUsageFlagBits2(raw = 1 << 7)
    alias VK_BUFFER_USAGE_2_INDIRECT_BUFFER = BufferUsageFlagBits2(raw = 1 << 8)


@register_passable("trivial")
struct BufferUsageFlagBits2:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> BufferUsageFlags2:
        return BufferUsageFlags2(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct TensorCreateFlagsARM(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: TensorCreateFlagBitsARM):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: TensorCreateFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: TensorCreateFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: TensorCreateFlagBitsARM) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias MUTABLE_FORMAT_ARM = TensorCreateFlagBitsARM(raw = 1 << 0)
    alias PROTECTED_ARM = TensorCreateFlagBitsARM(raw = 1 << 1)


@register_passable("trivial")
struct TensorCreateFlagBitsARM:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> TensorCreateFlagsARM:
        return TensorCreateFlagsARM(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct TensorUsageFlagsARM(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: TensorUsageFlagBitsARM):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: TensorUsageFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: TensorUsageFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: TensorUsageFlagBitsARM) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias SHADER_ARM = TensorUsageFlagBitsARM(raw = 1 << 1)
    alias TRANSFER_SRC_ARM = TensorUsageFlagBitsARM(raw = 1 << 2)
    alias TRANSFER_DST_ARM = TensorUsageFlagBitsARM(raw = 1 << 3)
    alias IMAGE_ALIASING_ARM = TensorUsageFlagBitsARM(raw = 1 << 4)


@register_passable("trivial")
struct TensorUsageFlagBitsARM:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> TensorUsageFlagsARM:
        return TensorUsageFlagsARM(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct TensorViewCreateFlagsARM(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: TensorViewCreateFlagBitsARM):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: TensorViewCreateFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: TensorViewCreateFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: TensorViewCreateFlagBitsARM) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct TensorViewCreateFlagBitsARM:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> TensorViewCreateFlagsARM:
        return TensorViewCreateFlagsARM(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DataGraphPipelineSessionCreateFlagsARM(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: DataGraphPipelineSessionCreateFlagBitsARM):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DataGraphPipelineSessionCreateFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DataGraphPipelineSessionCreateFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DataGraphPipelineSessionCreateFlagBitsARM) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias PROTECTED_ARM = DataGraphPipelineSessionCreateFlagBitsARM(raw = 1 << 0)


@register_passable("trivial")
struct DataGraphPipelineSessionCreateFlagBitsARM:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DataGraphPipelineSessionCreateFlagsARM:
        return DataGraphPipelineSessionCreateFlagsARM(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DataGraphPipelineDispatchFlagsARM(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: DataGraphPipelineDispatchFlagBitsARM):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DataGraphPipelineDispatchFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DataGraphPipelineDispatchFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DataGraphPipelineDispatchFlagBitsARM) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DataGraphPipelineDispatchFlagBitsARM:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DataGraphPipelineDispatchFlagsARM:
        return DataGraphPipelineDispatchFlagsARM(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeRgbModelConversionFlagsVALVE(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeRgbModelConversionFlagBitsVALVE):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeRgbModelConversionFlagBitsVALVE) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeRgbModelConversionFlagBitsVALVE) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeRgbModelConversionFlagBitsVALVE) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias RGB_IDENTITY_VALVE = VideoEncodeRgbModelConversionFlagBitsVALVE(raw = 1 << 0)
    alias YCBCR_IDENTITY_VALVE = VideoEncodeRgbModelConversionFlagBitsVALVE(raw = 1 << 1)
    alias YCBCR_709_VALVE = VideoEncodeRgbModelConversionFlagBitsVALVE(raw = 1 << 2)
    alias YCBCR_601_VALVE = VideoEncodeRgbModelConversionFlagBitsVALVE(raw = 1 << 3)
    alias YCBCR_2020_VALVE = VideoEncodeRgbModelConversionFlagBitsVALVE(raw = 1 << 4)


@register_passable("trivial")
struct VideoEncodeRgbModelConversionFlagBitsVALVE:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeRgbModelConversionFlagsVALVE:
        return VideoEncodeRgbModelConversionFlagsVALVE(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeRgbRangeCompressionFlagsVALVE(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeRgbRangeCompressionFlagBitsVALVE):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeRgbRangeCompressionFlagBitsVALVE) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeRgbRangeCompressionFlagBitsVALVE) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeRgbRangeCompressionFlagBitsVALVE) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias FULL_RANGE_VALVE = VideoEncodeRgbRangeCompressionFlagBitsVALVE(raw = 1 << 0)
    alias NARROW_RANGE_VALVE = VideoEncodeRgbRangeCompressionFlagBitsVALVE(raw = 1 << 1)


@register_passable("trivial")
struct VideoEncodeRgbRangeCompressionFlagBitsVALVE:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeRgbRangeCompressionFlagsVALVE:
        return VideoEncodeRgbRangeCompressionFlagsVALVE(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeRgbChromaOffsetFlagsVALVE(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeRgbChromaOffsetFlagBitsVALVE):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeRgbChromaOffsetFlagBitsVALVE) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeRgbChromaOffsetFlagBitsVALVE) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeRgbChromaOffsetFlagBitsVALVE) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias COSITED_EVEN_VALVE = VideoEncodeRgbChromaOffsetFlagBitsVALVE(raw = 1 << 0)
    alias MIDPOINT_VALVE = VideoEncodeRgbChromaOffsetFlagBitsVALVE(raw = 1 << 1)


@register_passable("trivial")
struct VideoEncodeRgbChromaOffsetFlagBitsVALVE:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeRgbChromaOffsetFlagsVALVE:
        return VideoEncodeRgbChromaOffsetFlagsVALVE(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct CompositeAlphaFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: CompositeAlphaFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: CompositeAlphaFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: CompositeAlphaFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: CompositeAlphaFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias OPAQUE_KHR = CompositeAlphaFlagBitsKHR(raw = 1 << 0)
    alias PRE_MULTIPLIED_KHR = CompositeAlphaFlagBitsKHR(raw = 1 << 1)
    alias POST_MULTIPLIED_KHR = CompositeAlphaFlagBitsKHR(raw = 1 << 2)
    alias INHERIT_KHR = CompositeAlphaFlagBitsKHR(raw = 1 << 3)


@register_passable("trivial")
struct CompositeAlphaFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> CompositeAlphaFlagsKHR:
        return CompositeAlphaFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DisplayPlaneAlphaFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DisplayPlaneAlphaFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DisplayPlaneAlphaFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DisplayPlaneAlphaFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DisplayPlaneAlphaFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias OPAQUE_KHR = DisplayPlaneAlphaFlagBitsKHR(raw = 1 << 0)
    alias GLOBAL_KHR = DisplayPlaneAlphaFlagBitsKHR(raw = 1 << 1)
    alias PER_PIXEL_KHR = DisplayPlaneAlphaFlagBitsKHR(raw = 1 << 2)
    alias PER_PIXEL_PREMULTIPLIED_KHR = DisplayPlaneAlphaFlagBitsKHR(raw = 1 << 3)


@register_passable("trivial")
struct DisplayPlaneAlphaFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DisplayPlaneAlphaFlagsKHR:
        return DisplayPlaneAlphaFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SurfaceTransformFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SurfaceTransformFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SurfaceTransformFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SurfaceTransformFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SurfaceTransformFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias IDENTITY_KHR = SurfaceTransformFlagBitsKHR(raw = 1 << 0)
    alias ROTATE_90_KHR = SurfaceTransformFlagBitsKHR(raw = 1 << 1)
    alias ROTATE_180_KHR = SurfaceTransformFlagBitsKHR(raw = 1 << 2)
    alias ROTATE_270_KHR = SurfaceTransformFlagBitsKHR(raw = 1 << 3)
    alias HORIZONTAL_MIRROR_KHR = SurfaceTransformFlagBitsKHR(raw = 1 << 4)
    alias HORIZONTAL_MIRROR_ROTATE_90_KHR = SurfaceTransformFlagBitsKHR(raw = 1 << 5)
    alias HORIZONTAL_MIRROR_ROTATE_180_KHR = SurfaceTransformFlagBitsKHR(raw = 1 << 6)
    alias HORIZONTAL_MIRROR_ROTATE_270_KHR = SurfaceTransformFlagBitsKHR(raw = 1 << 7)
    alias INHERIT_KHR = SurfaceTransformFlagBitsKHR(raw = 1 << 8)


@register_passable("trivial")
struct SurfaceTransformFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SurfaceTransformFlagsKHR:
        return SurfaceTransformFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SwapchainCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SwapchainCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SwapchainCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SwapchainCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SwapchainCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct SwapchainCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SwapchainCreateFlagsKHR:
        return SwapchainCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DisplayModeCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DisplayModeCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DisplayModeCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DisplayModeCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DisplayModeCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DisplayModeCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DisplayModeCreateFlagsKHR:
        return DisplayModeCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DisplaySurfaceCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DisplaySurfaceCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DisplaySurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DisplaySurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DisplaySurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DisplaySurfaceCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DisplaySurfaceCreateFlagsKHR:
        return DisplaySurfaceCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct AndroidSurfaceCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: AndroidSurfaceCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: AndroidSurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: AndroidSurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: AndroidSurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct AndroidSurfaceCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> AndroidSurfaceCreateFlagsKHR:
        return AndroidSurfaceCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ViSurfaceCreateFlagsNN(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ViSurfaceCreateFlagBitsNN):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ViSurfaceCreateFlagBitsNN) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ViSurfaceCreateFlagBitsNN) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ViSurfaceCreateFlagBitsNN) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct ViSurfaceCreateFlagBitsNN:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ViSurfaceCreateFlagsNN:
        return ViSurfaceCreateFlagsNN(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct WaylandSurfaceCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: WaylandSurfaceCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: WaylandSurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: WaylandSurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: WaylandSurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct WaylandSurfaceCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> WaylandSurfaceCreateFlagsKHR:
        return WaylandSurfaceCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct Win32SurfaceCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: Win32SurfaceCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: Win32SurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: Win32SurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: Win32SurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct Win32SurfaceCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> Win32SurfaceCreateFlagsKHR:
        return Win32SurfaceCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct XlibSurfaceCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: XlibSurfaceCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: XlibSurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: XlibSurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: XlibSurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct XlibSurfaceCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> XlibSurfaceCreateFlagsKHR:
        return XlibSurfaceCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct XcbSurfaceCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: XcbSurfaceCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: XcbSurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: XcbSurfaceCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: XcbSurfaceCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct XcbSurfaceCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> XcbSurfaceCreateFlagsKHR:
        return XcbSurfaceCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DirectFBSurfaceCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DirectFBSurfaceCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DirectFBSurfaceCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DirectFBSurfaceCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DirectFBSurfaceCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DirectFBSurfaceCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DirectFBSurfaceCreateFlagsEXT:
        return DirectFBSurfaceCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct IOSSurfaceCreateFlagsMVK(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: IOSSurfaceCreateFlagBitsMVK):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: IOSSurfaceCreateFlagBitsMVK) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: IOSSurfaceCreateFlagBitsMVK) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: IOSSurfaceCreateFlagBitsMVK) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct IOSSurfaceCreateFlagBitsMVK:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> IOSSurfaceCreateFlagsMVK:
        return IOSSurfaceCreateFlagsMVK(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct MacOSSurfaceCreateFlagsMVK(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: MacOSSurfaceCreateFlagBitsMVK):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: MacOSSurfaceCreateFlagBitsMVK) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: MacOSSurfaceCreateFlagBitsMVK) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: MacOSSurfaceCreateFlagBitsMVK) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct MacOSSurfaceCreateFlagBitsMVK:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> MacOSSurfaceCreateFlagsMVK:
        return MacOSSurfaceCreateFlagsMVK(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct MetalSurfaceCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: MetalSurfaceCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: MetalSurfaceCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: MetalSurfaceCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: MetalSurfaceCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct MetalSurfaceCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> MetalSurfaceCreateFlagsEXT:
        return MetalSurfaceCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ImagePipeSurfaceCreateFlagsFUCHSIA(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ImagePipeSurfaceCreateFlagBitsFUCHSIA):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ImagePipeSurfaceCreateFlagBitsFUCHSIA) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ImagePipeSurfaceCreateFlagBitsFUCHSIA) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ImagePipeSurfaceCreateFlagBitsFUCHSIA) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct ImagePipeSurfaceCreateFlagBitsFUCHSIA:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ImagePipeSurfaceCreateFlagsFUCHSIA:
        return ImagePipeSurfaceCreateFlagsFUCHSIA(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct StreamDescriptorSurfaceCreateFlagsGGP(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: StreamDescriptorSurfaceCreateFlagBitsGGP):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: StreamDescriptorSurfaceCreateFlagBitsGGP) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: StreamDescriptorSurfaceCreateFlagBitsGGP) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: StreamDescriptorSurfaceCreateFlagBitsGGP) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct StreamDescriptorSurfaceCreateFlagBitsGGP:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> StreamDescriptorSurfaceCreateFlagsGGP:
        return StreamDescriptorSurfaceCreateFlagsGGP(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct HeadlessSurfaceCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: HeadlessSurfaceCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: HeadlessSurfaceCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: HeadlessSurfaceCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: HeadlessSurfaceCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct HeadlessSurfaceCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> HeadlessSurfaceCreateFlagsEXT:
        return HeadlessSurfaceCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ScreenSurfaceCreateFlagsQNX(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ScreenSurfaceCreateFlagBitsQNX):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ScreenSurfaceCreateFlagBitsQNX) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ScreenSurfaceCreateFlagBitsQNX) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ScreenSurfaceCreateFlagBitsQNX) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct ScreenSurfaceCreateFlagBitsQNX:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ScreenSurfaceCreateFlagsQNX:
        return ScreenSurfaceCreateFlagsQNX(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PeerMemoryFeatureFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PeerMemoryFeatureFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PeerMemoryFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PeerMemoryFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PeerMemoryFeatureFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias COPY_SRC = PeerMemoryFeatureFlagBits(raw = 1 << 0)
    alias COPY_DST = PeerMemoryFeatureFlagBits(raw = 1 << 1)
    alias GENERIC_SRC = PeerMemoryFeatureFlagBits(raw = 1 << 2)
    alias GENERIC_DST = PeerMemoryFeatureFlagBits(raw = 1 << 3)


@register_passable("trivial")
struct PeerMemoryFeatureFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PeerMemoryFeatureFlags:
        return PeerMemoryFeatureFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct MemoryAllocateFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: MemoryAllocateFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: MemoryAllocateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: MemoryAllocateFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: MemoryAllocateFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEVICE_MASK = MemoryAllocateFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct MemoryAllocateFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> MemoryAllocateFlags:
        return MemoryAllocateFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DeviceGroupPresentModeFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceGroupPresentModeFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DeviceGroupPresentModeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DeviceGroupPresentModeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DeviceGroupPresentModeFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias LOCAL_KHR = DeviceGroupPresentModeFlagBitsKHR(raw = 1 << 0)
    alias REMOTE_KHR = DeviceGroupPresentModeFlagBitsKHR(raw = 1 << 1)
    alias SUM_KHR = DeviceGroupPresentModeFlagBitsKHR(raw = 1 << 2)
    alias LOCAL_MULTI_DEVICE_KHR = DeviceGroupPresentModeFlagBitsKHR(raw = 1 << 3)


@register_passable("trivial")
struct DeviceGroupPresentModeFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DeviceGroupPresentModeFlagsKHR:
        return DeviceGroupPresentModeFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DebugReportFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DebugReportFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DebugReportFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DebugReportFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DebugReportFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias INFORMATION_EXT = DebugReportFlagBitsEXT(raw = 1 << 0)
    alias WARNING_EXT = DebugReportFlagBitsEXT(raw = 1 << 1)
    alias PERFORMANCE_WARNING_EXT = DebugReportFlagBitsEXT(raw = 1 << 2)
    alias ERROR_EXT = DebugReportFlagBitsEXT(raw = 1 << 3)
    alias DEBUG_EXT = DebugReportFlagBitsEXT(raw = 1 << 4)


@register_passable("trivial")
struct DebugReportFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DebugReportFlagsEXT:
        return DebugReportFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct CommandPoolTrimFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: CommandPoolTrimFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: CommandPoolTrimFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: CommandPoolTrimFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: CommandPoolTrimFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct CommandPoolTrimFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> CommandPoolTrimFlags:
        return CommandPoolTrimFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ExternalMemoryHandleTypeFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalMemoryHandleTypeFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ExternalMemoryHandleTypeFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ExternalMemoryHandleTypeFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ExternalMemoryHandleTypeFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias OPAQUE_WIN32_NV = ExternalMemoryHandleTypeFlagBitsNV(raw = 1 << 0)
    alias OPAQUE_WIN32_KMT_NV = ExternalMemoryHandleTypeFlagBitsNV(raw = 1 << 1)
    alias D3D11_IMAGE_NV = ExternalMemoryHandleTypeFlagBitsNV(raw = 1 << 2)
    alias D3D11_IMAGE_KMT_NV = ExternalMemoryHandleTypeFlagBitsNV(raw = 1 << 3)


@register_passable("trivial")
struct ExternalMemoryHandleTypeFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ExternalMemoryHandleTypeFlagsNV:
        return ExternalMemoryHandleTypeFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ClusterAccelerationStructureIndexFormatFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ClusterAccelerationStructureIndexFormatFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ClusterAccelerationStructureIndexFormatFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ClusterAccelerationStructureIndexFormatFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ClusterAccelerationStructureIndexFormatFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias N_8BIT_NV = ClusterAccelerationStructureIndexFormatFlagBitsNV(raw = 1 << 0)
    alias N_16BIT_NV = ClusterAccelerationStructureIndexFormatFlagBitsNV(raw = 1 << 1)
    alias N_32BIT_NV = ClusterAccelerationStructureIndexFormatFlagBitsNV(raw = 1 << 2)


@register_passable("trivial")
struct ClusterAccelerationStructureIndexFormatFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ClusterAccelerationStructureIndexFormatFlagsNV:
        return ClusterAccelerationStructureIndexFormatFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ExternalMemoryFeatureFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalMemoryFeatureFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ExternalMemoryFeatureFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ExternalMemoryFeatureFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ExternalMemoryFeatureFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEDICATED_ONLY_NV = ExternalMemoryFeatureFlagBitsNV(raw = 1 << 0)
    alias EXPORTABLE_NV = ExternalMemoryFeatureFlagBitsNV(raw = 1 << 1)
    alias IMPORTABLE_NV = ExternalMemoryFeatureFlagBitsNV(raw = 1 << 2)


@register_passable("trivial")
struct ExternalMemoryFeatureFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ExternalMemoryFeatureFlagsNV:
        return ExternalMemoryFeatureFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ExternalMemoryHandleTypeFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalMemoryHandleTypeFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ExternalMemoryHandleTypeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ExternalMemoryHandleTypeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ExternalMemoryHandleTypeFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias OPAQUE_FD = ExternalMemoryHandleTypeFlagBits(raw = 1 << 0)
    alias OPAQUE_WIN32 = ExternalMemoryHandleTypeFlagBits(raw = 1 << 1)
    alias OPAQUE_WIN32_KMT = ExternalMemoryHandleTypeFlagBits(raw = 1 << 2)
    alias D3D11_TEXTURE = ExternalMemoryHandleTypeFlagBits(raw = 1 << 3)
    alias D3D11_TEXTURE_KMT = ExternalMemoryHandleTypeFlagBits(raw = 1 << 4)
    alias D3D12_HEAP = ExternalMemoryHandleTypeFlagBits(raw = 1 << 5)
    alias D3D12_RESOURCE = ExternalMemoryHandleTypeFlagBits(raw = 1 << 6)


@register_passable("trivial")
struct ExternalMemoryHandleTypeFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ExternalMemoryHandleTypeFlags:
        return ExternalMemoryHandleTypeFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ExternalMemoryFeatureFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalMemoryFeatureFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ExternalMemoryFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ExternalMemoryFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ExternalMemoryFeatureFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEDICATED_ONLY = ExternalMemoryFeatureFlagBits(raw = 1 << 0)
    alias EXPORTABLE = ExternalMemoryFeatureFlagBits(raw = 1 << 1)
    alias IMPORTABLE = ExternalMemoryFeatureFlagBits(raw = 1 << 2)


@register_passable("trivial")
struct ExternalMemoryFeatureFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ExternalMemoryFeatureFlags:
        return ExternalMemoryFeatureFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ExternalSemaphoreHandleTypeFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalSemaphoreHandleTypeFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ExternalSemaphoreHandleTypeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ExternalSemaphoreHandleTypeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ExternalSemaphoreHandleTypeFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias OPAQUE_FD = ExternalSemaphoreHandleTypeFlagBits(raw = 1 << 0)
    alias OPAQUE_WIN32 = ExternalSemaphoreHandleTypeFlagBits(raw = 1 << 1)
    alias OPAQUE_WIN32_KMT = ExternalSemaphoreHandleTypeFlagBits(raw = 1 << 2)
    alias D3D12_FENCE = ExternalSemaphoreHandleTypeFlagBits(raw = 1 << 3)
    alias SYNC_FD = ExternalSemaphoreHandleTypeFlagBits(raw = 1 << 4)


@register_passable("trivial")
struct ExternalSemaphoreHandleTypeFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ExternalSemaphoreHandleTypeFlags:
        return ExternalSemaphoreHandleTypeFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ExternalSemaphoreFeatureFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalSemaphoreFeatureFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ExternalSemaphoreFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ExternalSemaphoreFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ExternalSemaphoreFeatureFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias EXPORTABLE = ExternalSemaphoreFeatureFlagBits(raw = 1 << 0)
    alias IMPORTABLE = ExternalSemaphoreFeatureFlagBits(raw = 1 << 1)


@register_passable("trivial")
struct ExternalSemaphoreFeatureFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ExternalSemaphoreFeatureFlags:
        return ExternalSemaphoreFeatureFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SemaphoreImportFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SemaphoreImportFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SemaphoreImportFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SemaphoreImportFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SemaphoreImportFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias TEMPORARY = SemaphoreImportFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct SemaphoreImportFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SemaphoreImportFlags:
        return SemaphoreImportFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ExternalFenceHandleTypeFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalFenceHandleTypeFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ExternalFenceHandleTypeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ExternalFenceHandleTypeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ExternalFenceHandleTypeFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias OPAQUE_FD = ExternalFenceHandleTypeFlagBits(raw = 1 << 0)
    alias OPAQUE_WIN32 = ExternalFenceHandleTypeFlagBits(raw = 1 << 1)
    alias OPAQUE_WIN32_KMT = ExternalFenceHandleTypeFlagBits(raw = 1 << 2)
    alias SYNC_FD = ExternalFenceHandleTypeFlagBits(raw = 1 << 3)


@register_passable("trivial")
struct ExternalFenceHandleTypeFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ExternalFenceHandleTypeFlags:
        return ExternalFenceHandleTypeFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ExternalFenceFeatureFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ExternalFenceFeatureFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ExternalFenceFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ExternalFenceFeatureFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ExternalFenceFeatureFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias EXPORTABLE = ExternalFenceFeatureFlagBits(raw = 1 << 0)
    alias IMPORTABLE = ExternalFenceFeatureFlagBits(raw = 1 << 1)


@register_passable("trivial")
struct ExternalFenceFeatureFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ExternalFenceFeatureFlags:
        return ExternalFenceFeatureFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct FenceImportFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: FenceImportFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: FenceImportFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: FenceImportFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: FenceImportFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias TEMPORARY = FenceImportFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct FenceImportFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> FenceImportFlags:
        return FenceImportFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SurfaceCounterFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SurfaceCounterFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SurfaceCounterFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SurfaceCounterFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SurfaceCounterFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VBLANK_EXT = SurfaceCounterFlagBitsEXT(raw = 1 << 0)


@register_passable("trivial")
struct SurfaceCounterFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SurfaceCounterFlagsEXT:
        return SurfaceCounterFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineViewportSwizzleStateCreateFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineViewportSwizzleStateCreateFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineViewportSwizzleStateCreateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineViewportSwizzleStateCreateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineViewportSwizzleStateCreateFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineViewportSwizzleStateCreateFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineViewportSwizzleStateCreateFlagsNV:
        return PipelineViewportSwizzleStateCreateFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineDiscardRectangleStateCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineDiscardRectangleStateCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineDiscardRectangleStateCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineDiscardRectangleStateCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineDiscardRectangleStateCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineDiscardRectangleStateCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineDiscardRectangleStateCreateFlagsEXT:
        return PipelineDiscardRectangleStateCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineCoverageToColorStateCreateFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCoverageToColorStateCreateFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineCoverageToColorStateCreateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineCoverageToColorStateCreateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineCoverageToColorStateCreateFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineCoverageToColorStateCreateFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineCoverageToColorStateCreateFlagsNV:
        return PipelineCoverageToColorStateCreateFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineCoverageModulationStateCreateFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCoverageModulationStateCreateFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineCoverageModulationStateCreateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineCoverageModulationStateCreateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineCoverageModulationStateCreateFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineCoverageModulationStateCreateFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineCoverageModulationStateCreateFlagsNV:
        return PipelineCoverageModulationStateCreateFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineCoverageReductionStateCreateFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineCoverageReductionStateCreateFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineCoverageReductionStateCreateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineCoverageReductionStateCreateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineCoverageReductionStateCreateFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineCoverageReductionStateCreateFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineCoverageReductionStateCreateFlagsNV:
        return PipelineCoverageReductionStateCreateFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ValidationCacheCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ValidationCacheCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ValidationCacheCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ValidationCacheCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ValidationCacheCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct ValidationCacheCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ValidationCacheCreateFlagsEXT:
        return ValidationCacheCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DebugUtilsMessageSeverityFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DebugUtilsMessageSeverityFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DebugUtilsMessageSeverityFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DebugUtilsMessageSeverityFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DebugUtilsMessageSeverityFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VERBOSE_EXT = DebugUtilsMessageSeverityFlagBitsEXT(raw = 1 << 0)
    alias INFO_EXT = DebugUtilsMessageSeverityFlagBitsEXT(raw = 1 << 4)
    alias WARNING_EXT = DebugUtilsMessageSeverityFlagBitsEXT(raw = 1 << 8)
    alias ERROR_EXT = DebugUtilsMessageSeverityFlagBitsEXT(raw = 1 << 12)


@register_passable("trivial")
struct DebugUtilsMessageSeverityFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DebugUtilsMessageSeverityFlagsEXT:
        return DebugUtilsMessageSeverityFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DebugUtilsMessageTypeFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DebugUtilsMessageTypeFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DebugUtilsMessageTypeFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DebugUtilsMessageTypeFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DebugUtilsMessageTypeFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias GENERAL_EXT = DebugUtilsMessageTypeFlagBitsEXT(raw = 1 << 0)
    alias VALIDATION_EXT = DebugUtilsMessageTypeFlagBitsEXT(raw = 1 << 1)
    alias PERFORMANCE_EXT = DebugUtilsMessageTypeFlagBitsEXT(raw = 1 << 2)


@register_passable("trivial")
struct DebugUtilsMessageTypeFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DebugUtilsMessageTypeFlagsEXT:
        return DebugUtilsMessageTypeFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DebugUtilsMessengerCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DebugUtilsMessengerCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DebugUtilsMessengerCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DebugUtilsMessengerCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DebugUtilsMessengerCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DebugUtilsMessengerCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DebugUtilsMessengerCreateFlagsEXT:
        return DebugUtilsMessengerCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DebugUtilsMessengerCallbackDataFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DebugUtilsMessengerCallbackDataFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DebugUtilsMessengerCallbackDataFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DebugUtilsMessengerCallbackDataFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DebugUtilsMessengerCallbackDataFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DebugUtilsMessengerCallbackDataFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DebugUtilsMessengerCallbackDataFlagsEXT:
        return DebugUtilsMessengerCallbackDataFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DeviceMemoryReportFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceMemoryReportFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DeviceMemoryReportFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DeviceMemoryReportFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DeviceMemoryReportFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct DeviceMemoryReportFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DeviceMemoryReportFlagsEXT:
        return DeviceMemoryReportFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineRasterizationConservativeStateCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineRasterizationConservativeStateCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineRasterizationConservativeStateCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineRasterizationConservativeStateCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineRasterizationConservativeStateCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineRasterizationConservativeStateCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineRasterizationConservativeStateCreateFlagsEXT:
        return PipelineRasterizationConservativeStateCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DescriptorBindingFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DescriptorBindingFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DescriptorBindingFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DescriptorBindingFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DescriptorBindingFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias UPDATE_AFTER_BIND = DescriptorBindingFlagBits(raw = 1 << 0)
    alias UPDATE_UNUSED_WHILE_PENDING = DescriptorBindingFlagBits(raw = 1 << 1)
    alias PARTIALLY_BOUND = DescriptorBindingFlagBits(raw = 1 << 2)
    alias VARIABLE_DESCRIPTOR_COUNT = DescriptorBindingFlagBits(raw = 1 << 3)


@register_passable("trivial")
struct DescriptorBindingFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DescriptorBindingFlags:
        return DescriptorBindingFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ConditionalRenderingFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ConditionalRenderingFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ConditionalRenderingFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ConditionalRenderingFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ConditionalRenderingFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias INVERTED_EXT = ConditionalRenderingFlagBitsEXT(raw = 1 << 0)


@register_passable("trivial")
struct ConditionalRenderingFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ConditionalRenderingFlagsEXT:
        return ConditionalRenderingFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ResolveModeFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ResolveModeFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ResolveModeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ResolveModeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ResolveModeFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias NONE = ResolveModeFlagBits(raw = 0)
    alias SAMPLE_ZERO = ResolveModeFlagBits(raw = 1 << 0)
    alias AVERAGE = ResolveModeFlagBits(raw = 1 << 1)
    alias MIN = ResolveModeFlagBits(raw = 1 << 2)
    alias MAX = ResolveModeFlagBits(raw = 1 << 3)


@register_passable("trivial")
struct ResolveModeFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ResolveModeFlags:
        return ResolveModeFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineRasterizationStateStreamCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineRasterizationStateStreamCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineRasterizationStateStreamCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineRasterizationStateStreamCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineRasterizationStateStreamCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineRasterizationStateStreamCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineRasterizationStateStreamCreateFlagsEXT:
        return PipelineRasterizationStateStreamCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PipelineRasterizationDepthClipStateCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PipelineRasterizationDepthClipStateCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PipelineRasterizationDepthClipStateCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PipelineRasterizationDepthClipStateCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PipelineRasterizationDepthClipStateCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct PipelineRasterizationDepthClipStateCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PipelineRasterizationDepthClipStateCreateFlagsEXT:
        return PipelineRasterizationDepthClipStateCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SwapchainImageUsageFlagsANDROID(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SwapchainImageUsageFlagBitsANDROID):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SwapchainImageUsageFlagBitsANDROID) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SwapchainImageUsageFlagBitsANDROID) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SwapchainImageUsageFlagBitsANDROID) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VK_SWAPCHAIN_IMAGE_USAGE_SHARED_ANDROID = SwapchainImageUsageFlagBitsANDROID(raw = 1 << 0)


@register_passable("trivial")
struct SwapchainImageUsageFlagBitsANDROID:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SwapchainImageUsageFlagsANDROID:
        return SwapchainImageUsageFlagsANDROID(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ToolPurposeFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ToolPurposeFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ToolPurposeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ToolPurposeFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ToolPurposeFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VALIDATION = ToolPurposeFlagBits(raw = 1 << 0)
    alias PROFILING = ToolPurposeFlagBits(raw = 1 << 1)
    alias TRACING = ToolPurposeFlagBits(raw = 1 << 2)
    alias ADDITIONAL_FEATURES = ToolPurposeFlagBits(raw = 1 << 3)
    alias MODIFYING_FEATURES = ToolPurposeFlagBits(raw = 1 << 4)


@register_passable("trivial")
struct ToolPurposeFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ToolPurposeFlags:
        return ToolPurposeFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SubmitFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SubmitFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SubmitFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SubmitFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SubmitFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias PROTECTED = SubmitFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct SubmitFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SubmitFlags:
        return SubmitFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ImageFormatConstraintsFlagsFUCHSIA(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ImageFormatConstraintsFlagBitsFUCHSIA):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ImageFormatConstraintsFlagBitsFUCHSIA) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ImageFormatConstraintsFlagBitsFUCHSIA) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ImageFormatConstraintsFlagBitsFUCHSIA) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct ImageFormatConstraintsFlagBitsFUCHSIA:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ImageFormatConstraintsFlagsFUCHSIA:
        return ImageFormatConstraintsFlagsFUCHSIA(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct HostImageCopyFlags(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: HostImageCopyFlagBits):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: HostImageCopyFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: HostImageCopyFlagBits) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: HostImageCopyFlagBits) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias MEMCPY = HostImageCopyFlagBits(raw = 1 << 0)


@register_passable("trivial")
struct HostImageCopyFlagBits:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> HostImageCopyFlags:
        return HostImageCopyFlags(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PartitionedAccelerationStructureInstanceFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PartitionedAccelerationStructureInstanceFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PartitionedAccelerationStructureInstanceFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PartitionedAccelerationStructureInstanceFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PartitionedAccelerationStructureInstanceFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias FLAG_TRIANGLE_FACING_CULL_DISABLE_NV = PartitionedAccelerationStructureInstanceFlagBitsNV(raw = 1 << 0)
    alias FLAG_TRIANGLE_FLIP_FACING_NV = PartitionedAccelerationStructureInstanceFlagBitsNV(raw = 1 << 1)
    alias FLAG_FORCE_OPAQUE_NV = PartitionedAccelerationStructureInstanceFlagBitsNV(raw = 1 << 2)
    alias FLAG_FORCE_NO_OPAQUE_NV = PartitionedAccelerationStructureInstanceFlagBitsNV(raw = 1 << 3)
    alias FLAG_ENABLE_EXPLICIT_BOUNDING_BOX_NV = PartitionedAccelerationStructureInstanceFlagBitsNV(raw = 1 << 4)


@register_passable("trivial")
struct PartitionedAccelerationStructureInstanceFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PartitionedAccelerationStructureInstanceFlagsNV:
        return PartitionedAccelerationStructureInstanceFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ImageConstraintsInfoFlagsFUCHSIA(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ImageConstraintsInfoFlagBitsFUCHSIA):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ImageConstraintsInfoFlagBitsFUCHSIA) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ImageConstraintsInfoFlagBitsFUCHSIA) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ImageConstraintsInfoFlagBitsFUCHSIA) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias CPU_READ_RARELY_FUCHSIA = ImageConstraintsInfoFlagBitsFUCHSIA(raw = 1 << 0)
    alias CPU_READ_OFTEN_FUCHSIA = ImageConstraintsInfoFlagBitsFUCHSIA(raw = 1 << 1)
    alias CPU_WRITE_RARELY_FUCHSIA = ImageConstraintsInfoFlagBitsFUCHSIA(raw = 1 << 2)
    alias CPU_WRITE_OFTEN_FUCHSIA = ImageConstraintsInfoFlagBitsFUCHSIA(raw = 1 << 3)
    alias PROTECTED_OPTIONAL_FUCHSIA = ImageConstraintsInfoFlagBitsFUCHSIA(raw = 1 << 4)


@register_passable("trivial")
struct ImageConstraintsInfoFlagBitsFUCHSIA:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ImageConstraintsInfoFlagsFUCHSIA:
        return ImageConstraintsInfoFlagsFUCHSIA(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct GraphicsPipelineLibraryFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: GraphicsPipelineLibraryFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: GraphicsPipelineLibraryFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: GraphicsPipelineLibraryFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: GraphicsPipelineLibraryFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VERTEX_INPUT_INTERFACE_EXT = GraphicsPipelineLibraryFlagBitsEXT(raw = 1 << 0)
    alias PRE_RASTERIZATION_SHADERS_EXT = GraphicsPipelineLibraryFlagBitsEXT(raw = 1 << 1)
    alias FRAGMENT_SHADER_EXT = GraphicsPipelineLibraryFlagBitsEXT(raw = 1 << 2)
    alias FRAGMENT_OUTPUT_INTERFACE_EXT = GraphicsPipelineLibraryFlagBitsEXT(raw = 1 << 3)


@register_passable("trivial")
struct GraphicsPipelineLibraryFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> GraphicsPipelineLibraryFlagsEXT:
        return GraphicsPipelineLibraryFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ImageCompressionFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ImageCompressionFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ImageCompressionFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ImageCompressionFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ImageCompressionFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEFAULT_EXT = ImageCompressionFlagBitsEXT(raw = 0)
    alias FIXED_RATE_DEFAULT_EXT = ImageCompressionFlagBitsEXT(raw = 1 << 0)
    alias FIXED_RATE_EXPLICIT_EXT = ImageCompressionFlagBitsEXT(raw = 1 << 1)
    alias DISABLED_EXT = ImageCompressionFlagBitsEXT(raw = 1 << 2)


@register_passable("trivial")
struct ImageCompressionFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ImageCompressionFlagsEXT:
        return ImageCompressionFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ImageCompressionFixedRateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ImageCompressionFixedRateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ImageCompressionFixedRateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ImageCompressionFixedRateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ImageCompressionFixedRateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias NONE_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 0)
    alias N_1BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 0)
    alias N_2BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 1)
    alias N_3BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 2)
    alias N_4BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 3)
    alias N_5BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 4)
    alias N_6BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 5)
    alias N_7BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 6)
    alias N_8BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 7)
    alias N_9BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 8)
    alias N_10BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 9)
    alias N_11BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 10)
    alias N_12BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 11)
    alias N_13BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 12)
    alias N_14BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 13)
    alias N_15BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 14)
    alias N_16BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 15)
    alias N_17BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 16)
    alias N_18BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 17)
    alias N_19BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 18)
    alias N_20BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 19)
    alias N_21BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 20)
    alias N_22BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 21)
    alias N_23BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 22)
    alias N_24BPC_EXT = ImageCompressionFixedRateFlagBitsEXT(raw = 1 << 23)


@register_passable("trivial")
struct ImageCompressionFixedRateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ImageCompressionFixedRateFlagsEXT:
        return ImageCompressionFixedRateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ExportMetalObjectTypeFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ExportMetalObjectTypeFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ExportMetalObjectTypeFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ExportMetalObjectTypeFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ExportMetalObjectTypeFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias METAL_DEVICE_EXT = ExportMetalObjectTypeFlagBitsEXT(raw = 1 << 0)
    alias METAL_COMMAND_QUEUE_EXT = ExportMetalObjectTypeFlagBitsEXT(raw = 1 << 1)
    alias METAL_BUFFER_EXT = ExportMetalObjectTypeFlagBitsEXT(raw = 1 << 2)
    alias METAL_TEXTURE_EXT = ExportMetalObjectTypeFlagBitsEXT(raw = 1 << 3)
    alias METAL_IOSURFACE_EXT = ExportMetalObjectTypeFlagBitsEXT(raw = 1 << 4)
    alias METAL_SHARED_EVENT_EXT = ExportMetalObjectTypeFlagBitsEXT(raw = 1 << 5)


@register_passable("trivial")
struct ExportMetalObjectTypeFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ExportMetalObjectTypeFlagsEXT:
        return ExportMetalObjectTypeFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct DeviceAddressBindingFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: DeviceAddressBindingFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: DeviceAddressBindingFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: DeviceAddressBindingFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: DeviceAddressBindingFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias INTERNAL_OBJECT_EXT = DeviceAddressBindingFlagBitsEXT(raw = 1 << 0)


@register_passable("trivial")
struct DeviceAddressBindingFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> DeviceAddressBindingFlagsEXT:
        return DeviceAddressBindingFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct OpticalFlowGridSizeFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: OpticalFlowGridSizeFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: OpticalFlowGridSizeFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: OpticalFlowGridSizeFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: OpticalFlowGridSizeFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias UNKNOWN_NV = OpticalFlowGridSizeFlagBitsNV(raw = 0)
    alias N_1X1_NV = OpticalFlowGridSizeFlagBitsNV(raw = 1 << 0)
    alias N_2X2_NV = OpticalFlowGridSizeFlagBitsNV(raw = 1 << 1)
    alias N_4X4_NV = OpticalFlowGridSizeFlagBitsNV(raw = 1 << 2)
    alias N_8X8_NV = OpticalFlowGridSizeFlagBitsNV(raw = 1 << 3)


@register_passable("trivial")
struct OpticalFlowGridSizeFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> OpticalFlowGridSizeFlagsNV:
        return OpticalFlowGridSizeFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct OpticalFlowUsageFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: OpticalFlowUsageFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: OpticalFlowUsageFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: OpticalFlowUsageFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: OpticalFlowUsageFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias UNKNOWN_NV = OpticalFlowUsageFlagBitsNV(raw = 0)
    alias INPUT_NV = OpticalFlowUsageFlagBitsNV(raw = 1 << 0)
    alias OUTPUT_NV = OpticalFlowUsageFlagBitsNV(raw = 1 << 1)
    alias HINT_NV = OpticalFlowUsageFlagBitsNV(raw = 1 << 2)
    alias COST_NV = OpticalFlowUsageFlagBitsNV(raw = 1 << 3)
    alias GLOBAL_FLOW_NV = OpticalFlowUsageFlagBitsNV(raw = 1 << 4)


@register_passable("trivial")
struct OpticalFlowUsageFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> OpticalFlowUsageFlagsNV:
        return OpticalFlowUsageFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct OpticalFlowSessionCreateFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: OpticalFlowSessionCreateFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: OpticalFlowSessionCreateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: OpticalFlowSessionCreateFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: OpticalFlowSessionCreateFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ENABLE_HINT_NV = OpticalFlowSessionCreateFlagBitsNV(raw = 1 << 0)
    alias ENABLE_COST_NV = OpticalFlowSessionCreateFlagBitsNV(raw = 1 << 1)
    alias ENABLE_GLOBAL_FLOW_NV = OpticalFlowSessionCreateFlagBitsNV(raw = 1 << 2)
    alias ALLOW_REGIONS_NV = OpticalFlowSessionCreateFlagBitsNV(raw = 1 << 3)
    alias BOTH_DIRECTIONS_NV = OpticalFlowSessionCreateFlagBitsNV(raw = 1 << 4)


@register_passable("trivial")
struct OpticalFlowSessionCreateFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> OpticalFlowSessionCreateFlagsNV:
        return OpticalFlowSessionCreateFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct OpticalFlowExecuteFlagsNV(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: OpticalFlowExecuteFlagBitsNV):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: OpticalFlowExecuteFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: OpticalFlowExecuteFlagBitsNV) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: OpticalFlowExecuteFlagBitsNV) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DISABLE_TEMPORAL_HINTS_NV = OpticalFlowExecuteFlagBitsNV(raw = 1 << 0)


@register_passable("trivial")
struct OpticalFlowExecuteFlagBitsNV:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> OpticalFlowExecuteFlagsNV:
        return OpticalFlowExecuteFlagsNV(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct FrameBoundaryFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: FrameBoundaryFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: FrameBoundaryFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: FrameBoundaryFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: FrameBoundaryFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias FRAME_END_EXT = FrameBoundaryFlagBitsEXT(raw = 1 << 0)


@register_passable("trivial")
struct FrameBoundaryFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> FrameBoundaryFlagsEXT:
        return FrameBoundaryFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PresentScalingFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PresentScalingFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PresentScalingFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PresentScalingFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PresentScalingFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ONE_TO_ONE_KHR = PresentScalingFlagBitsKHR(raw = 1 << 0)
    alias ASPECT_RATIO_STRETCH_KHR = PresentScalingFlagBitsKHR(raw = 1 << 1)
    alias STRETCH_KHR = PresentScalingFlagBitsKHR(raw = 1 << 2)


@register_passable("trivial")
struct PresentScalingFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PresentScalingFlagsKHR:
        return PresentScalingFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PresentGravityFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: PresentGravityFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PresentGravityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PresentGravityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PresentGravityFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias MIN_KHR = PresentGravityFlagBitsKHR(raw = 1 << 0)
    alias MAX_KHR = PresentGravityFlagBitsKHR(raw = 1 << 1)
    alias CENTERED_KHR = PresentGravityFlagBitsKHR(raw = 1 << 2)


@register_passable("trivial")
struct PresentGravityFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PresentGravityFlagsKHR:
        return PresentGravityFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct ShaderCreateFlagsEXT(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: ShaderCreateFlagBitsEXT):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: ShaderCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: ShaderCreateFlagBitsEXT) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: ShaderCreateFlagBitsEXT) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias LINK_STAGE_EXT = ShaderCreateFlagBitsEXT(raw = 1 << 0)


@register_passable("trivial")
struct ShaderCreateFlagBitsEXT:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> ShaderCreateFlagsEXT:
        return ShaderCreateFlagsEXT(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct TileShadingRenderPassFlagsQCOM(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: TileShadingRenderPassFlagBitsQCOM):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: TileShadingRenderPassFlagBitsQCOM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: TileShadingRenderPassFlagBitsQCOM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: TileShadingRenderPassFlagBitsQCOM) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ENABLE_QCOM = TileShadingRenderPassFlagBitsQCOM(raw = 1 << 0)
    alias PER_TILE_EXECUTION_QCOM = TileShadingRenderPassFlagBitsQCOM(raw = 1 << 1)


@register_passable("trivial")
struct TileShadingRenderPassFlagBitsQCOM:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> TileShadingRenderPassFlagsQCOM:
        return TileShadingRenderPassFlagsQCOM(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct PhysicalDeviceSchedulingControlsFlagsARM(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: PhysicalDeviceSchedulingControlsFlagBitsARM):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: PhysicalDeviceSchedulingControlsFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: PhysicalDeviceSchedulingControlsFlagBitsARM) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: PhysicalDeviceSchedulingControlsFlagBitsARM) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias SHADER_CORE_COUNT_ARM = PhysicalDeviceSchedulingControlsFlagBitsARM(raw = 1 << 0)


@register_passable("trivial")
struct PhysicalDeviceSchedulingControlsFlagBitsARM:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> PhysicalDeviceSchedulingControlsFlagsARM:
        return PhysicalDeviceSchedulingControlsFlagsARM(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct SurfaceCreateFlagsOHOS(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: SurfaceCreateFlagBitsOHOS):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: SurfaceCreateFlagBitsOHOS) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: SurfaceCreateFlagBitsOHOS) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: SurfaceCreateFlagBitsOHOS) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct SurfaceCreateFlagBitsOHOS:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> SurfaceCreateFlagsOHOS:
        return SurfaceCreateFlagsOHOS(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoCodecOperationFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoCodecOperationFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoCodecOperationFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoCodecOperationFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoCodecOperationFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias NONE_KHR = VideoCodecOperationFlagBitsKHR(raw = 0)


@register_passable("trivial")
struct VideoCodecOperationFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoCodecOperationFlagsKHR:
        return VideoCodecOperationFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoCapabilityFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoCapabilityFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoCapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoCapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoCapabilityFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias PROTECTED_CONTENT_KHR = VideoCapabilityFlagBitsKHR(raw = 1 << 0)
    alias SEPARATE_REFERENCE_IMAGES_KHR = VideoCapabilityFlagBitsKHR(raw = 1 << 1)


@register_passable("trivial")
struct VideoCapabilityFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoCapabilityFlagsKHR:
        return VideoCapabilityFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoSessionCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoSessionCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoSessionCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoSessionCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoSessionCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias PROTECTED_CONTENT_KHR = VideoSessionCreateFlagBitsKHR(raw = 1 << 0)


@register_passable("trivial")
struct VideoSessionCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoSessionCreateFlagsKHR:
        return VideoSessionCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoSessionParametersCreateFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoSessionParametersCreateFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoSessionParametersCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoSessionParametersCreateFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoSessionParametersCreateFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct VideoSessionParametersCreateFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoSessionParametersCreateFlagsKHR:
        return VideoSessionParametersCreateFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoBeginCodingFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoBeginCodingFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoBeginCodingFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoBeginCodingFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoBeginCodingFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct VideoBeginCodingFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoBeginCodingFlagsKHR:
        return VideoBeginCodingFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEndCodingFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEndCodingFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEndCodingFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEndCodingFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEndCodingFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct VideoEndCodingFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEndCodingFlagsKHR:
        return VideoEndCodingFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoCodingControlFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoCodingControlFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoCodingControlFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoCodingControlFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoCodingControlFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias RESET_KHR = VideoCodingControlFlagBitsKHR(raw = 1 << 0)


@register_passable("trivial")
struct VideoCodingControlFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoCodingControlFlagsKHR:
        return VideoCodingControlFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoDecodeUsageFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoDecodeUsageFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoDecodeUsageFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoDecodeUsageFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoDecodeUsageFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEFAULT_KHR = VideoDecodeUsageFlagBitsKHR(raw = 0)
    alias TRANSCODING_KHR = VideoDecodeUsageFlagBitsKHR(raw = 1 << 0)
    alias OFFLINE_KHR = VideoDecodeUsageFlagBitsKHR(raw = 1 << 1)
    alias STREAMING_KHR = VideoDecodeUsageFlagBitsKHR(raw = 1 << 2)


@register_passable("trivial")
struct VideoDecodeUsageFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoDecodeUsageFlagsKHR:
        return VideoDecodeUsageFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoDecodeCapabilityFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoDecodeCapabilityFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoDecodeCapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoDecodeCapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoDecodeCapabilityFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DPB_AND_OUTPUT_COINCIDE_KHR = VideoDecodeCapabilityFlagBitsKHR(raw = 1 << 0)
    alias DPB_AND_OUTPUT_DISTINCT_KHR = VideoDecodeCapabilityFlagBitsKHR(raw = 1 << 1)


@register_passable("trivial")
struct VideoDecodeCapabilityFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoDecodeCapabilityFlagsKHR:
        return VideoDecodeCapabilityFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoDecodeFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoDecodeFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoDecodeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoDecodeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoDecodeFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct VideoDecodeFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoDecodeFlagsKHR:
        return VideoDecodeFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoDecodeH264PictureLayoutFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoDecodeH264PictureLayoutFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoDecodeH264PictureLayoutFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoDecodeH264PictureLayoutFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoDecodeH264PictureLayoutFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias PROGRESSIVE_KHR = VideoDecodeH264PictureLayoutFlagBitsKHR(raw = 0)
    alias INTERLACED_INTERLEAVED_LINES_KHR = VideoDecodeH264PictureLayoutFlagBitsKHR(raw = 1 << 0)
    alias INTERLACED_SEPARATE_PLANES_KHR = VideoDecodeH264PictureLayoutFlagBitsKHR(raw = 1 << 1)


@register_passable("trivial")
struct VideoDecodeH264PictureLayoutFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoDecodeH264PictureLayoutFlagsKHR:
        return VideoDecodeH264PictureLayoutFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct VideoEncodeFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeFlagsKHR:
        return VideoEncodeFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeUsageFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeUsageFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeUsageFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeUsageFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeUsageFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEFAULT_KHR = VideoEncodeUsageFlagBitsKHR(raw = 0)
    alias TRANSCODING_KHR = VideoEncodeUsageFlagBitsKHR(raw = 1 << 0)
    alias STREAMING_KHR = VideoEncodeUsageFlagBitsKHR(raw = 1 << 1)
    alias RECORDING_KHR = VideoEncodeUsageFlagBitsKHR(raw = 1 << 2)
    alias CONFERENCING_KHR = VideoEncodeUsageFlagBitsKHR(raw = 1 << 3)


@register_passable("trivial")
struct VideoEncodeUsageFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeUsageFlagsKHR:
        return VideoEncodeUsageFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeContentFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeContentFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeContentFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeContentFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeContentFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEFAULT_KHR = VideoEncodeContentFlagBitsKHR(raw = 0)
    alias CAMERA_KHR = VideoEncodeContentFlagBitsKHR(raw = 1 << 0)
    alias DESKTOP_KHR = VideoEncodeContentFlagBitsKHR(raw = 1 << 1)
    alias RENDERED_KHR = VideoEncodeContentFlagBitsKHR(raw = 1 << 2)


@register_passable("trivial")
struct VideoEncodeContentFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeContentFlagsKHR:
        return VideoEncodeContentFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeCapabilityFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeCapabilityFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeCapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeCapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeCapabilityFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias PRECEDING_EXTERNALLY_ENCODED_BYTES_KHR = VideoEncodeCapabilityFlagBitsKHR(raw = 1 << 0)
    alias INSUFFICIENT_BITSTREAM_BUFFER_RANGE_DETECTION_KHR = VideoEncodeCapabilityFlagBitsKHR(raw = 1 << 1)


@register_passable("trivial")
struct VideoEncodeCapabilityFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeCapabilityFlagsKHR:
        return VideoEncodeCapabilityFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeFeedbackFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeFeedbackFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeFeedbackFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeFeedbackFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeFeedbackFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias BITSTREAM_BUFFER_OFFSET_KHR = VideoEncodeFeedbackFlagBitsKHR(raw = 1 << 0)
    alias BITSTREAM_BYTES_WRITTEN_KHR = VideoEncodeFeedbackFlagBitsKHR(raw = 1 << 1)
    alias BITSTREAM_HAS_OVERRIDES_KHR = VideoEncodeFeedbackFlagBitsKHR(raw = 1 << 2)


@register_passable("trivial")
struct VideoEncodeFeedbackFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeFeedbackFlagsKHR:
        return VideoEncodeFeedbackFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeRateControlFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeRateControlFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeRateControlFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeRateControlFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeRateControlFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())



@register_passable("trivial")
struct VideoEncodeRateControlFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeRateControlFlagsKHR:
        return VideoEncodeRateControlFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeRateControlModeFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeRateControlModeFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeRateControlModeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeRateControlModeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeRateControlModeFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias DEFAULT_KHR = VideoEncodeRateControlModeFlagBitsKHR(raw = 0)
    alias DISABLED_KHR = VideoEncodeRateControlModeFlagBitsKHR(raw = 1 << 0)
    alias CBR_KHR = VideoEncodeRateControlModeFlagBitsKHR(raw = 1 << 1)
    alias VBR_KHR = VideoEncodeRateControlModeFlagBitsKHR(raw = 1 << 2)


@register_passable("trivial")
struct VideoEncodeRateControlModeFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeRateControlModeFlagsKHR:
        return VideoEncodeRateControlModeFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeIntraRefreshModeFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeIntraRefreshModeFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeIntraRefreshModeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeIntraRefreshModeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeIntraRefreshModeFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias NONE_KHR = VideoEncodeIntraRefreshModeFlagBitsKHR(raw = 0)
    alias PER_PICTURE_PARTITION_KHR = VideoEncodeIntraRefreshModeFlagBitsKHR(raw = 1 << 0)
    alias BLOCK_BASED_KHR = VideoEncodeIntraRefreshModeFlagBitsKHR(raw = 1 << 1)
    alias BLOCK_ROW_BASED_KHR = VideoEncodeIntraRefreshModeFlagBitsKHR(raw = 1 << 2)
    alias BLOCK_COLUMN_BASED_KHR = VideoEncodeIntraRefreshModeFlagBitsKHR(raw = 1 << 3)


@register_passable("trivial")
struct VideoEncodeIntraRefreshModeFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeIntraRefreshModeFlagsKHR:
        return VideoEncodeIntraRefreshModeFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoChromaSubsamplingFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoChromaSubsamplingFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoChromaSubsamplingFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoChromaSubsamplingFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoChromaSubsamplingFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias INVALID_KHR = VideoChromaSubsamplingFlagBitsKHR(raw = 0)
    alias MONOCHROME_KHR = VideoChromaSubsamplingFlagBitsKHR(raw = 1 << 0)
    alias N_420_KHR = VideoChromaSubsamplingFlagBitsKHR(raw = 1 << 1)
    alias N_422_KHR = VideoChromaSubsamplingFlagBitsKHR(raw = 1 << 2)
    alias N_444_KHR = VideoChromaSubsamplingFlagBitsKHR(raw = 1 << 3)


@register_passable("trivial")
struct VideoChromaSubsamplingFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoChromaSubsamplingFlagsKHR:
        return VideoChromaSubsamplingFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoComponentBitDepthFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoComponentBitDepthFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoComponentBitDepthFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoComponentBitDepthFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoComponentBitDepthFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias INVALID_KHR = VideoComponentBitDepthFlagBitsKHR(raw = 0)
    alias N_8_KHR = VideoComponentBitDepthFlagBitsKHR(raw = 1 << 0)
    alias N_10_KHR = VideoComponentBitDepthFlagBitsKHR(raw = 1 << 2)
    alias N_12_KHR = VideoComponentBitDepthFlagBitsKHR(raw = 1 << 4)


@register_passable("trivial")
struct VideoComponentBitDepthFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoComponentBitDepthFlagsKHR:
        return VideoComponentBitDepthFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeH264CapabilityFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH264CapabilityFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeH264CapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeH264CapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeH264CapabilityFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias HRD_COMPLIANCE_KHR = VideoEncodeH264CapabilityFlagBitsKHR(raw = 1 << 0)
    alias PREDICTION_WEIGHT_TABLE_GENERATED_KHR = VideoEncodeH264CapabilityFlagBitsKHR(raw = 1 << 1)
    alias ROW_UNALIGNED_SLICE_KHR = VideoEncodeH264CapabilityFlagBitsKHR(raw = 1 << 2)
    alias DIFFERENT_SLICE_TYPE_KHR = VideoEncodeH264CapabilityFlagBitsKHR(raw = 1 << 3)
    alias B_FRAME_IN_L0_LIST_KHR = VideoEncodeH264CapabilityFlagBitsKHR(raw = 1 << 4)
    alias B_FRAME_IN_L1_LIST_KHR = VideoEncodeH264CapabilityFlagBitsKHR(raw = 1 << 5)
    alias PER_PICTURE_TYPE_MIN_MAX_QP_KHR = VideoEncodeH264CapabilityFlagBitsKHR(raw = 1 << 6)
    alias PER_SLICE_CONSTANT_QP_KHR = VideoEncodeH264CapabilityFlagBitsKHR(raw = 1 << 7)
    alias GENERATE_PREFIX_NALU_KHR = VideoEncodeH264CapabilityFlagBitsKHR(raw = 1 << 8)


@register_passable("trivial")
struct VideoEncodeH264CapabilityFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeH264CapabilityFlagsKHR:
        return VideoEncodeH264CapabilityFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeH264StdFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH264StdFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeH264StdFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeH264StdFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeH264StdFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias SEPARATE_COLOR_PLANE_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 0)
    alias QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 1)
    alias SCALING_MATRIX_PRESENT_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 2)
    alias CHROMA_QP_INDEX_OFFSET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 3)
    alias SECOND_CHROMA_QP_INDEX_OFFSET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 4)
    alias PIC_INIT_QP_MINUS26_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 5)
    alias WEIGHTED_PRED_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 6)
    alias WEIGHTED_BIPRED_IDC_EXPLICIT_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 7)
    alias WEIGHTED_BIPRED_IDC_IMPLICIT_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 8)
    alias TRANSFORM_8X8_MODE_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 9)
    alias DIRECT_SPATIAL_MV_PRED_FLAG_UNSET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 10)
    alias ENTROPY_CODING_MODE_FLAG_UNSET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 11)
    alias ENTROPY_CODING_MODE_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 12)
    alias DIRECT_8X8_INFERENCE_FLAG_UNSET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 13)
    alias CONSTRAINED_INTRA_PRED_FLAG_SET_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 14)
    alias DEBLOCKING_FILTER_DISABLED_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 15)
    alias DEBLOCKING_FILTER_ENABLED_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 16)
    alias DEBLOCKING_FILTER_PARTIAL_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 17)
    alias SLICE_QP_DELTA_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 19)
    alias DIFFERENT_SLICE_QP_DELTA_KHR = VideoEncodeH264StdFlagBitsKHR(raw = 1 << 20)


@register_passable("trivial")
struct VideoEncodeH264StdFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeH264StdFlagsKHR:
        return VideoEncodeH264StdFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeH264RateControlFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH264RateControlFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeH264RateControlFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeH264RateControlFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeH264RateControlFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ATTEMPT_HRD_COMPLIANCE_KHR = VideoEncodeH264RateControlFlagBitsKHR(raw = 1 << 0)
    alias REGULAR_GOP_KHR = VideoEncodeH264RateControlFlagBitsKHR(raw = 1 << 1)
    alias REFERENCE_PATTERN_FLAT_KHR = VideoEncodeH264RateControlFlagBitsKHR(raw = 1 << 2)
    alias REFERENCE_PATTERN_DYADIC_KHR = VideoEncodeH264RateControlFlagBitsKHR(raw = 1 << 3)
    alias TEMPORAL_LAYER_PATTERN_DYADIC_KHR = VideoEncodeH264RateControlFlagBitsKHR(raw = 1 << 4)


@register_passable("trivial")
struct VideoEncodeH264RateControlFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeH264RateControlFlagsKHR:
        return VideoEncodeH264RateControlFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeH265CapabilityFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH265CapabilityFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeH265CapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeH265CapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeH265CapabilityFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias HRD_COMPLIANCE_KHR = VideoEncodeH265CapabilityFlagBitsKHR(raw = 1 << 0)
    alias PREDICTION_WEIGHT_TABLE_GENERATED_KHR = VideoEncodeH265CapabilityFlagBitsKHR(raw = 1 << 1)
    alias ROW_UNALIGNED_SLICE_SEGMENT_KHR = VideoEncodeH265CapabilityFlagBitsKHR(raw = 1 << 2)
    alias DIFFERENT_SLICE_SEGMENT_TYPE_KHR = VideoEncodeH265CapabilityFlagBitsKHR(raw = 1 << 3)
    alias B_FRAME_IN_L0_LIST_KHR = VideoEncodeH265CapabilityFlagBitsKHR(raw = 1 << 4)
    alias B_FRAME_IN_L1_LIST_KHR = VideoEncodeH265CapabilityFlagBitsKHR(raw = 1 << 5)
    alias PER_PICTURE_TYPE_MIN_MAX_QP_KHR = VideoEncodeH265CapabilityFlagBitsKHR(raw = 1 << 6)
    alias PER_SLICE_SEGMENT_CONSTANT_QP_KHR = VideoEncodeH265CapabilityFlagBitsKHR(raw = 1 << 7)
    alias MULTIPLE_TILES_PER_SLICE_SEGMENT_KHR = VideoEncodeH265CapabilityFlagBitsKHR(raw = 1 << 8)
    alias MULTIPLE_SLICE_SEGMENTS_PER_TILE_KHR = VideoEncodeH265CapabilityFlagBitsKHR(raw = 1 << 9)


@register_passable("trivial")
struct VideoEncodeH265CapabilityFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeH265CapabilityFlagsKHR:
        return VideoEncodeH265CapabilityFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeH265StdFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH265StdFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeH265StdFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeH265StdFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeH265StdFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias SEPARATE_COLOR_PLANE_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 0)
    alias SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 1)
    alias SCALING_LIST_DATA_PRESENT_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 2)
    alias PCM_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 3)
    alias SPS_TEMPORAL_MVP_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 4)
    alias INIT_QP_MINUS26_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 5)
    alias WEIGHTED_PRED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 6)
    alias WEIGHTED_BIPRED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 7)
    alias LOG2_PARALLEL_MERGE_LEVEL_MINUS2_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 8)
    alias SIGN_DATA_HIDING_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 9)
    alias TRANSFORM_SKIP_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 10)
    alias TRANSFORM_SKIP_ENABLED_FLAG_UNSET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 11)
    alias PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 12)
    alias TRANSQUANT_BYPASS_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 13)
    alias CONSTRAINED_INTRA_PRED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 14)
    alias ENTROPY_CODING_SYNC_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 15)
    alias DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 16)
    alias DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 17)
    alias DEPENDENT_SLICE_SEGMENT_FLAG_SET_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 18)
    alias SLICE_QP_DELTA_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 19)
    alias DIFFERENT_SLICE_QP_DELTA_KHR = VideoEncodeH265StdFlagBitsKHR(raw = 1 << 20)


@register_passable("trivial")
struct VideoEncodeH265StdFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeH265StdFlagsKHR:
        return VideoEncodeH265StdFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeH265RateControlFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH265RateControlFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeH265RateControlFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeH265RateControlFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeH265RateControlFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias ATTEMPT_HRD_COMPLIANCE_KHR = VideoEncodeH265RateControlFlagBitsKHR(raw = 1 << 0)
    alias REGULAR_GOP_KHR = VideoEncodeH265RateControlFlagBitsKHR(raw = 1 << 1)
    alias REFERENCE_PATTERN_FLAT_KHR = VideoEncodeH265RateControlFlagBitsKHR(raw = 1 << 2)
    alias REFERENCE_PATTERN_DYADIC_KHR = VideoEncodeH265RateControlFlagBitsKHR(raw = 1 << 3)
    alias TEMPORAL_SUB_LAYER_PATTERN_DYADIC_KHR = VideoEncodeH265RateControlFlagBitsKHR(raw = 1 << 4)


@register_passable("trivial")
struct VideoEncodeH265RateControlFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeH265RateControlFlagsKHR:
        return VideoEncodeH265RateControlFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeH265CtbSizeFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH265CtbSizeFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeH265CtbSizeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeH265CtbSizeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeH265CtbSizeFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias N_16_KHR = VideoEncodeH265CtbSizeFlagBitsKHR(raw = 1 << 0)
    alias N_32_KHR = VideoEncodeH265CtbSizeFlagBitsKHR(raw = 1 << 1)
    alias N_64_KHR = VideoEncodeH265CtbSizeFlagBitsKHR(raw = 1 << 2)


@register_passable("trivial")
struct VideoEncodeH265CtbSizeFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeH265CtbSizeFlagsKHR:
        return VideoEncodeH265CtbSizeFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeH265TransformBlockSizeFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeH265TransformBlockSizeFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeH265TransformBlockSizeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeH265TransformBlockSizeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeH265TransformBlockSizeFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias N_4_KHR = VideoEncodeH265TransformBlockSizeFlagBitsKHR(raw = 1 << 0)
    alias N_8_KHR = VideoEncodeH265TransformBlockSizeFlagBitsKHR(raw = 1 << 1)
    alias N_16_KHR = VideoEncodeH265TransformBlockSizeFlagBitsKHR(raw = 1 << 2)
    alias N_32_KHR = VideoEncodeH265TransformBlockSizeFlagBitsKHR(raw = 1 << 3)


@register_passable("trivial")
struct VideoEncodeH265TransformBlockSizeFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeH265TransformBlockSizeFlagsKHR:
        return VideoEncodeH265TransformBlockSizeFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeAV1CapabilityFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeAV1CapabilityFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeAV1CapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeAV1CapabilityFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeAV1CapabilityFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias PER_RATE_CONTROL_GROUP_MIN_MAX_Q_INDEX_KHR = VideoEncodeAV1CapabilityFlagBitsKHR(raw = 1 << 0)
    alias GENERATE_OBU_EXTENSION_HEADER_KHR = VideoEncodeAV1CapabilityFlagBitsKHR(raw = 1 << 1)
    alias PRIMARY_REFERENCE_CDF_ONLY_KHR = VideoEncodeAV1CapabilityFlagBitsKHR(raw = 1 << 2)
    alias FRAME_SIZE_OVERRIDE_KHR = VideoEncodeAV1CapabilityFlagBitsKHR(raw = 1 << 3)
    alias MOTION_VECTOR_SCALING_KHR = VideoEncodeAV1CapabilityFlagBitsKHR(raw = 1 << 4)


@register_passable("trivial")
struct VideoEncodeAV1CapabilityFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeAV1CapabilityFlagsKHR:
        return VideoEncodeAV1CapabilityFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeAV1StdFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeAV1StdFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeAV1StdFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeAV1StdFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeAV1StdFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias UNIFORM_TILE_SPACING_FLAG_SET_KHR = VideoEncodeAV1StdFlagBitsKHR(raw = 1 << 0)
    alias SKIP_MODE_PRESENT_UNSET_KHR = VideoEncodeAV1StdFlagBitsKHR(raw = 1 << 1)
    alias PRIMARY_REF_FRAME_KHR = VideoEncodeAV1StdFlagBitsKHR(raw = 1 << 2)
    alias DELTA_Q_KHR = VideoEncodeAV1StdFlagBitsKHR(raw = 1 << 3)


@register_passable("trivial")
struct VideoEncodeAV1StdFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeAV1StdFlagsKHR:
        return VideoEncodeAV1StdFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeAV1RateControlFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeAV1RateControlFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeAV1RateControlFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeAV1RateControlFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeAV1RateControlFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias REGULAR_GOP_KHR = VideoEncodeAV1RateControlFlagBitsKHR(raw = 1 << 0)
    alias TEMPORAL_LAYER_PATTERN_DYADIC_KHR = VideoEncodeAV1RateControlFlagBitsKHR(raw = 1 << 1)
    alias REFERENCE_PATTERN_FLAT_KHR = VideoEncodeAV1RateControlFlagBitsKHR(raw = 1 << 2)
    alias REFERENCE_PATTERN_DYADIC_KHR = VideoEncodeAV1RateControlFlagBitsKHR(raw = 1 << 3)


@register_passable("trivial")
struct VideoEncodeAV1RateControlFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeAV1RateControlFlagsKHR:
        return VideoEncodeAV1RateControlFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct VideoEncodeAV1SuperblockSizeFlagsKHR(EqualityComparable):
    var _raw: UInt32

    @implicit
    fn __init__(out self, *bits: VideoEncodeAV1SuperblockSizeFlagBitsKHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: VideoEncodeAV1SuperblockSizeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: VideoEncodeAV1SuperblockSizeFlagBitsKHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: VideoEncodeAV1SuperblockSizeFlagBitsKHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias N_64_KHR = VideoEncodeAV1SuperblockSizeFlagBitsKHR(raw = 1 << 0)
    alias N_128_KHR = VideoEncodeAV1SuperblockSizeFlagBitsKHR(raw = 1 << 1)


@register_passable("trivial")
struct VideoEncodeAV1SuperblockSizeFlagBitsKHR:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> VideoEncodeAV1SuperblockSizeFlagsKHR:
        return VideoEncodeAV1SuperblockSizeFlagsKHR(raw = self.raw() | bit.raw())


@register_passable("trivial")
struct AccessFlags3KHR(EqualityComparable):
    var _raw: UInt64

    @implicit
    fn __init__(out self, *bits: AccessFlagBits3KHR):
        self._raw = 0
        for bit in bits:
            self._raw |= bit.raw()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __or__(self, bit: AccessFlagBits3KHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __ror__(self, bit: AccessFlagBits3KHR) -> Self:
        return Self(raw = self.raw() | bit.raw())

    fn __contains__(self, bit: AccessFlagBits3KHR) -> Bool:
        return Bool(self.raw() & bit.raw())


    alias VK_ACCESS_3_NONE_KHR = AccessFlagBits3KHR(raw = 0)


@register_passable("trivial")
struct AccessFlagBits3KHR:
    var _raw: UInt64

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    fn __or__(self, bit: Self) -> AccessFlags3KHR:
        return AccessFlags3KHR(raw = self.raw() | bit.raw())
