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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: FramebufferCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: FramebufferCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: FramebufferCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: FramebufferCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: FramebufferCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: FramebufferCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: FramebufferCreateFlags) -> Bool:
        return self & other == other

    comptime IMAGELESS = Self(value = FramebufferCreateFlagBits.IMAGELESS.value())


@register_passable("trivial")
struct FramebufferCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> FramebufferCreateFlags:
        return FramebufferCreateFlags(value = self._value | other._value)

    comptime IMAGELESS = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: QueryPoolCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: QueryPoolCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: QueryPoolCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: QueryPoolCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: QueryPoolCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: QueryPoolCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: QueryPoolCreateFlags) -> Bool:
        return self & other == other

    comptime RESET = Self(value = QueryPoolCreateFlagBits.RESET.value())


@register_passable("trivial")
struct QueryPoolCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> QueryPoolCreateFlags:
        return QueryPoolCreateFlags(value = self._value | other._value)

    comptime RESET = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: RenderPassCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: RenderPassCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: RenderPassCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: RenderPassCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: RenderPassCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: RenderPassCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: RenderPassCreateFlags) -> Bool:
        return self & other == other

    comptime RESERVED_0 = Self(value = RenderPassCreateFlagBits.RESERVED_0.value())
    comptime TRANSFORM = Self(value = RenderPassCreateFlagBits.TRANSFORM.value())
    comptime PER_LAYER_FRAGMENT_DENSITY = Self(value = RenderPassCreateFlagBits.PER_LAYER_FRAGMENT_DENSITY.value())
    comptime RESERVED_3 = Self(value = RenderPassCreateFlagBits.RESERVED_3.value())


@register_passable("trivial")
struct RenderPassCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> RenderPassCreateFlags:
        return RenderPassCreateFlags(value = self._value | other._value)

    comptime RESERVED_0 = Self(value = 1 << 0)
    comptime TRANSFORM = Self(value = 1 << 1)
    comptime PER_LAYER_FRAGMENT_DENSITY = Self(value = 1 << 2)
    comptime RESERVED_3 = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SamplerCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SamplerCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SamplerCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SamplerCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SamplerCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SamplerCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: SamplerCreateFlags) -> Bool:
        return self & other == other

    comptime SUBSAMPLED = Self(value = SamplerCreateFlagBits.SUBSAMPLED.value())
    comptime SUBSAMPLED_COARSE_RECONSTRUCTION = Self(value = SamplerCreateFlagBits.SUBSAMPLED_COARSE_RECONSTRUCTION.value())
    comptime NON_SEAMLESS_CUBE_MAP = Self(value = SamplerCreateFlagBits.NON_SEAMLESS_CUBE_MAP.value())
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = SamplerCreateFlagBits.DESCRIPTOR_BUFFER_CAPTURE_REPLAY.value())
    comptime IMAGE_PROCESSING = Self(value = SamplerCreateFlagBits.IMAGE_PROCESSING.value())


@register_passable("trivial")
struct SamplerCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SamplerCreateFlags:
        return SamplerCreateFlags(value = self._value | other._value)

    comptime SUBSAMPLED = Self(value = 1 << 0)
    comptime SUBSAMPLED_COARSE_RECONSTRUCTION = Self(value = 1 << 1)
    comptime NON_SEAMLESS_CUBE_MAP = Self(value = 1 << 2)
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = 1 << 3)
    comptime IMAGE_PROCESSING = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineLayoutCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineLayoutCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineLayoutCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineLayoutCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineLayoutCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineLayoutCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineLayoutCreateFlags) -> Bool:
        return self & other == other

    comptime RESERVED_0 = Self(value = PipelineLayoutCreateFlagBits.RESERVED_0.value())
    comptime INDEPENDENT_SETS = Self(value = PipelineLayoutCreateFlagBits.INDEPENDENT_SETS.value())


@register_passable("trivial")
struct PipelineLayoutCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineLayoutCreateFlags:
        return PipelineLayoutCreateFlags(value = self._value | other._value)

    comptime RESERVED_0 = Self(value = 1 << 0)
    comptime INDEPENDENT_SETS = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineCacheCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineCacheCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineCacheCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineCacheCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineCacheCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineCacheCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineCacheCreateFlags) -> Bool:
        return self & other == other

    comptime EXTERNALLY_SYNCHRONIZED = Self(value = PipelineCacheCreateFlagBits.EXTERNALLY_SYNCHRONIZED.value())
    comptime READ_ONLY = Self(value = PipelineCacheCreateFlagBits.READ_ONLY.value())
    comptime USE_APPLICATION_STORAGE = Self(value = PipelineCacheCreateFlagBits.USE_APPLICATION_STORAGE.value())
    comptime INTERNALLY_SYNCHRONIZED_MERGE = Self(value = PipelineCacheCreateFlagBits.INTERNALLY_SYNCHRONIZED_MERGE.value())


@register_passable("trivial")
struct PipelineCacheCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCacheCreateFlags:
        return PipelineCacheCreateFlags(value = self._value | other._value)

    comptime EXTERNALLY_SYNCHRONIZED = Self(value = 1 << 0)
    comptime READ_ONLY = Self(value = 1 << 1)
    comptime USE_APPLICATION_STORAGE = Self(value = 1 << 2)
    comptime INTERNALLY_SYNCHRONIZED_MERGE = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineDepthStencilStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineDepthStencilStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineDepthStencilStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineDepthStencilStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineDepthStencilStateCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineDepthStencilStateCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineDepthStencilStateCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineDepthStencilStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineDepthStencilStateCreateFlags:
        return PipelineDepthStencilStateCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineDynamicStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineDynamicStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineDynamicStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineDynamicStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineDynamicStateCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineDynamicStateCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineDynamicStateCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineDynamicStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineDynamicStateCreateFlags:
        return PipelineDynamicStateCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineColorBlendStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineColorBlendStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineColorBlendStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineColorBlendStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineColorBlendStateCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineColorBlendStateCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineColorBlendStateCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineColorBlendStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineColorBlendStateCreateFlags:
        return PipelineColorBlendStateCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineMultisampleStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineMultisampleStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineMultisampleStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineMultisampleStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineMultisampleStateCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineMultisampleStateCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineMultisampleStateCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineMultisampleStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineMultisampleStateCreateFlags:
        return PipelineMultisampleStateCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineRasterizationStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineRasterizationStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineRasterizationStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineRasterizationStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineRasterizationStateCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineRasterizationStateCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineRasterizationStateCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineRasterizationStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineRasterizationStateCreateFlags:
        return PipelineRasterizationStateCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineViewportStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineViewportStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineViewportStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineViewportStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineViewportStateCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineViewportStateCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineViewportStateCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineViewportStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineViewportStateCreateFlags:
        return PipelineViewportStateCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineTessellationStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineTessellationStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineTessellationStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineTessellationStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineTessellationStateCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineTessellationStateCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineTessellationStateCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineTessellationStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineTessellationStateCreateFlags:
        return PipelineTessellationStateCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineInputAssemblyStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineInputAssemblyStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineInputAssemblyStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineInputAssemblyStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineInputAssemblyStateCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineInputAssemblyStateCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineInputAssemblyStateCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineInputAssemblyStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineInputAssemblyStateCreateFlags:
        return PipelineInputAssemblyStateCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineVertexInputStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineVertexInputStateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineVertexInputStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineVertexInputStateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineVertexInputStateCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineVertexInputStateCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineVertexInputStateCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineVertexInputStateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineVertexInputStateCreateFlags:
        return PipelineVertexInputStateCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineShaderStageCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineShaderStageCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineShaderStageCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineShaderStageCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineShaderStageCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineShaderStageCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineShaderStageCreateFlags) -> Bool:
        return self & other == other

    comptime ALLOW_VARYING_SUBGROUP_SIZE = Self(value = PipelineShaderStageCreateFlagBits.ALLOW_VARYING_SUBGROUP_SIZE.value())
    comptime REQUIRE_FULL_SUBGROUPS = Self(value = PipelineShaderStageCreateFlagBits.REQUIRE_FULL_SUBGROUPS.value())
    comptime RESERVED_3 = Self(value = PipelineShaderStageCreateFlagBits.RESERVED_3.value())


@register_passable("trivial")
struct PipelineShaderStageCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineShaderStageCreateFlags:
        return PipelineShaderStageCreateFlags(value = self._value | other._value)

    comptime ALLOW_VARYING_SUBGROUP_SIZE = Self(value = 1 << 0)
    comptime REQUIRE_FULL_SUBGROUPS = Self(value = 1 << 1)
    comptime RESERVED_3 = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DescriptorSetLayoutCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DescriptorSetLayoutCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DescriptorSetLayoutCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DescriptorSetLayoutCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DescriptorSetLayoutCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DescriptorSetLayoutCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: DescriptorSetLayoutCreateFlags) -> Bool:
        return self & other == other

    comptime PUSH_DESCRIPTOR = Self(value = DescriptorSetLayoutCreateFlagBits.PUSH_DESCRIPTOR.value())
    comptime UPDATE_AFTER_BIND_POOL = Self(value = DescriptorSetLayoutCreateFlagBits.UPDATE_AFTER_BIND_POOL.value())
    comptime RESERVED_3 = Self(value = DescriptorSetLayoutCreateFlagBits.RESERVED_3.value())
    comptime DESCRIPTOR_BUFFER = Self(value = DescriptorSetLayoutCreateFlagBits.DESCRIPTOR_BUFFER.value())
    comptime EMBEDDED_IMMUTABLE_SAMPLERS = Self(value = DescriptorSetLayoutCreateFlagBits.EMBEDDED_IMMUTABLE_SAMPLERS.value())
    comptime PER_STAGE = Self(value = DescriptorSetLayoutCreateFlagBits.PER_STAGE.value())
    comptime INDIRECT_BINDABLE = Self(value = DescriptorSetLayoutCreateFlagBits.INDIRECT_BINDABLE.value())


@register_passable("trivial")
struct DescriptorSetLayoutCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DescriptorSetLayoutCreateFlags:
        return DescriptorSetLayoutCreateFlags(value = self._value | other._value)

    comptime PUSH_DESCRIPTOR = Self(value = 1 << 0)
    comptime UPDATE_AFTER_BIND_POOL = Self(value = 1 << 1)
    comptime RESERVED_3 = Self(value = 1 << 3)
    comptime DESCRIPTOR_BUFFER = Self(value = 1 << 4)
    comptime EMBEDDED_IMMUTABLE_SAMPLERS = Self(value = 1 << 5)
    comptime PER_STAGE = Self(value = 1 << 6)
    comptime INDIRECT_BINDABLE = Self(value = 1 << 7)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: BufferViewCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: BufferViewCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: BufferViewCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: BufferViewCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: BufferViewCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: BufferViewCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: BufferViewCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct BufferViewCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> BufferViewCreateFlags:
        return BufferViewCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: InstanceCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: InstanceCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: InstanceCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: InstanceCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: InstanceCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: InstanceCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: InstanceCreateFlags) -> Bool:
        return self & other == other

    comptime ENUMERATE_PORTABILITY = Self(value = InstanceCreateFlagBits.ENUMERATE_PORTABILITY.value())
    comptime RESERVED_616 = Self(value = InstanceCreateFlagBits.RESERVED_616.value())


@register_passable("trivial")
struct InstanceCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> InstanceCreateFlags:
        return InstanceCreateFlags(value = self._value | other._value)

    comptime ENUMERATE_PORTABILITY = Self(value = 1 << 0)
    comptime RESERVED_616 = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DeviceCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DeviceCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DeviceCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DeviceCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DeviceCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DeviceCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: DeviceCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DeviceCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DeviceCreateFlags:
        return DeviceCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DeviceQueueCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DeviceQueueCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DeviceQueueCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DeviceQueueCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DeviceQueueCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DeviceQueueCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: DeviceQueueCreateFlags) -> Bool:
        return self & other == other

    comptime PROTECTED = Self(value = DeviceQueueCreateFlagBits.PROTECTED.value())
    comptime RESERVED_1 = Self(value = DeviceQueueCreateFlagBits.RESERVED_1.value())
    comptime RESERVED_2 = Self(value = DeviceQueueCreateFlagBits.RESERVED_2.value())


@register_passable("trivial")
struct DeviceQueueCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DeviceQueueCreateFlags:
        return DeviceQueueCreateFlags(value = self._value | other._value)

    comptime PROTECTED = Self(value = 1 << 0)
    comptime RESERVED_1 = Self(value = 1 << 1)
    comptime RESERVED_2 = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: QueueFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: QueueFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: QueueFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: QueueFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: QueueFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: QueueFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: QueueFlags) -> Bool:
        return self & other == other

    comptime GRAPHICS = Self(value = QueueFlagBits.GRAPHICS.value())
    comptime COMPUTE = Self(value = QueueFlagBits.COMPUTE.value())
    comptime TRANSFER = Self(value = QueueFlagBits.TRANSFER.value())
    comptime SPARSE_BINDING = Self(value = QueueFlagBits.SPARSE_BINDING.value())
    comptime PROTECTED = Self(value = QueueFlagBits.PROTECTED.value())
    comptime VIDEO_DECODE = Self(value = QueueFlagBits.VIDEO_DECODE.value())
    comptime VIDEO_ENCODE = Self(value = QueueFlagBits.VIDEO_ENCODE.value())
    comptime RESERVED_7 = Self(value = QueueFlagBits.RESERVED_7.value())
    comptime OPTICAL_FLOW = Self(value = QueueFlagBits.OPTICAL_FLOW.value())
    comptime DATA_GRAPH = Self(value = QueueFlagBits.DATA_GRAPH.value())
    comptime RESERVED_11 = Self(value = QueueFlagBits.RESERVED_11.value())
    comptime RESERVED_12 = Self(value = QueueFlagBits.RESERVED_12.value())
    comptime RESERVED_13 = Self(value = QueueFlagBits.RESERVED_13.value())


@register_passable("trivial")
struct QueueFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> QueueFlags:
        return QueueFlags(value = self._value | other._value)

    comptime GRAPHICS = Self(value = 1 << 0)
    comptime COMPUTE = Self(value = 1 << 1)
    comptime TRANSFER = Self(value = 1 << 2)
    comptime SPARSE_BINDING = Self(value = 1 << 3)
    comptime PROTECTED = Self(value = 1 << 4)
    comptime VIDEO_DECODE = Self(value = 1 << 5)
    comptime VIDEO_ENCODE = Self(value = 1 << 6)
    comptime RESERVED_7 = Self(value = 1 << 7)
    comptime OPTICAL_FLOW = Self(value = 1 << 8)
    comptime DATA_GRAPH = Self(value = 1 << 10)
    comptime RESERVED_11 = Self(value = 1 << 11)
    comptime RESERVED_12 = Self(value = 1 << 12)
    comptime RESERVED_13 = Self(value = 1 << 13)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: MemoryPropertyFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: MemoryPropertyFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: MemoryPropertyFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: MemoryPropertyFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: MemoryPropertyFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: MemoryPropertyFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: MemoryPropertyFlags) -> Bool:
        return self & other == other

    comptime DEVICE_LOCAL = Self(value = MemoryPropertyFlagBits.DEVICE_LOCAL.value())
    comptime HOST_VISIBLE = Self(value = MemoryPropertyFlagBits.HOST_VISIBLE.value())
    comptime HOST_COHERENT = Self(value = MemoryPropertyFlagBits.HOST_COHERENT.value())
    comptime HOST_CACHED = Self(value = MemoryPropertyFlagBits.HOST_CACHED.value())
    comptime LAZILY_ALLOCATED = Self(value = MemoryPropertyFlagBits.LAZILY_ALLOCATED.value())
    comptime PROTECTED = Self(value = MemoryPropertyFlagBits.PROTECTED.value())
    comptime DEVICE_COHERENT = Self(value = MemoryPropertyFlagBits.DEVICE_COHERENT.value())
    comptime DEVICE_UNCACHED = Self(value = MemoryPropertyFlagBits.DEVICE_UNCACHED.value())
    comptime RDMA_CAPABLE = Self(value = MemoryPropertyFlagBits.RDMA_CAPABLE.value())


@register_passable("trivial")
struct MemoryPropertyFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MemoryPropertyFlags:
        return MemoryPropertyFlags(value = self._value | other._value)

    comptime DEVICE_LOCAL = Self(value = 1 << 0)
    comptime HOST_VISIBLE = Self(value = 1 << 1)
    comptime HOST_COHERENT = Self(value = 1 << 2)
    comptime HOST_CACHED = Self(value = 1 << 3)
    comptime LAZILY_ALLOCATED = Self(value = 1 << 4)
    comptime PROTECTED = Self(value = 1 << 5)
    comptime DEVICE_COHERENT = Self(value = 1 << 6)
    comptime DEVICE_UNCACHED = Self(value = 1 << 7)
    comptime RDMA_CAPABLE = Self(value = 1 << 8)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: MemoryHeapFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: MemoryHeapFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: MemoryHeapFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: MemoryHeapFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: MemoryHeapFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: MemoryHeapFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: MemoryHeapFlags) -> Bool:
        return self & other == other

    comptime DEVICE_LOCAL = Self(value = MemoryHeapFlagBits.DEVICE_LOCAL.value())
    comptime MULTI_INSTANCE = Self(value = MemoryHeapFlagBits.MULTI_INSTANCE.value())
    comptime SEU_SAFE = Self(value = MemoryHeapFlagBits.SEU_SAFE.value())
    comptime TILE_MEMORY = Self(value = MemoryHeapFlagBits.TILE_MEMORY.value())


@register_passable("trivial")
struct MemoryHeapFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MemoryHeapFlags:
        return MemoryHeapFlags(value = self._value | other._value)

    comptime DEVICE_LOCAL = Self(value = 1 << 0)
    comptime MULTI_INSTANCE = Self(value = 1 << 1)
    comptime SEU_SAFE = Self(value = 1 << 2)
    comptime TILE_MEMORY = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: AccessFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: AccessFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: AccessFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: AccessFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: AccessFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: AccessFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: AccessFlags) -> Bool:
        return self & other == other

    comptime NONE = Self(value = AccessFlagBits.NONE.value())
    comptime INDIRECT_COMMAND_READ = Self(value = AccessFlagBits.INDIRECT_COMMAND_READ.value())
    comptime INDEX_READ = Self(value = AccessFlagBits.INDEX_READ.value())
    comptime VERTEX_ATTRIBUTE_READ = Self(value = AccessFlagBits.VERTEX_ATTRIBUTE_READ.value())
    comptime UNIFORM_READ = Self(value = AccessFlagBits.UNIFORM_READ.value())
    comptime INPUT_ATTACHMENT_READ = Self(value = AccessFlagBits.INPUT_ATTACHMENT_READ.value())
    comptime SHADER_READ = Self(value = AccessFlagBits.SHADER_READ.value())
    comptime SHADER_WRITE = Self(value = AccessFlagBits.SHADER_WRITE.value())
    comptime COLOR_ATTACHMENT_READ = Self(value = AccessFlagBits.COLOR_ATTACHMENT_READ.value())
    comptime COLOR_ATTACHMENT_WRITE = Self(value = AccessFlagBits.COLOR_ATTACHMENT_WRITE.value())
    comptime DEPTH_STENCIL_ATTACHMENT_READ = Self(value = AccessFlagBits.DEPTH_STENCIL_ATTACHMENT_READ.value())
    comptime DEPTH_STENCIL_ATTACHMENT_WRITE = Self(value = AccessFlagBits.DEPTH_STENCIL_ATTACHMENT_WRITE.value())
    comptime TRANSFER_READ = Self(value = AccessFlagBits.TRANSFER_READ.value())
    comptime TRANSFER_WRITE = Self(value = AccessFlagBits.TRANSFER_WRITE.value())
    comptime HOST_READ = Self(value = AccessFlagBits.HOST_READ.value())
    comptime HOST_WRITE = Self(value = AccessFlagBits.HOST_WRITE.value())
    comptime MEMORY_READ = Self(value = AccessFlagBits.MEMORY_READ.value())
    comptime MEMORY_WRITE = Self(value = AccessFlagBits.MEMORY_WRITE.value())
    comptime COLOR_ATTACHMENT_READ_NONCOHERENT = Self(value = AccessFlagBits.COLOR_ATTACHMENT_READ_NONCOHERENT.value())
    comptime CONDITIONAL_RENDERING_READ = Self(value = AccessFlagBits.CONDITIONAL_RENDERING_READ.value())
    comptime ACCELERATION_STRUCTURE_READ = Self(value = AccessFlagBits.ACCELERATION_STRUCTURE_READ.value())
    comptime ACCELERATION_STRUCTURE_WRITE = Self(value = AccessFlagBits.ACCELERATION_STRUCTURE_WRITE.value())
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT_READ = Self(value = AccessFlagBits.FRAGMENT_SHADING_RATE_ATTACHMENT_READ.value())
    comptime FRAGMENT_DENSITY_MAP_READ = Self(value = AccessFlagBits.FRAGMENT_DENSITY_MAP_READ.value())
    comptime TRANSFORM_FEEDBACK_WRITE = Self(value = AccessFlagBits.TRANSFORM_FEEDBACK_WRITE.value())
    comptime TRANSFORM_FEEDBACK_COUNTER_READ = Self(value = AccessFlagBits.TRANSFORM_FEEDBACK_COUNTER_READ.value())
    comptime TRANSFORM_FEEDBACK_COUNTER_WRITE = Self(value = AccessFlagBits.TRANSFORM_FEEDBACK_COUNTER_WRITE.value())


@register_passable("trivial")
struct AccessFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AccessFlags:
        return AccessFlags(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime INDIRECT_COMMAND_READ = Self(value = 1 << 0)
    comptime INDEX_READ = Self(value = 1 << 1)
    comptime VERTEX_ATTRIBUTE_READ = Self(value = 1 << 2)
    comptime UNIFORM_READ = Self(value = 1 << 3)
    comptime INPUT_ATTACHMENT_READ = Self(value = 1 << 4)
    comptime SHADER_READ = Self(value = 1 << 5)
    comptime SHADER_WRITE = Self(value = 1 << 6)
    comptime COLOR_ATTACHMENT_READ = Self(value = 1 << 7)
    comptime COLOR_ATTACHMENT_WRITE = Self(value = 1 << 8)
    comptime DEPTH_STENCIL_ATTACHMENT_READ = Self(value = 1 << 9)
    comptime DEPTH_STENCIL_ATTACHMENT_WRITE = Self(value = 1 << 10)
    comptime TRANSFER_READ = Self(value = 1 << 11)
    comptime TRANSFER_WRITE = Self(value = 1 << 12)
    comptime HOST_READ = Self(value = 1 << 13)
    comptime HOST_WRITE = Self(value = 1 << 14)
    comptime MEMORY_READ = Self(value = 1 << 15)
    comptime MEMORY_WRITE = Self(value = 1 << 16)
    comptime COLOR_ATTACHMENT_READ_NONCOHERENT = Self(value = 1 << 19)
    comptime CONDITIONAL_RENDERING_READ = Self(value = 1 << 20)
    comptime ACCELERATION_STRUCTURE_READ = Self(value = 1 << 21)
    comptime ACCELERATION_STRUCTURE_WRITE = Self(value = 1 << 22)
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT_READ = Self(value = 1 << 23)
    comptime FRAGMENT_DENSITY_MAP_READ = Self(value = 1 << 24)
    comptime TRANSFORM_FEEDBACK_WRITE = Self(value = 1 << 25)
    comptime TRANSFORM_FEEDBACK_COUNTER_READ = Self(value = 1 << 26)
    comptime TRANSFORM_FEEDBACK_COUNTER_WRITE = Self(value = 1 << 27)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: BufferUsageFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: BufferUsageFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: BufferUsageFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: BufferUsageFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: BufferUsageFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: BufferUsageFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: BufferUsageFlags) -> Bool:
        return self & other == other

    comptime TRANSFER_SRC = Self(value = BufferUsageFlagBits.TRANSFER_SRC.value())
    comptime TRANSFER_DST = Self(value = BufferUsageFlagBits.TRANSFER_DST.value())
    comptime UNIFORM_TEXEL_BUFFER = Self(value = BufferUsageFlagBits.UNIFORM_TEXEL_BUFFER.value())
    comptime STORAGE_TEXEL_BUFFER = Self(value = BufferUsageFlagBits.STORAGE_TEXEL_BUFFER.value())
    comptime UNIFORM_BUFFER = Self(value = BufferUsageFlagBits.UNIFORM_BUFFER.value())
    comptime STORAGE_BUFFER = Self(value = BufferUsageFlagBits.STORAGE_BUFFER.value())
    comptime INDEX_BUFFER = Self(value = BufferUsageFlagBits.INDEX_BUFFER.value())
    comptime VERTEX_BUFFER = Self(value = BufferUsageFlagBits.VERTEX_BUFFER.value())
    comptime INDIRECT_BUFFER = Self(value = BufferUsageFlagBits.INDIRECT_BUFFER.value())
    comptime CONDITIONAL_RENDERING = Self(value = BufferUsageFlagBits.CONDITIONAL_RENDERING.value())
    comptime SHADER_BINDING_TABLE = Self(value = BufferUsageFlagBits.SHADER_BINDING_TABLE.value())
    comptime TRANSFORM_FEEDBACK_BUFFER = Self(value = BufferUsageFlagBits.TRANSFORM_FEEDBACK_BUFFER.value())
    comptime TRANSFORM_FEEDBACK_COUNTER_BUFFER = Self(value = BufferUsageFlagBits.TRANSFORM_FEEDBACK_COUNTER_BUFFER.value())
    comptime VIDEO_DECODE_SRC = Self(value = BufferUsageFlagBits.VIDEO_DECODE_SRC.value())
    comptime VIDEO_DECODE_DST = Self(value = BufferUsageFlagBits.VIDEO_DECODE_DST.value())
    comptime VIDEO_ENCODE_DST = Self(value = BufferUsageFlagBits.VIDEO_ENCODE_DST.value())
    comptime VIDEO_ENCODE_SRC = Self(value = BufferUsageFlagBits.VIDEO_ENCODE_SRC.value())
    comptime SHADER_DEVICE_ADDRESS = Self(value = BufferUsageFlagBits.SHADER_DEVICE_ADDRESS.value())
    comptime ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY = Self(value = BufferUsageFlagBits.ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY.value())
    comptime ACCELERATION_STRUCTURE_STORAGE = Self(value = BufferUsageFlagBits.ACCELERATION_STRUCTURE_STORAGE.value())
    comptime SAMPLER_DESCRIPTOR_BUFFER = Self(value = BufferUsageFlagBits.SAMPLER_DESCRIPTOR_BUFFER.value())
    comptime RESOURCE_DESCRIPTOR_BUFFER = Self(value = BufferUsageFlagBits.RESOURCE_DESCRIPTOR_BUFFER.value())
    comptime MICROMAP_BUILD_INPUT_READ_ONLY = Self(value = BufferUsageFlagBits.MICROMAP_BUILD_INPUT_READ_ONLY.value())
    comptime MICROMAP_STORAGE = Self(value = BufferUsageFlagBits.MICROMAP_STORAGE.value())
    comptime EXECUTION_GRAPH_SCRATCH = Self(value = BufferUsageFlagBits.EXECUTION_GRAPH_SCRATCH.value())
    comptime PUSH_DESCRIPTORS_DESCRIPTOR_BUFFER = Self(value = BufferUsageFlagBits.PUSH_DESCRIPTORS_DESCRIPTOR_BUFFER.value())
    comptime TILE_MEMORY = Self(value = BufferUsageFlagBits.TILE_MEMORY.value())
    comptime RESERVED_28 = Self(value = BufferUsageFlagBits.RESERVED_28.value())


@register_passable("trivial")
struct BufferUsageFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> BufferUsageFlags:
        return BufferUsageFlags(value = self._value | other._value)

    comptime TRANSFER_SRC = Self(value = 1 << 0)
    comptime TRANSFER_DST = Self(value = 1 << 1)
    comptime UNIFORM_TEXEL_BUFFER = Self(value = 1 << 2)
    comptime STORAGE_TEXEL_BUFFER = Self(value = 1 << 3)
    comptime UNIFORM_BUFFER = Self(value = 1 << 4)
    comptime STORAGE_BUFFER = Self(value = 1 << 5)
    comptime INDEX_BUFFER = Self(value = 1 << 6)
    comptime VERTEX_BUFFER = Self(value = 1 << 7)
    comptime INDIRECT_BUFFER = Self(value = 1 << 8)
    comptime CONDITIONAL_RENDERING = Self(value = 1 << 9)
    comptime SHADER_BINDING_TABLE = Self(value = 1 << 10)
    comptime TRANSFORM_FEEDBACK_BUFFER = Self(value = 1 << 11)
    comptime TRANSFORM_FEEDBACK_COUNTER_BUFFER = Self(value = 1 << 12)
    comptime VIDEO_DECODE_SRC = Self(value = 1 << 13)
    comptime VIDEO_DECODE_DST = Self(value = 1 << 14)
    comptime VIDEO_ENCODE_DST = Self(value = 1 << 15)
    comptime VIDEO_ENCODE_SRC = Self(value = 1 << 16)
    comptime SHADER_DEVICE_ADDRESS = Self(value = 1 << 17)
    comptime ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY = Self(value = 1 << 19)
    comptime ACCELERATION_STRUCTURE_STORAGE = Self(value = 1 << 20)
    comptime SAMPLER_DESCRIPTOR_BUFFER = Self(value = 1 << 21)
    comptime RESOURCE_DESCRIPTOR_BUFFER = Self(value = 1 << 22)
    comptime MICROMAP_BUILD_INPUT_READ_ONLY = Self(value = 1 << 23)
    comptime MICROMAP_STORAGE = Self(value = 1 << 24)
    comptime EXECUTION_GRAPH_SCRATCH = Self(value = 1 << 25)
    comptime PUSH_DESCRIPTORS_DESCRIPTOR_BUFFER = Self(value = 1 << 26)
    comptime TILE_MEMORY = Self(value = 1 << 27)
    comptime RESERVED_28 = Self(value = 1 << 28)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: BufferCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: BufferCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: BufferCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: BufferCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: BufferCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: BufferCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: BufferCreateFlags) -> Bool:
        return self & other == other

    comptime SPARSE_BINDING = Self(value = BufferCreateFlagBits.SPARSE_BINDING.value())
    comptime SPARSE_RESIDENCY = Self(value = BufferCreateFlagBits.SPARSE_RESIDENCY.value())
    comptime SPARSE_ALIASED = Self(value = BufferCreateFlagBits.SPARSE_ALIASED.value())
    comptime PROTECTED = Self(value = BufferCreateFlagBits.PROTECTED.value())
    comptime DEVICE_ADDRESS_CAPTURE_REPLAY = Self(value = BufferCreateFlagBits.DEVICE_ADDRESS_CAPTURE_REPLAY.value())
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = BufferCreateFlagBits.DESCRIPTOR_BUFFER_CAPTURE_REPLAY.value())
    comptime VIDEO_PROFILE_INDEPENDENT = Self(value = BufferCreateFlagBits.VIDEO_PROFILE_INDEPENDENT.value())
    comptime RESERVED_7 = Self(value = BufferCreateFlagBits.RESERVED_7.value())


@register_passable("trivial")
struct BufferCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> BufferCreateFlags:
        return BufferCreateFlags(value = self._value | other._value)

    comptime SPARSE_BINDING = Self(value = 1 << 0)
    comptime SPARSE_RESIDENCY = Self(value = 1 << 1)
    comptime SPARSE_ALIASED = Self(value = 1 << 2)
    comptime PROTECTED = Self(value = 1 << 3)
    comptime DEVICE_ADDRESS_CAPTURE_REPLAY = Self(value = 1 << 4)
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = 1 << 5)
    comptime VIDEO_PROFILE_INDEPENDENT = Self(value = 1 << 6)
    comptime RESERVED_7 = Self(value = 1 << 7)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ShaderStageFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ShaderStageFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ShaderStageFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ShaderStageFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ShaderStageFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ShaderStageFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ShaderStageFlags) -> Bool:
        return self & other == other

    comptime ALL_GRAPHICS = Self(value = ShaderStageFlagBits.ALL_GRAPHICS.value())
    comptime ALL = Self(value = ShaderStageFlagBits.ALL.value())
    comptime VERTEX = Self(value = ShaderStageFlagBits.VERTEX.value())
    comptime TESSELLATION_CONTROL = Self(value = ShaderStageFlagBits.TESSELLATION_CONTROL.value())
    comptime TESSELLATION_EVALUATION = Self(value = ShaderStageFlagBits.TESSELLATION_EVALUATION.value())
    comptime GEOMETRY = Self(value = ShaderStageFlagBits.GEOMETRY.value())
    comptime FRAGMENT = Self(value = ShaderStageFlagBits.FRAGMENT.value())
    comptime COMPUTE = Self(value = ShaderStageFlagBits.COMPUTE.value())
    comptime RAYGEN = Self(value = ShaderStageFlagBits.RAYGEN.value())
    comptime ANY_HIT = Self(value = ShaderStageFlagBits.ANY_HIT.value())
    comptime CLOSEST_HIT = Self(value = ShaderStageFlagBits.CLOSEST_HIT.value())
    comptime MISS = Self(value = ShaderStageFlagBits.MISS.value())
    comptime INTERSECTION = Self(value = ShaderStageFlagBits.INTERSECTION.value())
    comptime CALLABLE = Self(value = ShaderStageFlagBits.CALLABLE.value())
    comptime SUBPASS_SHADING = Self(value = ShaderStageFlagBits.SUBPASS_SHADING.value())
    comptime RESERVED_15 = Self(value = ShaderStageFlagBits.RESERVED_15.value())
    comptime CLUSTER_CULLING = Self(value = ShaderStageFlagBits.CLUSTER_CULLING.value())


@register_passable("trivial")
struct ShaderStageFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ShaderStageFlags:
        return ShaderStageFlags(value = self._value | other._value)

    comptime ALL_GRAPHICS = Self(value = 31)
    comptime ALL = Self(value = 2147483647)
    comptime VERTEX = Self(value = 1 << 0)
    comptime TESSELLATION_CONTROL = Self(value = 1 << 1)
    comptime TESSELLATION_EVALUATION = Self(value = 1 << 2)
    comptime GEOMETRY = Self(value = 1 << 3)
    comptime FRAGMENT = Self(value = 1 << 4)
    comptime COMPUTE = Self(value = 1 << 5)
    comptime RAYGEN = Self(value = 1 << 8)
    comptime ANY_HIT = Self(value = 1 << 9)
    comptime CLOSEST_HIT = Self(value = 1 << 10)
    comptime MISS = Self(value = 1 << 11)
    comptime INTERSECTION = Self(value = 1 << 12)
    comptime CALLABLE = Self(value = 1 << 13)
    comptime SUBPASS_SHADING = Self(value = 1 << 14)
    comptime RESERVED_15 = Self(value = 1 << 15)
    comptime CLUSTER_CULLING = Self(value = 1 << 19)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ImageUsageFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ImageUsageFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ImageUsageFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ImageUsageFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ImageUsageFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ImageUsageFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ImageUsageFlags) -> Bool:
        return self & other == other

    comptime TRANSFER_SRC = Self(value = ImageUsageFlagBits.TRANSFER_SRC.value())
    comptime TRANSFER_DST = Self(value = ImageUsageFlagBits.TRANSFER_DST.value())
    comptime SAMPLED = Self(value = ImageUsageFlagBits.SAMPLED.value())
    comptime STORAGE = Self(value = ImageUsageFlagBits.STORAGE.value())
    comptime COLOR_ATTACHMENT = Self(value = ImageUsageFlagBits.COLOR_ATTACHMENT.value())
    comptime DEPTH_STENCIL_ATTACHMENT = Self(value = ImageUsageFlagBits.DEPTH_STENCIL_ATTACHMENT.value())
    comptime TRANSIENT_ATTACHMENT = Self(value = ImageUsageFlagBits.TRANSIENT_ATTACHMENT.value())
    comptime INPUT_ATTACHMENT = Self(value = ImageUsageFlagBits.INPUT_ATTACHMENT.value())
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = ImageUsageFlagBits.FRAGMENT_SHADING_RATE_ATTACHMENT.value())
    comptime FRAGMENT_DENSITY_MAP = Self(value = ImageUsageFlagBits.FRAGMENT_DENSITY_MAP.value())
    comptime VIDEO_DECODE_DST = Self(value = ImageUsageFlagBits.VIDEO_DECODE_DST.value())
    comptime VIDEO_DECODE_SRC = Self(value = ImageUsageFlagBits.VIDEO_DECODE_SRC.value())
    comptime VIDEO_DECODE_DPB = Self(value = ImageUsageFlagBits.VIDEO_DECODE_DPB.value())
    comptime VIDEO_ENCODE_DST = Self(value = ImageUsageFlagBits.VIDEO_ENCODE_DST.value())
    comptime VIDEO_ENCODE_SRC = Self(value = ImageUsageFlagBits.VIDEO_ENCODE_SRC.value())
    comptime VIDEO_ENCODE_DPB = Self(value = ImageUsageFlagBits.VIDEO_ENCODE_DPB.value())
    comptime INVOCATION_MASK = Self(value = ImageUsageFlagBits.INVOCATION_MASK.value())
    comptime ATTACHMENT_FEEDBACK_LOOP = Self(value = ImageUsageFlagBits.ATTACHMENT_FEEDBACK_LOOP.value())
    comptime SAMPLE_WEIGHT = Self(value = ImageUsageFlagBits.SAMPLE_WEIGHT.value())
    comptime SAMPLE_BLOCK_MATCH = Self(value = ImageUsageFlagBits.SAMPLE_BLOCK_MATCH.value())
    comptime HOST_TRANSFER = Self(value = ImageUsageFlagBits.HOST_TRANSFER.value())
    comptime TENSOR_ALIASING = Self(value = ImageUsageFlagBits.TENSOR_ALIASING.value())
    comptime RESERVED_24_BIT_COREAVI = Self(value = ImageUsageFlagBits.RESERVED_24_BIT_COREAVI.value())
    comptime VIDEO_ENCODE_QUANTIZATION_DELTA_MAP = Self(value = ImageUsageFlagBits.VIDEO_ENCODE_QUANTIZATION_DELTA_MAP.value())
    comptime VIDEO_ENCODE_EMPHASIS_MAP = Self(value = ImageUsageFlagBits.VIDEO_ENCODE_EMPHASIS_MAP.value())
    comptime TILE_MEMORY = Self(value = ImageUsageFlagBits.TILE_MEMORY.value())
    comptime RESERVED_28 = Self(value = ImageUsageFlagBits.RESERVED_28.value())
    comptime RESERVED_29 = Self(value = ImageUsageFlagBits.RESERVED_29.value())
    comptime RESERVED_30 = Self(value = ImageUsageFlagBits.RESERVED_30.value())


