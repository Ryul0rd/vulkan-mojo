from memory import memcpy
from sys import size_of
from .structs import *


alias Ptr = UnsafePointer


struct ClearColorValue(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[InlineArray[Float32, Int(4)]](),
        size_of[InlineArray[Int32, Int(4)]](),
        size_of[InlineArray[UInt32, Int(4)]](),
    )
    alias _AlignType = UInt32
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
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


struct ClearValue(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[ClearColorValue](),
        size_of[ClearDepthStencilValue](),
    )
    alias _AlignType = UInt32
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
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


struct ClusterAccelerationStructureOpInputNV(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV]](),
        size_of[Ptr[ClusterAccelerationStructureTriangleClusterInputNV]](),
        size_of[Ptr[ClusterAccelerationStructureMoveObjectsInputNV]](),
    )
    alias _AlignType = UInt
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureClustersBottomLevelInputNV]](),
        )

    fn __init__(out self, value: Ptr[ClusterAccelerationStructureTriangleClusterInputNV]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureTriangleClusterInputNV]](),
        )

    fn __init__(out self, value: Ptr[ClusterAccelerationStructureMoveObjectsInputNV]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[ClusterAccelerationStructureMoveObjectsInputNV]](),
        )


struct PerformanceCounterResultKHR(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[Int32](),
        size_of[Int64](),
        size_of[UInt32](),
        size_of[UInt64](),
        size_of[Float32](),
        size_of[Float64](),
    )
    alias _AlignType = UInt64
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
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


struct PerformanceValueDataINTEL(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[UInt32](),
        size_of[UInt64](),
        size_of[Float32](),
        size_of[Bool32](),
        size_of[Ptr[UInt8]](),
    )
    alias _AlignType = UInt64
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
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

    fn __init__(out self, value: Ptr[UInt8]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[UInt8]](),
        )


struct PipelineExecutableStatisticValueKHR(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[Bool32](),
        size_of[Int64](),
        size_of[UInt64](),
        size_of[Float64](),
    )
    alias _AlignType = UInt64
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
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


struct DeviceOrHostAddressKHR(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType]](),
    )
    alias _AlignType = UInt64
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
    var _value: Self._InnerType

    fn __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    fn __init__(out self, value: Ptr[NoneType]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType]](),
        )


struct DeviceOrHostAddressConstKHR(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType]](),
    )
    alias _AlignType = UInt64
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
    var _value: Self._InnerType

    fn __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    fn __init__(out self, value: Ptr[NoneType]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType]](),
        )


struct DeviceOrHostAddressConstAMDX(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[DeviceAddress](),
        size_of[Ptr[NoneType]](),
    )
    alias _AlignType = UInt64
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
    var _value: Self._InnerType

    fn __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )

    fn __init__(out self, value: Ptr[NoneType]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[NoneType]](),
        )


struct AccelerationStructureGeometryDataKHR(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[AccelerationStructureGeometryTrianglesDataKHR](),
        size_of[AccelerationStructureGeometryAabbsDataKHR](),
        size_of[AccelerationStructureGeometryInstancesDataKHR](),
    )
    alias _AlignType = UInt64
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
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


struct IndirectExecutionSetInfoEXT(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[Ptr[IndirectExecutionSetPipelineInfoEXT]](),
        size_of[Ptr[IndirectExecutionSetShaderInfoEXT]](),
    )
    alias _AlignType = UInt
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[IndirectExecutionSetPipelineInfoEXT]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectExecutionSetPipelineInfoEXT]](),
        )

    fn __init__(out self, value: Ptr[IndirectExecutionSetShaderInfoEXT]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectExecutionSetShaderInfoEXT]](),
        )


struct IndirectCommandsTokenDataEXT(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[Ptr[IndirectCommandsPushConstantTokenEXT]](),
        size_of[Ptr[IndirectCommandsVertexBufferTokenEXT]](),
        size_of[Ptr[IndirectCommandsIndexBufferTokenEXT]](),
        size_of[Ptr[IndirectCommandsExecutionSetTokenEXT]](),
    )
    alias _AlignType = UInt
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[IndirectCommandsPushConstantTokenEXT]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsPushConstantTokenEXT]](),
        )

    fn __init__(out self, value: Ptr[IndirectCommandsVertexBufferTokenEXT]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsVertexBufferTokenEXT]](),
        )

    fn __init__(out self, value: Ptr[IndirectCommandsIndexBufferTokenEXT]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsIndexBufferTokenEXT]](),
        )

    fn __init__(out self, value: Ptr[IndirectCommandsExecutionSetTokenEXT]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[IndirectCommandsExecutionSetTokenEXT]](),
        )


struct DescriptorDataEXT(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[Ptr[Sampler]](),
        size_of[Ptr[DescriptorImageInfo]](),
        size_of[Ptr[DescriptorAddressInfoEXT]](),
        size_of[DeviceAddress](),
    )
    alias _AlignType = UInt64
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
    var _value: Self._InnerType

    fn __init__(out self, value: Ptr[Sampler]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[Sampler]](),
        )

    fn __init__(out self, value: Ptr[DescriptorImageInfo]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorImageInfo]](),
        )

    fn __init__(out self, value: Ptr[DescriptorAddressInfoEXT]):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[Ptr[DescriptorAddressInfoEXT]](),
        )

    fn __init__(out self, value: DeviceAddress):
        self._value = zero_init[Self._InnerType]()
        memcpy(
            dest = Ptr(to=self._value).bitcast[Byte](),
            src = Ptr(to=value).bitcast[Byte](),
            count = size_of[DeviceAddress](),
        )


struct AccelerationStructureMotionInstanceDataNV(ImplicitlyCopyable, Movable):
    alias _size = max(
        size_of[AccelerationStructureInstanceKHR](),
        size_of[AccelerationStructureMatrixMotionInstanceNV](),
        size_of[AccelerationStructureSRTMotionInstanceNV](),
    )
    alias _AlignType = UInt64
    alias _InnerType = InlineArray[Self._AlignType, Self._size//size_of[Self._AlignType]()]
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
