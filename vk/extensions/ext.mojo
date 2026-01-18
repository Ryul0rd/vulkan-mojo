from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct DebugReport(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_debug_report_callback_ext: fn(
        instance: Instance,
        p_create_info: Ptr[DebugReportCallbackCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_callback: Ptr[DebugReportCallbackEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_debug_report_callback_ext: fn(
        instance: Instance,
        callback: DebugReportCallbackEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _debug_report_message_ext: fn(
        instance: Instance,
        flags: DebugReportFlagsEXT,
        object_type: DebugReportObjectTypeEXT,
        object: UInt64,
        location: UInt,
        message_code: Int32,
        p_layer_prefix: CStringSlice[ImmutAnyOrigin],
        p_message: CStringSlice[ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_debug_report_callback_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDebugReportCallbackEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_debug_report_callback_ext)]()[]
        self._destroy_debug_report_callback_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroyDebugReportCallbackEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_debug_report_callback_ext)]()[]
        self._debug_report_message_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkDebugReportMessageEXT".as_c_string_slice()
        )).bitcast[type_of(self._debug_report_message_ext)]()[]

    fn create_debug_report_callback_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: DebugReportCallbackCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut callback: DebugReportCallbackEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDebugReportCallbackEXT.html
        """
        return self._create_debug_report_callback_ext(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=callback),
        )

    fn destroy_debug_report_callback_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        callback: DebugReportCallbackEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDebugReportCallbackEXT.html
        """
        return self._destroy_debug_report_callback_ext(
            instance, callback, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn debug_report_message_ext[
        p_layer_prefix_origin: ImmutOrigin = ImmutAnyOrigin,
        p_message_origin: ImmutOrigin = ImmutAnyOrigin,
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
        return self._debug_report_message_ext(
            instance,
            flags,
            object_type,
            object,
            location,
            message_code,
            Ptr(to=p_layer_prefix).bitcast[CStringSlice[ImmutAnyOrigin]]()[],
            Ptr(to=p_message).bitcast[CStringSlice[ImmutAnyOrigin]]()[],
        )


struct DebugMarker(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _debug_marker_set_object_tag_ext: fn(
        device: Device, p_tag_info: Ptr[DebugMarkerObjectTagInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _debug_marker_set_object_name_ext: fn(
        device: Device, p_name_info: Ptr[DebugMarkerObjectNameInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _cmd_debug_marker_begin_ext: fn(
        command_buffer: CommandBuffer, p_marker_info: Ptr[DebugMarkerMarkerInfoEXT, ImmutAnyOrigin]
    )
    var _cmd_debug_marker_end_ext: fn(command_buffer: CommandBuffer)
    var _cmd_debug_marker_insert_ext: fn(
        command_buffer: CommandBuffer, p_marker_info: Ptr[DebugMarkerMarkerInfoEXT, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._debug_marker_set_object_tag_ext = Ptr(to=get_device_proc_addr(
            device, "vkDebugMarkerSetObjectTagEXT".as_c_string_slice()
        )).bitcast[type_of(self._debug_marker_set_object_tag_ext)]()[]
        self._debug_marker_set_object_name_ext = Ptr(to=get_device_proc_addr(
            device, "vkDebugMarkerSetObjectNameEXT".as_c_string_slice()
        )).bitcast[type_of(self._debug_marker_set_object_name_ext)]()[]
        self._cmd_debug_marker_begin_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDebugMarkerBeginEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_debug_marker_begin_ext)]()[]
        self._cmd_debug_marker_end_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDebugMarkerEndEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_debug_marker_end_ext)]()[]
        self._cmd_debug_marker_insert_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDebugMarkerInsertEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_debug_marker_insert_ext)]()[]

    fn debug_marker_set_object_tag_ext(
        self, device: Device, tag_info: DebugMarkerObjectTagInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDebugMarkerSetObjectTagEXT.html
        """
        return self._debug_marker_set_object_tag_ext(device, Ptr(to=tag_info))

    fn debug_marker_set_object_name_ext(
        self, device: Device, name_info: DebugMarkerObjectNameInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDebugMarkerSetObjectNameEXT.html
        """
        return self._debug_marker_set_object_name_ext(device, Ptr(to=name_info))

    fn cmd_debug_marker_begin_ext(
        self, command_buffer: CommandBuffer, marker_info: DebugMarkerMarkerInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerBeginEXT.html
        """
        return self._cmd_debug_marker_begin_ext(command_buffer, Ptr(to=marker_info))

    fn cmd_debug_marker_end_ext(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerEndEXT.html
        """
        return self._cmd_debug_marker_end_ext(command_buffer)

    fn cmd_debug_marker_insert_ext(
        self, command_buffer: CommandBuffer, marker_info: DebugMarkerMarkerInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerInsertEXT.html
        """
        return self._cmd_debug_marker_insert_ext(command_buffer, Ptr(to=marker_info))


struct TransformFeedback(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_bind_transform_feedback_buffers_ext: fn(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
        p_sizes: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _cmd_begin_transform_feedback_ext: fn(
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_counter_buffer_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _cmd_end_transform_feedback_ext: fn(
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_counter_buffer_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _cmd_begin_query_indexed_ext: fn(
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
        index: UInt32,
    )
    var _cmd_end_query_indexed_ext: fn(
        command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32, index: UInt32
    )
    var _cmd_draw_indirect_byte_count_ext: fn(
        command_buffer: CommandBuffer,
        instance_count: UInt32,
        first_instance: UInt32,
        counter_buffer: Buffer,
        counter_buffer_offset: DeviceSize,
        counter_offset: UInt32,
        vertex_stride: UInt32,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_transform_feedback_buffers_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindTransformFeedbackBuffersEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_transform_feedback_buffers_ext)]()[]
        self._cmd_begin_transform_feedback_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginTransformFeedbackEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_transform_feedback_ext)]()[]
        self._cmd_end_transform_feedback_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndTransformFeedbackEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_transform_feedback_ext)]()[]
        self._cmd_begin_query_indexed_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginQueryIndexedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_query_indexed_ext)]()[]
        self._cmd_end_query_indexed_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndQueryIndexedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_query_indexed_ext)]()[]
        self._cmd_draw_indirect_byte_count_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirectByteCountEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_indirect_byte_count_ext)]()[]

    fn cmd_bind_transform_feedback_buffers_ext[
        p_buffers_origin: ImmutOrigin = ImmutAnyOrigin,
        p_offsets_origin: ImmutOrigin = ImmutAnyOrigin,
        p_sizes_origin: ImmutOrigin = ImmutAnyOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
        p_sizes: Ptr[DeviceSize, p_sizes_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindTransformFeedbackBuffersEXT.html
        """
        return self._cmd_bind_transform_feedback_buffers_ext(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutAnyOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
            Ptr(to=p_sizes).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
        )

    fn cmd_begin_transform_feedback_ext[
        p_counter_buffers_origin: ImmutOrigin = ImmutAnyOrigin,
        p_counter_buffer_offsets_origin: ImmutOrigin = ImmutAnyOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, p_counter_buffers_origin],
        p_counter_buffer_offsets: Ptr[DeviceSize, p_counter_buffer_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginTransformFeedbackEXT.html
        """
        return self._cmd_begin_transform_feedback_ext(
            command_buffer,
            first_counter_buffer,
            counter_buffer_count,
            Ptr(to=p_counter_buffers).bitcast[Ptr[Buffer, ImmutAnyOrigin]]()[],
            Ptr(to=p_counter_buffer_offsets).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
        )

    fn cmd_end_transform_feedback_ext[
        p_counter_buffers_origin: ImmutOrigin = ImmutAnyOrigin,
        p_counter_buffer_offsets_origin: ImmutOrigin = ImmutAnyOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, p_counter_buffers_origin],
        p_counter_buffer_offsets: Ptr[DeviceSize, p_counter_buffer_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndTransformFeedbackEXT.html
        """
        return self._cmd_end_transform_feedback_ext(
            command_buffer,
            first_counter_buffer,
            counter_buffer_count,
            Ptr(to=p_counter_buffers).bitcast[Ptr[Buffer, ImmutAnyOrigin]]()[],
            Ptr(to=p_counter_buffer_offsets).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
        )

    fn cmd_begin_query_indexed_ext(
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
        return self._cmd_begin_query_indexed_ext(command_buffer, query_pool, query, flags, index)

    fn cmd_end_query_indexed_ext(
        self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32, index: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQueryIndexedEXT.html
        """
        return self._cmd_end_query_indexed_ext(command_buffer, query_pool, query, index)

    fn cmd_draw_indirect_byte_count_ext(
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
        return self._cmd_draw_indirect_byte_count_ext(
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
    var _cmd_begin_conditional_rendering_ext: fn(
        command_buffer: CommandBuffer,
        p_conditional_rendering_begin: Ptr[ConditionalRenderingBeginInfoEXT, ImmutAnyOrigin],
    )
    var _cmd_end_conditional_rendering_ext: fn(command_buffer: CommandBuffer)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_begin_conditional_rendering_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginConditionalRenderingEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_conditional_rendering_ext)]()[]
        self._cmd_end_conditional_rendering_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndConditionalRenderingEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_conditional_rendering_ext)]()[]

    fn cmd_begin_conditional_rendering_ext(
        self,
        command_buffer: CommandBuffer,
        conditional_rendering_begin: ConditionalRenderingBeginInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginConditionalRenderingEXT.html
        """
        return self._cmd_begin_conditional_rendering_ext(
            command_buffer, Ptr(to=conditional_rendering_begin)
        )

    fn cmd_end_conditional_rendering_ext(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndConditionalRenderingEXT.html
        """
        return self._cmd_end_conditional_rendering_ext(command_buffer)


struct DirectModeDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _release_display_ext: fn(physical_device: PhysicalDevice, display: DisplayKHR) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._release_display_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkReleaseDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._release_display_ext)]()[]

    fn release_display_ext(self, physical_device: PhysicalDevice, display: DisplayKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseDisplayEXT.html
        """
        return self._release_display_ext(physical_device, display)


struct AcquireXlibDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _acquire_xlib_display_ext: fn(
        physical_device: PhysicalDevice, dpy: Ptr[Display, MutAnyOrigin], display: DisplayKHR
    ) -> Result
    var _get_rand_r_output_display_ext: fn(
        physical_device: PhysicalDevice,
        dpy: Ptr[Display, MutAnyOrigin],
        rr_output: RROutput,
        p_display: Ptr[DisplayKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._acquire_xlib_display_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkAcquireXlibDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._acquire_xlib_display_ext)]()[]
        self._get_rand_r_output_display_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkGetRandROutputDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_rand_r_output_display_ext)]()[]

    fn acquire_xlib_display_ext(
        self, physical_device: PhysicalDevice, mut dpy: Display, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireXlibDisplayEXT.html
        """
        return self._acquire_xlib_display_ext(physical_device, Ptr(to=dpy), display)

    fn get_rand_r_output_display_ext(
        self,
        physical_device: PhysicalDevice,
        mut dpy: Display,
        rr_output: RROutput,
        mut display: DisplayKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRandROutputDisplayEXT.html
        """
        return self._get_rand_r_output_display_ext(physical_device, Ptr(to=dpy), rr_output, Ptr(to=display))


struct DisplaySurfaceCounter(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_surface_capabilities_2_ext: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_surface_capabilities: Ptr[SurfaceCapabilities2EXT, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_surface_capabilities_2_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceCapabilities2EXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_capabilities_2_ext)]()[]

    fn get_physical_device_surface_capabilities_2_ext(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_capabilities: SurfaceCapabilities2EXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceCapabilities2EXT.html
        """
        return self._get_physical_device_surface_capabilities_2_ext(
            physical_device, surface, Ptr(to=surface_capabilities)
        )


struct DisplayControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _display_power_control_ext: fn(
        device: Device,
        display: DisplayKHR,
        p_display_power_info: Ptr[DisplayPowerInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _register_device_event_ext: fn(
        device: Device,
        p_device_event_info: Ptr[DeviceEventInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_fence: Ptr[Fence, MutAnyOrigin],
    ) -> Result
    var _register_display_event_ext: fn(
        device: Device,
        display: DisplayKHR,
        p_display_event_info: Ptr[DisplayEventInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_fence: Ptr[Fence, MutAnyOrigin],
    ) -> Result
    var _get_swapchain_counter_ext: fn(
        device: Device,
        swapchain: SwapchainKHR,
        counter: SurfaceCounterFlagBitsEXT,
        p_counter_value: Ptr[UInt64, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._display_power_control_ext = Ptr(to=get_device_proc_addr(
            device, "vkDisplayPowerControlEXT".as_c_string_slice()
        )).bitcast[type_of(self._display_power_control_ext)]()[]
        self._register_device_event_ext = Ptr(to=get_device_proc_addr(
            device, "vkRegisterDeviceEventEXT".as_c_string_slice()
        )).bitcast[type_of(self._register_device_event_ext)]()[]
        self._register_display_event_ext = Ptr(to=get_device_proc_addr(
            device, "vkRegisterDisplayEventEXT".as_c_string_slice()
        )).bitcast[type_of(self._register_display_event_ext)]()[]
        self._get_swapchain_counter_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainCounterEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_swapchain_counter_ext)]()[]

    fn display_power_control_ext(
        self, device: Device, display: DisplayKHR, display_power_info: DisplayPowerInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDisplayPowerControlEXT.html
        """
        return self._display_power_control_ext(device, display, Ptr(to=display_power_info))

    fn register_device_event_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        device_event_info: DeviceEventInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkRegisterDeviceEventEXT.html
        """
        return self._register_device_event_ext(
            device,
            Ptr(to=device_event_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=fence),
        )

    fn register_display_event_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        display: DisplayKHR,
        display_event_info: DisplayEventInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkRegisterDisplayEventEXT.html
        """
        return self._register_display_event_ext(
            device,
            display,
            Ptr(to=display_event_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=fence),
        )

    fn get_swapchain_counter_ext(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        counter: SurfaceCounterFlagBitsEXT,
        mut counter_value: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainCounterEXT.html
        """
        return self._get_swapchain_counter_ext(device, swapchain, counter, Ptr(to=counter_value))


struct DiscardRectangles(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_discard_rectangle_ext: fn(
        command_buffer: CommandBuffer,
        first_discard_rectangle: UInt32,
        discard_rectangle_count: UInt32,
        p_discard_rectangles: Ptr[Rect2D, ImmutAnyOrigin],
    )
    var _cmd_set_discard_rectangle_enable_ext: fn(
        command_buffer: CommandBuffer, discard_rectangle_enable: Bool32
    )
    var _cmd_set_discard_rectangle_mode_ext: fn(
        command_buffer: CommandBuffer, discard_rectangle_mode: DiscardRectangleModeEXT
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_discard_rectangle_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDiscardRectangleEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_discard_rectangle_ext)]()[]
        self._cmd_set_discard_rectangle_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDiscardRectangleEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_discard_rectangle_enable_ext)]()[]
        self._cmd_set_discard_rectangle_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDiscardRectangleModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_discard_rectangle_mode_ext)]()[]

    fn cmd_set_discard_rectangle_ext[p_discard_rectangles_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        first_discard_rectangle: UInt32,
        discard_rectangle_count: UInt32,
        p_discard_rectangles: Ptr[Rect2D, p_discard_rectangles_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleEXT.html
        """
        return self._cmd_set_discard_rectangle_ext(
            command_buffer,
            first_discard_rectangle,
            discard_rectangle_count,
            Ptr(to=p_discard_rectangles).bitcast[Ptr[Rect2D, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_discard_rectangle_enable_ext(
        self, command_buffer: CommandBuffer, discard_rectangle_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleEnableEXT.html
        """
        return self._cmd_set_discard_rectangle_enable_ext(command_buffer, discard_rectangle_enable)

    fn cmd_set_discard_rectangle_mode_ext(
        self, command_buffer: CommandBuffer, discard_rectangle_mode: DiscardRectangleModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleModeEXT.html
        """
        return self._cmd_set_discard_rectangle_mode_ext(command_buffer, discard_rectangle_mode)


struct HdrMetadata(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_hdr_metadata_ext: fn(
        device: Device,
        swapchain_count: UInt32,
        p_swapchains: Ptr[SwapchainKHR, ImmutAnyOrigin],
        p_metadata: Ptr[HdrMetadataEXT, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_hdr_metadata_ext = Ptr(to=get_device_proc_addr(
            device, "vkSetHdrMetadataEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_hdr_metadata_ext)]()[]

    fn set_hdr_metadata_ext[
        p_swapchains_origin: ImmutOrigin = ImmutAnyOrigin,
        p_metadata_origin: ImmutOrigin = ImmutAnyOrigin,
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
        return self._set_hdr_metadata_ext(
            device,
            swapchain_count,
            Ptr(to=p_swapchains).bitcast[Ptr[SwapchainKHR, ImmutAnyOrigin]]()[],
            Ptr(to=p_metadata).bitcast[Ptr[HdrMetadataEXT, ImmutAnyOrigin]]()[],
        )


struct DebugUtils(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_debug_utils_object_name_ext: fn(
        device: Device, p_name_info: Ptr[DebugUtilsObjectNameInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _set_debug_utils_object_tag_ext: fn(
        device: Device, p_tag_info: Ptr[DebugUtilsObjectTagInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _queue_begin_debug_utils_label_ext: fn(
        queue: Queue, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _queue_end_debug_utils_label_ext: fn(queue: Queue)
    var _queue_insert_debug_utils_label_ext: fn(
        queue: Queue, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _cmd_begin_debug_utils_label_ext: fn(
        command_buffer: CommandBuffer, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _cmd_end_debug_utils_label_ext: fn(command_buffer: CommandBuffer)
    var _cmd_insert_debug_utils_label_ext: fn(
        command_buffer: CommandBuffer, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _create_debug_utils_messenger_ext: fn(
        instance: Instance,
        p_create_info: Ptr[DebugUtilsMessengerCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_messenger: Ptr[DebugUtilsMessengerEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_debug_utils_messenger_ext: fn(
        instance: Instance,
        messenger: DebugUtilsMessengerEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _submit_debug_utils_message_ext: fn(
        instance: Instance,
        message_severity: DebugUtilsMessageSeverityFlagBitsEXT,
        message_types: DebugUtilsMessageTypeFlagsEXT,
        p_callback_data: Ptr[DebugUtilsMessengerCallbackDataEXT, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._set_debug_utils_object_name_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkSetDebugUtilsObjectNameEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_debug_utils_object_name_ext)]()[]
        self._set_debug_utils_object_tag_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkSetDebugUtilsObjectTagEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_debug_utils_object_tag_ext)]()[]
        self._queue_begin_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkQueueBeginDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._queue_begin_debug_utils_label_ext)]()[]
        self._queue_end_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkQueueEndDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._queue_end_debug_utils_label_ext)]()[]
        self._queue_insert_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkQueueInsertDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._queue_insert_debug_utils_label_ext)]()[]
        self._cmd_begin_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCmdBeginDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_debug_utils_label_ext)]()[]
        self._cmd_end_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCmdEndDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_debug_utils_label_ext)]()[]
        self._cmd_insert_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCmdInsertDebugUtilsLabelEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_insert_debug_utils_label_ext)]()[]
        self._create_debug_utils_messenger_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDebugUtilsMessengerEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_debug_utils_messenger_ext)]()[]
        self._destroy_debug_utils_messenger_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroyDebugUtilsMessengerEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_debug_utils_messenger_ext)]()[]
        self._submit_debug_utils_message_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkSubmitDebugUtilsMessageEXT".as_c_string_slice()
        )).bitcast[type_of(self._submit_debug_utils_message_ext)]()[]

    fn set_debug_utils_object_name_ext(
        self, device: Device, name_info: DebugUtilsObjectNameInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDebugUtilsObjectNameEXT.html
        """
        return self._set_debug_utils_object_name_ext(device, Ptr(to=name_info))

    fn set_debug_utils_object_tag_ext(
        self, device: Device, tag_info: DebugUtilsObjectTagInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDebugUtilsObjectTagEXT.html
        """
        return self._set_debug_utils_object_tag_ext(device, Ptr(to=tag_info))

    fn queue_begin_debug_utils_label_ext(self, queue: Queue, label_info: DebugUtilsLabelEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBeginDebugUtilsLabelEXT.html
        """
        return self._queue_begin_debug_utils_label_ext(queue, Ptr(to=label_info))

    fn queue_end_debug_utils_label_ext(self, queue: Queue):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueEndDebugUtilsLabelEXT.html
        """
        return self._queue_end_debug_utils_label_ext(queue)

    fn queue_insert_debug_utils_label_ext(self, queue: Queue, label_info: DebugUtilsLabelEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueInsertDebugUtilsLabelEXT.html
        """
        return self._queue_insert_debug_utils_label_ext(queue, Ptr(to=label_info))

    fn cmd_begin_debug_utils_label_ext(
        self, command_buffer: CommandBuffer, label_info: DebugUtilsLabelEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginDebugUtilsLabelEXT.html
        """
        return self._cmd_begin_debug_utils_label_ext(command_buffer, Ptr(to=label_info))

    fn cmd_end_debug_utils_label_ext(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndDebugUtilsLabelEXT.html
        """
        return self._cmd_end_debug_utils_label_ext(command_buffer)

    fn cmd_insert_debug_utils_label_ext(
        self, command_buffer: CommandBuffer, label_info: DebugUtilsLabelEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdInsertDebugUtilsLabelEXT.html
        """
        return self._cmd_insert_debug_utils_label_ext(command_buffer, Ptr(to=label_info))

    fn create_debug_utils_messenger_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: DebugUtilsMessengerCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut messenger: DebugUtilsMessengerEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDebugUtilsMessengerEXT.html
        """
        return self._create_debug_utils_messenger_ext(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=messenger),
        )

    fn destroy_debug_utils_messenger_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        messenger: DebugUtilsMessengerEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDebugUtilsMessengerEXT.html
        """
        return self._destroy_debug_utils_messenger_ext(
            instance, messenger, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn submit_debug_utils_message_ext(
        self,
        instance: Instance,
        message_severity: DebugUtilsMessageSeverityFlagBitsEXT,
        message_types: DebugUtilsMessageTypeFlagsEXT,
        callback_data: DebugUtilsMessengerCallbackDataEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSubmitDebugUtilsMessageEXT.html
        """
        return self._submit_debug_utils_message_ext(
            instance, message_severity, message_types, Ptr(to=callback_data)
        )


struct SampleLocations(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_sample_locations_ext: fn(
        command_buffer: CommandBuffer,
        p_sample_locations_info: Ptr[SampleLocationsInfoEXT, ImmutAnyOrigin],
    )
    var _get_physical_device_multisample_properties_ext: fn(
        physical_device: PhysicalDevice,
        samples: SampleCountFlagBits,
        p_multisample_properties: Ptr[MultisamplePropertiesEXT, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_sample_locations_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleLocationsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_locations_ext)]()[]
        self._get_physical_device_multisample_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceMultisamplePropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_multisample_properties_ext)]()[]

    fn cmd_set_sample_locations_ext(
        self, command_buffer: CommandBuffer, sample_locations_info: SampleLocationsInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEXT.html
        """
        return self._cmd_set_sample_locations_ext(command_buffer, Ptr(to=sample_locations_info))

    fn get_physical_device_multisample_properties_ext(
        self,
        physical_device: PhysicalDevice,
        samples: SampleCountFlagBits,
        mut multisample_properties: MultisamplePropertiesEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMultisamplePropertiesEXT.html
        """
        return self._get_physical_device_multisample_properties_ext(
            physical_device, samples, Ptr(to=multisample_properties)
        )


struct ImageDrmFormatModifier(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_image_drm_format_modifier_properties_ext: fn(
        device: Device,
        image: Image,
        p_properties: Ptr[ImageDrmFormatModifierPropertiesEXT, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_drm_format_modifier_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetImageDrmFormatModifierPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_image_drm_format_modifier_properties_ext)]()[]

    fn get_image_drm_format_modifier_properties_ext(
        self, device: Device, image: Image, mut properties: ImageDrmFormatModifierPropertiesEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageDrmFormatModifierPropertiesEXT.html
        """
        return self._get_image_drm_format_modifier_properties_ext(device, image, Ptr(to=properties))


struct ValidationCache(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_validation_cache_ext: fn(
        device: Device,
        p_create_info: Ptr[ValidationCacheCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_validation_cache: Ptr[ValidationCacheEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_validation_cache_ext: fn(
        device: Device,
        validation_cache: ValidationCacheEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _merge_validation_caches_ext: fn(
        device: Device,
        dst_cache: ValidationCacheEXT,
        src_cache_count: UInt32,
        p_src_caches: Ptr[ValidationCacheEXT, ImmutAnyOrigin],
    ) -> Result
    var _get_validation_cache_data_ext: fn(
        device: Device,
        validation_cache: ValidationCacheEXT,
        p_data_size: Ptr[UInt, MutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_validation_cache_ext = Ptr(to=get_device_proc_addr(
            device, "vkCreateValidationCacheEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_validation_cache_ext)]()[]
        self._destroy_validation_cache_ext = Ptr(to=get_device_proc_addr(
            device, "vkDestroyValidationCacheEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_validation_cache_ext)]()[]
        self._merge_validation_caches_ext = Ptr(to=get_device_proc_addr(
            device, "vkMergeValidationCachesEXT".as_c_string_slice()
        )).bitcast[type_of(self._merge_validation_caches_ext)]()[]
        self._get_validation_cache_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetValidationCacheDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_validation_cache_data_ext)]()[]

    fn create_validation_cache_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: ValidationCacheCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut validation_cache: ValidationCacheEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateValidationCacheEXT.html
        """
        return self._create_validation_cache_ext(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=validation_cache),
        )

    fn destroy_validation_cache_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        validation_cache: ValidationCacheEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyValidationCacheEXT.html
        """
        return self._destroy_validation_cache_ext(
            device,
            validation_cache,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn merge_validation_caches_ext[p_src_caches_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        dst_cache: ValidationCacheEXT,
        src_cache_count: UInt32,
        p_src_caches: Ptr[ValidationCacheEXT, p_src_caches_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergeValidationCachesEXT.html
        """
        return self._merge_validation_caches_ext(
            device,
            dst_cache,
            src_cache_count,
            Ptr(to=p_src_caches).bitcast[Ptr[ValidationCacheEXT, ImmutAnyOrigin]]()[],
        )

    fn get_validation_cache_data_ext[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        validation_cache: ValidationCacheEXT,
        mut data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetValidationCacheDataEXT.html
        """
        return self._get_validation_cache_data_ext(
            device,
            validation_cache,
            Ptr(to=data_size),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn get_validation_cache_data_ext[p_data_origin: MutOrigin = MutAnyOrigin](
        self, device: Device, validation_cache: ValidationCacheEXT
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetValidationCacheDataEXT.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_validation_cache_data_ext(
        device, validation_cache, Ptr(to=count), Ptr[NoneType, MutOrigin.external]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_validation_cache_data_ext(
        device, validation_cache, Ptr(to=count), list.unsafe_ptr().bitcast[NoneType]()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct ExternalMemoryHost(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_host_pointer_properties_ext: fn(
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        p_host_pointer: Ptr[NoneType, ImmutAnyOrigin],
        p_memory_host_pointer_properties: Ptr[MemoryHostPointerPropertiesEXT, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_host_pointer_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryHostPointerPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_host_pointer_properties_ext)]()[]

    fn get_memory_host_pointer_properties_ext[p_host_pointer_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        p_host_pointer: Ptr[NoneType, p_host_pointer_origin],
        mut memory_host_pointer_properties: MemoryHostPointerPropertiesEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryHostPointerPropertiesEXT.html
        """
        return self._get_memory_host_pointer_properties_ext(
            device,
            handle_type,
            Ptr(to=p_host_pointer).bitcast[Ptr[NoneType, ImmutAnyOrigin]]()[],
            Ptr(to=memory_host_pointer_properties),
        )


struct CalibratedTimestamps(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_calibrateable_time_domains_khr: fn(
        physical_device: PhysicalDevice,
        p_time_domain_count: Ptr[UInt32, MutAnyOrigin],
        p_time_domains: Ptr[TimeDomainKHR, MutAnyOrigin],
    ) -> Result
    var _get_calibrated_timestamps_khr: fn(
        device: Device,
        timestamp_count: UInt32,
        p_timestamp_infos: Ptr[CalibratedTimestampInfoKHR, ImmutAnyOrigin],
        p_timestamps: Ptr[UInt64, MutAnyOrigin],
        p_max_deviation: Ptr[UInt64, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_calibrateable_time_domains_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_calibrateable_time_domains_khr)]()[]
        self._get_calibrated_timestamps_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetCalibratedTimestampsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_calibrated_timestamps_khr)]()[]

    fn get_physical_device_calibrateable_time_domains_khr[
        p_time_domains_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut time_domain_count: UInt32,
        p_time_domains: Ptr[TimeDomainKHR, p_time_domains_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCalibrateableTimeDomainsKHR.html
        """
        return self._get_physical_device_calibrateable_time_domains_khr(
            physical_device,
            Ptr(to=time_domain_count),
            Ptr(to=p_time_domains).bitcast[Ptr[TimeDomainKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_calibrateable_time_domains_khr[
        p_time_domains_origin: MutOrigin = MutAnyOrigin
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
            result = self._get_physical_device_calibrateable_time_domains_khr(
        physical_device, Ptr(to=count), Ptr[TimeDomainKHR, MutOrigin.external]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_calibrateable_time_domains_khr(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_calibrated_timestamps_khr[
        p_timestamp_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        p_timestamps_origin: MutOrigin = MutAnyOrigin,
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
        return self._get_calibrated_timestamps_khr(
            device,
            timestamp_count,
            Ptr(to=p_timestamp_infos).bitcast[Ptr[CalibratedTimestampInfoKHR, ImmutAnyOrigin]]()[],
            Ptr(to=p_timestamps).bitcast[Ptr[UInt64, MutAnyOrigin]]()[],
            Ptr(to=max_deviation),
        )


struct MetalSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_metal_surface_ext: fn(
        instance: Instance,
        p_create_info: Ptr[MetalSurfaceCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_metal_surface_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateMetalSurfaceEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_metal_surface_ext)]()[]

    fn create_metal_surface_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: MetalSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateMetalSurfaceEXT.html
        """
        return self._create_metal_surface_ext(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )


struct BufferDeviceAddress(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_buffer_device_address: fn(
        device: Device, p_info: Ptr[BufferDeviceAddressInfo, ImmutAnyOrigin]
    ) -> DeviceAddress

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_buffer_device_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferDeviceAddress".as_c_string_slice()
        )).bitcast[type_of(self._get_buffer_device_address)]()[]

    fn get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._get_buffer_device_address(device, Ptr(to=info))


struct ToolingInfo(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_tool_properties: fn(
        physical_device: PhysicalDevice,
        p_tool_count: Ptr[UInt32, MutAnyOrigin],
        p_tool_properties: Ptr[PhysicalDeviceToolProperties, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_tool_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceToolProperties".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_tool_properties)]()[]

    fn get_physical_device_tool_properties[p_tool_properties_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        mut tool_count: UInt32,
        p_tool_properties: Ptr[PhysicalDeviceToolProperties, p_tool_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        return self._get_physical_device_tool_properties(
            physical_device,
            Ptr(to=tool_count),
            Ptr(to=p_tool_properties).bitcast[Ptr[PhysicalDeviceToolProperties, MutAnyOrigin]]()[],
        )

    fn get_physical_device_tool_properties[p_tool_properties_origin: MutOrigin = MutAnyOrigin](
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
        physical_device, Ptr(to=count), Ptr[PhysicalDeviceToolProperties, MutOrigin.external]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_tool_properties(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct FullScreenExclusive(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_surface_present_modes_2_ext: fn(
        physical_device: PhysicalDevice,
        p_surface_info: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        p_present_mode_count: Ptr[UInt32, MutAnyOrigin],
        p_present_modes: Ptr[PresentModeKHR, MutAnyOrigin],
    ) -> Result
    var _acquire_full_screen_exclusive_mode_ext: fn(device: Device, swapchain: SwapchainKHR) -> Result
    var _release_full_screen_exclusive_mode_ext: fn(device: Device, swapchain: SwapchainKHR) -> Result
    var _get_device_group_surface_present_modes_2_ext: fn(
        device: Device,
        p_surface_info: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        p_modes: Ptr[DeviceGroupPresentModeFlagsKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_surface_present_modes_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceSurfacePresentModes2EXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_present_modes_2_ext)]()[]
        self._acquire_full_screen_exclusive_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkAcquireFullScreenExclusiveModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._acquire_full_screen_exclusive_mode_ext)]()[]
        self._release_full_screen_exclusive_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkReleaseFullScreenExclusiveModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._release_full_screen_exclusive_mode_ext)]()[]
        self._get_device_group_surface_present_modes_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupSurfacePresentModes2EXT".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_surface_present_modes_2_ext)]()[]

    fn get_physical_device_surface_present_modes_2_ext[
        p_present_modes_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut present_mode_count: UInt32,
        p_present_modes: Ptr[PresentModeKHR, p_present_modes_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfacePresentModes2EXT.html
        """
        return self._get_physical_device_surface_present_modes_2_ext(
            physical_device,
            Ptr(to=surface_info),
            Ptr(to=present_mode_count),
            Ptr(to=p_present_modes).bitcast[Ptr[PresentModeKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_surface_present_modes_2_ext[
        p_present_modes_origin: MutOrigin = MutAnyOrigin
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
            result = self._get_physical_device_surface_present_modes_2_ext(
        physical_device,
        Ptr(to=surface_info),
        Ptr(to=count),
        Ptr[PresentModeKHR, MutOrigin.external](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_surface_present_modes_2_ext(
        physical_device, Ptr(to=surface_info), Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn acquire_full_screen_exclusive_mode_ext(
        self, device: Device, swapchain: SwapchainKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireFullScreenExclusiveModeEXT.html
        """
        return self._acquire_full_screen_exclusive_mode_ext(device, swapchain)

    fn release_full_screen_exclusive_mode_ext(
        self, device: Device, swapchain: SwapchainKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseFullScreenExclusiveModeEXT.html
        """
        return self._release_full_screen_exclusive_mode_ext(device, swapchain)

    fn get_device_group_surface_present_modes_2_ext(
        self,
        device: Device,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut modes: DeviceGroupPresentModeFlagsKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupSurfacePresentModes2EXT.html
        """
        return self._get_device_group_surface_present_modes_2_ext(
            device, Ptr(to=surface_info), Ptr(to=modes)
        )


struct HeadlessSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_headless_surface_ext: fn(
        instance: Instance,
        p_create_info: Ptr[HeadlessSurfaceCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_headless_surface_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateHeadlessSurfaceEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_headless_surface_ext)]()[]

    fn create_headless_surface_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: HeadlessSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateHeadlessSurfaceEXT.html
        """
        return self._create_headless_surface_ext(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )


struct LineRasterization(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_line_stipple: fn(
        command_buffer: CommandBuffer, line_stipple_factor: UInt32, line_stipple_pattern: UInt16
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_line_stipple = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStipple".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_stipple)]()[]

    fn cmd_set_line_stipple(
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
    var _reset_query_pool: fn(
        device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._reset_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkResetQueryPool".as_c_string_slice()
        )).bitcast[type_of(self._reset_query_pool)]()[]

    fn reset_query_pool(
        self, device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetQueryPool.html
        """
        return self._reset_query_pool(device, query_pool, first_query, query_count)


struct ExtendedDynamicState(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_cull_mode: fn(command_buffer: CommandBuffer, cull_mode: CullModeFlags)
    var _cmd_set_front_face: fn(command_buffer: CommandBuffer, front_face: FrontFace)
    var _cmd_set_primitive_topology: fn(
        command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    )
    var _cmd_set_viewport_with_count: fn(
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    )
    var _cmd_set_scissor_with_count: fn(
        command_buffer: CommandBuffer, scissor_count: UInt32, p_scissors: Ptr[Rect2D, ImmutAnyOrigin]
    )
    var _cmd_bind_vertex_buffers_2: fn(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
        p_sizes: Ptr[DeviceSize, ImmutAnyOrigin],
        p_strides: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _cmd_set_depth_test_enable: fn(command_buffer: CommandBuffer, depth_test_enable: Bool32)
    var _cmd_set_depth_write_enable: fn(command_buffer: CommandBuffer, depth_write_enable: Bool32)
    var _cmd_set_depth_compare_op: fn(command_buffer: CommandBuffer, depth_compare_op: CompareOp)
    var _cmd_set_depth_bounds_test_enable: fn(
        command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    )
    var _cmd_set_stencil_test_enable: fn(command_buffer: CommandBuffer, stencil_test_enable: Bool32)
    var _cmd_set_stencil_op: fn(
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCullMode.html
        """
        return self._cmd_set_cull_mode(command_buffer, cull_mode)

    fn cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFrontFace.html
        """
        return self._cmd_set_front_face(command_buffer, front_face)

    fn cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveTopology.html
        """
        return self._cmd_set_primitive_topology(command_buffer, primitive_topology)

    fn cmd_set_viewport_with_count[p_viewports_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWithCount.html
        """
        return self._cmd_set_viewport_with_count(
            command_buffer, viewport_count, Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutAnyOrigin]]()[]
        )

    fn cmd_set_scissor_with_count[p_scissors_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissorWithCount.html
        """
        return self._cmd_set_scissor_with_count(
            command_buffer, scissor_count, Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutAnyOrigin]]()[]
        )

    fn cmd_bind_vertex_buffers_2[
        p_buffers_origin: ImmutOrigin = ImmutAnyOrigin,
        p_offsets_origin: ImmutOrigin = ImmutAnyOrigin,
        p_sizes_origin: ImmutOrigin = ImmutAnyOrigin,
        p_strides_origin: ImmutOrigin = ImmutAnyOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
        p_sizes: Ptr[DeviceSize, p_sizes_origin],
        p_strides: Ptr[DeviceSize, p_strides_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers2.html
        """
        return self._cmd_bind_vertex_buffers_2(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutAnyOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
            Ptr(to=p_sizes).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
            Ptr(to=p_strides).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthTestEnable.html
        """
        return self._cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    fn cmd_set_depth_write_enable(self, command_buffer: CommandBuffer, depth_write_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthWriteEnable.html
        """
        return self._cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    fn cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthCompareOp.html
        """
        return self._cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    fn cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBoundsTestEnable.html
        """
        return self._cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    fn cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilTestEnable.html
        """
        return self._cmd_set_stencil_test_enable(command_buffer, stencil_test_enable)

    fn cmd_set_stencil_op(
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
    var _copy_memory_to_image: fn(
        device: Device, p_copy_memory_to_image_info: Ptr[CopyMemoryToImageInfo, ImmutAnyOrigin]
    ) -> Result
    var _copy_image_to_memory: fn(
        device: Device, p_copy_image_to_memory_info: Ptr[CopyImageToMemoryInfo, ImmutAnyOrigin]
    ) -> Result
    var _copy_image_to_image: fn(
        device: Device, p_copy_image_to_image_info: Ptr[CopyImageToImageInfo, ImmutAnyOrigin]
    ) -> Result
    var _transition_image_layout: fn(
        device: Device,
        transition_count: UInt32,
        p_transitions: Ptr[HostImageLayoutTransitionInfo, ImmutAnyOrigin],
    ) -> Result
    var _get_image_subresource_layout_2: fn(
        device: Device,
        image: Image,
        p_subresource: Ptr[ImageSubresource2, ImmutAnyOrigin],
        p_layout: Ptr[SubresourceLayout2, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn copy_memory_to_image(
        self, device: Device, copy_memory_to_image_info: CopyMemoryToImageInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToImage.html
        """
        return self._copy_memory_to_image(device, Ptr(to=copy_memory_to_image_info))

    fn copy_image_to_memory(
        self, device: Device, copy_image_to_memory_info: CopyImageToMemoryInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyImageToMemory.html
        """
        return self._copy_image_to_memory(device, Ptr(to=copy_image_to_memory_info))

    fn copy_image_to_image(
        self, device: Device, copy_image_to_image_info: CopyImageToImageInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyImageToImage.html
        """
        return self._copy_image_to_image(device, Ptr(to=copy_image_to_image_info))

    fn transition_image_layout[p_transitions_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_transitions).bitcast[Ptr[HostImageLayoutTransitionInfo, ImmutAnyOrigin]]()[],
        )

    fn get_image_subresource_layout_2(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource2,
        mut layout: SubresourceLayout2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout2.html
        """
        return self._get_image_subresource_layout_2(device, image, Ptr(to=subresource), Ptr(to=layout))


struct SwapchainMaintenance1(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _release_swapchain_images_khr: fn(
        device: Device, p_release_info: Ptr[ReleaseSwapchainImagesInfoKHR, ImmutAnyOrigin]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._release_swapchain_images_khr = Ptr(to=get_device_proc_addr(
            device, "vkReleaseSwapchainImagesKHR".as_c_string_slice()
        )).bitcast[type_of(self._release_swapchain_images_khr)]()[]

    fn release_swapchain_images_khr(
        self, device: Device, release_info: ReleaseSwapchainImagesInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseSwapchainImagesKHR.html
        """
        return self._release_swapchain_images_khr(device, Ptr(to=release_info))


struct DepthBiasControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_depth_bias_2_ext: fn(
        command_buffer: CommandBuffer, p_depth_bias_info: Ptr[DepthBiasInfoEXT, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_bias_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBias2EXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_bias_2_ext)]()[]

    fn cmd_set_depth_bias_2_ext(
        self, command_buffer: CommandBuffer, depth_bias_info: DepthBiasInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBias2EXT.html
        """
        return self._cmd_set_depth_bias_2_ext(command_buffer, Ptr(to=depth_bias_info))


struct AcquireDrmDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _acquire_drm_display_ext: fn(
        physical_device: PhysicalDevice, drm_fd: Int32, display: DisplayKHR
    ) -> Result
    var _get_drm_display_ext: fn(
        physical_device: PhysicalDevice,
        drm_fd: Int32,
        connector_id: UInt32,
        display: Ptr[DisplayKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._acquire_drm_display_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkAcquireDrmDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._acquire_drm_display_ext)]()[]
        self._get_drm_display_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDrmDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_drm_display_ext)]()[]

    fn acquire_drm_display_ext(
        self, physical_device: PhysicalDevice, drm_fd: Int32, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireDrmDisplayEXT.html
        """
        return self._acquire_drm_display_ext(physical_device, drm_fd, display)

    fn get_drm_display_ext(
        self,
        physical_device: PhysicalDevice,
        drm_fd: Int32,
        connector_id: UInt32,
        mut display: DisplayKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDrmDisplayEXT.html
        """
        return self._get_drm_display_ext(physical_device, drm_fd, connector_id, Ptr(to=display))


struct PrivateData(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_private_data_slot: fn(
        device: Device,
        p_create_info: Ptr[PrivateDataSlotCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_private_data_slot: Ptr[PrivateDataSlot, MutAnyOrigin],
    ) -> Result
    var _destroy_private_data_slot: fn(
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _set_private_data: fn(
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        data: UInt64,
    ) -> Result
    var _get_private_data: fn(
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        p_data: Ptr[UInt64, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn create_private_data_slot[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: PrivateDataSlotCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut private_data_slot: PrivateDataSlot,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePrivateDataSlot.html
        """
        return self._create_private_data_slot(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=private_data_slot),
        )

    fn destroy_private_data_slot[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPrivateDataSlot.html
        """
        return self._destroy_private_data_slot(
            device,
            private_data_slot,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn set_private_data(
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

    fn get_private_data(
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
        return self._get_private_data(device, object_type, object_handle, private_data_slot, Ptr(to=data))


struct MetalObjects(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _export_metal_objects_ext: fn(
        device: Device, p_metal_objects_info: Ptr[ExportMetalObjectsInfoEXT, MutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._export_metal_objects_ext = Ptr(to=get_device_proc_addr(
            device, "vkExportMetalObjectsEXT".as_c_string_slice()
        )).bitcast[type_of(self._export_metal_objects_ext)]()[]

    fn export_metal_objects_ext(
        self, device: Device, mut metal_objects_info: ExportMetalObjectsInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkExportMetalObjectsEXT.html
        """
        return self._export_metal_objects_ext(device, Ptr(to=metal_objects_info))


struct DescriptorBuffer(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_descriptor_set_layout_size_ext: fn(
        device: Device,
        layout: DescriptorSetLayout,
        p_layout_size_in_bytes: Ptr[DeviceSize, MutAnyOrigin],
    )
    var _get_descriptor_set_layout_binding_offset_ext: fn(
        device: Device,
        layout: DescriptorSetLayout,
        binding: UInt32,
        p_offset: Ptr[DeviceSize, MutAnyOrigin],
    )
    var _get_descriptor_ext: fn(
        device: Device,
        p_descriptor_info: Ptr[DescriptorGetInfoEXT, ImmutAnyOrigin],
        data_size: UInt,
        p_descriptor: Ptr[NoneType, MutAnyOrigin],
    )
    var _cmd_bind_descriptor_buffers_ext: fn(
        command_buffer: CommandBuffer,
        buffer_count: UInt32,
        p_binding_infos: Ptr[DescriptorBufferBindingInfoEXT, ImmutAnyOrigin],
    )
    var _cmd_set_descriptor_buffer_offsets_ext: fn(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        set_count: UInt32,
        p_buffer_indices: Ptr[UInt32, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _cmd_bind_descriptor_buffer_embedded_samplers_ext: fn(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
    )
    var _get_buffer_opaque_capture_descriptor_data_ext: fn(
        device: Device,
        p_info: Ptr[BufferCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_image_opaque_capture_descriptor_data_ext: fn(
        device: Device,
        p_info: Ptr[ImageCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_image_view_opaque_capture_descriptor_data_ext: fn(
        device: Device,
        p_info: Ptr[ImageViewCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_sampler_opaque_capture_descriptor_data_ext: fn(
        device: Device,
        p_info: Ptr[SamplerCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_acceleration_structure_opaque_capture_descriptor_data_ext: fn(
        device: Device,
        p_info: Ptr[AccelerationStructureCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_descriptor_set_layout_size_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutSizeEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_set_layout_size_ext)]()[]
        self._get_descriptor_set_layout_binding_offset_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutBindingOffsetEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_set_layout_binding_offset_ext)]()[]
        self._get_descriptor_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_ext)]()[]
        self._cmd_bind_descriptor_buffers_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorBuffersEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_descriptor_buffers_ext)]()[]
        self._cmd_set_descriptor_buffer_offsets_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDescriptorBufferOffsetsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_descriptor_buffer_offsets_ext)]()[]
        self._cmd_bind_descriptor_buffer_embedded_samplers_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorBufferEmbeddedSamplersEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_descriptor_buffer_embedded_samplers_ext)]()[]
        self._get_buffer_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferOpaqueCaptureDescriptorDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_buffer_opaque_capture_descriptor_data_ext)]()[]
        self._get_image_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetImageOpaqueCaptureDescriptorDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_image_opaque_capture_descriptor_data_ext)]()[]
        self._get_image_view_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetImageViewOpaqueCaptureDescriptorDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_image_view_opaque_capture_descriptor_data_ext)]()[]
        self._get_sampler_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetSamplerOpaqueCaptureDescriptorDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_sampler_opaque_capture_descriptor_data_ext)]()[]
        self._get_acceleration_structure_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_acceleration_structure_opaque_capture_descriptor_data_ext)]()[]

    fn get_descriptor_set_layout_size_ext(
        self, device: Device, layout: DescriptorSetLayout, mut layout_size_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutSizeEXT.html
        """
        return self._get_descriptor_set_layout_size_ext(device, layout, Ptr(to=layout_size_in_bytes))

    fn get_descriptor_set_layout_binding_offset_ext(
        self, device: Device, layout: DescriptorSetLayout, binding: UInt32, mut offset: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutBindingOffsetEXT.html
        """
        return self._get_descriptor_set_layout_binding_offset_ext(device, layout, binding, Ptr(to=offset))

    fn get_descriptor_ext[p_descriptor_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        descriptor_info: DescriptorGetInfoEXT,
        data_size: UInt,
        p_descriptor: Ptr[NoneType, p_descriptor_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorEXT.html
        """
        return self._get_descriptor_ext(
            device,
            Ptr(to=descriptor_info),
            data_size,
            Ptr(to=p_descriptor).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn cmd_bind_descriptor_buffers_ext[p_binding_infos_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        buffer_count: UInt32,
        p_binding_infos: Ptr[DescriptorBufferBindingInfoEXT, p_binding_infos_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorBuffersEXT.html
        """
        return self._cmd_bind_descriptor_buffers_ext(
            command_buffer,
            buffer_count,
            Ptr(to=p_binding_infos).bitcast[Ptr[DescriptorBufferBindingInfoEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_descriptor_buffer_offsets_ext[
        p_buffer_indices_origin: ImmutOrigin = ImmutAnyOrigin,
        p_offsets_origin: ImmutOrigin = ImmutAnyOrigin,
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
        return self._cmd_set_descriptor_buffer_offsets_ext(
            command_buffer,
            pipeline_bind_point,
            layout,
            first_set,
            set_count,
            Ptr(to=p_buffer_indices).bitcast[Ptr[UInt32, ImmutAnyOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
        )

    fn cmd_bind_descriptor_buffer_embedded_samplers_ext(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorBufferEmbeddedSamplersEXT.html
        """
        return self._cmd_bind_descriptor_buffer_embedded_samplers_ext(
            command_buffer, pipeline_bind_point, layout, set
        )

    fn get_buffer_opaque_capture_descriptor_data_ext[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: BufferCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_buffer_opaque_capture_descriptor_data_ext(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_image_opaque_capture_descriptor_data_ext[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: ImageCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_image_opaque_capture_descriptor_data_ext(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_image_view_opaque_capture_descriptor_data_ext[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: ImageViewCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageViewOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_image_view_opaque_capture_descriptor_data_ext(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_sampler_opaque_capture_descriptor_data_ext[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: SamplerCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSamplerOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_sampler_opaque_capture_descriptor_data_ext(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_acceleration_structure_opaque_capture_descriptor_data_ext[
        p_data_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        device: Device,
        info: AccelerationStructureCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_acceleration_structure_opaque_capture_descriptor_data_ext(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )


struct MeshShader(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_mesh_tasks_ext: fn(
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    )
    var _cmd_draw_mesh_tasks_indirect_ext: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    )
    var _cmd_draw_mesh_tasks_indirect_count_ext: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_mesh_tasks_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_ext)]()[]
        self._cmd_draw_mesh_tasks_indirect_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_indirect_ext)]()[]
        self._cmd_draw_mesh_tasks_indirect_count_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectCountEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_indirect_count_ext)]()[]

    fn cmd_draw_mesh_tasks_ext(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksEXT.html
        """
        return self._cmd_draw_mesh_tasks_ext(command_buffer, group_count_x, group_count_y, group_count_z)

    fn cmd_draw_mesh_tasks_indirect_ext(
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
        return self._cmd_draw_mesh_tasks_indirect_ext(command_buffer, buffer, offset, draw_count, stride)

    fn cmd_draw_mesh_tasks_indirect_count_ext(
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
        return self._cmd_draw_mesh_tasks_indirect_count_ext(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )


struct ImageCompressionControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_image_subresource_layout_2: fn(
        device: Device,
        image: Image,
        p_subresource: Ptr[ImageSubresource2, ImmutAnyOrigin],
        p_layout: Ptr[SubresourceLayout2, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout2".as_c_string_slice()
        )).bitcast[type_of(self._get_image_subresource_layout_2)]()[]

    fn get_image_subresource_layout_2(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource2,
        mut layout: SubresourceLayout2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout2.html
        """
        return self._get_image_subresource_layout_2(device, image, Ptr(to=subresource), Ptr(to=layout))


struct DeviceFault(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_device_fault_info_ext: fn(
        device: Device,
        p_fault_counts: Ptr[DeviceFaultCountsEXT, MutAnyOrigin],
        p_fault_info: Ptr[DeviceFaultInfoEXT, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_device_fault_info_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceFaultInfoEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_device_fault_info_ext)]()[]

    fn get_device_fault_info_ext[p_fault_info_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        mut fault_counts: DeviceFaultCountsEXT,
        p_fault_info: Ptr[DeviceFaultInfoEXT, p_fault_info_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceFaultInfoEXT.html
        """
        return self._get_device_fault_info_ext(
            device,
            Ptr(to=fault_counts),
            Ptr(to=p_fault_info).bitcast[Ptr[DeviceFaultInfoEXT, MutAnyOrigin]]()[],
        )


struct DirectfbSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_direct_fb_surface_ext: fn(
        instance: Instance,
        p_create_info: Ptr[DirectFBSurfaceCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_direct_fb_presentation_support_ext: fn(
        physical_device: PhysicalDevice, queue_family_index: UInt32, dfb: Ptr[IDirectFB, MutAnyOrigin]
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_direct_fb_surface_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDirectFBSurfaceEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_direct_fb_surface_ext)]()[]
        self._get_physical_device_direct_fb_presentation_support_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDirectFBPresentationSupportEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_direct_fb_presentation_support_ext)]()[]

    fn create_direct_fb_surface_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: DirectFBSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDirectFBSurfaceEXT.html
        """
        return self._create_direct_fb_surface_ext(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )

    fn get_physical_device_direct_fb_presentation_support_ext(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32, mut dfb: IDirectFB
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDirectFBPresentationSupportEXT.html
        """
        return self._get_physical_device_direct_fb_presentation_support_ext(
            physical_device, queue_family_index, Ptr(to=dfb)
        )


struct VertexInputDynamicState(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_vertex_input_ext: fn(
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_vertex_input_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetVertexInputEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_vertex_input_ext)]()[]

    fn cmd_set_vertex_input_ext[
        p_vertex_binding_descriptions_origin: ImmutOrigin = ImmutAnyOrigin,
        p_vertex_attribute_descriptions_origin: ImmutOrigin = ImmutAnyOrigin,
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
        return self._cmd_set_vertex_input_ext(
            command_buffer,
            vertex_binding_description_count,
            Ptr(to=p_vertex_binding_descriptions).bitcast[Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin]]()[],
            vertex_attribute_description_count,
            Ptr(to=p_vertex_attribute_descriptions).bitcast[Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin]]()[],
        )


struct PipelineProperties(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_pipeline_properties_ext: fn(
        device: Device,
        p_pipeline_info: Ptr[PipelineInfoEXT, ImmutAnyOrigin],
        p_pipeline_properties: Ptr[BaseOutStructure, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_pipeline_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelinePropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_properties_ext)]()[]

    fn get_pipeline_properties_ext(
        self,
        device: Device,
        pipeline_info: PipelineInfoEXT,
        mut pipeline_properties: BaseOutStructure,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelinePropertiesEXT.html
        """
        return self._get_pipeline_properties_ext(device, Ptr(to=pipeline_info), Ptr(to=pipeline_properties))


struct ExtendedDynamicState2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_patch_control_points_ext: fn(
        command_buffer: CommandBuffer, patch_control_points: UInt32
    )
    var _cmd_set_rasterizer_discard_enable: fn(
        command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    )
    var _cmd_set_depth_bias_enable: fn(command_buffer: CommandBuffer, depth_bias_enable: Bool32)
    var _cmd_set_logic_op_ext: fn(command_buffer: CommandBuffer, logic_op: LogicOp)
    var _cmd_set_primitive_restart_enable: fn(
        command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_patch_control_points_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPatchControlPointsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_patch_control_points_ext)]()[]
        self._cmd_set_rasterizer_discard_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizerDiscardEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterizer_discard_enable)]()[]
        self._cmd_set_depth_bias_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBiasEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_bias_enable)]()[]
        self._cmd_set_logic_op_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_logic_op_ext)]()[]
        self._cmd_set_primitive_restart_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveRestartEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_primitive_restart_enable)]()[]

    fn cmd_set_patch_control_points_ext(
        self, command_buffer: CommandBuffer, patch_control_points: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPatchControlPointsEXT.html
        """
        return self._cmd_set_patch_control_points_ext(command_buffer, patch_control_points)

    fn cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizerDiscardEnable.html
        """
        return self._cmd_set_rasterizer_discard_enable(command_buffer, rasterizer_discard_enable)

    fn cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBiasEnable.html
        """
        return self._cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    fn cmd_set_logic_op_ext(self, command_buffer: CommandBuffer, logic_op: LogicOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEXT.html
        """
        return self._cmd_set_logic_op_ext(command_buffer, logic_op)

    fn cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)


struct ColorWriteEnable(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_color_write_enable_ext: fn(
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_color_write_enables: Ptr[Bool32, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_color_write_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorWriteEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_write_enable_ext)]()[]

    fn cmd_set_color_write_enable_ext[p_color_write_enables_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_color_write_enables: Ptr[Bool32, p_color_write_enables_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorWriteEnableEXT.html
        """
        return self._cmd_set_color_write_enable_ext(
            command_buffer,
            attachment_count,
            Ptr(to=p_color_write_enables).bitcast[Ptr[Bool32, ImmutAnyOrigin]]()[],
        )


struct MultiDraw(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_multi_ext: fn(
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_vertex_info: Ptr[MultiDrawInfoEXT, ImmutAnyOrigin],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
    )
    var _cmd_draw_multi_indexed_ext: fn(
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_index_info: Ptr[MultiDrawIndexedInfoEXT, ImmutAnyOrigin],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
        p_vertex_offset: Ptr[Int32, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_multi_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMultiEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_multi_ext)]()[]
        self._cmd_draw_multi_indexed_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMultiIndexedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_multi_indexed_ext)]()[]

    fn cmd_draw_multi_ext[p_vertex_info_origin: ImmutOrigin = ImmutAnyOrigin](
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
        return self._cmd_draw_multi_ext(
            command_buffer,
            draw_count,
            Ptr(to=p_vertex_info).bitcast[Ptr[MultiDrawInfoEXT, ImmutAnyOrigin]]()[],
            instance_count,
            first_instance,
            stride,
        )

    fn cmd_draw_multi_indexed_ext[
        p_index_info_origin: ImmutOrigin = ImmutAnyOrigin,
        p_vertex_offset_origin: ImmutOrigin = ImmutAnyOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_index_info: Ptr[MultiDrawIndexedInfoEXT, p_index_info_origin],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
        p_vertex_offset: Ptr[Int32, p_vertex_offset_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMultiIndexedEXT.html
        """
        return self._cmd_draw_multi_indexed_ext(
            command_buffer,
            draw_count,
            Ptr(to=p_index_info).bitcast[Ptr[MultiDrawIndexedInfoEXT, ImmutAnyOrigin]]()[],
            instance_count,
            first_instance,
            stride,
            Ptr(to=p_vertex_offset).bitcast[Ptr[Int32, ImmutAnyOrigin]]()[],
        )


struct OpacityMicromap(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_micromap_ext: fn(
        device: Device,
        p_create_info: Ptr[MicromapCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_micromap: Ptr[MicromapEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_micromap_ext: fn(
        device: Device, micromap: MicromapEXT, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _cmd_build_micromaps_ext: fn(
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin],
    )
    var _build_micromaps_ext: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _copy_micromap_ext: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMicromapInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _copy_micromap_to_memory_ext: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMicromapToMemoryInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _copy_memory_to_micromap_ext: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMemoryToMicromapInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _write_micromaps_properties_ext: fn(
        device: Device,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT, ImmutAnyOrigin],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: UInt,
    ) -> Result
    var _cmd_copy_micromap_ext: fn(
        command_buffer: CommandBuffer, p_info: Ptr[CopyMicromapInfoEXT, ImmutAnyOrigin]
    )
    var _cmd_copy_micromap_to_memory_ext: fn(
        command_buffer: CommandBuffer, p_info: Ptr[CopyMicromapToMemoryInfoEXT, ImmutAnyOrigin]
    )
    var _cmd_copy_memory_to_micromap_ext: fn(
        command_buffer: CommandBuffer, p_info: Ptr[CopyMemoryToMicromapInfoEXT, ImmutAnyOrigin]
    )
    var _cmd_write_micromaps_properties_ext: fn(
        command_buffer: CommandBuffer,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT, ImmutAnyOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    )
    var _get_device_micromap_compatibility_ext: fn(
        device: Device,
        p_version_info: Ptr[MicromapVersionInfoEXT, ImmutAnyOrigin],
        p_compatibility: Ptr[AccelerationStructureCompatibilityKHR, MutAnyOrigin],
    )
    var _get_micromap_build_sizes_ext: fn(
        device: Device,
        build_type: AccelerationStructureBuildTypeKHR,
        p_build_info: Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin],
        p_size_info: Ptr[MicromapBuildSizesInfoEXT, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkCreateMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_micromap_ext)]()[]
        self._destroy_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkDestroyMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_micromap_ext)]()[]
        self._cmd_build_micromaps_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildMicromapsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_micromaps_ext)]()[]
        self._build_micromaps_ext = Ptr(to=get_device_proc_addr(
            device, "vkBuildMicromapsEXT".as_c_string_slice()
        )).bitcast[type_of(self._build_micromaps_ext)]()[]
        self._copy_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkCopyMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._copy_micromap_ext)]()[]
        self._copy_micromap_to_memory_ext = Ptr(to=get_device_proc_addr(
            device, "vkCopyMicromapToMemoryEXT".as_c_string_slice()
        )).bitcast[type_of(self._copy_micromap_to_memory_ext)]()[]
        self._copy_memory_to_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkCopyMemoryToMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._copy_memory_to_micromap_ext)]()[]
        self._write_micromaps_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkWriteMicromapsPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._write_micromaps_properties_ext)]()[]
        self._cmd_copy_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_micromap_ext)]()[]
        self._cmd_copy_micromap_to_memory_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMicromapToMemoryEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_micromap_to_memory_ext)]()[]
        self._cmd_copy_memory_to_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToMicromapEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_memory_to_micromap_ext)]()[]
        self._cmd_write_micromaps_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteMicromapsPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_write_micromaps_properties_ext)]()[]
        self._get_device_micromap_compatibility_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceMicromapCompatibilityEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_device_micromap_compatibility_ext)]()[]
        self._get_micromap_build_sizes_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetMicromapBuildSizesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_micromap_build_sizes_ext)]()[]

    fn create_micromap_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: MicromapCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut micromap: MicromapEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateMicromapEXT.html
        """
        return self._create_micromap_ext(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=micromap),
        )

    fn destroy_micromap_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        micromap: MicromapEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyMicromapEXT.html
        """
        return self._destroy_micromap_ext(
            device, micromap, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn cmd_build_micromaps_ext[p_infos_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, p_infos_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildMicromapsEXT.html
        """
        return self._cmd_build_micromaps_ext(
            command_buffer,
            info_count,
            Ptr(to=p_infos).bitcast[Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin]]()[],
        )

    fn build_micromaps_ext[p_infos_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, p_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBuildMicromapsEXT.html
        """
        return self._build_micromaps_ext(
            device,
            deferred_operation,
            info_count,
            Ptr(to=p_infos).bitcast[Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin]]()[],
        )

    fn copy_micromap_ext(
        self, device: Device, deferred_operation: DeferredOperationKHR, info: CopyMicromapInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMicromapEXT.html
        """
        return self._copy_micromap_ext(device, deferred_operation, Ptr(to=info))

    fn copy_micromap_to_memory_ext(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMicromapToMemoryInfoEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMicromapToMemoryEXT.html
        """
        return self._copy_micromap_to_memory_ext(device, deferred_operation, Ptr(to=info))

    fn copy_memory_to_micromap_ext(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMemoryToMicromapInfoEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToMicromapEXT.html
        """
        return self._copy_memory_to_micromap_ext(device, deferred_operation, Ptr(to=info))

    fn write_micromaps_properties_ext[
        p_micromaps_origin: ImmutOrigin = ImmutAnyOrigin, p_data_origin: MutOrigin = MutAnyOrigin
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
        return self._write_micromaps_properties_ext(
            device,
            micromap_count,
            Ptr(to=p_micromaps).bitcast[Ptr[MicromapEXT, ImmutAnyOrigin]]()[],
            query_type,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
            stride,
        )

    fn cmd_copy_micromap_ext(self, command_buffer: CommandBuffer, info: CopyMicromapInfoEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMicromapEXT.html
        """
        return self._cmd_copy_micromap_ext(command_buffer, Ptr(to=info))

    fn cmd_copy_micromap_to_memory_ext(
        self, command_buffer: CommandBuffer, info: CopyMicromapToMemoryInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMicromapToMemoryEXT.html
        """
        return self._cmd_copy_micromap_to_memory_ext(command_buffer, Ptr(to=info))

    fn cmd_copy_memory_to_micromap_ext(
        self, command_buffer: CommandBuffer, info: CopyMemoryToMicromapInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryToMicromapEXT.html
        """
        return self._cmd_copy_memory_to_micromap_ext(command_buffer, Ptr(to=info))

    fn cmd_write_micromaps_properties_ext[p_micromaps_origin: ImmutOrigin = ImmutAnyOrigin](
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
        return self._cmd_write_micromaps_properties_ext(
            command_buffer,
            micromap_count,
            Ptr(to=p_micromaps).bitcast[Ptr[MicromapEXT, ImmutAnyOrigin]]()[],
            query_type,
            query_pool,
            first_query,
        )

    fn get_device_micromap_compatibility_ext(
        self,
        device: Device,
        version_info: MicromapVersionInfoEXT,
        mut compatibility: AccelerationStructureCompatibilityKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMicromapCompatibilityEXT.html
        """
        return self._get_device_micromap_compatibility_ext(
            device, Ptr(to=version_info), Ptr(to=compatibility)
        )

    fn get_micromap_build_sizes_ext(
        self,
        device: Device,
        build_type: AccelerationStructureBuildTypeKHR,
        build_info: MicromapBuildInfoEXT,
        mut size_info: MicromapBuildSizesInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMicromapBuildSizesEXT.html
        """
        return self._get_micromap_build_sizes_ext(device, build_type, Ptr(to=build_info), Ptr(to=size_info))


struct PageableDeviceLocalMemory(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_device_memory_priority_ext: fn(device: Device, memory: DeviceMemory, priority: Float32)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_device_memory_priority_ext = Ptr(to=get_device_proc_addr(
            device, "vkSetDeviceMemoryPriorityEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_device_memory_priority_ext)]()[]

    fn set_device_memory_priority_ext(
        self, device: Device, memory: DeviceMemory, priority: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDeviceMemoryPriorityEXT.html
        """
        return self._set_device_memory_priority_ext(device, memory, priority)


struct ExtendedDynamicState3(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_depth_clamp_enable_ext: fn(command_buffer: CommandBuffer, depth_clamp_enable: Bool32)
    var _cmd_set_polygon_mode_ext: fn(command_buffer: CommandBuffer, polygon_mode: PolygonMode)
    var _cmd_set_rasterization_samples_ext: fn(
        command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    )
    var _cmd_set_sample_mask_ext: fn(
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask, ImmutAnyOrigin],
    )
    var _cmd_set_alpha_to_coverage_enable_ext: fn(
        command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    )
    var _cmd_set_alpha_to_one_enable_ext: fn(command_buffer: CommandBuffer, alpha_to_one_enable: Bool32)
    var _cmd_set_logic_op_enable_ext: fn(command_buffer: CommandBuffer, logic_op_enable: Bool32)
    var _cmd_set_color_blend_enable_ext: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, ImmutAnyOrigin],
    )
    var _cmd_set_color_blend_equation_ext: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT, ImmutAnyOrigin],
    )
    var _cmd_set_color_write_mask_ext: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, ImmutAnyOrigin],
    )
    var _cmd_set_tessellation_domain_origin_ext: fn(
        command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    )
    var _cmd_set_rasterization_stream_ext: fn(
        command_buffer: CommandBuffer, rasterization_stream: UInt32
    )
    var _cmd_set_conservative_rasterization_mode_ext: fn(
        command_buffer: CommandBuffer, conservative_rasterization_mode: ConservativeRasterizationModeEXT
    )
    var _cmd_set_extra_primitive_overestimation_size_ext: fn(
        command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    )
    var _cmd_set_depth_clip_enable_ext: fn(command_buffer: CommandBuffer, depth_clip_enable: Bool32)
    var _cmd_set_sample_locations_enable_ext: fn(
        command_buffer: CommandBuffer, sample_locations_enable: Bool32
    )
    var _cmd_set_color_blend_advanced_ext: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin],
    )
    var _cmd_set_provoking_vertex_mode_ext: fn(
        command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    )
    var _cmd_set_line_rasterization_mode_ext: fn(
        command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    )
    var _cmd_set_line_stipple_enable_ext: fn(
        command_buffer: CommandBuffer, stippled_line_enable: Bool32
    )
    var _cmd_set_depth_clip_negative_one_to_one_ext: fn(
        command_buffer: CommandBuffer, negative_one_to_one: Bool32
    )
    var _cmd_set_viewport_w_scaling_enable_nv: fn(
        command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    )
    var _cmd_set_viewport_swizzle_nv: fn(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, ImmutAnyOrigin],
    )
    var _cmd_set_coverage_to_color_enable_nv: fn(
        command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    )
    var _cmd_set_coverage_to_color_location_nv: fn(
        command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    )
    var _cmd_set_coverage_modulation_mode_nv: fn(
        command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    )
    var _cmd_set_coverage_modulation_table_enable_nv: fn(
        command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    )
    var _cmd_set_coverage_modulation_table_nv: fn(
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, ImmutAnyOrigin],
    )
    var _cmd_set_shading_rate_image_enable_nv: fn(
        command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    )
    var _cmd_set_representative_fragment_test_enable_nv: fn(
        command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    )
    var _cmd_set_coverage_reduction_mode_nv: fn(
        command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_clamp_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clamp_enable_ext)]()[]
        self._cmd_set_polygon_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPolygonModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_polygon_mode_ext)]()[]
        self._cmd_set_rasterization_samples_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationSamplesEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterization_samples_ext)]()[]
        self._cmd_set_sample_mask_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleMaskEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_mask_ext)]()[]
        self._cmd_set_alpha_to_coverage_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToCoverageEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_alpha_to_coverage_enable_ext)]()[]
        self._cmd_set_alpha_to_one_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToOneEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_alpha_to_one_enable_ext)]()[]
        self._cmd_set_logic_op_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_logic_op_enable_ext)]()[]
        self._cmd_set_color_blend_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_enable_ext)]()[]
        self._cmd_set_color_blend_equation_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEquationEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_equation_ext)]()[]
        self._cmd_set_color_write_mask_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorWriteMaskEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_write_mask_ext)]()[]
        self._cmd_set_tessellation_domain_origin_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetTessellationDomainOriginEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_tessellation_domain_origin_ext)]()[]
        self._cmd_set_rasterization_stream_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationStreamEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterization_stream_ext)]()[]
        self._cmd_set_conservative_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetConservativeRasterizationModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_conservative_rasterization_mode_ext)]()[]
        self._cmd_set_extra_primitive_overestimation_size_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExtraPrimitiveOverestimationSizeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_extra_primitive_overestimation_size_ext)]()[]
        self._cmd_set_depth_clip_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clip_enable_ext)]()[]
        self._cmd_set_sample_locations_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleLocationsEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_locations_enable_ext)]()[]
        self._cmd_set_color_blend_advanced_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendAdvancedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_advanced_ext)]()[]
        self._cmd_set_provoking_vertex_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetProvokingVertexModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_provoking_vertex_mode_ext)]()[]
        self._cmd_set_line_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineRasterizationModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_rasterization_mode_ext)]()[]
        self._cmd_set_line_stipple_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStippleEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_stipple_enable_ext)]()[]
        self._cmd_set_depth_clip_negative_one_to_one_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipNegativeOneToOneEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clip_negative_one_to_one_ext)]()[]
        self._cmd_set_viewport_w_scaling_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWScalingEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_w_scaling_enable_nv)]()[]
        self._cmd_set_viewport_swizzle_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportSwizzleNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_swizzle_nv)]()[]
        self._cmd_set_coverage_to_color_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_to_color_enable_nv)]()[]
        self._cmd_set_coverage_to_color_location_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorLocationNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_to_color_location_nv)]()[]
        self._cmd_set_coverage_modulation_mode_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationModeNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_mode_nv)]()[]
        self._cmd_set_coverage_modulation_table_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_table_enable_nv)]()[]
        self._cmd_set_coverage_modulation_table_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_table_nv)]()[]
        self._cmd_set_shading_rate_image_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetShadingRateImageEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_shading_rate_image_enable_nv)]()[]
        self._cmd_set_representative_fragment_test_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRepresentativeFragmentTestEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_representative_fragment_test_enable_nv)]()[]
        self._cmd_set_coverage_reduction_mode_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageReductionModeNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_reduction_mode_nv)]()[]

    fn cmd_set_depth_clamp_enable_ext(
        self, command_buffer: CommandBuffer, depth_clamp_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampEnableEXT.html
        """
        return self._cmd_set_depth_clamp_enable_ext(command_buffer, depth_clamp_enable)

    fn cmd_set_polygon_mode_ext(self, command_buffer: CommandBuffer, polygon_mode: PolygonMode):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPolygonModeEXT.html
        """
        return self._cmd_set_polygon_mode_ext(command_buffer, polygon_mode)

    fn cmd_set_rasterization_samples_ext(
        self, command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationSamplesEXT.html
        """
        return self._cmd_set_rasterization_samples_ext(command_buffer, rasterization_samples)

    fn cmd_set_sample_mask_ext[p_sample_mask_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask, p_sample_mask_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleMaskEXT.html
        """
        return self._cmd_set_sample_mask_ext(
            command_buffer, samples, Ptr(to=p_sample_mask).bitcast[Ptr[SampleMask, ImmutAnyOrigin]]()[]
        )

    fn cmd_set_alpha_to_coverage_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToCoverageEnableEXT.html
        """
        return self._cmd_set_alpha_to_coverage_enable_ext(command_buffer, alpha_to_coverage_enable)

    fn cmd_set_alpha_to_one_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToOneEnableEXT.html
        """
        return self._cmd_set_alpha_to_one_enable_ext(command_buffer, alpha_to_one_enable)

    fn cmd_set_logic_op_enable_ext(self, command_buffer: CommandBuffer, logic_op_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEnableEXT.html
        """
        return self._cmd_set_logic_op_enable_ext(command_buffer, logic_op_enable)

    fn cmd_set_color_blend_enable_ext[p_color_blend_enables_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, p_color_blend_enables_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendEnableEXT.html
        """
        return self._cmd_set_color_blend_enable_ext(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_enables).bitcast[Ptr[Bool32, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_color_blend_equation_ext[
        p_color_blend_equations_origin: ImmutOrigin = ImmutAnyOrigin
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
        return self._cmd_set_color_blend_equation_ext(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_equations).bitcast[Ptr[ColorBlendEquationEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_color_write_mask_ext[p_color_write_masks_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, p_color_write_masks_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorWriteMaskEXT.html
        """
        return self._cmd_set_color_write_mask_ext(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_write_masks).bitcast[Ptr[ColorComponentFlags, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_tessellation_domain_origin_ext(
        self, command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetTessellationDomainOriginEXT.html
        """
        return self._cmd_set_tessellation_domain_origin_ext(command_buffer, domain_origin)

    fn cmd_set_rasterization_stream_ext(
        self, command_buffer: CommandBuffer, rasterization_stream: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationStreamEXT.html
        """
        return self._cmd_set_rasterization_stream_ext(command_buffer, rasterization_stream)

    fn cmd_set_conservative_rasterization_mode_ext(
        self,
        command_buffer: CommandBuffer,
        conservative_rasterization_mode: ConservativeRasterizationModeEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetConservativeRasterizationModeEXT.html
        """
        return self._cmd_set_conservative_rasterization_mode_ext(
            command_buffer, conservative_rasterization_mode
        )

    fn cmd_set_extra_primitive_overestimation_size_ext(
        self, command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExtraPrimitiveOverestimationSizeEXT.html
        """
        return self._cmd_set_extra_primitive_overestimation_size_ext(
            command_buffer, extra_primitive_overestimation_size
        )

    fn cmd_set_depth_clip_enable_ext(
        self, command_buffer: CommandBuffer, depth_clip_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipEnableEXT.html
        """
        return self._cmd_set_depth_clip_enable_ext(command_buffer, depth_clip_enable)

    fn cmd_set_sample_locations_enable_ext(
        self, command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEnableEXT.html
        """
        return self._cmd_set_sample_locations_enable_ext(command_buffer, sample_locations_enable)

    fn cmd_set_color_blend_advanced_ext[
        p_color_blend_advanced_origin: ImmutOrigin = ImmutAnyOrigin
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
        return self._cmd_set_color_blend_advanced_ext(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_advanced).bitcast[Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_provoking_vertex_mode_ext(
        self, command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetProvokingVertexModeEXT.html
        """
        return self._cmd_set_provoking_vertex_mode_ext(command_buffer, provoking_vertex_mode)

    fn cmd_set_line_rasterization_mode_ext(
        self, command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineRasterizationModeEXT.html
        """
        return self._cmd_set_line_rasterization_mode_ext(command_buffer, line_rasterization_mode)

    fn cmd_set_line_stipple_enable_ext(
        self, command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStippleEnableEXT.html
        """
        return self._cmd_set_line_stipple_enable_ext(command_buffer, stippled_line_enable)

    fn cmd_set_depth_clip_negative_one_to_one_ext(
        self, command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipNegativeOneToOneEXT.html
        """
        return self._cmd_set_depth_clip_negative_one_to_one_ext(command_buffer, negative_one_to_one)

    fn cmd_set_viewport_w_scaling_enable_nv(
        self, command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingEnableNV.html
        """
        return self._cmd_set_viewport_w_scaling_enable_nv(command_buffer, viewport_w_scaling_enable)

    fn cmd_set_viewport_swizzle_nv[p_viewport_swizzles_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, p_viewport_swizzles_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportSwizzleNV.html
        """
        return self._cmd_set_viewport_swizzle_nv(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_viewport_swizzles).bitcast[Ptr[ViewportSwizzleNV, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_coverage_to_color_enable_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorEnableNV.html
        """
        return self._cmd_set_coverage_to_color_enable_nv(command_buffer, coverage_to_color_enable)

    fn cmd_set_coverage_to_color_location_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorLocationNV.html
        """
        return self._cmd_set_coverage_to_color_location_nv(command_buffer, coverage_to_color_location)

    fn cmd_set_coverage_modulation_mode_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationModeNV.html
        """
        return self._cmd_set_coverage_modulation_mode_nv(command_buffer, coverage_modulation_mode)

    fn cmd_set_coverage_modulation_table_enable_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableEnableNV.html
        """
        return self._cmd_set_coverage_modulation_table_enable_nv(
            command_buffer, coverage_modulation_table_enable
        )

    fn cmd_set_coverage_modulation_table_nv[
        p_coverage_modulation_table_origin: ImmutOrigin = ImmutAnyOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, p_coverage_modulation_table_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableNV.html
        """
        return self._cmd_set_coverage_modulation_table_nv(
            command_buffer,
            coverage_modulation_table_count,
            Ptr(to=p_coverage_modulation_table).bitcast[Ptr[Float32, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_shading_rate_image_enable_nv(
        self, command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetShadingRateImageEnableNV.html
        """
        return self._cmd_set_shading_rate_image_enable_nv(command_buffer, shading_rate_image_enable)

    fn cmd_set_representative_fragment_test_enable_nv(
        self, command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRepresentativeFragmentTestEnableNV.html
        """
        return self._cmd_set_representative_fragment_test_enable_nv(
            command_buffer, representative_fragment_test_enable
        )

    fn cmd_set_coverage_reduction_mode_nv(
        self, command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageReductionModeNV.html
        """
        return self._cmd_set_coverage_reduction_mode_nv(command_buffer, coverage_reduction_mode)


struct ShaderModuleIdentifier(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_shader_module_identifier_ext: fn(
        device: Device,
        shader_module: ShaderModule,
        p_identifier: Ptr[ShaderModuleIdentifierEXT, MutAnyOrigin],
    )
    var _get_shader_module_create_info_identifier_ext: fn(
        device: Device,
        p_create_info: Ptr[ShaderModuleCreateInfo, ImmutAnyOrigin],
        p_identifier: Ptr[ShaderModuleIdentifierEXT, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_shader_module_identifier_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderModuleIdentifierEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_shader_module_identifier_ext)]()[]
        self._get_shader_module_create_info_identifier_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderModuleCreateInfoIdentifierEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_shader_module_create_info_identifier_ext)]()[]

    fn get_shader_module_identifier_ext(
        self, device: Device, shader_module: ShaderModule, mut identifier: ShaderModuleIdentifierEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderModuleIdentifierEXT.html
        """
        return self._get_shader_module_identifier_ext(device, shader_module, Ptr(to=identifier))

    fn get_shader_module_create_info_identifier_ext(
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        mut identifier: ShaderModuleIdentifierEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderModuleCreateInfoIdentifierEXT.html
        """
        return self._get_shader_module_create_info_identifier_ext(
            device, Ptr(to=create_info), Ptr(to=identifier)
        )


struct ShaderObject(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_shaders_ext: fn(
        device: Device,
        create_info_count: UInt32,
        p_create_infos: Ptr[ShaderCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_shaders: Ptr[ShaderEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_shader_ext: fn(
        device: Device, shader: ShaderEXT, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _get_shader_binary_data_ext: fn(
        device: Device,
        shader: ShaderEXT,
        p_data_size: Ptr[UInt, MutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _cmd_bind_shaders_ext: fn(
        command_buffer: CommandBuffer,
        stage_count: UInt32,
        p_stages: Ptr[ShaderStageFlagBits, ImmutAnyOrigin],
        p_shaders: Ptr[ShaderEXT, ImmutAnyOrigin],
    )
    var _cmd_set_cull_mode: fn(command_buffer: CommandBuffer, cull_mode: CullModeFlags)
    var _cmd_set_front_face: fn(command_buffer: CommandBuffer, front_face: FrontFace)
    var _cmd_set_primitive_topology: fn(
        command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    )
    var _cmd_set_viewport_with_count: fn(
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    )
    var _cmd_set_scissor_with_count: fn(
        command_buffer: CommandBuffer, scissor_count: UInt32, p_scissors: Ptr[Rect2D, ImmutAnyOrigin]
    )
    var _cmd_bind_vertex_buffers_2: fn(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
        p_sizes: Ptr[DeviceSize, ImmutAnyOrigin],
        p_strides: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _cmd_set_depth_test_enable: fn(command_buffer: CommandBuffer, depth_test_enable: Bool32)
    var _cmd_set_depth_write_enable: fn(command_buffer: CommandBuffer, depth_write_enable: Bool32)
    var _cmd_set_depth_compare_op: fn(command_buffer: CommandBuffer, depth_compare_op: CompareOp)
    var _cmd_set_depth_bounds_test_enable: fn(
        command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    )
    var _cmd_set_stencil_test_enable: fn(command_buffer: CommandBuffer, stencil_test_enable: Bool32)
    var _cmd_set_stencil_op: fn(
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    )
    var _cmd_set_vertex_input_ext: fn(
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin],
    )
    var _cmd_set_patch_control_points_ext: fn(
        command_buffer: CommandBuffer, patch_control_points: UInt32
    )
    var _cmd_set_rasterizer_discard_enable: fn(
        command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    )
    var _cmd_set_depth_bias_enable: fn(command_buffer: CommandBuffer, depth_bias_enable: Bool32)
    var _cmd_set_logic_op_ext: fn(command_buffer: CommandBuffer, logic_op: LogicOp)
    var _cmd_set_primitive_restart_enable: fn(
        command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    )
    var _cmd_set_tessellation_domain_origin_ext: fn(
        command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    )
    var _cmd_set_depth_clamp_enable_ext: fn(command_buffer: CommandBuffer, depth_clamp_enable: Bool32)
    var _cmd_set_polygon_mode_ext: fn(command_buffer: CommandBuffer, polygon_mode: PolygonMode)
    var _cmd_set_rasterization_samples_ext: fn(
        command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    )
    var _cmd_set_sample_mask_ext: fn(
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask, ImmutAnyOrigin],
    )
    var _cmd_set_alpha_to_coverage_enable_ext: fn(
        command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    )
    var _cmd_set_alpha_to_one_enable_ext: fn(command_buffer: CommandBuffer, alpha_to_one_enable: Bool32)
    var _cmd_set_logic_op_enable_ext: fn(command_buffer: CommandBuffer, logic_op_enable: Bool32)
    var _cmd_set_color_blend_enable_ext: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, ImmutAnyOrigin],
    )
    var _cmd_set_color_blend_equation_ext: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT, ImmutAnyOrigin],
    )
    var _cmd_set_color_write_mask_ext: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, ImmutAnyOrigin],
    )
    var _cmd_set_rasterization_stream_ext: fn(
        command_buffer: CommandBuffer, rasterization_stream: UInt32
    )
    var _cmd_set_conservative_rasterization_mode_ext: fn(
        command_buffer: CommandBuffer, conservative_rasterization_mode: ConservativeRasterizationModeEXT
    )
    var _cmd_set_extra_primitive_overestimation_size_ext: fn(
        command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    )
    var _cmd_set_depth_clip_enable_ext: fn(command_buffer: CommandBuffer, depth_clip_enable: Bool32)
    var _cmd_set_sample_locations_enable_ext: fn(
        command_buffer: CommandBuffer, sample_locations_enable: Bool32
    )
    var _cmd_set_color_blend_advanced_ext: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin],
    )
    var _cmd_set_provoking_vertex_mode_ext: fn(
        command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    )
    var _cmd_set_line_rasterization_mode_ext: fn(
        command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    )
    var _cmd_set_line_stipple_enable_ext: fn(
        command_buffer: CommandBuffer, stippled_line_enable: Bool32
    )
    var _cmd_set_depth_clip_negative_one_to_one_ext: fn(
        command_buffer: CommandBuffer, negative_one_to_one: Bool32
    )
    var _cmd_set_viewport_w_scaling_enable_nv: fn(
        command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    )
    var _cmd_set_viewport_swizzle_nv: fn(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, ImmutAnyOrigin],
    )
    var _cmd_set_coverage_to_color_enable_nv: fn(
        command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    )
    var _cmd_set_coverage_to_color_location_nv: fn(
        command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    )
    var _cmd_set_coverage_modulation_mode_nv: fn(
        command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    )
    var _cmd_set_coverage_modulation_table_enable_nv: fn(
        command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    )
    var _cmd_set_coverage_modulation_table_nv: fn(
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, ImmutAnyOrigin],
    )
    var _cmd_set_shading_rate_image_enable_nv: fn(
        command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    )
    var _cmd_set_representative_fragment_test_enable_nv: fn(
        command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    )
    var _cmd_set_coverage_reduction_mode_nv: fn(
        command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    )
    var _cmd_set_depth_clamp_range_ext: fn(
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_shaders_ext = Ptr(to=get_device_proc_addr(
            device, "vkCreateShadersEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_shaders_ext)]()[]
        self._destroy_shader_ext = Ptr(to=get_device_proc_addr(
            device, "vkDestroyShaderEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_shader_ext)]()[]
        self._get_shader_binary_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderBinaryDataEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_shader_binary_data_ext)]()[]
        self._cmd_bind_shaders_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindShadersEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_shaders_ext)]()[]
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
        self._cmd_set_vertex_input_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetVertexInputEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_vertex_input_ext)]()[]
        self._cmd_set_patch_control_points_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPatchControlPointsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_patch_control_points_ext)]()[]
        self._cmd_set_rasterizer_discard_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizerDiscardEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterizer_discard_enable)]()[]
        self._cmd_set_depth_bias_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBiasEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_bias_enable)]()[]
        self._cmd_set_logic_op_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_logic_op_ext)]()[]
        self._cmd_set_primitive_restart_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveRestartEnable".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_primitive_restart_enable)]()[]
        self._cmd_set_tessellation_domain_origin_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetTessellationDomainOriginEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_tessellation_domain_origin_ext)]()[]
        self._cmd_set_depth_clamp_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clamp_enable_ext)]()[]
        self._cmd_set_polygon_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPolygonModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_polygon_mode_ext)]()[]
        self._cmd_set_rasterization_samples_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationSamplesEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterization_samples_ext)]()[]
        self._cmd_set_sample_mask_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleMaskEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_mask_ext)]()[]
        self._cmd_set_alpha_to_coverage_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToCoverageEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_alpha_to_coverage_enable_ext)]()[]
        self._cmd_set_alpha_to_one_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToOneEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_alpha_to_one_enable_ext)]()[]
        self._cmd_set_logic_op_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_logic_op_enable_ext)]()[]
        self._cmd_set_color_blend_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_enable_ext)]()[]
        self._cmd_set_color_blend_equation_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEquationEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_equation_ext)]()[]
        self._cmd_set_color_write_mask_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorWriteMaskEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_write_mask_ext)]()[]
        self._cmd_set_rasterization_stream_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationStreamEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rasterization_stream_ext)]()[]
        self._cmd_set_conservative_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetConservativeRasterizationModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_conservative_rasterization_mode_ext)]()[]
        self._cmd_set_extra_primitive_overestimation_size_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExtraPrimitiveOverestimationSizeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_extra_primitive_overestimation_size_ext)]()[]
        self._cmd_set_depth_clip_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clip_enable_ext)]()[]
        self._cmd_set_sample_locations_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleLocationsEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_locations_enable_ext)]()[]
        self._cmd_set_color_blend_advanced_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendAdvancedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_blend_advanced_ext)]()[]
        self._cmd_set_provoking_vertex_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetProvokingVertexModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_provoking_vertex_mode_ext)]()[]
        self._cmd_set_line_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineRasterizationModeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_rasterization_mode_ext)]()[]
        self._cmd_set_line_stipple_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStippleEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_stipple_enable_ext)]()[]
        self._cmd_set_depth_clip_negative_one_to_one_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipNegativeOneToOneEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clip_negative_one_to_one_ext)]()[]
        self._cmd_set_viewport_w_scaling_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWScalingEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_w_scaling_enable_nv)]()[]
        self._cmd_set_viewport_swizzle_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportSwizzleNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_swizzle_nv)]()[]
        self._cmd_set_coverage_to_color_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_to_color_enable_nv)]()[]
        self._cmd_set_coverage_to_color_location_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorLocationNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_to_color_location_nv)]()[]
        self._cmd_set_coverage_modulation_mode_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationModeNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_mode_nv)]()[]
        self._cmd_set_coverage_modulation_table_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_table_enable_nv)]()[]
        self._cmd_set_coverage_modulation_table_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_modulation_table_nv)]()[]
        self._cmd_set_shading_rate_image_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetShadingRateImageEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_shading_rate_image_enable_nv)]()[]
        self._cmd_set_representative_fragment_test_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRepresentativeFragmentTestEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_representative_fragment_test_enable_nv)]()[]
        self._cmd_set_coverage_reduction_mode_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageReductionModeNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coverage_reduction_mode_nv)]()[]
        self._cmd_set_depth_clamp_range_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampRangeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clamp_range_ext)]()[]

    fn create_shaders_ext[
        p_create_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        p_allocator_origin: ImmutOrigin = ImmutAnyOrigin,
        p_shaders_origin: MutOrigin = MutAnyOrigin,
    ](
        self,
        device: Device,
        create_info_count: UInt32,
        p_create_infos: Ptr[ShaderCreateInfoEXT, p_create_infos_origin],
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        p_shaders: Ptr[ShaderEXT, p_shaders_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShadersEXT.html
        """
        return self._create_shaders_ext(
            device,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[ShaderCreateInfoEXT, ImmutAnyOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=p_shaders).bitcast[Ptr[ShaderEXT, MutAnyOrigin]]()[],
        )

    fn destroy_shader_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        shader: ShaderEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderEXT.html
        """
        return self._destroy_shader_ext(
            device, shader, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn get_shader_binary_data_ext[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        shader: ShaderEXT,
        mut data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderBinaryDataEXT.html
        """
        return self._get_shader_binary_data_ext(
            device, shader, Ptr(to=data_size), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_shader_binary_data_ext[p_data_origin: MutOrigin = MutAnyOrigin](
        self, device: Device, shader: ShaderEXT
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderBinaryDataEXT.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_shader_binary_data_ext(
        device, shader, Ptr(to=count), Ptr[NoneType, MutOrigin.external]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_shader_binary_data_ext(
        device, shader, Ptr(to=count), list.unsafe_ptr().bitcast[NoneType]()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn cmd_bind_shaders_ext[
        p_stages_origin: ImmutOrigin = ImmutAnyOrigin,
        p_shaders_origin: ImmutOrigin = ImmutAnyOrigin,
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
        return self._cmd_bind_shaders_ext(
            command_buffer,
            stage_count,
            Ptr(to=p_stages).bitcast[Ptr[ShaderStageFlagBits, ImmutAnyOrigin]]()[],
            Ptr(to=p_shaders).bitcast[Ptr[ShaderEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCullMode.html
        """
        return self._cmd_set_cull_mode(command_buffer, cull_mode)

    fn cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFrontFace.html
        """
        return self._cmd_set_front_face(command_buffer, front_face)

    fn cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveTopology.html
        """
        return self._cmd_set_primitive_topology(command_buffer, primitive_topology)

    fn cmd_set_viewport_with_count[p_viewports_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWithCount.html
        """
        return self._cmd_set_viewport_with_count(
            command_buffer, viewport_count, Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutAnyOrigin]]()[]
        )

    fn cmd_set_scissor_with_count[p_scissors_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissorWithCount.html
        """
        return self._cmd_set_scissor_with_count(
            command_buffer, scissor_count, Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutAnyOrigin]]()[]
        )

    fn cmd_bind_vertex_buffers_2[
        p_buffers_origin: ImmutOrigin = ImmutAnyOrigin,
        p_offsets_origin: ImmutOrigin = ImmutAnyOrigin,
        p_sizes_origin: ImmutOrigin = ImmutAnyOrigin,
        p_strides_origin: ImmutOrigin = ImmutAnyOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
        p_sizes: Ptr[DeviceSize, p_sizes_origin],
        p_strides: Ptr[DeviceSize, p_strides_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers2.html
        """
        return self._cmd_bind_vertex_buffers_2(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutAnyOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
            Ptr(to=p_sizes).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
            Ptr(to=p_strides).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthTestEnable.html
        """
        return self._cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    fn cmd_set_depth_write_enable(self, command_buffer: CommandBuffer, depth_write_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthWriteEnable.html
        """
        return self._cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    fn cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthCompareOp.html
        """
        return self._cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    fn cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBoundsTestEnable.html
        """
        return self._cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    fn cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilTestEnable.html
        """
        return self._cmd_set_stencil_test_enable(command_buffer, stencil_test_enable)

    fn cmd_set_stencil_op(
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

    fn cmd_set_vertex_input_ext[
        p_vertex_binding_descriptions_origin: ImmutOrigin = ImmutAnyOrigin,
        p_vertex_attribute_descriptions_origin: ImmutOrigin = ImmutAnyOrigin,
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
        return self._cmd_set_vertex_input_ext(
            command_buffer,
            vertex_binding_description_count,
            Ptr(to=p_vertex_binding_descriptions).bitcast[Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin]]()[],
            vertex_attribute_description_count,
            Ptr(to=p_vertex_attribute_descriptions).bitcast[Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_patch_control_points_ext(
        self, command_buffer: CommandBuffer, patch_control_points: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPatchControlPointsEXT.html
        """
        return self._cmd_set_patch_control_points_ext(command_buffer, patch_control_points)

    fn cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizerDiscardEnable.html
        """
        return self._cmd_set_rasterizer_discard_enable(command_buffer, rasterizer_discard_enable)

    fn cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBiasEnable.html
        """
        return self._cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    fn cmd_set_logic_op_ext(self, command_buffer: CommandBuffer, logic_op: LogicOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEXT.html
        """
        return self._cmd_set_logic_op_ext(command_buffer, logic_op)

    fn cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)

    fn cmd_set_tessellation_domain_origin_ext(
        self, command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetTessellationDomainOriginEXT.html
        """
        return self._cmd_set_tessellation_domain_origin_ext(command_buffer, domain_origin)

    fn cmd_set_depth_clamp_enable_ext(
        self, command_buffer: CommandBuffer, depth_clamp_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampEnableEXT.html
        """
        return self._cmd_set_depth_clamp_enable_ext(command_buffer, depth_clamp_enable)

    fn cmd_set_polygon_mode_ext(self, command_buffer: CommandBuffer, polygon_mode: PolygonMode):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPolygonModeEXT.html
        """
        return self._cmd_set_polygon_mode_ext(command_buffer, polygon_mode)

    fn cmd_set_rasterization_samples_ext(
        self, command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationSamplesEXT.html
        """
        return self._cmd_set_rasterization_samples_ext(command_buffer, rasterization_samples)

    fn cmd_set_sample_mask_ext[p_sample_mask_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask, p_sample_mask_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleMaskEXT.html
        """
        return self._cmd_set_sample_mask_ext(
            command_buffer, samples, Ptr(to=p_sample_mask).bitcast[Ptr[SampleMask, ImmutAnyOrigin]]()[]
        )

    fn cmd_set_alpha_to_coverage_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToCoverageEnableEXT.html
        """
        return self._cmd_set_alpha_to_coverage_enable_ext(command_buffer, alpha_to_coverage_enable)

    fn cmd_set_alpha_to_one_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToOneEnableEXT.html
        """
        return self._cmd_set_alpha_to_one_enable_ext(command_buffer, alpha_to_one_enable)

    fn cmd_set_logic_op_enable_ext(self, command_buffer: CommandBuffer, logic_op_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEnableEXT.html
        """
        return self._cmd_set_logic_op_enable_ext(command_buffer, logic_op_enable)

    fn cmd_set_color_blend_enable_ext[p_color_blend_enables_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, p_color_blend_enables_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendEnableEXT.html
        """
        return self._cmd_set_color_blend_enable_ext(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_enables).bitcast[Ptr[Bool32, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_color_blend_equation_ext[
        p_color_blend_equations_origin: ImmutOrigin = ImmutAnyOrigin
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
        return self._cmd_set_color_blend_equation_ext(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_equations).bitcast[Ptr[ColorBlendEquationEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_color_write_mask_ext[p_color_write_masks_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, p_color_write_masks_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorWriteMaskEXT.html
        """
        return self._cmd_set_color_write_mask_ext(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_write_masks).bitcast[Ptr[ColorComponentFlags, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_rasterization_stream_ext(
        self, command_buffer: CommandBuffer, rasterization_stream: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationStreamEXT.html
        """
        return self._cmd_set_rasterization_stream_ext(command_buffer, rasterization_stream)

    fn cmd_set_conservative_rasterization_mode_ext(
        self,
        command_buffer: CommandBuffer,
        conservative_rasterization_mode: ConservativeRasterizationModeEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetConservativeRasterizationModeEXT.html
        """
        return self._cmd_set_conservative_rasterization_mode_ext(
            command_buffer, conservative_rasterization_mode
        )

    fn cmd_set_extra_primitive_overestimation_size_ext(
        self, command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExtraPrimitiveOverestimationSizeEXT.html
        """
        return self._cmd_set_extra_primitive_overestimation_size_ext(
            command_buffer, extra_primitive_overestimation_size
        )

    fn cmd_set_depth_clip_enable_ext(
        self, command_buffer: CommandBuffer, depth_clip_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipEnableEXT.html
        """
        return self._cmd_set_depth_clip_enable_ext(command_buffer, depth_clip_enable)

    fn cmd_set_sample_locations_enable_ext(
        self, command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEnableEXT.html
        """
        return self._cmd_set_sample_locations_enable_ext(command_buffer, sample_locations_enable)

    fn cmd_set_color_blend_advanced_ext[
        p_color_blend_advanced_origin: ImmutOrigin = ImmutAnyOrigin
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
        return self._cmd_set_color_blend_advanced_ext(
            command_buffer,
            first_attachment,
            attachment_count,
            Ptr(to=p_color_blend_advanced).bitcast[Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_provoking_vertex_mode_ext(
        self, command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetProvokingVertexModeEXT.html
        """
        return self._cmd_set_provoking_vertex_mode_ext(command_buffer, provoking_vertex_mode)

    fn cmd_set_line_rasterization_mode_ext(
        self, command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineRasterizationModeEXT.html
        """
        return self._cmd_set_line_rasterization_mode_ext(command_buffer, line_rasterization_mode)

    fn cmd_set_line_stipple_enable_ext(
        self, command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStippleEnableEXT.html
        """
        return self._cmd_set_line_stipple_enable_ext(command_buffer, stippled_line_enable)

    fn cmd_set_depth_clip_negative_one_to_one_ext(
        self, command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipNegativeOneToOneEXT.html
        """
        return self._cmd_set_depth_clip_negative_one_to_one_ext(command_buffer, negative_one_to_one)

    fn cmd_set_viewport_w_scaling_enable_nv(
        self, command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingEnableNV.html
        """
        return self._cmd_set_viewport_w_scaling_enable_nv(command_buffer, viewport_w_scaling_enable)

    fn cmd_set_viewport_swizzle_nv[p_viewport_swizzles_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, p_viewport_swizzles_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportSwizzleNV.html
        """
        return self._cmd_set_viewport_swizzle_nv(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_viewport_swizzles).bitcast[Ptr[ViewportSwizzleNV, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_coverage_to_color_enable_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorEnableNV.html
        """
        return self._cmd_set_coverage_to_color_enable_nv(command_buffer, coverage_to_color_enable)

    fn cmd_set_coverage_to_color_location_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorLocationNV.html
        """
        return self._cmd_set_coverage_to_color_location_nv(command_buffer, coverage_to_color_location)

    fn cmd_set_coverage_modulation_mode_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationModeNV.html
        """
        return self._cmd_set_coverage_modulation_mode_nv(command_buffer, coverage_modulation_mode)

    fn cmd_set_coverage_modulation_table_enable_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableEnableNV.html
        """
        return self._cmd_set_coverage_modulation_table_enable_nv(
            command_buffer, coverage_modulation_table_enable
        )

    fn cmd_set_coverage_modulation_table_nv[
        p_coverage_modulation_table_origin: ImmutOrigin = ImmutAnyOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, p_coverage_modulation_table_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableNV.html
        """
        return self._cmd_set_coverage_modulation_table_nv(
            command_buffer,
            coverage_modulation_table_count,
            Ptr(to=p_coverage_modulation_table).bitcast[Ptr[Float32, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_shading_rate_image_enable_nv(
        self, command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetShadingRateImageEnableNV.html
        """
        return self._cmd_set_shading_rate_image_enable_nv(command_buffer, shading_rate_image_enable)

    fn cmd_set_representative_fragment_test_enable_nv(
        self, command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRepresentativeFragmentTestEnableNV.html
        """
        return self._cmd_set_representative_fragment_test_enable_nv(
            command_buffer, representative_fragment_test_enable
        )

    fn cmd_set_coverage_reduction_mode_nv(
        self, command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageReductionModeNV.html
        """
        return self._cmd_set_coverage_reduction_mode_nv(command_buffer, coverage_reduction_mode)

    fn cmd_set_depth_clamp_range_ext[p_depth_clamp_range_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT, p_depth_clamp_range_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampRangeEXT.html
        """
        return self._cmd_set_depth_clamp_range_ext(
            command_buffer,
            depth_clamp_mode,
            Ptr(to=p_depth_clamp_range).bitcast[Ptr[DepthClampRangeEXT, ImmutAnyOrigin]]()[],
        )


struct AttachmentFeedbackLoopDynamicState(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_attachment_feedback_loop_enable_ext: fn(
        command_buffer: CommandBuffer, aspect_mask: ImageAspectFlags
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_attachment_feedback_loop_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAttachmentFeedbackLoopEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_attachment_feedback_loop_enable_ext)]()[]

    fn cmd_set_attachment_feedback_loop_enable_ext(
        self, command_buffer: CommandBuffer, aspect_mask: ImageAspectFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAttachmentFeedbackLoopEnableEXT.html
        """
        return self._cmd_set_attachment_feedback_loop_enable_ext(command_buffer, aspect_mask)


struct DeviceGeneratedCommands(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_generated_commands_memory_requirements_ext: fn(
        device: Device,
        p_info: Ptr[GeneratedCommandsMemoryRequirementsInfoEXT, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _cmd_preprocess_generated_commands_ext: fn(
        command_buffer: CommandBuffer,
        p_generated_commands_info: Ptr[GeneratedCommandsInfoEXT, ImmutAnyOrigin],
        state_command_buffer: CommandBuffer,
    )
    var _cmd_execute_generated_commands_ext: fn(
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        p_generated_commands_info: Ptr[GeneratedCommandsInfoEXT, ImmutAnyOrigin],
    )
    var _create_indirect_commands_layout_ext: fn(
        device: Device,
        p_create_info: Ptr[IndirectCommandsLayoutCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_indirect_commands_layout: Ptr[IndirectCommandsLayoutEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_indirect_commands_layout_ext: fn(
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _create_indirect_execution_set_ext: fn(
        device: Device,
        p_create_info: Ptr[IndirectExecutionSetCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_indirect_execution_set: Ptr[IndirectExecutionSetEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_indirect_execution_set_ext: fn(
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _update_indirect_execution_set_pipeline_ext: fn(
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetPipelineEXT, ImmutAnyOrigin],
    )
    var _update_indirect_execution_set_shader_ext: fn(
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetShaderEXT, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_generated_commands_memory_requirements_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetGeneratedCommandsMemoryRequirementsEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_generated_commands_memory_requirements_ext)]()[]
        self._cmd_preprocess_generated_commands_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdPreprocessGeneratedCommandsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_preprocess_generated_commands_ext)]()[]
        self._cmd_execute_generated_commands_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdExecuteGeneratedCommandsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_execute_generated_commands_ext)]()[]
        self._create_indirect_commands_layout_ext = Ptr(to=get_device_proc_addr(
            device, "vkCreateIndirectCommandsLayoutEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_indirect_commands_layout_ext)]()[]
        self._destroy_indirect_commands_layout_ext = Ptr(to=get_device_proc_addr(
            device, "vkDestroyIndirectCommandsLayoutEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_indirect_commands_layout_ext)]()[]
        self._create_indirect_execution_set_ext = Ptr(to=get_device_proc_addr(
            device, "vkCreateIndirectExecutionSetEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_indirect_execution_set_ext)]()[]
        self._destroy_indirect_execution_set_ext = Ptr(to=get_device_proc_addr(
            device, "vkDestroyIndirectExecutionSetEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_indirect_execution_set_ext)]()[]
        self._update_indirect_execution_set_pipeline_ext = Ptr(to=get_device_proc_addr(
            device, "vkUpdateIndirectExecutionSetPipelineEXT".as_c_string_slice()
        )).bitcast[type_of(self._update_indirect_execution_set_pipeline_ext)]()[]
        self._update_indirect_execution_set_shader_ext = Ptr(to=get_device_proc_addr(
            device, "vkUpdateIndirectExecutionSetShaderEXT".as_c_string_slice()
        )).bitcast[type_of(self._update_indirect_execution_set_shader_ext)]()[]

    fn get_generated_commands_memory_requirements_ext(
        self,
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoEXT,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetGeneratedCommandsMemoryRequirementsEXT.html
        """
        return self._get_generated_commands_memory_requirements_ext(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn cmd_preprocess_generated_commands_ext(
        self,
        command_buffer: CommandBuffer,
        generated_commands_info: GeneratedCommandsInfoEXT,
        state_command_buffer: CommandBuffer,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPreprocessGeneratedCommandsEXT.html
        """
        return self._cmd_preprocess_generated_commands_ext(
            command_buffer, Ptr(to=generated_commands_info), state_command_buffer
        )

    fn cmd_execute_generated_commands_ext(
        self,
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        generated_commands_info: GeneratedCommandsInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteGeneratedCommandsEXT.html
        """
        return self._cmd_execute_generated_commands_ext(
            command_buffer, is_preprocessed, Ptr(to=generated_commands_info)
        )

    fn create_indirect_commands_layout_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut indirect_commands_layout: IndirectCommandsLayoutEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectCommandsLayoutEXT.html
        """
        return self._create_indirect_commands_layout_ext(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=indirect_commands_layout),
        )

    fn destroy_indirect_commands_layout_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectCommandsLayoutEXT.html
        """
        return self._destroy_indirect_commands_layout_ext(
            device,
            indirect_commands_layout,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn create_indirect_execution_set_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: IndirectExecutionSetCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut indirect_execution_set: IndirectExecutionSetEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectExecutionSetEXT.html
        """
        return self._create_indirect_execution_set_ext(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=indirect_execution_set),
        )

    fn destroy_indirect_execution_set_ext[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectExecutionSetEXT.html
        """
        return self._destroy_indirect_execution_set_ext(
            device,
            indirect_execution_set,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn update_indirect_execution_set_pipeline_ext[
        p_execution_set_writes_origin: ImmutOrigin = ImmutAnyOrigin
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
        return self._update_indirect_execution_set_pipeline_ext(
            device,
            indirect_execution_set,
            execution_set_write_count,
            Ptr(to=p_execution_set_writes).bitcast[Ptr[WriteIndirectExecutionSetPipelineEXT, ImmutAnyOrigin]]()[],
        )

    fn update_indirect_execution_set_shader_ext[
        p_execution_set_writes_origin: ImmutOrigin = ImmutAnyOrigin
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
        return self._update_indirect_execution_set_shader_ext(
            device,
            indirect_execution_set,
            execution_set_write_count,
            Ptr(to=p_execution_set_writes).bitcast[Ptr[WriteIndirectExecutionSetShaderEXT, ImmutAnyOrigin]]()[],
        )


struct DepthClampControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_depth_clamp_range_ext: fn(
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_clamp_range_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampRangeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clamp_range_ext)]()[]

    fn cmd_set_depth_clamp_range_ext[p_depth_clamp_range_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT, p_depth_clamp_range_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampRangeEXT.html
        """
        return self._cmd_set_depth_clamp_range_ext(
            command_buffer,
            depth_clamp_mode,
            Ptr(to=p_depth_clamp_range).bitcast[Ptr[DepthClampRangeEXT, ImmutAnyOrigin]]()[],
        )


struct ExternalMemoryMetal(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_metal_handle_ext: fn(
        device: Device,
        p_get_metal_handle_info: Ptr[MemoryGetMetalHandleInfoEXT, ImmutAnyOrigin],
        p_handle: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    ) -> Result
    var _get_memory_metal_handle_properties_ext: fn(
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        p_handle: Ptr[NoneType, ImmutAnyOrigin],
        p_memory_metal_handle_properties: Ptr[MemoryMetalHandlePropertiesEXT, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_metal_handle_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryMetalHandleEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_metal_handle_ext)]()[]
        self._get_memory_metal_handle_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryMetalHandlePropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_metal_handle_properties_ext)]()[]

    fn get_memory_metal_handle_ext[handle_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        get_metal_handle_info: MemoryGetMetalHandleInfoEXT,
        mut handle: Ptr[NoneType, handle_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryMetalHandleEXT.html
        """
        return self._get_memory_metal_handle_ext(
            device,
            Ptr(to=get_metal_handle_info),
            Ptr(to=Ptr(to=handle)).bitcast[Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin]]()[],
        )

    fn get_memory_metal_handle_properties_ext[p_handle_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        p_handle: Ptr[NoneType, p_handle_origin],
        mut memory_metal_handle_properties: MemoryMetalHandlePropertiesEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryMetalHandlePropertiesEXT.html
        """
        return self._get_memory_metal_handle_properties_ext(
            device,
            handle_type,
            Ptr(to=p_handle).bitcast[Ptr[NoneType, ImmutAnyOrigin]]()[],
            Ptr(to=memory_metal_handle_properties),
        )


struct FragmentDensityMapOffset(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_end_rendering_2_ext: fn(
        command_buffer: CommandBuffer, p_rendering_end_info: Ptr[RenderingEndInfoEXT, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_end_rendering_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRendering2EXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_rendering_2_ext)]()[]

    fn cmd_end_rendering_2_ext[p_rendering_end_info_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        p_rendering_end_info: Ptr[RenderingEndInfoEXT, p_rendering_end_info_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering2EXT.html
        """
        return self._cmd_end_rendering_2_ext(
            command_buffer,
            Ptr(to=p_rendering_end_info).bitcast[Ptr[RenderingEndInfoEXT, ImmutAnyOrigin]]()[],
        )