@register_passable("trivial")
struct ImageUsageFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImageUsageFlags:
        return ImageUsageFlags(value = self._value | other._value)

    comptime TRANSFER_SRC = Self(value = 1 << 0)
    comptime TRANSFER_DST = Self(value = 1 << 1)
    comptime SAMPLED = Self(value = 1 << 2)
    comptime STORAGE = Self(value = 1 << 3)
    comptime COLOR_ATTACHMENT = Self(value = 1 << 4)
    comptime DEPTH_STENCIL_ATTACHMENT = Self(value = 1 << 5)
    comptime TRANSIENT_ATTACHMENT = Self(value = 1 << 6)
    comptime INPUT_ATTACHMENT = Self(value = 1 << 7)
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = 1 << 8)
    comptime FRAGMENT_DENSITY_MAP = Self(value = 1 << 9)
    comptime VIDEO_DECODE_DST = Self(value = 1 << 10)
    comptime VIDEO_DECODE_SRC = Self(value = 1 << 11)
    comptime VIDEO_DECODE_DPB = Self(value = 1 << 12)
    comptime VIDEO_ENCODE_DST = Self(value = 1 << 13)
    comptime VIDEO_ENCODE_SRC = Self(value = 1 << 14)
    comptime VIDEO_ENCODE_DPB = Self(value = 1 << 15)
    comptime INVOCATION_MASK = Self(value = 1 << 18)
    comptime ATTACHMENT_FEEDBACK_LOOP = Self(value = 1 << 19)
    comptime SAMPLE_WEIGHT = Self(value = 1 << 20)
    comptime SAMPLE_BLOCK_MATCH = Self(value = 1 << 21)
    comptime HOST_TRANSFER = Self(value = 1 << 22)
    comptime TENSOR_ALIASING = Self(value = 1 << 23)
    comptime RESERVED_24_BIT_COREAVI = Self(value = 1 << 24)
    comptime VIDEO_ENCODE_QUANTIZATION_DELTA_MAP = Self(value = 1 << 25)
    comptime VIDEO_ENCODE_EMPHASIS_MAP = Self(value = 1 << 26)
    comptime TILE_MEMORY = Self(value = 1 << 27)
    comptime RESERVED_28 = Self(value = 1 << 28)
    comptime RESERVED_29 = Self(value = 1 << 29)
    comptime RESERVED_30 = Self(value = 1 << 30)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ImageCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ImageCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ImageCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ImageCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ImageCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ImageCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ImageCreateFlags) -> Bool:
        return self & other == other

    comptime SPARSE_BINDING = Self(value = ImageCreateFlagBits.SPARSE_BINDING.value())
    comptime SPARSE_RESIDENCY = Self(value = ImageCreateFlagBits.SPARSE_RESIDENCY.value())
    comptime SPARSE_ALIASED = Self(value = ImageCreateFlagBits.SPARSE_ALIASED.value())
    comptime MUTABLE_FORMAT = Self(value = ImageCreateFlagBits.MUTABLE_FORMAT.value())
    comptime CUBE_COMPATIBLE = Self(value = ImageCreateFlagBits.CUBE_COMPATIBLE.value())
    comptime N_2D_ARRAY_COMPATIBLE = Self(value = ImageCreateFlagBits.N_2D_ARRAY_COMPATIBLE.value())
    comptime SPLIT_INSTANCE_BIND_REGIONS = Self(value = ImageCreateFlagBits.SPLIT_INSTANCE_BIND_REGIONS.value())
    comptime BLOCK_TEXEL_VIEW_COMPATIBLE = Self(value = ImageCreateFlagBits.BLOCK_TEXEL_VIEW_COMPATIBLE.value())
    comptime EXTENDED_USAGE = Self(value = ImageCreateFlagBits.EXTENDED_USAGE.value())
    comptime DISJOINT = Self(value = ImageCreateFlagBits.DISJOINT.value())
    comptime ALIAS = Self(value = ImageCreateFlagBits.ALIAS.value())
    comptime PROTECTED = Self(value = ImageCreateFlagBits.PROTECTED.value())
    comptime SAMPLE_LOCATIONS_COMPATIBLE_DEPTH = Self(value = ImageCreateFlagBits.SAMPLE_LOCATIONS_COMPATIBLE_DEPTH.value())
    comptime CORNER_SAMPLED = Self(value = ImageCreateFlagBits.CORNER_SAMPLED.value())
    comptime SUBSAMPLED = Self(value = ImageCreateFlagBits.SUBSAMPLED.value())
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = ImageCreateFlagBits.DESCRIPTOR_BUFFER_CAPTURE_REPLAY.value())
    comptime N_2D_VIEW_COMPATIBLE = Self(value = ImageCreateFlagBits.N_2D_VIEW_COMPATIBLE.value())
    comptime MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED = Self(value = ImageCreateFlagBits.MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED.value())
    comptime VIDEO_PROFILE_INDEPENDENT = Self(value = ImageCreateFlagBits.VIDEO_PROFILE_INDEPENDENT.value())
    comptime RESERVED_21 = Self(value = ImageCreateFlagBits.RESERVED_21.value())
    comptime RESERVED_22 = Self(value = ImageCreateFlagBits.RESERVED_22.value())


@register_passable("trivial")
struct ImageCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImageCreateFlags:
        return ImageCreateFlags(value = self._value | other._value)

    comptime SPARSE_BINDING = Self(value = 1 << 0)
    comptime SPARSE_RESIDENCY = Self(value = 1 << 1)
    comptime SPARSE_ALIASED = Self(value = 1 << 2)
    comptime MUTABLE_FORMAT = Self(value = 1 << 3)
    comptime CUBE_COMPATIBLE = Self(value = 1 << 4)
    comptime N_2D_ARRAY_COMPATIBLE = Self(value = 1 << 5)
    comptime SPLIT_INSTANCE_BIND_REGIONS = Self(value = 1 << 6)
    comptime BLOCK_TEXEL_VIEW_COMPATIBLE = Self(value = 1 << 7)
    comptime EXTENDED_USAGE = Self(value = 1 << 8)
    comptime DISJOINT = Self(value = 1 << 9)
    comptime ALIAS = Self(value = 1 << 10)
    comptime PROTECTED = Self(value = 1 << 11)
    comptime SAMPLE_LOCATIONS_COMPATIBLE_DEPTH = Self(value = 1 << 12)
    comptime CORNER_SAMPLED = Self(value = 1 << 13)
    comptime SUBSAMPLED = Self(value = 1 << 14)
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = 1 << 16)
    comptime N_2D_VIEW_COMPATIBLE = Self(value = 1 << 17)
    comptime MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED = Self(value = 1 << 18)
    comptime VIDEO_PROFILE_INDEPENDENT = Self(value = 1 << 20)
    comptime RESERVED_21 = Self(value = 1 << 21)
    comptime RESERVED_22 = Self(value = 1 << 22)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ImageViewCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ImageViewCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ImageViewCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ImageViewCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ImageViewCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ImageViewCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ImageViewCreateFlags) -> Bool:
        return self & other == other

    comptime FRAGMENT_DENSITY_MAP_DYNAMIC = Self(value = ImageViewCreateFlagBits.FRAGMENT_DENSITY_MAP_DYNAMIC.value())
    comptime FRAGMENT_DENSITY_MAP_DEFERRED = Self(value = ImageViewCreateFlagBits.FRAGMENT_DENSITY_MAP_DEFERRED.value())
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = ImageViewCreateFlagBits.DESCRIPTOR_BUFFER_CAPTURE_REPLAY.value())


@register_passable("trivial")
struct ImageViewCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImageViewCreateFlags:
        return ImageViewCreateFlags(value = self._value | other._value)

    comptime FRAGMENT_DENSITY_MAP_DYNAMIC = Self(value = 1 << 0)
    comptime FRAGMENT_DENSITY_MAP_DEFERRED = Self(value = 1 << 1)
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineCreateFlags) -> Bool:
        return self & other == other

    comptime DISABLE_OPTIMIZATION = Self(value = PipelineCreateFlagBits.DISABLE_OPTIMIZATION.value())
    comptime ALLOW_DERIVATIVES = Self(value = PipelineCreateFlagBits.ALLOW_DERIVATIVES.value())
    comptime DERIVATIVE = Self(value = PipelineCreateFlagBits.DERIVATIVE.value())
    comptime VIEW_INDEX_FROM_DEVICE_INDEX = Self(value = PipelineCreateFlagBits.VIEW_INDEX_FROM_DEVICE_INDEX.value())
    comptime DISPATCH_BASE = Self(value = PipelineCreateFlagBits.DISPATCH_BASE.value())
    comptime DEFER_COMPILE = Self(value = PipelineCreateFlagBits.DEFER_COMPILE.value())
    comptime CAPTURE_STATISTICS = Self(value = PipelineCreateFlagBits.CAPTURE_STATISTICS.value())
    comptime CAPTURE_INTERNAL_REPRESENTATIONS = Self(value = PipelineCreateFlagBits.CAPTURE_INTERNAL_REPRESENTATIONS.value())
    comptime FAIL_ON_PIPELINE_COMPILE_REQUIRED = Self(value = PipelineCreateFlagBits.FAIL_ON_PIPELINE_COMPILE_REQUIRED.value())
    comptime EARLY_RETURN_ON_FAILURE = Self(value = PipelineCreateFlagBits.EARLY_RETURN_ON_FAILURE.value())
    comptime LINK_TIME_OPTIMIZATION = Self(value = PipelineCreateFlagBits.LINK_TIME_OPTIMIZATION.value())
    comptime LIBRARY = Self(value = PipelineCreateFlagBits.LIBRARY.value())
    comptime RAY_TRACING_SKIP_TRIANGLES = Self(value = PipelineCreateFlagBits.RAY_TRACING_SKIP_TRIANGLES.value())
    comptime RAY_TRACING_SKIP_AABBS = Self(value = PipelineCreateFlagBits.RAY_TRACING_SKIP_AABBS.value())
    comptime RAY_TRACING_NO_NULL_ANY_HIT_SHADERS = Self(value = PipelineCreateFlagBits.RAY_TRACING_NO_NULL_ANY_HIT_SHADERS.value())
    comptime RAY_TRACING_NO_NULL_CLOSEST_HIT_SHADERS = Self(value = PipelineCreateFlagBits.RAY_TRACING_NO_NULL_CLOSEST_HIT_SHADERS.value())
    comptime RAY_TRACING_NO_NULL_MISS_SHADERS = Self(value = PipelineCreateFlagBits.RAY_TRACING_NO_NULL_MISS_SHADERS.value())
    comptime RAY_TRACING_NO_NULL_INTERSECTION_SHADERS = Self(value = PipelineCreateFlagBits.RAY_TRACING_NO_NULL_INTERSECTION_SHADERS.value())
    comptime INDIRECT_BINDABLE = Self(value = PipelineCreateFlagBits.INDIRECT_BINDABLE.value())
    comptime RAY_TRACING_SHADER_GROUP_HANDLE_CAPTURE_REPLAY = Self(value = PipelineCreateFlagBits.RAY_TRACING_SHADER_GROUP_HANDLE_CAPTURE_REPLAY.value())
    comptime RAY_TRACING_ALLOW_MOTION = Self(value = PipelineCreateFlagBits.RAY_TRACING_ALLOW_MOTION.value())
    comptime RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = PipelineCreateFlagBits.RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT.value())
    comptime RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT = Self(value = PipelineCreateFlagBits.RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT.value())
    comptime RETAIN_LINK_TIME_OPTIMIZATION_INFO = Self(value = PipelineCreateFlagBits.RETAIN_LINK_TIME_OPTIMIZATION_INFO.value())
    comptime RAY_TRACING_OPACITY_MICROMAP = Self(value = PipelineCreateFlagBits.RAY_TRACING_OPACITY_MICROMAP.value())
    comptime COLOR_ATTACHMENT_FEEDBACK_LOOP = Self(value = PipelineCreateFlagBits.COLOR_ATTACHMENT_FEEDBACK_LOOP.value())
    comptime DEPTH_STENCIL_ATTACHMENT_FEEDBACK_LOOP = Self(value = PipelineCreateFlagBits.DEPTH_STENCIL_ATTACHMENT_FEEDBACK_LOOP.value())
    comptime NO_PROTECTED_ACCESS = Self(value = PipelineCreateFlagBits.NO_PROTECTED_ACCESS.value())
    comptime RAY_TRACING_DISPLACEMENT_MICROMAP = Self(value = PipelineCreateFlagBits.RAY_TRACING_DISPLACEMENT_MICROMAP.value())
    comptime DESCRIPTOR_BUFFER = Self(value = PipelineCreateFlagBits.DESCRIPTOR_BUFFER.value())
    comptime PROTECTED_ACCESS_ONLY = Self(value = PipelineCreateFlagBits.PROTECTED_ACCESS_ONLY.value())


@register_passable("trivial")
struct PipelineCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCreateFlags:
        return PipelineCreateFlags(value = self._value | other._value)

    comptime DISABLE_OPTIMIZATION = Self(value = 1 << 0)
    comptime ALLOW_DERIVATIVES = Self(value = 1 << 1)
    comptime DERIVATIVE = Self(value = 1 << 2)
    comptime VIEW_INDEX_FROM_DEVICE_INDEX = Self(value = 1 << 3)
    comptime DISPATCH_BASE = Self(value = 1 << 4)
    comptime DEFER_COMPILE = Self(value = 1 << 5)
    comptime CAPTURE_STATISTICS = Self(value = 1 << 6)
    comptime CAPTURE_INTERNAL_REPRESENTATIONS = Self(value = 1 << 7)
    comptime FAIL_ON_PIPELINE_COMPILE_REQUIRED = Self(value = 1 << 8)
    comptime EARLY_RETURN_ON_FAILURE = Self(value = 1 << 9)
    comptime LINK_TIME_OPTIMIZATION = Self(value = 1 << 10)
    comptime LIBRARY = Self(value = 1 << 11)
    comptime RAY_TRACING_SKIP_TRIANGLES = Self(value = 1 << 12)
    comptime RAY_TRACING_SKIP_AABBS = Self(value = 1 << 13)
    comptime RAY_TRACING_NO_NULL_ANY_HIT_SHADERS = Self(value = 1 << 14)
    comptime RAY_TRACING_NO_NULL_CLOSEST_HIT_SHADERS = Self(value = 1 << 15)
    comptime RAY_TRACING_NO_NULL_MISS_SHADERS = Self(value = 1 << 16)
    comptime RAY_TRACING_NO_NULL_INTERSECTION_SHADERS = Self(value = 1 << 17)
    comptime INDIRECT_BINDABLE = Self(value = 1 << 18)
    comptime RAY_TRACING_SHADER_GROUP_HANDLE_CAPTURE_REPLAY = Self(value = 1 << 19)
    comptime RAY_TRACING_ALLOW_MOTION = Self(value = 1 << 20)
    comptime RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = 1 << 21)
    comptime RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT = Self(value = 1 << 22)
    comptime RETAIN_LINK_TIME_OPTIMIZATION_INFO = Self(value = 1 << 23)
    comptime RAY_TRACING_OPACITY_MICROMAP = Self(value = 1 << 24)
    comptime COLOR_ATTACHMENT_FEEDBACK_LOOP = Self(value = 1 << 25)
    comptime DEPTH_STENCIL_ATTACHMENT_FEEDBACK_LOOP = Self(value = 1 << 26)
    comptime NO_PROTECTED_ACCESS = Self(value = 1 << 27)
    comptime RAY_TRACING_DISPLACEMENT_MICROMAP = Self(value = 1 << 28)
    comptime DESCRIPTOR_BUFFER = Self(value = 1 << 29)
    comptime PROTECTED_ACCESS_ONLY = Self(value = 1 << 30)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ColorComponentFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ColorComponentFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ColorComponentFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ColorComponentFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ColorComponentFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ColorComponentFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ColorComponentFlags) -> Bool:
        return self & other == other

    comptime R = Self(value = ColorComponentFlagBits.R.value())
    comptime G = Self(value = ColorComponentFlagBits.G.value())
    comptime B = Self(value = ColorComponentFlagBits.B.value())
    comptime A = Self(value = ColorComponentFlagBits.A.value())


@register_passable("trivial")
struct ColorComponentFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ColorComponentFlags:
        return ColorComponentFlags(value = self._value | other._value)

    comptime R = Self(value = 1 << 0)
    comptime G = Self(value = 1 << 1)
    comptime B = Self(value = 1 << 2)
    comptime A = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: FenceCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: FenceCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: FenceCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: FenceCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: FenceCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: FenceCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: FenceCreateFlags) -> Bool:
        return self & other == other

    comptime SIGNALED = Self(value = FenceCreateFlagBits.SIGNALED.value())


@register_passable("trivial")
struct FenceCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> FenceCreateFlags:
        return FenceCreateFlags(value = self._value | other._value)

    comptime SIGNALED = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SemaphoreCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SemaphoreCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SemaphoreCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SemaphoreCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SemaphoreCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SemaphoreCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: SemaphoreCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct SemaphoreCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SemaphoreCreateFlags:
        return SemaphoreCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: FormatFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: FormatFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: FormatFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: FormatFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: FormatFeatureFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: FormatFeatureFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: FormatFeatureFlags) -> Bool:
        return self & other == other

    comptime SAMPLED_IMAGE = Self(value = FormatFeatureFlagBits.SAMPLED_IMAGE.value())
    comptime STORAGE_IMAGE = Self(value = FormatFeatureFlagBits.STORAGE_IMAGE.value())
    comptime STORAGE_IMAGE_ATOMIC = Self(value = FormatFeatureFlagBits.STORAGE_IMAGE_ATOMIC.value())
    comptime UNIFORM_TEXEL_BUFFER = Self(value = FormatFeatureFlagBits.UNIFORM_TEXEL_BUFFER.value())
    comptime STORAGE_TEXEL_BUFFER = Self(value = FormatFeatureFlagBits.STORAGE_TEXEL_BUFFER.value())
    comptime STORAGE_TEXEL_BUFFER_ATOMIC = Self(value = FormatFeatureFlagBits.STORAGE_TEXEL_BUFFER_ATOMIC.value())
    comptime VERTEX_BUFFER = Self(value = FormatFeatureFlagBits.VERTEX_BUFFER.value())
    comptime COLOR_ATTACHMENT = Self(value = FormatFeatureFlagBits.COLOR_ATTACHMENT.value())
    comptime COLOR_ATTACHMENT_BLEND = Self(value = FormatFeatureFlagBits.COLOR_ATTACHMENT_BLEND.value())
    comptime DEPTH_STENCIL_ATTACHMENT = Self(value = FormatFeatureFlagBits.DEPTH_STENCIL_ATTACHMENT.value())
    comptime BLIT_SRC = Self(value = FormatFeatureFlagBits.BLIT_SRC.value())
    comptime BLIT_DST = Self(value = FormatFeatureFlagBits.BLIT_DST.value())
    comptime SAMPLED_IMAGE_FILTER_LINEAR = Self(value = FormatFeatureFlagBits.SAMPLED_IMAGE_FILTER_LINEAR.value())
    comptime TRANSFER_SRC = Self(value = FormatFeatureFlagBits.TRANSFER_SRC.value())
    comptime TRANSFER_DST = Self(value = FormatFeatureFlagBits.TRANSFER_DST.value())
    comptime SAMPLED_IMAGE_FILTER_MINMAX = Self(value = FormatFeatureFlagBits.SAMPLED_IMAGE_FILTER_MINMAX.value())
    comptime MIDPOINT_CHROMA_SAMPLES = Self(value = FormatFeatureFlagBits.MIDPOINT_CHROMA_SAMPLES.value())
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER = Self(value = FormatFeatureFlagBits.SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER.value())
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER = Self(value = FormatFeatureFlagBits.SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER.value())
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT = Self(value = FormatFeatureFlagBits.SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT.value())
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE = Self(value = FormatFeatureFlagBits.SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE.value())
    comptime DISJOINT = Self(value = FormatFeatureFlagBits.DISJOINT.value())
    comptime COSITED_CHROMA_SAMPLES = Self(value = FormatFeatureFlagBits.COSITED_CHROMA_SAMPLES.value())
    comptime FRAGMENT_DENSITY_MAP = Self(value = FormatFeatureFlagBits.FRAGMENT_DENSITY_MAP.value())
    comptime VIDEO_DECODE_OUTPUT = Self(value = FormatFeatureFlagBits.VIDEO_DECODE_OUTPUT.value())
    comptime VIDEO_DECODE_DPB = Self(value = FormatFeatureFlagBits.VIDEO_DECODE_DPB.value())
    comptime VIDEO_ENCODE_INPUT = Self(value = FormatFeatureFlagBits.VIDEO_ENCODE_INPUT.value())
    comptime VIDEO_ENCODE_DPB = Self(value = FormatFeatureFlagBits.VIDEO_ENCODE_DPB.value())
    comptime ACCELERATION_STRUCTURE_VERTEX_BUFFER = Self(value = FormatFeatureFlagBits.ACCELERATION_STRUCTURE_VERTEX_BUFFER.value())
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = FormatFeatureFlagBits.FRAGMENT_SHADING_RATE_ATTACHMENT.value())


@register_passable("trivial")
struct FormatFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> FormatFeatureFlags:
        return FormatFeatureFlags(value = self._value | other._value)

    comptime SAMPLED_IMAGE = Self(value = 1 << 0)
    comptime STORAGE_IMAGE = Self(value = 1 << 1)
    comptime STORAGE_IMAGE_ATOMIC = Self(value = 1 << 2)
    comptime UNIFORM_TEXEL_BUFFER = Self(value = 1 << 3)
    comptime STORAGE_TEXEL_BUFFER = Self(value = 1 << 4)
    comptime STORAGE_TEXEL_BUFFER_ATOMIC = Self(value = 1 << 5)
    comptime VERTEX_BUFFER = Self(value = 1 << 6)
    comptime COLOR_ATTACHMENT = Self(value = 1 << 7)
    comptime COLOR_ATTACHMENT_BLEND = Self(value = 1 << 8)
    comptime DEPTH_STENCIL_ATTACHMENT = Self(value = 1 << 9)
    comptime BLIT_SRC = Self(value = 1 << 10)
    comptime BLIT_DST = Self(value = 1 << 11)
    comptime SAMPLED_IMAGE_FILTER_LINEAR = Self(value = 1 << 12)
    comptime TRANSFER_SRC = Self(value = 1 << 14)
    comptime TRANSFER_DST = Self(value = 1 << 15)
    comptime SAMPLED_IMAGE_FILTER_MINMAX = Self(value = 1 << 16)
    comptime MIDPOINT_CHROMA_SAMPLES = Self(value = 1 << 17)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER = Self(value = 1 << 18)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER = Self(value = 1 << 19)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT = Self(value = 1 << 20)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE = Self(value = 1 << 21)
    comptime DISJOINT = Self(value = 1 << 22)
    comptime COSITED_CHROMA_SAMPLES = Self(value = 1 << 23)
    comptime FRAGMENT_DENSITY_MAP = Self(value = 1 << 24)
    comptime VIDEO_DECODE_OUTPUT = Self(value = 1 << 25)
    comptime VIDEO_DECODE_DPB = Self(value = 1 << 26)
    comptime VIDEO_ENCODE_INPUT = Self(value = 1 << 27)
    comptime VIDEO_ENCODE_DPB = Self(value = 1 << 28)
    comptime ACCELERATION_STRUCTURE_VERTEX_BUFFER = Self(value = 1 << 29)
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = 1 << 30)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: QueryControlFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: QueryControlFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: QueryControlFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: QueryControlFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: QueryControlFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: QueryControlFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: QueryControlFlags) -> Bool:
        return self & other == other

    comptime PRECISE = Self(value = QueryControlFlagBits.PRECISE.value())


@register_passable("trivial")
struct QueryControlFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> QueryControlFlags:
        return QueryControlFlags(value = self._value | other._value)

    comptime PRECISE = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: QueryResultFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: QueryResultFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: QueryResultFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: QueryResultFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: QueryResultFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: QueryResultFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: QueryResultFlags) -> Bool:
        return self & other == other

    comptime N_64 = Self(value = QueryResultFlagBits.N_64.value())
    comptime WAIT = Self(value = QueryResultFlagBits.WAIT.value())
    comptime WITH_AVAILABILITY = Self(value = QueryResultFlagBits.WITH_AVAILABILITY.value())
    comptime PARTIAL = Self(value = QueryResultFlagBits.PARTIAL.value())
    comptime WITH_STATUS = Self(value = QueryResultFlagBits.WITH_STATUS.value())


@register_passable("trivial")
struct QueryResultFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> QueryResultFlags:
        return QueryResultFlags(value = self._value | other._value)

    comptime N_64 = Self(value = 1 << 0)
    comptime WAIT = Self(value = 1 << 1)
    comptime WITH_AVAILABILITY = Self(value = 1 << 2)
    comptime PARTIAL = Self(value = 1 << 3)
    comptime WITH_STATUS = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ShaderModuleCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ShaderModuleCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ShaderModuleCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ShaderModuleCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ShaderModuleCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ShaderModuleCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ShaderModuleCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct ShaderModuleCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ShaderModuleCreateFlags:
        return ShaderModuleCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: EventCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: EventCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: EventCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: EventCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: EventCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: EventCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: EventCreateFlags) -> Bool:
        return self & other == other

    comptime DEVICE_ONLY = Self(value = EventCreateFlagBits.DEVICE_ONLY.value())


@register_passable("trivial")
struct EventCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> EventCreateFlags:
        return EventCreateFlags(value = self._value | other._value)

    comptime DEVICE_ONLY = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: CommandPoolCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: CommandPoolCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: CommandPoolCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: CommandPoolCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: CommandPoolCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: CommandPoolCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: CommandPoolCreateFlags) -> Bool:
        return self & other == other

    comptime TRANSIENT = Self(value = CommandPoolCreateFlagBits.TRANSIENT.value())
    comptime RESET_COMMAND_BUFFER = Self(value = CommandPoolCreateFlagBits.RESET_COMMAND_BUFFER.value())
    comptime PROTECTED = Self(value = CommandPoolCreateFlagBits.PROTECTED.value())


@register_passable("trivial")
struct CommandPoolCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> CommandPoolCreateFlags:
        return CommandPoolCreateFlags(value = self._value | other._value)

    comptime TRANSIENT = Self(value = 1 << 0)
    comptime RESET_COMMAND_BUFFER = Self(value = 1 << 1)
    comptime PROTECTED = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: CommandPoolResetFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: CommandPoolResetFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: CommandPoolResetFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: CommandPoolResetFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: CommandPoolResetFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: CommandPoolResetFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: CommandPoolResetFlags) -> Bool:
        return self & other == other

    comptime RELEASE_RESOURCES = Self(value = CommandPoolResetFlagBits.RELEASE_RESOURCES.value())
    comptime RESERVED_1_BIT_COREAVI = Self(value = CommandPoolResetFlagBits.RESERVED_1_BIT_COREAVI.value())


@register_passable("trivial")
struct CommandPoolResetFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> CommandPoolResetFlags:
        return CommandPoolResetFlags(value = self._value | other._value)

    comptime RELEASE_RESOURCES = Self(value = 1 << 0)
    comptime RESERVED_1_BIT_COREAVI = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: CommandBufferResetFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: CommandBufferResetFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: CommandBufferResetFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: CommandBufferResetFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: CommandBufferResetFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: CommandBufferResetFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: CommandBufferResetFlags) -> Bool:
        return self & other == other

    comptime RELEASE_RESOURCES = Self(value = CommandBufferResetFlagBits.RELEASE_RESOURCES.value())


@register_passable("trivial")
struct CommandBufferResetFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> CommandBufferResetFlags:
        return CommandBufferResetFlags(value = self._value | other._value)

    comptime RELEASE_RESOURCES = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: CommandBufferUsageFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: CommandBufferUsageFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: CommandBufferUsageFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: CommandBufferUsageFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: CommandBufferUsageFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: CommandBufferUsageFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: CommandBufferUsageFlags) -> Bool:
        return self & other == other

    comptime ONE_TIME_SUBMIT = Self(value = CommandBufferUsageFlagBits.ONE_TIME_SUBMIT.value())
    comptime RENDER_PASS_CONTINUE = Self(value = CommandBufferUsageFlagBits.RENDER_PASS_CONTINUE.value())
    comptime SIMULTANEOUS_USE = Self(value = CommandBufferUsageFlagBits.SIMULTANEOUS_USE.value())


@register_passable("trivial")
struct CommandBufferUsageFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> CommandBufferUsageFlags:
        return CommandBufferUsageFlags(value = self._value | other._value)

    comptime ONE_TIME_SUBMIT = Self(value = 1 << 0)
    comptime RENDER_PASS_CONTINUE = Self(value = 1 << 1)
    comptime SIMULTANEOUS_USE = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: QueryPipelineStatisticFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: QueryPipelineStatisticFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: QueryPipelineStatisticFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: QueryPipelineStatisticFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: QueryPipelineStatisticFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: QueryPipelineStatisticFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: QueryPipelineStatisticFlags) -> Bool:
        return self & other == other

    comptime INPUT_ASSEMBLY_VERTICES = Self(value = QueryPipelineStatisticFlagBits.INPUT_ASSEMBLY_VERTICES.value())
    comptime INPUT_ASSEMBLY_PRIMITIVES = Self(value = QueryPipelineStatisticFlagBits.INPUT_ASSEMBLY_PRIMITIVES.value())
    comptime VERTEX_SHADER_INVOCATIONS = Self(value = QueryPipelineStatisticFlagBits.VERTEX_SHADER_INVOCATIONS.value())
    comptime GEOMETRY_SHADER_INVOCATIONS = Self(value = QueryPipelineStatisticFlagBits.GEOMETRY_SHADER_INVOCATIONS.value())
    comptime GEOMETRY_SHADER_PRIMITIVES = Self(value = QueryPipelineStatisticFlagBits.GEOMETRY_SHADER_PRIMITIVES.value())
    comptime CLIPPING_INVOCATIONS = Self(value = QueryPipelineStatisticFlagBits.CLIPPING_INVOCATIONS.value())
    comptime CLIPPING_PRIMITIVES = Self(value = QueryPipelineStatisticFlagBits.CLIPPING_PRIMITIVES.value())
    comptime FRAGMENT_SHADER_INVOCATIONS = Self(value = QueryPipelineStatisticFlagBits.FRAGMENT_SHADER_INVOCATIONS.value())
    comptime TESSELLATION_CONTROL_SHADER_PATCHES = Self(value = QueryPipelineStatisticFlagBits.TESSELLATION_CONTROL_SHADER_PATCHES.value())
    comptime TESSELLATION_EVALUATION_SHADER_INVOCATIONS = Self(value = QueryPipelineStatisticFlagBits.TESSELLATION_EVALUATION_SHADER_INVOCATIONS.value())
    comptime COMPUTE_SHADER_INVOCATIONS = Self(value = QueryPipelineStatisticFlagBits.COMPUTE_SHADER_INVOCATIONS.value())
    comptime TASK_SHADER_INVOCATIONS = Self(value = QueryPipelineStatisticFlagBits.TASK_SHADER_INVOCATIONS.value())
    comptime MESH_SHADER_INVOCATIONS = Self(value = QueryPipelineStatisticFlagBits.MESH_SHADER_INVOCATIONS.value())
    comptime CLUSTER_CULLING_SHADER_INVOCATIONS = Self(value = QueryPipelineStatisticFlagBits.CLUSTER_CULLING_SHADER_INVOCATIONS.value())


@register_passable("trivial")
struct QueryPipelineStatisticFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> QueryPipelineStatisticFlags:
        return QueryPipelineStatisticFlags(value = self._value | other._value)

    comptime INPUT_ASSEMBLY_VERTICES = Self(value = 1 << 0)
    comptime INPUT_ASSEMBLY_PRIMITIVES = Self(value = 1 << 1)
    comptime VERTEX_SHADER_INVOCATIONS = Self(value = 1 << 2)
    comptime GEOMETRY_SHADER_INVOCATIONS = Self(value = 1 << 3)
    comptime GEOMETRY_SHADER_PRIMITIVES = Self(value = 1 << 4)
    comptime CLIPPING_INVOCATIONS = Self(value = 1 << 5)
    comptime CLIPPING_PRIMITIVES = Self(value = 1 << 6)
    comptime FRAGMENT_SHADER_INVOCATIONS = Self(value = 1 << 7)
    comptime TESSELLATION_CONTROL_SHADER_PATCHES = Self(value = 1 << 8)
    comptime TESSELLATION_EVALUATION_SHADER_INVOCATIONS = Self(value = 1 << 9)
    comptime COMPUTE_SHADER_INVOCATIONS = Self(value = 1 << 10)
    comptime TASK_SHADER_INVOCATIONS = Self(value = 1 << 11)
    comptime MESH_SHADER_INVOCATIONS = Self(value = 1 << 12)
    comptime CLUSTER_CULLING_SHADER_INVOCATIONS = Self(value = 1 << 13)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: MemoryMapFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: MemoryMapFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: MemoryMapFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: MemoryMapFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: MemoryMapFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: MemoryMapFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: MemoryMapFlags) -> Bool:
        return self & other == other

    comptime PLACED = Self(value = MemoryMapFlagBits.PLACED.value())


@register_passable("trivial")
struct MemoryMapFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MemoryMapFlags:
        return MemoryMapFlags(value = self._value | other._value)

    comptime PLACED = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: MemoryUnmapFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: MemoryUnmapFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: MemoryUnmapFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: MemoryUnmapFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: MemoryUnmapFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: MemoryUnmapFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: MemoryUnmapFlags) -> Bool:
        return self & other == other

    comptime RESERVE = Self(value = MemoryUnmapFlagBits.RESERVE.value())


@register_passable("trivial")
struct MemoryUnmapFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MemoryUnmapFlags:
        return MemoryUnmapFlags(value = self._value | other._value)

    comptime RESERVE = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ImageAspectFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ImageAspectFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ImageAspectFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ImageAspectFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ImageAspectFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ImageAspectFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ImageAspectFlags) -> Bool:
        return self & other == other

    comptime NONE = Self(value = ImageAspectFlagBits.NONE.value())
    comptime COLOR = Self(value = ImageAspectFlagBits.COLOR.value())
    comptime DEPTH = Self(value = ImageAspectFlagBits.DEPTH.value())
    comptime STENCIL = Self(value = ImageAspectFlagBits.STENCIL.value())
    comptime METADATA = Self(value = ImageAspectFlagBits.METADATA.value())
    comptime PLANE_0 = Self(value = ImageAspectFlagBits.PLANE_0.value())
    comptime PLANE_1 = Self(value = ImageAspectFlagBits.PLANE_1.value())
    comptime PLANE_2 = Self(value = ImageAspectFlagBits.PLANE_2.value())
    comptime MEMORY_PLANE_0 = Self(value = ImageAspectFlagBits.MEMORY_PLANE_0.value())
    comptime MEMORY_PLANE_1 = Self(value = ImageAspectFlagBits.MEMORY_PLANE_1.value())
    comptime MEMORY_PLANE_2 = Self(value = ImageAspectFlagBits.MEMORY_PLANE_2.value())
    comptime MEMORY_PLANE_3 = Self(value = ImageAspectFlagBits.MEMORY_PLANE_3.value())


@register_passable("trivial")
struct ImageAspectFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImageAspectFlags:
        return ImageAspectFlags(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime COLOR = Self(value = 1 << 0)
    comptime DEPTH = Self(value = 1 << 1)
    comptime STENCIL = Self(value = 1 << 2)
    comptime METADATA = Self(value = 1 << 3)
    comptime PLANE_0 = Self(value = 1 << 4)
    comptime PLANE_1 = Self(value = 1 << 5)
    comptime PLANE_2 = Self(value = 1 << 6)
    comptime MEMORY_PLANE_0 = Self(value = 1 << 7)
    comptime MEMORY_PLANE_1 = Self(value = 1 << 8)
    comptime MEMORY_PLANE_2 = Self(value = 1 << 9)
    comptime MEMORY_PLANE_3 = Self(value = 1 << 10)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SparseMemoryBindFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SparseMemoryBindFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SparseMemoryBindFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SparseMemoryBindFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SparseMemoryBindFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SparseMemoryBindFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: SparseMemoryBindFlags) -> Bool:
        return self & other == other

    comptime METADATA = Self(value = SparseMemoryBindFlagBits.METADATA.value())


@register_passable("trivial")
struct SparseMemoryBindFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SparseMemoryBindFlags:
        return SparseMemoryBindFlags(value = self._value | other._value)

    comptime METADATA = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SparseImageFormatFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SparseImageFormatFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SparseImageFormatFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SparseImageFormatFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SparseImageFormatFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SparseImageFormatFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: SparseImageFormatFlags) -> Bool:
        return self & other == other

    comptime SINGLE_MIPTAIL = Self(value = SparseImageFormatFlagBits.SINGLE_MIPTAIL.value())
    comptime ALIGNED_MIP_SIZE = Self(value = SparseImageFormatFlagBits.ALIGNED_MIP_SIZE.value())
    comptime NONSTANDARD_BLOCK_SIZE = Self(value = SparseImageFormatFlagBits.NONSTANDARD_BLOCK_SIZE.value())


