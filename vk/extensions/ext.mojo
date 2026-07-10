from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions
from vk.structs import *


struct DebugReport(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_debug_report_callback: def(
        instance: Instance,
        p_create_info: Ptr[DebugReportCallbackCreateInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_callback: Ptr[DebugReportCallbackEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_debug_report_callback: def(
        instance: Instance,
        callback: DebugReportCallbackEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _debug_report_message: def(
        instance: Instance,
        flags: DebugReportFlagsEXT,
        object_type: DebugReportObjectTypeEXT,
        object: UInt64,
        location: UInt,
        message_code: Int32,
        p_layer_prefix: CStringSlice[ImmutUntrackedOrigin],
        p_message: CStringSlice[ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_debug_report_callback = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDebugReportCallbackEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_debug_report_callback)]()[]
        self._destroy_debug_report_callback = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroyDebugReportCallbackEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_debug_report_callback)]()[]
        self._debug_report_message = Ptr(to=get_instance_proc_addr(
            instance, "vkDebugReportMessageEXT".as_c_string_slice()
        )).bitcast[type_of(self._debug_report_message)]()[]

    def create_debug_report_callback[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        create_info: DebugReportCallbackCreateInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut callback: DebugReportCallbackEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDebugReportCallbackEXT.html
        """
        return self._create_debug_report_callback(
            instance,
            Ptr(to=create_info).bitcast[DebugReportCallbackCreateInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=callback).bitcast[DebugReportCallbackEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_debug_report_callback[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        callback: DebugReportCallbackEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDebugReportCallbackEXT.html
        """
        return self._destroy_debug_report_callback(
            instance,
            callback,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def debug_report_message[
        p_layer_prefix_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_message_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        instance: Instance,
        flags: DebugReportFlagsEXT,
        object_type: DebugReportObjectTypeEXT,
        object: UInt64,
        location: UInt,
        message_code: Int32,
        p_layer_prefix: CStringSlice[p_layer_prefix_origin],
        p_message: CStringSlice[p_message_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDebugReportMessageEXT.html
        """
        return self._debug_report_message(
            instance,
            flags,
            object_type,
            object,
            location,
            message_code,
            Ptr(to=p_layer_prefix).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=p_message).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
        )


struct DebugMarker(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _debug_marker_set_object_tag: def(
        device: Device, p_tag_info: Ptr[DebugMarkerObjectTagInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var _debug_marker_set_object_name: def(
        device: Device, p_name_info: Ptr[DebugMarkerObjectNameInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var _cmd_debug_marker_begin: def(
        command_buffer: CommandBuffer,
        p_marker_info: Ptr[DebugMarkerMarkerInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_debug_marker_end: def(command_buffer: CommandBuffer) thin abi("C")
    var _cmd_debug_marker_insert: def(
        command_buffer: CommandBuffer,
        p_marker_info: Ptr[DebugMarkerMarkerInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._debug_marker_set_object_tag = Ptr(to=get_device_proc_addr(
            device, "vkDebugMarkerSetObjectTagEXT".as_c_string_slice()
        )).bitcast[type_of(self._debug_marker_set_object_tag)]()[]
        self._debug_marker_set_object_name = Ptr(to=get_device_proc_addr(
            device, "vkDebugMarkerSetObjectNameEXT".as_c_string_slice()
        )).bitcast[type_of(self._debug_marker_set_object_name)]()[]
        self._cmd_debug_marker_begin = Ptr(to=get_device_proc_addr(
            device, "vkCmdDebugMarkerBeginEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_debug_marker_begin)]()[]
        self._cmd_debug_marker_end = Ptr(to=get_device_proc_addr(
            device, "vkCmdDebugMarkerEndEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_debug_marker_end)]()[]
        self._cmd_debug_marker_insert = Ptr(to=get_device_proc_addr(
            device, "vkCmdDebugMarkerInsertEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_debug_marker_insert)]()[]

    def debug_marker_set_object_tag(
        self, device: Device, tag_info: DebugMarkerObjectTagInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDebugMarkerSetObjectTagEXT.html
        """
        return self._debug_marker_set_object_tag(
            device,
            Ptr(to=tag_info).bitcast[DebugMarkerObjectTagInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def debug_marker_set_object_name(
        self, device: Device, name_info: DebugMarkerObjectNameInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDebugMarkerSetObjectNameEXT.html
        """
        return self._debug_marker_set_object_name(
            device,
            Ptr(to=name_info).bitcast[DebugMarkerObjectNameInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_debug_marker_begin(
        self, command_buffer: CommandBuffer, marker_info: DebugMarkerMarkerInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerBeginEXT.html
        """
        return self._cmd_debug_marker_begin(
            command_buffer,
            Ptr(to=marker_info).bitcast[DebugMarkerMarkerInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_debug_marker_end(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerEndEXT.html
        """
        return self._cmd_debug_marker_end(command_buffer)

    def cmd_debug_marker_insert(
        self, command_buffer: CommandBuffer, marker_info: DebugMarkerMarkerInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerInsertEXT.html
        """
        return self._cmd_debug_marker_insert(
            command_buffer,
            Ptr(to=marker_info).bitcast[DebugMarkerMarkerInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct TransformFeedback(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_bind_transform_feedback_buffers: def(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutUntrackedOrigin],
        p_offsets: Ptr[DeviceSize, ImmutUntrackedOrigin],
        p_sizes: Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _cmd_begin_transform_feedback: def(
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, ImmutUntrackedOrigin],
        p_counter_buffer_offsets: Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _cmd_end_transform_feedback: def(
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, ImmutUntrackedOrigin],
        p_counter_buffer_offsets: Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _cmd_begin_query_indexed: def(
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
        index: UInt32,
    ) thin abi("C")
    var _cmd_end_query_indexed: def(
        command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32, index: UInt32
    ) thin abi("C")
    var _cmd_draw_indirect_byte_count: def(
        command_buffer: CommandBuffer,
        instance_count: UInt32,
        first_instance: UInt32,
        counter_buffer: Buffer,
        counter_buffer_offset: DeviceSize,
        counter_offset: UInt32,
        vertex_stride: UInt32,
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_transform_feedback_buffers = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindTransformFeedbackBuffersEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_transform_feedback_buffers)]()[]
        self._cmd_begin_transform_feedback = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginTransformFeedbackEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_transform_feedback)]()[]
        self._cmd_end_transform_feedback = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndTransformFeedbackEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_transform_feedback)]()[]
        self._cmd_begin_query_indexed = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginQueryIndexedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_query_indexed)]()[]
        self._cmd_end_query_indexed = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndQueryIndexedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_query_indexed)]()[]
        self._cmd_draw_indirect_byte_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirectByteCountEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_indirect_byte_count)]()[]

    def cmd_bind_transform_feedback_buffers[
        p_buffers_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_offsets_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_sizes_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
        p_sizes: Optional[Ptr[DeviceSize, p_sizes_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindTransformFeedbackBuffersEXT.html
        """
        return self._cmd_bind_transform_feedback_buffers(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_sizes).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_begin_transform_feedback[
        p_counter_buffers_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_counter_buffer_offsets_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, p_counter_buffers_origin],
        p_counter_buffer_offsets: Optional[Ptr[DeviceSize, p_counter_buffer_offsets_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginTransformFeedbackEXT.html
        """
        return self._cmd_begin_transform_feedback(
            command_buffer,
            first_counter_buffer,
            counter_buffer_count,
            Ptr(to=p_counter_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_counter_buffer_offsets).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_end_transform_feedback[
        p_counter_buffers_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_counter_buffer_offsets_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, p_counter_buffers_origin],
        p_counter_buffer_offsets: Optional[Ptr[DeviceSize, p_counter_buffer_offsets_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndTransformFeedbackEXT.html
        """
        return self._cmd_end_transform_feedback(
            command_buffer,
            first_counter_buffer,
            counter_buffer_count,
            Ptr(to=p_counter_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_counter_buffer_offsets).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_begin_query_indexed(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
        index: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginQueryIndexedEXT.html
        """
        return self._cmd_begin_query_indexed(command_buffer, query_pool, query, flags, index)

    def cmd_end_query_indexed(
        self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32, index: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQueryIndexedEXT.html
        """
        return self._cmd_end_query_indexed(command_buffer, query_pool, query, index)

    def cmd_draw_indirect_byte_count(
        self,
        command_buffer: CommandBuffer,
        instance_count: UInt32,
        first_instance: UInt32,
        counter_buffer: Buffer,
        counter_buffer_offset: DeviceSize,
        counter_offset: UInt32,
        vertex_stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirectByteCountEXT.html
        """
        return self._cmd_draw_indirect_byte_count(
            command_buffer,
            instance_count,
            first_instance,
            counter_buffer,
            counter_buffer_offset,
            counter_offset,
            vertex_stride,
        )


struct ConditionalRendering(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_begin_conditional_rendering: def(
        command_buffer: CommandBuffer,
        p_conditional_rendering_begin: Ptr[ConditionalRenderingBeginInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_end_conditional_rendering: def(command_buffer: CommandBuffer) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_begin_conditional_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginConditionalRenderingEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_conditional_rendering)]()[]
        self._cmd_end_conditional_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndConditionalRenderingEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_conditional_rendering)]()[]

    def cmd_begin_conditional_rendering(
        self,
        command_buffer: CommandBuffer,
        conditional_rendering_begin: ConditionalRenderingBeginInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginConditionalRenderingEXT.html
        """
        return self._cmd_begin_conditional_rendering(
            command_buffer,
            Ptr(to=conditional_rendering_begin).bitcast[ConditionalRenderingBeginInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_end_conditional_rendering(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndConditionalRenderingEXT.html
        """
        return self._cmd_end_conditional_rendering(command_buffer)


struct DirectModeDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _release_display: def(
        physical_device: PhysicalDevice, display: DisplayKHR
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._release_display = Ptr(to=get_instance_proc_addr(
            instance, "vkReleaseDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._release_display)]()[]

    def release_display(self, physical_device: PhysicalDevice, display: DisplayKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseDisplayEXT.html
        """
        return self._release_display(physical_device, display)


struct AcquireXlibDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _acquire_xlib_display: def(
        physical_device: PhysicalDevice, dpy: Ptr[Display, MutUntrackedOrigin], display: DisplayKHR
    ) thin abi("C") -> Result
    var _get_rand_r_output_display: def(
        physical_device: PhysicalDevice,
        dpy: Ptr[Display, MutUntrackedOrigin],
        rr_output: RROutput,
        p_display: Ptr[DisplayKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._acquire_xlib_display = Ptr(to=get_instance_proc_addr(
            instance, "vkAcquireXlibDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._acquire_xlib_display)]()[]
        self._get_rand_r_output_display = Ptr(to=get_instance_proc_addr(
            instance, "vkGetRandROutputDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_rand_r_output_display)]()[]

    def acquire_xlib_display(
        self, physical_device: PhysicalDevice, mut dpy: Display, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireXlibDisplayEXT.html
        """
        return self._acquire_xlib_display(
            physical_device,
            Ptr(to=dpy).bitcast[Display]().unsafe_origin_cast[MutUntrackedOrigin](),
            display,
        )

    def get_rand_r_output_display(
        self,
        physical_device: PhysicalDevice,
        mut dpy: Display,
        rr_output: RROutput,
        mut display: DisplayKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRandROutputDisplayEXT.html
        """
        return self._get_rand_r_output_display(
            physical_device,
            Ptr(to=dpy).bitcast[Display]().unsafe_origin_cast[MutUntrackedOrigin](),
            rr_output,
            Ptr(to=display).bitcast[DisplayKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct DisplaySurfaceCounter(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_surface_capabilities_2: def(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_surface_capabilities: Ptr[SurfaceCapabilities2EXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_surface_capabilities_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceCapabilities2EXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_capabilities_2)]()[]

    def get_physical_device_surface_capabilities_2(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_capabilities: SurfaceCapabilities2EXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceCapabilities2EXT.html
        """
        return self._get_physical_device_surface_capabilities_2(
            physical_device,
            surface,
            Ptr(to=surface_capabilities).bitcast[SurfaceCapabilities2EXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct DisplayControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _display_power_control: def(
        device: Device,
        display: DisplayKHR,
        p_display_power_info: Ptr[DisplayPowerInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _register_device_event: def(
        device: Device,
        p_device_event_info: Ptr[DeviceEventInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_fence: Ptr[Fence, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _register_display_event: def(
        device: Device,
        display: DisplayKHR,
        p_display_event_info: Ptr[DisplayEventInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_fence: Ptr[Fence, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_swapchain_counter: def(
        device: Device,
        swapchain: SwapchainKHR,
        counter: SurfaceCounterFlagBitsEXT,
        p_counter_value: Ptr[UInt64, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._display_power_control = Ptr(to=get_device_proc_addr(
            device, "vkDisplayPowerControlEXT".as_c_string_slice()
        )).bitcast[type_of(self._display_power_control)]()[]
        self._register_device_event = Ptr(to=get_device_proc_addr(
            device, "vkRegisterDeviceEventEXT".as_c_string_slice()
        )).bitcast[type_of(self._register_device_event)]()[]
        self._register_display_event = Ptr(to=get_device_proc_addr(
            device, "vkRegisterDisplayEventEXT".as_c_string_slice()
        )).bitcast[type_of(self._register_display_event)]()[]
        self._get_swapchain_counter = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainCounterEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_swapchain_counter)]()[]

    def display_power_control(
        self, device: Device, display: DisplayKHR, display_power_info: DisplayPowerInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDisplayPowerControlEXT.html
        """
        return self._display_power_control(
            device,
            display,
            Ptr(to=display_power_info).bitcast[DisplayPowerInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def register_device_event[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        device_event_info: DeviceEventInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkRegisterDeviceEventEXT.html
        """
        return self._register_device_event(
            device,
            Ptr(to=device_event_info).bitcast[DeviceEventInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=fence).bitcast[Fence]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def register_display_event[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        display: DisplayKHR,
        display_event_info: DisplayEventInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkRegisterDisplayEventEXT.html
        """
        return self._register_display_event(
            device,
            display,
            Ptr(to=display_event_info).bitcast[DisplayEventInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=fence).bitcast[Fence]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_swapchain_counter(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        counter: SurfaceCounterFlagBitsEXT,
        mut counter_value: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainCounterEXT.html
        """
        return self._get_swapchain_counter(
            device,
            swapchain,
            counter,
            Ptr(to=counter_value).bitcast[UInt64]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct DiscardRectangles(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_discard_rectangle: def(
        command_buffer: CommandBuffer,
        first_discard_rectangle: UInt32,
        discard_rectangle_count: UInt32,
        p_discard_rectangles: Ptr[Rect2D, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_discard_rectangle_enable: def(
        command_buffer: CommandBuffer, discard_rectangle_enable: Bool32
    ) thin abi("C")
    var _cmd_set_discard_rectangle_mode: def(
        command_buffer: CommandBuffer, discard_rectangle_mode: DiscardRectangleModeEXT
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_discard_rectangle = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDiscardRectangleEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_discard_rectangle)]()[]
        self._cmd_set_discard_rectangle_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDiscardRectangleEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_discard_rectangle_enable)]()[]
        self._cmd_set_discard_rectangle_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDiscardRectangleModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_discard_rectangle_mode)]()[]

    def cmd_set_discard_rectangle[p_discard_rectangles_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        first_discard_rectangle: UInt32,
        discard_rectangle_count: UInt32,
        p_discard_rectangles: Ptr[Rect2D, p_discard_rectangles_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleEXT.html
        """
        return self._cmd_set_discard_rectangle(
            command_buffer,
            first_discard_rectangle,
            discard_rectangle_count,
            Ptr(to=p_discard_rectangles).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_discard_rectangle_enable(
        self, command_buffer: CommandBuffer, discard_rectangle_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleEnableEXT.html
        """
        return self._cmd_set_discard_rectangle_enable(command_buffer, discard_rectangle_enable)

    def cmd_set_discard_rectangle_mode(
        self, command_buffer: CommandBuffer, discard_rectangle_mode: DiscardRectangleModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleModeEXT.html
        """
        return self._cmd_set_discard_rectangle_mode(command_buffer, discard_rectangle_mode)


struct HdrMetadata(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_hdr_metadata: def(
        device: Device,
        swapchain_count: UInt32,
        p_swapchains: Ptr[SwapchainKHR, ImmutUntrackedOrigin],
        p_metadata: Ptr[HdrMetadataEXT, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_hdr_metadata = Ptr(to=get_device_proc_addr(
            device, "vkSetHdrMetadataEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_hdr_metadata)]()[]

    def set_hdr_metadata[
        p_swapchains_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_metadata_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        device: Device,
        swapchain_count: UInt32,
        p_swapchains: Ptr[SwapchainKHR, p_swapchains_origin],
        p_metadata: Ptr[HdrMetadataEXT, p_metadata_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetHdrMetadataEXT.html
        """
        return self._set_hdr_metadata(
            device,
            swapchain_count,
            Ptr(to=p_swapchains).bitcast[Ptr[SwapchainKHR, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_metadata).bitcast[Ptr[HdrMetadataEXT, ImmutUntrackedOrigin]]()[],
        )


struct DebugUtils(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_debug_utils_object_name: def(
        device: Device, p_name_info: Ptr[DebugUtilsObjectNameInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var _set_debug_utils_object_tag: def(
        device: Device, p_tag_info: Ptr[DebugUtilsObjectTagInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var _queue_begin_debug_utils_label: def(
        queue: Queue, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _queue_end_debug_utils_label: def(queue: Queue) thin abi("C")
    var _queue_insert_debug_utils_label: def(
        queue: Queue, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _cmd_begin_debug_utils_label: def(
        command_buffer: CommandBuffer, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _cmd_end_debug_utils_label: def(command_buffer: CommandBuffer) thin abi("C")
    var _cmd_insert_debug_utils_label: def(
        command_buffer: CommandBuffer, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _create_debug_utils_messenger: def(
        instance: Instance,
        p_create_info: Ptr[DebugUtilsMessengerCreateInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_messenger: Ptr[DebugUtilsMessengerEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_debug_utils_messenger: def(
        instance: Instance,
        messenger: DebugUtilsMessengerEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _submit_debug_utils_message: def(
        instance: Instance,
        message_severity: DebugUtilsMessageSeverityFlagBitsEXT,
        message_types: DebugUtilsMessageTypeFlagsEXT,
        p_callback_data: Ptr[DebugUtilsMessengerCallbackDataEXT, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._set_debug_utils_object_name = Ptr(to=get_instance_proc_addr(
            instance, "vkSetDebugUtilsObjectNameEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_debug_utils_object_name)]()[]
        self._set_debug_utils_object_tag = Ptr(to=get_instance_proc_addr(
            instance, "vkSetDebugUtilsObjectTagEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_debug_utils_object_tag)]()[]
        self._queue_begin_debug_utils_label = Ptr(to=get_instance_proc_addr(
            instance, "vkQueueBeginDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._queue_begin_debug_utils_label)]()[]
        self._queue_end_debug_utils_label = Ptr(to=get_instance_proc_addr(
            instance, "vkQueueEndDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._queue_end_debug_utils_label)]()[]
        self._queue_insert_debug_utils_label = Ptr(to=get_instance_proc_addr(
            instance, "vkQueueInsertDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._queue_insert_debug_utils_label)]()[]
        self._cmd_begin_debug_utils_label = Ptr(to=get_instance_proc_addr(
            instance, "vkCmdBeginDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_debug_utils_label)]()[]
        self._cmd_end_debug_utils_label = Ptr(to=get_instance_proc_addr(
            instance, "vkCmdEndDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_debug_utils_label)]()[]
        self._cmd_insert_debug_utils_label = Ptr(to=get_instance_proc_addr(
            instance, "vkCmdInsertDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_insert_debug_utils_label)]()[]
        self._create_debug_utils_messenger = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDebugUtilsMessengerEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_debug_utils_messenger)]()[]
        self._destroy_debug_utils_messenger = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroyDebugUtilsMessengerEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_debug_utils_messenger)]()[]
        self._submit_debug_utils_message = Ptr(to=get_instance_proc_addr(
            instance, "vkSubmitDebugUtilsMessageEXT".as_c_string_slice()
        )).bitcast[type_of(self._submit_debug_utils_message)]()[]

    def set_debug_utils_object_name(
        self, device: Device, name_info: DebugUtilsObjectNameInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDebugUtilsObjectNameEXT.html
        """
        return self._set_debug_utils_object_name(
            device,
            Ptr(to=name_info).bitcast[DebugUtilsObjectNameInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def set_debug_utils_object_tag(
        self, device: Device, tag_info: DebugUtilsObjectTagInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDebugUtilsObjectTagEXT.html
        """
        return self._set_debug_utils_object_tag(
            device,
            Ptr(to=tag_info).bitcast[DebugUtilsObjectTagInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def queue_begin_debug_utils_label(self, queue: Queue, label_info: DebugUtilsLabelEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBeginDebugUtilsLabelEXT.html
        """
        return self._queue_begin_debug_utils_label(
            queue,
            Ptr(to=label_info).bitcast[DebugUtilsLabelEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def queue_end_debug_utils_label(self, queue: Queue):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueEndDebugUtilsLabelEXT.html
        """
        return self._queue_end_debug_utils_label(queue)

    def queue_insert_debug_utils_label(self, queue: Queue, label_info: DebugUtilsLabelEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueInsertDebugUtilsLabelEXT.html
        """
        return self._queue_insert_debug_utils_label(
            queue,
            Ptr(to=label_info).bitcast[DebugUtilsLabelEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_begin_debug_utils_label(
        self, command_buffer: CommandBuffer, label_info: DebugUtilsLabelEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginDebugUtilsLabelEXT.html
        """
        return self._cmd_begin_debug_utils_label(
            command_buffer,
            Ptr(to=label_info).bitcast[DebugUtilsLabelEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_end_debug_utils_label(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndDebugUtilsLabelEXT.html
        """
        return self._cmd_end_debug_utils_label(command_buffer)

    def cmd_insert_debug_utils_label(
        self, command_buffer: CommandBuffer, label_info: DebugUtilsLabelEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdInsertDebugUtilsLabelEXT.html
        """
        return self._cmd_insert_debug_utils_label(
            command_buffer,
            Ptr(to=label_info).bitcast[DebugUtilsLabelEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def create_debug_utils_messenger[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        create_info: DebugUtilsMessengerCreateInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut messenger: DebugUtilsMessengerEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDebugUtilsMessengerEXT.html
        """
        return self._create_debug_utils_messenger(
            instance,
            Ptr(to=create_info).bitcast[DebugUtilsMessengerCreateInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=messenger).bitcast[DebugUtilsMessengerEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_debug_utils_messenger[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        messenger: DebugUtilsMessengerEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDebugUtilsMessengerEXT.html
        """
        return self._destroy_debug_utils_messenger(
            instance,
            messenger,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def submit_debug_utils_message(
        self,
        instance: Instance,
        message_severity: DebugUtilsMessageSeverityFlagBitsEXT,
        message_types: DebugUtilsMessageTypeFlagsEXT,
        callback_data: DebugUtilsMessengerCallbackDataEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSubmitDebugUtilsMessageEXT.html
        """
        return self._submit_debug_utils_message(
            instance,
            message_severity,
            message_types,
            Ptr(to=callback_data).bitcast[DebugUtilsMessengerCallbackDataEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct DescriptorHeap(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _write_sampler_descriptors: def(
        device: Device,
        sampler_count: UInt32,
        p_samplers: Ptr[SamplerCreateInfo, ImmutUntrackedOrigin],
        p_descriptors: Ptr[HostAddressRangeEXT, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _write_resource_descriptors: def(
        device: Device,
        resource_count: UInt32,
        p_resources: Ptr[ResourceDescriptorInfoEXT, ImmutUntrackedOrigin],
        p_descriptors: Ptr[HostAddressRangeEXT, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _cmd_bind_sampler_heap: def(
        command_buffer: CommandBuffer, p_bind_info: Ptr[BindHeapInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _cmd_bind_resource_heap: def(
        command_buffer: CommandBuffer, p_bind_info: Ptr[BindHeapInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _cmd_push_data: def(
        command_buffer: CommandBuffer, p_push_data_info: Ptr[PushDataInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _get_image_opaque_capture_data: def(
        device: Device,
        image_count: UInt32,
        p_images: Ptr[Image, ImmutUntrackedOrigin],
        p_datas: Ptr[HostAddressRangeEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_physical_device_descriptor_size: def(
        physical_device: PhysicalDevice, descriptor_type: DescriptorType
    ) thin abi("C") -> DeviceSize
    var _register_custom_border_color: def(
        device: Device,
        p_border_color: Ptr[SamplerCustomBorderColorCreateInfoEXT, ImmutUntrackedOrigin],
        request_index: Bool32,
        p_index: Ptr[UInt32, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _unregister_custom_border_color: def(device: Device, index: UInt32) thin abi("C")
    var _get_tensor_opaque_capture_data: def(
        device: Device,
        tensor_count: UInt32,
        p_tensors: Ptr[TensorARM, ImmutUntrackedOrigin],
        p_datas: Ptr[HostAddressRangeEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._write_sampler_descriptors = Ptr(to=get_device_proc_addr(
            device, "vkWriteSamplerDescriptorsEXT".as_c_string_slice()
        )).bitcast[type_of(self._write_sampler_descriptors)]()[]
        self._write_resource_descriptors = Ptr(to=get_device_proc_addr(
            device, "vkWriteResourceDescriptorsEXT".as_c_string_slice()
        )).bitcast[type_of(self._write_resource_descriptors)]()[]
        self._cmd_bind_sampler_heap = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindSamplerHeapEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_sampler_heap)]()[]
        self._cmd_bind_resource_heap = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindResourceHeapEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_resource_heap)]()[]
        self._cmd_push_data = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_push_data)]()[]
        self._get_image_opaque_capture_data = Ptr(to=get_device_proc_addr(
            device, "vkGetImageOpaqueCaptureDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_image_opaque_capture_data)]()[]
        self._get_physical_device_descriptor_size = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceDescriptorSizeEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_descriptor_size)]()[]
        self._register_custom_border_color = Ptr(to=get_device_proc_addr(
            device, "vkRegisterCustomBorderColorEXT".as_c_string_slice()
        )).bitcast[type_of(self._register_custom_border_color)]()[]
        self._unregister_custom_border_color = Ptr(to=get_device_proc_addr(
            device, "vkUnregisterCustomBorderColorEXT".as_c_string_slice()
        )).bitcast[type_of(self._unregister_custom_border_color)]()[]
        self._get_tensor_opaque_capture_data = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorOpaqueCaptureDataARM".as_c_string_slice()
        )).bitcast[type_of(self._get_tensor_opaque_capture_data)]()[]

    def write_sampler_descriptors[
        p_samplers_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_descriptors_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        device: Device,
        sampler_count: UInt32,
        p_samplers: Ptr[SamplerCreateInfo, p_samplers_origin],
        p_descriptors: Ptr[HostAddressRangeEXT, p_descriptors_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWriteSamplerDescriptorsEXT.html
        """
        return self._write_sampler_descriptors(
            device,
            sampler_count,
            Ptr(to=p_samplers).bitcast[Ptr[SamplerCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_descriptors).bitcast[Ptr[HostAddressRangeEXT, ImmutUntrackedOrigin]]()[],
        )

    def write_resource_descriptors[
        p_resources_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_descriptors_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        device: Device,
        resource_count: UInt32,
        p_resources: Ptr[ResourceDescriptorInfoEXT, p_resources_origin],
        p_descriptors: Ptr[HostAddressRangeEXT, p_descriptors_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWriteResourceDescriptorsEXT.html
        """
        return self._write_resource_descriptors(
            device,
            resource_count,
            Ptr(to=p_resources).bitcast[Ptr[ResourceDescriptorInfoEXT, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_descriptors).bitcast[Ptr[HostAddressRangeEXT, ImmutUntrackedOrigin]]()[],
        )

    def cmd_bind_sampler_heap(self, command_buffer: CommandBuffer, bind_info: BindHeapInfoEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindSamplerHeapEXT.html
        """
        return self._cmd_bind_sampler_heap(
            command_buffer,
            Ptr(to=bind_info).bitcast[BindHeapInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_bind_resource_heap(self, command_buffer: CommandBuffer, bind_info: BindHeapInfoEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindResourceHeapEXT.html
        """
        return self._cmd_bind_resource_heap(
            command_buffer,
            Ptr(to=bind_info).bitcast[BindHeapInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_push_data(self, command_buffer: CommandBuffer, push_data_info: PushDataInfoEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDataEXT.html
        """
        return self._cmd_push_data(
            command_buffer,
            Ptr(to=push_data_info).bitcast[PushDataInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_image_opaque_capture_data[
        p_images_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_datas_origin: MutOrigin = MutUntrackedOrigin,
    ](
        self,
        device: Device,
        image_count: UInt32,
        p_images: Ptr[Image, p_images_origin],
        p_datas: Ptr[HostAddressRangeEXT, p_datas_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageOpaqueCaptureDataEXT.html
        """
        return self._get_image_opaque_capture_data(
            device,
            image_count,
            Ptr(to=p_images).bitcast[Ptr[Image, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_datas).bitcast[Ptr[HostAddressRangeEXT, MutUntrackedOrigin]]()[],
        )

    def get_physical_device_descriptor_size(
        self, physical_device: PhysicalDevice, descriptor_type: DescriptorType
    ) -> DeviceSize:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDescriptorSizeEXT.html
        """
        return self._get_physical_device_descriptor_size(physical_device, descriptor_type)

    def register_custom_border_color(
        self,
        device: Device,
        border_color: SamplerCustomBorderColorCreateInfoEXT,
        request_index: Bool32,
        mut index: UInt32,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkRegisterCustomBorderColorEXT.html
        """
        return self._register_custom_border_color(
            device,
            Ptr(to=border_color).bitcast[SamplerCustomBorderColorCreateInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            request_index,
            Ptr(to=index).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def unregister_custom_border_color(self, device: Device, index: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnregisterCustomBorderColorEXT.html
        """
        return self._unregister_custom_border_color(device, index)

    def get_tensor_opaque_capture_data[
        p_tensors_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_datas_origin: MutOrigin = MutUntrackedOrigin,
    ](
        self,
        device: Device,
        tensor_count: UInt32,
        p_tensors: Ptr[TensorARM, p_tensors_origin],
        p_datas: Ptr[HostAddressRangeEXT, p_datas_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorOpaqueCaptureDataARM.html
        """
        return self._get_tensor_opaque_capture_data(
            device,
            tensor_count,
            Ptr(to=p_tensors).bitcast[Ptr[TensorARM, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_datas).bitcast[Ptr[HostAddressRangeEXT, MutUntrackedOrigin]]()[],
        )


struct SampleLocations(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_sample_locations: def(
        command_buffer: CommandBuffer,
        p_sample_locations_info: Ptr[SampleLocationsInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _get_physical_device_multisample_properties: def(
        physical_device: PhysicalDevice,
        samples: SampleCountFlagBits,
        p_multisample_properties: Ptr[MultisamplePropertiesEXT, MutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_sample_locations = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleLocationsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_locations)]()[]
        self._get_physical_device_multisample_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceMultisamplePropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_multisample_properties)]()[]

    def cmd_set_sample_locations(
        self, command_buffer: CommandBuffer, sample_locations_info: SampleLocationsInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEXT.html
        """
        return self._cmd_set_sample_locations(
            command_buffer,
            Ptr(to=sample_locations_info).bitcast[SampleLocationsInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_physical_device_multisample_properties(
        self,
        physical_device: PhysicalDevice,
        samples: SampleCountFlagBits,
        mut multisample_properties: MultisamplePropertiesEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMultisamplePropertiesEXT.html
        """
        return self._get_physical_device_multisample_properties(
            physical_device,
            samples,
            Ptr(to=multisample_properties).bitcast[MultisamplePropertiesEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct ImageDrmFormatModifier(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_image_drm_format_modifier_properties: def(
        device: Device,
        image: Image,
        p_properties: Ptr[ImageDrmFormatModifierPropertiesEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_drm_format_modifier_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetImageDrmFormatModifierPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_image_drm_format_modifier_properties)]()[]

    def get_image_drm_format_modifier_properties(
        self, device: Device, image: Image, mut properties: ImageDrmFormatModifierPropertiesEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageDrmFormatModifierPropertiesEXT.html
        """
        return self._get_image_drm_format_modifier_properties(
            device,
            image,
            Ptr(to=properties).bitcast[ImageDrmFormatModifierPropertiesEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct ValidationCache(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_validation_cache: def(
        device: Device,
        p_create_info: Ptr[ValidationCacheCreateInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_validation_cache: Ptr[ValidationCacheEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_validation_cache: def(
        device: Device,
        validation_cache: ValidationCacheEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _merge_validation_caches: def(
        device: Device,
        dst_cache: ValidationCacheEXT,
        src_cache_count: UInt32,
        p_src_caches: Ptr[ValidationCacheEXT, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_validation_cache_data: def(
        device: Device,
        validation_cache: ValidationCacheEXT,
        p_data_size: Ptr[UInt, MutUntrackedOrigin],
        p_data: Optional[Ptr[NoneType, MutUntrackedOrigin]],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_validation_cache = Ptr(to=get_device_proc_addr(
            device, "vkCreateValidationCacheEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_validation_cache)]()[]
        self._destroy_validation_cache = Ptr(to=get_device_proc_addr(
            device, "vkDestroyValidationCacheEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_validation_cache)]()[]
        self._merge_validation_caches = Ptr(to=get_device_proc_addr(
            device, "vkMergeValidationCachesEXT".as_c_string_slice()
        )).bitcast[type_of(self._merge_validation_caches)]()[]
        self._get_validation_cache_data = Ptr(to=get_device_proc_addr(
            device, "vkGetValidationCacheDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_validation_cache_data)]()[]

    def create_validation_cache[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: ValidationCacheCreateInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut validation_cache: ValidationCacheEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateValidationCacheEXT.html
        """
        return self._create_validation_cache(
            device,
            Ptr(to=create_info).bitcast[ValidationCacheCreateInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=validation_cache).bitcast[ValidationCacheEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_validation_cache[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        validation_cache: ValidationCacheEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyValidationCacheEXT.html
        """
        return self._destroy_validation_cache(
            device,
            validation_cache,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def merge_validation_caches[p_src_caches_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        dst_cache: ValidationCacheEXT,
        src_cache_count: UInt32,
        p_src_caches: Ptr[ValidationCacheEXT, p_src_caches_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergeValidationCachesEXT.html
        """
        return self._merge_validation_caches(
            device,
            dst_cache,
            src_cache_count,
            Ptr(to=p_src_caches).bitcast[Ptr[ValidationCacheEXT, ImmutUntrackedOrigin]]()[],
        )

    def get_validation_cache_data[p_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        validation_cache: ValidationCacheEXT,
        mut data_size: UInt,
        p_data: Optional[Ptr[NoneType, p_data_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetValidationCacheDataEXT.html
        """
        return self._get_validation_cache_data(
            device,
            validation_cache,
            Ptr(to=data_size).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Optional[Ptr[NoneType, MutUntrackedOrigin]]]()[],
        )

    def get_validation_cache_data[p_data_origin: MutOrigin = MutUntrackedOrigin](
        self, device: Device, validation_cache: ValidationCacheEXT
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetValidationCacheDataEXT.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_validation_cache_data(
                device,
                validation_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[NoneType, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_validation_cache_data(
                    device,
                    validation_cache,
                    Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().bitcast[NoneType]().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)


struct ExternalMemoryHost(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_host_pointer_properties: def(
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        p_host_pointer: Ptr[NoneType, ImmutUntrackedOrigin],
        p_memory_host_pointer_properties: Ptr[MemoryHostPointerPropertiesEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_host_pointer_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryHostPointerPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_host_pointer_properties)]()[]

    def get_memory_host_pointer_properties[
        p_host_pointer_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        p_host_pointer: Ptr[NoneType, p_host_pointer_origin],
        mut memory_host_pointer_properties: MemoryHostPointerPropertiesEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryHostPointerPropertiesEXT.html
        """
        return self._get_memory_host_pointer_properties(
            device,
            handle_type,
            Ptr(to=p_host_pointer).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
            Ptr(to=memory_host_pointer_properties).bitcast[MemoryHostPointerPropertiesEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct CalibratedTimestamps(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_calibrateable_time_domains: def(
        physical_device: PhysicalDevice,
        p_time_domain_count: Ptr[UInt32, MutUntrackedOrigin],
        p_time_domains: Optional[Ptr[TimeDomainKHR, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _get_calibrated_timestamps: def(
        device: Device,
        timestamp_count: UInt32,
        p_timestamp_infos: Ptr[CalibratedTimestampInfoKHR, ImmutUntrackedOrigin],
        p_timestamps: Ptr[UInt64, MutUntrackedOrigin],
        p_max_deviation: Ptr[UInt64, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_calibrateable_time_domains = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_calibrateable_time_domains)]()[]
        self._get_calibrated_timestamps = Ptr(to=get_device_proc_addr(
            device, "vkGetCalibratedTimestampsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_calibrated_timestamps)]()[]

    def get_physical_device_calibrateable_time_domains[
        p_time_domains_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut time_domain_count: UInt32,
        p_time_domains: Optional[Ptr[TimeDomainKHR, p_time_domains_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCalibrateableTimeDomainsKHR.html
        """
        return self._get_physical_device_calibrateable_time_domains(
            physical_device,
            Ptr(to=time_domain_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_time_domains).bitcast[Optional[Ptr[TimeDomainKHR, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_calibrateable_time_domains[
        p_time_domains_origin: MutOrigin = MutUntrackedOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> ListResult[TimeDomainKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCalibrateableTimeDomainsKHR.html
        """
        var list = List[TimeDomainKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_calibrateable_time_domains(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[TimeDomainKHR, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_calibrateable_time_domains(
                    physical_device,
                    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)

    def get_calibrated_timestamps[
        p_timestamp_infos_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_timestamps_origin: MutOrigin = MutUntrackedOrigin,
    ](
        self,
        device: Device,
        timestamp_count: UInt32,
        p_timestamp_infos: Ptr[CalibratedTimestampInfoKHR, p_timestamp_infos_origin],
        p_timestamps: Ptr[UInt64, p_timestamps_origin],
        mut max_deviation: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetCalibratedTimestampsKHR.html
        """
        return self._get_calibrated_timestamps(
            device,
            timestamp_count,
            Ptr(to=p_timestamp_infos).bitcast[Ptr[CalibratedTimestampInfoKHR, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_timestamps).bitcast[Ptr[UInt64, MutUntrackedOrigin]]()[],
            Ptr(to=max_deviation).bitcast[UInt64]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct PresentTiming(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_swapchain_present_timing_queue_size: def(
        device: Device, swapchain: SwapchainKHR, size: UInt32
    ) thin abi("C") -> Result
    var _get_swapchain_timing_properties: def(
        device: Device,
        swapchain: SwapchainKHR,
        p_swapchain_timing_properties: Ptr[SwapchainTimingPropertiesEXT, MutUntrackedOrigin],
        p_swapchain_timing_properties_counter: Optional[Ptr[UInt64, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _get_swapchain_time_domain_properties: def(
        device: Device,
        swapchain: SwapchainKHR,
        p_swapchain_time_domain_properties: Ptr[SwapchainTimeDomainPropertiesEXT, MutUntrackedOrigin],
        p_time_domains_counter: Optional[Ptr[UInt64, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _get_past_presentation_timing: def(
        device: Device,
        p_past_presentation_timing_info: Ptr[PastPresentationTimingInfoEXT, ImmutUntrackedOrigin],
        p_past_presentation_timing_properties: Ptr[PastPresentationTimingPropertiesEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_swapchain_present_timing_queue_size = Ptr(to=get_device_proc_addr(
            device, "vkSetSwapchainPresentTimingQueueSizeEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_swapchain_present_timing_queue_size)]()[]
        self._get_swapchain_timing_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainTimingPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_swapchain_timing_properties)]()[]
        self._get_swapchain_time_domain_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainTimeDomainPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_swapchain_time_domain_properties)]()[]
        self._get_past_presentation_timing = Ptr(to=get_device_proc_addr(
            device, "vkGetPastPresentationTimingEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_past_presentation_timing)]()[]

    def set_swapchain_present_timing_queue_size(
        self, device: Device, swapchain: SwapchainKHR, size: UInt32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetSwapchainPresentTimingQueueSizeEXT.html
        """
        return self._set_swapchain_present_timing_queue_size(device, swapchain, size)

    def get_swapchain_timing_properties[
        p_swapchain_timing_properties_counter_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut swapchain_timing_properties: SwapchainTimingPropertiesEXT,
        p_swapchain_timing_properties_counter: Optional[Ptr[UInt64, p_swapchain_timing_properties_counter_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainTimingPropertiesEXT.html
        """
        return self._get_swapchain_timing_properties(
            device,
            swapchain,
            Ptr(to=swapchain_timing_properties).bitcast[SwapchainTimingPropertiesEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_swapchain_timing_properties_counter).bitcast[Optional[Ptr[UInt64, MutUntrackedOrigin]]]()[],
        )

    def get_swapchain_time_domain_properties[
        p_time_domains_counter_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut swapchain_time_domain_properties: SwapchainTimeDomainPropertiesEXT,
        p_time_domains_counter: Optional[Ptr[UInt64, p_time_domains_counter_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainTimeDomainPropertiesEXT.html
        """
        return self._get_swapchain_time_domain_properties(
            device,
            swapchain,
            Ptr(to=swapchain_time_domain_properties).bitcast[SwapchainTimeDomainPropertiesEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_time_domains_counter).bitcast[Optional[Ptr[UInt64, MutUntrackedOrigin]]]()[],
        )

    def get_past_presentation_timing(
        self,
        device: Device,
        past_presentation_timing_info: PastPresentationTimingInfoEXT,
        mut past_presentation_timing_properties: PastPresentationTimingPropertiesEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPastPresentationTimingEXT.html
        """
        return self._get_past_presentation_timing(
            device,
            Ptr(to=past_presentation_timing_info).bitcast[PastPresentationTimingInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=past_presentation_timing_properties).bitcast[PastPresentationTimingPropertiesEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct MetalSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_metal_surface: def(
        instance: Instance,
        p_create_info: Ptr[MetalSurfaceCreateInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_surface: Ptr[SurfaceKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_metal_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateMetalSurfaceEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_metal_surface)]()[]

    def create_metal_surface[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        create_info: MetalSurfaceCreateInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateMetalSurfaceEXT.html
        """
        return self._create_metal_surface(
            instance,
            Ptr(to=create_info).bitcast[MetalSurfaceCreateInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=surface).bitcast[SurfaceKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct BufferDeviceAddress(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_buffer_device_address: def(
        device: Device, p_info: Ptr[BufferDeviceAddressInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> DeviceAddress

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_buffer_device_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferDeviceAddress".as_c_string_slice()
        )).bitcast[type_of(self._get_buffer_device_address)]()[]

    def get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._get_buffer_device_address(
            device,
            Ptr(to=info).bitcast[BufferDeviceAddressInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct ToolingInfo(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_tool_properties: def(
        physical_device: PhysicalDevice,
        p_tool_count: Ptr[UInt32, MutUntrackedOrigin],
        p_tool_properties: Optional[Ptr[PhysicalDeviceToolProperties, MutUntrackedOrigin]],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_tool_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceToolProperties".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_tool_properties)]()[]

    def get_physical_device_tool_properties[
        p_tool_properties_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut tool_count: UInt32,
        p_tool_properties: Optional[Ptr[PhysicalDeviceToolProperties, p_tool_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        return self._get_physical_device_tool_properties(
            physical_device,
            Ptr(to=tool_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_tool_properties).bitcast[Optional[Ptr[PhysicalDeviceToolProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_tool_properties[
        p_tool_properties_origin: MutOrigin = MutUntrackedOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> ListResult[PhysicalDeviceToolProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        var list = List[PhysicalDeviceToolProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_tool_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[PhysicalDeviceToolProperties, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_tool_properties(
                    physical_device,
                    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)


struct FullScreenExclusive(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_surface_present_modes_2: def(
        physical_device: PhysicalDevice,
        p_surface_info: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutUntrackedOrigin],
        p_present_mode_count: Ptr[UInt32, MutUntrackedOrigin],
        p_present_modes: Optional[Ptr[PresentModeKHR, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _acquire_full_screen_exclusive_mode: def(
        device: Device, swapchain: SwapchainKHR
    ) thin abi("C") -> Result
    var _release_full_screen_exclusive_mode: def(
        device: Device, swapchain: SwapchainKHR
    ) thin abi("C") -> Result
    var _get_device_group_surface_present_modes_2: def(
        device: Device,
        p_surface_info: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutUntrackedOrigin],
        p_modes: Ptr[DeviceGroupPresentModeFlagsKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_surface_present_modes_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceSurfacePresentModes2EXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_present_modes_2)]()[]
        self._acquire_full_screen_exclusive_mode = Ptr(to=get_device_proc_addr(
            device, "vkAcquireFullScreenExclusiveModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._acquire_full_screen_exclusive_mode)]()[]
        self._release_full_screen_exclusive_mode = Ptr(to=get_device_proc_addr(
            device, "vkReleaseFullScreenExclusiveModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._release_full_screen_exclusive_mode)]()[]
        self._get_device_group_surface_present_modes_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupSurfacePresentModes2EXT".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_surface_present_modes_2)]()[]

    def get_physical_device_surface_present_modes_2[
        p_present_modes_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut present_mode_count: UInt32,
        p_present_modes: Optional[Ptr[PresentModeKHR, p_present_modes_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfacePresentModes2EXT.html
        """
        return self._get_physical_device_surface_present_modes_2(
            physical_device,
            Ptr(to=surface_info).bitcast[PhysicalDeviceSurfaceInfo2KHR]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=present_mode_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_present_modes).bitcast[Optional[Ptr[PresentModeKHR, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_surface_present_modes_2[
        p_present_modes_origin: MutOrigin = MutUntrackedOrigin
    ](
        self, physical_device: PhysicalDevice, surface_info: PhysicalDeviceSurfaceInfo2KHR
    ) -> ListResult[PresentModeKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfacePresentModes2EXT.html
        """
        var list = List[PresentModeKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_surface_present_modes_2(
                physical_device,
                Ptr(to=surface_info).bitcast[PhysicalDeviceSurfaceInfo2KHR]().unsafe_origin_cast[ImmutUntrackedOrigin](),
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[PresentModeKHR, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_surface_present_modes_2(
                    physical_device,
                    Ptr(to=surface_info).bitcast[PhysicalDeviceSurfaceInfo2KHR]().unsafe_origin_cast[ImmutUntrackedOrigin](),
                    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)

    def acquire_full_screen_exclusive_mode(
        self, device: Device, swapchain: SwapchainKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireFullScreenExclusiveModeEXT.html
        """
        return self._acquire_full_screen_exclusive_mode(device, swapchain)

    def release_full_screen_exclusive_mode(
        self, device: Device, swapchain: SwapchainKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseFullScreenExclusiveModeEXT.html
        """
        return self._release_full_screen_exclusive_mode(device, swapchain)

    def get_device_group_surface_present_modes_2(
        self,
        device: Device,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut modes: DeviceGroupPresentModeFlagsKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupSurfacePresentModes2EXT.html
        """
        return self._get_device_group_surface_present_modes_2(
            device,
            Ptr(to=surface_info).bitcast[PhysicalDeviceSurfaceInfo2KHR]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=modes).bitcast[DeviceGroupPresentModeFlagsKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct HeadlessSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_headless_surface: def(
        instance: Instance,
        p_create_info: Ptr[HeadlessSurfaceCreateInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_surface: Ptr[SurfaceKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_headless_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateHeadlessSurfaceEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_headless_surface)]()[]

    def create_headless_surface[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        create_info: HeadlessSurfaceCreateInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateHeadlessSurfaceEXT.html
        """
        return self._create_headless_surface(
            instance,
            Ptr(to=create_info).bitcast[HeadlessSurfaceCreateInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=surface).bitcast[SurfaceKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct LineRasterization(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_line_stipple: def(
        command_buffer: CommandBuffer, line_stipple_factor: UInt32, line_stipple_pattern: UInt16
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_line_stipple = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStipple".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_stipple)]()[]

    def cmd_set_line_stipple(
        self,
        command_buffer: CommandBuffer,
        line_stipple_factor: UInt32,
        line_stipple_pattern: UInt16,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStipple.html
        """
        return self._cmd_set_line_stipple(command_buffer, line_stipple_factor, line_stipple_pattern)


struct HostQueryReset(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _reset_query_pool: def(
        device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._reset_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkResetQueryPool".as_c_string_slice()
        )).bitcast[type_of(self._reset_query_pool)]()[]

    def reset_query_pool(
        self, device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetQueryPool.html
        """
        return self._reset_query_pool(device, query_pool, first_query, query_count)


struct ExtendedDynamicState(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_cull_mode: def(command_buffer: CommandBuffer, cull_mode: CullModeFlags) thin abi("C")
    var _cmd_set_front_face: def(command_buffer: CommandBuffer, front_face: FrontFace) thin abi("C")
    var _cmd_set_primitive_topology: def(
        command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ) thin abi("C")
    var _cmd_set_viewport_with_count: def(
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_scissor_with_count: def(
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_bind_vertex_buffers_2: def(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutUntrackedOrigin],
        p_offsets: Ptr[DeviceSize, ImmutUntrackedOrigin],
        p_sizes: Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]],
        p_strides: Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _cmd_set_depth_test_enable: def(
        command_buffer: CommandBuffer, depth_test_enable: Bool32
    ) thin abi("C")
    var _cmd_set_depth_write_enable: def(
        command_buffer: CommandBuffer, depth_write_enable: Bool32
    ) thin abi("C")
    var _cmd_set_depth_compare_op: def(
        command_buffer: CommandBuffer, depth_compare_op: CompareOp
    ) thin abi("C")
    var _cmd_set_depth_bounds_test_enable: def(
        command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ) thin abi("C")
    var _cmd_set_stencil_test_enable: def(
        command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ) thin abi("C")
    var _cmd_set_stencil_op: def(
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_cull_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCullMode".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_cull_mode)]()[]
        self._cmd_set_front_face = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFrontFace".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_front_face)]()[]
        self._cmd_set_primitive_topology = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveTopology".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_primitive_topology)]()[]
        self._cmd_set_viewport_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWithCount".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_with_count)]()[]
        self._cmd_set_scissor_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetScissorWithCount".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_scissor_with_count)]()[]
        self._cmd_bind_vertex_buffers_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindVertexBuffers2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_vertex_buffers_2)]()[]
        self._cmd_set_depth_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthTestEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_test_enable)]()[]
        self._cmd_set_depth_write_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthWriteEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_write_enable)]()[]
        self._cmd_set_depth_compare_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthCompareOp".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_compare_op)]()[]
        self._cmd_set_depth_bounds_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBoundsTestEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_bounds_test_enable)]()[]
        self._cmd_set_stencil_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilTestEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_stencil_test_enable)]()[]
        self._cmd_set_stencil_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilOp".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_stencil_op)]()[]

    def cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCullMode.html
        """
        return self._cmd_set_cull_mode(command_buffer, cull_mode)

    def cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFrontFace.html
        """
        return self._cmd_set_front_face(command_buffer, front_face)

    def cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveTopology.html
        """
        return self._cmd_set_primitive_topology(command_buffer, primitive_topology)

    def cmd_set_viewport_with_count[p_viewports_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWithCount.html
        """
        return self._cmd_set_viewport_with_count(
            command_buffer,
            viewport_count,
            Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_scissor_with_count[p_scissors_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissorWithCount.html
        """
        return self._cmd_set_scissor_with_count(
            command_buffer, scissor_count, Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[]
        )

    def cmd_bind_vertex_buffers_2[
        p_buffers_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_offsets_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_sizes_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_strides_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
        p_sizes: Optional[Ptr[DeviceSize, p_sizes_origin]],
        p_strides: Optional[Ptr[DeviceSize, p_strides_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers2.html
        """
        return self._cmd_bind_vertex_buffers_2(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_sizes).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_strides).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthTestEnable.html
        """
        return self._cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    def cmd_set_depth_write_enable(
        self, command_buffer: CommandBuffer, depth_write_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthWriteEnable.html
        """
        return self._cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    def cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthCompareOp.html
        """
        return self._cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    def cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBoundsTestEnable.html
        """
        return self._cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    def cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilTestEnable.html
        """
        return self._cmd_set_stencil_test_enable(command_buffer, stencil_test_enable)

    def cmd_set_stencil_op(
        self,
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilOp.html
        """
        return self._cmd_set_stencil_op(
            command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op
        )


struct HostImageCopy(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _copy_memory_to_image: def(
        device: Device, p_copy_memory_to_image_info: Ptr[CopyMemoryToImageInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var _copy_image_to_memory: def(
        device: Device, p_copy_image_to_memory_info: Ptr[CopyImageToMemoryInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var _copy_image_to_image: def(
        device: Device, p_copy_image_to_image_info: Ptr[CopyImageToImageInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var _transition_image_layout: def(
        device: Device,
        transition_count: UInt32,
        p_transitions: Ptr[HostImageLayoutTransitionInfo, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_image_subresource_layout_2: def(
        device: Device,
        image: Image,
        p_subresource: Ptr[ImageSubresource2, ImmutUntrackedOrigin],
        p_layout: Ptr[SubresourceLayout2, MutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._copy_memory_to_image = Ptr(to=get_device_proc_addr(
            device, "vkCopyMemoryToImage".as_c_string_slice()
        )).bitcast[type_of(self._copy_memory_to_image)]()[]
        self._copy_image_to_memory = Ptr(to=get_device_proc_addr(
            device, "vkCopyImageToMemory".as_c_string_slice()
        )).bitcast[type_of(self._copy_image_to_memory)]()[]
        self._copy_image_to_image = Ptr(to=get_device_proc_addr(
            device, "vkCopyImageToImage".as_c_string_slice()
        )).bitcast[type_of(self._copy_image_to_image)]()[]
        self._transition_image_layout = Ptr(to=get_device_proc_addr(
            device, "vkTransitionImageLayout".as_c_string_slice()
        )).bitcast[type_of(self._transition_image_layout)]()[]
        self._get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout2".as_c_string_slice()
        )).bitcast[type_of(self._get_image_subresource_layout_2)]()[]

    def copy_memory_to_image(
        self, device: Device, copy_memory_to_image_info: CopyMemoryToImageInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToImage.html
        """
        return self._copy_memory_to_image(
            device,
            Ptr(to=copy_memory_to_image_info).bitcast[CopyMemoryToImageInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def copy_image_to_memory(
        self, device: Device, copy_image_to_memory_info: CopyImageToMemoryInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyImageToMemory.html
        """
        return self._copy_image_to_memory(
            device,
            Ptr(to=copy_image_to_memory_info).bitcast[CopyImageToMemoryInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def copy_image_to_image(
        self, device: Device, copy_image_to_image_info: CopyImageToImageInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyImageToImage.html
        """
        return self._copy_image_to_image(
            device,
            Ptr(to=copy_image_to_image_info).bitcast[CopyImageToImageInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def transition_image_layout[p_transitions_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        transition_count: UInt32,
        p_transitions: Ptr[HostImageLayoutTransitionInfo, p_transitions_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTransitionImageLayout.html
        """
        return self._transition_image_layout(
            device,
            transition_count,
            Ptr(to=p_transitions).bitcast[Ptr[HostImageLayoutTransitionInfo, ImmutUntrackedOrigin]]()[],
        )

    def get_image_subresource_layout_2(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource2,
        mut layout: SubresourceLayout2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout2.html
        """
        return self._get_image_subresource_layout_2(
            device,
            image,
            Ptr(to=subresource).bitcast[ImageSubresource2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=layout).bitcast[SubresourceLayout2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct SwapchainMaintenance1(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _release_swapchain_images: def(
        device: Device, p_release_info: Ptr[ReleaseSwapchainImagesInfoKHR, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._release_swapchain_images = Ptr(to=get_device_proc_addr(
            device, "vkReleaseSwapchainImagesKHR".as_c_string_slice()
        )).bitcast[type_of(self._release_swapchain_images)]()[]

    def release_swapchain_images(
        self, device: Device, release_info: ReleaseSwapchainImagesInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseSwapchainImagesKHR.html
        """
        return self._release_swapchain_images(
            device,
            Ptr(to=release_info).bitcast[ReleaseSwapchainImagesInfoKHR]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct DepthBiasControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_depth_bias_2: def(
        command_buffer: CommandBuffer, p_depth_bias_info: Ptr[DepthBiasInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_bias_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBias2EXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_bias_2)]()[]

    def cmd_set_depth_bias_2(
        self, command_buffer: CommandBuffer, depth_bias_info: DepthBiasInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBias2EXT.html
        """
        return self._cmd_set_depth_bias_2(
            command_buffer,
            Ptr(to=depth_bias_info).bitcast[DepthBiasInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct AcquireDrmDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _acquire_drm_display: def(
        physical_device: PhysicalDevice, drm_fd: Int32, display: DisplayKHR
    ) thin abi("C") -> Result
    var _get_drm_display: def(
        physical_device: PhysicalDevice,
        drm_fd: Int32,
        connector_id: UInt32,
        display: Ptr[DisplayKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._acquire_drm_display = Ptr(to=get_instance_proc_addr(
            instance, "vkAcquireDrmDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._acquire_drm_display)]()[]
        self._get_drm_display = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDrmDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_drm_display)]()[]

    def acquire_drm_display(
        self, physical_device: PhysicalDevice, drm_fd: Int32, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireDrmDisplayEXT.html
        """
        return self._acquire_drm_display(physical_device, drm_fd, display)

    def get_drm_display(
        self,
        physical_device: PhysicalDevice,
        drm_fd: Int32,
        connector_id: UInt32,
        mut display: DisplayKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDrmDisplayEXT.html
        """
        return self._get_drm_display(
            physical_device,
            drm_fd,
            connector_id,
            Ptr(to=display).bitcast[DisplayKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct PrivateData(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_private_data_slot: def(
        device: Device,
        p_create_info: Ptr[PrivateDataSlotCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_private_data_slot: Ptr[PrivateDataSlot, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_private_data_slot: def(
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _set_private_data: def(
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        data: UInt64,
    ) thin abi("C") -> Result
    var _get_private_data: def(
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        p_data: Ptr[UInt64, MutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_private_data_slot = Ptr(to=get_device_proc_addr(
            device, "vkCreatePrivateDataSlot".as_c_string_slice()
        )).bitcast[type_of(self._create_private_data_slot)]()[]
        self._destroy_private_data_slot = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPrivateDataSlot".as_c_string_slice()
        )).bitcast[type_of(self._destroy_private_data_slot)]()[]
        self._set_private_data = Ptr(to=get_device_proc_addr(
            device, "vkSetPrivateData".as_c_string_slice()
        )).bitcast[type_of(self._set_private_data)]()[]
        self._get_private_data = Ptr(to=get_device_proc_addr(
            device, "vkGetPrivateData".as_c_string_slice()
        )).bitcast[type_of(self._get_private_data)]()[]

    def create_private_data_slot[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: PrivateDataSlotCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut private_data_slot: PrivateDataSlot,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePrivateDataSlot.html
        """
        return self._create_private_data_slot(
            device,
            Ptr(to=create_info).bitcast[PrivateDataSlotCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=private_data_slot).bitcast[PrivateDataSlot]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_private_data_slot[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPrivateDataSlot.html
        """
        return self._destroy_private_data_slot(
            device,
            private_data_slot,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def set_private_data(
        self,
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        data: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetPrivateData.html
        """
        return self._set_private_data(device, object_type, object_handle, private_data_slot, data)

    def get_private_data(
        self,
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        mut data: UInt64,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPrivateData.html
        """
        return self._get_private_data(
            device,
            object_type,
            object_handle,
            private_data_slot,
            Ptr(to=data).bitcast[UInt64]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct MetalObjects(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _export_metal_objects: def(
        device: Device, p_metal_objects_info: Ptr[ExportMetalObjectsInfoEXT, MutUntrackedOrigin]
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._export_metal_objects = Ptr(to=get_device_proc_addr(
            device, "vkExportMetalObjectsEXT".as_c_string_slice()
        )).bitcast[type_of(self._export_metal_objects)]()[]

    def export_metal_objects(
        self, device: Device, mut metal_objects_info: ExportMetalObjectsInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkExportMetalObjectsEXT.html
        """
        return self._export_metal_objects(
            device,
            Ptr(to=metal_objects_info).bitcast[ExportMetalObjectsInfoEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct DescriptorBuffer(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_descriptor_set_layout_size: def(
        device: Device,
        layout: DescriptorSetLayout,
        p_layout_size_in_bytes: Ptr[DeviceSize, MutUntrackedOrigin],
    ) thin abi("C")
    var _get_descriptor_set_layout_binding_offset: def(
        device: Device,
        layout: DescriptorSetLayout,
        binding: UInt32,
        p_offset: Ptr[DeviceSize, MutUntrackedOrigin],
    ) thin abi("C")
    var _get_descriptor: def(
        device: Device,
        p_descriptor_info: Ptr[DescriptorGetInfoEXT, ImmutUntrackedOrigin],
        data_size: UInt,
        p_descriptor: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_bind_descriptor_buffers: def(
        command_buffer: CommandBuffer,
        buffer_count: UInt32,
        p_binding_infos: Ptr[DescriptorBufferBindingInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_descriptor_buffer_offsets: def(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        set_count: UInt32,
        p_buffer_indices: Ptr[UInt32, ImmutUntrackedOrigin],
        p_offsets: Ptr[DeviceSize, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_bind_descriptor_buffer_embedded_samplers: def(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
    ) thin abi("C")
    var _get_buffer_opaque_capture_descriptor_data: def(
        device: Device,
        p_info: Ptr[BufferCaptureDescriptorDataInfoEXT, ImmutUntrackedOrigin],
        p_data: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_image_opaque_capture_descriptor_data: def(
        device: Device,
        p_info: Ptr[ImageCaptureDescriptorDataInfoEXT, ImmutUntrackedOrigin],
        p_data: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_image_view_opaque_capture_descriptor_data: def(
        device: Device,
        p_info: Ptr[ImageViewCaptureDescriptorDataInfoEXT, ImmutUntrackedOrigin],
        p_data: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_sampler_opaque_capture_descriptor_data: def(
        device: Device,
        p_info: Ptr[SamplerCaptureDescriptorDataInfoEXT, ImmutUntrackedOrigin],
        p_data: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_acceleration_structure_opaque_capture_descriptor_data: def(
        device: Device,
        p_info: Ptr[AccelerationStructureCaptureDescriptorDataInfoEXT, ImmutUntrackedOrigin],
        p_data: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_descriptor_set_layout_size = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutSizeEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_set_layout_size)]()[]
        self._get_descriptor_set_layout_binding_offset = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutBindingOffsetEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_set_layout_binding_offset)]()[]
        self._get_descriptor = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor)]()[]
        self._cmd_bind_descriptor_buffers = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorBuffersEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_descriptor_buffers)]()[]
        self._cmd_set_descriptor_buffer_offsets = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDescriptorBufferOffsetsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_descriptor_buffer_offsets)]()[]
        self._cmd_bind_descriptor_buffer_embedded_samplers = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorBufferEmbeddedSamplersEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_descriptor_buffer_embedded_samplers)]()[]
        self._get_buffer_opaque_capture_descriptor_data = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferOpaqueCaptureDescriptorDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_buffer_opaque_capture_descriptor_data)]()[]
        self._get_image_opaque_capture_descriptor_data = Ptr(to=get_device_proc_addr(
            device, "vkGetImageOpaqueCaptureDescriptorDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_image_opaque_capture_descriptor_data)]()[]
        self._get_image_view_opaque_capture_descriptor_data = Ptr(to=get_device_proc_addr(
            device, "vkGetImageViewOpaqueCaptureDescriptorDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_image_view_opaque_capture_descriptor_data)]()[]
        self._get_sampler_opaque_capture_descriptor_data = Ptr(to=get_device_proc_addr(
            device, "vkGetSamplerOpaqueCaptureDescriptorDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_sampler_opaque_capture_descriptor_data)]()[]
        self._get_acceleration_structure_opaque_capture_descriptor_data = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_acceleration_structure_opaque_capture_descriptor_data)]()[]

    def get_descriptor_set_layout_size(
        self, device: Device, layout: DescriptorSetLayout, mut layout_size_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutSizeEXT.html
        """
        return self._get_descriptor_set_layout_size(
            device,
            layout,
            Ptr(to=layout_size_in_bytes).bitcast[DeviceSize]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_descriptor_set_layout_binding_offset(
        self, device: Device, layout: DescriptorSetLayout, binding: UInt32, mut offset: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutBindingOffsetEXT.html
        """
        return self._get_descriptor_set_layout_binding_offset(
            device,
            layout,
            binding,
            Ptr(to=offset).bitcast[DeviceSize]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_descriptor[p_descriptor_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        descriptor_info: DescriptorGetInfoEXT,
        data_size: UInt,
        p_descriptor: Ptr[NoneType, p_descriptor_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorEXT.html
        """
        return self._get_descriptor(
            device,
            Ptr(to=descriptor_info).bitcast[DescriptorGetInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            data_size,
            Ptr(to=p_descriptor).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )

    def cmd_bind_descriptor_buffers[p_binding_infos_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        buffer_count: UInt32,
        p_binding_infos: Ptr[DescriptorBufferBindingInfoEXT, p_binding_infos_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorBuffersEXT.html
        """
        return self._cmd_bind_descriptor_buffers(
            command_buffer,
            buffer_count,
            Ptr(to=p_binding_infos).bitcast[Ptr[DescriptorBufferBindingInfoEXT, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_descriptor_buffer_offsets[
        p_buffer_indices_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_offsets_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        set_count: UInt32,
        p_buffer_indices: Ptr[UInt32, p_buffer_indices_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDescriptorBufferOffsetsEXT.html
        """
        return self._cmd_set_descriptor_buffer_offsets(
            command_buffer,
            pipeline_bind_point,
            layout,
            first_set,
            set_count,
            Ptr(to=p_buffer_indices).bitcast[Ptr[UInt32, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
        )

    def cmd_bind_descriptor_buffer_embedded_samplers(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorBufferEmbeddedSamplersEXT.html
        """
        return self._cmd_bind_descriptor_buffer_embedded_samplers(
            command_buffer, pipeline_bind_point, layout, set
        )

    def get_buffer_opaque_capture_descriptor_data[p_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        info: BufferCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_buffer_opaque_capture_descriptor_data(
            device,
            Ptr(to=info).bitcast[BufferCaptureDescriptorDataInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )

    def get_image_opaque_capture_descriptor_data[p_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        info: ImageCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_image_opaque_capture_descriptor_data(
            device,
            Ptr(to=info).bitcast[ImageCaptureDescriptorDataInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )

    def get_image_view_opaque_capture_descriptor_data[
        p_data_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        device: Device,
        info: ImageViewCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageViewOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_image_view_opaque_capture_descriptor_data(
            device,
            Ptr(to=info).bitcast[ImageViewCaptureDescriptorDataInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )

    def get_sampler_opaque_capture_descriptor_data[p_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        info: SamplerCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSamplerOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_sampler_opaque_capture_descriptor_data(
            device,
            Ptr(to=info).bitcast[SamplerCaptureDescriptorDataInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )

    def get_acceleration_structure_opaque_capture_descriptor_data[
        p_data_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        device: Device,
        info: AccelerationStructureCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_acceleration_structure_opaque_capture_descriptor_data(
            device,
            Ptr(to=info).bitcast[AccelerationStructureCaptureDescriptorDataInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )


struct MeshShader(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_mesh_tasks: def(
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ) thin abi("C")
    var _cmd_draw_mesh_tasks_indirect: def(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ) thin abi("C")
    var _cmd_draw_mesh_tasks_indirect_count: def(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_mesh_tasks = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks)]()[]
        self._cmd_draw_mesh_tasks_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_indirect)]()[]
        self._cmd_draw_mesh_tasks_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectCountEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_indirect_count)]()[]

    def cmd_draw_mesh_tasks(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksEXT.html
        """
        return self._cmd_draw_mesh_tasks(command_buffer, group_count_x, group_count_y, group_count_z)

    def cmd_draw_mesh_tasks_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksIndirectEXT.html
        """
        return self._cmd_draw_mesh_tasks_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_draw_mesh_tasks_indirect_count(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksIndirectCountEXT.html
        """
        return self._cmd_draw_mesh_tasks_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )


struct ImageCompressionControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_image_subresource_layout_2: def(
        device: Device,
        image: Image,
        p_subresource: Ptr[ImageSubresource2, ImmutUntrackedOrigin],
        p_layout: Ptr[SubresourceLayout2, MutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout2".as_c_string_slice()
        )).bitcast[type_of(self._get_image_subresource_layout_2)]()[]

    def get_image_subresource_layout_2(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource2,
        mut layout: SubresourceLayout2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout2.html
        """
        return self._get_image_subresource_layout_2(
            device,
            image,
            Ptr(to=subresource).bitcast[ImageSubresource2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=layout).bitcast[SubresourceLayout2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct DeviceFault(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_device_fault_info: def(
        device: Device,
        p_fault_counts: Ptr[DeviceFaultCountsEXT, MutUntrackedOrigin],
        p_fault_info: Optional[Ptr[DeviceFaultInfoEXT, MutUntrackedOrigin]],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_device_fault_info = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceFaultInfoEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_device_fault_info)]()[]

    def get_device_fault_info[p_fault_info_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        mut fault_counts: DeviceFaultCountsEXT,
        p_fault_info: Optional[Ptr[DeviceFaultInfoEXT, p_fault_info_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceFaultInfoEXT.html
        """
        return self._get_device_fault_info(
            device,
            Ptr(to=fault_counts).bitcast[DeviceFaultCountsEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_fault_info).bitcast[Optional[Ptr[DeviceFaultInfoEXT, MutUntrackedOrigin]]]()[],
        )


struct DirectfbSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_direct_fb_surface: def(
        instance: Instance,
        p_create_info: Ptr[DirectFBSurfaceCreateInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_surface: Ptr[SurfaceKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_physical_device_direct_fb_presentation_support: def(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        dfb: Ptr[IDirectFB, MutUntrackedOrigin],
    ) thin abi("C") -> Bool32

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_direct_fb_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDirectFBSurfaceEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_direct_fb_surface)]()[]
        self._get_physical_device_direct_fb_presentation_support = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDirectFBPresentationSupportEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_direct_fb_presentation_support)]()[]

    def create_direct_fb_surface[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        create_info: DirectFBSurfaceCreateInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDirectFBSurfaceEXT.html
        """
        return self._create_direct_fb_surface(
            instance,
            Ptr(to=create_info).bitcast[DirectFBSurfaceCreateInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=surface).bitcast[SurfaceKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_direct_fb_presentation_support(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32, mut dfb: IDirectFB
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDirectFBPresentationSupportEXT.html
        """
        return self._get_physical_device_direct_fb_presentation_support(
            physical_device,
            queue_family_index,
            Ptr(to=dfb).bitcast[IDirectFB]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct VertexInputDynamicState(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_vertex_input: def(
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT, ImmutUntrackedOrigin],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_vertex_input = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetVertexInputEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_vertex_input)]()[]

    def cmd_set_vertex_input[
        p_vertex_binding_descriptions_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_vertex_attribute_descriptions_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT, p_vertex_binding_descriptions_origin],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT, p_vertex_attribute_descriptions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetVertexInputEXT.html
        """
        return self._cmd_set_vertex_input(
            command_buffer,
            vertex_binding_description_count,
            Ptr(to=p_vertex_binding_descriptions).bitcast[Ptr[VertexInputBindingDescription2EXT, ImmutUntrackedOrigin]]()[],
            vertex_attribute_description_count,
            Ptr(to=p_vertex_attribute_descriptions).bitcast[Ptr[VertexInputAttributeDescription2EXT, ImmutUntrackedOrigin]]()[],
        )


struct PipelineProperties(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_pipeline_properties: def(
        device: Device,
        p_pipeline_info: Ptr[PipelineInfoEXT, ImmutUntrackedOrigin],
        p_pipeline_properties: Ptr[BaseOutStructure, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_pipeline_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelinePropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_properties)]()[]

    def get_pipeline_properties(
        self,
        device: Device,
        pipeline_info: PipelineInfoEXT,
        mut pipeline_properties: BaseOutStructure,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelinePropertiesEXT.html
        """
        return self._get_pipeline_properties(
            device,
            Ptr(to=pipeline_info).bitcast[PipelineInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=pipeline_properties).bitcast[BaseOutStructure]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct ExtendedDynamicState2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_patch_control_points: def(
        command_buffer: CommandBuffer, patch_control_points: UInt32
    ) thin abi("C")
    var _cmd_set_rasterizer_discard_enable: def(
        command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ) thin abi("C")
    var _cmd_set_depth_bias_enable: def(
        command_buffer: CommandBuffer, depth_bias_enable: Bool32
    ) thin abi("C")
    var _cmd_set_logic_op: def(command_buffer: CommandBuffer, logic_op: LogicOp) thin abi("C")
    var _cmd_set_primitive_restart_enable: def(
        command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_patch_control_points = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPatchControlPointsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_patch_control_points)]()[]
        self._cmd_set_rasterizer_discard_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizerDiscardEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterizer_discard_enable)]()[]
        self._cmd_set_depth_bias_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBiasEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_bias_enable)]()[]
        self._cmd_set_logic_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_logic_op)]()[]
        self._cmd_set_primitive_restart_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveRestartEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_primitive_restart_enable)]()[]

    def cmd_set_patch_control_points(
        self, command_buffer: CommandBuffer, patch_control_points: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPatchControlPointsEXT.html
        """
        return self._cmd_set_patch_control_points(command_buffer, patch_control_points)

    def cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizerDiscardEnable.html
        """
        return self._cmd_set_rasterizer_discard_enable(command_buffer, rasterizer_discard_enable)

    def cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBiasEnable.html
        """
        return self._cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    def cmd_set_logic_op(self, command_buffer: CommandBuffer, logic_op: LogicOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEXT.html
        """
        return self._cmd_set_logic_op(command_buffer, logic_op)

    def cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)


struct ColorWriteEnable(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_color_write_enable: def(
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_color_write_enables: Ptr[Bool32, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_color_write_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorWriteEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_write_enable)]()[]

    def cmd_set_color_write_enable[
        p_color_write_enables_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_color_write_enables: Ptr[Bool32, p_color_write_enables_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorWriteEnableEXT.html
        """
        return self._cmd_set_color_write_enable(
            command_buffer,
            attachment_count,
            Ptr(to=p_color_write_enables).bitcast[Ptr[Bool32, ImmutUntrackedOrigin]]()[],
        )


struct MultiDraw(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_multi: def(
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_vertex_info: Ptr[MultiDrawInfoEXT, ImmutUntrackedOrigin],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
    ) thin abi("C")
    var _cmd_draw_multi_indexed: def(
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_index_info: Ptr[MultiDrawIndexedInfoEXT, ImmutUntrackedOrigin],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
        p_vertex_offset: Optional[Ptr[Int32, ImmutUntrackedOrigin]],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_multi = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMultiEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_multi)]()[]
        self._cmd_draw_multi_indexed = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMultiIndexedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_multi_indexed)]()[]

    def cmd_draw_multi[p_vertex_info_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_vertex_info: Ptr[MultiDrawInfoEXT, p_vertex_info_origin],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMultiEXT.html
        """
        return self._cmd_draw_multi(
            command_buffer,
            draw_count,
            Ptr(to=p_vertex_info).bitcast[Ptr[MultiDrawInfoEXT, ImmutUntrackedOrigin]]()[],
            instance_count,
            first_instance,
            stride,
        )

    def cmd_draw_multi_indexed[
        p_index_info_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_vertex_offset_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_index_info: Ptr[MultiDrawIndexedInfoEXT, p_index_info_origin],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
        p_vertex_offset: Optional[Ptr[Int32, p_vertex_offset_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMultiIndexedEXT.html
        """
        return self._cmd_draw_multi_indexed(
            command_buffer,
            draw_count,
            Ptr(to=p_index_info).bitcast[Ptr[MultiDrawIndexedInfoEXT, ImmutUntrackedOrigin]]()[],
            instance_count,
            first_instance,
            stride,
            Ptr(to=p_vertex_offset).bitcast[Optional[Ptr[Int32, ImmutUntrackedOrigin]]]()[],
        )


struct OpacityMicromap(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_micromap: def(
        device: Device,
        p_create_info: Ptr[MicromapCreateInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_micromap: Ptr[MicromapEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_micromap: def(
        device: Device,
        micromap: MicromapEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _cmd_build_micromaps: def(
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _build_micromaps: def(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _copy_micromap: def(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMicromapInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _copy_micromap_to_memory: def(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMicromapToMemoryInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _copy_memory_to_micromap: def(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMemoryToMicromapInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _write_micromaps_properties: def(
        device: Device,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT, ImmutUntrackedOrigin],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType, MutUntrackedOrigin],
        stride: UInt,
    ) thin abi("C") -> Result
    var _cmd_copy_micromap: def(
        command_buffer: CommandBuffer, p_info: Ptr[CopyMicromapInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _cmd_copy_micromap_to_memory: def(
        command_buffer: CommandBuffer, p_info: Ptr[CopyMicromapToMemoryInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _cmd_copy_memory_to_micromap: def(
        command_buffer: CommandBuffer, p_info: Ptr[CopyMemoryToMicromapInfoEXT, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _cmd_write_micromaps_properties: def(
        command_buffer: CommandBuffer,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT, ImmutUntrackedOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ) thin abi("C")
    var _get_device_micromap_compatibility: def(
        device: Device,
        p_version_info: Ptr[MicromapVersionInfoEXT, ImmutUntrackedOrigin],
        p_compatibility: Ptr[AccelerationStructureCompatibilityKHR, MutUntrackedOrigin],
    ) thin abi("C")
    var _get_micromap_build_sizes: def(
        device: Device,
        build_type: AccelerationStructureBuildTypeKHR,
        p_build_info: Ptr[MicromapBuildInfoEXT, ImmutUntrackedOrigin],
        p_size_info: Ptr[MicromapBuildSizesInfoEXT, MutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_micromap = Ptr(to=get_device_proc_addr(
            device, "vkCreateMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_micromap)]()[]
        self._destroy_micromap = Ptr(to=get_device_proc_addr(
            device, "vkDestroyMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_micromap)]()[]
        self._cmd_build_micromaps = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildMicromapsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_micromaps)]()[]
        self._build_micromaps = Ptr(to=get_device_proc_addr(
            device, "vkBuildMicromapsEXT".as_c_string_slice()
        )).bitcast[type_of(self._build_micromaps)]()[]
        self._copy_micromap = Ptr(to=get_device_proc_addr(
            device, "vkCopyMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._copy_micromap)]()[]
        self._copy_micromap_to_memory = Ptr(to=get_device_proc_addr(
            device, "vkCopyMicromapToMemoryEXT".as_c_string_slice()
        )).bitcast[type_of(self._copy_micromap_to_memory)]()[]
        self._copy_memory_to_micromap = Ptr(to=get_device_proc_addr(
            device, "vkCopyMemoryToMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._copy_memory_to_micromap)]()[]
        self._write_micromaps_properties = Ptr(to=get_device_proc_addr(
            device, "vkWriteMicromapsPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._write_micromaps_properties)]()[]
        self._cmd_copy_micromap = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_micromap)]()[]
        self._cmd_copy_micromap_to_memory = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMicromapToMemoryEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_micromap_to_memory)]()[]
        self._cmd_copy_memory_to_micromap = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_memory_to_micromap)]()[]
        self._cmd_write_micromaps_properties = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteMicromapsPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_write_micromaps_properties)]()[]
        self._get_device_micromap_compatibility = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceMicromapCompatibilityEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_device_micromap_compatibility)]()[]
        self._get_micromap_build_sizes = Ptr(to=get_device_proc_addr(
            device, "vkGetMicromapBuildSizesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_micromap_build_sizes)]()[]

    def create_micromap[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: MicromapCreateInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut micromap: MicromapEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateMicromapEXT.html
        """
        return self._create_micromap(
            device,
            Ptr(to=create_info).bitcast[MicromapCreateInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=micromap).bitcast[MicromapEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_micromap[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        micromap: MicromapEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyMicromapEXT.html
        """
        return self._destroy_micromap(
            device,
            micromap,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_build_micromaps[p_infos_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, p_infos_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildMicromapsEXT.html
        """
        return self._cmd_build_micromaps(
            command_buffer,
            info_count,
            Ptr(to=p_infos).bitcast[Ptr[MicromapBuildInfoEXT, ImmutUntrackedOrigin]]()[],
        )

    def build_micromaps[p_infos_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, p_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBuildMicromapsEXT.html
        """
        return self._build_micromaps(
            device,
            deferred_operation,
            info_count,
            Ptr(to=p_infos).bitcast[Ptr[MicromapBuildInfoEXT, ImmutUntrackedOrigin]]()[],
        )

    def copy_micromap(
        self, device: Device, deferred_operation: DeferredOperationKHR, info: CopyMicromapInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMicromapEXT.html
        """
        return self._copy_micromap(
            device,
            deferred_operation,
            Ptr(to=info).bitcast[CopyMicromapInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def copy_micromap_to_memory(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMicromapToMemoryInfoEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMicromapToMemoryEXT.html
        """
        return self._copy_micromap_to_memory(
            device,
            deferred_operation,
            Ptr(to=info).bitcast[CopyMicromapToMemoryInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def copy_memory_to_micromap(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMemoryToMicromapInfoEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToMicromapEXT.html
        """
        return self._copy_memory_to_micromap(
            device,
            deferred_operation,
            Ptr(to=info).bitcast[CopyMemoryToMicromapInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def write_micromaps_properties[
        p_micromaps_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_data_origin: MutOrigin = MutUntrackedOrigin,
    ](
        self,
        device: Device,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT, p_micromaps_origin],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
        stride: UInt,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWriteMicromapsPropertiesEXT.html
        """
        return self._write_micromaps_properties(
            device,
            micromap_count,
            Ptr(to=p_micromaps).bitcast[Ptr[MicromapEXT, ImmutUntrackedOrigin]]()[],
            query_type,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
            stride,
        )

    def cmd_copy_micromap(self, command_buffer: CommandBuffer, info: CopyMicromapInfoEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMicromapEXT.html
        """
        return self._cmd_copy_micromap(
            command_buffer,
            Ptr(to=info).bitcast[CopyMicromapInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_copy_micromap_to_memory(
        self, command_buffer: CommandBuffer, info: CopyMicromapToMemoryInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMicromapToMemoryEXT.html
        """
        return self._cmd_copy_micromap_to_memory(
            command_buffer,
            Ptr(to=info).bitcast[CopyMicromapToMemoryInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_copy_memory_to_micromap(
        self, command_buffer: CommandBuffer, info: CopyMemoryToMicromapInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryToMicromapEXT.html
        """
        return self._cmd_copy_memory_to_micromap(
            command_buffer,
            Ptr(to=info).bitcast[CopyMemoryToMicromapInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_write_micromaps_properties[p_micromaps_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT, p_micromaps_origin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteMicromapsPropertiesEXT.html
        """
        return self._cmd_write_micromaps_properties(
            command_buffer,
            micromap_count,
            Ptr(to=p_micromaps).bitcast[Ptr[MicromapEXT, ImmutUntrackedOrigin]]()[],
            query_type,
            query_pool,
            first_query,
        )

    def get_device_micromap_compatibility(
        self,
        device: Device,
        version_info: MicromapVersionInfoEXT,
        mut compatibility: AccelerationStructureCompatibilityKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMicromapCompatibilityEXT.html
        """
        return self._get_device_micromap_compatibility(
            device,
            Ptr(to=version_info).bitcast[MicromapVersionInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=compatibility).bitcast[AccelerationStructureCompatibilityKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_micromap_build_sizes(
        self,
        device: Device,
        build_type: AccelerationStructureBuildTypeKHR,
        build_info: MicromapBuildInfoEXT,
        mut size_info: MicromapBuildSizesInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMicromapBuildSizesEXT.html
        """
        return self._get_micromap_build_sizes(
            device,
            build_type,
            Ptr(to=build_info).bitcast[MicromapBuildInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=size_info).bitcast[MicromapBuildSizesInfoEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct PageableDeviceLocalMemory(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_device_memory_priority: def(
        device: Device, memory: DeviceMemory, priority: Float32
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_device_memory_priority = Ptr(to=get_device_proc_addr(
            device, "vkSetDeviceMemoryPriorityEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_device_memory_priority)]()[]

    def set_device_memory_priority(self, device: Device, memory: DeviceMemory, priority: Float32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDeviceMemoryPriorityEXT.html
        """
        return self._set_device_memory_priority(device, memory, priority)


struct ExtendedDynamicState3(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_depth_clamp_enable: def(
        command_buffer: CommandBuffer, depth_clamp_enable: Bool32
    ) thin abi("C")
    var _cmd_set_polygon_mode: def(
        command_buffer: CommandBuffer, polygon_mode: PolygonMode
    ) thin abi("C")
    var _cmd_set_rasterization_samples: def(
        command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ) thin abi("C")
    var _cmd_set_sample_mask: def(
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Optional[Ptr[SampleMask, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _cmd_set_alpha_to_coverage_enable: def(
        command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ) thin abi("C")
    var _cmd_set_alpha_to_one_enable: def(
        command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ) thin abi("C")
    var _cmd_set_logic_op_enable: def(
        command_buffer: CommandBuffer, logic_op_enable: Bool32
    ) thin abi("C")
    var _cmd_set_color_blend_enable: def(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_color_blend_equation: def(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_color_write_mask: def(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_tessellation_domain_origin: def(
        command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ) thin abi("C")
    var _cmd_set_rasterization_stream: def(
        command_buffer: CommandBuffer, rasterization_stream: UInt32
    ) thin abi("C")
    var _cmd_set_conservative_rasterization_mode: def(
        command_buffer: CommandBuffer, conservative_rasterization_mode: ConservativeRasterizationModeEXT
    ) thin abi("C")
    var _cmd_set_extra_primitive_overestimation_size: def(
        command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ) thin abi("C")
    var _cmd_set_depth_clip_enable: def(
        command_buffer: CommandBuffer, depth_clip_enable: Bool32
    ) thin abi("C")
    var _cmd_set_sample_locations_enable: def(
        command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ) thin abi("C")
    var _cmd_set_color_blend_advanced: def(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_provoking_vertex_mode: def(
        command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ) thin abi("C")
    var _cmd_set_line_rasterization_mode: def(
        command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ) thin abi("C")
    var _cmd_set_line_stipple_enable: def(
        command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ) thin abi("C")
    var _cmd_set_depth_clip_negative_one_to_one: def(
        command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ) thin abi("C")
    var _cmd_set_viewport_w_scaling_enable: def(
        command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ) thin abi("C")
    var _cmd_set_viewport_swizzle: def(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_coverage_to_color_enable: def(
        command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ) thin abi("C")
    var _cmd_set_coverage_to_color_location: def(
        command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ) thin abi("C")
    var _cmd_set_coverage_modulation_mode: def(
        command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ) thin abi("C")
    var _cmd_set_coverage_modulation_table_enable: def(
        command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ) thin abi("C")
    var _cmd_set_coverage_modulation_table: def(
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_shading_rate_image_enable: def(
        command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ) thin abi("C")
    var _cmd_set_representative_fragment_test_enable: def(
        command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ) thin abi("C")
    var _cmd_set_coverage_reduction_mode: def(
        command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_clamp_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clamp_enable)]()[]
        self._cmd_set_polygon_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPolygonModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_polygon_mode)]()[]
        self._cmd_set_rasterization_samples = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationSamplesEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterization_samples)]()[]
        self._cmd_set_sample_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleMaskEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_mask)]()[]
        self._cmd_set_alpha_to_coverage_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToCoverageEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_alpha_to_coverage_enable)]()[]
        self._cmd_set_alpha_to_one_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToOneEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_alpha_to_one_enable)]()[]
        self._cmd_set_logic_op_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_logic_op_enable)]()[]
        self._cmd_set_color_blend_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_enable)]()[]
        self._cmd_set_color_blend_equation = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEquationEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_equation)]()[]
        self._cmd_set_color_write_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorWriteMaskEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_write_mask)]()[]
        self._cmd_set_tessellation_domain_origin = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetTessellationDomainOriginEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_tessellation_domain_origin)]()[]
        self._cmd_set_rasterization_stream = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationStreamEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterization_stream)]()[]
        self._cmd_set_conservative_rasterization_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetConservativeRasterizationModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_conservative_rasterization_mode)]()[]
        self._cmd_set_extra_primitive_overestimation_size = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExtraPrimitiveOverestimationSizeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_extra_primitive_overestimation_size)]()[]
        self._cmd_set_depth_clip_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clip_enable)]()[]
        self._cmd_set_sample_locations_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleLocationsEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_locations_enable)]()[]
        self._cmd_set_color_blend_advanced = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendAdvancedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_advanced)]()[]
        self._cmd_set_provoking_vertex_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetProvokingVertexModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_provoking_vertex_mode)]()[]
        self._cmd_set_line_rasterization_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineRasterizationModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_rasterization_mode)]()[]
        self._cmd_set_line_stipple_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStippleEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_stipple_enable)]()[]
        self._cmd_set_depth_clip_negative_one_to_one = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipNegativeOneToOneEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clip_negative_one_to_one)]()[]
        self._cmd_set_viewport_w_scaling_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWScalingEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_w_scaling_enable)]()[]
        self._cmd_set_viewport_swizzle = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportSwizzleNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_swizzle)]()[]
        self._cmd_set_coverage_to_color_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_to_color_enable)]()[]
        self._cmd_set_coverage_to_color_location = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorLocationNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_to_color_location)]()[]
        self._cmd_set_coverage_modulation_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationModeNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_mode)]()[]
        self._cmd_set_coverage_modulation_table_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_table_enable)]()[]
        self._cmd_set_coverage_modulation_table = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_table)]()[]
        self._cmd_set_shading_rate_image_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetShadingRateImageEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_shading_rate_image_enable)]()[]
        self._cmd_set_representative_fragment_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRepresentativeFragmentTestEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_representative_fragment_test_enable)]()[]
        self._cmd_set_coverage_reduction_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageReductionModeNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_reduction_mode)]()[]

    def cmd_set_depth_clamp_enable(
        self, command_buffer: CommandBuffer, depth_clamp_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampEnableEXT.html
        """
        return self._cmd_set_depth_clamp_enable(command_buffer, depth_clamp_enable)

    def cmd_set_polygon_mode(self, command_buffer: CommandBuffer, polygon_mode: PolygonMode):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPolygonModeEXT.html
        """
        return self._cmd_set_polygon_mode(command_buffer, polygon_mode)

    def cmd_set_rasterization_samples(
        self, command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationSamplesEXT.html
        """
        return self._cmd_set_rasterization_samples(command_buffer, rasterization_samples)

    def cmd_set_sample_mask[p_sample_mask_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Optional[Ptr[SampleMask, p_sample_mask_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleMaskEXT.html
        """
        return self._cmd_set_sample_mask(
            command_buffer,
            samples,
            Ptr(to=p_sample_mask).bitcast[Optional[Ptr[SampleMask, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_set_alpha_to_coverage_enable(
        self, command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToCoverageEnableEXT.html
        """
        return self._cmd_set_alpha_to_coverage_enable(command_buffer, alpha_to_coverage_enable)

    def cmd_set_alpha_to_one_enable(
        self, command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToOneEnableEXT.html
        """
        return self._cmd_set_alpha_to_one_enable(command_buffer, alpha_to_one_enable)

    def cmd_set_logic_op_enable(self, command_buffer: CommandBuffer, logic_op_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEnableEXT.html
        """
        return self._cmd_set_logic_op_enable(command_buffer, logic_op_enable)

    def cmd_set_color_blend_enable[
        p_color_blend_enables_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, p_color_blend_enables_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendEnableEXT.html
        """
        return self._cmd_set_color_blend_enable(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_enables).bitcast[Ptr[Bool32, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_color_blend_equation[
        p_color_blend_equations_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT, p_color_blend_equations_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendEquationEXT.html
        """
        return self._cmd_set_color_blend_equation(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_equations).bitcast[Ptr[ColorBlendEquationEXT, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_color_write_mask[p_color_write_masks_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, p_color_write_masks_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorWriteMaskEXT.html
        """
        return self._cmd_set_color_write_mask(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_write_masks).bitcast[Ptr[ColorComponentFlags, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_tessellation_domain_origin(
        self, command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetTessellationDomainOriginEXT.html
        """
        return self._cmd_set_tessellation_domain_origin(command_buffer, domain_origin)

    def cmd_set_rasterization_stream(
        self, command_buffer: CommandBuffer, rasterization_stream: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationStreamEXT.html
        """
        return self._cmd_set_rasterization_stream(command_buffer, rasterization_stream)

    def cmd_set_conservative_rasterization_mode(
        self,
        command_buffer: CommandBuffer,
        conservative_rasterization_mode: ConservativeRasterizationModeEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetConservativeRasterizationModeEXT.html
        """
        return self._cmd_set_conservative_rasterization_mode(
            command_buffer, conservative_rasterization_mode
        )

    def cmd_set_extra_primitive_overestimation_size(
        self, command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExtraPrimitiveOverestimationSizeEXT.html
        """
        return self._cmd_set_extra_primitive_overestimation_size(
            command_buffer, extra_primitive_overestimation_size
        )

    def cmd_set_depth_clip_enable(self, command_buffer: CommandBuffer, depth_clip_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipEnableEXT.html
        """
        return self._cmd_set_depth_clip_enable(command_buffer, depth_clip_enable)

    def cmd_set_sample_locations_enable(
        self, command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEnableEXT.html
        """
        return self._cmd_set_sample_locations_enable(command_buffer, sample_locations_enable)

    def cmd_set_color_blend_advanced[
        p_color_blend_advanced_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT, p_color_blend_advanced_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendAdvancedEXT.html
        """
        return self._cmd_set_color_blend_advanced(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_advanced).bitcast[Ptr[ColorBlendAdvancedEXT, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_provoking_vertex_mode(
        self, command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetProvokingVertexModeEXT.html
        """
        return self._cmd_set_provoking_vertex_mode(command_buffer, provoking_vertex_mode)

    def cmd_set_line_rasterization_mode(
        self, command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineRasterizationModeEXT.html
        """
        return self._cmd_set_line_rasterization_mode(command_buffer, line_rasterization_mode)

    def cmd_set_line_stipple_enable(
        self, command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStippleEnableEXT.html
        """
        return self._cmd_set_line_stipple_enable(command_buffer, stippled_line_enable)

    def cmd_set_depth_clip_negative_one_to_one(
        self, command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipNegativeOneToOneEXT.html
        """
        return self._cmd_set_depth_clip_negative_one_to_one(command_buffer, negative_one_to_one)

    def cmd_set_viewport_w_scaling_enable(
        self, command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingEnableNV.html
        """
        return self._cmd_set_viewport_w_scaling_enable(command_buffer, viewport_w_scaling_enable)

    def cmd_set_viewport_swizzle[p_viewport_swizzles_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, p_viewport_swizzles_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportSwizzleNV.html
        """
        return self._cmd_set_viewport_swizzle(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_viewport_swizzles).bitcast[Ptr[ViewportSwizzleNV, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_coverage_to_color_enable(
        self, command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorEnableNV.html
        """
        return self._cmd_set_coverage_to_color_enable(command_buffer, coverage_to_color_enable)

    def cmd_set_coverage_to_color_location(
        self, command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorLocationNV.html
        """
        return self._cmd_set_coverage_to_color_location(command_buffer, coverage_to_color_location)

    def cmd_set_coverage_modulation_mode(
        self, command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationModeNV.html
        """
        return self._cmd_set_coverage_modulation_mode(command_buffer, coverage_modulation_mode)

    def cmd_set_coverage_modulation_table_enable(
        self, command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableEnableNV.html
        """
        return self._cmd_set_coverage_modulation_table_enable(
            command_buffer, coverage_modulation_table_enable
        )

    def cmd_set_coverage_modulation_table[
        p_coverage_modulation_table_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, p_coverage_modulation_table_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableNV.html
        """
        return self._cmd_set_coverage_modulation_table(
            command_buffer,
            coverage_modulation_table_count,
            Ptr(to=p_coverage_modulation_table).bitcast[Ptr[Float32, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_shading_rate_image_enable(
        self, command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetShadingRateImageEnableNV.html
        """
        return self._cmd_set_shading_rate_image_enable(command_buffer, shading_rate_image_enable)

    def cmd_set_representative_fragment_test_enable(
        self, command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRepresentativeFragmentTestEnableNV.html
        """
        return self._cmd_set_representative_fragment_test_enable(
            command_buffer, representative_fragment_test_enable
        )

    def cmd_set_coverage_reduction_mode(
        self, command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageReductionModeNV.html
        """
        return self._cmd_set_coverage_reduction_mode(command_buffer, coverage_reduction_mode)


struct ShaderModuleIdentifier(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_shader_module_identifier: def(
        device: Device,
        shader_module: ShaderModule,
        p_identifier: Ptr[ShaderModuleIdentifierEXT, MutUntrackedOrigin],
    ) thin abi("C")
    var _get_shader_module_create_info_identifier: def(
        device: Device,
        p_create_info: Ptr[ShaderModuleCreateInfo, ImmutUntrackedOrigin],
        p_identifier: Ptr[ShaderModuleIdentifierEXT, MutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_shader_module_identifier = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderModuleIdentifierEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_shader_module_identifier)]()[]
        self._get_shader_module_create_info_identifier = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderModuleCreateInfoIdentifierEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_shader_module_create_info_identifier)]()[]

    def get_shader_module_identifier(
        self, device: Device, shader_module: ShaderModule, mut identifier: ShaderModuleIdentifierEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderModuleIdentifierEXT.html
        """
        return self._get_shader_module_identifier(
            device,
            shader_module,
            Ptr(to=identifier).bitcast[ShaderModuleIdentifierEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_shader_module_create_info_identifier(
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        mut identifier: ShaderModuleIdentifierEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderModuleCreateInfoIdentifierEXT.html
        """
        return self._get_shader_module_create_info_identifier(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=identifier).bitcast[ShaderModuleIdentifierEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct ShaderObject(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_shaders: def(
        device: Device,
        create_info_count: UInt32,
        p_create_infos: Ptr[ShaderCreateInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_shaders: Ptr[ShaderEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_shader: def(
        device: Device,
        shader: ShaderEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _get_shader_binary_data: def(
        device: Device,
        shader: ShaderEXT,
        p_data_size: Ptr[UInt, MutUntrackedOrigin],
        p_data: Optional[Ptr[NoneType, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _cmd_bind_shaders: def(
        command_buffer: CommandBuffer,
        stage_count: UInt32,
        p_stages: Ptr[ShaderStageFlagBits, ImmutUntrackedOrigin],
        p_shaders: Ptr[ShaderEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_cull_mode: def(command_buffer: CommandBuffer, cull_mode: CullModeFlags) thin abi("C")
    var _cmd_set_front_face: def(command_buffer: CommandBuffer, front_face: FrontFace) thin abi("C")
    var _cmd_set_primitive_topology: def(
        command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ) thin abi("C")
    var _cmd_set_viewport_with_count: def(
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_scissor_with_count: def(
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_bind_vertex_buffers_2: def(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutUntrackedOrigin],
        p_offsets: Ptr[DeviceSize, ImmutUntrackedOrigin],
        p_sizes: Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]],
        p_strides: Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _cmd_set_depth_test_enable: def(
        command_buffer: CommandBuffer, depth_test_enable: Bool32
    ) thin abi("C")
    var _cmd_set_depth_write_enable: def(
        command_buffer: CommandBuffer, depth_write_enable: Bool32
    ) thin abi("C")
    var _cmd_set_depth_compare_op: def(
        command_buffer: CommandBuffer, depth_compare_op: CompareOp
    ) thin abi("C")
    var _cmd_set_depth_bounds_test_enable: def(
        command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ) thin abi("C")
    var _cmd_set_stencil_test_enable: def(
        command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ) thin abi("C")
    var _cmd_set_stencil_op: def(
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    ) thin abi("C")
    var _cmd_set_vertex_input: def(
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT, ImmutUntrackedOrigin],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_patch_control_points: def(
        command_buffer: CommandBuffer, patch_control_points: UInt32
    ) thin abi("C")
    var _cmd_set_rasterizer_discard_enable: def(
        command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ) thin abi("C")
    var _cmd_set_depth_bias_enable: def(
        command_buffer: CommandBuffer, depth_bias_enable: Bool32
    ) thin abi("C")
    var _cmd_set_logic_op: def(command_buffer: CommandBuffer, logic_op: LogicOp) thin abi("C")
    var _cmd_set_primitive_restart_enable: def(
        command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ) thin abi("C")
    var _cmd_set_tessellation_domain_origin: def(
        command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ) thin abi("C")
    var _cmd_set_depth_clamp_enable: def(
        command_buffer: CommandBuffer, depth_clamp_enable: Bool32
    ) thin abi("C")
    var _cmd_set_polygon_mode: def(
        command_buffer: CommandBuffer, polygon_mode: PolygonMode
    ) thin abi("C")
    var _cmd_set_rasterization_samples: def(
        command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ) thin abi("C")
    var _cmd_set_sample_mask: def(
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Optional[Ptr[SampleMask, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _cmd_set_alpha_to_coverage_enable: def(
        command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ) thin abi("C")
    var _cmd_set_alpha_to_one_enable: def(
        command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ) thin abi("C")
    var _cmd_set_logic_op_enable: def(
        command_buffer: CommandBuffer, logic_op_enable: Bool32
    ) thin abi("C")
    var _cmd_set_color_blend_enable: def(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_color_blend_equation: def(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_color_write_mask: def(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_rasterization_stream: def(
        command_buffer: CommandBuffer, rasterization_stream: UInt32
    ) thin abi("C")
    var _cmd_set_conservative_rasterization_mode: def(
        command_buffer: CommandBuffer, conservative_rasterization_mode: ConservativeRasterizationModeEXT
    ) thin abi("C")
    var _cmd_set_extra_primitive_overestimation_size: def(
        command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ) thin abi("C")
    var _cmd_set_depth_clip_enable: def(
        command_buffer: CommandBuffer, depth_clip_enable: Bool32
    ) thin abi("C")
    var _cmd_set_sample_locations_enable: def(
        command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ) thin abi("C")
    var _cmd_set_color_blend_advanced: def(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_provoking_vertex_mode: def(
        command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ) thin abi("C")
    var _cmd_set_line_rasterization_mode: def(
        command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ) thin abi("C")
    var _cmd_set_line_stipple_enable: def(
        command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ) thin abi("C")
    var _cmd_set_depth_clip_negative_one_to_one: def(
        command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ) thin abi("C")
    var _cmd_set_viewport_w_scaling_enable: def(
        command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ) thin abi("C")
    var _cmd_set_viewport_swizzle: def(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_coverage_to_color_enable: def(
        command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ) thin abi("C")
    var _cmd_set_coverage_to_color_location: def(
        command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ) thin abi("C")
    var _cmd_set_coverage_modulation_mode: def(
        command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ) thin abi("C")
    var _cmd_set_coverage_modulation_table_enable: def(
        command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ) thin abi("C")
    var _cmd_set_coverage_modulation_table: def(
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_shading_rate_image_enable: def(
        command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ) thin abi("C")
    var _cmd_set_representative_fragment_test_enable: def(
        command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ) thin abi("C")
    var _cmd_set_coverage_reduction_mode: def(
        command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ) thin abi("C")
    var _cmd_set_depth_clamp_range: def(
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Optional[Ptr[DepthClampRangeEXT, ImmutUntrackedOrigin]],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_shaders = Ptr(to=get_device_proc_addr(
            device, "vkCreateShadersEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_shaders)]()[]
        self._destroy_shader = Ptr(to=get_device_proc_addr(
            device, "vkDestroyShaderEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_shader)]()[]
        self._get_shader_binary_data = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderBinaryDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_shader_binary_data)]()[]
        self._cmd_bind_shaders = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindShadersEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_shaders)]()[]
        self._cmd_set_cull_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCullMode".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_cull_mode)]()[]
        self._cmd_set_front_face = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFrontFace".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_front_face)]()[]
        self._cmd_set_primitive_topology = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveTopology".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_primitive_topology)]()[]
        self._cmd_set_viewport_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWithCount".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_with_count)]()[]
        self._cmd_set_scissor_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetScissorWithCount".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_scissor_with_count)]()[]
        self._cmd_bind_vertex_buffers_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindVertexBuffers2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_vertex_buffers_2)]()[]
        self._cmd_set_depth_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthTestEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_test_enable)]()[]
        self._cmd_set_depth_write_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthWriteEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_write_enable)]()[]
        self._cmd_set_depth_compare_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthCompareOp".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_compare_op)]()[]
        self._cmd_set_depth_bounds_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBoundsTestEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_bounds_test_enable)]()[]
        self._cmd_set_stencil_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilTestEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_stencil_test_enable)]()[]
        self._cmd_set_stencil_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilOp".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_stencil_op)]()[]
        self._cmd_set_vertex_input = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetVertexInputEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_vertex_input)]()[]
        self._cmd_set_patch_control_points = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPatchControlPointsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_patch_control_points)]()[]
        self._cmd_set_rasterizer_discard_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizerDiscardEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterizer_discard_enable)]()[]
        self._cmd_set_depth_bias_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBiasEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_bias_enable)]()[]
        self._cmd_set_logic_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_logic_op)]()[]
        self._cmd_set_primitive_restart_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveRestartEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_primitive_restart_enable)]()[]
        self._cmd_set_tessellation_domain_origin = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetTessellationDomainOriginEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_tessellation_domain_origin)]()[]
        self._cmd_set_depth_clamp_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clamp_enable)]()[]
        self._cmd_set_polygon_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPolygonModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_polygon_mode)]()[]
        self._cmd_set_rasterization_samples = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationSamplesEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterization_samples)]()[]
        self._cmd_set_sample_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleMaskEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_mask)]()[]
        self._cmd_set_alpha_to_coverage_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToCoverageEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_alpha_to_coverage_enable)]()[]
        self._cmd_set_alpha_to_one_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToOneEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_alpha_to_one_enable)]()[]
        self._cmd_set_logic_op_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_logic_op_enable)]()[]
        self._cmd_set_color_blend_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_enable)]()[]
        self._cmd_set_color_blend_equation = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEquationEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_equation)]()[]
        self._cmd_set_color_write_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorWriteMaskEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_write_mask)]()[]
        self._cmd_set_rasterization_stream = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationStreamEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterization_stream)]()[]
        self._cmd_set_conservative_rasterization_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetConservativeRasterizationModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_conservative_rasterization_mode)]()[]
        self._cmd_set_extra_primitive_overestimation_size = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExtraPrimitiveOverestimationSizeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_extra_primitive_overestimation_size)]()[]
        self._cmd_set_depth_clip_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clip_enable)]()[]
        self._cmd_set_sample_locations_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleLocationsEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_locations_enable)]()[]
        self._cmd_set_color_blend_advanced = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendAdvancedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_advanced)]()[]
        self._cmd_set_provoking_vertex_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetProvokingVertexModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_provoking_vertex_mode)]()[]
        self._cmd_set_line_rasterization_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineRasterizationModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_rasterization_mode)]()[]
        self._cmd_set_line_stipple_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStippleEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_stipple_enable)]()[]
        self._cmd_set_depth_clip_negative_one_to_one = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipNegativeOneToOneEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clip_negative_one_to_one)]()[]
        self._cmd_set_viewport_w_scaling_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWScalingEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_w_scaling_enable)]()[]
        self._cmd_set_viewport_swizzle = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportSwizzleNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_swizzle)]()[]
        self._cmd_set_coverage_to_color_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_to_color_enable)]()[]
        self._cmd_set_coverage_to_color_location = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorLocationNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_to_color_location)]()[]
        self._cmd_set_coverage_modulation_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationModeNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_mode)]()[]
        self._cmd_set_coverage_modulation_table_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_table_enable)]()[]
        self._cmd_set_coverage_modulation_table = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_table)]()[]
        self._cmd_set_shading_rate_image_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetShadingRateImageEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_shading_rate_image_enable)]()[]
        self._cmd_set_representative_fragment_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRepresentativeFragmentTestEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_representative_fragment_test_enable)]()[]
        self._cmd_set_coverage_reduction_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageReductionModeNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_reduction_mode)]()[]
        self._cmd_set_depth_clamp_range = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampRangeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clamp_range)]()[]

    def create_shaders[
        p_create_infos_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_shaders_origin: MutOrigin = MutUntrackedOrigin,
    ](
        self,
        device: Device,
        create_info_count: UInt32,
        p_create_infos: Ptr[ShaderCreateInfoEXT, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_shaders: Ptr[ShaderEXT, p_shaders_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShadersEXT.html
        """
        return self._create_shaders(
            device,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[ShaderCreateInfoEXT, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_shaders).bitcast[Ptr[ShaderEXT, MutUntrackedOrigin]]()[],
        )

    def destroy_shader[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        shader: ShaderEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderEXT.html
        """
        return self._destroy_shader(
            device,
            shader,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_shader_binary_data[p_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        shader: ShaderEXT,
        mut data_size: UInt,
        p_data: Optional[Ptr[NoneType, p_data_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderBinaryDataEXT.html
        """
        return self._get_shader_binary_data(
            device,
            shader,
            Ptr(to=data_size).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Optional[Ptr[NoneType, MutUntrackedOrigin]]]()[],
        )

    def get_shader_binary_data[p_data_origin: MutOrigin = MutUntrackedOrigin](
        self, device: Device, shader: ShaderEXT
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderBinaryDataEXT.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_shader_binary_data(
                device,
                shader,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[NoneType, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_shader_binary_data(
                    device,
                    shader,
                    Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().bitcast[NoneType]().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)

    def cmd_bind_shaders[
        p_stages_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_shaders_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        stage_count: UInt32,
        p_stages: Ptr[ShaderStageFlagBits, p_stages_origin],
        p_shaders: Ptr[ShaderEXT, p_shaders_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindShadersEXT.html
        """
        return self._cmd_bind_shaders(
            command_buffer,
            stage_count,
            Ptr(to=p_stages).bitcast[Ptr[ShaderStageFlagBits, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_shaders).bitcast[Ptr[ShaderEXT, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCullMode.html
        """
        return self._cmd_set_cull_mode(command_buffer, cull_mode)

    def cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFrontFace.html
        """
        return self._cmd_set_front_face(command_buffer, front_face)

    def cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveTopology.html
        """
        return self._cmd_set_primitive_topology(command_buffer, primitive_topology)

    def cmd_set_viewport_with_count[p_viewports_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWithCount.html
        """
        return self._cmd_set_viewport_with_count(
            command_buffer,
            viewport_count,
            Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_scissor_with_count[p_scissors_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissorWithCount.html
        """
        return self._cmd_set_scissor_with_count(
            command_buffer, scissor_count, Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[]
        )

    def cmd_bind_vertex_buffers_2[
        p_buffers_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_offsets_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_sizes_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_strides_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
        p_sizes: Optional[Ptr[DeviceSize, p_sizes_origin]],
        p_strides: Optional[Ptr[DeviceSize, p_strides_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers2.html
        """
        return self._cmd_bind_vertex_buffers_2(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_sizes).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_strides).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthTestEnable.html
        """
        return self._cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    def cmd_set_depth_write_enable(
        self, command_buffer: CommandBuffer, depth_write_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthWriteEnable.html
        """
        return self._cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    def cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthCompareOp.html
        """
        return self._cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    def cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBoundsTestEnable.html
        """
        return self._cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    def cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilTestEnable.html
        """
        return self._cmd_set_stencil_test_enable(command_buffer, stencil_test_enable)

    def cmd_set_stencil_op(
        self,
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilOp.html
        """
        return self._cmd_set_stencil_op(
            command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op
        )

    def cmd_set_vertex_input[
        p_vertex_binding_descriptions_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_vertex_attribute_descriptions_origin: ImmutOrigin = ImmutUntrackedOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT, p_vertex_binding_descriptions_origin],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT, p_vertex_attribute_descriptions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetVertexInputEXT.html
        """
        return self._cmd_set_vertex_input(
            command_buffer,
            vertex_binding_description_count,
            Ptr(to=p_vertex_binding_descriptions).bitcast[Ptr[VertexInputBindingDescription2EXT, ImmutUntrackedOrigin]]()[],
            vertex_attribute_description_count,
            Ptr(to=p_vertex_attribute_descriptions).bitcast[Ptr[VertexInputAttributeDescription2EXT, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_patch_control_points(
        self, command_buffer: CommandBuffer, patch_control_points: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPatchControlPointsEXT.html
        """
        return self._cmd_set_patch_control_points(command_buffer, patch_control_points)

    def cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizerDiscardEnable.html
        """
        return self._cmd_set_rasterizer_discard_enable(command_buffer, rasterizer_discard_enable)

    def cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBiasEnable.html
        """
        return self._cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    def cmd_set_logic_op(self, command_buffer: CommandBuffer, logic_op: LogicOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEXT.html
        """
        return self._cmd_set_logic_op(command_buffer, logic_op)

    def cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)

    def cmd_set_tessellation_domain_origin(
        self, command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetTessellationDomainOriginEXT.html
        """
        return self._cmd_set_tessellation_domain_origin(command_buffer, domain_origin)

    def cmd_set_depth_clamp_enable(
        self, command_buffer: CommandBuffer, depth_clamp_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampEnableEXT.html
        """
        return self._cmd_set_depth_clamp_enable(command_buffer, depth_clamp_enable)

    def cmd_set_polygon_mode(self, command_buffer: CommandBuffer, polygon_mode: PolygonMode):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPolygonModeEXT.html
        """
        return self._cmd_set_polygon_mode(command_buffer, polygon_mode)

    def cmd_set_rasterization_samples(
        self, command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationSamplesEXT.html
        """
        return self._cmd_set_rasterization_samples(command_buffer, rasterization_samples)

    def cmd_set_sample_mask[p_sample_mask_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Optional[Ptr[SampleMask, p_sample_mask_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleMaskEXT.html
        """
        return self._cmd_set_sample_mask(
            command_buffer,
            samples,
            Ptr(to=p_sample_mask).bitcast[Optional[Ptr[SampleMask, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_set_alpha_to_coverage_enable(
        self, command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToCoverageEnableEXT.html
        """
        return self._cmd_set_alpha_to_coverage_enable(command_buffer, alpha_to_coverage_enable)

    def cmd_set_alpha_to_one_enable(
        self, command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToOneEnableEXT.html
        """
        return self._cmd_set_alpha_to_one_enable(command_buffer, alpha_to_one_enable)

    def cmd_set_logic_op_enable(self, command_buffer: CommandBuffer, logic_op_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEnableEXT.html
        """
        return self._cmd_set_logic_op_enable(command_buffer, logic_op_enable)

    def cmd_set_color_blend_enable[
        p_color_blend_enables_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, p_color_blend_enables_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendEnableEXT.html
        """
        return self._cmd_set_color_blend_enable(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_enables).bitcast[Ptr[Bool32, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_color_blend_equation[
        p_color_blend_equations_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT, p_color_blend_equations_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendEquationEXT.html
        """
        return self._cmd_set_color_blend_equation(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_equations).bitcast[Ptr[ColorBlendEquationEXT, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_color_write_mask[p_color_write_masks_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, p_color_write_masks_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorWriteMaskEXT.html
        """
        return self._cmd_set_color_write_mask(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_write_masks).bitcast[Ptr[ColorComponentFlags, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_rasterization_stream(
        self, command_buffer: CommandBuffer, rasterization_stream: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationStreamEXT.html
        """
        return self._cmd_set_rasterization_stream(command_buffer, rasterization_stream)

    def cmd_set_conservative_rasterization_mode(
        self,
        command_buffer: CommandBuffer,
        conservative_rasterization_mode: ConservativeRasterizationModeEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetConservativeRasterizationModeEXT.html
        """
        return self._cmd_set_conservative_rasterization_mode(
            command_buffer, conservative_rasterization_mode
        )

    def cmd_set_extra_primitive_overestimation_size(
        self, command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExtraPrimitiveOverestimationSizeEXT.html
        """
        return self._cmd_set_extra_primitive_overestimation_size(
            command_buffer, extra_primitive_overestimation_size
        )

    def cmd_set_depth_clip_enable(self, command_buffer: CommandBuffer, depth_clip_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipEnableEXT.html
        """
        return self._cmd_set_depth_clip_enable(command_buffer, depth_clip_enable)

    def cmd_set_sample_locations_enable(
        self, command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEnableEXT.html
        """
        return self._cmd_set_sample_locations_enable(command_buffer, sample_locations_enable)

    def cmd_set_color_blend_advanced[
        p_color_blend_advanced_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT, p_color_blend_advanced_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendAdvancedEXT.html
        """
        return self._cmd_set_color_blend_advanced(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_advanced).bitcast[Ptr[ColorBlendAdvancedEXT, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_provoking_vertex_mode(
        self, command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetProvokingVertexModeEXT.html
        """
        return self._cmd_set_provoking_vertex_mode(command_buffer, provoking_vertex_mode)

    def cmd_set_line_rasterization_mode(
        self, command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineRasterizationModeEXT.html
        """
        return self._cmd_set_line_rasterization_mode(command_buffer, line_rasterization_mode)

    def cmd_set_line_stipple_enable(
        self, command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStippleEnableEXT.html
        """
        return self._cmd_set_line_stipple_enable(command_buffer, stippled_line_enable)

    def cmd_set_depth_clip_negative_one_to_one(
        self, command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipNegativeOneToOneEXT.html
        """
        return self._cmd_set_depth_clip_negative_one_to_one(command_buffer, negative_one_to_one)

    def cmd_set_viewport_w_scaling_enable(
        self, command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingEnableNV.html
        """
        return self._cmd_set_viewport_w_scaling_enable(command_buffer, viewport_w_scaling_enable)

    def cmd_set_viewport_swizzle[p_viewport_swizzles_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, p_viewport_swizzles_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportSwizzleNV.html
        """
        return self._cmd_set_viewport_swizzle(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_viewport_swizzles).bitcast[Ptr[ViewportSwizzleNV, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_coverage_to_color_enable(
        self, command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorEnableNV.html
        """
        return self._cmd_set_coverage_to_color_enable(command_buffer, coverage_to_color_enable)

    def cmd_set_coverage_to_color_location(
        self, command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorLocationNV.html
        """
        return self._cmd_set_coverage_to_color_location(command_buffer, coverage_to_color_location)

    def cmd_set_coverage_modulation_mode(
        self, command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationModeNV.html
        """
        return self._cmd_set_coverage_modulation_mode(command_buffer, coverage_modulation_mode)

    def cmd_set_coverage_modulation_table_enable(
        self, command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableEnableNV.html
        """
        return self._cmd_set_coverage_modulation_table_enable(
            command_buffer, coverage_modulation_table_enable
        )

    def cmd_set_coverage_modulation_table[
        p_coverage_modulation_table_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, p_coverage_modulation_table_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableNV.html
        """
        return self._cmd_set_coverage_modulation_table(
            command_buffer,
            coverage_modulation_table_count,
            Ptr(to=p_coverage_modulation_table).bitcast[Ptr[Float32, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_shading_rate_image_enable(
        self, command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetShadingRateImageEnableNV.html
        """
        return self._cmd_set_shading_rate_image_enable(command_buffer, shading_rate_image_enable)

    def cmd_set_representative_fragment_test_enable(
        self, command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRepresentativeFragmentTestEnableNV.html
        """
        return self._cmd_set_representative_fragment_test_enable(
            command_buffer, representative_fragment_test_enable
        )

    def cmd_set_coverage_reduction_mode(
        self, command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageReductionModeNV.html
        """
        return self._cmd_set_coverage_reduction_mode(command_buffer, coverage_reduction_mode)

    def cmd_set_depth_clamp_range[p_depth_clamp_range_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Optional[Ptr[DepthClampRangeEXT, p_depth_clamp_range_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampRangeEXT.html
        """
        return self._cmd_set_depth_clamp_range(
            command_buffer,
            depth_clamp_mode,
            Ptr(to=p_depth_clamp_range).bitcast[Optional[Ptr[DepthClampRangeEXT, ImmutUntrackedOrigin]]]()[],
        )


struct AttachmentFeedbackLoopDynamicState(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_attachment_feedback_loop_enable: def(
        command_buffer: CommandBuffer, aspect_mask: ImageAspectFlags
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_attachment_feedback_loop_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAttachmentFeedbackLoopEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_attachment_feedback_loop_enable)]()[]

    def cmd_set_attachment_feedback_loop_enable(
        self, command_buffer: CommandBuffer, aspect_mask: ImageAspectFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAttachmentFeedbackLoopEnableEXT.html
        """
        return self._cmd_set_attachment_feedback_loop_enable(command_buffer, aspect_mask)


struct MemoryDecompression(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_decompress_memory: def(
        command_buffer: CommandBuffer,
        p_decompress_memory_info_ext: Ptr[DecompressMemoryInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_decompress_memory_indirect_count: def(
        command_buffer: CommandBuffer,
        decompression_method: MemoryDecompressionMethodFlagsEXT,
        indirect_commands_address: DeviceAddress,
        indirect_commands_count_address: DeviceAddress,
        max_decompression_count: UInt32,
        stride: UInt32,
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_decompress_memory = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_decompress_memory)]()[]
        self._cmd_decompress_memory_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryIndirectCountEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_decompress_memory_indirect_count)]()[]

    def cmd_decompress_memory(
        self, command_buffer: CommandBuffer, decompress_memory_info_ext: DecompressMemoryInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecompressMemoryEXT.html
        """
        return self._cmd_decompress_memory(
            command_buffer,
            Ptr(to=decompress_memory_info_ext).bitcast[DecompressMemoryInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_decompress_memory_indirect_count(
        self,
        command_buffer: CommandBuffer,
        decompression_method: MemoryDecompressionMethodFlagsEXT,
        indirect_commands_address: DeviceAddress,
        indirect_commands_count_address: DeviceAddress,
        max_decompression_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecompressMemoryIndirectCountEXT.html
        """
        return self._cmd_decompress_memory_indirect_count(
            command_buffer,
            decompression_method,
            indirect_commands_address,
            indirect_commands_count_address,
            max_decompression_count,
            stride,
        )


struct DeviceGeneratedCommands(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_generated_commands_memory_requirements: def(
        device: Device,
        p_info: Ptr[GeneratedCommandsMemoryRequirementsInfoEXT, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_preprocess_generated_commands: def(
        command_buffer: CommandBuffer,
        p_generated_commands_info: Ptr[GeneratedCommandsInfoEXT, ImmutUntrackedOrigin],
        state_command_buffer: CommandBuffer,
    ) thin abi("C")
    var _cmd_execute_generated_commands: def(
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        p_generated_commands_info: Ptr[GeneratedCommandsInfoEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _create_indirect_commands_layout: def(
        device: Device,
        p_create_info: Ptr[IndirectCommandsLayoutCreateInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_indirect_commands_layout: Ptr[IndirectCommandsLayoutEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_indirect_commands_layout: def(
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _create_indirect_execution_set: def(
        device: Device,
        p_create_info: Ptr[IndirectExecutionSetCreateInfoEXT, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_indirect_execution_set: Ptr[IndirectExecutionSetEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_indirect_execution_set: def(
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _update_indirect_execution_set_pipeline: def(
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetPipelineEXT, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _update_indirect_execution_set_shader: def(
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetShaderEXT, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_generated_commands_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetGeneratedCommandsMemoryRequirementsEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_generated_commands_memory_requirements)]()[]
        self._cmd_preprocess_generated_commands = Ptr(to=get_device_proc_addr(
            device, "vkCmdPreprocessGeneratedCommandsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_preprocess_generated_commands)]()[]
        self._cmd_execute_generated_commands = Ptr(to=get_device_proc_addr(
            device, "vkCmdExecuteGeneratedCommandsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_execute_generated_commands)]()[]
        self._create_indirect_commands_layout = Ptr(to=get_device_proc_addr(
            device, "vkCreateIndirectCommandsLayoutEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_indirect_commands_layout)]()[]
        self._destroy_indirect_commands_layout = Ptr(to=get_device_proc_addr(
            device, "vkDestroyIndirectCommandsLayoutEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_indirect_commands_layout)]()[]
        self._create_indirect_execution_set = Ptr(to=get_device_proc_addr(
            device, "vkCreateIndirectExecutionSetEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_indirect_execution_set)]()[]
        self._destroy_indirect_execution_set = Ptr(to=get_device_proc_addr(
            device, "vkDestroyIndirectExecutionSetEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_indirect_execution_set)]()[]
        self._update_indirect_execution_set_pipeline = Ptr(to=get_device_proc_addr(
            device, "vkUpdateIndirectExecutionSetPipelineEXT".as_c_string_slice()
        )).bitcast[type_of(self._update_indirect_execution_set_pipeline)]()[]
        self._update_indirect_execution_set_shader = Ptr(to=get_device_proc_addr(
            device, "vkUpdateIndirectExecutionSetShaderEXT".as_c_string_slice()
        )).bitcast[type_of(self._update_indirect_execution_set_shader)]()[]

    def get_generated_commands_memory_requirements(
        self,
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoEXT,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetGeneratedCommandsMemoryRequirementsEXT.html
        """
        return self._get_generated_commands_memory_requirements(
            device,
            Ptr(to=info).bitcast[GeneratedCommandsMemoryRequirementsInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_preprocess_generated_commands(
        self,
        command_buffer: CommandBuffer,
        generated_commands_info: GeneratedCommandsInfoEXT,
        state_command_buffer: CommandBuffer,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPreprocessGeneratedCommandsEXT.html
        """
        return self._cmd_preprocess_generated_commands(
            command_buffer,
            Ptr(to=generated_commands_info).bitcast[GeneratedCommandsInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            state_command_buffer,
        )

    def cmd_execute_generated_commands(
        self,
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        generated_commands_info: GeneratedCommandsInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteGeneratedCommandsEXT.html
        """
        return self._cmd_execute_generated_commands(
            command_buffer,
            is_preprocessed,
            Ptr(to=generated_commands_info).bitcast[GeneratedCommandsInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def create_indirect_commands_layout[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut indirect_commands_layout: IndirectCommandsLayoutEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectCommandsLayoutEXT.html
        """
        return self._create_indirect_commands_layout(
            device,
            Ptr(to=create_info).bitcast[IndirectCommandsLayoutCreateInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=indirect_commands_layout).bitcast[IndirectCommandsLayoutEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_indirect_commands_layout[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectCommandsLayoutEXT.html
        """
        return self._destroy_indirect_commands_layout(
            device,
            indirect_commands_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_indirect_execution_set[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: IndirectExecutionSetCreateInfoEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut indirect_execution_set: IndirectExecutionSetEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectExecutionSetEXT.html
        """
        return self._create_indirect_execution_set(
            device,
            Ptr(to=create_info).bitcast[IndirectExecutionSetCreateInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=indirect_execution_set).bitcast[IndirectExecutionSetEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_indirect_execution_set[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectExecutionSetEXT.html
        """
        return self._destroy_indirect_execution_set(
            device,
            indirect_execution_set,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def update_indirect_execution_set_pipeline[
        p_execution_set_writes_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetPipelineEXT, p_execution_set_writes_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateIndirectExecutionSetPipelineEXT.html
        """
        return self._update_indirect_execution_set_pipeline(
            device,
            indirect_execution_set,
            execution_set_write_count,
            Ptr(to=p_execution_set_writes).bitcast[Ptr[WriteIndirectExecutionSetPipelineEXT, ImmutUntrackedOrigin]]()[],
        )

    def update_indirect_execution_set_shader[
        p_execution_set_writes_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetShaderEXT, p_execution_set_writes_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateIndirectExecutionSetShaderEXT.html
        """
        return self._update_indirect_execution_set_shader(
            device,
            indirect_execution_set,
            execution_set_write_count,
            Ptr(to=p_execution_set_writes).bitcast[Ptr[WriteIndirectExecutionSetShaderEXT, ImmutUntrackedOrigin]]()[],
        )


struct DepthClampControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_depth_clamp_range: def(
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Optional[Ptr[DepthClampRangeEXT, ImmutUntrackedOrigin]],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_clamp_range = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampRangeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clamp_range)]()[]

    def cmd_set_depth_clamp_range[p_depth_clamp_range_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Optional[Ptr[DepthClampRangeEXT, p_depth_clamp_range_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampRangeEXT.html
        """
        return self._cmd_set_depth_clamp_range(
            command_buffer,
            depth_clamp_mode,
            Ptr(to=p_depth_clamp_range).bitcast[Optional[Ptr[DepthClampRangeEXT, ImmutUntrackedOrigin]]]()[],
        )


struct ExternalMemoryMetal(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_metal_handle: def(
        device: Device,
        p_get_metal_handle_info: Ptr[MemoryGetMetalHandleInfoEXT, ImmutUntrackedOrigin],
        p_handle: Ptr[Ptr[NoneType, MutUntrackedOrigin], MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_memory_metal_handle_properties: def(
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        p_handle: Ptr[NoneType, ImmutUntrackedOrigin],
        p_memory_metal_handle_properties: Ptr[MemoryMetalHandlePropertiesEXT, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_metal_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryMetalHandleEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_metal_handle)]()[]
        self._get_memory_metal_handle_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryMetalHandlePropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_metal_handle_properties)]()[]

    def get_memory_metal_handle[handle_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        get_metal_handle_info: MemoryGetMetalHandleInfoEXT,
        mut handle: Ptr[NoneType, handle_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryMetalHandleEXT.html
        """
        return self._get_memory_metal_handle(
            device,
            Ptr(to=get_metal_handle_info).bitcast[MemoryGetMetalHandleInfoEXT]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=handle).bitcast[Ptr[NoneType, MutUntrackedOrigin]]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_memory_metal_handle_properties[p_handle_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        p_handle: Ptr[NoneType, p_handle_origin],
        mut memory_metal_handle_properties: MemoryMetalHandlePropertiesEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryMetalHandlePropertiesEXT.html
        """
        return self._get_memory_metal_handle_properties(
            device,
            handle_type,
            Ptr(to=p_handle).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
            Ptr(to=memory_metal_handle_properties).bitcast[MemoryMetalHandlePropertiesEXT]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct FragmentDensityMapOffset(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_end_rendering_2: def(
        command_buffer: CommandBuffer,
        p_rendering_end_info: Optional[Ptr[RenderingEndInfoKHR, ImmutUntrackedOrigin]],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_end_rendering_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRendering2KHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_rendering_2)]()[]

    def cmd_end_rendering_2[p_rendering_end_info_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        p_rendering_end_info: Optional[Ptr[RenderingEndInfoKHR, p_rendering_end_info_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering2KHR.html
        """
        return self._cmd_end_rendering_2(
            command_buffer,
            Ptr(to=p_rendering_end_info).bitcast[Optional[Ptr[RenderingEndInfoKHR, ImmutUntrackedOrigin]]]()[],
        )


struct CustomResolve(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_begin_custom_resolve: def(
        command_buffer: CommandBuffer,
        p_begin_custom_resolve_info: Optional[Ptr[BeginCustomResolveInfoEXT, ImmutUntrackedOrigin]],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_begin_custom_resolve = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginCustomResolveEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_custom_resolve)]()[]

    def cmd_begin_custom_resolve[
        p_begin_custom_resolve_info_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        p_begin_custom_resolve_info: Optional[Ptr[BeginCustomResolveInfoEXT, p_begin_custom_resolve_info_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginCustomResolveEXT.html
        """
        return self._cmd_begin_custom_resolve(
            command_buffer,
            Ptr(to=p_begin_custom_resolve_info).bitcast[Optional[Ptr[BeginCustomResolveInfoEXT, ImmutUntrackedOrigin]]]()[],
        )
