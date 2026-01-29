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
comptime MemoryDecompressionMethodFlagsNV = MemoryDecompressionMethodFlagsEXT
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


struct FramebufferCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: FramebufferCreateFlagBits):
        self._value = bit._value

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


struct FramebufferCreateFlagBits(TrivialRegisterType, Equatable):
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


struct QueryPoolCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: QueryPoolCreateFlagBits):
        self._value = bit._value

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


struct QueryPoolCreateFlagBits(TrivialRegisterType, Equatable):
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


struct RenderPassCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: RenderPassCreateFlagBits):
        self._value = bit._value

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


struct RenderPassCreateFlagBits(TrivialRegisterType, Equatable):
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


struct SamplerCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SamplerCreateFlagBits):
        self._value = bit._value

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


struct SamplerCreateFlagBits(TrivialRegisterType, Equatable):
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


struct PipelineLayoutCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineLayoutCreateFlagBits):
        self._value = bit._value

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


struct PipelineLayoutCreateFlagBits(TrivialRegisterType, Equatable):
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


struct PipelineCacheCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineCacheCreateFlagBits):
        self._value = bit._value

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


struct PipelineCacheCreateFlagBits(TrivialRegisterType, Equatable):
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


struct PipelineDepthStencilStateCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineDepthStencilStateCreateFlagBits):
        self._value = bit._value

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


struct PipelineDepthStencilStateCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineDepthStencilStateCreateFlags:
        return PipelineDepthStencilStateCreateFlags(value = self._value | other._value)


struct PipelineDynamicStateCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineDynamicStateCreateFlagBits):
        self._value = bit._value

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


struct PipelineDynamicStateCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineDynamicStateCreateFlags:
        return PipelineDynamicStateCreateFlags(value = self._value | other._value)


struct PipelineColorBlendStateCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineColorBlendStateCreateFlagBits):
        self._value = bit._value

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


struct PipelineColorBlendStateCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineColorBlendStateCreateFlags:
        return PipelineColorBlendStateCreateFlags(value = self._value | other._value)


struct PipelineMultisampleStateCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineMultisampleStateCreateFlagBits):
        self._value = bit._value

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


struct PipelineMultisampleStateCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineMultisampleStateCreateFlags:
        return PipelineMultisampleStateCreateFlags(value = self._value | other._value)


struct PipelineRasterizationStateCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineRasterizationStateCreateFlagBits):
        self._value = bit._value

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


struct PipelineRasterizationStateCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineRasterizationStateCreateFlags:
        return PipelineRasterizationStateCreateFlags(value = self._value | other._value)


struct PipelineViewportStateCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineViewportStateCreateFlagBits):
        self._value = bit._value

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


struct PipelineViewportStateCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineViewportStateCreateFlags:
        return PipelineViewportStateCreateFlags(value = self._value | other._value)


struct PipelineTessellationStateCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineTessellationStateCreateFlagBits):
        self._value = bit._value

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


struct PipelineTessellationStateCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineTessellationStateCreateFlags:
        return PipelineTessellationStateCreateFlags(value = self._value | other._value)


struct PipelineInputAssemblyStateCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineInputAssemblyStateCreateFlagBits):
        self._value = bit._value

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


struct PipelineInputAssemblyStateCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineInputAssemblyStateCreateFlags:
        return PipelineInputAssemblyStateCreateFlags(value = self._value | other._value)


struct PipelineVertexInputStateCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineVertexInputStateCreateFlagBits):
        self._value = bit._value

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


struct PipelineVertexInputStateCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineVertexInputStateCreateFlags:
        return PipelineVertexInputStateCreateFlags(value = self._value | other._value)


struct PipelineShaderStageCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineShaderStageCreateFlagBits):
        self._value = bit._value

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


struct PipelineShaderStageCreateFlagBits(TrivialRegisterType, Equatable):
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


struct DescriptorSetLayoutCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DescriptorSetLayoutCreateFlagBits):
        self._value = bit._value

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


struct DescriptorSetLayoutCreateFlagBits(TrivialRegisterType, Equatable):
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


struct BufferViewCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: BufferViewCreateFlagBits):
        self._value = bit._value

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


struct BufferViewCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> BufferViewCreateFlags:
        return BufferViewCreateFlags(value = self._value | other._value)


struct InstanceCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: InstanceCreateFlagBits):
        self._value = bit._value

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


struct InstanceCreateFlagBits(TrivialRegisterType, Equatable):
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


struct DeviceCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DeviceCreateFlagBits):
        self._value = bit._value

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


struct DeviceCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DeviceCreateFlags:
        return DeviceCreateFlags(value = self._value | other._value)


struct DeviceQueueCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DeviceQueueCreateFlagBits):
        self._value = bit._value

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
    comptime INTERNALLY_SYNCHRONIZED = Self(value = DeviceQueueCreateFlagBits.INTERNALLY_SYNCHRONIZED.value())


struct DeviceQueueCreateFlagBits(TrivialRegisterType, Equatable):
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
    comptime INTERNALLY_SYNCHRONIZED = Self(value = 1 << 2)


struct QueueFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: QueueFlagBits):
        self._value = bit._value

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
    comptime RESERVED_9 = Self(value = QueueFlagBits.RESERVED_9.value())
    comptime DATA_GRAPH = Self(value = QueueFlagBits.DATA_GRAPH.value())
    comptime RESERVED_11 = Self(value = QueueFlagBits.RESERVED_11.value())
    comptime RESERVED_12 = Self(value = QueueFlagBits.RESERVED_12.value())
    comptime RESERVED_13 = Self(value = QueueFlagBits.RESERVED_13.value())


struct QueueFlagBits(TrivialRegisterType, Equatable):
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
    comptime RESERVED_9 = Self(value = 1 << 9)
    comptime DATA_GRAPH = Self(value = 1 << 10)
    comptime RESERVED_11 = Self(value = 1 << 11)
    comptime RESERVED_12 = Self(value = 1 << 12)
    comptime RESERVED_13 = Self(value = 1 << 13)


struct MemoryPropertyFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: MemoryPropertyFlagBits):
        self._value = bit._value

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


struct MemoryPropertyFlagBits(TrivialRegisterType, Equatable):
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


struct MemoryHeapFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: MemoryHeapFlagBits):
        self._value = bit._value

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


struct MemoryHeapFlagBits(TrivialRegisterType, Equatable):
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


struct AccessFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: AccessFlagBits):
        self._value = bit._value

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


struct AccessFlagBits(TrivialRegisterType, Equatable):
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


struct BufferUsageFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: BufferUsageFlagBits):
        self._value = bit._value

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
    comptime DESCRIPTOR_HEAP = Self(value = BufferUsageFlagBits.DESCRIPTOR_HEAP.value())


struct BufferUsageFlagBits(TrivialRegisterType, Equatable):
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
    comptime DESCRIPTOR_HEAP = Self(value = 1 << 28)


struct BufferCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: BufferCreateFlagBits):
        self._value = bit._value

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


struct BufferCreateFlagBits(TrivialRegisterType, Equatable):
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


struct ShaderStageFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ShaderStageFlagBits):
        self._value = bit._value

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
    comptime RESERVED_16 = Self(value = ShaderStageFlagBits.RESERVED_16.value())
    comptime CLUSTER_CULLING = Self(value = ShaderStageFlagBits.CLUSTER_CULLING.value())


struct ShaderStageFlagBits(TrivialRegisterType, Equatable):
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
    comptime RESERVED_16 = Self(value = 1 << 16)
    comptime CLUSTER_CULLING = Self(value = 1 << 19)


struct ImageUsageFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ImageUsageFlagBits):
        self._value = bit._value

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
    comptime RESERVED_16 = Self(value = ImageUsageFlagBits.RESERVED_16.value())
    comptime RESERVED_27 = Self(value = ImageUsageFlagBits.RESERVED_27.value())
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


struct ImageUsageFlagBits(TrivialRegisterType, Equatable):
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
    comptime RESERVED_16 = Self(value = 1 << 16)
    comptime RESERVED_27 = Self(value = 1 << 17)
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


struct ImageCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ImageCreateFlagBits):
        self._value = bit._value

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
    comptime DESCRIPTOR_HEAP_CAPTURE_REPLAY = Self(value = ImageCreateFlagBits.DESCRIPTOR_HEAP_CAPTURE_REPLAY.value())
    comptime N_2D_VIEW_COMPATIBLE = Self(value = ImageCreateFlagBits.N_2D_VIEW_COMPATIBLE.value())
    comptime MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED = Self(value = ImageCreateFlagBits.MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED.value())
    comptime VIDEO_PROFILE_INDEPENDENT = Self(value = ImageCreateFlagBits.VIDEO_PROFILE_INDEPENDENT.value())
    comptime RESERVED_21 = Self(value = ImageCreateFlagBits.RESERVED_21.value())
    comptime RESERVED_22 = Self(value = ImageCreateFlagBits.RESERVED_22.value())


struct ImageCreateFlagBits(TrivialRegisterType, Equatable):
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
    comptime DESCRIPTOR_HEAP_CAPTURE_REPLAY = Self(value = 1 << 16)
    comptime N_2D_VIEW_COMPATIBLE = Self(value = 1 << 17)
    comptime MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED = Self(value = 1 << 18)
    comptime VIDEO_PROFILE_INDEPENDENT = Self(value = 1 << 20)
    comptime RESERVED_21 = Self(value = 1 << 21)
    comptime RESERVED_22 = Self(value = 1 << 22)