@register_passable("trivial")
struct SparseImageFormatFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SparseImageFormatFlags:
        return SparseImageFormatFlags(value = self._value | other._value)

    comptime SINGLE_MIPTAIL = Self(value = 1 << 0)
    comptime ALIGNED_MIP_SIZE = Self(value = 1 << 1)
    comptime NONSTANDARD_BLOCK_SIZE = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SubpassDescriptionFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SubpassDescriptionFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SubpassDescriptionFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SubpassDescriptionFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SubpassDescriptionFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SubpassDescriptionFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: SubpassDescriptionFlags) -> Bool:
        return self & other == other

    comptime PER_VIEW_ATTRIBUTES = Self(value = SubpassDescriptionFlagBits.PER_VIEW_ATTRIBUTES.value())
    comptime PER_VIEW_POSITION_X_ONLY = Self(value = SubpassDescriptionFlagBits.PER_VIEW_POSITION_X_ONLY.value())
    comptime FRAGMENT_REGION = Self(value = SubpassDescriptionFlagBits.FRAGMENT_REGION.value())
    comptime SHADER_RESOLVE = Self(value = SubpassDescriptionFlagBits.SHADER_RESOLVE.value())
    comptime ENABLE_LEGACY_DITHERING = Self(value = SubpassDescriptionFlagBits.ENABLE_LEGACY_DITHERING.value())
    comptime TILE_SHADING_APRON = Self(value = SubpassDescriptionFlagBits.TILE_SHADING_APRON.value())


@register_passable("trivial")
struct SubpassDescriptionFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SubpassDescriptionFlags:
        return SubpassDescriptionFlags(value = self._value | other._value)

    comptime PER_VIEW_ATTRIBUTES = Self(value = 1 << 0)
    comptime PER_VIEW_POSITION_X_ONLY = Self(value = 1 << 1)
    comptime FRAGMENT_REGION = Self(value = 1 << 2)
    comptime SHADER_RESOLVE = Self(value = 1 << 3)
    comptime ENABLE_LEGACY_DITHERING = Self(value = 1 << 7)
    comptime TILE_SHADING_APRON = Self(value = 1 << 8)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineStageFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineStageFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineStageFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineStageFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineStageFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineStageFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineStageFlags) -> Bool:
        return self & other == other

    comptime NONE = Self(value = PipelineStageFlagBits.NONE.value())
    comptime TOP_OF_PIPE = Self(value = PipelineStageFlagBits.TOP_OF_PIPE.value())
    comptime DRAW_INDIRECT = Self(value = PipelineStageFlagBits.DRAW_INDIRECT.value())
    comptime VERTEX_INPUT = Self(value = PipelineStageFlagBits.VERTEX_INPUT.value())
    comptime VERTEX_SHADER = Self(value = PipelineStageFlagBits.VERTEX_SHADER.value())
    comptime TESSELLATION_CONTROL_SHADER = Self(value = PipelineStageFlagBits.TESSELLATION_CONTROL_SHADER.value())
    comptime TESSELLATION_EVALUATION_SHADER = Self(value = PipelineStageFlagBits.TESSELLATION_EVALUATION_SHADER.value())
    comptime GEOMETRY_SHADER = Self(value = PipelineStageFlagBits.GEOMETRY_SHADER.value())
    comptime FRAGMENT_SHADER = Self(value = PipelineStageFlagBits.FRAGMENT_SHADER.value())
    comptime EARLY_FRAGMENT_TESTS = Self(value = PipelineStageFlagBits.EARLY_FRAGMENT_TESTS.value())
    comptime LATE_FRAGMENT_TESTS = Self(value = PipelineStageFlagBits.LATE_FRAGMENT_TESTS.value())
    comptime COLOR_ATTACHMENT_OUTPUT = Self(value = PipelineStageFlagBits.COLOR_ATTACHMENT_OUTPUT.value())
    comptime COMPUTE_SHADER = Self(value = PipelineStageFlagBits.COMPUTE_SHADER.value())
    comptime TRANSFER = Self(value = PipelineStageFlagBits.TRANSFER.value())
    comptime BOTTOM_OF_PIPE = Self(value = PipelineStageFlagBits.BOTTOM_OF_PIPE.value())
    comptime HOST = Self(value = PipelineStageFlagBits.HOST.value())
    comptime ALL_GRAPHICS = Self(value = PipelineStageFlagBits.ALL_GRAPHICS.value())
    comptime ALL_COMMANDS = Self(value = PipelineStageFlagBits.ALL_COMMANDS.value())
    comptime CONDITIONAL_RENDERING = Self(value = PipelineStageFlagBits.CONDITIONAL_RENDERING.value())
    comptime RAY_TRACING_SHADER = Self(value = PipelineStageFlagBits.RAY_TRACING_SHADER.value())
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = PipelineStageFlagBits.FRAGMENT_SHADING_RATE_ATTACHMENT.value())
    comptime FRAGMENT_DENSITY_PROCESS = Self(value = PipelineStageFlagBits.FRAGMENT_DENSITY_PROCESS.value())
    comptime TRANSFORM_FEEDBACK = Self(value = PipelineStageFlagBits.TRANSFORM_FEEDBACK.value())
    comptime ACCELERATION_STRUCTURE_BUILD = Self(value = PipelineStageFlagBits.ACCELERATION_STRUCTURE_BUILD.value())


@register_passable("trivial")
struct PipelineStageFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineStageFlags:
        return PipelineStageFlags(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime TOP_OF_PIPE = Self(value = 1 << 0)
    comptime DRAW_INDIRECT = Self(value = 1 << 1)
    comptime VERTEX_INPUT = Self(value = 1 << 2)
    comptime VERTEX_SHADER = Self(value = 1 << 3)
    comptime TESSELLATION_CONTROL_SHADER = Self(value = 1 << 4)
    comptime TESSELLATION_EVALUATION_SHADER = Self(value = 1 << 5)
    comptime GEOMETRY_SHADER = Self(value = 1 << 6)
    comptime FRAGMENT_SHADER = Self(value = 1 << 7)
    comptime EARLY_FRAGMENT_TESTS = Self(value = 1 << 8)
    comptime LATE_FRAGMENT_TESTS = Self(value = 1 << 9)
    comptime COLOR_ATTACHMENT_OUTPUT = Self(value = 1 << 10)
    comptime COMPUTE_SHADER = Self(value = 1 << 11)
    comptime TRANSFER = Self(value = 1 << 12)
    comptime BOTTOM_OF_PIPE = Self(value = 1 << 13)
    comptime HOST = Self(value = 1 << 14)
    comptime ALL_GRAPHICS = Self(value = 1 << 15)
    comptime ALL_COMMANDS = Self(value = 1 << 16)
    comptime CONDITIONAL_RENDERING = Self(value = 1 << 18)
    comptime RAY_TRACING_SHADER = Self(value = 1 << 21)
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = 1 << 22)
    comptime FRAGMENT_DENSITY_PROCESS = Self(value = 1 << 23)
    comptime TRANSFORM_FEEDBACK = Self(value = 1 << 24)
    comptime ACCELERATION_STRUCTURE_BUILD = Self(value = 1 << 25)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SampleCountFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SampleCountFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SampleCountFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SampleCountFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SampleCountFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SampleCountFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: SampleCountFlags) -> Bool:
        return self & other == other

    comptime N_1 = Self(value = SampleCountFlagBits.N_1.value())
    comptime N_2 = Self(value = SampleCountFlagBits.N_2.value())
    comptime N_4 = Self(value = SampleCountFlagBits.N_4.value())
    comptime N_8 = Self(value = SampleCountFlagBits.N_8.value())
    comptime N_16 = Self(value = SampleCountFlagBits.N_16.value())
    comptime N_32 = Self(value = SampleCountFlagBits.N_32.value())
    comptime N_64 = Self(value = SampleCountFlagBits.N_64.value())


@register_passable("trivial")
struct SampleCountFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SampleCountFlags:
        return SampleCountFlags(value = self._value | other._value)

    comptime N_1 = Self(value = 1 << 0)
    comptime N_2 = Self(value = 1 << 1)
    comptime N_4 = Self(value = 1 << 2)
    comptime N_8 = Self(value = 1 << 3)
    comptime N_16 = Self(value = 1 << 4)
    comptime N_32 = Self(value = 1 << 5)
    comptime N_64 = Self(value = 1 << 6)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: AttachmentDescriptionFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: AttachmentDescriptionFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: AttachmentDescriptionFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: AttachmentDescriptionFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: AttachmentDescriptionFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: AttachmentDescriptionFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: AttachmentDescriptionFlags) -> Bool:
        return self & other == other

    comptime MAY_ALIAS = Self(value = AttachmentDescriptionFlagBits.MAY_ALIAS.value())
    comptime RESERVED_1 = Self(value = AttachmentDescriptionFlagBits.RESERVED_1.value())
    comptime RESERVED_2 = Self(value = AttachmentDescriptionFlagBits.RESERVED_2.value())


@register_passable("trivial")
struct AttachmentDescriptionFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AttachmentDescriptionFlags:
        return AttachmentDescriptionFlags(value = self._value | other._value)

    comptime MAY_ALIAS = Self(value = 1 << 0)
    comptime RESERVED_1 = Self(value = 1 << 1)
    comptime RESERVED_2 = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: StencilFaceFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: StencilFaceFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: StencilFaceFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: StencilFaceFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: StencilFaceFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: StencilFaceFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: StencilFaceFlags) -> Bool:
        return self & other == other

    comptime FRONT_AND_BACK = Self(value = StencilFaceFlagBits.FRONT_AND_BACK.value())
    comptime FRONT = Self(value = StencilFaceFlagBits.FRONT.value())
    comptime BACK = Self(value = StencilFaceFlagBits.BACK.value())


@register_passable("trivial")
struct StencilFaceFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> StencilFaceFlags:
        return StencilFaceFlags(value = self._value | other._value)

    comptime FRONT_AND_BACK = Self(value = 3)
    comptime FRONT = Self(value = 1 << 0)
    comptime BACK = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: CullModeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: CullModeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: CullModeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: CullModeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: CullModeFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: CullModeFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: CullModeFlags) -> Bool:
        return self & other == other

    comptime NONE = Self(value = CullModeFlagBits.NONE.value())
    comptime FRONT_AND_BACK = Self(value = CullModeFlagBits.FRONT_AND_BACK.value())
    comptime FRONT = Self(value = CullModeFlagBits.FRONT.value())
    comptime BACK = Self(value = CullModeFlagBits.BACK.value())


@register_passable("trivial")
struct CullModeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> CullModeFlags:
        return CullModeFlags(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime FRONT_AND_BACK = Self(value = 3)
    comptime FRONT = Self(value = 1 << 0)
    comptime BACK = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DescriptorPoolCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DescriptorPoolCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DescriptorPoolCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DescriptorPoolCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DescriptorPoolCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DescriptorPoolCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: DescriptorPoolCreateFlags) -> Bool:
        return self & other == other

    comptime FREE_DESCRIPTOR_SET = Self(value = DescriptorPoolCreateFlagBits.FREE_DESCRIPTOR_SET.value())
    comptime UPDATE_AFTER_BIND = Self(value = DescriptorPoolCreateFlagBits.UPDATE_AFTER_BIND.value())
    comptime ALLOW_OVERALLOCATION_SETS = Self(value = DescriptorPoolCreateFlagBits.ALLOW_OVERALLOCATION_SETS.value())
    comptime ALLOW_OVERALLOCATION_POOLS = Self(value = DescriptorPoolCreateFlagBits.ALLOW_OVERALLOCATION_POOLS.value())


@register_passable("trivial")
struct DescriptorPoolCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DescriptorPoolCreateFlags:
        return DescriptorPoolCreateFlags(value = self._value | other._value)

    comptime FREE_DESCRIPTOR_SET = Self(value = 1 << 0)
    comptime UPDATE_AFTER_BIND = Self(value = 1 << 1)
    comptime ALLOW_OVERALLOCATION_SETS = Self(value = 1 << 3)
    comptime ALLOW_OVERALLOCATION_POOLS = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DescriptorPoolResetFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DescriptorPoolResetFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DescriptorPoolResetFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DescriptorPoolResetFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DescriptorPoolResetFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DescriptorPoolResetFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: DescriptorPoolResetFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DescriptorPoolResetFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DescriptorPoolResetFlags:
        return DescriptorPoolResetFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DependencyFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DependencyFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DependencyFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DependencyFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DependencyFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DependencyFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: DependencyFlags) -> Bool:
        return self & other == other

    comptime BY_REGION = Self(value = DependencyFlagBits.BY_REGION.value())
    comptime VIEW_LOCAL = Self(value = DependencyFlagBits.VIEW_LOCAL.value())
    comptime DEVICE_GROUP = Self(value = DependencyFlagBits.DEVICE_GROUP.value())
    comptime FEEDBACK_LOOP = Self(value = DependencyFlagBits.FEEDBACK_LOOP.value())
    comptime EXTENSION_586 = Self(value = DependencyFlagBits.EXTENSION_586.value())
    comptime QUEUE_FAMILY_OWNERSHIP_TRANSFER_USE_ALL_STAGES = Self(value = DependencyFlagBits.QUEUE_FAMILY_OWNERSHIP_TRANSFER_USE_ALL_STAGES.value())
    comptime ASYMMETRIC_EVENT = Self(value = DependencyFlagBits.ASYMMETRIC_EVENT.value())


@register_passable("trivial")
struct DependencyFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DependencyFlags:
        return DependencyFlags(value = self._value | other._value)

    comptime BY_REGION = Self(value = 1 << 0)
    comptime VIEW_LOCAL = Self(value = 1 << 1)
    comptime DEVICE_GROUP = Self(value = 1 << 2)
    comptime FEEDBACK_LOOP = Self(value = 1 << 3)
    comptime EXTENSION_586 = Self(value = 1 << 4)
    comptime QUEUE_FAMILY_OWNERSHIP_TRANSFER_USE_ALL_STAGES = Self(value = 1 << 5)
    comptime ASYMMETRIC_EVENT = Self(value = 1 << 6)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SubgroupFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SubgroupFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SubgroupFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SubgroupFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SubgroupFeatureFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SubgroupFeatureFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: SubgroupFeatureFlags) -> Bool:
        return self & other == other

    comptime BASIC = Self(value = SubgroupFeatureFlagBits.BASIC.value())
    comptime VOTE = Self(value = SubgroupFeatureFlagBits.VOTE.value())
    comptime ARITHMETIC = Self(value = SubgroupFeatureFlagBits.ARITHMETIC.value())
    comptime BALLOT = Self(value = SubgroupFeatureFlagBits.BALLOT.value())
    comptime SHUFFLE = Self(value = SubgroupFeatureFlagBits.SHUFFLE.value())
    comptime SHUFFLE_RELATIVE = Self(value = SubgroupFeatureFlagBits.SHUFFLE_RELATIVE.value())
    comptime CLUSTERED = Self(value = SubgroupFeatureFlagBits.CLUSTERED.value())
    comptime QUAD = Self(value = SubgroupFeatureFlagBits.QUAD.value())
    comptime PARTITIONED = Self(value = SubgroupFeatureFlagBits.PARTITIONED.value())
    comptime ROTATE = Self(value = SubgroupFeatureFlagBits.ROTATE.value())
    comptime ROTATE_CLUSTERED = Self(value = SubgroupFeatureFlagBits.ROTATE_CLUSTERED.value())


@register_passable("trivial")
struct SubgroupFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SubgroupFeatureFlags:
        return SubgroupFeatureFlags(value = self._value | other._value)

    comptime BASIC = Self(value = 1 << 0)
    comptime VOTE = Self(value = 1 << 1)
    comptime ARITHMETIC = Self(value = 1 << 2)
    comptime BALLOT = Self(value = 1 << 3)
    comptime SHUFFLE = Self(value = 1 << 4)
    comptime SHUFFLE_RELATIVE = Self(value = 1 << 5)
    comptime CLUSTERED = Self(value = 1 << 6)
    comptime QUAD = Self(value = 1 << 7)
    comptime PARTITIONED = Self(value = 1 << 8)
    comptime ROTATE = Self(value = 1 << 9)
    comptime ROTATE_CLUSTERED = Self(value = 1 << 10)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: IndirectCommandsLayoutUsageFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: IndirectCommandsLayoutUsageFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: IndirectCommandsLayoutUsageFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: IndirectCommandsLayoutUsageFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: IndirectCommandsLayoutUsageFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: IndirectCommandsLayoutUsageFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: IndirectCommandsLayoutUsageFlagsNV) -> Bool:
        return self & other == other

    comptime EXPLICIT_PREPROCESS = Self(value = IndirectCommandsLayoutUsageFlagBitsNV.EXPLICIT_PREPROCESS.value())
    comptime INDEXED_SEQUENCES = Self(value = IndirectCommandsLayoutUsageFlagBitsNV.INDEXED_SEQUENCES.value())
    comptime UNORDERED_SEQUENCES = Self(value = IndirectCommandsLayoutUsageFlagBitsNV.UNORDERED_SEQUENCES.value())


@register_passable("trivial")
struct IndirectCommandsLayoutUsageFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> IndirectCommandsLayoutUsageFlagsNV:
        return IndirectCommandsLayoutUsageFlagsNV(value = self._value | other._value)

    comptime EXPLICIT_PREPROCESS = Self(value = 1 << 0)
    comptime INDEXED_SEQUENCES = Self(value = 1 << 1)
    comptime UNORDERED_SEQUENCES = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: IndirectStateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: IndirectStateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: IndirectStateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: IndirectStateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: IndirectStateFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: IndirectStateFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: IndirectStateFlagsNV) -> Bool:
        return self & other == other

    comptime FLAG_FRONTFACE = Self(value = IndirectStateFlagBitsNV.FLAG_FRONTFACE.value())


@register_passable("trivial")
struct IndirectStateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> IndirectStateFlagsNV:
        return IndirectStateFlagsNV(value = self._value | other._value)

    comptime FLAG_FRONTFACE = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: GeometryFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: GeometryFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: GeometryFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: GeometryFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: GeometryFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: GeometryFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: GeometryFlagsKHR) -> Bool:
        return self & other == other

    comptime OPAQUE = Self(value = GeometryFlagBitsKHR.OPAQUE.value())
    comptime NO_DUPLICATE_ANY_HIT_INVOCATION = Self(value = GeometryFlagBitsKHR.NO_DUPLICATE_ANY_HIT_INVOCATION.value())


@register_passable("trivial")
struct GeometryFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> GeometryFlagsKHR:
        return GeometryFlagsKHR(value = self._value | other._value)

    comptime OPAQUE = Self(value = 1 << 0)
    comptime NO_DUPLICATE_ANY_HIT_INVOCATION = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: GeometryInstanceFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: GeometryInstanceFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: GeometryInstanceFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: GeometryInstanceFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: GeometryInstanceFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: GeometryInstanceFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: GeometryInstanceFlagsKHR) -> Bool:
        return self & other == other

    comptime TRIANGLE_FACING_CULL_DISABLE = Self(value = GeometryInstanceFlagBitsKHR.TRIANGLE_FACING_CULL_DISABLE.value())
    comptime TRIANGLE_FLIP_FACING = Self(value = GeometryInstanceFlagBitsKHR.TRIANGLE_FLIP_FACING.value())
    comptime FORCE_OPAQUE = Self(value = GeometryInstanceFlagBitsKHR.FORCE_OPAQUE.value())
    comptime FORCE_NO_OPAQUE = Self(value = GeometryInstanceFlagBitsKHR.FORCE_NO_OPAQUE.value())
    comptime FORCE_OPACITY_MICROMAP_2_STATE = Self(value = GeometryInstanceFlagBitsKHR.FORCE_OPACITY_MICROMAP_2_STATE.value())
    comptime DISABLE_OPACITY_MICROMAPS = Self(value = GeometryInstanceFlagBitsKHR.DISABLE_OPACITY_MICROMAPS.value())


@register_passable("trivial")
struct GeometryInstanceFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> GeometryInstanceFlagsKHR:
        return GeometryInstanceFlagsKHR(value = self._value | other._value)

    comptime TRIANGLE_FACING_CULL_DISABLE = Self(value = 1 << 0)
    comptime TRIANGLE_FLIP_FACING = Self(value = 1 << 1)
    comptime FORCE_OPAQUE = Self(value = 1 << 2)
    comptime FORCE_NO_OPAQUE = Self(value = 1 << 3)
    comptime FORCE_OPACITY_MICROMAP_2_STATE = Self(value = 1 << 4)
    comptime DISABLE_OPACITY_MICROMAPS = Self(value = 1 << 5)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ClusterAccelerationStructureGeometryFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ClusterAccelerationStructureGeometryFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ClusterAccelerationStructureGeometryFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ClusterAccelerationStructureGeometryFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ClusterAccelerationStructureGeometryFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ClusterAccelerationStructureGeometryFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: ClusterAccelerationStructureGeometryFlagsNV) -> Bool:
        return self & other == other

    comptime CULL_DISABLE = Self(value = ClusterAccelerationStructureGeometryFlagBitsNV.CULL_DISABLE.value())
    comptime NO_DUPLICATE_ANYHIT_INVOCATION = Self(value = ClusterAccelerationStructureGeometryFlagBitsNV.NO_DUPLICATE_ANYHIT_INVOCATION.value())
    comptime OPAQUE = Self(value = ClusterAccelerationStructureGeometryFlagBitsNV.OPAQUE.value())


@register_passable("trivial")
struct ClusterAccelerationStructureGeometryFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ClusterAccelerationStructureGeometryFlagsNV:
        return ClusterAccelerationStructureGeometryFlagsNV(value = self._value | other._value)

    comptime CULL_DISABLE = Self(value = 1 << 0)
    comptime NO_DUPLICATE_ANYHIT_INVOCATION = Self(value = 1 << 1)
    comptime OPAQUE = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ClusterAccelerationStructureClusterFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ClusterAccelerationStructureClusterFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ClusterAccelerationStructureClusterFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ClusterAccelerationStructureClusterFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ClusterAccelerationStructureClusterFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ClusterAccelerationStructureClusterFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: ClusterAccelerationStructureClusterFlagsNV) -> Bool:
        return self & other == other

    comptime ALLOW_DISABLE_OPACITY_MICROMAPS = Self(value = ClusterAccelerationStructureClusterFlagBitsNV.ALLOW_DISABLE_OPACITY_MICROMAPS.value())


@register_passable("trivial")
struct ClusterAccelerationStructureClusterFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ClusterAccelerationStructureClusterFlagsNV:
        return ClusterAccelerationStructureClusterFlagsNV(value = self._value | other._value)

    comptime ALLOW_DISABLE_OPACITY_MICROMAPS = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ClusterAccelerationStructureAddressResolutionFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ClusterAccelerationStructureAddressResolutionFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ClusterAccelerationStructureAddressResolutionFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ClusterAccelerationStructureAddressResolutionFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ClusterAccelerationStructureAddressResolutionFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ClusterAccelerationStructureAddressResolutionFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: ClusterAccelerationStructureAddressResolutionFlagsNV) -> Bool:
        return self & other == other

    comptime NONE = Self(value = ClusterAccelerationStructureAddressResolutionFlagBitsNV.NONE.value())
    comptime INDIRECTED_DST_IMPLICIT_DATA = Self(value = ClusterAccelerationStructureAddressResolutionFlagBitsNV.INDIRECTED_DST_IMPLICIT_DATA.value())
    comptime INDIRECTED_SCRATCH_DATA = Self(value = ClusterAccelerationStructureAddressResolutionFlagBitsNV.INDIRECTED_SCRATCH_DATA.value())
    comptime INDIRECTED_DST_ADDRESS_ARRAY = Self(value = ClusterAccelerationStructureAddressResolutionFlagBitsNV.INDIRECTED_DST_ADDRESS_ARRAY.value())
    comptime INDIRECTED_DST_SIZES_ARRAY = Self(value = ClusterAccelerationStructureAddressResolutionFlagBitsNV.INDIRECTED_DST_SIZES_ARRAY.value())
    comptime INDIRECTED_SRC_INFOS_ARRAY = Self(value = ClusterAccelerationStructureAddressResolutionFlagBitsNV.INDIRECTED_SRC_INFOS_ARRAY.value())
    comptime INDIRECTED_SRC_INFOS_COUNT = Self(value = ClusterAccelerationStructureAddressResolutionFlagBitsNV.INDIRECTED_SRC_INFOS_COUNT.value())


@register_passable("trivial")
struct ClusterAccelerationStructureAddressResolutionFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ClusterAccelerationStructureAddressResolutionFlagsNV:
        return ClusterAccelerationStructureAddressResolutionFlagsNV(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime INDIRECTED_DST_IMPLICIT_DATA = Self(value = 1 << 0)
    comptime INDIRECTED_SCRATCH_DATA = Self(value = 1 << 1)
    comptime INDIRECTED_DST_ADDRESS_ARRAY = Self(value = 1 << 2)
    comptime INDIRECTED_DST_SIZES_ARRAY = Self(value = 1 << 3)
    comptime INDIRECTED_SRC_INFOS_ARRAY = Self(value = 1 << 4)
    comptime INDIRECTED_SRC_INFOS_COUNT = Self(value = 1 << 5)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: BuildAccelerationStructureFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: BuildAccelerationStructureFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: BuildAccelerationStructureFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: BuildAccelerationStructureFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: BuildAccelerationStructureFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: BuildAccelerationStructureFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: BuildAccelerationStructureFlagsKHR) -> Bool:
        return self & other == other

    comptime ALLOW_UPDATE = Self(value = BuildAccelerationStructureFlagBitsKHR.ALLOW_UPDATE.value())
    comptime ALLOW_COMPACTION = Self(value = BuildAccelerationStructureFlagBitsKHR.ALLOW_COMPACTION.value())
    comptime PREFER_FAST_TRACE = Self(value = BuildAccelerationStructureFlagBitsKHR.PREFER_FAST_TRACE.value())
    comptime PREFER_FAST_BUILD = Self(value = BuildAccelerationStructureFlagBitsKHR.PREFER_FAST_BUILD.value())
    comptime LOW_MEMORY = Self(value = BuildAccelerationStructureFlagBitsKHR.LOW_MEMORY.value())
    comptime MOTION = Self(value = BuildAccelerationStructureFlagBitsKHR.MOTION.value())
    comptime ALLOW_OPACITY_MICROMAP_UPDATE = Self(value = BuildAccelerationStructureFlagBitsKHR.ALLOW_OPACITY_MICROMAP_UPDATE.value())
    comptime ALLOW_DISABLE_OPACITY_MICROMAPS = Self(value = BuildAccelerationStructureFlagBitsKHR.ALLOW_DISABLE_OPACITY_MICROMAPS.value())
    comptime ALLOW_OPACITY_MICROMAP_DATA_UPDATE = Self(value = BuildAccelerationStructureFlagBitsKHR.ALLOW_OPACITY_MICROMAP_DATA_UPDATE.value())
    comptime ALLOW_DISPLACEMENT_MICROMAP_UPDATE = Self(value = BuildAccelerationStructureFlagBitsKHR.ALLOW_DISPLACEMENT_MICROMAP_UPDATE.value())
    comptime ALLOW_DATA_ACCESS = Self(value = BuildAccelerationStructureFlagBitsKHR.ALLOW_DATA_ACCESS.value())
    comptime ALLOW_CLUSTER_OPACITY_MICROMAPS = Self(value = BuildAccelerationStructureFlagBitsKHR.ALLOW_CLUSTER_OPACITY_MICROMAPS.value())


@register_passable("trivial")
struct BuildAccelerationStructureFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> BuildAccelerationStructureFlagsKHR:
        return BuildAccelerationStructureFlagsKHR(value = self._value | other._value)

    comptime ALLOW_UPDATE = Self(value = 1 << 0)
    comptime ALLOW_COMPACTION = Self(value = 1 << 1)
    comptime PREFER_FAST_TRACE = Self(value = 1 << 2)
    comptime PREFER_FAST_BUILD = Self(value = 1 << 3)
    comptime LOW_MEMORY = Self(value = 1 << 4)
    comptime MOTION = Self(value = 1 << 5)
    comptime ALLOW_OPACITY_MICROMAP_UPDATE = Self(value = 1 << 6)
    comptime ALLOW_DISABLE_OPACITY_MICROMAPS = Self(value = 1 << 7)
    comptime ALLOW_OPACITY_MICROMAP_DATA_UPDATE = Self(value = 1 << 8)
    comptime ALLOW_DISPLACEMENT_MICROMAP_UPDATE = Self(value = 1 << 9)
    comptime ALLOW_DATA_ACCESS = Self(value = 1 << 11)
    comptime ALLOW_CLUSTER_OPACITY_MICROMAPS = Self(value = 1 << 12)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PrivateDataSlotCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PrivateDataSlotCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PrivateDataSlotCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PrivateDataSlotCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PrivateDataSlotCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PrivateDataSlotCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PrivateDataSlotCreateFlags) -> Bool:
        return self & other == other

    comptime RESERVED_0 = Self(value = PrivateDataSlotCreateFlagBits.RESERVED_0.value())


@register_passable("trivial")
struct PrivateDataSlotCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PrivateDataSlotCreateFlags:
        return PrivateDataSlotCreateFlags(value = self._value | other._value)

    comptime RESERVED_0 = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: AccelerationStructureCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: AccelerationStructureCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: AccelerationStructureCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: AccelerationStructureCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: AccelerationStructureCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: AccelerationStructureCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: AccelerationStructureCreateFlagsKHR) -> Bool:
        return self & other == other

    comptime DEVICE_ADDRESS_CAPTURE_REPLAY = Self(value = AccelerationStructureCreateFlagBitsKHR.DEVICE_ADDRESS_CAPTURE_REPLAY.value())
    comptime MOTION = Self(value = AccelerationStructureCreateFlagBitsKHR.MOTION.value())
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = AccelerationStructureCreateFlagBitsKHR.DESCRIPTOR_BUFFER_CAPTURE_REPLAY.value())


@register_passable("trivial")
struct AccelerationStructureCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AccelerationStructureCreateFlagsKHR:
        return AccelerationStructureCreateFlagsKHR(value = self._value | other._value)

    comptime DEVICE_ADDRESS_CAPTURE_REPLAY = Self(value = 1 << 0)
    comptime MOTION = Self(value = 1 << 2)
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DescriptorUpdateTemplateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DescriptorUpdateTemplateCreateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DescriptorUpdateTemplateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DescriptorUpdateTemplateCreateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DescriptorUpdateTemplateCreateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DescriptorUpdateTemplateCreateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: DescriptorUpdateTemplateCreateFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DescriptorUpdateTemplateCreateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DescriptorUpdateTemplateCreateFlags:
        return DescriptorUpdateTemplateCreateFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineCreationFeedbackFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineCreationFeedbackFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineCreationFeedbackFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineCreationFeedbackFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineCreationFeedbackFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineCreationFeedbackFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineCreationFeedbackFlags) -> Bool:
        return self & other == other

    comptime VALID = Self(value = PipelineCreationFeedbackFlagBits.VALID.value())
    comptime APPLICATION_PIPELINE_CACHE_HIT = Self(value = PipelineCreationFeedbackFlagBits.APPLICATION_PIPELINE_CACHE_HIT.value())
    comptime BASE_PIPELINE_ACCELERATION = Self(value = PipelineCreationFeedbackFlagBits.BASE_PIPELINE_ACCELERATION.value())


@register_passable("trivial")
struct PipelineCreationFeedbackFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCreationFeedbackFlags:
        return PipelineCreationFeedbackFlags(value = self._value | other._value)

    comptime VALID = Self(value = 1 << 0)
    comptime APPLICATION_PIPELINE_CACHE_HIT = Self(value = 1 << 1)
    comptime BASE_PIPELINE_ACCELERATION = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PerformanceCounterDescriptionFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PerformanceCounterDescriptionFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PerformanceCounterDescriptionFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PerformanceCounterDescriptionFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PerformanceCounterDescriptionFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PerformanceCounterDescriptionFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: PerformanceCounterDescriptionFlagsKHR) -> Bool:
        return self & other == other

    comptime PERFORMANCE_IMPACTING = Self(value = PerformanceCounterDescriptionFlagBitsKHR.PERFORMANCE_IMPACTING.value())
    comptime CONCURRENTLY_IMPACTED = Self(value = PerformanceCounterDescriptionFlagBitsKHR.CONCURRENTLY_IMPACTED.value())


@register_passable("trivial")
struct PerformanceCounterDescriptionFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PerformanceCounterDescriptionFlagsKHR:
        return PerformanceCounterDescriptionFlagsKHR(value = self._value | other._value)

    comptime PERFORMANCE_IMPACTING = Self(value = 1 << 0)
    comptime CONCURRENTLY_IMPACTED = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: AcquireProfilingLockFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: AcquireProfilingLockFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: AcquireProfilingLockFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: AcquireProfilingLockFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: AcquireProfilingLockFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: AcquireProfilingLockFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: AcquireProfilingLockFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct AcquireProfilingLockFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AcquireProfilingLockFlagsKHR:
        return AcquireProfilingLockFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SemaphoreWaitFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SemaphoreWaitFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SemaphoreWaitFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SemaphoreWaitFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SemaphoreWaitFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SemaphoreWaitFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: SemaphoreWaitFlags) -> Bool:
        return self & other == other

    comptime ANY = Self(value = SemaphoreWaitFlagBits.ANY.value())


@register_passable("trivial")
struct SemaphoreWaitFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SemaphoreWaitFlags:
        return SemaphoreWaitFlags(value = self._value | other._value)

    comptime ANY = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineCompilerControlFlagsAMD) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineCompilerControlFlagsAMD) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineCompilerControlFlagsAMD) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineCompilerControlFlagsAMD) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineCompilerControlFlagsAMD) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineCompilerControlFlagsAMD) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineCompilerControlFlagsAMD) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineCompilerControlFlagBitsAMD(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCompilerControlFlagsAMD:
        return PipelineCompilerControlFlagsAMD(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ShaderCorePropertiesFlagsAMD) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ShaderCorePropertiesFlagsAMD) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ShaderCorePropertiesFlagsAMD) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ShaderCorePropertiesFlagsAMD) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ShaderCorePropertiesFlagsAMD) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ShaderCorePropertiesFlagsAMD) -> Bool:
        return self & other == self

    fn is_superset(self, other: ShaderCorePropertiesFlagsAMD) -> Bool:
        return self & other == other


