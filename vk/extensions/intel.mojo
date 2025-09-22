from vk.core_functions import GlobalFunctions


struct PerformanceQuery(Copyable, Movable):
    var _initialize_performance_api_intel: fn(
        device: Device, pInitializeInfo: Ptr[InitializePerformanceApiInfoINTEL]
    ) -> Result
    var _uninitialize_performance_api_intel: fn(
        device: Device
    )
    var _cmd_set_performance_marker_intel: fn(
        commandBuffer: CommandBuffer, pMarkerInfo: Ptr[PerformanceMarkerInfoINTEL]
    ) -> Result
    var _cmd_set_performance_stream_marker_intel: fn(
        commandBuffer: CommandBuffer, pMarkerInfo: Ptr[PerformanceStreamMarkerInfoINTEL]
    ) -> Result
    var _cmd_set_performance_override_intel: fn(
        commandBuffer: CommandBuffer, pOverrideInfo: Ptr[PerformanceOverrideInfoINTEL]
    ) -> Result
    var _acquire_performance_configuration_intel: fn(
        device: Device, pAcquireInfo: Ptr[PerformanceConfigurationAcquireInfoINTEL], pConfiguration: Ptr[PerformanceConfigurationINTEL]
    ) -> Result
    var _release_performance_configuration_intel: fn(
        device: Device, configuration: PerformanceConfigurationINTEL
    ) -> Result
    var _queue_set_performance_configuration_intel: fn(
        queue: Queue, configuration: PerformanceConfigurationINTEL
    ) -> Result
    var _get_performance_parameter_intel: fn(
        device: Device, parameter: PerformanceParameterTypeINTEL, pValue: Ptr[PerformanceValueINTEL]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._initialize_performance_api_intel = Ptr(to=get_device_proc_addr(
            device, "vkInitializePerformanceApiINTEL".unsafe_ptr()
        )).bitcast[__type_of(self._initialize_performance_api_intel)]()[]
        self._uninitialize_performance_api_intel = Ptr(to=get_device_proc_addr(
            device, "vkUninitializePerformanceApiINTEL".unsafe_ptr()
        )).bitcast[__type_of(self._uninitialize_performance_api_intel)]()[]
        self._cmd_set_performance_marker_intel = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPerformanceMarkerINTEL".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_performance_marker_intel)]()[]
        self._cmd_set_performance_stream_marker_intel = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPerformanceStreamMarkerINTEL".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_performance_stream_marker_intel)]()[]
        self._cmd_set_performance_override_intel = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPerformanceOverrideINTEL".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_performance_override_intel)]()[]
        self._acquire_performance_configuration_intel = Ptr(to=get_device_proc_addr(
            device, "vkAcquirePerformanceConfigurationINTEL".unsafe_ptr()
        )).bitcast[__type_of(self._acquire_performance_configuration_intel)]()[]
        self._release_performance_configuration_intel = Ptr(to=get_device_proc_addr(
            device, "vkReleasePerformanceConfigurationINTEL".unsafe_ptr()
        )).bitcast[__type_of(self._release_performance_configuration_intel)]()[]
        self._queue_set_performance_configuration_intel = Ptr(to=get_device_proc_addr(
            device, "vkQueueSetPerformanceConfigurationINTEL".unsafe_ptr()
        )).bitcast[__type_of(self._queue_set_performance_configuration_intel)]()[]
        self._get_performance_parameter_intel = Ptr(to=get_device_proc_addr(
            device, "vkGetPerformanceParameterINTEL".unsafe_ptr()
        )).bitcast[__type_of(self._get_performance_parameter_intel)]()[]

    fn initialize_performance_api_intel(
        self, device: Device, initialize_info: InitializePerformanceApiInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._initialize_performance_api_intel(device, Ptr(to=initialize_info))

    fn uninitialize_performance_api_intel(self, device: Device):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._uninitialize_performance_api_intel(device)

    fn cmd_set_performance_marker_intel(
        self, command_buffer: CommandBuffer, marker_info: PerformanceMarkerInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_performance_marker_intel(command_buffer, Ptr(to=marker_info))

    fn cmd_set_performance_stream_marker_intel(
        self, command_buffer: CommandBuffer, marker_info: PerformanceStreamMarkerInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_performance_stream_marker_intel(command_buffer, Ptr(to=marker_info))

    fn cmd_set_performance_override_intel(
        self, command_buffer: CommandBuffer, override_info: PerformanceOverrideInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_performance_override_intel(command_buffer, Ptr(to=override_info))

    fn acquire_performance_configuration_intel(
        self,
        device: Device,
        acquire_info: PerformanceConfigurationAcquireInfoINTEL,
        mut configuration: PerformanceConfigurationINTEL,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._acquire_performance_configuration_intel(
            device, Ptr(to=acquire_info), Ptr(to=configuration)
        )

    fn release_performance_configuration_intel(
        self, device: Device, configuration: PerformanceConfigurationINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._release_performance_configuration_intel(device, configuration)

    fn queue_set_performance_configuration_intel(
        self, queue: Queue, configuration: PerformanceConfigurationINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._queue_set_performance_configuration_intel(queue, configuration)

    fn get_performance_parameter_intel(
        self,
        device: Device,
        parameter: PerformanceParameterTypeINTEL,
        mut value: PerformanceValueINTEL,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_performance_parameter_intel(device, parameter, Ptr(to=value))
