from .structs import *


comptime PFN_vkInternalAllocationNotification = def(
    p_user_data: Ptr[NoneType, MutUntrackedOrigin],
    size: UInt,
    allocation_type: InternalAllocationType,
    allocation_scope: SystemAllocationScope,
) thin abi("C")


comptime PFN_vkInternalFreeNotification = def(
    p_user_data: Ptr[NoneType, MutUntrackedOrigin],
    size: UInt,
    allocation_type: InternalAllocationType,
    allocation_scope: SystemAllocationScope,
) thin abi("C")


comptime PFN_vkReallocationFunction = def(
    p_user_data: Ptr[NoneType, MutUntrackedOrigin],
    p_original: Ptr[NoneType, MutUntrackedOrigin],
    size: UInt,
    alignment: UInt,
    allocation_scope: SystemAllocationScope,
) thin abi("C") -> Ptr[NoneType, MutUntrackedOrigin]


comptime PFN_vkAllocationFunction = def(
    p_user_data: Ptr[NoneType, MutUntrackedOrigin],
    size: UInt,
    alignment: UInt,
    allocation_scope: SystemAllocationScope,
) thin abi("C") -> Ptr[NoneType, MutUntrackedOrigin]


comptime PFN_vkFreeFunction = def(
    p_user_data: Ptr[NoneType, MutUntrackedOrigin], p_memory: Ptr[NoneType, MutUntrackedOrigin]
) thin abi("C")


comptime PFN_vkVoidFunction = def() thin abi("C")


comptime PFN_vkDebugReportCallbackEXT = def(
    flags: DebugReportFlagsEXT,
    object_type: DebugReportObjectTypeEXT,
    object: UInt64,
    location: UInt,
    message_code: Int32,
    p_layer_prefix: CStringSlice[ImmutUntrackedOrigin],
    p_message: CStringSlice[ImmutUntrackedOrigin],
    p_user_data: Ptr[NoneType, MutUntrackedOrigin],
) thin abi("C") -> Bool32


comptime PFN_vkDebugUtilsMessengerCallbackEXT = def(
    message_severity: DebugUtilsMessageSeverityFlagBitsEXT,
    message_types: DebugUtilsMessageTypeFlagsEXT,
    p_callback_data: Ptr[DebugUtilsMessengerCallbackDataEXT, ImmutUntrackedOrigin],
    p_user_data: Ptr[NoneType, MutUntrackedOrigin],
) thin abi("C") -> Bool32


comptime PFN_vkFaultCallbackFunction = def(
    unrecorded_faults: Bool32, fault_count: UInt32, p_faults: Ptr[FaultData, ImmutUntrackedOrigin]
) thin abi("C")


comptime PFN_vkDeviceMemoryReportCallbackEXT = def(
    p_callback_data: Ptr[DeviceMemoryReportCallbackDataEXT, ImmutUntrackedOrigin],
    p_user_data: Ptr[NoneType, MutUntrackedOrigin],
) thin abi("C")


comptime PFN_vkGetInstanceProcAddrLUNARG = def(
    instance: Instance, p_name: CStringSlice[ImmutUntrackedOrigin]
) thin abi("C") -> PFN_vkVoidFunction