@register_passable("trivial")
struct ShaderCorePropertiesFlagBitsAMD(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ShaderCorePropertiesFlagsAMD:
        return ShaderCorePropertiesFlagsAMD(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DeviceDiagnosticsConfigFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DeviceDiagnosticsConfigFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DeviceDiagnosticsConfigFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DeviceDiagnosticsConfigFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DeviceDiagnosticsConfigFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DeviceDiagnosticsConfigFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: DeviceDiagnosticsConfigFlagsNV) -> Bool:
        return self & other == other

    comptime ENABLE_SHADER_DEBUG_INFO = Self(value = DeviceDiagnosticsConfigFlagBitsNV.ENABLE_SHADER_DEBUG_INFO.value())
    comptime ENABLE_RESOURCE_TRACKING = Self(value = DeviceDiagnosticsConfigFlagBitsNV.ENABLE_RESOURCE_TRACKING.value())
    comptime ENABLE_AUTOMATIC_CHECKPOINTS = Self(value = DeviceDiagnosticsConfigFlagBitsNV.ENABLE_AUTOMATIC_CHECKPOINTS.value())
    comptime ENABLE_SHADER_ERROR_REPORTING = Self(value = DeviceDiagnosticsConfigFlagBitsNV.ENABLE_SHADER_ERROR_REPORTING.value())


@register_passable("trivial")
struct DeviceDiagnosticsConfigFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DeviceDiagnosticsConfigFlagsNV:
        return DeviceDiagnosticsConfigFlagsNV(value = self._value | other._value)

    comptime ENABLE_SHADER_DEBUG_INFO = Self(value = 1 << 0)
    comptime ENABLE_RESOURCE_TRACKING = Self(value = 1 << 1)
    comptime ENABLE_AUTOMATIC_CHECKPOINTS = Self(value = 1 << 2)
    comptime ENABLE_SHADER_ERROR_REPORTING = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: RefreshObjectFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: RefreshObjectFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: RefreshObjectFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: RefreshObjectFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: RefreshObjectFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: RefreshObjectFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: RefreshObjectFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct RefreshObjectFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> RefreshObjectFlagsKHR:
        return RefreshObjectFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: AccessFlags2) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: AccessFlags2) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: AccessFlags2) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: AccessFlags2) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: AccessFlags2) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: AccessFlags2) -> Bool:
        return self & other == self

    fn is_superset(self, other: AccessFlags2) -> Bool:
        return self & other == other

    comptime NONE = Self(value = AccessFlagBits2.NONE.value())
    comptime INDIRECT_COMMAND_READ = Self(value = AccessFlagBits2.INDIRECT_COMMAND_READ.value())
    comptime INDEX_READ = Self(value = AccessFlagBits2.INDEX_READ.value())
    comptime VERTEX_ATTRIBUTE_READ = Self(value = AccessFlagBits2.VERTEX_ATTRIBUTE_READ.value())
    comptime UNIFORM_READ = Self(value = AccessFlagBits2.UNIFORM_READ.value())
    comptime INPUT_ATTACHMENT_READ = Self(value = AccessFlagBits2.INPUT_ATTACHMENT_READ.value())
    comptime SHADER_READ = Self(value = AccessFlagBits2.SHADER_READ.value())
    comptime SHADER_WRITE = Self(value = AccessFlagBits2.SHADER_WRITE.value())
    comptime COLOR_ATTACHMENT_READ = Self(value = AccessFlagBits2.COLOR_ATTACHMENT_READ.value())
    comptime COLOR_ATTACHMENT_WRITE = Self(value = AccessFlagBits2.COLOR_ATTACHMENT_WRITE.value())
    comptime DEPTH_STENCIL_ATTACHMENT_READ = Self(value = AccessFlagBits2.DEPTH_STENCIL_ATTACHMENT_READ.value())
    comptime DEPTH_STENCIL_ATTACHMENT_WRITE = Self(value = AccessFlagBits2.DEPTH_STENCIL_ATTACHMENT_WRITE.value())
    comptime TRANSFER_READ = Self(value = AccessFlagBits2.TRANSFER_READ.value())
    comptime TRANSFER_WRITE = Self(value = AccessFlagBits2.TRANSFER_WRITE.value())
    comptime HOST_READ = Self(value = AccessFlagBits2.HOST_READ.value())
    comptime HOST_WRITE = Self(value = AccessFlagBits2.HOST_WRITE.value())
    comptime MEMORY_READ = Self(value = AccessFlagBits2.MEMORY_READ.value())
    comptime MEMORY_WRITE = Self(value = AccessFlagBits2.MEMORY_WRITE.value())
    comptime COLOR_ATTACHMENT_READ_NONCOHERENT = Self(value = AccessFlagBits2.COLOR_ATTACHMENT_READ_NONCOHERENT.value())
    comptime CONDITIONAL_RENDERING_READ = Self(value = AccessFlagBits2.CONDITIONAL_RENDERING_READ.value())
    comptime ACCELERATION_STRUCTURE_READ = Self(value = AccessFlagBits2.ACCELERATION_STRUCTURE_READ.value())
    comptime ACCELERATION_STRUCTURE_WRITE = Self(value = AccessFlagBits2.ACCELERATION_STRUCTURE_WRITE.value())
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT_READ = Self(value = AccessFlagBits2.FRAGMENT_SHADING_RATE_ATTACHMENT_READ.value())
    comptime FRAGMENT_DENSITY_MAP_READ = Self(value = AccessFlagBits2.FRAGMENT_DENSITY_MAP_READ.value())
    comptime TRANSFORM_FEEDBACK_WRITE = Self(value = AccessFlagBits2.TRANSFORM_FEEDBACK_WRITE.value())
    comptime TRANSFORM_FEEDBACK_COUNTER_READ = Self(value = AccessFlagBits2.TRANSFORM_FEEDBACK_COUNTER_READ.value())
    comptime TRANSFORM_FEEDBACK_COUNTER_WRITE = Self(value = AccessFlagBits2.TRANSFORM_FEEDBACK_COUNTER_WRITE.value())
    comptime SHADER_SAMPLED_READ = Self(value = AccessFlagBits2.SHADER_SAMPLED_READ.value())
    comptime SHADER_STORAGE_READ = Self(value = AccessFlagBits2.SHADER_STORAGE_READ.value())
    comptime SHADER_STORAGE_WRITE = Self(value = AccessFlagBits2.SHADER_STORAGE_WRITE.value())
    comptime VIDEO_DECODE_READ = Self(value = AccessFlagBits2.VIDEO_DECODE_READ.value())
    comptime VIDEO_DECODE_WRITE = Self(value = AccessFlagBits2.VIDEO_DECODE_WRITE.value())
    comptime VIDEO_ENCODE_READ = Self(value = AccessFlagBits2.VIDEO_ENCODE_READ.value())
    comptime VIDEO_ENCODE_WRITE = Self(value = AccessFlagBits2.VIDEO_ENCODE_WRITE.value())
    comptime INVOCATION_MASK_READ = Self(value = AccessFlagBits2.INVOCATION_MASK_READ.value())
    comptime SHADER_BINDING_TABLE_READ = Self(value = AccessFlagBits2.SHADER_BINDING_TABLE_READ.value())
    comptime DESCRIPTOR_BUFFER_READ = Self(value = AccessFlagBits2.DESCRIPTOR_BUFFER_READ.value())
    comptime OPTICAL_FLOW_READ = Self(value = AccessFlagBits2.OPTICAL_FLOW_READ.value())
    comptime OPTICAL_FLOW_WRITE = Self(value = AccessFlagBits2.OPTICAL_FLOW_WRITE.value())
    comptime MICROMAP_READ = Self(value = AccessFlagBits2.MICROMAP_READ.value())
    comptime MICROMAP_WRITE = Self(value = AccessFlagBits2.MICROMAP_WRITE.value())
    comptime RESERVED_46 = Self(value = AccessFlagBits2.RESERVED_46.value())
    comptime DATA_GRAPH_READ = Self(value = AccessFlagBits2.DATA_GRAPH_READ.value())
    comptime DATA_GRAPH_WRITE = Self(value = AccessFlagBits2.DATA_GRAPH_WRITE.value())
    comptime RESERVED_49 = Self(value = AccessFlagBits2.RESERVED_49.value())
    comptime RESERVED_50 = Self(value = AccessFlagBits2.RESERVED_50.value())
    comptime SHADER_TILE_ATTACHMENT_READ = Self(value = AccessFlagBits2.SHADER_TILE_ATTACHMENT_READ.value())
    comptime SHADER_TILE_ATTACHMENT_WRITE = Self(value = AccessFlagBits2.SHADER_TILE_ATTACHMENT_WRITE.value())
    comptime RESERVED_55 = Self(value = AccessFlagBits2.RESERVED_55.value())
    comptime RESERVED_56 = Self(value = AccessFlagBits2.RESERVED_56.value())
    comptime RESERVED_57 = Self(value = AccessFlagBits2.RESERVED_57.value())
    comptime RESERVED_58 = Self(value = AccessFlagBits2.RESERVED_58.value())
    comptime RESERVED_59 = Self(value = AccessFlagBits2.RESERVED_59.value())
    comptime RESERVED_60 = Self(value = AccessFlagBits2.RESERVED_60.value())
    comptime RESERVED_61 = Self(value = AccessFlagBits2.RESERVED_61.value())


@register_passable("trivial")
struct AccessFlagBits2(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AccessFlags2:
        return AccessFlags2(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime INDIRECT_COMMAND_READ = Self(value = 1 << 0)
    comptime INDEX_READ = Self(value = 1 << 1)
    comptime VERTEX_ATTRIBUTE_READ = Self(value = 1 << 2)
    comptime UNIFORM_READ = Self(value = 1 << 3)
    comptime INPUT_ATTACHMENT_READ = Self(value = 1 << 4)
    comptime SHADER_READ = Self(value = 1 << 5)
    comptime SHADER_WRITE = Self(value = 1 << 6)
    comptime COLOR_ATTACHMENT_READ = Self(value = 1 << 7)
    comptime COLOR_ATTACHMENT_WRITE = Self(value = 1 << 8)
    comptime DEPTH_STENCIL_ATTACHMENT_READ = Self(value = 1 << 9)
    comptime DEPTH_STENCIL_ATTACHMENT_WRITE = Self(value = 1 << 10)
    comptime TRANSFER_READ = Self(value = 1 << 11)
    comptime TRANSFER_WRITE = Self(value = 1 << 12)
    comptime HOST_READ = Self(value = 1 << 13)
    comptime HOST_WRITE = Self(value = 1 << 14)
    comptime MEMORY_READ = Self(value = 1 << 15)
    comptime MEMORY_WRITE = Self(value = 1 << 16)
    comptime COLOR_ATTACHMENT_READ_NONCOHERENT = Self(value = 1 << 19)
    comptime CONDITIONAL_RENDERING_READ = Self(value = 1 << 20)
    comptime ACCELERATION_STRUCTURE_READ = Self(value = 1 << 21)
    comptime ACCELERATION_STRUCTURE_WRITE = Self(value = 1 << 22)
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT_READ = Self(value = 1 << 23)
    comptime FRAGMENT_DENSITY_MAP_READ = Self(value = 1 << 24)
    comptime TRANSFORM_FEEDBACK_WRITE = Self(value = 1 << 25)
    comptime TRANSFORM_FEEDBACK_COUNTER_READ = Self(value = 1 << 26)
    comptime TRANSFORM_FEEDBACK_COUNTER_WRITE = Self(value = 1 << 27)
    comptime SHADER_SAMPLED_READ = Self(value = 1 << 32)
    comptime SHADER_STORAGE_READ = Self(value = 1 << 33)
    comptime SHADER_STORAGE_WRITE = Self(value = 1 << 34)
    comptime VIDEO_DECODE_READ = Self(value = 1 << 35)
    comptime VIDEO_DECODE_WRITE = Self(value = 1 << 36)
    comptime VIDEO_ENCODE_READ = Self(value = 1 << 37)
    comptime VIDEO_ENCODE_WRITE = Self(value = 1 << 38)
    comptime INVOCATION_MASK_READ = Self(value = 1 << 39)
    comptime SHADER_BINDING_TABLE_READ = Self(value = 1 << 40)
    comptime DESCRIPTOR_BUFFER_READ = Self(value = 1 << 41)
    comptime OPTICAL_FLOW_READ = Self(value = 1 << 42)
    comptime OPTICAL_FLOW_WRITE = Self(value = 1 << 43)
    comptime MICROMAP_READ = Self(value = 1 << 44)
    comptime MICROMAP_WRITE = Self(value = 1 << 45)
    comptime RESERVED_46 = Self(value = 1 << 46)
    comptime DATA_GRAPH_READ = Self(value = 1 << 47)
    comptime DATA_GRAPH_WRITE = Self(value = 1 << 48)
    comptime RESERVED_49 = Self(value = 1 << 49)
    comptime RESERVED_50 = Self(value = 1 << 50)
    comptime SHADER_TILE_ATTACHMENT_READ = Self(value = 1 << 51)
    comptime SHADER_TILE_ATTACHMENT_WRITE = Self(value = 1 << 52)
    comptime RESERVED_55 = Self(value = 1 << 55)
    comptime RESERVED_56 = Self(value = 1 << 56)
    comptime RESERVED_57 = Self(value = 1 << 57)
    comptime RESERVED_58 = Self(value = 1 << 58)
    comptime RESERVED_59 = Self(value = 1 << 59)
    comptime RESERVED_60 = Self(value = 1 << 60)
    comptime RESERVED_61 = Self(value = 1 << 61)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineStageFlags2) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineStageFlags2) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineStageFlags2) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineStageFlags2) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineStageFlags2) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineStageFlags2) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineStageFlags2) -> Bool:
        return self & other == other

    comptime NONE = Self(value = PipelineStageFlagBits2.NONE.value())
    comptime TOP_OF_PIPE = Self(value = PipelineStageFlagBits2.TOP_OF_PIPE.value())
    comptime DRAW_INDIRECT = Self(value = PipelineStageFlagBits2.DRAW_INDIRECT.value())
    comptime VERTEX_INPUT = Self(value = PipelineStageFlagBits2.VERTEX_INPUT.value())
    comptime VERTEX_SHADER = Self(value = PipelineStageFlagBits2.VERTEX_SHADER.value())
    comptime TESSELLATION_CONTROL_SHADER = Self(value = PipelineStageFlagBits2.TESSELLATION_CONTROL_SHADER.value())
    comptime TESSELLATION_EVALUATION_SHADER = Self(value = PipelineStageFlagBits2.TESSELLATION_EVALUATION_SHADER.value())
    comptime GEOMETRY_SHADER = Self(value = PipelineStageFlagBits2.GEOMETRY_SHADER.value())
    comptime FRAGMENT_SHADER = Self(value = PipelineStageFlagBits2.FRAGMENT_SHADER.value())
    comptime EARLY_FRAGMENT_TESTS = Self(value = PipelineStageFlagBits2.EARLY_FRAGMENT_TESTS.value())
    comptime LATE_FRAGMENT_TESTS = Self(value = PipelineStageFlagBits2.LATE_FRAGMENT_TESTS.value())
    comptime COLOR_ATTACHMENT_OUTPUT = Self(value = PipelineStageFlagBits2.COLOR_ATTACHMENT_OUTPUT.value())
    comptime COMPUTE_SHADER = Self(value = PipelineStageFlagBits2.COMPUTE_SHADER.value())
    comptime ALL_TRANSFER = Self(value = PipelineStageFlagBits2.ALL_TRANSFER.value())
    comptime BOTTOM_OF_PIPE = Self(value = PipelineStageFlagBits2.BOTTOM_OF_PIPE.value())
    comptime HOST = Self(value = PipelineStageFlagBits2.HOST.value())
    comptime ALL_GRAPHICS = Self(value = PipelineStageFlagBits2.ALL_GRAPHICS.value())
    comptime ALL_COMMANDS = Self(value = PipelineStageFlagBits2.ALL_COMMANDS.value())
    comptime CONDITIONAL_RENDERING = Self(value = PipelineStageFlagBits2.CONDITIONAL_RENDERING.value())
    comptime RAY_TRACING_SHADER = Self(value = PipelineStageFlagBits2.RAY_TRACING_SHADER.value())
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = PipelineStageFlagBits2.FRAGMENT_SHADING_RATE_ATTACHMENT.value())
    comptime FRAGMENT_DENSITY_PROCESS = Self(value = PipelineStageFlagBits2.FRAGMENT_DENSITY_PROCESS.value())
    comptime TRANSFORM_FEEDBACK = Self(value = PipelineStageFlagBits2.TRANSFORM_FEEDBACK.value())
    comptime ACCELERATION_STRUCTURE_BUILD = Self(value = PipelineStageFlagBits2.ACCELERATION_STRUCTURE_BUILD.value())
    comptime VIDEO_DECODE = Self(value = PipelineStageFlagBits2.VIDEO_DECODE.value())
    comptime VIDEO_ENCODE = Self(value = PipelineStageFlagBits2.VIDEO_ENCODE.value())
    comptime ACCELERATION_STRUCTURE_COPY = Self(value = PipelineStageFlagBits2.ACCELERATION_STRUCTURE_COPY.value())
    comptime OPTICAL_FLOW = Self(value = PipelineStageFlagBits2.OPTICAL_FLOW.value())
    comptime MICROMAP_BUILD = Self(value = PipelineStageFlagBits2.MICROMAP_BUILD.value())
    comptime COPY = Self(value = PipelineStageFlagBits2.COPY.value())
    comptime RESOLVE = Self(value = PipelineStageFlagBits2.RESOLVE.value())
    comptime BLIT = Self(value = PipelineStageFlagBits2.BLIT.value())
    comptime CLEAR = Self(value = PipelineStageFlagBits2.CLEAR.value())
    comptime INDEX_INPUT = Self(value = PipelineStageFlagBits2.INDEX_INPUT.value())
    comptime VERTEX_ATTRIBUTE_INPUT = Self(value = PipelineStageFlagBits2.VERTEX_ATTRIBUTE_INPUT.value())
    comptime PRE_RASTERIZATION_SHADERS = Self(value = PipelineStageFlagBits2.PRE_RASTERIZATION_SHADERS.value())
    comptime SUBPASS_SHADER = Self(value = PipelineStageFlagBits2.SUBPASS_SHADER.value())
    comptime INVOCATION_MASK = Self(value = PipelineStageFlagBits2.INVOCATION_MASK.value())
    comptime CLUSTER_CULLING_SHADER = Self(value = PipelineStageFlagBits2.CLUSTER_CULLING_SHADER.value())
    comptime DATA_GRAPH = Self(value = PipelineStageFlagBits2.DATA_GRAPH.value())
    comptime RESERVED_43 = Self(value = PipelineStageFlagBits2.RESERVED_43.value())
    comptime CONVERT_COOPERATIVE_VECTOR_MATRIX = Self(value = PipelineStageFlagBits2.CONVERT_COOPERATIVE_VECTOR_MATRIX.value())
    comptime RESERVED_45 = Self(value = PipelineStageFlagBits2.RESERVED_45.value())
    comptime RESERVED_46 = Self(value = PipelineStageFlagBits2.RESERVED_46.value())
    comptime RESERVED_47 = Self(value = PipelineStageFlagBits2.RESERVED_47.value())


@register_passable("trivial")
struct PipelineStageFlagBits2(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineStageFlags2:
        return PipelineStageFlags2(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime TOP_OF_PIPE = Self(value = 1 << 0)
    comptime DRAW_INDIRECT = Self(value = 1 << 1)
    comptime VERTEX_INPUT = Self(value = 1 << 2)
    comptime VERTEX_SHADER = Self(value = 1 << 3)
    comptime TESSELLATION_CONTROL_SHADER = Self(value = 1 << 4)
    comptime TESSELLATION_EVALUATION_SHADER = Self(value = 1 << 5)
    comptime GEOMETRY_SHADER = Self(value = 1 << 6)
    comptime FRAGMENT_SHADER = Self(value = 1 << 7)
    comptime EARLY_FRAGMENT_TESTS = Self(value = 1 << 8)
    comptime LATE_FRAGMENT_TESTS = Self(value = 1 << 9)
    comptime COLOR_ATTACHMENT_OUTPUT = Self(value = 1 << 10)
    comptime COMPUTE_SHADER = Self(value = 1 << 11)
    comptime ALL_TRANSFER = Self(value = 1 << 12)
    comptime BOTTOM_OF_PIPE = Self(value = 1 << 13)
    comptime HOST = Self(value = 1 << 14)
    comptime ALL_GRAPHICS = Self(value = 1 << 15)
    comptime ALL_COMMANDS = Self(value = 1 << 16)
    comptime CONDITIONAL_RENDERING = Self(value = 1 << 18)
    comptime RAY_TRACING_SHADER = Self(value = 1 << 21)
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = 1 << 22)
    comptime FRAGMENT_DENSITY_PROCESS = Self(value = 1 << 23)
    comptime TRANSFORM_FEEDBACK = Self(value = 1 << 24)
    comptime ACCELERATION_STRUCTURE_BUILD = Self(value = 1 << 25)
    comptime VIDEO_DECODE = Self(value = 1 << 26)
    comptime VIDEO_ENCODE = Self(value = 1 << 27)
    comptime ACCELERATION_STRUCTURE_COPY = Self(value = 1 << 28)
    comptime OPTICAL_FLOW = Self(value = 1 << 29)
    comptime MICROMAP_BUILD = Self(value = 1 << 30)
    comptime COPY = Self(value = 1 << 32)
    comptime RESOLVE = Self(value = 1 << 33)
    comptime BLIT = Self(value = 1 << 34)
    comptime CLEAR = Self(value = 1 << 35)
    comptime INDEX_INPUT = Self(value = 1 << 36)
    comptime VERTEX_ATTRIBUTE_INPUT = Self(value = 1 << 37)
    comptime PRE_RASTERIZATION_SHADERS = Self(value = 1 << 38)
    comptime SUBPASS_SHADER = Self(value = 1 << 39)
    comptime INVOCATION_MASK = Self(value = 1 << 40)
    comptime CLUSTER_CULLING_SHADER = Self(value = 1 << 41)
    comptime DATA_GRAPH = Self(value = 1 << 42)
    comptime RESERVED_43 = Self(value = 1 << 43)
    comptime CONVERT_COOPERATIVE_VECTOR_MATRIX = Self(value = 1 << 44)
    comptime RESERVED_45 = Self(value = 1 << 45)
    comptime RESERVED_46 = Self(value = 1 << 46)
    comptime RESERVED_47 = Self(value = 1 << 47)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: AccelerationStructureMotionInfoFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: AccelerationStructureMotionInfoFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: AccelerationStructureMotionInfoFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: AccelerationStructureMotionInfoFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: AccelerationStructureMotionInfoFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: AccelerationStructureMotionInfoFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: AccelerationStructureMotionInfoFlagsNV) -> Bool:
        return self & other == other


@register_passable("trivial")
struct AccelerationStructureMotionInfoFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AccelerationStructureMotionInfoFlagsNV:
        return AccelerationStructureMotionInfoFlagsNV(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: AccelerationStructureMotionInstanceFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: AccelerationStructureMotionInstanceFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: AccelerationStructureMotionInstanceFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: AccelerationStructureMotionInstanceFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: AccelerationStructureMotionInstanceFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: AccelerationStructureMotionInstanceFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: AccelerationStructureMotionInstanceFlagsNV) -> Bool:
        return self & other == other


@register_passable("trivial")
struct AccelerationStructureMotionInstanceFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AccelerationStructureMotionInstanceFlagsNV:
        return AccelerationStructureMotionInstanceFlagsNV(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: FormatFeatureFlags2) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: FormatFeatureFlags2) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: FormatFeatureFlags2) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: FormatFeatureFlags2) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: FormatFeatureFlags2) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: FormatFeatureFlags2) -> Bool:
        return self & other == self

    fn is_superset(self, other: FormatFeatureFlags2) -> Bool:
        return self & other == other

    comptime SAMPLED_IMAGE = Self(value = FormatFeatureFlagBits2.SAMPLED_IMAGE.value())
    comptime STORAGE_IMAGE = Self(value = FormatFeatureFlagBits2.STORAGE_IMAGE.value())
    comptime STORAGE_IMAGE_ATOMIC = Self(value = FormatFeatureFlagBits2.STORAGE_IMAGE_ATOMIC.value())
    comptime UNIFORM_TEXEL_BUFFER = Self(value = FormatFeatureFlagBits2.UNIFORM_TEXEL_BUFFER.value())
    comptime STORAGE_TEXEL_BUFFER = Self(value = FormatFeatureFlagBits2.STORAGE_TEXEL_BUFFER.value())
    comptime STORAGE_TEXEL_BUFFER_ATOMIC = Self(value = FormatFeatureFlagBits2.STORAGE_TEXEL_BUFFER_ATOMIC.value())
    comptime VERTEX_BUFFER = Self(value = FormatFeatureFlagBits2.VERTEX_BUFFER.value())
    comptime COLOR_ATTACHMENT = Self(value = FormatFeatureFlagBits2.COLOR_ATTACHMENT.value())
    comptime COLOR_ATTACHMENT_BLEND = Self(value = FormatFeatureFlagBits2.COLOR_ATTACHMENT_BLEND.value())
    comptime DEPTH_STENCIL_ATTACHMENT = Self(value = FormatFeatureFlagBits2.DEPTH_STENCIL_ATTACHMENT.value())
    comptime BLIT_SRC = Self(value = FormatFeatureFlagBits2.BLIT_SRC.value())
    comptime BLIT_DST = Self(value = FormatFeatureFlagBits2.BLIT_DST.value())
    comptime SAMPLED_IMAGE_FILTER_LINEAR = Self(value = FormatFeatureFlagBits2.SAMPLED_IMAGE_FILTER_LINEAR.value())
    comptime SAMPLED_IMAGE_FILTER_CUBIC = Self(value = FormatFeatureFlagBits2.SAMPLED_IMAGE_FILTER_CUBIC.value())
    comptime TRANSFER_SRC = Self(value = FormatFeatureFlagBits2.TRANSFER_SRC.value())
    comptime TRANSFER_DST = Self(value = FormatFeatureFlagBits2.TRANSFER_DST.value())
    comptime SAMPLED_IMAGE_FILTER_MINMAX = Self(value = FormatFeatureFlagBits2.SAMPLED_IMAGE_FILTER_MINMAX.value())
    comptime MIDPOINT_CHROMA_SAMPLES = Self(value = FormatFeatureFlagBits2.MIDPOINT_CHROMA_SAMPLES.value())
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER = Self(value = FormatFeatureFlagBits2.SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER.value())
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER = Self(value = FormatFeatureFlagBits2.SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER.value())
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT = Self(value = FormatFeatureFlagBits2.SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT.value())
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE = Self(value = FormatFeatureFlagBits2.SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE.value())
    comptime DISJOINT = Self(value = FormatFeatureFlagBits2.DISJOINT.value())
    comptime COSITED_CHROMA_SAMPLES = Self(value = FormatFeatureFlagBits2.COSITED_CHROMA_SAMPLES.value())
    comptime FRAGMENT_DENSITY_MAP = Self(value = FormatFeatureFlagBits2.FRAGMENT_DENSITY_MAP.value())
    comptime VIDEO_DECODE_OUTPUT = Self(value = FormatFeatureFlagBits2.VIDEO_DECODE_OUTPUT.value())
    comptime VIDEO_DECODE_DPB = Self(value = FormatFeatureFlagBits2.VIDEO_DECODE_DPB.value())
    comptime VIDEO_ENCODE_INPUT = Self(value = FormatFeatureFlagBits2.VIDEO_ENCODE_INPUT.value())
    comptime VIDEO_ENCODE_DPB = Self(value = FormatFeatureFlagBits2.VIDEO_ENCODE_DPB.value())
    comptime ACCELERATION_STRUCTURE_VERTEX_BUFFER = Self(value = FormatFeatureFlagBits2.ACCELERATION_STRUCTURE_VERTEX_BUFFER.value())
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = FormatFeatureFlagBits2.FRAGMENT_SHADING_RATE_ATTACHMENT.value())
    comptime STORAGE_READ_WITHOUT_FORMAT = Self(value = FormatFeatureFlagBits2.STORAGE_READ_WITHOUT_FORMAT.value())
    comptime STORAGE_WRITE_WITHOUT_FORMAT = Self(value = FormatFeatureFlagBits2.STORAGE_WRITE_WITHOUT_FORMAT.value())
    comptime SAMPLED_IMAGE_DEPTH_COMPARISON = Self(value = FormatFeatureFlagBits2.SAMPLED_IMAGE_DEPTH_COMPARISON.value())
    comptime WEIGHT_IMAGE = Self(value = FormatFeatureFlagBits2.WEIGHT_IMAGE.value())
    comptime WEIGHT_SAMPLED_IMAGE = Self(value = FormatFeatureFlagBits2.WEIGHT_SAMPLED_IMAGE.value())
    comptime BLOCK_MATCHING = Self(value = FormatFeatureFlagBits2.BLOCK_MATCHING.value())
    comptime BOX_FILTER_SAMPLED = Self(value = FormatFeatureFlagBits2.BOX_FILTER_SAMPLED.value())
    comptime LINEAR_COLOR_ATTACHMENT = Self(value = FormatFeatureFlagBits2.LINEAR_COLOR_ATTACHMENT.value())
    comptime TENSOR_SHADER = Self(value = FormatFeatureFlagBits2.TENSOR_SHADER.value())
    comptime OPTICAL_FLOW_IMAGE = Self(value = FormatFeatureFlagBits2.OPTICAL_FLOW_IMAGE.value())
    comptime OPTICAL_FLOW_VECTOR = Self(value = FormatFeatureFlagBits2.OPTICAL_FLOW_VECTOR.value())
    comptime OPTICAL_FLOW_COST = Self(value = FormatFeatureFlagBits2.OPTICAL_FLOW_COST.value())
    comptime TENSOR_IMAGE_ALIASING = Self(value = FormatFeatureFlagBits2.TENSOR_IMAGE_ALIASING.value())
    comptime HOST_IMAGE_TRANSFER = Self(value = FormatFeatureFlagBits2.HOST_IMAGE_TRANSFER.value())
    comptime RESERVED_47 = Self(value = FormatFeatureFlagBits2.RESERVED_47.value())
    comptime TENSOR_DATA_GRAPH = Self(value = FormatFeatureFlagBits2.TENSOR_DATA_GRAPH.value())
    comptime VIDEO_ENCODE_QUANTIZATION_DELTA_MAP = Self(value = FormatFeatureFlagBits2.VIDEO_ENCODE_QUANTIZATION_DELTA_MAP.value())
    comptime VIDEO_ENCODE_EMPHASIS_MAP = Self(value = FormatFeatureFlagBits2.VIDEO_ENCODE_EMPHASIS_MAP.value())
    comptime ACCELERATION_STRUCTURE_RADIUS_BUFFER = Self(value = FormatFeatureFlagBits2.ACCELERATION_STRUCTURE_RADIUS_BUFFER.value())
    comptime RESERVED_52 = Self(value = FormatFeatureFlagBits2.RESERVED_52.value())
    comptime RESERVED_53 = Self(value = FormatFeatureFlagBits2.RESERVED_53.value())
    comptime RESERVED_54 = Self(value = FormatFeatureFlagBits2.RESERVED_54.value())
    comptime RESERVED_55 = Self(value = FormatFeatureFlagBits2.RESERVED_55.value())
    comptime RESERVED_56 = Self(value = FormatFeatureFlagBits2.RESERVED_56.value())
    comptime RESERVED_57 = Self(value = FormatFeatureFlagBits2.RESERVED_57.value())
    comptime RESERVED_58 = Self(value = FormatFeatureFlagBits2.RESERVED_58.value())
    comptime RESERVED_59 = Self(value = FormatFeatureFlagBits2.RESERVED_59.value())
    comptime RESERVED_60 = Self(value = FormatFeatureFlagBits2.RESERVED_60.value())


@register_passable("trivial")
struct FormatFeatureFlagBits2(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> FormatFeatureFlags2:
        return FormatFeatureFlags2(value = self._value | other._value)

    comptime SAMPLED_IMAGE = Self(value = 1 << 0)
    comptime STORAGE_IMAGE = Self(value = 1 << 1)
    comptime STORAGE_IMAGE_ATOMIC = Self(value = 1 << 2)
    comptime UNIFORM_TEXEL_BUFFER = Self(value = 1 << 3)
    comptime STORAGE_TEXEL_BUFFER = Self(value = 1 << 4)
    comptime STORAGE_TEXEL_BUFFER_ATOMIC = Self(value = 1 << 5)
    comptime VERTEX_BUFFER = Self(value = 1 << 6)
    comptime COLOR_ATTACHMENT = Self(value = 1 << 7)
    comptime COLOR_ATTACHMENT_BLEND = Self(value = 1 << 8)
    comptime DEPTH_STENCIL_ATTACHMENT = Self(value = 1 << 9)
    comptime BLIT_SRC = Self(value = 1 << 10)
    comptime BLIT_DST = Self(value = 1 << 11)
    comptime SAMPLED_IMAGE_FILTER_LINEAR = Self(value = 1 << 12)
    comptime SAMPLED_IMAGE_FILTER_CUBIC = Self(value = 1 << 13)
    comptime TRANSFER_SRC = Self(value = 1 << 14)
    comptime TRANSFER_DST = Self(value = 1 << 15)
    comptime SAMPLED_IMAGE_FILTER_MINMAX = Self(value = 1 << 16)
    comptime MIDPOINT_CHROMA_SAMPLES = Self(value = 1 << 17)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_LINEAR_FILTER = Self(value = 1 << 18)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_SEPARATE_RECONSTRUCTION_FILTER = Self(value = 1 << 19)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT = Self(value = 1 << 20)
    comptime SAMPLED_IMAGE_YCBCR_CONVERSION_CHROMA_RECONSTRUCTION_EXPLICIT_FORCEABLE = Self(value = 1 << 21)
    comptime DISJOINT = Self(value = 1 << 22)
    comptime COSITED_CHROMA_SAMPLES = Self(value = 1 << 23)
    comptime FRAGMENT_DENSITY_MAP = Self(value = 1 << 24)
    comptime VIDEO_DECODE_OUTPUT = Self(value = 1 << 25)
    comptime VIDEO_DECODE_DPB = Self(value = 1 << 26)
    comptime VIDEO_ENCODE_INPUT = Self(value = 1 << 27)
    comptime VIDEO_ENCODE_DPB = Self(value = 1 << 28)
    comptime ACCELERATION_STRUCTURE_VERTEX_BUFFER = Self(value = 1 << 29)
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = 1 << 30)
    comptime STORAGE_READ_WITHOUT_FORMAT = Self(value = 1 << 31)
    comptime STORAGE_WRITE_WITHOUT_FORMAT = Self(value = 1 << 32)
    comptime SAMPLED_IMAGE_DEPTH_COMPARISON = Self(value = 1 << 33)
    comptime WEIGHT_IMAGE = Self(value = 1 << 34)
    comptime WEIGHT_SAMPLED_IMAGE = Self(value = 1 << 35)
    comptime BLOCK_MATCHING = Self(value = 1 << 36)
    comptime BOX_FILTER_SAMPLED = Self(value = 1 << 37)
    comptime LINEAR_COLOR_ATTACHMENT = Self(value = 1 << 38)
    comptime TENSOR_SHADER = Self(value = 1 << 39)
    comptime OPTICAL_FLOW_IMAGE = Self(value = 1 << 40)
    comptime OPTICAL_FLOW_VECTOR = Self(value = 1 << 41)
    comptime OPTICAL_FLOW_COST = Self(value = 1 << 42)
    comptime TENSOR_IMAGE_ALIASING = Self(value = 1 << 43)
    comptime HOST_IMAGE_TRANSFER = Self(value = 1 << 46)
    comptime RESERVED_47 = Self(value = 1 << 47)
    comptime TENSOR_DATA_GRAPH = Self(value = 1 << 48)
    comptime VIDEO_ENCODE_QUANTIZATION_DELTA_MAP = Self(value = 1 << 49)
    comptime VIDEO_ENCODE_EMPHASIS_MAP = Self(value = 1 << 50)
    comptime ACCELERATION_STRUCTURE_RADIUS_BUFFER = Self(value = 1 << 51)
    comptime RESERVED_52 = Self(value = 1 << 52)
    comptime RESERVED_53 = Self(value = 1 << 53)
    comptime RESERVED_54 = Self(value = 1 << 54)
    comptime RESERVED_55 = Self(value = 1 << 55)
    comptime RESERVED_56 = Self(value = 1 << 56)
    comptime RESERVED_57 = Self(value = 1 << 57)
    comptime RESERVED_58 = Self(value = 1 << 58)
    comptime RESERVED_59 = Self(value = 1 << 59)
    comptime RESERVED_60 = Self(value = 1 << 60)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: RenderingFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: RenderingFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: RenderingFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: RenderingFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: RenderingFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: RenderingFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: RenderingFlags) -> Bool:
        return self & other == other

    comptime CONTENTS_SECONDARY_COMMAND_BUFFERS = Self(value = RenderingFlagBits.CONTENTS_SECONDARY_COMMAND_BUFFERS.value())
    comptime SUSPENDING = Self(value = RenderingFlagBits.SUSPENDING.value())
    comptime RESUMING = Self(value = RenderingFlagBits.RESUMING.value())
    comptime ENABLE_LEGACY_DITHERING = Self(value = RenderingFlagBits.ENABLE_LEGACY_DITHERING.value())
    comptime PER_LAYER_FRAGMENT_DENSITY = Self(value = RenderingFlagBits.PER_LAYER_FRAGMENT_DENSITY.value())
    comptime RESERVED_6 = Self(value = RenderingFlagBits.RESERVED_6.value())
    comptime RESERVED_7 = Self(value = RenderingFlagBits.RESERVED_7.value())
    comptime RESERVED_8 = Self(value = RenderingFlagBits.RESERVED_8.value())
    comptime RESERVED_9 = Self(value = RenderingFlagBits.RESERVED_9.value())


@register_passable("trivial")
struct RenderingFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> RenderingFlags:
        return RenderingFlags(value = self._value | other._value)

    comptime CONTENTS_SECONDARY_COMMAND_BUFFERS = Self(value = 1 << 0)
    comptime SUSPENDING = Self(value = 1 << 1)
    comptime RESUMING = Self(value = 1 << 2)
    comptime ENABLE_LEGACY_DITHERING = Self(value = 1 << 3)
    comptime PER_LAYER_FRAGMENT_DENSITY = Self(value = 1 << 5)
    comptime RESERVED_6 = Self(value = 1 << 6)
    comptime RESERVED_7 = Self(value = 1 << 7)
    comptime RESERVED_8 = Self(value = 1 << 8)
    comptime RESERVED_9 = Self(value = 1 << 9)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: MemoryDecompressionMethodFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: MemoryDecompressionMethodFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: MemoryDecompressionMethodFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: MemoryDecompressionMethodFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: MemoryDecompressionMethodFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: MemoryDecompressionMethodFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: MemoryDecompressionMethodFlagsNV) -> Bool:
        return self & other == other

    comptime GDEFLATE_1_0 = Self(value = MemoryDecompressionMethodFlagBitsNV.GDEFLATE_1_0.value())


@register_passable("trivial")
struct MemoryDecompressionMethodFlagBitsNV(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MemoryDecompressionMethodFlagsNV:
        return MemoryDecompressionMethodFlagsNV(value = self._value | other._value)

    comptime GDEFLATE_1_0 = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: BuildMicromapFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: BuildMicromapFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: BuildMicromapFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: BuildMicromapFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: BuildMicromapFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: BuildMicromapFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: BuildMicromapFlagsEXT) -> Bool:
        return self & other == other

    comptime PREFER_FAST_TRACE = Self(value = BuildMicromapFlagBitsEXT.PREFER_FAST_TRACE.value())
    comptime PREFER_FAST_BUILD = Self(value = BuildMicromapFlagBitsEXT.PREFER_FAST_BUILD.value())
    comptime ALLOW_COMPACTION = Self(value = BuildMicromapFlagBitsEXT.ALLOW_COMPACTION.value())


@register_passable("trivial")
struct BuildMicromapFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> BuildMicromapFlagsEXT:
        return BuildMicromapFlagsEXT(value = self._value | other._value)

    comptime PREFER_FAST_TRACE = Self(value = 1 << 0)
    comptime PREFER_FAST_BUILD = Self(value = 1 << 1)
    comptime ALLOW_COMPACTION = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: MicromapCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: MicromapCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: MicromapCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: MicromapCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: MicromapCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: MicromapCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: MicromapCreateFlagsEXT) -> Bool:
        return self & other == other

    comptime DEVICE_ADDRESS_CAPTURE_REPLAY = Self(value = MicromapCreateFlagBitsEXT.DEVICE_ADDRESS_CAPTURE_REPLAY.value())


@register_passable("trivial")
struct MicromapCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MicromapCreateFlagsEXT:
        return MicromapCreateFlagsEXT(value = self._value | other._value)

    comptime DEVICE_ADDRESS_CAPTURE_REPLAY = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: IndirectCommandsLayoutUsageFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: IndirectCommandsLayoutUsageFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: IndirectCommandsLayoutUsageFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: IndirectCommandsLayoutUsageFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: IndirectCommandsLayoutUsageFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: IndirectCommandsLayoutUsageFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: IndirectCommandsLayoutUsageFlagsEXT) -> Bool:
        return self & other == other

    comptime EXPLICIT_PREPROCESS = Self(value = IndirectCommandsLayoutUsageFlagBitsEXT.EXPLICIT_PREPROCESS.value())
    comptime UNORDERED_SEQUENCES = Self(value = IndirectCommandsLayoutUsageFlagBitsEXT.UNORDERED_SEQUENCES.value())


@register_passable("trivial")
struct IndirectCommandsLayoutUsageFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> IndirectCommandsLayoutUsageFlagsEXT:
        return IndirectCommandsLayoutUsageFlagsEXT(value = self._value | other._value)

    comptime EXPLICIT_PREPROCESS = Self(value = 1 << 0)
    comptime UNORDERED_SEQUENCES = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: IndirectCommandsInputModeFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: IndirectCommandsInputModeFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: IndirectCommandsInputModeFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: IndirectCommandsInputModeFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: IndirectCommandsInputModeFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: IndirectCommandsInputModeFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: IndirectCommandsInputModeFlagsEXT) -> Bool:
        return self & other == other

    comptime VULKAN_INDEX_BUFFER = Self(value = IndirectCommandsInputModeFlagBitsEXT.VULKAN_INDEX_BUFFER.value())
    comptime DXGI_INDEX_BUFFER = Self(value = IndirectCommandsInputModeFlagBitsEXT.DXGI_INDEX_BUFFER.value())


