from std.memory import memcpy
from std.math import ceildiv
from std.sys import size_of
from .structs import *


comptime Ptr = UnsafePointer


struct ClearColorValue(ImplicitlyCopyable):
    comptime _size = max(
        size_of[InlineArray[Float32, Int(4)]](),
        size_of[InlineArray[Int32, Int(4)]](),
        size_of[InlineArray[UInt32, Int(4)]](),
    )
    comptime _AlignType = UInt32
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: InlineArray[Float32, Int(4)]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[InlineArray[Float32, Int(4)]](),
        )

    def __init__(out self, value: InlineArray[Int32, Int(4)]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[InlineArray[Int32, Int(4)]](),
        )

    def __init__(out self, value: InlineArray[UInt32, Int(4)]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[InlineArray[UInt32, Int(4)]](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct ClearValue(ImplicitlyCopyable):
    comptime _size = max(
        size_of[ClearColorValue](),
        size_of[ClearDepthStencilValue](),
    )
    comptime _AlignType = UInt32
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: ClearColorValue):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[ClearColorValue](),
        )

    def __init__(out self, value: ClearDepthStencilValue):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[ClearDepthStencilValue](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct ClusterAccelerationStructureOpInputNV(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV, MutUntrackedOrigin]](),
        size_of[Ptr[ClusterAccelerationStructureTriangleClusterInputNV, MutUntrackedOrigin]](),
        size_of[Ptr[ClusterAccelerationStructureMoveObjectsInputNV, MutUntrackedOrigin]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV, MutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV, MutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[ClusterAccelerationStructureTriangleClusterInputNV, MutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureTriangleClusterInputNV, MutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[ClusterAccelerationStructureMoveObjectsInputNV, MutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureMoveObjectsInputNV, MutUntrackedOrigin]](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct PerformanceCounterResultKHR(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Int32](),
        size_of[Int64](),
        size_of[UInt32](),
        size_of[UInt64](),
        size_of[Float32](),
        size_of[Float64](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: Int32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Int32](),
        )

    def __init__(out self, value: Int64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Int64](),
        )

    def __init__(out self, value: UInt32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt32](),
        )

    def __init__(out self, value: UInt64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt64](),
        )

    def __init__(out self, value: Float32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Float32](),
        )

    def __init__(out self, value: Float64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Float64](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct PerformanceValueDataINTEL(ImplicitlyCopyable):
    comptime _size = max(
        size_of[UInt32](),
        size_of[UInt64](),
        size_of[Float32](),
        size_of[Bool32](),
        size_of[Ptr[c_char, ImmutUntrackedOrigin]](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: UInt32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt32](),
        )

    def __init__(out self, value: UInt64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt64](),
        )

    def __init__(out self, value: Float32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Float32](),
        )

    def __init__(out self, value: Bool32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Bool32](),
        )

    def __init__(out self, value: Ptr[c_char, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[c_char, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct PipelineExecutableStatisticValueKHR(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Bool32](),
        size_of[Int64](),
        size_of[UInt64](),
        size_of[Float64](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: Bool32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Bool32](),
        )

    def __init__(out self, value: Int64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Int64](),
        )

    def __init__(out self, value: UInt64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt64](),
        )

    def __init__(out self, value: Float64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Float64](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct DeviceOrHostAddressKHR(ImplicitlyCopyable):
    comptime _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType, MutUntrackedOrigin]](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    def __init__(out self, value: Ptr[NoneType, MutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType, MutUntrackedOrigin]](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct DeviceOrHostAddressConstKHR(ImplicitlyCopyable):
    comptime _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType, ImmutUntrackedOrigin]](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    def __init__(out self, value: Ptr[NoneType, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct DeviceOrHostAddressConstAMDX(ImplicitlyCopyable):
    comptime _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType, ImmutUntrackedOrigin]](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    def __init__(out self, value: Ptr[NoneType, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct AccelerationStructureGeometryDataKHR(ImplicitlyCopyable):
    comptime _size = max(
        size_of[AccelerationStructureGeometryTrianglesDataKHR](),
        size_of[AccelerationStructureGeometryAabbsDataKHR](),
        size_of[AccelerationStructureGeometryInstancesDataKHR](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: AccelerationStructureGeometryTrianglesDataKHR):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureGeometryTrianglesDataKHR](),
        )

    def __init__(out self, value: AccelerationStructureGeometryAabbsDataKHR):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureGeometryAabbsDataKHR](),
        )

    def __init__(out self, value: AccelerationStructureGeometryInstancesDataKHR):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureGeometryInstancesDataKHR](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct IndirectExecutionSetInfoEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[IndirectExecutionSetPipelineInfoEXT, ImmutUntrackedOrigin]](),
        size_of[Ptr[IndirectExecutionSetShaderInfoEXT, ImmutUntrackedOrigin]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: Ptr[IndirectExecutionSetPipelineInfoEXT, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectExecutionSetPipelineInfoEXT, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[IndirectExecutionSetShaderInfoEXT, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectExecutionSetShaderInfoEXT, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct IndirectCommandsTokenDataEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[IndirectCommandsPushConstantTokenEXT, ImmutUntrackedOrigin]](),
        size_of[Ptr[IndirectCommandsVertexBufferTokenEXT, ImmutUntrackedOrigin]](),
        size_of[Ptr[IndirectCommandsIndexBufferTokenEXT, ImmutUntrackedOrigin]](),
        size_of[Ptr[IndirectCommandsExecutionSetTokenEXT, ImmutUntrackedOrigin]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: Ptr[IndirectCommandsPushConstantTokenEXT, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsPushConstantTokenEXT, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[IndirectCommandsVertexBufferTokenEXT, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsVertexBufferTokenEXT, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[IndirectCommandsIndexBufferTokenEXT, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsIndexBufferTokenEXT, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[IndirectCommandsExecutionSetTokenEXT, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsExecutionSetTokenEXT, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct DescriptorDataEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[Sampler, ImmutUntrackedOrigin]](),
        size_of[Ptr[DescriptorImageInfo, ImmutUntrackedOrigin]](),
        size_of[Ptr[DescriptorAddressInfoEXT, ImmutUntrackedOrigin]](),
        size_of[DeviceAddress](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: Ptr[Sampler, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[Sampler, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[DescriptorImageInfo, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorImageInfo, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[DescriptorAddressInfoEXT, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorAddressInfoEXT, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct AccelerationStructureMotionInstanceDataNV(ImplicitlyCopyable):
    comptime _size = max(
        size_of[AccelerationStructureInstanceKHR](),
        size_of[AccelerationStructureMatrixMotionInstanceNV](),
        size_of[AccelerationStructureSRTMotionInstanceNV](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: AccelerationStructureInstanceKHR):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureInstanceKHR](),
        )

    def __init__(out self, value: AccelerationStructureMatrixMotionInstanceNV):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureMatrixMotionInstanceNV](),
        )

    def __init__(out self, value: AccelerationStructureSRTMotionInstanceNV):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureSRTMotionInstanceNV](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct ResourceDescriptorDataEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[ImageDescriptorInfoEXT, ImmutUntrackedOrigin]](),
        size_of[Ptr[TexelBufferDescriptorInfoEXT, ImmutUntrackedOrigin]](),
        size_of[Ptr[DeviceAddressRangeEXT, ImmutUntrackedOrigin]](),
        size_of[Ptr[TensorViewCreateInfoARM, ImmutUntrackedOrigin]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: Ptr[ImageDescriptorInfoEXT, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ImageDescriptorInfoEXT, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[TexelBufferDescriptorInfoEXT, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[TexelBufferDescriptorInfoEXT, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[DeviceAddressRangeEXT, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DeviceAddressRangeEXT, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, value: Ptr[TensorViewCreateInfoARM, ImmutUntrackedOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[TensorViewCreateInfoARM, ImmutUntrackedOrigin]](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()


struct DescriptorMappingSourceDataEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[DescriptorMappingSourceConstantOffsetEXT](),
        size_of[DescriptorMappingSourcePushIndexEXT](),
        size_of[DescriptorMappingSourceIndirectIndexEXT](),
        size_of[DescriptorMappingSourceIndirectIndexArrayEXT](),
        size_of[DescriptorMappingSourceHeapDataEXT](),
        size_of[UInt32](),
        size_of[DescriptorMappingSourceIndirectAddressEXT](),
        size_of[DescriptorMappingSourceShaderRecordIndexEXT](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    def __init__(out self, value: DescriptorMappingSourceConstantOffsetEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceConstantOffsetEXT](),
        )

    def __init__(out self, value: DescriptorMappingSourcePushIndexEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourcePushIndexEXT](),
        )

    def __init__(out self, value: DescriptorMappingSourceIndirectIndexEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceIndirectIndexEXT](),
        )

    def __init__(out self, value: DescriptorMappingSourceIndirectIndexArrayEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceIndirectIndexArrayEXT](),
        )

    def __init__(out self, value: DescriptorMappingSourceHeapDataEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceHeapDataEXT](),
        )

    def __init__(out self, value: UInt32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt32](),
        )

    def __init__(out self, value: DescriptorMappingSourceIndirectAddressEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceIndirectAddressEXT](),
        )

    def __init__(out self, value: DescriptorMappingSourceShaderRecordIndexEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceShaderRecordIndexEXT](),
        )

    def __init__(out self, *, copy: Self):
        self._value = copy._value.copy()
