from vk.core_functions import GlobalFunctions


struct PerformanceQuery(Copyable):    var _vk_initialize_performance_api_intel: fn(
        device: Device, pInitializeInfo: Ptr[InitializePerformanceApiInfoINTEL, MutOrigin.external]
    ) -> Result
    var _vk_uninitialize_performance_api_intel: fn(device: Device)
    var _vk_cmd_set_performance_marker_intel: fn(
        commandBuffer: CommandBuffer,
        pMarkerInfo: Ptr[PerformanceMarkerInfoINTEL, MutOrigin.external],
    ) -> Result
    var _vk_cmd_set_performance_stream_marker_intel: fn(
        commandBuffer: CommandBuffer,
        pMarkerInfo: Ptr[PerformanceStreamMarkerInfoINTEL, MutOrigin.external],
    ) -> Result
    var _vk_cmd_set_performance_override_intel: fn(
        commandBuffer: CommandBuffer,
        pOverrideInfo: Ptr[PerformanceOverrideInfoINTEL, MutOrigin.external],
    ) -> Result
    var _vk_acquire_performance_configuration_intel: fn(
        device: Device,
        pAcquireInfo: Ptr[PerformanceConfigurationAcquireInfoINTEL, MutOrigin.external],
        pConfiguration: Ptr[PerformanceConfigurationINTEL, MutOrigin.external],
    ) -> Result
    var _vk_release_performance_configuration_intel: fn(
        device: Device, configuration: PerformanceConfigurationINTEL
    ) -> Result
    var _vk_queue_set_performance_configuration_intel: fn(
        queue: Queue, configuration: PerformanceConfigurationINTEL
    ) -> Result
    var _vk_get_performance_parameter_intel: fn(
        device: Device,
        parameter: PerformanceParameterTypeINTEL,
        pValue: Ptr[PerformanceValueINTEL, MutOrigin.external],
    ) -> Result
