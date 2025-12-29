comptime PrivateDataSlotCreateFlagBitsEXT = PrivateDataSlotCreateFlagBits
comptime DescriptorUpdateTemplateTypeKHR = DescriptorUpdateTemplateType
comptime PointClippingBehaviorKHR = PointClippingBehavior
comptime QueueGlobalPriorityKHR = QueueGlobalPriority
comptime QueueGlobalPriorityEXT = QueueGlobalPriority
comptime TimeDomainEXT = TimeDomainKHR
comptime ResolveModeFlagBitsKHR = ResolveModeFlagBits
comptime DescriptorBindingFlagBitsEXT = DescriptorBindingFlagBits
comptime SemaphoreTypeKHR = SemaphoreType
comptime GeometryFlagBitsNV = GeometryFlagBitsKHR
comptime GeometryInstanceFlagBitsNV = GeometryInstanceFlagBitsKHR
comptime BuildAccelerationStructureFlagBitsNV = BuildAccelerationStructureFlagBitsKHR
comptime CopyAccelerationStructureModeNV = CopyAccelerationStructureModeKHR
comptime AccelerationStructureTypeNV = AccelerationStructureTypeKHR
comptime GeometryTypeNV = GeometryTypeKHR
comptime RayTracingShaderGroupTypeNV = RayTracingShaderGroupTypeKHR
comptime PipelineCreationFeedbackFlagBitsEXT = PipelineCreationFeedbackFlagBits
comptime SemaphoreWaitFlagBitsKHR = SemaphoreWaitFlagBits
comptime LineRasterizationModeKHR = LineRasterizationMode
comptime LineRasterizationModeEXT = LineRasterizationMode
comptime ToolPurposeFlagBitsEXT = ToolPurposeFlagBits
comptime AccessFlagBits2KHR = AccessFlagBits2
comptime PipelineStageFlagBits2KHR = PipelineStageFlagBits2
comptime HostImageCopyFlagBitsEXT = HostImageCopyFlagBits
comptime FormatFeatureFlagBits2KHR = FormatFeatureFlagBits2
comptime RenderingFlagBitsKHR = RenderingFlagBits
comptime PipelineRobustnessBufferBehaviorEXT = PipelineRobustnessBufferBehavior
comptime PipelineRobustnessImageBehaviorEXT = PipelineRobustnessImageBehavior
comptime PipelineCreateFlagBits2KHR = PipelineCreateFlagBits2
comptime BufferUsageFlagBits2KHR = BufferUsageFlagBits2
comptime ScopeNV = ScopeKHR
comptime ComponentTypeNV = ComponentTypeKHR
comptime ExternalMemoryHandleTypeFlagBitsKHR = ExternalMemoryHandleTypeFlagBits
comptime ExternalMemoryFeatureFlagBitsKHR = ExternalMemoryFeatureFlagBits
comptime ExternalSemaphoreHandleTypeFlagBitsKHR = ExternalSemaphoreHandleTypeFlagBits
comptime ExternalSemaphoreFeatureFlagBitsKHR = ExternalSemaphoreFeatureFlagBits
comptime SemaphoreImportFlagBitsKHR = SemaphoreImportFlagBits
comptime ExternalFenceHandleTypeFlagBitsKHR = ExternalFenceHandleTypeFlagBits
comptime ExternalFenceFeatureFlagBitsKHR = ExternalFenceFeatureFlagBits
comptime FenceImportFlagBitsKHR = FenceImportFlagBits
comptime PeerMemoryFeatureFlagBitsKHR = PeerMemoryFeatureFlagBits
comptime MemoryAllocateFlagBitsKHR = MemoryAllocateFlagBits
comptime TessellationDomainOriginKHR = TessellationDomainOrigin
comptime SamplerYcbcrModelConversionKHR = SamplerYcbcrModelConversion
comptime SamplerYcbcrRangeKHR = SamplerYcbcrRange
comptime ChromaLocationKHR = ChromaLocation
comptime SamplerReductionModeEXT = SamplerReductionMode
comptime ShaderFloatControlsIndependenceKHR = ShaderFloatControlsIndependence
comptime SubmitFlagBitsKHR = SubmitFlagBits
comptime PresentScalingFlagBitsEXT = PresentScalingFlagBitsKHR
comptime PresentGravityFlagBitsEXT = PresentGravityFlagBitsKHR
comptime MemoryUnmapFlagBitsKHR = MemoryUnmapFlagBits
comptime DriverIdKHR = DriverId


