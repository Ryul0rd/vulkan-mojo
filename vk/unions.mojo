from memory import memcpy
from math import ceildiv
from sys import size_of
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

    fn __init__(out self, value: InlineArray[Float32, Int(4)]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[InlineArray[Float32, Int(4)]](),
        )

    fn __init__(out self, value: InlineArray[Int32, Int(4)]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[InlineArray[Int32, Int(4)]](),
        )

    fn __init__(out self, value: InlineArray[UInt32, Int(4)]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[InlineArray[UInt32, Int(4)]](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct ClearValue(ImplicitlyCopyable):
    comptime _size = max(
        size_of[ClearColorValue](),
        size_of[ClearDepthStencilValue](),
    )
    comptime _AlignType = UInt32
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: ClearColorValue):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[ClearColorValue](),
        )

    fn __init__(out self, value: ClearDepthStencilValue):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[ClearDepthStencilValue](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct ClusterAccelerationStructureOpInputNV(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV, MutAnyOrigin]](),
        size_of[Ptr[ClusterAccelerationStructureTriangleClusterInputNV, MutAnyOrigin]](),
        size_of[Ptr[ClusterAccelerationStructureMoveObjectsInputNV, MutAnyOrigin]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV, MutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV, MutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[ClusterAccelerationStructureTriangleClusterInputNV, MutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureTriangleClusterInputNV, MutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[ClusterAccelerationStructureMoveObjectsInputNV, MutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureMoveObjectsInputNV, MutAnyOrigin]](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


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

    fn __init__(out self, value: Int32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Int32](),
        )

    fn __init__(out self, value: Int64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Int64](),
        )

    fn __init__(out self, value: UInt32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt32](),
        )

    fn __init__(out self, value: UInt64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt64](),
        )

    fn __init__(out self, value: Float32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Float32](),
        )

    fn __init__(out self, value: Float64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Float64](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct PerformanceValueDataINTEL(ImplicitlyCopyable):
    comptime _size = max(
        size_of[UInt32](),
        size_of[UInt64](),
        size_of[Float32](),
        size_of[Bool32](),
        size_of[CStringSlice[ImmutAnyOrigin]](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: UInt32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt32](),
        )

    fn __init__(out self, value: UInt64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt64](),
        )

    fn __init__(out self, value: Float32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Float32](),
        )

    fn __init__(out self, value: Bool32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Bool32](),
        )

    fn __init__(out self, value: CStringSlice[ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[CStringSlice[ImmutAnyOrigin]](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


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

    fn __init__(out self, value: Bool32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Bool32](),
        )

    fn __init__(out self, value: Int64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Int64](),
        )

    fn __init__(out self, value: UInt64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt64](),
        )

    fn __init__(out self, value: Float64):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Float64](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct DeviceOrHostAddressKHR(ImplicitlyCopyable):
    comptime _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType, MutAnyOrigin]](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    fn __init__(out self, value: Ptr[NoneType, MutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType, MutAnyOrigin]](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct DeviceOrHostAddressConstKHR(ImplicitlyCopyable):
    comptime _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType, ImmutAnyOrigin]](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    fn __init__(out self, value: Ptr[NoneType, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType, ImmutAnyOrigin]](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct DeviceOrHostAddressConstAMDX(ImplicitlyCopyable):
    comptime _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType, ImmutAnyOrigin]](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    fn __init__(out self, value: Ptr[NoneType, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType, ImmutAnyOrigin]](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct AccelerationStructureGeometryDataKHR(ImplicitlyCopyable):
    comptime _size = max(
        size_of[AccelerationStructureGeometryTrianglesDataKHR](),
        size_of[AccelerationStructureGeometryAabbsDataKHR](),
        size_of[AccelerationStructureGeometryInstancesDataKHR](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: AccelerationStructureGeometryTrianglesDataKHR):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureGeometryTrianglesDataKHR](),
        )

    fn __init__(out self, value: AccelerationStructureGeometryAabbsDataKHR):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureGeometryAabbsDataKHR](),
        )

    fn __init__(out self, value: AccelerationStructureGeometryInstancesDataKHR):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureGeometryInstancesDataKHR](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct IndirectExecutionSetInfoEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[IndirectExecutionSetPipelineInfoEXT, ImmutAnyOrigin]](),
        size_of[Ptr[IndirectExecutionSetShaderInfoEXT, ImmutAnyOrigin]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[IndirectExecutionSetPipelineInfoEXT, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectExecutionSetPipelineInfoEXT, ImmutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[IndirectExecutionSetShaderInfoEXT, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectExecutionSetShaderInfoEXT, ImmutAnyOrigin]](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct IndirectCommandsTokenDataEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[IndirectCommandsPushConstantTokenEXT, ImmutAnyOrigin]](),
        size_of[Ptr[IndirectCommandsVertexBufferTokenEXT, ImmutAnyOrigin]](),
        size_of[Ptr[IndirectCommandsIndexBufferTokenEXT, ImmutAnyOrigin]](),
        size_of[Ptr[IndirectCommandsExecutionSetTokenEXT, ImmutAnyOrigin]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[IndirectCommandsPushConstantTokenEXT, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsPushConstantTokenEXT, ImmutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[IndirectCommandsVertexBufferTokenEXT, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsVertexBufferTokenEXT, ImmutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[IndirectCommandsIndexBufferTokenEXT, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsIndexBufferTokenEXT, ImmutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[IndirectCommandsExecutionSetTokenEXT, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsExecutionSetTokenEXT, ImmutAnyOrigin]](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct DescriptorDataEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[Sampler, ImmutAnyOrigin]](),
        size_of[Ptr[DescriptorImageInfo, ImmutAnyOrigin]](),
        size_of[Ptr[DescriptorAddressInfoEXT, ImmutAnyOrigin]](),
        size_of[DeviceAddress](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[Sampler, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[Sampler, ImmutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[DescriptorImageInfo, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorImageInfo, ImmutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[DescriptorAddressInfoEXT, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorAddressInfoEXT, ImmutAnyOrigin]](),
        )

    fn __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct AccelerationStructureMotionInstanceDataNV(ImplicitlyCopyable):
    comptime _size = max(
        size_of[AccelerationStructureInstanceKHR](),
        size_of[AccelerationStructureMatrixMotionInstanceNV](),
        size_of[AccelerationStructureSRTMotionInstanceNV](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: AccelerationStructureInstanceKHR):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureInstanceKHR](),
        )

    fn __init__(out self, value: AccelerationStructureMatrixMotionInstanceNV):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureMatrixMotionInstanceNV](),
        )

    fn __init__(out self, value: AccelerationStructureSRTMotionInstanceNV):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[AccelerationStructureSRTMotionInstanceNV](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


struct ResourceDescriptorDataEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[ImageDescriptorInfoEXT, ImmutAnyOrigin]](),
        size_of[Ptr[TexelBufferDescriptorInfoEXT, ImmutAnyOrigin]](),
        size_of[Ptr[DeviceAddressRangeEXT, ImmutAnyOrigin]](),
        size_of[Ptr[TensorViewCreateInfoARM, ImmutAnyOrigin]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[ImageDescriptorInfoEXT, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ImageDescriptorInfoEXT, ImmutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[TexelBufferDescriptorInfoEXT, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[TexelBufferDescriptorInfoEXT, ImmutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[DeviceAddressRangeEXT, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DeviceAddressRangeEXT, ImmutAnyOrigin]](),
        )

    fn __init__(out self, value: Ptr[TensorViewCreateInfoARM, ImmutAnyOrigin]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[TensorViewCreateInfoARM, ImmutAnyOrigin]](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()


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

    fn __init__(out self, value: DescriptorMappingSourceConstantOffsetEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceConstantOffsetEXT](),
        )

    fn __init__(out self, value: DescriptorMappingSourcePushIndexEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourcePushIndexEXT](),
        )

    fn __init__(out self, value: DescriptorMappingSourceIndirectIndexEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceIndirectIndexEXT](),
        )

    fn __init__(out self, value: DescriptorMappingSourceIndirectIndexArrayEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceIndirectIndexArrayEXT](),
        )

    fn __init__(out self, value: DescriptorMappingSourceHeapDataEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceHeapDataEXT](),
        )

    fn __init__(out self, value: UInt32):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[UInt32](),
        )

    fn __init__(out self, value: DescriptorMappingSourceIndirectAddressEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceIndirectAddressEXT](),
        )

    fn __init__(out self, value: DescriptorMappingSourceShaderRecordIndexEXT):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DescriptorMappingSourceShaderRecordIndexEXT](),
        )

    fn __copyinit__(out self, other: Self):
        self._value = other._value.copy()