struct ImageViewCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ImageViewCreateFlagBits):
        self._value = bit._value

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


struct ImageViewCreateFlagBits(TrivialRegisterType, Equatable):
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


struct PipelineCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineCreateFlagBits):
        self._value = bit._value

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


struct PipelineCreateFlagBits(TrivialRegisterType, Equatable):
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


struct ColorComponentFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ColorComponentFlagBits):
        self._value = bit._value

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


struct ColorComponentFlagBits(TrivialRegisterType, Equatable):
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


struct FenceCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: FenceCreateFlagBits):
        self._value = bit._value

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


struct FenceCreateFlagBits(TrivialRegisterType, Equatable):
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


struct SemaphoreCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SemaphoreCreateFlagBits):
        self._value = bit._value

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


struct SemaphoreCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SemaphoreCreateFlags:
        return SemaphoreCreateFlags(value = self._value | other._value)


struct FormatFeatureFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: FormatFeatureFlagBits):
        self._value = bit._value

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


struct FormatFeatureFlagBits(TrivialRegisterType, Equatable):
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


struct QueryControlFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: QueryControlFlagBits):
        self._value = bit._value

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


struct QueryControlFlagBits(TrivialRegisterType, Equatable):
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


struct QueryResultFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: QueryResultFlagBits):
        self._value = bit._value

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


struct QueryResultFlagBits(TrivialRegisterType, Equatable):
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


struct ShaderModuleCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ShaderModuleCreateFlagBits):
        self._value = bit._value

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


struct ShaderModuleCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ShaderModuleCreateFlags:
        return ShaderModuleCreateFlags(value = self._value | other._value)


struct EventCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: EventCreateFlagBits):
        self._value = bit._value

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


struct EventCreateFlagBits(TrivialRegisterType, Equatable):
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


struct CommandPoolCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: CommandPoolCreateFlagBits):
        self._value = bit._value

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


struct CommandPoolCreateFlagBits(TrivialRegisterType, Equatable):
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


struct CommandPoolResetFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: CommandPoolResetFlagBits):
        self._value = bit._value

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


struct CommandPoolResetFlagBits(TrivialRegisterType, Equatable):
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


struct CommandBufferResetFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: CommandBufferResetFlagBits):
        self._value = bit._value

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


struct CommandBufferResetFlagBits(TrivialRegisterType, Equatable):
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


struct CommandBufferUsageFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: CommandBufferUsageFlagBits):
        self._value = bit._value

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
    comptime RESERVED_3 = Self(value = CommandBufferUsageFlagBits.RESERVED_3.value())
    comptime RESERVED_4 = Self(value = CommandBufferUsageFlagBits.RESERVED_4.value())


struct CommandBufferUsageFlagBits(TrivialRegisterType, Equatable):
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
    comptime RESERVED_3 = Self(value = 1 << 3)
    comptime RESERVED_4 = Self(value = 1 << 4)


struct QueryPipelineStatisticFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: QueryPipelineStatisticFlagBits):
        self._value = bit._value

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


struct QueryPipelineStatisticFlagBits(TrivialRegisterType, Equatable):
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


struct MemoryMapFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: MemoryMapFlagBits):
        self._value = bit._value

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


struct MemoryMapFlagBits(TrivialRegisterType, Equatable):
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


struct MemoryUnmapFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: MemoryUnmapFlagBits):
        self._value = bit._value

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


struct MemoryUnmapFlagBits(TrivialRegisterType, Equatable):
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


struct ImageAspectFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ImageAspectFlagBits):
        self._value = bit._value

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
    comptime RESERVED_11 = Self(value = ImageAspectFlagBits.RESERVED_11.value())


struct ImageAspectFlagBits(TrivialRegisterType, Equatable):
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
    comptime RESERVED_11 = Self(value = 1 << 11)


struct SparseMemoryBindFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SparseMemoryBindFlagBits):
        self._value = bit._value

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


struct SparseMemoryBindFlagBits(TrivialRegisterType, Equatable):
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


struct SparseImageFormatFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SparseImageFormatFlagBits):
        self._value = bit._value

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


struct SparseImageFormatFlagBits(TrivialRegisterType, Equatable):
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


struct SubpassDescriptionFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SubpassDescriptionFlagBits):
        self._value = bit._value

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
    comptime CUSTOM_RESOLVE = Self(value = SubpassDescriptionFlagBits.CUSTOM_RESOLVE.value())
    comptime ENABLE_LEGACY_DITHERING = Self(value = SubpassDescriptionFlagBits.ENABLE_LEGACY_DITHERING.value())
    comptime TILE_SHADING_APRON = Self(value = SubpassDescriptionFlagBits.TILE_SHADING_APRON.value())


struct SubpassDescriptionFlagBits(TrivialRegisterType, Equatable):
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
    comptime CUSTOM_RESOLVE = Self(value = 1 << 3)
    comptime ENABLE_LEGACY_DITHERING = Self(value = 1 << 7)
    comptime TILE_SHADING_APRON = Self(value = 1 << 8)


struct PipelineStageFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineStageFlagBits):
        self._value = bit._value

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


struct PipelineStageFlagBits(TrivialRegisterType, Equatable):
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


struct SampleCountFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SampleCountFlagBits):
        self._value = bit._value

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


struct SampleCountFlagBits(TrivialRegisterType, Equatable):
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


struct AttachmentDescriptionFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: AttachmentDescriptionFlagBits):
        self._value = bit._value

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
    comptime RESOLVE_SKIP_TRANSFER_FUNCTION = Self(value = AttachmentDescriptionFlagBits.RESOLVE_SKIP_TRANSFER_FUNCTION.value())
    comptime RESOLVE_ENABLE_TRANSFER_FUNCTION = Self(value = AttachmentDescriptionFlagBits.RESOLVE_ENABLE_TRANSFER_FUNCTION.value())


struct AttachmentDescriptionFlagBits(TrivialRegisterType, Equatable):
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
    comptime RESOLVE_SKIP_TRANSFER_FUNCTION = Self(value = 1 << 1)
    comptime RESOLVE_ENABLE_TRANSFER_FUNCTION = Self(value = 1 << 2)


struct StencilFaceFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: StencilFaceFlagBits):
        self._value = bit._value

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


struct StencilFaceFlagBits(TrivialRegisterType, Equatable):
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


struct CullModeFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: CullModeFlagBits):
        self._value = bit._value

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


struct CullModeFlagBits(TrivialRegisterType, Equatable):
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


struct DescriptorPoolCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DescriptorPoolCreateFlagBits):
        self._value = bit._value

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


struct DescriptorPoolCreateFlagBits(TrivialRegisterType, Equatable):
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


struct DescriptorPoolResetFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DescriptorPoolResetFlagBits):
        self._value = bit._value

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


struct DescriptorPoolResetFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DescriptorPoolResetFlags:
        return DescriptorPoolResetFlags(value = self._value | other._value)


struct DependencyFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DependencyFlagBits):
        self._value = bit._value

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


struct DependencyFlagBits(TrivialRegisterType, Equatable):
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


struct SubgroupFeatureFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SubgroupFeatureFlagBits):
        self._value = bit._value

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
    comptime ROTATE = Self(value = SubgroupFeatureFlagBits.ROTATE.value())
    comptime ROTATE_CLUSTERED = Self(value = SubgroupFeatureFlagBits.ROTATE_CLUSTERED.value())


struct SubgroupFeatureFlagBits(TrivialRegisterType, Equatable):
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
    comptime ROTATE = Self(value = 1 << 9)
    comptime ROTATE_CLUSTERED = Self(value = 1 << 10)


struct IndirectCommandsLayoutUsageFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: IndirectCommandsLayoutUsageFlagBitsNV):
        self._value = bit._value

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


struct IndirectCommandsLayoutUsageFlagBitsNV(TrivialRegisterType, Equatable):
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


struct IndirectStateFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: IndirectStateFlagBitsNV):
        self._value = bit._value

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


struct IndirectStateFlagBitsNV(TrivialRegisterType, Equatable):
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


struct GeometryFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: GeometryFlagBitsKHR):
        self._value = bit._value

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


struct GeometryFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct GeometryInstanceFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: GeometryInstanceFlagBitsKHR):
        self._value = bit._value

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


struct GeometryInstanceFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct ClusterAccelerationStructureGeometryFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ClusterAccelerationStructureGeometryFlagBitsNV):
        self._value = bit._value

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


struct ClusterAccelerationStructureGeometryFlagBitsNV(TrivialRegisterType, Equatable):
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


struct ClusterAccelerationStructureClusterFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ClusterAccelerationStructureClusterFlagBitsNV):
        self._value = bit._value

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


struct ClusterAccelerationStructureClusterFlagBitsNV(TrivialRegisterType, Equatable):
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


struct ClusterAccelerationStructureAddressResolutionFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ClusterAccelerationStructureAddressResolutionFlagBitsNV):
        self._value = bit._value

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


struct ClusterAccelerationStructureAddressResolutionFlagBitsNV(TrivialRegisterType, Equatable):
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


struct BuildAccelerationStructureFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: BuildAccelerationStructureFlagBitsKHR):
        self._value = bit._value

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
    comptime RESERVED_10 = Self(value = BuildAccelerationStructureFlagBitsKHR.RESERVED_10.value())
    comptime ALLOW_DATA_ACCESS = Self(value = BuildAccelerationStructureFlagBitsKHR.ALLOW_DATA_ACCESS.value())
    comptime ALLOW_CLUSTER_OPACITY_MICROMAPS = Self(value = BuildAccelerationStructureFlagBitsKHR.ALLOW_CLUSTER_OPACITY_MICROMAPS.value())