@register_passable("trivial")
struct ImageLayout(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UNDEFINED = ImageLayout(raw = 0)
    comptime GENERAL = ImageLayout(raw = 1)
    comptime COLOR_ATTACHMENT_OPTIMAL = ImageLayout(raw = 2)
    comptime DEPTH_STENCIL_ATTACHMENT_OPTIMAL = ImageLayout(raw = 3)
    comptime DEPTH_STENCIL_READ_ONLY_OPTIMAL = ImageLayout(raw = 4)
    comptime SHADER_READ_ONLY_OPTIMAL = ImageLayout(raw = 5)
    comptime TRANSFER_SRC_OPTIMAL = ImageLayout(raw = 6)
    comptime TRANSFER_DST_OPTIMAL = ImageLayout(raw = 7)
    comptime PREINITIALIZED = ImageLayout(raw = 8)
    comptime DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL = ImageLayout(raw = 1000117000)
    comptime DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL = ImageLayout(raw = 1000117001)
    comptime DEPTH_ATTACHMENT_OPTIMAL = ImageLayout(raw = 1000241000)
    comptime DEPTH_READ_ONLY_OPTIMAL = ImageLayout(raw = 1000241001)
    comptime STENCIL_ATTACHMENT_OPTIMAL = ImageLayout(raw = 1000241002)
    comptime STENCIL_READ_ONLY_OPTIMAL = ImageLayout(raw = 1000241003)
    comptime READ_ONLY_OPTIMAL = ImageLayout(raw = 1000314000)
    comptime ATTACHMENT_OPTIMAL = ImageLayout(raw = 1000314001)
    comptime RENDERING_LOCAL_READ = ImageLayout(raw = 1000232000)
    comptime PRESENT_SRC_KHR = ImageLayout(raw = 1000001002)
    comptime VIDEO_DECODE_DST_KHR = ImageLayout(raw = 1000024000)
    comptime VIDEO_DECODE_SRC_KHR = ImageLayout(raw = 1000024001)
    comptime VIDEO_DECODE_DPB_KHR = ImageLayout(raw = 1000024002)
    comptime SHARED_PRESENT_KHR = ImageLayout(raw = 1000111000)
    comptime FRAGMENT_DENSITY_MAP_OPTIMAL_EXT = ImageLayout(raw = 1000218000)
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR = ImageLayout(raw = 1000164003)
    comptime VIDEO_ENCODE_DST_KHR = ImageLayout(raw = 1000299000)
    comptime VIDEO_ENCODE_SRC_KHR = ImageLayout(raw = 1000299001)
    comptime VIDEO_ENCODE_DPB_KHR = ImageLayout(raw = 1000299002)
    comptime ATTACHMENT_FEEDBACK_LOOP_OPTIMAL_EXT = ImageLayout(raw = 1000339000)
    comptime TENSOR_ALIASING_ARM = ImageLayout(raw = 1000460000)
    comptime VIDEO_ENCODE_QUANTIZATION_MAP_KHR = ImageLayout(raw = 1000553000)
    comptime ZERO_INITIALIZED_EXT = ImageLayout(raw = 1000620000)


@register_passable("trivial")
struct AttachmentLoadOp(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime LOAD = AttachmentLoadOp(raw = 0)
    comptime CLEAR = AttachmentLoadOp(raw = 1)
    comptime DONT_CARE = AttachmentLoadOp(raw = 2)
    comptime NONE = AttachmentLoadOp(raw = 1000400000)


@register_passable("trivial")
struct AttachmentStoreOp(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime STORE = AttachmentStoreOp(raw = 0)
    comptime DONT_CARE = AttachmentStoreOp(raw = 1)
    comptime NONE = AttachmentStoreOp(raw = 1000301000)


@register_passable("trivial")
struct ImageType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime N_1D = ImageType(raw = 0)
    comptime N_2D = ImageType(raw = 1)
    comptime N_3D = ImageType(raw = 2)


@register_passable("trivial")
struct ImageTiling(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime OPTIMAL = ImageTiling(raw = 0)
    comptime LINEAR = ImageTiling(raw = 1)
    comptime DRM_FORMAT_MODIFIER_EXT = ImageTiling(raw = 1000158000)


@register_passable("trivial")
struct ImageViewType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime N_1D = ImageViewType(raw = 0)
    comptime N_2D = ImageViewType(raw = 1)
    comptime N_3D = ImageViewType(raw = 2)
    comptime CUBE = ImageViewType(raw = 3)
    comptime N_1D_ARRAY = ImageViewType(raw = 4)
    comptime N_2D_ARRAY = ImageViewType(raw = 5)
    comptime CUBE_ARRAY = ImageViewType(raw = 6)


@register_passable("trivial")
struct CommandBufferLevel(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime PRIMARY = CommandBufferLevel(raw = 0)
    comptime SECONDARY = CommandBufferLevel(raw = 1)


@register_passable("trivial")
struct ComponentSwizzle(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime IDENTITY = ComponentSwizzle(raw = 0)
    comptime ZERO = ComponentSwizzle(raw = 1)
    comptime ONE = ComponentSwizzle(raw = 2)
    comptime R = ComponentSwizzle(raw = 3)
    comptime G = ComponentSwizzle(raw = 4)
    comptime B = ComponentSwizzle(raw = 5)
    comptime A = ComponentSwizzle(raw = 6)


@register_passable("trivial")
struct DescriptorType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime SAMPLER = DescriptorType(raw = 0)
    comptime COMBINED_IMAGE_SAMPLER = DescriptorType(raw = 1)
    comptime SAMPLED_IMAGE = DescriptorType(raw = 2)
    comptime STORAGE_IMAGE = DescriptorType(raw = 3)
    comptime UNIFORM_TEXEL_BUFFER = DescriptorType(raw = 4)
    comptime STORAGE_TEXEL_BUFFER = DescriptorType(raw = 5)
    comptime UNIFORM_BUFFER = DescriptorType(raw = 6)
    comptime STORAGE_BUFFER = DescriptorType(raw = 7)
    comptime UNIFORM_BUFFER_DYNAMIC = DescriptorType(raw = 8)
    comptime STORAGE_BUFFER_DYNAMIC = DescriptorType(raw = 9)
    comptime INPUT_ATTACHMENT = DescriptorType(raw = 10)
    comptime INLINE_UNIFORM_BLOCK = DescriptorType(raw = 1000138000)
    comptime ACCELERATION_STRUCTURE_KHR = DescriptorType(raw = 1000150000)
    comptime ACCELERATION_STRUCTURE_NV = DescriptorType(raw = 1000165000)
    comptime SAMPLE_WEIGHT_IMAGE_QCOM = DescriptorType(raw = 1000440000)
    comptime BLOCK_MATCH_IMAGE_QCOM = DescriptorType(raw = 1000440001)
    comptime TENSOR_ARM = DescriptorType(raw = 1000460000)
    comptime MUTABLE_EXT = DescriptorType(raw = 1000351000)
    comptime PARTITIONED_ACCELERATION_STRUCTURE_NV = DescriptorType(raw = 1000570000)


@register_passable("trivial")
struct QueryType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime OCCLUSION = QueryType(raw = 0)
    comptime PIPELINE_STATISTICS = QueryType(raw = 1)
    comptime TIMESTAMP = QueryType(raw = 2)
    comptime RESULT_STATUS_ONLY_KHR = QueryType(raw = 1000023000)
    comptime TRANSFORM_FEEDBACK_STREAM_EXT = QueryType(raw = 1000028004)
    comptime PERFORMANCE_QUERY_KHR = QueryType(raw = 1000116000)
    comptime ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR = QueryType(raw = 1000150000)
    comptime ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR = QueryType(raw = 1000150001)
    comptime ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV = QueryType(raw = 1000165000)
    comptime PERFORMANCE_QUERY_INTEL = QueryType(raw = 1000210000)
    comptime VIDEO_ENCODE_FEEDBACK_KHR = QueryType(raw = 1000299000)
    comptime MESH_PRIMITIVES_GENERATED_EXT = QueryType(raw = 1000328000)
    comptime PRIMITIVES_GENERATED_EXT = QueryType(raw = 1000382000)
    comptime ACCELERATION_STRUCTURE_SERIALIZATION_BOTTOM_LEVEL_POINTERS_KHR = QueryType(raw = 1000386000)
    comptime ACCELERATION_STRUCTURE_SIZE_KHR = QueryType(raw = 1000386001)
    comptime MICROMAP_SERIALIZATION_SIZE_EXT = QueryType(raw = 1000396000)
    comptime MICROMAP_COMPACTED_SIZE_EXT = QueryType(raw = 1000396001)


@register_passable("trivial")
struct BorderColor(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime FLOAT_TRANSPARENT_BLACK = BorderColor(raw = 0)
    comptime INT_TRANSPARENT_BLACK = BorderColor(raw = 1)
    comptime FLOAT_OPAQUE_BLACK = BorderColor(raw = 2)
    comptime INT_OPAQUE_BLACK = BorderColor(raw = 3)
    comptime FLOAT_OPAQUE_WHITE = BorderColor(raw = 4)
    comptime INT_OPAQUE_WHITE = BorderColor(raw = 5)
    comptime FLOAT_CUSTOM_EXT = BorderColor(raw = 1000287003)
    comptime INT_CUSTOM_EXT = BorderColor(raw = 1000287004)


@register_passable("trivial")
struct PipelineBindPoint(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime GRAPHICS = PipelineBindPoint(raw = 0)
    comptime COMPUTE = PipelineBindPoint(raw = 1)
    comptime EXECUTION_GRAPH_AMDX = PipelineBindPoint(raw = 1000134000)
    comptime RAY_TRACING_KHR = PipelineBindPoint(raw = 1000165000)
    comptime SUBPASS_SHADING_HUAWEI = PipelineBindPoint(raw = 1000369003)
    comptime DATA_GRAPH_ARM = PipelineBindPoint(raw = 1000507000)


@register_passable("trivial")
struct PipelineCacheHeaderVersion(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ONE = PipelineCacheHeaderVersion(raw = 1)
    comptime SAFETY_CRITICAL_ONE = PipelineCacheHeaderVersion(raw = 1000298001)


@register_passable("trivial")
struct PrimitiveTopology(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime POINT_LIST = PrimitiveTopology(raw = 0)
    comptime LINE_LIST = PrimitiveTopology(raw = 1)
    comptime LINE_STRIP = PrimitiveTopology(raw = 2)
    comptime TRIANGLE_LIST = PrimitiveTopology(raw = 3)
    comptime TRIANGLE_STRIP = PrimitiveTopology(raw = 4)
    comptime TRIANGLE_FAN = PrimitiveTopology(raw = 5)
    comptime LINE_LIST_WITH_ADJACENCY = PrimitiveTopology(raw = 6)
    comptime LINE_STRIP_WITH_ADJACENCY = PrimitiveTopology(raw = 7)
    comptime TRIANGLE_LIST_WITH_ADJACENCY = PrimitiveTopology(raw = 8)
    comptime TRIANGLE_STRIP_WITH_ADJACENCY = PrimitiveTopology(raw = 9)
    comptime PATCH_LIST = PrimitiveTopology(raw = 10)


@register_passable("trivial")
struct SharingMode(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime EXCLUSIVE = SharingMode(raw = 0)
    comptime CONCURRENT = SharingMode(raw = 1)


@register_passable("trivial")
struct IndexType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UINT16 = IndexType(raw = 0)
    comptime UINT32 = IndexType(raw = 1)
    comptime UINT8 = IndexType(raw = 1000265000)
    comptime NONE_KHR = IndexType(raw = 1000165000)


@register_passable("trivial")
struct Filter(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NEAREST = Filter(raw = 0)
    comptime LINEAR = Filter(raw = 1)
    comptime CUBIC_EXT = Filter(raw = 1000015000)


@register_passable("trivial")
struct SamplerMipmapMode(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NEAREST = SamplerMipmapMode(raw = 0)
    comptime LINEAR = SamplerMipmapMode(raw = 1)


@register_passable("trivial")
struct SamplerAddressMode(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime REPEAT = SamplerAddressMode(raw = 0)
    comptime MIRRORED_REPEAT = SamplerAddressMode(raw = 1)
    comptime CLAMP_TO_EDGE = SamplerAddressMode(raw = 2)
    comptime CLAMP_TO_BORDER = SamplerAddressMode(raw = 3)
    comptime MIRROR_CLAMP_TO_EDGE = SamplerAddressMode(raw = 4)


@register_passable("trivial")
struct CompareOp(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NEVER = CompareOp(raw = 0)
    comptime LESS = CompareOp(raw = 1)
    comptime EQUAL = CompareOp(raw = 2)
    comptime LESS_OR_EQUAL = CompareOp(raw = 3)
    comptime GREATER = CompareOp(raw = 4)
    comptime NOT_EQUAL = CompareOp(raw = 5)
    comptime GREATER_OR_EQUAL = CompareOp(raw = 6)
    comptime ALWAYS = CompareOp(raw = 7)


@register_passable("trivial")
struct PolygonMode(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime FILL = PolygonMode(raw = 0)
    comptime LINE = PolygonMode(raw = 1)
    comptime POINT = PolygonMode(raw = 2)
    comptime FILL_RECTANGLE_NV = PolygonMode(raw = 1000153000)


@register_passable("trivial")
struct FrontFace(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime COUNTER_CLOCKWISE = FrontFace(raw = 0)
    comptime CLOCKWISE = FrontFace(raw = 1)


@register_passable("trivial")
struct BlendFactor(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ZERO = BlendFactor(raw = 0)
    comptime ONE = BlendFactor(raw = 1)
    comptime SRC_COLOR = BlendFactor(raw = 2)
    comptime ONE_MINUS_SRC_COLOR = BlendFactor(raw = 3)
    comptime DST_COLOR = BlendFactor(raw = 4)
    comptime ONE_MINUS_DST_COLOR = BlendFactor(raw = 5)
    comptime SRC_ALPHA = BlendFactor(raw = 6)
    comptime ONE_MINUS_SRC_ALPHA = BlendFactor(raw = 7)
    comptime DST_ALPHA = BlendFactor(raw = 8)
    comptime ONE_MINUS_DST_ALPHA = BlendFactor(raw = 9)
    comptime CONSTANT_COLOR = BlendFactor(raw = 10)
    comptime ONE_MINUS_CONSTANT_COLOR = BlendFactor(raw = 11)
    comptime CONSTANT_ALPHA = BlendFactor(raw = 12)
    comptime ONE_MINUS_CONSTANT_ALPHA = BlendFactor(raw = 13)
    comptime SRC_ALPHA_SATURATE = BlendFactor(raw = 14)
    comptime SRC1_COLOR = BlendFactor(raw = 15)
    comptime ONE_MINUS_SRC1_COLOR = BlendFactor(raw = 16)
    comptime SRC1_ALPHA = BlendFactor(raw = 17)
    comptime ONE_MINUS_SRC1_ALPHA = BlendFactor(raw = 18)


@register_passable("trivial")
struct BlendOp(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ADD = BlendOp(raw = 0)
    comptime SUBTRACT = BlendOp(raw = 1)
    comptime REVERSE_SUBTRACT = BlendOp(raw = 2)
    comptime MIN = BlendOp(raw = 3)
    comptime MAX = BlendOp(raw = 4)
    comptime ZERO_EXT = BlendOp(raw = 1000148000)
    comptime SRC_EXT = BlendOp(raw = 1000148001)
    comptime DST_EXT = BlendOp(raw = 1000148002)
    comptime SRC_OVER_EXT = BlendOp(raw = 1000148003)
    comptime DST_OVER_EXT = BlendOp(raw = 1000148004)
    comptime SRC_IN_EXT = BlendOp(raw = 1000148005)
    comptime DST_IN_EXT = BlendOp(raw = 1000148006)
    comptime SRC_OUT_EXT = BlendOp(raw = 1000148007)
    comptime DST_OUT_EXT = BlendOp(raw = 1000148008)
    comptime SRC_ATOP_EXT = BlendOp(raw = 1000148009)
    comptime DST_ATOP_EXT = BlendOp(raw = 1000148010)
    comptime XOR_EXT = BlendOp(raw = 1000148011)
    comptime MULTIPLY_EXT = BlendOp(raw = 1000148012)
    comptime SCREEN_EXT = BlendOp(raw = 1000148013)
    comptime OVERLAY_EXT = BlendOp(raw = 1000148014)
    comptime DARKEN_EXT = BlendOp(raw = 1000148015)
    comptime LIGHTEN_EXT = BlendOp(raw = 1000148016)
    comptime COLORDODGE_EXT = BlendOp(raw = 1000148017)
    comptime COLORBURN_EXT = BlendOp(raw = 1000148018)
    comptime HARDLIGHT_EXT = BlendOp(raw = 1000148019)
    comptime SOFTLIGHT_EXT = BlendOp(raw = 1000148020)
    comptime DIFFERENCE_EXT = BlendOp(raw = 1000148021)
    comptime EXCLUSION_EXT = BlendOp(raw = 1000148022)
    comptime INVERT_EXT = BlendOp(raw = 1000148023)
    comptime INVERT_RGB_EXT = BlendOp(raw = 1000148024)
    comptime LINEARDODGE_EXT = BlendOp(raw = 1000148025)
    comptime LINEARBURN_EXT = BlendOp(raw = 1000148026)
    comptime VIVIDLIGHT_EXT = BlendOp(raw = 1000148027)
    comptime LINEARLIGHT_EXT = BlendOp(raw = 1000148028)
    comptime PINLIGHT_EXT = BlendOp(raw = 1000148029)
    comptime HARDMIX_EXT = BlendOp(raw = 1000148030)
    comptime HSL_HUE_EXT = BlendOp(raw = 1000148031)
    comptime HSL_SATURATION_EXT = BlendOp(raw = 1000148032)
    comptime HSL_COLOR_EXT = BlendOp(raw = 1000148033)
    comptime HSL_LUMINOSITY_EXT = BlendOp(raw = 1000148034)
    comptime PLUS_EXT = BlendOp(raw = 1000148035)
    comptime PLUS_CLAMPED_EXT = BlendOp(raw = 1000148036)
    comptime PLUS_CLAMPED_ALPHA_EXT = BlendOp(raw = 1000148037)
    comptime PLUS_DARKER_EXT = BlendOp(raw = 1000148038)
    comptime MINUS_EXT = BlendOp(raw = 1000148039)
    comptime MINUS_CLAMPED_EXT = BlendOp(raw = 1000148040)
    comptime CONTRAST_EXT = BlendOp(raw = 1000148041)
    comptime INVERT_OVG_EXT = BlendOp(raw = 1000148042)
    comptime RED_EXT = BlendOp(raw = 1000148043)
    comptime GREEN_EXT = BlendOp(raw = 1000148044)
    comptime BLUE_EXT = BlendOp(raw = 1000148045)


@register_passable("trivial")
struct StencilOp(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime KEEP = StencilOp(raw = 0)
    comptime ZERO = StencilOp(raw = 1)
    comptime REPLACE = StencilOp(raw = 2)
    comptime INCREMENT_AND_CLAMP = StencilOp(raw = 3)
    comptime DECREMENT_AND_CLAMP = StencilOp(raw = 4)
    comptime INVERT = StencilOp(raw = 5)
    comptime INCREMENT_AND_WRAP = StencilOp(raw = 6)
    comptime DECREMENT_AND_WRAP = StencilOp(raw = 7)


@register_passable("trivial")
struct LogicOp(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime CLEAR = LogicOp(raw = 0)
    comptime AND = LogicOp(raw = 1)
    comptime AND_REVERSE = LogicOp(raw = 2)
    comptime COPY = LogicOp(raw = 3)
    comptime AND_INVERTED = LogicOp(raw = 4)
    comptime NO_OP = LogicOp(raw = 5)
    comptime XOR = LogicOp(raw = 6)
    comptime OR = LogicOp(raw = 7)
    comptime NOR = LogicOp(raw = 8)
    comptime EQUIVALENT = LogicOp(raw = 9)
    comptime INVERT = LogicOp(raw = 10)
    comptime OR_REVERSE = LogicOp(raw = 11)
    comptime COPY_INVERTED = LogicOp(raw = 12)
    comptime OR_INVERTED = LogicOp(raw = 13)
    comptime NAND = LogicOp(raw = 14)
    comptime SET = LogicOp(raw = 15)


@register_passable("trivial")
struct InternalAllocationType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime EXECUTABLE = InternalAllocationType(raw = 0)


@register_passable("trivial")
struct SystemAllocationScope(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime COMMAND = SystemAllocationScope(raw = 0)
    comptime OBJECT = SystemAllocationScope(raw = 1)
    comptime CACHE = SystemAllocationScope(raw = 2)
    comptime DEVICE = SystemAllocationScope(raw = 3)
    comptime INSTANCE = SystemAllocationScope(raw = 4)


@register_passable("trivial")
struct PhysicalDeviceType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime OTHER = PhysicalDeviceType(raw = 0)
    comptime INTEGRATED_GPU = PhysicalDeviceType(raw = 1)
    comptime DISCRETE_GPU = PhysicalDeviceType(raw = 2)
    comptime VIRTUAL_GPU = PhysicalDeviceType(raw = 3)
    comptime CPU = PhysicalDeviceType(raw = 4)


@register_passable("trivial")
struct VertexInputRate(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime VERTEX = VertexInputRate(raw = 0)
    comptime INSTANCE = VertexInputRate(raw = 1)


@register_passable("trivial")
struct Format(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UNDEFINED = Format(raw = 0)
    comptime R4G4_UNORM_PACK8 = Format(raw = 1)
    comptime R4G4B4A4_UNORM_PACK16 = Format(raw = 2)
    comptime B4G4R4A4_UNORM_PACK16 = Format(raw = 3)
    comptime R5G6B5_UNORM_PACK16 = Format(raw = 4)
    comptime B5G6R5_UNORM_PACK16 = Format(raw = 5)
    comptime R5G5B5A1_UNORM_PACK16 = Format(raw = 6)
    comptime B5G5R5A1_UNORM_PACK16 = Format(raw = 7)
    comptime A1R5G5B5_UNORM_PACK16 = Format(raw = 8)
    comptime R8_UNORM = Format(raw = 9)
    comptime R8_SNORM = Format(raw = 10)
    comptime R8_USCALED = Format(raw = 11)
    comptime R8_SSCALED = Format(raw = 12)
    comptime R8_UINT = Format(raw = 13)
    comptime R8_SINT = Format(raw = 14)
    comptime R8_SRGB = Format(raw = 15)
    comptime R8G8_UNORM = Format(raw = 16)
    comptime R8G8_SNORM = Format(raw = 17)
    comptime R8G8_USCALED = Format(raw = 18)
    comptime R8G8_SSCALED = Format(raw = 19)
    comptime R8G8_UINT = Format(raw = 20)
    comptime R8G8_SINT = Format(raw = 21)
    comptime R8G8_SRGB = Format(raw = 22)
    comptime R8G8B8_UNORM = Format(raw = 23)
    comptime R8G8B8_SNORM = Format(raw = 24)
    comptime R8G8B8_USCALED = Format(raw = 25)
    comptime R8G8B8_SSCALED = Format(raw = 26)
    comptime R8G8B8_UINT = Format(raw = 27)
    comptime R8G8B8_SINT = Format(raw = 28)
    comptime R8G8B8_SRGB = Format(raw = 29)
    comptime B8G8R8_UNORM = Format(raw = 30)
    comptime B8G8R8_SNORM = Format(raw = 31)
    comptime B8G8R8_USCALED = Format(raw = 32)
    comptime B8G8R8_SSCALED = Format(raw = 33)
    comptime B8G8R8_UINT = Format(raw = 34)
    comptime B8G8R8_SINT = Format(raw = 35)
    comptime B8G8R8_SRGB = Format(raw = 36)
    comptime R8G8B8A8_UNORM = Format(raw = 37)
    comptime R8G8B8A8_SNORM = Format(raw = 38)
    comptime R8G8B8A8_USCALED = Format(raw = 39)
    comptime R8G8B8A8_SSCALED = Format(raw = 40)
    comptime R8G8B8A8_UINT = Format(raw = 41)
    comptime R8G8B8A8_SINT = Format(raw = 42)
    comptime R8G8B8A8_SRGB = Format(raw = 43)
    comptime B8G8R8A8_UNORM = Format(raw = 44)
    comptime B8G8R8A8_SNORM = Format(raw = 45)
    comptime B8G8R8A8_USCALED = Format(raw = 46)
    comptime B8G8R8A8_SSCALED = Format(raw = 47)
    comptime B8G8R8A8_UINT = Format(raw = 48)
    comptime B8G8R8A8_SINT = Format(raw = 49)
    comptime B8G8R8A8_SRGB = Format(raw = 50)
    comptime A8B8G8R8_UNORM_PACK32 = Format(raw = 51)
    comptime A8B8G8R8_SNORM_PACK32 = Format(raw = 52)
    comptime A8B8G8R8_USCALED_PACK32 = Format(raw = 53)
    comptime A8B8G8R8_SSCALED_PACK32 = Format(raw = 54)
    comptime A8B8G8R8_UINT_PACK32 = Format(raw = 55)
    comptime A8B8G8R8_SINT_PACK32 = Format(raw = 56)
    comptime A8B8G8R8_SRGB_PACK32 = Format(raw = 57)
    comptime A2R10G10B10_UNORM_PACK32 = Format(raw = 58)
    comptime A2R10G10B10_SNORM_PACK32 = Format(raw = 59)
    comptime A2R10G10B10_USCALED_PACK32 = Format(raw = 60)
    comptime A2R10G10B10_SSCALED_PACK32 = Format(raw = 61)
    comptime A2R10G10B10_UINT_PACK32 = Format(raw = 62)
    comptime A2R10G10B10_SINT_PACK32 = Format(raw = 63)
    comptime A2B10G10R10_UNORM_PACK32 = Format(raw = 64)
    comptime A2B10G10R10_SNORM_PACK32 = Format(raw = 65)
    comptime A2B10G10R10_USCALED_PACK32 = Format(raw = 66)
    comptime A2B10G10R10_SSCALED_PACK32 = Format(raw = 67)
    comptime A2B10G10R10_UINT_PACK32 = Format(raw = 68)
    comptime A2B10G10R10_SINT_PACK32 = Format(raw = 69)
    comptime R16_UNORM = Format(raw = 70)
    comptime R16_SNORM = Format(raw = 71)
    comptime R16_USCALED = Format(raw = 72)
    comptime R16_SSCALED = Format(raw = 73)
    comptime R16_UINT = Format(raw = 74)
    comptime R16_SINT = Format(raw = 75)
    comptime R16_SFLOAT = Format(raw = 76)
    comptime R16G16_UNORM = Format(raw = 77)
    comptime R16G16_SNORM = Format(raw = 78)
    comptime R16G16_USCALED = Format(raw = 79)
    comptime R16G16_SSCALED = Format(raw = 80)
    comptime R16G16_UINT = Format(raw = 81)
    comptime R16G16_SINT = Format(raw = 82)
    comptime R16G16_SFLOAT = Format(raw = 83)
    comptime R16G16B16_UNORM = Format(raw = 84)
    comptime R16G16B16_SNORM = Format(raw = 85)
    comptime R16G16B16_USCALED = Format(raw = 86)
    comptime R16G16B16_SSCALED = Format(raw = 87)
    comptime R16G16B16_UINT = Format(raw = 88)
    comptime R16G16B16_SINT = Format(raw = 89)
    comptime R16G16B16_SFLOAT = Format(raw = 90)
    comptime R16G16B16A16_UNORM = Format(raw = 91)
    comptime R16G16B16A16_SNORM = Format(raw = 92)
    comptime R16G16B16A16_USCALED = Format(raw = 93)
    comptime R16G16B16A16_SSCALED = Format(raw = 94)
    comptime R16G16B16A16_UINT = Format(raw = 95)
    comptime R16G16B16A16_SINT = Format(raw = 96)
    comptime R16G16B16A16_SFLOAT = Format(raw = 97)
    comptime R32_UINT = Format(raw = 98)
    comptime R32_SINT = Format(raw = 99)
    comptime R32_SFLOAT = Format(raw = 100)
    comptime R32G32_UINT = Format(raw = 101)
    comptime R32G32_SINT = Format(raw = 102)
    comptime R32G32_SFLOAT = Format(raw = 103)
    comptime R32G32B32_UINT = Format(raw = 104)
    comptime R32G32B32_SINT = Format(raw = 105)
    comptime R32G32B32_SFLOAT = Format(raw = 106)
    comptime R32G32B32A32_UINT = Format(raw = 107)
    comptime R32G32B32A32_SINT = Format(raw = 108)
    comptime R32G32B32A32_SFLOAT = Format(raw = 109)
    comptime R64_UINT = Format(raw = 110)
    comptime R64_SINT = Format(raw = 111)
    comptime R64_SFLOAT = Format(raw = 112)
    comptime R64G64_UINT = Format(raw = 113)
    comptime R64G64_SINT = Format(raw = 114)
    comptime R64G64_SFLOAT = Format(raw = 115)
    comptime R64G64B64_UINT = Format(raw = 116)
    comptime R64G64B64_SINT = Format(raw = 117)
    comptime R64G64B64_SFLOAT = Format(raw = 118)
    comptime R64G64B64A64_UINT = Format(raw = 119)
    comptime R64G64B64A64_SINT = Format(raw = 120)
    comptime R64G64B64A64_SFLOAT = Format(raw = 121)
    comptime B10G11R11_UFLOAT_PACK32 = Format(raw = 122)
    comptime E5B9G9R9_UFLOAT_PACK32 = Format(raw = 123)
    comptime D16_UNORM = Format(raw = 124)
    comptime X8_D24_UNORM_PACK32 = Format(raw = 125)
    comptime D32_SFLOAT = Format(raw = 126)
    comptime S8_UINT = Format(raw = 127)
    comptime D16_UNORM_S8_UINT = Format(raw = 128)
    comptime D24_UNORM_S8_UINT = Format(raw = 129)
    comptime D32_SFLOAT_S8_UINT = Format(raw = 130)
    comptime BC1_RGB_UNORM_BLOCK = Format(raw = 131)
    comptime BC1_RGB_SRGB_BLOCK = Format(raw = 132)
    comptime BC1_RGBA_UNORM_BLOCK = Format(raw = 133)
    comptime BC1_RGBA_SRGB_BLOCK = Format(raw = 134)
    comptime BC2_UNORM_BLOCK = Format(raw = 135)
    comptime BC2_SRGB_BLOCK = Format(raw = 136)
    comptime BC3_UNORM_BLOCK = Format(raw = 137)
    comptime BC3_SRGB_BLOCK = Format(raw = 138)
    comptime BC4_UNORM_BLOCK = Format(raw = 139)
    comptime BC4_SNORM_BLOCK = Format(raw = 140)
    comptime BC5_UNORM_BLOCK = Format(raw = 141)
    comptime BC5_SNORM_BLOCK = Format(raw = 142)
    comptime BC6H_UFLOAT_BLOCK = Format(raw = 143)
    comptime BC6H_SFLOAT_BLOCK = Format(raw = 144)
    comptime BC7_UNORM_BLOCK = Format(raw = 145)
    comptime BC7_SRGB_BLOCK = Format(raw = 146)
    comptime ETC2_R8G8B8_UNORM_BLOCK = Format(raw = 147)
    comptime ETC2_R8G8B8_SRGB_BLOCK = Format(raw = 148)
    comptime ETC2_R8G8B8A1_UNORM_BLOCK = Format(raw = 149)
    comptime ETC2_R8G8B8A1_SRGB_BLOCK = Format(raw = 150)
    comptime ETC2_R8G8B8A8_UNORM_BLOCK = Format(raw = 151)
    comptime ETC2_R8G8B8A8_SRGB_BLOCK = Format(raw = 152)
    comptime EAC_R11_UNORM_BLOCK = Format(raw = 153)
    comptime EAC_R11_SNORM_BLOCK = Format(raw = 154)
    comptime EAC_R11G11_UNORM_BLOCK = Format(raw = 155)
    comptime EAC_R11G11_SNORM_BLOCK = Format(raw = 156)
    comptime ASTC_4x4_UNORM_BLOCK = Format(raw = 157)
    comptime ASTC_4x4_SRGB_BLOCK = Format(raw = 158)
    comptime ASTC_5x4_UNORM_BLOCK = Format(raw = 159)
    comptime ASTC_5x4_SRGB_BLOCK = Format(raw = 160)
    comptime ASTC_5x5_UNORM_BLOCK = Format(raw = 161)
    comptime ASTC_5x5_SRGB_BLOCK = Format(raw = 162)
    comptime ASTC_6x5_UNORM_BLOCK = Format(raw = 163)
    comptime ASTC_6x5_SRGB_BLOCK = Format(raw = 164)
    comptime ASTC_6x6_UNORM_BLOCK = Format(raw = 165)
    comptime ASTC_6x6_SRGB_BLOCK = Format(raw = 166)
    comptime ASTC_8x5_UNORM_BLOCK = Format(raw = 167)
    comptime ASTC_8x5_SRGB_BLOCK = Format(raw = 168)
    comptime ASTC_8x6_UNORM_BLOCK = Format(raw = 169)
    comptime ASTC_8x6_SRGB_BLOCK = Format(raw = 170)
    comptime ASTC_8x8_UNORM_BLOCK = Format(raw = 171)
    comptime ASTC_8x8_SRGB_BLOCK = Format(raw = 172)
    comptime ASTC_10x5_UNORM_BLOCK = Format(raw = 173)
    comptime ASTC_10x5_SRGB_BLOCK = Format(raw = 174)
    comptime ASTC_10x6_UNORM_BLOCK = Format(raw = 175)
    comptime ASTC_10x6_SRGB_BLOCK = Format(raw = 176)
    comptime ASTC_10x8_UNORM_BLOCK = Format(raw = 177)
    comptime ASTC_10x8_SRGB_BLOCK = Format(raw = 178)
    comptime ASTC_10x10_UNORM_BLOCK = Format(raw = 179)
    comptime ASTC_10x10_SRGB_BLOCK = Format(raw = 180)
    comptime ASTC_12x10_UNORM_BLOCK = Format(raw = 181)
    comptime ASTC_12x10_SRGB_BLOCK = Format(raw = 182)
    comptime ASTC_12x12_UNORM_BLOCK = Format(raw = 183)
    comptime ASTC_12x12_SRGB_BLOCK = Format(raw = 184)
    comptime G8B8G8R8_422_UNORM = Format(raw = 1000156000)
    comptime B8G8R8G8_422_UNORM = Format(raw = 1000156001)
    comptime G8_B8_R8_3PLANE_420_UNORM = Format(raw = 1000156002)
    comptime G8_B8R8_2PLANE_420_UNORM = Format(raw = 1000156003)
    comptime G8_B8_R8_3PLANE_422_UNORM = Format(raw = 1000156004)
    comptime G8_B8R8_2PLANE_422_UNORM = Format(raw = 1000156005)
    comptime G8_B8_R8_3PLANE_444_UNORM = Format(raw = 1000156006)
    comptime R10X6_UNORM_PACK16 = Format(raw = 1000156007)
    comptime R10X6G10X6_UNORM_2PACK16 = Format(raw = 1000156008)
    comptime R10X6G10X6B10X6A10X6_UNORM_4PACK16 = Format(raw = 1000156009)
    comptime G10X6B10X6G10X6R10X6_422_UNORM_4PACK16 = Format(raw = 1000156010)
    comptime B10X6G10X6R10X6G10X6_422_UNORM_4PACK16 = Format(raw = 1000156011)
    comptime G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16 = Format(raw = 1000156012)
    comptime G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16 = Format(raw = 1000156013)
    comptime G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16 = Format(raw = 1000156014)
    comptime G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16 = Format(raw = 1000156015)
    comptime G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16 = Format(raw = 1000156016)
    comptime R12X4_UNORM_PACK16 = Format(raw = 1000156017)
    comptime R12X4G12X4_UNORM_2PACK16 = Format(raw = 1000156018)
    comptime R12X4G12X4B12X4A12X4_UNORM_4PACK16 = Format(raw = 1000156019)
    comptime G12X4B12X4G12X4R12X4_422_UNORM_4PACK16 = Format(raw = 1000156020)
    comptime B12X4G12X4R12X4G12X4_422_UNORM_4PACK16 = Format(raw = 1000156021)
    comptime G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16 = Format(raw = 1000156022)
    comptime G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16 = Format(raw = 1000156023)
    comptime G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16 = Format(raw = 1000156024)
    comptime G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16 = Format(raw = 1000156025)
    comptime G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16 = Format(raw = 1000156026)
    comptime G16B16G16R16_422_UNORM = Format(raw = 1000156027)
    comptime B16G16R16G16_422_UNORM = Format(raw = 1000156028)
    comptime G16_B16_R16_3PLANE_420_UNORM = Format(raw = 1000156029)
    comptime G16_B16R16_2PLANE_420_UNORM = Format(raw = 1000156030)
    comptime G16_B16_R16_3PLANE_422_UNORM = Format(raw = 1000156031)
    comptime G16_B16R16_2PLANE_422_UNORM = Format(raw = 1000156032)
    comptime G16_B16_R16_3PLANE_444_UNORM = Format(raw = 1000156033)
    comptime G8_B8R8_2PLANE_444_UNORM = Format(raw = 1000330000)
    comptime G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16 = Format(raw = 1000330001)
    comptime G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16 = Format(raw = 1000330002)
    comptime G16_B16R16_2PLANE_444_UNORM = Format(raw = 1000330003)
    comptime A4R4G4B4_UNORM_PACK16 = Format(raw = 1000340000)
    comptime A4B4G4R4_UNORM_PACK16 = Format(raw = 1000340001)
    comptime ASTC_4x4_SFLOAT_BLOCK = Format(raw = 1000066000)
    comptime ASTC_5x4_SFLOAT_BLOCK = Format(raw = 1000066001)
    comptime ASTC_5x5_SFLOAT_BLOCK = Format(raw = 1000066002)
    comptime ASTC_6x5_SFLOAT_BLOCK = Format(raw = 1000066003)
    comptime ASTC_6x6_SFLOAT_BLOCK = Format(raw = 1000066004)
    comptime ASTC_8x5_SFLOAT_BLOCK = Format(raw = 1000066005)
    comptime ASTC_8x6_SFLOAT_BLOCK = Format(raw = 1000066006)
    comptime ASTC_8x8_SFLOAT_BLOCK = Format(raw = 1000066007)
    comptime ASTC_10x5_SFLOAT_BLOCK = Format(raw = 1000066008)
    comptime ASTC_10x6_SFLOAT_BLOCK = Format(raw = 1000066009)
    comptime ASTC_10x8_SFLOAT_BLOCK = Format(raw = 1000066010)
    comptime ASTC_10x10_SFLOAT_BLOCK = Format(raw = 1000066011)
    comptime ASTC_12x10_SFLOAT_BLOCK = Format(raw = 1000066012)
    comptime ASTC_12x12_SFLOAT_BLOCK = Format(raw = 1000066013)
    comptime A1B5G5R5_UNORM_PACK16 = Format(raw = 1000470000)
    comptime A8_UNORM = Format(raw = 1000470001)
    comptime PVRTC1_2BPP_UNORM_BLOCK_IMG = Format(raw = 1000054000)
    comptime PVRTC1_4BPP_UNORM_BLOCK_IMG = Format(raw = 1000054001)
    comptime PVRTC2_2BPP_UNORM_BLOCK_IMG = Format(raw = 1000054002)
    comptime PVRTC2_4BPP_UNORM_BLOCK_IMG = Format(raw = 1000054003)
    comptime PVRTC1_2BPP_SRGB_BLOCK_IMG = Format(raw = 1000054004)
    comptime PVRTC1_4BPP_SRGB_BLOCK_IMG = Format(raw = 1000054005)
    comptime PVRTC2_2BPP_SRGB_BLOCK_IMG = Format(raw = 1000054006)
    comptime PVRTC2_4BPP_SRGB_BLOCK_IMG = Format(raw = 1000054007)
    comptime ASTC_3x3x3_UNORM_BLOCK_EXT = Format(raw = 1000288000)
    comptime ASTC_3x3x3_SRGB_BLOCK_EXT = Format(raw = 1000288001)
    comptime ASTC_3x3x3_SFLOAT_BLOCK_EXT = Format(raw = 1000288002)
    comptime ASTC_4x3x3_UNORM_BLOCK_EXT = Format(raw = 1000288003)
    comptime ASTC_4x3x3_SRGB_BLOCK_EXT = Format(raw = 1000288004)
    comptime ASTC_4x3x3_SFLOAT_BLOCK_EXT = Format(raw = 1000288005)
    comptime ASTC_4x4x3_UNORM_BLOCK_EXT = Format(raw = 1000288006)
    comptime ASTC_4x4x3_SRGB_BLOCK_EXT = Format(raw = 1000288007)
    comptime ASTC_4x4x3_SFLOAT_BLOCK_EXT = Format(raw = 1000288008)
    comptime ASTC_4x4x4_UNORM_BLOCK_EXT = Format(raw = 1000288009)
    comptime ASTC_4x4x4_SRGB_BLOCK_EXT = Format(raw = 1000288010)
    comptime ASTC_4x4x4_SFLOAT_BLOCK_EXT = Format(raw = 1000288011)
    comptime ASTC_5x4x4_UNORM_BLOCK_EXT = Format(raw = 1000288012)
    comptime ASTC_5x4x4_SRGB_BLOCK_EXT = Format(raw = 1000288013)
    comptime ASTC_5x4x4_SFLOAT_BLOCK_EXT = Format(raw = 1000288014)
    comptime ASTC_5x5x4_UNORM_BLOCK_EXT = Format(raw = 1000288015)
    comptime ASTC_5x5x4_SRGB_BLOCK_EXT = Format(raw = 1000288016)
    comptime ASTC_5x5x4_SFLOAT_BLOCK_EXT = Format(raw = 1000288017)
    comptime ASTC_5x5x5_UNORM_BLOCK_EXT = Format(raw = 1000288018)
    comptime ASTC_5x5x5_SRGB_BLOCK_EXT = Format(raw = 1000288019)
    comptime ASTC_5x5x5_SFLOAT_BLOCK_EXT = Format(raw = 1000288020)
    comptime ASTC_6x5x5_UNORM_BLOCK_EXT = Format(raw = 1000288021)
    comptime ASTC_6x5x5_SRGB_BLOCK_EXT = Format(raw = 1000288022)
    comptime ASTC_6x5x5_SFLOAT_BLOCK_EXT = Format(raw = 1000288023)
    comptime ASTC_6x6x5_UNORM_BLOCK_EXT = Format(raw = 1000288024)
    comptime ASTC_6x6x5_SRGB_BLOCK_EXT = Format(raw = 1000288025)
    comptime ASTC_6x6x5_SFLOAT_BLOCK_EXT = Format(raw = 1000288026)
    comptime ASTC_6x6x6_UNORM_BLOCK_EXT = Format(raw = 1000288027)
    comptime ASTC_6x6x6_SRGB_BLOCK_EXT = Format(raw = 1000288028)
    comptime ASTC_6x6x6_SFLOAT_BLOCK_EXT = Format(raw = 1000288029)
    comptime R8_BOOL_ARM = Format(raw = 1000460000)
    comptime R16G16_SFIXED5_NV = Format(raw = 1000464000)
    comptime R10X6_UINT_PACK16_ARM = Format(raw = 1000609000)
    comptime R10X6G10X6_UINT_2PACK16_ARM = Format(raw = 1000609001)
    comptime R10X6G10X6B10X6A10X6_UINT_4PACK16_ARM = Format(raw = 1000609002)
    comptime R12X4_UINT_PACK16_ARM = Format(raw = 1000609003)
    comptime R12X4G12X4_UINT_2PACK16_ARM = Format(raw = 1000609004)
    comptime R12X4G12X4B12X4A12X4_UINT_4PACK16_ARM = Format(raw = 1000609005)
    comptime R14X2_UINT_PACK16_ARM = Format(raw = 1000609006)
    comptime R14X2G14X2_UINT_2PACK16_ARM = Format(raw = 1000609007)
    comptime R14X2G14X2B14X2A14X2_UINT_4PACK16_ARM = Format(raw = 1000609008)
    comptime R14X2_UNORM_PACK16_ARM = Format(raw = 1000609009)
    comptime R14X2G14X2_UNORM_2PACK16_ARM = Format(raw = 1000609010)
    comptime R14X2G14X2B14X2A14X2_UNORM_4PACK16_ARM = Format(raw = 1000609011)
    comptime G14X2_B14X2R14X2_2PLANE_420_UNORM_3PACK16_ARM = Format(raw = 1000609012)
    comptime G14X2_B14X2R14X2_2PLANE_422_UNORM_3PACK16_ARM = Format(raw = 1000609013)


@register_passable("trivial")
struct StructureType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime APPLICATION_INFO = StructureType(raw = 0)
    comptime INSTANCE_CREATE_INFO = StructureType(raw = 1)
    comptime DEVICE_QUEUE_CREATE_INFO = StructureType(raw = 2)
    comptime DEVICE_CREATE_INFO = StructureType(raw = 3)
    comptime SUBMIT_INFO = StructureType(raw = 4)
    comptime MEMORY_ALLOCATE_INFO = StructureType(raw = 5)
    comptime MAPPED_MEMORY_RANGE = StructureType(raw = 6)
    comptime BIND_SPARSE_INFO = StructureType(raw = 7)
    comptime FENCE_CREATE_INFO = StructureType(raw = 8)
    comptime SEMAPHORE_CREATE_INFO = StructureType(raw = 9)
    comptime EVENT_CREATE_INFO = StructureType(raw = 10)
    comptime QUERY_POOL_CREATE_INFO = StructureType(raw = 11)
    comptime BUFFER_CREATE_INFO = StructureType(raw = 12)
    comptime BUFFER_VIEW_CREATE_INFO = StructureType(raw = 13)
    comptime IMAGE_CREATE_INFO = StructureType(raw = 14)
    comptime IMAGE_VIEW_CREATE_INFO = StructureType(raw = 15)
    comptime SHADER_MODULE_CREATE_INFO = StructureType(raw = 16)
    comptime PIPELINE_CACHE_CREATE_INFO = StructureType(raw = 17)
    comptime PIPELINE_SHADER_STAGE_CREATE_INFO = StructureType(raw = 18)
    comptime PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO = StructureType(raw = 19)
    comptime PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO = StructureType(raw = 20)
    comptime PIPELINE_TESSELLATION_STATE_CREATE_INFO = StructureType(raw = 21)
    comptime PIPELINE_VIEWPORT_STATE_CREATE_INFO = StructureType(raw = 22)
    comptime PIPELINE_RASTERIZATION_STATE_CREATE_INFO = StructureType(raw = 23)
    comptime PIPELINE_MULTISAMPLE_STATE_CREATE_INFO = StructureType(raw = 24)
    comptime PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO = StructureType(raw = 25)
    comptime PIPELINE_COLOR_BLEND_STATE_CREATE_INFO = StructureType(raw = 26)
    comptime PIPELINE_DYNAMIC_STATE_CREATE_INFO = StructureType(raw = 27)
    comptime GRAPHICS_PIPELINE_CREATE_INFO = StructureType(raw = 28)
    comptime COMPUTE_PIPELINE_CREATE_INFO = StructureType(raw = 29)
    comptime PIPELINE_LAYOUT_CREATE_INFO = StructureType(raw = 30)
    comptime SAMPLER_CREATE_INFO = StructureType(raw = 31)
    comptime DESCRIPTOR_SET_LAYOUT_CREATE_INFO = StructureType(raw = 32)
    comptime DESCRIPTOR_POOL_CREATE_INFO = StructureType(raw = 33)
    comptime DESCRIPTOR_SET_ALLOCATE_INFO = StructureType(raw = 34)
    comptime WRITE_DESCRIPTOR_SET = StructureType(raw = 35)
    comptime COPY_DESCRIPTOR_SET = StructureType(raw = 36)
    comptime FRAMEBUFFER_CREATE_INFO = StructureType(raw = 37)
    comptime RENDER_PASS_CREATE_INFO = StructureType(raw = 38)
    comptime COMMAND_POOL_CREATE_INFO = StructureType(raw = 39)
    comptime COMMAND_BUFFER_ALLOCATE_INFO = StructureType(raw = 40)
    comptime COMMAND_BUFFER_INHERITANCE_INFO = StructureType(raw = 41)
    comptime COMMAND_BUFFER_BEGIN_INFO = StructureType(raw = 42)
    comptime RENDER_PASS_BEGIN_INFO = StructureType(raw = 43)
    comptime BUFFER_MEMORY_BARRIER = StructureType(raw = 44)
    comptime IMAGE_MEMORY_BARRIER = StructureType(raw = 45)
    comptime MEMORY_BARRIER = StructureType(raw = 46)
    comptime LOADER_INSTANCE_CREATE_INFO = StructureType(raw = 47)
    comptime LOADER_DEVICE_CREATE_INFO = StructureType(raw = 48)
    comptime PHYSICAL_DEVICE_SUBGROUP_PROPERTIES = StructureType(raw = 1000094000)
    comptime BIND_BUFFER_MEMORY_INFO = StructureType(raw = 1000157000)
    comptime BIND_IMAGE_MEMORY_INFO = StructureType(raw = 1000157001)
    comptime PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES = StructureType(raw = 1000083000)
    comptime MEMORY_DEDICATED_REQUIREMENTS = StructureType(raw = 1000127000)
    comptime MEMORY_DEDICATED_ALLOCATE_INFO = StructureType(raw = 1000127001)
    comptime MEMORY_ALLOCATE_FLAGS_INFO = StructureType(raw = 1000060000)
    comptime DEVICE_GROUP_RENDER_PASS_BEGIN_INFO = StructureType(raw = 1000060003)
    comptime DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO = StructureType(raw = 1000060004)
    comptime DEVICE_GROUP_SUBMIT_INFO = StructureType(raw = 1000060005)
    comptime DEVICE_GROUP_BIND_SPARSE_INFO = StructureType(raw = 1000060006)
    comptime BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO = StructureType(raw = 1000060013)
    comptime BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO = StructureType(raw = 1000060014)
    comptime PHYSICAL_DEVICE_GROUP_PROPERTIES = StructureType(raw = 1000070000)
    comptime DEVICE_GROUP_DEVICE_CREATE_INFO = StructureType(raw = 1000070001)
    comptime BUFFER_MEMORY_REQUIREMENTS_INFO_2 = StructureType(raw = 1000146000)
    comptime IMAGE_MEMORY_REQUIREMENTS_INFO_2 = StructureType(raw = 1000146001)
    comptime IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2 = StructureType(raw = 1000146002)
    comptime MEMORY_REQUIREMENTS_2 = StructureType(raw = 1000146003)
    comptime SPARSE_IMAGE_MEMORY_REQUIREMENTS_2 = StructureType(raw = 1000146004)
    comptime PHYSICAL_DEVICE_FEATURES_2 = StructureType(raw = 1000059000)
    comptime PHYSICAL_DEVICE_PROPERTIES_2 = StructureType(raw = 1000059001)
    comptime FORMAT_PROPERTIES_2 = StructureType(raw = 1000059002)
    comptime IMAGE_FORMAT_PROPERTIES_2 = StructureType(raw = 1000059003)
    comptime PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2 = StructureType(raw = 1000059004)
    comptime QUEUE_FAMILY_PROPERTIES_2 = StructureType(raw = 1000059005)
    comptime PHYSICAL_DEVICE_MEMORY_PROPERTIES_2 = StructureType(raw = 1000059006)
    comptime SPARSE_IMAGE_FORMAT_PROPERTIES_2 = StructureType(raw = 1000059007)
    comptime PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2 = StructureType(raw = 1000059008)
    comptime PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES = StructureType(raw = 1000117000)
    comptime RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO = StructureType(raw = 1000117001)
    comptime IMAGE_VIEW_USAGE_CREATE_INFO = StructureType(raw = 1000117002)
    comptime PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO = StructureType(raw = 1000117003)
    comptime RENDER_PASS_MULTIVIEW_CREATE_INFO = StructureType(raw = 1000053000)
    comptime PHYSICAL_DEVICE_MULTIVIEW_FEATURES = StructureType(raw = 1000053001)
    comptime PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES = StructureType(raw = 1000053002)
    comptime PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES = StructureType(raw = 1000120000)
    comptime PROTECTED_SUBMIT_INFO = StructureType(raw = 1000145000)
    comptime PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES = StructureType(raw = 1000145001)
    comptime PHYSICAL_DEVICE_PROTECTED_MEMORY_PROPERTIES = StructureType(raw = 1000145002)
    comptime DEVICE_QUEUE_INFO_2 = StructureType(raw = 1000145003)
    comptime SAMPLER_YCBCR_CONVERSION_CREATE_INFO = StructureType(raw = 1000156000)
    comptime SAMPLER_YCBCR_CONVERSION_INFO = StructureType(raw = 1000156001)
    comptime BIND_IMAGE_PLANE_MEMORY_INFO = StructureType(raw = 1000156002)
    comptime IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO = StructureType(raw = 1000156003)
    comptime PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES = StructureType(raw = 1000156004)
    comptime SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES = StructureType(raw = 1000156005)
    comptime DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO = StructureType(raw = 1000085000)
    comptime PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO = StructureType(raw = 1000071000)
    comptime EXTERNAL_IMAGE_FORMAT_PROPERTIES = StructureType(raw = 1000071001)
    comptime PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO = StructureType(raw = 1000071002)
    comptime EXTERNAL_BUFFER_PROPERTIES = StructureType(raw = 1000071003)
    comptime PHYSICAL_DEVICE_ID_PROPERTIES = StructureType(raw = 1000071004)
    comptime EXTERNAL_MEMORY_BUFFER_CREATE_INFO = StructureType(raw = 1000072000)
    comptime EXTERNAL_MEMORY_IMAGE_CREATE_INFO = StructureType(raw = 1000072001)
    comptime EXPORT_MEMORY_ALLOCATE_INFO = StructureType(raw = 1000072002)
    comptime PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO = StructureType(raw = 1000112000)
    comptime EXTERNAL_FENCE_PROPERTIES = StructureType(raw = 1000112001)
    comptime EXPORT_FENCE_CREATE_INFO = StructureType(raw = 1000113000)
    comptime EXPORT_SEMAPHORE_CREATE_INFO = StructureType(raw = 1000077000)
    comptime PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO = StructureType(raw = 1000076000)
    comptime EXTERNAL_SEMAPHORE_PROPERTIES = StructureType(raw = 1000076001)
    comptime PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES = StructureType(raw = 1000168000)
    comptime DESCRIPTOR_SET_LAYOUT_SUPPORT = StructureType(raw = 1000168001)
    comptime PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES = StructureType(raw = 1000063000)
    comptime PHYSICAL_DEVICE_VULKAN_1_1_FEATURES = StructureType(raw = 49)
    comptime PHYSICAL_DEVICE_VULKAN_1_1_PROPERTIES = StructureType(raw = 50)
    comptime PHYSICAL_DEVICE_VULKAN_1_2_FEATURES = StructureType(raw = 51)
    comptime PHYSICAL_DEVICE_VULKAN_1_2_PROPERTIES = StructureType(raw = 52)
    comptime IMAGE_FORMAT_LIST_CREATE_INFO = StructureType(raw = 1000147000)
    comptime ATTACHMENT_DESCRIPTION_2 = StructureType(raw = 1000109000)
    comptime ATTACHMENT_REFERENCE_2 = StructureType(raw = 1000109001)
    comptime SUBPASS_DESCRIPTION_2 = StructureType(raw = 1000109002)
    comptime SUBPASS_DEPENDENCY_2 = StructureType(raw = 1000109003)
    comptime RENDER_PASS_CREATE_INFO_2 = StructureType(raw = 1000109004)
    comptime SUBPASS_BEGIN_INFO = StructureType(raw = 1000109005)
    comptime SUBPASS_END_INFO = StructureType(raw = 1000109006)
    comptime PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES = StructureType(raw = 1000177000)
    comptime PHYSICAL_DEVICE_DRIVER_PROPERTIES = StructureType(raw = 1000196000)
    comptime PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES = StructureType(raw = 1000180000)
    comptime PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES = StructureType(raw = 1000082000)
    comptime PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES = StructureType(raw = 1000197000)
    comptime DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO = StructureType(raw = 1000161000)
    comptime PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES = StructureType(raw = 1000161001)
    comptime PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES = StructureType(raw = 1000161002)
    comptime DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO = StructureType(raw = 1000161003)
    comptime DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT = StructureType(raw = 1000161004)
    comptime PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES = StructureType(raw = 1000199000)
    comptime SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE = StructureType(raw = 1000199001)
    comptime PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES = StructureType(raw = 1000221000)
    comptime IMAGE_STENCIL_USAGE_CREATE_INFO = StructureType(raw = 1000246000)
    comptime PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES = StructureType(raw = 1000130000)
    comptime SAMPLER_REDUCTION_MODE_CREATE_INFO = StructureType(raw = 1000130001)
    comptime PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES = StructureType(raw = 1000211000)
    comptime PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES = StructureType(raw = 1000108000)
    comptime FRAMEBUFFER_ATTACHMENTS_CREATE_INFO = StructureType(raw = 1000108001)
    comptime FRAMEBUFFER_ATTACHMENT_IMAGE_INFO = StructureType(raw = 1000108002)
    comptime RENDER_PASS_ATTACHMENT_BEGIN_INFO = StructureType(raw = 1000108003)
    comptime PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES = StructureType(raw = 1000253000)
    comptime PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES = StructureType(raw = 1000175000)
    comptime PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES = StructureType(raw = 1000241000)
    comptime ATTACHMENT_REFERENCE_STENCIL_LAYOUT = StructureType(raw = 1000241001)
    comptime ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT = StructureType(raw = 1000241002)
    comptime PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES = StructureType(raw = 1000261000)
    comptime PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES = StructureType(raw = 1000207000)
    comptime PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES = StructureType(raw = 1000207001)
    comptime SEMAPHORE_TYPE_CREATE_INFO = StructureType(raw = 1000207002)
    comptime TIMELINE_SEMAPHORE_SUBMIT_INFO = StructureType(raw = 1000207003)
    comptime SEMAPHORE_WAIT_INFO = StructureType(raw = 1000207004)
    comptime SEMAPHORE_SIGNAL_INFO = StructureType(raw = 1000207005)
    comptime PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES = StructureType(raw = 1000257000)
    comptime BUFFER_DEVICE_ADDRESS_INFO = StructureType(raw = 1000244001)
    comptime BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO = StructureType(raw = 1000257002)
    comptime MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO = StructureType(raw = 1000257003)
    comptime DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO = StructureType(raw = 1000257004)
    comptime PHYSICAL_DEVICE_VULKAN_1_3_FEATURES = StructureType(raw = 53)
    comptime PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES = StructureType(raw = 54)
    comptime PIPELINE_CREATION_FEEDBACK_CREATE_INFO = StructureType(raw = 1000192000)
    comptime PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES = StructureType(raw = 1000215000)
    comptime PHYSICAL_DEVICE_TOOL_PROPERTIES = StructureType(raw = 1000245000)
    comptime PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES = StructureType(raw = 1000276000)
    comptime PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES = StructureType(raw = 1000295000)
    comptime DEVICE_PRIVATE_DATA_CREATE_INFO = StructureType(raw = 1000295001)
    comptime PRIVATE_DATA_SLOT_CREATE_INFO = StructureType(raw = 1000295002)
    comptime PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES = StructureType(raw = 1000297000)
    comptime MEMORY_BARRIER_2 = StructureType(raw = 1000314000)
    comptime BUFFER_MEMORY_BARRIER_2 = StructureType(raw = 1000314001)
    comptime IMAGE_MEMORY_BARRIER_2 = StructureType(raw = 1000314002)
    comptime DEPENDENCY_INFO = StructureType(raw = 1000314003)
    comptime SUBMIT_INFO_2 = StructureType(raw = 1000314004)
    comptime SEMAPHORE_SUBMIT_INFO = StructureType(raw = 1000314005)
    comptime COMMAND_BUFFER_SUBMIT_INFO = StructureType(raw = 1000314006)
    comptime PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES = StructureType(raw = 1000314007)
    comptime PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES = StructureType(raw = 1000325000)
    comptime PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES = StructureType(raw = 1000335000)
    comptime COPY_BUFFER_INFO_2 = StructureType(raw = 1000337000)
    comptime COPY_IMAGE_INFO_2 = StructureType(raw = 1000337001)
    comptime COPY_BUFFER_TO_IMAGE_INFO_2 = StructureType(raw = 1000337002)
    comptime COPY_IMAGE_TO_BUFFER_INFO_2 = StructureType(raw = 1000337003)
    comptime BLIT_IMAGE_INFO_2 = StructureType(raw = 1000337004)
    comptime RESOLVE_IMAGE_INFO_2 = StructureType(raw = 1000337005)
    comptime BUFFER_COPY_2 = StructureType(raw = 1000337006)
    comptime IMAGE_COPY_2 = StructureType(raw = 1000337007)
    comptime IMAGE_BLIT_2 = StructureType(raw = 1000337008)
    comptime BUFFER_IMAGE_COPY_2 = StructureType(raw = 1000337009)
    comptime IMAGE_RESOLVE_2 = StructureType(raw = 1000337010)
    comptime PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES = StructureType(raw = 1000225000)
    comptime PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO = StructureType(raw = 1000225001)
    comptime PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES = StructureType(raw = 1000225002)
    comptime PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES = StructureType(raw = 1000138000)
    comptime PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES = StructureType(raw = 1000138001)
    comptime WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK = StructureType(raw = 1000138002)
    comptime DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO = StructureType(raw = 1000138003)
    comptime PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES = StructureType(raw = 1000066000)
    comptime RENDERING_INFO = StructureType(raw = 1000044000)
    comptime RENDERING_ATTACHMENT_INFO = StructureType(raw = 1000044001)
    comptime PIPELINE_RENDERING_CREATE_INFO = StructureType(raw = 1000044002)
    comptime PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES = StructureType(raw = 1000044003)
    comptime COMMAND_BUFFER_INHERITANCE_RENDERING_INFO = StructureType(raw = 1000044004)
    comptime PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES = StructureType(raw = 1000280000)
    comptime PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES = StructureType(raw = 1000280001)
    comptime PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES = StructureType(raw = 1000281001)
    comptime FORMAT_PROPERTIES_3 = StructureType(raw = 1000360000)
    comptime PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES = StructureType(raw = 1000413000)
    comptime PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES = StructureType(raw = 1000413001)
    comptime DEVICE_BUFFER_MEMORY_REQUIREMENTS = StructureType(raw = 1000413002)
    comptime DEVICE_IMAGE_MEMORY_REQUIREMENTS = StructureType(raw = 1000413003)
    comptime PHYSICAL_DEVICE_VULKAN_1_4_FEATURES = StructureType(raw = 55)
    comptime PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES = StructureType(raw = 56)
    comptime DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO = StructureType(raw = 1000174000)
    comptime PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES = StructureType(raw = 1000388000)
    comptime QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES = StructureType(raw = 1000388001)
    comptime PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES = StructureType(raw = 1000416000)
    comptime PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES = StructureType(raw = 1000528000)
    comptime PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES = StructureType(raw = 1000544000)
    comptime PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES = StructureType(raw = 1000259000)
    comptime PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO = StructureType(raw = 1000259001)
    comptime PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES = StructureType(raw = 1000259002)
    comptime PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES = StructureType(raw = 1000525000)
    comptime PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO = StructureType(raw = 1000190001)
    comptime PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES = StructureType(raw = 1000190002)
    comptime PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES = StructureType(raw = 1000265000)
    comptime MEMORY_MAP_INFO = StructureType(raw = 1000271000)
    comptime MEMORY_UNMAP_INFO = StructureType(raw = 1000271001)
    comptime PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES = StructureType(raw = 1000470000)
    comptime PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES = StructureType(raw = 1000470001)
    comptime RENDERING_AREA_INFO = StructureType(raw = 1000470003)
    comptime DEVICE_IMAGE_SUBRESOURCE_INFO = StructureType(raw = 1000470004)
    comptime SUBRESOURCE_LAYOUT_2 = StructureType(raw = 1000338002)
    comptime IMAGE_SUBRESOURCE_2 = StructureType(raw = 1000338003)
    comptime PIPELINE_CREATE_FLAGS_2_CREATE_INFO = StructureType(raw = 1000470005)
    comptime BUFFER_USAGE_FLAGS_2_CREATE_INFO = StructureType(raw = 1000470006)
    comptime PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES = StructureType(raw = 1000080000)
    comptime PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES = StructureType(raw = 1000232000)
    comptime RENDERING_ATTACHMENT_LOCATION_INFO = StructureType(raw = 1000232001)
    comptime RENDERING_INPUT_ATTACHMENT_INDEX_INFO = StructureType(raw = 1000232002)
    comptime PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES = StructureType(raw = 1000545000)
    comptime PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES = StructureType(raw = 1000545001)
    comptime BIND_MEMORY_STATUS = StructureType(raw = 1000545002)
    comptime BIND_DESCRIPTOR_SETS_INFO = StructureType(raw = 1000545003)
    comptime PUSH_CONSTANTS_INFO = StructureType(raw = 1000545004)
    comptime PUSH_DESCRIPTOR_SET_INFO = StructureType(raw = 1000545005)
    comptime PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO = StructureType(raw = 1000545006)
    comptime PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES = StructureType(raw = 1000466000)
    comptime PIPELINE_ROBUSTNESS_CREATE_INFO = StructureType(raw = 1000068000)
    comptime PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES = StructureType(raw = 1000068001)
    comptime PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES = StructureType(raw = 1000068002)
    comptime PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES = StructureType(raw = 1000270000)
    comptime PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES = StructureType(raw = 1000270001)
    comptime MEMORY_TO_IMAGE_COPY = StructureType(raw = 1000270002)
    comptime IMAGE_TO_MEMORY_COPY = StructureType(raw = 1000270003)
    comptime COPY_IMAGE_TO_MEMORY_INFO = StructureType(raw = 1000270004)
    comptime COPY_MEMORY_TO_IMAGE_INFO = StructureType(raw = 1000270005)
    comptime HOST_IMAGE_LAYOUT_TRANSITION_INFO = StructureType(raw = 1000270006)
    comptime COPY_IMAGE_TO_IMAGE_INFO = StructureType(raw = 1000270007)
    comptime SUBRESOURCE_HOST_MEMCPY_SIZE = StructureType(raw = 1000270008)
    comptime HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY = StructureType(raw = 1000270009)
    comptime PHYSICAL_DEVICE_VULKAN_SC_1_0_FEATURES = StructureType(raw = 1000298000)
    comptime PHYSICAL_DEVICE_VULKAN_SC_1_0_PROPERTIES = StructureType(raw = 1000298001)
    comptime DEVICE_OBJECT_RESERVATION_CREATE_INFO = StructureType(raw = 1000298002)
    comptime COMMAND_POOL_MEMORY_RESERVATION_CREATE_INFO = StructureType(raw = 1000298003)
    comptime COMMAND_POOL_MEMORY_CONSUMPTION = StructureType(raw = 1000298004)
    comptime PIPELINE_POOL_SIZE = StructureType(raw = 1000298005)
    comptime FAULT_DATA = StructureType(raw = 1000298007)
    comptime FAULT_CALLBACK_INFO = StructureType(raw = 1000298008)
    comptime PIPELINE_OFFLINE_CREATE_INFO = StructureType(raw = 1000298010)
    comptime SWAPCHAIN_CREATE_INFO_KHR = StructureType(raw = 1000001000)
    comptime PRESENT_INFO_KHR = StructureType(raw = 1000001001)
    comptime DEVICE_GROUP_PRESENT_CAPABILITIES_KHR = StructureType(raw = 1000060007)
    comptime IMAGE_SWAPCHAIN_CREATE_INFO_KHR = StructureType(raw = 1000060008)
    comptime BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR = StructureType(raw = 1000060009)
    comptime ACQUIRE_NEXT_IMAGE_INFO_KHR = StructureType(raw = 1000060010)
    comptime DEVICE_GROUP_PRESENT_INFO_KHR = StructureType(raw = 1000060011)
    comptime DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR = StructureType(raw = 1000060012)
    comptime DISPLAY_MODE_CREATE_INFO_KHR = StructureType(raw = 1000002000)
    comptime DISPLAY_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000002001)
    comptime DISPLAY_PRESENT_INFO_KHR = StructureType(raw = 1000003000)
    comptime XLIB_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000004000)
    comptime XCB_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000005000)
    comptime WAYLAND_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000006000)
    comptime ANDROID_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000008000)
    comptime WIN32_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000009000)
    comptime NATIVE_BUFFER_ANDROID = StructureType(raw = 1000010000)
    comptime SWAPCHAIN_IMAGE_CREATE_INFO_ANDROID = StructureType(raw = 1000010001)
    comptime PHYSICAL_DEVICE_PRESENTATION_PROPERTIES_ANDROID = StructureType(raw = 1000010002)
    comptime DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT = StructureType(raw = 1000011000)
    comptime PIPELINE_RASTERIZATION_STATE_RASTERIZATION_ORDER_AMD = StructureType(raw = 1000018000)
    comptime DEBUG_MARKER_OBJECT_NAME_INFO_EXT = StructureType(raw = 1000022000)
    comptime DEBUG_MARKER_OBJECT_TAG_INFO_EXT = StructureType(raw = 1000022001)
    comptime DEBUG_MARKER_MARKER_INFO_EXT = StructureType(raw = 1000022002)
    comptime VIDEO_PROFILE_INFO_KHR = StructureType(raw = 1000023000)
    comptime VIDEO_CAPABILITIES_KHR = StructureType(raw = 1000023001)
    comptime VIDEO_PICTURE_RESOURCE_INFO_KHR = StructureType(raw = 1000023002)
    comptime VIDEO_SESSION_MEMORY_REQUIREMENTS_KHR = StructureType(raw = 1000023003)
    comptime BIND_VIDEO_SESSION_MEMORY_INFO_KHR = StructureType(raw = 1000023004)
    comptime VIDEO_SESSION_CREATE_INFO_KHR = StructureType(raw = 1000023005)
    comptime VIDEO_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000023006)
    comptime VIDEO_SESSION_PARAMETERS_UPDATE_INFO_KHR = StructureType(raw = 1000023007)
    comptime VIDEO_BEGIN_CODING_INFO_KHR = StructureType(raw = 1000023008)
    comptime VIDEO_END_CODING_INFO_KHR = StructureType(raw = 1000023009)
    comptime VIDEO_CODING_CONTROL_INFO_KHR = StructureType(raw = 1000023010)
    comptime VIDEO_REFERENCE_SLOT_INFO_KHR = StructureType(raw = 1000023011)
    comptime QUEUE_FAMILY_VIDEO_PROPERTIES_KHR = StructureType(raw = 1000023012)
    comptime VIDEO_PROFILE_LIST_INFO_KHR = StructureType(raw = 1000023013)
    comptime PHYSICAL_DEVICE_VIDEO_FORMAT_INFO_KHR = StructureType(raw = 1000023014)
    comptime VIDEO_FORMAT_PROPERTIES_KHR = StructureType(raw = 1000023015)
    comptime QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR = StructureType(raw = 1000023016)
    comptime VIDEO_DECODE_INFO_KHR = StructureType(raw = 1000024000)
    comptime VIDEO_DECODE_CAPABILITIES_KHR = StructureType(raw = 1000024001)
    comptime VIDEO_DECODE_USAGE_INFO_KHR = StructureType(raw = 1000024002)
    comptime DEDICATED_ALLOCATION_IMAGE_CREATE_INFO_NV = StructureType(raw = 1000026000)
    comptime DEDICATED_ALLOCATION_BUFFER_CREATE_INFO_NV = StructureType(raw = 1000026001)
    comptime DEDICATED_ALLOCATION_MEMORY_ALLOCATE_INFO_NV = StructureType(raw = 1000026002)
    comptime PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT = StructureType(raw = 1000028000)
    comptime PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_PROPERTIES_EXT = StructureType(raw = 1000028001)
    comptime PIPELINE_RASTERIZATION_STATE_STREAM_CREATE_INFO_EXT = StructureType(raw = 1000028002)
    comptime CU_MODULE_CREATE_INFO_NVX = StructureType(raw = 1000029000)
    comptime CU_FUNCTION_CREATE_INFO_NVX = StructureType(raw = 1000029001)
    comptime CU_LAUNCH_INFO_NVX = StructureType(raw = 1000029002)
    comptime CU_MODULE_TEXTURING_MODE_CREATE_INFO_NVX = StructureType(raw = 1000029004)
    comptime IMAGE_VIEW_HANDLE_INFO_NVX = StructureType(raw = 1000030000)
    comptime IMAGE_VIEW_ADDRESS_PROPERTIES_NVX = StructureType(raw = 1000030001)
    comptime VIDEO_ENCODE_H264_CAPABILITIES_KHR = StructureType(raw = 1000038000)
    comptime VIDEO_ENCODE_H264_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000038001)
    comptime VIDEO_ENCODE_H264_SESSION_PARAMETERS_ADD_INFO_KHR = StructureType(raw = 1000038002)
    comptime VIDEO_ENCODE_H264_PICTURE_INFO_KHR = StructureType(raw = 1000038003)
    comptime VIDEO_ENCODE_H264_DPB_SLOT_INFO_KHR = StructureType(raw = 1000038004)
    comptime VIDEO_ENCODE_H264_NALU_SLICE_INFO_KHR = StructureType(raw = 1000038005)
    comptime VIDEO_ENCODE_H264_GOP_REMAINING_FRAME_INFO_KHR = StructureType(raw = 1000038006)
    comptime VIDEO_ENCODE_H264_PROFILE_INFO_KHR = StructureType(raw = 1000038007)
    comptime VIDEO_ENCODE_H264_RATE_CONTROL_INFO_KHR = StructureType(raw = 1000038008)
    comptime VIDEO_ENCODE_H264_RATE_CONTROL_LAYER_INFO_KHR = StructureType(raw = 1000038009)
    comptime VIDEO_ENCODE_H264_SESSION_CREATE_INFO_KHR = StructureType(raw = 1000038010)
    comptime VIDEO_ENCODE_H264_QUALITY_LEVEL_PROPERTIES_KHR = StructureType(raw = 1000038011)
    comptime VIDEO_ENCODE_H264_SESSION_PARAMETERS_GET_INFO_KHR = StructureType(raw = 1000038012)
    comptime VIDEO_ENCODE_H264_SESSION_PARAMETERS_FEEDBACK_INFO_KHR = StructureType(raw = 1000038013)
    comptime VIDEO_ENCODE_H265_CAPABILITIES_KHR = StructureType(raw = 1000039000)
    comptime VIDEO_ENCODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000039001)
    comptime VIDEO_ENCODE_H265_SESSION_PARAMETERS_ADD_INFO_KHR = StructureType(raw = 1000039002)
    comptime VIDEO_ENCODE_H265_PICTURE_INFO_KHR = StructureType(raw = 1000039003)
    comptime VIDEO_ENCODE_H265_DPB_SLOT_INFO_KHR = StructureType(raw = 1000039004)
    comptime VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_INFO_KHR = StructureType(raw = 1000039005)
    comptime VIDEO_ENCODE_H265_GOP_REMAINING_FRAME_INFO_KHR = StructureType(raw = 1000039006)
    comptime VIDEO_ENCODE_H265_PROFILE_INFO_KHR = StructureType(raw = 1000039007)
    comptime VIDEO_ENCODE_H265_RATE_CONTROL_INFO_KHR = StructureType(raw = 1000039009)
    comptime VIDEO_ENCODE_H265_RATE_CONTROL_LAYER_INFO_KHR = StructureType(raw = 1000039010)
    comptime VIDEO_ENCODE_H265_SESSION_CREATE_INFO_KHR = StructureType(raw = 1000039011)
    comptime VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR = StructureType(raw = 1000039012)
    comptime VIDEO_ENCODE_H265_SESSION_PARAMETERS_GET_INFO_KHR = StructureType(raw = 1000039013)
    comptime VIDEO_ENCODE_H265_SESSION_PARAMETERS_FEEDBACK_INFO_KHR = StructureType(raw = 1000039014)
    comptime VIDEO_DECODE_H264_CAPABILITIES_KHR = StructureType(raw = 1000040000)
    comptime VIDEO_DECODE_H264_PICTURE_INFO_KHR = StructureType(raw = 1000040001)
    comptime VIDEO_DECODE_H264_PROFILE_INFO_KHR = StructureType(raw = 1000040003)
    comptime VIDEO_DECODE_H264_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000040004)
    comptime VIDEO_DECODE_H264_SESSION_PARAMETERS_ADD_INFO_KHR = StructureType(raw = 1000040005)
    comptime VIDEO_DECODE_H264_DPB_SLOT_INFO_KHR = StructureType(raw = 1000040006)
    comptime TEXTURE_LOD_GATHER_FORMAT_PROPERTIES_AMD = StructureType(raw = 1000041000)
    comptime STREAM_DESCRIPTOR_SURFACE_CREATE_INFO_GGP = StructureType(raw = 1000049000)
    comptime PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV = StructureType(raw = 1000050000)
    comptime PRIVATE_VENDOR_INFO_PLACEHOLDER_OFFSET_0_NV = StructureType(raw = 1000051000)
    comptime EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV = StructureType(raw = 1000056000)
    comptime EXPORT_MEMORY_ALLOCATE_INFO_NV = StructureType(raw = 1000056001)
    comptime IMPORT_MEMORY_WIN32_HANDLE_INFO_NV = StructureType(raw = 1000057000)
    comptime EXPORT_MEMORY_WIN32_HANDLE_INFO_NV = StructureType(raw = 1000057001)
    comptime WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_NV = StructureType(raw = 1000058000)
    comptime VALIDATION_FLAGS_EXT = StructureType(raw = 1000061000)
    comptime VI_SURFACE_CREATE_INFO_NN = StructureType(raw = 1000062000)
    comptime IMAGE_VIEW_ASTC_DECODE_MODE_EXT = StructureType(raw = 1000067000)
    comptime PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT = StructureType(raw = 1000067001)
    comptime IMPORT_MEMORY_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000073000)
    comptime EXPORT_MEMORY_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000073001)
    comptime MEMORY_WIN32_HANDLE_PROPERTIES_KHR = StructureType(raw = 1000073002)
    comptime MEMORY_GET_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000073003)
    comptime IMPORT_MEMORY_FD_INFO_KHR = StructureType(raw = 1000074000)
    comptime MEMORY_FD_PROPERTIES_KHR = StructureType(raw = 1000074001)
    comptime MEMORY_GET_FD_INFO_KHR = StructureType(raw = 1000074002)
    comptime WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR = StructureType(raw = 1000075000)
    comptime IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000078000)
    comptime EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000078001)
    comptime D3D12_FENCE_SUBMIT_INFO_KHR = StructureType(raw = 1000078002)
    comptime SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000078003)
    comptime IMPORT_SEMAPHORE_FD_INFO_KHR = StructureType(raw = 1000079000)
    comptime SEMAPHORE_GET_FD_INFO_KHR = StructureType(raw = 1000079001)
    comptime COMMAND_BUFFER_INHERITANCE_CONDITIONAL_RENDERING_INFO_EXT = StructureType(raw = 1000081000)
    comptime PHYSICAL_DEVICE_CONDITIONAL_RENDERING_FEATURES_EXT = StructureType(raw = 1000081001)
    comptime CONDITIONAL_RENDERING_BEGIN_INFO_EXT = StructureType(raw = 1000081002)
    comptime PRESENT_REGIONS_KHR = StructureType(raw = 1000084000)
    comptime PIPELINE_VIEWPORT_W_SCALING_STATE_CREATE_INFO_NV = StructureType(raw = 1000087000)
    comptime SURFACE_CAPABILITIES_2_EXT = StructureType(raw = 1000090000)
    comptime DISPLAY_POWER_INFO_EXT = StructureType(raw = 1000091000)
    comptime DEVICE_EVENT_INFO_EXT = StructureType(raw = 1000091001)
    comptime DISPLAY_EVENT_INFO_EXT = StructureType(raw = 1000091002)
    comptime SWAPCHAIN_COUNTER_CREATE_INFO_EXT = StructureType(raw = 1000091003)
    comptime PRESENT_TIMES_INFO_GOOGLE = StructureType(raw = 1000092000)
    comptime PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_ATTRIBUTES_PROPERTIES_NVX = StructureType(raw = 1000097000)
    comptime MULTIVIEW_PER_VIEW_ATTRIBUTES_INFO_NVX = StructureType(raw = 1000044009)
    comptime PIPELINE_VIEWPORT_SWIZZLE_STATE_CREATE_INFO_NV = StructureType(raw = 1000098000)
    comptime PHYSICAL_DEVICE_DISCARD_RECTANGLE_PROPERTIES_EXT = StructureType(raw = 1000099000)
    comptime PIPELINE_DISCARD_RECTANGLE_STATE_CREATE_INFO_EXT = StructureType(raw = 1000099001)
    comptime PHYSICAL_DEVICE_CONSERVATIVE_RASTERIZATION_PROPERTIES_EXT = StructureType(raw = 1000101000)
    comptime PIPELINE_RASTERIZATION_CONSERVATIVE_STATE_CREATE_INFO_EXT = StructureType(raw = 1000101001)
    comptime PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT = StructureType(raw = 1000102000)
    comptime PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT = StructureType(raw = 1000102001)
    comptime HDR_METADATA_EXT = StructureType(raw = 1000105000)
    comptime PHYSICAL_DEVICE_RELAXED_LINE_RASTERIZATION_FEATURES_IMG = StructureType(raw = 1000110000)
    comptime SHARED_PRESENT_SURFACE_CAPABILITIES_KHR = StructureType(raw = 1000111000)
    comptime IMPORT_FENCE_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000114000)
    comptime EXPORT_FENCE_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000114001)
    comptime FENCE_GET_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000114002)
    comptime IMPORT_FENCE_FD_INFO_KHR = StructureType(raw = 1000115000)
    comptime FENCE_GET_FD_INFO_KHR = StructureType(raw = 1000115001)
    comptime PHYSICAL_DEVICE_PERFORMANCE_QUERY_FEATURES_KHR = StructureType(raw = 1000116000)
    comptime PHYSICAL_DEVICE_PERFORMANCE_QUERY_PROPERTIES_KHR = StructureType(raw = 1000116001)
    comptime QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR = StructureType(raw = 1000116002)
    comptime PERFORMANCE_QUERY_SUBMIT_INFO_KHR = StructureType(raw = 1000116003)
    comptime ACQUIRE_PROFILING_LOCK_INFO_KHR = StructureType(raw = 1000116004)
    comptime PERFORMANCE_COUNTER_KHR = StructureType(raw = 1000116005)
    comptime PERFORMANCE_COUNTER_DESCRIPTION_KHR = StructureType(raw = 1000116006)
    comptime PERFORMANCE_QUERY_RESERVATION_INFO_KHR = StructureType(raw = 1000116007)
    comptime PHYSICAL_DEVICE_SURFACE_INFO_2_KHR = StructureType(raw = 1000119000)
    comptime SURFACE_CAPABILITIES_2_KHR = StructureType(raw = 1000119001)
    comptime SURFACE_FORMAT_2_KHR = StructureType(raw = 1000119002)
    comptime DISPLAY_PROPERTIES_2_KHR = StructureType(raw = 1000121000)
    comptime DISPLAY_PLANE_PROPERTIES_2_KHR = StructureType(raw = 1000121001)
    comptime DISPLAY_MODE_PROPERTIES_2_KHR = StructureType(raw = 1000121002)
    comptime DISPLAY_PLANE_INFO_2_KHR = StructureType(raw = 1000121003)
    comptime DISPLAY_PLANE_CAPABILITIES_2_KHR = StructureType(raw = 1000121004)
    comptime IOS_SURFACE_CREATE_INFO_MVK = StructureType(raw = 1000122000)
    comptime MACOS_SURFACE_CREATE_INFO_MVK = StructureType(raw = 1000123000)
    comptime DEBUG_UTILS_OBJECT_NAME_INFO_EXT = StructureType(raw = 1000128000)
    comptime DEBUG_UTILS_OBJECT_TAG_INFO_EXT = StructureType(raw = 1000128001)
    comptime DEBUG_UTILS_LABEL_EXT = StructureType(raw = 1000128002)
    comptime DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT = StructureType(raw = 1000128003)
    comptime DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT = StructureType(raw = 1000128004)
    comptime ANDROID_HARDWARE_BUFFER_USAGE_ANDROID = StructureType(raw = 1000129000)
    comptime ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID = StructureType(raw = 1000129001)
    comptime ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_ANDROID = StructureType(raw = 1000129002)
    comptime IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID = StructureType(raw = 1000129003)
    comptime MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID = StructureType(raw = 1000129004)
    comptime EXTERNAL_FORMAT_ANDROID = StructureType(raw = 1000129005)
    comptime ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_2_ANDROID = StructureType(raw = 1000129006)
    comptime PHYSICAL_DEVICE_SHADER_ENQUEUE_FEATURES_AMDX = StructureType(raw = 1000134000)
    comptime PHYSICAL_DEVICE_SHADER_ENQUEUE_PROPERTIES_AMDX = StructureType(raw = 1000134001)
    comptime EXECUTION_GRAPH_PIPELINE_SCRATCH_SIZE_AMDX = StructureType(raw = 1000134002)
    comptime EXECUTION_GRAPH_PIPELINE_CREATE_INFO_AMDX = StructureType(raw = 1000134003)
    comptime PIPELINE_SHADER_STAGE_NODE_CREATE_INFO_AMDX = StructureType(raw = 1000134004)
    comptime ATTACHMENT_SAMPLE_COUNT_INFO_AMD = StructureType(raw = 1000044008)
    comptime PHYSICAL_DEVICE_SHADER_BFLOAT16_FEATURES_KHR = StructureType(raw = 1000141000)
    comptime SAMPLE_LOCATIONS_INFO_EXT = StructureType(raw = 1000143000)
    comptime RENDER_PASS_SAMPLE_LOCATIONS_BEGIN_INFO_EXT = StructureType(raw = 1000143001)
    comptime PIPELINE_SAMPLE_LOCATIONS_STATE_CREATE_INFO_EXT = StructureType(raw = 1000143002)
    comptime PHYSICAL_DEVICE_SAMPLE_LOCATIONS_PROPERTIES_EXT = StructureType(raw = 1000143003)
    comptime MULTISAMPLE_PROPERTIES_EXT = StructureType(raw = 1000143004)
    comptime PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_FEATURES_EXT = StructureType(raw = 1000148000)
    comptime PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_PROPERTIES_EXT = StructureType(raw = 1000148001)
    comptime PIPELINE_COLOR_BLEND_ADVANCED_STATE_CREATE_INFO_EXT = StructureType(raw = 1000148002)
    comptime PIPELINE_COVERAGE_TO_COLOR_STATE_CREATE_INFO_NV = StructureType(raw = 1000149000)
    comptime WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR = StructureType(raw = 1000150007)
    comptime ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR = StructureType(raw = 1000150000)
    comptime ACCELERATION_STRUCTURE_DEVICE_ADDRESS_INFO_KHR = StructureType(raw = 1000150002)
    comptime ACCELERATION_STRUCTURE_GEOMETRY_AABBS_DATA_KHR = StructureType(raw = 1000150003)
    comptime ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR = StructureType(raw = 1000150004)
    comptime ACCELERATION_STRUCTURE_GEOMETRY_TRIANGLES_DATA_KHR = StructureType(raw = 1000150005)
    comptime ACCELERATION_STRUCTURE_GEOMETRY_KHR = StructureType(raw = 1000150006)
    comptime ACCELERATION_STRUCTURE_VERSION_INFO_KHR = StructureType(raw = 1000150009)
    comptime COPY_ACCELERATION_STRUCTURE_INFO_KHR = StructureType(raw = 1000150010)
    comptime COPY_ACCELERATION_STRUCTURE_TO_MEMORY_INFO_KHR = StructureType(raw = 1000150011)
    comptime COPY_MEMORY_TO_ACCELERATION_STRUCTURE_INFO_KHR = StructureType(raw = 1000150012)
    comptime PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR = StructureType(raw = 1000150013)
    comptime PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR = StructureType(raw = 1000150014)
    comptime ACCELERATION_STRUCTURE_CREATE_INFO_KHR = StructureType(raw = 1000150017)
    comptime ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR = StructureType(raw = 1000150020)
    comptime PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR = StructureType(raw = 1000347000)
    comptime PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR = StructureType(raw = 1000347001)
    comptime RAY_TRACING_PIPELINE_CREATE_INFO_KHR = StructureType(raw = 1000150015)
    comptime RAY_TRACING_SHADER_GROUP_CREATE_INFO_KHR = StructureType(raw = 1000150016)
    comptime RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR = StructureType(raw = 1000150018)
    comptime PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR = StructureType(raw = 1000348013)
    comptime PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV = StructureType(raw = 1000152000)
    comptime PHYSICAL_DEVICE_SHADER_SM_BUILTINS_FEATURES_NV = StructureType(raw = 1000154000)
    comptime PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV = StructureType(raw = 1000154001)
    comptime DRM_FORMAT_MODIFIER_PROPERTIES_LIST_EXT = StructureType(raw = 1000158000)
    comptime PHYSICAL_DEVICE_IMAGE_DRM_FORMAT_MODIFIER_INFO_EXT = StructureType(raw = 1000158002)
    comptime IMAGE_DRM_FORMAT_MODIFIER_LIST_CREATE_INFO_EXT = StructureType(raw = 1000158003)
    comptime IMAGE_DRM_FORMAT_MODIFIER_EXPLICIT_CREATE_INFO_EXT = StructureType(raw = 1000158004)
    comptime IMAGE_DRM_FORMAT_MODIFIER_PROPERTIES_EXT = StructureType(raw = 1000158005)
    comptime DRM_FORMAT_MODIFIER_PROPERTIES_LIST_2_EXT = StructureType(raw = 1000158006)
    comptime VALIDATION_CACHE_CREATE_INFO_EXT = StructureType(raw = 1000160000)
    comptime SHADER_MODULE_VALIDATION_CACHE_CREATE_INFO_EXT = StructureType(raw = 1000160001)
    comptime PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR = StructureType(raw = 1000163000)
    comptime PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR = StructureType(raw = 1000163001)
    comptime PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV = StructureType(raw = 1000164000)
    comptime PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV = StructureType(raw = 1000164001)
    comptime PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV = StructureType(raw = 1000164002)
    comptime PIPELINE_VIEWPORT_COARSE_SAMPLE_ORDER_STATE_CREATE_INFO_NV = StructureType(raw = 1000164005)
    comptime RAY_TRACING_PIPELINE_CREATE_INFO_NV = StructureType(raw = 1000165000)
    comptime ACCELERATION_STRUCTURE_CREATE_INFO_NV = StructureType(raw = 1000165001)
    comptime GEOMETRY_NV = StructureType(raw = 1000165003)
    comptime GEOMETRY_TRIANGLES_NV = StructureType(raw = 1000165004)
    comptime GEOMETRY_AABB_NV = StructureType(raw = 1000165005)
    comptime BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV = StructureType(raw = 1000165006)
    comptime WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV = StructureType(raw = 1000165007)
    comptime ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_INFO_NV = StructureType(raw = 1000165008)
    comptime PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV = StructureType(raw = 1000165009)
    comptime RAY_TRACING_SHADER_GROUP_CREATE_INFO_NV = StructureType(raw = 1000165011)
    comptime ACCELERATION_STRUCTURE_INFO_NV = StructureType(raw = 1000165012)
    comptime PHYSICAL_DEVICE_REPRESENTATIVE_FRAGMENT_TEST_FEATURES_NV = StructureType(raw = 1000166000)
    comptime PIPELINE_REPRESENTATIVE_FRAGMENT_TEST_STATE_CREATE_INFO_NV = StructureType(raw = 1000166001)
    comptime PHYSICAL_DEVICE_IMAGE_VIEW_IMAGE_FORMAT_INFO_EXT = StructureType(raw = 1000170000)
    comptime FILTER_CUBIC_IMAGE_VIEW_IMAGE_FORMAT_PROPERTIES_EXT = StructureType(raw = 1000170001)
    comptime IMPORT_MEMORY_HOST_POINTER_INFO_EXT = StructureType(raw = 1000178000)
    comptime MEMORY_HOST_POINTER_PROPERTIES_EXT = StructureType(raw = 1000178001)
    comptime PHYSICAL_DEVICE_EXTERNAL_MEMORY_HOST_PROPERTIES_EXT = StructureType(raw = 1000178002)
    comptime PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR = StructureType(raw = 1000181000)
    comptime PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD = StructureType(raw = 1000183000)
    comptime PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD = StructureType(raw = 1000185000)
    comptime VIDEO_DECODE_H265_CAPABILITIES_KHR = StructureType(raw = 1000187000)
    comptime VIDEO_DECODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000187001)
    comptime VIDEO_DECODE_H265_SESSION_PARAMETERS_ADD_INFO_KHR = StructureType(raw = 1000187002)
    comptime VIDEO_DECODE_H265_PROFILE_INFO_KHR = StructureType(raw = 1000187003)
    comptime VIDEO_DECODE_H265_PICTURE_INFO_KHR = StructureType(raw = 1000187004)
    comptime VIDEO_DECODE_H265_DPB_SLOT_INFO_KHR = StructureType(raw = 1000187005)
    comptime DEVICE_MEMORY_OVERALLOCATION_CREATE_INFO_AMD = StructureType(raw = 1000189000)
    comptime PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT = StructureType(raw = 1000190000)
    comptime PRESENT_FRAME_TOKEN_GGP = StructureType(raw = 1000191000)
    comptime PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV = StructureType(raw = 1000202000)
    comptime PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV = StructureType(raw = 1000202001)
    comptime PHYSICAL_DEVICE_SHADER_IMAGE_FOOTPRINT_FEATURES_NV = StructureType(raw = 1000204000)
    comptime PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV = StructureType(raw = 1000205000)
    comptime PHYSICAL_DEVICE_EXCLUSIVE_SCISSOR_FEATURES_NV = StructureType(raw = 1000205002)
    comptime CHECKPOINT_DATA_NV = StructureType(raw = 1000206000)
    comptime QUEUE_FAMILY_CHECKPOINT_PROPERTIES_NV = StructureType(raw = 1000206001)
    comptime QUEUE_FAMILY_CHECKPOINT_PROPERTIES_2_NV = StructureType(raw = 1000314008)
    comptime CHECKPOINT_DATA_2_NV = StructureType(raw = 1000314009)
    comptime PHYSICAL_DEVICE_SHADER_INTEGER_FUNCTIONS_2_FEATURES_INTEL = StructureType(raw = 1000209000)
    comptime QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL = StructureType(raw = 1000210000)
    comptime INITIALIZE_PERFORMANCE_API_INFO_INTEL = StructureType(raw = 1000210001)
    comptime PERFORMANCE_MARKER_INFO_INTEL = StructureType(raw = 1000210002)
    comptime PERFORMANCE_STREAM_MARKER_INFO_INTEL = StructureType(raw = 1000210003)
    comptime PERFORMANCE_OVERRIDE_INFO_INTEL = StructureType(raw = 1000210004)
    comptime PERFORMANCE_CONFIGURATION_ACQUIRE_INFO_INTEL = StructureType(raw = 1000210005)
    comptime PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT = StructureType(raw = 1000212000)
    comptime DISPLAY_NATIVE_HDR_SURFACE_CAPABILITIES_AMD = StructureType(raw = 1000213000)
    comptime SWAPCHAIN_DISPLAY_NATIVE_HDR_CREATE_INFO_AMD = StructureType(raw = 1000213001)
    comptime IMAGEPIPE_SURFACE_CREATE_INFO_FUCHSIA = StructureType(raw = 1000214000)
    comptime METAL_SURFACE_CREATE_INFO_EXT = StructureType(raw = 1000217000)
    comptime PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT = StructureType(raw = 1000218000)
    comptime PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT = StructureType(raw = 1000218001)
    comptime RENDER_PASS_FRAGMENT_DENSITY_MAP_CREATE_INFO_EXT = StructureType(raw = 1000218002)
    comptime RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_INFO_EXT = StructureType(raw = 1000044007)
    comptime FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR = StructureType(raw = 1000226000)
    comptime PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR = StructureType(raw = 1000226001)
    comptime PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR = StructureType(raw = 1000226002)
    comptime PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR = StructureType(raw = 1000226003)
    comptime PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR = StructureType(raw = 1000226004)
    comptime RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR = StructureType(raw = 1000044006)
    comptime PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_2_AMD = StructureType(raw = 1000227000)
    comptime PHYSICAL_DEVICE_COHERENT_MEMORY_FEATURES_AMD = StructureType(raw = 1000229000)
    comptime PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT = StructureType(raw = 1000234000)
    comptime PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR = StructureType(raw = 1000235000)
    comptime PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT = StructureType(raw = 1000237000)
    comptime PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT = StructureType(raw = 1000238000)
    comptime MEMORY_PRIORITY_ALLOCATE_INFO_EXT = StructureType(raw = 1000238001)
    comptime SURFACE_PROTECTED_CAPABILITIES_KHR = StructureType(raw = 1000239000)
    comptime PHYSICAL_DEVICE_DEDICATED_ALLOCATION_IMAGE_ALIASING_FEATURES_NV = StructureType(raw = 1000240000)
    comptime PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT = StructureType(raw = 1000244000)
    comptime BUFFER_DEVICE_ADDRESS_CREATE_INFO_EXT = StructureType(raw = 1000244002)
    comptime VALIDATION_FEATURES_EXT = StructureType(raw = 1000247000)
    comptime PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR = StructureType(raw = 1000248000)
    comptime PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV = StructureType(raw = 1000249000)
    comptime COOPERATIVE_MATRIX_PROPERTIES_NV = StructureType(raw = 1000249001)
    comptime PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV = StructureType(raw = 1000249002)
    comptime PHYSICAL_DEVICE_COVERAGE_REDUCTION_MODE_FEATURES_NV = StructureType(raw = 1000250000)
    comptime PIPELINE_COVERAGE_REDUCTION_STATE_CREATE_INFO_NV = StructureType(raw = 1000250001)
    comptime FRAMEBUFFER_MIXED_SAMPLES_COMBINATION_NV = StructureType(raw = 1000250002)
    comptime PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT = StructureType(raw = 1000251000)
    comptime PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT = StructureType(raw = 1000252000)
    comptime PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT = StructureType(raw = 1000254000)
    comptime PIPELINE_RASTERIZATION_PROVOKING_VERTEX_STATE_CREATE_INFO_EXT = StructureType(raw = 1000254001)
    comptime PHYSICAL_DEVICE_PROVOKING_VERTEX_PROPERTIES_EXT = StructureType(raw = 1000254002)
    comptime SURFACE_FULL_SCREEN_EXCLUSIVE_INFO_EXT = StructureType(raw = 1000255000)
    comptime SURFACE_CAPABILITIES_FULL_SCREEN_EXCLUSIVE_EXT = StructureType(raw = 1000255002)
    comptime SURFACE_FULL_SCREEN_EXCLUSIVE_WIN32_INFO_EXT = StructureType(raw = 1000255001)
    comptime HEADLESS_SURFACE_CREATE_INFO_EXT = StructureType(raw = 1000256000)
    comptime PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT = StructureType(raw = 1000260000)
    comptime PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT = StructureType(raw = 1000267000)
    comptime PHYSICAL_DEVICE_PIPELINE_EXECUTABLE_PROPERTIES_FEATURES_KHR = StructureType(raw = 1000269000)
    comptime PIPELINE_INFO_KHR = StructureType(raw = 1000269001)
    comptime PIPELINE_EXECUTABLE_PROPERTIES_KHR = StructureType(raw = 1000269002)
    comptime PIPELINE_EXECUTABLE_INFO_KHR = StructureType(raw = 1000269003)
    comptime PIPELINE_EXECUTABLE_STATISTIC_KHR = StructureType(raw = 1000269004)
    comptime PIPELINE_EXECUTABLE_INTERNAL_REPRESENTATION_KHR = StructureType(raw = 1000269005)
    comptime PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT = StructureType(raw = 1000272000)
    comptime PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT = StructureType(raw = 1000272001)
    comptime MEMORY_MAP_PLACED_INFO_EXT = StructureType(raw = 1000272002)
    comptime PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_2_FEATURES_EXT = StructureType(raw = 1000273000)
    comptime PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV = StructureType(raw = 1000277000)
    comptime GRAPHICS_SHADER_GROUP_CREATE_INFO_NV = StructureType(raw = 1000277001)
    comptime GRAPHICS_PIPELINE_SHADER_GROUPS_CREATE_INFO_NV = StructureType(raw = 1000277002)
    comptime INDIRECT_COMMANDS_LAYOUT_TOKEN_NV = StructureType(raw = 1000277003)
    comptime INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NV = StructureType(raw = 1000277004)
    comptime GENERATED_COMMANDS_INFO_NV = StructureType(raw = 1000277005)
    comptime GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_NV = StructureType(raw = 1000277006)
    comptime PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV = StructureType(raw = 1000277007)
    comptime PHYSICAL_DEVICE_INHERITED_VIEWPORT_SCISSOR_FEATURES_NV = StructureType(raw = 1000278000)
    comptime COMMAND_BUFFER_INHERITANCE_VIEWPORT_SCISSOR_INFO_NV = StructureType(raw = 1000278001)
    comptime PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_FEATURES_EXT = StructureType(raw = 1000281000)
    comptime COMMAND_BUFFER_INHERITANCE_RENDER_PASS_TRANSFORM_INFO_QCOM = StructureType(raw = 1000282000)
    comptime RENDER_PASS_TRANSFORM_BEGIN_INFO_QCOM = StructureType(raw = 1000282001)
    comptime PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT = StructureType(raw = 1000283000)
    comptime DEPTH_BIAS_INFO_EXT = StructureType(raw = 1000283001)
    comptime DEPTH_BIAS_REPRESENTATION_INFO_EXT = StructureType(raw = 1000283002)
    comptime PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT = StructureType(raw = 1000284000)
    comptime DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT = StructureType(raw = 1000284001)
    comptime DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT = StructureType(raw = 1000284002)
    comptime SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT = StructureType(raw = 1000287000)
    comptime PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT = StructureType(raw = 1000287001)
    comptime PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT = StructureType(raw = 1000287002)
    comptime PIPELINE_LIBRARY_CREATE_INFO_KHR = StructureType(raw = 1000290000)
    comptime PHYSICAL_DEVICE_PRESENT_BARRIER_FEATURES_NV = StructureType(raw = 1000292000)
    comptime SURFACE_CAPABILITIES_PRESENT_BARRIER_NV = StructureType(raw = 1000292001)
    comptime SWAPCHAIN_PRESENT_BARRIER_CREATE_INFO_NV = StructureType(raw = 1000292002)
    comptime PRESENT_ID_KHR = StructureType(raw = 1000294000)
    comptime PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR = StructureType(raw = 1000294001)
    comptime VIDEO_ENCODE_INFO_KHR = StructureType(raw = 1000299000)
    comptime VIDEO_ENCODE_RATE_CONTROL_INFO_KHR = StructureType(raw = 1000299001)
    comptime VIDEO_ENCODE_RATE_CONTROL_LAYER_INFO_KHR = StructureType(raw = 1000299002)
    comptime VIDEO_ENCODE_CAPABILITIES_KHR = StructureType(raw = 1000299003)
    comptime VIDEO_ENCODE_USAGE_INFO_KHR = StructureType(raw = 1000299004)
    comptime QUERY_POOL_VIDEO_ENCODE_FEEDBACK_CREATE_INFO_KHR = StructureType(raw = 1000299005)
    comptime PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR = StructureType(raw = 1000299006)
    comptime VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR = StructureType(raw = 1000299007)
    comptime VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR = StructureType(raw = 1000299008)
    comptime VIDEO_ENCODE_SESSION_PARAMETERS_GET_INFO_KHR = StructureType(raw = 1000299009)
    comptime VIDEO_ENCODE_SESSION_PARAMETERS_FEEDBACK_INFO_KHR = StructureType(raw = 1000299010)
    comptime PHYSICAL_DEVICE_DIAGNOSTICS_CONFIG_FEATURES_NV = StructureType(raw = 1000300000)
    comptime DEVICE_DIAGNOSTICS_CONFIG_CREATE_INFO_NV = StructureType(raw = 1000300001)
    comptime CUDA_MODULE_CREATE_INFO_NV = StructureType(raw = 1000307000)
    comptime CUDA_FUNCTION_CREATE_INFO_NV = StructureType(raw = 1000307001)
    comptime CUDA_LAUNCH_INFO_NV = StructureType(raw = 1000307002)
    comptime PHYSICAL_DEVICE_CUDA_KERNEL_LAUNCH_FEATURES_NV = StructureType(raw = 1000307003)
    comptime PHYSICAL_DEVICE_CUDA_KERNEL_LAUNCH_PROPERTIES_NV = StructureType(raw = 1000307004)
    comptime REFRESH_OBJECT_LIST_KHR = StructureType(raw = 1000308000)
    comptime PHYSICAL_DEVICE_TILE_SHADING_FEATURES_QCOM = StructureType(raw = 1000309000)
    comptime PHYSICAL_DEVICE_TILE_SHADING_PROPERTIES_QCOM = StructureType(raw = 1000309001)
    comptime RENDER_PASS_TILE_SHADING_CREATE_INFO_QCOM = StructureType(raw = 1000309002)
    comptime PER_TILE_BEGIN_INFO_QCOM = StructureType(raw = 1000309003)
    comptime PER_TILE_END_INFO_QCOM = StructureType(raw = 1000309004)
    comptime DISPATCH_TILE_INFO_QCOM = StructureType(raw = 1000309005)
    comptime QUERY_LOW_LATENCY_SUPPORT_NV = StructureType(raw = 1000310000)
    comptime EXPORT_METAL_OBJECT_CREATE_INFO_EXT = StructureType(raw = 1000311000)
    comptime EXPORT_METAL_OBJECTS_INFO_EXT = StructureType(raw = 1000311001)
    comptime EXPORT_METAL_DEVICE_INFO_EXT = StructureType(raw = 1000311002)
    comptime EXPORT_METAL_COMMAND_QUEUE_INFO_EXT = StructureType(raw = 1000311003)
    comptime EXPORT_METAL_BUFFER_INFO_EXT = StructureType(raw = 1000311004)
    comptime IMPORT_METAL_BUFFER_INFO_EXT = StructureType(raw = 1000311005)
    comptime EXPORT_METAL_TEXTURE_INFO_EXT = StructureType(raw = 1000311006)
    comptime IMPORT_METAL_TEXTURE_INFO_EXT = StructureType(raw = 1000311007)
    comptime EXPORT_METAL_IO_SURFACE_INFO_EXT = StructureType(raw = 1000311008)
    comptime IMPORT_METAL_IO_SURFACE_INFO_EXT = StructureType(raw = 1000311009)
    comptime EXPORT_METAL_SHARED_EVENT_INFO_EXT = StructureType(raw = 1000311010)
    comptime IMPORT_METAL_SHARED_EVENT_INFO_EXT = StructureType(raw = 1000311011)
    comptime PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT = StructureType(raw = 1000316000)
    comptime PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_DENSITY_MAP_PROPERTIES_EXT = StructureType(raw = 1000316001)
    comptime PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT = StructureType(raw = 1000316002)
    comptime DESCRIPTOR_ADDRESS_INFO_EXT = StructureType(raw = 1000316003)
    comptime DESCRIPTOR_GET_INFO_EXT = StructureType(raw = 1000316004)
    comptime BUFFER_CAPTURE_DESCRIPTOR_DATA_INFO_EXT = StructureType(raw = 1000316005)
    comptime IMAGE_CAPTURE_DESCRIPTOR_DATA_INFO_EXT = StructureType(raw = 1000316006)
    comptime IMAGE_VIEW_CAPTURE_DESCRIPTOR_DATA_INFO_EXT = StructureType(raw = 1000316007)
    comptime SAMPLER_CAPTURE_DESCRIPTOR_DATA_INFO_EXT = StructureType(raw = 1000316008)
    comptime OPAQUE_CAPTURE_DESCRIPTOR_DATA_CREATE_INFO_EXT = StructureType(raw = 1000316010)
    comptime DESCRIPTOR_BUFFER_BINDING_INFO_EXT = StructureType(raw = 1000316011)
    comptime DESCRIPTOR_BUFFER_BINDING_PUSH_DESCRIPTOR_BUFFER_HANDLE_EXT = StructureType(raw = 1000316012)
    comptime ACCELERATION_STRUCTURE_CAPTURE_DESCRIPTOR_DATA_INFO_EXT = StructureType(raw = 1000316009)
    comptime PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT = StructureType(raw = 1000320000)
    comptime PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT = StructureType(raw = 1000320001)
    comptime GRAPHICS_PIPELINE_LIBRARY_CREATE_INFO_EXT = StructureType(raw = 1000320002)
    comptime PHYSICAL_DEVICE_SHADER_EARLY_AND_LATE_FRAGMENT_TESTS_FEATURES_AMD = StructureType(raw = 1000321000)
    comptime PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR = StructureType(raw = 1000203000)
    comptime PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR = StructureType(raw = 1000322000)
    comptime PHYSICAL_DEVICE_SHADER_SUBGROUP_UNIFORM_CONTROL_FLOW_FEATURES_KHR = StructureType(raw = 1000323000)
    comptime PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV = StructureType(raw = 1000326000)
    comptime PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV = StructureType(raw = 1000326001)
    comptime PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV = StructureType(raw = 1000326002)
    comptime ACCELERATION_STRUCTURE_GEOMETRY_MOTION_TRIANGLES_DATA_NV = StructureType(raw = 1000327000)
    comptime PHYSICAL_DEVICE_RAY_TRACING_MOTION_BLUR_FEATURES_NV = StructureType(raw = 1000327001)
    comptime ACCELERATION_STRUCTURE_MOTION_INFO_NV = StructureType(raw = 1000327002)
    comptime PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT = StructureType(raw = 1000328000)
    comptime PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT = StructureType(raw = 1000328001)
    comptime PHYSICAL_DEVICE_YCBCR_2_PLANE_444_FORMATS_FEATURES_EXT = StructureType(raw = 1000330000)
    comptime PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT = StructureType(raw = 1000332000)
    comptime PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT = StructureType(raw = 1000332001)
    comptime COPY_COMMAND_TRANSFORM_INFO_QCOM = StructureType(raw = 1000333000)
    comptime PHYSICAL_DEVICE_WORKGROUP_MEMORY_EXPLICIT_LAYOUT_FEATURES_KHR = StructureType(raw = 1000336000)
    comptime PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT = StructureType(raw = 1000338000)
    comptime IMAGE_COMPRESSION_CONTROL_EXT = StructureType(raw = 1000338001)
    comptime IMAGE_COMPRESSION_PROPERTIES_EXT = StructureType(raw = 1000338004)
    comptime PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT = StructureType(raw = 1000339000)
    comptime PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT = StructureType(raw = 1000340000)
    comptime PHYSICAL_DEVICE_FAULT_FEATURES_EXT = StructureType(raw = 1000341000)
    comptime DEVICE_FAULT_COUNTS_EXT = StructureType(raw = 1000341001)
    comptime DEVICE_FAULT_INFO_EXT = StructureType(raw = 1000341002)
    comptime PHYSICAL_DEVICE_RGBA10X6_FORMATS_FEATURES_EXT = StructureType(raw = 1000344000)
    comptime DIRECTFB_SURFACE_CREATE_INFO_EXT = StructureType(raw = 1000346000)
    comptime PHYSICAL_DEVICE_VERTEX_INPUT_DYNAMIC_STATE_FEATURES_EXT = StructureType(raw = 1000352000)
    comptime VERTEX_INPUT_BINDING_DESCRIPTION_2_EXT = StructureType(raw = 1000352001)
    comptime VERTEX_INPUT_ATTRIBUTE_DESCRIPTION_2_EXT = StructureType(raw = 1000352002)
    comptime PHYSICAL_DEVICE_DRM_PROPERTIES_EXT = StructureType(raw = 1000353000)
    comptime PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT = StructureType(raw = 1000354000)
    comptime DEVICE_ADDRESS_BINDING_CALLBACK_DATA_EXT = StructureType(raw = 1000354001)
    comptime PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT = StructureType(raw = 1000355000)
    comptime PIPELINE_VIEWPORT_DEPTH_CLIP_CONTROL_CREATE_INFO_EXT = StructureType(raw = 1000355001)
    comptime PHYSICAL_DEVICE_PRIMITIVE_TOPOLOGY_LIST_RESTART_FEATURES_EXT = StructureType(raw = 1000356000)
    comptime IMPORT_MEMORY_ZIRCON_HANDLE_INFO_FUCHSIA = StructureType(raw = 1000364000)
    comptime MEMORY_ZIRCON_HANDLE_PROPERTIES_FUCHSIA = StructureType(raw = 1000364001)
    comptime MEMORY_GET_ZIRCON_HANDLE_INFO_FUCHSIA = StructureType(raw = 1000364002)
    comptime IMPORT_SEMAPHORE_ZIRCON_HANDLE_INFO_FUCHSIA = StructureType(raw = 1000365000)
    comptime SEMAPHORE_GET_ZIRCON_HANDLE_INFO_FUCHSIA = StructureType(raw = 1000365001)
    comptime BUFFER_COLLECTION_CREATE_INFO_FUCHSIA = StructureType(raw = 1000366000)
    comptime IMPORT_MEMORY_BUFFER_COLLECTION_FUCHSIA = StructureType(raw = 1000366001)
    comptime BUFFER_COLLECTION_IMAGE_CREATE_INFO_FUCHSIA = StructureType(raw = 1000366002)
    comptime BUFFER_COLLECTION_PROPERTIES_FUCHSIA = StructureType(raw = 1000366003)
    comptime BUFFER_CONSTRAINTS_INFO_FUCHSIA = StructureType(raw = 1000366004)
    comptime BUFFER_COLLECTION_BUFFER_CREATE_INFO_FUCHSIA = StructureType(raw = 1000366005)
    comptime IMAGE_CONSTRAINTS_INFO_FUCHSIA = StructureType(raw = 1000366006)
    comptime IMAGE_FORMAT_CONSTRAINTS_INFO_FUCHSIA = StructureType(raw = 1000366007)
    comptime SYSMEM_COLOR_SPACE_FUCHSIA = StructureType(raw = 1000366008)
    comptime BUFFER_COLLECTION_CONSTRAINTS_INFO_FUCHSIA = StructureType(raw = 1000366009)
    comptime SUBPASS_SHADING_PIPELINE_CREATE_INFO_HUAWEI = StructureType(raw = 1000369000)
    comptime PHYSICAL_DEVICE_SUBPASS_SHADING_FEATURES_HUAWEI = StructureType(raw = 1000369001)
    comptime PHYSICAL_DEVICE_SUBPASS_SHADING_PROPERTIES_HUAWEI = StructureType(raw = 1000369002)
    comptime PHYSICAL_DEVICE_INVOCATION_MASK_FEATURES_HUAWEI = StructureType(raw = 1000370000)
    comptime MEMORY_GET_REMOTE_ADDRESS_INFO_NV = StructureType(raw = 1000371000)
    comptime PHYSICAL_DEVICE_EXTERNAL_MEMORY_RDMA_FEATURES_NV = StructureType(raw = 1000371001)
    comptime PIPELINE_PROPERTIES_IDENTIFIER_EXT = StructureType(raw = 1000372000)
    comptime PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT = StructureType(raw = 1000372001)
    comptime IMPORT_FENCE_SCI_SYNC_INFO_NV = StructureType(raw = 1000373000)
    comptime EXPORT_FENCE_SCI_SYNC_INFO_NV = StructureType(raw = 1000373001)
    comptime FENCE_GET_SCI_SYNC_INFO_NV = StructureType(raw = 1000373002)
    comptime SCI_SYNC_ATTRIBUTES_INFO_NV = StructureType(raw = 1000373003)
    comptime IMPORT_SEMAPHORE_SCI_SYNC_INFO_NV = StructureType(raw = 1000373004)
    comptime EXPORT_SEMAPHORE_SCI_SYNC_INFO_NV = StructureType(raw = 1000373005)
    comptime SEMAPHORE_GET_SCI_SYNC_INFO_NV = StructureType(raw = 1000373006)
    comptime PHYSICAL_DEVICE_EXTERNAL_SCI_SYNC_FEATURES_NV = StructureType(raw = 1000373007)
    comptime IMPORT_MEMORY_SCI_BUF_INFO_NV = StructureType(raw = 1000374000)
    comptime EXPORT_MEMORY_SCI_BUF_INFO_NV = StructureType(raw = 1000374001)
    comptime MEMORY_GET_SCI_BUF_INFO_NV = StructureType(raw = 1000374002)
    comptime MEMORY_SCI_BUF_PROPERTIES_NV = StructureType(raw = 1000374003)
    comptime PHYSICAL_DEVICE_EXTERNAL_MEMORY_SCI_BUF_FEATURES_NV = StructureType(raw = 1000374004)
    comptime PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT = StructureType(raw = 1000375000)
    comptime FRAME_BOUNDARY_EXT = StructureType(raw = 1000375001)
    comptime PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT = StructureType(raw = 1000376000)
    comptime SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT = StructureType(raw = 1000376001)
    comptime MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_INFO_EXT = StructureType(raw = 1000376002)
    comptime PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT = StructureType(raw = 1000377000)
    comptime SCREEN_SURFACE_CREATE_INFO_QNX = StructureType(raw = 1000378000)
    comptime PHYSICAL_DEVICE_COLOR_WRITE_ENABLE_FEATURES_EXT = StructureType(raw = 1000381000)
    comptime PIPELINE_COLOR_WRITE_CREATE_INFO_EXT = StructureType(raw = 1000381001)
    comptime PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT = StructureType(raw = 1000382000)
    comptime PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR = StructureType(raw = 1000386000)
    comptime PHYSICAL_DEVICE_SHADER_UNTYPED_POINTERS_FEATURES_KHR = StructureType(raw = 1000387000)
    comptime PHYSICAL_DEVICE_VIDEO_ENCODE_RGB_CONVERSION_FEATURES_VALVE = StructureType(raw = 1000390000)
    comptime VIDEO_ENCODE_RGB_CONVERSION_CAPABILITIES_VALVE = StructureType(raw = 1000390001)
    comptime VIDEO_ENCODE_PROFILE_RGB_CONVERSION_INFO_VALVE = StructureType(raw = 1000390002)
    comptime VIDEO_ENCODE_SESSION_RGB_CONVERSION_CREATE_INFO_VALVE = StructureType(raw = 1000390003)
    comptime PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT = StructureType(raw = 1000391000)
    comptime IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT = StructureType(raw = 1000391001)
    comptime PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT = StructureType(raw = 1000392000)
    comptime PHYSICAL_DEVICE_MULTI_DRAW_PROPERTIES_EXT = StructureType(raw = 1000392001)
    comptime PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT = StructureType(raw = 1000393000)
    comptime PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT = StructureType(raw = 1000395000)
    comptime PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT = StructureType(raw = 1000395001)
    comptime MICROMAP_BUILD_INFO_EXT = StructureType(raw = 1000396000)
    comptime MICROMAP_VERSION_INFO_EXT = StructureType(raw = 1000396001)
    comptime COPY_MICROMAP_INFO_EXT = StructureType(raw = 1000396002)
    comptime COPY_MICROMAP_TO_MEMORY_INFO_EXT = StructureType(raw = 1000396003)
    comptime COPY_MEMORY_TO_MICROMAP_INFO_EXT = StructureType(raw = 1000396004)
    comptime PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT = StructureType(raw = 1000396005)
    comptime PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT = StructureType(raw = 1000396006)
    comptime MICROMAP_CREATE_INFO_EXT = StructureType(raw = 1000396007)
    comptime MICROMAP_BUILD_SIZES_INFO_EXT = StructureType(raw = 1000396008)
    comptime ACCELERATION_STRUCTURE_TRIANGLES_OPACITY_MICROMAP_EXT = StructureType(raw = 1000396009)
    comptime PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_FEATURES_NV = StructureType(raw = 1000397000)
    comptime PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_PROPERTIES_NV = StructureType(raw = 1000397001)
    comptime ACCELERATION_STRUCTURE_TRIANGLES_DISPLACEMENT_MICROMAP_NV = StructureType(raw = 1000397002)
    comptime PHYSICAL_DEVICE_CLUSTER_CULLING_SHADER_FEATURES_HUAWEI = StructureType(raw = 1000404000)
    comptime PHYSICAL_DEVICE_CLUSTER_CULLING_SHADER_PROPERTIES_HUAWEI = StructureType(raw = 1000404001)
    comptime PHYSICAL_DEVICE_CLUSTER_CULLING_SHADER_VRS_FEATURES_HUAWEI = StructureType(raw = 1000404002)
    comptime PHYSICAL_DEVICE_BORDER_COLOR_SWIZZLE_FEATURES_EXT = StructureType(raw = 1000411000)
    comptime SAMPLER_BORDER_COLOR_COMPONENT_MAPPING_CREATE_INFO_EXT = StructureType(raw = 1000411001)
    comptime PHYSICAL_DEVICE_PAGEABLE_DEVICE_LOCAL_MEMORY_FEATURES_EXT = StructureType(raw = 1000412000)
    comptime PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM = StructureType(raw = 1000415000)
    comptime DEVICE_QUEUE_SHADER_CORE_CONTROL_CREATE_INFO_ARM = StructureType(raw = 1000417000)
    comptime PHYSICAL_DEVICE_SCHEDULING_CONTROLS_FEATURES_ARM = StructureType(raw = 1000417001)
    comptime PHYSICAL_DEVICE_SCHEDULING_CONTROLS_PROPERTIES_ARM = StructureType(raw = 1000417002)
    comptime PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT = StructureType(raw = 1000418000)
    comptime IMAGE_VIEW_SLICED_CREATE_INFO_EXT = StructureType(raw = 1000418001)
    comptime PHYSICAL_DEVICE_DESCRIPTOR_SET_HOST_MAPPING_FEATURES_VALVE = StructureType(raw = 1000420000)
    comptime DESCRIPTOR_SET_BINDING_REFERENCE_VALVE = StructureType(raw = 1000420001)
    comptime DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE = StructureType(raw = 1000420002)
    comptime PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT = StructureType(raw = 1000422000)
    comptime PHYSICAL_DEVICE_RENDER_PASS_STRIPED_FEATURES_ARM = StructureType(raw = 1000424000)
    comptime PHYSICAL_DEVICE_RENDER_PASS_STRIPED_PROPERTIES_ARM = StructureType(raw = 1000424001)
    comptime RENDER_PASS_STRIPE_BEGIN_INFO_ARM = StructureType(raw = 1000424002)
    comptime RENDER_PASS_STRIPE_INFO_ARM = StructureType(raw = 1000424003)
    comptime RENDER_PASS_STRIPE_SUBMIT_INFO_ARM = StructureType(raw = 1000424004)
    comptime PHYSICAL_DEVICE_COPY_MEMORY_INDIRECT_FEATURES_NV = StructureType(raw = 1000426000)
    comptime PHYSICAL_DEVICE_COPY_MEMORY_INDIRECT_PROPERTIES_NV = StructureType(raw = 1000426001)
    comptime PHYSICAL_DEVICE_MEMORY_DECOMPRESSION_FEATURES_NV = StructureType(raw = 1000427000)
    comptime PHYSICAL_DEVICE_MEMORY_DECOMPRESSION_PROPERTIES_NV = StructureType(raw = 1000427001)
    comptime PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_COMPUTE_FEATURES_NV = StructureType(raw = 1000428000)
    comptime COMPUTE_PIPELINE_INDIRECT_BUFFER_INFO_NV = StructureType(raw = 1000428001)
    comptime PIPELINE_INDIRECT_DEVICE_ADDRESS_INFO_NV = StructureType(raw = 1000428002)
    comptime PHYSICAL_DEVICE_RAY_TRACING_LINEAR_SWEPT_SPHERES_FEATURES_NV = StructureType(raw = 1000429008)
    comptime ACCELERATION_STRUCTURE_GEOMETRY_LINEAR_SWEPT_SPHERES_DATA_NV = StructureType(raw = 1000429009)
    comptime ACCELERATION_STRUCTURE_GEOMETRY_SPHERES_DATA_NV = StructureType(raw = 1000429010)
    comptime PHYSICAL_DEVICE_LINEAR_COLOR_ATTACHMENT_FEATURES_NV = StructureType(raw = 1000430000)
    comptime PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR = StructureType(raw = 1000434000)
    comptime APPLICATION_PARAMETERS_EXT = StructureType(raw = 1000435000)
    comptime PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT = StructureType(raw = 1000437000)
    comptime PHYSICAL_DEVICE_IMAGE_PROCESSING_FEATURES_QCOM = StructureType(raw = 1000440000)
    comptime PHYSICAL_DEVICE_IMAGE_PROCESSING_PROPERTIES_QCOM = StructureType(raw = 1000440001)
    comptime IMAGE_VIEW_SAMPLE_WEIGHT_CREATE_INFO_QCOM = StructureType(raw = 1000440002)
    comptime PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT = StructureType(raw = 1000451000)
    comptime PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT = StructureType(raw = 1000451001)
    comptime EXTERNAL_MEMORY_ACQUIRE_UNMODIFIED_EXT = StructureType(raw = 1000453000)
    comptime PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT = StructureType(raw = 1000455000)
    comptime PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT = StructureType(raw = 1000455001)
    comptime PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT = StructureType(raw = 1000458000)
    comptime RENDER_PASS_CREATION_CONTROL_EXT = StructureType(raw = 1000458001)
    comptime RENDER_PASS_CREATION_FEEDBACK_CREATE_INFO_EXT = StructureType(raw = 1000458002)
    comptime RENDER_PASS_SUBPASS_FEEDBACK_CREATE_INFO_EXT = StructureType(raw = 1000458003)
    comptime DIRECT_DRIVER_LOADING_INFO_LUNARG = StructureType(raw = 1000459000)
    comptime DIRECT_DRIVER_LOADING_LIST_LUNARG = StructureType(raw = 1000459001)
    comptime TENSOR_CREATE_INFO_ARM = StructureType(raw = 1000460000)
    comptime TENSOR_VIEW_CREATE_INFO_ARM = StructureType(raw = 1000460001)
    comptime BIND_TENSOR_MEMORY_INFO_ARM = StructureType(raw = 1000460002)
    comptime WRITE_DESCRIPTOR_SET_TENSOR_ARM = StructureType(raw = 1000460003)
    comptime PHYSICAL_DEVICE_TENSOR_PROPERTIES_ARM = StructureType(raw = 1000460004)
    comptime TENSOR_FORMAT_PROPERTIES_ARM = StructureType(raw = 1000460005)
    comptime TENSOR_DESCRIPTION_ARM = StructureType(raw = 1000460006)
    comptime TENSOR_MEMORY_REQUIREMENTS_INFO_ARM = StructureType(raw = 1000460007)
    comptime TENSOR_MEMORY_BARRIER_ARM = StructureType(raw = 1000460008)
    comptime PHYSICAL_DEVICE_TENSOR_FEATURES_ARM = StructureType(raw = 1000460009)
    comptime DEVICE_TENSOR_MEMORY_REQUIREMENTS_ARM = StructureType(raw = 1000460010)
    comptime COPY_TENSOR_INFO_ARM = StructureType(raw = 1000460011)
    comptime TENSOR_COPY_ARM = StructureType(raw = 1000460012)
    comptime TENSOR_DEPENDENCY_INFO_ARM = StructureType(raw = 1000460013)
    comptime MEMORY_DEDICATED_ALLOCATE_INFO_TENSOR_ARM = StructureType(raw = 1000460014)
    comptime PHYSICAL_DEVICE_EXTERNAL_TENSOR_INFO_ARM = StructureType(raw = 1000460015)
    comptime EXTERNAL_TENSOR_PROPERTIES_ARM = StructureType(raw = 1000460016)
    comptime EXTERNAL_MEMORY_TENSOR_CREATE_INFO_ARM = StructureType(raw = 1000460017)
    comptime PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_TENSOR_FEATURES_ARM = StructureType(raw = 1000460018)
    comptime PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_TENSOR_PROPERTIES_ARM = StructureType(raw = 1000460019)
    comptime DESCRIPTOR_GET_TENSOR_INFO_ARM = StructureType(raw = 1000460020)
    comptime TENSOR_CAPTURE_DESCRIPTOR_DATA_INFO_ARM = StructureType(raw = 1000460021)
    comptime TENSOR_VIEW_CAPTURE_DESCRIPTOR_DATA_INFO_ARM = StructureType(raw = 1000460022)
    comptime FRAME_BOUNDARY_TENSORS_ARM = StructureType(raw = 1000460023)
    comptime PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT = StructureType(raw = 1000462000)
    comptime PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT = StructureType(raw = 1000462001)
    comptime PIPELINE_SHADER_STAGE_MODULE_IDENTIFIER_CREATE_INFO_EXT = StructureType(raw = 1000462002)
    comptime SHADER_MODULE_IDENTIFIER_EXT = StructureType(raw = 1000462003)
    comptime PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT = StructureType(raw = 1000342000)
    comptime PHYSICAL_DEVICE_OPTICAL_FLOW_FEATURES_NV = StructureType(raw = 1000464000)
    comptime PHYSICAL_DEVICE_OPTICAL_FLOW_PROPERTIES_NV = StructureType(raw = 1000464001)
    comptime OPTICAL_FLOW_IMAGE_FORMAT_INFO_NV = StructureType(raw = 1000464002)
    comptime OPTICAL_FLOW_IMAGE_FORMAT_PROPERTIES_NV = StructureType(raw = 1000464003)
    comptime OPTICAL_FLOW_SESSION_CREATE_INFO_NV = StructureType(raw = 1000464004)
    comptime OPTICAL_FLOW_EXECUTE_INFO_NV = StructureType(raw = 1000464005)
    comptime OPTICAL_FLOW_SESSION_CREATE_PRIVATE_DATA_INFO_NV = StructureType(raw = 1000464010)
    comptime PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT = StructureType(raw = 1000465000)
    comptime PHYSICAL_DEVICE_EXTERNAL_FORMAT_RESOLVE_FEATURES_ANDROID = StructureType(raw = 1000468000)
    comptime PHYSICAL_DEVICE_EXTERNAL_FORMAT_RESOLVE_PROPERTIES_ANDROID = StructureType(raw = 1000468001)
    comptime ANDROID_HARDWARE_BUFFER_FORMAT_RESOLVE_PROPERTIES_ANDROID = StructureType(raw = 1000468002)
    comptime PHYSICAL_DEVICE_ANTI_LAG_FEATURES_AMD = StructureType(raw = 1000476000)
    comptime ANTI_LAG_DATA_AMD = StructureType(raw = 1000476001)
    comptime ANTI_LAG_PRESENTATION_INFO_AMD = StructureType(raw = 1000476002)
    comptime PHYSICAL_DEVICE_DENSE_GEOMETRY_FORMAT_FEATURES_AMDX = StructureType(raw = 1000478000)
    comptime ACCELERATION_STRUCTURE_DENSE_GEOMETRY_FORMAT_TRIANGLES_DATA_AMDX = StructureType(raw = 1000478001)
    comptime SURFACE_CAPABILITIES_PRESENT_ID_2_KHR = StructureType(raw = 1000479000)
    comptime PRESENT_ID_2_KHR = StructureType(raw = 1000479001)
    comptime PHYSICAL_DEVICE_PRESENT_ID_2_FEATURES_KHR = StructureType(raw = 1000479002)
    comptime SURFACE_CAPABILITIES_PRESENT_WAIT_2_KHR = StructureType(raw = 1000480000)
    comptime PHYSICAL_DEVICE_PRESENT_WAIT_2_FEATURES_KHR = StructureType(raw = 1000480001)
    comptime PRESENT_WAIT_2_INFO_KHR = StructureType(raw = 1000480002)
    comptime PHYSICAL_DEVICE_RAY_TRACING_POSITION_FETCH_FEATURES_KHR = StructureType(raw = 1000481000)
    comptime PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT = StructureType(raw = 1000482000)
    comptime PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT = StructureType(raw = 1000482001)
    comptime SHADER_CREATE_INFO_EXT = StructureType(raw = 1000482002)
    comptime PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR = StructureType(raw = 1000483000)
    comptime PIPELINE_BINARY_CREATE_INFO_KHR = StructureType(raw = 1000483001)
    comptime PIPELINE_BINARY_INFO_KHR = StructureType(raw = 1000483002)
    comptime PIPELINE_BINARY_KEY_KHR = StructureType(raw = 1000483003)
    comptime PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR = StructureType(raw = 1000483004)
    comptime RELEASE_CAPTURED_PIPELINE_DATA_INFO_KHR = StructureType(raw = 1000483005)
    comptime PIPELINE_BINARY_DATA_INFO_KHR = StructureType(raw = 1000483006)
    comptime PIPELINE_CREATE_INFO_KHR = StructureType(raw = 1000483007)
    comptime DEVICE_PIPELINE_BINARY_INTERNAL_CACHE_CONTROL_KHR = StructureType(raw = 1000483008)
    comptime PIPELINE_BINARY_HANDLES_INFO_KHR = StructureType(raw = 1000483009)
    comptime PHYSICAL_DEVICE_TILE_PROPERTIES_FEATURES_QCOM = StructureType(raw = 1000484000)
    comptime TILE_PROPERTIES_QCOM = StructureType(raw = 1000484001)
    comptime PHYSICAL_DEVICE_AMIGO_PROFILING_FEATURES_SEC = StructureType(raw = 1000485000)
    comptime AMIGO_PROFILING_SUBMIT_INFO_SEC = StructureType(raw = 1000485001)
    comptime SURFACE_PRESENT_MODE_KHR = StructureType(raw = 1000274000)
    comptime SURFACE_PRESENT_SCALING_CAPABILITIES_KHR = StructureType(raw = 1000274001)
    comptime SURFACE_PRESENT_MODE_COMPATIBILITY_KHR = StructureType(raw = 1000274002)
    comptime PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_KHR = StructureType(raw = 1000275000)
    comptime SWAPCHAIN_PRESENT_FENCE_INFO_KHR = StructureType(raw = 1000275001)
    comptime SWAPCHAIN_PRESENT_MODES_CREATE_INFO_KHR = StructureType(raw = 1000275002)
    comptime SWAPCHAIN_PRESENT_MODE_INFO_KHR = StructureType(raw = 1000275003)
    comptime SWAPCHAIN_PRESENT_SCALING_CREATE_INFO_KHR = StructureType(raw = 1000275004)
    comptime RELEASE_SWAPCHAIN_IMAGES_INFO_KHR = StructureType(raw = 1000275005)
    comptime PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_VIEWPORTS_FEATURES_QCOM = StructureType(raw = 1000488000)
    comptime SEMAPHORE_SCI_SYNC_POOL_CREATE_INFO_NV = StructureType(raw = 1000489000)
    comptime SEMAPHORE_SCI_SYNC_CREATE_INFO_NV = StructureType(raw = 1000489001)
    comptime PHYSICAL_DEVICE_EXTERNAL_SCI_SYNC_2_FEATURES_NV = StructureType(raw = 1000489002)
    comptime DEVICE_SEMAPHORE_SCI_SYNC_POOL_RESERVATION_CREATE_INFO_NV = StructureType(raw = 1000489003)
    comptime PHYSICAL_DEVICE_RAY_TRACING_INVOCATION_REORDER_FEATURES_NV = StructureType(raw = 1000490000)
    comptime PHYSICAL_DEVICE_RAY_TRACING_INVOCATION_REORDER_PROPERTIES_NV = StructureType(raw = 1000490001)
    comptime PHYSICAL_DEVICE_COOPERATIVE_VECTOR_FEATURES_NV = StructureType(raw = 1000491000)
    comptime PHYSICAL_DEVICE_COOPERATIVE_VECTOR_PROPERTIES_NV = StructureType(raw = 1000491001)
    comptime COOPERATIVE_VECTOR_PROPERTIES_NV = StructureType(raw = 1000491002)
    comptime CONVERT_COOPERATIVE_VECTOR_MATRIX_INFO_NV = StructureType(raw = 1000491004)
    comptime PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_FEATURES_NV = StructureType(raw = 1000492000)
    comptime PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_PROPERTIES_NV = StructureType(raw = 1000492001)
    comptime PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT = StructureType(raw = 1000351000)
    comptime MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_EXT = StructureType(raw = 1000351002)
    comptime PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT = StructureType(raw = 1000495000)
    comptime PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT = StructureType(raw = 1000495001)
    comptime LAYER_SETTINGS_CREATE_INFO_EXT = StructureType(raw = 1000496000)
    comptime PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_FEATURES_ARM = StructureType(raw = 1000497000)
    comptime PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_PROPERTIES_ARM = StructureType(raw = 1000497001)
    comptime PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT = StructureType(raw = 1000498000)
    comptime PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT = StructureType(raw = 1000499000)
    comptime LATENCY_SLEEP_MODE_INFO_NV = StructureType(raw = 1000505000)
    comptime LATENCY_SLEEP_INFO_NV = StructureType(raw = 1000505001)
    comptime SET_LATENCY_MARKER_INFO_NV = StructureType(raw = 1000505002)
    comptime GET_LATENCY_MARKER_INFO_NV = StructureType(raw = 1000505003)
    comptime LATENCY_TIMINGS_FRAME_REPORT_NV = StructureType(raw = 1000505004)
    comptime LATENCY_SUBMISSION_PRESENT_ID_NV = StructureType(raw = 1000505005)
    comptime OUT_OF_BAND_QUEUE_TYPE_INFO_NV = StructureType(raw = 1000505006)
    comptime SWAPCHAIN_LATENCY_CREATE_INFO_NV = StructureType(raw = 1000505007)
    comptime LATENCY_SURFACE_CAPABILITIES_NV = StructureType(raw = 1000505008)
    comptime PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR = StructureType(raw = 1000506000)
    comptime COOPERATIVE_MATRIX_PROPERTIES_KHR = StructureType(raw = 1000506001)
    comptime PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR = StructureType(raw = 1000506002)
    comptime DATA_GRAPH_PIPELINE_CREATE_INFO_ARM = StructureType(raw = 1000507000)
    comptime DATA_GRAPH_PIPELINE_SESSION_CREATE_INFO_ARM = StructureType(raw = 1000507001)
    comptime DATA_GRAPH_PIPELINE_RESOURCE_INFO_ARM = StructureType(raw = 1000507002)
    comptime DATA_GRAPH_PIPELINE_CONSTANT_ARM = StructureType(raw = 1000507003)
    comptime DATA_GRAPH_PIPELINE_SESSION_MEMORY_REQUIREMENTS_INFO_ARM = StructureType(raw = 1000507004)
    comptime BIND_DATA_GRAPH_PIPELINE_SESSION_MEMORY_INFO_ARM = StructureType(raw = 1000507005)
    comptime PHYSICAL_DEVICE_DATA_GRAPH_FEATURES_ARM = StructureType(raw = 1000507006)
    comptime DATA_GRAPH_PIPELINE_SHADER_MODULE_CREATE_INFO_ARM = StructureType(raw = 1000507007)
    comptime DATA_GRAPH_PIPELINE_PROPERTY_QUERY_RESULT_ARM = StructureType(raw = 1000507008)
    comptime DATA_GRAPH_PIPELINE_INFO_ARM = StructureType(raw = 1000507009)
    comptime DATA_GRAPH_PIPELINE_COMPILER_CONTROL_CREATE_INFO_ARM = StructureType(raw = 1000507010)
    comptime DATA_GRAPH_PIPELINE_SESSION_BIND_POINT_REQUIREMENTS_INFO_ARM = StructureType(raw = 1000507011)
    comptime DATA_GRAPH_PIPELINE_SESSION_BIND_POINT_REQUIREMENT_ARM = StructureType(raw = 1000507012)
    comptime DATA_GRAPH_PIPELINE_IDENTIFIER_CREATE_INFO_ARM = StructureType(raw = 1000507013)
    comptime DATA_GRAPH_PIPELINE_DISPATCH_INFO_ARM = StructureType(raw = 1000507014)
    comptime DATA_GRAPH_PROCESSING_ENGINE_CREATE_INFO_ARM = StructureType(raw = 1000507016)
    comptime QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_PROPERTIES_ARM = StructureType(raw = 1000507017)
    comptime QUEUE_FAMILY_DATA_GRAPH_PROPERTIES_ARM = StructureType(raw = 1000507018)
    comptime PHYSICAL_DEVICE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_INFO_ARM = StructureType(raw = 1000507019)
    comptime DATA_GRAPH_PIPELINE_CONSTANT_TENSOR_SEMI_STRUCTURED_SPARSITY_INFO_ARM = StructureType(raw = 1000507015)
    comptime PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_RENDER_AREAS_FEATURES_QCOM = StructureType(raw = 1000510000)
    comptime MULTIVIEW_PER_VIEW_RENDER_AREAS_RENDER_PASS_BEGIN_INFO_QCOM = StructureType(raw = 1000510001)
    comptime PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR = StructureType(raw = 1000201000)
    comptime PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR = StructureType(raw = 1000511000)
    comptime VIDEO_DECODE_AV1_CAPABILITIES_KHR = StructureType(raw = 1000512000)
    comptime VIDEO_DECODE_AV1_PICTURE_INFO_KHR = StructureType(raw = 1000512001)
    comptime VIDEO_DECODE_AV1_PROFILE_INFO_KHR = StructureType(raw = 1000512003)
    comptime VIDEO_DECODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000512004)
    comptime VIDEO_DECODE_AV1_DPB_SLOT_INFO_KHR = StructureType(raw = 1000512005)
    comptime VIDEO_ENCODE_AV1_CAPABILITIES_KHR = StructureType(raw = 1000513000)
    comptime VIDEO_ENCODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000513001)
    comptime VIDEO_ENCODE_AV1_PICTURE_INFO_KHR = StructureType(raw = 1000513002)
    comptime VIDEO_ENCODE_AV1_DPB_SLOT_INFO_KHR = StructureType(raw = 1000513003)
    comptime PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR = StructureType(raw = 1000513004)
    comptime VIDEO_ENCODE_AV1_PROFILE_INFO_KHR = StructureType(raw = 1000513005)
    comptime VIDEO_ENCODE_AV1_RATE_CONTROL_INFO_KHR = StructureType(raw = 1000513006)
    comptime VIDEO_ENCODE_AV1_RATE_CONTROL_LAYER_INFO_KHR = StructureType(raw = 1000513007)
    comptime VIDEO_ENCODE_AV1_QUALITY_LEVEL_PROPERTIES_KHR = StructureType(raw = 1000513008)
    comptime VIDEO_ENCODE_AV1_SESSION_CREATE_INFO_KHR = StructureType(raw = 1000513009)
    comptime VIDEO_ENCODE_AV1_GOP_REMAINING_FRAME_INFO_KHR = StructureType(raw = 1000513010)
    comptime PHYSICAL_DEVICE_VIDEO_DECODE_VP9_FEATURES_KHR = StructureType(raw = 1000514000)
    comptime VIDEO_DECODE_VP9_CAPABILITIES_KHR = StructureType(raw = 1000514001)
    comptime VIDEO_DECODE_VP9_PICTURE_INFO_KHR = StructureType(raw = 1000514002)
    comptime VIDEO_DECODE_VP9_PROFILE_INFO_KHR = StructureType(raw = 1000514003)
    comptime PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR = StructureType(raw = 1000515000)
    comptime VIDEO_INLINE_QUERY_INFO_KHR = StructureType(raw = 1000515001)
    comptime PHYSICAL_DEVICE_PER_STAGE_DESCRIPTOR_SET_FEATURES_NV = StructureType(raw = 1000516000)
    comptime PHYSICAL_DEVICE_IMAGE_PROCESSING_2_FEATURES_QCOM = StructureType(raw = 1000518000)
    comptime PHYSICAL_DEVICE_IMAGE_PROCESSING_2_PROPERTIES_QCOM = StructureType(raw = 1000518001)
    comptime SAMPLER_BLOCK_MATCH_WINDOW_CREATE_INFO_QCOM = StructureType(raw = 1000518002)
    comptime SAMPLER_CUBIC_WEIGHTS_CREATE_INFO_QCOM = StructureType(raw = 1000519000)
    comptime PHYSICAL_DEVICE_CUBIC_WEIGHTS_FEATURES_QCOM = StructureType(raw = 1000519001)
    comptime BLIT_IMAGE_CUBIC_WEIGHTS_INFO_QCOM = StructureType(raw = 1000519002)
    comptime PHYSICAL_DEVICE_YCBCR_DEGAMMA_FEATURES_QCOM = StructureType(raw = 1000520000)
    comptime SAMPLER_YCBCR_CONVERSION_YCBCR_DEGAMMA_CREATE_INFO_QCOM = StructureType(raw = 1000520001)
    comptime PHYSICAL_DEVICE_CUBIC_CLAMP_FEATURES_QCOM = StructureType(raw = 1000521000)
    comptime PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_DYNAMIC_STATE_FEATURES_EXT = StructureType(raw = 1000524000)
    comptime PHYSICAL_DEVICE_UNIFIED_IMAGE_LAYOUTS_FEATURES_KHR = StructureType(raw = 1000527000)
    comptime ATTACHMENT_FEEDBACK_LOOP_INFO_EXT = StructureType(raw = 1000527001)
    comptime SCREEN_BUFFER_PROPERTIES_QNX = StructureType(raw = 1000529000)
    comptime SCREEN_BUFFER_FORMAT_PROPERTIES_QNX = StructureType(raw = 1000529001)
    comptime IMPORT_SCREEN_BUFFER_INFO_QNX = StructureType(raw = 1000529002)
    comptime EXTERNAL_FORMAT_QNX = StructureType(raw = 1000529003)
    comptime PHYSICAL_DEVICE_EXTERNAL_MEMORY_SCREEN_BUFFER_FEATURES_QNX = StructureType(raw = 1000529004)
    comptime PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT = StructureType(raw = 1000530000)
    comptime CALIBRATED_TIMESTAMP_INFO_KHR = StructureType(raw = 1000184000)
    comptime SET_DESCRIPTOR_BUFFER_OFFSETS_INFO_EXT = StructureType(raw = 1000545007)
    comptime BIND_DESCRIPTOR_BUFFER_EMBEDDED_SAMPLERS_INFO_EXT = StructureType(raw = 1000545008)
    comptime PHYSICAL_DEVICE_DESCRIPTOR_POOL_OVERALLOCATION_FEATURES_NV = StructureType(raw = 1000546000)
    comptime PHYSICAL_DEVICE_TILE_MEMORY_HEAP_FEATURES_QCOM = StructureType(raw = 1000547000)
    comptime PHYSICAL_DEVICE_TILE_MEMORY_HEAP_PROPERTIES_QCOM = StructureType(raw = 1000547001)
    comptime TILE_MEMORY_REQUIREMENTS_QCOM = StructureType(raw = 1000547002)
    comptime TILE_MEMORY_BIND_INFO_QCOM = StructureType(raw = 1000547003)
    comptime TILE_MEMORY_SIZE_INFO_QCOM = StructureType(raw = 1000547004)
    comptime DISPLAY_SURFACE_STEREO_CREATE_INFO_NV = StructureType(raw = 1000551000)
    comptime DISPLAY_MODE_STEREO_PROPERTIES_NV = StructureType(raw = 1000551001)
    comptime VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR = StructureType(raw = 1000552000)
    comptime VIDEO_ENCODE_SESSION_INTRA_REFRESH_CREATE_INFO_KHR = StructureType(raw = 1000552001)
    comptime VIDEO_ENCODE_INTRA_REFRESH_INFO_KHR = StructureType(raw = 1000552002)
    comptime VIDEO_REFERENCE_INTRA_REFRESH_INFO_KHR = StructureType(raw = 1000552003)
    comptime PHYSICAL_DEVICE_VIDEO_ENCODE_INTRA_REFRESH_FEATURES_KHR = StructureType(raw = 1000552004)
    comptime VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR = StructureType(raw = 1000553000)
    comptime VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR = StructureType(raw = 1000553001)
    comptime VIDEO_ENCODE_QUANTIZATION_MAP_INFO_KHR = StructureType(raw = 1000553002)
    comptime VIDEO_ENCODE_QUANTIZATION_MAP_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000553005)
    comptime PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR = StructureType(raw = 1000553009)
    comptime VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR = StructureType(raw = 1000553003)
    comptime VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR = StructureType(raw = 1000553004)
    comptime VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR = StructureType(raw = 1000553006)
    comptime VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR = StructureType(raw = 1000553007)
    comptime VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR = StructureType(raw = 1000553008)
    comptime PHYSICAL_DEVICE_RAW_ACCESS_CHAINS_FEATURES_NV = StructureType(raw = 1000555000)
    comptime EXTERNAL_COMPUTE_QUEUE_DEVICE_CREATE_INFO_NV = StructureType(raw = 1000556000)
    comptime EXTERNAL_COMPUTE_QUEUE_CREATE_INFO_NV = StructureType(raw = 1000556001)
    comptime EXTERNAL_COMPUTE_QUEUE_DATA_PARAMS_NV = StructureType(raw = 1000556002)
    comptime PHYSICAL_DEVICE_EXTERNAL_COMPUTE_QUEUE_PROPERTIES_NV = StructureType(raw = 1000556003)
    comptime PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR = StructureType(raw = 1000558000)
    comptime PHYSICAL_DEVICE_COMMAND_BUFFER_INHERITANCE_FEATURES_NV = StructureType(raw = 1000559000)
    comptime PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR = StructureType(raw = 1000562000)
    comptime PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR = StructureType(raw = 1000562001)
    comptime PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR = StructureType(raw = 1000562002)
    comptime PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR = StructureType(raw = 1000562003)
    comptime PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR = StructureType(raw = 1000562004)
    comptime PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT16_VECTOR_FEATURES_NV = StructureType(raw = 1000563000)
    comptime PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT = StructureType(raw = 1000564000)
    comptime PHYSICAL_DEVICE_SHADER_FLOAT8_FEATURES_EXT = StructureType(raw = 1000567000)
    comptime PHYSICAL_DEVICE_RAY_TRACING_VALIDATION_FEATURES_NV = StructureType(raw = 1000568000)
    comptime PHYSICAL_DEVICE_CLUSTER_ACCELERATION_STRUCTURE_FEATURES_NV = StructureType(raw = 1000569000)
    comptime PHYSICAL_DEVICE_CLUSTER_ACCELERATION_STRUCTURE_PROPERTIES_NV = StructureType(raw = 1000569001)
    comptime CLUSTER_ACCELERATION_STRUCTURE_CLUSTERS_BOTTOM_LEVEL_INPUT_NV = StructureType(raw = 1000569002)
    comptime CLUSTER_ACCELERATION_STRUCTURE_TRIANGLE_CLUSTER_INPUT_NV = StructureType(raw = 1000569003)
    comptime CLUSTER_ACCELERATION_STRUCTURE_MOVE_OBJECTS_INPUT_NV = StructureType(raw = 1000569004)
    comptime CLUSTER_ACCELERATION_STRUCTURE_INPUT_INFO_NV = StructureType(raw = 1000569005)
    comptime CLUSTER_ACCELERATION_STRUCTURE_COMMANDS_INFO_NV = StructureType(raw = 1000569006)
    comptime RAY_TRACING_PIPELINE_CLUSTER_ACCELERATION_STRUCTURE_CREATE_INFO_NV = StructureType(raw = 1000569007)
    comptime PHYSICAL_DEVICE_PARTITIONED_ACCELERATION_STRUCTURE_FEATURES_NV = StructureType(raw = 1000570000)
    comptime PHYSICAL_DEVICE_PARTITIONED_ACCELERATION_STRUCTURE_PROPERTIES_NV = StructureType(raw = 1000570001)
    comptime WRITE_DESCRIPTOR_SET_PARTITIONED_ACCELERATION_STRUCTURE_NV = StructureType(raw = 1000570002)
    comptime PARTITIONED_ACCELERATION_STRUCTURE_INSTANCES_INPUT_NV = StructureType(raw = 1000570003)
    comptime BUILD_PARTITIONED_ACCELERATION_STRUCTURE_INFO_NV = StructureType(raw = 1000570004)
    comptime PARTITIONED_ACCELERATION_STRUCTURE_FLAGS_NV = StructureType(raw = 1000570005)
    comptime PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT = StructureType(raw = 1000572000)
    comptime PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT = StructureType(raw = 1000572001)
    comptime GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_EXT = StructureType(raw = 1000572002)
    comptime INDIRECT_EXECUTION_SET_CREATE_INFO_EXT = StructureType(raw = 1000572003)
    comptime GENERATED_COMMANDS_INFO_EXT = StructureType(raw = 1000572004)
    comptime INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_EXT = StructureType(raw = 1000572006)
    comptime INDIRECT_COMMANDS_LAYOUT_TOKEN_EXT = StructureType(raw = 1000572007)
    comptime WRITE_INDIRECT_EXECUTION_SET_PIPELINE_EXT = StructureType(raw = 1000572008)
    comptime WRITE_INDIRECT_EXECUTION_SET_SHADER_EXT = StructureType(raw = 1000572009)
    comptime INDIRECT_EXECUTION_SET_PIPELINE_INFO_EXT = StructureType(raw = 1000572010)
    comptime INDIRECT_EXECUTION_SET_SHADER_INFO_EXT = StructureType(raw = 1000572011)
    comptime INDIRECT_EXECUTION_SET_SHADER_LAYOUT_INFO_EXT = StructureType(raw = 1000572012)
    comptime GENERATED_COMMANDS_PIPELINE_INFO_EXT = StructureType(raw = 1000572013)
    comptime GENERATED_COMMANDS_SHADER_INFO_EXT = StructureType(raw = 1000572014)
    comptime PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR = StructureType(raw = 1000574000)
    comptime MEMORY_BARRIER_ACCESS_FLAGS_3_KHR = StructureType(raw = 1000574002)
    comptime PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA = StructureType(raw = 1000575000)
    comptime PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA = StructureType(raw = 1000575001)
    comptime IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA = StructureType(raw = 1000575002)
    comptime PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT = StructureType(raw = 1000582000)
    comptime PIPELINE_VIEWPORT_DEPTH_CLAMP_CONTROL_CREATE_INFO_EXT = StructureType(raw = 1000582001)
    comptime PHYSICAL_DEVICE_MAINTENANCE_9_FEATURES_KHR = StructureType(raw = 1000584000)
    comptime PHYSICAL_DEVICE_MAINTENANCE_9_PROPERTIES_KHR = StructureType(raw = 1000584001)
    comptime QUEUE_FAMILY_OWNERSHIP_TRANSFER_PROPERTIES_KHR = StructureType(raw = 1000584002)
    comptime PHYSICAL_DEVICE_VIDEO_MAINTENANCE_2_FEATURES_KHR = StructureType(raw = 1000586000)
    comptime VIDEO_DECODE_H264_INLINE_SESSION_PARAMETERS_INFO_KHR = StructureType(raw = 1000586001)
    comptime VIDEO_DECODE_H265_INLINE_SESSION_PARAMETERS_INFO_KHR = StructureType(raw = 1000586002)
    comptime VIDEO_DECODE_AV1_INLINE_SESSION_PARAMETERS_INFO_KHR = StructureType(raw = 1000586003)
    comptime SURFACE_CREATE_INFO_OHOS = StructureType(raw = 1000685000)
    comptime PHYSICAL_DEVICE_HDR_VIVID_FEATURES_HUAWEI = StructureType(raw = 1000590000)
    comptime HDR_VIVID_DYNAMIC_METADATA_HUAWEI = StructureType(raw = 1000590001)
    comptime PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_FEATURES_NV = StructureType(raw = 1000593000)
    comptime COOPERATIVE_MATRIX_FLEXIBLE_DIMENSIONS_PROPERTIES_NV = StructureType(raw = 1000593001)
    comptime PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_PROPERTIES_NV = StructureType(raw = 1000593002)
    comptime PHYSICAL_DEVICE_PIPELINE_OPACITY_MICROMAP_FEATURES_ARM = StructureType(raw = 1000596000)
    comptime IMPORT_MEMORY_METAL_HANDLE_INFO_EXT = StructureType(raw = 1000602000)
    comptime MEMORY_METAL_HANDLE_PROPERTIES_EXT = StructureType(raw = 1000602001)
    comptime MEMORY_GET_METAL_HANDLE_INFO_EXT = StructureType(raw = 1000602002)
    comptime PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_KHR = StructureType(raw = 1000421000)
    comptime PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT = StructureType(raw = 1000608000)
    comptime PHYSICAL_DEVICE_FORMAT_PACK_FEATURES_ARM = StructureType(raw = 1000609000)
    comptime PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_LAYERED_FEATURES_VALVE = StructureType(raw = 1000611000)
    comptime PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_LAYERED_PROPERTIES_VALVE = StructureType(raw = 1000611001)
    comptime PIPELINE_FRAGMENT_DENSITY_MAP_LAYERED_CREATE_INFO_VALVE = StructureType(raw = 1000611002)
    comptime PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_KHR = StructureType(raw = 1000286000)
    comptime PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_KHR = StructureType(raw = 1000286001)
    comptime SET_PRESENT_CONFIG_NV = StructureType(raw = 1000613000)
    comptime PHYSICAL_DEVICE_PRESENT_METERING_FEATURES_NV = StructureType(raw = 1000613001)
    comptime PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_FEATURES_EXT = StructureType(raw = 1000425000)
    comptime PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_PROPERTIES_EXT = StructureType(raw = 1000425001)
    comptime RENDER_PASS_FRAGMENT_DENSITY_MAP_OFFSET_END_INFO_EXT = StructureType(raw = 1000425002)
    comptime RENDERING_END_INFO_EXT = StructureType(raw = 1000619003)
    comptime PHYSICAL_DEVICE_ZERO_INITIALIZE_DEVICE_MEMORY_FEATURES_EXT = StructureType(raw = 1000620000)
    comptime PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_KHR = StructureType(raw = 1000361000)
    comptime PHYSICAL_DEVICE_PIPELINE_CACHE_INCREMENTAL_MODE_FEATURES_SEC = StructureType(raw = 1000637000)


@register_passable("trivial")
struct SubpassContents(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime INLINE = SubpassContents(raw = 0)
    comptime SECONDARY_COMMAND_BUFFERS = SubpassContents(raw = 1)
    comptime INLINE_AND_SECONDARY_COMMAND_BUFFERS_KHR = SubpassContents(raw = 1000451000)


@register_passable("trivial")
struct Result(Equatable, Writable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn is_error(self) -> Bool:
        return self.raw() < 0

    fn raise_on_error(self) raises:
        if self.is_error():
            raise String(self)

    fn __str__(self) -> String:
        return String.write(self)

    fn write_to[W: Writer](self, mut writer: W):
        writer.write(self.raw())

    comptime SUCCESS = Result(raw = 0)
    comptime NOT_READY = Result(raw = 1)
    comptime TIMEOUT = Result(raw = 2)
    comptime EVENT_SET = Result(raw = 3)
    comptime EVENT_RESET = Result(raw = 4)
    comptime INCOMPLETE = Result(raw = 5)
    comptime ERROR_OUT_OF_HOST_MEMORY = Result(raw = -1)
    comptime ERROR_OUT_OF_DEVICE_MEMORY = Result(raw = -2)
    comptime ERROR_INITIALIZATION_FAILED = Result(raw = -3)
    comptime ERROR_DEVICE_LOST = Result(raw = -4)
    comptime ERROR_MEMORY_MAP_FAILED = Result(raw = -5)
    comptime ERROR_LAYER_NOT_PRESENT = Result(raw = -6)
    comptime ERROR_EXTENSION_NOT_PRESENT = Result(raw = -7)
    comptime ERROR_FEATURE_NOT_PRESENT = Result(raw = -8)
    comptime ERROR_INCOMPATIBLE_DRIVER = Result(raw = -9)
    comptime ERROR_TOO_MANY_OBJECTS = Result(raw = -10)
    comptime ERROR_FORMAT_NOT_SUPPORTED = Result(raw = -11)
    comptime ERROR_FRAGMENTED_POOL = Result(raw = -12)
    comptime ERROR_UNKNOWN = Result(raw = -13)
    comptime ERROR_VALIDATION_FAILED = Result(raw = -1000011001)
    comptime ERROR_OUT_OF_POOL_MEMORY = Result(raw = -1000069000)
    comptime ERROR_INVALID_EXTERNAL_HANDLE = Result(raw = -1000072003)
    comptime ERROR_FRAGMENTATION = Result(raw = -1000161000)
    comptime ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS = Result(raw = -1000257000)
    comptime PIPELINE_COMPILE_REQUIRED = Result(raw = 1000297000)
    comptime ERROR_NOT_PERMITTED = Result(raw = -1000174001)
    comptime ERROR_INVALID_PIPELINE_CACHE_DATA = Result(raw = -1000298000)
    comptime ERROR_NO_PIPELINE_MATCH = Result(raw = -1000298001)
    comptime ERROR_SURFACE_LOST_KHR = Result(raw = -1000000000)
    comptime ERROR_NATIVE_WINDOW_IN_USE_KHR = Result(raw = -1000000001)
    comptime SUBOPTIMAL_KHR = Result(raw = 1000001003)
    comptime ERROR_OUT_OF_DATE_KHR = Result(raw = -1000001004)
    comptime ERROR_INCOMPATIBLE_DISPLAY_KHR = Result(raw = -1000003001)
    comptime ERROR_INVALID_SHADER_NV = Result(raw = -1000012000)
    comptime ERROR_IMAGE_USAGE_NOT_SUPPORTED_KHR = Result(raw = -1000023000)
    comptime ERROR_VIDEO_PICTURE_LAYOUT_NOT_SUPPORTED_KHR = Result(raw = -1000023001)
    comptime ERROR_VIDEO_PROFILE_OPERATION_NOT_SUPPORTED_KHR = Result(raw = -1000023002)
    comptime ERROR_VIDEO_PROFILE_FORMAT_NOT_SUPPORTED_KHR = Result(raw = -1000023003)
    comptime ERROR_VIDEO_PROFILE_CODEC_NOT_SUPPORTED_KHR = Result(raw = -1000023004)
    comptime ERROR_VIDEO_STD_VERSION_NOT_SUPPORTED_KHR = Result(raw = -1000023005)
    comptime ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT = Result(raw = -1000158000)
    comptime ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT = Result(raw = -1000255000)
    comptime THREAD_IDLE_KHR = Result(raw = 1000268000)
    comptime THREAD_DONE_KHR = Result(raw = 1000268001)
    comptime OPERATION_DEFERRED_KHR = Result(raw = 1000268002)
    comptime OPERATION_NOT_DEFERRED_KHR = Result(raw = 1000268003)
    comptime ERROR_INVALID_VIDEO_STD_PARAMETERS_KHR = Result(raw = -1000299000)
    comptime ERROR_COMPRESSION_EXHAUSTED_EXT = Result(raw = -1000338000)
    comptime INCOMPATIBLE_SHADER_BINARY_EXT = Result(raw = 1000482000)
    comptime PIPELINE_BINARY_MISSING_KHR = Result(raw = 1000483000)
    comptime ERROR_NOT_ENOUGH_SPACE_KHR = Result(raw = -1000483000)


@register_passable("trivial")
struct DynamicState(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime VIEWPORT = DynamicState(raw = 0)
    comptime SCISSOR = DynamicState(raw = 1)
    comptime LINE_WIDTH = DynamicState(raw = 2)
    comptime DEPTH_BIAS = DynamicState(raw = 3)
    comptime BLEND_CONSTANTS = DynamicState(raw = 4)
    comptime DEPTH_BOUNDS = DynamicState(raw = 5)
    comptime STENCIL_COMPARE_MASK = DynamicState(raw = 6)
    comptime STENCIL_WRITE_MASK = DynamicState(raw = 7)
    comptime STENCIL_REFERENCE = DynamicState(raw = 8)
    comptime CULL_MODE = DynamicState(raw = 1000267000)
    comptime FRONT_FACE = DynamicState(raw = 1000267001)
    comptime PRIMITIVE_TOPOLOGY = DynamicState(raw = 1000267002)
    comptime VIEWPORT_WITH_COUNT = DynamicState(raw = 1000267003)
    comptime SCISSOR_WITH_COUNT = DynamicState(raw = 1000267004)
    comptime VERTEX_INPUT_BINDING_STRIDE = DynamicState(raw = 1000267005)
    comptime DEPTH_TEST_ENABLE = DynamicState(raw = 1000267006)
    comptime DEPTH_WRITE_ENABLE = DynamicState(raw = 1000267007)
    comptime DEPTH_COMPARE_OP = DynamicState(raw = 1000267008)
    comptime DEPTH_BOUNDS_TEST_ENABLE = DynamicState(raw = 1000267009)
    comptime STENCIL_TEST_ENABLE = DynamicState(raw = 1000267010)
    comptime STENCIL_OP = DynamicState(raw = 1000267011)
    comptime RASTERIZER_DISCARD_ENABLE = DynamicState(raw = 1000377001)
    comptime DEPTH_BIAS_ENABLE = DynamicState(raw = 1000377002)
    comptime PRIMITIVE_RESTART_ENABLE = DynamicState(raw = 1000377004)
    comptime LINE_STIPPLE = DynamicState(raw = 1000259000)
    comptime VIEWPORT_W_SCALING_NV = DynamicState(raw = 1000087000)
    comptime DISCARD_RECTANGLE_EXT = DynamicState(raw = 1000099000)
    comptime DISCARD_RECTANGLE_ENABLE_EXT = DynamicState(raw = 1000099001)
    comptime DISCARD_RECTANGLE_MODE_EXT = DynamicState(raw = 1000099002)
    comptime SAMPLE_LOCATIONS_EXT = DynamicState(raw = 1000143000)
    comptime RAY_TRACING_PIPELINE_STACK_SIZE_KHR = DynamicState(raw = 1000347000)
    comptime VIEWPORT_SHADING_RATE_PALETTE_NV = DynamicState(raw = 1000164004)
    comptime VIEWPORT_COARSE_SAMPLE_ORDER_NV = DynamicState(raw = 1000164006)
    comptime EXCLUSIVE_SCISSOR_ENABLE_NV = DynamicState(raw = 1000205000)
    comptime EXCLUSIVE_SCISSOR_NV = DynamicState(raw = 1000205001)
    comptime FRAGMENT_SHADING_RATE_KHR = DynamicState(raw = 1000226000)
    comptime VERTEX_INPUT_EXT = DynamicState(raw = 1000352000)
    comptime PATCH_CONTROL_POINTS_EXT = DynamicState(raw = 1000377000)
    comptime LOGIC_OP_EXT = DynamicState(raw = 1000377003)
    comptime COLOR_WRITE_ENABLE_EXT = DynamicState(raw = 1000381000)
    comptime DEPTH_CLAMP_ENABLE_EXT = DynamicState(raw = 1000455003)
    comptime POLYGON_MODE_EXT = DynamicState(raw = 1000455004)
    comptime RASTERIZATION_SAMPLES_EXT = DynamicState(raw = 1000455005)
    comptime SAMPLE_MASK_EXT = DynamicState(raw = 1000455006)
    comptime ALPHA_TO_COVERAGE_ENABLE_EXT = DynamicState(raw = 1000455007)
    comptime ALPHA_TO_ONE_ENABLE_EXT = DynamicState(raw = 1000455008)
    comptime LOGIC_OP_ENABLE_EXT = DynamicState(raw = 1000455009)
    comptime COLOR_BLEND_ENABLE_EXT = DynamicState(raw = 1000455010)
    comptime COLOR_BLEND_EQUATION_EXT = DynamicState(raw = 1000455011)
    comptime COLOR_WRITE_MASK_EXT = DynamicState(raw = 1000455012)
    comptime TESSELLATION_DOMAIN_ORIGIN_EXT = DynamicState(raw = 1000455002)
    comptime RASTERIZATION_STREAM_EXT = DynamicState(raw = 1000455013)
    comptime CONSERVATIVE_RASTERIZATION_MODE_EXT = DynamicState(raw = 1000455014)
    comptime EXTRA_PRIMITIVE_OVERESTIMATION_SIZE_EXT = DynamicState(raw = 1000455015)
    comptime DEPTH_CLIP_ENABLE_EXT = DynamicState(raw = 1000455016)
    comptime SAMPLE_LOCATIONS_ENABLE_EXT = DynamicState(raw = 1000455017)
    comptime COLOR_BLEND_ADVANCED_EXT = DynamicState(raw = 1000455018)
    comptime PROVOKING_VERTEX_MODE_EXT = DynamicState(raw = 1000455019)
    comptime LINE_RASTERIZATION_MODE_EXT = DynamicState(raw = 1000455020)
    comptime LINE_STIPPLE_ENABLE_EXT = DynamicState(raw = 1000455021)
    comptime DEPTH_CLIP_NEGATIVE_ONE_TO_ONE_EXT = DynamicState(raw = 1000455022)
    comptime VIEWPORT_W_SCALING_ENABLE_NV = DynamicState(raw = 1000455023)
    comptime VIEWPORT_SWIZZLE_NV = DynamicState(raw = 1000455024)
    comptime COVERAGE_TO_COLOR_ENABLE_NV = DynamicState(raw = 1000455025)
    comptime COVERAGE_TO_COLOR_LOCATION_NV = DynamicState(raw = 1000455026)
    comptime COVERAGE_MODULATION_MODE_NV = DynamicState(raw = 1000455027)
    comptime COVERAGE_MODULATION_TABLE_ENABLE_NV = DynamicState(raw = 1000455028)
    comptime COVERAGE_MODULATION_TABLE_NV = DynamicState(raw = 1000455029)
    comptime SHADING_RATE_IMAGE_ENABLE_NV = DynamicState(raw = 1000455030)
    comptime REPRESENTATIVE_FRAGMENT_TEST_ENABLE_NV = DynamicState(raw = 1000455031)
    comptime COVERAGE_REDUCTION_MODE_NV = DynamicState(raw = 1000455032)
    comptime ATTACHMENT_FEEDBACK_LOOP_ENABLE_EXT = DynamicState(raw = 1000524000)
    comptime DEPTH_CLAMP_RANGE_EXT = DynamicState(raw = 1000582000)


@register_passable("trivial")
struct DescriptorUpdateTemplateType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DESCRIPTOR_SET = DescriptorUpdateTemplateType(raw = 0)
    comptime PUSH_DESCRIPTORS = DescriptorUpdateTemplateType(raw = 1)


@register_passable("trivial")
struct ObjectType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UNKNOWN = ObjectType(raw = 0)
    comptime INSTANCE = ObjectType(raw = 1)
    comptime PHYSICAL_DEVICE = ObjectType(raw = 2)
    comptime DEVICE = ObjectType(raw = 3)
    comptime QUEUE = ObjectType(raw = 4)
    comptime SEMAPHORE = ObjectType(raw = 5)
    comptime COMMAND_BUFFER = ObjectType(raw = 6)
    comptime FENCE = ObjectType(raw = 7)
    comptime DEVICE_MEMORY = ObjectType(raw = 8)
    comptime BUFFER = ObjectType(raw = 9)
    comptime IMAGE = ObjectType(raw = 10)
    comptime EVENT = ObjectType(raw = 11)
    comptime QUERY_POOL = ObjectType(raw = 12)
    comptime BUFFER_VIEW = ObjectType(raw = 13)
    comptime IMAGE_VIEW = ObjectType(raw = 14)
    comptime SHADER_MODULE = ObjectType(raw = 15)
    comptime PIPELINE_CACHE = ObjectType(raw = 16)
    comptime PIPELINE_LAYOUT = ObjectType(raw = 17)
    comptime RENDER_PASS = ObjectType(raw = 18)
    comptime PIPELINE = ObjectType(raw = 19)
    comptime DESCRIPTOR_SET_LAYOUT = ObjectType(raw = 20)
    comptime SAMPLER = ObjectType(raw = 21)
    comptime DESCRIPTOR_POOL = ObjectType(raw = 22)
    comptime DESCRIPTOR_SET = ObjectType(raw = 23)
    comptime FRAMEBUFFER = ObjectType(raw = 24)
    comptime COMMAND_POOL = ObjectType(raw = 25)
    comptime SAMPLER_YCBCR_CONVERSION = ObjectType(raw = 1000156000)
    comptime DESCRIPTOR_UPDATE_TEMPLATE = ObjectType(raw = 1000085000)
    comptime PRIVATE_DATA_SLOT = ObjectType(raw = 1000295000)
    comptime SURFACE_KHR = ObjectType(raw = 1000000000)
    comptime SWAPCHAIN_KHR = ObjectType(raw = 1000001000)
    comptime DISPLAY_KHR = ObjectType(raw = 1000002000)
    comptime DISPLAY_MODE_KHR = ObjectType(raw = 1000002001)
    comptime DEBUG_REPORT_CALLBACK_EXT = ObjectType(raw = 1000011000)
    comptime VIDEO_SESSION_KHR = ObjectType(raw = 1000023000)
    comptime VIDEO_SESSION_PARAMETERS_KHR = ObjectType(raw = 1000023001)
    comptime CU_MODULE_NVX = ObjectType(raw = 1000029000)
    comptime CU_FUNCTION_NVX = ObjectType(raw = 1000029001)
    comptime DEBUG_UTILS_MESSENGER_EXT = ObjectType(raw = 1000128000)
    comptime ACCELERATION_STRUCTURE_KHR = ObjectType(raw = 1000150000)
    comptime VALIDATION_CACHE_EXT = ObjectType(raw = 1000160000)
    comptime ACCELERATION_STRUCTURE_NV = ObjectType(raw = 1000165000)
    comptime PERFORMANCE_CONFIGURATION_INTEL = ObjectType(raw = 1000210000)
    comptime DEFERRED_OPERATION_KHR = ObjectType(raw = 1000268000)
    comptime INDIRECT_COMMANDS_LAYOUT_NV = ObjectType(raw = 1000277000)
    comptime CUDA_MODULE_NV = ObjectType(raw = 1000307000)
    comptime CUDA_FUNCTION_NV = ObjectType(raw = 1000307001)
    comptime BUFFER_COLLECTION_FUCHSIA = ObjectType(raw = 1000366000)
    comptime MICROMAP_EXT = ObjectType(raw = 1000396000)
    comptime TENSOR_ARM = ObjectType(raw = 1000460000)
    comptime TENSOR_VIEW_ARM = ObjectType(raw = 1000460001)
    comptime OPTICAL_FLOW_SESSION_NV = ObjectType(raw = 1000464000)
    comptime SHADER_EXT = ObjectType(raw = 1000482000)
    comptime PIPELINE_BINARY_KHR = ObjectType(raw = 1000483000)
    comptime SEMAPHORE_SCI_SYNC_POOL_NV = ObjectType(raw = 1000489000)
    comptime DATA_GRAPH_PIPELINE_SESSION_ARM = ObjectType(raw = 1000507000)
    comptime EXTERNAL_COMPUTE_QUEUE_NV = ObjectType(raw = 1000556000)
    comptime INDIRECT_COMMANDS_LAYOUT_EXT = ObjectType(raw = 1000572000)
    comptime INDIRECT_EXECUTION_SET_EXT = ObjectType(raw = 1000572001)


@register_passable("trivial")
struct RayTracingInvocationReorderModeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NONE_NV = RayTracingInvocationReorderModeNV(raw = 0)
    comptime REORDER_NV = RayTracingInvocationReorderModeNV(raw = 1)


@register_passable("trivial")
struct RayTracingLssIndexingModeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime LIST_NV = RayTracingLssIndexingModeNV(raw = 0)
    comptime SUCCESSIVE_NV = RayTracingLssIndexingModeNV(raw = 1)


@register_passable("trivial")
struct RayTracingLssPrimitiveEndCapsModeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NONE_NV = RayTracingLssPrimitiveEndCapsModeNV(raw = 0)
    comptime CHAINED_NV = RayTracingLssPrimitiveEndCapsModeNV(raw = 1)


@register_passable("trivial")
struct DirectDriverLoadingModeLUNARG(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime EXCLUSIVE_LUNARG = DirectDriverLoadingModeLUNARG(raw = 0)
    comptime INCLUSIVE_LUNARG = DirectDriverLoadingModeLUNARG(raw = 1)


@register_passable("trivial")
struct AntiLagModeAMD(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DRIVER_CONTROL_AMD = AntiLagModeAMD(raw = 0)
    comptime ON_AMD = AntiLagModeAMD(raw = 1)
    comptime OFF_AMD = AntiLagModeAMD(raw = 2)


@register_passable("trivial")
struct AntiLagStageAMD(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime INPUT_AMD = AntiLagStageAMD(raw = 0)
    comptime PRESENT_AMD = AntiLagStageAMD(raw = 1)


@register_passable("trivial")
struct SemaphoreType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime BINARY = SemaphoreType(raw = 0)
    comptime TIMELINE = SemaphoreType(raw = 1)


@register_passable("trivial")
struct PresentModeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime IMMEDIATE_KHR = PresentModeKHR(raw = 0)
    comptime MAILBOX_KHR = PresentModeKHR(raw = 1)
    comptime FIFO_KHR = PresentModeKHR(raw = 2)
    comptime FIFO_RELAXED_KHR = PresentModeKHR(raw = 3)
    comptime SHARED_DEMAND_REFRESH_KHR = PresentModeKHR(raw = 1000111000)
    comptime SHARED_CONTINUOUS_REFRESH_KHR = PresentModeKHR(raw = 1000111001)
    comptime FIFO_LATEST_READY_KHR = PresentModeKHR(raw = 1000361000)


@register_passable("trivial")
struct ColorSpaceKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime SRGB_NONLINEAR_KHR = ColorSpaceKHR(raw = 0)
    comptime DISPLAY_P3_NONLINEAR_EXT = ColorSpaceKHR(raw = 1000104001)
    comptime EXTENDED_SRGB_LINEAR_EXT = ColorSpaceKHR(raw = 1000104002)
    comptime DISPLAY_P3_LINEAR_EXT = ColorSpaceKHR(raw = 1000104003)
    comptime DCI_P3_NONLINEAR_EXT = ColorSpaceKHR(raw = 1000104004)
    comptime BT709_LINEAR_EXT = ColorSpaceKHR(raw = 1000104005)
    comptime BT709_NONLINEAR_EXT = ColorSpaceKHR(raw = 1000104006)
    comptime BT2020_LINEAR_EXT = ColorSpaceKHR(raw = 1000104007)
    comptime HDR10_ST2084_EXT = ColorSpaceKHR(raw = 1000104008)
    comptime DOLBYVISION_EXT = ColorSpaceKHR(raw = 1000104009)
    comptime HDR10_HLG_EXT = ColorSpaceKHR(raw = 1000104010)
    comptime ADOBERGB_LINEAR_EXT = ColorSpaceKHR(raw = 1000104011)
    comptime ADOBERGB_NONLINEAR_EXT = ColorSpaceKHR(raw = 1000104012)
    comptime PASS_THROUGH_EXT = ColorSpaceKHR(raw = 1000104013)
    comptime EXTENDED_SRGB_NONLINEAR_EXT = ColorSpaceKHR(raw = 1000104014)
    comptime DISPLAY_NATIVE_AMD = ColorSpaceKHR(raw = 1000213000)


@register_passable("trivial")
struct DisplaySurfaceStereoTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NONE_NV = DisplaySurfaceStereoTypeNV(raw = 0)
    comptime ONBOARD_DIN_NV = DisplaySurfaceStereoTypeNV(raw = 1)
    comptime HDMI_3D_NV = DisplaySurfaceStereoTypeNV(raw = 2)
    comptime INBAND_DISPLAYPORT_NV = DisplaySurfaceStereoTypeNV(raw = 3)


@register_passable("trivial")
struct TimeDomainKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DEVICE_KHR = TimeDomainKHR(raw = 0)
    comptime CLOCK_MONOTONIC_KHR = TimeDomainKHR(raw = 1)
    comptime CLOCK_MONOTONIC_RAW_KHR = TimeDomainKHR(raw = 2)
    comptime QUERY_PERFORMANCE_COUNTER_KHR = TimeDomainKHR(raw = 3)


@register_passable("trivial")
struct DebugReportObjectTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UNKNOWN_EXT = DebugReportObjectTypeEXT(raw = 0)
    comptime INSTANCE_EXT = DebugReportObjectTypeEXT(raw = 1)
    comptime PHYSICAL_DEVICE_EXT = DebugReportObjectTypeEXT(raw = 2)
    comptime DEVICE_EXT = DebugReportObjectTypeEXT(raw = 3)
    comptime QUEUE_EXT = DebugReportObjectTypeEXT(raw = 4)
    comptime SEMAPHORE_EXT = DebugReportObjectTypeEXT(raw = 5)
    comptime COMMAND_BUFFER_EXT = DebugReportObjectTypeEXT(raw = 6)
    comptime FENCE_EXT = DebugReportObjectTypeEXT(raw = 7)
    comptime DEVICE_MEMORY_EXT = DebugReportObjectTypeEXT(raw = 8)
    comptime BUFFER_EXT = DebugReportObjectTypeEXT(raw = 9)
    comptime IMAGE_EXT = DebugReportObjectTypeEXT(raw = 10)
    comptime EVENT_EXT = DebugReportObjectTypeEXT(raw = 11)
    comptime QUERY_POOL_EXT = DebugReportObjectTypeEXT(raw = 12)
    comptime BUFFER_VIEW_EXT = DebugReportObjectTypeEXT(raw = 13)
    comptime IMAGE_VIEW_EXT = DebugReportObjectTypeEXT(raw = 14)
    comptime SHADER_MODULE_EXT = DebugReportObjectTypeEXT(raw = 15)
    comptime PIPELINE_CACHE_EXT = DebugReportObjectTypeEXT(raw = 16)
    comptime PIPELINE_LAYOUT_EXT = DebugReportObjectTypeEXT(raw = 17)
    comptime RENDER_PASS_EXT = DebugReportObjectTypeEXT(raw = 18)
    comptime PIPELINE_EXT = DebugReportObjectTypeEXT(raw = 19)
    comptime DESCRIPTOR_SET_LAYOUT_EXT = DebugReportObjectTypeEXT(raw = 20)
    comptime SAMPLER_EXT = DebugReportObjectTypeEXT(raw = 21)
    comptime DESCRIPTOR_POOL_EXT = DebugReportObjectTypeEXT(raw = 22)
    comptime DESCRIPTOR_SET_EXT = DebugReportObjectTypeEXT(raw = 23)
    comptime FRAMEBUFFER_EXT = DebugReportObjectTypeEXT(raw = 24)
    comptime COMMAND_POOL_EXT = DebugReportObjectTypeEXT(raw = 25)
    comptime SURFACE_KHR_EXT = DebugReportObjectTypeEXT(raw = 26)
    comptime SWAPCHAIN_KHR_EXT = DebugReportObjectTypeEXT(raw = 27)
    comptime DEBUG_REPORT_CALLBACK_EXT_EXT = DebugReportObjectTypeEXT(raw = 28)
    comptime DISPLAY_KHR_EXT = DebugReportObjectTypeEXT(raw = 29)
    comptime DISPLAY_MODE_KHR_EXT = DebugReportObjectTypeEXT(raw = 30)
    comptime VALIDATION_CACHE_EXT_EXT = DebugReportObjectTypeEXT(raw = 33)
    comptime SAMPLER_YCBCR_CONVERSION_EXT = DebugReportObjectTypeEXT(raw = 1000156000)
    comptime DESCRIPTOR_UPDATE_TEMPLATE_EXT = DebugReportObjectTypeEXT(raw = 1000085000)
    comptime CU_MODULE_NVX_EXT = DebugReportObjectTypeEXT(raw = 1000029000)
    comptime CU_FUNCTION_NVX_EXT = DebugReportObjectTypeEXT(raw = 1000029001)
    comptime ACCELERATION_STRUCTURE_KHR_EXT = DebugReportObjectTypeEXT(raw = 1000150000)
    comptime ACCELERATION_STRUCTURE_NV_EXT = DebugReportObjectTypeEXT(raw = 1000165000)
    comptime CUDA_MODULE_NV_EXT = DebugReportObjectTypeEXT(raw = 1000307000)
    comptime CUDA_FUNCTION_NV_EXT = DebugReportObjectTypeEXT(raw = 1000307001)
    comptime BUFFER_COLLECTION_FUCHSIA_EXT = DebugReportObjectTypeEXT(raw = 1000366000)


@register_passable("trivial")
struct DeviceMemoryReportEventTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ALLOCATE_EXT = DeviceMemoryReportEventTypeEXT(raw = 0)
    comptime FREE_EXT = DeviceMemoryReportEventTypeEXT(raw = 1)
    comptime IMPORT_EXT = DeviceMemoryReportEventTypeEXT(raw = 2)
    comptime UNIMPORT_EXT = DeviceMemoryReportEventTypeEXT(raw = 3)
    comptime ALLOCATION_FAILED_EXT = DeviceMemoryReportEventTypeEXT(raw = 4)


@register_passable("trivial")
struct RasterizationOrderAMD(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime STRICT_AMD = RasterizationOrderAMD(raw = 0)
    comptime RELAXED_AMD = RasterizationOrderAMD(raw = 1)


@register_passable("trivial")
struct ClusterAccelerationStructureTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime CLUSTERS_BOTTOM_LEVEL_NV = ClusterAccelerationStructureTypeNV(raw = 0)
    comptime TRIANGLE_CLUSTER_NV = ClusterAccelerationStructureTypeNV(raw = 1)
    comptime TRIANGLE_CLUSTER_TEMPLATE_NV = ClusterAccelerationStructureTypeNV(raw = 2)


@register_passable("trivial")
struct ClusterAccelerationStructureOpTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime MOVE_OBJECTS_NV = ClusterAccelerationStructureOpTypeNV(raw = 0)
    comptime BUILD_CLUSTERS_BOTTOM_LEVEL_NV = ClusterAccelerationStructureOpTypeNV(raw = 1)
    comptime BUILD_TRIANGLE_CLUSTER_NV = ClusterAccelerationStructureOpTypeNV(raw = 2)
    comptime BUILD_TRIANGLE_CLUSTER_TEMPLATE_NV = ClusterAccelerationStructureOpTypeNV(raw = 3)
    comptime INSTANTIATE_TRIANGLE_CLUSTER_NV = ClusterAccelerationStructureOpTypeNV(raw = 4)
    comptime GET_CLUSTER_TEMPLATE_INDICES_NV = ClusterAccelerationStructureOpTypeNV(raw = 5)


@register_passable("trivial")
struct ClusterAccelerationStructureOpModeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime IMPLICIT_DESTINATIONS_NV = ClusterAccelerationStructureOpModeNV(raw = 0)
    comptime EXPLICIT_DESTINATIONS_NV = ClusterAccelerationStructureOpModeNV(raw = 1)
    comptime COMPUTE_SIZES_NV = ClusterAccelerationStructureOpModeNV(raw = 2)


@register_passable("trivial")
struct ValidationCheckEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ALL_EXT = ValidationCheckEXT(raw = 0)
    comptime SHADERS_EXT = ValidationCheckEXT(raw = 1)


@register_passable("trivial")
struct ValidationFeatureEnableEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime GPU_ASSISTED_EXT = ValidationFeatureEnableEXT(raw = 0)
    comptime GPU_ASSISTED_RESERVE_BINDING_SLOT_EXT = ValidationFeatureEnableEXT(raw = 1)
    comptime BEST_PRACTICES_EXT = ValidationFeatureEnableEXT(raw = 2)
    comptime DEBUG_PRINTF_EXT = ValidationFeatureEnableEXT(raw = 3)
    comptime SYNCHRONIZATION_VALIDATION_EXT = ValidationFeatureEnableEXT(raw = 4)


@register_passable("trivial")
struct ValidationFeatureDisableEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ALL_EXT = ValidationFeatureDisableEXT(raw = 0)
    comptime SHADERS_EXT = ValidationFeatureDisableEXT(raw = 1)
    comptime THREAD_SAFETY_EXT = ValidationFeatureDisableEXT(raw = 2)
    comptime API_PARAMETERS_EXT = ValidationFeatureDisableEXT(raw = 3)
    comptime OBJECT_LIFETIMES_EXT = ValidationFeatureDisableEXT(raw = 4)
    comptime CORE_CHECKS_EXT = ValidationFeatureDisableEXT(raw = 5)
    comptime UNIQUE_HANDLES_EXT = ValidationFeatureDisableEXT(raw = 6)
    comptime SHADER_VALIDATION_CACHE_EXT = ValidationFeatureDisableEXT(raw = 7)


@register_passable("trivial")
struct LayerSettingTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime BOOL32_EXT = LayerSettingTypeEXT(raw = 0)
    comptime INT32_EXT = LayerSettingTypeEXT(raw = 1)
    comptime INT64_EXT = LayerSettingTypeEXT(raw = 2)
    comptime UINT32_EXT = LayerSettingTypeEXT(raw = 3)
    comptime UINT64_EXT = LayerSettingTypeEXT(raw = 4)
    comptime FLOAT32_EXT = LayerSettingTypeEXT(raw = 5)
    comptime FLOAT64_EXT = LayerSettingTypeEXT(raw = 6)
    comptime STRING_EXT = LayerSettingTypeEXT(raw = 7)


@register_passable("trivial")
struct IndirectCommandsTokenTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime SHADER_GROUP_NV = IndirectCommandsTokenTypeNV(raw = 0)
    comptime STATE_FLAGS_NV = IndirectCommandsTokenTypeNV(raw = 1)
    comptime INDEX_BUFFER_NV = IndirectCommandsTokenTypeNV(raw = 2)
    comptime VERTEX_BUFFER_NV = IndirectCommandsTokenTypeNV(raw = 3)
    comptime PUSH_CONSTANT_NV = IndirectCommandsTokenTypeNV(raw = 4)
    comptime DRAW_INDEXED_NV = IndirectCommandsTokenTypeNV(raw = 5)
    comptime DRAW_NV = IndirectCommandsTokenTypeNV(raw = 6)
    comptime DRAW_TASKS_NV = IndirectCommandsTokenTypeNV(raw = 7)
    comptime DRAW_MESH_TASKS_NV = IndirectCommandsTokenTypeNV(raw = 1000328000)
    comptime PIPELINE_NV = IndirectCommandsTokenTypeNV(raw = 1000428003)
    comptime DISPATCH_NV = IndirectCommandsTokenTypeNV(raw = 1000428004)


@register_passable("trivial")
struct DisplayPowerStateEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime OFF_EXT = DisplayPowerStateEXT(raw = 0)
    comptime SUSPEND_EXT = DisplayPowerStateEXT(raw = 1)
    comptime ON_EXT = DisplayPowerStateEXT(raw = 2)


@register_passable("trivial")
struct DeviceEventTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DISPLAY_HOTPLUG_EXT = DeviceEventTypeEXT(raw = 0)


@register_passable("trivial")
struct DisplayEventTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime FIRST_PIXEL_OUT_EXT = DisplayEventTypeEXT(raw = 0)


@register_passable("trivial")
struct ViewportCoordinateSwizzleNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime POSITIVE_X_NV = ViewportCoordinateSwizzleNV(raw = 0)
    comptime NEGATIVE_X_NV = ViewportCoordinateSwizzleNV(raw = 1)
    comptime POSITIVE_Y_NV = ViewportCoordinateSwizzleNV(raw = 2)
    comptime NEGATIVE_Y_NV = ViewportCoordinateSwizzleNV(raw = 3)
    comptime POSITIVE_Z_NV = ViewportCoordinateSwizzleNV(raw = 4)
    comptime NEGATIVE_Z_NV = ViewportCoordinateSwizzleNV(raw = 5)
    comptime POSITIVE_W_NV = ViewportCoordinateSwizzleNV(raw = 6)
    comptime NEGATIVE_W_NV = ViewportCoordinateSwizzleNV(raw = 7)


@register_passable("trivial")
struct DiscardRectangleModeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime INCLUSIVE_EXT = DiscardRectangleModeEXT(raw = 0)
    comptime EXCLUSIVE_EXT = DiscardRectangleModeEXT(raw = 1)


@register_passable("trivial")
struct PointClippingBehavior(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ALL_CLIP_PLANES = PointClippingBehavior(raw = 0)
    comptime USER_CLIP_PLANES_ONLY = PointClippingBehavior(raw = 1)


@register_passable("trivial")
struct SamplerReductionMode(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime WEIGHTED_AVERAGE = SamplerReductionMode(raw = 0)
    comptime MIN = SamplerReductionMode(raw = 1)
    comptime MAX = SamplerReductionMode(raw = 2)
    comptime WEIGHTED_AVERAGE_RANGECLAMP_QCOM = SamplerReductionMode(raw = 1000521000)


@register_passable("trivial")
struct TessellationDomainOrigin(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UPPER_LEFT = TessellationDomainOrigin(raw = 0)
    comptime LOWER_LEFT = TessellationDomainOrigin(raw = 1)


@register_passable("trivial")
struct SamplerYcbcrModelConversion(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime RGB_IDENTITY = SamplerYcbcrModelConversion(raw = 0)
    comptime YCBCR_IDENTITY = SamplerYcbcrModelConversion(raw = 1)
    comptime YCBCR_709 = SamplerYcbcrModelConversion(raw = 2)
    comptime YCBCR_601 = SamplerYcbcrModelConversion(raw = 3)
    comptime YCBCR_2020 = SamplerYcbcrModelConversion(raw = 4)


@register_passable("trivial")
struct SamplerYcbcrRange(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ITU_FULL = SamplerYcbcrRange(raw = 0)
    comptime ITU_NARROW = SamplerYcbcrRange(raw = 1)


@register_passable("trivial")
struct ChromaLocation(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime COSITED_EVEN = ChromaLocation(raw = 0)
    comptime MIDPOINT = ChromaLocation(raw = 1)


@register_passable("trivial")
struct BlendOverlapEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UNCORRELATED_EXT = BlendOverlapEXT(raw = 0)
    comptime DISJOINT_EXT = BlendOverlapEXT(raw = 1)
    comptime CONJOINT_EXT = BlendOverlapEXT(raw = 2)


@register_passable("trivial")
struct CoverageModulationModeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NONE_NV = CoverageModulationModeNV(raw = 0)
    comptime RGB_NV = CoverageModulationModeNV(raw = 1)
    comptime ALPHA_NV = CoverageModulationModeNV(raw = 2)
    comptime RGBA_NV = CoverageModulationModeNV(raw = 3)


@register_passable("trivial")
struct CoverageReductionModeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime MERGE_NV = CoverageReductionModeNV(raw = 0)
    comptime TRUNCATE_NV = CoverageReductionModeNV(raw = 1)


@register_passable("trivial")
struct ValidationCacheHeaderVersionEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ONE_EXT = ValidationCacheHeaderVersionEXT(raw = 1)


@register_passable("trivial")
struct ShaderInfoTypeAMD(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime STATISTICS_AMD = ShaderInfoTypeAMD(raw = 0)
    comptime BINARY_AMD = ShaderInfoTypeAMD(raw = 1)
    comptime DISASSEMBLY_AMD = ShaderInfoTypeAMD(raw = 2)


@register_passable("trivial")
struct QueueGlobalPriority(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime LOW = QueueGlobalPriority(raw = 128)
    comptime MEDIUM = QueueGlobalPriority(raw = 256)
    comptime HIGH = QueueGlobalPriority(raw = 512)
    comptime REALTIME = QueueGlobalPriority(raw = 1024)


@register_passable("trivial")
struct ConservativeRasterizationModeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DISABLED_EXT = ConservativeRasterizationModeEXT(raw = 0)
    comptime OVERESTIMATE_EXT = ConservativeRasterizationModeEXT(raw = 1)
    comptime UNDERESTIMATE_EXT = ConservativeRasterizationModeEXT(raw = 2)


@register_passable("trivial")
struct VendorId(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime KHRONOS = VendorId(raw = 65536)
    comptime VIV = VendorId(raw = 65537)
    comptime VSI = VendorId(raw = 65538)
    comptime KAZAN = VendorId(raw = 65539)
    comptime CODEPLAY = VendorId(raw = 65540)
    comptime MESA = VendorId(raw = 65541)
    comptime POCL = VendorId(raw = 65542)
    comptime MOBILEYE = VendorId(raw = 65543)


@register_passable("trivial")
struct DriverId(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime AMD_PROPRIETARY = DriverId(raw = 1)
    comptime AMD_OPEN_SOURCE = DriverId(raw = 2)
    comptime MESA_RADV = DriverId(raw = 3)
    comptime NVIDIA_PROPRIETARY = DriverId(raw = 4)
    comptime INTEL_PROPRIETARY_WINDOWS = DriverId(raw = 5)
    comptime INTEL_OPEN_SOURCE_MESA = DriverId(raw = 6)
    comptime IMAGINATION_PROPRIETARY = DriverId(raw = 7)
    comptime QUALCOMM_PROPRIETARY = DriverId(raw = 8)
    comptime ARM_PROPRIETARY = DriverId(raw = 9)
    comptime GOOGLE_SWIFTSHADER = DriverId(raw = 10)
    comptime GGP_PROPRIETARY = DriverId(raw = 11)
    comptime BROADCOM_PROPRIETARY = DriverId(raw = 12)
    comptime MESA_LLVMPIPE = DriverId(raw = 13)
    comptime MOLTENVK = DriverId(raw = 14)
    comptime COREAVI_PROPRIETARY = DriverId(raw = 15)
    comptime JUICE_PROPRIETARY = DriverId(raw = 16)
    comptime VERISILICON_PROPRIETARY = DriverId(raw = 17)
    comptime MESA_TURNIP = DriverId(raw = 18)
    comptime MESA_V3DV = DriverId(raw = 19)
    comptime MESA_PANVK = DriverId(raw = 20)
    comptime SAMSUNG_PROPRIETARY = DriverId(raw = 21)
    comptime MESA_VENUS = DriverId(raw = 22)
    comptime MESA_DOZEN = DriverId(raw = 23)
    comptime MESA_NVK = DriverId(raw = 24)
    comptime IMAGINATION_OPEN_SOURCE_MESA = DriverId(raw = 25)
    comptime MESA_HONEYKRISP = DriverId(raw = 26)
    comptime VULKAN_SC_EMULATION_ON_VULKAN = DriverId(raw = 27)


@register_passable("trivial")
struct ShadingRatePaletteEntryNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NO_INVOCATIONS_NV = ShadingRatePaletteEntryNV(raw = 0)
    comptime N_16_INVOCATIONS_PER_PIXEL_NV = ShadingRatePaletteEntryNV(raw = 1)
    comptime N_8_INVOCATIONS_PER_PIXEL_NV = ShadingRatePaletteEntryNV(raw = 2)
    comptime N_4_INVOCATIONS_PER_PIXEL_NV = ShadingRatePaletteEntryNV(raw = 3)
    comptime N_2_INVOCATIONS_PER_PIXEL_NV = ShadingRatePaletteEntryNV(raw = 4)
    comptime N_1_INVOCATION_PER_PIXEL_NV = ShadingRatePaletteEntryNV(raw = 5)
    comptime N_1_INVOCATION_PER_2X1_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 6)
    comptime N_1_INVOCATION_PER_1X2_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 7)
    comptime N_1_INVOCATION_PER_2X2_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 8)
    comptime N_1_INVOCATION_PER_4X2_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 9)
    comptime N_1_INVOCATION_PER_2X4_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 10)
    comptime N_1_INVOCATION_PER_4X4_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 11)


@register_passable("trivial")
struct CoarseSampleOrderTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DEFAULT_NV = CoarseSampleOrderTypeNV(raw = 0)
    comptime CUSTOM_NV = CoarseSampleOrderTypeNV(raw = 1)
    comptime PIXEL_MAJOR_NV = CoarseSampleOrderTypeNV(raw = 2)
    comptime SAMPLE_MAJOR_NV = CoarseSampleOrderTypeNV(raw = 3)


@register_passable("trivial")
struct CopyAccelerationStructureModeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime CLONE_KHR = CopyAccelerationStructureModeKHR(raw = 0)
    comptime COMPACT_KHR = CopyAccelerationStructureModeKHR(raw = 1)
    comptime SERIALIZE_KHR = CopyAccelerationStructureModeKHR(raw = 2)
    comptime DESERIALIZE_KHR = CopyAccelerationStructureModeKHR(raw = 3)


@register_passable("trivial")
struct BuildAccelerationStructureModeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime BUILD_KHR = BuildAccelerationStructureModeKHR(raw = 0)
    comptime UPDATE_KHR = BuildAccelerationStructureModeKHR(raw = 1)


@register_passable("trivial")
struct AccelerationStructureTypeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime TOP_LEVEL_KHR = AccelerationStructureTypeKHR(raw = 0)
    comptime BOTTOM_LEVEL_KHR = AccelerationStructureTypeKHR(raw = 1)
    comptime GENERIC_KHR = AccelerationStructureTypeKHR(raw = 2)


@register_passable("trivial")
struct GeometryTypeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime TRIANGLES_KHR = GeometryTypeKHR(raw = 0)
    comptime AABBS_KHR = GeometryTypeKHR(raw = 1)
    comptime INSTANCES_KHR = GeometryTypeKHR(raw = 2)
    comptime SPHERES_NV = GeometryTypeKHR(raw = 1000429004)
    comptime LINEAR_SWEPT_SPHERES_NV = GeometryTypeKHR(raw = 1000429005)
    comptime DENSE_GEOMETRY_FORMAT_TRIANGLES_AMDX = GeometryTypeKHR(raw = 1000478000)


@register_passable("trivial")
struct AccelerationStructureMemoryRequirementsTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime OBJECT_NV = AccelerationStructureMemoryRequirementsTypeNV(raw = 0)
    comptime BUILD_SCRATCH_NV = AccelerationStructureMemoryRequirementsTypeNV(raw = 1)
    comptime UPDATE_SCRATCH_NV = AccelerationStructureMemoryRequirementsTypeNV(raw = 2)


@register_passable("trivial")
struct AccelerationStructureBuildTypeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime HOST_KHR = AccelerationStructureBuildTypeKHR(raw = 0)
    comptime DEVICE_KHR = AccelerationStructureBuildTypeKHR(raw = 1)
    comptime HOST_OR_DEVICE_KHR = AccelerationStructureBuildTypeKHR(raw = 2)


@register_passable("trivial")
struct RayTracingShaderGroupTypeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime GENERAL_KHR = RayTracingShaderGroupTypeKHR(raw = 0)
    comptime TRIANGLES_HIT_GROUP_KHR = RayTracingShaderGroupTypeKHR(raw = 1)
    comptime PROCEDURAL_HIT_GROUP_KHR = RayTracingShaderGroupTypeKHR(raw = 2)


@register_passable("trivial")
struct AccelerationStructureCompatibilityKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime COMPATIBLE_KHR = AccelerationStructureCompatibilityKHR(raw = 0)
    comptime INCOMPATIBLE_KHR = AccelerationStructureCompatibilityKHR(raw = 1)


@register_passable("trivial")
struct ShaderGroupShaderKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime GENERAL_KHR = ShaderGroupShaderKHR(raw = 0)
    comptime CLOSEST_HIT_KHR = ShaderGroupShaderKHR(raw = 1)
    comptime ANY_HIT_KHR = ShaderGroupShaderKHR(raw = 2)
    comptime INTERSECTION_KHR = ShaderGroupShaderKHR(raw = 3)


@register_passable("trivial")
struct MemoryOverallocationBehaviorAMD(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DEFAULT_AMD = MemoryOverallocationBehaviorAMD(raw = 0)
    comptime ALLOWED_AMD = MemoryOverallocationBehaviorAMD(raw = 1)
    comptime DISALLOWED_AMD = MemoryOverallocationBehaviorAMD(raw = 2)


@register_passable("trivial")
struct FullScreenExclusiveEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DEFAULT_EXT = FullScreenExclusiveEXT(raw = 0)
    comptime ALLOWED_EXT = FullScreenExclusiveEXT(raw = 1)
    comptime DISALLOWED_EXT = FullScreenExclusiveEXT(raw = 2)
    comptime APPLICATION_CONTROLLED_EXT = FullScreenExclusiveEXT(raw = 3)


@register_passable("trivial")
struct PerformanceCounterScopeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime COMMAND_BUFFER_KHR = PerformanceCounterScopeKHR(raw = 0)
    comptime RENDER_PASS_KHR = PerformanceCounterScopeKHR(raw = 1)
    comptime COMMAND_KHR = PerformanceCounterScopeKHR(raw = 2)


@register_passable("trivial")
struct PerformanceCounterUnitKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime GENERIC_KHR = PerformanceCounterUnitKHR(raw = 0)
    comptime PERCENTAGE_KHR = PerformanceCounterUnitKHR(raw = 1)
    comptime NANOSECONDS_KHR = PerformanceCounterUnitKHR(raw = 2)
    comptime BYTES_KHR = PerformanceCounterUnitKHR(raw = 3)
    comptime BYTES_PER_SECOND_KHR = PerformanceCounterUnitKHR(raw = 4)
    comptime KELVIN_KHR = PerformanceCounterUnitKHR(raw = 5)
    comptime WATTS_KHR = PerformanceCounterUnitKHR(raw = 6)
    comptime VOLTS_KHR = PerformanceCounterUnitKHR(raw = 7)
    comptime AMPS_KHR = PerformanceCounterUnitKHR(raw = 8)
    comptime HERTZ_KHR = PerformanceCounterUnitKHR(raw = 9)
    comptime CYCLES_KHR = PerformanceCounterUnitKHR(raw = 10)


@register_passable("trivial")
struct PerformanceCounterStorageKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime INT32_KHR = PerformanceCounterStorageKHR(raw = 0)
    comptime INT64_KHR = PerformanceCounterStorageKHR(raw = 1)
    comptime UINT32_KHR = PerformanceCounterStorageKHR(raw = 2)
    comptime UINT64_KHR = PerformanceCounterStorageKHR(raw = 3)
    comptime FLOAT32_KHR = PerformanceCounterStorageKHR(raw = 4)
    comptime FLOAT64_KHR = PerformanceCounterStorageKHR(raw = 5)


@register_passable("trivial")
struct PerformanceConfigurationTypeINTEL(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL = PerformanceConfigurationTypeINTEL(raw = 0)


@register_passable("trivial")
struct QueryPoolSamplingModeINTEL(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime MANUAL_INTEL = QueryPoolSamplingModeINTEL(raw = 0)


@register_passable("trivial")
struct PerformanceOverrideTypeINTEL(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NULL_HARDWARE_INTEL = PerformanceOverrideTypeINTEL(raw = 0)
    comptime FLUSH_GPU_CACHES_INTEL = PerformanceOverrideTypeINTEL(raw = 1)


@register_passable("trivial")
struct PerformanceParameterTypeINTEL(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime HW_COUNTERS_SUPPORTED_INTEL = PerformanceParameterTypeINTEL(raw = 0)
    comptime STREAM_MARKER_VALID_BITS_INTEL = PerformanceParameterTypeINTEL(raw = 1)


@register_passable("trivial")
struct PerformanceValueTypeINTEL(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UINT32_INTEL = PerformanceValueTypeINTEL(raw = 0)
    comptime UINT64_INTEL = PerformanceValueTypeINTEL(raw = 1)
    comptime FLOAT_INTEL = PerformanceValueTypeINTEL(raw = 2)
    comptime BOOL_INTEL = PerformanceValueTypeINTEL(raw = 3)
    comptime STRING_INTEL = PerformanceValueTypeINTEL(raw = 4)


@register_passable("trivial")
struct ShaderFloatControlsIndependence(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime N_32_BIT_ONLY = ShaderFloatControlsIndependence(raw = 0)
    comptime ALL = ShaderFloatControlsIndependence(raw = 1)
    comptime NONE = ShaderFloatControlsIndependence(raw = 2)


@register_passable("trivial")
struct PipelineExecutableStatisticFormatKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime BOOL32_KHR = PipelineExecutableStatisticFormatKHR(raw = 0)
    comptime INT64_KHR = PipelineExecutableStatisticFormatKHR(raw = 1)
    comptime UINT64_KHR = PipelineExecutableStatisticFormatKHR(raw = 2)
    comptime FLOAT64_KHR = PipelineExecutableStatisticFormatKHR(raw = 3)


@register_passable("trivial")
struct LineRasterizationMode(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DEFAULT = LineRasterizationMode(raw = 0)
    comptime RECTANGULAR = LineRasterizationMode(raw = 1)
    comptime BRESENHAM = LineRasterizationMode(raw = 2)
    comptime RECTANGULAR_SMOOTH = LineRasterizationMode(raw = 3)


@register_passable("trivial")
struct FaultLevel(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UNASSIGNED = FaultLevel(raw = 0)
    comptime CRITICAL = FaultLevel(raw = 1)
    comptime RECOVERABLE = FaultLevel(raw = 2)
    comptime WARNING = FaultLevel(raw = 3)


@register_passable("trivial")
struct FaultType(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime INVALID = FaultType(raw = 0)
    comptime UNASSIGNED = FaultType(raw = 1)
    comptime IMPLEMENTATION = FaultType(raw = 2)
    comptime SYSTEM = FaultType(raw = 3)
    comptime PHYSICAL_DEVICE = FaultType(raw = 4)
    comptime COMMAND_BUFFER_FULL = FaultType(raw = 5)
    comptime INVALID_API_USAGE = FaultType(raw = 6)


@register_passable("trivial")
struct FaultQueryBehavior(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime GET_AND_CLEAR_ALL_FAULTS = FaultQueryBehavior(raw = 0)


@register_passable("trivial")
struct PipelineMatchControl(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime APPLICATION_UUID_EXACT_MATCH = PipelineMatchControl(raw = 0)


@register_passable("trivial")
struct FragmentShadingRateCombinerOpKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime KEEP_KHR = FragmentShadingRateCombinerOpKHR(raw = 0)
    comptime REPLACE_KHR = FragmentShadingRateCombinerOpKHR(raw = 1)
    comptime MIN_KHR = FragmentShadingRateCombinerOpKHR(raw = 2)
    comptime MAX_KHR = FragmentShadingRateCombinerOpKHR(raw = 3)
    comptime MUL_KHR = FragmentShadingRateCombinerOpKHR(raw = 4)


@register_passable("trivial")
struct FragmentShadingRateNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime N_1_INVOCATION_PER_PIXEL_NV = FragmentShadingRateNV(raw = 0)
    comptime N_1_INVOCATION_PER_1X2_PIXELS_NV = FragmentShadingRateNV(raw = 1)
    comptime N_1_INVOCATION_PER_2X1_PIXELS_NV = FragmentShadingRateNV(raw = 4)
    comptime N_1_INVOCATION_PER_2X2_PIXELS_NV = FragmentShadingRateNV(raw = 5)
    comptime N_1_INVOCATION_PER_2X4_PIXELS_NV = FragmentShadingRateNV(raw = 6)
    comptime N_1_INVOCATION_PER_4X2_PIXELS_NV = FragmentShadingRateNV(raw = 9)
    comptime N_1_INVOCATION_PER_4X4_PIXELS_NV = FragmentShadingRateNV(raw = 10)
    comptime N_2_INVOCATIONS_PER_PIXEL_NV = FragmentShadingRateNV(raw = 11)
    comptime N_4_INVOCATIONS_PER_PIXEL_NV = FragmentShadingRateNV(raw = 12)
    comptime N_8_INVOCATIONS_PER_PIXEL_NV = FragmentShadingRateNV(raw = 13)
    comptime N_16_INVOCATIONS_PER_PIXEL_NV = FragmentShadingRateNV(raw = 14)
    comptime NO_INVOCATIONS_NV = FragmentShadingRateNV(raw = 15)


@register_passable("trivial")
struct FragmentShadingRateTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime FRAGMENT_SIZE_NV = FragmentShadingRateTypeNV(raw = 0)
    comptime ENUMS_NV = FragmentShadingRateTypeNV(raw = 1)


@register_passable("trivial")
struct SubpassMergeStatusEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime MERGED_EXT = SubpassMergeStatusEXT(raw = 0)
    comptime DISALLOWED_EXT = SubpassMergeStatusEXT(raw = 1)
    comptime NOT_MERGED_SIDE_EFFECTS_EXT = SubpassMergeStatusEXT(raw = 2)
    comptime NOT_MERGED_SAMPLES_MISMATCH_EXT = SubpassMergeStatusEXT(raw = 3)
    comptime NOT_MERGED_VIEWS_MISMATCH_EXT = SubpassMergeStatusEXT(raw = 4)
    comptime NOT_MERGED_ALIASING_EXT = SubpassMergeStatusEXT(raw = 5)
    comptime NOT_MERGED_DEPENDENCIES_EXT = SubpassMergeStatusEXT(raw = 6)
    comptime NOT_MERGED_INCOMPATIBLE_INPUT_ATTACHMENT_EXT = SubpassMergeStatusEXT(raw = 7)
    comptime NOT_MERGED_TOO_MANY_ATTACHMENTS_EXT = SubpassMergeStatusEXT(raw = 8)
    comptime NOT_MERGED_INSUFFICIENT_STORAGE_EXT = SubpassMergeStatusEXT(raw = 9)
    comptime NOT_MERGED_DEPTH_STENCIL_COUNT_EXT = SubpassMergeStatusEXT(raw = 10)
    comptime NOT_MERGED_RESOLVE_ATTACHMENT_REUSE_EXT = SubpassMergeStatusEXT(raw = 11)
    comptime NOT_MERGED_SINGLE_SUBPASS_EXT = SubpassMergeStatusEXT(raw = 12)
    comptime NOT_MERGED_UNSPECIFIED_EXT = SubpassMergeStatusEXT(raw = 13)


@register_passable("trivial")
struct SciSyncClientTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime SIGNALER_NV = SciSyncClientTypeNV(raw = 0)
    comptime WAITER_NV = SciSyncClientTypeNV(raw = 1)
    comptime SIGNALER_WAITER_NV = SciSyncClientTypeNV(raw = 2)


@register_passable("trivial")
struct SciSyncPrimitiveTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime FENCE_NV = SciSyncPrimitiveTypeNV(raw = 0)
    comptime SEMAPHORE_NV = SciSyncPrimitiveTypeNV(raw = 1)


@register_passable("trivial")
struct ProvokingVertexModeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime FIRST_VERTEX_EXT = ProvokingVertexModeEXT(raw = 0)
    comptime LAST_VERTEX_EXT = ProvokingVertexModeEXT(raw = 1)


@register_passable("trivial")
struct PipelineCacheValidationVersion(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime SAFETY_CRITICAL_ONE = PipelineCacheValidationVersion(raw = 1)


@register_passable("trivial")
struct AccelerationStructureMotionInstanceTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime STATIC_NV = AccelerationStructureMotionInstanceTypeNV(raw = 0)
    comptime MATRIX_MOTION_NV = AccelerationStructureMotionInstanceTypeNV(raw = 1)
    comptime SRT_MOTION_NV = AccelerationStructureMotionInstanceTypeNV(raw = 2)


@register_passable("trivial")
struct DeviceAddressBindingTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime BIND_EXT = DeviceAddressBindingTypeEXT(raw = 0)
    comptime UNBIND_EXT = DeviceAddressBindingTypeEXT(raw = 1)


@register_passable("trivial")
struct QueryResultStatusKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ERROR_KHR = QueryResultStatusKHR(raw = -1)
    comptime NOT_READY_KHR = QueryResultStatusKHR(raw = 0)
    comptime COMPLETE_KHR = QueryResultStatusKHR(raw = 1)
    comptime INSUFFICIENT_BITSTREAM_BUFFER_RANGE_KHR = QueryResultStatusKHR(raw = -1000299000)


@register_passable("trivial")
struct VideoEncodeTuningModeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DEFAULT_KHR = VideoEncodeTuningModeKHR(raw = 0)
    comptime HIGH_QUALITY_KHR = VideoEncodeTuningModeKHR(raw = 1)
    comptime LOW_LATENCY_KHR = VideoEncodeTuningModeKHR(raw = 2)
    comptime ULTRA_LOW_LATENCY_KHR = VideoEncodeTuningModeKHR(raw = 3)
    comptime LOSSLESS_KHR = VideoEncodeTuningModeKHR(raw = 4)


@register_passable("trivial")
struct PartitionedAccelerationStructureOpTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime WRITE_INSTANCE_NV = PartitionedAccelerationStructureOpTypeNV(raw = 0)
    comptime UPDATE_INSTANCE_NV = PartitionedAccelerationStructureOpTypeNV(raw = 1)
    comptime WRITE_PARTITION_TRANSLATION_NV = PartitionedAccelerationStructureOpTypeNV(raw = 2)


@register_passable("trivial")
struct VideoEncodeAV1PredictionModeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime INTRA_ONLY_KHR = VideoEncodeAV1PredictionModeKHR(raw = 0)
    comptime SINGLE_REFERENCE_KHR = VideoEncodeAV1PredictionModeKHR(raw = 1)
    comptime UNIDIRECTIONAL_COMPOUND_KHR = VideoEncodeAV1PredictionModeKHR(raw = 2)
    comptime BIDIRECTIONAL_COMPOUND_KHR = VideoEncodeAV1PredictionModeKHR(raw = 3)


@register_passable("trivial")
struct VideoEncodeAV1RateControlGroupKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime INTRA_KHR = VideoEncodeAV1RateControlGroupKHR(raw = 0)
    comptime PREDICTIVE_KHR = VideoEncodeAV1RateControlGroupKHR(raw = 1)
    comptime BIPREDICTIVE_KHR = VideoEncodeAV1RateControlGroupKHR(raw = 2)


@register_passable("trivial")
struct PipelineRobustnessBufferBehavior(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DEVICE_DEFAULT = PipelineRobustnessBufferBehavior(raw = 0)
    comptime DISABLED = PipelineRobustnessBufferBehavior(raw = 1)
    comptime ROBUST_BUFFER_ACCESS = PipelineRobustnessBufferBehavior(raw = 2)
    comptime ROBUST_BUFFER_ACCESS_2 = PipelineRobustnessBufferBehavior(raw = 3)


@register_passable("trivial")
struct PipelineRobustnessImageBehavior(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DEVICE_DEFAULT = PipelineRobustnessImageBehavior(raw = 0)
    comptime DISABLED = PipelineRobustnessImageBehavior(raw = 1)
    comptime ROBUST_IMAGE_ACCESS = PipelineRobustnessImageBehavior(raw = 2)
    comptime ROBUST_IMAGE_ACCESS_2 = PipelineRobustnessImageBehavior(raw = 3)


@register_passable("trivial")
struct OpticalFlowPerformanceLevelNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UNKNOWN_NV = OpticalFlowPerformanceLevelNV(raw = 0)
    comptime SLOW_NV = OpticalFlowPerformanceLevelNV(raw = 1)
    comptime MEDIUM_NV = OpticalFlowPerformanceLevelNV(raw = 2)
    comptime FAST_NV = OpticalFlowPerformanceLevelNV(raw = 3)


@register_passable("trivial")
struct OpticalFlowSessionBindingPointNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime UNKNOWN_NV = OpticalFlowSessionBindingPointNV(raw = 0)
    comptime INPUT_NV = OpticalFlowSessionBindingPointNV(raw = 1)
    comptime REFERENCE_NV = OpticalFlowSessionBindingPointNV(raw = 2)
    comptime HINT_NV = OpticalFlowSessionBindingPointNV(raw = 3)
    comptime FLOW_VECTOR_NV = OpticalFlowSessionBindingPointNV(raw = 4)
    comptime BACKWARD_FLOW_VECTOR_NV = OpticalFlowSessionBindingPointNV(raw = 5)
    comptime COST_NV = OpticalFlowSessionBindingPointNV(raw = 6)
    comptime BACKWARD_COST_NV = OpticalFlowSessionBindingPointNV(raw = 7)
    comptime GLOBAL_FLOW_NV = OpticalFlowSessionBindingPointNV(raw = 8)


@register_passable("trivial")
struct MicromapTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime OPACITY_MICROMAP_EXT = MicromapTypeEXT(raw = 0)
    comptime DISPLACEMENT_MICROMAP_NV = MicromapTypeEXT(raw = 1000397000)


@register_passable("trivial")
struct CopyMicromapModeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime CLONE_EXT = CopyMicromapModeEXT(raw = 0)
    comptime SERIALIZE_EXT = CopyMicromapModeEXT(raw = 1)
    comptime DESERIALIZE_EXT = CopyMicromapModeEXT(raw = 2)
    comptime COMPACT_EXT = CopyMicromapModeEXT(raw = 3)


@register_passable("trivial")
struct BuildMicromapModeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime BUILD_EXT = BuildMicromapModeEXT(raw = 0)


@register_passable("trivial")
struct OpacityMicromapFormatEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime N_2_STATE_EXT = OpacityMicromapFormatEXT(raw = 1)
    comptime N_4_STATE_EXT = OpacityMicromapFormatEXT(raw = 2)


@register_passable("trivial")
struct OpacityMicromapSpecialIndexEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime FULLY_TRANSPARENT_EXT = OpacityMicromapSpecialIndexEXT(raw = -1)
    comptime FULLY_OPAQUE_EXT = OpacityMicromapSpecialIndexEXT(raw = -2)
    comptime FULLY_UNKNOWN_TRANSPARENT_EXT = OpacityMicromapSpecialIndexEXT(raw = -3)
    comptime FULLY_UNKNOWN_OPAQUE_EXT = OpacityMicromapSpecialIndexEXT(raw = -4)
    comptime CLUSTER_GEOMETRY_DISABLE_OPACITY_MICROMAP_NV = OpacityMicromapSpecialIndexEXT(raw = -5)


@register_passable("trivial")
struct DepthBiasRepresentationEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime LEAST_REPRESENTABLE_VALUE_FORMAT_EXT = DepthBiasRepresentationEXT(raw = 0)
    comptime LEAST_REPRESENTABLE_VALUE_FORCE_UNORM_EXT = DepthBiasRepresentationEXT(raw = 1)
    comptime FLOAT_EXT = DepthBiasRepresentationEXT(raw = 2)


@register_passable("trivial")
struct DeviceFaultAddressTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NONE_EXT = DeviceFaultAddressTypeEXT(raw = 0)
    comptime READ_INVALID_EXT = DeviceFaultAddressTypeEXT(raw = 1)
    comptime WRITE_INVALID_EXT = DeviceFaultAddressTypeEXT(raw = 2)
    comptime EXECUTE_INVALID_EXT = DeviceFaultAddressTypeEXT(raw = 3)
    comptime INSTRUCTION_POINTER_UNKNOWN_EXT = DeviceFaultAddressTypeEXT(raw = 4)
    comptime INSTRUCTION_POINTER_INVALID_EXT = DeviceFaultAddressTypeEXT(raw = 5)
    comptime INSTRUCTION_POINTER_FAULT_EXT = DeviceFaultAddressTypeEXT(raw = 6)


@register_passable("trivial")
struct DeviceFaultVendorBinaryHeaderVersionEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ONE_EXT = DeviceFaultVendorBinaryHeaderVersionEXT(raw = 1)


@register_passable("trivial")
struct IndirectExecutionSetInfoTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime PIPELINES_EXT = IndirectExecutionSetInfoTypeEXT(raw = 0)
    comptime SHADER_OBJECTS_EXT = IndirectExecutionSetInfoTypeEXT(raw = 1)


@register_passable("trivial")
struct IndirectCommandsTokenTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime EXECUTION_SET_EXT = IndirectCommandsTokenTypeEXT(raw = 0)
    comptime PUSH_CONSTANT_EXT = IndirectCommandsTokenTypeEXT(raw = 1)
    comptime SEQUENCE_INDEX_EXT = IndirectCommandsTokenTypeEXT(raw = 2)
    comptime INDEX_BUFFER_EXT = IndirectCommandsTokenTypeEXT(raw = 3)
    comptime VERTEX_BUFFER_EXT = IndirectCommandsTokenTypeEXT(raw = 4)
    comptime DRAW_INDEXED_EXT = IndirectCommandsTokenTypeEXT(raw = 5)
    comptime DRAW_EXT = IndirectCommandsTokenTypeEXT(raw = 6)
    comptime DRAW_INDEXED_COUNT_EXT = IndirectCommandsTokenTypeEXT(raw = 7)
    comptime DRAW_COUNT_EXT = IndirectCommandsTokenTypeEXT(raw = 8)
    comptime DISPATCH_EXT = IndirectCommandsTokenTypeEXT(raw = 9)
    comptime DRAW_MESH_TASKS_NV_EXT = IndirectCommandsTokenTypeEXT(raw = 1000202002)
    comptime DRAW_MESH_TASKS_COUNT_NV_EXT = IndirectCommandsTokenTypeEXT(raw = 1000202003)
    comptime DRAW_MESH_TASKS_EXT = IndirectCommandsTokenTypeEXT(raw = 1000328000)
    comptime DRAW_MESH_TASKS_COUNT_EXT = IndirectCommandsTokenTypeEXT(raw = 1000328001)
    comptime TRACE_RAYS2_EXT = IndirectCommandsTokenTypeEXT(raw = 1000386004)


@register_passable("trivial")
struct DisplacementMicromapFormatNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime N_64_TRIANGLES_64_BYTES_NV = DisplacementMicromapFormatNV(raw = 1)
    comptime N_256_TRIANGLES_128_BYTES_NV = DisplacementMicromapFormatNV(raw = 2)
    comptime N_1024_TRIANGLES_128_BYTES_NV = DisplacementMicromapFormatNV(raw = 3)


@register_passable("trivial")
struct ShaderCodeTypeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime BINARY_EXT = ShaderCodeTypeEXT(raw = 0)
    comptime SPIRV_EXT = ShaderCodeTypeEXT(raw = 1)


@register_passable("trivial")
struct ScopeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DEVICE_KHR = ScopeKHR(raw = 1)
    comptime WORKGROUP_KHR = ScopeKHR(raw = 2)
    comptime SUBGROUP_KHR = ScopeKHR(raw = 3)
    comptime QUEUE_FAMILY_KHR = ScopeKHR(raw = 5)


@register_passable("trivial")
struct ComponentTypeKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime FLOAT16_KHR = ComponentTypeKHR(raw = 0)
    comptime FLOAT32_KHR = ComponentTypeKHR(raw = 1)
    comptime FLOAT64_KHR = ComponentTypeKHR(raw = 2)
    comptime SINT8_KHR = ComponentTypeKHR(raw = 3)
    comptime SINT16_KHR = ComponentTypeKHR(raw = 4)
    comptime SINT32_KHR = ComponentTypeKHR(raw = 5)
    comptime SINT64_KHR = ComponentTypeKHR(raw = 6)
    comptime UINT8_KHR = ComponentTypeKHR(raw = 7)
    comptime UINT16_KHR = ComponentTypeKHR(raw = 8)
    comptime UINT32_KHR = ComponentTypeKHR(raw = 9)
    comptime UINT64_KHR = ComponentTypeKHR(raw = 10)
    comptime BFLOAT16_KHR = ComponentTypeKHR(raw = 1000141000)
    comptime SINT8_PACKED_NV = ComponentTypeKHR(raw = 1000491000)
    comptime UINT8_PACKED_NV = ComponentTypeKHR(raw = 1000491001)
    comptime FLOAT8_E4M3_EXT = ComponentTypeKHR(raw = 1000491002)
    comptime FLOAT8_E5M2_EXT = ComponentTypeKHR(raw = 1000491003)


@register_passable("trivial")
struct CubicFilterWeightsQCOM(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime CATMULL_ROM_QCOM = CubicFilterWeightsQCOM(raw = 0)
    comptime ZERO_TANGENT_CARDINAL_QCOM = CubicFilterWeightsQCOM(raw = 1)
    comptime B_SPLINE_QCOM = CubicFilterWeightsQCOM(raw = 2)
    comptime MITCHELL_NETRAVALI_QCOM = CubicFilterWeightsQCOM(raw = 3)


@register_passable("trivial")
struct BlockMatchWindowCompareModeQCOM(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime MIN_QCOM = BlockMatchWindowCompareModeQCOM(raw = 0)
    comptime MAX_QCOM = BlockMatchWindowCompareModeQCOM(raw = 1)


@register_passable("trivial")
struct PhysicalDeviceLayeredApiKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime VULKAN_KHR = PhysicalDeviceLayeredApiKHR(raw = 0)
    comptime D3D12_KHR = PhysicalDeviceLayeredApiKHR(raw = 1)
    comptime METAL_KHR = PhysicalDeviceLayeredApiKHR(raw = 2)
    comptime OPENGL_KHR = PhysicalDeviceLayeredApiKHR(raw = 3)
    comptime OPENGLES_KHR = PhysicalDeviceLayeredApiKHR(raw = 4)


@register_passable("trivial")
struct LayeredDriverUnderlyingApiMSFT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime NONE_MSFT = LayeredDriverUnderlyingApiMSFT(raw = 0)
    comptime D3D12_MSFT = LayeredDriverUnderlyingApiMSFT(raw = 1)


@register_passable("trivial")
struct LatencyMarkerNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime SIMULATION_START_NV = LatencyMarkerNV(raw = 0)
    comptime SIMULATION_END_NV = LatencyMarkerNV(raw = 1)
    comptime RENDERSUBMIT_START_NV = LatencyMarkerNV(raw = 2)
    comptime RENDERSUBMIT_END_NV = LatencyMarkerNV(raw = 3)
    comptime PRESENT_START_NV = LatencyMarkerNV(raw = 4)
    comptime PRESENT_END_NV = LatencyMarkerNV(raw = 5)
    comptime INPUT_SAMPLE_NV = LatencyMarkerNV(raw = 6)
    comptime TRIGGER_FLASH_NV = LatencyMarkerNV(raw = 7)
    comptime OUT_OF_BAND_RENDERSUBMIT_START_NV = LatencyMarkerNV(raw = 8)
    comptime OUT_OF_BAND_RENDERSUBMIT_END_NV = LatencyMarkerNV(raw = 9)
    comptime OUT_OF_BAND_PRESENT_START_NV = LatencyMarkerNV(raw = 10)
    comptime OUT_OF_BAND_PRESENT_END_NV = LatencyMarkerNV(raw = 11)


@register_passable("trivial")
struct OutOfBandQueueTypeNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime RENDER_NV = OutOfBandQueueTypeNV(raw = 0)
    comptime PRESENT_NV = OutOfBandQueueTypeNV(raw = 1)


@register_passable("trivial")
struct CompressedTriangleFormatAMDX(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DGF1_AMDX = CompressedTriangleFormatAMDX(raw = 0)


@register_passable("trivial")
struct DepthClampModeEXT(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime VIEWPORT_RANGE_EXT = DepthClampModeEXT(raw = 0)
    comptime USER_DEFINED_RANGE_EXT = DepthClampModeEXT(raw = 1)


@register_passable("trivial")
struct CooperativeVectorMatrixLayoutNV(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ROW_MAJOR_NV = CooperativeVectorMatrixLayoutNV(raw = 0)
    comptime COLUMN_MAJOR_NV = CooperativeVectorMatrixLayoutNV(raw = 1)
    comptime INFERENCING_OPTIMAL_NV = CooperativeVectorMatrixLayoutNV(raw = 2)
    comptime TRAINING_OPTIMAL_NV = CooperativeVectorMatrixLayoutNV(raw = 3)


@register_passable("trivial")
struct TensorTilingARM(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime OPTIMAL_ARM = TensorTilingARM(raw = 0)
    comptime LINEAR_ARM = TensorTilingARM(raw = 1)


@register_passable("trivial")
struct DefaultVertexAttributeValueKHR(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime ZERO_ZERO_ZERO_ZERO_KHR = DefaultVertexAttributeValueKHR(raw = 0)
    comptime ZERO_ZERO_ZERO_ONE_KHR = DefaultVertexAttributeValueKHR(raw = 1)


@register_passable("trivial")
struct DataGraphPipelineSessionBindPointARM(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime TRANSIENT_ARM = DataGraphPipelineSessionBindPointARM(raw = 0)


@register_passable("trivial")
struct DataGraphPipelineSessionBindPointTypeARM(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime MEMORY_ARM = DataGraphPipelineSessionBindPointTypeARM(raw = 0)


@register_passable("trivial")
struct DataGraphPipelinePropertyARM(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime CREATION_LOG_ARM = DataGraphPipelinePropertyARM(raw = 0)
    comptime IDENTIFIER_ARM = DataGraphPipelinePropertyARM(raw = 1)


@register_passable("trivial")
struct PhysicalDeviceDataGraphProcessingEngineTypeARM(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime DEFAULT_ARM = PhysicalDeviceDataGraphProcessingEngineTypeARM(raw = 0)


@register_passable("trivial")
struct PhysicalDeviceDataGraphOperationTypeARM(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime SPIRV_EXTENDED_INSTRUCTION_SET_ARM = PhysicalDeviceDataGraphOperationTypeARM(raw = 0)
