from .handles import *
from .structs import *
from .misc import *


alias Ptr = UnsafePointer


alias PFN_vkInternalAllocationNotification = fn(
    Ptr[NoneType],
    UInt,
    InternalAllocationType,
    SystemAllocationScope,
)

alias PFN_vkInternalFreeNotification = fn(
    Ptr[NoneType],
    UInt,
    InternalAllocationType,
    SystemAllocationScope,
)

alias PFN_vkReallocationFunction = fn(
    Ptr[NoneType],
    Ptr[NoneType],
    UInt,
    UInt,
    SystemAllocationScope,
)

alias PFN_vkAllocationFunction = fn(Ptr[NoneType], UInt, UInt, SystemAllocationScope)

alias PFN_vkFreeFunction = fn(Ptr[NoneType], Ptr[NoneType])

alias PFN_vkVoidFunction = fn()

alias PFN_vkDebugReportCallbackEXT = fn(
    DebugReportFlagsEXT,
    DebugReportObjectTypeEXT,
    UInt64,
    UInt,
    Int32,
    Ptr[UInt8],
    Ptr[UInt8],
    Ptr[NoneType],
) -> Bool32

alias PFN_vkDebugUtilsMessengerCallbackEXT = fn(
    DebugUtilsMessageSeverityFlagBitsEXT,
    DebugUtilsMessageTypeFlagsEXT,
    Ptr[DebugUtilsMessengerCallbackDataEXT],
    Ptr[NoneType],
) -> Bool32

alias PFN_vkFaultCallbackFunction = fn(Bool32, UInt32, Ptr[FaultData])

alias PFN_vkDeviceMemoryReportCallbackEXT = fn(
    Ptr[DeviceMemoryReportCallbackDataEXT],
    Ptr[NoneType],
)

alias PFN_vkGetInstanceProcAddrLUNARG = fn(Instance, Ptr[UInt8]) -> PFN_vkVoidFunction
