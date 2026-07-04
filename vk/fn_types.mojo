

comptime PFN_vkInternalAllocationNotification = def(
    p_user_data: Ptr[NoneType, MutAnyOrigin],
    size: UInt,
    allocation_type: InternalAllocationType,
    allocation_scope: SystemAllocationScope,
) thin abi("C")


comptime PFN_vkInternalFreeNotification = def(
    p_user_data: Ptr[NoneType, MutAnyOrigin],
    size: UInt,
    allocation_type: InternalAllocationType,
    allocation_scope: SystemAllocationScope,
) thin abi("C")


comptime PFN_vkReallocationFunction = def(
    p_user_data: Ptr[NoneType, MutAnyOrigin],
    p_original: Ptr[NoneType, MutAnyOrigin],
    size: UInt,
    alignment: UInt,
    allocation_scope: SystemAllocationScope,
) thin abi("C") -> Ptr[NoneType, MutAnyOrigin]


comptime PFN_vkAllocationFunction = def(
    p_user_data: Ptr[NoneType, MutAnyOrigin],
    size: UInt,
    alignment: UInt,
    allocation_scope: SystemAllocationScope,
) thin abi("C") -> Ptr[NoneType, MutAnyOrigin]


comptime PFN_vkFreeFunction = def(
    p_user_data: Ptr[NoneType, MutAnyOrigin], p_memory: Ptr[NoneType, MutAnyOrigin]
) thin abi("C")


comptime PFN_vkVoidFunction = def() thin abi("C")


comptime PFN_vkDebugReportCallbackEXT = def(
    flags: DebugReportFlagsEXT,
    object_type: DebugReportObjectTypeEXT,
    object: UInt64,
    location: UInt,
    message_code: Int32,
    p_layer_prefix: CStringSlice[ImmutAnyOrigin],
    p_message: CStringSlice[ImmutAnyOrigin],
    p_user_data: Ptr[NoneType, MutAnyOrigin],
) thin abi("C") -> Bool32


comptime PFN_vkDebugUtilsMessengerCallbackEXT = def(
    message_severity: DebugUtilsMessageSeverityFlagBitsEXT,
    message_types: DebugUtilsMessageTypeFlagsEXT,
    p_callback_data: Ptr[DebugUtilsMessengerCallbackDataEXT, ImmutAnyOrigin],
    p_user_data: Ptr[NoneType, MutAnyOrigin],
) thin abi("C") -> Bool32


comptime PFN_vkFaultCallbackFunction = def(
    unrecorded_faults: Bool32, fault_count: UInt32, p_faults: Ptr[FaultData, ImmutAnyOrigin]
) thin abi("C")


comptime PFN_vkDeviceMemoryReportCallbackEXT = def(
    p_callback_data: Ptr[DeviceMemoryReportCallbackDataEXT, ImmutAnyOrigin],
    p_user_data: Ptr[NoneType, MutAnyOrigin],
) thin abi("C")


comptime PFN_vkGetInstanceProcAddrLUNARG = def(
    instance: Instance, p_name: CStringSlice[ImmutAnyOrigin]
) thin abi("C") -> PFN_vkVoidFunction
