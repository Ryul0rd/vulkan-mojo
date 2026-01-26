from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct DebugReport(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_debug_report_callback: fn(
        instance: Instance,
        p_create_info: Ptr[DebugReportCallbackCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_callback: Ptr[DebugReportCallbackEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_debug_report_callback: fn(
        instance: Instance,
        callback: DebugReportCallbackEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _debug_report_message: fn(
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
        self._create_debug_report_callback = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDebugReportCallbackEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_debug_report_callback)]()[]
        self._destroy_debug_report_callback = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroyDebugReportCallbackEXT".as_c_string_slice()
        )).bitcast[type_of(self._destroy_debug_report_callback)]()[]
        self._debug_report_message = Ptr(to=get_instance_proc_addr(
            instance, "vkDebugReportMessageEXT".as_c_string_slice()
        )).bitcast[type_of(self._debug_report_message)]()[]

    fn create_debug_report_callback[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: DebugReportCallbackCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut callback: DebugReportCallbackEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDebugReportCallbackEXT.html
        """
        return self._create_debug_report_callback(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=callback),
        )

    fn destroy_debug_report_callback[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        callback: DebugReportCallbackEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDebugReportCallbackEXT.html
        """
        return self._destroy_debug_report_callback(
            instance, callback, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn debug_report_message[
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
        return self._debug_report_message(
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
    var _debug_marker_set_object_tag: fn(
        device: Device, p_tag_info: Ptr[DebugMarkerObjectTagInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _debug_marker_set_object_name: fn(
        device: Device, p_name_info: Ptr[DebugMarkerObjectNameInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _cmd_debug_marker_begin: fn(
        command_buffer: CommandBuffer, p_marker_info: Ptr[DebugMarkerMarkerInfoEXT, ImmutAnyOrigin]
    )
    var _cmd_debug_marker_end: fn(command_buffer: CommandBuffer)
    var _cmd_debug_marker_insert: fn(
        command_buffer: CommandBuffer, p_marker_info: Ptr[DebugMarkerMarkerInfoEXT, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn debug_marker_set_object_tag(
        self, device: Device, tag_info: DebugMarkerObjectTagInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDebugMarkerSetObjectTagEXT.html
        """
        return self._debug_marker_set_object_tag(device, Ptr(to=tag_info))

    fn debug_marker_set_object_name(
        self, device: Device, name_info: DebugMarkerObjectNameInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDebugMarkerSetObjectNameEXT.html
        """
        return self._debug_marker_set_object_name(device, Ptr(to=name_info))

    fn cmd_debug_marker_begin(
        self, command_buffer: CommandBuffer, marker_info: DebugMarkerMarkerInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerBeginEXT.html
        """
        return self._cmd_debug_marker_begin(command_buffer, Ptr(to=marker_info))

    fn cmd_debug_marker_end(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerEndEXT.html
        """
        return self._cmd_debug_marker_end(command_buffer)

    fn cmd_debug_marker_insert(
        self, command_buffer: CommandBuffer, marker_info: DebugMarkerMarkerInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerInsertEXT.html
        """
        return self._cmd_debug_marker_insert(command_buffer, Ptr(to=marker_info))


struct TransformFeedback(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_bind_transform_feedback_buffers: fn(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
        p_sizes: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _cmd_begin_transform_feedback: fn(
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_counter_buffer_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _cmd_end_transform_feedback: fn(
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_counter_buffer_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _cmd_begin_query_indexed: fn(
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
        index: UInt32,
    )
    var _cmd_end_query_indexed: fn(
        command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32, index: UInt32
    )
    var _cmd_draw_indirect_byte_count: fn(
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

    fn cmd_bind_transform_feedback_buffers[
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
        return self._cmd_bind_transform_feedback_buffers(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutAnyOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
            Ptr(to=p_sizes).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
        )

    fn cmd_begin_transform_feedback[
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
        return self._cmd_begin_transform_feedback(
            command_buffer,
            first_counter_buffer,
            counter_buffer_count,
            Ptr(to=p_counter_buffers).bitcast[Ptr[Buffer, ImmutAnyOrigin]]()[],
            Ptr(to=p_counter_buffer_offsets).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
        )

    fn cmd_end_transform_feedback[
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
        return self._cmd_end_transform_feedback(
            command_buffer,
            first_counter_buffer,
            counter_buffer_count,
            Ptr(to=p_counter_buffers).bitcast[Ptr[Buffer, ImmutAnyOrigin]]()[],
            Ptr(to=p_counter_buffer_offsets).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
        )

    fn cmd_begin_query_indexed(
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

    fn cmd_end_query_indexed(
        self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32, index: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQueryIndexedEXT.html
        """
        return self._cmd_end_query_indexed(command_buffer, query_pool, query, index)

    fn cmd_draw_indirect_byte_count(
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
    var _cmd_begin_conditional_rendering: fn(
        command_buffer: CommandBuffer,
        p_conditional_rendering_begin: Ptr[ConditionalRenderingBeginInfoEXT, ImmutAnyOrigin],
    )
    var _cmd_end_conditional_rendering: fn(command_buffer: CommandBuffer)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_begin_conditional_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginConditionalRenderingEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_conditional_rendering)]()[]
        self._cmd_end_conditional_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndConditionalRenderingEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_conditional_rendering)]()[]

    fn cmd_begin_conditional_rendering(
        self,
        command_buffer: CommandBuffer,
        conditional_rendering_begin: ConditionalRenderingBeginInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginConditionalRenderingEXT.html
        """
        return self._cmd_begin_conditional_rendering(command_buffer, Ptr(to=conditional_rendering_begin))

    fn cmd_end_conditional_rendering(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndConditionalRenderingEXT.html
        """
        return self._cmd_end_conditional_rendering(command_buffer)


struct DirectModeDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _release_display: fn(physical_device: PhysicalDevice, display: DisplayKHR) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._release_display = Ptr(to=get_instance_proc_addr(
            instance, "vkReleaseDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._release_display)]()[]

    fn release_display(self, physical_device: PhysicalDevice, display: DisplayKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseDisplayEXT.html
        """
        return self._release_display(physical_device, display)


struct AcquireXlibDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _acquire_xlib_display: fn(
        physical_device: PhysicalDevice, dpy: Ptr[Display, MutAnyOrigin], display: DisplayKHR
    ) -> Result
    var _get_rand_r_output_display: fn(
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
        self._acquire_xlib_display = Ptr(to=get_instance_proc_addr(
            instance, "vkAcquireXlibDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._acquire_xlib_display)]()[]
        self._get_rand_r_output_display = Ptr(to=get_instance_proc_addr(
            instance, "vkGetRandROutputDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_rand_r_output_display)]()[]

    fn acquire_xlib_display(
        self, physical_device: PhysicalDevice, mut dpy: Display, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireXlibDisplayEXT.html
        """
        return self._acquire_xlib_display(physical_device, Ptr(to=dpy), display)

    fn get_rand_r_output_display(
        self,
        physical_device: PhysicalDevice,
        mut dpy: Display,
        rr_output: RROutput,
        mut display: DisplayKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRandROutputDisplayEXT.html
        """
        return self._get_rand_r_output_display(physical_device, Ptr(to=dpy), rr_output, Ptr(to=display))


struct DisplaySurfaceCounter(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_surface_capabilities_2: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_surface_capabilities: Ptr[SurfaceCapabilities2EXT, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_surface_capabilities_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceCapabilities2EXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_capabilities_2)]()[]

    fn get_physical_device_surface_capabilities_2(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_capabilities: SurfaceCapabilities2EXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceCapabilities2EXT.html
        """
        return self._get_physical_device_surface_capabilities_2(
            physical_device, surface, Ptr(to=surface_capabilities)
        )


struct DisplayControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _display_power_control: fn(
        device: Device,
        display: DisplayKHR,
        p_display_power_info: Ptr[DisplayPowerInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _register_device_event: fn(
        device: Device,
        p_device_event_info: Ptr[DeviceEventInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_fence: Ptr[Fence, MutAnyOrigin],
    ) -> Result
    var _register_display_event: fn(
        device: Device,
        display: DisplayKHR,
        p_display_event_info: Ptr[DisplayEventInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_fence: Ptr[Fence, MutAnyOrigin],
    ) -> Result
    var _get_swapchain_counter: fn(
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

    fn display_power_control(
        self, device: Device, display: DisplayKHR, display_power_info: DisplayPowerInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDisplayPowerControlEXT.html
        """
        return self._display_power_control(device, display, Ptr(to=display_power_info))

    fn register_device_event[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        device_event_info: DeviceEventInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkRegisterDeviceEventEXT.html
        """
        return self._register_device_event(
            device,
            Ptr(to=device_event_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=fence),
        )

    fn register_display_event[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
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
        return self._register_display_event(
            device,
            display,
            Ptr(to=display_event_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=fence),
        )

    fn get_swapchain_counter(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        counter: SurfaceCounterFlagBitsEXT,
        mut counter_value: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainCounterEXT.html
        """
        return self._get_swapchain_counter(device, swapchain, counter, Ptr(to=counter_value))


struct DiscardRectangles(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_discard_rectangle: fn(
        command_buffer: CommandBuffer,
        first_discard_rectangle: UInt32,
        discard_rectangle_count: UInt32,
        p_discard_rectangles: Ptr[Rect2D, ImmutAnyOrigin],
    )
    var _cmd_set_discard_rectangle_enable: fn(
        command_buffer: CommandBuffer, discard_rectangle_enable: Bool32
    )
    var _cmd_set_discard_rectangle_mode: fn(
        command_buffer: CommandBuffer, discard_rectangle_mode: DiscardRectangleModeEXT
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn cmd_set_discard_rectangle[p_discard_rectangles_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_discard_rectangles).bitcast[Ptr[Rect2D, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_discard_rectangle_enable(
        self, command_buffer: CommandBuffer, discard_rectangle_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleEnableEXT.html
        """
        return self._cmd_set_discard_rectangle_enable(command_buffer, discard_rectangle_enable)

    fn cmd_set_discard_rectangle_mode(
        self, command_buffer: CommandBuffer, discard_rectangle_mode: DiscardRectangleModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleModeEXT.html
        """
        return self._cmd_set_discard_rectangle_mode(command_buffer, discard_rectangle_mode)


struct HdrMetadata(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_hdr_metadata: fn(
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
        self._set_hdr_metadata = Ptr(to=get_device_proc_addr(
            device, "vkSetHdrMetadataEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_hdr_metadata)]()[]

    fn set_hdr_metadata[
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
        return self._set_hdr_metadata(
            device,
            swapchain_count,
            Ptr(to=p_swapchains).bitcast[Ptr[SwapchainKHR, ImmutAnyOrigin]]()[],
            Ptr(to=p_metadata).bitcast[Ptr[HdrMetadataEXT, ImmutAnyOrigin]]()[],
        )


struct DebugUtils(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_debug_utils_object_name: fn(
        device: Device, p_name_info: Ptr[DebugUtilsObjectNameInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _set_debug_utils_object_tag: fn(
        device: Device, p_tag_info: Ptr[DebugUtilsObjectTagInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _queue_begin_debug_utils_label: fn(
        queue: Queue, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _queue_end_debug_utils_label: fn(queue: Queue)
    var _queue_insert_debug_utils_label: fn(
        queue: Queue, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _cmd_begin_debug_utils_label: fn(
        command_buffer: CommandBuffer, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _cmd_end_debug_utils_label: fn(command_buffer: CommandBuffer)
    var _cmd_insert_debug_utils_label: fn(
        command_buffer: CommandBuffer, p_label_info: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _create_debug_utils_messenger: fn(
        instance: Instance,
        p_create_info: Ptr[DebugUtilsMessengerCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_messenger: Ptr[DebugUtilsMessengerEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_debug_utils_messenger: fn(
        instance: Instance,
        messenger: DebugUtilsMessengerEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _submit_debug_utils_message: fn(
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

    fn set_debug_utils_object_name(
        self, device: Device, name_info: DebugUtilsObjectNameInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDebugUtilsObjectNameEXT.html
        """
        return self._set_debug_utils_object_name(device, Ptr(to=name_info))

    fn set_debug_utils_object_tag(
        self, device: Device, tag_info: DebugUtilsObjectTagInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDebugUtilsObjectTagEXT.html
        """
        return self._set_debug_utils_object_tag(device, Ptr(to=tag_info))

    fn queue_begin_debug_utils_label(self, queue: Queue, label_info: DebugUtilsLabelEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBeginDebugUtilsLabelEXT.html
        """
        return self._queue_begin_debug_utils_label(queue, Ptr(to=label_info))

    fn queue_end_debug_utils_label(self, queue: Queue):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueEndDebugUtilsLabelEXT.html
        """
        return self._queue_end_debug_utils_label(queue)

    fn queue_insert_debug_utils_label(self, queue: Queue, label_info: DebugUtilsLabelEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueInsertDebugUtilsLabelEXT.html
        """
        return self._queue_insert_debug_utils_label(queue, Ptr(to=label_info))

    fn cmd_begin_debug_utils_label(
        self, command_buffer: CommandBuffer, label_info: DebugUtilsLabelEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginDebugUtilsLabelEXT.html
        """
        return self._cmd_begin_debug_utils_label(command_buffer, Ptr(to=label_info))

    fn cmd_end_debug_utils_label(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndDebugUtilsLabelEXT.html
        """
        return self._cmd_end_debug_utils_label(command_buffer)

    fn cmd_insert_debug_utils_label(
        self, command_buffer: CommandBuffer, label_info: DebugUtilsLabelEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdInsertDebugUtilsLabelEXT.html
        """
        return self._cmd_insert_debug_utils_label(command_buffer, Ptr(to=label_info))

    fn create_debug_utils_messenger[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: DebugUtilsMessengerCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut messenger: DebugUtilsMessengerEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDebugUtilsMessengerEXT.html
        """
        return self._create_debug_utils_messenger(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=messenger),
        )

    fn destroy_debug_utils_messenger[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        messenger: DebugUtilsMessengerEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDebugUtilsMessengerEXT.html
        """
        return self._destroy_debug_utils_messenger(
            instance, messenger, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn submit_debug_utils_message(
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
            instance, message_severity, message_types, Ptr(to=callback_data)
        )


struct DescriptorHeap(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _write_sampler_descriptors: fn(
        device: Device,
        sampler_count: UInt32,
        p_samplers: Ptr[SamplerCreateInfo, ImmutAnyOrigin],
        p_descriptors: Ptr[HostAddressRangeEXT, ImmutAnyOrigin],
    ) -> Result
    var _write_resource_descriptors: fn(
        device: Device,
        resource_count: UInt32,
        p_resources: Ptr[ResourceDescriptorInfoEXT, ImmutAnyOrigin],
        p_descriptors: Ptr[HostAddressRangeEXT, ImmutAnyOrigin],
    ) -> Result
    var _cmd_bind_sampler_heap: fn(
        command_buffer: CommandBuffer, p_bind_info: Ptr[BindHeapInfoEXT, ImmutAnyOrigin]
    )
    var _cmd_bind_resource_heap: fn(
        command_buffer: CommandBuffer, p_bind_info: Ptr[BindHeapInfoEXT, ImmutAnyOrigin]
    )
    var _cmd_push_data: fn(
        command_buffer: CommandBuffer, p_push_data_info: Ptr[PushDataInfoEXT, ImmutAnyOrigin]
    )
    var _get_image_opaque_capture_data: fn(
        device: Device,
        image_count: UInt32,
        p_images: Ptr[Image, ImmutAnyOrigin],
        p_datas: Ptr[HostAddressRangeEXT, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_descriptor_size: fn(
        physical_device: PhysicalDevice, descriptor_type: DescriptorType
    ) -> DeviceSize
    var _register_custom_border_color: fn(
        device: Device,
        p_border_color: Ptr[SamplerCustomBorderColorCreateInfoEXT, ImmutAnyOrigin],
        request_index: Bool32,
        p_index: Ptr[UInt32, MutAnyOrigin],
    ) -> Result
    var _unregister_custom_border_color: fn(device: Device, index: UInt32)
    var _get_tensor_opaque_capture_data: fn(
        device: Device,
        tensor_count: UInt32,
        p_tensors: Ptr[TensorARM, ImmutAnyOrigin],
        p_datas: Ptr[HostAddressRangeEXT, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn write_sampler_descriptors[
        p_samplers_origin: ImmutOrigin = ImmutAnyOrigin,
        p_descriptors_origin: ImmutOrigin = ImmutAnyOrigin,
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
            Ptr(to=p_samplers).bitcast[Ptr[SamplerCreateInfo, ImmutAnyOrigin]]()[],
            Ptr(to=p_descriptors).bitcast[Ptr[HostAddressRangeEXT, ImmutAnyOrigin]]()[],
        )

    fn write_resource_descriptors[
        p_resources_origin: ImmutOrigin = ImmutAnyOrigin,
        p_descriptors_origin: ImmutOrigin = ImmutAnyOrigin,
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
            Ptr(to=p_resources).bitcast[Ptr[ResourceDescriptorInfoEXT, ImmutAnyOrigin]]()[],
            Ptr(to=p_descriptors).bitcast[Ptr[HostAddressRangeEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_bind_sampler_heap(self, command_buffer: CommandBuffer, bind_info: BindHeapInfoEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindSamplerHeapEXT.html
        """
        return self._cmd_bind_sampler_heap(command_buffer, Ptr(to=bind_info))

    fn cmd_bind_resource_heap(self, command_buffer: CommandBuffer, bind_info: BindHeapInfoEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindResourceHeapEXT.html
        """
        return self._cmd_bind_resource_heap(command_buffer, Ptr(to=bind_info))

    fn cmd_push_data(self, command_buffer: CommandBuffer, push_data_info: PushDataInfoEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDataEXT.html
        """
        return self._cmd_push_data(command_buffer, Ptr(to=push_data_info))

    fn get_image_opaque_capture_data[
        p_images_origin: ImmutOrigin = ImmutAnyOrigin, p_datas_origin: MutOrigin = MutAnyOrigin
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
            Ptr(to=p_images).bitcast[Ptr[Image, ImmutAnyOrigin]]()[],
            Ptr(to=p_datas).bitcast[Ptr[HostAddressRangeEXT, MutAnyOrigin]]()[],
        )

    fn get_physical_device_descriptor_size(
        self, physical_device: PhysicalDevice, descriptor_type: DescriptorType
    ) -> DeviceSize:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDescriptorSizeEXT.html
        """
        return self._get_physical_device_descriptor_size(physical_device, descriptor_type)

    fn register_custom_border_color(
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
            device, Ptr(to=border_color), request_index, Ptr(to=index)
        )

    fn unregister_custom_border_color(self, device: Device, index: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnregisterCustomBorderColorEXT.html
        """
        return self._unregister_custom_border_color(device, index)

    fn get_tensor_opaque_capture_data[
        p_tensors_origin: ImmutOrigin = ImmutAnyOrigin, p_datas_origin: MutOrigin = MutAnyOrigin
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
            Ptr(to=p_tensors).bitcast[Ptr[TensorARM, ImmutAnyOrigin]]()[],
            Ptr(to=p_datas).bitcast[Ptr[HostAddressRangeEXT, MutAnyOrigin]]()[],
        )


struct SampleLocations(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_sample_locations: fn(
        command_buffer: CommandBuffer,
        p_sample_locations_info: Ptr[SampleLocationsInfoEXT, ImmutAnyOrigin],
    )
    var _get_physical_device_multisample_properties: fn(
        physical_device: PhysicalDevice,
        samples: SampleCountFlagBits,
        p_multisample_properties: Ptr[MultisamplePropertiesEXT, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_sample_locations = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleLocationsEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_sample_locations)]()[]
        self._get_physical_device_multisample_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceMultisamplePropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_multisample_properties)]()[]

    fn cmd_set_sample_locations(
        self, command_buffer: CommandBuffer, sample_locations_info: SampleLocationsInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEXT.html
        """
        return self._cmd_set_sample_locations(command_buffer, Ptr(to=sample_locations_info))

    fn get_physical_device_multisample_properties(
        self,
        physical_device: PhysicalDevice,
        samples: SampleCountFlagBits,
        mut multisample_properties: MultisamplePropertiesEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMultisamplePropertiesEXT.html
        """
        return self._get_physical_device_multisample_properties(
            physical_device, samples, Ptr(to=multisample_properties)
        )


struct ImageDrmFormatModifier(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_image_drm_format_modifier_properties: fn(
        device: Device,
        image: Image,
        p_properties: Ptr[ImageDrmFormatModifierPropertiesEXT, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_drm_format_modifier_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetImageDrmFormatModifierPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_image_drm_format_modifier_properties)]()[]

    fn get_image_drm_format_modifier_properties(
        self, device: Device, image: Image, mut properties: ImageDrmFormatModifierPropertiesEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageDrmFormatModifierPropertiesEXT.html
        """
        return self._get_image_drm_format_modifier_properties(device, image, Ptr(to=properties))


struct ValidationCache(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_validation_cache: fn(
        device: Device,
        p_create_info: Ptr[ValidationCacheCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_validation_cache: Ptr[ValidationCacheEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_validation_cache: fn(
        device: Device,
        validation_cache: ValidationCacheEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _merge_validation_caches: fn(
        device: Device,
        dst_cache: ValidationCacheEXT,
        src_cache_count: UInt32,
        p_src_caches: Ptr[ValidationCacheEXT, ImmutAnyOrigin],
    ) -> Result
    var _get_validation_cache_data: fn(
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

    fn create_validation_cache[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: ValidationCacheCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut validation_cache: ValidationCacheEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateValidationCacheEXT.html
        """
        return self._create_validation_cache(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=validation_cache),
        )

    fn destroy_validation_cache[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        validation_cache: ValidationCacheEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyValidationCacheEXT.html
        """
        return self._destroy_validation_cache(
            device,
            validation_cache,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn merge_validation_caches[p_src_caches_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_src_caches).bitcast[Ptr[ValidationCacheEXT, ImmutAnyOrigin]]()[],
        )

    fn get_validation_cache_data[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        validation_cache: ValidationCacheEXT,
        mut data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetValidationCacheDataEXT.html
        """
        return self._get_validation_cache_data(
            device,
            validation_cache,
            Ptr(to=data_size),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn get_validation_cache_data[p_data_origin: MutOrigin = MutAnyOrigin](
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
        device, validation_cache, Ptr(to=count), Ptr[NoneType, MutOrigin.external]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_validation_cache_data(
        device, validation_cache, Ptr(to=count), list.unsafe_ptr().bitcast[NoneType]()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct ExternalMemoryHost(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_host_pointer_properties: fn(
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
        self._get_memory_host_pointer_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryHostPointerPropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_host_pointer_properties)]()[]

    fn get_memory_host_pointer_properties[p_host_pointer_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_host_pointer).bitcast[Ptr[NoneType, ImmutAnyOrigin]]()[],
            Ptr(to=memory_host_pointer_properties),
        )


struct CalibratedTimestamps(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_calibrateable_time_domains: fn(
        physical_device: PhysicalDevice,
        p_time_domain_count: Ptr[UInt32, MutAnyOrigin],
        p_time_domains: Ptr[TimeDomainKHR, MutAnyOrigin],
    ) -> Result
    var _get_calibrated_timestamps: fn(
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
        self._get_physical_device_calibrateable_time_domains = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_calibrateable_time_domains)]()[]
        self._get_calibrated_timestamps = Ptr(to=get_device_proc_addr(
            device, "vkGetCalibratedTimestampsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_calibrated_timestamps)]()[]

    fn get_physical_device_calibrateable_time_domains[
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
        return self._get_physical_device_calibrateable_time_domains(
            physical_device,
            Ptr(to=time_domain_count),
            Ptr(to=p_time_domains).bitcast[Ptr[TimeDomainKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_calibrateable_time_domains[
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
            result = self._get_physical_device_calibrateable_time_domains(
        physical_device, Ptr(to=count), Ptr[TimeDomainKHR, MutOrigin.external]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_calibrateable_time_domains(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_calibrated_timestamps[
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
        return self._get_calibrated_timestamps(
            device,
            timestamp_count,
            Ptr(to=p_timestamp_infos).bitcast[Ptr[CalibratedTimestampInfoKHR, ImmutAnyOrigin]]()[],
            Ptr(to=p_timestamps).bitcast[Ptr[UInt64, MutAnyOrigin]]()[],
            Ptr(to=max_deviation),
        )


struct PresentTiming(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_swapchain_present_timing_queue_size: fn(
        device: Device, swapchain: SwapchainKHR, size: UInt32
    ) -> Result
    var _get_swapchain_timing_properties: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_swapchain_timing_properties: Ptr[SwapchainTimingPropertiesEXT, MutAnyOrigin],
        p_swapchain_timing_properties_counter: Ptr[UInt64, MutAnyOrigin],
    ) -> Result
    var _get_swapchain_time_domain_properties: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_swapchain_time_domain_properties: Ptr[SwapchainTimeDomainPropertiesEXT, MutAnyOrigin],
        p_time_domains_counter: Ptr[UInt64, MutAnyOrigin],
    ) -> Result
    var _get_past_presentation_timing: fn(
        device: Device,
        p_past_presentation_timing_info: Ptr[PastPresentationTimingInfoEXT, ImmutAnyOrigin],
        p_past_presentation_timing_properties: Ptr[PastPresentationTimingPropertiesEXT, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn set_swapchain_present_timing_queue_size(
        self, device: Device, swapchain: SwapchainKHR, size: UInt32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetSwapchainPresentTimingQueueSizeEXT.html
        """
        return self._set_swapchain_present_timing_queue_size(device, swapchain, size)

    fn get_swapchain_timing_properties[
        p_swapchain_timing_properties_counter_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut swapchain_timing_properties: SwapchainTimingPropertiesEXT,
        p_swapchain_timing_properties_counter: Ptr[UInt64, p_swapchain_timing_properties_counter_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainTimingPropertiesEXT.html
        """
        return self._get_swapchain_timing_properties(
            device,
            swapchain,
            Ptr(to=swapchain_timing_properties),
            Ptr(to=p_swapchain_timing_properties_counter).bitcast[Ptr[UInt64, MutAnyOrigin]]()[],
        )

    fn get_swapchain_time_domain_properties[
        p_time_domains_counter_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut swapchain_time_domain_properties: SwapchainTimeDomainPropertiesEXT,
        p_time_domains_counter: Ptr[UInt64, p_time_domains_counter_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainTimeDomainPropertiesEXT.html
        """
        return self._get_swapchain_time_domain_properties(
            device,
            swapchain,
            Ptr(to=swapchain_time_domain_properties),
            Ptr(to=p_time_domains_counter).bitcast[Ptr[UInt64, MutAnyOrigin]]()[],
        )

    fn get_past_presentation_timing(
        self,
        device: Device,
        past_presentation_timing_info: PastPresentationTimingInfoEXT,
        mut past_presentation_timing_properties: PastPresentationTimingPropertiesEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPastPresentationTimingEXT.html
        """
        return self._get_past_presentation_timing(
            device, Ptr(to=past_presentation_timing_info), Ptr(to=past_presentation_timing_properties)
        )


struct MetalSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_metal_surface: fn(
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
        self._create_metal_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateMetalSurfaceEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_metal_surface)]()[]

    fn create_metal_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: MetalSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateMetalSurfaceEXT.html
        """
        return self._create_metal_surface(
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
    var _get_physical_device_surface_present_modes_2: fn(
        physical_device: PhysicalDevice,
        p_surface_info: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        p_present_mode_count: Ptr[UInt32, MutAnyOrigin],
        p_present_modes: Ptr[PresentModeKHR, MutAnyOrigin],
    ) -> Result
    var _acquire_full_screen_exclusive_mode: fn(device: Device, swapchain: SwapchainKHR) -> Result
    var _release_full_screen_exclusive_mode: fn(device: Device, swapchain: SwapchainKHR) -> Result
    var _get_device_group_surface_present_modes_2: fn(
        device: Device,
        p_surface_info: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        p_modes: Ptr[DeviceGroupPresentModeFlagsKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn get_physical_device_surface_present_modes_2[
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
        return self._get_physical_device_surface_present_modes_2(
            physical_device,
            Ptr(to=surface_info),
            Ptr(to=present_mode_count),
            Ptr(to=p_present_modes).bitcast[Ptr[PresentModeKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_surface_present_modes_2[
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
            result = self._get_physical_device_surface_present_modes_2(
        physical_device,
        Ptr(to=surface_info),
        Ptr(to=count),
        Ptr[PresentModeKHR, MutOrigin.external](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_surface_present_modes_2(
        physical_device, Ptr(to=surface_info), Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn acquire_full_screen_exclusive_mode(self, device: Device, swapchain: SwapchainKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireFullScreenExclusiveModeEXT.html
        """
        return self._acquire_full_screen_exclusive_mode(device, swapchain)

    fn release_full_screen_exclusive_mode(self, device: Device, swapchain: SwapchainKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseFullScreenExclusiveModeEXT.html
        """
        return self._release_full_screen_exclusive_mode(device, swapchain)

    fn get_device_group_surface_present_modes_2(
        self,
        device: Device,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut modes: DeviceGroupPresentModeFlagsKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupSurfacePresentModes2EXT.html
        """
        return self._get_device_group_surface_present_modes_2(device, Ptr(to=surface_info), Ptr(to=modes))


struct HeadlessSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_headless_surface: fn(
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
        self._create_headless_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateHeadlessSurfaceEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_headless_surface)]()[]

    fn create_headless_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: HeadlessSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateHeadlessSurfaceEXT.html
        """
        return self._create_headless_surface(
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
    var _release_swapchain_images: fn(
        device: Device, p_release_info: Ptr[ReleaseSwapchainImagesInfoKHR, ImmutAnyOrigin]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._release_swapchain_images = Ptr(to=get_device_proc_addr(
            device, "vkReleaseSwapchainImagesKHR".as_c_string_slice()
        )).bitcast[type_of(self._release_swapchain_images)]()[]

    fn release_swapchain_images(
        self, device: Device, release_info: ReleaseSwapchainImagesInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseSwapchainImagesKHR.html
        """
        return self._release_swapchain_images(device, Ptr(to=release_info))


struct DepthBiasControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_depth_bias_2: fn(
        command_buffer: CommandBuffer, p_depth_bias_info: Ptr[DepthBiasInfoEXT, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_bias_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBias2EXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_bias_2)]()[]

    fn cmd_set_depth_bias_2(
        self, command_buffer: CommandBuffer, depth_bias_info: DepthBiasInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBias2EXT.html
        """
        return self._cmd_set_depth_bias_2(command_buffer, Ptr(to=depth_bias_info))


struct AcquireDrmDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _acquire_drm_display: fn(
        physical_device: PhysicalDevice, drm_fd: Int32, display: DisplayKHR
    ) -> Result
    var _get_drm_display: fn(
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
        self._acquire_drm_display = Ptr(to=get_instance_proc_addr(
            instance, "vkAcquireDrmDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._acquire_drm_display)]()[]
        self._get_drm_display = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDrmDisplayEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_drm_display)]()[]

    fn acquire_drm_display(
        self, physical_device: PhysicalDevice, drm_fd: Int32, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireDrmDisplayEXT.html
        """
        return self._acquire_drm_display(physical_device, drm_fd, display)

    fn get_drm_display(
        self,
        physical_device: PhysicalDevice,
        drm_fd: Int32,
        connector_id: UInt32,
        mut display: DisplayKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDrmDisplayEXT.html
        """
        return self._get_drm_display(physical_device, drm_fd, connector_id, Ptr(to=display))


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
    var _export_metal_objects: fn(
        device: Device, p_metal_objects_info: Ptr[ExportMetalObjectsInfoEXT, MutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._export_metal_objects = Ptr(to=get_device_proc_addr(
            device, "vkExportMetalObjectsEXT".as_c_string_slice()
        )).bitcast[type_of(self._export_metal_objects)]()[]

    fn export_metal_objects(
        self, device: Device, mut metal_objects_info: ExportMetalObjectsInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkExportMetalObjectsEXT.html
        """
        return self._export_metal_objects(device, Ptr(to=metal_objects_info))


struct DescriptorBuffer(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_descriptor_set_layout_size: fn(
        device: Device,
        layout: DescriptorSetLayout,
        p_layout_size_in_bytes: Ptr[DeviceSize, MutAnyOrigin],
    )
    var _get_descriptor_set_layout_binding_offset: fn(
        device: Device,
        layout: DescriptorSetLayout,
        binding: UInt32,
        p_offset: Ptr[DeviceSize, MutAnyOrigin],
    )
    var _get_descriptor: fn(
        device: Device,
        p_descriptor_info: Ptr[DescriptorGetInfoEXT, ImmutAnyOrigin],
        data_size: UInt,
        p_descriptor: Ptr[NoneType, MutAnyOrigin],
    )
    var _cmd_bind_descriptor_buffers: fn(
        command_buffer: CommandBuffer,
        buffer_count: UInt32,
        p_binding_infos: Ptr[DescriptorBufferBindingInfoEXT, ImmutAnyOrigin],
    )
    var _cmd_set_descriptor_buffer_offsets: fn(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        set_count: UInt32,
        p_buffer_indices: Ptr[UInt32, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _cmd_bind_descriptor_buffer_embedded_samplers: fn(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
    )
    var _get_buffer_opaque_capture_descriptor_data: fn(
        device: Device,
        p_info: Ptr[BufferCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_image_opaque_capture_descriptor_data: fn(
        device: Device,
        p_info: Ptr[ImageCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_image_view_opaque_capture_descriptor_data: fn(
        device: Device,
        p_info: Ptr[ImageViewCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_sampler_opaque_capture_descriptor_data: fn(
        device: Device,
        p_info: Ptr[SamplerCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_acceleration_structure_opaque_capture_descriptor_data: fn(
        device: Device,
        p_info: Ptr[AccelerationStructureCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn get_descriptor_set_layout_size(
        self, device: Device, layout: DescriptorSetLayout, mut layout_size_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutSizeEXT.html
        """
        return self._get_descriptor_set_layout_size(device, layout, Ptr(to=layout_size_in_bytes))

    fn get_descriptor_set_layout_binding_offset(
        self, device: Device, layout: DescriptorSetLayout, binding: UInt32, mut offset: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutBindingOffsetEXT.html
        """
        return self._get_descriptor_set_layout_binding_offset(device, layout, binding, Ptr(to=offset))

    fn get_descriptor[p_descriptor_origin: MutOrigin = MutAnyOrigin](
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
            Ptr(to=descriptor_info),
            data_size,
            Ptr(to=p_descriptor).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn cmd_bind_descriptor_buffers[p_binding_infos_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_binding_infos).bitcast[Ptr[DescriptorBufferBindingInfoEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_descriptor_buffer_offsets[
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
        return self._cmd_set_descriptor_buffer_offsets(
            command_buffer,
            pipeline_bind_point,
            layout,
            first_set,
            set_count,
            Ptr(to=p_buffer_indices).bitcast[Ptr[UInt32, ImmutAnyOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutAnyOrigin]]()[],
        )

    fn cmd_bind_descriptor_buffer_embedded_samplers(
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

    fn get_buffer_opaque_capture_descriptor_data[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: BufferCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_buffer_opaque_capture_descriptor_data(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_image_opaque_capture_descriptor_data[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: ImageCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_image_opaque_capture_descriptor_data(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_image_view_opaque_capture_descriptor_data[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: ImageViewCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageViewOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_image_view_opaque_capture_descriptor_data(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_sampler_opaque_capture_descriptor_data[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: SamplerCaptureDescriptorDataInfoEXT,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSamplerOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_sampler_opaque_capture_descriptor_data(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_acceleration_structure_opaque_capture_descriptor_data[
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
        return self._get_acceleration_structure_opaque_capture_descriptor_data(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )


struct MeshShader(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_mesh_tasks: fn(
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    )
    var _cmd_draw_mesh_tasks_indirect: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    )
    var _cmd_draw_mesh_tasks_indirect_count: fn(
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
        self._cmd_draw_mesh_tasks = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks)]()[]
        self._cmd_draw_mesh_tasks_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_indirect)]()[]
        self._cmd_draw_mesh_tasks_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectCountEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_indirect_count)]()[]

    fn cmd_draw_mesh_tasks(
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

    fn cmd_draw_mesh_tasks_indirect(
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

    fn cmd_draw_mesh_tasks_indirect_count(
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
    var _get_device_fault_info: fn(
        device: Device,
        p_fault_counts: Ptr[DeviceFaultCountsEXT, MutAnyOrigin],
        p_fault_info: Ptr[DeviceFaultInfoEXT, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_device_fault_info = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceFaultInfoEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_device_fault_info)]()[]

    fn get_device_fault_info[p_fault_info_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        mut fault_counts: DeviceFaultCountsEXT,
        p_fault_info: Ptr[DeviceFaultInfoEXT, p_fault_info_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceFaultInfoEXT.html
        """
        return self._get_device_fault_info(
            device,
            Ptr(to=fault_counts),
            Ptr(to=p_fault_info).bitcast[Ptr[DeviceFaultInfoEXT, MutAnyOrigin]]()[],
        )


struct DirectfbSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_direct_fb_surface: fn(
        instance: Instance,
        p_create_info: Ptr[DirectFBSurfaceCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_direct_fb_presentation_support: fn(
        physical_device: PhysicalDevice, queue_family_index: UInt32, dfb: Ptr[IDirectFB, MutAnyOrigin]
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_direct_fb_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDirectFBSurfaceEXT".as_c_string_slice()
        )).bitcast[type_of(self._create_direct_fb_surface)]()[]
        self._get_physical_device_direct_fb_presentation_support = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDirectFBPresentationSupportEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_direct_fb_presentation_support)]()[]

    fn create_direct_fb_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: DirectFBSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDirectFBSurfaceEXT.html
        """
        return self._create_direct_fb_surface(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )

    fn get_physical_device_direct_fb_presentation_support(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32, mut dfb: IDirectFB
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDirectFBPresentationSupportEXT.html
        """
        return self._get_physical_device_direct_fb_presentation_support(
            physical_device, queue_family_index, Ptr(to=dfb)
        )


struct VertexInputDynamicState(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_vertex_input: fn(
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
        self._cmd_set_vertex_input = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetVertexInputEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_vertex_input)]()[]

    fn cmd_set_vertex_input[
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
        return self._cmd_set_vertex_input(
            command_buffer,
            vertex_binding_description_count,
            Ptr(to=p_vertex_binding_descriptions).bitcast[Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin]]()[],
            vertex_attribute_description_count,
            Ptr(to=p_vertex_attribute_descriptions).bitcast[Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin]]()[],
        )


struct PipelineProperties(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_pipeline_properties: fn(
        device: Device,
        p_pipeline_info: Ptr[PipelineInfoEXT, ImmutAnyOrigin],
        p_pipeline_properties: Ptr[BaseOutStructure, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_pipeline_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelinePropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_properties)]()[]

    fn get_pipeline_properties(
        self,
        device: Device,
        pipeline_info: PipelineInfoEXT,
        mut pipeline_properties: BaseOutStructure,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelinePropertiesEXT.html
        """
        return self._get_pipeline_properties(device, Ptr(to=pipeline_info), Ptr(to=pipeline_properties))


struct ExtendedDynamicState2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_patch_control_points: fn(command_buffer: CommandBuffer, patch_control_points: UInt32)
    var _cmd_set_rasterizer_discard_enable: fn(
        command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    )
    var _cmd_set_depth_bias_enable: fn(command_buffer: CommandBuffer, depth_bias_enable: Bool32)
    var _cmd_set_logic_op: fn(command_buffer: CommandBuffer, logic_op: LogicOp)
    var _cmd_set_primitive_restart_enable: fn(
        command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn cmd_set_patch_control_points(
        self, command_buffer: CommandBuffer, patch_control_points: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPatchControlPointsEXT.html
        """
        return self._cmd_set_patch_control_points(command_buffer, patch_control_points)

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

    fn cmd_set_logic_op(self, command_buffer: CommandBuffer, logic_op: LogicOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEXT.html
        """
        return self._cmd_set_logic_op(command_buffer, logic_op)

    fn cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)


struct ColorWriteEnable(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_color_write_enable: fn(
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_color_write_enables: Ptr[Bool32, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_color_write_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorWriteEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_color_write_enable)]()[]

    fn cmd_set_color_write_enable[p_color_write_enables_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_color_write_enables).bitcast[Ptr[Bool32, ImmutAnyOrigin]]()[],
        )


struct MultiDraw(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_multi: fn(
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_vertex_info: Ptr[MultiDrawInfoEXT, ImmutAnyOrigin],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
    )
    var _cmd_draw_multi_indexed: fn(
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
        self._cmd_draw_multi = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMultiEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_multi)]()[]
        self._cmd_draw_multi_indexed = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMultiIndexedEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_multi_indexed)]()[]

    fn cmd_draw_multi[p_vertex_info_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_vertex_info).bitcast[Ptr[MultiDrawInfoEXT, ImmutAnyOrigin]]()[],
            instance_count,
            first_instance,
            stride,
        )

    fn cmd_draw_multi_indexed[
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
        return self._cmd_draw_multi_indexed(
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
    var _create_micromap: fn(
        device: Device,
        p_create_info: Ptr[MicromapCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_micromap: Ptr[MicromapEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_micromap: fn(
        device: Device, micromap: MicromapEXT, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _cmd_build_micromaps: fn(
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin],
    )
    var _build_micromaps: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _copy_micromap: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMicromapInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _copy_micromap_to_memory: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMicromapToMemoryInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _copy_memory_to_micromap: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMemoryToMicromapInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _write_micromaps_properties: fn(
        device: Device,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT, ImmutAnyOrigin],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: UInt,
    ) -> Result
    var _cmd_copy_micromap: fn(
        command_buffer: CommandBuffer, p_info: Ptr[CopyMicromapInfoEXT, ImmutAnyOrigin]
    )
    var _cmd_copy_micromap_to_memory: fn(
        command_buffer: CommandBuffer, p_info: Ptr[CopyMicromapToMemoryInfoEXT, ImmutAnyOrigin]
    )
    var _cmd_copy_memory_to_micromap: fn(
        command_buffer: CommandBuffer, p_info: Ptr[CopyMemoryToMicromapInfoEXT, ImmutAnyOrigin]
    )
    var _cmd_write_micromaps_properties: fn(
        command_buffer: CommandBuffer,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT, ImmutAnyOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    )
    var _get_device_micromap_compatibility: fn(
        device: Device,
        p_version_info: Ptr[MicromapVersionInfoEXT, ImmutAnyOrigin],
        p_compatibility: Ptr[AccelerationStructureCompatibilityKHR, MutAnyOrigin],
    )
    var _get_micromap_build_sizes: fn(
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

    fn create_micromap[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: MicromapCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut micromap: MicromapEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateMicromapEXT.html
        """
        return self._create_micromap(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=micromap),
        )

    fn destroy_micromap[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        micromap: MicromapEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyMicromapEXT.html
        """
        return self._destroy_micromap(
            device, micromap, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn cmd_build_micromaps[p_infos_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_infos).bitcast[Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin]]()[],
        )

    fn build_micromaps[p_infos_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_infos).bitcast[Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin]]()[],
        )

    fn copy_micromap(
        self, device: Device, deferred_operation: DeferredOperationKHR, info: CopyMicromapInfoEXT
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMicromapEXT.html
        """
        return self._copy_micromap(device, deferred_operation, Ptr(to=info))

    fn copy_micromap_to_memory(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMicromapToMemoryInfoEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMicromapToMemoryEXT.html
        """
        return self._copy_micromap_to_memory(device, deferred_operation, Ptr(to=info))

    fn copy_memory_to_micromap(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMemoryToMicromapInfoEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToMicromapEXT.html
        """
        return self._copy_memory_to_micromap(device, deferred_operation, Ptr(to=info))

    fn write_micromaps_properties[
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
        return self._write_micromaps_properties(
            device,
            micromap_count,
            Ptr(to=p_micromaps).bitcast[Ptr[MicromapEXT, ImmutAnyOrigin]]()[],
            query_type,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
            stride,
        )

    fn cmd_copy_micromap(self, command_buffer: CommandBuffer, info: CopyMicromapInfoEXT):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMicromapEXT.html
        """
        return self._cmd_copy_micromap(command_buffer, Ptr(to=info))

    fn cmd_copy_micromap_to_memory(
        self, command_buffer: CommandBuffer, info: CopyMicromapToMemoryInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMicromapToMemoryEXT.html
        """
        return self._cmd_copy_micromap_to_memory(command_buffer, Ptr(to=info))

    fn cmd_copy_memory_to_micromap(
        self, command_buffer: CommandBuffer, info: CopyMemoryToMicromapInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryToMicromapEXT.html
        """
        return self._cmd_copy_memory_to_micromap(command_buffer, Ptr(to=info))

    fn cmd_write_micromaps_properties[p_micromaps_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_micromaps).bitcast[Ptr[MicromapEXT, ImmutAnyOrigin]]()[],
            query_type,
            query_pool,
            first_query,
        )

    fn get_device_micromap_compatibility(
        self,
        device: Device,
        version_info: MicromapVersionInfoEXT,
        mut compatibility: AccelerationStructureCompatibilityKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMicromapCompatibilityEXT.html
        """
        return self._get_device_micromap_compatibility(device, Ptr(to=version_info), Ptr(to=compatibility))

    fn get_micromap_build_sizes(
        self,
        device: Device,
        build_type: AccelerationStructureBuildTypeKHR,
        build_info: MicromapBuildInfoEXT,
        mut size_info: MicromapBuildSizesInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMicromapBuildSizesEXT.html
        """
        return self._get_micromap_build_sizes(device, build_type, Ptr(to=build_info), Ptr(to=size_info))


struct PageableDeviceLocalMemory(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_device_memory_priority: fn(device: Device, memory: DeviceMemory, priority: Float32)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_device_memory_priority = Ptr(to=get_device_proc_addr(
            device, "vkSetDeviceMemoryPriorityEXT".as_c_string_slice()
        )).bitcast[type_of(self._set_device_memory_priority)]()[]

    fn set_device_memory_priority(self, device: Device, memory: DeviceMemory, priority: Float32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDeviceMemoryPriorityEXT.html
        """
        return self._set_device_memory_priority(device, memory, priority)


struct ExtendedDynamicState3(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_depth_clamp_enable: fn(command_buffer: CommandBuffer, depth_clamp_enable: Bool32)
    var _cmd_set_polygon_mode: fn(command_buffer: CommandBuffer, polygon_mode: PolygonMode)
    var _cmd_set_rasterization_samples: fn(
        command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    )
    var _cmd_set_sample_mask: fn(
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask, ImmutAnyOrigin],
    )
    var _cmd_set_alpha_to_coverage_enable: fn(
        command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    )
    var _cmd_set_alpha_to_one_enable: fn(command_buffer: CommandBuffer, alpha_to_one_enable: Bool32)
    var _cmd_set_logic_op_enable: fn(command_buffer: CommandBuffer, logic_op_enable: Bool32)
    var _cmd_set_color_blend_enable: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, ImmutAnyOrigin],
    )
    var _cmd_set_color_blend_equation: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT, ImmutAnyOrigin],
    )
    var _cmd_set_color_write_mask: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, ImmutAnyOrigin],
    )
    var _cmd_set_tessellation_domain_origin: fn(
        command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    )
    var _cmd_set_rasterization_stream: fn(command_buffer: CommandBuffer, rasterization_stream: UInt32)
    var _cmd_set_conservative_rasterization_mode: fn(
        command_buffer: CommandBuffer, conservative_rasterization_mode: ConservativeRasterizationModeEXT
    )
    var _cmd_set_extra_primitive_overestimation_size: fn(
        command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    )
    var _cmd_set_depth_clip_enable: fn(command_buffer: CommandBuffer, depth_clip_enable: Bool32)
    var _cmd_set_sample_locations_enable: fn(
        command_buffer: CommandBuffer, sample_locations_enable: Bool32
    )
    var _cmd_set_color_blend_advanced: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin],
    )
    var _cmd_set_provoking_vertex_mode: fn(
        command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    )
    var _cmd_set_line_rasterization_mode: fn(
        command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    )
    var _cmd_set_line_stipple_enable: fn(command_buffer: CommandBuffer, stippled_line_enable: Bool32)
    var _cmd_set_depth_clip_negative_one_to_one: fn(
        command_buffer: CommandBuffer, negative_one_to_one: Bool32
    )
    var _cmd_set_viewport_w_scaling_enable: fn(
        command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    )
    var _cmd_set_viewport_swizzle: fn(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, ImmutAnyOrigin],
    )
    var _cmd_set_coverage_to_color_enable: fn(
        command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    )
    var _cmd_set_coverage_to_color_location: fn(
        command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    )
    var _cmd_set_coverage_modulation_mode: fn(
        command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    )
    var _cmd_set_coverage_modulation_table_enable: fn(
        command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    )
    var _cmd_set_coverage_modulation_table: fn(
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, ImmutAnyOrigin],
    )
    var _cmd_set_shading_rate_image_enable: fn(
        command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    )
    var _cmd_set_representative_fragment_test_enable: fn(
        command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    )
    var _cmd_set_coverage_reduction_mode: fn(
        command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn cmd_set_depth_clamp_enable(self, command_buffer: CommandBuffer, depth_clamp_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampEnableEXT.html
        """
        return self._cmd_set_depth_clamp_enable(command_buffer, depth_clamp_enable)

    fn cmd_set_polygon_mode(self, command_buffer: CommandBuffer, polygon_mode: PolygonMode):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPolygonModeEXT.html
        """
        return self._cmd_set_polygon_mode(command_buffer, polygon_mode)

    fn cmd_set_rasterization_samples(
        self, command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationSamplesEXT.html
        """
        return self._cmd_set_rasterization_samples(command_buffer, rasterization_samples)

    fn cmd_set_sample_mask[p_sample_mask_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask, p_sample_mask_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleMaskEXT.html
        """
        return self._cmd_set_sample_mask(
            command_buffer, samples, Ptr(to=p_sample_mask).bitcast[Ptr[SampleMask, ImmutAnyOrigin]]()[]
        )

    fn cmd_set_alpha_to_coverage_enable(
        self, command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToCoverageEnableEXT.html
        """
        return self._cmd_set_alpha_to_coverage_enable(command_buffer, alpha_to_coverage_enable)

    fn cmd_set_alpha_to_one_enable(
        self, command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToOneEnableEXT.html
        """
        return self._cmd_set_alpha_to_one_enable(command_buffer, alpha_to_one_enable)

    fn cmd_set_logic_op_enable(self, command_buffer: CommandBuffer, logic_op_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEnableEXT.html
        """
        return self._cmd_set_logic_op_enable(command_buffer, logic_op_enable)

    fn cmd_set_color_blend_enable[p_color_blend_enables_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_color_blend_enables).bitcast[Ptr[Bool32, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_color_blend_equation[p_color_blend_equations_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_color_blend_equations).bitcast[Ptr[ColorBlendEquationEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_color_write_mask[p_color_write_masks_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_color_write_masks).bitcast[Ptr[ColorComponentFlags, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_tessellation_domain_origin(
        self, command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetTessellationDomainOriginEXT.html
        """
        return self._cmd_set_tessellation_domain_origin(command_buffer, domain_origin)

    fn cmd_set_rasterization_stream(
        self, command_buffer: CommandBuffer, rasterization_stream: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationStreamEXT.html
        """
        return self._cmd_set_rasterization_stream(command_buffer, rasterization_stream)

    fn cmd_set_conservative_rasterization_mode(
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

    fn cmd_set_extra_primitive_overestimation_size(
        self, command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExtraPrimitiveOverestimationSizeEXT.html
        """
        return self._cmd_set_extra_primitive_overestimation_size(
            command_buffer, extra_primitive_overestimation_size
        )

    fn cmd_set_depth_clip_enable(self, command_buffer: CommandBuffer, depth_clip_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipEnableEXT.html
        """
        return self._cmd_set_depth_clip_enable(command_buffer, depth_clip_enable)

    fn cmd_set_sample_locations_enable(
        self, command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEnableEXT.html
        """
        return self._cmd_set_sample_locations_enable(command_buffer, sample_locations_enable)

    fn cmd_set_color_blend_advanced[p_color_blend_advanced_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_color_blend_advanced).bitcast[Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_provoking_vertex_mode(
        self, command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetProvokingVertexModeEXT.html
        """
        return self._cmd_set_provoking_vertex_mode(command_buffer, provoking_vertex_mode)

    fn cmd_set_line_rasterization_mode(
        self, command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineRasterizationModeEXT.html
        """
        return self._cmd_set_line_rasterization_mode(command_buffer, line_rasterization_mode)

    fn cmd_set_line_stipple_enable(
        self, command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStippleEnableEXT.html
        """
        return self._cmd_set_line_stipple_enable(command_buffer, stippled_line_enable)

    fn cmd_set_depth_clip_negative_one_to_one(
        self, command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipNegativeOneToOneEXT.html
        """
        return self._cmd_set_depth_clip_negative_one_to_one(command_buffer, negative_one_to_one)

    fn cmd_set_viewport_w_scaling_enable(
        self, command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingEnableNV.html
        """
        return self._cmd_set_viewport_w_scaling_enable(command_buffer, viewport_w_scaling_enable)

    fn cmd_set_viewport_swizzle[p_viewport_swizzles_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_viewport_swizzles).bitcast[Ptr[ViewportSwizzleNV, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_coverage_to_color_enable(
        self, command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorEnableNV.html
        """
        return self._cmd_set_coverage_to_color_enable(command_buffer, coverage_to_color_enable)

    fn cmd_set_coverage_to_color_location(
        self, command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorLocationNV.html
        """
        return self._cmd_set_coverage_to_color_location(command_buffer, coverage_to_color_location)

    fn cmd_set_coverage_modulation_mode(
        self, command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationModeNV.html
        """
        return self._cmd_set_coverage_modulation_mode(command_buffer, coverage_modulation_mode)

    fn cmd_set_coverage_modulation_table_enable(
        self, command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableEnableNV.html
        """
        return self._cmd_set_coverage_modulation_table_enable(
            command_buffer, coverage_modulation_table_enable
        )

    fn cmd_set_coverage_modulation_table[
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
        return self._cmd_set_coverage_modulation_table(
            command_buffer,
            coverage_modulation_table_count,
            Ptr(to=p_coverage_modulation_table).bitcast[Ptr[Float32, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_shading_rate_image_enable(
        self, command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetShadingRateImageEnableNV.html
        """
        return self._cmd_set_shading_rate_image_enable(command_buffer, shading_rate_image_enable)

    fn cmd_set_representative_fragment_test_enable(
        self, command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRepresentativeFragmentTestEnableNV.html
        """
        return self._cmd_set_representative_fragment_test_enable(
            command_buffer, representative_fragment_test_enable
        )

    fn cmd_set_coverage_reduction_mode(
        self, command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageReductionModeNV.html
        """
        return self._cmd_set_coverage_reduction_mode(command_buffer, coverage_reduction_mode)


struct ShaderModuleIdentifier(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_shader_module_identifier: fn(
        device: Device,
        shader_module: ShaderModule,
        p_identifier: Ptr[ShaderModuleIdentifierEXT, MutAnyOrigin],
    )
    var _get_shader_module_create_info_identifier: fn(
        device: Device,
        p_create_info: Ptr[ShaderModuleCreateInfo, ImmutAnyOrigin],
        p_identifier: Ptr[ShaderModuleIdentifierEXT, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_shader_module_identifier = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderModuleIdentifierEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_shader_module_identifier)]()[]
        self._get_shader_module_create_info_identifier = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderModuleCreateInfoIdentifierEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_shader_module_create_info_identifier)]()[]

    fn get_shader_module_identifier(
        self, device: Device, shader_module: ShaderModule, mut identifier: ShaderModuleIdentifierEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderModuleIdentifierEXT.html
        """
        return self._get_shader_module_identifier(device, shader_module, Ptr(to=identifier))

    fn get_shader_module_create_info_identifier(
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        mut identifier: ShaderModuleIdentifierEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderModuleCreateInfoIdentifierEXT.html
        """
        return self._get_shader_module_create_info_identifier(
            device, Ptr(to=create_info), Ptr(to=identifier)
        )


struct ShaderObject(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_shaders: fn(
        device: Device,
        create_info_count: UInt32,
        p_create_infos: Ptr[ShaderCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_shaders: Ptr[ShaderEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_shader: fn(
        device: Device, shader: ShaderEXT, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _get_shader_binary_data: fn(
        device: Device,
        shader: ShaderEXT,
        p_data_size: Ptr[UInt, MutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _cmd_bind_shaders: fn(
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
    var _cmd_set_vertex_input: fn(
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin],
    )
    var _cmd_set_patch_control_points: fn(command_buffer: CommandBuffer, patch_control_points: UInt32)
    var _cmd_set_rasterizer_discard_enable: fn(
        command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    )
    var _cmd_set_depth_bias_enable: fn(command_buffer: CommandBuffer, depth_bias_enable: Bool32)
    var _cmd_set_logic_op: fn(command_buffer: CommandBuffer, logic_op: LogicOp)
    var _cmd_set_primitive_restart_enable: fn(
        command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    )
    var _cmd_set_tessellation_domain_origin: fn(
        command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    )
    var _cmd_set_depth_clamp_enable: fn(command_buffer: CommandBuffer, depth_clamp_enable: Bool32)
    var _cmd_set_polygon_mode: fn(command_buffer: CommandBuffer, polygon_mode: PolygonMode)
    var _cmd_set_rasterization_samples: fn(
        command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    )
    var _cmd_set_sample_mask: fn(
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask, ImmutAnyOrigin],
    )
    var _cmd_set_alpha_to_coverage_enable: fn(
        command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    )
    var _cmd_set_alpha_to_one_enable: fn(command_buffer: CommandBuffer, alpha_to_one_enable: Bool32)
    var _cmd_set_logic_op_enable: fn(command_buffer: CommandBuffer, logic_op_enable: Bool32)
    var _cmd_set_color_blend_enable: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, ImmutAnyOrigin],
    )
    var _cmd_set_color_blend_equation: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT, ImmutAnyOrigin],
    )
    var _cmd_set_color_write_mask: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, ImmutAnyOrigin],
    )
    var _cmd_set_rasterization_stream: fn(command_buffer: CommandBuffer, rasterization_stream: UInt32)
    var _cmd_set_conservative_rasterization_mode: fn(
        command_buffer: CommandBuffer, conservative_rasterization_mode: ConservativeRasterizationModeEXT
    )
    var _cmd_set_extra_primitive_overestimation_size: fn(
        command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    )
    var _cmd_set_depth_clip_enable: fn(command_buffer: CommandBuffer, depth_clip_enable: Bool32)
    var _cmd_set_sample_locations_enable: fn(
        command_buffer: CommandBuffer, sample_locations_enable: Bool32
    )
    var _cmd_set_color_blend_advanced: fn(
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin],
    )
    var _cmd_set_provoking_vertex_mode: fn(
        command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    )
    var _cmd_set_line_rasterization_mode: fn(
        command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    )
    var _cmd_set_line_stipple_enable: fn(command_buffer: CommandBuffer, stippled_line_enable: Bool32)
    var _cmd_set_depth_clip_negative_one_to_one: fn(
        command_buffer: CommandBuffer, negative_one_to_one: Bool32
    )
    var _cmd_set_viewport_w_scaling_enable: fn(
        command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    )
    var _cmd_set_viewport_swizzle: fn(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, ImmutAnyOrigin],
    )
    var _cmd_set_coverage_to_color_enable: fn(
        command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    )
    var _cmd_set_coverage_to_color_location: fn(
        command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    )
    var _cmd_set_coverage_modulation_mode: fn(
        command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    )
    var _cmd_set_coverage_modulation_table_enable: fn(
        command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    )
    var _cmd_set_coverage_modulation_table: fn(
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, ImmutAnyOrigin],
    )
    var _cmd_set_shading_rate_image_enable: fn(
        command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    )
    var _cmd_set_representative_fragment_test_enable: fn(
        command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    )
    var _cmd_set_coverage_reduction_mode: fn(
        command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    )
    var _cmd_set_depth_clamp_range: fn(
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
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

    fn create_shaders[
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
        return self._create_shaders(
            device,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[ShaderCreateInfoEXT, ImmutAnyOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=p_shaders).bitcast[Ptr[ShaderEXT, MutAnyOrigin]]()[],
        )

    fn destroy_shader[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        shader: ShaderEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderEXT.html
        """
        return self._destroy_shader(
            device, shader, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn get_shader_binary_data[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        shader: ShaderEXT,
        mut data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderBinaryDataEXT.html
        """
        return self._get_shader_binary_data(
            device, shader, Ptr(to=data_size), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_shader_binary_data[p_data_origin: MutOrigin = MutAnyOrigin](
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
        device, shader, Ptr(to=count), Ptr[NoneType, MutOrigin.external]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_shader_binary_data(
        device, shader, Ptr(to=count), list.unsafe_ptr().bitcast[NoneType]()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn cmd_bind_shaders[
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
        return self._cmd_bind_shaders(
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

    fn cmd_set_vertex_input[
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
        return self._cmd_set_vertex_input(
            command_buffer,
            vertex_binding_description_count,
            Ptr(to=p_vertex_binding_descriptions).bitcast[Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin]]()[],
            vertex_attribute_description_count,
            Ptr(to=p_vertex_attribute_descriptions).bitcast[Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_patch_control_points(
        self, command_buffer: CommandBuffer, patch_control_points: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPatchControlPointsEXT.html
        """
        return self._cmd_set_patch_control_points(command_buffer, patch_control_points)

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

    fn cmd_set_logic_op(self, command_buffer: CommandBuffer, logic_op: LogicOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEXT.html
        """
        return self._cmd_set_logic_op(command_buffer, logic_op)

    fn cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)

    fn cmd_set_tessellation_domain_origin(
        self, command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetTessellationDomainOriginEXT.html
        """
        return self._cmd_set_tessellation_domain_origin(command_buffer, domain_origin)

    fn cmd_set_depth_clamp_enable(self, command_buffer: CommandBuffer, depth_clamp_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampEnableEXT.html
        """
        return self._cmd_set_depth_clamp_enable(command_buffer, depth_clamp_enable)

    fn cmd_set_polygon_mode(self, command_buffer: CommandBuffer, polygon_mode: PolygonMode):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPolygonModeEXT.html
        """
        return self._cmd_set_polygon_mode(command_buffer, polygon_mode)

    fn cmd_set_rasterization_samples(
        self, command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationSamplesEXT.html
        """
        return self._cmd_set_rasterization_samples(command_buffer, rasterization_samples)

    fn cmd_set_sample_mask[p_sample_mask_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask, p_sample_mask_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleMaskEXT.html
        """
        return self._cmd_set_sample_mask(
            command_buffer, samples, Ptr(to=p_sample_mask).bitcast[Ptr[SampleMask, ImmutAnyOrigin]]()[]
        )

    fn cmd_set_alpha_to_coverage_enable(
        self, command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToCoverageEnableEXT.html
        """
        return self._cmd_set_alpha_to_coverage_enable(command_buffer, alpha_to_coverage_enable)

    fn cmd_set_alpha_to_one_enable(
        self, command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToOneEnableEXT.html
        """
        return self._cmd_set_alpha_to_one_enable(command_buffer, alpha_to_one_enable)

    fn cmd_set_logic_op_enable(self, command_buffer: CommandBuffer, logic_op_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEnableEXT.html
        """
        return self._cmd_set_logic_op_enable(command_buffer, logic_op_enable)

    fn cmd_set_color_blend_enable[p_color_blend_enables_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_color_blend_enables).bitcast[Ptr[Bool32, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_color_blend_equation[p_color_blend_equations_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_color_blend_equations).bitcast[Ptr[ColorBlendEquationEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_color_write_mask[p_color_write_masks_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_color_write_masks).bitcast[Ptr[ColorComponentFlags, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_rasterization_stream(
        self, command_buffer: CommandBuffer, rasterization_stream: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationStreamEXT.html
        """
        return self._cmd_set_rasterization_stream(command_buffer, rasterization_stream)

    fn cmd_set_conservative_rasterization_mode(
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

    fn cmd_set_extra_primitive_overestimation_size(
        self, command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExtraPrimitiveOverestimationSizeEXT.html
        """
        return self._cmd_set_extra_primitive_overestimation_size(
            command_buffer, extra_primitive_overestimation_size
        )

    fn cmd_set_depth_clip_enable(self, command_buffer: CommandBuffer, depth_clip_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipEnableEXT.html
        """
        return self._cmd_set_depth_clip_enable(command_buffer, depth_clip_enable)

    fn cmd_set_sample_locations_enable(
        self, command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEnableEXT.html
        """
        return self._cmd_set_sample_locations_enable(command_buffer, sample_locations_enable)

    fn cmd_set_color_blend_advanced[p_color_blend_advanced_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_color_blend_advanced).bitcast[Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_provoking_vertex_mode(
        self, command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetProvokingVertexModeEXT.html
        """
        return self._cmd_set_provoking_vertex_mode(command_buffer, provoking_vertex_mode)

    fn cmd_set_line_rasterization_mode(
        self, command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineRasterizationModeEXT.html
        """
        return self._cmd_set_line_rasterization_mode(command_buffer, line_rasterization_mode)

    fn cmd_set_line_stipple_enable(
        self, command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStippleEnableEXT.html
        """
        return self._cmd_set_line_stipple_enable(command_buffer, stippled_line_enable)

    fn cmd_set_depth_clip_negative_one_to_one(
        self, command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipNegativeOneToOneEXT.html
        """
        return self._cmd_set_depth_clip_negative_one_to_one(command_buffer, negative_one_to_one)

    fn cmd_set_viewport_w_scaling_enable(
        self, command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingEnableNV.html
        """
        return self._cmd_set_viewport_w_scaling_enable(command_buffer, viewport_w_scaling_enable)

    fn cmd_set_viewport_swizzle[p_viewport_swizzles_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_viewport_swizzles).bitcast[Ptr[ViewportSwizzleNV, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_coverage_to_color_enable(
        self, command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorEnableNV.html
        """
        return self._cmd_set_coverage_to_color_enable(command_buffer, coverage_to_color_enable)

    fn cmd_set_coverage_to_color_location(
        self, command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorLocationNV.html
        """
        return self._cmd_set_coverage_to_color_location(command_buffer, coverage_to_color_location)

    fn cmd_set_coverage_modulation_mode(
        self, command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationModeNV.html
        """
        return self._cmd_set_coverage_modulation_mode(command_buffer, coverage_modulation_mode)

    fn cmd_set_coverage_modulation_table_enable(
        self, command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableEnableNV.html
        """
        return self._cmd_set_coverage_modulation_table_enable(
            command_buffer, coverage_modulation_table_enable
        )

    fn cmd_set_coverage_modulation_table[
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
        return self._cmd_set_coverage_modulation_table(
            command_buffer,
            coverage_modulation_table_count,
            Ptr(to=p_coverage_modulation_table).bitcast[Ptr[Float32, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_shading_rate_image_enable(
        self, command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetShadingRateImageEnableNV.html
        """
        return self._cmd_set_shading_rate_image_enable(command_buffer, shading_rate_image_enable)

    fn cmd_set_representative_fragment_test_enable(
        self, command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRepresentativeFragmentTestEnableNV.html
        """
        return self._cmd_set_representative_fragment_test_enable(
            command_buffer, representative_fragment_test_enable
        )

    fn cmd_set_coverage_reduction_mode(
        self, command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageReductionModeNV.html
        """
        return self._cmd_set_coverage_reduction_mode(command_buffer, coverage_reduction_mode)

    fn cmd_set_depth_clamp_range[p_depth_clamp_range_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT, p_depth_clamp_range_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampRangeEXT.html
        """
        return self._cmd_set_depth_clamp_range(
            command_buffer,
            depth_clamp_mode,
            Ptr(to=p_depth_clamp_range).bitcast[Ptr[DepthClampRangeEXT, ImmutAnyOrigin]]()[],
        )


struct AttachmentFeedbackLoopDynamicState(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_attachment_feedback_loop_enable: fn(
        command_buffer: CommandBuffer, aspect_mask: ImageAspectFlags
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_attachment_feedback_loop_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAttachmentFeedbackLoopEnableEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_attachment_feedback_loop_enable)]()[]

    fn cmd_set_attachment_feedback_loop_enable(
        self, command_buffer: CommandBuffer, aspect_mask: ImageAspectFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAttachmentFeedbackLoopEnableEXT.html
        """
        return self._cmd_set_attachment_feedback_loop_enable(command_buffer, aspect_mask)


struct MemoryDecompression(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_decompress_memory: fn(
        command_buffer: CommandBuffer,
        p_decompress_memory_info_ext: Ptr[DecompressMemoryInfoEXT, ImmutAnyOrigin],
    )
    var _cmd_decompress_memory_indirect_count: fn(
        command_buffer: CommandBuffer,
        decompression_method: MemoryDecompressionMethodFlagsEXT,
        indirect_commands_address: DeviceAddress,
        indirect_commands_count_address: DeviceAddress,
        max_decompression_count: UInt32,
        stride: UInt32,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_decompress_memory = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_decompress_memory)]()[]
        self._cmd_decompress_memory_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryIndirectCountEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_decompress_memory_indirect_count)]()[]

    fn cmd_decompress_memory(
        self, command_buffer: CommandBuffer, decompress_memory_info_ext: DecompressMemoryInfoEXT
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecompressMemoryEXT.html
        """
        return self._cmd_decompress_memory(command_buffer, Ptr(to=decompress_memory_info_ext))

    fn cmd_decompress_memory_indirect_count(
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
    var _get_generated_commands_memory_requirements: fn(
        device: Device,
        p_info: Ptr[GeneratedCommandsMemoryRequirementsInfoEXT, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _cmd_preprocess_generated_commands: fn(
        command_buffer: CommandBuffer,
        p_generated_commands_info: Ptr[GeneratedCommandsInfoEXT, ImmutAnyOrigin],
        state_command_buffer: CommandBuffer,
    )
    var _cmd_execute_generated_commands: fn(
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        p_generated_commands_info: Ptr[GeneratedCommandsInfoEXT, ImmutAnyOrigin],
    )
    var _create_indirect_commands_layout: fn(
        device: Device,
        p_create_info: Ptr[IndirectCommandsLayoutCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_indirect_commands_layout: Ptr[IndirectCommandsLayoutEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_indirect_commands_layout: fn(
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _create_indirect_execution_set: fn(
        device: Device,
        p_create_info: Ptr[IndirectExecutionSetCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_indirect_execution_set: Ptr[IndirectExecutionSetEXT, MutAnyOrigin],
    ) -> Result
    var _destroy_indirect_execution_set: fn(
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _update_indirect_execution_set_pipeline: fn(
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetPipelineEXT, ImmutAnyOrigin],
    )
    var _update_indirect_execution_set_shader: fn(
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

    fn get_generated_commands_memory_requirements(
        self,
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoEXT,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetGeneratedCommandsMemoryRequirementsEXT.html
        """
        return self._get_generated_commands_memory_requirements(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn cmd_preprocess_generated_commands(
        self,
        command_buffer: CommandBuffer,
        generated_commands_info: GeneratedCommandsInfoEXT,
        state_command_buffer: CommandBuffer,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPreprocessGeneratedCommandsEXT.html
        """
        return self._cmd_preprocess_generated_commands(
            command_buffer, Ptr(to=generated_commands_info), state_command_buffer
        )

    fn cmd_execute_generated_commands(
        self,
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        generated_commands_info: GeneratedCommandsInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteGeneratedCommandsEXT.html
        """
        return self._cmd_execute_generated_commands(
            command_buffer, is_preprocessed, Ptr(to=generated_commands_info)
        )

    fn create_indirect_commands_layout[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut indirect_commands_layout: IndirectCommandsLayoutEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectCommandsLayoutEXT.html
        """
        return self._create_indirect_commands_layout(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=indirect_commands_layout),
        )

    fn destroy_indirect_commands_layout[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectCommandsLayoutEXT.html
        """
        return self._destroy_indirect_commands_layout(
            device,
            indirect_commands_layout,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn create_indirect_execution_set[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: IndirectExecutionSetCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut indirect_execution_set: IndirectExecutionSetEXT,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectExecutionSetEXT.html
        """
        return self._create_indirect_execution_set(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=indirect_execution_set),
        )

    fn destroy_indirect_execution_set[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectExecutionSetEXT.html
        """
        return self._destroy_indirect_execution_set(
            device,
            indirect_execution_set,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn update_indirect_execution_set_pipeline[
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
        return self._update_indirect_execution_set_pipeline(
            device,
            indirect_execution_set,
            execution_set_write_count,
            Ptr(to=p_execution_set_writes).bitcast[Ptr[WriteIndirectExecutionSetPipelineEXT, ImmutAnyOrigin]]()[],
        )

    fn update_indirect_execution_set_shader[
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
        return self._update_indirect_execution_set_shader(
            device,
            indirect_execution_set,
            execution_set_write_count,
            Ptr(to=p_execution_set_writes).bitcast[Ptr[WriteIndirectExecutionSetShaderEXT, ImmutAnyOrigin]]()[],
        )


struct DepthClampControl(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_depth_clamp_range: fn(
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_clamp_range = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampRangeEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_depth_clamp_range)]()[]

    fn cmd_set_depth_clamp_range[p_depth_clamp_range_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT, p_depth_clamp_range_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampRangeEXT.html
        """
        return self._cmd_set_depth_clamp_range(
            command_buffer,
            depth_clamp_mode,
            Ptr(to=p_depth_clamp_range).bitcast[Ptr[DepthClampRangeEXT, ImmutAnyOrigin]]()[],
        )


struct ExternalMemoryMetal(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_metal_handle: fn(
        device: Device,
        p_get_metal_handle_info: Ptr[MemoryGetMetalHandleInfoEXT, ImmutAnyOrigin],
        p_handle: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    ) -> Result
    var _get_memory_metal_handle_properties: fn(
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
        self._get_memory_metal_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryMetalHandleEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_metal_handle)]()[]
        self._get_memory_metal_handle_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryMetalHandlePropertiesEXT".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_metal_handle_properties)]()[]

    fn get_memory_metal_handle[handle_origin: MutOrigin = MutAnyOrigin](
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
            Ptr(to=get_metal_handle_info),
            Ptr(to=Ptr(to=handle)).bitcast[Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin]]()[],
        )

    fn get_memory_metal_handle_properties[p_handle_origin: ImmutOrigin = ImmutAnyOrigin](
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
            Ptr(to=p_handle).bitcast[Ptr[NoneType, ImmutAnyOrigin]]()[],
            Ptr(to=memory_metal_handle_properties),
        )


struct FragmentDensityMapOffset(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_end_rendering_2: fn(
        command_buffer: CommandBuffer, p_rendering_end_info: Ptr[RenderingEndInfoKHR, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_end_rendering_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRendering2KHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_rendering_2)]()[]

    fn cmd_end_rendering_2[p_rendering_end_info_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        p_rendering_end_info: Ptr[RenderingEndInfoKHR, p_rendering_end_info_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering2KHR.html
        """
        return self._cmd_end_rendering_2(
            command_buffer,
            Ptr(to=p_rendering_end_info).bitcast[Ptr[RenderingEndInfoKHR, ImmutAnyOrigin]]()[],
        )


struct CustomResolve(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_begin_custom_resolve: fn(
        command_buffer: CommandBuffer,
        p_begin_custom_resolve_info: Ptr[BeginCustomResolveInfoEXT, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_begin_custom_resolve = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginCustomResolveEXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_custom_resolve)]()[]

    fn cmd_begin_custom_resolve[p_begin_custom_resolve_info_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        p_begin_custom_resolve_info: Ptr[BeginCustomResolveInfoEXT, p_begin_custom_resolve_info_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginCustomResolveEXT.html
        """
        return self._cmd_begin_custom_resolve(
            command_buffer,
            Ptr(to=p_begin_custom_resolve_info).bitcast[Ptr[BeginCustomResolveInfoEXT, ImmutAnyOrigin]]()[],
        )
