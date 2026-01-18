from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct PerformanceQuery(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _initialize_performance_api_intel: fn(
        device: Device, p_initialize_info: Ptr[InitializePerformanceApiInfoINTEL, ImmutAnyOrigin]
    ) -> Result
    var _uninitialize_performance_api_intel: fn(device: Device)
    var _cmd_set_performance_marker_intel: fn(
        command_buffer: CommandBuffer, p_marker_info: Ptr[PerformanceMarkerInfoINTEL, ImmutAnyOrigin]
    ) -> Result
    var _cmd_set_performance_stream_marker_intel: fn(
        command_buffer: CommandBuffer,
        p_marker_info: Ptr[PerformanceStreamMarkerInfoINTEL, ImmutAnyOrigin],
    ) -> Result
    var _cmd_set_performance_override_intel: fn(
        command_buffer: CommandBuffer,
        p_override_info: Ptr[PerformanceOverrideInfoINTEL, ImmutAnyOrigin],
    ) -> Result
    var _acquire_performance_configuration_intel: fn(
        device: Device,
        p_acquire_info: Ptr[PerformanceConfigurationAcquireInfoINTEL, ImmutAnyOrigin],
        p_configuration: Ptr[PerformanceConfigurationINTEL, MutAnyOrigin],
    ) -> Result
    var _release_performance_configuration_intel: fn(
        device: Device, configuration: PerformanceConfigurationINTEL
    ) -> Result
    var _queue_set_performance_configuration_intel: fn(
        queue: Queue, configuration: PerformanceConfigurationINTEL
    ) -> Result
    var _get_performance_parameter_intel: fn(
        device: Device,
        parameter: PerformanceParameterTypeINTEL,
        p_value: Ptr[PerformanceValueINTEL, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._initialize_performance_api_intel = Ptr(to=get_device_proc_addr(
            device, "vkInitializePerformanceApiINTEL".as_c_string_slice()
        )).bitcast[type_of(self._initialize_performance_api_intel)]()[]
        self._uninitialize_performance_api_intel = Ptr(to=get_device_proc_addr(
            device, "vkUninitializePerformanceApiINTEL".as_c_string_slice()
        )).bitcast[type_of(self._uninitialize_performance_api_intel)]()[]
        self._cmd_set_performance_marker_intel = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPerformanceMarkerINTEL".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_performance_marker_intel)]()[]
        self._cmd_set_performance_stream_marker_intel = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPerformanceStreamMarkerINTEL".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_performance_stream_marker_intel)]()[]
        self._cmd_set_performance_override_intel = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPerformanceOverrideINTEL".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_performance_override_intel)]()[]
        self._acquire_performance_configuration_intel = Ptr(to=get_device_proc_addr(
            device, "vkAcquirePerformanceConfigurationINTEL".as_c_string_slice()
        )).bitcast[type_of(self._acquire_performance_configuration_intel)]()[]
        self._release_performance_configuration_intel = Ptr(to=get_device_proc_addr(
            device, "vkReleasePerformanceConfigurationINTEL".as_c_string_slice()
        )).bitcast[type_of(self._release_performance_configuration_intel)]()[]
        self._queue_set_performance_configuration_intel = Ptr(to=get_device_proc_addr(
            device, "vkQueueSetPerformanceConfigurationINTEL".as_c_string_slice()
        )).bitcast[type_of(self._queue_set_performance_configuration_intel)]()[]
        self._get_performance_parameter_intel = Ptr(to=get_device_proc_addr(
            device, "vkGetPerformanceParameterINTEL".as_c_string_slice()
        )).bitcast[type_of(self._get_performance_parameter_intel)]()[]

    fn initialize_performance_api_intel(
        self, device: Device, initialize_info: InitializePerformanceApiInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInitializePerformanceApiINTEL.html
        """
        return self._initialize_performance_api_intel(device, Ptr(to=initialize_info))

    fn uninitialize_performance_api_intel(self, device: Device):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUninitializePerformanceApiINTEL.html
        """
        return self._uninitialize_performance_api_intel(device)

    fn cmd_set_performance_marker_intel(
        self, command_buffer: CommandBuffer, marker_info: PerformanceMarkerInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPerformanceMarkerINTEL.html
        """
        return self._cmd_set_performance_marker_intel(command_buffer, Ptr(to=marker_info))

    fn cmd_set_performance_stream_marker_intel(
        self, command_buffer: CommandBuffer, marker_info: PerformanceStreamMarkerInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPerformanceStreamMarkerINTEL.html
        """
        return self._cmd_set_performance_stream_marker_intel(command_buffer, Ptr(to=marker_info))

    fn cmd_set_performance_override_intel(
        self, command_buffer: CommandBuffer, override_info: PerformanceOverrideInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPerformanceOverrideINTEL.html
        """
        return self._cmd_set_performance_override_intel(command_buffer, Ptr(to=override_info))

    fn acquire_performance_configuration_intel(
        self,
        device: Device,
        acquire_info: PerformanceConfigurationAcquireInfoINTEL,
        mut configuration: PerformanceConfigurationINTEL,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquirePerformanceConfigurationINTEL.html
        """
        return self._acquire_performance_configuration_intel(
            device, Ptr(to=acquire_info), Ptr(to=configuration)
        )

    fn release_performance_configuration_intel(
        self, device: Device, configuration: PerformanceConfigurationINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleasePerformanceConfigurationINTEL.html
        """
        return self._release_performance_configuration_intel(device, configuration)

    fn queue_set_performance_configuration_intel(
        self, queue: Queue, configuration: PerformanceConfigurationINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSetPerformanceConfigurationINTEL.html
        """
        return self._queue_set_performance_configuration_intel(queue, configuration)

    fn get_performance_parameter_intel(
        self,
        device: Device,
        parameter: PerformanceParameterTypeINTEL,
        mut value: PerformanceValueINTEL,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPerformanceParameterINTEL.html
        """
        return self._get_performance_parameter_intel(device, parameter, Ptr(to=value))
