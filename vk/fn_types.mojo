

comptime PFN_vkInternalAllocationNotification = fn(
    p_user_data: Ptr[NoneType, MutAnyOrigin],
    size: UInt,
    allocation_type: InternalAllocationType,
    allocation_scope: SystemAllocationScope,
)


comptime PFN_vkInternalFreeNotification = fn(
    p_user_data: Ptr[NoneType, MutAnyOrigin],
    size: UInt,
    allocation_type: InternalAllocationType,
    allocation_scope: SystemAllocationScope,
)


comptime PFN_vkReallocationFunction = fn(
    p_user_data: Ptr[NoneType, MutAnyOrigin],
    p_original: Ptr[NoneType, MutAnyOrigin],
    size: UInt,
    alignment: UInt,
    allocation_scope: SystemAllocationScope,
) -> Ptr[NoneType, MutAnyOrigin]


comptime PFN_vkAllocationFunction = fn(
    p_user_data: Ptr[NoneType, MutAnyOrigin],
    size: UInt,
    alignment: UInt,
    allocation_scope: SystemAllocationScope,
) -> Ptr[NoneType, MutAnyOrigin]


comptime PFN_vkFreeFunction = fn(
    p_user_data: Ptr[NoneType, MutAnyOrigin], p_memory: Ptr[NoneType, MutAnyOrigin]
)


comptime PFN_vkVoidFunction = fn()


comptime PFN_vkDebugReportCallbackEXT = fn(
    flags: DebugReportFlagsEXT,
    object_type: DebugReportObjectTypeEXT,
    object: UInt64,
    location: UInt,
    message_code: Int32,
    p_layer_prefix: CStringSlice[ImmutAnyOrigin],
    p_message: CStringSlice[ImmutAnyOrigin],
    p_user_data: Ptr[NoneType, MutAnyOrigin],
) -> Bool32


comptime PFN_vkDebugUtilsMessengerCallbackEXT = fn(
    message_severity: DebugUtilsMessageSeverityFlagBitsEXT,
    message_types: DebugUtilsMessageTypeFlagsEXT,
    p_callback_data: Ptr[DebugUtilsMessengerCallbackDataEXT, ImmutAnyOrigin],
    p_user_data: Ptr[NoneType, MutAnyOrigin],
) -> Bool32


comptime PFN_vkFaultCallbackFunction = fn(
    unrecorded_faults: Bool32, fault_count: UInt32, p_faults: Ptr[FaultData, ImmutAnyOrigin]
)


comptime PFN_vkDeviceMemoryReportCallbackEXT = fn(
    p_callback_data: Ptr[DeviceMemoryReportCallbackDataEXT, ImmutAnyOrigin],
    p_user_data: Ptr[NoneType, MutAnyOrigin],
)


comptime PFN_vkGetInstanceProcAddrLUNARG = fn(
    instance: Instance, p_name: CStringSlice[ImmutAnyOrigin]
) -> PFN_vkVoidFunction
