from .handles import *
from .structs import *
from .misc import *

comptime Ptr = UnsafePointer


comptime PFN_vkInternalAllocationNotification = fn(
    Ptr[NoneType, MutOrigin.external], UInt, InternalAllocationType, SystemAllocationScope
)

comptime PFN_vkInternalFreeNotification = fn(
    Ptr[NoneType, MutOrigin.external], UInt, InternalAllocationType, SystemAllocationScope
)

comptime PFN_vkReallocationFunction = fn(
    Ptr[NoneType, MutOrigin.external],
    Ptr[NoneType, MutOrigin.external],
    UInt,
    UInt,
    SystemAllocationScope,
)

comptime PFN_vkAllocationFunction = fn(
    Ptr[NoneType, MutOrigin.external], UInt, UInt, SystemAllocationScope
)

comptime PFN_vkFreeFunction = fn(
    Ptr[NoneType, MutOrigin.external], Ptr[NoneType, MutOrigin.external]
)

comptime PFN_vkVoidFunction = fn()

comptime PFN_vkDebugReportCallbackEXT = fn(
    DebugReportFlagsEXT,
    DebugReportObjectTypeEXT,
    UInt64,
    UInt,
    Int32,
    Ptr[c_char, ImmutOrigin.external],
    Ptr[c_char, ImmutOrigin.external],
    Ptr[NoneType, MutOrigin.external],
) -> Bool32

comptime PFN_vkDebugUtilsMessengerCallbackEXT = fn(
    DebugUtilsMessageSeverityFlagBitsEXT,
    DebugUtilsMessageTypeFlagsEXT,
    Ptr[DebugUtilsMessengerCallbackDataEXT, ImmutOrigin.external],
    Ptr[NoneType, MutOrigin.external],
) -> Bool32

comptime PFN_vkFaultCallbackFunction = fn(Bool32, UInt32, Ptr[FaultData, ImmutOrigin.external])

comptime PFN_vkDeviceMemoryReportCallbackEXT = fn(
    Ptr[DeviceMemoryReportCallbackDataEXT, ImmutOrigin.external], Ptr[NoneType, MutOrigin.external]
)

comptime PFN_vkGetInstanceProcAddrLUNARG = fn(
    Instance, Ptr[c_char, ImmutOrigin.external]
) -> PFN_vkVoidFunction