struct BuildAccelerationStructureFlagBitsKHR(TrivialRegisterType, Equatable):
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
    comptime RESERVED_10 = Self(value = 1 << 10)
    comptime ALLOW_DATA_ACCESS = Self(value = 1 << 11)
    comptime ALLOW_CLUSTER_OPACITY_MICROMAPS = Self(value = 1 << 12)


struct PrivateDataSlotCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PrivateDataSlotCreateFlagBits):
        self._value = bit._value

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


struct PrivateDataSlotCreateFlagBits(TrivialRegisterType, Equatable):
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


struct AccelerationStructureCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: AccelerationStructureCreateFlagBitsKHR):
        self._value = bit._value

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


struct AccelerationStructureCreateFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct DescriptorUpdateTemplateCreateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DescriptorUpdateTemplateCreateFlagBits):
        self._value = bit._value

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


struct DescriptorUpdateTemplateCreateFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DescriptorUpdateTemplateCreateFlags:
        return DescriptorUpdateTemplateCreateFlags(value = self._value | other._value)


struct PipelineCreationFeedbackFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineCreationFeedbackFlagBits):
        self._value = bit._value

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


struct PipelineCreationFeedbackFlagBits(TrivialRegisterType, Equatable):
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


struct PerformanceCounterDescriptionFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PerformanceCounterDescriptionFlagBitsKHR):
        self._value = bit._value

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


struct PerformanceCounterDescriptionFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct AcquireProfilingLockFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: AcquireProfilingLockFlagBitsKHR):
        self._value = bit._value

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


struct AcquireProfilingLockFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AcquireProfilingLockFlagsKHR:
        return AcquireProfilingLockFlagsKHR(value = self._value | other._value)


struct SemaphoreWaitFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SemaphoreWaitFlagBits):
        self._value = bit._value

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


struct SemaphoreWaitFlagBits(TrivialRegisterType, Equatable):
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


struct PipelineCompilerControlFlagsAMD(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineCompilerControlFlagBitsAMD):
        self._value = bit._value

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


struct PipelineCompilerControlFlagBitsAMD(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCompilerControlFlagsAMD:
        return PipelineCompilerControlFlagsAMD(value = self._value | other._value)


struct ShaderCorePropertiesFlagsAMD(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ShaderCorePropertiesFlagBitsAMD):
        self._value = bit._value

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


struct ShaderCorePropertiesFlagBitsAMD(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ShaderCorePropertiesFlagsAMD:
        return ShaderCorePropertiesFlagsAMD(value = self._value | other._value)


struct DeviceDiagnosticsConfigFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DeviceDiagnosticsConfigFlagBitsNV):
        self._value = bit._value

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


struct DeviceDiagnosticsConfigFlagBitsNV(TrivialRegisterType, Equatable):
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


struct RefreshObjectFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: RefreshObjectFlagBitsKHR):
        self._value = bit._value

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


struct RefreshObjectFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> RefreshObjectFlagsKHR:
        return RefreshObjectFlagsKHR(value = self._value | other._value)


struct AccessFlags2(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: AccessFlagBits2):
        self._value = bit._value

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
    comptime MEMORY_DECOMPRESSION_READ = Self(value = AccessFlagBits2.MEMORY_DECOMPRESSION_READ.value())
    comptime MEMORY_DECOMPRESSION_WRITE = Self(value = AccessFlagBits2.MEMORY_DECOMPRESSION_WRITE.value())
    comptime SAMPLER_HEAP_READ = Self(value = AccessFlagBits2.SAMPLER_HEAP_READ.value())
    comptime RESOURCE_HEAP_READ = Self(value = AccessFlagBits2.RESOURCE_HEAP_READ.value())
    comptime RESERVED_60 = Self(value = AccessFlagBits2.RESERVED_60.value())
    comptime RESERVED_61 = Self(value = AccessFlagBits2.RESERVED_61.value())
    comptime RESERVED_62 = Self(value = AccessFlagBits2.RESERVED_62.value())
    comptime RESERVED_63 = Self(value = AccessFlagBits2.RESERVED_63.value())


struct AccessFlagBits2(TrivialRegisterType, Equatable):
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
    comptime MEMORY_DECOMPRESSION_READ = Self(value = 1 << 55)
    comptime MEMORY_DECOMPRESSION_WRITE = Self(value = 1 << 56)
    comptime SAMPLER_HEAP_READ = Self(value = 1 << 57)
    comptime RESOURCE_HEAP_READ = Self(value = 1 << 58)
    comptime RESERVED_60 = Self(value = 1 << 60)
    comptime RESERVED_61 = Self(value = 1 << 61)
    comptime RESERVED_62 = Self(value = 1 << 62)
    comptime RESERVED_63 = Self(value = 1 << 63)


struct PipelineStageFlags2(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: PipelineStageFlagBits2):
        self._value = bit._value

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
    comptime MEMORY_DECOMPRESSION = Self(value = PipelineStageFlagBits2.MEMORY_DECOMPRESSION.value())
    comptime COPY_INDIRECT = Self(value = PipelineStageFlagBits2.COPY_INDIRECT.value())
    comptime RESERVED_47 = Self(value = PipelineStageFlagBits2.RESERVED_47.value())
    comptime RESERVED_48 = Self(value = PipelineStageFlagBits2.RESERVED_48.value())
    comptime RESERVED_49 = Self(value = PipelineStageFlagBits2.RESERVED_49.value())


struct PipelineStageFlagBits2(TrivialRegisterType, Equatable):
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
    comptime MEMORY_DECOMPRESSION = Self(value = 1 << 45)
    comptime COPY_INDIRECT = Self(value = 1 << 46)
    comptime RESERVED_47 = Self(value = 1 << 47)
    comptime RESERVED_48 = Self(value = 1 << 48)
    comptime RESERVED_49 = Self(value = 1 << 49)


struct AccelerationStructureMotionInfoFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: AccelerationStructureMotionInfoFlagBitsNV):
        self._value = bit._value

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


struct AccelerationStructureMotionInfoFlagBitsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AccelerationStructureMotionInfoFlagsNV:
        return AccelerationStructureMotionInfoFlagsNV(value = self._value | other._value)


struct AccelerationStructureMotionInstanceFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: AccelerationStructureMotionInstanceFlagBitsNV):
        self._value = bit._value

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


struct AccelerationStructureMotionInstanceFlagBitsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AccelerationStructureMotionInstanceFlagsNV:
        return AccelerationStructureMotionInstanceFlagsNV(value = self._value | other._value)


struct FormatFeatureFlags2(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: FormatFeatureFlagBits2):
        self._value = bit._value

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
    comptime RESERVED_44 = Self(value = FormatFeatureFlagBits2.RESERVED_44.value())
    comptime HOST_IMAGE_TRANSFER = Self(value = FormatFeatureFlagBits2.HOST_IMAGE_TRANSFER.value())
    comptime RESERVED_47 = Self(value = FormatFeatureFlagBits2.RESERVED_47.value())
    comptime TENSOR_DATA_GRAPH = Self(value = FormatFeatureFlagBits2.TENSOR_DATA_GRAPH.value())
    comptime VIDEO_ENCODE_QUANTIZATION_DELTA_MAP = Self(value = FormatFeatureFlagBits2.VIDEO_ENCODE_QUANTIZATION_DELTA_MAP.value())
    comptime VIDEO_ENCODE_EMPHASIS_MAP = Self(value = FormatFeatureFlagBits2.VIDEO_ENCODE_EMPHASIS_MAP.value())
    comptime ACCELERATION_STRUCTURE_RADIUS_BUFFER = Self(value = FormatFeatureFlagBits2.ACCELERATION_STRUCTURE_RADIUS_BUFFER.value())
    comptime DEPTH_COPY_ON_COMPUTE_QUEUE = Self(value = FormatFeatureFlagBits2.DEPTH_COPY_ON_COMPUTE_QUEUE.value())
    comptime DEPTH_COPY_ON_TRANSFER_QUEUE = Self(value = FormatFeatureFlagBits2.DEPTH_COPY_ON_TRANSFER_QUEUE.value())
    comptime STENCIL_COPY_ON_COMPUTE_QUEUE = Self(value = FormatFeatureFlagBits2.STENCIL_COPY_ON_COMPUTE_QUEUE.value())
    comptime STENCIL_COPY_ON_TRANSFER_QUEUE = Self(value = FormatFeatureFlagBits2.STENCIL_COPY_ON_TRANSFER_QUEUE.value())
    comptime RESERVED_56 = Self(value = FormatFeatureFlagBits2.RESERVED_56.value())
    comptime RESERVED_57 = Self(value = FormatFeatureFlagBits2.RESERVED_57.value())
    comptime RESERVED_58 = Self(value = FormatFeatureFlagBits2.RESERVED_58.value())
    comptime COPY_IMAGE_INDIRECT_DST = Self(value = FormatFeatureFlagBits2.COPY_IMAGE_INDIRECT_DST.value())
    comptime RESERVED_60 = Self(value = FormatFeatureFlagBits2.RESERVED_60.value())
    comptime RESERVED_61 = Self(value = FormatFeatureFlagBits2.RESERVED_61.value())