@register_passable("trivial")
struct IndirectCommandsInputModeFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> IndirectCommandsInputModeFlagsEXT:
        return IndirectCommandsInputModeFlagsEXT(value = self._value | other._value)

    comptime VULKAN_INDEX_BUFFER = Self(value = 1 << 0)
    comptime DXGI_INDEX_BUFFER = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DirectDriverLoadingFlagsLUNARG) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DirectDriverLoadingFlagsLUNARG) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DirectDriverLoadingFlagsLUNARG) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DirectDriverLoadingFlagsLUNARG) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DirectDriverLoadingFlagsLUNARG) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DirectDriverLoadingFlagsLUNARG) -> Bool:
        return self & other == self

    fn is_superset(self, other: DirectDriverLoadingFlagsLUNARG) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DirectDriverLoadingFlagBitsLUNARG(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DirectDriverLoadingFlagsLUNARG:
        return DirectDriverLoadingFlagsLUNARG(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineCreateFlags2) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineCreateFlags2) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineCreateFlags2) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineCreateFlags2) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineCreateFlags2) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineCreateFlags2) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineCreateFlags2) -> Bool:
        return self & other == other

    comptime DISABLE_OPTIMIZATION = Self(value = PipelineCreateFlagBits2.DISABLE_OPTIMIZATION.value())
    comptime ALLOW_DERIVATIVES = Self(value = PipelineCreateFlagBits2.ALLOW_DERIVATIVES.value())
    comptime DERIVATIVE = Self(value = PipelineCreateFlagBits2.DERIVATIVE.value())
    comptime VIEW_INDEX_FROM_DEVICE_INDEX = Self(value = PipelineCreateFlagBits2.VIEW_INDEX_FROM_DEVICE_INDEX.value())
    comptime DISPATCH_BASE = Self(value = PipelineCreateFlagBits2.DISPATCH_BASE.value())
    comptime DEFER_COMPILE = Self(value = PipelineCreateFlagBits2.DEFER_COMPILE.value())
    comptime CAPTURE_STATISTICS = Self(value = PipelineCreateFlagBits2.CAPTURE_STATISTICS.value())
    comptime CAPTURE_INTERNAL_REPRESENTATIONS = Self(value = PipelineCreateFlagBits2.CAPTURE_INTERNAL_REPRESENTATIONS.value())
    comptime FAIL_ON_PIPELINE_COMPILE_REQUIRED = Self(value = PipelineCreateFlagBits2.FAIL_ON_PIPELINE_COMPILE_REQUIRED.value())
    comptime EARLY_RETURN_ON_FAILURE = Self(value = PipelineCreateFlagBits2.EARLY_RETURN_ON_FAILURE.value())
    comptime LINK_TIME_OPTIMIZATION = Self(value = PipelineCreateFlagBits2.LINK_TIME_OPTIMIZATION.value())
    comptime LIBRARY = Self(value = PipelineCreateFlagBits2.LIBRARY.value())
    comptime RAY_TRACING_SKIP_TRIANGLES = Self(value = PipelineCreateFlagBits2.RAY_TRACING_SKIP_TRIANGLES.value())
    comptime RAY_TRACING_SKIP_AABBS = Self(value = PipelineCreateFlagBits2.RAY_TRACING_SKIP_AABBS.value())
    comptime RAY_TRACING_NO_NULL_ANY_HIT_SHADERS = Self(value = PipelineCreateFlagBits2.RAY_TRACING_NO_NULL_ANY_HIT_SHADERS.value())
    comptime RAY_TRACING_NO_NULL_CLOSEST_HIT_SHADERS = Self(value = PipelineCreateFlagBits2.RAY_TRACING_NO_NULL_CLOSEST_HIT_SHADERS.value())
    comptime RAY_TRACING_NO_NULL_MISS_SHADERS = Self(value = PipelineCreateFlagBits2.RAY_TRACING_NO_NULL_MISS_SHADERS.value())
    comptime RAY_TRACING_NO_NULL_INTERSECTION_SHADERS = Self(value = PipelineCreateFlagBits2.RAY_TRACING_NO_NULL_INTERSECTION_SHADERS.value())
    comptime INDIRECT_BINDABLE = Self(value = PipelineCreateFlagBits2.INDIRECT_BINDABLE.value())
    comptime RAY_TRACING_SHADER_GROUP_HANDLE_CAPTURE_REPLAY = Self(value = PipelineCreateFlagBits2.RAY_TRACING_SHADER_GROUP_HANDLE_CAPTURE_REPLAY.value())
    comptime RAY_TRACING_ALLOW_MOTION = Self(value = PipelineCreateFlagBits2.RAY_TRACING_ALLOW_MOTION.value())
    comptime RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = PipelineCreateFlagBits2.RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT.value())
    comptime RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT = Self(value = PipelineCreateFlagBits2.RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT.value())
    comptime RETAIN_LINK_TIME_OPTIMIZATION_INFO = Self(value = PipelineCreateFlagBits2.RETAIN_LINK_TIME_OPTIMIZATION_INFO.value())
    comptime RAY_TRACING_OPACITY_MICROMAP = Self(value = PipelineCreateFlagBits2.RAY_TRACING_OPACITY_MICROMAP.value())
    comptime COLOR_ATTACHMENT_FEEDBACK_LOOP = Self(value = PipelineCreateFlagBits2.COLOR_ATTACHMENT_FEEDBACK_LOOP.value())
    comptime DEPTH_STENCIL_ATTACHMENT_FEEDBACK_LOOP = Self(value = PipelineCreateFlagBits2.DEPTH_STENCIL_ATTACHMENT_FEEDBACK_LOOP.value())
    comptime NO_PROTECTED_ACCESS = Self(value = PipelineCreateFlagBits2.NO_PROTECTED_ACCESS.value())
    comptime RAY_TRACING_DISPLACEMENT_MICROMAP = Self(value = PipelineCreateFlagBits2.RAY_TRACING_DISPLACEMENT_MICROMAP.value())
    comptime DESCRIPTOR_BUFFER = Self(value = PipelineCreateFlagBits2.DESCRIPTOR_BUFFER.value())
    comptime PROTECTED_ACCESS_ONLY = Self(value = PipelineCreateFlagBits2.PROTECTED_ACCESS_ONLY.value())
    comptime CAPTURE_DATA = Self(value = PipelineCreateFlagBits2.CAPTURE_DATA.value())
    comptime EXECUTION_GRAPH = Self(value = PipelineCreateFlagBits2.EXECUTION_GRAPH.value())
    comptime RAY_TRACING_ALLOW_SPHERES_AND_LINEAR_SWEPT_SPHERES = Self(value = PipelineCreateFlagBits2.RAY_TRACING_ALLOW_SPHERES_AND_LINEAR_SWEPT_SPHERES.value())
    comptime ENABLE_LEGACY_DITHERING = Self(value = PipelineCreateFlagBits2.ENABLE_LEGACY_DITHERING.value())
    comptime RESERVED_35 = Self(value = PipelineCreateFlagBits2.RESERVED_35.value())
    comptime PIPELINE_CREATE_RESERVED_36 = Self(value = PipelineCreateFlagBits2.PIPELINE_CREATE_RESERVED_36.value())
    comptime DISALLOW_OPACITY_MICROMAP = Self(value = PipelineCreateFlagBits2.DISALLOW_OPACITY_MICROMAP.value())
    comptime PIPELINE_CREATE_RESERVED_39 = Self(value = PipelineCreateFlagBits2.PIPELINE_CREATE_RESERVED_39.value())
    comptime PER_LAYER_FRAGMENT_DENSITY = Self(value = PipelineCreateFlagBits2.PER_LAYER_FRAGMENT_DENSITY.value())
    comptime RESERVED_41 = Self(value = PipelineCreateFlagBits2.RESERVED_41.value())
    comptime RESERVED_42 = Self(value = PipelineCreateFlagBits2.RESERVED_42.value())
    comptime RESERVED_43 = Self(value = PipelineCreateFlagBits2.RESERVED_43.value())
    comptime PIPELINE_CREATE_RESERVED_44 = Self(value = PipelineCreateFlagBits2.PIPELINE_CREATE_RESERVED_44.value())
    comptime RESERVED_45 = Self(value = PipelineCreateFlagBits2.RESERVED_45.value())
    comptime RESERVED_46 = Self(value = PipelineCreateFlagBits2.RESERVED_46.value())
    comptime RESERVED_47 = Self(value = PipelineCreateFlagBits2.RESERVED_47.value())


@register_passable("trivial")
struct PipelineCreateFlagBits2(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCreateFlags2:
        return PipelineCreateFlags2(value = self._value | other._value)

    comptime DISABLE_OPTIMIZATION = Self(value = 1 << 0)
    comptime ALLOW_DERIVATIVES = Self(value = 1 << 1)
    comptime DERIVATIVE = Self(value = 1 << 2)
    comptime VIEW_INDEX_FROM_DEVICE_INDEX = Self(value = 1 << 3)
    comptime DISPATCH_BASE = Self(value = 1 << 4)
    comptime DEFER_COMPILE = Self(value = 1 << 5)
    comptime CAPTURE_STATISTICS = Self(value = 1 << 6)
    comptime CAPTURE_INTERNAL_REPRESENTATIONS = Self(value = 1 << 7)
    comptime FAIL_ON_PIPELINE_COMPILE_REQUIRED = Self(value = 1 << 8)
    comptime EARLY_RETURN_ON_FAILURE = Self(value = 1 << 9)
    comptime LINK_TIME_OPTIMIZATION = Self(value = 1 << 10)
    comptime LIBRARY = Self(value = 1 << 11)
    comptime RAY_TRACING_SKIP_TRIANGLES = Self(value = 1 << 12)
    comptime RAY_TRACING_SKIP_AABBS = Self(value = 1 << 13)
    comptime RAY_TRACING_NO_NULL_ANY_HIT_SHADERS = Self(value = 1 << 14)
    comptime RAY_TRACING_NO_NULL_CLOSEST_HIT_SHADERS = Self(value = 1 << 15)
    comptime RAY_TRACING_NO_NULL_MISS_SHADERS = Self(value = 1 << 16)
    comptime RAY_TRACING_NO_NULL_INTERSECTION_SHADERS = Self(value = 1 << 17)
    comptime INDIRECT_BINDABLE = Self(value = 1 << 18)
    comptime RAY_TRACING_SHADER_GROUP_HANDLE_CAPTURE_REPLAY = Self(value = 1 << 19)
    comptime RAY_TRACING_ALLOW_MOTION = Self(value = 1 << 20)
    comptime RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = 1 << 21)
    comptime RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT = Self(value = 1 << 22)
    comptime RETAIN_LINK_TIME_OPTIMIZATION_INFO = Self(value = 1 << 23)
    comptime RAY_TRACING_OPACITY_MICROMAP = Self(value = 1 << 24)
    comptime COLOR_ATTACHMENT_FEEDBACK_LOOP = Self(value = 1 << 25)
    comptime DEPTH_STENCIL_ATTACHMENT_FEEDBACK_LOOP = Self(value = 1 << 26)
    comptime NO_PROTECTED_ACCESS = Self(value = 1 << 27)
    comptime RAY_TRACING_DISPLACEMENT_MICROMAP = Self(value = 1 << 28)
    comptime DESCRIPTOR_BUFFER = Self(value = 1 << 29)
    comptime PROTECTED_ACCESS_ONLY = Self(value = 1 << 30)
    comptime CAPTURE_DATA = Self(value = 1 << 31)
    comptime EXECUTION_GRAPH = Self(value = 1 << 32)
    comptime RAY_TRACING_ALLOW_SPHERES_AND_LINEAR_SWEPT_SPHERES = Self(value = 1 << 33)
    comptime ENABLE_LEGACY_DITHERING = Self(value = 1 << 34)
    comptime RESERVED_35 = Self(value = 1 << 35)
    comptime PIPELINE_CREATE_RESERVED_36 = Self(value = 1 << 36)
    comptime DISALLOW_OPACITY_MICROMAP = Self(value = 1 << 37)
    comptime PIPELINE_CREATE_RESERVED_39 = Self(value = 1 << 39)
    comptime PER_LAYER_FRAGMENT_DENSITY = Self(value = 1 << 40)
    comptime RESERVED_41 = Self(value = 1 << 41)
    comptime RESERVED_42 = Self(value = 1 << 42)
    comptime RESERVED_43 = Self(value = 1 << 43)
    comptime PIPELINE_CREATE_RESERVED_44 = Self(value = 1 << 44)
    comptime RESERVED_45 = Self(value = 1 << 45)
    comptime RESERVED_46 = Self(value = 1 << 46)
    comptime RESERVED_47 = Self(value = 1 << 47)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: BufferUsageFlags2) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: BufferUsageFlags2) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: BufferUsageFlags2) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: BufferUsageFlags2) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: BufferUsageFlags2) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: BufferUsageFlags2) -> Bool:
        return self & other == self

    fn is_superset(self, other: BufferUsageFlags2) -> Bool:
        return self & other == other

    comptime TRANSFER_SRC = Self(value = BufferUsageFlagBits2.TRANSFER_SRC.value())
    comptime TRANSFER_DST = Self(value = BufferUsageFlagBits2.TRANSFER_DST.value())
    comptime UNIFORM_TEXEL_BUFFER = Self(value = BufferUsageFlagBits2.UNIFORM_TEXEL_BUFFER.value())
    comptime STORAGE_TEXEL_BUFFER = Self(value = BufferUsageFlagBits2.STORAGE_TEXEL_BUFFER.value())
    comptime UNIFORM_BUFFER = Self(value = BufferUsageFlagBits2.UNIFORM_BUFFER.value())
    comptime STORAGE_BUFFER = Self(value = BufferUsageFlagBits2.STORAGE_BUFFER.value())
    comptime INDEX_BUFFER = Self(value = BufferUsageFlagBits2.INDEX_BUFFER.value())
    comptime VERTEX_BUFFER = Self(value = BufferUsageFlagBits2.VERTEX_BUFFER.value())
    comptime INDIRECT_BUFFER = Self(value = BufferUsageFlagBits2.INDIRECT_BUFFER.value())
    comptime CONDITIONAL_RENDERING = Self(value = BufferUsageFlagBits2.CONDITIONAL_RENDERING.value())
    comptime SHADER_BINDING_TABLE = Self(value = BufferUsageFlagBits2.SHADER_BINDING_TABLE.value())
    comptime TRANSFORM_FEEDBACK_BUFFER = Self(value = BufferUsageFlagBits2.TRANSFORM_FEEDBACK_BUFFER.value())
    comptime TRANSFORM_FEEDBACK_COUNTER_BUFFER = Self(value = BufferUsageFlagBits2.TRANSFORM_FEEDBACK_COUNTER_BUFFER.value())
    comptime VIDEO_DECODE_SRC = Self(value = BufferUsageFlagBits2.VIDEO_DECODE_SRC.value())
    comptime VIDEO_DECODE_DST = Self(value = BufferUsageFlagBits2.VIDEO_DECODE_DST.value())
    comptime VIDEO_ENCODE_DST = Self(value = BufferUsageFlagBits2.VIDEO_ENCODE_DST.value())
    comptime VIDEO_ENCODE_SRC = Self(value = BufferUsageFlagBits2.VIDEO_ENCODE_SRC.value())
    comptime SHADER_DEVICE_ADDRESS = Self(value = BufferUsageFlagBits2.SHADER_DEVICE_ADDRESS.value())
    comptime ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY = Self(value = BufferUsageFlagBits2.ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY.value())
    comptime ACCELERATION_STRUCTURE_STORAGE = Self(value = BufferUsageFlagBits2.ACCELERATION_STRUCTURE_STORAGE.value())
    comptime SAMPLER_DESCRIPTOR_BUFFER = Self(value = BufferUsageFlagBits2.SAMPLER_DESCRIPTOR_BUFFER.value())
    comptime RESOURCE_DESCRIPTOR_BUFFER = Self(value = BufferUsageFlagBits2.RESOURCE_DESCRIPTOR_BUFFER.value())
    comptime MICROMAP_BUILD_INPUT_READ_ONLY = Self(value = BufferUsageFlagBits2.MICROMAP_BUILD_INPUT_READ_ONLY.value())
    comptime MICROMAP_STORAGE = Self(value = BufferUsageFlagBits2.MICROMAP_STORAGE.value())
    comptime EXECUTION_GRAPH_SCRATCH = Self(value = BufferUsageFlagBits2.EXECUTION_GRAPH_SCRATCH.value())
    comptime PUSH_DESCRIPTORS_DESCRIPTOR_BUFFER = Self(value = BufferUsageFlagBits2.PUSH_DESCRIPTORS_DESCRIPTOR_BUFFER.value())
    comptime TILE_MEMORY = Self(value = BufferUsageFlagBits2.TILE_MEMORY.value())
    comptime RESERVED_28 = Self(value = BufferUsageFlagBits2.RESERVED_28.value())
    comptime DATA_GRAPH_FOREIGN_DESCRIPTOR = Self(value = BufferUsageFlagBits2.DATA_GRAPH_FOREIGN_DESCRIPTOR.value())
    comptime PREPROCESS_BUFFER = Self(value = BufferUsageFlagBits2.PREPROCESS_BUFFER.value())
    comptime RESERVED_32 = Self(value = BufferUsageFlagBits2.RESERVED_32.value())
    comptime COMPRESSED_DATA_DGF1 = Self(value = BufferUsageFlagBits2.COMPRESSED_DATA_DGF1.value())
    comptime RESERVED_34 = Self(value = BufferUsageFlagBits2.RESERVED_34.value())
    comptime RESERVED_35 = Self(value = BufferUsageFlagBits2.RESERVED_35.value())
    comptime RESERVED_36 = Self(value = BufferUsageFlagBits2.RESERVED_36.value())


@register_passable("trivial")
struct BufferUsageFlagBits2(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> BufferUsageFlags2:
        return BufferUsageFlags2(value = self._value | other._value)

    comptime TRANSFER_SRC = Self(value = 1 << 0)
    comptime TRANSFER_DST = Self(value = 1 << 1)
    comptime UNIFORM_TEXEL_BUFFER = Self(value = 1 << 2)
    comptime STORAGE_TEXEL_BUFFER = Self(value = 1 << 3)
    comptime UNIFORM_BUFFER = Self(value = 1 << 4)
    comptime STORAGE_BUFFER = Self(value = 1 << 5)
    comptime INDEX_BUFFER = Self(value = 1 << 6)
    comptime VERTEX_BUFFER = Self(value = 1 << 7)
    comptime INDIRECT_BUFFER = Self(value = 1 << 8)
    comptime CONDITIONAL_RENDERING = Self(value = 1 << 9)
    comptime SHADER_BINDING_TABLE = Self(value = 1 << 10)
    comptime TRANSFORM_FEEDBACK_BUFFER = Self(value = 1 << 11)
    comptime TRANSFORM_FEEDBACK_COUNTER_BUFFER = Self(value = 1 << 12)
    comptime VIDEO_DECODE_SRC = Self(value = 1 << 13)
    comptime VIDEO_DECODE_DST = Self(value = 1 << 14)
    comptime VIDEO_ENCODE_DST = Self(value = 1 << 15)
    comptime VIDEO_ENCODE_SRC = Self(value = 1 << 16)
    comptime SHADER_DEVICE_ADDRESS = Self(value = 1 << 17)
    comptime ACCELERATION_STRUCTURE_BUILD_INPUT_READ_ONLY = Self(value = 1 << 19)
    comptime ACCELERATION_STRUCTURE_STORAGE = Self(value = 1 << 20)
    comptime SAMPLER_DESCRIPTOR_BUFFER = Self(value = 1 << 21)
    comptime RESOURCE_DESCRIPTOR_BUFFER = Self(value = 1 << 22)
    comptime MICROMAP_BUILD_INPUT_READ_ONLY = Self(value = 1 << 23)
    comptime MICROMAP_STORAGE = Self(value = 1 << 24)
    comptime EXECUTION_GRAPH_SCRATCH = Self(value = 1 << 25)
    comptime PUSH_DESCRIPTORS_DESCRIPTOR_BUFFER = Self(value = 1 << 26)
    comptime TILE_MEMORY = Self(value = 1 << 27)
    comptime RESERVED_28 = Self(value = 1 << 28)
    comptime DATA_GRAPH_FOREIGN_DESCRIPTOR = Self(value = 1 << 29)
    comptime PREPROCESS_BUFFER = Self(value = 1 << 31)
    comptime RESERVED_32 = Self(value = 1 << 32)
    comptime COMPRESSED_DATA_DGF1 = Self(value = 1 << 33)
    comptime RESERVED_34 = Self(value = 1 << 34)
    comptime RESERVED_35 = Self(value = 1 << 35)
    comptime RESERVED_36 = Self(value = 1 << 36)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: TensorCreateFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: TensorCreateFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: TensorCreateFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: TensorCreateFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: TensorCreateFlagsARM) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: TensorCreateFlagsARM) -> Bool:
        return self & other == self

    fn is_superset(self, other: TensorCreateFlagsARM) -> Bool:
        return self & other == other

    comptime MUTABLE_FORMAT = Self(value = TensorCreateFlagBitsARM.MUTABLE_FORMAT.value())
    comptime PROTECTED = Self(value = TensorCreateFlagBitsARM.PROTECTED.value())
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = TensorCreateFlagBitsARM.DESCRIPTOR_BUFFER_CAPTURE_REPLAY.value())
    comptime RESERVED_3 = Self(value = TensorCreateFlagBitsARM.RESERVED_3.value())


@register_passable("trivial")
struct TensorCreateFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> TensorCreateFlagsARM:
        return TensorCreateFlagsARM(value = self._value | other._value)

    comptime MUTABLE_FORMAT = Self(value = 1 << 0)
    comptime PROTECTED = Self(value = 1 << 1)
    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = 1 << 2)
    comptime RESERVED_3 = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: TensorUsageFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: TensorUsageFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: TensorUsageFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: TensorUsageFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: TensorUsageFlagsARM) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: TensorUsageFlagsARM) -> Bool:
        return self & other == self

    fn is_superset(self, other: TensorUsageFlagsARM) -> Bool:
        return self & other == other

    comptime SHADER = Self(value = TensorUsageFlagBitsARM.SHADER.value())
    comptime TRANSFER_SRC = Self(value = TensorUsageFlagBitsARM.TRANSFER_SRC.value())
    comptime TRANSFER_DST = Self(value = TensorUsageFlagBitsARM.TRANSFER_DST.value())
    comptime IMAGE_ALIASING = Self(value = TensorUsageFlagBitsARM.IMAGE_ALIASING.value())
    comptime DATA_GRAPH = Self(value = TensorUsageFlagBitsARM.DATA_GRAPH.value())


@register_passable("trivial")
struct TensorUsageFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> TensorUsageFlagsARM:
        return TensorUsageFlagsARM(value = self._value | other._value)

    comptime SHADER = Self(value = 1 << 1)
    comptime TRANSFER_SRC = Self(value = 1 << 2)
    comptime TRANSFER_DST = Self(value = 1 << 3)
    comptime IMAGE_ALIASING = Self(value = 1 << 4)
    comptime DATA_GRAPH = Self(value = 1 << 5)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: TensorViewCreateFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: TensorViewCreateFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: TensorViewCreateFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: TensorViewCreateFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: TensorViewCreateFlagsARM) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: TensorViewCreateFlagsARM) -> Bool:
        return self & other == self

    fn is_superset(self, other: TensorViewCreateFlagsARM) -> Bool:
        return self & other == other

    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = TensorViewCreateFlagBitsARM.DESCRIPTOR_BUFFER_CAPTURE_REPLAY.value())


@register_passable("trivial")
struct TensorViewCreateFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> TensorViewCreateFlagsARM:
        return TensorViewCreateFlagsARM(value = self._value | other._value)

    comptime DESCRIPTOR_BUFFER_CAPTURE_REPLAY = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DataGraphPipelineSessionCreateFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DataGraphPipelineSessionCreateFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DataGraphPipelineSessionCreateFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DataGraphPipelineSessionCreateFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DataGraphPipelineSessionCreateFlagsARM) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DataGraphPipelineSessionCreateFlagsARM) -> Bool:
        return self & other == self

    fn is_superset(self, other: DataGraphPipelineSessionCreateFlagsARM) -> Bool:
        return self & other == other

    comptime PROTECTED = Self(value = DataGraphPipelineSessionCreateFlagBitsARM.PROTECTED.value())


@register_passable("trivial")
struct DataGraphPipelineSessionCreateFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DataGraphPipelineSessionCreateFlagsARM:
        return DataGraphPipelineSessionCreateFlagsARM(value = self._value | other._value)

    comptime PROTECTED = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DataGraphPipelineDispatchFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DataGraphPipelineDispatchFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DataGraphPipelineDispatchFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DataGraphPipelineDispatchFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DataGraphPipelineDispatchFlagsARM) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DataGraphPipelineDispatchFlagsARM) -> Bool:
        return self & other == self

    fn is_superset(self, other: DataGraphPipelineDispatchFlagsARM) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DataGraphPipelineDispatchFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DataGraphPipelineDispatchFlagsARM:
        return DataGraphPipelineDispatchFlagsARM(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeRgbModelConversionFlagsVALVE) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeRgbModelConversionFlagsVALVE) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeRgbModelConversionFlagsVALVE) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeRgbModelConversionFlagsVALVE) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeRgbModelConversionFlagsVALVE) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeRgbModelConversionFlagsVALVE) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeRgbModelConversionFlagsVALVE) -> Bool:
        return self & other == other

    comptime RGB_IDENTITY = Self(value = VideoEncodeRgbModelConversionFlagBitsVALVE.RGB_IDENTITY.value())
    comptime YCBCR_IDENTITY = Self(value = VideoEncodeRgbModelConversionFlagBitsVALVE.YCBCR_IDENTITY.value())
    comptime YCBCR_709 = Self(value = VideoEncodeRgbModelConversionFlagBitsVALVE.YCBCR_709.value())
    comptime YCBCR_601 = Self(value = VideoEncodeRgbModelConversionFlagBitsVALVE.YCBCR_601.value())
    comptime YCBCR_2020 = Self(value = VideoEncodeRgbModelConversionFlagBitsVALVE.YCBCR_2020.value())


@register_passable("trivial")
struct VideoEncodeRgbModelConversionFlagBitsVALVE(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeRgbModelConversionFlagsVALVE:
        return VideoEncodeRgbModelConversionFlagsVALVE(value = self._value | other._value)

    comptime RGB_IDENTITY = Self(value = 1 << 0)
    comptime YCBCR_IDENTITY = Self(value = 1 << 1)
    comptime YCBCR_709 = Self(value = 1 << 2)
    comptime YCBCR_601 = Self(value = 1 << 3)
    comptime YCBCR_2020 = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeRgbRangeCompressionFlagsVALVE) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeRgbRangeCompressionFlagsVALVE) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeRgbRangeCompressionFlagsVALVE) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeRgbRangeCompressionFlagsVALVE) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeRgbRangeCompressionFlagsVALVE) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeRgbRangeCompressionFlagsVALVE) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeRgbRangeCompressionFlagsVALVE) -> Bool:
        return self & other == other

    comptime FULL_RANGE = Self(value = VideoEncodeRgbRangeCompressionFlagBitsVALVE.FULL_RANGE.value())
    comptime NARROW_RANGE = Self(value = VideoEncodeRgbRangeCompressionFlagBitsVALVE.NARROW_RANGE.value())


@register_passable("trivial")
struct VideoEncodeRgbRangeCompressionFlagBitsVALVE(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeRgbRangeCompressionFlagsVALVE:
        return VideoEncodeRgbRangeCompressionFlagsVALVE(value = self._value | other._value)

    comptime FULL_RANGE = Self(value = 1 << 0)
    comptime NARROW_RANGE = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeRgbChromaOffsetFlagsVALVE) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeRgbChromaOffsetFlagsVALVE) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeRgbChromaOffsetFlagsVALVE) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeRgbChromaOffsetFlagsVALVE) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeRgbChromaOffsetFlagsVALVE) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeRgbChromaOffsetFlagsVALVE) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeRgbChromaOffsetFlagsVALVE) -> Bool:
        return self & other == other

    comptime COSITED_EVEN = Self(value = VideoEncodeRgbChromaOffsetFlagBitsVALVE.COSITED_EVEN.value())
    comptime MIDPOINT = Self(value = VideoEncodeRgbChromaOffsetFlagBitsVALVE.MIDPOINT.value())


@register_passable("trivial")
struct VideoEncodeRgbChromaOffsetFlagBitsVALVE(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeRgbChromaOffsetFlagsVALVE:
        return VideoEncodeRgbChromaOffsetFlagsVALVE(value = self._value | other._value)

    comptime COSITED_EVEN = Self(value = 1 << 0)
    comptime MIDPOINT = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: CompositeAlphaFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: CompositeAlphaFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: CompositeAlphaFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: CompositeAlphaFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: CompositeAlphaFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: CompositeAlphaFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: CompositeAlphaFlagsKHR) -> Bool:
        return self & other == other

    comptime OPAQUE = Self(value = CompositeAlphaFlagBitsKHR.OPAQUE.value())
    comptime PRE_MULTIPLIED = Self(value = CompositeAlphaFlagBitsKHR.PRE_MULTIPLIED.value())
    comptime POST_MULTIPLIED = Self(value = CompositeAlphaFlagBitsKHR.POST_MULTIPLIED.value())
    comptime INHERIT = Self(value = CompositeAlphaFlagBitsKHR.INHERIT.value())


@register_passable("trivial")
struct CompositeAlphaFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> CompositeAlphaFlagsKHR:
        return CompositeAlphaFlagsKHR(value = self._value | other._value)

    comptime OPAQUE = Self(value = 1 << 0)
    comptime PRE_MULTIPLIED = Self(value = 1 << 1)
    comptime POST_MULTIPLIED = Self(value = 1 << 2)
    comptime INHERIT = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DisplayPlaneAlphaFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DisplayPlaneAlphaFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DisplayPlaneAlphaFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DisplayPlaneAlphaFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DisplayPlaneAlphaFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DisplayPlaneAlphaFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: DisplayPlaneAlphaFlagsKHR) -> Bool:
        return self & other == other

    comptime OPAQUE = Self(value = DisplayPlaneAlphaFlagBitsKHR.OPAQUE.value())
    comptime GLOBAL = Self(value = DisplayPlaneAlphaFlagBitsKHR.GLOBAL.value())
    comptime PER_PIXEL = Self(value = DisplayPlaneAlphaFlagBitsKHR.PER_PIXEL.value())
    comptime PER_PIXEL_PREMULTIPLIED = Self(value = DisplayPlaneAlphaFlagBitsKHR.PER_PIXEL_PREMULTIPLIED.value())


@register_passable("trivial")
struct DisplayPlaneAlphaFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DisplayPlaneAlphaFlagsKHR:
        return DisplayPlaneAlphaFlagsKHR(value = self._value | other._value)

    comptime OPAQUE = Self(value = 1 << 0)
    comptime GLOBAL = Self(value = 1 << 1)
    comptime PER_PIXEL = Self(value = 1 << 2)
    comptime PER_PIXEL_PREMULTIPLIED = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SurfaceTransformFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SurfaceTransformFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SurfaceTransformFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SurfaceTransformFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SurfaceTransformFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SurfaceTransformFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: SurfaceTransformFlagsKHR) -> Bool:
        return self & other == other

    comptime IDENTITY = Self(value = SurfaceTransformFlagBitsKHR.IDENTITY.value())
    comptime ROTATE_90 = Self(value = SurfaceTransformFlagBitsKHR.ROTATE_90.value())
    comptime ROTATE_180 = Self(value = SurfaceTransformFlagBitsKHR.ROTATE_180.value())
    comptime ROTATE_270 = Self(value = SurfaceTransformFlagBitsKHR.ROTATE_270.value())
    comptime HORIZONTAL_MIRROR = Self(value = SurfaceTransformFlagBitsKHR.HORIZONTAL_MIRROR.value())
    comptime HORIZONTAL_MIRROR_ROTATE_90 = Self(value = SurfaceTransformFlagBitsKHR.HORIZONTAL_MIRROR_ROTATE_90.value())
    comptime HORIZONTAL_MIRROR_ROTATE_180 = Self(value = SurfaceTransformFlagBitsKHR.HORIZONTAL_MIRROR_ROTATE_180.value())
    comptime HORIZONTAL_MIRROR_ROTATE_270 = Self(value = SurfaceTransformFlagBitsKHR.HORIZONTAL_MIRROR_ROTATE_270.value())
    comptime INHERIT = Self(value = SurfaceTransformFlagBitsKHR.INHERIT.value())


@register_passable("trivial")
struct SurfaceTransformFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SurfaceTransformFlagsKHR:
        return SurfaceTransformFlagsKHR(value = self._value | other._value)

    comptime IDENTITY = Self(value = 1 << 0)
    comptime ROTATE_90 = Self(value = 1 << 1)
    comptime ROTATE_180 = Self(value = 1 << 2)
    comptime ROTATE_270 = Self(value = 1 << 3)
    comptime HORIZONTAL_MIRROR = Self(value = 1 << 4)
    comptime HORIZONTAL_MIRROR_ROTATE_90 = Self(value = 1 << 5)
    comptime HORIZONTAL_MIRROR_ROTATE_180 = Self(value = 1 << 6)
    comptime HORIZONTAL_MIRROR_ROTATE_270 = Self(value = 1 << 7)
    comptime INHERIT = Self(value = 1 << 8)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SwapchainCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SwapchainCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SwapchainCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SwapchainCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SwapchainCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SwapchainCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: SwapchainCreateFlagsKHR) -> Bool:
        return self & other == other

    comptime SPLIT_INSTANCE_BIND_REGIONS = Self(value = SwapchainCreateFlagBitsKHR.SPLIT_INSTANCE_BIND_REGIONS.value())
    comptime PROTECTED = Self(value = SwapchainCreateFlagBitsKHR.PROTECTED.value())
    comptime MUTABLE_FORMAT = Self(value = SwapchainCreateFlagBitsKHR.MUTABLE_FORMAT.value())
    comptime RESERVED_4 = Self(value = SwapchainCreateFlagBitsKHR.RESERVED_4.value())
    comptime RESERVED_5 = Self(value = SwapchainCreateFlagBitsKHR.RESERVED_5.value())
    comptime PRESENT_ID_2 = Self(value = SwapchainCreateFlagBitsKHR.PRESENT_ID_2.value())
    comptime PRESENT_WAIT_2 = Self(value = SwapchainCreateFlagBitsKHR.PRESENT_WAIT_2.value())
    comptime RESERVED_8 = Self(value = SwapchainCreateFlagBitsKHR.RESERVED_8.value())


@register_passable("trivial")
struct SwapchainCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SwapchainCreateFlagsKHR:
        return SwapchainCreateFlagsKHR(value = self._value | other._value)

    comptime SPLIT_INSTANCE_BIND_REGIONS = Self(value = 1 << 0)
    comptime PROTECTED = Self(value = 1 << 1)
    comptime MUTABLE_FORMAT = Self(value = 1 << 2)
    comptime RESERVED_4 = Self(value = 1 << 4)
    comptime RESERVED_5 = Self(value = 1 << 5)
    comptime PRESENT_ID_2 = Self(value = 1 << 6)
    comptime PRESENT_WAIT_2 = Self(value = 1 << 7)
    comptime RESERVED_8 = Self(value = 1 << 8)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DisplayModeCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DisplayModeCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DisplayModeCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DisplayModeCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DisplayModeCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DisplayModeCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: DisplayModeCreateFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DisplayModeCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DisplayModeCreateFlagsKHR:
        return DisplayModeCreateFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DisplaySurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DisplaySurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DisplaySurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DisplaySurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DisplaySurfaceCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DisplaySurfaceCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: DisplaySurfaceCreateFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DisplaySurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DisplaySurfaceCreateFlagsKHR:
        return DisplaySurfaceCreateFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: AndroidSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: AndroidSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: AndroidSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: AndroidSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: AndroidSurfaceCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: AndroidSurfaceCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: AndroidSurfaceCreateFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct AndroidSurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AndroidSurfaceCreateFlagsKHR:
        return AndroidSurfaceCreateFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ViSurfaceCreateFlagsNN) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ViSurfaceCreateFlagsNN) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ViSurfaceCreateFlagsNN) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ViSurfaceCreateFlagsNN) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ViSurfaceCreateFlagsNN) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ViSurfaceCreateFlagsNN) -> Bool:
        return self & other == self

    fn is_superset(self, other: ViSurfaceCreateFlagsNN) -> Bool:
        return self & other == other


@register_passable("trivial")
struct ViSurfaceCreateFlagBitsNN(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ViSurfaceCreateFlagsNN:
        return ViSurfaceCreateFlagsNN(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: WaylandSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: WaylandSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: WaylandSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: WaylandSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: WaylandSurfaceCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: WaylandSurfaceCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: WaylandSurfaceCreateFlagsKHR) -> Bool:
        return self & other == other

    comptime DISABLE_COLOR_MANAGEMENT = Self(value = WaylandSurfaceCreateFlagBitsKHR.DISABLE_COLOR_MANAGEMENT.value())


@register_passable("trivial")
struct WaylandSurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> WaylandSurfaceCreateFlagsKHR:
        return WaylandSurfaceCreateFlagsKHR(value = self._value | other._value)

    comptime DISABLE_COLOR_MANAGEMENT = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Win32SurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: Win32SurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: Win32SurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: Win32SurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: Win32SurfaceCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: Win32SurfaceCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: Win32SurfaceCreateFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct Win32SurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> Win32SurfaceCreateFlagsKHR:
        return Win32SurfaceCreateFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: XlibSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: XlibSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: XlibSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: XlibSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: XlibSurfaceCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: XlibSurfaceCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: XlibSurfaceCreateFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct XlibSurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> XlibSurfaceCreateFlagsKHR:
        return XlibSurfaceCreateFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: XcbSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: XcbSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: XcbSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: XcbSurfaceCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: XcbSurfaceCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: XcbSurfaceCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: XcbSurfaceCreateFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct XcbSurfaceCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> XcbSurfaceCreateFlagsKHR:
        return XcbSurfaceCreateFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DirectFBSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DirectFBSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DirectFBSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DirectFBSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DirectFBSurfaceCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DirectFBSurfaceCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: DirectFBSurfaceCreateFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DirectFBSurfaceCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DirectFBSurfaceCreateFlagsEXT:
        return DirectFBSurfaceCreateFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: IOSSurfaceCreateFlagsMVK) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: IOSSurfaceCreateFlagsMVK) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: IOSSurfaceCreateFlagsMVK) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: IOSSurfaceCreateFlagsMVK) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: IOSSurfaceCreateFlagsMVK) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: IOSSurfaceCreateFlagsMVK) -> Bool:
        return self & other == self

    fn is_superset(self, other: IOSSurfaceCreateFlagsMVK) -> Bool:
        return self & other == other


