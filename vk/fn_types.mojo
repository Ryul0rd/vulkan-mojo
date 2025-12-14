from .handles import *
from .structs import *
from .misc import *

comptime Ptr = UnsafePointer


comptime PFN_vkInternalAllocationNotification = fn(
    p_user_data: Ptr[NoneType, MutOrigin.external],
    size: UInt,
    allocation_type: InternalAllocationType,
    allocation_scope: SystemAllocationScope,
)

comptime PFN_vkInternalFreeNotification = fn(
    p_user_data: Ptr[NoneType, MutOrigin.external],
    size: UInt,
    allocation_type: InternalAllocationType,
    allocation_scope: SystemAllocationScope,
)

comptime PFN_vkReallocationFunction = fn(
    p_user_data: Ptr[NoneType, MutOrigin.external],
    p_original: Ptr[NoneType, MutOrigin.external],
    size: UInt,
    alignment: UInt,
    allocation_scope: SystemAllocationScope,
)

comptime PFN_vkAllocationFunction = fn(
    p_user_data: Ptr[NoneType, MutOrigin.external],
    size: UInt,
    alignment: UInt,
    allocation_scope: SystemAllocationScope,
)

comptime PFN_vkFreeFunction = fn(
    p_user_data: Ptr[NoneType, MutOrigin.external], p_memory: Ptr[NoneType, MutOrigin.external]
)

comptime PFN_vkVoidFunction = fn()

comptime PFN_vkDebugReportCallbackEXT = fn(
    flags: DebugReportFlagsEXT,
    object_type: DebugReportObjectTypeEXT,
    object: UInt64,
    location: UInt,
    message_code: Int32,
    p_layer_prefix: CStringSlice[ImmutOrigin.external],
    p_message: CStringSlice[ImmutOrigin.external],
    p_user_data: Ptr[NoneType, MutOrigin.external],
) -> Bool32

comptime PFN_vkDebugUtilsMessengerCallbackEXT = fn(
    message_severity: DebugUtilsMessageSeverityFlagBitsEXT,
    message_types: DebugUtilsMessageTypeFlagsEXT,
    p_callback_data: Ptr[DebugUtilsMessengerCallbackDataEXT, MutOrigin.external],
    p_user_data: Ptr[NoneType, MutOrigin.external],
) -> Bool32

comptime PFN_vkFaultCallbackFunction = fn(
    unrecorded_faults: Bool32, fault_count: UInt32, p_faults: Ptr[FaultData, MutOrigin.external]
)

comptime PFN_vkDeviceMemoryReportCallbackEXT = fn(
    p_callback_data: Ptr[DeviceMemoryReportCallbackDataEXT, MutOrigin.external],
    p_user_data: Ptr[NoneType, MutOrigin.external],
)

comptime PFN_vkGetInstanceProcAddrLUNARG = fn(
    instance: Instance, p_name: CStringSlice[ImmutOrigin.external]
) -> PFN_vkVoidFunction