struct FormatFeatureFlagBits2(TrivialRegisterType, Equatable):
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
    comptime RESERVED_44 = Self(value = 1 << 44)
    comptime HOST_IMAGE_TRANSFER = Self(value = 1 << 46)
    comptime RESERVED_47 = Self(value = 1 << 47)
    comptime TENSOR_DATA_GRAPH = Self(value = 1 << 48)
    comptime VIDEO_ENCODE_QUANTIZATION_DELTA_MAP = Self(value = 1 << 49)
    comptime VIDEO_ENCODE_EMPHASIS_MAP = Self(value = 1 << 50)
    comptime ACCELERATION_STRUCTURE_RADIUS_BUFFER = Self(value = 1 << 51)
    comptime DEPTH_COPY_ON_COMPUTE_QUEUE = Self(value = 1 << 52)
    comptime DEPTH_COPY_ON_TRANSFER_QUEUE = Self(value = 1 << 53)
    comptime STENCIL_COPY_ON_COMPUTE_QUEUE = Self(value = 1 << 54)
    comptime STENCIL_COPY_ON_TRANSFER_QUEUE = Self(value = 1 << 55)
    comptime RESERVED_56 = Self(value = 1 << 56)
    comptime RESERVED_57 = Self(value = 1 << 57)
    comptime RESERVED_58 = Self(value = 1 << 58)
    comptime COPY_IMAGE_INDIRECT_DST = Self(value = 1 << 59)
    comptime RESERVED_60 = Self(value = 1 << 60)
    comptime RESERVED_61 = Self(value = 1 << 61)


struct RenderingFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: RenderingFlagBits):
        self._value = bit._value

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
    comptime FRAGMENT_REGION = Self(value = RenderingFlagBits.FRAGMENT_REGION.value())
    comptime CUSTOM_RESOLVE = Self(value = RenderingFlagBits.CUSTOM_RESOLVE.value())
    comptime LOCAL_READ_CONCURRENT_ACCESS_CONTROL = Self(value = RenderingFlagBits.LOCAL_READ_CONCURRENT_ACCESS_CONTROL.value())
    comptime RESERVED_9 = Self(value = RenderingFlagBits.RESERVED_9.value())


struct RenderingFlagBits(TrivialRegisterType, Equatable):
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
    comptime FRAGMENT_REGION = Self(value = 1 << 6)
    comptime CUSTOM_RESOLVE = Self(value = 1 << 7)
    comptime LOCAL_READ_CONCURRENT_ACCESS_CONTROL = Self(value = 1 << 8)
    comptime RESERVED_9 = Self(value = 1 << 9)


struct MemoryDecompressionMethodFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: MemoryDecompressionMethodFlagBitsEXT):
        self._value = bit._value

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: MemoryDecompressionMethodFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: MemoryDecompressionMethodFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: MemoryDecompressionMethodFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: MemoryDecompressionMethodFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: MemoryDecompressionMethodFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: MemoryDecompressionMethodFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: MemoryDecompressionMethodFlagsEXT) -> Bool:
        return self & other == other

    comptime GDEFLATE_1_0 = Self(value = MemoryDecompressionMethodFlagBitsEXT.GDEFLATE_1_0.value())


struct MemoryDecompressionMethodFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MemoryDecompressionMethodFlagsEXT:
        return MemoryDecompressionMethodFlagsEXT(value = self._value | other._value)

    comptime GDEFLATE_1_0 = Self(value = 1 << 0)


struct BuildMicromapFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: BuildMicromapFlagBitsEXT):
        self._value = bit._value

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


struct BuildMicromapFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct MicromapCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: MicromapCreateFlagBitsEXT):
        self._value = bit._value

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


struct MicromapCreateFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct IndirectCommandsLayoutUsageFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: IndirectCommandsLayoutUsageFlagBitsEXT):
        self._value = bit._value

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


struct IndirectCommandsLayoutUsageFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct IndirectCommandsInputModeFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: IndirectCommandsInputModeFlagBitsEXT):
        self._value = bit._value

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


struct IndirectCommandsInputModeFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct DirectDriverLoadingFlagsLUNARG(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DirectDriverLoadingFlagBitsLUNARG):
        self._value = bit._value

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


struct DirectDriverLoadingFlagBitsLUNARG(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DirectDriverLoadingFlagsLUNARG:
        return DirectDriverLoadingFlagsLUNARG(value = self._value | other._value)


struct PipelineCreateFlags2(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: PipelineCreateFlagBits2):
        self._value = bit._value

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
    comptime DESCRIPTOR_HEAP = Self(value = PipelineCreateFlagBits2.DESCRIPTOR_HEAP.value())
    comptime DISALLOW_OPACITY_MICROMAP = Self(value = PipelineCreateFlagBits2.DISALLOW_OPACITY_MICROMAP.value())
    comptime PER_LAYER_FRAGMENT_DENSITY = Self(value = PipelineCreateFlagBits2.PER_LAYER_FRAGMENT_DENSITY.value())
    comptime RESERVED_41 = Self(value = PipelineCreateFlagBits2.RESERVED_41.value())
    comptime N_64_BIT_INDEXING = Self(value = PipelineCreateFlagBits2.N_64_BIT_INDEXING.value())
    comptime PIPELINE_CREATE_RESERVED_44 = Self(value = PipelineCreateFlagBits2.PIPELINE_CREATE_RESERVED_44.value())
    comptime RESERVED_45 = Self(value = PipelineCreateFlagBits2.RESERVED_45.value())
    comptime RESERVED_46 = Self(value = PipelineCreateFlagBits2.RESERVED_46.value())
    comptime RESERVED_47 = Self(value = PipelineCreateFlagBits2.RESERVED_47.value())
    comptime RESERVED_48 = Self(value = PipelineCreateFlagBits2.RESERVED_48.value())


struct PipelineCreateFlagBits2(TrivialRegisterType, Equatable):
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
    comptime DESCRIPTOR_HEAP = Self(value = 1 << 36)
    comptime DISALLOW_OPACITY_MICROMAP = Self(value = 1 << 37)
    comptime PER_LAYER_FRAGMENT_DENSITY = Self(value = 1 << 40)
    comptime RESERVED_41 = Self(value = 1 << 41)
    comptime N_64_BIT_INDEXING = Self(value = 1 << 43)
    comptime PIPELINE_CREATE_RESERVED_44 = Self(value = 1 << 44)
    comptime RESERVED_45 = Self(value = 1 << 45)
    comptime RESERVED_46 = Self(value = 1 << 46)
    comptime RESERVED_47 = Self(value = 1 << 47)
    comptime RESERVED_48 = Self(value = 1 << 48)


struct BufferUsageFlags2(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: BufferUsageFlagBits2):
        self._value = bit._value

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
    comptime DESCRIPTOR_HEAP = Self(value = BufferUsageFlagBits2.DESCRIPTOR_HEAP.value())
    comptime DATA_GRAPH_FOREIGN_DESCRIPTOR = Self(value = BufferUsageFlagBits2.DATA_GRAPH_FOREIGN_DESCRIPTOR.value())
    comptime PREPROCESS_BUFFER = Self(value = BufferUsageFlagBits2.PREPROCESS_BUFFER.value())
    comptime MEMORY_DECOMPRESSION = Self(value = BufferUsageFlagBits2.MEMORY_DECOMPRESSION.value())
    comptime COMPRESSED_DATA_DGF1 = Self(value = BufferUsageFlagBits2.COMPRESSED_DATA_DGF1.value())
    comptime RESERVED_34 = Self(value = BufferUsageFlagBits2.RESERVED_34.value())
    comptime RESERVED_35 = Self(value = BufferUsageFlagBits2.RESERVED_35.value())
    comptime RESERVED_36 = Self(value = BufferUsageFlagBits2.RESERVED_36.value())
    comptime RESERVED_37 = Self(value = BufferUsageFlagBits2.RESERVED_37.value())


struct BufferUsageFlagBits2(TrivialRegisterType, Equatable):
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
    comptime DESCRIPTOR_HEAP = Self(value = 1 << 28)
    comptime DATA_GRAPH_FOREIGN_DESCRIPTOR = Self(value = 1 << 29)
    comptime PREPROCESS_BUFFER = Self(value = 1 << 31)
    comptime MEMORY_DECOMPRESSION = Self(value = 1 << 32)
    comptime COMPRESSED_DATA_DGF1 = Self(value = 1 << 33)
    comptime RESERVED_34 = Self(value = 1 << 34)
    comptime RESERVED_35 = Self(value = 1 << 35)
    comptime RESERVED_36 = Self(value = 1 << 36)
    comptime RESERVED_37 = Self(value = 1 << 37)


struct AddressCopyFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: AddressCopyFlagBitsKHR):
        self._value = bit._value

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: AddressCopyFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: AddressCopyFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: AddressCopyFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: AddressCopyFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: AddressCopyFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: AddressCopyFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: AddressCopyFlagsKHR) -> Bool:
        return self & other == other

    comptime DEVICE_LOCAL = Self(value = AddressCopyFlagBitsKHR.DEVICE_LOCAL.value())
    comptime SPARSE = Self(value = AddressCopyFlagBitsKHR.SPARSE.value())
    comptime PROTECTED = Self(value = AddressCopyFlagBitsKHR.PROTECTED.value())


struct AddressCopyFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AddressCopyFlagsKHR:
        return AddressCopyFlagsKHR(value = self._value | other._value)

    comptime DEVICE_LOCAL = Self(value = 1 << 0)
    comptime SPARSE = Self(value = 1 << 1)
    comptime PROTECTED = Self(value = 1 << 2)


struct TensorCreateFlagsARM(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: TensorCreateFlagBitsARM):
        self._value = bit._value

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
    comptime DESCRIPTOR_HEAP_CAPTURE_REPLAY = Self(value = TensorCreateFlagBitsARM.DESCRIPTOR_HEAP_CAPTURE_REPLAY.value())