@register_passable("trivial")
struct IOSSurfaceCreateFlagBitsMVK(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> IOSSurfaceCreateFlagsMVK:
        return IOSSurfaceCreateFlagsMVK(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: MacOSSurfaceCreateFlagsMVK) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: MacOSSurfaceCreateFlagsMVK) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: MacOSSurfaceCreateFlagsMVK) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: MacOSSurfaceCreateFlagsMVK) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: MacOSSurfaceCreateFlagsMVK) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: MacOSSurfaceCreateFlagsMVK) -> Bool:
        return self & other == self

    fn is_superset(self, other: MacOSSurfaceCreateFlagsMVK) -> Bool:
        return self & other == other


@register_passable("trivial")
struct MacOSSurfaceCreateFlagBitsMVK(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MacOSSurfaceCreateFlagsMVK:
        return MacOSSurfaceCreateFlagsMVK(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: MetalSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: MetalSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: MetalSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: MetalSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: MetalSurfaceCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: MetalSurfaceCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: MetalSurfaceCreateFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct MetalSurfaceCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MetalSurfaceCreateFlagsEXT:
        return MetalSurfaceCreateFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ImagePipeSurfaceCreateFlagsFUCHSIA) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ImagePipeSurfaceCreateFlagsFUCHSIA) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ImagePipeSurfaceCreateFlagsFUCHSIA) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ImagePipeSurfaceCreateFlagsFUCHSIA) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ImagePipeSurfaceCreateFlagsFUCHSIA) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ImagePipeSurfaceCreateFlagsFUCHSIA) -> Bool:
        return self & other == self

    fn is_superset(self, other: ImagePipeSurfaceCreateFlagsFUCHSIA) -> Bool:
        return self & other == other


@register_passable("trivial")
struct ImagePipeSurfaceCreateFlagBitsFUCHSIA(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImagePipeSurfaceCreateFlagsFUCHSIA:
        return ImagePipeSurfaceCreateFlagsFUCHSIA(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: StreamDescriptorSurfaceCreateFlagsGGP) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: StreamDescriptorSurfaceCreateFlagsGGP) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: StreamDescriptorSurfaceCreateFlagsGGP) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: StreamDescriptorSurfaceCreateFlagsGGP) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: StreamDescriptorSurfaceCreateFlagsGGP) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: StreamDescriptorSurfaceCreateFlagsGGP) -> Bool:
        return self & other == self

    fn is_superset(self, other: StreamDescriptorSurfaceCreateFlagsGGP) -> Bool:
        return self & other == other


@register_passable("trivial")
struct StreamDescriptorSurfaceCreateFlagBitsGGP(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> StreamDescriptorSurfaceCreateFlagsGGP:
        return StreamDescriptorSurfaceCreateFlagsGGP(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: HeadlessSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: HeadlessSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: HeadlessSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: HeadlessSurfaceCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: HeadlessSurfaceCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: HeadlessSurfaceCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: HeadlessSurfaceCreateFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct HeadlessSurfaceCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> HeadlessSurfaceCreateFlagsEXT:
        return HeadlessSurfaceCreateFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ScreenSurfaceCreateFlagsQNX) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ScreenSurfaceCreateFlagsQNX) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ScreenSurfaceCreateFlagsQNX) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ScreenSurfaceCreateFlagsQNX) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ScreenSurfaceCreateFlagsQNX) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ScreenSurfaceCreateFlagsQNX) -> Bool:
        return self & other == self

    fn is_superset(self, other: ScreenSurfaceCreateFlagsQNX) -> Bool:
        return self & other == other


@register_passable("trivial")
struct ScreenSurfaceCreateFlagBitsQNX(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ScreenSurfaceCreateFlagsQNX:
        return ScreenSurfaceCreateFlagsQNX(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PeerMemoryFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PeerMemoryFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PeerMemoryFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PeerMemoryFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PeerMemoryFeatureFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PeerMemoryFeatureFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: PeerMemoryFeatureFlags) -> Bool:
        return self & other == other

    comptime COPY_SRC = Self(value = PeerMemoryFeatureFlagBits.COPY_SRC.value())
    comptime COPY_DST = Self(value = PeerMemoryFeatureFlagBits.COPY_DST.value())
    comptime GENERIC_SRC = Self(value = PeerMemoryFeatureFlagBits.GENERIC_SRC.value())
    comptime GENERIC_DST = Self(value = PeerMemoryFeatureFlagBits.GENERIC_DST.value())


@register_passable("trivial")
struct PeerMemoryFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PeerMemoryFeatureFlags:
        return PeerMemoryFeatureFlags(value = self._value | other._value)

    comptime COPY_SRC = Self(value = 1 << 0)
    comptime COPY_DST = Self(value = 1 << 1)
    comptime GENERIC_SRC = Self(value = 1 << 2)
    comptime GENERIC_DST = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: MemoryAllocateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: MemoryAllocateFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: MemoryAllocateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: MemoryAllocateFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: MemoryAllocateFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: MemoryAllocateFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: MemoryAllocateFlags) -> Bool:
        return self & other == other

    comptime DEVICE_MASK = Self(value = MemoryAllocateFlagBits.DEVICE_MASK.value())
    comptime DEVICE_ADDRESS = Self(value = MemoryAllocateFlagBits.DEVICE_ADDRESS.value())
    comptime DEVICE_ADDRESS_CAPTURE_REPLAY = Self(value = MemoryAllocateFlagBits.DEVICE_ADDRESS_CAPTURE_REPLAY.value())
    comptime ZERO_INITIALIZE = Self(value = MemoryAllocateFlagBits.ZERO_INITIALIZE.value())


@register_passable("trivial")
struct MemoryAllocateFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MemoryAllocateFlags:
        return MemoryAllocateFlags(value = self._value | other._value)

    comptime DEVICE_MASK = Self(value = 1 << 0)
    comptime DEVICE_ADDRESS = Self(value = 1 << 1)
    comptime DEVICE_ADDRESS_CAPTURE_REPLAY = Self(value = 1 << 2)
    comptime ZERO_INITIALIZE = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DeviceGroupPresentModeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DeviceGroupPresentModeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DeviceGroupPresentModeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DeviceGroupPresentModeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DeviceGroupPresentModeFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DeviceGroupPresentModeFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: DeviceGroupPresentModeFlagsKHR) -> Bool:
        return self & other == other

    comptime LOCAL = Self(value = DeviceGroupPresentModeFlagBitsKHR.LOCAL.value())
    comptime REMOTE = Self(value = DeviceGroupPresentModeFlagBitsKHR.REMOTE.value())
    comptime SUM = Self(value = DeviceGroupPresentModeFlagBitsKHR.SUM.value())
    comptime LOCAL_MULTI_DEVICE = Self(value = DeviceGroupPresentModeFlagBitsKHR.LOCAL_MULTI_DEVICE.value())


@register_passable("trivial")
struct DeviceGroupPresentModeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DeviceGroupPresentModeFlagsKHR:
        return DeviceGroupPresentModeFlagsKHR(value = self._value | other._value)

    comptime LOCAL = Self(value = 1 << 0)
    comptime REMOTE = Self(value = 1 << 1)
    comptime SUM = Self(value = 1 << 2)
    comptime LOCAL_MULTI_DEVICE = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DebugReportFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DebugReportFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DebugReportFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DebugReportFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DebugReportFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DebugReportFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: DebugReportFlagsEXT) -> Bool:
        return self & other == other

    comptime INFORMATION = Self(value = DebugReportFlagBitsEXT.INFORMATION.value())
    comptime WARNING = Self(value = DebugReportFlagBitsEXT.WARNING.value())
    comptime PERFORMANCE_WARNING = Self(value = DebugReportFlagBitsEXT.PERFORMANCE_WARNING.value())
    comptime ERROR = Self(value = DebugReportFlagBitsEXT.ERROR.value())
    comptime DEBUG = Self(value = DebugReportFlagBitsEXT.DEBUG.value())


@register_passable("trivial")
struct DebugReportFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DebugReportFlagsEXT:
        return DebugReportFlagsEXT(value = self._value | other._value)

    comptime INFORMATION = Self(value = 1 << 0)
    comptime WARNING = Self(value = 1 << 1)
    comptime PERFORMANCE_WARNING = Self(value = 1 << 2)
    comptime ERROR = Self(value = 1 << 3)
    comptime DEBUG = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: CommandPoolTrimFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: CommandPoolTrimFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: CommandPoolTrimFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: CommandPoolTrimFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: CommandPoolTrimFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: CommandPoolTrimFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: CommandPoolTrimFlags) -> Bool:
        return self & other == other


@register_passable("trivial")
struct CommandPoolTrimFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> CommandPoolTrimFlags:
        return CommandPoolTrimFlags(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ExternalMemoryHandleTypeFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ExternalMemoryHandleTypeFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ExternalMemoryHandleTypeFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ExternalMemoryHandleTypeFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ExternalMemoryHandleTypeFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ExternalMemoryHandleTypeFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: ExternalMemoryHandleTypeFlagsNV) -> Bool:
        return self & other == other

    comptime OPAQUE_WIN32 = Self(value = ExternalMemoryHandleTypeFlagBitsNV.OPAQUE_WIN32.value())
    comptime OPAQUE_WIN32_KMT = Self(value = ExternalMemoryHandleTypeFlagBitsNV.OPAQUE_WIN32_KMT.value())
    comptime D3D11_IMAGE = Self(value = ExternalMemoryHandleTypeFlagBitsNV.D3D11_IMAGE.value())
    comptime D3D11_IMAGE_KMT = Self(value = ExternalMemoryHandleTypeFlagBitsNV.D3D11_IMAGE_KMT.value())


@register_passable("trivial")
struct ExternalMemoryHandleTypeFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ExternalMemoryHandleTypeFlagsNV:
        return ExternalMemoryHandleTypeFlagsNV(value = self._value | other._value)

    comptime OPAQUE_WIN32 = Self(value = 1 << 0)
    comptime OPAQUE_WIN32_KMT = Self(value = 1 << 1)
    comptime D3D11_IMAGE = Self(value = 1 << 2)
    comptime D3D11_IMAGE_KMT = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ClusterAccelerationStructureIndexFormatFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ClusterAccelerationStructureIndexFormatFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ClusterAccelerationStructureIndexFormatFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ClusterAccelerationStructureIndexFormatFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ClusterAccelerationStructureIndexFormatFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ClusterAccelerationStructureIndexFormatFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: ClusterAccelerationStructureIndexFormatFlagsNV) -> Bool:
        return self & other == other

    comptime N_8BIT = Self(value = ClusterAccelerationStructureIndexFormatFlagBitsNV.N_8BIT.value())
    comptime N_16BIT = Self(value = ClusterAccelerationStructureIndexFormatFlagBitsNV.N_16BIT.value())
    comptime N_32BIT = Self(value = ClusterAccelerationStructureIndexFormatFlagBitsNV.N_32BIT.value())


@register_passable("trivial")
struct ClusterAccelerationStructureIndexFormatFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ClusterAccelerationStructureIndexFormatFlagsNV:
        return ClusterAccelerationStructureIndexFormatFlagsNV(value = self._value | other._value)

    comptime N_8BIT = Self(value = 1 << 0)
    comptime N_16BIT = Self(value = 1 << 1)
    comptime N_32BIT = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ExternalMemoryFeatureFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ExternalMemoryFeatureFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ExternalMemoryFeatureFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ExternalMemoryFeatureFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ExternalMemoryFeatureFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ExternalMemoryFeatureFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: ExternalMemoryFeatureFlagsNV) -> Bool:
        return self & other == other

    comptime DEDICATED_ONLY = Self(value = ExternalMemoryFeatureFlagBitsNV.DEDICATED_ONLY.value())
    comptime EXPORTABLE = Self(value = ExternalMemoryFeatureFlagBitsNV.EXPORTABLE.value())
    comptime IMPORTABLE = Self(value = ExternalMemoryFeatureFlagBitsNV.IMPORTABLE.value())


@register_passable("trivial")
struct ExternalMemoryFeatureFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ExternalMemoryFeatureFlagsNV:
        return ExternalMemoryFeatureFlagsNV(value = self._value | other._value)

    comptime DEDICATED_ONLY = Self(value = 1 << 0)
    comptime EXPORTABLE = Self(value = 1 << 1)
    comptime IMPORTABLE = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ExternalMemoryHandleTypeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ExternalMemoryHandleTypeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ExternalMemoryHandleTypeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ExternalMemoryHandleTypeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ExternalMemoryHandleTypeFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ExternalMemoryHandleTypeFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ExternalMemoryHandleTypeFlags) -> Bool:
        return self & other == other

    comptime OPAQUE_FD = Self(value = ExternalMemoryHandleTypeFlagBits.OPAQUE_FD.value())
    comptime OPAQUE_WIN32 = Self(value = ExternalMemoryHandleTypeFlagBits.OPAQUE_WIN32.value())
    comptime OPAQUE_WIN32_KMT = Self(value = ExternalMemoryHandleTypeFlagBits.OPAQUE_WIN32_KMT.value())
    comptime D3D11_TEXTURE = Self(value = ExternalMemoryHandleTypeFlagBits.D3D11_TEXTURE.value())
    comptime D3D11_TEXTURE_KMT = Self(value = ExternalMemoryHandleTypeFlagBits.D3D11_TEXTURE_KMT.value())
    comptime D3D12_HEAP = Self(value = ExternalMemoryHandleTypeFlagBits.D3D12_HEAP.value())
    comptime D3D12_RESOURCE = Self(value = ExternalMemoryHandleTypeFlagBits.D3D12_RESOURCE.value())
    comptime HOST_ALLOCATION = Self(value = ExternalMemoryHandleTypeFlagBits.HOST_ALLOCATION.value())
    comptime HOST_MAPPED_FOREIGN_MEMORY = Self(value = ExternalMemoryHandleTypeFlagBits.HOST_MAPPED_FOREIGN_MEMORY.value())
    comptime DMA_BUF = Self(value = ExternalMemoryHandleTypeFlagBits.DMA_BUF.value())
    comptime ANDROID_HARDWARE_BUFFER = Self(value = ExternalMemoryHandleTypeFlagBits.ANDROID_HARDWARE_BUFFER.value())
    comptime ZIRCON_VMO = Self(value = ExternalMemoryHandleTypeFlagBits.ZIRCON_VMO.value())
    comptime RDMA_ADDRESS = Self(value = ExternalMemoryHandleTypeFlagBits.RDMA_ADDRESS.value())
    comptime SCI_BUF = Self(value = ExternalMemoryHandleTypeFlagBits.SCI_BUF.value())
    comptime SCREEN_BUFFER = Self(value = ExternalMemoryHandleTypeFlagBits.SCREEN_BUFFER.value())
    comptime N_590 = Self(value = ExternalMemoryHandleTypeFlagBits.N_590.value())
    comptime MTLBUFFER = Self(value = ExternalMemoryHandleTypeFlagBits.MTLBUFFER.value())
    comptime MTLTEXTURE = Self(value = ExternalMemoryHandleTypeFlagBits.MTLTEXTURE.value())
    comptime MTLHEAP = Self(value = ExternalMemoryHandleTypeFlagBits.MTLHEAP.value())


@register_passable("trivial")
struct ExternalMemoryHandleTypeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ExternalMemoryHandleTypeFlags:
        return ExternalMemoryHandleTypeFlags(value = self._value | other._value)

    comptime OPAQUE_FD = Self(value = 1 << 0)
    comptime OPAQUE_WIN32 = Self(value = 1 << 1)
    comptime OPAQUE_WIN32_KMT = Self(value = 1 << 2)
    comptime D3D11_TEXTURE = Self(value = 1 << 3)
    comptime D3D11_TEXTURE_KMT = Self(value = 1 << 4)
    comptime D3D12_HEAP = Self(value = 1 << 5)
    comptime D3D12_RESOURCE = Self(value = 1 << 6)
    comptime HOST_ALLOCATION = Self(value = 1 << 7)
    comptime HOST_MAPPED_FOREIGN_MEMORY = Self(value = 1 << 8)
    comptime DMA_BUF = Self(value = 1 << 9)
    comptime ANDROID_HARDWARE_BUFFER = Self(value = 1 << 10)
    comptime ZIRCON_VMO = Self(value = 1 << 11)
    comptime RDMA_ADDRESS = Self(value = 1 << 12)
    comptime SCI_BUF = Self(value = 1 << 13)
    comptime SCREEN_BUFFER = Self(value = 1 << 14)
    comptime N_590 = Self(value = 1 << 15)
    comptime MTLBUFFER = Self(value = 1 << 16)
    comptime MTLTEXTURE = Self(value = 1 << 17)
    comptime MTLHEAP = Self(value = 1 << 18)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ExternalMemoryFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ExternalMemoryFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ExternalMemoryFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ExternalMemoryFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ExternalMemoryFeatureFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ExternalMemoryFeatureFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ExternalMemoryFeatureFlags) -> Bool:
        return self & other == other

    comptime DEDICATED_ONLY = Self(value = ExternalMemoryFeatureFlagBits.DEDICATED_ONLY.value())
    comptime EXPORTABLE = Self(value = ExternalMemoryFeatureFlagBits.EXPORTABLE.value())
    comptime IMPORTABLE = Self(value = ExternalMemoryFeatureFlagBits.IMPORTABLE.value())


@register_passable("trivial")
struct ExternalMemoryFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ExternalMemoryFeatureFlags:
        return ExternalMemoryFeatureFlags(value = self._value | other._value)

    comptime DEDICATED_ONLY = Self(value = 1 << 0)
    comptime EXPORTABLE = Self(value = 1 << 1)
    comptime IMPORTABLE = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ExternalSemaphoreHandleTypeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ExternalSemaphoreHandleTypeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ExternalSemaphoreHandleTypeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ExternalSemaphoreHandleTypeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ExternalSemaphoreHandleTypeFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ExternalSemaphoreHandleTypeFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ExternalSemaphoreHandleTypeFlags) -> Bool:
        return self & other == other

    comptime OPAQUE_FD = Self(value = ExternalSemaphoreHandleTypeFlagBits.OPAQUE_FD.value())
    comptime OPAQUE_WIN32 = Self(value = ExternalSemaphoreHandleTypeFlagBits.OPAQUE_WIN32.value())
    comptime OPAQUE_WIN32_KMT = Self(value = ExternalSemaphoreHandleTypeFlagBits.OPAQUE_WIN32_KMT.value())
    comptime D3D12_FENCE = Self(value = ExternalSemaphoreHandleTypeFlagBits.D3D12_FENCE.value())
    comptime SYNC_FD = Self(value = ExternalSemaphoreHandleTypeFlagBits.SYNC_FD.value())
    comptime SCI_SYNC_OBJ = Self(value = ExternalSemaphoreHandleTypeFlagBits.SCI_SYNC_OBJ.value())
    comptime ZIRCON_EVENT = Self(value = ExternalSemaphoreHandleTypeFlagBits.ZIRCON_EVENT.value())


@register_passable("trivial")
struct ExternalSemaphoreHandleTypeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ExternalSemaphoreHandleTypeFlags:
        return ExternalSemaphoreHandleTypeFlags(value = self._value | other._value)

    comptime OPAQUE_FD = Self(value = 1 << 0)
    comptime OPAQUE_WIN32 = Self(value = 1 << 1)
    comptime OPAQUE_WIN32_KMT = Self(value = 1 << 2)
    comptime D3D12_FENCE = Self(value = 1 << 3)
    comptime SYNC_FD = Self(value = 1 << 4)
    comptime SCI_SYNC_OBJ = Self(value = 1 << 5)
    comptime ZIRCON_EVENT = Self(value = 1 << 7)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ExternalSemaphoreFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ExternalSemaphoreFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ExternalSemaphoreFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ExternalSemaphoreFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ExternalSemaphoreFeatureFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ExternalSemaphoreFeatureFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ExternalSemaphoreFeatureFlags) -> Bool:
        return self & other == other

    comptime EXPORTABLE = Self(value = ExternalSemaphoreFeatureFlagBits.EXPORTABLE.value())
    comptime IMPORTABLE = Self(value = ExternalSemaphoreFeatureFlagBits.IMPORTABLE.value())


@register_passable("trivial")
struct ExternalSemaphoreFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ExternalSemaphoreFeatureFlags:
        return ExternalSemaphoreFeatureFlags(value = self._value | other._value)

    comptime EXPORTABLE = Self(value = 1 << 0)
    comptime IMPORTABLE = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SemaphoreImportFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SemaphoreImportFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SemaphoreImportFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SemaphoreImportFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SemaphoreImportFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SemaphoreImportFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: SemaphoreImportFlags) -> Bool:
        return self & other == other

    comptime TEMPORARY = Self(value = SemaphoreImportFlagBits.TEMPORARY.value())


@register_passable("trivial")
struct SemaphoreImportFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SemaphoreImportFlags:
        return SemaphoreImportFlags(value = self._value | other._value)

    comptime TEMPORARY = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ExternalFenceHandleTypeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ExternalFenceHandleTypeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ExternalFenceHandleTypeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ExternalFenceHandleTypeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ExternalFenceHandleTypeFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ExternalFenceHandleTypeFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ExternalFenceHandleTypeFlags) -> Bool:
        return self & other == other

    comptime OPAQUE_FD = Self(value = ExternalFenceHandleTypeFlagBits.OPAQUE_FD.value())
    comptime OPAQUE_WIN32 = Self(value = ExternalFenceHandleTypeFlagBits.OPAQUE_WIN32.value())
    comptime OPAQUE_WIN32_KMT = Self(value = ExternalFenceHandleTypeFlagBits.OPAQUE_WIN32_KMT.value())
    comptime SYNC_FD = Self(value = ExternalFenceHandleTypeFlagBits.SYNC_FD.value())
    comptime SCI_SYNC_OBJ = Self(value = ExternalFenceHandleTypeFlagBits.SCI_SYNC_OBJ.value())
    comptime SCI_SYNC_FENCE = Self(value = ExternalFenceHandleTypeFlagBits.SCI_SYNC_FENCE.value())


@register_passable("trivial")
struct ExternalFenceHandleTypeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ExternalFenceHandleTypeFlags:
        return ExternalFenceHandleTypeFlags(value = self._value | other._value)

    comptime OPAQUE_FD = Self(value = 1 << 0)
    comptime OPAQUE_WIN32 = Self(value = 1 << 1)
    comptime OPAQUE_WIN32_KMT = Self(value = 1 << 2)
    comptime SYNC_FD = Self(value = 1 << 3)
    comptime SCI_SYNC_OBJ = Self(value = 1 << 4)
    comptime SCI_SYNC_FENCE = Self(value = 1 << 5)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ExternalFenceFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ExternalFenceFeatureFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ExternalFenceFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ExternalFenceFeatureFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ExternalFenceFeatureFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ExternalFenceFeatureFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ExternalFenceFeatureFlags) -> Bool:
        return self & other == other

    comptime EXPORTABLE = Self(value = ExternalFenceFeatureFlagBits.EXPORTABLE.value())
    comptime IMPORTABLE = Self(value = ExternalFenceFeatureFlagBits.IMPORTABLE.value())


@register_passable("trivial")
struct ExternalFenceFeatureFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ExternalFenceFeatureFlags:
        return ExternalFenceFeatureFlags(value = self._value | other._value)

    comptime EXPORTABLE = Self(value = 1 << 0)
    comptime IMPORTABLE = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: FenceImportFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: FenceImportFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: FenceImportFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: FenceImportFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: FenceImportFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: FenceImportFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: FenceImportFlags) -> Bool:
        return self & other == other

    comptime TEMPORARY = Self(value = FenceImportFlagBits.TEMPORARY.value())


@register_passable("trivial")
struct FenceImportFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> FenceImportFlags:
        return FenceImportFlags(value = self._value | other._value)

    comptime TEMPORARY = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SurfaceCounterFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SurfaceCounterFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SurfaceCounterFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SurfaceCounterFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SurfaceCounterFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SurfaceCounterFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: SurfaceCounterFlagsEXT) -> Bool:
        return self & other == other

    comptime VBLANK = Self(value = SurfaceCounterFlagBitsEXT.VBLANK.value())


@register_passable("trivial")
struct SurfaceCounterFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SurfaceCounterFlagsEXT:
        return SurfaceCounterFlagsEXT(value = self._value | other._value)

    comptime VBLANK = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineViewportSwizzleStateCreateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineViewportSwizzleStateCreateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineViewportSwizzleStateCreateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineViewportSwizzleStateCreateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineViewportSwizzleStateCreateFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineViewportSwizzleStateCreateFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineViewportSwizzleStateCreateFlagsNV) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineViewportSwizzleStateCreateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineViewportSwizzleStateCreateFlagsNV:
        return PipelineViewportSwizzleStateCreateFlagsNV(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineDiscardRectangleStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineDiscardRectangleStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineDiscardRectangleStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineDiscardRectangleStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineDiscardRectangleStateCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineDiscardRectangleStateCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineDiscardRectangleStateCreateFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineDiscardRectangleStateCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineDiscardRectangleStateCreateFlagsEXT:
        return PipelineDiscardRectangleStateCreateFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineCoverageToColorStateCreateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineCoverageToColorStateCreateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineCoverageToColorStateCreateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineCoverageToColorStateCreateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineCoverageToColorStateCreateFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineCoverageToColorStateCreateFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineCoverageToColorStateCreateFlagsNV) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineCoverageToColorStateCreateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCoverageToColorStateCreateFlagsNV:
        return PipelineCoverageToColorStateCreateFlagsNV(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineCoverageModulationStateCreateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineCoverageModulationStateCreateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineCoverageModulationStateCreateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineCoverageModulationStateCreateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineCoverageModulationStateCreateFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineCoverageModulationStateCreateFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineCoverageModulationStateCreateFlagsNV) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineCoverageModulationStateCreateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCoverageModulationStateCreateFlagsNV:
        return PipelineCoverageModulationStateCreateFlagsNV(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineCoverageReductionStateCreateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineCoverageReductionStateCreateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineCoverageReductionStateCreateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineCoverageReductionStateCreateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineCoverageReductionStateCreateFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineCoverageReductionStateCreateFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineCoverageReductionStateCreateFlagsNV) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineCoverageReductionStateCreateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCoverageReductionStateCreateFlagsNV:
        return PipelineCoverageReductionStateCreateFlagsNV(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ValidationCacheCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ValidationCacheCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ValidationCacheCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ValidationCacheCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ValidationCacheCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ValidationCacheCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: ValidationCacheCreateFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct ValidationCacheCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ValidationCacheCreateFlagsEXT:
        return ValidationCacheCreateFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DebugUtilsMessageSeverityFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DebugUtilsMessageSeverityFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DebugUtilsMessageSeverityFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DebugUtilsMessageSeverityFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DebugUtilsMessageSeverityFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DebugUtilsMessageSeverityFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: DebugUtilsMessageSeverityFlagsEXT) -> Bool:
        return self & other == other

    comptime VERBOSE = Self(value = DebugUtilsMessageSeverityFlagBitsEXT.VERBOSE.value())
    comptime INFO = Self(value = DebugUtilsMessageSeverityFlagBitsEXT.INFO.value())
    comptime WARNING = Self(value = DebugUtilsMessageSeverityFlagBitsEXT.WARNING.value())
    comptime ERROR = Self(value = DebugUtilsMessageSeverityFlagBitsEXT.ERROR.value())


@register_passable("trivial")
struct DebugUtilsMessageSeverityFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DebugUtilsMessageSeverityFlagsEXT:
        return DebugUtilsMessageSeverityFlagsEXT(value = self._value | other._value)

    comptime VERBOSE = Self(value = 1 << 0)
    comptime INFO = Self(value = 1 << 4)
    comptime WARNING = Self(value = 1 << 8)
    comptime ERROR = Self(value = 1 << 12)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DebugUtilsMessageTypeFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DebugUtilsMessageTypeFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DebugUtilsMessageTypeFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DebugUtilsMessageTypeFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DebugUtilsMessageTypeFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DebugUtilsMessageTypeFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: DebugUtilsMessageTypeFlagsEXT) -> Bool:
        return self & other == other

    comptime GENERAL = Self(value = DebugUtilsMessageTypeFlagBitsEXT.GENERAL.value())
    comptime VALIDATION = Self(value = DebugUtilsMessageTypeFlagBitsEXT.VALIDATION.value())
    comptime PERFORMANCE = Self(value = DebugUtilsMessageTypeFlagBitsEXT.PERFORMANCE.value())
    comptime DEVICE_ADDRESS_BINDING = Self(value = DebugUtilsMessageTypeFlagBitsEXT.DEVICE_ADDRESS_BINDING.value())


@register_passable("trivial")
struct DebugUtilsMessageTypeFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DebugUtilsMessageTypeFlagsEXT:
        return DebugUtilsMessageTypeFlagsEXT(value = self._value | other._value)

    comptime GENERAL = Self(value = 1 << 0)
    comptime VALIDATION = Self(value = 1 << 1)
    comptime PERFORMANCE = Self(value = 1 << 2)
    comptime DEVICE_ADDRESS_BINDING = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DebugUtilsMessengerCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DebugUtilsMessengerCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DebugUtilsMessengerCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DebugUtilsMessengerCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DebugUtilsMessengerCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DebugUtilsMessengerCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: DebugUtilsMessengerCreateFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DebugUtilsMessengerCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DebugUtilsMessengerCreateFlagsEXT:
        return DebugUtilsMessengerCreateFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DebugUtilsMessengerCallbackDataFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DebugUtilsMessengerCallbackDataFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DebugUtilsMessengerCallbackDataFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DebugUtilsMessengerCallbackDataFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DebugUtilsMessengerCallbackDataFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DebugUtilsMessengerCallbackDataFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: DebugUtilsMessengerCallbackDataFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DebugUtilsMessengerCallbackDataFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DebugUtilsMessengerCallbackDataFlagsEXT:
        return DebugUtilsMessengerCallbackDataFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DeviceMemoryReportFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DeviceMemoryReportFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DeviceMemoryReportFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DeviceMemoryReportFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DeviceMemoryReportFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DeviceMemoryReportFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: DeviceMemoryReportFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct DeviceMemoryReportFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DeviceMemoryReportFlagsEXT:
        return DeviceMemoryReportFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineRasterizationConservativeStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineRasterizationConservativeStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineRasterizationConservativeStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineRasterizationConservativeStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineRasterizationConservativeStateCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineRasterizationConservativeStateCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineRasterizationConservativeStateCreateFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineRasterizationConservativeStateCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineRasterizationConservativeStateCreateFlagsEXT:
        return PipelineRasterizationConservativeStateCreateFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DescriptorBindingFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DescriptorBindingFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DescriptorBindingFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DescriptorBindingFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DescriptorBindingFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DescriptorBindingFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: DescriptorBindingFlags) -> Bool:
        return self & other == other

    comptime UPDATE_AFTER_BIND = Self(value = DescriptorBindingFlagBits.UPDATE_AFTER_BIND.value())
    comptime UPDATE_UNUSED_WHILE_PENDING = Self(value = DescriptorBindingFlagBits.UPDATE_UNUSED_WHILE_PENDING.value())
    comptime PARTIALLY_BOUND = Self(value = DescriptorBindingFlagBits.PARTIALLY_BOUND.value())
    comptime VARIABLE_DESCRIPTOR_COUNT = Self(value = DescriptorBindingFlagBits.VARIABLE_DESCRIPTOR_COUNT.value())
    comptime RESERVED_4 = Self(value = DescriptorBindingFlagBits.RESERVED_4.value())


@register_passable("trivial")
struct DescriptorBindingFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DescriptorBindingFlags:
        return DescriptorBindingFlags(value = self._value | other._value)

    comptime UPDATE_AFTER_BIND = Self(value = 1 << 0)
    comptime UPDATE_UNUSED_WHILE_PENDING = Self(value = 1 << 1)
    comptime PARTIALLY_BOUND = Self(value = 1 << 2)
    comptime VARIABLE_DESCRIPTOR_COUNT = Self(value = 1 << 3)
    comptime RESERVED_4 = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ConditionalRenderingFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ConditionalRenderingFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ConditionalRenderingFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ConditionalRenderingFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ConditionalRenderingFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ConditionalRenderingFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: ConditionalRenderingFlagsEXT) -> Bool:
        return self & other == other

    comptime INVERTED = Self(value = ConditionalRenderingFlagBitsEXT.INVERTED.value())


@register_passable("trivial")
struct ConditionalRenderingFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ConditionalRenderingFlagsEXT:
        return ConditionalRenderingFlagsEXT(value = self._value | other._value)

    comptime INVERTED = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ResolveModeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ResolveModeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ResolveModeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ResolveModeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ResolveModeFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ResolveModeFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ResolveModeFlags) -> Bool:
        return self & other == other

    comptime NONE = Self(value = ResolveModeFlagBits.NONE.value())
    comptime SAMPLE_ZERO = Self(value = ResolveModeFlagBits.SAMPLE_ZERO.value())
    comptime AVERAGE = Self(value = ResolveModeFlagBits.AVERAGE.value())
    comptime MIN = Self(value = ResolveModeFlagBits.MIN.value())
    comptime MAX = Self(value = ResolveModeFlagBits.MAX.value())
    comptime EXTERNAL_FORMAT_DOWNSAMPLE = Self(value = ResolveModeFlagBits.EXTERNAL_FORMAT_DOWNSAMPLE.value())
    comptime RESERVED_5 = Self(value = ResolveModeFlagBits.RESERVED_5.value())


@register_passable("trivial")
struct ResolveModeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ResolveModeFlags:
        return ResolveModeFlags(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime SAMPLE_ZERO = Self(value = 1 << 0)
    comptime AVERAGE = Self(value = 1 << 1)
    comptime MIN = Self(value = 1 << 2)
    comptime MAX = Self(value = 1 << 3)
    comptime EXTERNAL_FORMAT_DOWNSAMPLE = Self(value = 1 << 4)
    comptime RESERVED_5 = Self(value = 1 << 5)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineRasterizationStateStreamCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineRasterizationStateStreamCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineRasterizationStateStreamCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineRasterizationStateStreamCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineRasterizationStateStreamCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineRasterizationStateStreamCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineRasterizationStateStreamCreateFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineRasterizationStateStreamCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineRasterizationStateStreamCreateFlagsEXT:
        return PipelineRasterizationStateStreamCreateFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PipelineRasterizationDepthClipStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PipelineRasterizationDepthClipStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PipelineRasterizationDepthClipStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PipelineRasterizationDepthClipStateCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PipelineRasterizationDepthClipStateCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PipelineRasterizationDepthClipStateCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: PipelineRasterizationDepthClipStateCreateFlagsEXT) -> Bool:
        return self & other == other


@register_passable("trivial")
struct PipelineRasterizationDepthClipStateCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineRasterizationDepthClipStateCreateFlagsEXT:
        return PipelineRasterizationDepthClipStateCreateFlagsEXT(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SwapchainImageUsageFlagsANDROID) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SwapchainImageUsageFlagsANDROID) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SwapchainImageUsageFlagsANDROID) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SwapchainImageUsageFlagsANDROID) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SwapchainImageUsageFlagsANDROID) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SwapchainImageUsageFlagsANDROID) -> Bool:
        return self & other == self

    fn is_superset(self, other: SwapchainImageUsageFlagsANDROID) -> Bool:
        return self & other == other

    comptime SHARED = Self(value = SwapchainImageUsageFlagBitsANDROID.SHARED.value())


@register_passable("trivial")
struct SwapchainImageUsageFlagBitsANDROID(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SwapchainImageUsageFlagsANDROID:
        return SwapchainImageUsageFlagsANDROID(value = self._value | other._value)

    comptime SHARED = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ToolPurposeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ToolPurposeFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ToolPurposeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ToolPurposeFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ToolPurposeFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ToolPurposeFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: ToolPurposeFlags) -> Bool:
        return self & other == other

    comptime VALIDATION = Self(value = ToolPurposeFlagBits.VALIDATION.value())
    comptime PROFILING = Self(value = ToolPurposeFlagBits.PROFILING.value())
    comptime TRACING = Self(value = ToolPurposeFlagBits.TRACING.value())
    comptime ADDITIONAL_FEATURES = Self(value = ToolPurposeFlagBits.ADDITIONAL_FEATURES.value())
    comptime MODIFYING_FEATURES = Self(value = ToolPurposeFlagBits.MODIFYING_FEATURES.value())
    comptime DEBUG_REPORTING = Self(value = ToolPurposeFlagBits.DEBUG_REPORTING.value())
    comptime DEBUG_MARKERS = Self(value = ToolPurposeFlagBits.DEBUG_MARKERS.value())


@register_passable("trivial")
struct ToolPurposeFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ToolPurposeFlags:
        return ToolPurposeFlags(value = self._value | other._value)

    comptime VALIDATION = Self(value = 1 << 0)
    comptime PROFILING = Self(value = 1 << 1)
    comptime TRACING = Self(value = 1 << 2)
    comptime ADDITIONAL_FEATURES = Self(value = 1 << 3)
    comptime MODIFYING_FEATURES = Self(value = 1 << 4)
    comptime DEBUG_REPORTING = Self(value = 1 << 5)
    comptime DEBUG_MARKERS = Self(value = 1 << 6)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SubmitFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SubmitFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SubmitFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SubmitFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SubmitFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SubmitFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: SubmitFlags) -> Bool:
        return self & other == other

    comptime PROTECTED = Self(value = SubmitFlagBits.PROTECTED.value())


@register_passable("trivial")
struct SubmitFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SubmitFlags:
        return SubmitFlags(value = self._value | other._value)

    comptime PROTECTED = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ImageFormatConstraintsFlagsFUCHSIA) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ImageFormatConstraintsFlagsFUCHSIA) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ImageFormatConstraintsFlagsFUCHSIA) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ImageFormatConstraintsFlagsFUCHSIA) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ImageFormatConstraintsFlagsFUCHSIA) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ImageFormatConstraintsFlagsFUCHSIA) -> Bool:
        return self & other == self

    fn is_superset(self, other: ImageFormatConstraintsFlagsFUCHSIA) -> Bool:
        return self & other == other


