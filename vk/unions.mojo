from memory import memcpy
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


struct ClusterAccelerationStructureOpInputNV(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV, MutOrigin.external]](),
        size_of[Ptr[ClusterAccelerationStructureTriangleClusterInputNV, MutOrigin.external]](),
        size_of[Ptr[ClusterAccelerationStructureMoveObjectsInputNV, MutOrigin.external]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[ClusterAccelerationStructureTriangleClusterInputNV, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureTriangleClusterInputNV, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[ClusterAccelerationStructureMoveObjectsInputNV, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureMoveObjectsInputNV, MutOrigin.external]](),
        )


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


struct PerformanceValueDataINTEL(ImplicitlyCopyable):
    comptime _size = max(
        size_of[UInt32](),
        size_of[UInt64](),
        size_of[Float32](),
        size_of[Bool32](),
        size_of[CStringSlice[ImmutOrigin.external]](),
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

    fn __init__(out self, value: CStringSlice[ImmutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[CStringSlice[ImmutOrigin.external]](),
        )


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


struct DeviceOrHostAddressKHR(ImplicitlyCopyable):
    comptime _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType, MutOrigin.external]](),
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

    fn __init__(out self, value: Ptr[NoneType, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType, MutOrigin.external]](),
        )


struct DeviceOrHostAddressConstKHR(ImplicitlyCopyable):
    comptime _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType, MutOrigin.external]](),
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

    fn __init__(out self, value: Ptr[NoneType, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType, MutOrigin.external]](),
        )


struct DeviceOrHostAddressConstAMDX(ImplicitlyCopyable):
    comptime _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType, MutOrigin.external]](),
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

    fn __init__(out self, value: Ptr[NoneType, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType, MutOrigin.external]](),
        )


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


struct IndirectExecutionSetInfoEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[IndirectExecutionSetPipelineInfoEXT, MutOrigin.external]](),
        size_of[Ptr[IndirectExecutionSetShaderInfoEXT, MutOrigin.external]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[IndirectExecutionSetPipelineInfoEXT, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectExecutionSetPipelineInfoEXT, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[IndirectExecutionSetShaderInfoEXT, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectExecutionSetShaderInfoEXT, MutOrigin.external]](),
        )


struct IndirectCommandsTokenDataEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[IndirectCommandsPushConstantTokenEXT, MutOrigin.external]](),
        size_of[Ptr[IndirectCommandsVertexBufferTokenEXT, MutOrigin.external]](),
        size_of[Ptr[IndirectCommandsIndexBufferTokenEXT, MutOrigin.external]](),
        size_of[Ptr[IndirectCommandsExecutionSetTokenEXT, MutOrigin.external]](),
    )
    comptime _AlignType = UInt
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[IndirectCommandsPushConstantTokenEXT, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsPushConstantTokenEXT, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[IndirectCommandsVertexBufferTokenEXT, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsVertexBufferTokenEXT, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[IndirectCommandsIndexBufferTokenEXT, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsIndexBufferTokenEXT, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[IndirectCommandsExecutionSetTokenEXT, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsExecutionSetTokenEXT, MutOrigin.external]](),
        )


struct DescriptorDataEXT(ImplicitlyCopyable):
    comptime _size = max(
        size_of[Ptr[Sampler, MutOrigin.external]](),
        size_of[Ptr[DescriptorImageInfo, MutOrigin.external]](),
        size_of[Ptr[DescriptorImageInfo, MutOrigin.external]](),
        size_of[Ptr[DescriptorImageInfo, MutOrigin.external]](),
        size_of[Ptr[DescriptorImageInfo, MutOrigin.external]](),
        size_of[Ptr[DescriptorAddressInfoEXT, MutOrigin.external]](),
        size_of[Ptr[DescriptorAddressInfoEXT, MutOrigin.external]](),
        size_of[Ptr[DescriptorAddressInfoEXT, MutOrigin.external]](),
        size_of[Ptr[DescriptorAddressInfoEXT, MutOrigin.external]](),
        size_of[DeviceAddress](),
    )
    comptime _AlignType = UInt64
    comptime _InnerType = InlineArray[Self._AlignType, ceildiv(Self._size, size_of[Self._AlignType]())]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[Sampler, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[Sampler, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[DescriptorImageInfo, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorImageInfo, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[DescriptorImageInfo, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorImageInfo, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[DescriptorImageInfo, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorImageInfo, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[DescriptorImageInfo, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorImageInfo, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[DescriptorAddressInfoEXT, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorAddressInfoEXT, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[DescriptorAddressInfoEXT, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorAddressInfoEXT, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[DescriptorAddressInfoEXT, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorAddressInfoEXT, MutOrigin.external]](),
        )

    fn __init__(out self, value: Ptr[DescriptorAddressInfoEXT, MutOrigin.external]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorAddressInfoEXT, MutOrigin.external]](),
        )

    fn __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )


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
