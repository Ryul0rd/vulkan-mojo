alias PrivateDataSlotCreateFlagBitsEXT = PrivateDataSlotCreateFlagBits
alias DescriptorUpdateTemplateTypeKHR = DescriptorUpdateTemplateType
alias PointClippingBehaviorKHR = PointClippingBehavior
alias QueueGlobalPriorityKHR = QueueGlobalPriority
alias QueueGlobalPriorityEXT = QueueGlobalPriority
alias TimeDomainEXT = TimeDomainKHR
alias ResolveModeFlagBitsKHR = ResolveModeFlagBits
alias DescriptorBindingFlagBitsEXT = DescriptorBindingFlagBits
alias SemaphoreTypeKHR = SemaphoreType
alias GeometryFlagBitsNV = GeometryFlagBitsKHR
alias GeometryInstanceFlagBitsNV = GeometryInstanceFlagBitsKHR
alias BuildAccelerationStructureFlagBitsNV = BuildAccelerationStructureFlagBitsKHR
alias CopyAccelerationStructureModeNV = CopyAccelerationStructureModeKHR
alias AccelerationStructureTypeNV = AccelerationStructureTypeKHR
alias GeometryTypeNV = GeometryTypeKHR
alias RayTracingShaderGroupTypeNV = RayTracingShaderGroupTypeKHR
alias PipelineCreationFeedbackFlagBitsEXT = PipelineCreationFeedbackFlagBits
alias SemaphoreWaitFlagBitsKHR = SemaphoreWaitFlagBits
alias LineRasterizationModeKHR = LineRasterizationMode
alias LineRasterizationModeEXT = LineRasterizationMode
alias ToolPurposeFlagBitsEXT = ToolPurposeFlagBits
alias AccessFlagBits2KHR = AccessFlagBits2
alias PipelineStageFlagBits2KHR = PipelineStageFlagBits2
alias HostImageCopyFlagBitsEXT = HostImageCopyFlagBits
alias FormatFeatureFlagBits2KHR = FormatFeatureFlagBits2
alias RenderingFlagBitsKHR = RenderingFlagBits
alias PipelineRobustnessBufferBehaviorEXT = PipelineRobustnessBufferBehavior
alias PipelineRobustnessImageBehaviorEXT = PipelineRobustnessImageBehavior
alias PipelineCreateFlagBits2KHR = PipelineCreateFlagBits2
alias BufferUsageFlagBits2KHR = BufferUsageFlagBits2
alias ScopeNV = ScopeKHR
alias ComponentTypeNV = ComponentTypeKHR
alias ExternalMemoryHandleTypeFlagBitsKHR = ExternalMemoryHandleTypeFlagBits
alias ExternalMemoryFeatureFlagBitsKHR = ExternalMemoryFeatureFlagBits
alias ExternalSemaphoreHandleTypeFlagBitsKHR = ExternalSemaphoreHandleTypeFlagBits
alias ExternalSemaphoreFeatureFlagBitsKHR = ExternalSemaphoreFeatureFlagBits
alias SemaphoreImportFlagBitsKHR = SemaphoreImportFlagBits
alias ExternalFenceHandleTypeFlagBitsKHR = ExternalFenceHandleTypeFlagBits
alias ExternalFenceFeatureFlagBitsKHR = ExternalFenceFeatureFlagBits
alias FenceImportFlagBitsKHR = FenceImportFlagBits
alias PeerMemoryFeatureFlagBitsKHR = PeerMemoryFeatureFlagBits
alias MemoryAllocateFlagBitsKHR = MemoryAllocateFlagBits
alias TessellationDomainOriginKHR = TessellationDomainOrigin
alias SamplerYcbcrModelConversionKHR = SamplerYcbcrModelConversion
alias SamplerYcbcrRangeKHR = SamplerYcbcrRange
alias ChromaLocationKHR = ChromaLocation
alias SamplerReductionModeEXT = SamplerReductionMode
alias ShaderFloatControlsIndependenceKHR = ShaderFloatControlsIndependence
alias SubmitFlagBitsKHR = SubmitFlagBits
alias PresentScalingFlagBitsEXT = PresentScalingFlagBitsKHR
alias PresentGravityFlagBitsEXT = PresentGravityFlagBitsKHR
alias MemoryUnmapFlagBitsKHR = MemoryUnmapFlagBits
alias DriverIdKHR = DriverId