struct TensorCreateFlagBitsARM(TrivialRegisterType, Equatable):
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
    comptime DESCRIPTOR_HEAP_CAPTURE_REPLAY = Self(value = 1 << 3)


struct TensorUsageFlagsARM(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: TensorUsageFlagBitsARM):
        self._value = bit._value

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


struct TensorUsageFlagBitsARM(TrivialRegisterType, Equatable):
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


struct TensorViewCreateFlagsARM(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: TensorViewCreateFlagBitsARM):
        self._value = bit._value

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


struct TensorViewCreateFlagBitsARM(TrivialRegisterType, Equatable):
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


struct DataGraphPipelineSessionCreateFlagsARM(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: DataGraphPipelineSessionCreateFlagBitsARM):
        self._value = bit._value

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


struct DataGraphPipelineSessionCreateFlagBitsARM(TrivialRegisterType, Equatable):
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


struct DataGraphPipelineDispatchFlagsARM(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: DataGraphPipelineDispatchFlagBitsARM):
        self._value = bit._value

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


struct DataGraphPipelineDispatchFlagBitsARM(TrivialRegisterType, Equatable):
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn value(self) -> UInt64:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DataGraphPipelineDispatchFlagsARM:
        return DataGraphPipelineDispatchFlagsARM(value = self._value | other._value)


struct VideoEncodeRgbModelConversionFlagsVALVE(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeRgbModelConversionFlagBitsVALVE):
        self._value = bit._value

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


struct VideoEncodeRgbModelConversionFlagBitsVALVE(TrivialRegisterType, Equatable):
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


struct VideoEncodeRgbRangeCompressionFlagsVALVE(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeRgbRangeCompressionFlagBitsVALVE):
        self._value = bit._value

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


struct VideoEncodeRgbRangeCompressionFlagBitsVALVE(TrivialRegisterType, Equatable):
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


struct VideoEncodeRgbChromaOffsetFlagsVALVE(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeRgbChromaOffsetFlagBitsVALVE):
        self._value = bit._value

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


struct VideoEncodeRgbChromaOffsetFlagBitsVALVE(TrivialRegisterType, Equatable):
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


struct SpirvResourceTypeFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SpirvResourceTypeFlagBitsEXT):
        self._value = bit._value

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SpirvResourceTypeFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SpirvResourceTypeFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SpirvResourceTypeFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SpirvResourceTypeFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SpirvResourceTypeFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SpirvResourceTypeFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: SpirvResourceTypeFlagsEXT) -> Bool:
        return self & other == other

    comptime ALL = Self(value = SpirvResourceTypeFlagBitsEXT.ALL.value())
    comptime SAMPLER = Self(value = SpirvResourceTypeFlagBitsEXT.SAMPLER.value())
    comptime SAMPLED_IMAGE = Self(value = SpirvResourceTypeFlagBitsEXT.SAMPLED_IMAGE.value())
    comptime READ_ONLY_IMAGE = Self(value = SpirvResourceTypeFlagBitsEXT.READ_ONLY_IMAGE.value())
    comptime READ_WRITE_IMAGE = Self(value = SpirvResourceTypeFlagBitsEXT.READ_WRITE_IMAGE.value())
    comptime COMBINED_SAMPLED_IMAGE = Self(value = SpirvResourceTypeFlagBitsEXT.COMBINED_SAMPLED_IMAGE.value())
    comptime UNIFORM_BUFFER = Self(value = SpirvResourceTypeFlagBitsEXT.UNIFORM_BUFFER.value())
    comptime READ_ONLY_STORAGE_BUFFER = Self(value = SpirvResourceTypeFlagBitsEXT.READ_ONLY_STORAGE_BUFFER.value())
    comptime READ_WRITE_STORAGE_BUFFER = Self(value = SpirvResourceTypeFlagBitsEXT.READ_WRITE_STORAGE_BUFFER.value())
    comptime ACCELERATION_STRUCTURE = Self(value = SpirvResourceTypeFlagBitsEXT.ACCELERATION_STRUCTURE.value())
    comptime TENSOR = Self(value = SpirvResourceTypeFlagBitsEXT.TENSOR.value())


struct SpirvResourceTypeFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SpirvResourceTypeFlagsEXT:
        return SpirvResourceTypeFlagsEXT(value = self._value | other._value)

    comptime ALL = Self(value = 2147483647)
    comptime SAMPLER = Self(value = 1 << 0)
    comptime SAMPLED_IMAGE = Self(value = 1 << 1)
    comptime READ_ONLY_IMAGE = Self(value = 1 << 2)
    comptime READ_WRITE_IMAGE = Self(value = 1 << 3)
    comptime COMBINED_SAMPLED_IMAGE = Self(value = 1 << 4)
    comptime UNIFORM_BUFFER = Self(value = 1 << 5)
    comptime READ_ONLY_STORAGE_BUFFER = Self(value = 1 << 6)
    comptime READ_WRITE_STORAGE_BUFFER = Self(value = 1 << 7)
    comptime ACCELERATION_STRUCTURE = Self(value = 1 << 8)
    comptime TENSOR = Self(value = 1 << 9)


struct CompositeAlphaFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: CompositeAlphaFlagBitsKHR):
        self._value = bit._value

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


struct CompositeAlphaFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct DisplayPlaneAlphaFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DisplayPlaneAlphaFlagBitsKHR):
        self._value = bit._value

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


struct DisplayPlaneAlphaFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct SurfaceTransformFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SurfaceTransformFlagBitsKHR):
        self._value = bit._value

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


struct SurfaceTransformFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct SwapchainCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SwapchainCreateFlagBitsKHR):
        self._value = bit._value

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
    comptime PRESENT_TIMING = Self(value = SwapchainCreateFlagBitsKHR.PRESENT_TIMING.value())


struct SwapchainCreateFlagBitsKHR(TrivialRegisterType, Equatable):
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
    comptime PRESENT_TIMING = Self(value = 1 << 9)


struct DisplayModeCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DisplayModeCreateFlagBitsKHR):
        self._value = bit._value

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


struct DisplayModeCreateFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DisplayModeCreateFlagsKHR:
        return DisplayModeCreateFlagsKHR(value = self._value | other._value)


struct DisplaySurfaceCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DisplaySurfaceCreateFlagBitsKHR):
        self._value = bit._value

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


struct DisplaySurfaceCreateFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DisplaySurfaceCreateFlagsKHR:
        return DisplaySurfaceCreateFlagsKHR(value = self._value | other._value)


struct AndroidSurfaceCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: AndroidSurfaceCreateFlagBitsKHR):
        self._value = bit._value

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


struct AndroidSurfaceCreateFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> AndroidSurfaceCreateFlagsKHR:
        return AndroidSurfaceCreateFlagsKHR(value = self._value | other._value)


struct ViSurfaceCreateFlagsNN(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ViSurfaceCreateFlagBitsNN):
        self._value = bit._value

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


struct ViSurfaceCreateFlagBitsNN(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ViSurfaceCreateFlagsNN:
        return ViSurfaceCreateFlagsNN(value = self._value | other._value)


struct WaylandSurfaceCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: WaylandSurfaceCreateFlagBitsKHR):
        self._value = bit._value

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


struct WaylandSurfaceCreateFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct Win32SurfaceCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: Win32SurfaceCreateFlagBitsKHR):
        self._value = bit._value

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


struct Win32SurfaceCreateFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> Win32SurfaceCreateFlagsKHR:
        return Win32SurfaceCreateFlagsKHR(value = self._value | other._value)


struct XlibSurfaceCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: XlibSurfaceCreateFlagBitsKHR):
        self._value = bit._value

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


struct XlibSurfaceCreateFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> XlibSurfaceCreateFlagsKHR:
        return XlibSurfaceCreateFlagsKHR(value = self._value | other._value)


struct XcbSurfaceCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: XcbSurfaceCreateFlagBitsKHR):
        self._value = bit._value

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


struct XcbSurfaceCreateFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> XcbSurfaceCreateFlagsKHR:
        return XcbSurfaceCreateFlagsKHR(value = self._value | other._value)


struct DirectFBSurfaceCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DirectFBSurfaceCreateFlagBitsEXT):
        self._value = bit._value

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


struct DirectFBSurfaceCreateFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DirectFBSurfaceCreateFlagsEXT:
        return DirectFBSurfaceCreateFlagsEXT(value = self._value | other._value)


struct IOSSurfaceCreateFlagsMVK(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: IOSSurfaceCreateFlagBitsMVK):
        self._value = bit._value

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