@register_passable("trivial")
struct ImageFormatConstraintsFlagBitsFUCHSIA(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImageFormatConstraintsFlagsFUCHSIA:
        return ImageFormatConstraintsFlagsFUCHSIA(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: HostImageCopyFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: HostImageCopyFlags) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: HostImageCopyFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: HostImageCopyFlags) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: HostImageCopyFlags) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: HostImageCopyFlags) -> Bool:
        return self & other == self

    fn is_superset(self, other: HostImageCopyFlags) -> Bool:
        return self & other == other

    comptime MEMCPY = Self(value = HostImageCopyFlagBits.MEMCPY.value())


@register_passable("trivial")
struct HostImageCopyFlagBits(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> HostImageCopyFlags:
        return HostImageCopyFlags(value = self._value | other._value)

    comptime MEMCPY = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PartitionedAccelerationStructureInstanceFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PartitionedAccelerationStructureInstanceFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PartitionedAccelerationStructureInstanceFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PartitionedAccelerationStructureInstanceFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PartitionedAccelerationStructureInstanceFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PartitionedAccelerationStructureInstanceFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: PartitionedAccelerationStructureInstanceFlagsNV) -> Bool:
        return self & other == other

    comptime FLAG_TRIANGLE_FACING_CULL_DISABLE = Self(value = PartitionedAccelerationStructureInstanceFlagBitsNV.FLAG_TRIANGLE_FACING_CULL_DISABLE.value())
    comptime FLAG_TRIANGLE_FLIP_FACING = Self(value = PartitionedAccelerationStructureInstanceFlagBitsNV.FLAG_TRIANGLE_FLIP_FACING.value())
    comptime FLAG_FORCE_OPAQUE = Self(value = PartitionedAccelerationStructureInstanceFlagBitsNV.FLAG_FORCE_OPAQUE.value())
    comptime FLAG_FORCE_NO_OPAQUE = Self(value = PartitionedAccelerationStructureInstanceFlagBitsNV.FLAG_FORCE_NO_OPAQUE.value())
    comptime FLAG_ENABLE_EXPLICIT_BOUNDING_BOX = Self(value = PartitionedAccelerationStructureInstanceFlagBitsNV.FLAG_ENABLE_EXPLICIT_BOUNDING_BOX.value())


@register_passable("trivial")
struct PartitionedAccelerationStructureInstanceFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PartitionedAccelerationStructureInstanceFlagsNV:
        return PartitionedAccelerationStructureInstanceFlagsNV(value = self._value | other._value)

    comptime FLAG_TRIANGLE_FACING_CULL_DISABLE = Self(value = 1 << 0)
    comptime FLAG_TRIANGLE_FLIP_FACING = Self(value = 1 << 1)
    comptime FLAG_FORCE_OPAQUE = Self(value = 1 << 2)
    comptime FLAG_FORCE_NO_OPAQUE = Self(value = 1 << 3)
    comptime FLAG_ENABLE_EXPLICIT_BOUNDING_BOX = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ImageConstraintsInfoFlagsFUCHSIA) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ImageConstraintsInfoFlagsFUCHSIA) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ImageConstraintsInfoFlagsFUCHSIA) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ImageConstraintsInfoFlagsFUCHSIA) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ImageConstraintsInfoFlagsFUCHSIA) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ImageConstraintsInfoFlagsFUCHSIA) -> Bool:
        return self & other == self

    fn is_superset(self, other: ImageConstraintsInfoFlagsFUCHSIA) -> Bool:
        return self & other == other

    comptime CPU_READ_RARELY = Self(value = ImageConstraintsInfoFlagBitsFUCHSIA.CPU_READ_RARELY.value())
    comptime CPU_READ_OFTEN = Self(value = ImageConstraintsInfoFlagBitsFUCHSIA.CPU_READ_OFTEN.value())
    comptime CPU_WRITE_RARELY = Self(value = ImageConstraintsInfoFlagBitsFUCHSIA.CPU_WRITE_RARELY.value())
    comptime CPU_WRITE_OFTEN = Self(value = ImageConstraintsInfoFlagBitsFUCHSIA.CPU_WRITE_OFTEN.value())
    comptime PROTECTED_OPTIONAL = Self(value = ImageConstraintsInfoFlagBitsFUCHSIA.PROTECTED_OPTIONAL.value())


@register_passable("trivial")
struct ImageConstraintsInfoFlagBitsFUCHSIA(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImageConstraintsInfoFlagsFUCHSIA:
        return ImageConstraintsInfoFlagsFUCHSIA(value = self._value | other._value)

    comptime CPU_READ_RARELY = Self(value = 1 << 0)
    comptime CPU_READ_OFTEN = Self(value = 1 << 1)
    comptime CPU_WRITE_RARELY = Self(value = 1 << 2)
    comptime CPU_WRITE_OFTEN = Self(value = 1 << 3)
    comptime PROTECTED_OPTIONAL = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: GraphicsPipelineLibraryFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: GraphicsPipelineLibraryFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: GraphicsPipelineLibraryFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: GraphicsPipelineLibraryFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: GraphicsPipelineLibraryFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: GraphicsPipelineLibraryFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: GraphicsPipelineLibraryFlagsEXT) -> Bool:
        return self & other == other

    comptime VERTEX_INPUT_INTERFACE = Self(value = GraphicsPipelineLibraryFlagBitsEXT.VERTEX_INPUT_INTERFACE.value())
    comptime PRE_RASTERIZATION_SHADERS = Self(value = GraphicsPipelineLibraryFlagBitsEXT.PRE_RASTERIZATION_SHADERS.value())
    comptime FRAGMENT_SHADER = Self(value = GraphicsPipelineLibraryFlagBitsEXT.FRAGMENT_SHADER.value())
    comptime FRAGMENT_OUTPUT_INTERFACE = Self(value = GraphicsPipelineLibraryFlagBitsEXT.FRAGMENT_OUTPUT_INTERFACE.value())


@register_passable("trivial")
struct GraphicsPipelineLibraryFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> GraphicsPipelineLibraryFlagsEXT:
        return GraphicsPipelineLibraryFlagsEXT(value = self._value | other._value)

    comptime VERTEX_INPUT_INTERFACE = Self(value = 1 << 0)
    comptime PRE_RASTERIZATION_SHADERS = Self(value = 1 << 1)
    comptime FRAGMENT_SHADER = Self(value = 1 << 2)
    comptime FRAGMENT_OUTPUT_INTERFACE = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ImageCompressionFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ImageCompressionFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ImageCompressionFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ImageCompressionFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ImageCompressionFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ImageCompressionFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: ImageCompressionFlagsEXT) -> Bool:
        return self & other == other

    comptime DEFAULT = Self(value = ImageCompressionFlagBitsEXT.DEFAULT.value())
    comptime FIXED_RATE_DEFAULT = Self(value = ImageCompressionFlagBitsEXT.FIXED_RATE_DEFAULT.value())
    comptime FIXED_RATE_EXPLICIT = Self(value = ImageCompressionFlagBitsEXT.FIXED_RATE_EXPLICIT.value())
    comptime DISABLED = Self(value = ImageCompressionFlagBitsEXT.DISABLED.value())


@register_passable("trivial")
struct ImageCompressionFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImageCompressionFlagsEXT:
        return ImageCompressionFlagsEXT(value = self._value | other._value)

    comptime DEFAULT = Self(value = 0)
    comptime FIXED_RATE_DEFAULT = Self(value = 1 << 0)
    comptime FIXED_RATE_EXPLICIT = Self(value = 1 << 1)
    comptime DISABLED = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ImageCompressionFixedRateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ImageCompressionFixedRateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ImageCompressionFixedRateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ImageCompressionFixedRateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ImageCompressionFixedRateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ImageCompressionFixedRateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: ImageCompressionFixedRateFlagsEXT) -> Bool:
        return self & other == other

    comptime NONE = Self(value = ImageCompressionFixedRateFlagBitsEXT.NONE.value())
    comptime N_1BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_1BPC.value())
    comptime N_2BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_2BPC.value())
    comptime N_3BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_3BPC.value())
    comptime N_4BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_4BPC.value())
    comptime N_5BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_5BPC.value())
    comptime N_6BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_6BPC.value())
    comptime N_7BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_7BPC.value())
    comptime N_8BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_8BPC.value())
    comptime N_9BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_9BPC.value())
    comptime N_10BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_10BPC.value())
    comptime N_11BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_11BPC.value())
    comptime N_12BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_12BPC.value())
    comptime N_13BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_13BPC.value())
    comptime N_14BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_14BPC.value())
    comptime N_15BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_15BPC.value())
    comptime N_16BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_16BPC.value())
    comptime N_17BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_17BPC.value())
    comptime N_18BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_18BPC.value())
    comptime N_19BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_19BPC.value())
    comptime N_20BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_20BPC.value())
    comptime N_21BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_21BPC.value())
    comptime N_22BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_22BPC.value())
    comptime N_23BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_23BPC.value())
    comptime N_24BPC = Self(value = ImageCompressionFixedRateFlagBitsEXT.N_24BPC.value())


@register_passable("trivial")
struct ImageCompressionFixedRateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImageCompressionFixedRateFlagsEXT:
        return ImageCompressionFixedRateFlagsEXT(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime N_1BPC = Self(value = 1 << 0)
    comptime N_2BPC = Self(value = 1 << 1)
    comptime N_3BPC = Self(value = 1 << 2)
    comptime N_4BPC = Self(value = 1 << 3)
    comptime N_5BPC = Self(value = 1 << 4)
    comptime N_6BPC = Self(value = 1 << 5)
    comptime N_7BPC = Self(value = 1 << 6)
    comptime N_8BPC = Self(value = 1 << 7)
    comptime N_9BPC = Self(value = 1 << 8)
    comptime N_10BPC = Self(value = 1 << 9)
    comptime N_11BPC = Self(value = 1 << 10)
    comptime N_12BPC = Self(value = 1 << 11)
    comptime N_13BPC = Self(value = 1 << 12)
    comptime N_14BPC = Self(value = 1 << 13)
    comptime N_15BPC = Self(value = 1 << 14)
    comptime N_16BPC = Self(value = 1 << 15)
    comptime N_17BPC = Self(value = 1 << 16)
    comptime N_18BPC = Self(value = 1 << 17)
    comptime N_19BPC = Self(value = 1 << 18)
    comptime N_20BPC = Self(value = 1 << 19)
    comptime N_21BPC = Self(value = 1 << 20)
    comptime N_22BPC = Self(value = 1 << 21)
    comptime N_23BPC = Self(value = 1 << 22)
    comptime N_24BPC = Self(value = 1 << 23)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ExportMetalObjectTypeFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ExportMetalObjectTypeFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ExportMetalObjectTypeFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ExportMetalObjectTypeFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ExportMetalObjectTypeFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ExportMetalObjectTypeFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: ExportMetalObjectTypeFlagsEXT) -> Bool:
        return self & other == other

    comptime METAL_DEVICE = Self(value = ExportMetalObjectTypeFlagBitsEXT.METAL_DEVICE.value())
    comptime METAL_COMMAND_QUEUE = Self(value = ExportMetalObjectTypeFlagBitsEXT.METAL_COMMAND_QUEUE.value())
    comptime METAL_BUFFER = Self(value = ExportMetalObjectTypeFlagBitsEXT.METAL_BUFFER.value())
    comptime METAL_TEXTURE = Self(value = ExportMetalObjectTypeFlagBitsEXT.METAL_TEXTURE.value())
    comptime METAL_IOSURFACE = Self(value = ExportMetalObjectTypeFlagBitsEXT.METAL_IOSURFACE.value())
    comptime METAL_SHARED_EVENT = Self(value = ExportMetalObjectTypeFlagBitsEXT.METAL_SHARED_EVENT.value())


@register_passable("trivial")
struct ExportMetalObjectTypeFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ExportMetalObjectTypeFlagsEXT:
        return ExportMetalObjectTypeFlagsEXT(value = self._value | other._value)

    comptime METAL_DEVICE = Self(value = 1 << 0)
    comptime METAL_COMMAND_QUEUE = Self(value = 1 << 1)
    comptime METAL_BUFFER = Self(value = 1 << 2)
    comptime METAL_TEXTURE = Self(value = 1 << 3)
    comptime METAL_IOSURFACE = Self(value = 1 << 4)
    comptime METAL_SHARED_EVENT = Self(value = 1 << 5)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: DeviceAddressBindingFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: DeviceAddressBindingFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: DeviceAddressBindingFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: DeviceAddressBindingFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: DeviceAddressBindingFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: DeviceAddressBindingFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: DeviceAddressBindingFlagsEXT) -> Bool:
        return self & other == other

    comptime INTERNAL_OBJECT = Self(value = DeviceAddressBindingFlagBitsEXT.INTERNAL_OBJECT.value())


@register_passable("trivial")
struct DeviceAddressBindingFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DeviceAddressBindingFlagsEXT:
        return DeviceAddressBindingFlagsEXT(value = self._value | other._value)

    comptime INTERNAL_OBJECT = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: OpticalFlowGridSizeFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: OpticalFlowGridSizeFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: OpticalFlowGridSizeFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: OpticalFlowGridSizeFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: OpticalFlowGridSizeFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: OpticalFlowGridSizeFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: OpticalFlowGridSizeFlagsNV) -> Bool:
        return self & other == other

    comptime UNKNOWN = Self(value = OpticalFlowGridSizeFlagBitsNV.UNKNOWN.value())
    comptime N_1X1 = Self(value = OpticalFlowGridSizeFlagBitsNV.N_1X1.value())
    comptime N_2X2 = Self(value = OpticalFlowGridSizeFlagBitsNV.N_2X2.value())
    comptime N_4X4 = Self(value = OpticalFlowGridSizeFlagBitsNV.N_4X4.value())
    comptime N_8X8 = Self(value = OpticalFlowGridSizeFlagBitsNV.N_8X8.value())


@register_passable("trivial")
struct OpticalFlowGridSizeFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> OpticalFlowGridSizeFlagsNV:
        return OpticalFlowGridSizeFlagsNV(value = self._value | other._value)

    comptime UNKNOWN = Self(value = 0)
    comptime N_1X1 = Self(value = 1 << 0)
    comptime N_2X2 = Self(value = 1 << 1)
    comptime N_4X4 = Self(value = 1 << 2)
    comptime N_8X8 = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: OpticalFlowUsageFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: OpticalFlowUsageFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: OpticalFlowUsageFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: OpticalFlowUsageFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: OpticalFlowUsageFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: OpticalFlowUsageFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: OpticalFlowUsageFlagsNV) -> Bool:
        return self & other == other

    comptime UNKNOWN = Self(value = OpticalFlowUsageFlagBitsNV.UNKNOWN.value())
    comptime INPUT = Self(value = OpticalFlowUsageFlagBitsNV.INPUT.value())
    comptime OUTPUT = Self(value = OpticalFlowUsageFlagBitsNV.OUTPUT.value())
    comptime HINT = Self(value = OpticalFlowUsageFlagBitsNV.HINT.value())
    comptime COST = Self(value = OpticalFlowUsageFlagBitsNV.COST.value())
    comptime GLOBAL_FLOW = Self(value = OpticalFlowUsageFlagBitsNV.GLOBAL_FLOW.value())


@register_passable("trivial")
struct OpticalFlowUsageFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> OpticalFlowUsageFlagsNV:
        return OpticalFlowUsageFlagsNV(value = self._value | other._value)

    comptime UNKNOWN = Self(value = 0)
    comptime INPUT = Self(value = 1 << 0)
    comptime OUTPUT = Self(value = 1 << 1)
    comptime HINT = Self(value = 1 << 2)
    comptime COST = Self(value = 1 << 3)
    comptime GLOBAL_FLOW = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: OpticalFlowSessionCreateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: OpticalFlowSessionCreateFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: OpticalFlowSessionCreateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: OpticalFlowSessionCreateFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: OpticalFlowSessionCreateFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: OpticalFlowSessionCreateFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: OpticalFlowSessionCreateFlagsNV) -> Bool:
        return self & other == other

    comptime ENABLE_HINT = Self(value = OpticalFlowSessionCreateFlagBitsNV.ENABLE_HINT.value())
    comptime ENABLE_COST = Self(value = OpticalFlowSessionCreateFlagBitsNV.ENABLE_COST.value())
    comptime ENABLE_GLOBAL_FLOW = Self(value = OpticalFlowSessionCreateFlagBitsNV.ENABLE_GLOBAL_FLOW.value())
    comptime ALLOW_REGIONS = Self(value = OpticalFlowSessionCreateFlagBitsNV.ALLOW_REGIONS.value())
    comptime BOTH_DIRECTIONS = Self(value = OpticalFlowSessionCreateFlagBitsNV.BOTH_DIRECTIONS.value())


@register_passable("trivial")
struct OpticalFlowSessionCreateFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> OpticalFlowSessionCreateFlagsNV:
        return OpticalFlowSessionCreateFlagsNV(value = self._value | other._value)

    comptime ENABLE_HINT = Self(value = 1 << 0)
    comptime ENABLE_COST = Self(value = 1 << 1)
    comptime ENABLE_GLOBAL_FLOW = Self(value = 1 << 2)
    comptime ALLOW_REGIONS = Self(value = 1 << 3)
    comptime BOTH_DIRECTIONS = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: OpticalFlowExecuteFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: OpticalFlowExecuteFlagsNV) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: OpticalFlowExecuteFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: OpticalFlowExecuteFlagsNV) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: OpticalFlowExecuteFlagsNV) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: OpticalFlowExecuteFlagsNV) -> Bool:
        return self & other == self

    fn is_superset(self, other: OpticalFlowExecuteFlagsNV) -> Bool:
        return self & other == other

    comptime DISABLE_TEMPORAL_HINTS = Self(value = OpticalFlowExecuteFlagBitsNV.DISABLE_TEMPORAL_HINTS.value())


@register_passable("trivial")
struct OpticalFlowExecuteFlagBitsNV(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> OpticalFlowExecuteFlagsNV:
        return OpticalFlowExecuteFlagsNV(value = self._value | other._value)

    comptime DISABLE_TEMPORAL_HINTS = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: FrameBoundaryFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: FrameBoundaryFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: FrameBoundaryFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: FrameBoundaryFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: FrameBoundaryFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: FrameBoundaryFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: FrameBoundaryFlagsEXT) -> Bool:
        return self & other == other

    comptime FRAME_END = Self(value = FrameBoundaryFlagBitsEXT.FRAME_END.value())


@register_passable("trivial")
struct FrameBoundaryFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> FrameBoundaryFlagsEXT:
        return FrameBoundaryFlagsEXT(value = self._value | other._value)

    comptime FRAME_END = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PresentScalingFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PresentScalingFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PresentScalingFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PresentScalingFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PresentScalingFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PresentScalingFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: PresentScalingFlagsKHR) -> Bool:
        return self & other == other

    comptime ONE_TO_ONE = Self(value = PresentScalingFlagBitsKHR.ONE_TO_ONE.value())
    comptime ASPECT_RATIO_STRETCH = Self(value = PresentScalingFlagBitsKHR.ASPECT_RATIO_STRETCH.value())
    comptime STRETCH = Self(value = PresentScalingFlagBitsKHR.STRETCH.value())


@register_passable("trivial")
struct PresentScalingFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PresentScalingFlagsKHR:
        return PresentScalingFlagsKHR(value = self._value | other._value)

    comptime ONE_TO_ONE = Self(value = 1 << 0)
    comptime ASPECT_RATIO_STRETCH = Self(value = 1 << 1)
    comptime STRETCH = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PresentGravityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PresentGravityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PresentGravityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PresentGravityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PresentGravityFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PresentGravityFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: PresentGravityFlagsKHR) -> Bool:
        return self & other == other

    comptime MIN = Self(value = PresentGravityFlagBitsKHR.MIN.value())
    comptime MAX = Self(value = PresentGravityFlagBitsKHR.MAX.value())
    comptime CENTERED = Self(value = PresentGravityFlagBitsKHR.CENTERED.value())


@register_passable("trivial")
struct PresentGravityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PresentGravityFlagsKHR:
        return PresentGravityFlagsKHR(value = self._value | other._value)

    comptime MIN = Self(value = 1 << 0)
    comptime MAX = Self(value = 1 << 1)
    comptime CENTERED = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ShaderCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ShaderCreateFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ShaderCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ShaderCreateFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ShaderCreateFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ShaderCreateFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: ShaderCreateFlagsEXT) -> Bool:
        return self & other == other

    comptime LINK_STAGE = Self(value = ShaderCreateFlagBitsEXT.LINK_STAGE.value())
    comptime ALLOW_VARYING_SUBGROUP_SIZE = Self(value = ShaderCreateFlagBitsEXT.ALLOW_VARYING_SUBGROUP_SIZE.value())
    comptime REQUIRE_FULL_SUBGROUPS = Self(value = ShaderCreateFlagBitsEXT.REQUIRE_FULL_SUBGROUPS.value())
    comptime NO_TASK_SHADER = Self(value = ShaderCreateFlagBitsEXT.NO_TASK_SHADER.value())
    comptime DISPATCH_BASE = Self(value = ShaderCreateFlagBitsEXT.DISPATCH_BASE.value())
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = ShaderCreateFlagBitsEXT.FRAGMENT_SHADING_RATE_ATTACHMENT.value())
    comptime FRAGMENT_DENSITY_MAP_ATTACHMENT = Self(value = ShaderCreateFlagBitsEXT.FRAGMENT_DENSITY_MAP_ATTACHMENT.value())
    comptime INDIRECT_BINDABLE = Self(value = ShaderCreateFlagBitsEXT.INDIRECT_BINDABLE.value())
    comptime RESERVED_8 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_8.value())
    comptime RESERVED_9 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_9.value())
    comptime RESERVED_10 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_10.value())
    comptime RESERVED_11 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_11.value())
    comptime RESERVED_12 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_12.value())
    comptime RESERVED_13 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_13.value())
    comptime RESERVED_14 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_14.value())
    comptime RESERVED_15 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_15.value())
    comptime RESERVED_16 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_16.value())
    comptime RESERVED_17 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_17.value())
    comptime RESERVED_18 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_18.value())


@register_passable("trivial")
struct ShaderCreateFlagBitsEXT(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ShaderCreateFlagsEXT:
        return ShaderCreateFlagsEXT(value = self._value | other._value)

    comptime LINK_STAGE = Self(value = 1 << 0)
    comptime ALLOW_VARYING_SUBGROUP_SIZE = Self(value = 1 << 1)
    comptime REQUIRE_FULL_SUBGROUPS = Self(value = 1 << 2)
    comptime NO_TASK_SHADER = Self(value = 1 << 3)
    comptime DISPATCH_BASE = Self(value = 1 << 4)
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT = Self(value = 1 << 5)
    comptime FRAGMENT_DENSITY_MAP_ATTACHMENT = Self(value = 1 << 6)
    comptime INDIRECT_BINDABLE = Self(value = 1 << 7)
    comptime RESERVED_8 = Self(value = 1 << 8)
    comptime RESERVED_9 = Self(value = 1 << 9)
    comptime RESERVED_10 = Self(value = 1 << 10)
    comptime RESERVED_11 = Self(value = 1 << 11)
    comptime RESERVED_12 = Self(value = 1 << 12)
    comptime RESERVED_13 = Self(value = 1 << 13)
    comptime RESERVED_14 = Self(value = 1 << 14)
    comptime RESERVED_15 = Self(value = 1 << 15)
    comptime RESERVED_16 = Self(value = 1 << 16)
    comptime RESERVED_17 = Self(value = 1 << 17)
    comptime RESERVED_18 = Self(value = 1 << 18)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: TileShadingRenderPassFlagsQCOM) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: TileShadingRenderPassFlagsQCOM) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: TileShadingRenderPassFlagsQCOM) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: TileShadingRenderPassFlagsQCOM) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: TileShadingRenderPassFlagsQCOM) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: TileShadingRenderPassFlagsQCOM) -> Bool:
        return self & other == self

    fn is_superset(self, other: TileShadingRenderPassFlagsQCOM) -> Bool:
        return self & other == other

    comptime ENABLE = Self(value = TileShadingRenderPassFlagBitsQCOM.ENABLE.value())
    comptime PER_TILE_EXECUTION = Self(value = TileShadingRenderPassFlagBitsQCOM.PER_TILE_EXECUTION.value())


@register_passable("trivial")
struct TileShadingRenderPassFlagBitsQCOM(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> TileShadingRenderPassFlagsQCOM:
        return TileShadingRenderPassFlagsQCOM(value = self._value | other._value)

    comptime ENABLE = Self(value = 1 << 0)
    comptime PER_TILE_EXECUTION = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PhysicalDeviceSchedulingControlsFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PhysicalDeviceSchedulingControlsFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PhysicalDeviceSchedulingControlsFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PhysicalDeviceSchedulingControlsFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PhysicalDeviceSchedulingControlsFlagsARM) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PhysicalDeviceSchedulingControlsFlagsARM) -> Bool:
        return self & other == self

    fn is_superset(self, other: PhysicalDeviceSchedulingControlsFlagsARM) -> Bool:
        return self & other == other

    comptime SHADER_CORE_COUNT = Self(value = PhysicalDeviceSchedulingControlsFlagBitsARM.SHADER_CORE_COUNT.value())


@register_passable("trivial")
struct PhysicalDeviceSchedulingControlsFlagBitsARM(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PhysicalDeviceSchedulingControlsFlagsARM:
        return PhysicalDeviceSchedulingControlsFlagsARM(value = self._value | other._value)

    comptime SHADER_CORE_COUNT = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SurfaceCreateFlagsOHOS) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SurfaceCreateFlagsOHOS) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SurfaceCreateFlagsOHOS) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SurfaceCreateFlagsOHOS) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SurfaceCreateFlagsOHOS) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SurfaceCreateFlagsOHOS) -> Bool:
        return self & other == self

    fn is_superset(self, other: SurfaceCreateFlagsOHOS) -> Bool:
        return self & other == other


@register_passable("trivial")
struct SurfaceCreateFlagBitsOHOS(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SurfaceCreateFlagsOHOS:
        return SurfaceCreateFlagsOHOS(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoCodecOperationFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoCodecOperationFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoCodecOperationFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoCodecOperationFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoCodecOperationFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoCodecOperationFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoCodecOperationFlagsKHR) -> Bool:
        return self & other == other

    comptime NONE = Self(value = VideoCodecOperationFlagBitsKHR.NONE.value())
    comptime DECODE_H264 = Self(value = VideoCodecOperationFlagBitsKHR.DECODE_H264.value())
    comptime DECODE_H265 = Self(value = VideoCodecOperationFlagBitsKHR.DECODE_H265.value())
    comptime DECODE_AV1 = Self(value = VideoCodecOperationFlagBitsKHR.DECODE_AV1.value())
    comptime DECODE_VP9 = Self(value = VideoCodecOperationFlagBitsKHR.DECODE_VP9.value())
    comptime ENCODE_H264 = Self(value = VideoCodecOperationFlagBitsKHR.ENCODE_H264.value())
    comptime ENCODE_H265 = Self(value = VideoCodecOperationFlagBitsKHR.ENCODE_H265.value())
    comptime ENCODE_AV1 = Self(value = VideoCodecOperationFlagBitsKHR.ENCODE_AV1.value())


@register_passable("trivial")
struct VideoCodecOperationFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoCodecOperationFlagsKHR:
        return VideoCodecOperationFlagsKHR(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime DECODE_H264 = Self(value = 1 << 0)
    comptime DECODE_H265 = Self(value = 1 << 1)
    comptime DECODE_AV1 = Self(value = 1 << 2)
    comptime DECODE_VP9 = Self(value = 1 << 3)
    comptime ENCODE_H264 = Self(value = 1 << 16)
    comptime ENCODE_H265 = Self(value = 1 << 17)
    comptime ENCODE_AV1 = Self(value = 1 << 18)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoCapabilityFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoCapabilityFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoCapabilityFlagsKHR) -> Bool:
        return self & other == other

    comptime PROTECTED_CONTENT = Self(value = VideoCapabilityFlagBitsKHR.PROTECTED_CONTENT.value())
    comptime SEPARATE_REFERENCE_IMAGES = Self(value = VideoCapabilityFlagBitsKHR.SEPARATE_REFERENCE_IMAGES.value())


@register_passable("trivial")
struct VideoCapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoCapabilityFlagsKHR:
        return VideoCapabilityFlagsKHR(value = self._value | other._value)

    comptime PROTECTED_CONTENT = Self(value = 1 << 0)
    comptime SEPARATE_REFERENCE_IMAGES = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoSessionCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoSessionCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoSessionCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoSessionCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoSessionCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoSessionCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoSessionCreateFlagsKHR) -> Bool:
        return self & other == other

    comptime PROTECTED_CONTENT = Self(value = VideoSessionCreateFlagBitsKHR.PROTECTED_CONTENT.value())
    comptime ALLOW_ENCODE_PARAMETER_OPTIMIZATIONS = Self(value = VideoSessionCreateFlagBitsKHR.ALLOW_ENCODE_PARAMETER_OPTIMIZATIONS.value())
    comptime INLINE_QUERIES = Self(value = VideoSessionCreateFlagBitsKHR.INLINE_QUERIES.value())
    comptime ALLOW_ENCODE_QUANTIZATION_DELTA_MAP = Self(value = VideoSessionCreateFlagBitsKHR.ALLOW_ENCODE_QUANTIZATION_DELTA_MAP.value())
    comptime ALLOW_ENCODE_EMPHASIS_MAP = Self(value = VideoSessionCreateFlagBitsKHR.ALLOW_ENCODE_EMPHASIS_MAP.value())
    comptime INLINE_SESSION_PARAMETERS = Self(value = VideoSessionCreateFlagBitsKHR.INLINE_SESSION_PARAMETERS.value())


@register_passable("trivial")
struct VideoSessionCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoSessionCreateFlagsKHR:
        return VideoSessionCreateFlagsKHR(value = self._value | other._value)

    comptime PROTECTED_CONTENT = Self(value = 1 << 0)
    comptime ALLOW_ENCODE_PARAMETER_OPTIMIZATIONS = Self(value = 1 << 1)
    comptime INLINE_QUERIES = Self(value = 1 << 2)
    comptime ALLOW_ENCODE_QUANTIZATION_DELTA_MAP = Self(value = 1 << 3)
    comptime ALLOW_ENCODE_EMPHASIS_MAP = Self(value = 1 << 4)
    comptime INLINE_SESSION_PARAMETERS = Self(value = 1 << 5)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoSessionParametersCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoSessionParametersCreateFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoSessionParametersCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoSessionParametersCreateFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoSessionParametersCreateFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoSessionParametersCreateFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoSessionParametersCreateFlagsKHR) -> Bool:
        return self & other == other

    comptime QUANTIZATION_MAP_COMPATIBLE = Self(value = VideoSessionParametersCreateFlagBitsKHR.QUANTIZATION_MAP_COMPATIBLE.value())


@register_passable("trivial")
struct VideoSessionParametersCreateFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoSessionParametersCreateFlagsKHR:
        return VideoSessionParametersCreateFlagsKHR(value = self._value | other._value)

    comptime QUANTIZATION_MAP_COMPATIBLE = Self(value = 1 << 0)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoBeginCodingFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoBeginCodingFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoBeginCodingFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoBeginCodingFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoBeginCodingFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoBeginCodingFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoBeginCodingFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct VideoBeginCodingFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoBeginCodingFlagsKHR:
        return VideoBeginCodingFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEndCodingFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEndCodingFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEndCodingFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEndCodingFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEndCodingFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEndCodingFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEndCodingFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct VideoEndCodingFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEndCodingFlagsKHR:
        return VideoEndCodingFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoCodingControlFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoCodingControlFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoCodingControlFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoCodingControlFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoCodingControlFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoCodingControlFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoCodingControlFlagsKHR) -> Bool:
        return self & other == other

    comptime RESET = Self(value = VideoCodingControlFlagBitsKHR.RESET.value())
    comptime ENCODE_RATE_CONTROL = Self(value = VideoCodingControlFlagBitsKHR.ENCODE_RATE_CONTROL.value())
    comptime ENCODE_QUALITY_LEVEL = Self(value = VideoCodingControlFlagBitsKHR.ENCODE_QUALITY_LEVEL.value())


@register_passable("trivial")
struct VideoCodingControlFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoCodingControlFlagsKHR:
        return VideoCodingControlFlagsKHR(value = self._value | other._value)

    comptime RESET = Self(value = 1 << 0)
    comptime ENCODE_RATE_CONTROL = Self(value = 1 << 1)
    comptime ENCODE_QUALITY_LEVEL = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoDecodeUsageFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoDecodeUsageFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoDecodeUsageFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoDecodeUsageFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoDecodeUsageFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoDecodeUsageFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoDecodeUsageFlagsKHR) -> Bool:
        return self & other == other

    comptime DEFAULT = Self(value = VideoDecodeUsageFlagBitsKHR.DEFAULT.value())
    comptime TRANSCODING = Self(value = VideoDecodeUsageFlagBitsKHR.TRANSCODING.value())
    comptime OFFLINE = Self(value = VideoDecodeUsageFlagBitsKHR.OFFLINE.value())
    comptime STREAMING = Self(value = VideoDecodeUsageFlagBitsKHR.STREAMING.value())


@register_passable("trivial")
struct VideoDecodeUsageFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoDecodeUsageFlagsKHR:
        return VideoDecodeUsageFlagsKHR(value = self._value | other._value)

    comptime DEFAULT = Self(value = 0)
    comptime TRANSCODING = Self(value = 1 << 0)
    comptime OFFLINE = Self(value = 1 << 1)
    comptime STREAMING = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoDecodeCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoDecodeCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoDecodeCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoDecodeCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoDecodeCapabilityFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoDecodeCapabilityFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoDecodeCapabilityFlagsKHR) -> Bool:
        return self & other == other

    comptime DPB_AND_OUTPUT_COINCIDE = Self(value = VideoDecodeCapabilityFlagBitsKHR.DPB_AND_OUTPUT_COINCIDE.value())
    comptime DPB_AND_OUTPUT_DISTINCT = Self(value = VideoDecodeCapabilityFlagBitsKHR.DPB_AND_OUTPUT_DISTINCT.value())


@register_passable("trivial")
struct VideoDecodeCapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoDecodeCapabilityFlagsKHR:
        return VideoDecodeCapabilityFlagsKHR(value = self._value | other._value)

    comptime DPB_AND_OUTPUT_COINCIDE = Self(value = 1 << 0)
    comptime DPB_AND_OUTPUT_DISTINCT = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoDecodeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoDecodeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoDecodeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoDecodeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoDecodeFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoDecodeFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoDecodeFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct VideoDecodeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoDecodeFlagsKHR:
        return VideoDecodeFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoDecodeH264PictureLayoutFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoDecodeH264PictureLayoutFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoDecodeH264PictureLayoutFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoDecodeH264PictureLayoutFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoDecodeH264PictureLayoutFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoDecodeH264PictureLayoutFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoDecodeH264PictureLayoutFlagsKHR) -> Bool:
        return self & other == other

    comptime PROGRESSIVE = Self(value = VideoDecodeH264PictureLayoutFlagBitsKHR.PROGRESSIVE.value())
    comptime INTERLACED_INTERLEAVED_LINES = Self(value = VideoDecodeH264PictureLayoutFlagBitsKHR.INTERLACED_INTERLEAVED_LINES.value())
    comptime INTERLACED_SEPARATE_PLANES = Self(value = VideoDecodeH264PictureLayoutFlagBitsKHR.INTERLACED_SEPARATE_PLANES.value())


@register_passable("trivial")
struct VideoDecodeH264PictureLayoutFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoDecodeH264PictureLayoutFlagsKHR:
        return VideoDecodeH264PictureLayoutFlagsKHR(value = self._value | other._value)

    comptime PROGRESSIVE = Self(value = 0)
    comptime INTERLACED_INTERLEAVED_LINES = Self(value = 1 << 0)
    comptime INTERLACED_SEPARATE_PLANES = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeFlagsKHR) -> Bool:
        return self & other == other

    comptime WITH_QUANTIZATION_DELTA_MAP = Self(value = VideoEncodeFlagBitsKHR.WITH_QUANTIZATION_DELTA_MAP.value())
    comptime WITH_EMPHASIS_MAP = Self(value = VideoEncodeFlagBitsKHR.WITH_EMPHASIS_MAP.value())
    comptime INTRA_REFRESH = Self(value = VideoEncodeFlagBitsKHR.INTRA_REFRESH.value())


@register_passable("trivial")
struct VideoEncodeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeFlagsKHR:
        return VideoEncodeFlagsKHR(value = self._value | other._value)

    comptime WITH_QUANTIZATION_DELTA_MAP = Self(value = 1 << 0)
    comptime WITH_EMPHASIS_MAP = Self(value = 1 << 1)
    comptime INTRA_REFRESH = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeUsageFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeUsageFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeUsageFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeUsageFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeUsageFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeUsageFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeUsageFlagsKHR) -> Bool:
        return self & other == other

    comptime DEFAULT = Self(value = VideoEncodeUsageFlagBitsKHR.DEFAULT.value())
    comptime TRANSCODING = Self(value = VideoEncodeUsageFlagBitsKHR.TRANSCODING.value())
    comptime STREAMING = Self(value = VideoEncodeUsageFlagBitsKHR.STREAMING.value())
    comptime RECORDING = Self(value = VideoEncodeUsageFlagBitsKHR.RECORDING.value())
    comptime CONFERENCING = Self(value = VideoEncodeUsageFlagBitsKHR.CONFERENCING.value())


@register_passable("trivial")
struct VideoEncodeUsageFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeUsageFlagsKHR:
        return VideoEncodeUsageFlagsKHR(value = self._value | other._value)

    comptime DEFAULT = Self(value = 0)
    comptime TRANSCODING = Self(value = 1 << 0)
    comptime STREAMING = Self(value = 1 << 1)
    comptime RECORDING = Self(value = 1 << 2)
    comptime CONFERENCING = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeContentFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeContentFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeContentFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeContentFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeContentFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeContentFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeContentFlagsKHR) -> Bool:
        return self & other == other

    comptime DEFAULT = Self(value = VideoEncodeContentFlagBitsKHR.DEFAULT.value())
    comptime CAMERA = Self(value = VideoEncodeContentFlagBitsKHR.CAMERA.value())
    comptime DESKTOP = Self(value = VideoEncodeContentFlagBitsKHR.DESKTOP.value())
    comptime RENDERED = Self(value = VideoEncodeContentFlagBitsKHR.RENDERED.value())