@register_passable("trivial")
struct ImageLayout(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UNDEFINED = ImageLayout(raw = 0)
    alias GENERAL = ImageLayout(raw = 1)
    alias COLOR_ATTACHMENT_OPTIMAL = ImageLayout(raw = 2)
    alias DEPTH_STENCIL_ATTACHMENT_OPTIMAL = ImageLayout(raw = 3)
    alias DEPTH_STENCIL_READ_ONLY_OPTIMAL = ImageLayout(raw = 4)
    alias SHADER_READ_ONLY_OPTIMAL = ImageLayout(raw = 5)
    alias TRANSFER_SRC_OPTIMAL = ImageLayout(raw = 6)
    alias TRANSFER_DST_OPTIMAL = ImageLayout(raw = 7)
    alias PREINITIALIZED = ImageLayout(raw = 8)
    alias DEPTH_READ_ONLY_STENCIL_ATTACHMENT_OPTIMAL = ImageLayout(raw = 1000117000)
    alias DEPTH_ATTACHMENT_STENCIL_READ_ONLY_OPTIMAL = ImageLayout(raw = 1000117001)
    alias DEPTH_ATTACHMENT_OPTIMAL = ImageLayout(raw = 1000241000)
    alias DEPTH_READ_ONLY_OPTIMAL = ImageLayout(raw = 1000241001)
    alias STENCIL_ATTACHMENT_OPTIMAL = ImageLayout(raw = 1000241002)
    alias STENCIL_READ_ONLY_OPTIMAL = ImageLayout(raw = 1000241003)
    alias READ_ONLY_OPTIMAL = ImageLayout(raw = 1000314000)
    alias ATTACHMENT_OPTIMAL = ImageLayout(raw = 1000314001)
    alias RENDERING_LOCAL_READ = ImageLayout(raw = 1000232000)
    alias PRESENT_SRC_KHR = ImageLayout(raw = 1000001002)
    alias VIDEO_DECODE_DST_KHR = ImageLayout(raw = 1000024000)
    alias VIDEO_DECODE_SRC_KHR = ImageLayout(raw = 1000024001)
    alias VIDEO_DECODE_DPB_KHR = ImageLayout(raw = 1000024002)
    alias SHARED_PRESENT_KHR = ImageLayout(raw = 1000111000)
    alias FRAGMENT_DENSITY_MAP_OPTIMAL_EXT = ImageLayout(raw = 1000218000)
    alias FRAGMENT_SHADING_RATE_ATTACHMENT_OPTIMAL_KHR = ImageLayout(raw = 1000164003)
    alias VIDEO_ENCODE_DST_KHR = ImageLayout(raw = 1000299000)
    alias VIDEO_ENCODE_SRC_KHR = ImageLayout(raw = 1000299001)
    alias VIDEO_ENCODE_DPB_KHR = ImageLayout(raw = 1000299002)
    alias ATTACHMENT_FEEDBACK_LOOP_OPTIMAL_EXT = ImageLayout(raw = 1000339000)
    alias TENSOR_ALIASING_ARM = ImageLayout(raw = 1000460000)
    alias VIDEO_ENCODE_QUANTIZATION_MAP_KHR = ImageLayout(raw = 1000553000)
    alias ZERO_INITIALIZED_EXT = ImageLayout(raw = 1000620000)


@register_passable("trivial")
struct AttachmentLoadOp(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias LOAD = AttachmentLoadOp(raw = 0)
    alias CLEAR = AttachmentLoadOp(raw = 1)
    alias DONT_CARE = AttachmentLoadOp(raw = 2)
    alias NONE = AttachmentLoadOp(raw = 1000400000)


@register_passable("trivial")
struct AttachmentStoreOp(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias STORE = AttachmentStoreOp(raw = 0)
    alias DONT_CARE = AttachmentStoreOp(raw = 1)
    alias NONE = AttachmentStoreOp(raw = 1000301000)


@register_passable("trivial")
struct ImageType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias N_1D = ImageType(raw = 0)
    alias N_2D = ImageType(raw = 1)
    alias N_3D = ImageType(raw = 2)


@register_passable("trivial")
struct ImageTiling(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias OPTIMAL = ImageTiling(raw = 0)
    alias LINEAR = ImageTiling(raw = 1)
    alias DRM_FORMAT_MODIFIER_EXT = ImageTiling(raw = 1000158000)


@register_passable("trivial")
struct ImageViewType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias N_1D = ImageViewType(raw = 0)
    alias N_2D = ImageViewType(raw = 1)
    alias N_3D = ImageViewType(raw = 2)
    alias CUBE = ImageViewType(raw = 3)
    alias N_1D_ARRAY = ImageViewType(raw = 4)
    alias N_2D_ARRAY = ImageViewType(raw = 5)
    alias CUBE_ARRAY = ImageViewType(raw = 6)


@register_passable("trivial")
struct CommandBufferLevel(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias PRIMARY = CommandBufferLevel(raw = 0)
    alias SECONDARY = CommandBufferLevel(raw = 1)


@register_passable("trivial")
struct ComponentSwizzle(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias IDENTITY = ComponentSwizzle(raw = 0)
    alias ZERO = ComponentSwizzle(raw = 1)
    alias ONE = ComponentSwizzle(raw = 2)
    alias R = ComponentSwizzle(raw = 3)
    alias G = ComponentSwizzle(raw = 4)
    alias B = ComponentSwizzle(raw = 5)
    alias A = ComponentSwizzle(raw = 6)


@register_passable("trivial")
struct DescriptorType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias SAMPLER = DescriptorType(raw = 0)
    alias COMBINED_IMAGE_SAMPLER = DescriptorType(raw = 1)
    alias SAMPLED_IMAGE = DescriptorType(raw = 2)
    alias STORAGE_IMAGE = DescriptorType(raw = 3)
    alias UNIFORM_TEXEL_BUFFER = DescriptorType(raw = 4)
    alias STORAGE_TEXEL_BUFFER = DescriptorType(raw = 5)
    alias UNIFORM_BUFFER = DescriptorType(raw = 6)
    alias STORAGE_BUFFER = DescriptorType(raw = 7)
    alias UNIFORM_BUFFER_DYNAMIC = DescriptorType(raw = 8)
    alias STORAGE_BUFFER_DYNAMIC = DescriptorType(raw = 9)
    alias INPUT_ATTACHMENT = DescriptorType(raw = 10)
    alias INLINE_UNIFORM_BLOCK = DescriptorType(raw = 1000138000)
    alias ACCELERATION_STRUCTURE_KHR = DescriptorType(raw = 1000150000)
    alias ACCELERATION_STRUCTURE_NV = DescriptorType(raw = 1000165000)
    alias SAMPLE_WEIGHT_IMAGE_QCOM = DescriptorType(raw = 1000440000)
    alias BLOCK_MATCH_IMAGE_QCOM = DescriptorType(raw = 1000440001)
    alias TENSOR_ARM = DescriptorType(raw = 1000460000)
    alias MUTABLE_EXT = DescriptorType(raw = 1000351000)
    alias PARTITIONED_ACCELERATION_STRUCTURE_NV = DescriptorType(raw = 1000570000)


@register_passable("trivial")
struct QueryType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias OCCLUSION = QueryType(raw = 0)
    alias PIPELINE_STATISTICS = QueryType(raw = 1)
    alias TIMESTAMP = QueryType(raw = 2)
    alias RESULT_STATUS_ONLY_KHR = QueryType(raw = 1000023000)
    alias TRANSFORM_FEEDBACK_STREAM_EXT = QueryType(raw = 1000028004)
    alias PERFORMANCE_QUERY_KHR = QueryType(raw = 1000116000)
    alias ACCELERATION_STRUCTURE_COMPACTED_SIZE_KHR = QueryType(raw = 1000150000)
    alias ACCELERATION_STRUCTURE_SERIALIZATION_SIZE_KHR = QueryType(raw = 1000150001)
    alias ACCELERATION_STRUCTURE_COMPACTED_SIZE_NV = QueryType(raw = 1000165000)
    alias PERFORMANCE_QUERY_INTEL = QueryType(raw = 1000210000)
    alias VIDEO_ENCODE_FEEDBACK_KHR = QueryType(raw = 1000299000)
    alias MESH_PRIMITIVES_GENERATED_EXT = QueryType(raw = 1000328000)
    alias PRIMITIVES_GENERATED_EXT = QueryType(raw = 1000382000)
    alias ACCELERATION_STRUCTURE_SERIALIZATION_BOTTOM_LEVEL_POINTERS_KHR = QueryType(raw = 1000386000)
    alias ACCELERATION_STRUCTURE_SIZE_KHR = QueryType(raw = 1000386001)
    alias MICROMAP_SERIALIZATION_SIZE_EXT = QueryType(raw = 1000396000)
    alias MICROMAP_COMPACTED_SIZE_EXT = QueryType(raw = 1000396001)


@register_passable("trivial")
struct BorderColor(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias FLOAT_TRANSPARENT_BLACK = BorderColor(raw = 0)
    alias INT_TRANSPARENT_BLACK = BorderColor(raw = 1)
    alias FLOAT_OPAQUE_BLACK = BorderColor(raw = 2)
    alias INT_OPAQUE_BLACK = BorderColor(raw = 3)
    alias FLOAT_OPAQUE_WHITE = BorderColor(raw = 4)
    alias INT_OPAQUE_WHITE = BorderColor(raw = 5)
    alias FLOAT_CUSTOM_EXT = BorderColor(raw = 1000287003)
    alias INT_CUSTOM_EXT = BorderColor(raw = 1000287004)


@register_passable("trivial")
struct PipelineBindPoint(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias GRAPHICS = PipelineBindPoint(raw = 0)
    alias COMPUTE = PipelineBindPoint(raw = 1)
    alias EXECUTION_GRAPH_AMDX = PipelineBindPoint(raw = 1000134000)
    alias RAY_TRACING_KHR = PipelineBindPoint(raw = 1000165000)
    alias SUBPASS_SHADING_HUAWEI = PipelineBindPoint(raw = 1000369003)
    alias DATA_GRAPH_ARM = PipelineBindPoint(raw = 1000507000)


@register_passable("trivial")
struct PipelineCacheHeaderVersion(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ONE = PipelineCacheHeaderVersion(raw = 1)
    alias SAFETY_CRITICAL_ONE = PipelineCacheHeaderVersion(raw = 1000298001)


@register_passable("trivial")
struct PrimitiveTopology(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias POINT_LIST = PrimitiveTopology(raw = 0)
    alias LINE_LIST = PrimitiveTopology(raw = 1)
    alias LINE_STRIP = PrimitiveTopology(raw = 2)
    alias TRIANGLE_LIST = PrimitiveTopology(raw = 3)
    alias TRIANGLE_STRIP = PrimitiveTopology(raw = 4)
    alias TRIANGLE_FAN = PrimitiveTopology(raw = 5)
    alias LINE_LIST_WITH_ADJACENCY = PrimitiveTopology(raw = 6)
    alias LINE_STRIP_WITH_ADJACENCY = PrimitiveTopology(raw = 7)
    alias TRIANGLE_LIST_WITH_ADJACENCY = PrimitiveTopology(raw = 8)
    alias TRIANGLE_STRIP_WITH_ADJACENCY = PrimitiveTopology(raw = 9)
    alias PATCH_LIST = PrimitiveTopology(raw = 10)


@register_passable("trivial")
struct SharingMode(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias EXCLUSIVE = SharingMode(raw = 0)
    alias CONCURRENT = SharingMode(raw = 1)


@register_passable("trivial")
struct IndexType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UINT16 = IndexType(raw = 0)
    alias UINT32 = IndexType(raw = 1)
    alias UINT8 = IndexType(raw = 1000265000)
    alias NONE_KHR = IndexType(raw = 1000165000)


@register_passable("trivial")
struct Filter(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NEAREST = Filter(raw = 0)
    alias LINEAR = Filter(raw = 1)
    alias CUBIC_EXT = Filter(raw = 1000015000)


@register_passable("trivial")
struct SamplerMipmapMode(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NEAREST = SamplerMipmapMode(raw = 0)
    alias LINEAR = SamplerMipmapMode(raw = 1)


@register_passable("trivial")
struct SamplerAddressMode(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias REPEAT = SamplerAddressMode(raw = 0)
    alias MIRRORED_REPEAT = SamplerAddressMode(raw = 1)
    alias CLAMP_TO_EDGE = SamplerAddressMode(raw = 2)
    alias CLAMP_TO_BORDER = SamplerAddressMode(raw = 3)
    alias MIRROR_CLAMP_TO_EDGE = SamplerAddressMode(raw = 4)


@register_passable("trivial")
struct CompareOp(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NEVER = CompareOp(raw = 0)
    alias LESS = CompareOp(raw = 1)
    alias EQUAL = CompareOp(raw = 2)
    alias LESS_OR_EQUAL = CompareOp(raw = 3)
    alias GREATER = CompareOp(raw = 4)
    alias NOT_EQUAL = CompareOp(raw = 5)
    alias GREATER_OR_EQUAL = CompareOp(raw = 6)
    alias ALWAYS = CompareOp(raw = 7)


@register_passable("trivial")
struct PolygonMode(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias FILL = PolygonMode(raw = 0)
    alias LINE = PolygonMode(raw = 1)
    alias POINT = PolygonMode(raw = 2)
    alias FILL_RECTANGLE_NV = PolygonMode(raw = 1000153000)


@register_passable("trivial")
struct FrontFace(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias COUNTER_CLOCKWISE = FrontFace(raw = 0)
    alias CLOCKWISE = FrontFace(raw = 1)


@register_passable("trivial")
struct BlendFactor(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ZERO = BlendFactor(raw = 0)
    alias ONE = BlendFactor(raw = 1)
    alias SRC_COLOR = BlendFactor(raw = 2)
    alias ONE_MINUS_SRC_COLOR = BlendFactor(raw = 3)
    alias DST_COLOR = BlendFactor(raw = 4)
    alias ONE_MINUS_DST_COLOR = BlendFactor(raw = 5)
    alias SRC_ALPHA = BlendFactor(raw = 6)
    alias ONE_MINUS_SRC_ALPHA = BlendFactor(raw = 7)
    alias DST_ALPHA = BlendFactor(raw = 8)
    alias ONE_MINUS_DST_ALPHA = BlendFactor(raw = 9)
    alias CONSTANT_COLOR = BlendFactor(raw = 10)
    alias ONE_MINUS_CONSTANT_COLOR = BlendFactor(raw = 11)
    alias CONSTANT_ALPHA = BlendFactor(raw = 12)
    alias ONE_MINUS_CONSTANT_ALPHA = BlendFactor(raw = 13)
    alias SRC_ALPHA_SATURATE = BlendFactor(raw = 14)
    alias SRC1_COLOR = BlendFactor(raw = 15)
    alias ONE_MINUS_SRC1_COLOR = BlendFactor(raw = 16)
    alias SRC1_ALPHA = BlendFactor(raw = 17)
    alias ONE_MINUS_SRC1_ALPHA = BlendFactor(raw = 18)


@register_passable("trivial")
struct BlendOp(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ADD = BlendOp(raw = 0)
    alias SUBTRACT = BlendOp(raw = 1)
    alias REVERSE_SUBTRACT = BlendOp(raw = 2)
    alias MIN = BlendOp(raw = 3)
    alias MAX = BlendOp(raw = 4)
    alias ZERO_EXT = BlendOp(raw = 1000148000)
    alias SRC_EXT = BlendOp(raw = 1000148001)
    alias DST_EXT = BlendOp(raw = 1000148002)
    alias SRC_OVER_EXT = BlendOp(raw = 1000148003)
    alias DST_OVER_EXT = BlendOp(raw = 1000148004)
    alias SRC_IN_EXT = BlendOp(raw = 1000148005)
    alias DST_IN_EXT = BlendOp(raw = 1000148006)
    alias SRC_OUT_EXT = BlendOp(raw = 1000148007)
    alias DST_OUT_EXT = BlendOp(raw = 1000148008)
    alias SRC_ATOP_EXT = BlendOp(raw = 1000148009)
    alias DST_ATOP_EXT = BlendOp(raw = 1000148010)
    alias XOR_EXT = BlendOp(raw = 1000148011)
    alias MULTIPLY_EXT = BlendOp(raw = 1000148012)
    alias SCREEN_EXT = BlendOp(raw = 1000148013)
    alias OVERLAY_EXT = BlendOp(raw = 1000148014)
    alias DARKEN_EXT = BlendOp(raw = 1000148015)
    alias LIGHTEN_EXT = BlendOp(raw = 1000148016)
    alias COLORDODGE_EXT = BlendOp(raw = 1000148017)
    alias COLORBURN_EXT = BlendOp(raw = 1000148018)
    alias HARDLIGHT_EXT = BlendOp(raw = 1000148019)
    alias SOFTLIGHT_EXT = BlendOp(raw = 1000148020)
    alias DIFFERENCE_EXT = BlendOp(raw = 1000148021)
    alias EXCLUSION_EXT = BlendOp(raw = 1000148022)
    alias INVERT_EXT = BlendOp(raw = 1000148023)
    alias INVERT_RGB_EXT = BlendOp(raw = 1000148024)
    alias LINEARDODGE_EXT = BlendOp(raw = 1000148025)
    alias LINEARBURN_EXT = BlendOp(raw = 1000148026)
    alias VIVIDLIGHT_EXT = BlendOp(raw = 1000148027)
    alias LINEARLIGHT_EXT = BlendOp(raw = 1000148028)
    alias PINLIGHT_EXT = BlendOp(raw = 1000148029)
    alias HARDMIX_EXT = BlendOp(raw = 1000148030)
    alias HSL_HUE_EXT = BlendOp(raw = 1000148031)
    alias HSL_SATURATION_EXT = BlendOp(raw = 1000148032)
    alias HSL_COLOR_EXT = BlendOp(raw = 1000148033)
    alias HSL_LUMINOSITY_EXT = BlendOp(raw = 1000148034)
    alias PLUS_EXT = BlendOp(raw = 1000148035)
    alias PLUS_CLAMPED_EXT = BlendOp(raw = 1000148036)
    alias PLUS_CLAMPED_ALPHA_EXT = BlendOp(raw = 1000148037)
    alias PLUS_DARKER_EXT = BlendOp(raw = 1000148038)
    alias MINUS_EXT = BlendOp(raw = 1000148039)
    alias MINUS_CLAMPED_EXT = BlendOp(raw = 1000148040)
    alias CONTRAST_EXT = BlendOp(raw = 1000148041)
    alias INVERT_OVG_EXT = BlendOp(raw = 1000148042)
    alias RED_EXT = BlendOp(raw = 1000148043)
    alias GREEN_EXT = BlendOp(raw = 1000148044)
    alias BLUE_EXT = BlendOp(raw = 1000148045)


@register_passable("trivial")
struct StencilOp(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias KEEP = StencilOp(raw = 0)
    alias ZERO = StencilOp(raw = 1)
    alias REPLACE = StencilOp(raw = 2)
    alias INCREMENT_AND_CLAMP = StencilOp(raw = 3)
    alias DECREMENT_AND_CLAMP = StencilOp(raw = 4)
    alias INVERT = StencilOp(raw = 5)
    alias INCREMENT_AND_WRAP = StencilOp(raw = 6)
    alias DECREMENT_AND_WRAP = StencilOp(raw = 7)


@register_passable("trivial")
struct LogicOp(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias CLEAR = LogicOp(raw = 0)
    alias AND = LogicOp(raw = 1)
    alias AND_REVERSE = LogicOp(raw = 2)
    alias COPY = LogicOp(raw = 3)
    alias AND_INVERTED = LogicOp(raw = 4)
    alias NO_OP = LogicOp(raw = 5)
    alias XOR = LogicOp(raw = 6)
    alias OR = LogicOp(raw = 7)
    alias NOR = LogicOp(raw = 8)
    alias EQUIVALENT = LogicOp(raw = 9)
    alias INVERT = LogicOp(raw = 10)
    alias OR_REVERSE = LogicOp(raw = 11)
    alias COPY_INVERTED = LogicOp(raw = 12)
    alias OR_INVERTED = LogicOp(raw = 13)
    alias NAND = LogicOp(raw = 14)
    alias SET = LogicOp(raw = 15)


@register_passable("trivial")
struct InternalAllocationType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias EXECUTABLE = InternalAllocationType(raw = 0)


@register_passable("trivial")
struct SystemAllocationScope(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias COMMAND = SystemAllocationScope(raw = 0)
    alias OBJECT = SystemAllocationScope(raw = 1)
    alias CACHE = SystemAllocationScope(raw = 2)
    alias DEVICE = SystemAllocationScope(raw = 3)
    alias INSTANCE = SystemAllocationScope(raw = 4)


@register_passable("trivial")
struct PhysicalDeviceType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias OTHER = PhysicalDeviceType(raw = 0)
    alias INTEGRATED_GPU = PhysicalDeviceType(raw = 1)
    alias DISCRETE_GPU = PhysicalDeviceType(raw = 2)
    alias VIRTUAL_GPU = PhysicalDeviceType(raw = 3)
    alias CPU = PhysicalDeviceType(raw = 4)


@register_passable("trivial")
struct VertexInputRate(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias VERTEX = VertexInputRate(raw = 0)
    alias INSTANCE = VertexInputRate(raw = 1)


@register_passable("trivial")
struct Format(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UNDEFINED = Format(raw = 0)
    alias R4G4_UNORM_PACK8 = Format(raw = 1)
    alias R4G4B4A4_UNORM_PACK16 = Format(raw = 2)
    alias B4G4R4A4_UNORM_PACK16 = Format(raw = 3)
    alias R5G6B5_UNORM_PACK16 = Format(raw = 4)
    alias B5G6R5_UNORM_PACK16 = Format(raw = 5)
    alias R5G5B5A1_UNORM_PACK16 = Format(raw = 6)
    alias B5G5R5A1_UNORM_PACK16 = Format(raw = 7)
    alias A1R5G5B5_UNORM_PACK16 = Format(raw = 8)
    alias R8_UNORM = Format(raw = 9)
    alias R8_SNORM = Format(raw = 10)
    alias R8_USCALED = Format(raw = 11)
    alias R8_SSCALED = Format(raw = 12)
    alias R8_UINT = Format(raw = 13)
    alias R8_SINT = Format(raw = 14)
    alias R8_SRGB = Format(raw = 15)
    alias R8G8_UNORM = Format(raw = 16)
    alias R8G8_SNORM = Format(raw = 17)
    alias R8G8_USCALED = Format(raw = 18)
    alias R8G8_SSCALED = Format(raw = 19)
    alias R8G8_UINT = Format(raw = 20)
    alias R8G8_SINT = Format(raw = 21)
    alias R8G8_SRGB = Format(raw = 22)
    alias R8G8B8_UNORM = Format(raw = 23)
    alias R8G8B8_SNORM = Format(raw = 24)
    alias R8G8B8_USCALED = Format(raw = 25)
    alias R8G8B8_SSCALED = Format(raw = 26)
    alias R8G8B8_UINT = Format(raw = 27)
    alias R8G8B8_SINT = Format(raw = 28)
    alias R8G8B8_SRGB = Format(raw = 29)
    alias B8G8R8_UNORM = Format(raw = 30)
    alias B8G8R8_SNORM = Format(raw = 31)
    alias B8G8R8_USCALED = Format(raw = 32)
    alias B8G8R8_SSCALED = Format(raw = 33)
    alias B8G8R8_UINT = Format(raw = 34)
    alias B8G8R8_SINT = Format(raw = 35)
    alias B8G8R8_SRGB = Format(raw = 36)
    alias R8G8B8A8_UNORM = Format(raw = 37)
    alias R8G8B8A8_SNORM = Format(raw = 38)
    alias R8G8B8A8_USCALED = Format(raw = 39)
    alias R8G8B8A8_SSCALED = Format(raw = 40)
    alias R8G8B8A8_UINT = Format(raw = 41)
    alias R8G8B8A8_SINT = Format(raw = 42)
    alias R8G8B8A8_SRGB = Format(raw = 43)
    alias B8G8R8A8_UNORM = Format(raw = 44)
    alias B8G8R8A8_SNORM = Format(raw = 45)
    alias B8G8R8A8_USCALED = Format(raw = 46)
    alias B8G8R8A8_SSCALED = Format(raw = 47)
    alias B8G8R8A8_UINT = Format(raw = 48)
    alias B8G8R8A8_SINT = Format(raw = 49)
    alias B8G8R8A8_SRGB = Format(raw = 50)
    alias A8B8G8R8_UNORM_PACK32 = Format(raw = 51)
    alias A8B8G8R8_SNORM_PACK32 = Format(raw = 52)
    alias A8B8G8R8_USCALED_PACK32 = Format(raw = 53)
    alias A8B8G8R8_SSCALED_PACK32 = Format(raw = 54)
    alias A8B8G8R8_UINT_PACK32 = Format(raw = 55)
    alias A8B8G8R8_SINT_PACK32 = Format(raw = 56)
    alias A8B8G8R8_SRGB_PACK32 = Format(raw = 57)
    alias A2R10G10B10_UNORM_PACK32 = Format(raw = 58)
    alias A2R10G10B10_SNORM_PACK32 = Format(raw = 59)
    alias A2R10G10B10_USCALED_PACK32 = Format(raw = 60)
    alias A2R10G10B10_SSCALED_PACK32 = Format(raw = 61)
    alias A2R10G10B10_UINT_PACK32 = Format(raw = 62)
    alias A2R10G10B10_SINT_PACK32 = Format(raw = 63)
    alias A2B10G10R10_UNORM_PACK32 = Format(raw = 64)
    alias A2B10G10R10_SNORM_PACK32 = Format(raw = 65)
    alias A2B10G10R10_USCALED_PACK32 = Format(raw = 66)
    alias A2B10G10R10_SSCALED_PACK32 = Format(raw = 67)
    alias A2B10G10R10_UINT_PACK32 = Format(raw = 68)
    alias A2B10G10R10_SINT_PACK32 = Format(raw = 69)
    alias R16_UNORM = Format(raw = 70)
    alias R16_SNORM = Format(raw = 71)
    alias R16_USCALED = Format(raw = 72)
    alias R16_SSCALED = Format(raw = 73)
    alias R16_UINT = Format(raw = 74)
    alias R16_SINT = Format(raw = 75)
    alias R16_SFLOAT = Format(raw = 76)
    alias R16G16_UNORM = Format(raw = 77)
    alias R16G16_SNORM = Format(raw = 78)
    alias R16G16_USCALED = Format(raw = 79)
    alias R16G16_SSCALED = Format(raw = 80)
    alias R16G16_UINT = Format(raw = 81)
    alias R16G16_SINT = Format(raw = 82)
    alias R16G16_SFLOAT = Format(raw = 83)
    alias R16G16B16_UNORM = Format(raw = 84)
    alias R16G16B16_SNORM = Format(raw = 85)
    alias R16G16B16_USCALED = Format(raw = 86)
    alias R16G16B16_SSCALED = Format(raw = 87)
    alias R16G16B16_UINT = Format(raw = 88)
    alias R16G16B16_SINT = Format(raw = 89)
    alias R16G16B16_SFLOAT = Format(raw = 90)
    alias R16G16B16A16_UNORM = Format(raw = 91)
    alias R16G16B16A16_SNORM = Format(raw = 92)
    alias R16G16B16A16_USCALED = Format(raw = 93)
    alias R16G16B16A16_SSCALED = Format(raw = 94)
    alias R16G16B16A16_UINT = Format(raw = 95)
    alias R16G16B16A16_SINT = Format(raw = 96)
    alias R16G16B16A16_SFLOAT = Format(raw = 97)
    alias R32_UINT = Format(raw = 98)
    alias R32_SINT = Format(raw = 99)
    alias R32_SFLOAT = Format(raw = 100)
    alias R32G32_UINT = Format(raw = 101)
    alias R32G32_SINT = Format(raw = 102)
    alias R32G32_SFLOAT = Format(raw = 103)
    alias R32G32B32_UINT = Format(raw = 104)
    alias R32G32B32_SINT = Format(raw = 105)
    alias R32G32B32_SFLOAT = Format(raw = 106)
    alias R32G32B32A32_UINT = Format(raw = 107)
    alias R32G32B32A32_SINT = Format(raw = 108)
    alias R32G32B32A32_SFLOAT = Format(raw = 109)
    alias R64_UINT = Format(raw = 110)
    alias R64_SINT = Format(raw = 111)
    alias R64_SFLOAT = Format(raw = 112)
    alias R64G64_UINT = Format(raw = 113)
    alias R64G64_SINT = Format(raw = 114)
    alias R64G64_SFLOAT = Format(raw = 115)
    alias R64G64B64_UINT = Format(raw = 116)
    alias R64G64B64_SINT = Format(raw = 117)
    alias R64G64B64_SFLOAT = Format(raw = 118)
    alias R64G64B64A64_UINT = Format(raw = 119)
    alias R64G64B64A64_SINT = Format(raw = 120)
    alias R64G64B64A64_SFLOAT = Format(raw = 121)
    alias B10G11R11_UFLOAT_PACK32 = Format(raw = 122)
    alias E5B9G9R9_UFLOAT_PACK32 = Format(raw = 123)
    alias D16_UNORM = Format(raw = 124)
    alias X8_D24_UNORM_PACK32 = Format(raw = 125)
    alias D32_SFLOAT = Format(raw = 126)
    alias S8_UINT = Format(raw = 127)
    alias D16_UNORM_S8_UINT = Format(raw = 128)
    alias D24_UNORM_S8_UINT = Format(raw = 129)
    alias D32_SFLOAT_S8_UINT = Format(raw = 130)
    alias BC1_RGB_UNORM_BLOCK = Format(raw = 131)
    alias BC1_RGB_SRGB_BLOCK = Format(raw = 132)
    alias BC1_RGBA_UNORM_BLOCK = Format(raw = 133)
    alias BC1_RGBA_SRGB_BLOCK = Format(raw = 134)
    alias BC2_UNORM_BLOCK = Format(raw = 135)
    alias BC2_SRGB_BLOCK = Format(raw = 136)
    alias BC3_UNORM_BLOCK = Format(raw = 137)
    alias BC3_SRGB_BLOCK = Format(raw = 138)
    alias BC4_UNORM_BLOCK = Format(raw = 139)
    alias BC4_SNORM_BLOCK = Format(raw = 140)
    alias BC5_UNORM_BLOCK = Format(raw = 141)
    alias BC5_SNORM_BLOCK = Format(raw = 142)
    alias BC6H_UFLOAT_BLOCK = Format(raw = 143)
    alias BC6H_SFLOAT_BLOCK = Format(raw = 144)
    alias BC7_UNORM_BLOCK = Format(raw = 145)
    alias BC7_SRGB_BLOCK = Format(raw = 146)
    alias ETC2_R8G8B8_UNORM_BLOCK = Format(raw = 147)
    alias ETC2_R8G8B8_SRGB_BLOCK = Format(raw = 148)
    alias ETC2_R8G8B8A1_UNORM_BLOCK = Format(raw = 149)
    alias ETC2_R8G8B8A1_SRGB_BLOCK = Format(raw = 150)
    alias ETC2_R8G8B8A8_UNORM_BLOCK = Format(raw = 151)
    alias ETC2_R8G8B8A8_SRGB_BLOCK = Format(raw = 152)
    alias EAC_R11_UNORM_BLOCK = Format(raw = 153)
    alias EAC_R11_SNORM_BLOCK = Format(raw = 154)
    alias EAC_R11G11_UNORM_BLOCK = Format(raw = 155)
    alias EAC_R11G11_SNORM_BLOCK = Format(raw = 156)
    alias ASTC_4x4_UNORM_BLOCK = Format(raw = 157)
    alias ASTC_4x4_SRGB_BLOCK = Format(raw = 158)
    alias ASTC_5x4_UNORM_BLOCK = Format(raw = 159)
    alias ASTC_5x4_SRGB_BLOCK = Format(raw = 160)
    alias ASTC_5x5_UNORM_BLOCK = Format(raw = 161)
    alias ASTC_5x5_SRGB_BLOCK = Format(raw = 162)
    alias ASTC_6x5_UNORM_BLOCK = Format(raw = 163)
    alias ASTC_6x5_SRGB_BLOCK = Format(raw = 164)
    alias ASTC_6x6_UNORM_BLOCK = Format(raw = 165)
    alias ASTC_6x6_SRGB_BLOCK = Format(raw = 166)
    alias ASTC_8x5_UNORM_BLOCK = Format(raw = 167)
    alias ASTC_8x5_SRGB_BLOCK = Format(raw = 168)
    alias ASTC_8x6_UNORM_BLOCK = Format(raw = 169)
    alias ASTC_8x6_SRGB_BLOCK = Format(raw = 170)
    alias ASTC_8x8_UNORM_BLOCK = Format(raw = 171)
    alias ASTC_8x8_SRGB_BLOCK = Format(raw = 172)
    alias ASTC_10x5_UNORM_BLOCK = Format(raw = 173)
    alias ASTC_10x5_SRGB_BLOCK = Format(raw = 174)
    alias ASTC_10x6_UNORM_BLOCK = Format(raw = 175)
    alias ASTC_10x6_SRGB_BLOCK = Format(raw = 176)
    alias ASTC_10x8_UNORM_BLOCK = Format(raw = 177)
    alias ASTC_10x8_SRGB_BLOCK = Format(raw = 178)
    alias ASTC_10x10_UNORM_BLOCK = Format(raw = 179)
    alias ASTC_10x10_SRGB_BLOCK = Format(raw = 180)
    alias ASTC_12x10_UNORM_BLOCK = Format(raw = 181)
    alias ASTC_12x10_SRGB_BLOCK = Format(raw = 182)
    alias ASTC_12x12_UNORM_BLOCK = Format(raw = 183)
    alias ASTC_12x12_SRGB_BLOCK = Format(raw = 184)
    alias G8B8G8R8_422_UNORM = Format(raw = 1000156000)
    alias B8G8R8G8_422_UNORM = Format(raw = 1000156001)
    alias G8_B8_R8_3PLANE_420_UNORM = Format(raw = 1000156002)
    alias G8_B8R8_2PLANE_420_UNORM = Format(raw = 1000156003)
    alias G8_B8_R8_3PLANE_422_UNORM = Format(raw = 1000156004)
    alias G8_B8R8_2PLANE_422_UNORM = Format(raw = 1000156005)
    alias G8_B8_R8_3PLANE_444_UNORM = Format(raw = 1000156006)
    alias R10X6_UNORM_PACK16 = Format(raw = 1000156007)
    alias R10X6G10X6_UNORM_2PACK16 = Format(raw = 1000156008)
    alias R10X6G10X6B10X6A10X6_UNORM_4PACK16 = Format(raw = 1000156009)
    alias G10X6B10X6G10X6R10X6_422_UNORM_4PACK16 = Format(raw = 1000156010)
    alias B10X6G10X6R10X6G10X6_422_UNORM_4PACK16 = Format(raw = 1000156011)
    alias G10X6_B10X6_R10X6_3PLANE_420_UNORM_3PACK16 = Format(raw = 1000156012)
    alias G10X6_B10X6R10X6_2PLANE_420_UNORM_3PACK16 = Format(raw = 1000156013)
    alias G10X6_B10X6_R10X6_3PLANE_422_UNORM_3PACK16 = Format(raw = 1000156014)
    alias G10X6_B10X6R10X6_2PLANE_422_UNORM_3PACK16 = Format(raw = 1000156015)
    alias G10X6_B10X6_R10X6_3PLANE_444_UNORM_3PACK16 = Format(raw = 1000156016)
    alias R12X4_UNORM_PACK16 = Format(raw = 1000156017)
    alias R12X4G12X4_UNORM_2PACK16 = Format(raw = 1000156018)
    alias R12X4G12X4B12X4A12X4_UNORM_4PACK16 = Format(raw = 1000156019)
    alias G12X4B12X4G12X4R12X4_422_UNORM_4PACK16 = Format(raw = 1000156020)
    alias B12X4G12X4R12X4G12X4_422_UNORM_4PACK16 = Format(raw = 1000156021)
    alias G12X4_B12X4_R12X4_3PLANE_420_UNORM_3PACK16 = Format(raw = 1000156022)
    alias G12X4_B12X4R12X4_2PLANE_420_UNORM_3PACK16 = Format(raw = 1000156023)
    alias G12X4_B12X4_R12X4_3PLANE_422_UNORM_3PACK16 = Format(raw = 1000156024)
    alias G12X4_B12X4R12X4_2PLANE_422_UNORM_3PACK16 = Format(raw = 1000156025)
    alias G12X4_B12X4_R12X4_3PLANE_444_UNORM_3PACK16 = Format(raw = 1000156026)
    alias G16B16G16R16_422_UNORM = Format(raw = 1000156027)
    alias B16G16R16G16_422_UNORM = Format(raw = 1000156028)
    alias G16_B16_R16_3PLANE_420_UNORM = Format(raw = 1000156029)
    alias G16_B16R16_2PLANE_420_UNORM = Format(raw = 1000156030)
    alias G16_B16_R16_3PLANE_422_UNORM = Format(raw = 1000156031)
    alias G16_B16R16_2PLANE_422_UNORM = Format(raw = 1000156032)
    alias G16_B16_R16_3PLANE_444_UNORM = Format(raw = 1000156033)
    alias G8_B8R8_2PLANE_444_UNORM = Format(raw = 1000330000)
    alias G10X6_B10X6R10X6_2PLANE_444_UNORM_3PACK16 = Format(raw = 1000330001)
    alias G12X4_B12X4R12X4_2PLANE_444_UNORM_3PACK16 = Format(raw = 1000330002)
    alias G16_B16R16_2PLANE_444_UNORM = Format(raw = 1000330003)
    alias A4R4G4B4_UNORM_PACK16 = Format(raw = 1000340000)
    alias A4B4G4R4_UNORM_PACK16 = Format(raw = 1000340001)
    alias ASTC_4x4_SFLOAT_BLOCK = Format(raw = 1000066000)
    alias ASTC_5x4_SFLOAT_BLOCK = Format(raw = 1000066001)
    alias ASTC_5x5_SFLOAT_BLOCK = Format(raw = 1000066002)
    alias ASTC_6x5_SFLOAT_BLOCK = Format(raw = 1000066003)
    alias ASTC_6x6_SFLOAT_BLOCK = Format(raw = 1000066004)
    alias ASTC_8x5_SFLOAT_BLOCK = Format(raw = 1000066005)
    alias ASTC_8x6_SFLOAT_BLOCK = Format(raw = 1000066006)
    alias ASTC_8x8_SFLOAT_BLOCK = Format(raw = 1000066007)
    alias ASTC_10x5_SFLOAT_BLOCK = Format(raw = 1000066008)
    alias ASTC_10x6_SFLOAT_BLOCK = Format(raw = 1000066009)
    alias ASTC_10x8_SFLOAT_BLOCK = Format(raw = 1000066010)
    alias ASTC_10x10_SFLOAT_BLOCK = Format(raw = 1000066011)
    alias ASTC_12x10_SFLOAT_BLOCK = Format(raw = 1000066012)
    alias ASTC_12x12_SFLOAT_BLOCK = Format(raw = 1000066013)
    alias A1B5G5R5_UNORM_PACK16 = Format(raw = 1000470000)
    alias A8_UNORM = Format(raw = 1000470001)
    alias PVRTC1_2BPP_UNORM_BLOCK_IMG = Format(raw = 1000054000)
    alias PVRTC1_4BPP_UNORM_BLOCK_IMG = Format(raw = 1000054001)
    alias PVRTC2_2BPP_UNORM_BLOCK_IMG = Format(raw = 1000054002)
    alias PVRTC2_4BPP_UNORM_BLOCK_IMG = Format(raw = 1000054003)
    alias PVRTC1_2BPP_SRGB_BLOCK_IMG = Format(raw = 1000054004)
    alias PVRTC1_4BPP_SRGB_BLOCK_IMG = Format(raw = 1000054005)
    alias PVRTC2_2BPP_SRGB_BLOCK_IMG = Format(raw = 1000054006)
    alias PVRTC2_4BPP_SRGB_BLOCK_IMG = Format(raw = 1000054007)
    alias ASTC_3x3x3_UNORM_BLOCK_EXT = Format(raw = 1000288000)
    alias ASTC_3x3x3_SRGB_BLOCK_EXT = Format(raw = 1000288001)
    alias ASTC_3x3x3_SFLOAT_BLOCK_EXT = Format(raw = 1000288002)
    alias ASTC_4x3x3_UNORM_BLOCK_EXT = Format(raw = 1000288003)
    alias ASTC_4x3x3_SRGB_BLOCK_EXT = Format(raw = 1000288004)
    alias ASTC_4x3x3_SFLOAT_BLOCK_EXT = Format(raw = 1000288005)
    alias ASTC_4x4x3_UNORM_BLOCK_EXT = Format(raw = 1000288006)
    alias ASTC_4x4x3_SRGB_BLOCK_EXT = Format(raw = 1000288007)
    alias ASTC_4x4x3_SFLOAT_BLOCK_EXT = Format(raw = 1000288008)
    alias ASTC_4x4x4_UNORM_BLOCK_EXT = Format(raw = 1000288009)
    alias ASTC_4x4x4_SRGB_BLOCK_EXT = Format(raw = 1000288010)
    alias ASTC_4x4x4_SFLOAT_BLOCK_EXT = Format(raw = 1000288011)
    alias ASTC_5x4x4_UNORM_BLOCK_EXT = Format(raw = 1000288012)
    alias ASTC_5x4x4_SRGB_BLOCK_EXT = Format(raw = 1000288013)
    alias ASTC_5x4x4_SFLOAT_BLOCK_EXT = Format(raw = 1000288014)
    alias ASTC_5x5x4_UNORM_BLOCK_EXT = Format(raw = 1000288015)
    alias ASTC_5x5x4_SRGB_BLOCK_EXT = Format(raw = 1000288016)
    alias ASTC_5x5x4_SFLOAT_BLOCK_EXT = Format(raw = 1000288017)
    alias ASTC_5x5x5_UNORM_BLOCK_EXT = Format(raw = 1000288018)
    alias ASTC_5x5x5_SRGB_BLOCK_EXT = Format(raw = 1000288019)
    alias ASTC_5x5x5_SFLOAT_BLOCK_EXT = Format(raw = 1000288020)
    alias ASTC_6x5x5_UNORM_BLOCK_EXT = Format(raw = 1000288021)
    alias ASTC_6x5x5_SRGB_BLOCK_EXT = Format(raw = 1000288022)
    alias ASTC_6x5x5_SFLOAT_BLOCK_EXT = Format(raw = 1000288023)
    alias ASTC_6x6x5_UNORM_BLOCK_EXT = Format(raw = 1000288024)
    alias ASTC_6x6x5_SRGB_BLOCK_EXT = Format(raw = 1000288025)
    alias ASTC_6x6x5_SFLOAT_BLOCK_EXT = Format(raw = 1000288026)
    alias ASTC_6x6x6_UNORM_BLOCK_EXT = Format(raw = 1000288027)
    alias ASTC_6x6x6_SRGB_BLOCK_EXT = Format(raw = 1000288028)
    alias ASTC_6x6x6_SFLOAT_BLOCK_EXT = Format(raw = 1000288029)
    alias R8_BOOL_ARM = Format(raw = 1000460000)
    alias R16G16_SFIXED5_NV = Format(raw = 1000464000)
    alias R10X6_UINT_PACK16_ARM = Format(raw = 1000609000)
    alias R10X6G10X6_UINT_2PACK16_ARM = Format(raw = 1000609001)
    alias R10X6G10X6B10X6A10X6_UINT_4PACK16_ARM = Format(raw = 1000609002)
    alias R12X4_UINT_PACK16_ARM = Format(raw = 1000609003)
    alias R12X4G12X4_UINT_2PACK16_ARM = Format(raw = 1000609004)
    alias R12X4G12X4B12X4A12X4_UINT_4PACK16_ARM = Format(raw = 1000609005)
    alias R14X2_UINT_PACK16_ARM = Format(raw = 1000609006)
    alias R14X2G14X2_UINT_2PACK16_ARM = Format(raw = 1000609007)
    alias R14X2G14X2B14X2A14X2_UINT_4PACK16_ARM = Format(raw = 1000609008)
    alias R14X2_UNORM_PACK16_ARM = Format(raw = 1000609009)
    alias R14X2G14X2_UNORM_2PACK16_ARM = Format(raw = 1000609010)
    alias R14X2G14X2B14X2A14X2_UNORM_4PACK16_ARM = Format(raw = 1000609011)
    alias G14X2_B14X2R14X2_2PLANE_420_UNORM_3PACK16_ARM = Format(raw = 1000609012)
    alias G14X2_B14X2R14X2_2PLANE_422_UNORM_3PACK16_ARM = Format(raw = 1000609013)


@register_passable("trivial")
struct StructureType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias APPLICATION_INFO = StructureType(raw = 0)
    alias INSTANCE_CREATE_INFO = StructureType(raw = 1)
    alias DEVICE_QUEUE_CREATE_INFO = StructureType(raw = 2)
    alias DEVICE_CREATE_INFO = StructureType(raw = 3)
    alias SUBMIT_INFO = StructureType(raw = 4)
    alias MEMORY_ALLOCATE_INFO = StructureType(raw = 5)
    alias MAPPED_MEMORY_RANGE = StructureType(raw = 6)
    alias BIND_SPARSE_INFO = StructureType(raw = 7)
    alias FENCE_CREATE_INFO = StructureType(raw = 8)
    alias SEMAPHORE_CREATE_INFO = StructureType(raw = 9)
    alias EVENT_CREATE_INFO = StructureType(raw = 10)
    alias QUERY_POOL_CREATE_INFO = StructureType(raw = 11)
    alias BUFFER_CREATE_INFO = StructureType(raw = 12)
    alias BUFFER_VIEW_CREATE_INFO = StructureType(raw = 13)
    alias IMAGE_CREATE_INFO = StructureType(raw = 14)
    alias IMAGE_VIEW_CREATE_INFO = StructureType(raw = 15)
    alias SHADER_MODULE_CREATE_INFO = StructureType(raw = 16)
    alias PIPELINE_CACHE_CREATE_INFO = StructureType(raw = 17)
    alias PIPELINE_SHADER_STAGE_CREATE_INFO = StructureType(raw = 18)
    alias PIPELINE_VERTEX_INPUT_STATE_CREATE_INFO = StructureType(raw = 19)
    alias PIPELINE_INPUT_ASSEMBLY_STATE_CREATE_INFO = StructureType(raw = 20)
    alias PIPELINE_TESSELLATION_STATE_CREATE_INFO = StructureType(raw = 21)
    alias PIPELINE_VIEWPORT_STATE_CREATE_INFO = StructureType(raw = 22)
    alias PIPELINE_RASTERIZATION_STATE_CREATE_INFO = StructureType(raw = 23)
    alias PIPELINE_MULTISAMPLE_STATE_CREATE_INFO = StructureType(raw = 24)
    alias PIPELINE_DEPTH_STENCIL_STATE_CREATE_INFO = StructureType(raw = 25)
    alias PIPELINE_COLOR_BLEND_STATE_CREATE_INFO = StructureType(raw = 26)
    alias PIPELINE_DYNAMIC_STATE_CREATE_INFO = StructureType(raw = 27)
    alias GRAPHICS_PIPELINE_CREATE_INFO = StructureType(raw = 28)
    alias COMPUTE_PIPELINE_CREATE_INFO = StructureType(raw = 29)
    alias PIPELINE_LAYOUT_CREATE_INFO = StructureType(raw = 30)
    alias SAMPLER_CREATE_INFO = StructureType(raw = 31)
    alias DESCRIPTOR_SET_LAYOUT_CREATE_INFO = StructureType(raw = 32)
    alias DESCRIPTOR_POOL_CREATE_INFO = StructureType(raw = 33)
    alias DESCRIPTOR_SET_ALLOCATE_INFO = StructureType(raw = 34)
    alias WRITE_DESCRIPTOR_SET = StructureType(raw = 35)
    alias COPY_DESCRIPTOR_SET = StructureType(raw = 36)
    alias FRAMEBUFFER_CREATE_INFO = StructureType(raw = 37)
    alias RENDER_PASS_CREATE_INFO = StructureType(raw = 38)
    alias COMMAND_POOL_CREATE_INFO = StructureType(raw = 39)
    alias COMMAND_BUFFER_ALLOCATE_INFO = StructureType(raw = 40)
    alias COMMAND_BUFFER_INHERITANCE_INFO = StructureType(raw = 41)
    alias COMMAND_BUFFER_BEGIN_INFO = StructureType(raw = 42)
    alias RENDER_PASS_BEGIN_INFO = StructureType(raw = 43)
    alias BUFFER_MEMORY_BARRIER = StructureType(raw = 44)
    alias IMAGE_MEMORY_BARRIER = StructureType(raw = 45)
    alias MEMORY_BARRIER = StructureType(raw = 46)
    alias LOADER_INSTANCE_CREATE_INFO = StructureType(raw = 47)
    alias LOADER_DEVICE_CREATE_INFO = StructureType(raw = 48)
    alias PHYSICAL_DEVICE_SUBGROUP_PROPERTIES = StructureType(raw = 1000094000)
    alias BIND_BUFFER_MEMORY_INFO = StructureType(raw = 1000157000)
    alias BIND_IMAGE_MEMORY_INFO = StructureType(raw = 1000157001)
    alias PHYSICAL_DEVICE_16BIT_STORAGE_FEATURES = StructureType(raw = 1000083000)
    alias MEMORY_DEDICATED_REQUIREMENTS = StructureType(raw = 1000127000)
    alias MEMORY_DEDICATED_ALLOCATE_INFO = StructureType(raw = 1000127001)
    alias MEMORY_ALLOCATE_FLAGS_INFO = StructureType(raw = 1000060000)
    alias DEVICE_GROUP_RENDER_PASS_BEGIN_INFO = StructureType(raw = 1000060003)
    alias DEVICE_GROUP_COMMAND_BUFFER_BEGIN_INFO = StructureType(raw = 1000060004)
    alias DEVICE_GROUP_SUBMIT_INFO = StructureType(raw = 1000060005)
    alias DEVICE_GROUP_BIND_SPARSE_INFO = StructureType(raw = 1000060006)
    alias BIND_BUFFER_MEMORY_DEVICE_GROUP_INFO = StructureType(raw = 1000060013)
    alias BIND_IMAGE_MEMORY_DEVICE_GROUP_INFO = StructureType(raw = 1000060014)
    alias PHYSICAL_DEVICE_GROUP_PROPERTIES = StructureType(raw = 1000070000)
    alias DEVICE_GROUP_DEVICE_CREATE_INFO = StructureType(raw = 1000070001)
    alias BUFFER_MEMORY_REQUIREMENTS_INFO_2 = StructureType(raw = 1000146000)
    alias IMAGE_MEMORY_REQUIREMENTS_INFO_2 = StructureType(raw = 1000146001)
    alias IMAGE_SPARSE_MEMORY_REQUIREMENTS_INFO_2 = StructureType(raw = 1000146002)
    alias MEMORY_REQUIREMENTS_2 = StructureType(raw = 1000146003)
    alias SPARSE_IMAGE_MEMORY_REQUIREMENTS_2 = StructureType(raw = 1000146004)
    alias PHYSICAL_DEVICE_FEATURES_2 = StructureType(raw = 1000059000)
    alias PHYSICAL_DEVICE_PROPERTIES_2 = StructureType(raw = 1000059001)
    alias FORMAT_PROPERTIES_2 = StructureType(raw = 1000059002)
    alias IMAGE_FORMAT_PROPERTIES_2 = StructureType(raw = 1000059003)
    alias PHYSICAL_DEVICE_IMAGE_FORMAT_INFO_2 = StructureType(raw = 1000059004)
    alias QUEUE_FAMILY_PROPERTIES_2 = StructureType(raw = 1000059005)
    alias PHYSICAL_DEVICE_MEMORY_PROPERTIES_2 = StructureType(raw = 1000059006)
    alias SPARSE_IMAGE_FORMAT_PROPERTIES_2 = StructureType(raw = 1000059007)
    alias PHYSICAL_DEVICE_SPARSE_IMAGE_FORMAT_INFO_2 = StructureType(raw = 1000059008)
    alias PHYSICAL_DEVICE_POINT_CLIPPING_PROPERTIES = StructureType(raw = 1000117000)
    alias RENDER_PASS_INPUT_ATTACHMENT_ASPECT_CREATE_INFO = StructureType(raw = 1000117001)
    alias IMAGE_VIEW_USAGE_CREATE_INFO = StructureType(raw = 1000117002)
    alias PIPELINE_TESSELLATION_DOMAIN_ORIGIN_STATE_CREATE_INFO = StructureType(raw = 1000117003)
    alias RENDER_PASS_MULTIVIEW_CREATE_INFO = StructureType(raw = 1000053000)
    alias PHYSICAL_DEVICE_MULTIVIEW_FEATURES = StructureType(raw = 1000053001)
    alias PHYSICAL_DEVICE_MULTIVIEW_PROPERTIES = StructureType(raw = 1000053002)
    alias PHYSICAL_DEVICE_VARIABLE_POINTERS_FEATURES = StructureType(raw = 1000120000)
    alias PROTECTED_SUBMIT_INFO = StructureType(raw = 1000145000)
    alias PHYSICAL_DEVICE_PROTECTED_MEMORY_FEATURES = StructureType(raw = 1000145001)
    alias PHYSICAL_DEVICE_PROTECTED_MEMORY_PROPERTIES = StructureType(raw = 1000145002)
    alias DEVICE_QUEUE_INFO_2 = StructureType(raw = 1000145003)
    alias SAMPLER_YCBCR_CONVERSION_CREATE_INFO = StructureType(raw = 1000156000)
    alias SAMPLER_YCBCR_CONVERSION_INFO = StructureType(raw = 1000156001)
    alias BIND_IMAGE_PLANE_MEMORY_INFO = StructureType(raw = 1000156002)
    alias IMAGE_PLANE_MEMORY_REQUIREMENTS_INFO = StructureType(raw = 1000156003)
    alias PHYSICAL_DEVICE_SAMPLER_YCBCR_CONVERSION_FEATURES = StructureType(raw = 1000156004)
    alias SAMPLER_YCBCR_CONVERSION_IMAGE_FORMAT_PROPERTIES = StructureType(raw = 1000156005)
    alias DESCRIPTOR_UPDATE_TEMPLATE_CREATE_INFO = StructureType(raw = 1000085000)
    alias PHYSICAL_DEVICE_EXTERNAL_IMAGE_FORMAT_INFO = StructureType(raw = 1000071000)
    alias EXTERNAL_IMAGE_FORMAT_PROPERTIES = StructureType(raw = 1000071001)
    alias PHYSICAL_DEVICE_EXTERNAL_BUFFER_INFO = StructureType(raw = 1000071002)
    alias EXTERNAL_BUFFER_PROPERTIES = StructureType(raw = 1000071003)
    alias PHYSICAL_DEVICE_ID_PROPERTIES = StructureType(raw = 1000071004)
    alias EXTERNAL_MEMORY_BUFFER_CREATE_INFO = StructureType(raw = 1000072000)
    alias EXTERNAL_MEMORY_IMAGE_CREATE_INFO = StructureType(raw = 1000072001)
    alias EXPORT_MEMORY_ALLOCATE_INFO = StructureType(raw = 1000072002)
    alias PHYSICAL_DEVICE_EXTERNAL_FENCE_INFO = StructureType(raw = 1000112000)
    alias EXTERNAL_FENCE_PROPERTIES = StructureType(raw = 1000112001)
    alias EXPORT_FENCE_CREATE_INFO = StructureType(raw = 1000113000)
    alias EXPORT_SEMAPHORE_CREATE_INFO = StructureType(raw = 1000077000)
    alias PHYSICAL_DEVICE_EXTERNAL_SEMAPHORE_INFO = StructureType(raw = 1000076000)
    alias EXTERNAL_SEMAPHORE_PROPERTIES = StructureType(raw = 1000076001)
    alias PHYSICAL_DEVICE_MAINTENANCE_3_PROPERTIES = StructureType(raw = 1000168000)
    alias DESCRIPTOR_SET_LAYOUT_SUPPORT = StructureType(raw = 1000168001)
    alias PHYSICAL_DEVICE_SHADER_DRAW_PARAMETERS_FEATURES = StructureType(raw = 1000063000)
    alias PHYSICAL_DEVICE_VULKAN_1_1_FEATURES = StructureType(raw = 49)
    alias PHYSICAL_DEVICE_VULKAN_1_1_PROPERTIES = StructureType(raw = 50)
    alias PHYSICAL_DEVICE_VULKAN_1_2_FEATURES = StructureType(raw = 51)
    alias PHYSICAL_DEVICE_VULKAN_1_2_PROPERTIES = StructureType(raw = 52)
    alias IMAGE_FORMAT_LIST_CREATE_INFO = StructureType(raw = 1000147000)
    alias ATTACHMENT_DESCRIPTION_2 = StructureType(raw = 1000109000)
    alias ATTACHMENT_REFERENCE_2 = StructureType(raw = 1000109001)
    alias SUBPASS_DESCRIPTION_2 = StructureType(raw = 1000109002)
    alias SUBPASS_DEPENDENCY_2 = StructureType(raw = 1000109003)
    alias RENDER_PASS_CREATE_INFO_2 = StructureType(raw = 1000109004)
    alias SUBPASS_BEGIN_INFO = StructureType(raw = 1000109005)
    alias SUBPASS_END_INFO = StructureType(raw = 1000109006)
    alias PHYSICAL_DEVICE_8BIT_STORAGE_FEATURES = StructureType(raw = 1000177000)
    alias PHYSICAL_DEVICE_DRIVER_PROPERTIES = StructureType(raw = 1000196000)
    alias PHYSICAL_DEVICE_SHADER_ATOMIC_INT64_FEATURES = StructureType(raw = 1000180000)
    alias PHYSICAL_DEVICE_SHADER_FLOAT16_INT8_FEATURES = StructureType(raw = 1000082000)
    alias PHYSICAL_DEVICE_FLOAT_CONTROLS_PROPERTIES = StructureType(raw = 1000197000)
    alias DESCRIPTOR_SET_LAYOUT_BINDING_FLAGS_CREATE_INFO = StructureType(raw = 1000161000)
    alias PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_FEATURES = StructureType(raw = 1000161001)
    alias PHYSICAL_DEVICE_DESCRIPTOR_INDEXING_PROPERTIES = StructureType(raw = 1000161002)
    alias DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_ALLOCATE_INFO = StructureType(raw = 1000161003)
    alias DESCRIPTOR_SET_VARIABLE_DESCRIPTOR_COUNT_LAYOUT_SUPPORT = StructureType(raw = 1000161004)
    alias PHYSICAL_DEVICE_DEPTH_STENCIL_RESOLVE_PROPERTIES = StructureType(raw = 1000199000)
    alias SUBPASS_DESCRIPTION_DEPTH_STENCIL_RESOLVE = StructureType(raw = 1000199001)
    alias PHYSICAL_DEVICE_SCALAR_BLOCK_LAYOUT_FEATURES = StructureType(raw = 1000221000)
    alias IMAGE_STENCIL_USAGE_CREATE_INFO = StructureType(raw = 1000246000)
    alias PHYSICAL_DEVICE_SAMPLER_FILTER_MINMAX_PROPERTIES = StructureType(raw = 1000130000)
    alias SAMPLER_REDUCTION_MODE_CREATE_INFO = StructureType(raw = 1000130001)
    alias PHYSICAL_DEVICE_VULKAN_MEMORY_MODEL_FEATURES = StructureType(raw = 1000211000)
    alias PHYSICAL_DEVICE_IMAGELESS_FRAMEBUFFER_FEATURES = StructureType(raw = 1000108000)
    alias FRAMEBUFFER_ATTACHMENTS_CREATE_INFO = StructureType(raw = 1000108001)
    alias FRAMEBUFFER_ATTACHMENT_IMAGE_INFO = StructureType(raw = 1000108002)
    alias RENDER_PASS_ATTACHMENT_BEGIN_INFO = StructureType(raw = 1000108003)
    alias PHYSICAL_DEVICE_UNIFORM_BUFFER_STANDARD_LAYOUT_FEATURES = StructureType(raw = 1000253000)
    alias PHYSICAL_DEVICE_SHADER_SUBGROUP_EXTENDED_TYPES_FEATURES = StructureType(raw = 1000175000)
    alias PHYSICAL_DEVICE_SEPARATE_DEPTH_STENCIL_LAYOUTS_FEATURES = StructureType(raw = 1000241000)
    alias ATTACHMENT_REFERENCE_STENCIL_LAYOUT = StructureType(raw = 1000241001)
    alias ATTACHMENT_DESCRIPTION_STENCIL_LAYOUT = StructureType(raw = 1000241002)
    alias PHYSICAL_DEVICE_HOST_QUERY_RESET_FEATURES = StructureType(raw = 1000261000)
    alias PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_FEATURES = StructureType(raw = 1000207000)
    alias PHYSICAL_DEVICE_TIMELINE_SEMAPHORE_PROPERTIES = StructureType(raw = 1000207001)
    alias SEMAPHORE_TYPE_CREATE_INFO = StructureType(raw = 1000207002)
    alias TIMELINE_SEMAPHORE_SUBMIT_INFO = StructureType(raw = 1000207003)
    alias SEMAPHORE_WAIT_INFO = StructureType(raw = 1000207004)
    alias SEMAPHORE_SIGNAL_INFO = StructureType(raw = 1000207005)
    alias PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES = StructureType(raw = 1000257000)
    alias BUFFER_DEVICE_ADDRESS_INFO = StructureType(raw = 1000244001)
    alias BUFFER_OPAQUE_CAPTURE_ADDRESS_CREATE_INFO = StructureType(raw = 1000257002)
    alias MEMORY_OPAQUE_CAPTURE_ADDRESS_ALLOCATE_INFO = StructureType(raw = 1000257003)
    alias DEVICE_MEMORY_OPAQUE_CAPTURE_ADDRESS_INFO = StructureType(raw = 1000257004)
    alias PHYSICAL_DEVICE_VULKAN_1_3_FEATURES = StructureType(raw = 53)
    alias PHYSICAL_DEVICE_VULKAN_1_3_PROPERTIES = StructureType(raw = 54)
    alias PIPELINE_CREATION_FEEDBACK_CREATE_INFO = StructureType(raw = 1000192000)
    alias PHYSICAL_DEVICE_SHADER_TERMINATE_INVOCATION_FEATURES = StructureType(raw = 1000215000)
    alias PHYSICAL_DEVICE_TOOL_PROPERTIES = StructureType(raw = 1000245000)
    alias PHYSICAL_DEVICE_SHADER_DEMOTE_TO_HELPER_INVOCATION_FEATURES = StructureType(raw = 1000276000)
    alias PHYSICAL_DEVICE_PRIVATE_DATA_FEATURES = StructureType(raw = 1000295000)
    alias DEVICE_PRIVATE_DATA_CREATE_INFO = StructureType(raw = 1000295001)
    alias PRIVATE_DATA_SLOT_CREATE_INFO = StructureType(raw = 1000295002)
    alias PHYSICAL_DEVICE_PIPELINE_CREATION_CACHE_CONTROL_FEATURES = StructureType(raw = 1000297000)
    alias MEMORY_BARRIER_2 = StructureType(raw = 1000314000)
    alias BUFFER_MEMORY_BARRIER_2 = StructureType(raw = 1000314001)
    alias IMAGE_MEMORY_BARRIER_2 = StructureType(raw = 1000314002)
    alias DEPENDENCY_INFO = StructureType(raw = 1000314003)
    alias SUBMIT_INFO_2 = StructureType(raw = 1000314004)
    alias SEMAPHORE_SUBMIT_INFO = StructureType(raw = 1000314005)
    alias COMMAND_BUFFER_SUBMIT_INFO = StructureType(raw = 1000314006)
    alias PHYSICAL_DEVICE_SYNCHRONIZATION_2_FEATURES = StructureType(raw = 1000314007)
    alias PHYSICAL_DEVICE_ZERO_INITIALIZE_WORKGROUP_MEMORY_FEATURES = StructureType(raw = 1000325000)
    alias PHYSICAL_DEVICE_IMAGE_ROBUSTNESS_FEATURES = StructureType(raw = 1000335000)
    alias COPY_BUFFER_INFO_2 = StructureType(raw = 1000337000)
    alias COPY_IMAGE_INFO_2 = StructureType(raw = 1000337001)
    alias COPY_BUFFER_TO_IMAGE_INFO_2 = StructureType(raw = 1000337002)
    alias COPY_IMAGE_TO_BUFFER_INFO_2 = StructureType(raw = 1000337003)
    alias BLIT_IMAGE_INFO_2 = StructureType(raw = 1000337004)
    alias RESOLVE_IMAGE_INFO_2 = StructureType(raw = 1000337005)
    alias BUFFER_COPY_2 = StructureType(raw = 1000337006)
    alias IMAGE_COPY_2 = StructureType(raw = 1000337007)
    alias IMAGE_BLIT_2 = StructureType(raw = 1000337008)
    alias BUFFER_IMAGE_COPY_2 = StructureType(raw = 1000337009)
    alias IMAGE_RESOLVE_2 = StructureType(raw = 1000337010)
    alias PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_PROPERTIES = StructureType(raw = 1000225000)
    alias PIPELINE_SHADER_STAGE_REQUIRED_SUBGROUP_SIZE_CREATE_INFO = StructureType(raw = 1000225001)
    alias PHYSICAL_DEVICE_SUBGROUP_SIZE_CONTROL_FEATURES = StructureType(raw = 1000225002)
    alias PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_FEATURES = StructureType(raw = 1000138000)
    alias PHYSICAL_DEVICE_INLINE_UNIFORM_BLOCK_PROPERTIES = StructureType(raw = 1000138001)
    alias WRITE_DESCRIPTOR_SET_INLINE_UNIFORM_BLOCK = StructureType(raw = 1000138002)
    alias DESCRIPTOR_POOL_INLINE_UNIFORM_BLOCK_CREATE_INFO = StructureType(raw = 1000138003)
    alias PHYSICAL_DEVICE_TEXTURE_COMPRESSION_ASTC_HDR_FEATURES = StructureType(raw = 1000066000)
    alias RENDERING_INFO = StructureType(raw = 1000044000)
    alias RENDERING_ATTACHMENT_INFO = StructureType(raw = 1000044001)
    alias PIPELINE_RENDERING_CREATE_INFO = StructureType(raw = 1000044002)
    alias PHYSICAL_DEVICE_DYNAMIC_RENDERING_FEATURES = StructureType(raw = 1000044003)
    alias COMMAND_BUFFER_INHERITANCE_RENDERING_INFO = StructureType(raw = 1000044004)
    alias PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_FEATURES = StructureType(raw = 1000280000)
    alias PHYSICAL_DEVICE_SHADER_INTEGER_DOT_PRODUCT_PROPERTIES = StructureType(raw = 1000280001)
    alias PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_PROPERTIES = StructureType(raw = 1000281001)
    alias FORMAT_PROPERTIES_3 = StructureType(raw = 1000360000)
    alias PHYSICAL_DEVICE_MAINTENANCE_4_FEATURES = StructureType(raw = 1000413000)
    alias PHYSICAL_DEVICE_MAINTENANCE_4_PROPERTIES = StructureType(raw = 1000413001)
    alias DEVICE_BUFFER_MEMORY_REQUIREMENTS = StructureType(raw = 1000413002)
    alias DEVICE_IMAGE_MEMORY_REQUIREMENTS = StructureType(raw = 1000413003)
    alias PHYSICAL_DEVICE_VULKAN_1_4_FEATURES = StructureType(raw = 55)
    alias PHYSICAL_DEVICE_VULKAN_1_4_PROPERTIES = StructureType(raw = 56)
    alias DEVICE_QUEUE_GLOBAL_PRIORITY_CREATE_INFO = StructureType(raw = 1000174000)
    alias PHYSICAL_DEVICE_GLOBAL_PRIORITY_QUERY_FEATURES = StructureType(raw = 1000388000)
    alias QUEUE_FAMILY_GLOBAL_PRIORITY_PROPERTIES = StructureType(raw = 1000388001)
    alias PHYSICAL_DEVICE_SHADER_SUBGROUP_ROTATE_FEATURES = StructureType(raw = 1000416000)
    alias PHYSICAL_DEVICE_SHADER_FLOAT_CONTROLS_2_FEATURES = StructureType(raw = 1000528000)
    alias PHYSICAL_DEVICE_SHADER_EXPECT_ASSUME_FEATURES = StructureType(raw = 1000544000)
    alias PHYSICAL_DEVICE_LINE_RASTERIZATION_FEATURES = StructureType(raw = 1000259000)
    alias PIPELINE_RASTERIZATION_LINE_STATE_CREATE_INFO = StructureType(raw = 1000259001)
    alias PHYSICAL_DEVICE_LINE_RASTERIZATION_PROPERTIES = StructureType(raw = 1000259002)
    alias PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES = StructureType(raw = 1000525000)
    alias PIPELINE_VERTEX_INPUT_DIVISOR_STATE_CREATE_INFO = StructureType(raw = 1000190001)
    alias PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_FEATURES = StructureType(raw = 1000190002)
    alias PHYSICAL_DEVICE_INDEX_TYPE_UINT8_FEATURES = StructureType(raw = 1000265000)
    alias MEMORY_MAP_INFO = StructureType(raw = 1000271000)
    alias MEMORY_UNMAP_INFO = StructureType(raw = 1000271001)
    alias PHYSICAL_DEVICE_MAINTENANCE_5_FEATURES = StructureType(raw = 1000470000)
    alias PHYSICAL_DEVICE_MAINTENANCE_5_PROPERTIES = StructureType(raw = 1000470001)
    alias RENDERING_AREA_INFO = StructureType(raw = 1000470003)
    alias DEVICE_IMAGE_SUBRESOURCE_INFO = StructureType(raw = 1000470004)
    alias SUBRESOURCE_LAYOUT_2 = StructureType(raw = 1000338002)
    alias IMAGE_SUBRESOURCE_2 = StructureType(raw = 1000338003)
    alias PIPELINE_CREATE_FLAGS_2_CREATE_INFO = StructureType(raw = 1000470005)
    alias BUFFER_USAGE_FLAGS_2_CREATE_INFO = StructureType(raw = 1000470006)
    alias PHYSICAL_DEVICE_PUSH_DESCRIPTOR_PROPERTIES = StructureType(raw = 1000080000)
    alias PHYSICAL_DEVICE_DYNAMIC_RENDERING_LOCAL_READ_FEATURES = StructureType(raw = 1000232000)
    alias RENDERING_ATTACHMENT_LOCATION_INFO = StructureType(raw = 1000232001)
    alias RENDERING_INPUT_ATTACHMENT_INDEX_INFO = StructureType(raw = 1000232002)
    alias PHYSICAL_DEVICE_MAINTENANCE_6_FEATURES = StructureType(raw = 1000545000)
    alias PHYSICAL_DEVICE_MAINTENANCE_6_PROPERTIES = StructureType(raw = 1000545001)
    alias BIND_MEMORY_STATUS = StructureType(raw = 1000545002)
    alias BIND_DESCRIPTOR_SETS_INFO = StructureType(raw = 1000545003)
    alias PUSH_CONSTANTS_INFO = StructureType(raw = 1000545004)
    alias PUSH_DESCRIPTOR_SET_INFO = StructureType(raw = 1000545005)
    alias PUSH_DESCRIPTOR_SET_WITH_TEMPLATE_INFO = StructureType(raw = 1000545006)
    alias PHYSICAL_DEVICE_PIPELINE_PROTECTED_ACCESS_FEATURES = StructureType(raw = 1000466000)
    alias PIPELINE_ROBUSTNESS_CREATE_INFO = StructureType(raw = 1000068000)
    alias PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_FEATURES = StructureType(raw = 1000068001)
    alias PHYSICAL_DEVICE_PIPELINE_ROBUSTNESS_PROPERTIES = StructureType(raw = 1000068002)
    alias PHYSICAL_DEVICE_HOST_IMAGE_COPY_FEATURES = StructureType(raw = 1000270000)
    alias PHYSICAL_DEVICE_HOST_IMAGE_COPY_PROPERTIES = StructureType(raw = 1000270001)
    alias MEMORY_TO_IMAGE_COPY = StructureType(raw = 1000270002)
    alias IMAGE_TO_MEMORY_COPY = StructureType(raw = 1000270003)
    alias COPY_IMAGE_TO_MEMORY_INFO = StructureType(raw = 1000270004)
    alias COPY_MEMORY_TO_IMAGE_INFO = StructureType(raw = 1000270005)
    alias HOST_IMAGE_LAYOUT_TRANSITION_INFO = StructureType(raw = 1000270006)
    alias COPY_IMAGE_TO_IMAGE_INFO = StructureType(raw = 1000270007)
    alias SUBRESOURCE_HOST_MEMCPY_SIZE = StructureType(raw = 1000270008)
    alias HOST_IMAGE_COPY_DEVICE_PERFORMANCE_QUERY = StructureType(raw = 1000270009)
    alias PHYSICAL_DEVICE_VULKAN_SC_1_0_FEATURES = StructureType(raw = 1000298000)
    alias PHYSICAL_DEVICE_VULKAN_SC_1_0_PROPERTIES = StructureType(raw = 1000298001)
    alias DEVICE_OBJECT_RESERVATION_CREATE_INFO = StructureType(raw = 1000298002)
    alias COMMAND_POOL_MEMORY_RESERVATION_CREATE_INFO = StructureType(raw = 1000298003)
    alias COMMAND_POOL_MEMORY_CONSUMPTION = StructureType(raw = 1000298004)
    alias PIPELINE_POOL_SIZE = StructureType(raw = 1000298005)
    alias FAULT_DATA = StructureType(raw = 1000298007)
    alias FAULT_CALLBACK_INFO = StructureType(raw = 1000298008)
    alias PIPELINE_OFFLINE_CREATE_INFO = StructureType(raw = 1000298010)
    alias SWAPCHAIN_CREATE_INFO_KHR = StructureType(raw = 1000001000)
    alias PRESENT_INFO_KHR = StructureType(raw = 1000001001)
    alias DEVICE_GROUP_PRESENT_CAPABILITIES_KHR = StructureType(raw = 1000060007)
    alias IMAGE_SWAPCHAIN_CREATE_INFO_KHR = StructureType(raw = 1000060008)
    alias BIND_IMAGE_MEMORY_SWAPCHAIN_INFO_KHR = StructureType(raw = 1000060009)
    alias ACQUIRE_NEXT_IMAGE_INFO_KHR = StructureType(raw = 1000060010)
    alias DEVICE_GROUP_PRESENT_INFO_KHR = StructureType(raw = 1000060011)
    alias DEVICE_GROUP_SWAPCHAIN_CREATE_INFO_KHR = StructureType(raw = 1000060012)
    alias DISPLAY_MODE_CREATE_INFO_KHR = StructureType(raw = 1000002000)
    alias DISPLAY_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000002001)
    alias DISPLAY_PRESENT_INFO_KHR = StructureType(raw = 1000003000)
    alias XLIB_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000004000)
    alias XCB_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000005000)
    alias WAYLAND_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000006000)
    alias ANDROID_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000008000)
    alias WIN32_SURFACE_CREATE_INFO_KHR = StructureType(raw = 1000009000)
    alias NATIVE_BUFFER_ANDROID = StructureType(raw = 1000010000)
    alias SWAPCHAIN_IMAGE_CREATE_INFO_ANDROID = StructureType(raw = 1000010001)
    alias PHYSICAL_DEVICE_PRESENTATION_PROPERTIES_ANDROID = StructureType(raw = 1000010002)
    alias DEBUG_REPORT_CALLBACK_CREATE_INFO_EXT = StructureType(raw = 1000011000)
    alias PIPELINE_RASTERIZATION_STATE_RASTERIZATION_ORDER_AMD = StructureType(raw = 1000018000)
    alias DEBUG_MARKER_OBJECT_NAME_INFO_EXT = StructureType(raw = 1000022000)
    alias DEBUG_MARKER_OBJECT_TAG_INFO_EXT = StructureType(raw = 1000022001)
    alias DEBUG_MARKER_MARKER_INFO_EXT = StructureType(raw = 1000022002)
    alias VIDEO_PROFILE_INFO_KHR = StructureType(raw = 1000023000)
    alias VIDEO_CAPABILITIES_KHR = StructureType(raw = 1000023001)
    alias VIDEO_PICTURE_RESOURCE_INFO_KHR = StructureType(raw = 1000023002)
    alias VIDEO_SESSION_MEMORY_REQUIREMENTS_KHR = StructureType(raw = 1000023003)
    alias BIND_VIDEO_SESSION_MEMORY_INFO_KHR = StructureType(raw = 1000023004)
    alias VIDEO_SESSION_CREATE_INFO_KHR = StructureType(raw = 1000023005)
    alias VIDEO_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000023006)
    alias VIDEO_SESSION_PARAMETERS_UPDATE_INFO_KHR = StructureType(raw = 1000023007)
    alias VIDEO_BEGIN_CODING_INFO_KHR = StructureType(raw = 1000023008)
    alias VIDEO_END_CODING_INFO_KHR = StructureType(raw = 1000023009)
    alias VIDEO_CODING_CONTROL_INFO_KHR = StructureType(raw = 1000023010)
    alias VIDEO_REFERENCE_SLOT_INFO_KHR = StructureType(raw = 1000023011)
    alias QUEUE_FAMILY_VIDEO_PROPERTIES_KHR = StructureType(raw = 1000023012)
    alias VIDEO_PROFILE_LIST_INFO_KHR = StructureType(raw = 1000023013)
    alias PHYSICAL_DEVICE_VIDEO_FORMAT_INFO_KHR = StructureType(raw = 1000023014)
    alias VIDEO_FORMAT_PROPERTIES_KHR = StructureType(raw = 1000023015)
    alias QUEUE_FAMILY_QUERY_RESULT_STATUS_PROPERTIES_KHR = StructureType(raw = 1000023016)
    alias VIDEO_DECODE_INFO_KHR = StructureType(raw = 1000024000)
    alias VIDEO_DECODE_CAPABILITIES_KHR = StructureType(raw = 1000024001)
    alias VIDEO_DECODE_USAGE_INFO_KHR = StructureType(raw = 1000024002)
    alias DEDICATED_ALLOCATION_IMAGE_CREATE_INFO_NV = StructureType(raw = 1000026000)
    alias DEDICATED_ALLOCATION_BUFFER_CREATE_INFO_NV = StructureType(raw = 1000026001)
    alias DEDICATED_ALLOCATION_MEMORY_ALLOCATE_INFO_NV = StructureType(raw = 1000026002)
    alias PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_FEATURES_EXT = StructureType(raw = 1000028000)
    alias PHYSICAL_DEVICE_TRANSFORM_FEEDBACK_PROPERTIES_EXT = StructureType(raw = 1000028001)
    alias PIPELINE_RASTERIZATION_STATE_STREAM_CREATE_INFO_EXT = StructureType(raw = 1000028002)
    alias CU_MODULE_CREATE_INFO_NVX = StructureType(raw = 1000029000)
    alias CU_FUNCTION_CREATE_INFO_NVX = StructureType(raw = 1000029001)
    alias CU_LAUNCH_INFO_NVX = StructureType(raw = 1000029002)
    alias CU_MODULE_TEXTURING_MODE_CREATE_INFO_NVX = StructureType(raw = 1000029004)
    alias IMAGE_VIEW_HANDLE_INFO_NVX = StructureType(raw = 1000030000)
    alias IMAGE_VIEW_ADDRESS_PROPERTIES_NVX = StructureType(raw = 1000030001)
    alias VIDEO_ENCODE_H264_CAPABILITIES_KHR = StructureType(raw = 1000038000)
    alias VIDEO_ENCODE_H264_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000038001)
    alias VIDEO_ENCODE_H264_SESSION_PARAMETERS_ADD_INFO_KHR = StructureType(raw = 1000038002)
    alias VIDEO_ENCODE_H264_PICTURE_INFO_KHR = StructureType(raw = 1000038003)
    alias VIDEO_ENCODE_H264_DPB_SLOT_INFO_KHR = StructureType(raw = 1000038004)
    alias VIDEO_ENCODE_H264_NALU_SLICE_INFO_KHR = StructureType(raw = 1000038005)
    alias VIDEO_ENCODE_H264_GOP_REMAINING_FRAME_INFO_KHR = StructureType(raw = 1000038006)
    alias VIDEO_ENCODE_H264_PROFILE_INFO_KHR = StructureType(raw = 1000038007)
    alias VIDEO_ENCODE_H264_RATE_CONTROL_INFO_KHR = StructureType(raw = 1000038008)
    alias VIDEO_ENCODE_H264_RATE_CONTROL_LAYER_INFO_KHR = StructureType(raw = 1000038009)
    alias VIDEO_ENCODE_H264_SESSION_CREATE_INFO_KHR = StructureType(raw = 1000038010)
    alias VIDEO_ENCODE_H264_QUALITY_LEVEL_PROPERTIES_KHR = StructureType(raw = 1000038011)
    alias VIDEO_ENCODE_H264_SESSION_PARAMETERS_GET_INFO_KHR = StructureType(raw = 1000038012)
    alias VIDEO_ENCODE_H264_SESSION_PARAMETERS_FEEDBACK_INFO_KHR = StructureType(raw = 1000038013)
    alias VIDEO_ENCODE_H265_CAPABILITIES_KHR = StructureType(raw = 1000039000)
    alias VIDEO_ENCODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000039001)
    alias VIDEO_ENCODE_H265_SESSION_PARAMETERS_ADD_INFO_KHR = StructureType(raw = 1000039002)
    alias VIDEO_ENCODE_H265_PICTURE_INFO_KHR = StructureType(raw = 1000039003)
    alias VIDEO_ENCODE_H265_DPB_SLOT_INFO_KHR = StructureType(raw = 1000039004)
    alias VIDEO_ENCODE_H265_NALU_SLICE_SEGMENT_INFO_KHR = StructureType(raw = 1000039005)
    alias VIDEO_ENCODE_H265_GOP_REMAINING_FRAME_INFO_KHR = StructureType(raw = 1000039006)
    alias VIDEO_ENCODE_H265_PROFILE_INFO_KHR = StructureType(raw = 1000039007)
    alias VIDEO_ENCODE_H265_RATE_CONTROL_INFO_KHR = StructureType(raw = 1000039009)
    alias VIDEO_ENCODE_H265_RATE_CONTROL_LAYER_INFO_KHR = StructureType(raw = 1000039010)
    alias VIDEO_ENCODE_H265_SESSION_CREATE_INFO_KHR = StructureType(raw = 1000039011)
    alias VIDEO_ENCODE_H265_QUALITY_LEVEL_PROPERTIES_KHR = StructureType(raw = 1000039012)
    alias VIDEO_ENCODE_H265_SESSION_PARAMETERS_GET_INFO_KHR = StructureType(raw = 1000039013)
    alias VIDEO_ENCODE_H265_SESSION_PARAMETERS_FEEDBACK_INFO_KHR = StructureType(raw = 1000039014)
    alias VIDEO_DECODE_H264_CAPABILITIES_KHR = StructureType(raw = 1000040000)
    alias VIDEO_DECODE_H264_PICTURE_INFO_KHR = StructureType(raw = 1000040001)
    alias VIDEO_DECODE_H264_PROFILE_INFO_KHR = StructureType(raw = 1000040003)
    alias VIDEO_DECODE_H264_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000040004)
    alias VIDEO_DECODE_H264_SESSION_PARAMETERS_ADD_INFO_KHR = StructureType(raw = 1000040005)
    alias VIDEO_DECODE_H264_DPB_SLOT_INFO_KHR = StructureType(raw = 1000040006)
    alias TEXTURE_LOD_GATHER_FORMAT_PROPERTIES_AMD = StructureType(raw = 1000041000)
    alias STREAM_DESCRIPTOR_SURFACE_CREATE_INFO_GGP = StructureType(raw = 1000049000)
    alias PHYSICAL_DEVICE_CORNER_SAMPLED_IMAGE_FEATURES_NV = StructureType(raw = 1000050000)
    alias PRIVATE_VENDOR_INFO_PLACEHOLDER_OFFSET_0_NV = StructureType(raw = 1000051000)
    alias EXTERNAL_MEMORY_IMAGE_CREATE_INFO_NV = StructureType(raw = 1000056000)
    alias EXPORT_MEMORY_ALLOCATE_INFO_NV = StructureType(raw = 1000056001)
    alias IMPORT_MEMORY_WIN32_HANDLE_INFO_NV = StructureType(raw = 1000057000)
    alias EXPORT_MEMORY_WIN32_HANDLE_INFO_NV = StructureType(raw = 1000057001)
    alias WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_NV = StructureType(raw = 1000058000)
    alias VALIDATION_FLAGS_EXT = StructureType(raw = 1000061000)
    alias VI_SURFACE_CREATE_INFO_NN = StructureType(raw = 1000062000)
    alias IMAGE_VIEW_ASTC_DECODE_MODE_EXT = StructureType(raw = 1000067000)
    alias PHYSICAL_DEVICE_ASTC_DECODE_FEATURES_EXT = StructureType(raw = 1000067001)
    alias IMPORT_MEMORY_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000073000)
    alias EXPORT_MEMORY_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000073001)
    alias MEMORY_WIN32_HANDLE_PROPERTIES_KHR = StructureType(raw = 1000073002)
    alias MEMORY_GET_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000073003)
    alias IMPORT_MEMORY_FD_INFO_KHR = StructureType(raw = 1000074000)
    alias MEMORY_FD_PROPERTIES_KHR = StructureType(raw = 1000074001)
    alias MEMORY_GET_FD_INFO_KHR = StructureType(raw = 1000074002)
    alias WIN32_KEYED_MUTEX_ACQUIRE_RELEASE_INFO_KHR = StructureType(raw = 1000075000)
    alias IMPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000078000)
    alias EXPORT_SEMAPHORE_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000078001)
    alias D3D12_FENCE_SUBMIT_INFO_KHR = StructureType(raw = 1000078002)
    alias SEMAPHORE_GET_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000078003)
    alias IMPORT_SEMAPHORE_FD_INFO_KHR = StructureType(raw = 1000079000)
    alias SEMAPHORE_GET_FD_INFO_KHR = StructureType(raw = 1000079001)
    alias COMMAND_BUFFER_INHERITANCE_CONDITIONAL_RENDERING_INFO_EXT = StructureType(raw = 1000081000)
    alias PHYSICAL_DEVICE_CONDITIONAL_RENDERING_FEATURES_EXT = StructureType(raw = 1000081001)
    alias CONDITIONAL_RENDERING_BEGIN_INFO_EXT = StructureType(raw = 1000081002)
    alias PRESENT_REGIONS_KHR = StructureType(raw = 1000084000)
    alias PIPELINE_VIEWPORT_W_SCALING_STATE_CREATE_INFO_NV = StructureType(raw = 1000087000)
    alias SURFACE_CAPABILITIES_2_EXT = StructureType(raw = 1000090000)
    alias DISPLAY_POWER_INFO_EXT = StructureType(raw = 1000091000)
    alias DEVICE_EVENT_INFO_EXT = StructureType(raw = 1000091001)
    alias DISPLAY_EVENT_INFO_EXT = StructureType(raw = 1000091002)
    alias SWAPCHAIN_COUNTER_CREATE_INFO_EXT = StructureType(raw = 1000091003)
    alias PRESENT_TIMES_INFO_GOOGLE = StructureType(raw = 1000092000)
    alias PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_ATTRIBUTES_PROPERTIES_NVX = StructureType(raw = 1000097000)
    alias MULTIVIEW_PER_VIEW_ATTRIBUTES_INFO_NVX = StructureType(raw = 1000044009)
    alias PIPELINE_VIEWPORT_SWIZZLE_STATE_CREATE_INFO_NV = StructureType(raw = 1000098000)
    alias PHYSICAL_DEVICE_DISCARD_RECTANGLE_PROPERTIES_EXT = StructureType(raw = 1000099000)
    alias PIPELINE_DISCARD_RECTANGLE_STATE_CREATE_INFO_EXT = StructureType(raw = 1000099001)
    alias PHYSICAL_DEVICE_CONSERVATIVE_RASTERIZATION_PROPERTIES_EXT = StructureType(raw = 1000101000)
    alias PIPELINE_RASTERIZATION_CONSERVATIVE_STATE_CREATE_INFO_EXT = StructureType(raw = 1000101001)
    alias PHYSICAL_DEVICE_DEPTH_CLIP_ENABLE_FEATURES_EXT = StructureType(raw = 1000102000)
    alias PIPELINE_RASTERIZATION_DEPTH_CLIP_STATE_CREATE_INFO_EXT = StructureType(raw = 1000102001)
    alias HDR_METADATA_EXT = StructureType(raw = 1000105000)
    alias PHYSICAL_DEVICE_RELAXED_LINE_RASTERIZATION_FEATURES_IMG = StructureType(raw = 1000110000)
    alias SHARED_PRESENT_SURFACE_CAPABILITIES_KHR = StructureType(raw = 1000111000)
    alias IMPORT_FENCE_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000114000)
    alias EXPORT_FENCE_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000114001)
    alias FENCE_GET_WIN32_HANDLE_INFO_KHR = StructureType(raw = 1000114002)
    alias IMPORT_FENCE_FD_INFO_KHR = StructureType(raw = 1000115000)
    alias FENCE_GET_FD_INFO_KHR = StructureType(raw = 1000115001)
    alias PHYSICAL_DEVICE_PERFORMANCE_QUERY_FEATURES_KHR = StructureType(raw = 1000116000)
    alias PHYSICAL_DEVICE_PERFORMANCE_QUERY_PROPERTIES_KHR = StructureType(raw = 1000116001)
    alias QUERY_POOL_PERFORMANCE_CREATE_INFO_KHR = StructureType(raw = 1000116002)
    alias PERFORMANCE_QUERY_SUBMIT_INFO_KHR = StructureType(raw = 1000116003)
    alias ACQUIRE_PROFILING_LOCK_INFO_KHR = StructureType(raw = 1000116004)
    alias PERFORMANCE_COUNTER_KHR = StructureType(raw = 1000116005)
    alias PERFORMANCE_COUNTER_DESCRIPTION_KHR = StructureType(raw = 1000116006)
    alias PERFORMANCE_QUERY_RESERVATION_INFO_KHR = StructureType(raw = 1000116007)
    alias PHYSICAL_DEVICE_SURFACE_INFO_2_KHR = StructureType(raw = 1000119000)
    alias SURFACE_CAPABILITIES_2_KHR = StructureType(raw = 1000119001)
    alias SURFACE_FORMAT_2_KHR = StructureType(raw = 1000119002)
    alias DISPLAY_PROPERTIES_2_KHR = StructureType(raw = 1000121000)
    alias DISPLAY_PLANE_PROPERTIES_2_KHR = StructureType(raw = 1000121001)
    alias DISPLAY_MODE_PROPERTIES_2_KHR = StructureType(raw = 1000121002)
    alias DISPLAY_PLANE_INFO_2_KHR = StructureType(raw = 1000121003)
    alias DISPLAY_PLANE_CAPABILITIES_2_KHR = StructureType(raw = 1000121004)
    alias IOS_SURFACE_CREATE_INFO_MVK = StructureType(raw = 1000122000)
    alias MACOS_SURFACE_CREATE_INFO_MVK = StructureType(raw = 1000123000)
    alias DEBUG_UTILS_OBJECT_NAME_INFO_EXT = StructureType(raw = 1000128000)
    alias DEBUG_UTILS_OBJECT_TAG_INFO_EXT = StructureType(raw = 1000128001)
    alias DEBUG_UTILS_LABEL_EXT = StructureType(raw = 1000128002)
    alias DEBUG_UTILS_MESSENGER_CALLBACK_DATA_EXT = StructureType(raw = 1000128003)
    alias DEBUG_UTILS_MESSENGER_CREATE_INFO_EXT = StructureType(raw = 1000128004)
    alias ANDROID_HARDWARE_BUFFER_USAGE_ANDROID = StructureType(raw = 1000129000)
    alias ANDROID_HARDWARE_BUFFER_PROPERTIES_ANDROID = StructureType(raw = 1000129001)
    alias ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_ANDROID = StructureType(raw = 1000129002)
    alias IMPORT_ANDROID_HARDWARE_BUFFER_INFO_ANDROID = StructureType(raw = 1000129003)
    alias MEMORY_GET_ANDROID_HARDWARE_BUFFER_INFO_ANDROID = StructureType(raw = 1000129004)
    alias EXTERNAL_FORMAT_ANDROID = StructureType(raw = 1000129005)
    alias ANDROID_HARDWARE_BUFFER_FORMAT_PROPERTIES_2_ANDROID = StructureType(raw = 1000129006)
    alias PHYSICAL_DEVICE_SHADER_ENQUEUE_FEATURES_AMDX = StructureType(raw = 1000134000)
    alias PHYSICAL_DEVICE_SHADER_ENQUEUE_PROPERTIES_AMDX = StructureType(raw = 1000134001)
    alias EXECUTION_GRAPH_PIPELINE_SCRATCH_SIZE_AMDX = StructureType(raw = 1000134002)
    alias EXECUTION_GRAPH_PIPELINE_CREATE_INFO_AMDX = StructureType(raw = 1000134003)
    alias PIPELINE_SHADER_STAGE_NODE_CREATE_INFO_AMDX = StructureType(raw = 1000134004)
    alias ATTACHMENT_SAMPLE_COUNT_INFO_AMD = StructureType(raw = 1000044008)
    alias PHYSICAL_DEVICE_SHADER_BFLOAT16_FEATURES_KHR = StructureType(raw = 1000141000)
    alias SAMPLE_LOCATIONS_INFO_EXT = StructureType(raw = 1000143000)
    alias RENDER_PASS_SAMPLE_LOCATIONS_BEGIN_INFO_EXT = StructureType(raw = 1000143001)
    alias PIPELINE_SAMPLE_LOCATIONS_STATE_CREATE_INFO_EXT = StructureType(raw = 1000143002)
    alias PHYSICAL_DEVICE_SAMPLE_LOCATIONS_PROPERTIES_EXT = StructureType(raw = 1000143003)
    alias MULTISAMPLE_PROPERTIES_EXT = StructureType(raw = 1000143004)
    alias PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_FEATURES_EXT = StructureType(raw = 1000148000)
    alias PHYSICAL_DEVICE_BLEND_OPERATION_ADVANCED_PROPERTIES_EXT = StructureType(raw = 1000148001)
    alias PIPELINE_COLOR_BLEND_ADVANCED_STATE_CREATE_INFO_EXT = StructureType(raw = 1000148002)
    alias PIPELINE_COVERAGE_TO_COLOR_STATE_CREATE_INFO_NV = StructureType(raw = 1000149000)
    alias WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_KHR = StructureType(raw = 1000150007)
    alias ACCELERATION_STRUCTURE_BUILD_GEOMETRY_INFO_KHR = StructureType(raw = 1000150000)
    alias ACCELERATION_STRUCTURE_DEVICE_ADDRESS_INFO_KHR = StructureType(raw = 1000150002)
    alias ACCELERATION_STRUCTURE_GEOMETRY_AABBS_DATA_KHR = StructureType(raw = 1000150003)
    alias ACCELERATION_STRUCTURE_GEOMETRY_INSTANCES_DATA_KHR = StructureType(raw = 1000150004)
    alias ACCELERATION_STRUCTURE_GEOMETRY_TRIANGLES_DATA_KHR = StructureType(raw = 1000150005)
    alias ACCELERATION_STRUCTURE_GEOMETRY_KHR = StructureType(raw = 1000150006)
    alias ACCELERATION_STRUCTURE_VERSION_INFO_KHR = StructureType(raw = 1000150009)
    alias COPY_ACCELERATION_STRUCTURE_INFO_KHR = StructureType(raw = 1000150010)
    alias COPY_ACCELERATION_STRUCTURE_TO_MEMORY_INFO_KHR = StructureType(raw = 1000150011)
    alias COPY_MEMORY_TO_ACCELERATION_STRUCTURE_INFO_KHR = StructureType(raw = 1000150012)
    alias PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_FEATURES_KHR = StructureType(raw = 1000150013)
    alias PHYSICAL_DEVICE_ACCELERATION_STRUCTURE_PROPERTIES_KHR = StructureType(raw = 1000150014)
    alias ACCELERATION_STRUCTURE_CREATE_INFO_KHR = StructureType(raw = 1000150017)
    alias ACCELERATION_STRUCTURE_BUILD_SIZES_INFO_KHR = StructureType(raw = 1000150020)
    alias PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_FEATURES_KHR = StructureType(raw = 1000347000)
    alias PHYSICAL_DEVICE_RAY_TRACING_PIPELINE_PROPERTIES_KHR = StructureType(raw = 1000347001)
    alias RAY_TRACING_PIPELINE_CREATE_INFO_KHR = StructureType(raw = 1000150015)
    alias RAY_TRACING_SHADER_GROUP_CREATE_INFO_KHR = StructureType(raw = 1000150016)
    alias RAY_TRACING_PIPELINE_INTERFACE_CREATE_INFO_KHR = StructureType(raw = 1000150018)
    alias PHYSICAL_DEVICE_RAY_QUERY_FEATURES_KHR = StructureType(raw = 1000348013)
    alias PIPELINE_COVERAGE_MODULATION_STATE_CREATE_INFO_NV = StructureType(raw = 1000152000)
    alias PHYSICAL_DEVICE_SHADER_SM_BUILTINS_FEATURES_NV = StructureType(raw = 1000154000)
    alias PHYSICAL_DEVICE_SHADER_SM_BUILTINS_PROPERTIES_NV = StructureType(raw = 1000154001)
    alias DRM_FORMAT_MODIFIER_PROPERTIES_LIST_EXT = StructureType(raw = 1000158000)
    alias PHYSICAL_DEVICE_IMAGE_DRM_FORMAT_MODIFIER_INFO_EXT = StructureType(raw = 1000158002)
    alias IMAGE_DRM_FORMAT_MODIFIER_LIST_CREATE_INFO_EXT = StructureType(raw = 1000158003)
    alias IMAGE_DRM_FORMAT_MODIFIER_EXPLICIT_CREATE_INFO_EXT = StructureType(raw = 1000158004)
    alias IMAGE_DRM_FORMAT_MODIFIER_PROPERTIES_EXT = StructureType(raw = 1000158005)
    alias DRM_FORMAT_MODIFIER_PROPERTIES_LIST_2_EXT = StructureType(raw = 1000158006)
    alias VALIDATION_CACHE_CREATE_INFO_EXT = StructureType(raw = 1000160000)
    alias SHADER_MODULE_VALIDATION_CACHE_CREATE_INFO_EXT = StructureType(raw = 1000160001)
    alias PHYSICAL_DEVICE_PORTABILITY_SUBSET_FEATURES_KHR = StructureType(raw = 1000163000)
    alias PHYSICAL_DEVICE_PORTABILITY_SUBSET_PROPERTIES_KHR = StructureType(raw = 1000163001)
    alias PIPELINE_VIEWPORT_SHADING_RATE_IMAGE_STATE_CREATE_INFO_NV = StructureType(raw = 1000164000)
    alias PHYSICAL_DEVICE_SHADING_RATE_IMAGE_FEATURES_NV = StructureType(raw = 1000164001)
    alias PHYSICAL_DEVICE_SHADING_RATE_IMAGE_PROPERTIES_NV = StructureType(raw = 1000164002)
    alias PIPELINE_VIEWPORT_COARSE_SAMPLE_ORDER_STATE_CREATE_INFO_NV = StructureType(raw = 1000164005)
    alias RAY_TRACING_PIPELINE_CREATE_INFO_NV = StructureType(raw = 1000165000)
    alias ACCELERATION_STRUCTURE_CREATE_INFO_NV = StructureType(raw = 1000165001)
    alias GEOMETRY_NV = StructureType(raw = 1000165003)
    alias GEOMETRY_TRIANGLES_NV = StructureType(raw = 1000165004)
    alias GEOMETRY_AABB_NV = StructureType(raw = 1000165005)
    alias BIND_ACCELERATION_STRUCTURE_MEMORY_INFO_NV = StructureType(raw = 1000165006)
    alias WRITE_DESCRIPTOR_SET_ACCELERATION_STRUCTURE_NV = StructureType(raw = 1000165007)
    alias ACCELERATION_STRUCTURE_MEMORY_REQUIREMENTS_INFO_NV = StructureType(raw = 1000165008)
    alias PHYSICAL_DEVICE_RAY_TRACING_PROPERTIES_NV = StructureType(raw = 1000165009)
    alias RAY_TRACING_SHADER_GROUP_CREATE_INFO_NV = StructureType(raw = 1000165011)
    alias ACCELERATION_STRUCTURE_INFO_NV = StructureType(raw = 1000165012)
    alias PHYSICAL_DEVICE_REPRESENTATIVE_FRAGMENT_TEST_FEATURES_NV = StructureType(raw = 1000166000)
    alias PIPELINE_REPRESENTATIVE_FRAGMENT_TEST_STATE_CREATE_INFO_NV = StructureType(raw = 1000166001)
    alias PHYSICAL_DEVICE_IMAGE_VIEW_IMAGE_FORMAT_INFO_EXT = StructureType(raw = 1000170000)
    alias FILTER_CUBIC_IMAGE_VIEW_IMAGE_FORMAT_PROPERTIES_EXT = StructureType(raw = 1000170001)
    alias IMPORT_MEMORY_HOST_POINTER_INFO_EXT = StructureType(raw = 1000178000)
    alias MEMORY_HOST_POINTER_PROPERTIES_EXT = StructureType(raw = 1000178001)
    alias PHYSICAL_DEVICE_EXTERNAL_MEMORY_HOST_PROPERTIES_EXT = StructureType(raw = 1000178002)
    alias PHYSICAL_DEVICE_SHADER_CLOCK_FEATURES_KHR = StructureType(raw = 1000181000)
    alias PIPELINE_COMPILER_CONTROL_CREATE_INFO_AMD = StructureType(raw = 1000183000)
    alias PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_AMD = StructureType(raw = 1000185000)
    alias VIDEO_DECODE_H265_CAPABILITIES_KHR = StructureType(raw = 1000187000)
    alias VIDEO_DECODE_H265_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000187001)
    alias VIDEO_DECODE_H265_SESSION_PARAMETERS_ADD_INFO_KHR = StructureType(raw = 1000187002)
    alias VIDEO_DECODE_H265_PROFILE_INFO_KHR = StructureType(raw = 1000187003)
    alias VIDEO_DECODE_H265_PICTURE_INFO_KHR = StructureType(raw = 1000187004)
    alias VIDEO_DECODE_H265_DPB_SLOT_INFO_KHR = StructureType(raw = 1000187005)
    alias DEVICE_MEMORY_OVERALLOCATION_CREATE_INFO_AMD = StructureType(raw = 1000189000)
    alias PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_DIVISOR_PROPERTIES_EXT = StructureType(raw = 1000190000)
    alias PRESENT_FRAME_TOKEN_GGP = StructureType(raw = 1000191000)
    alias PHYSICAL_DEVICE_MESH_SHADER_FEATURES_NV = StructureType(raw = 1000202000)
    alias PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_NV = StructureType(raw = 1000202001)
    alias PHYSICAL_DEVICE_SHADER_IMAGE_FOOTPRINT_FEATURES_NV = StructureType(raw = 1000204000)
    alias PIPELINE_VIEWPORT_EXCLUSIVE_SCISSOR_STATE_CREATE_INFO_NV = StructureType(raw = 1000205000)
    alias PHYSICAL_DEVICE_EXCLUSIVE_SCISSOR_FEATURES_NV = StructureType(raw = 1000205002)
    alias CHECKPOINT_DATA_NV = StructureType(raw = 1000206000)
    alias QUEUE_FAMILY_CHECKPOINT_PROPERTIES_NV = StructureType(raw = 1000206001)
    alias QUEUE_FAMILY_CHECKPOINT_PROPERTIES_2_NV = StructureType(raw = 1000314008)
    alias CHECKPOINT_DATA_2_NV = StructureType(raw = 1000314009)
    alias PHYSICAL_DEVICE_SHADER_INTEGER_FUNCTIONS_2_FEATURES_INTEL = StructureType(raw = 1000209000)
    alias QUERY_POOL_PERFORMANCE_QUERY_CREATE_INFO_INTEL = StructureType(raw = 1000210000)
    alias INITIALIZE_PERFORMANCE_API_INFO_INTEL = StructureType(raw = 1000210001)
    alias PERFORMANCE_MARKER_INFO_INTEL = StructureType(raw = 1000210002)
    alias PERFORMANCE_STREAM_MARKER_INFO_INTEL = StructureType(raw = 1000210003)
    alias PERFORMANCE_OVERRIDE_INFO_INTEL = StructureType(raw = 1000210004)
    alias PERFORMANCE_CONFIGURATION_ACQUIRE_INFO_INTEL = StructureType(raw = 1000210005)
    alias PHYSICAL_DEVICE_PCI_BUS_INFO_PROPERTIES_EXT = StructureType(raw = 1000212000)
    alias DISPLAY_NATIVE_HDR_SURFACE_CAPABILITIES_AMD = StructureType(raw = 1000213000)
    alias SWAPCHAIN_DISPLAY_NATIVE_HDR_CREATE_INFO_AMD = StructureType(raw = 1000213001)
    alias IMAGEPIPE_SURFACE_CREATE_INFO_FUCHSIA = StructureType(raw = 1000214000)
    alias METAL_SURFACE_CREATE_INFO_EXT = StructureType(raw = 1000217000)
    alias PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_FEATURES_EXT = StructureType(raw = 1000218000)
    alias PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_PROPERTIES_EXT = StructureType(raw = 1000218001)
    alias RENDER_PASS_FRAGMENT_DENSITY_MAP_CREATE_INFO_EXT = StructureType(raw = 1000218002)
    alias RENDERING_FRAGMENT_DENSITY_MAP_ATTACHMENT_INFO_EXT = StructureType(raw = 1000044007)
    alias FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR = StructureType(raw = 1000226000)
    alias PIPELINE_FRAGMENT_SHADING_RATE_STATE_CREATE_INFO_KHR = StructureType(raw = 1000226001)
    alias PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_PROPERTIES_KHR = StructureType(raw = 1000226002)
    alias PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_FEATURES_KHR = StructureType(raw = 1000226003)
    alias PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_KHR = StructureType(raw = 1000226004)
    alias RENDERING_FRAGMENT_SHADING_RATE_ATTACHMENT_INFO_KHR = StructureType(raw = 1000044006)
    alias PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_2_AMD = StructureType(raw = 1000227000)
    alias PHYSICAL_DEVICE_COHERENT_MEMORY_FEATURES_AMD = StructureType(raw = 1000229000)
    alias PHYSICAL_DEVICE_SHADER_IMAGE_ATOMIC_INT64_FEATURES_EXT = StructureType(raw = 1000234000)
    alias PHYSICAL_DEVICE_SHADER_QUAD_CONTROL_FEATURES_KHR = StructureType(raw = 1000235000)
    alias PHYSICAL_DEVICE_MEMORY_BUDGET_PROPERTIES_EXT = StructureType(raw = 1000237000)
    alias PHYSICAL_DEVICE_MEMORY_PRIORITY_FEATURES_EXT = StructureType(raw = 1000238000)
    alias MEMORY_PRIORITY_ALLOCATE_INFO_EXT = StructureType(raw = 1000238001)
    alias SURFACE_PROTECTED_CAPABILITIES_KHR = StructureType(raw = 1000239000)
    alias PHYSICAL_DEVICE_DEDICATED_ALLOCATION_IMAGE_ALIASING_FEATURES_NV = StructureType(raw = 1000240000)
    alias PHYSICAL_DEVICE_BUFFER_DEVICE_ADDRESS_FEATURES_EXT = StructureType(raw = 1000244000)
    alias BUFFER_DEVICE_ADDRESS_CREATE_INFO_EXT = StructureType(raw = 1000244002)
    alias VALIDATION_FEATURES_EXT = StructureType(raw = 1000247000)
    alias PHYSICAL_DEVICE_PRESENT_WAIT_FEATURES_KHR = StructureType(raw = 1000248000)
    alias PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_NV = StructureType(raw = 1000249000)
    alias COOPERATIVE_MATRIX_PROPERTIES_NV = StructureType(raw = 1000249001)
    alias PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_NV = StructureType(raw = 1000249002)
    alias PHYSICAL_DEVICE_COVERAGE_REDUCTION_MODE_FEATURES_NV = StructureType(raw = 1000250000)
    alias PIPELINE_COVERAGE_REDUCTION_STATE_CREATE_INFO_NV = StructureType(raw = 1000250001)
    alias FRAMEBUFFER_MIXED_SAMPLES_COMBINATION_NV = StructureType(raw = 1000250002)
    alias PHYSICAL_DEVICE_FRAGMENT_SHADER_INTERLOCK_FEATURES_EXT = StructureType(raw = 1000251000)
    alias PHYSICAL_DEVICE_YCBCR_IMAGE_ARRAYS_FEATURES_EXT = StructureType(raw = 1000252000)
    alias PHYSICAL_DEVICE_PROVOKING_VERTEX_FEATURES_EXT = StructureType(raw = 1000254000)
    alias PIPELINE_RASTERIZATION_PROVOKING_VERTEX_STATE_CREATE_INFO_EXT = StructureType(raw = 1000254001)
    alias PHYSICAL_DEVICE_PROVOKING_VERTEX_PROPERTIES_EXT = StructureType(raw = 1000254002)
    alias SURFACE_FULL_SCREEN_EXCLUSIVE_INFO_EXT = StructureType(raw = 1000255000)
    alias SURFACE_CAPABILITIES_FULL_SCREEN_EXCLUSIVE_EXT = StructureType(raw = 1000255002)
    alias SURFACE_FULL_SCREEN_EXCLUSIVE_WIN32_INFO_EXT = StructureType(raw = 1000255001)
    alias HEADLESS_SURFACE_CREATE_INFO_EXT = StructureType(raw = 1000256000)
    alias PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_FEATURES_EXT = StructureType(raw = 1000260000)
    alias PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_FEATURES_EXT = StructureType(raw = 1000267000)
    alias PHYSICAL_DEVICE_PIPELINE_EXECUTABLE_PROPERTIES_FEATURES_KHR = StructureType(raw = 1000269000)
    alias PIPELINE_INFO_KHR = StructureType(raw = 1000269001)
    alias PIPELINE_EXECUTABLE_PROPERTIES_KHR = StructureType(raw = 1000269002)
    alias PIPELINE_EXECUTABLE_INFO_KHR = StructureType(raw = 1000269003)
    alias PIPELINE_EXECUTABLE_STATISTIC_KHR = StructureType(raw = 1000269004)
    alias PIPELINE_EXECUTABLE_INTERNAL_REPRESENTATION_KHR = StructureType(raw = 1000269005)
    alias PHYSICAL_DEVICE_MAP_MEMORY_PLACED_FEATURES_EXT = StructureType(raw = 1000272000)
    alias PHYSICAL_DEVICE_MAP_MEMORY_PLACED_PROPERTIES_EXT = StructureType(raw = 1000272001)
    alias MEMORY_MAP_PLACED_INFO_EXT = StructureType(raw = 1000272002)
    alias PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT_2_FEATURES_EXT = StructureType(raw = 1000273000)
    alias PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_NV = StructureType(raw = 1000277000)
    alias GRAPHICS_SHADER_GROUP_CREATE_INFO_NV = StructureType(raw = 1000277001)
    alias GRAPHICS_PIPELINE_SHADER_GROUPS_CREATE_INFO_NV = StructureType(raw = 1000277002)
    alias INDIRECT_COMMANDS_LAYOUT_TOKEN_NV = StructureType(raw = 1000277003)
    alias INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_NV = StructureType(raw = 1000277004)
    alias GENERATED_COMMANDS_INFO_NV = StructureType(raw = 1000277005)
    alias GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_NV = StructureType(raw = 1000277006)
    alias PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_NV = StructureType(raw = 1000277007)
    alias PHYSICAL_DEVICE_INHERITED_VIEWPORT_SCISSOR_FEATURES_NV = StructureType(raw = 1000278000)
    alias COMMAND_BUFFER_INHERITANCE_VIEWPORT_SCISSOR_INFO_NV = StructureType(raw = 1000278001)
    alias PHYSICAL_DEVICE_TEXEL_BUFFER_ALIGNMENT_FEATURES_EXT = StructureType(raw = 1000281000)
    alias COMMAND_BUFFER_INHERITANCE_RENDER_PASS_TRANSFORM_INFO_QCOM = StructureType(raw = 1000282000)
    alias RENDER_PASS_TRANSFORM_BEGIN_INFO_QCOM = StructureType(raw = 1000282001)
    alias PHYSICAL_DEVICE_DEPTH_BIAS_CONTROL_FEATURES_EXT = StructureType(raw = 1000283000)
    alias DEPTH_BIAS_INFO_EXT = StructureType(raw = 1000283001)
    alias DEPTH_BIAS_REPRESENTATION_INFO_EXT = StructureType(raw = 1000283002)
    alias PHYSICAL_DEVICE_DEVICE_MEMORY_REPORT_FEATURES_EXT = StructureType(raw = 1000284000)
    alias DEVICE_DEVICE_MEMORY_REPORT_CREATE_INFO_EXT = StructureType(raw = 1000284001)
    alias DEVICE_MEMORY_REPORT_CALLBACK_DATA_EXT = StructureType(raw = 1000284002)
    alias SAMPLER_CUSTOM_BORDER_COLOR_CREATE_INFO_EXT = StructureType(raw = 1000287000)
    alias PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_PROPERTIES_EXT = StructureType(raw = 1000287001)
    alias PHYSICAL_DEVICE_CUSTOM_BORDER_COLOR_FEATURES_EXT = StructureType(raw = 1000287002)
    alias PIPELINE_LIBRARY_CREATE_INFO_KHR = StructureType(raw = 1000290000)
    alias PHYSICAL_DEVICE_PRESENT_BARRIER_FEATURES_NV = StructureType(raw = 1000292000)
    alias SURFACE_CAPABILITIES_PRESENT_BARRIER_NV = StructureType(raw = 1000292001)
    alias SWAPCHAIN_PRESENT_BARRIER_CREATE_INFO_NV = StructureType(raw = 1000292002)
    alias PRESENT_ID_KHR = StructureType(raw = 1000294000)
    alias PHYSICAL_DEVICE_PRESENT_ID_FEATURES_KHR = StructureType(raw = 1000294001)
    alias VIDEO_ENCODE_INFO_KHR = StructureType(raw = 1000299000)
    alias VIDEO_ENCODE_RATE_CONTROL_INFO_KHR = StructureType(raw = 1000299001)
    alias VIDEO_ENCODE_RATE_CONTROL_LAYER_INFO_KHR = StructureType(raw = 1000299002)
    alias VIDEO_ENCODE_CAPABILITIES_KHR = StructureType(raw = 1000299003)
    alias VIDEO_ENCODE_USAGE_INFO_KHR = StructureType(raw = 1000299004)
    alias QUERY_POOL_VIDEO_ENCODE_FEEDBACK_CREATE_INFO_KHR = StructureType(raw = 1000299005)
    alias PHYSICAL_DEVICE_VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR = StructureType(raw = 1000299006)
    alias VIDEO_ENCODE_QUALITY_LEVEL_PROPERTIES_KHR = StructureType(raw = 1000299007)
    alias VIDEO_ENCODE_QUALITY_LEVEL_INFO_KHR = StructureType(raw = 1000299008)
    alias VIDEO_ENCODE_SESSION_PARAMETERS_GET_INFO_KHR = StructureType(raw = 1000299009)
    alias VIDEO_ENCODE_SESSION_PARAMETERS_FEEDBACK_INFO_KHR = StructureType(raw = 1000299010)
    alias PHYSICAL_DEVICE_DIAGNOSTICS_CONFIG_FEATURES_NV = StructureType(raw = 1000300000)
    alias DEVICE_DIAGNOSTICS_CONFIG_CREATE_INFO_NV = StructureType(raw = 1000300001)
    alias CUDA_MODULE_CREATE_INFO_NV = StructureType(raw = 1000307000)
    alias CUDA_FUNCTION_CREATE_INFO_NV = StructureType(raw = 1000307001)
    alias CUDA_LAUNCH_INFO_NV = StructureType(raw = 1000307002)
    alias PHYSICAL_DEVICE_CUDA_KERNEL_LAUNCH_FEATURES_NV = StructureType(raw = 1000307003)
    alias PHYSICAL_DEVICE_CUDA_KERNEL_LAUNCH_PROPERTIES_NV = StructureType(raw = 1000307004)
    alias REFRESH_OBJECT_LIST_KHR = StructureType(raw = 1000308000)
    alias PHYSICAL_DEVICE_TILE_SHADING_FEATURES_QCOM = StructureType(raw = 1000309000)
    alias PHYSICAL_DEVICE_TILE_SHADING_PROPERTIES_QCOM = StructureType(raw = 1000309001)
    alias RENDER_PASS_TILE_SHADING_CREATE_INFO_QCOM = StructureType(raw = 1000309002)
    alias PER_TILE_BEGIN_INFO_QCOM = StructureType(raw = 1000309003)
    alias PER_TILE_END_INFO_QCOM = StructureType(raw = 1000309004)
    alias DISPATCH_TILE_INFO_QCOM = StructureType(raw = 1000309005)
    alias QUERY_LOW_LATENCY_SUPPORT_NV = StructureType(raw = 1000310000)
    alias EXPORT_METAL_OBJECT_CREATE_INFO_EXT = StructureType(raw = 1000311000)
    alias EXPORT_METAL_OBJECTS_INFO_EXT = StructureType(raw = 1000311001)
    alias EXPORT_METAL_DEVICE_INFO_EXT = StructureType(raw = 1000311002)
    alias EXPORT_METAL_COMMAND_QUEUE_INFO_EXT = StructureType(raw = 1000311003)
    alias EXPORT_METAL_BUFFER_INFO_EXT = StructureType(raw = 1000311004)
    alias IMPORT_METAL_BUFFER_INFO_EXT = StructureType(raw = 1000311005)
    alias EXPORT_METAL_TEXTURE_INFO_EXT = StructureType(raw = 1000311006)
    alias IMPORT_METAL_TEXTURE_INFO_EXT = StructureType(raw = 1000311007)
    alias EXPORT_METAL_IO_SURFACE_INFO_EXT = StructureType(raw = 1000311008)
    alias IMPORT_METAL_IO_SURFACE_INFO_EXT = StructureType(raw = 1000311009)
    alias EXPORT_METAL_SHARED_EVENT_INFO_EXT = StructureType(raw = 1000311010)
    alias IMPORT_METAL_SHARED_EVENT_INFO_EXT = StructureType(raw = 1000311011)
    alias PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_PROPERTIES_EXT = StructureType(raw = 1000316000)
    alias PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_DENSITY_MAP_PROPERTIES_EXT = StructureType(raw = 1000316001)
    alias PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_FEATURES_EXT = StructureType(raw = 1000316002)
    alias DESCRIPTOR_ADDRESS_INFO_EXT = StructureType(raw = 1000316003)
    alias DESCRIPTOR_GET_INFO_EXT = StructureType(raw = 1000316004)
    alias BUFFER_CAPTURE_DESCRIPTOR_DATA_INFO_EXT = StructureType(raw = 1000316005)
    alias IMAGE_CAPTURE_DESCRIPTOR_DATA_INFO_EXT = StructureType(raw = 1000316006)
    alias IMAGE_VIEW_CAPTURE_DESCRIPTOR_DATA_INFO_EXT = StructureType(raw = 1000316007)
    alias SAMPLER_CAPTURE_DESCRIPTOR_DATA_INFO_EXT = StructureType(raw = 1000316008)
    alias OPAQUE_CAPTURE_DESCRIPTOR_DATA_CREATE_INFO_EXT = StructureType(raw = 1000316010)
    alias DESCRIPTOR_BUFFER_BINDING_INFO_EXT = StructureType(raw = 1000316011)
    alias DESCRIPTOR_BUFFER_BINDING_PUSH_DESCRIPTOR_BUFFER_HANDLE_EXT = StructureType(raw = 1000316012)
    alias ACCELERATION_STRUCTURE_CAPTURE_DESCRIPTOR_DATA_INFO_EXT = StructureType(raw = 1000316009)
    alias PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_FEATURES_EXT = StructureType(raw = 1000320000)
    alias PHYSICAL_DEVICE_GRAPHICS_PIPELINE_LIBRARY_PROPERTIES_EXT = StructureType(raw = 1000320001)
    alias GRAPHICS_PIPELINE_LIBRARY_CREATE_INFO_EXT = StructureType(raw = 1000320002)
    alias PHYSICAL_DEVICE_SHADER_EARLY_AND_LATE_FRAGMENT_TESTS_FEATURES_AMD = StructureType(raw = 1000321000)
    alias PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_FEATURES_KHR = StructureType(raw = 1000203000)
    alias PHYSICAL_DEVICE_FRAGMENT_SHADER_BARYCENTRIC_PROPERTIES_KHR = StructureType(raw = 1000322000)
    alias PHYSICAL_DEVICE_SHADER_SUBGROUP_UNIFORM_CONTROL_FLOW_FEATURES_KHR = StructureType(raw = 1000323000)
    alias PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_PROPERTIES_NV = StructureType(raw = 1000326000)
    alias PHYSICAL_DEVICE_FRAGMENT_SHADING_RATE_ENUMS_FEATURES_NV = StructureType(raw = 1000326001)
    alias PIPELINE_FRAGMENT_SHADING_RATE_ENUM_STATE_CREATE_INFO_NV = StructureType(raw = 1000326002)
    alias ACCELERATION_STRUCTURE_GEOMETRY_MOTION_TRIANGLES_DATA_NV = StructureType(raw = 1000327000)
    alias PHYSICAL_DEVICE_RAY_TRACING_MOTION_BLUR_FEATURES_NV = StructureType(raw = 1000327001)
    alias ACCELERATION_STRUCTURE_MOTION_INFO_NV = StructureType(raw = 1000327002)
    alias PHYSICAL_DEVICE_MESH_SHADER_FEATURES_EXT = StructureType(raw = 1000328000)
    alias PHYSICAL_DEVICE_MESH_SHADER_PROPERTIES_EXT = StructureType(raw = 1000328001)
    alias PHYSICAL_DEVICE_YCBCR_2_PLANE_444_FORMATS_FEATURES_EXT = StructureType(raw = 1000330000)
    alias PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_FEATURES_EXT = StructureType(raw = 1000332000)
    alias PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_2_PROPERTIES_EXT = StructureType(raw = 1000332001)
    alias COPY_COMMAND_TRANSFORM_INFO_QCOM = StructureType(raw = 1000333000)
    alias PHYSICAL_DEVICE_WORKGROUP_MEMORY_EXPLICIT_LAYOUT_FEATURES_KHR = StructureType(raw = 1000336000)
    alias PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_FEATURES_EXT = StructureType(raw = 1000338000)
    alias IMAGE_COMPRESSION_CONTROL_EXT = StructureType(raw = 1000338001)
    alias IMAGE_COMPRESSION_PROPERTIES_EXT = StructureType(raw = 1000338004)
    alias PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_LAYOUT_FEATURES_EXT = StructureType(raw = 1000339000)
    alias PHYSICAL_DEVICE_4444_FORMATS_FEATURES_EXT = StructureType(raw = 1000340000)
    alias PHYSICAL_DEVICE_FAULT_FEATURES_EXT = StructureType(raw = 1000341000)
    alias DEVICE_FAULT_COUNTS_EXT = StructureType(raw = 1000341001)
    alias DEVICE_FAULT_INFO_EXT = StructureType(raw = 1000341002)
    alias PHYSICAL_DEVICE_RGBA10X6_FORMATS_FEATURES_EXT = StructureType(raw = 1000344000)
    alias DIRECTFB_SURFACE_CREATE_INFO_EXT = StructureType(raw = 1000346000)
    alias PHYSICAL_DEVICE_VERTEX_INPUT_DYNAMIC_STATE_FEATURES_EXT = StructureType(raw = 1000352000)
    alias VERTEX_INPUT_BINDING_DESCRIPTION_2_EXT = StructureType(raw = 1000352001)
    alias VERTEX_INPUT_ATTRIBUTE_DESCRIPTION_2_EXT = StructureType(raw = 1000352002)
    alias PHYSICAL_DEVICE_DRM_PROPERTIES_EXT = StructureType(raw = 1000353000)
    alias PHYSICAL_DEVICE_ADDRESS_BINDING_REPORT_FEATURES_EXT = StructureType(raw = 1000354000)
    alias DEVICE_ADDRESS_BINDING_CALLBACK_DATA_EXT = StructureType(raw = 1000354001)
    alias PHYSICAL_DEVICE_DEPTH_CLIP_CONTROL_FEATURES_EXT = StructureType(raw = 1000355000)
    alias PIPELINE_VIEWPORT_DEPTH_CLIP_CONTROL_CREATE_INFO_EXT = StructureType(raw = 1000355001)
    alias PHYSICAL_DEVICE_PRIMITIVE_TOPOLOGY_LIST_RESTART_FEATURES_EXT = StructureType(raw = 1000356000)
    alias IMPORT_MEMORY_ZIRCON_HANDLE_INFO_FUCHSIA = StructureType(raw = 1000364000)
    alias MEMORY_ZIRCON_HANDLE_PROPERTIES_FUCHSIA = StructureType(raw = 1000364001)
    alias MEMORY_GET_ZIRCON_HANDLE_INFO_FUCHSIA = StructureType(raw = 1000364002)
    alias IMPORT_SEMAPHORE_ZIRCON_HANDLE_INFO_FUCHSIA = StructureType(raw = 1000365000)
    alias SEMAPHORE_GET_ZIRCON_HANDLE_INFO_FUCHSIA = StructureType(raw = 1000365001)
    alias BUFFER_COLLECTION_CREATE_INFO_FUCHSIA = StructureType(raw = 1000366000)
    alias IMPORT_MEMORY_BUFFER_COLLECTION_FUCHSIA = StructureType(raw = 1000366001)
    alias BUFFER_COLLECTION_IMAGE_CREATE_INFO_FUCHSIA = StructureType(raw = 1000366002)
    alias BUFFER_COLLECTION_PROPERTIES_FUCHSIA = StructureType(raw = 1000366003)
    alias BUFFER_CONSTRAINTS_INFO_FUCHSIA = StructureType(raw = 1000366004)
    alias BUFFER_COLLECTION_BUFFER_CREATE_INFO_FUCHSIA = StructureType(raw = 1000366005)
    alias IMAGE_CONSTRAINTS_INFO_FUCHSIA = StructureType(raw = 1000366006)
    alias IMAGE_FORMAT_CONSTRAINTS_INFO_FUCHSIA = StructureType(raw = 1000366007)
    alias SYSMEM_COLOR_SPACE_FUCHSIA = StructureType(raw = 1000366008)
    alias BUFFER_COLLECTION_CONSTRAINTS_INFO_FUCHSIA = StructureType(raw = 1000366009)
    alias SUBPASS_SHADING_PIPELINE_CREATE_INFO_HUAWEI = StructureType(raw = 1000369000)
    alias PHYSICAL_DEVICE_SUBPASS_SHADING_FEATURES_HUAWEI = StructureType(raw = 1000369001)
    alias PHYSICAL_DEVICE_SUBPASS_SHADING_PROPERTIES_HUAWEI = StructureType(raw = 1000369002)
    alias PHYSICAL_DEVICE_INVOCATION_MASK_FEATURES_HUAWEI = StructureType(raw = 1000370000)
    alias MEMORY_GET_REMOTE_ADDRESS_INFO_NV = StructureType(raw = 1000371000)
    alias PHYSICAL_DEVICE_EXTERNAL_MEMORY_RDMA_FEATURES_NV = StructureType(raw = 1000371001)
    alias PIPELINE_PROPERTIES_IDENTIFIER_EXT = StructureType(raw = 1000372000)
    alias PHYSICAL_DEVICE_PIPELINE_PROPERTIES_FEATURES_EXT = StructureType(raw = 1000372001)
    alias IMPORT_FENCE_SCI_SYNC_INFO_NV = StructureType(raw = 1000373000)
    alias EXPORT_FENCE_SCI_SYNC_INFO_NV = StructureType(raw = 1000373001)
    alias FENCE_GET_SCI_SYNC_INFO_NV = StructureType(raw = 1000373002)
    alias SCI_SYNC_ATTRIBUTES_INFO_NV = StructureType(raw = 1000373003)
    alias IMPORT_SEMAPHORE_SCI_SYNC_INFO_NV = StructureType(raw = 1000373004)
    alias EXPORT_SEMAPHORE_SCI_SYNC_INFO_NV = StructureType(raw = 1000373005)
    alias SEMAPHORE_GET_SCI_SYNC_INFO_NV = StructureType(raw = 1000373006)
    alias PHYSICAL_DEVICE_EXTERNAL_SCI_SYNC_FEATURES_NV = StructureType(raw = 1000373007)
    alias IMPORT_MEMORY_SCI_BUF_INFO_NV = StructureType(raw = 1000374000)
    alias EXPORT_MEMORY_SCI_BUF_INFO_NV = StructureType(raw = 1000374001)
    alias MEMORY_GET_SCI_BUF_INFO_NV = StructureType(raw = 1000374002)
    alias MEMORY_SCI_BUF_PROPERTIES_NV = StructureType(raw = 1000374003)
    alias PHYSICAL_DEVICE_EXTERNAL_MEMORY_SCI_BUF_FEATURES_NV = StructureType(raw = 1000374004)
    alias PHYSICAL_DEVICE_FRAME_BOUNDARY_FEATURES_EXT = StructureType(raw = 1000375000)
    alias FRAME_BOUNDARY_EXT = StructureType(raw = 1000375001)
    alias PHYSICAL_DEVICE_MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_FEATURES_EXT = StructureType(raw = 1000376000)
    alias SUBPASS_RESOLVE_PERFORMANCE_QUERY_EXT = StructureType(raw = 1000376001)
    alias MULTISAMPLED_RENDER_TO_SINGLE_SAMPLED_INFO_EXT = StructureType(raw = 1000376002)
    alias PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_2_FEATURES_EXT = StructureType(raw = 1000377000)
    alias SCREEN_SURFACE_CREATE_INFO_QNX = StructureType(raw = 1000378000)
    alias PHYSICAL_DEVICE_COLOR_WRITE_ENABLE_FEATURES_EXT = StructureType(raw = 1000381000)
    alias PIPELINE_COLOR_WRITE_CREATE_INFO_EXT = StructureType(raw = 1000381001)
    alias PHYSICAL_DEVICE_PRIMITIVES_GENERATED_QUERY_FEATURES_EXT = StructureType(raw = 1000382000)
    alias PHYSICAL_DEVICE_RAY_TRACING_MAINTENANCE_1_FEATURES_KHR = StructureType(raw = 1000386000)
    alias PHYSICAL_DEVICE_SHADER_UNTYPED_POINTERS_FEATURES_KHR = StructureType(raw = 1000387000)
    alias PHYSICAL_DEVICE_VIDEO_ENCODE_RGB_CONVERSION_FEATURES_VALVE = StructureType(raw = 1000390000)
    alias VIDEO_ENCODE_RGB_CONVERSION_CAPABILITIES_VALVE = StructureType(raw = 1000390001)
    alias VIDEO_ENCODE_PROFILE_RGB_CONVERSION_INFO_VALVE = StructureType(raw = 1000390002)
    alias VIDEO_ENCODE_SESSION_RGB_CONVERSION_CREATE_INFO_VALVE = StructureType(raw = 1000390003)
    alias PHYSICAL_DEVICE_IMAGE_VIEW_MIN_LOD_FEATURES_EXT = StructureType(raw = 1000391000)
    alias IMAGE_VIEW_MIN_LOD_CREATE_INFO_EXT = StructureType(raw = 1000391001)
    alias PHYSICAL_DEVICE_MULTI_DRAW_FEATURES_EXT = StructureType(raw = 1000392000)
    alias PHYSICAL_DEVICE_MULTI_DRAW_PROPERTIES_EXT = StructureType(raw = 1000392001)
    alias PHYSICAL_DEVICE_IMAGE_2D_VIEW_OF_3D_FEATURES_EXT = StructureType(raw = 1000393000)
    alias PHYSICAL_DEVICE_SHADER_TILE_IMAGE_FEATURES_EXT = StructureType(raw = 1000395000)
    alias PHYSICAL_DEVICE_SHADER_TILE_IMAGE_PROPERTIES_EXT = StructureType(raw = 1000395001)
    alias MICROMAP_BUILD_INFO_EXT = StructureType(raw = 1000396000)
    alias MICROMAP_VERSION_INFO_EXT = StructureType(raw = 1000396001)
    alias COPY_MICROMAP_INFO_EXT = StructureType(raw = 1000396002)
    alias COPY_MICROMAP_TO_MEMORY_INFO_EXT = StructureType(raw = 1000396003)
    alias COPY_MEMORY_TO_MICROMAP_INFO_EXT = StructureType(raw = 1000396004)
    alias PHYSICAL_DEVICE_OPACITY_MICROMAP_FEATURES_EXT = StructureType(raw = 1000396005)
    alias PHYSICAL_DEVICE_OPACITY_MICROMAP_PROPERTIES_EXT = StructureType(raw = 1000396006)
    alias MICROMAP_CREATE_INFO_EXT = StructureType(raw = 1000396007)
    alias MICROMAP_BUILD_SIZES_INFO_EXT = StructureType(raw = 1000396008)
    alias ACCELERATION_STRUCTURE_TRIANGLES_OPACITY_MICROMAP_EXT = StructureType(raw = 1000396009)
    alias PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_FEATURES_NV = StructureType(raw = 1000397000)
    alias PHYSICAL_DEVICE_DISPLACEMENT_MICROMAP_PROPERTIES_NV = StructureType(raw = 1000397001)
    alias ACCELERATION_STRUCTURE_TRIANGLES_DISPLACEMENT_MICROMAP_NV = StructureType(raw = 1000397002)
    alias PHYSICAL_DEVICE_CLUSTER_CULLING_SHADER_FEATURES_HUAWEI = StructureType(raw = 1000404000)
    alias PHYSICAL_DEVICE_CLUSTER_CULLING_SHADER_PROPERTIES_HUAWEI = StructureType(raw = 1000404001)
    alias PHYSICAL_DEVICE_CLUSTER_CULLING_SHADER_VRS_FEATURES_HUAWEI = StructureType(raw = 1000404002)
    alias PHYSICAL_DEVICE_BORDER_COLOR_SWIZZLE_FEATURES_EXT = StructureType(raw = 1000411000)
    alias SAMPLER_BORDER_COLOR_COMPONENT_MAPPING_CREATE_INFO_EXT = StructureType(raw = 1000411001)
    alias PHYSICAL_DEVICE_PAGEABLE_DEVICE_LOCAL_MEMORY_FEATURES_EXT = StructureType(raw = 1000412000)
    alias PHYSICAL_DEVICE_SHADER_CORE_PROPERTIES_ARM = StructureType(raw = 1000415000)
    alias DEVICE_QUEUE_SHADER_CORE_CONTROL_CREATE_INFO_ARM = StructureType(raw = 1000417000)
    alias PHYSICAL_DEVICE_SCHEDULING_CONTROLS_FEATURES_ARM = StructureType(raw = 1000417001)
    alias PHYSICAL_DEVICE_SCHEDULING_CONTROLS_PROPERTIES_ARM = StructureType(raw = 1000417002)
    alias PHYSICAL_DEVICE_IMAGE_SLICED_VIEW_OF_3D_FEATURES_EXT = StructureType(raw = 1000418000)
    alias IMAGE_VIEW_SLICED_CREATE_INFO_EXT = StructureType(raw = 1000418001)
    alias PHYSICAL_DEVICE_DESCRIPTOR_SET_HOST_MAPPING_FEATURES_VALVE = StructureType(raw = 1000420000)
    alias DESCRIPTOR_SET_BINDING_REFERENCE_VALVE = StructureType(raw = 1000420001)
    alias DESCRIPTOR_SET_LAYOUT_HOST_MAPPING_INFO_VALVE = StructureType(raw = 1000420002)
    alias PHYSICAL_DEVICE_NON_SEAMLESS_CUBE_MAP_FEATURES_EXT = StructureType(raw = 1000422000)
    alias PHYSICAL_DEVICE_RENDER_PASS_STRIPED_FEATURES_ARM = StructureType(raw = 1000424000)
    alias PHYSICAL_DEVICE_RENDER_PASS_STRIPED_PROPERTIES_ARM = StructureType(raw = 1000424001)
    alias RENDER_PASS_STRIPE_BEGIN_INFO_ARM = StructureType(raw = 1000424002)
    alias RENDER_PASS_STRIPE_INFO_ARM = StructureType(raw = 1000424003)
    alias RENDER_PASS_STRIPE_SUBMIT_INFO_ARM = StructureType(raw = 1000424004)
    alias PHYSICAL_DEVICE_COPY_MEMORY_INDIRECT_FEATURES_NV = StructureType(raw = 1000426000)
    alias PHYSICAL_DEVICE_COPY_MEMORY_INDIRECT_PROPERTIES_NV = StructureType(raw = 1000426001)
    alias PHYSICAL_DEVICE_MEMORY_DECOMPRESSION_FEATURES_NV = StructureType(raw = 1000427000)
    alias PHYSICAL_DEVICE_MEMORY_DECOMPRESSION_PROPERTIES_NV = StructureType(raw = 1000427001)
    alias PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_COMPUTE_FEATURES_NV = StructureType(raw = 1000428000)
    alias COMPUTE_PIPELINE_INDIRECT_BUFFER_INFO_NV = StructureType(raw = 1000428001)
    alias PIPELINE_INDIRECT_DEVICE_ADDRESS_INFO_NV = StructureType(raw = 1000428002)
    alias PHYSICAL_DEVICE_RAY_TRACING_LINEAR_SWEPT_SPHERES_FEATURES_NV = StructureType(raw = 1000429008)
    alias ACCELERATION_STRUCTURE_GEOMETRY_LINEAR_SWEPT_SPHERES_DATA_NV = StructureType(raw = 1000429009)
    alias ACCELERATION_STRUCTURE_GEOMETRY_SPHERES_DATA_NV = StructureType(raw = 1000429010)
    alias PHYSICAL_DEVICE_LINEAR_COLOR_ATTACHMENT_FEATURES_NV = StructureType(raw = 1000430000)
    alias PHYSICAL_DEVICE_SHADER_MAXIMAL_RECONVERGENCE_FEATURES_KHR = StructureType(raw = 1000434000)
    alias APPLICATION_PARAMETERS_EXT = StructureType(raw = 1000435000)
    alias PHYSICAL_DEVICE_IMAGE_COMPRESSION_CONTROL_SWAPCHAIN_FEATURES_EXT = StructureType(raw = 1000437000)
    alias PHYSICAL_DEVICE_IMAGE_PROCESSING_FEATURES_QCOM = StructureType(raw = 1000440000)
    alias PHYSICAL_DEVICE_IMAGE_PROCESSING_PROPERTIES_QCOM = StructureType(raw = 1000440001)
    alias IMAGE_VIEW_SAMPLE_WEIGHT_CREATE_INFO_QCOM = StructureType(raw = 1000440002)
    alias PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_FEATURES_EXT = StructureType(raw = 1000451000)
    alias PHYSICAL_DEVICE_NESTED_COMMAND_BUFFER_PROPERTIES_EXT = StructureType(raw = 1000451001)
    alias EXTERNAL_MEMORY_ACQUIRE_UNMODIFIED_EXT = StructureType(raw = 1000453000)
    alias PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_FEATURES_EXT = StructureType(raw = 1000455000)
    alias PHYSICAL_DEVICE_EXTENDED_DYNAMIC_STATE_3_PROPERTIES_EXT = StructureType(raw = 1000455001)
    alias PHYSICAL_DEVICE_SUBPASS_MERGE_FEEDBACK_FEATURES_EXT = StructureType(raw = 1000458000)
    alias RENDER_PASS_CREATION_CONTROL_EXT = StructureType(raw = 1000458001)
    alias RENDER_PASS_CREATION_FEEDBACK_CREATE_INFO_EXT = StructureType(raw = 1000458002)
    alias RENDER_PASS_SUBPASS_FEEDBACK_CREATE_INFO_EXT = StructureType(raw = 1000458003)
    alias DIRECT_DRIVER_LOADING_INFO_LUNARG = StructureType(raw = 1000459000)
    alias DIRECT_DRIVER_LOADING_LIST_LUNARG = StructureType(raw = 1000459001)
    alias TENSOR_CREATE_INFO_ARM = StructureType(raw = 1000460000)
    alias TENSOR_VIEW_CREATE_INFO_ARM = StructureType(raw = 1000460001)
    alias BIND_TENSOR_MEMORY_INFO_ARM = StructureType(raw = 1000460002)
    alias WRITE_DESCRIPTOR_SET_TENSOR_ARM = StructureType(raw = 1000460003)
    alias PHYSICAL_DEVICE_TENSOR_PROPERTIES_ARM = StructureType(raw = 1000460004)
    alias TENSOR_FORMAT_PROPERTIES_ARM = StructureType(raw = 1000460005)
    alias TENSOR_DESCRIPTION_ARM = StructureType(raw = 1000460006)
    alias TENSOR_MEMORY_REQUIREMENTS_INFO_ARM = StructureType(raw = 1000460007)
    alias TENSOR_MEMORY_BARRIER_ARM = StructureType(raw = 1000460008)
    alias PHYSICAL_DEVICE_TENSOR_FEATURES_ARM = StructureType(raw = 1000460009)
    alias DEVICE_TENSOR_MEMORY_REQUIREMENTS_ARM = StructureType(raw = 1000460010)
    alias COPY_TENSOR_INFO_ARM = StructureType(raw = 1000460011)
    alias TENSOR_COPY_ARM = StructureType(raw = 1000460012)
    alias TENSOR_DEPENDENCY_INFO_ARM = StructureType(raw = 1000460013)
    alias MEMORY_DEDICATED_ALLOCATE_INFO_TENSOR_ARM = StructureType(raw = 1000460014)
    alias PHYSICAL_DEVICE_EXTERNAL_TENSOR_INFO_ARM = StructureType(raw = 1000460015)
    alias EXTERNAL_TENSOR_PROPERTIES_ARM = StructureType(raw = 1000460016)
    alias EXTERNAL_MEMORY_TENSOR_CREATE_INFO_ARM = StructureType(raw = 1000460017)
    alias PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_TENSOR_FEATURES_ARM = StructureType(raw = 1000460018)
    alias PHYSICAL_DEVICE_DESCRIPTOR_BUFFER_TENSOR_PROPERTIES_ARM = StructureType(raw = 1000460019)
    alias DESCRIPTOR_GET_TENSOR_INFO_ARM = StructureType(raw = 1000460020)
    alias TENSOR_CAPTURE_DESCRIPTOR_DATA_INFO_ARM = StructureType(raw = 1000460021)
    alias TENSOR_VIEW_CAPTURE_DESCRIPTOR_DATA_INFO_ARM = StructureType(raw = 1000460022)
    alias FRAME_BOUNDARY_TENSORS_ARM = StructureType(raw = 1000460023)
    alias PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_FEATURES_EXT = StructureType(raw = 1000462000)
    alias PHYSICAL_DEVICE_SHADER_MODULE_IDENTIFIER_PROPERTIES_EXT = StructureType(raw = 1000462001)
    alias PIPELINE_SHADER_STAGE_MODULE_IDENTIFIER_CREATE_INFO_EXT = StructureType(raw = 1000462002)
    alias SHADER_MODULE_IDENTIFIER_EXT = StructureType(raw = 1000462003)
    alias PHYSICAL_DEVICE_RASTERIZATION_ORDER_ATTACHMENT_ACCESS_FEATURES_EXT = StructureType(raw = 1000342000)
    alias PHYSICAL_DEVICE_OPTICAL_FLOW_FEATURES_NV = StructureType(raw = 1000464000)
    alias PHYSICAL_DEVICE_OPTICAL_FLOW_PROPERTIES_NV = StructureType(raw = 1000464001)
    alias OPTICAL_FLOW_IMAGE_FORMAT_INFO_NV = StructureType(raw = 1000464002)
    alias OPTICAL_FLOW_IMAGE_FORMAT_PROPERTIES_NV = StructureType(raw = 1000464003)
    alias OPTICAL_FLOW_SESSION_CREATE_INFO_NV = StructureType(raw = 1000464004)
    alias OPTICAL_FLOW_EXECUTE_INFO_NV = StructureType(raw = 1000464005)
    alias OPTICAL_FLOW_SESSION_CREATE_PRIVATE_DATA_INFO_NV = StructureType(raw = 1000464010)
    alias PHYSICAL_DEVICE_LEGACY_DITHERING_FEATURES_EXT = StructureType(raw = 1000465000)
    alias PHYSICAL_DEVICE_EXTERNAL_FORMAT_RESOLVE_FEATURES_ANDROID = StructureType(raw = 1000468000)
    alias PHYSICAL_DEVICE_EXTERNAL_FORMAT_RESOLVE_PROPERTIES_ANDROID = StructureType(raw = 1000468001)
    alias ANDROID_HARDWARE_BUFFER_FORMAT_RESOLVE_PROPERTIES_ANDROID = StructureType(raw = 1000468002)
    alias PHYSICAL_DEVICE_ANTI_LAG_FEATURES_AMD = StructureType(raw = 1000476000)
    alias ANTI_LAG_DATA_AMD = StructureType(raw = 1000476001)
    alias ANTI_LAG_PRESENTATION_INFO_AMD = StructureType(raw = 1000476002)
    alias PHYSICAL_DEVICE_DENSE_GEOMETRY_FORMAT_FEATURES_AMDX = StructureType(raw = 1000478000)
    alias ACCELERATION_STRUCTURE_DENSE_GEOMETRY_FORMAT_TRIANGLES_DATA_AMDX = StructureType(raw = 1000478001)
    alias SURFACE_CAPABILITIES_PRESENT_ID_2_KHR = StructureType(raw = 1000479000)
    alias PRESENT_ID_2_KHR = StructureType(raw = 1000479001)
    alias PHYSICAL_DEVICE_PRESENT_ID_2_FEATURES_KHR = StructureType(raw = 1000479002)
    alias SURFACE_CAPABILITIES_PRESENT_WAIT_2_KHR = StructureType(raw = 1000480000)
    alias PHYSICAL_DEVICE_PRESENT_WAIT_2_FEATURES_KHR = StructureType(raw = 1000480001)
    alias PRESENT_WAIT_2_INFO_KHR = StructureType(raw = 1000480002)
    alias PHYSICAL_DEVICE_RAY_TRACING_POSITION_FETCH_FEATURES_KHR = StructureType(raw = 1000481000)
    alias PHYSICAL_DEVICE_SHADER_OBJECT_FEATURES_EXT = StructureType(raw = 1000482000)
    alias PHYSICAL_DEVICE_SHADER_OBJECT_PROPERTIES_EXT = StructureType(raw = 1000482001)
    alias SHADER_CREATE_INFO_EXT = StructureType(raw = 1000482002)
    alias PHYSICAL_DEVICE_PIPELINE_BINARY_FEATURES_KHR = StructureType(raw = 1000483000)
    alias PIPELINE_BINARY_CREATE_INFO_KHR = StructureType(raw = 1000483001)
    alias PIPELINE_BINARY_INFO_KHR = StructureType(raw = 1000483002)
    alias PIPELINE_BINARY_KEY_KHR = StructureType(raw = 1000483003)
    alias PHYSICAL_DEVICE_PIPELINE_BINARY_PROPERTIES_KHR = StructureType(raw = 1000483004)
    alias RELEASE_CAPTURED_PIPELINE_DATA_INFO_KHR = StructureType(raw = 1000483005)
    alias PIPELINE_BINARY_DATA_INFO_KHR = StructureType(raw = 1000483006)
    alias PIPELINE_CREATE_INFO_KHR = StructureType(raw = 1000483007)
    alias DEVICE_PIPELINE_BINARY_INTERNAL_CACHE_CONTROL_KHR = StructureType(raw = 1000483008)
    alias PIPELINE_BINARY_HANDLES_INFO_KHR = StructureType(raw = 1000483009)
    alias PHYSICAL_DEVICE_TILE_PROPERTIES_FEATURES_QCOM = StructureType(raw = 1000484000)
    alias TILE_PROPERTIES_QCOM = StructureType(raw = 1000484001)
    alias PHYSICAL_DEVICE_AMIGO_PROFILING_FEATURES_SEC = StructureType(raw = 1000485000)
    alias AMIGO_PROFILING_SUBMIT_INFO_SEC = StructureType(raw = 1000485001)
    alias SURFACE_PRESENT_MODE_KHR = StructureType(raw = 1000274000)
    alias SURFACE_PRESENT_SCALING_CAPABILITIES_KHR = StructureType(raw = 1000274001)
    alias SURFACE_PRESENT_MODE_COMPATIBILITY_KHR = StructureType(raw = 1000274002)
    alias PHYSICAL_DEVICE_SWAPCHAIN_MAINTENANCE_1_FEATURES_KHR = StructureType(raw = 1000275000)
    alias SWAPCHAIN_PRESENT_FENCE_INFO_KHR = StructureType(raw = 1000275001)
    alias SWAPCHAIN_PRESENT_MODES_CREATE_INFO_KHR = StructureType(raw = 1000275002)
    alias SWAPCHAIN_PRESENT_MODE_INFO_KHR = StructureType(raw = 1000275003)
    alias SWAPCHAIN_PRESENT_SCALING_CREATE_INFO_KHR = StructureType(raw = 1000275004)
    alias RELEASE_SWAPCHAIN_IMAGES_INFO_KHR = StructureType(raw = 1000275005)
    alias PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_VIEWPORTS_FEATURES_QCOM = StructureType(raw = 1000488000)
    alias SEMAPHORE_SCI_SYNC_POOL_CREATE_INFO_NV = StructureType(raw = 1000489000)
    alias SEMAPHORE_SCI_SYNC_CREATE_INFO_NV = StructureType(raw = 1000489001)
    alias PHYSICAL_DEVICE_EXTERNAL_SCI_SYNC_2_FEATURES_NV = StructureType(raw = 1000489002)
    alias DEVICE_SEMAPHORE_SCI_SYNC_POOL_RESERVATION_CREATE_INFO_NV = StructureType(raw = 1000489003)
    alias PHYSICAL_DEVICE_RAY_TRACING_INVOCATION_REORDER_FEATURES_NV = StructureType(raw = 1000490000)
    alias PHYSICAL_DEVICE_RAY_TRACING_INVOCATION_REORDER_PROPERTIES_NV = StructureType(raw = 1000490001)
    alias PHYSICAL_DEVICE_COOPERATIVE_VECTOR_FEATURES_NV = StructureType(raw = 1000491000)
    alias PHYSICAL_DEVICE_COOPERATIVE_VECTOR_PROPERTIES_NV = StructureType(raw = 1000491001)
    alias COOPERATIVE_VECTOR_PROPERTIES_NV = StructureType(raw = 1000491002)
    alias CONVERT_COOPERATIVE_VECTOR_MATRIX_INFO_NV = StructureType(raw = 1000491004)
    alias PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_FEATURES_NV = StructureType(raw = 1000492000)
    alias PHYSICAL_DEVICE_EXTENDED_SPARSE_ADDRESS_SPACE_PROPERTIES_NV = StructureType(raw = 1000492001)
    alias PHYSICAL_DEVICE_MUTABLE_DESCRIPTOR_TYPE_FEATURES_EXT = StructureType(raw = 1000351000)
    alias MUTABLE_DESCRIPTOR_TYPE_CREATE_INFO_EXT = StructureType(raw = 1000351002)
    alias PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_FEATURES_EXT = StructureType(raw = 1000495000)
    alias PHYSICAL_DEVICE_LEGACY_VERTEX_ATTRIBUTES_PROPERTIES_EXT = StructureType(raw = 1000495001)
    alias LAYER_SETTINGS_CREATE_INFO_EXT = StructureType(raw = 1000496000)
    alias PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_FEATURES_ARM = StructureType(raw = 1000497000)
    alias PHYSICAL_DEVICE_SHADER_CORE_BUILTINS_PROPERTIES_ARM = StructureType(raw = 1000497001)
    alias PHYSICAL_DEVICE_PIPELINE_LIBRARY_GROUP_HANDLES_FEATURES_EXT = StructureType(raw = 1000498000)
    alias PHYSICAL_DEVICE_DYNAMIC_RENDERING_UNUSED_ATTACHMENTS_FEATURES_EXT = StructureType(raw = 1000499000)
    alias LATENCY_SLEEP_MODE_INFO_NV = StructureType(raw = 1000505000)
    alias LATENCY_SLEEP_INFO_NV = StructureType(raw = 1000505001)
    alias SET_LATENCY_MARKER_INFO_NV = StructureType(raw = 1000505002)
    alias GET_LATENCY_MARKER_INFO_NV = StructureType(raw = 1000505003)
    alias LATENCY_TIMINGS_FRAME_REPORT_NV = StructureType(raw = 1000505004)
    alias LATENCY_SUBMISSION_PRESENT_ID_NV = StructureType(raw = 1000505005)
    alias OUT_OF_BAND_QUEUE_TYPE_INFO_NV = StructureType(raw = 1000505006)
    alias SWAPCHAIN_LATENCY_CREATE_INFO_NV = StructureType(raw = 1000505007)
    alias LATENCY_SURFACE_CAPABILITIES_NV = StructureType(raw = 1000505008)
    alias PHYSICAL_DEVICE_COOPERATIVE_MATRIX_FEATURES_KHR = StructureType(raw = 1000506000)
    alias COOPERATIVE_MATRIX_PROPERTIES_KHR = StructureType(raw = 1000506001)
    alias PHYSICAL_DEVICE_COOPERATIVE_MATRIX_PROPERTIES_KHR = StructureType(raw = 1000506002)
    alias DATA_GRAPH_PIPELINE_CREATE_INFO_ARM = StructureType(raw = 1000507000)
    alias DATA_GRAPH_PIPELINE_SESSION_CREATE_INFO_ARM = StructureType(raw = 1000507001)
    alias DATA_GRAPH_PIPELINE_RESOURCE_INFO_ARM = StructureType(raw = 1000507002)
    alias DATA_GRAPH_PIPELINE_CONSTANT_ARM = StructureType(raw = 1000507003)
    alias DATA_GRAPH_PIPELINE_SESSION_MEMORY_REQUIREMENTS_INFO_ARM = StructureType(raw = 1000507004)
    alias BIND_DATA_GRAPH_PIPELINE_SESSION_MEMORY_INFO_ARM = StructureType(raw = 1000507005)
    alias PHYSICAL_DEVICE_DATA_GRAPH_FEATURES_ARM = StructureType(raw = 1000507006)
    alias DATA_GRAPH_PIPELINE_SHADER_MODULE_CREATE_INFO_ARM = StructureType(raw = 1000507007)
    alias DATA_GRAPH_PIPELINE_PROPERTY_QUERY_RESULT_ARM = StructureType(raw = 1000507008)
    alias DATA_GRAPH_PIPELINE_INFO_ARM = StructureType(raw = 1000507009)
    alias DATA_GRAPH_PIPELINE_COMPILER_CONTROL_CREATE_INFO_ARM = StructureType(raw = 1000507010)
    alias DATA_GRAPH_PIPELINE_SESSION_BIND_POINT_REQUIREMENTS_INFO_ARM = StructureType(raw = 1000507011)
    alias DATA_GRAPH_PIPELINE_SESSION_BIND_POINT_REQUIREMENT_ARM = StructureType(raw = 1000507012)
    alias DATA_GRAPH_PIPELINE_IDENTIFIER_CREATE_INFO_ARM = StructureType(raw = 1000507013)
    alias DATA_GRAPH_PIPELINE_DISPATCH_INFO_ARM = StructureType(raw = 1000507014)
    alias DATA_GRAPH_PROCESSING_ENGINE_CREATE_INFO_ARM = StructureType(raw = 1000507016)
    alias QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_PROPERTIES_ARM = StructureType(raw = 1000507017)
    alias QUEUE_FAMILY_DATA_GRAPH_PROPERTIES_ARM = StructureType(raw = 1000507018)
    alias PHYSICAL_DEVICE_QUEUE_FAMILY_DATA_GRAPH_PROCESSING_ENGINE_INFO_ARM = StructureType(raw = 1000507019)
    alias DATA_GRAPH_PIPELINE_CONSTANT_TENSOR_SEMI_STRUCTURED_SPARSITY_INFO_ARM = StructureType(raw = 1000507015)
    alias PHYSICAL_DEVICE_MULTIVIEW_PER_VIEW_RENDER_AREAS_FEATURES_QCOM = StructureType(raw = 1000510000)
    alias MULTIVIEW_PER_VIEW_RENDER_AREAS_RENDER_PASS_BEGIN_INFO_QCOM = StructureType(raw = 1000510001)
    alias PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_FEATURES_KHR = StructureType(raw = 1000201000)
    alias PHYSICAL_DEVICE_COMPUTE_SHADER_DERIVATIVES_PROPERTIES_KHR = StructureType(raw = 1000511000)
    alias VIDEO_DECODE_AV1_CAPABILITIES_KHR = StructureType(raw = 1000512000)
    alias VIDEO_DECODE_AV1_PICTURE_INFO_KHR = StructureType(raw = 1000512001)
    alias VIDEO_DECODE_AV1_PROFILE_INFO_KHR = StructureType(raw = 1000512003)
    alias VIDEO_DECODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000512004)
    alias VIDEO_DECODE_AV1_DPB_SLOT_INFO_KHR = StructureType(raw = 1000512005)
    alias VIDEO_ENCODE_AV1_CAPABILITIES_KHR = StructureType(raw = 1000513000)
    alias VIDEO_ENCODE_AV1_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000513001)
    alias VIDEO_ENCODE_AV1_PICTURE_INFO_KHR = StructureType(raw = 1000513002)
    alias VIDEO_ENCODE_AV1_DPB_SLOT_INFO_KHR = StructureType(raw = 1000513003)
    alias PHYSICAL_DEVICE_VIDEO_ENCODE_AV1_FEATURES_KHR = StructureType(raw = 1000513004)
    alias VIDEO_ENCODE_AV1_PROFILE_INFO_KHR = StructureType(raw = 1000513005)
    alias VIDEO_ENCODE_AV1_RATE_CONTROL_INFO_KHR = StructureType(raw = 1000513006)
    alias VIDEO_ENCODE_AV1_RATE_CONTROL_LAYER_INFO_KHR = StructureType(raw = 1000513007)
    alias VIDEO_ENCODE_AV1_QUALITY_LEVEL_PROPERTIES_KHR = StructureType(raw = 1000513008)
    alias VIDEO_ENCODE_AV1_SESSION_CREATE_INFO_KHR = StructureType(raw = 1000513009)
    alias VIDEO_ENCODE_AV1_GOP_REMAINING_FRAME_INFO_KHR = StructureType(raw = 1000513010)
    alias PHYSICAL_DEVICE_VIDEO_DECODE_VP9_FEATURES_KHR = StructureType(raw = 1000514000)
    alias VIDEO_DECODE_VP9_CAPABILITIES_KHR = StructureType(raw = 1000514001)
    alias VIDEO_DECODE_VP9_PICTURE_INFO_KHR = StructureType(raw = 1000514002)
    alias VIDEO_DECODE_VP9_PROFILE_INFO_KHR = StructureType(raw = 1000514003)
    alias PHYSICAL_DEVICE_VIDEO_MAINTENANCE_1_FEATURES_KHR = StructureType(raw = 1000515000)
    alias VIDEO_INLINE_QUERY_INFO_KHR = StructureType(raw = 1000515001)
    alias PHYSICAL_DEVICE_PER_STAGE_DESCRIPTOR_SET_FEATURES_NV = StructureType(raw = 1000516000)
    alias PHYSICAL_DEVICE_IMAGE_PROCESSING_2_FEATURES_QCOM = StructureType(raw = 1000518000)
    alias PHYSICAL_DEVICE_IMAGE_PROCESSING_2_PROPERTIES_QCOM = StructureType(raw = 1000518001)
    alias SAMPLER_BLOCK_MATCH_WINDOW_CREATE_INFO_QCOM = StructureType(raw = 1000518002)
    alias SAMPLER_CUBIC_WEIGHTS_CREATE_INFO_QCOM = StructureType(raw = 1000519000)
    alias PHYSICAL_DEVICE_CUBIC_WEIGHTS_FEATURES_QCOM = StructureType(raw = 1000519001)
    alias BLIT_IMAGE_CUBIC_WEIGHTS_INFO_QCOM = StructureType(raw = 1000519002)
    alias PHYSICAL_DEVICE_YCBCR_DEGAMMA_FEATURES_QCOM = StructureType(raw = 1000520000)
    alias SAMPLER_YCBCR_CONVERSION_YCBCR_DEGAMMA_CREATE_INFO_QCOM = StructureType(raw = 1000520001)
    alias PHYSICAL_DEVICE_CUBIC_CLAMP_FEATURES_QCOM = StructureType(raw = 1000521000)
    alias PHYSICAL_DEVICE_ATTACHMENT_FEEDBACK_LOOP_DYNAMIC_STATE_FEATURES_EXT = StructureType(raw = 1000524000)
    alias PHYSICAL_DEVICE_UNIFIED_IMAGE_LAYOUTS_FEATURES_KHR = StructureType(raw = 1000527000)
    alias ATTACHMENT_FEEDBACK_LOOP_INFO_EXT = StructureType(raw = 1000527001)
    alias SCREEN_BUFFER_PROPERTIES_QNX = StructureType(raw = 1000529000)
    alias SCREEN_BUFFER_FORMAT_PROPERTIES_QNX = StructureType(raw = 1000529001)
    alias IMPORT_SCREEN_BUFFER_INFO_QNX = StructureType(raw = 1000529002)
    alias EXTERNAL_FORMAT_QNX = StructureType(raw = 1000529003)
    alias PHYSICAL_DEVICE_EXTERNAL_MEMORY_SCREEN_BUFFER_FEATURES_QNX = StructureType(raw = 1000529004)
    alias PHYSICAL_DEVICE_LAYERED_DRIVER_PROPERTIES_MSFT = StructureType(raw = 1000530000)
    alias CALIBRATED_TIMESTAMP_INFO_KHR = StructureType(raw = 1000184000)
    alias SET_DESCRIPTOR_BUFFER_OFFSETS_INFO_EXT = StructureType(raw = 1000545007)
    alias BIND_DESCRIPTOR_BUFFER_EMBEDDED_SAMPLERS_INFO_EXT = StructureType(raw = 1000545008)
    alias PHYSICAL_DEVICE_DESCRIPTOR_POOL_OVERALLOCATION_FEATURES_NV = StructureType(raw = 1000546000)
    alias PHYSICAL_DEVICE_TILE_MEMORY_HEAP_FEATURES_QCOM = StructureType(raw = 1000547000)
    alias PHYSICAL_DEVICE_TILE_MEMORY_HEAP_PROPERTIES_QCOM = StructureType(raw = 1000547001)
    alias TILE_MEMORY_REQUIREMENTS_QCOM = StructureType(raw = 1000547002)
    alias TILE_MEMORY_BIND_INFO_QCOM = StructureType(raw = 1000547003)
    alias TILE_MEMORY_SIZE_INFO_QCOM = StructureType(raw = 1000547004)
    alias DISPLAY_SURFACE_STEREO_CREATE_INFO_NV = StructureType(raw = 1000551000)
    alias DISPLAY_MODE_STEREO_PROPERTIES_NV = StructureType(raw = 1000551001)
    alias VIDEO_ENCODE_INTRA_REFRESH_CAPABILITIES_KHR = StructureType(raw = 1000552000)
    alias VIDEO_ENCODE_SESSION_INTRA_REFRESH_CREATE_INFO_KHR = StructureType(raw = 1000552001)
    alias VIDEO_ENCODE_INTRA_REFRESH_INFO_KHR = StructureType(raw = 1000552002)
    alias VIDEO_REFERENCE_INTRA_REFRESH_INFO_KHR = StructureType(raw = 1000552003)
    alias PHYSICAL_DEVICE_VIDEO_ENCODE_INTRA_REFRESH_FEATURES_KHR = StructureType(raw = 1000552004)
    alias VIDEO_ENCODE_QUANTIZATION_MAP_CAPABILITIES_KHR = StructureType(raw = 1000553000)
    alias VIDEO_FORMAT_QUANTIZATION_MAP_PROPERTIES_KHR = StructureType(raw = 1000553001)
    alias VIDEO_ENCODE_QUANTIZATION_MAP_INFO_KHR = StructureType(raw = 1000553002)
    alias VIDEO_ENCODE_QUANTIZATION_MAP_SESSION_PARAMETERS_CREATE_INFO_KHR = StructureType(raw = 1000553005)
    alias PHYSICAL_DEVICE_VIDEO_ENCODE_QUANTIZATION_MAP_FEATURES_KHR = StructureType(raw = 1000553009)
    alias VIDEO_ENCODE_H264_QUANTIZATION_MAP_CAPABILITIES_KHR = StructureType(raw = 1000553003)
    alias VIDEO_ENCODE_H265_QUANTIZATION_MAP_CAPABILITIES_KHR = StructureType(raw = 1000553004)
    alias VIDEO_FORMAT_H265_QUANTIZATION_MAP_PROPERTIES_KHR = StructureType(raw = 1000553006)
    alias VIDEO_ENCODE_AV1_QUANTIZATION_MAP_CAPABILITIES_KHR = StructureType(raw = 1000553007)
    alias VIDEO_FORMAT_AV1_QUANTIZATION_MAP_PROPERTIES_KHR = StructureType(raw = 1000553008)
    alias PHYSICAL_DEVICE_RAW_ACCESS_CHAINS_FEATURES_NV = StructureType(raw = 1000555000)
    alias EXTERNAL_COMPUTE_QUEUE_DEVICE_CREATE_INFO_NV = StructureType(raw = 1000556000)
    alias EXTERNAL_COMPUTE_QUEUE_CREATE_INFO_NV = StructureType(raw = 1000556001)
    alias EXTERNAL_COMPUTE_QUEUE_DATA_PARAMS_NV = StructureType(raw = 1000556002)
    alias PHYSICAL_DEVICE_EXTERNAL_COMPUTE_QUEUE_PROPERTIES_NV = StructureType(raw = 1000556003)
    alias PHYSICAL_DEVICE_SHADER_RELAXED_EXTENDED_INSTRUCTION_FEATURES_KHR = StructureType(raw = 1000558000)
    alias PHYSICAL_DEVICE_COMMAND_BUFFER_INHERITANCE_FEATURES_NV = StructureType(raw = 1000559000)
    alias PHYSICAL_DEVICE_MAINTENANCE_7_FEATURES_KHR = StructureType(raw = 1000562000)
    alias PHYSICAL_DEVICE_MAINTENANCE_7_PROPERTIES_KHR = StructureType(raw = 1000562001)
    alias PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_LIST_KHR = StructureType(raw = 1000562002)
    alias PHYSICAL_DEVICE_LAYERED_API_PROPERTIES_KHR = StructureType(raw = 1000562003)
    alias PHYSICAL_DEVICE_LAYERED_API_VULKAN_PROPERTIES_KHR = StructureType(raw = 1000562004)
    alias PHYSICAL_DEVICE_SHADER_ATOMIC_FLOAT16_VECTOR_FEATURES_NV = StructureType(raw = 1000563000)
    alias PHYSICAL_DEVICE_SHADER_REPLICATED_COMPOSITES_FEATURES_EXT = StructureType(raw = 1000564000)
    alias PHYSICAL_DEVICE_SHADER_FLOAT8_FEATURES_EXT = StructureType(raw = 1000567000)
    alias PHYSICAL_DEVICE_RAY_TRACING_VALIDATION_FEATURES_NV = StructureType(raw = 1000568000)
    alias PHYSICAL_DEVICE_CLUSTER_ACCELERATION_STRUCTURE_FEATURES_NV = StructureType(raw = 1000569000)
    alias PHYSICAL_DEVICE_CLUSTER_ACCELERATION_STRUCTURE_PROPERTIES_NV = StructureType(raw = 1000569001)
    alias CLUSTER_ACCELERATION_STRUCTURE_CLUSTERS_BOTTOM_LEVEL_INPUT_NV = StructureType(raw = 1000569002)
    alias CLUSTER_ACCELERATION_STRUCTURE_TRIANGLE_CLUSTER_INPUT_NV = StructureType(raw = 1000569003)
    alias CLUSTER_ACCELERATION_STRUCTURE_MOVE_OBJECTS_INPUT_NV = StructureType(raw = 1000569004)
    alias CLUSTER_ACCELERATION_STRUCTURE_INPUT_INFO_NV = StructureType(raw = 1000569005)
    alias CLUSTER_ACCELERATION_STRUCTURE_COMMANDS_INFO_NV = StructureType(raw = 1000569006)
    alias RAY_TRACING_PIPELINE_CLUSTER_ACCELERATION_STRUCTURE_CREATE_INFO_NV = StructureType(raw = 1000569007)
    alias PHYSICAL_DEVICE_PARTITIONED_ACCELERATION_STRUCTURE_FEATURES_NV = StructureType(raw = 1000570000)
    alias PHYSICAL_DEVICE_PARTITIONED_ACCELERATION_STRUCTURE_PROPERTIES_NV = StructureType(raw = 1000570001)
    alias WRITE_DESCRIPTOR_SET_PARTITIONED_ACCELERATION_STRUCTURE_NV = StructureType(raw = 1000570002)
    alias PARTITIONED_ACCELERATION_STRUCTURE_INSTANCES_INPUT_NV = StructureType(raw = 1000570003)
    alias BUILD_PARTITIONED_ACCELERATION_STRUCTURE_INFO_NV = StructureType(raw = 1000570004)
    alias PARTITIONED_ACCELERATION_STRUCTURE_FLAGS_NV = StructureType(raw = 1000570005)
    alias PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_FEATURES_EXT = StructureType(raw = 1000572000)
    alias PHYSICAL_DEVICE_DEVICE_GENERATED_COMMANDS_PROPERTIES_EXT = StructureType(raw = 1000572001)
    alias GENERATED_COMMANDS_MEMORY_REQUIREMENTS_INFO_EXT = StructureType(raw = 1000572002)
    alias INDIRECT_EXECUTION_SET_CREATE_INFO_EXT = StructureType(raw = 1000572003)
    alias GENERATED_COMMANDS_INFO_EXT = StructureType(raw = 1000572004)
    alias INDIRECT_COMMANDS_LAYOUT_CREATE_INFO_EXT = StructureType(raw = 1000572006)
    alias INDIRECT_COMMANDS_LAYOUT_TOKEN_EXT = StructureType(raw = 1000572007)
    alias WRITE_INDIRECT_EXECUTION_SET_PIPELINE_EXT = StructureType(raw = 1000572008)
    alias WRITE_INDIRECT_EXECUTION_SET_SHADER_EXT = StructureType(raw = 1000572009)
    alias INDIRECT_EXECUTION_SET_PIPELINE_INFO_EXT = StructureType(raw = 1000572010)
    alias INDIRECT_EXECUTION_SET_SHADER_INFO_EXT = StructureType(raw = 1000572011)
    alias INDIRECT_EXECUTION_SET_SHADER_LAYOUT_INFO_EXT = StructureType(raw = 1000572012)
    alias GENERATED_COMMANDS_PIPELINE_INFO_EXT = StructureType(raw = 1000572013)
    alias GENERATED_COMMANDS_SHADER_INFO_EXT = StructureType(raw = 1000572014)
    alias PHYSICAL_DEVICE_MAINTENANCE_8_FEATURES_KHR = StructureType(raw = 1000574000)
    alias MEMORY_BARRIER_ACCESS_FLAGS_3_KHR = StructureType(raw = 1000574002)
    alias PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_FEATURES_MESA = StructureType(raw = 1000575000)
    alias PHYSICAL_DEVICE_IMAGE_ALIGNMENT_CONTROL_PROPERTIES_MESA = StructureType(raw = 1000575001)
    alias IMAGE_ALIGNMENT_CONTROL_CREATE_INFO_MESA = StructureType(raw = 1000575002)
    alias PHYSICAL_DEVICE_DEPTH_CLAMP_CONTROL_FEATURES_EXT = StructureType(raw = 1000582000)
    alias PIPELINE_VIEWPORT_DEPTH_CLAMP_CONTROL_CREATE_INFO_EXT = StructureType(raw = 1000582001)
    alias PHYSICAL_DEVICE_MAINTENANCE_9_FEATURES_KHR = StructureType(raw = 1000584000)
    alias PHYSICAL_DEVICE_MAINTENANCE_9_PROPERTIES_KHR = StructureType(raw = 1000584001)
    alias QUEUE_FAMILY_OWNERSHIP_TRANSFER_PROPERTIES_KHR = StructureType(raw = 1000584002)
    alias PHYSICAL_DEVICE_VIDEO_MAINTENANCE_2_FEATURES_KHR = StructureType(raw = 1000586000)
    alias VIDEO_DECODE_H264_INLINE_SESSION_PARAMETERS_INFO_KHR = StructureType(raw = 1000586001)
    alias VIDEO_DECODE_H265_INLINE_SESSION_PARAMETERS_INFO_KHR = StructureType(raw = 1000586002)
    alias VIDEO_DECODE_AV1_INLINE_SESSION_PARAMETERS_INFO_KHR = StructureType(raw = 1000586003)
    alias SURFACE_CREATE_INFO_OHOS = StructureType(raw = 1000685000)
    alias PHYSICAL_DEVICE_HDR_VIVID_FEATURES_HUAWEI = StructureType(raw = 1000590000)
    alias HDR_VIVID_DYNAMIC_METADATA_HUAWEI = StructureType(raw = 1000590001)
    alias PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_FEATURES_NV = StructureType(raw = 1000593000)
    alias COOPERATIVE_MATRIX_FLEXIBLE_DIMENSIONS_PROPERTIES_NV = StructureType(raw = 1000593001)
    alias PHYSICAL_DEVICE_COOPERATIVE_MATRIX_2_PROPERTIES_NV = StructureType(raw = 1000593002)
    alias PHYSICAL_DEVICE_PIPELINE_OPACITY_MICROMAP_FEATURES_ARM = StructureType(raw = 1000596000)
    alias IMPORT_MEMORY_METAL_HANDLE_INFO_EXT = StructureType(raw = 1000602000)
    alias MEMORY_METAL_HANDLE_PROPERTIES_EXT = StructureType(raw = 1000602001)
    alias MEMORY_GET_METAL_HANDLE_INFO_EXT = StructureType(raw = 1000602002)
    alias PHYSICAL_DEVICE_DEPTH_CLAMP_ZERO_ONE_FEATURES_KHR = StructureType(raw = 1000421000)
    alias PHYSICAL_DEVICE_VERTEX_ATTRIBUTE_ROBUSTNESS_FEATURES_EXT = StructureType(raw = 1000608000)
    alias PHYSICAL_DEVICE_FORMAT_PACK_FEATURES_ARM = StructureType(raw = 1000609000)
    alias PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_LAYERED_FEATURES_VALVE = StructureType(raw = 1000611000)
    alias PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_LAYERED_PROPERTIES_VALVE = StructureType(raw = 1000611001)
    alias PIPELINE_FRAGMENT_DENSITY_MAP_LAYERED_CREATE_INFO_VALVE = StructureType(raw = 1000611002)
    alias PHYSICAL_DEVICE_ROBUSTNESS_2_FEATURES_KHR = StructureType(raw = 1000286000)
    alias PHYSICAL_DEVICE_ROBUSTNESS_2_PROPERTIES_KHR = StructureType(raw = 1000286001)
    alias SET_PRESENT_CONFIG_NV = StructureType(raw = 1000613000)
    alias PHYSICAL_DEVICE_PRESENT_METERING_FEATURES_NV = StructureType(raw = 1000613001)
    alias PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_FEATURES_EXT = StructureType(raw = 1000425000)
    alias PHYSICAL_DEVICE_FRAGMENT_DENSITY_MAP_OFFSET_PROPERTIES_EXT = StructureType(raw = 1000425001)
    alias RENDER_PASS_FRAGMENT_DENSITY_MAP_OFFSET_END_INFO_EXT = StructureType(raw = 1000425002)
    alias RENDERING_END_INFO_EXT = StructureType(raw = 1000619003)
    alias PHYSICAL_DEVICE_ZERO_INITIALIZE_DEVICE_MEMORY_FEATURES_EXT = StructureType(raw = 1000620000)
    alias PHYSICAL_DEVICE_PRESENT_MODE_FIFO_LATEST_READY_FEATURES_KHR = StructureType(raw = 1000361000)
    alias PHYSICAL_DEVICE_PIPELINE_CACHE_INCREMENTAL_MODE_FEATURES_SEC = StructureType(raw = 1000637000)


@register_passable("trivial")
struct SubpassContents(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias INLINE = SubpassContents(raw = 0)
    alias SECONDARY_COMMAND_BUFFERS = SubpassContents(raw = 1)
    alias INLINE_AND_SECONDARY_COMMAND_BUFFERS_KHR = SubpassContents(raw = 1000451000)


@register_passable("trivial")
struct Result(EqualityComparable, Writable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    fn is_error(self) -> Bool:
        return self.raw() < 0

    fn __str__(self) -> String:
        return String.write(self)

    fn write_to[W: Writer](self, mut writer: W):
        writer.write(self.raw())

    alias SUCCESS = Result(raw = 0)
    alias NOT_READY = Result(raw = 1)
    alias TIMEOUT = Result(raw = 2)
    alias EVENT_SET = Result(raw = 3)
    alias EVENT_RESET = Result(raw = 4)
    alias INCOMPLETE = Result(raw = 5)
    alias ERROR_OUT_OF_HOST_MEMORY = Result(raw = -1)
    alias ERROR_OUT_OF_DEVICE_MEMORY = Result(raw = -2)
    alias ERROR_INITIALIZATION_FAILED = Result(raw = -3)
    alias ERROR_DEVICE_LOST = Result(raw = -4)
    alias ERROR_MEMORY_MAP_FAILED = Result(raw = -5)
    alias ERROR_LAYER_NOT_PRESENT = Result(raw = -6)
    alias ERROR_EXTENSION_NOT_PRESENT = Result(raw = -7)
    alias ERROR_FEATURE_NOT_PRESENT = Result(raw = -8)
    alias ERROR_INCOMPATIBLE_DRIVER = Result(raw = -9)
    alias ERROR_TOO_MANY_OBJECTS = Result(raw = -10)
    alias ERROR_FORMAT_NOT_SUPPORTED = Result(raw = -11)
    alias ERROR_FRAGMENTED_POOL = Result(raw = -12)
    alias ERROR_UNKNOWN = Result(raw = -13)
    alias ERROR_VALIDATION_FAILED = Result(raw = -1000011001)
    alias ERROR_OUT_OF_POOL_MEMORY = Result(raw = -1000069000)
    alias ERROR_INVALID_EXTERNAL_HANDLE = Result(raw = -1000072003)
    alias ERROR_FRAGMENTATION = Result(raw = -1000161000)
    alias ERROR_INVALID_OPAQUE_CAPTURE_ADDRESS = Result(raw = -1000257000)
    alias PIPELINE_COMPILE_REQUIRED = Result(raw = 1000297000)
    alias ERROR_NOT_PERMITTED = Result(raw = -1000174001)
    alias ERROR_INVALID_PIPELINE_CACHE_DATA = Result(raw = -1000298000)
    alias ERROR_NO_PIPELINE_MATCH = Result(raw = -1000298001)
    alias ERROR_SURFACE_LOST_KHR = Result(raw = -1000000000)
    alias ERROR_NATIVE_WINDOW_IN_USE_KHR = Result(raw = -1000000001)
    alias SUBOPTIMAL_KHR = Result(raw = 1000001003)
    alias ERROR_OUT_OF_DATE_KHR = Result(raw = -1000001004)
    alias ERROR_INCOMPATIBLE_DISPLAY_KHR = Result(raw = -1000003001)
    alias ERROR_INVALID_SHADER_NV = Result(raw = -1000012000)
    alias ERROR_IMAGE_USAGE_NOT_SUPPORTED_KHR = Result(raw = -1000023000)
    alias ERROR_VIDEO_PICTURE_LAYOUT_NOT_SUPPORTED_KHR = Result(raw = -1000023001)
    alias ERROR_VIDEO_PROFILE_OPERATION_NOT_SUPPORTED_KHR = Result(raw = -1000023002)
    alias ERROR_VIDEO_PROFILE_FORMAT_NOT_SUPPORTED_KHR = Result(raw = -1000023003)
    alias ERROR_VIDEO_PROFILE_CODEC_NOT_SUPPORTED_KHR = Result(raw = -1000023004)
    alias ERROR_VIDEO_STD_VERSION_NOT_SUPPORTED_KHR = Result(raw = -1000023005)
    alias ERROR_INVALID_DRM_FORMAT_MODIFIER_PLANE_LAYOUT_EXT = Result(raw = -1000158000)
    alias ERROR_FULL_SCREEN_EXCLUSIVE_MODE_LOST_EXT = Result(raw = -1000255000)
    alias THREAD_IDLE_KHR = Result(raw = 1000268000)
    alias THREAD_DONE_KHR = Result(raw = 1000268001)
    alias OPERATION_DEFERRED_KHR = Result(raw = 1000268002)
    alias OPERATION_NOT_DEFERRED_KHR = Result(raw = 1000268003)
    alias ERROR_INVALID_VIDEO_STD_PARAMETERS_KHR = Result(raw = -1000299000)
    alias ERROR_COMPRESSION_EXHAUSTED_EXT = Result(raw = -1000338000)
    alias INCOMPATIBLE_SHADER_BINARY_EXT = Result(raw = 1000482000)
    alias PIPELINE_BINARY_MISSING_KHR = Result(raw = 1000483000)
    alias ERROR_NOT_ENOUGH_SPACE_KHR = Result(raw = -1000483000)


@register_passable("trivial")
struct DynamicState(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias VIEWPORT = DynamicState(raw = 0)
    alias SCISSOR = DynamicState(raw = 1)
    alias LINE_WIDTH = DynamicState(raw = 2)
    alias DEPTH_BIAS = DynamicState(raw = 3)
    alias BLEND_CONSTANTS = DynamicState(raw = 4)
    alias DEPTH_BOUNDS = DynamicState(raw = 5)
    alias STENCIL_COMPARE_MASK = DynamicState(raw = 6)
    alias STENCIL_WRITE_MASK = DynamicState(raw = 7)
    alias STENCIL_REFERENCE = DynamicState(raw = 8)
    alias CULL_MODE = DynamicState(raw = 1000267000)
    alias FRONT_FACE = DynamicState(raw = 1000267001)
    alias PRIMITIVE_TOPOLOGY = DynamicState(raw = 1000267002)
    alias VIEWPORT_WITH_COUNT = DynamicState(raw = 1000267003)
    alias SCISSOR_WITH_COUNT = DynamicState(raw = 1000267004)
    alias VERTEX_INPUT_BINDING_STRIDE = DynamicState(raw = 1000267005)
    alias DEPTH_TEST_ENABLE = DynamicState(raw = 1000267006)
    alias DEPTH_WRITE_ENABLE = DynamicState(raw = 1000267007)
    alias DEPTH_COMPARE_OP = DynamicState(raw = 1000267008)
    alias DEPTH_BOUNDS_TEST_ENABLE = DynamicState(raw = 1000267009)
    alias STENCIL_TEST_ENABLE = DynamicState(raw = 1000267010)
    alias STENCIL_OP = DynamicState(raw = 1000267011)
    alias RASTERIZER_DISCARD_ENABLE = DynamicState(raw = 1000377001)
    alias DEPTH_BIAS_ENABLE = DynamicState(raw = 1000377002)
    alias PRIMITIVE_RESTART_ENABLE = DynamicState(raw = 1000377004)
    alias LINE_STIPPLE = DynamicState(raw = 1000259000)
    alias VIEWPORT_W_SCALING_NV = DynamicState(raw = 1000087000)
    alias DISCARD_RECTANGLE_EXT = DynamicState(raw = 1000099000)
    alias DISCARD_RECTANGLE_ENABLE_EXT = DynamicState(raw = 1000099001)
    alias DISCARD_RECTANGLE_MODE_EXT = DynamicState(raw = 1000099002)
    alias SAMPLE_LOCATIONS_EXT = DynamicState(raw = 1000143000)
    alias RAY_TRACING_PIPELINE_STACK_SIZE_KHR = DynamicState(raw = 1000347000)
    alias VIEWPORT_SHADING_RATE_PALETTE_NV = DynamicState(raw = 1000164004)
    alias VIEWPORT_COARSE_SAMPLE_ORDER_NV = DynamicState(raw = 1000164006)
    alias EXCLUSIVE_SCISSOR_ENABLE_NV = DynamicState(raw = 1000205000)
    alias EXCLUSIVE_SCISSOR_NV = DynamicState(raw = 1000205001)
    alias FRAGMENT_SHADING_RATE_KHR = DynamicState(raw = 1000226000)
    alias VERTEX_INPUT_EXT = DynamicState(raw = 1000352000)
    alias PATCH_CONTROL_POINTS_EXT = DynamicState(raw = 1000377000)
    alias LOGIC_OP_EXT = DynamicState(raw = 1000377003)
    alias COLOR_WRITE_ENABLE_EXT = DynamicState(raw = 1000381000)
    alias DEPTH_CLAMP_ENABLE_EXT = DynamicState(raw = 1000455003)
    alias POLYGON_MODE_EXT = DynamicState(raw = 1000455004)
    alias RASTERIZATION_SAMPLES_EXT = DynamicState(raw = 1000455005)
    alias SAMPLE_MASK_EXT = DynamicState(raw = 1000455006)
    alias ALPHA_TO_COVERAGE_ENABLE_EXT = DynamicState(raw = 1000455007)
    alias ALPHA_TO_ONE_ENABLE_EXT = DynamicState(raw = 1000455008)
    alias LOGIC_OP_ENABLE_EXT = DynamicState(raw = 1000455009)
    alias COLOR_BLEND_ENABLE_EXT = DynamicState(raw = 1000455010)
    alias COLOR_BLEND_EQUATION_EXT = DynamicState(raw = 1000455011)
    alias COLOR_WRITE_MASK_EXT = DynamicState(raw = 1000455012)
    alias TESSELLATION_DOMAIN_ORIGIN_EXT = DynamicState(raw = 1000455002)
    alias RASTERIZATION_STREAM_EXT = DynamicState(raw = 1000455013)
    alias CONSERVATIVE_RASTERIZATION_MODE_EXT = DynamicState(raw = 1000455014)
    alias EXTRA_PRIMITIVE_OVERESTIMATION_SIZE_EXT = DynamicState(raw = 1000455015)
    alias DEPTH_CLIP_ENABLE_EXT = DynamicState(raw = 1000455016)
    alias SAMPLE_LOCATIONS_ENABLE_EXT = DynamicState(raw = 1000455017)
    alias COLOR_BLEND_ADVANCED_EXT = DynamicState(raw = 1000455018)
    alias PROVOKING_VERTEX_MODE_EXT = DynamicState(raw = 1000455019)
    alias LINE_RASTERIZATION_MODE_EXT = DynamicState(raw = 1000455020)
    alias LINE_STIPPLE_ENABLE_EXT = DynamicState(raw = 1000455021)
    alias DEPTH_CLIP_NEGATIVE_ONE_TO_ONE_EXT = DynamicState(raw = 1000455022)
    alias VIEWPORT_W_SCALING_ENABLE_NV = DynamicState(raw = 1000455023)
    alias VIEWPORT_SWIZZLE_NV = DynamicState(raw = 1000455024)
    alias COVERAGE_TO_COLOR_ENABLE_NV = DynamicState(raw = 1000455025)
    alias COVERAGE_TO_COLOR_LOCATION_NV = DynamicState(raw = 1000455026)
    alias COVERAGE_MODULATION_MODE_NV = DynamicState(raw = 1000455027)
    alias COVERAGE_MODULATION_TABLE_ENABLE_NV = DynamicState(raw = 1000455028)
    alias COVERAGE_MODULATION_TABLE_NV = DynamicState(raw = 1000455029)
    alias SHADING_RATE_IMAGE_ENABLE_NV = DynamicState(raw = 1000455030)
    alias REPRESENTATIVE_FRAGMENT_TEST_ENABLE_NV = DynamicState(raw = 1000455031)
    alias COVERAGE_REDUCTION_MODE_NV = DynamicState(raw = 1000455032)
    alias ATTACHMENT_FEEDBACK_LOOP_ENABLE_EXT = DynamicState(raw = 1000524000)
    alias DEPTH_CLAMP_RANGE_EXT = DynamicState(raw = 1000582000)


@register_passable("trivial")
struct DescriptorUpdateTemplateType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DESCRIPTOR_SET = DescriptorUpdateTemplateType(raw = 0)
    alias PUSH_DESCRIPTORS = DescriptorUpdateTemplateType(raw = 1)


@register_passable("trivial")
struct ObjectType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UNKNOWN = ObjectType(raw = 0)
    alias INSTANCE = ObjectType(raw = 1)
    alias PHYSICAL_DEVICE = ObjectType(raw = 2)
    alias DEVICE = ObjectType(raw = 3)
    alias QUEUE = ObjectType(raw = 4)
    alias SEMAPHORE = ObjectType(raw = 5)
    alias COMMAND_BUFFER = ObjectType(raw = 6)
    alias FENCE = ObjectType(raw = 7)
    alias DEVICE_MEMORY = ObjectType(raw = 8)
    alias BUFFER = ObjectType(raw = 9)
    alias IMAGE = ObjectType(raw = 10)
    alias EVENT = ObjectType(raw = 11)
    alias QUERY_POOL = ObjectType(raw = 12)
    alias BUFFER_VIEW = ObjectType(raw = 13)
    alias IMAGE_VIEW = ObjectType(raw = 14)
    alias SHADER_MODULE = ObjectType(raw = 15)
    alias PIPELINE_CACHE = ObjectType(raw = 16)
    alias PIPELINE_LAYOUT = ObjectType(raw = 17)
    alias RENDER_PASS = ObjectType(raw = 18)
    alias PIPELINE = ObjectType(raw = 19)
    alias DESCRIPTOR_SET_LAYOUT = ObjectType(raw = 20)
    alias SAMPLER = ObjectType(raw = 21)
    alias DESCRIPTOR_POOL = ObjectType(raw = 22)
    alias DESCRIPTOR_SET = ObjectType(raw = 23)
    alias FRAMEBUFFER = ObjectType(raw = 24)
    alias COMMAND_POOL = ObjectType(raw = 25)
    alias SAMPLER_YCBCR_CONVERSION = ObjectType(raw = 1000156000)
    alias DESCRIPTOR_UPDATE_TEMPLATE = ObjectType(raw = 1000085000)
    alias PRIVATE_DATA_SLOT = ObjectType(raw = 1000295000)
    alias SURFACE_KHR = ObjectType(raw = 1000000000)
    alias SWAPCHAIN_KHR = ObjectType(raw = 1000001000)
    alias DISPLAY_KHR = ObjectType(raw = 1000002000)
    alias DISPLAY_MODE_KHR = ObjectType(raw = 1000002001)
    alias DEBUG_REPORT_CALLBACK_EXT = ObjectType(raw = 1000011000)
    alias VIDEO_SESSION_KHR = ObjectType(raw = 1000023000)
    alias VIDEO_SESSION_PARAMETERS_KHR = ObjectType(raw = 1000023001)
    alias CU_MODULE_NVX = ObjectType(raw = 1000029000)
    alias CU_FUNCTION_NVX = ObjectType(raw = 1000029001)
    alias DEBUG_UTILS_MESSENGER_EXT = ObjectType(raw = 1000128000)
    alias ACCELERATION_STRUCTURE_KHR = ObjectType(raw = 1000150000)
    alias VALIDATION_CACHE_EXT = ObjectType(raw = 1000160000)
    alias ACCELERATION_STRUCTURE_NV = ObjectType(raw = 1000165000)
    alias PERFORMANCE_CONFIGURATION_INTEL = ObjectType(raw = 1000210000)
    alias DEFERRED_OPERATION_KHR = ObjectType(raw = 1000268000)
    alias INDIRECT_COMMANDS_LAYOUT_NV = ObjectType(raw = 1000277000)
    alias CUDA_MODULE_NV = ObjectType(raw = 1000307000)
    alias CUDA_FUNCTION_NV = ObjectType(raw = 1000307001)
    alias BUFFER_COLLECTION_FUCHSIA = ObjectType(raw = 1000366000)
    alias MICROMAP_EXT = ObjectType(raw = 1000396000)
    alias TENSOR_ARM = ObjectType(raw = 1000460000)
    alias TENSOR_VIEW_ARM = ObjectType(raw = 1000460001)
    alias OPTICAL_FLOW_SESSION_NV = ObjectType(raw = 1000464000)
    alias SHADER_EXT = ObjectType(raw = 1000482000)
    alias PIPELINE_BINARY_KHR = ObjectType(raw = 1000483000)
    alias SEMAPHORE_SCI_SYNC_POOL_NV = ObjectType(raw = 1000489000)
    alias DATA_GRAPH_PIPELINE_SESSION_ARM = ObjectType(raw = 1000507000)
    alias EXTERNAL_COMPUTE_QUEUE_NV = ObjectType(raw = 1000556000)
    alias INDIRECT_COMMANDS_LAYOUT_EXT = ObjectType(raw = 1000572000)
    alias INDIRECT_EXECUTION_SET_EXT = ObjectType(raw = 1000572001)


@register_passable("trivial")
struct RayTracingInvocationReorderModeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NONE_NV = RayTracingInvocationReorderModeNV(raw = 0)
    alias REORDER_NV = RayTracingInvocationReorderModeNV(raw = 1)


@register_passable("trivial")
struct RayTracingLssIndexingModeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias LIST_NV = RayTracingLssIndexingModeNV(raw = 0)
    alias SUCCESSIVE_NV = RayTracingLssIndexingModeNV(raw = 1)


@register_passable("trivial")
struct RayTracingLssPrimitiveEndCapsModeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NONE_NV = RayTracingLssPrimitiveEndCapsModeNV(raw = 0)
    alias CHAINED_NV = RayTracingLssPrimitiveEndCapsModeNV(raw = 1)


@register_passable("trivial")
struct DirectDriverLoadingModeLUNARG(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias EXCLUSIVE_LUNARG = DirectDriverLoadingModeLUNARG(raw = 0)
    alias INCLUSIVE_LUNARG = DirectDriverLoadingModeLUNARG(raw = 1)


@register_passable("trivial")
struct AntiLagModeAMD(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DRIVER_CONTROL_AMD = AntiLagModeAMD(raw = 0)
    alias ON_AMD = AntiLagModeAMD(raw = 1)
    alias OFF_AMD = AntiLagModeAMD(raw = 2)


@register_passable("trivial")
struct AntiLagStageAMD(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias INPUT_AMD = AntiLagStageAMD(raw = 0)
    alias PRESENT_AMD = AntiLagStageAMD(raw = 1)


@register_passable("trivial")
struct SemaphoreType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias BINARY = SemaphoreType(raw = 0)
    alias TIMELINE = SemaphoreType(raw = 1)


@register_passable("trivial")
struct PresentModeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias IMMEDIATE_KHR = PresentModeKHR(raw = 0)
    alias MAILBOX_KHR = PresentModeKHR(raw = 1)
    alias FIFO_KHR = PresentModeKHR(raw = 2)
    alias FIFO_RELAXED_KHR = PresentModeKHR(raw = 3)
    alias SHARED_DEMAND_REFRESH_KHR = PresentModeKHR(raw = 1000111000)
    alias SHARED_CONTINUOUS_REFRESH_KHR = PresentModeKHR(raw = 1000111001)
    alias FIFO_LATEST_READY_KHR = PresentModeKHR(raw = 1000361000)


@register_passable("trivial")
struct ColorSpaceKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias SRGB_NONLINEAR_KHR = ColorSpaceKHR(raw = 0)
    alias DISPLAY_P3_NONLINEAR_EXT = ColorSpaceKHR(raw = 1000104001)
    alias EXTENDED_SRGB_LINEAR_EXT = ColorSpaceKHR(raw = 1000104002)
    alias DISPLAY_P3_LINEAR_EXT = ColorSpaceKHR(raw = 1000104003)
    alias DCI_P3_NONLINEAR_EXT = ColorSpaceKHR(raw = 1000104004)
    alias BT709_LINEAR_EXT = ColorSpaceKHR(raw = 1000104005)
    alias BT709_NONLINEAR_EXT = ColorSpaceKHR(raw = 1000104006)
    alias BT2020_LINEAR_EXT = ColorSpaceKHR(raw = 1000104007)
    alias HDR10_ST2084_EXT = ColorSpaceKHR(raw = 1000104008)
    alias DOLBYVISION_EXT = ColorSpaceKHR(raw = 1000104009)
    alias HDR10_HLG_EXT = ColorSpaceKHR(raw = 1000104010)
    alias ADOBERGB_LINEAR_EXT = ColorSpaceKHR(raw = 1000104011)
    alias ADOBERGB_NONLINEAR_EXT = ColorSpaceKHR(raw = 1000104012)
    alias PASS_THROUGH_EXT = ColorSpaceKHR(raw = 1000104013)
    alias EXTENDED_SRGB_NONLINEAR_EXT = ColorSpaceKHR(raw = 1000104014)
    alias DISPLAY_NATIVE_AMD = ColorSpaceKHR(raw = 1000213000)


@register_passable("trivial")
struct DisplaySurfaceStereoTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NONE_NV = DisplaySurfaceStereoTypeNV(raw = 0)
    alias ONBOARD_DIN_NV = DisplaySurfaceStereoTypeNV(raw = 1)
    alias HDMI_3D_NV = DisplaySurfaceStereoTypeNV(raw = 2)
    alias INBAND_DISPLAYPORT_NV = DisplaySurfaceStereoTypeNV(raw = 3)


@register_passable("trivial")
struct TimeDomainKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DEVICE_KHR = TimeDomainKHR(raw = 0)
    alias CLOCK_MONOTONIC_KHR = TimeDomainKHR(raw = 1)
    alias CLOCK_MONOTONIC_RAW_KHR = TimeDomainKHR(raw = 2)
    alias QUERY_PERFORMANCE_COUNTER_KHR = TimeDomainKHR(raw = 3)


@register_passable("trivial")
struct DebugReportObjectTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UNKNOWN_EXT = DebugReportObjectTypeEXT(raw = 0)
    alias INSTANCE_EXT = DebugReportObjectTypeEXT(raw = 1)
    alias PHYSICAL_DEVICE_EXT = DebugReportObjectTypeEXT(raw = 2)
    alias DEVICE_EXT = DebugReportObjectTypeEXT(raw = 3)
    alias QUEUE_EXT = DebugReportObjectTypeEXT(raw = 4)
    alias SEMAPHORE_EXT = DebugReportObjectTypeEXT(raw = 5)
    alias COMMAND_BUFFER_EXT = DebugReportObjectTypeEXT(raw = 6)
    alias FENCE_EXT = DebugReportObjectTypeEXT(raw = 7)
    alias DEVICE_MEMORY_EXT = DebugReportObjectTypeEXT(raw = 8)
    alias BUFFER_EXT = DebugReportObjectTypeEXT(raw = 9)
    alias IMAGE_EXT = DebugReportObjectTypeEXT(raw = 10)
    alias EVENT_EXT = DebugReportObjectTypeEXT(raw = 11)
    alias QUERY_POOL_EXT = DebugReportObjectTypeEXT(raw = 12)
    alias BUFFER_VIEW_EXT = DebugReportObjectTypeEXT(raw = 13)
    alias IMAGE_VIEW_EXT = DebugReportObjectTypeEXT(raw = 14)
    alias SHADER_MODULE_EXT = DebugReportObjectTypeEXT(raw = 15)
    alias PIPELINE_CACHE_EXT = DebugReportObjectTypeEXT(raw = 16)
    alias PIPELINE_LAYOUT_EXT = DebugReportObjectTypeEXT(raw = 17)
    alias RENDER_PASS_EXT = DebugReportObjectTypeEXT(raw = 18)
    alias PIPELINE_EXT = DebugReportObjectTypeEXT(raw = 19)
    alias DESCRIPTOR_SET_LAYOUT_EXT = DebugReportObjectTypeEXT(raw = 20)
    alias SAMPLER_EXT = DebugReportObjectTypeEXT(raw = 21)
    alias DESCRIPTOR_POOL_EXT = DebugReportObjectTypeEXT(raw = 22)
    alias DESCRIPTOR_SET_EXT = DebugReportObjectTypeEXT(raw = 23)
    alias FRAMEBUFFER_EXT = DebugReportObjectTypeEXT(raw = 24)
    alias COMMAND_POOL_EXT = DebugReportObjectTypeEXT(raw = 25)
    alias SURFACE_KHR_EXT = DebugReportObjectTypeEXT(raw = 26)
    alias SWAPCHAIN_KHR_EXT = DebugReportObjectTypeEXT(raw = 27)
    alias DEBUG_REPORT_CALLBACK_EXT_EXT = DebugReportObjectTypeEXT(raw = 28)
    alias DISPLAY_KHR_EXT = DebugReportObjectTypeEXT(raw = 29)
    alias DISPLAY_MODE_KHR_EXT = DebugReportObjectTypeEXT(raw = 30)
    alias VALIDATION_CACHE_EXT_EXT = DebugReportObjectTypeEXT(raw = 33)
    alias SAMPLER_YCBCR_CONVERSION_EXT = DebugReportObjectTypeEXT(raw = 1000156000)
    alias DESCRIPTOR_UPDATE_TEMPLATE_EXT = DebugReportObjectTypeEXT(raw = 1000085000)
    alias CU_MODULE_NVX_EXT = DebugReportObjectTypeEXT(raw = 1000029000)
    alias CU_FUNCTION_NVX_EXT = DebugReportObjectTypeEXT(raw = 1000029001)
    alias ACCELERATION_STRUCTURE_KHR_EXT = DebugReportObjectTypeEXT(raw = 1000150000)
    alias ACCELERATION_STRUCTURE_NV_EXT = DebugReportObjectTypeEXT(raw = 1000165000)
    alias CUDA_MODULE_NV_EXT = DebugReportObjectTypeEXT(raw = 1000307000)
    alias CUDA_FUNCTION_NV_EXT = DebugReportObjectTypeEXT(raw = 1000307001)
    alias BUFFER_COLLECTION_FUCHSIA_EXT = DebugReportObjectTypeEXT(raw = 1000366000)


@register_passable("trivial")
struct DeviceMemoryReportEventTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ALLOCATE_EXT = DeviceMemoryReportEventTypeEXT(raw = 0)
    alias FREE_EXT = DeviceMemoryReportEventTypeEXT(raw = 1)
    alias IMPORT_EXT = DeviceMemoryReportEventTypeEXT(raw = 2)
    alias UNIMPORT_EXT = DeviceMemoryReportEventTypeEXT(raw = 3)
    alias ALLOCATION_FAILED_EXT = DeviceMemoryReportEventTypeEXT(raw = 4)


@register_passable("trivial")
struct RasterizationOrderAMD(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias STRICT_AMD = RasterizationOrderAMD(raw = 0)
    alias RELAXED_AMD = RasterizationOrderAMD(raw = 1)


@register_passable("trivial")
struct ClusterAccelerationStructureTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias CLUSTERS_BOTTOM_LEVEL_NV = ClusterAccelerationStructureTypeNV(raw = 0)
    alias TRIANGLE_CLUSTER_NV = ClusterAccelerationStructureTypeNV(raw = 1)
    alias TRIANGLE_CLUSTER_TEMPLATE_NV = ClusterAccelerationStructureTypeNV(raw = 2)


@register_passable("trivial")
struct ClusterAccelerationStructureOpTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias MOVE_OBJECTS_NV = ClusterAccelerationStructureOpTypeNV(raw = 0)
    alias BUILD_CLUSTERS_BOTTOM_LEVEL_NV = ClusterAccelerationStructureOpTypeNV(raw = 1)
    alias BUILD_TRIANGLE_CLUSTER_NV = ClusterAccelerationStructureOpTypeNV(raw = 2)
    alias BUILD_TRIANGLE_CLUSTER_TEMPLATE_NV = ClusterAccelerationStructureOpTypeNV(raw = 3)
    alias INSTANTIATE_TRIANGLE_CLUSTER_NV = ClusterAccelerationStructureOpTypeNV(raw = 4)
    alias GET_CLUSTER_TEMPLATE_INDICES_NV = ClusterAccelerationStructureOpTypeNV(raw = 5)


@register_passable("trivial")
struct ClusterAccelerationStructureOpModeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias IMPLICIT_DESTINATIONS_NV = ClusterAccelerationStructureOpModeNV(raw = 0)
    alias EXPLICIT_DESTINATIONS_NV = ClusterAccelerationStructureOpModeNV(raw = 1)
    alias COMPUTE_SIZES_NV = ClusterAccelerationStructureOpModeNV(raw = 2)


@register_passable("trivial")
struct ValidationCheckEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ALL_EXT = ValidationCheckEXT(raw = 0)
    alias SHADERS_EXT = ValidationCheckEXT(raw = 1)


@register_passable("trivial")
struct ValidationFeatureEnableEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias GPU_ASSISTED_EXT = ValidationFeatureEnableEXT(raw = 0)
    alias GPU_ASSISTED_RESERVE_BINDING_SLOT_EXT = ValidationFeatureEnableEXT(raw = 1)
    alias BEST_PRACTICES_EXT = ValidationFeatureEnableEXT(raw = 2)
    alias DEBUG_PRINTF_EXT = ValidationFeatureEnableEXT(raw = 3)
    alias SYNCHRONIZATION_VALIDATION_EXT = ValidationFeatureEnableEXT(raw = 4)


@register_passable("trivial")
struct ValidationFeatureDisableEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ALL_EXT = ValidationFeatureDisableEXT(raw = 0)
    alias SHADERS_EXT = ValidationFeatureDisableEXT(raw = 1)
    alias THREAD_SAFETY_EXT = ValidationFeatureDisableEXT(raw = 2)
    alias API_PARAMETERS_EXT = ValidationFeatureDisableEXT(raw = 3)
    alias OBJECT_LIFETIMES_EXT = ValidationFeatureDisableEXT(raw = 4)
    alias CORE_CHECKS_EXT = ValidationFeatureDisableEXT(raw = 5)
    alias UNIQUE_HANDLES_EXT = ValidationFeatureDisableEXT(raw = 6)
    alias SHADER_VALIDATION_CACHE_EXT = ValidationFeatureDisableEXT(raw = 7)


@register_passable("trivial")
struct LayerSettingTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias BOOL32_EXT = LayerSettingTypeEXT(raw = 0)
    alias INT32_EXT = LayerSettingTypeEXT(raw = 1)
    alias INT64_EXT = LayerSettingTypeEXT(raw = 2)
    alias UINT32_EXT = LayerSettingTypeEXT(raw = 3)
    alias UINT64_EXT = LayerSettingTypeEXT(raw = 4)
    alias FLOAT32_EXT = LayerSettingTypeEXT(raw = 5)
    alias FLOAT64_EXT = LayerSettingTypeEXT(raw = 6)
    alias STRING_EXT = LayerSettingTypeEXT(raw = 7)


@register_passable("trivial")
struct IndirectCommandsTokenTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias SHADER_GROUP_NV = IndirectCommandsTokenTypeNV(raw = 0)
    alias STATE_FLAGS_NV = IndirectCommandsTokenTypeNV(raw = 1)
    alias INDEX_BUFFER_NV = IndirectCommandsTokenTypeNV(raw = 2)
    alias VERTEX_BUFFER_NV = IndirectCommandsTokenTypeNV(raw = 3)
    alias PUSH_CONSTANT_NV = IndirectCommandsTokenTypeNV(raw = 4)
    alias DRAW_INDEXED_NV = IndirectCommandsTokenTypeNV(raw = 5)
    alias DRAW_NV = IndirectCommandsTokenTypeNV(raw = 6)
    alias DRAW_TASKS_NV = IndirectCommandsTokenTypeNV(raw = 7)
    alias DRAW_MESH_TASKS_NV = IndirectCommandsTokenTypeNV(raw = 1000328000)
    alias PIPELINE_NV = IndirectCommandsTokenTypeNV(raw = 1000428003)
    alias DISPATCH_NV = IndirectCommandsTokenTypeNV(raw = 1000428004)


@register_passable("trivial")
struct DisplayPowerStateEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias OFF_EXT = DisplayPowerStateEXT(raw = 0)
    alias SUSPEND_EXT = DisplayPowerStateEXT(raw = 1)
    alias ON_EXT = DisplayPowerStateEXT(raw = 2)


@register_passable("trivial")
struct DeviceEventTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DISPLAY_HOTPLUG_EXT = DeviceEventTypeEXT(raw = 0)


@register_passable("trivial")
struct DisplayEventTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias FIRST_PIXEL_OUT_EXT = DisplayEventTypeEXT(raw = 0)


@register_passable("trivial")
struct ViewportCoordinateSwizzleNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias POSITIVE_X_NV = ViewportCoordinateSwizzleNV(raw = 0)
    alias NEGATIVE_X_NV = ViewportCoordinateSwizzleNV(raw = 1)
    alias POSITIVE_Y_NV = ViewportCoordinateSwizzleNV(raw = 2)
    alias NEGATIVE_Y_NV = ViewportCoordinateSwizzleNV(raw = 3)
    alias POSITIVE_Z_NV = ViewportCoordinateSwizzleNV(raw = 4)
    alias NEGATIVE_Z_NV = ViewportCoordinateSwizzleNV(raw = 5)
    alias POSITIVE_W_NV = ViewportCoordinateSwizzleNV(raw = 6)
    alias NEGATIVE_W_NV = ViewportCoordinateSwizzleNV(raw = 7)


@register_passable("trivial")
struct DiscardRectangleModeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias INCLUSIVE_EXT = DiscardRectangleModeEXT(raw = 0)
    alias EXCLUSIVE_EXT = DiscardRectangleModeEXT(raw = 1)


@register_passable("trivial")
struct PointClippingBehavior(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ALL_CLIP_PLANES = PointClippingBehavior(raw = 0)
    alias USER_CLIP_PLANES_ONLY = PointClippingBehavior(raw = 1)


@register_passable("trivial")
struct SamplerReductionMode(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias WEIGHTED_AVERAGE = SamplerReductionMode(raw = 0)
    alias MIN = SamplerReductionMode(raw = 1)
    alias MAX = SamplerReductionMode(raw = 2)
    alias WEIGHTED_AVERAGE_RANGECLAMP_QCOM = SamplerReductionMode(raw = 1000521000)


@register_passable("trivial")
struct TessellationDomainOrigin(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UPPER_LEFT = TessellationDomainOrigin(raw = 0)
    alias LOWER_LEFT = TessellationDomainOrigin(raw = 1)


@register_passable("trivial")
struct SamplerYcbcrModelConversion(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias RGB_IDENTITY = SamplerYcbcrModelConversion(raw = 0)
    alias YCBCR_IDENTITY = SamplerYcbcrModelConversion(raw = 1)
    alias YCBCR_709 = SamplerYcbcrModelConversion(raw = 2)
    alias YCBCR_601 = SamplerYcbcrModelConversion(raw = 3)
    alias YCBCR_2020 = SamplerYcbcrModelConversion(raw = 4)


@register_passable("trivial")
struct SamplerYcbcrRange(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ITU_FULL = SamplerYcbcrRange(raw = 0)
    alias ITU_NARROW = SamplerYcbcrRange(raw = 1)


@register_passable("trivial")
struct ChromaLocation(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias COSITED_EVEN = ChromaLocation(raw = 0)
    alias MIDPOINT = ChromaLocation(raw = 1)


@register_passable("trivial")
struct BlendOverlapEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UNCORRELATED_EXT = BlendOverlapEXT(raw = 0)
    alias DISJOINT_EXT = BlendOverlapEXT(raw = 1)
    alias CONJOINT_EXT = BlendOverlapEXT(raw = 2)


@register_passable("trivial")
struct CoverageModulationModeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NONE_NV = CoverageModulationModeNV(raw = 0)
    alias RGB_NV = CoverageModulationModeNV(raw = 1)
    alias ALPHA_NV = CoverageModulationModeNV(raw = 2)
    alias RGBA_NV = CoverageModulationModeNV(raw = 3)


@register_passable("trivial")
struct CoverageReductionModeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias MERGE_NV = CoverageReductionModeNV(raw = 0)
    alias TRUNCATE_NV = CoverageReductionModeNV(raw = 1)


@register_passable("trivial")
struct ValidationCacheHeaderVersionEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ONE_EXT = ValidationCacheHeaderVersionEXT(raw = 1)


@register_passable("trivial")
struct ShaderInfoTypeAMD(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias STATISTICS_AMD = ShaderInfoTypeAMD(raw = 0)
    alias BINARY_AMD = ShaderInfoTypeAMD(raw = 1)
    alias DISASSEMBLY_AMD = ShaderInfoTypeAMD(raw = 2)


@register_passable("trivial")
struct QueueGlobalPriority(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias LOW = QueueGlobalPriority(raw = 128)
    alias MEDIUM = QueueGlobalPriority(raw = 256)
    alias HIGH = QueueGlobalPriority(raw = 512)
    alias REALTIME = QueueGlobalPriority(raw = 1024)


@register_passable("trivial")
struct ConservativeRasterizationModeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DISABLED_EXT = ConservativeRasterizationModeEXT(raw = 0)
    alias OVERESTIMATE_EXT = ConservativeRasterizationModeEXT(raw = 1)
    alias UNDERESTIMATE_EXT = ConservativeRasterizationModeEXT(raw = 2)


@register_passable("trivial")
struct VendorId(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias KHRONOS = VendorId(raw = 65536)
    alias VIV = VendorId(raw = 65537)
    alias VSI = VendorId(raw = 65538)
    alias KAZAN = VendorId(raw = 65539)
    alias CODEPLAY = VendorId(raw = 65540)
    alias MESA = VendorId(raw = 65541)
    alias POCL = VendorId(raw = 65542)
    alias MOBILEYE = VendorId(raw = 65543)


@register_passable("trivial")
struct DriverId(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias AMD_PROPRIETARY = DriverId(raw = 1)
    alias AMD_OPEN_SOURCE = DriverId(raw = 2)
    alias MESA_RADV = DriverId(raw = 3)
    alias NVIDIA_PROPRIETARY = DriverId(raw = 4)
    alias INTEL_PROPRIETARY_WINDOWS = DriverId(raw = 5)
    alias INTEL_OPEN_SOURCE_MESA = DriverId(raw = 6)
    alias IMAGINATION_PROPRIETARY = DriverId(raw = 7)
    alias QUALCOMM_PROPRIETARY = DriverId(raw = 8)
    alias ARM_PROPRIETARY = DriverId(raw = 9)
    alias GOOGLE_SWIFTSHADER = DriverId(raw = 10)
    alias GGP_PROPRIETARY = DriverId(raw = 11)
    alias BROADCOM_PROPRIETARY = DriverId(raw = 12)
    alias MESA_LLVMPIPE = DriverId(raw = 13)
    alias MOLTENVK = DriverId(raw = 14)
    alias COREAVI_PROPRIETARY = DriverId(raw = 15)
    alias JUICE_PROPRIETARY = DriverId(raw = 16)
    alias VERISILICON_PROPRIETARY = DriverId(raw = 17)
    alias MESA_TURNIP = DriverId(raw = 18)
    alias MESA_V3DV = DriverId(raw = 19)
    alias MESA_PANVK = DriverId(raw = 20)
    alias SAMSUNG_PROPRIETARY = DriverId(raw = 21)
    alias MESA_VENUS = DriverId(raw = 22)
    alias MESA_DOZEN = DriverId(raw = 23)
    alias MESA_NVK = DriverId(raw = 24)
    alias IMAGINATION_OPEN_SOURCE_MESA = DriverId(raw = 25)
    alias MESA_HONEYKRISP = DriverId(raw = 26)
    alias VULKAN_SC_EMULATION_ON_VULKAN = DriverId(raw = 27)


@register_passable("trivial")
struct ShadingRatePaletteEntryNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NO_INVOCATIONS_NV = ShadingRatePaletteEntryNV(raw = 0)
    alias N_16_INVOCATIONS_PER_PIXEL_NV = ShadingRatePaletteEntryNV(raw = 1)
    alias N_8_INVOCATIONS_PER_PIXEL_NV = ShadingRatePaletteEntryNV(raw = 2)
    alias N_4_INVOCATIONS_PER_PIXEL_NV = ShadingRatePaletteEntryNV(raw = 3)
    alias N_2_INVOCATIONS_PER_PIXEL_NV = ShadingRatePaletteEntryNV(raw = 4)
    alias N_1_INVOCATION_PER_PIXEL_NV = ShadingRatePaletteEntryNV(raw = 5)
    alias N_1_INVOCATION_PER_2X1_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 6)
    alias N_1_INVOCATION_PER_1X2_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 7)
    alias N_1_INVOCATION_PER_2X2_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 8)
    alias N_1_INVOCATION_PER_4X2_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 9)
    alias N_1_INVOCATION_PER_2X4_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 10)
    alias N_1_INVOCATION_PER_4X4_PIXELS_NV = ShadingRatePaletteEntryNV(raw = 11)


@register_passable("trivial")
struct CoarseSampleOrderTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DEFAULT_NV = CoarseSampleOrderTypeNV(raw = 0)
    alias CUSTOM_NV = CoarseSampleOrderTypeNV(raw = 1)
    alias PIXEL_MAJOR_NV = CoarseSampleOrderTypeNV(raw = 2)
    alias SAMPLE_MAJOR_NV = CoarseSampleOrderTypeNV(raw = 3)


@register_passable("trivial")
struct CopyAccelerationStructureModeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias CLONE_KHR = CopyAccelerationStructureModeKHR(raw = 0)
    alias COMPACT_KHR = CopyAccelerationStructureModeKHR(raw = 1)
    alias SERIALIZE_KHR = CopyAccelerationStructureModeKHR(raw = 2)
    alias DESERIALIZE_KHR = CopyAccelerationStructureModeKHR(raw = 3)


@register_passable("trivial")
struct BuildAccelerationStructureModeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias BUILD_KHR = BuildAccelerationStructureModeKHR(raw = 0)
    alias UPDATE_KHR = BuildAccelerationStructureModeKHR(raw = 1)


@register_passable("trivial")
struct AccelerationStructureTypeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias TOP_LEVEL_KHR = AccelerationStructureTypeKHR(raw = 0)
    alias BOTTOM_LEVEL_KHR = AccelerationStructureTypeKHR(raw = 1)
    alias GENERIC_KHR = AccelerationStructureTypeKHR(raw = 2)


@register_passable("trivial")
struct GeometryTypeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias TRIANGLES_KHR = GeometryTypeKHR(raw = 0)
    alias AABBS_KHR = GeometryTypeKHR(raw = 1)
    alias INSTANCES_KHR = GeometryTypeKHR(raw = 2)
    alias SPHERES_NV = GeometryTypeKHR(raw = 1000429004)
    alias LINEAR_SWEPT_SPHERES_NV = GeometryTypeKHR(raw = 1000429005)
    alias DENSE_GEOMETRY_FORMAT_TRIANGLES_AMDX = GeometryTypeKHR(raw = 1000478000)


@register_passable("trivial")
struct AccelerationStructureMemoryRequirementsTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias OBJECT_NV = AccelerationStructureMemoryRequirementsTypeNV(raw = 0)
    alias BUILD_SCRATCH_NV = AccelerationStructureMemoryRequirementsTypeNV(raw = 1)
    alias UPDATE_SCRATCH_NV = AccelerationStructureMemoryRequirementsTypeNV(raw = 2)


@register_passable("trivial")
struct AccelerationStructureBuildTypeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias HOST_KHR = AccelerationStructureBuildTypeKHR(raw = 0)
    alias DEVICE_KHR = AccelerationStructureBuildTypeKHR(raw = 1)
    alias HOST_OR_DEVICE_KHR = AccelerationStructureBuildTypeKHR(raw = 2)


@register_passable("trivial")
struct RayTracingShaderGroupTypeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias GENERAL_KHR = RayTracingShaderGroupTypeKHR(raw = 0)
    alias TRIANGLES_HIT_GROUP_KHR = RayTracingShaderGroupTypeKHR(raw = 1)
    alias PROCEDURAL_HIT_GROUP_KHR = RayTracingShaderGroupTypeKHR(raw = 2)


@register_passable("trivial")
struct AccelerationStructureCompatibilityKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias COMPATIBLE_KHR = AccelerationStructureCompatibilityKHR(raw = 0)
    alias INCOMPATIBLE_KHR = AccelerationStructureCompatibilityKHR(raw = 1)


@register_passable("trivial")
struct ShaderGroupShaderKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias GENERAL_KHR = ShaderGroupShaderKHR(raw = 0)
    alias CLOSEST_HIT_KHR = ShaderGroupShaderKHR(raw = 1)
    alias ANY_HIT_KHR = ShaderGroupShaderKHR(raw = 2)
    alias INTERSECTION_KHR = ShaderGroupShaderKHR(raw = 3)


@register_passable("trivial")
struct MemoryOverallocationBehaviorAMD(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DEFAULT_AMD = MemoryOverallocationBehaviorAMD(raw = 0)
    alias ALLOWED_AMD = MemoryOverallocationBehaviorAMD(raw = 1)
    alias DISALLOWED_AMD = MemoryOverallocationBehaviorAMD(raw = 2)


@register_passable("trivial")
struct FullScreenExclusiveEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DEFAULT_EXT = FullScreenExclusiveEXT(raw = 0)
    alias ALLOWED_EXT = FullScreenExclusiveEXT(raw = 1)
    alias DISALLOWED_EXT = FullScreenExclusiveEXT(raw = 2)
    alias APPLICATION_CONTROLLED_EXT = FullScreenExclusiveEXT(raw = 3)


@register_passable("trivial")
struct PerformanceCounterScopeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias COMMAND_BUFFER_KHR = PerformanceCounterScopeKHR(raw = 0)
    alias RENDER_PASS_KHR = PerformanceCounterScopeKHR(raw = 1)
    alias COMMAND_KHR = PerformanceCounterScopeKHR(raw = 2)


@register_passable("trivial")
struct PerformanceCounterUnitKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias GENERIC_KHR = PerformanceCounterUnitKHR(raw = 0)
    alias PERCENTAGE_KHR = PerformanceCounterUnitKHR(raw = 1)
    alias NANOSECONDS_KHR = PerformanceCounterUnitKHR(raw = 2)
    alias BYTES_KHR = PerformanceCounterUnitKHR(raw = 3)
    alias BYTES_PER_SECOND_KHR = PerformanceCounterUnitKHR(raw = 4)
    alias KELVIN_KHR = PerformanceCounterUnitKHR(raw = 5)
    alias WATTS_KHR = PerformanceCounterUnitKHR(raw = 6)
    alias VOLTS_KHR = PerformanceCounterUnitKHR(raw = 7)
    alias AMPS_KHR = PerformanceCounterUnitKHR(raw = 8)
    alias HERTZ_KHR = PerformanceCounterUnitKHR(raw = 9)
    alias CYCLES_KHR = PerformanceCounterUnitKHR(raw = 10)


@register_passable("trivial")
struct PerformanceCounterStorageKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias INT32_KHR = PerformanceCounterStorageKHR(raw = 0)
    alias INT64_KHR = PerformanceCounterStorageKHR(raw = 1)
    alias UINT32_KHR = PerformanceCounterStorageKHR(raw = 2)
    alias UINT64_KHR = PerformanceCounterStorageKHR(raw = 3)
    alias FLOAT32_KHR = PerformanceCounterStorageKHR(raw = 4)
    alias FLOAT64_KHR = PerformanceCounterStorageKHR(raw = 5)


@register_passable("trivial")
struct PerformanceConfigurationTypeINTEL(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias COMMAND_QUEUE_METRICS_DISCOVERY_ACTIVATED_INTEL = PerformanceConfigurationTypeINTEL(raw = 0)


@register_passable("trivial")
struct QueryPoolSamplingModeINTEL(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias MANUAL_INTEL = QueryPoolSamplingModeINTEL(raw = 0)


@register_passable("trivial")
struct PerformanceOverrideTypeINTEL(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NULL_HARDWARE_INTEL = PerformanceOverrideTypeINTEL(raw = 0)
    alias FLUSH_GPU_CACHES_INTEL = PerformanceOverrideTypeINTEL(raw = 1)


@register_passable("trivial")
struct PerformanceParameterTypeINTEL(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias HW_COUNTERS_SUPPORTED_INTEL = PerformanceParameterTypeINTEL(raw = 0)
    alias STREAM_MARKER_VALID_BITS_INTEL = PerformanceParameterTypeINTEL(raw = 1)


@register_passable("trivial")
struct PerformanceValueTypeINTEL(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UINT32_INTEL = PerformanceValueTypeINTEL(raw = 0)
    alias UINT64_INTEL = PerformanceValueTypeINTEL(raw = 1)
    alias FLOAT_INTEL = PerformanceValueTypeINTEL(raw = 2)
    alias BOOL_INTEL = PerformanceValueTypeINTEL(raw = 3)
    alias STRING_INTEL = PerformanceValueTypeINTEL(raw = 4)


@register_passable("trivial")
struct ShaderFloatControlsIndependence(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias N_32_BIT_ONLY = ShaderFloatControlsIndependence(raw = 0)
    alias ALL = ShaderFloatControlsIndependence(raw = 1)
    alias NONE = ShaderFloatControlsIndependence(raw = 2)


@register_passable("trivial")
struct PipelineExecutableStatisticFormatKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias BOOL32_KHR = PipelineExecutableStatisticFormatKHR(raw = 0)
    alias INT64_KHR = PipelineExecutableStatisticFormatKHR(raw = 1)
    alias UINT64_KHR = PipelineExecutableStatisticFormatKHR(raw = 2)
    alias FLOAT64_KHR = PipelineExecutableStatisticFormatKHR(raw = 3)


@register_passable("trivial")
struct LineRasterizationMode(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DEFAULT = LineRasterizationMode(raw = 0)
    alias RECTANGULAR = LineRasterizationMode(raw = 1)
    alias BRESENHAM = LineRasterizationMode(raw = 2)
    alias RECTANGULAR_SMOOTH = LineRasterizationMode(raw = 3)


@register_passable("trivial")
struct FaultLevel(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UNASSIGNED = FaultLevel(raw = 0)
    alias CRITICAL = FaultLevel(raw = 1)
    alias RECOVERABLE = FaultLevel(raw = 2)
    alias WARNING = FaultLevel(raw = 3)


@register_passable("trivial")
struct FaultType(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias INVALID = FaultType(raw = 0)
    alias UNASSIGNED = FaultType(raw = 1)
    alias IMPLEMENTATION = FaultType(raw = 2)
    alias SYSTEM = FaultType(raw = 3)
    alias PHYSICAL_DEVICE = FaultType(raw = 4)
    alias COMMAND_BUFFER_FULL = FaultType(raw = 5)
    alias INVALID_API_USAGE = FaultType(raw = 6)


@register_passable("trivial")
struct FaultQueryBehavior(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias GET_AND_CLEAR_ALL_FAULTS = FaultQueryBehavior(raw = 0)


@register_passable("trivial")
struct PipelineMatchControl(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias APPLICATION_UUID_EXACT_MATCH = PipelineMatchControl(raw = 0)


@register_passable("trivial")
struct FragmentShadingRateCombinerOpKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias KEEP_KHR = FragmentShadingRateCombinerOpKHR(raw = 0)
    alias REPLACE_KHR = FragmentShadingRateCombinerOpKHR(raw = 1)
    alias MIN_KHR = FragmentShadingRateCombinerOpKHR(raw = 2)
    alias MAX_KHR = FragmentShadingRateCombinerOpKHR(raw = 3)
    alias MUL_KHR = FragmentShadingRateCombinerOpKHR(raw = 4)


@register_passable("trivial")
struct FragmentShadingRateNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias N_1_INVOCATION_PER_PIXEL_NV = FragmentShadingRateNV(raw = 0)
    alias N_1_INVOCATION_PER_1X2_PIXELS_NV = FragmentShadingRateNV(raw = 1)
    alias N_1_INVOCATION_PER_2X1_PIXELS_NV = FragmentShadingRateNV(raw = 4)
    alias N_1_INVOCATION_PER_2X2_PIXELS_NV = FragmentShadingRateNV(raw = 5)
    alias N_1_INVOCATION_PER_2X4_PIXELS_NV = FragmentShadingRateNV(raw = 6)
    alias N_1_INVOCATION_PER_4X2_PIXELS_NV = FragmentShadingRateNV(raw = 9)
    alias N_1_INVOCATION_PER_4X4_PIXELS_NV = FragmentShadingRateNV(raw = 10)
    alias N_2_INVOCATIONS_PER_PIXEL_NV = FragmentShadingRateNV(raw = 11)
    alias N_4_INVOCATIONS_PER_PIXEL_NV = FragmentShadingRateNV(raw = 12)
    alias N_8_INVOCATIONS_PER_PIXEL_NV = FragmentShadingRateNV(raw = 13)
    alias N_16_INVOCATIONS_PER_PIXEL_NV = FragmentShadingRateNV(raw = 14)
    alias NO_INVOCATIONS_NV = FragmentShadingRateNV(raw = 15)


@register_passable("trivial")
struct FragmentShadingRateTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias FRAGMENT_SIZE_NV = FragmentShadingRateTypeNV(raw = 0)
    alias ENUMS_NV = FragmentShadingRateTypeNV(raw = 1)


@register_passable("trivial")
struct SubpassMergeStatusEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias MERGED_EXT = SubpassMergeStatusEXT(raw = 0)
    alias DISALLOWED_EXT = SubpassMergeStatusEXT(raw = 1)
    alias NOT_MERGED_SIDE_EFFECTS_EXT = SubpassMergeStatusEXT(raw = 2)
    alias NOT_MERGED_SAMPLES_MISMATCH_EXT = SubpassMergeStatusEXT(raw = 3)
    alias NOT_MERGED_VIEWS_MISMATCH_EXT = SubpassMergeStatusEXT(raw = 4)
    alias NOT_MERGED_ALIASING_EXT = SubpassMergeStatusEXT(raw = 5)
    alias NOT_MERGED_DEPENDENCIES_EXT = SubpassMergeStatusEXT(raw = 6)
    alias NOT_MERGED_INCOMPATIBLE_INPUT_ATTACHMENT_EXT = SubpassMergeStatusEXT(raw = 7)
    alias NOT_MERGED_TOO_MANY_ATTACHMENTS_EXT = SubpassMergeStatusEXT(raw = 8)
    alias NOT_MERGED_INSUFFICIENT_STORAGE_EXT = SubpassMergeStatusEXT(raw = 9)
    alias NOT_MERGED_DEPTH_STENCIL_COUNT_EXT = SubpassMergeStatusEXT(raw = 10)
    alias NOT_MERGED_RESOLVE_ATTACHMENT_REUSE_EXT = SubpassMergeStatusEXT(raw = 11)
    alias NOT_MERGED_SINGLE_SUBPASS_EXT = SubpassMergeStatusEXT(raw = 12)
    alias NOT_MERGED_UNSPECIFIED_EXT = SubpassMergeStatusEXT(raw = 13)


@register_passable("trivial")
struct SciSyncClientTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias SIGNALER_NV = SciSyncClientTypeNV(raw = 0)
    alias WAITER_NV = SciSyncClientTypeNV(raw = 1)
    alias SIGNALER_WAITER_NV = SciSyncClientTypeNV(raw = 2)


@register_passable("trivial")
struct SciSyncPrimitiveTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias FENCE_NV = SciSyncPrimitiveTypeNV(raw = 0)
    alias SEMAPHORE_NV = SciSyncPrimitiveTypeNV(raw = 1)


@register_passable("trivial")
struct ProvokingVertexModeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias FIRST_VERTEX_EXT = ProvokingVertexModeEXT(raw = 0)
    alias LAST_VERTEX_EXT = ProvokingVertexModeEXT(raw = 1)


@register_passable("trivial")
struct PipelineCacheValidationVersion(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias SAFETY_CRITICAL_ONE = PipelineCacheValidationVersion(raw = 1)


@register_passable("trivial")
struct AccelerationStructureMotionInstanceTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias STATIC_NV = AccelerationStructureMotionInstanceTypeNV(raw = 0)
    alias MATRIX_MOTION_NV = AccelerationStructureMotionInstanceTypeNV(raw = 1)
    alias SRT_MOTION_NV = AccelerationStructureMotionInstanceTypeNV(raw = 2)


@register_passable("trivial")
struct DeviceAddressBindingTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias BIND_EXT = DeviceAddressBindingTypeEXT(raw = 0)
    alias UNBIND_EXT = DeviceAddressBindingTypeEXT(raw = 1)


@register_passable("trivial")
struct QueryResultStatusKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ERROR_KHR = QueryResultStatusKHR(raw = -1)
    alias NOT_READY_KHR = QueryResultStatusKHR(raw = 0)
    alias COMPLETE_KHR = QueryResultStatusKHR(raw = 1)
    alias INSUFFICIENT_BITSTREAM_BUFFER_RANGE_KHR = QueryResultStatusKHR(raw = -1000299000)


@register_passable("trivial")
struct VideoEncodeTuningModeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DEFAULT_KHR = VideoEncodeTuningModeKHR(raw = 0)
    alias HIGH_QUALITY_KHR = VideoEncodeTuningModeKHR(raw = 1)
    alias LOW_LATENCY_KHR = VideoEncodeTuningModeKHR(raw = 2)
    alias ULTRA_LOW_LATENCY_KHR = VideoEncodeTuningModeKHR(raw = 3)
    alias LOSSLESS_KHR = VideoEncodeTuningModeKHR(raw = 4)


@register_passable("trivial")
struct PartitionedAccelerationStructureOpTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias WRITE_INSTANCE_NV = PartitionedAccelerationStructureOpTypeNV(raw = 0)
    alias UPDATE_INSTANCE_NV = PartitionedAccelerationStructureOpTypeNV(raw = 1)
    alias WRITE_PARTITION_TRANSLATION_NV = PartitionedAccelerationStructureOpTypeNV(raw = 2)


@register_passable("trivial")
struct VideoEncodeAV1PredictionModeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias INTRA_ONLY_KHR = VideoEncodeAV1PredictionModeKHR(raw = 0)
    alias SINGLE_REFERENCE_KHR = VideoEncodeAV1PredictionModeKHR(raw = 1)
    alias UNIDIRECTIONAL_COMPOUND_KHR = VideoEncodeAV1PredictionModeKHR(raw = 2)
    alias BIDIRECTIONAL_COMPOUND_KHR = VideoEncodeAV1PredictionModeKHR(raw = 3)


@register_passable("trivial")
struct VideoEncodeAV1RateControlGroupKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias INTRA_KHR = VideoEncodeAV1RateControlGroupKHR(raw = 0)
    alias PREDICTIVE_KHR = VideoEncodeAV1RateControlGroupKHR(raw = 1)
    alias BIPREDICTIVE_KHR = VideoEncodeAV1RateControlGroupKHR(raw = 2)


@register_passable("trivial")
struct PipelineRobustnessBufferBehavior(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DEVICE_DEFAULT = PipelineRobustnessBufferBehavior(raw = 0)
    alias DISABLED = PipelineRobustnessBufferBehavior(raw = 1)
    alias ROBUST_BUFFER_ACCESS = PipelineRobustnessBufferBehavior(raw = 2)
    alias ROBUST_BUFFER_ACCESS_2 = PipelineRobustnessBufferBehavior(raw = 3)


@register_passable("trivial")
struct PipelineRobustnessImageBehavior(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DEVICE_DEFAULT = PipelineRobustnessImageBehavior(raw = 0)
    alias DISABLED = PipelineRobustnessImageBehavior(raw = 1)
    alias ROBUST_IMAGE_ACCESS = PipelineRobustnessImageBehavior(raw = 2)
    alias ROBUST_IMAGE_ACCESS_2 = PipelineRobustnessImageBehavior(raw = 3)


@register_passable("trivial")
struct OpticalFlowPerformanceLevelNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UNKNOWN_NV = OpticalFlowPerformanceLevelNV(raw = 0)
    alias SLOW_NV = OpticalFlowPerformanceLevelNV(raw = 1)
    alias MEDIUM_NV = OpticalFlowPerformanceLevelNV(raw = 2)
    alias FAST_NV = OpticalFlowPerformanceLevelNV(raw = 3)


@register_passable("trivial")
struct OpticalFlowSessionBindingPointNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias UNKNOWN_NV = OpticalFlowSessionBindingPointNV(raw = 0)
    alias INPUT_NV = OpticalFlowSessionBindingPointNV(raw = 1)
    alias REFERENCE_NV = OpticalFlowSessionBindingPointNV(raw = 2)
    alias HINT_NV = OpticalFlowSessionBindingPointNV(raw = 3)
    alias FLOW_VECTOR_NV = OpticalFlowSessionBindingPointNV(raw = 4)
    alias BACKWARD_FLOW_VECTOR_NV = OpticalFlowSessionBindingPointNV(raw = 5)
    alias COST_NV = OpticalFlowSessionBindingPointNV(raw = 6)
    alias BACKWARD_COST_NV = OpticalFlowSessionBindingPointNV(raw = 7)
    alias GLOBAL_FLOW_NV = OpticalFlowSessionBindingPointNV(raw = 8)


@register_passable("trivial")
struct MicromapTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias OPACITY_MICROMAP_EXT = MicromapTypeEXT(raw = 0)
    alias DISPLACEMENT_MICROMAP_NV = MicromapTypeEXT(raw = 1000397000)


@register_passable("trivial")
struct CopyMicromapModeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias CLONE_EXT = CopyMicromapModeEXT(raw = 0)
    alias SERIALIZE_EXT = CopyMicromapModeEXT(raw = 1)
    alias DESERIALIZE_EXT = CopyMicromapModeEXT(raw = 2)
    alias COMPACT_EXT = CopyMicromapModeEXT(raw = 3)


@register_passable("trivial")
struct BuildMicromapModeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias BUILD_EXT = BuildMicromapModeEXT(raw = 0)


@register_passable("trivial")
struct OpacityMicromapFormatEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias N_2_STATE_EXT = OpacityMicromapFormatEXT(raw = 1)
    alias N_4_STATE_EXT = OpacityMicromapFormatEXT(raw = 2)


@register_passable("trivial")
struct OpacityMicromapSpecialIndexEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias FULLY_TRANSPARENT_EXT = OpacityMicromapSpecialIndexEXT(raw = -1)
    alias FULLY_OPAQUE_EXT = OpacityMicromapSpecialIndexEXT(raw = -2)
    alias FULLY_UNKNOWN_TRANSPARENT_EXT = OpacityMicromapSpecialIndexEXT(raw = -3)
    alias FULLY_UNKNOWN_OPAQUE_EXT = OpacityMicromapSpecialIndexEXT(raw = -4)
    alias CLUSTER_GEOMETRY_DISABLE_OPACITY_MICROMAP_NV = OpacityMicromapSpecialIndexEXT(raw = -5)


@register_passable("trivial")
struct DepthBiasRepresentationEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias LEAST_REPRESENTABLE_VALUE_FORMAT_EXT = DepthBiasRepresentationEXT(raw = 0)
    alias LEAST_REPRESENTABLE_VALUE_FORCE_UNORM_EXT = DepthBiasRepresentationEXT(raw = 1)
    alias FLOAT_EXT = DepthBiasRepresentationEXT(raw = 2)


@register_passable("trivial")
struct DeviceFaultAddressTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NONE_EXT = DeviceFaultAddressTypeEXT(raw = 0)
    alias READ_INVALID_EXT = DeviceFaultAddressTypeEXT(raw = 1)
    alias WRITE_INVALID_EXT = DeviceFaultAddressTypeEXT(raw = 2)
    alias EXECUTE_INVALID_EXT = DeviceFaultAddressTypeEXT(raw = 3)
    alias INSTRUCTION_POINTER_UNKNOWN_EXT = DeviceFaultAddressTypeEXT(raw = 4)
    alias INSTRUCTION_POINTER_INVALID_EXT = DeviceFaultAddressTypeEXT(raw = 5)
    alias INSTRUCTION_POINTER_FAULT_EXT = DeviceFaultAddressTypeEXT(raw = 6)


@register_passable("trivial")
struct DeviceFaultVendorBinaryHeaderVersionEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ONE_EXT = DeviceFaultVendorBinaryHeaderVersionEXT(raw = 1)


@register_passable("trivial")
struct IndirectExecutionSetInfoTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias PIPELINES_EXT = IndirectExecutionSetInfoTypeEXT(raw = 0)
    alias SHADER_OBJECTS_EXT = IndirectExecutionSetInfoTypeEXT(raw = 1)


@register_passable("trivial")
struct IndirectCommandsTokenTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias EXECUTION_SET_EXT = IndirectCommandsTokenTypeEXT(raw = 0)
    alias PUSH_CONSTANT_EXT = IndirectCommandsTokenTypeEXT(raw = 1)
    alias SEQUENCE_INDEX_EXT = IndirectCommandsTokenTypeEXT(raw = 2)
    alias INDEX_BUFFER_EXT = IndirectCommandsTokenTypeEXT(raw = 3)
    alias VERTEX_BUFFER_EXT = IndirectCommandsTokenTypeEXT(raw = 4)
    alias DRAW_INDEXED_EXT = IndirectCommandsTokenTypeEXT(raw = 5)
    alias DRAW_EXT = IndirectCommandsTokenTypeEXT(raw = 6)
    alias DRAW_INDEXED_COUNT_EXT = IndirectCommandsTokenTypeEXT(raw = 7)
    alias DRAW_COUNT_EXT = IndirectCommandsTokenTypeEXT(raw = 8)
    alias DISPATCH_EXT = IndirectCommandsTokenTypeEXT(raw = 9)
    alias DRAW_MESH_TASKS_NV_EXT = IndirectCommandsTokenTypeEXT(raw = 1000202002)
    alias DRAW_MESH_TASKS_COUNT_NV_EXT = IndirectCommandsTokenTypeEXT(raw = 1000202003)
    alias DRAW_MESH_TASKS_EXT = IndirectCommandsTokenTypeEXT(raw = 1000328000)
    alias DRAW_MESH_TASKS_COUNT_EXT = IndirectCommandsTokenTypeEXT(raw = 1000328001)
    alias TRACE_RAYS2_EXT = IndirectCommandsTokenTypeEXT(raw = 1000386004)


@register_passable("trivial")
struct DisplacementMicromapFormatNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias N_64_TRIANGLES_64_BYTES_NV = DisplacementMicromapFormatNV(raw = 1)
    alias N_256_TRIANGLES_128_BYTES_NV = DisplacementMicromapFormatNV(raw = 2)
    alias N_1024_TRIANGLES_128_BYTES_NV = DisplacementMicromapFormatNV(raw = 3)


@register_passable("trivial")
struct ShaderCodeTypeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias BINARY_EXT = ShaderCodeTypeEXT(raw = 0)
    alias SPIRV_EXT = ShaderCodeTypeEXT(raw = 1)


@register_passable("trivial")
struct ScopeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DEVICE_KHR = ScopeKHR(raw = 1)
    alias WORKGROUP_KHR = ScopeKHR(raw = 2)
    alias SUBGROUP_KHR = ScopeKHR(raw = 3)
    alias QUEUE_FAMILY_KHR = ScopeKHR(raw = 5)


@register_passable("trivial")
struct ComponentTypeKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias FLOAT16_KHR = ComponentTypeKHR(raw = 0)
    alias FLOAT32_KHR = ComponentTypeKHR(raw = 1)
    alias FLOAT64_KHR = ComponentTypeKHR(raw = 2)
    alias SINT8_KHR = ComponentTypeKHR(raw = 3)
    alias SINT16_KHR = ComponentTypeKHR(raw = 4)
    alias SINT32_KHR = ComponentTypeKHR(raw = 5)
    alias SINT64_KHR = ComponentTypeKHR(raw = 6)
    alias UINT8_KHR = ComponentTypeKHR(raw = 7)
    alias UINT16_KHR = ComponentTypeKHR(raw = 8)
    alias UINT32_KHR = ComponentTypeKHR(raw = 9)
    alias UINT64_KHR = ComponentTypeKHR(raw = 10)
    alias BFLOAT16_KHR = ComponentTypeKHR(raw = 1000141000)
    alias SINT8_PACKED_NV = ComponentTypeKHR(raw = 1000491000)
    alias UINT8_PACKED_NV = ComponentTypeKHR(raw = 1000491001)
    alias FLOAT8_E4M3_EXT = ComponentTypeKHR(raw = 1000491002)
    alias FLOAT8_E5M2_EXT = ComponentTypeKHR(raw = 1000491003)


@register_passable("trivial")
struct CubicFilterWeightsQCOM(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias CATMULL_ROM_QCOM = CubicFilterWeightsQCOM(raw = 0)
    alias ZERO_TANGENT_CARDINAL_QCOM = CubicFilterWeightsQCOM(raw = 1)
    alias B_SPLINE_QCOM = CubicFilterWeightsQCOM(raw = 2)
    alias MITCHELL_NETRAVALI_QCOM = CubicFilterWeightsQCOM(raw = 3)


@register_passable("trivial")
struct BlockMatchWindowCompareModeQCOM(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias MIN_QCOM = BlockMatchWindowCompareModeQCOM(raw = 0)
    alias MAX_QCOM = BlockMatchWindowCompareModeQCOM(raw = 1)


@register_passable("trivial")
struct PhysicalDeviceLayeredApiKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias VULKAN_KHR = PhysicalDeviceLayeredApiKHR(raw = 0)
    alias D3D12_KHR = PhysicalDeviceLayeredApiKHR(raw = 1)
    alias METAL_KHR = PhysicalDeviceLayeredApiKHR(raw = 2)
    alias OPENGL_KHR = PhysicalDeviceLayeredApiKHR(raw = 3)
    alias OPENGLES_KHR = PhysicalDeviceLayeredApiKHR(raw = 4)


@register_passable("trivial")
struct LayeredDriverUnderlyingApiMSFT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias NONE_MSFT = LayeredDriverUnderlyingApiMSFT(raw = 0)
    alias D3D12_MSFT = LayeredDriverUnderlyingApiMSFT(raw = 1)


@register_passable("trivial")
struct LatencyMarkerNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias SIMULATION_START_NV = LatencyMarkerNV(raw = 0)
    alias SIMULATION_END_NV = LatencyMarkerNV(raw = 1)
    alias RENDERSUBMIT_START_NV = LatencyMarkerNV(raw = 2)
    alias RENDERSUBMIT_END_NV = LatencyMarkerNV(raw = 3)
    alias PRESENT_START_NV = LatencyMarkerNV(raw = 4)
    alias PRESENT_END_NV = LatencyMarkerNV(raw = 5)
    alias INPUT_SAMPLE_NV = LatencyMarkerNV(raw = 6)
    alias TRIGGER_FLASH_NV = LatencyMarkerNV(raw = 7)
    alias OUT_OF_BAND_RENDERSUBMIT_START_NV = LatencyMarkerNV(raw = 8)
    alias OUT_OF_BAND_RENDERSUBMIT_END_NV = LatencyMarkerNV(raw = 9)
    alias OUT_OF_BAND_PRESENT_START_NV = LatencyMarkerNV(raw = 10)
    alias OUT_OF_BAND_PRESENT_END_NV = LatencyMarkerNV(raw = 11)


@register_passable("trivial")
struct OutOfBandQueueTypeNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias RENDER_NV = OutOfBandQueueTypeNV(raw = 0)
    alias PRESENT_NV = OutOfBandQueueTypeNV(raw = 1)


@register_passable("trivial")
struct CompressedTriangleFormatAMDX(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DGF1_AMDX = CompressedTriangleFormatAMDX(raw = 0)


@register_passable("trivial")
struct DepthClampModeEXT(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias VIEWPORT_RANGE_EXT = DepthClampModeEXT(raw = 0)
    alias USER_DEFINED_RANGE_EXT = DepthClampModeEXT(raw = 1)


@register_passable("trivial")
struct CooperativeVectorMatrixLayoutNV(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ROW_MAJOR_NV = CooperativeVectorMatrixLayoutNV(raw = 0)
    alias COLUMN_MAJOR_NV = CooperativeVectorMatrixLayoutNV(raw = 1)
    alias INFERENCING_OPTIMAL_NV = CooperativeVectorMatrixLayoutNV(raw = 2)
    alias TRAINING_OPTIMAL_NV = CooperativeVectorMatrixLayoutNV(raw = 3)


@register_passable("trivial")
struct TensorTilingARM(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias OPTIMAL_ARM = TensorTilingARM(raw = 0)
    alias LINEAR_ARM = TensorTilingARM(raw = 1)


@register_passable("trivial")
struct DefaultVertexAttributeValueKHR(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias ZERO_ZERO_ZERO_ZERO_KHR = DefaultVertexAttributeValueKHR(raw = 0)
    alias ZERO_ZERO_ZERO_ONE_KHR = DefaultVertexAttributeValueKHR(raw = 1)


@register_passable("trivial")
struct DataGraphPipelineSessionBindPointARM(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias TRANSIENT_ARM = DataGraphPipelineSessionBindPointARM(raw = 0)


@register_passable("trivial")
struct DataGraphPipelineSessionBindPointTypeARM(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias MEMORY_ARM = DataGraphPipelineSessionBindPointTypeARM(raw = 0)


@register_passable("trivial")
struct DataGraphPipelinePropertyARM(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias CREATION_LOG_ARM = DataGraphPipelinePropertyARM(raw = 0)
    alias IDENTIFIER_ARM = DataGraphPipelinePropertyARM(raw = 1)


@register_passable("trivial")
struct PhysicalDeviceDataGraphProcessingEngineTypeARM(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias DEFAULT_ARM = PhysicalDeviceDataGraphProcessingEngineTypeARM(raw = 0)


@register_passable("trivial")
struct PhysicalDeviceDataGraphOperationTypeARM(EqualityComparable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    alias SPIRV_EXTENDED_INSTRUCTION_SET_ARM = PhysicalDeviceDataGraphOperationTypeARM(raw = 0)