struct IOSSurfaceCreateFlagBitsMVK(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> IOSSurfaceCreateFlagsMVK:
        return IOSSurfaceCreateFlagsMVK(value = self._value | other._value)


struct MacOSSurfaceCreateFlagsMVK(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: MacOSSurfaceCreateFlagBitsMVK):
        self._value = bit._value

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


struct MacOSSurfaceCreateFlagBitsMVK(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MacOSSurfaceCreateFlagsMVK:
        return MacOSSurfaceCreateFlagsMVK(value = self._value | other._value)


struct MetalSurfaceCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: MetalSurfaceCreateFlagBitsEXT):
        self._value = bit._value

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


struct MetalSurfaceCreateFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> MetalSurfaceCreateFlagsEXT:
        return MetalSurfaceCreateFlagsEXT(value = self._value | other._value)


struct ImagePipeSurfaceCreateFlagsFUCHSIA(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ImagePipeSurfaceCreateFlagBitsFUCHSIA):
        self._value = bit._value

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


struct ImagePipeSurfaceCreateFlagBitsFUCHSIA(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImagePipeSurfaceCreateFlagsFUCHSIA:
        return ImagePipeSurfaceCreateFlagsFUCHSIA(value = self._value | other._value)


struct StreamDescriptorSurfaceCreateFlagsGGP(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: StreamDescriptorSurfaceCreateFlagBitsGGP):
        self._value = bit._value

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


struct StreamDescriptorSurfaceCreateFlagBitsGGP(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> StreamDescriptorSurfaceCreateFlagsGGP:
        return StreamDescriptorSurfaceCreateFlagsGGP(value = self._value | other._value)


struct HeadlessSurfaceCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: HeadlessSurfaceCreateFlagBitsEXT):
        self._value = bit._value

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


struct HeadlessSurfaceCreateFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> HeadlessSurfaceCreateFlagsEXT:
        return HeadlessSurfaceCreateFlagsEXT(value = self._value | other._value)


struct ScreenSurfaceCreateFlagsQNX(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ScreenSurfaceCreateFlagBitsQNX):
        self._value = bit._value

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


struct ScreenSurfaceCreateFlagBitsQNX(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ScreenSurfaceCreateFlagsQNX:
        return ScreenSurfaceCreateFlagsQNX(value = self._value | other._value)


struct PeerMemoryFeatureFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PeerMemoryFeatureFlagBits):
        self._value = bit._value

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


struct PeerMemoryFeatureFlagBits(TrivialRegisterType, Equatable):
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


struct MemoryAllocateFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: MemoryAllocateFlagBits):
        self._value = bit._value

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


struct MemoryAllocateFlagBits(TrivialRegisterType, Equatable):
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


struct DeviceGroupPresentModeFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DeviceGroupPresentModeFlagBitsKHR):
        self._value = bit._value

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


struct DeviceGroupPresentModeFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct DebugReportFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DebugReportFlagBitsEXT):
        self._value = bit._value

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


struct DebugReportFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct CommandPoolTrimFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: CommandPoolTrimFlagBits):
        self._value = bit._value

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


struct CommandPoolTrimFlagBits(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> CommandPoolTrimFlags:
        return CommandPoolTrimFlags(value = self._value | other._value)


struct ExternalMemoryHandleTypeFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ExternalMemoryHandleTypeFlagBitsNV):
        self._value = bit._value

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


struct ExternalMemoryHandleTypeFlagBitsNV(TrivialRegisterType, Equatable):
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


struct ClusterAccelerationStructureIndexFormatFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ClusterAccelerationStructureIndexFormatFlagBitsNV):
        self._value = bit._value

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


struct ClusterAccelerationStructureIndexFormatFlagBitsNV(TrivialRegisterType, Equatable):
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


struct ExternalMemoryFeatureFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ExternalMemoryFeatureFlagBitsNV):
        self._value = bit._value

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


struct ExternalMemoryFeatureFlagBitsNV(TrivialRegisterType, Equatable):
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


struct ExternalMemoryHandleTypeFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ExternalMemoryHandleTypeFlagBits):
        self._value = bit._value

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
    comptime OH_NATIVE_BUFFER = Self(value = ExternalMemoryHandleTypeFlagBits.OH_NATIVE_BUFFER.value())
    comptime MTLBUFFER = Self(value = ExternalMemoryHandleTypeFlagBits.MTLBUFFER.value())
    comptime MTLTEXTURE = Self(value = ExternalMemoryHandleTypeFlagBits.MTLTEXTURE.value())
    comptime MTLHEAP = Self(value = ExternalMemoryHandleTypeFlagBits.MTLHEAP.value())


struct ExternalMemoryHandleTypeFlagBits(TrivialRegisterType, Equatable):
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
    comptime OH_NATIVE_BUFFER = Self(value = 1 << 15)
    comptime MTLBUFFER = Self(value = 1 << 16)
    comptime MTLTEXTURE = Self(value = 1 << 17)
    comptime MTLHEAP = Self(value = 1 << 18)


struct ExternalMemoryFeatureFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ExternalMemoryFeatureFlagBits):
        self._value = bit._value

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


struct ExternalMemoryFeatureFlagBits(TrivialRegisterType, Equatable):
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


struct ExternalSemaphoreHandleTypeFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ExternalSemaphoreHandleTypeFlagBits):
        self._value = bit._value

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


struct ExternalSemaphoreHandleTypeFlagBits(TrivialRegisterType, Equatable):
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


struct ExternalSemaphoreFeatureFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ExternalSemaphoreFeatureFlagBits):
        self._value = bit._value

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


struct ExternalSemaphoreFeatureFlagBits(TrivialRegisterType, Equatable):
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


struct SemaphoreImportFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SemaphoreImportFlagBits):
        self._value = bit._value

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


struct SemaphoreImportFlagBits(TrivialRegisterType, Equatable):
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


struct ExternalFenceHandleTypeFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ExternalFenceHandleTypeFlagBits):
        self._value = bit._value

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


struct ExternalFenceHandleTypeFlagBits(TrivialRegisterType, Equatable):
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


struct ExternalFenceFeatureFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ExternalFenceFeatureFlagBits):
        self._value = bit._value

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


struct ExternalFenceFeatureFlagBits(TrivialRegisterType, Equatable):
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


struct FenceImportFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: FenceImportFlagBits):
        self._value = bit._value

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


struct FenceImportFlagBits(TrivialRegisterType, Equatable):
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


struct SurfaceCounterFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SurfaceCounterFlagBitsEXT):
        self._value = bit._value

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


struct SurfaceCounterFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct PipelineViewportSwizzleStateCreateFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineViewportSwizzleStateCreateFlagBitsNV):
        self._value = bit._value

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


struct PipelineViewportSwizzleStateCreateFlagBitsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineViewportSwizzleStateCreateFlagsNV:
        return PipelineViewportSwizzleStateCreateFlagsNV(value = self._value | other._value)


struct PipelineDiscardRectangleStateCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineDiscardRectangleStateCreateFlagBitsEXT):
        self._value = bit._value

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


struct PipelineDiscardRectangleStateCreateFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineDiscardRectangleStateCreateFlagsEXT:
        return PipelineDiscardRectangleStateCreateFlagsEXT(value = self._value | other._value)


struct PipelineCoverageToColorStateCreateFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineCoverageToColorStateCreateFlagBitsNV):
        self._value = bit._value

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


struct PipelineCoverageToColorStateCreateFlagBitsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCoverageToColorStateCreateFlagsNV:
        return PipelineCoverageToColorStateCreateFlagsNV(value = self._value | other._value)


struct PipelineCoverageModulationStateCreateFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineCoverageModulationStateCreateFlagBitsNV):
        self._value = bit._value

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


struct PipelineCoverageModulationStateCreateFlagBitsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCoverageModulationStateCreateFlagsNV:
        return PipelineCoverageModulationStateCreateFlagsNV(value = self._value | other._value)


struct PipelineCoverageReductionStateCreateFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineCoverageReductionStateCreateFlagBitsNV):
        self._value = bit._value

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


struct PipelineCoverageReductionStateCreateFlagBitsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineCoverageReductionStateCreateFlagsNV:
        return PipelineCoverageReductionStateCreateFlagsNV(value = self._value | other._value)


struct ValidationCacheCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ValidationCacheCreateFlagBitsEXT):
        self._value = bit._value

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


struct ValidationCacheCreateFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ValidationCacheCreateFlagsEXT:
        return ValidationCacheCreateFlagsEXT(value = self._value | other._value)


struct DebugUtilsMessageSeverityFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DebugUtilsMessageSeverityFlagBitsEXT):
        self._value = bit._value

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


struct DebugUtilsMessageSeverityFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct DebugUtilsMessageTypeFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DebugUtilsMessageTypeFlagBitsEXT):
        self._value = bit._value

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


struct DebugUtilsMessageTypeFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct DebugUtilsMessengerCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DebugUtilsMessengerCreateFlagBitsEXT):
        self._value = bit._value

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


struct DebugUtilsMessengerCreateFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DebugUtilsMessengerCreateFlagsEXT:
        return DebugUtilsMessengerCreateFlagsEXT(value = self._value | other._value)


struct DebugUtilsMessengerCallbackDataFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DebugUtilsMessengerCallbackDataFlagBitsEXT):
        self._value = bit._value

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


struct DebugUtilsMessengerCallbackDataFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DebugUtilsMessengerCallbackDataFlagsEXT:
        return DebugUtilsMessengerCallbackDataFlagsEXT(value = self._value | other._value)


struct DeviceMemoryReportFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DeviceMemoryReportFlagBitsEXT):
        self._value = bit._value

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


struct DeviceMemoryReportFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> DeviceMemoryReportFlagsEXT:
        return DeviceMemoryReportFlagsEXT(value = self._value | other._value)


struct PipelineRasterizationConservativeStateCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineRasterizationConservativeStateCreateFlagBitsEXT):
        self._value = bit._value

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


struct PipelineRasterizationConservativeStateCreateFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineRasterizationConservativeStateCreateFlagsEXT:
        return PipelineRasterizationConservativeStateCreateFlagsEXT(value = self._value | other._value)


struct DescriptorBindingFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DescriptorBindingFlagBits):
        self._value = bit._value

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


struct DescriptorBindingFlagBits(TrivialRegisterType, Equatable):
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


struct ConditionalRenderingFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ConditionalRenderingFlagBitsEXT):
        self._value = bit._value

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


struct ConditionalRenderingFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct ResolveModeFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ResolveModeFlagBits):
        self._value = bit._value

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
    comptime CUSTOM = Self(value = ResolveModeFlagBits.CUSTOM.value())