@register_passable("trivial")
struct VideoEncodeContentFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeContentFlagsKHR:
        return VideoEncodeContentFlagsKHR(value = self._value | other._value)

    comptime DEFAULT = Self(value = 0)
    comptime CAMERA = Self(value = 1 << 0)
    comptime DESKTOP = Self(value = 1 << 1)
    comptime RENDERED = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeCapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeCapabilityFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeCapabilityFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeCapabilityFlagsKHR) -> Bool:
        return self & other == other

    comptime PRECEDING_EXTERNALLY_ENCODED_BYTES = Self(value = VideoEncodeCapabilityFlagBitsKHR.PRECEDING_EXTERNALLY_ENCODED_BYTES.value())
    comptime INSUFFICIENT_BITSTREAM_BUFFER_RANGE_DETECTION = Self(value = VideoEncodeCapabilityFlagBitsKHR.INSUFFICIENT_BITSTREAM_BUFFER_RANGE_DETECTION.value())
    comptime QUANTIZATION_DELTA_MAP = Self(value = VideoEncodeCapabilityFlagBitsKHR.QUANTIZATION_DELTA_MAP.value())
    comptime EMPHASIS_MAP = Self(value = VideoEncodeCapabilityFlagBitsKHR.EMPHASIS_MAP.value())


@register_passable("trivial")
struct VideoEncodeCapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeCapabilityFlagsKHR:
        return VideoEncodeCapabilityFlagsKHR(value = self._value | other._value)

    comptime PRECEDING_EXTERNALLY_ENCODED_BYTES = Self(value = 1 << 0)
    comptime INSUFFICIENT_BITSTREAM_BUFFER_RANGE_DETECTION = Self(value = 1 << 1)
    comptime QUANTIZATION_DELTA_MAP = Self(value = 1 << 2)
    comptime EMPHASIS_MAP = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeFeedbackFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeFeedbackFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeFeedbackFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeFeedbackFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeFeedbackFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeFeedbackFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeFeedbackFlagsKHR) -> Bool:
        return self & other == other

    comptime BITSTREAM_BUFFER_OFFSET = Self(value = VideoEncodeFeedbackFlagBitsKHR.BITSTREAM_BUFFER_OFFSET.value())
    comptime BITSTREAM_BYTES_WRITTEN = Self(value = VideoEncodeFeedbackFlagBitsKHR.BITSTREAM_BYTES_WRITTEN.value())
    comptime BITSTREAM_HAS_OVERRIDES = Self(value = VideoEncodeFeedbackFlagBitsKHR.BITSTREAM_HAS_OVERRIDES.value())
    comptime RESERVED_3 = Self(value = VideoEncodeFeedbackFlagBitsKHR.RESERVED_3.value())
    comptime RESERVED_4 = Self(value = VideoEncodeFeedbackFlagBitsKHR.RESERVED_4.value())
    comptime RESERVED_5 = Self(value = VideoEncodeFeedbackFlagBitsKHR.RESERVED_5.value())
    comptime RESERVED_6 = Self(value = VideoEncodeFeedbackFlagBitsKHR.RESERVED_6.value())
    comptime RESERVED_7 = Self(value = VideoEncodeFeedbackFlagBitsKHR.RESERVED_7.value())
    comptime RESERVED_8 = Self(value = VideoEncodeFeedbackFlagBitsKHR.RESERVED_8.value())
    comptime RESERVED_9 = Self(value = VideoEncodeFeedbackFlagBitsKHR.RESERVED_9.value())


@register_passable("trivial")
struct VideoEncodeFeedbackFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeFeedbackFlagsKHR:
        return VideoEncodeFeedbackFlagsKHR(value = self._value | other._value)

    comptime BITSTREAM_BUFFER_OFFSET = Self(value = 1 << 0)
    comptime BITSTREAM_BYTES_WRITTEN = Self(value = 1 << 1)
    comptime BITSTREAM_HAS_OVERRIDES = Self(value = 1 << 2)
    comptime RESERVED_3 = Self(value = 1 << 3)
    comptime RESERVED_4 = Self(value = 1 << 4)
    comptime RESERVED_5 = Self(value = 1 << 5)
    comptime RESERVED_6 = Self(value = 1 << 6)
    comptime RESERVED_7 = Self(value = 1 << 7)
    comptime RESERVED_8 = Self(value = 1 << 8)
    comptime RESERVED_9 = Self(value = 1 << 9)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeRateControlFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeRateControlFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeRateControlFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeRateControlFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeRateControlFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeRateControlFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeRateControlFlagsKHR) -> Bool:
        return self & other == other


@register_passable("trivial")
struct VideoEncodeRateControlFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeRateControlFlagsKHR:
        return VideoEncodeRateControlFlagsKHR(value = self._value | other._value)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeRateControlModeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeRateControlModeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeRateControlModeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeRateControlModeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeRateControlModeFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeRateControlModeFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeRateControlModeFlagsKHR) -> Bool:
        return self & other == other

    comptime DEFAULT = Self(value = VideoEncodeRateControlModeFlagBitsKHR.DEFAULT.value())
    comptime DISABLED = Self(value = VideoEncodeRateControlModeFlagBitsKHR.DISABLED.value())
    comptime CBR = Self(value = VideoEncodeRateControlModeFlagBitsKHR.CBR.value())
    comptime VBR = Self(value = VideoEncodeRateControlModeFlagBitsKHR.VBR.value())


@register_passable("trivial")
struct VideoEncodeRateControlModeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeRateControlModeFlagsKHR:
        return VideoEncodeRateControlModeFlagsKHR(value = self._value | other._value)

    comptime DEFAULT = Self(value = 0)
    comptime DISABLED = Self(value = 1 << 0)
    comptime CBR = Self(value = 1 << 1)
    comptime VBR = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeIntraRefreshModeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeIntraRefreshModeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeIntraRefreshModeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeIntraRefreshModeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeIntraRefreshModeFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeIntraRefreshModeFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeIntraRefreshModeFlagsKHR) -> Bool:
        return self & other == other

    comptime NONE = Self(value = VideoEncodeIntraRefreshModeFlagBitsKHR.NONE.value())
    comptime PER_PICTURE_PARTITION = Self(value = VideoEncodeIntraRefreshModeFlagBitsKHR.PER_PICTURE_PARTITION.value())
    comptime BLOCK_BASED = Self(value = VideoEncodeIntraRefreshModeFlagBitsKHR.BLOCK_BASED.value())
    comptime BLOCK_ROW_BASED = Self(value = VideoEncodeIntraRefreshModeFlagBitsKHR.BLOCK_ROW_BASED.value())
    comptime BLOCK_COLUMN_BASED = Self(value = VideoEncodeIntraRefreshModeFlagBitsKHR.BLOCK_COLUMN_BASED.value())


@register_passable("trivial")
struct VideoEncodeIntraRefreshModeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeIntraRefreshModeFlagsKHR:
        return VideoEncodeIntraRefreshModeFlagsKHR(value = self._value | other._value)

    comptime NONE = Self(value = 0)
    comptime PER_PICTURE_PARTITION = Self(value = 1 << 0)
    comptime BLOCK_BASED = Self(value = 1 << 1)
    comptime BLOCK_ROW_BASED = Self(value = 1 << 2)
    comptime BLOCK_COLUMN_BASED = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoChromaSubsamplingFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoChromaSubsamplingFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoChromaSubsamplingFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoChromaSubsamplingFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoChromaSubsamplingFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoChromaSubsamplingFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoChromaSubsamplingFlagsKHR) -> Bool:
        return self & other == other

    comptime INVALID = Self(value = VideoChromaSubsamplingFlagBitsKHR.INVALID.value())
    comptime MONOCHROME = Self(value = VideoChromaSubsamplingFlagBitsKHR.MONOCHROME.value())
    comptime N_420 = Self(value = VideoChromaSubsamplingFlagBitsKHR.N_420.value())
    comptime N_422 = Self(value = VideoChromaSubsamplingFlagBitsKHR.N_422.value())
    comptime N_444 = Self(value = VideoChromaSubsamplingFlagBitsKHR.N_444.value())


@register_passable("trivial")
struct VideoChromaSubsamplingFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoChromaSubsamplingFlagsKHR:
        return VideoChromaSubsamplingFlagsKHR(value = self._value | other._value)

    comptime INVALID = Self(value = 0)
    comptime MONOCHROME = Self(value = 1 << 0)
    comptime N_420 = Self(value = 1 << 1)
    comptime N_422 = Self(value = 1 << 2)
    comptime N_444 = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoComponentBitDepthFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoComponentBitDepthFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoComponentBitDepthFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoComponentBitDepthFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoComponentBitDepthFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoComponentBitDepthFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoComponentBitDepthFlagsKHR) -> Bool:
        return self & other == other

    comptime INVALID = Self(value = VideoComponentBitDepthFlagBitsKHR.INVALID.value())
    comptime N_8 = Self(value = VideoComponentBitDepthFlagBitsKHR.N_8.value())
    comptime N_10 = Self(value = VideoComponentBitDepthFlagBitsKHR.N_10.value())
    comptime N_12 = Self(value = VideoComponentBitDepthFlagBitsKHR.N_12.value())


@register_passable("trivial")
struct VideoComponentBitDepthFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoComponentBitDepthFlagsKHR:
        return VideoComponentBitDepthFlagsKHR(value = self._value | other._value)

    comptime INVALID = Self(value = 0)
    comptime N_8 = Self(value = 1 << 0)
    comptime N_10 = Self(value = 1 << 2)
    comptime N_12 = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeH264CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeH264CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeH264CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeH264CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeH264CapabilityFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeH264CapabilityFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeH264CapabilityFlagsKHR) -> Bool:
        return self & other == other

    comptime HRD_COMPLIANCE = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.HRD_COMPLIANCE.value())
    comptime PREDICTION_WEIGHT_TABLE_GENERATED = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.PREDICTION_WEIGHT_TABLE_GENERATED.value())
    comptime ROW_UNALIGNED_SLICE = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.ROW_UNALIGNED_SLICE.value())
    comptime DIFFERENT_SLICE_TYPE = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.DIFFERENT_SLICE_TYPE.value())
    comptime B_FRAME_IN_L0_LIST = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.B_FRAME_IN_L0_LIST.value())
    comptime B_FRAME_IN_L1_LIST = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.B_FRAME_IN_L1_LIST.value())
    comptime PER_PICTURE_TYPE_MIN_MAX_QP = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.PER_PICTURE_TYPE_MIN_MAX_QP.value())
    comptime PER_SLICE_CONSTANT_QP = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.PER_SLICE_CONSTANT_QP.value())
    comptime GENERATE_PREFIX_NALU = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.GENERATE_PREFIX_NALU.value())
    comptime MB_QP_DIFF_WRAPAROUND = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.MB_QP_DIFF_WRAPAROUND.value())
    comptime B_PICTURE_INTRA_REFRESH = Self(value = VideoEncodeH264CapabilityFlagBitsKHR.B_PICTURE_INTRA_REFRESH.value())


@register_passable("trivial")
struct VideoEncodeH264CapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeH264CapabilityFlagsKHR:
        return VideoEncodeH264CapabilityFlagsKHR(value = self._value | other._value)

    comptime HRD_COMPLIANCE = Self(value = 1 << 0)
    comptime PREDICTION_WEIGHT_TABLE_GENERATED = Self(value = 1 << 1)
    comptime ROW_UNALIGNED_SLICE = Self(value = 1 << 2)
    comptime DIFFERENT_SLICE_TYPE = Self(value = 1 << 3)
    comptime B_FRAME_IN_L0_LIST = Self(value = 1 << 4)
    comptime B_FRAME_IN_L1_LIST = Self(value = 1 << 5)
    comptime PER_PICTURE_TYPE_MIN_MAX_QP = Self(value = 1 << 6)
    comptime PER_SLICE_CONSTANT_QP = Self(value = 1 << 7)
    comptime GENERATE_PREFIX_NALU = Self(value = 1 << 8)
    comptime MB_QP_DIFF_WRAPAROUND = Self(value = 1 << 9)
    comptime B_PICTURE_INTRA_REFRESH = Self(value = 1 << 10)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeH264StdFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeH264StdFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeH264StdFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeH264StdFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeH264StdFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeH264StdFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeH264StdFlagsKHR) -> Bool:
        return self & other == other

    comptime SEPARATE_COLOR_PLANE_FLAG_SET = Self(value = VideoEncodeH264StdFlagBitsKHR.SEPARATE_COLOR_PLANE_FLAG_SET.value())
    comptime QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG_SET = Self(value = VideoEncodeH264StdFlagBitsKHR.QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG_SET.value())
    comptime SCALING_MATRIX_PRESENT_FLAG_SET = Self(value = VideoEncodeH264StdFlagBitsKHR.SCALING_MATRIX_PRESENT_FLAG_SET.value())
    comptime CHROMA_QP_INDEX_OFFSET = Self(value = VideoEncodeH264StdFlagBitsKHR.CHROMA_QP_INDEX_OFFSET.value())
    comptime SECOND_CHROMA_QP_INDEX_OFFSET = Self(value = VideoEncodeH264StdFlagBitsKHR.SECOND_CHROMA_QP_INDEX_OFFSET.value())
    comptime PIC_INIT_QP_MINUS26 = Self(value = VideoEncodeH264StdFlagBitsKHR.PIC_INIT_QP_MINUS26.value())
    comptime WEIGHTED_PRED_FLAG_SET = Self(value = VideoEncodeH264StdFlagBitsKHR.WEIGHTED_PRED_FLAG_SET.value())
    comptime WEIGHTED_BIPRED_IDC_EXPLICIT = Self(value = VideoEncodeH264StdFlagBitsKHR.WEIGHTED_BIPRED_IDC_EXPLICIT.value())
    comptime WEIGHTED_BIPRED_IDC_IMPLICIT = Self(value = VideoEncodeH264StdFlagBitsKHR.WEIGHTED_BIPRED_IDC_IMPLICIT.value())
    comptime TRANSFORM_8X8_MODE_FLAG_SET = Self(value = VideoEncodeH264StdFlagBitsKHR.TRANSFORM_8X8_MODE_FLAG_SET.value())
    comptime DIRECT_SPATIAL_MV_PRED_FLAG_UNSET = Self(value = VideoEncodeH264StdFlagBitsKHR.DIRECT_SPATIAL_MV_PRED_FLAG_UNSET.value())
    comptime ENTROPY_CODING_MODE_FLAG_UNSET = Self(value = VideoEncodeH264StdFlagBitsKHR.ENTROPY_CODING_MODE_FLAG_UNSET.value())
    comptime ENTROPY_CODING_MODE_FLAG_SET = Self(value = VideoEncodeH264StdFlagBitsKHR.ENTROPY_CODING_MODE_FLAG_SET.value())
    comptime DIRECT_8X8_INFERENCE_FLAG_UNSET = Self(value = VideoEncodeH264StdFlagBitsKHR.DIRECT_8X8_INFERENCE_FLAG_UNSET.value())
    comptime CONSTRAINED_INTRA_PRED_FLAG_SET = Self(value = VideoEncodeH264StdFlagBitsKHR.CONSTRAINED_INTRA_PRED_FLAG_SET.value())
    comptime DEBLOCKING_FILTER_DISABLED = Self(value = VideoEncodeH264StdFlagBitsKHR.DEBLOCKING_FILTER_DISABLED.value())
    comptime DEBLOCKING_FILTER_ENABLED = Self(value = VideoEncodeH264StdFlagBitsKHR.DEBLOCKING_FILTER_ENABLED.value())
    comptime DEBLOCKING_FILTER_PARTIAL = Self(value = VideoEncodeH264StdFlagBitsKHR.DEBLOCKING_FILTER_PARTIAL.value())
    comptime SLICE_QP_DELTA = Self(value = VideoEncodeH264StdFlagBitsKHR.SLICE_QP_DELTA.value())
    comptime DIFFERENT_SLICE_QP_DELTA = Self(value = VideoEncodeH264StdFlagBitsKHR.DIFFERENT_SLICE_QP_DELTA.value())


@register_passable("trivial")
struct VideoEncodeH264StdFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeH264StdFlagsKHR:
        return VideoEncodeH264StdFlagsKHR(value = self._value | other._value)

    comptime SEPARATE_COLOR_PLANE_FLAG_SET = Self(value = 1 << 0)
    comptime QPPRIME_Y_ZERO_TRANSFORM_BYPASS_FLAG_SET = Self(value = 1 << 1)
    comptime SCALING_MATRIX_PRESENT_FLAG_SET = Self(value = 1 << 2)
    comptime CHROMA_QP_INDEX_OFFSET = Self(value = 1 << 3)
    comptime SECOND_CHROMA_QP_INDEX_OFFSET = Self(value = 1 << 4)
    comptime PIC_INIT_QP_MINUS26 = Self(value = 1 << 5)
    comptime WEIGHTED_PRED_FLAG_SET = Self(value = 1 << 6)
    comptime WEIGHTED_BIPRED_IDC_EXPLICIT = Self(value = 1 << 7)
    comptime WEIGHTED_BIPRED_IDC_IMPLICIT = Self(value = 1 << 8)
    comptime TRANSFORM_8X8_MODE_FLAG_SET = Self(value = 1 << 9)
    comptime DIRECT_SPATIAL_MV_PRED_FLAG_UNSET = Self(value = 1 << 10)
    comptime ENTROPY_CODING_MODE_FLAG_UNSET = Self(value = 1 << 11)
    comptime ENTROPY_CODING_MODE_FLAG_SET = Self(value = 1 << 12)
    comptime DIRECT_8X8_INFERENCE_FLAG_UNSET = Self(value = 1 << 13)
    comptime CONSTRAINED_INTRA_PRED_FLAG_SET = Self(value = 1 << 14)
    comptime DEBLOCKING_FILTER_DISABLED = Self(value = 1 << 15)
    comptime DEBLOCKING_FILTER_ENABLED = Self(value = 1 << 16)
    comptime DEBLOCKING_FILTER_PARTIAL = Self(value = 1 << 17)
    comptime SLICE_QP_DELTA = Self(value = 1 << 19)
    comptime DIFFERENT_SLICE_QP_DELTA = Self(value = 1 << 20)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeH264RateControlFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeH264RateControlFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeH264RateControlFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeH264RateControlFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeH264RateControlFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeH264RateControlFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeH264RateControlFlagsKHR) -> Bool:
        return self & other == other

    comptime ATTEMPT_HRD_COMPLIANCE = Self(value = VideoEncodeH264RateControlFlagBitsKHR.ATTEMPT_HRD_COMPLIANCE.value())
    comptime REGULAR_GOP = Self(value = VideoEncodeH264RateControlFlagBitsKHR.REGULAR_GOP.value())
    comptime REFERENCE_PATTERN_FLAT = Self(value = VideoEncodeH264RateControlFlagBitsKHR.REFERENCE_PATTERN_FLAT.value())
    comptime REFERENCE_PATTERN_DYADIC = Self(value = VideoEncodeH264RateControlFlagBitsKHR.REFERENCE_PATTERN_DYADIC.value())
    comptime TEMPORAL_LAYER_PATTERN_DYADIC = Self(value = VideoEncodeH264RateControlFlagBitsKHR.TEMPORAL_LAYER_PATTERN_DYADIC.value())


@register_passable("trivial")
struct VideoEncodeH264RateControlFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeH264RateControlFlagsKHR:
        return VideoEncodeH264RateControlFlagsKHR(value = self._value | other._value)

    comptime ATTEMPT_HRD_COMPLIANCE = Self(value = 1 << 0)
    comptime REGULAR_GOP = Self(value = 1 << 1)
    comptime REFERENCE_PATTERN_FLAT = Self(value = 1 << 2)
    comptime REFERENCE_PATTERN_DYADIC = Self(value = 1 << 3)
    comptime TEMPORAL_LAYER_PATTERN_DYADIC = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeH265CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeH265CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeH265CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeH265CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeH265CapabilityFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeH265CapabilityFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeH265CapabilityFlagsKHR) -> Bool:
        return self & other == other

    comptime HRD_COMPLIANCE = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.HRD_COMPLIANCE.value())
    comptime PREDICTION_WEIGHT_TABLE_GENERATED = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.PREDICTION_WEIGHT_TABLE_GENERATED.value())
    comptime ROW_UNALIGNED_SLICE_SEGMENT = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.ROW_UNALIGNED_SLICE_SEGMENT.value())
    comptime DIFFERENT_SLICE_SEGMENT_TYPE = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.DIFFERENT_SLICE_SEGMENT_TYPE.value())
    comptime B_FRAME_IN_L0_LIST = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.B_FRAME_IN_L0_LIST.value())
    comptime B_FRAME_IN_L1_LIST = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.B_FRAME_IN_L1_LIST.value())
    comptime PER_PICTURE_TYPE_MIN_MAX_QP = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.PER_PICTURE_TYPE_MIN_MAX_QP.value())
    comptime PER_SLICE_SEGMENT_CONSTANT_QP = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.PER_SLICE_SEGMENT_CONSTANT_QP.value())
    comptime MULTIPLE_TILES_PER_SLICE_SEGMENT = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.MULTIPLE_TILES_PER_SLICE_SEGMENT.value())
    comptime MULTIPLE_SLICE_SEGMENTS_PER_TILE = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.MULTIPLE_SLICE_SEGMENTS_PER_TILE.value())
    comptime CU_QP_DIFF_WRAPAROUND = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.CU_QP_DIFF_WRAPAROUND.value())
    comptime B_PICTURE_INTRA_REFRESH = Self(value = VideoEncodeH265CapabilityFlagBitsKHR.B_PICTURE_INTRA_REFRESH.value())


@register_passable("trivial")
struct VideoEncodeH265CapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeH265CapabilityFlagsKHR:
        return VideoEncodeH265CapabilityFlagsKHR(value = self._value | other._value)

    comptime HRD_COMPLIANCE = Self(value = 1 << 0)
    comptime PREDICTION_WEIGHT_TABLE_GENERATED = Self(value = 1 << 1)
    comptime ROW_UNALIGNED_SLICE_SEGMENT = Self(value = 1 << 2)
    comptime DIFFERENT_SLICE_SEGMENT_TYPE = Self(value = 1 << 3)
    comptime B_FRAME_IN_L0_LIST = Self(value = 1 << 4)
    comptime B_FRAME_IN_L1_LIST = Self(value = 1 << 5)
    comptime PER_PICTURE_TYPE_MIN_MAX_QP = Self(value = 1 << 6)
    comptime PER_SLICE_SEGMENT_CONSTANT_QP = Self(value = 1 << 7)
    comptime MULTIPLE_TILES_PER_SLICE_SEGMENT = Self(value = 1 << 8)
    comptime MULTIPLE_SLICE_SEGMENTS_PER_TILE = Self(value = 1 << 9)
    comptime CU_QP_DIFF_WRAPAROUND = Self(value = 1 << 10)
    comptime B_PICTURE_INTRA_REFRESH = Self(value = 1 << 11)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeH265StdFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeH265StdFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeH265StdFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeH265StdFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeH265StdFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeH265StdFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeH265StdFlagsKHR) -> Bool:
        return self & other == other

    comptime SEPARATE_COLOR_PLANE_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.SEPARATE_COLOR_PLANE_FLAG_SET.value())
    comptime SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG_SET.value())
    comptime SCALING_LIST_DATA_PRESENT_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.SCALING_LIST_DATA_PRESENT_FLAG_SET.value())
    comptime PCM_ENABLED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.PCM_ENABLED_FLAG_SET.value())
    comptime SPS_TEMPORAL_MVP_ENABLED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.SPS_TEMPORAL_MVP_ENABLED_FLAG_SET.value())
    comptime INIT_QP_MINUS26 = Self(value = VideoEncodeH265StdFlagBitsKHR.INIT_QP_MINUS26.value())
    comptime WEIGHTED_PRED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.WEIGHTED_PRED_FLAG_SET.value())
    comptime WEIGHTED_BIPRED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.WEIGHTED_BIPRED_FLAG_SET.value())
    comptime LOG2_PARALLEL_MERGE_LEVEL_MINUS2 = Self(value = VideoEncodeH265StdFlagBitsKHR.LOG2_PARALLEL_MERGE_LEVEL_MINUS2.value())
    comptime SIGN_DATA_HIDING_ENABLED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.SIGN_DATA_HIDING_ENABLED_FLAG_SET.value())
    comptime TRANSFORM_SKIP_ENABLED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.TRANSFORM_SKIP_ENABLED_FLAG_SET.value())
    comptime TRANSFORM_SKIP_ENABLED_FLAG_UNSET = Self(value = VideoEncodeH265StdFlagBitsKHR.TRANSFORM_SKIP_ENABLED_FLAG_UNSET.value())
    comptime PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG_SET.value())
    comptime TRANSQUANT_BYPASS_ENABLED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.TRANSQUANT_BYPASS_ENABLED_FLAG_SET.value())
    comptime CONSTRAINED_INTRA_PRED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.CONSTRAINED_INTRA_PRED_FLAG_SET.value())
    comptime ENTROPY_CODING_SYNC_ENABLED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.ENTROPY_CODING_SYNC_ENABLED_FLAG_SET.value())
    comptime DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG_SET.value())
    comptime DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG_SET.value())
    comptime DEPENDENT_SLICE_SEGMENT_FLAG_SET = Self(value = VideoEncodeH265StdFlagBitsKHR.DEPENDENT_SLICE_SEGMENT_FLAG_SET.value())
    comptime SLICE_QP_DELTA = Self(value = VideoEncodeH265StdFlagBitsKHR.SLICE_QP_DELTA.value())
    comptime DIFFERENT_SLICE_QP_DELTA = Self(value = VideoEncodeH265StdFlagBitsKHR.DIFFERENT_SLICE_QP_DELTA.value())


@register_passable("trivial")
struct VideoEncodeH265StdFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeH265StdFlagsKHR:
        return VideoEncodeH265StdFlagsKHR(value = self._value | other._value)

    comptime SEPARATE_COLOR_PLANE_FLAG_SET = Self(value = 1 << 0)
    comptime SAMPLE_ADAPTIVE_OFFSET_ENABLED_FLAG_SET = Self(value = 1 << 1)
    comptime SCALING_LIST_DATA_PRESENT_FLAG_SET = Self(value = 1 << 2)
    comptime PCM_ENABLED_FLAG_SET = Self(value = 1 << 3)
    comptime SPS_TEMPORAL_MVP_ENABLED_FLAG_SET = Self(value = 1 << 4)
    comptime INIT_QP_MINUS26 = Self(value = 1 << 5)
    comptime WEIGHTED_PRED_FLAG_SET = Self(value = 1 << 6)
    comptime WEIGHTED_BIPRED_FLAG_SET = Self(value = 1 << 7)
    comptime LOG2_PARALLEL_MERGE_LEVEL_MINUS2 = Self(value = 1 << 8)
    comptime SIGN_DATA_HIDING_ENABLED_FLAG_SET = Self(value = 1 << 9)
    comptime TRANSFORM_SKIP_ENABLED_FLAG_SET = Self(value = 1 << 10)
    comptime TRANSFORM_SKIP_ENABLED_FLAG_UNSET = Self(value = 1 << 11)
    comptime PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT_FLAG_SET = Self(value = 1 << 12)
    comptime TRANSQUANT_BYPASS_ENABLED_FLAG_SET = Self(value = 1 << 13)
    comptime CONSTRAINED_INTRA_PRED_FLAG_SET = Self(value = 1 << 14)
    comptime ENTROPY_CODING_SYNC_ENABLED_FLAG_SET = Self(value = 1 << 15)
    comptime DEBLOCKING_FILTER_OVERRIDE_ENABLED_FLAG_SET = Self(value = 1 << 16)
    comptime DEPENDENT_SLICE_SEGMENTS_ENABLED_FLAG_SET = Self(value = 1 << 17)
    comptime DEPENDENT_SLICE_SEGMENT_FLAG_SET = Self(value = 1 << 18)
    comptime SLICE_QP_DELTA = Self(value = 1 << 19)
    comptime DIFFERENT_SLICE_QP_DELTA = Self(value = 1 << 20)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeH265RateControlFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeH265RateControlFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeH265RateControlFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeH265RateControlFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeH265RateControlFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeH265RateControlFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeH265RateControlFlagsKHR) -> Bool:
        return self & other == other

    comptime ATTEMPT_HRD_COMPLIANCE = Self(value = VideoEncodeH265RateControlFlagBitsKHR.ATTEMPT_HRD_COMPLIANCE.value())
    comptime REGULAR_GOP = Self(value = VideoEncodeH265RateControlFlagBitsKHR.REGULAR_GOP.value())
    comptime REFERENCE_PATTERN_FLAT = Self(value = VideoEncodeH265RateControlFlagBitsKHR.REFERENCE_PATTERN_FLAT.value())
    comptime REFERENCE_PATTERN_DYADIC = Self(value = VideoEncodeH265RateControlFlagBitsKHR.REFERENCE_PATTERN_DYADIC.value())
    comptime TEMPORAL_SUB_LAYER_PATTERN_DYADIC = Self(value = VideoEncodeH265RateControlFlagBitsKHR.TEMPORAL_SUB_LAYER_PATTERN_DYADIC.value())


@register_passable("trivial")
struct VideoEncodeH265RateControlFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeH265RateControlFlagsKHR:
        return VideoEncodeH265RateControlFlagsKHR(value = self._value | other._value)

    comptime ATTEMPT_HRD_COMPLIANCE = Self(value = 1 << 0)
    comptime REGULAR_GOP = Self(value = 1 << 1)
    comptime REFERENCE_PATTERN_FLAT = Self(value = 1 << 2)
    comptime REFERENCE_PATTERN_DYADIC = Self(value = 1 << 3)
    comptime TEMPORAL_SUB_LAYER_PATTERN_DYADIC = Self(value = 1 << 4)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeH265CtbSizeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeH265CtbSizeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeH265CtbSizeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeH265CtbSizeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeH265CtbSizeFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeH265CtbSizeFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeH265CtbSizeFlagsKHR) -> Bool:
        return self & other == other

    comptime N_16 = Self(value = VideoEncodeH265CtbSizeFlagBitsKHR.N_16.value())
    comptime N_32 = Self(value = VideoEncodeH265CtbSizeFlagBitsKHR.N_32.value())
    comptime N_64 = Self(value = VideoEncodeH265CtbSizeFlagBitsKHR.N_64.value())


@register_passable("trivial")
struct VideoEncodeH265CtbSizeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeH265CtbSizeFlagsKHR:
        return VideoEncodeH265CtbSizeFlagsKHR(value = self._value | other._value)

    comptime N_16 = Self(value = 1 << 0)
    comptime N_32 = Self(value = 1 << 1)
    comptime N_64 = Self(value = 1 << 2)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeH265TransformBlockSizeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeH265TransformBlockSizeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeH265TransformBlockSizeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeH265TransformBlockSizeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeH265TransformBlockSizeFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeH265TransformBlockSizeFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeH265TransformBlockSizeFlagsKHR) -> Bool:
        return self & other == other

    comptime N_4 = Self(value = VideoEncodeH265TransformBlockSizeFlagBitsKHR.N_4.value())
    comptime N_8 = Self(value = VideoEncodeH265TransformBlockSizeFlagBitsKHR.N_8.value())
    comptime N_16 = Self(value = VideoEncodeH265TransformBlockSizeFlagBitsKHR.N_16.value())
    comptime N_32 = Self(value = VideoEncodeH265TransformBlockSizeFlagBitsKHR.N_32.value())


@register_passable("trivial")
struct VideoEncodeH265TransformBlockSizeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeH265TransformBlockSizeFlagsKHR:
        return VideoEncodeH265TransformBlockSizeFlagsKHR(value = self._value | other._value)

    comptime N_4 = Self(value = 1 << 0)
    comptime N_8 = Self(value = 1 << 1)
    comptime N_16 = Self(value = 1 << 2)
    comptime N_32 = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeAV1CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeAV1CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeAV1CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeAV1CapabilityFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeAV1CapabilityFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeAV1CapabilityFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeAV1CapabilityFlagsKHR) -> Bool:
        return self & other == other

    comptime PER_RATE_CONTROL_GROUP_MIN_MAX_Q_INDEX = Self(value = VideoEncodeAV1CapabilityFlagBitsKHR.PER_RATE_CONTROL_GROUP_MIN_MAX_Q_INDEX.value())
    comptime GENERATE_OBU_EXTENSION_HEADER = Self(value = VideoEncodeAV1CapabilityFlagBitsKHR.GENERATE_OBU_EXTENSION_HEADER.value())
    comptime PRIMARY_REFERENCE_CDF_ONLY = Self(value = VideoEncodeAV1CapabilityFlagBitsKHR.PRIMARY_REFERENCE_CDF_ONLY.value())
    comptime FRAME_SIZE_OVERRIDE = Self(value = VideoEncodeAV1CapabilityFlagBitsKHR.FRAME_SIZE_OVERRIDE.value())
    comptime MOTION_VECTOR_SCALING = Self(value = VideoEncodeAV1CapabilityFlagBitsKHR.MOTION_VECTOR_SCALING.value())
    comptime COMPOUND_PREDICTION_INTRA_REFRESH = Self(value = VideoEncodeAV1CapabilityFlagBitsKHR.COMPOUND_PREDICTION_INTRA_REFRESH.value())


@register_passable("trivial")
struct VideoEncodeAV1CapabilityFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeAV1CapabilityFlagsKHR:
        return VideoEncodeAV1CapabilityFlagsKHR(value = self._value | other._value)

    comptime PER_RATE_CONTROL_GROUP_MIN_MAX_Q_INDEX = Self(value = 1 << 0)
    comptime GENERATE_OBU_EXTENSION_HEADER = Self(value = 1 << 1)
    comptime PRIMARY_REFERENCE_CDF_ONLY = Self(value = 1 << 2)
    comptime FRAME_SIZE_OVERRIDE = Self(value = 1 << 3)
    comptime MOTION_VECTOR_SCALING = Self(value = 1 << 4)
    comptime COMPOUND_PREDICTION_INTRA_REFRESH = Self(value = 1 << 5)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeAV1StdFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeAV1StdFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeAV1StdFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeAV1StdFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeAV1StdFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeAV1StdFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeAV1StdFlagsKHR) -> Bool:
        return self & other == other

    comptime UNIFORM_TILE_SPACING_FLAG_SET = Self(value = VideoEncodeAV1StdFlagBitsKHR.UNIFORM_TILE_SPACING_FLAG_SET.value())
    comptime SKIP_MODE_PRESENT_UNSET = Self(value = VideoEncodeAV1StdFlagBitsKHR.SKIP_MODE_PRESENT_UNSET.value())
    comptime PRIMARY_REF_FRAME = Self(value = VideoEncodeAV1StdFlagBitsKHR.PRIMARY_REF_FRAME.value())
    comptime DELTA_Q = Self(value = VideoEncodeAV1StdFlagBitsKHR.DELTA_Q.value())


@register_passable("trivial")
struct VideoEncodeAV1StdFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeAV1StdFlagsKHR:
        return VideoEncodeAV1StdFlagsKHR(value = self._value | other._value)

    comptime UNIFORM_TILE_SPACING_FLAG_SET = Self(value = 1 << 0)
    comptime SKIP_MODE_PRESENT_UNSET = Self(value = 1 << 1)
    comptime PRIMARY_REF_FRAME = Self(value = 1 << 2)
    comptime DELTA_Q = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeAV1RateControlFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeAV1RateControlFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeAV1RateControlFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeAV1RateControlFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeAV1RateControlFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeAV1RateControlFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeAV1RateControlFlagsKHR) -> Bool:
        return self & other == other

    comptime REGULAR_GOP = Self(value = VideoEncodeAV1RateControlFlagBitsKHR.REGULAR_GOP.value())
    comptime TEMPORAL_LAYER_PATTERN_DYADIC = Self(value = VideoEncodeAV1RateControlFlagBitsKHR.TEMPORAL_LAYER_PATTERN_DYADIC.value())
    comptime REFERENCE_PATTERN_FLAT = Self(value = VideoEncodeAV1RateControlFlagBitsKHR.REFERENCE_PATTERN_FLAT.value())
    comptime REFERENCE_PATTERN_DYADIC = Self(value = VideoEncodeAV1RateControlFlagBitsKHR.REFERENCE_PATTERN_DYADIC.value())


@register_passable("trivial")
struct VideoEncodeAV1RateControlFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeAV1RateControlFlagsKHR:
        return VideoEncodeAV1RateControlFlagsKHR(value = self._value | other._value)

    comptime REGULAR_GOP = Self(value = 1 << 0)
    comptime TEMPORAL_LAYER_PATTERN_DYADIC = Self(value = 1 << 1)
    comptime REFERENCE_PATTERN_FLAT = Self(value = 1 << 2)
    comptime REFERENCE_PATTERN_DYADIC = Self(value = 1 << 3)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: VideoEncodeAV1SuperblockSizeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: VideoEncodeAV1SuperblockSizeFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: VideoEncodeAV1SuperblockSizeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: VideoEncodeAV1SuperblockSizeFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: VideoEncodeAV1SuperblockSizeFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: VideoEncodeAV1SuperblockSizeFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: VideoEncodeAV1SuperblockSizeFlagsKHR) -> Bool:
        return self & other == other

    comptime N_64 = Self(value = VideoEncodeAV1SuperblockSizeFlagBitsKHR.N_64.value())
    comptime N_128 = Self(value = VideoEncodeAV1SuperblockSizeFlagBitsKHR.N_128.value())


@register_passable("trivial")
struct VideoEncodeAV1SuperblockSizeFlagBitsKHR(Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeAV1SuperblockSizeFlagsKHR:
        return VideoEncodeAV1SuperblockSizeFlagsKHR(value = self._value | other._value)

    comptime N_64 = Self(value = 1 << 0)
    comptime N_128 = Self(value = 1 << 1)


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

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: AccessFlags3KHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: AccessFlags3KHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: AccessFlags3KHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: AccessFlags3KHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: AccessFlags3KHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: AccessFlags3KHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: AccessFlags3KHR) -> Bool:
        return self & other == other

    comptime NONE = Self(value = AccessFlagBits3KHR.NONE.value())


@register_passable("trivial")
struct AccessFlagBits3KHR(Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AccessFlags3KHR:
        return AccessFlags3KHR(value = self._value | other._value)

    comptime NONE = Self(value = 0)
