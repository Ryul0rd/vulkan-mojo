from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions
from vk.structs import *


struct PerformanceQuery(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _initialize_performance_api: def(
        device: Device, p_initialize_info: Ptr[InitializePerformanceApiInfoINTEL, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var _uninitialize_performance_api: def(device: Device) thin abi("C")
    var _cmd_set_performance_marker: def(
        command_buffer: CommandBuffer,
        p_marker_info: Ptr[PerformanceMarkerInfoINTEL, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _cmd_set_performance_stream_marker: def(
        command_buffer: CommandBuffer,
        p_marker_info: Ptr[PerformanceStreamMarkerInfoINTEL, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _cmd_set_performance_override: def(
        command_buffer: CommandBuffer,
        p_override_info: Ptr[PerformanceOverrideInfoINTEL, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _acquire_performance_configuration: def(
        device: Device,
        p_acquire_info: Ptr[PerformanceConfigurationAcquireInfoINTEL, ImmutUntrackedOrigin],
        p_configuration: Ptr[PerformanceConfigurationINTEL, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _release_performance_configuration: def(
        device: Device, configuration: PerformanceConfigurationINTEL
    ) thin abi("C") -> Result
    var _queue_set_performance_configuration: def(
        queue: Queue, configuration: PerformanceConfigurationINTEL
    ) thin abi("C") -> Result
    var _get_performance_parameter: def(
        device: Device,
        parameter: PerformanceParameterTypeINTEL,
        p_value: Ptr[PerformanceValueINTEL, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._initialize_performance_api = Ptr(to=get_device_proc_addr(
            device, "vkInitializePerformanceApiINTEL".as_c_string_slice()
        )).bitcast[type_of(self._initialize_performance_api)]()[]
        self._uninitialize_performance_api = Ptr(to=get_device_proc_addr(
            device, "vkUninitializePerformanceApiINTEL".as_c_string_slice()
        )).bitcast[type_of(self._uninitialize_performance_api)]()[]
        self._cmd_set_performance_marker = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPerformanceMarkerINTEL".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_performance_marker)]()[]
        self._cmd_set_performance_stream_marker = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPerformanceStreamMarkerINTEL".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_performance_stream_marker)]()[]
        self._cmd_set_performance_override = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPerformanceOverrideINTEL".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_performance_override)]()[]
        self._acquire_performance_configuration = Ptr(to=get_device_proc_addr(
            device, "vkAcquirePerformanceConfigurationINTEL".as_c_string_slice()
        )).bitcast[type_of(self._acquire_performance_configuration)]()[]
        self._release_performance_configuration = Ptr(to=get_device_proc_addr(
            device, "vkReleasePerformanceConfigurationINTEL".as_c_string_slice()
        )).bitcast[type_of(self._release_performance_configuration)]()[]
        self._queue_set_performance_configuration = Ptr(to=get_device_proc_addr(
            device, "vkQueueSetPerformanceConfigurationINTEL".as_c_string_slice()
        )).bitcast[type_of(self._queue_set_performance_configuration)]()[]
        self._get_performance_parameter = Ptr(to=get_device_proc_addr(
            device, "vkGetPerformanceParameterINTEL".as_c_string_slice()
        )).bitcast[type_of(self._get_performance_parameter)]()[]

    def initialize_performance_api(
        self, device: Device, initialize_info: InitializePerformanceApiInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInitializePerformanceApiINTEL.html
        """
        return self._initialize_performance_api(
            device,
            Ptr(to=initialize_info).bitcast[InitializePerformanceApiInfoINTEL]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def uninitialize_performance_api(self, device: Device):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUninitializePerformanceApiINTEL.html
        """
        return self._uninitialize_performance_api(device)

    def cmd_set_performance_marker(
        self, command_buffer: CommandBuffer, marker_info: PerformanceMarkerInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPerformanceMarkerINTEL.html
        """
        return self._cmd_set_performance_marker(
            command_buffer,
            Ptr(to=marker_info).bitcast[PerformanceMarkerInfoINTEL]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_set_performance_stream_marker(
        self, command_buffer: CommandBuffer, marker_info: PerformanceStreamMarkerInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPerformanceStreamMarkerINTEL.html
        """
        return self._cmd_set_performance_stream_marker(
            command_buffer,
            Ptr(to=marker_info).bitcast[PerformanceStreamMarkerInfoINTEL]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_set_performance_override(
        self, command_buffer: CommandBuffer, override_info: PerformanceOverrideInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPerformanceOverrideINTEL.html
        """
        return self._cmd_set_performance_override(
            command_buffer,
            Ptr(to=override_info).bitcast[PerformanceOverrideInfoINTEL]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def acquire_performance_configuration(
        self,
        device: Device,
        acquire_info: PerformanceConfigurationAcquireInfoINTEL,
        mut configuration: PerformanceConfigurationINTEL,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquirePerformanceConfigurationINTEL.html
        """
        return self._acquire_performance_configuration(
            device,
            Ptr(to=acquire_info).bitcast[PerformanceConfigurationAcquireInfoINTEL]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=configuration).bitcast[PerformanceConfigurationINTEL]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def release_performance_configuration(
        self, device: Device, configuration: PerformanceConfigurationINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleasePerformanceConfigurationINTEL.html
        """
        return self._release_performance_configuration(device, configuration)

    def queue_set_performance_configuration(
        self, queue: Queue, configuration: PerformanceConfigurationINTEL
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSetPerformanceConfigurationINTEL.html
        """
        return self._queue_set_performance_configuration(queue, configuration)

    def get_performance_parameter(
        self,
        device: Device,
        parameter: PerformanceParameterTypeINTEL,
        mut value: PerformanceValueINTEL,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPerformanceParameterINTEL.html
        """
        return self._get_performance_parameter(
            device,
            parameter,
            Ptr(to=value).bitcast[PerformanceValueINTEL]().unsafe_origin_cast[MutUntrackedOrigin](),
        )