struct ResolveModeFlagBits(TrivialRegisterType, Equatable):
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
    comptime CUSTOM = Self(value = 1 << 5)


struct PipelineRasterizationStateStreamCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineRasterizationStateStreamCreateFlagBitsEXT):
        self._value = bit._value

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


struct PipelineRasterizationStateStreamCreateFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineRasterizationStateStreamCreateFlagsEXT:
        return PipelineRasterizationStateStreamCreateFlagsEXT(value = self._value | other._value)


struct PipelineRasterizationDepthClipStateCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PipelineRasterizationDepthClipStateCreateFlagBitsEXT):
        self._value = bit._value

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


struct PipelineRasterizationDepthClipStateCreateFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PipelineRasterizationDepthClipStateCreateFlagsEXT:
        return PipelineRasterizationDepthClipStateCreateFlagsEXT(value = self._value | other._value)


struct SwapchainImageUsageFlagsANDROID(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SwapchainImageUsageFlagBitsANDROID):
        self._value = bit._value

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


struct SwapchainImageUsageFlagBitsANDROID(TrivialRegisterType, Equatable):
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


struct ToolPurposeFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ToolPurposeFlagBits):
        self._value = bit._value

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


struct ToolPurposeFlagBits(TrivialRegisterType, Equatable):
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


struct SubmitFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SubmitFlagBits):
        self._value = bit._value

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


struct SubmitFlagBits(TrivialRegisterType, Equatable):
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


struct ImageFormatConstraintsFlagsFUCHSIA(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ImageFormatConstraintsFlagBitsFUCHSIA):
        self._value = bit._value

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


struct ImageFormatConstraintsFlagBitsFUCHSIA(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ImageFormatConstraintsFlagsFUCHSIA:
        return ImageFormatConstraintsFlagsFUCHSIA(value = self._value | other._value)


struct HostImageCopyFlags(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: HostImageCopyFlagBits):
        self._value = bit._value

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


struct HostImageCopyFlagBits(TrivialRegisterType, Equatable):
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


struct PartitionedAccelerationStructureInstanceFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PartitionedAccelerationStructureInstanceFlagBitsNV):
        self._value = bit._value

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


struct PartitionedAccelerationStructureInstanceFlagBitsNV(TrivialRegisterType, Equatable):
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


struct ImageConstraintsInfoFlagsFUCHSIA(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ImageConstraintsInfoFlagBitsFUCHSIA):
        self._value = bit._value

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


struct ImageConstraintsInfoFlagBitsFUCHSIA(TrivialRegisterType, Equatable):
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


struct GraphicsPipelineLibraryFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: GraphicsPipelineLibraryFlagBitsEXT):
        self._value = bit._value

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


struct GraphicsPipelineLibraryFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct ImageCompressionFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ImageCompressionFlagBitsEXT):
        self._value = bit._value

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


struct ImageCompressionFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct ImageCompressionFixedRateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ImageCompressionFixedRateFlagBitsEXT):
        self._value = bit._value

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


struct ImageCompressionFixedRateFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct ExportMetalObjectTypeFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ExportMetalObjectTypeFlagBitsEXT):
        self._value = bit._value

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


struct ExportMetalObjectTypeFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct RenderingAttachmentFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: RenderingAttachmentFlagBitsKHR):
        self._value = bit._value

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: RenderingAttachmentFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: RenderingAttachmentFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: RenderingAttachmentFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: RenderingAttachmentFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: RenderingAttachmentFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: RenderingAttachmentFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: RenderingAttachmentFlagsKHR) -> Bool:
        return self & other == other

    comptime INPUT_ATTACHMENT_FEEDBACK = Self(value = RenderingAttachmentFlagBitsKHR.INPUT_ATTACHMENT_FEEDBACK.value())
    comptime RESOLVE_SKIP_TRANSFER_FUNCTION = Self(value = RenderingAttachmentFlagBitsKHR.RESOLVE_SKIP_TRANSFER_FUNCTION.value())
    comptime RESOLVE_ENABLE_TRANSFER_FUNCTION = Self(value = RenderingAttachmentFlagBitsKHR.RESOLVE_ENABLE_TRANSFER_FUNCTION.value())


struct RenderingAttachmentFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> RenderingAttachmentFlagsKHR:
        return RenderingAttachmentFlagsKHR(value = self._value | other._value)

    comptime INPUT_ATTACHMENT_FEEDBACK = Self(value = 1 << 0)
    comptime RESOLVE_SKIP_TRANSFER_FUNCTION = Self(value = 1 << 1)
    comptime RESOLVE_ENABLE_TRANSFER_FUNCTION = Self(value = 1 << 2)


struct ResolveImageFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ResolveImageFlagBitsKHR):
        self._value = bit._value

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: ResolveImageFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: ResolveImageFlagsKHR) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: ResolveImageFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: ResolveImageFlagsKHR) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: ResolveImageFlagsKHR) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: ResolveImageFlagsKHR) -> Bool:
        return self & other == self

    fn is_superset(self, other: ResolveImageFlagsKHR) -> Bool:
        return self & other == other

    comptime SKIP_TRANSFER_FUNCTION = Self(value = ResolveImageFlagBitsKHR.SKIP_TRANSFER_FUNCTION.value())
    comptime ENABLE_TRANSFER_FUNCTION = Self(value = ResolveImageFlagBitsKHR.ENABLE_TRANSFER_FUNCTION.value())


struct ResolveImageFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> ResolveImageFlagsKHR:
        return ResolveImageFlagsKHR(value = self._value | other._value)

    comptime SKIP_TRANSFER_FUNCTION = Self(value = 1 << 0)
    comptime ENABLE_TRANSFER_FUNCTION = Self(value = 1 << 1)


struct DeviceAddressBindingFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: DeviceAddressBindingFlagBitsEXT):
        self._value = bit._value

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


struct DeviceAddressBindingFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct OpticalFlowGridSizeFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: OpticalFlowGridSizeFlagBitsNV):
        self._value = bit._value

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


struct OpticalFlowGridSizeFlagBitsNV(TrivialRegisterType, Equatable):
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


struct OpticalFlowUsageFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: OpticalFlowUsageFlagBitsNV):
        self._value = bit._value

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


struct OpticalFlowUsageFlagBitsNV(TrivialRegisterType, Equatable):
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


struct OpticalFlowSessionCreateFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: OpticalFlowSessionCreateFlagBitsNV):
        self._value = bit._value

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


struct OpticalFlowSessionCreateFlagBitsNV(TrivialRegisterType, Equatable):
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


struct OpticalFlowExecuteFlagsNV(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: OpticalFlowExecuteFlagBitsNV):
        self._value = bit._value

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


struct OpticalFlowExecuteFlagBitsNV(TrivialRegisterType, Equatable):
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


struct FrameBoundaryFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: FrameBoundaryFlagBitsEXT):
        self._value = bit._value

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


struct FrameBoundaryFlagBitsEXT(TrivialRegisterType, Equatable):
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


struct PresentScalingFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PresentScalingFlagBitsKHR):
        self._value = bit._value

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


struct PresentScalingFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct PresentGravityFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PresentGravityFlagBitsKHR):
        self._value = bit._value

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


struct PresentGravityFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct ShaderCreateFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: ShaderCreateFlagBitsEXT):
        self._value = bit._value

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
    comptime DESCRIPTOR_HEAP = Self(value = ShaderCreateFlagBitsEXT.DESCRIPTOR_HEAP.value())
    comptime RESERVED_12 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_12.value())
    comptime N_64_BIT_INDEXING = Self(value = ShaderCreateFlagBitsEXT.N_64_BIT_INDEXING.value())
    comptime RESERVED_16 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_16.value())
    comptime RESERVED_17 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_17.value())
    comptime RESERVED_18 = Self(value = ShaderCreateFlagBitsEXT.RESERVED_18.value())


struct ShaderCreateFlagBitsEXT(TrivialRegisterType, Equatable):
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
    comptime DESCRIPTOR_HEAP = Self(value = 1 << 10)
    comptime RESERVED_12 = Self(value = 1 << 12)
    comptime N_64_BIT_INDEXING = Self(value = 1 << 15)
    comptime RESERVED_16 = Self(value = 1 << 16)
    comptime RESERVED_17 = Self(value = 1 << 17)
    comptime RESERVED_18 = Self(value = 1 << 18)


struct TileShadingRenderPassFlagsQCOM(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: TileShadingRenderPassFlagBitsQCOM):
        self._value = bit._value

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


struct TileShadingRenderPassFlagBitsQCOM(TrivialRegisterType, Equatable):
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


struct PhysicalDeviceSchedulingControlsFlagsARM(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: PhysicalDeviceSchedulingControlsFlagBitsARM):
        self._value = bit._value

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


struct PhysicalDeviceSchedulingControlsFlagBitsARM(TrivialRegisterType, Equatable):
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


struct SurfaceCreateFlagsOHOS(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SurfaceCreateFlagBitsOHOS):
        self._value = bit._value

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


struct SurfaceCreateFlagBitsOHOS(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SurfaceCreateFlagsOHOS:
        return SurfaceCreateFlagsOHOS(value = self._value | other._value)


struct PresentStageFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PresentStageFlagBitsEXT):
        self._value = bit._value

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PresentStageFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PresentStageFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PresentStageFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PresentStageFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PresentStageFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PresentStageFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: PresentStageFlagsEXT) -> Bool:
        return self & other == other

    comptime QUEUE_OPERATIONS_END = Self(value = PresentStageFlagBitsEXT.QUEUE_OPERATIONS_END.value())
    comptime REQUEST_DEQUEUED = Self(value = PresentStageFlagBitsEXT.REQUEST_DEQUEUED.value())
    comptime IMAGE_FIRST_PIXEL_OUT = Self(value = PresentStageFlagBitsEXT.IMAGE_FIRST_PIXEL_OUT.value())
    comptime IMAGE_FIRST_PIXEL_VISIBLE = Self(value = PresentStageFlagBitsEXT.IMAGE_FIRST_PIXEL_VISIBLE.value())


struct PresentStageFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PresentStageFlagsEXT:
        return PresentStageFlagsEXT(value = self._value | other._value)

    comptime QUEUE_OPERATIONS_END = Self(value = 1 << 0)
    comptime REQUEST_DEQUEUED = Self(value = 1 << 1)
    comptime IMAGE_FIRST_PIXEL_OUT = Self(value = 1 << 2)
    comptime IMAGE_FIRST_PIXEL_VISIBLE = Self(value = 1 << 3)


struct PastPresentationTimingFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PastPresentationTimingFlagBitsEXT):
        self._value = bit._value

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PastPresentationTimingFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PastPresentationTimingFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PastPresentationTimingFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PastPresentationTimingFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PastPresentationTimingFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PastPresentationTimingFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: PastPresentationTimingFlagsEXT) -> Bool:
        return self & other == other

    comptime ALLOW_PARTIAL_RESULTS = Self(value = PastPresentationTimingFlagBitsEXT.ALLOW_PARTIAL_RESULTS.value())
    comptime ALLOW_OUT_OF_ORDER_RESULTS = Self(value = PastPresentationTimingFlagBitsEXT.ALLOW_OUT_OF_ORDER_RESULTS.value())


struct PastPresentationTimingFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PastPresentationTimingFlagsEXT:
        return PastPresentationTimingFlagsEXT(value = self._value | other._value)

    comptime ALLOW_PARTIAL_RESULTS = Self(value = 1 << 0)
    comptime ALLOW_OUT_OF_ORDER_RESULTS = Self(value = 1 << 1)


struct PresentTimingInfoFlagsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PresentTimingInfoFlagBitsEXT):
        self._value = bit._value

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PresentTimingInfoFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PresentTimingInfoFlagsEXT) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PresentTimingInfoFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PresentTimingInfoFlagsEXT) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PresentTimingInfoFlagsEXT) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PresentTimingInfoFlagsEXT) -> Bool:
        return self & other == self

    fn is_superset(self, other: PresentTimingInfoFlagsEXT) -> Bool:
        return self & other == other

    comptime PRESENT_AT_RELATIVE_TIME = Self(value = PresentTimingInfoFlagBitsEXT.PRESENT_AT_RELATIVE_TIME.value())
    comptime PRESENT_AT_NEAREST_REFRESH_CYCLE = Self(value = PresentTimingInfoFlagBitsEXT.PRESENT_AT_NEAREST_REFRESH_CYCLE.value())


struct PresentTimingInfoFlagBitsEXT(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PresentTimingInfoFlagsEXT:
        return PresentTimingInfoFlagsEXT(value = self._value | other._value)

    comptime PRESENT_AT_RELATIVE_TIME = Self(value = 1 << 0)
    comptime PRESENT_AT_NEAREST_REFRESH_CYCLE = Self(value = 1 << 1)


struct SwapchainImageUsageFlagsOHOS(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: SwapchainImageUsageFlagBitsOHOS):
        self._value = bit._value

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: SwapchainImageUsageFlagsOHOS) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: SwapchainImageUsageFlagsOHOS) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: SwapchainImageUsageFlagsOHOS) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: SwapchainImageUsageFlagsOHOS) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: SwapchainImageUsageFlagsOHOS) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: SwapchainImageUsageFlagsOHOS) -> Bool:
        return self & other == self

    fn is_superset(self, other: SwapchainImageUsageFlagsOHOS) -> Bool:
        return self & other == other

    comptime SHARED = Self(value = SwapchainImageUsageFlagBitsOHOS.SHARED.value())


struct SwapchainImageUsageFlagBitsOHOS(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> SwapchainImageUsageFlagsOHOS:
        return SwapchainImageUsageFlagsOHOS(value = self._value | other._value)

    comptime SHARED = Self(value = 1 << 0)


struct PerformanceCounterDescriptionFlagsARM(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: PerformanceCounterDescriptionFlagBitsARM):
        self._value = bit._value

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __bool__(self) -> Bool:
        return Bool(self._value)

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: PerformanceCounterDescriptionFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __ror__(self, other: PerformanceCounterDescriptionFlagsARM) -> Self:
        return Self(value = self.value() | other.value())

    fn __and__(self, other: PerformanceCounterDescriptionFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __rand__(self, other: PerformanceCounterDescriptionFlagsARM) -> Self:
        return Self(value = self.value() & other.value())

    fn __contains__(self, other: PerformanceCounterDescriptionFlagsARM) -> Bool:
        return self.is_superset(other)

    fn is_subset(self, other: PerformanceCounterDescriptionFlagsARM) -> Bool:
        return self & other == self

    fn is_superset(self, other: PerformanceCounterDescriptionFlagsARM) -> Bool:
        return self & other == other


struct PerformanceCounterDescriptionFlagBitsARM(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> PerformanceCounterDescriptionFlagsARM:
        return PerformanceCounterDescriptionFlagsARM(value = self._value | other._value)


struct VideoCodecOperationFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoCodecOperationFlagBitsKHR):
        self._value = bit._value

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


struct VideoCodecOperationFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoCapabilityFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoCapabilityFlagBitsKHR):
        self._value = bit._value

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


struct VideoCapabilityFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoSessionCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoSessionCreateFlagBitsKHR):
        self._value = bit._value

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


struct VideoSessionCreateFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoSessionParametersCreateFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoSessionParametersCreateFlagBitsKHR):
        self._value = bit._value

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


struct VideoSessionParametersCreateFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoBeginCodingFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoBeginCodingFlagBitsKHR):
        self._value = bit._value

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


struct VideoBeginCodingFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoBeginCodingFlagsKHR:
        return VideoBeginCodingFlagsKHR(value = self._value | other._value)


struct VideoEndCodingFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEndCodingFlagBitsKHR):
        self._value = bit._value

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


struct VideoEndCodingFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEndCodingFlagsKHR:
        return VideoEndCodingFlagsKHR(value = self._value | other._value)


struct VideoCodingControlFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoCodingControlFlagBitsKHR):
        self._value = bit._value

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


struct VideoCodingControlFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoDecodeUsageFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoDecodeUsageFlagBitsKHR):
        self._value = bit._value

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


struct VideoDecodeUsageFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoDecodeCapabilityFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoDecodeCapabilityFlagBitsKHR):
        self._value = bit._value

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


struct VideoDecodeCapabilityFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoDecodeFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoDecodeFlagBitsKHR):
        self._value = bit._value

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


struct VideoDecodeFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoDecodeFlagsKHR:
        return VideoDecodeFlagsKHR(value = self._value | other._value)


struct VideoDecodeH264PictureLayoutFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoDecodeH264PictureLayoutFlagBitsKHR):
        self._value = bit._value

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


struct VideoDecodeH264PictureLayoutFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeUsageFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeUsageFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeUsageFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeContentFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeContentFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeContentFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeCapabilityFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeCapabilityFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeCapabilityFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeFeedbackFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeFeedbackFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeFeedbackFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeRateControlFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeRateControlFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeRateControlFlagBitsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    fn __or__(self, other: Self) -> VideoEncodeRateControlFlagsKHR:
        return VideoEncodeRateControlFlagsKHR(value = self._value | other._value)


struct VideoEncodeRateControlModeFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeRateControlModeFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeRateControlModeFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeIntraRefreshModeFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeIntraRefreshModeFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeIntraRefreshModeFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoChromaSubsamplingFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoChromaSubsamplingFlagBitsKHR):
        self._value = bit._value

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


struct VideoChromaSubsamplingFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoComponentBitDepthFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoComponentBitDepthFlagBitsKHR):
        self._value = bit._value

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


struct VideoComponentBitDepthFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeH264CapabilityFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeH264CapabilityFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeH264CapabilityFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeH264StdFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeH264StdFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeH264StdFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeH264RateControlFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeH264RateControlFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeH264RateControlFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeH265CapabilityFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeH265CapabilityFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeH265CapabilityFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeH265StdFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeH265StdFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeH265StdFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeH265RateControlFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeH265RateControlFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeH265RateControlFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeH265CtbSizeFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeH265CtbSizeFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeH265CtbSizeFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeH265TransformBlockSizeFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeH265TransformBlockSizeFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeH265TransformBlockSizeFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeAV1CapabilityFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeAV1CapabilityFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeAV1CapabilityFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeAV1StdFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeAV1StdFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeAV1StdFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeAV1RateControlFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeAV1RateControlFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeAV1RateControlFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct VideoEncodeAV1SuperblockSizeFlagsKHR(TrivialRegisterType, Equatable):
    var _value: UInt32

    @implicit
    fn __init__(out self, bit: VideoEncodeAV1SuperblockSizeFlagBitsKHR):
        self._value = bit._value

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


struct VideoEncodeAV1SuperblockSizeFlagBitsKHR(TrivialRegisterType, Equatable):
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


struct AccessFlags3KHR(TrivialRegisterType, Equatable):
    var _value: UInt64

    @implicit
    fn __init__(out self, bit: AccessFlagBits3KHR):
        self._value = bit._value

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


struct AccessFlagBits3KHR(TrivialRegisterType, Equatable):
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
