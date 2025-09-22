from vk.core_functions import GlobalFunctions


struct DebugReport(Copyable, Movable):
    var _create_debug_report_callback_ext: fn(
        instance: Instance, pCreateInfo: Ptr[DebugReportCallbackCreateInfoEXT], pAllocator: Ptr[AllocationCallbacks], pCallback: Ptr[DebugReportCallbackEXT]
    ) -> Result
    var _destroy_debug_report_callback_ext: fn(
        instance: Instance, callback: DebugReportCallbackEXT, pAllocator: Ptr[AllocationCallbacks]
    )
    var _debug_report_message_ext: fn(
        instance: Instance, flags: DebugReportFlagsEXT, objectType: DebugReportObjectTypeEXT, object: UInt64, location: UInt, messageCode: Int32, pLayerPrefix: Ptr[UInt8], pMessage: Ptr[UInt8]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_debug_report_callback_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDebugReportCallbackEXT".unsafe_ptr()
        )).bitcast[__type_of(self._create_debug_report_callback_ext)]()[]
        self._destroy_debug_report_callback_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroyDebugReportCallbackEXT".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_debug_report_callback_ext)]()[]
        self._debug_report_message_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkDebugReportMessageEXT".unsafe_ptr()
        )).bitcast[__type_of(self._debug_report_message_ext)]()[]

    fn create_debug_report_callback_ext(
        self,
        instance: Instance,
        create_info: DebugReportCallbackCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut callback: DebugReportCallbackEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_debug_report_callback_ext(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=callback)
        )

    fn destroy_debug_report_callback_ext(
        self,
        instance: Instance,
        callback: DebugReportCallbackEXT,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_debug_report_callback_ext(instance, callback, p_allocator)

    fn debug_report_message_ext(
        self,
        instance: Instance,
        flags: DebugReportFlagsEXT,
        object_type: DebugReportObjectTypeEXT,
        object: UInt64,
        location: UInt,
        message_code: Int32,
        p_layer_prefix: Ptr[UInt8],
        p_message: Ptr[UInt8],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._debug_report_message_ext(
            instance, flags, object_type, object, location, message_code, p_layer_prefix, p_message
        )


struct DebugMarker(Copyable, Movable):
    var _debug_marker_set_object_tag_ext: fn(
        device: Device, pTagInfo: Ptr[DebugMarkerObjectTagInfoEXT]
    ) -> Result
    var _debug_marker_set_object_name_ext: fn(
        device: Device, pNameInfo: Ptr[DebugMarkerObjectNameInfoEXT]
    ) -> Result
    var _cmd_debug_marker_begin_ext: fn(
        commandBuffer: CommandBuffer, pMarkerInfo: Ptr[DebugMarkerMarkerInfoEXT]
    )
    var _cmd_debug_marker_end_ext: fn(
        commandBuffer: CommandBuffer
    )
    var _cmd_debug_marker_insert_ext: fn(
        commandBuffer: CommandBuffer, pMarkerInfo: Ptr[DebugMarkerMarkerInfoEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._debug_marker_set_object_tag_ext = Ptr(to=get_device_proc_addr(
            device, "vkDebugMarkerSetObjectTagEXT".unsafe_ptr()
        )).bitcast[__type_of(self._debug_marker_set_object_tag_ext)]()[]
        self._debug_marker_set_object_name_ext = Ptr(to=get_device_proc_addr(
            device, "vkDebugMarkerSetObjectNameEXT".unsafe_ptr()
        )).bitcast[__type_of(self._debug_marker_set_object_name_ext)]()[]
        self._cmd_debug_marker_begin_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDebugMarkerBeginEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_debug_marker_begin_ext)]()[]
        self._cmd_debug_marker_end_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDebugMarkerEndEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_debug_marker_end_ext)]()[]
        self._cmd_debug_marker_insert_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDebugMarkerInsertEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_debug_marker_insert_ext)]()[]

    fn debug_marker_set_object_tag_ext(
        self, device: Device, tag_info: DebugMarkerObjectTagInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._debug_marker_set_object_tag_ext(device, Ptr(to=tag_info))

    fn debug_marker_set_object_name_ext(
        self, device: Device, name_info: DebugMarkerObjectNameInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._debug_marker_set_object_name_ext(device, Ptr(to=name_info))

    fn cmd_debug_marker_begin_ext(
        self, command_buffer: CommandBuffer, marker_info: DebugMarkerMarkerInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_debug_marker_begin_ext(command_buffer, Ptr(to=marker_info))

    fn cmd_debug_marker_end_ext(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_debug_marker_end_ext(command_buffer)

    fn cmd_debug_marker_insert_ext(
        self, command_buffer: CommandBuffer, marker_info: DebugMarkerMarkerInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_debug_marker_insert_ext(command_buffer, Ptr(to=marker_info))


struct TransformFeedback(Copyable, Movable):
    var _cmd_bind_transform_feedback_buffers_ext: fn(
        commandBuffer: CommandBuffer, firstBinding: UInt32, bindingCount: UInt32, pBuffers: Ptr[Buffer], pOffsets: Ptr[DeviceSize], pSizes: Ptr[DeviceSize]
    )
    var _cmd_begin_transform_feedback_ext: fn(
        commandBuffer: CommandBuffer, firstCounterBuffer: UInt32, counterBufferCount: UInt32, pCounterBuffers: Ptr[Buffer], pCounterBufferOffsets: Ptr[DeviceSize]
    )
    var _cmd_end_transform_feedback_ext: fn(
        commandBuffer: CommandBuffer, firstCounterBuffer: UInt32, counterBufferCount: UInt32, pCounterBuffers: Ptr[Buffer], pCounterBufferOffsets: Ptr[DeviceSize]
    )
    var _cmd_begin_query_indexed_ext: fn(
        commandBuffer: CommandBuffer, queryPool: QueryPool, query: UInt32, flags: QueryControlFlags, index: UInt32
    )
    var _cmd_end_query_indexed_ext: fn(
        commandBuffer: CommandBuffer, queryPool: QueryPool, query: UInt32, index: UInt32
    )
    var _cmd_draw_indirect_byte_count_ext: fn(
        commandBuffer: CommandBuffer, instanceCount: UInt32, firstInstance: UInt32, counterBuffer: Buffer, counterBufferOffset: DeviceSize, counterOffset: UInt32, vertexStride: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_transform_feedback_buffers_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindTransformFeedbackBuffersEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_transform_feedback_buffers_ext)]()[]
        self._cmd_begin_transform_feedback_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginTransformFeedbackEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_begin_transform_feedback_ext)]()[]
        self._cmd_end_transform_feedback_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndTransformFeedbackEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_end_transform_feedback_ext)]()[]
        self._cmd_begin_query_indexed_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginQueryIndexedEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_begin_query_indexed_ext)]()[]
        self._cmd_end_query_indexed_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndQueryIndexedEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_end_query_indexed_ext)]()[]
        self._cmd_draw_indirect_byte_count_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirectByteCountEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_indirect_byte_count_ext)]()[]

    fn cmd_bind_transform_feedback_buffers_ext(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer],
        p_offsets: Ptr[DeviceSize],
        p_sizes: Ptr[DeviceSize],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_transform_feedback_buffers_ext(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets, p_sizes
        )

    fn cmd_begin_transform_feedback_ext(
        self,
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer],
        p_counter_buffer_offsets: Ptr[DeviceSize],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_begin_transform_feedback_ext(
            command_buffer,
            first_counter_buffer,
            counter_buffer_count,
            p_counter_buffers,
            p_counter_buffer_offsets,
        )

    fn cmd_end_transform_feedback_ext(
        self,
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer],
        p_counter_buffer_offsets: Ptr[DeviceSize],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_end_transform_feedback_ext(
            command_buffer,
            first_counter_buffer,
            counter_buffer_count,
            p_counter_buffers,
            p_counter_buffer_offsets,
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_begin_query_indexed_ext(command_buffer, query_pool, query, flags, index)

    fn cmd_end_query_indexed_ext(
        self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32, index: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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


struct ConditionalRendering(Copyable, Movable):
    var _cmd_begin_conditional_rendering_ext: fn(
        commandBuffer: CommandBuffer, pConditionalRenderingBegin: Ptr[ConditionalRenderingBeginInfoEXT]
    )
    var _cmd_end_conditional_rendering_ext: fn(
        commandBuffer: CommandBuffer
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_begin_conditional_rendering_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginConditionalRenderingEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_begin_conditional_rendering_ext)]()[]
        self._cmd_end_conditional_rendering_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndConditionalRenderingEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_end_conditional_rendering_ext)]()[]

    fn cmd_begin_conditional_rendering_ext(
        self,
        command_buffer: CommandBuffer,
        conditional_rendering_begin: ConditionalRenderingBeginInfoEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_begin_conditional_rendering_ext(
            command_buffer, Ptr(to=conditional_rendering_begin)
        )

    fn cmd_end_conditional_rendering_ext(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_end_conditional_rendering_ext(command_buffer)


struct DirectModeDisplay(Copyable, Movable):
    var _release_display_ext: fn(
        physicalDevice: PhysicalDevice, display: DisplayKHR
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._release_display_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkReleaseDisplayEXT".unsafe_ptr()
        )).bitcast[__type_of(self._release_display_ext)]()[]

    fn release_display_ext(self, physical_device: PhysicalDevice, display: DisplayKHR) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._release_display_ext(physical_device, display)


struct AcquireXlibDisplay(Copyable, Movable):
    var _acquire_xlib_display_ext: fn(
        physicalDevice: PhysicalDevice, dpy: Ptr[Display], display: DisplayKHR
    ) -> Result
    var _get_rand_r_output_display_ext: fn(
        physicalDevice: PhysicalDevice, dpy: Ptr[Display], rrOutput: RROutput, pDisplay: Ptr[DisplayKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._acquire_xlib_display_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkAcquireXlibDisplayEXT".unsafe_ptr()
        )).bitcast[__type_of(self._acquire_xlib_display_ext)]()[]
        self._get_rand_r_output_display_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkGetRandROutputDisplayEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_rand_r_output_display_ext)]()[]

    fn acquire_xlib_display_ext(
        self, physical_device: PhysicalDevice, mut dpy: Display, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_rand_r_output_display_ext(
            physical_device, Ptr(to=dpy), rr_output, Ptr(to=display)
        )


struct DisplaySurfaceCounter(Copyable, Movable):
    var _get_physical_device_surface_capabilities_2_ext: fn(
        physicalDevice: PhysicalDevice, surface: SurfaceKHR, pSurfaceCapabilities: Ptr[SurfaceCapabilities2EXT]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_surface_capabilities_2_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceCapabilities2EXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_surface_capabilities_2_ext)]()[]

    fn get_physical_device_surface_capabilities_2_ext(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_capabilities: SurfaceCapabilities2EXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_surface_capabilities_2_ext(
            physical_device, surface, Ptr(to=surface_capabilities)
        )


struct DisplayControl(Copyable, Movable):
    var _display_power_control_ext: fn(
        device: Device, display: DisplayKHR, pDisplayPowerInfo: Ptr[DisplayPowerInfoEXT]
    ) -> Result
    var _register_device_event_ext: fn(
        device: Device, pDeviceEventInfo: Ptr[DeviceEventInfoEXT], pAllocator: Ptr[AllocationCallbacks], pFence: Ptr[Fence]
    ) -> Result
    var _register_display_event_ext: fn(
        device: Device, display: DisplayKHR, pDisplayEventInfo: Ptr[DisplayEventInfoEXT], pAllocator: Ptr[AllocationCallbacks], pFence: Ptr[Fence]
    ) -> Result
    var _get_swapchain_counter_ext: fn(
        device: Device, swapchain: SwapchainKHR, counter: SurfaceCounterFlagBitsEXT, pCounterValue: Ptr[UInt64]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._display_power_control_ext = Ptr(to=get_device_proc_addr(
            device, "vkDisplayPowerControlEXT".unsafe_ptr()
        )).bitcast[__type_of(self._display_power_control_ext)]()[]
        self._register_device_event_ext = Ptr(to=get_device_proc_addr(
            device, "vkRegisterDeviceEventEXT".unsafe_ptr()
        )).bitcast[__type_of(self._register_device_event_ext)]()[]
        self._register_display_event_ext = Ptr(to=get_device_proc_addr(
            device, "vkRegisterDisplayEventEXT".unsafe_ptr()
        )).bitcast[__type_of(self._register_display_event_ext)]()[]
        self._get_swapchain_counter_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainCounterEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_swapchain_counter_ext)]()[]

    fn display_power_control_ext(
        self, device: Device, display: DisplayKHR, display_power_info: DisplayPowerInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._display_power_control_ext(device, display, Ptr(to=display_power_info))

    fn register_device_event_ext(
        self,
        device: Device,
        device_event_info: DeviceEventInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._register_device_event_ext(
            device, Ptr(to=device_event_info), p_allocator, Ptr(to=fence)
        )

    fn register_display_event_ext(
        self,
        device: Device,
        display: DisplayKHR,
        display_event_info: DisplayEventInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._register_display_event_ext(
            device, display, Ptr(to=display_event_info), p_allocator, Ptr(to=fence)
        )

    fn get_swapchain_counter_ext(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        counter: SurfaceCounterFlagBitsEXT,
        mut counter_value: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_swapchain_counter_ext(device, swapchain, counter, Ptr(to=counter_value))


struct DiscardRectangles(Copyable, Movable):
    var _cmd_set_discard_rectangle_ext: fn(
        commandBuffer: CommandBuffer, firstDiscardRectangle: UInt32, discardRectangleCount: UInt32, pDiscardRectangles: Ptr[Rect2D]
    )
    var _cmd_set_discard_rectangle_enable_ext: fn(
        commandBuffer: CommandBuffer, discardRectangleEnable: Bool32
    )
    var _cmd_set_discard_rectangle_mode_ext: fn(
        commandBuffer: CommandBuffer, discardRectangleMode: DiscardRectangleModeEXT
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_discard_rectangle_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDiscardRectangleEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_discard_rectangle_ext)]()[]
        self._cmd_set_discard_rectangle_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDiscardRectangleEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_discard_rectangle_enable_ext)]()[]
        self._cmd_set_discard_rectangle_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDiscardRectangleModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_discard_rectangle_mode_ext)]()[]

    fn cmd_set_discard_rectangle_ext(
        self,
        command_buffer: CommandBuffer,
        first_discard_rectangle: UInt32,
        discard_rectangle_count: UInt32,
        p_discard_rectangles: Ptr[Rect2D],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_discard_rectangle_ext(
            command_buffer, first_discard_rectangle, discard_rectangle_count, p_discard_rectangles
        )

    fn cmd_set_discard_rectangle_enable_ext(
        self, command_buffer: CommandBuffer, discard_rectangle_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_discard_rectangle_enable_ext(command_buffer, discard_rectangle_enable)

    fn cmd_set_discard_rectangle_mode_ext(
        self, command_buffer: CommandBuffer, discard_rectangle_mode: DiscardRectangleModeEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_discard_rectangle_mode_ext(command_buffer, discard_rectangle_mode)


struct HdrMetadata(Copyable, Movable):
    var _set_hdr_metadata_ext: fn(
        device: Device, swapchainCount: UInt32, pSwapchains: Ptr[SwapchainKHR], pMetadata: Ptr[HdrMetadataEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_hdr_metadata_ext = Ptr(to=get_device_proc_addr(
            device, "vkSetHdrMetadataEXT".unsafe_ptr()
        )).bitcast[__type_of(self._set_hdr_metadata_ext)]()[]

    fn set_hdr_metadata_ext(
        self,
        device: Device,
        swapchain_count: UInt32,
        p_swapchains: Ptr[SwapchainKHR],
        p_metadata: Ptr[HdrMetadataEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._set_hdr_metadata_ext(device, swapchain_count, p_swapchains, p_metadata)


struct DebugUtils(Copyable, Movable):
    var _set_debug_utils_object_name_ext: fn(
        device: Device, pNameInfo: Ptr[DebugUtilsObjectNameInfoEXT]
    ) -> Result
    var _set_debug_utils_object_tag_ext: fn(
        device: Device, pTagInfo: Ptr[DebugUtilsObjectTagInfoEXT]
    ) -> Result
    var _queue_begin_debug_utils_label_ext: fn(
        queue: Queue, pLabelInfo: Ptr[DebugUtilsLabelEXT]
    )
    var _queue_end_debug_utils_label_ext: fn(
        queue: Queue
    )
    var _queue_insert_debug_utils_label_ext: fn(
        queue: Queue, pLabelInfo: Ptr[DebugUtilsLabelEXT]
    )
    var _cmd_begin_debug_utils_label_ext: fn(
        commandBuffer: CommandBuffer, pLabelInfo: Ptr[DebugUtilsLabelEXT]
    )
    var _cmd_end_debug_utils_label_ext: fn(
        commandBuffer: CommandBuffer
    )
    var _cmd_insert_debug_utils_label_ext: fn(
        commandBuffer: CommandBuffer, pLabelInfo: Ptr[DebugUtilsLabelEXT]
    )
    var _create_debug_utils_messenger_ext: fn(
        instance: Instance, pCreateInfo: Ptr[DebugUtilsMessengerCreateInfoEXT], pAllocator: Ptr[AllocationCallbacks], pMessenger: Ptr[DebugUtilsMessengerEXT]
    ) -> Result
    var _destroy_debug_utils_messenger_ext: fn(
        instance: Instance, messenger: DebugUtilsMessengerEXT, pAllocator: Ptr[AllocationCallbacks]
    )
    var _submit_debug_utils_message_ext: fn(
        instance: Instance, messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT, messageTypes: DebugUtilsMessageTypeFlagsEXT, pCallbackData: Ptr[DebugUtilsMessengerCallbackDataEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._set_debug_utils_object_name_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkSetDebugUtilsObjectNameEXT".unsafe_ptr()
        )).bitcast[__type_of(self._set_debug_utils_object_name_ext)]()[]
        self._set_debug_utils_object_tag_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkSetDebugUtilsObjectTagEXT".unsafe_ptr()
        )).bitcast[__type_of(self._set_debug_utils_object_tag_ext)]()[]
        self._queue_begin_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkQueueBeginDebugUtilsLabelEXT".unsafe_ptr()
        )).bitcast[__type_of(self._queue_begin_debug_utils_label_ext)]()[]
        self._queue_end_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkQueueEndDebugUtilsLabelEXT".unsafe_ptr()
        )).bitcast[__type_of(self._queue_end_debug_utils_label_ext)]()[]
        self._queue_insert_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkQueueInsertDebugUtilsLabelEXT".unsafe_ptr()
        )).bitcast[__type_of(self._queue_insert_debug_utils_label_ext)]()[]
        self._cmd_begin_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCmdBeginDebugUtilsLabelEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_begin_debug_utils_label_ext)]()[]
        self._cmd_end_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCmdEndDebugUtilsLabelEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_end_debug_utils_label_ext)]()[]
        self._cmd_insert_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCmdInsertDebugUtilsLabelEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_insert_debug_utils_label_ext)]()[]
        self._create_debug_utils_messenger_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDebugUtilsMessengerEXT".unsafe_ptr()
        )).bitcast[__type_of(self._create_debug_utils_messenger_ext)]()[]
        self._destroy_debug_utils_messenger_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroyDebugUtilsMessengerEXT".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_debug_utils_messenger_ext)]()[]
        self._submit_debug_utils_message_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkSubmitDebugUtilsMessageEXT".unsafe_ptr()
        )).bitcast[__type_of(self._submit_debug_utils_message_ext)]()[]

    fn set_debug_utils_object_name_ext(
        self, device: Device, name_info: DebugUtilsObjectNameInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._set_debug_utils_object_name_ext(device, Ptr(to=name_info))

    fn set_debug_utils_object_tag_ext(
        self, device: Device, tag_info: DebugUtilsObjectTagInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._set_debug_utils_object_tag_ext(device, Ptr(to=tag_info))

    fn queue_begin_debug_utils_label_ext(self, queue: Queue, label_info: DebugUtilsLabelEXT):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._queue_begin_debug_utils_label_ext(queue, Ptr(to=label_info))

    fn queue_end_debug_utils_label_ext(self, queue: Queue):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._queue_end_debug_utils_label_ext(queue)

    fn queue_insert_debug_utils_label_ext(self, queue: Queue, label_info: DebugUtilsLabelEXT):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._queue_insert_debug_utils_label_ext(queue, Ptr(to=label_info))

    fn cmd_begin_debug_utils_label_ext(
        self, command_buffer: CommandBuffer, label_info: DebugUtilsLabelEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_begin_debug_utils_label_ext(command_buffer, Ptr(to=label_info))

    fn cmd_end_debug_utils_label_ext(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_end_debug_utils_label_ext(command_buffer)

    fn cmd_insert_debug_utils_label_ext(
        self, command_buffer: CommandBuffer, label_info: DebugUtilsLabelEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_insert_debug_utils_label_ext(command_buffer, Ptr(to=label_info))

    fn create_debug_utils_messenger_ext(
        self,
        instance: Instance,
        create_info: DebugUtilsMessengerCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut messenger: DebugUtilsMessengerEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_debug_utils_messenger_ext(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=messenger)
        )

    fn destroy_debug_utils_messenger_ext(
        self,
        instance: Instance,
        messenger: DebugUtilsMessengerEXT,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_debug_utils_messenger_ext(instance, messenger, p_allocator)

    fn submit_debug_utils_message_ext(
        self,
        instance: Instance,
        message_severity: DebugUtilsMessageSeverityFlagBitsEXT,
        message_types: DebugUtilsMessageTypeFlagsEXT,
        callback_data: DebugUtilsMessengerCallbackDataEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._submit_debug_utils_message_ext(
            instance, message_severity, message_types, Ptr(to=callback_data)
        )


struct SampleLocations(Copyable, Movable):
    var _cmd_set_sample_locations_ext: fn(
        commandBuffer: CommandBuffer, pSampleLocationsInfo: Ptr[SampleLocationsInfoEXT]
    )
    var _get_physical_device_multisample_properties_ext: fn(
        physicalDevice: PhysicalDevice, samples: SampleCountFlagBits, pMultisampleProperties: Ptr[MultisamplePropertiesEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_sample_locations_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleLocationsEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_sample_locations_ext)]()[]
        self._get_physical_device_multisample_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceMultisamplePropertiesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_multisample_properties_ext)]()[]

    fn cmd_set_sample_locations_ext(
        self, command_buffer: CommandBuffer, sample_locations_info: SampleLocationsInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_sample_locations_ext(command_buffer, Ptr(to=sample_locations_info))

    fn get_physical_device_multisample_properties_ext(
        self,
        physical_device: PhysicalDevice,
        samples: SampleCountFlagBits,
        mut multisample_properties: MultisamplePropertiesEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_multisample_properties_ext(
            physical_device, samples, Ptr(to=multisample_properties)
        )


struct ImageDrmFormatModifier(Copyable, Movable):
    var _get_image_drm_format_modifier_properties_ext: fn(
        device: Device, image: Image, pProperties: Ptr[ImageDrmFormatModifierPropertiesEXT]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_drm_format_modifier_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetImageDrmFormatModifierPropertiesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_drm_format_modifier_properties_ext)]()[]

    fn get_image_drm_format_modifier_properties_ext(
        self, device: Device, image: Image, mut properties: ImageDrmFormatModifierPropertiesEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_drm_format_modifier_properties_ext(device, image, Ptr(to=properties))


struct ValidationCache(Copyable, Movable):
    var _create_validation_cache_ext: fn(
        device: Device, pCreateInfo: Ptr[ValidationCacheCreateInfoEXT], pAllocator: Ptr[AllocationCallbacks], pValidationCache: Ptr[ValidationCacheEXT]
    ) -> Result
    var _destroy_validation_cache_ext: fn(
        device: Device, validationCache: ValidationCacheEXT, pAllocator: Ptr[AllocationCallbacks]
    )
    var _merge_validation_caches_ext: fn(
        device: Device, dstCache: ValidationCacheEXT, srcCacheCount: UInt32, pSrcCaches: Ptr[ValidationCacheEXT]
    ) -> Result
    var _get_validation_cache_data_ext: fn(
        device: Device, validationCache: ValidationCacheEXT, pDataSize: Ptr[UInt], pData: Ptr[NoneType]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_validation_cache_ext = Ptr(to=get_device_proc_addr(
            device, "vkCreateValidationCacheEXT".unsafe_ptr()
        )).bitcast[__type_of(self._create_validation_cache_ext)]()[]
        self._destroy_validation_cache_ext = Ptr(to=get_device_proc_addr(
            device, "vkDestroyValidationCacheEXT".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_validation_cache_ext)]()[]
        self._merge_validation_caches_ext = Ptr(to=get_device_proc_addr(
            device, "vkMergeValidationCachesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._merge_validation_caches_ext)]()[]
        self._get_validation_cache_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetValidationCacheDataEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_validation_cache_data_ext)]()[]

    fn create_validation_cache_ext(
        self,
        device: Device,
        create_info: ValidationCacheCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut validation_cache: ValidationCacheEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_validation_cache_ext(
            device, Ptr(to=create_info), p_allocator, Ptr(to=validation_cache)
        )

    fn destroy_validation_cache_ext(
        self,
        device: Device,
        validation_cache: ValidationCacheEXT,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_validation_cache_ext(device, validation_cache, p_allocator)

    fn merge_validation_caches_ext(
        self,
        device: Device,
        dst_cache: ValidationCacheEXT,
        src_cache_count: UInt32,
        p_src_caches: Ptr[ValidationCacheEXT],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._merge_validation_caches_ext(device, dst_cache, src_cache_count, p_src_caches)

    fn get_validation_cache_data_ext(
        self,
        device: Device,
        validation_cache: ValidationCacheEXT,
        mut data_size: UInt,
        p_data: Ptr[NoneType],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_validation_cache_data_ext(
            device, validation_cache, Ptr(to=data_size), p_data
        )

    fn get_validation_cache_data_ext(
        self, device: Device, validation_cache: ValidationCacheEXT
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_validation_cache_data_ext(
                device, validation_cache, count, Ptr[NoneType]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_validation_cache_data_ext(
                    device, validation_cache, count, list.unsafe_ptr().bitcast[NoneType]()
                )
        list._len = Int(count)
        return ListResult(list^, result)


struct ExternalMemoryHost(Copyable, Movable):
    var _get_memory_host_pointer_properties_ext: fn(
        device: Device, handleType: ExternalMemoryHandleTypeFlagBits, pHostPointer: Ptr[NoneType], pMemoryHostPointerProperties: Ptr[MemoryHostPointerPropertiesEXT]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_host_pointer_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryHostPointerPropertiesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_host_pointer_properties_ext)]()[]

    fn get_memory_host_pointer_properties_ext(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        host_pointer: NoneType,
        mut memory_host_pointer_properties: MemoryHostPointerPropertiesEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_host_pointer_properties_ext(
            device, handle_type, Ptr(to=host_pointer), Ptr(to=memory_host_pointer_properties)
        )


struct CalibratedTimestamps(Copyable, Movable):
    var _get_physical_device_calibrateable_time_domains_khr: fn(
        physicalDevice: PhysicalDevice, pTimeDomainCount: Ptr[UInt32], pTimeDomains: Ptr[TimeDomainKHR]
    ) -> Result
    var _get_calibrated_timestamps_khr: fn(
        device: Device, timestampCount: UInt32, pTimestampInfos: Ptr[CalibratedTimestampInfoKHR], pTimestamps: Ptr[UInt64], pMaxDeviation: Ptr[UInt64]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_calibrateable_time_domains_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_calibrateable_time_domains_khr)]()[]
        self._get_calibrated_timestamps_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetCalibratedTimestampsKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_calibrated_timestamps_khr)]()[]

    fn get_physical_device_calibrateable_time_domains_khr(
        self,
        physical_device: PhysicalDevice,
        mut time_domain_count: UInt32,
        p_time_domains: Ptr[TimeDomainKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_calibrateable_time_domains_khr(
            physical_device, Ptr(to=time_domain_count), p_time_domains
        )

    fn get_physical_device_calibrateable_time_domains_khr(
        self, physical_device: PhysicalDevice
    ) -> ListResult[TimeDomainKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[TimeDomainKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_calibrateable_time_domains_khr(
                physical_device, count, Ptr[TimeDomainKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_calibrateable_time_domains_khr(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_calibrated_timestamps_khr(
        self,
        device: Device,
        timestamp_count: UInt32,
        p_timestamp_infos: Ptr[CalibratedTimestampInfoKHR],
        p_timestamps: Ptr[UInt64],
        mut max_deviation: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_calibrated_timestamps_khr(
            device, timestamp_count, p_timestamp_infos, p_timestamps, Ptr(to=max_deviation)
        )


struct MetalSurface(Copyable, Movable):
    var _create_metal_surface_ext: fn(
        instance: Instance, pCreateInfo: Ptr[MetalSurfaceCreateInfoEXT], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_metal_surface_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateMetalSurfaceEXT".unsafe_ptr()
        )).bitcast[__type_of(self._create_metal_surface_ext)]()[]

    fn create_metal_surface_ext(
        self,
        instance: Instance,
        create_info: MetalSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_metal_surface_ext(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )


struct BufferDeviceAddress(Copyable, Movable):
    var _get_buffer_device_address: fn(
        device: Device, pInfo: Ptr[BufferDeviceAddressInfo]
    ) -> DeviceAddress

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_buffer_device_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferDeviceAddress".unsafe_ptr()
        )).bitcast[__type_of(self._get_buffer_device_address)]()[]

    fn get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_buffer_device_address(device, Ptr(to=info))


struct ToolingInfo(Copyable, Movable):
    var _get_physical_device_tool_properties: fn(
        physicalDevice: PhysicalDevice, pToolCount: Ptr[UInt32], pToolProperties: Ptr[PhysicalDeviceToolProperties]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_tool_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceToolProperties".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_tool_properties)]()[]

    fn get_physical_device_tool_properties(
        self,
        physical_device: PhysicalDevice,
        mut tool_count: UInt32,
        p_tool_properties: Ptr[PhysicalDeviceToolProperties],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_tool_properties(
            physical_device, Ptr(to=tool_count), p_tool_properties
        )

    fn get_physical_device_tool_properties(
        self, physical_device: PhysicalDevice
    ) -> ListResult[PhysicalDeviceToolProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[PhysicalDeviceToolProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_tool_properties(
                physical_device, count, Ptr[PhysicalDeviceToolProperties]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_tool_properties(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)


struct FullScreenExclusive(Copyable, Movable):
    var _get_physical_device_surface_present_modes_2_ext: fn(
        physicalDevice: PhysicalDevice, pSurfaceInfo: Ptr[PhysicalDeviceSurfaceInfo2KHR], pPresentModeCount: Ptr[UInt32], pPresentModes: Ptr[PresentModeKHR]
    ) -> Result
    var _acquire_full_screen_exclusive_mode_ext: fn(
        device: Device, swapchain: SwapchainKHR
    ) -> Result
    var _release_full_screen_exclusive_mode_ext: fn(
        device: Device, swapchain: SwapchainKHR
    ) -> Result
    var _get_device_group_surface_present_modes_2_ext: fn(
        device: Device, pSurfaceInfo: Ptr[PhysicalDeviceSurfaceInfo2KHR], pModes: Ptr[DeviceGroupPresentModeFlagsKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_surface_present_modes_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceSurfacePresentModes2EXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_surface_present_modes_2_ext)]()[]
        self._acquire_full_screen_exclusive_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkAcquireFullScreenExclusiveModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._acquire_full_screen_exclusive_mode_ext)]()[]
        self._release_full_screen_exclusive_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkReleaseFullScreenExclusiveModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._release_full_screen_exclusive_mode_ext)]()[]
        self._get_device_group_surface_present_modes_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupSurfacePresentModes2EXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_group_surface_present_modes_2_ext)]()[]

    fn get_physical_device_surface_present_modes_2_ext(
        self,
        physical_device: PhysicalDevice,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut present_mode_count: UInt32,
        p_present_modes: Ptr[PresentModeKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_surface_present_modes_2_ext(
            physical_device, Ptr(to=surface_info), Ptr(to=present_mode_count), p_present_modes
        )

    fn get_physical_device_surface_present_modes_2_ext(
        self, physical_device: PhysicalDevice, surface_info: PhysicalDeviceSurfaceInfo2KHR
    ) -> ListResult[PresentModeKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[PresentModeKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_surface_present_modes_2_ext(
                physical_device, surface_info, count, Ptr[PresentModeKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_surface_present_modes_2_ext(
                    physical_device, surface_info, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn acquire_full_screen_exclusive_mode_ext(
        self, device: Device, swapchain: SwapchainKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._acquire_full_screen_exclusive_mode_ext(device, swapchain)

    fn release_full_screen_exclusive_mode_ext(
        self, device: Device, swapchain: SwapchainKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._release_full_screen_exclusive_mode_ext(device, swapchain)

    fn get_device_group_surface_present_modes_2_ext(
        self,
        device: Device,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut modes: DeviceGroupPresentModeFlagsKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_group_surface_present_modes_2_ext(
            device, Ptr(to=surface_info), Ptr(to=modes)
        )


struct HeadlessSurface(Copyable, Movable):
    var _create_headless_surface_ext: fn(
        instance: Instance, pCreateInfo: Ptr[HeadlessSurfaceCreateInfoEXT], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_headless_surface_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateHeadlessSurfaceEXT".unsafe_ptr()
        )).bitcast[__type_of(self._create_headless_surface_ext)]()[]

    fn create_headless_surface_ext(
        self,
        instance: Instance,
        create_info: HeadlessSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_headless_surface_ext(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )


struct LineRasterization(Copyable, Movable):
    var _cmd_set_line_stipple: fn(
        commandBuffer: CommandBuffer, lineStippleFactor: UInt32, lineStipplePattern: UInt16
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_line_stipple = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStipple".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_line_stipple)]()[]

    fn cmd_set_line_stipple(
        self,
        command_buffer: CommandBuffer,
        line_stipple_factor: UInt32,
        line_stipple_pattern: UInt16,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_line_stipple(command_buffer, line_stipple_factor, line_stipple_pattern)


struct HostQueryReset(Copyable, Movable):
    var _reset_query_pool: fn(
        device: Device, queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._reset_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkResetQueryPool".unsafe_ptr()
        )).bitcast[__type_of(self._reset_query_pool)]()[]

    fn reset_query_pool(
        self, device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._reset_query_pool(device, query_pool, first_query, query_count)


struct ExtendedDynamicState(Copyable, Movable):
    var _cmd_set_cull_mode: fn(
        commandBuffer: CommandBuffer, cullMode: CullModeFlags
    )
    var _cmd_set_front_face: fn(
        commandBuffer: CommandBuffer, frontFace: FrontFace
    )
    var _cmd_set_primitive_topology: fn(
        commandBuffer: CommandBuffer, primitiveTopology: PrimitiveTopology
    )
    var _cmd_set_viewport_with_count: fn(
        commandBuffer: CommandBuffer, viewportCount: UInt32, pViewports: Ptr[Viewport]
    )
    var _cmd_set_scissor_with_count: fn(
        commandBuffer: CommandBuffer, scissorCount: UInt32, pScissors: Ptr[Rect2D]
    )
    var _cmd_bind_vertex_buffers_2: fn(
        commandBuffer: CommandBuffer, firstBinding: UInt32, bindingCount: UInt32, pBuffers: Ptr[Buffer], pOffsets: Ptr[DeviceSize], pSizes: Ptr[DeviceSize], pStrides: Ptr[DeviceSize]
    )
    var _cmd_set_depth_test_enable: fn(
        commandBuffer: CommandBuffer, depthTestEnable: Bool32
    )
    var _cmd_set_depth_write_enable: fn(
        commandBuffer: CommandBuffer, depthWriteEnable: Bool32
    )
    var _cmd_set_depth_compare_op: fn(
        commandBuffer: CommandBuffer, depthCompareOp: CompareOp
    )
    var _cmd_set_depth_bounds_test_enable: fn(
        commandBuffer: CommandBuffer, depthBoundsTestEnable: Bool32
    )
    var _cmd_set_stencil_test_enable: fn(
        commandBuffer: CommandBuffer, stencilTestEnable: Bool32
    )
    var _cmd_set_stencil_op: fn(
        commandBuffer: CommandBuffer, faceMask: StencilFaceFlags, failOp: StencilOp, passOp: StencilOp, depthFailOp: StencilOp, compareOp: CompareOp
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_cull_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCullMode".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_cull_mode)]()[]
        self._cmd_set_front_face = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFrontFace".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_front_face)]()[]
        self._cmd_set_primitive_topology = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveTopology".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_primitive_topology)]()[]
        self._cmd_set_viewport_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWithCount".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_viewport_with_count)]()[]
        self._cmd_set_scissor_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetScissorWithCount".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_scissor_with_count)]()[]
        self._cmd_bind_vertex_buffers_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindVertexBuffers2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_vertex_buffers_2)]()[]
        self._cmd_set_depth_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthTestEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_test_enable)]()[]
        self._cmd_set_depth_write_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthWriteEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_write_enable)]()[]
        self._cmd_set_depth_compare_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthCompareOp".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_compare_op)]()[]
        self._cmd_set_depth_bounds_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBoundsTestEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_bounds_test_enable)]()[]
        self._cmd_set_stencil_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilTestEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_stencil_test_enable)]()[]
        self._cmd_set_stencil_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilOp".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_stencil_op)]()[]

    fn cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_cull_mode(command_buffer, cull_mode)

    fn cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_front_face(command_buffer, front_face)

    fn cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_primitive_topology(command_buffer, primitive_topology)

    fn cmd_set_viewport_with_count(
        self, command_buffer: CommandBuffer, viewport_count: UInt32, p_viewports: Ptr[Viewport]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_viewport_with_count(command_buffer, viewport_count, p_viewports)

    fn cmd_set_scissor_with_count(
        self, command_buffer: CommandBuffer, scissor_count: UInt32, p_scissors: Ptr[Rect2D]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_scissor_with_count(command_buffer, scissor_count, p_scissors)

    fn cmd_bind_vertex_buffers_2(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer],
        p_offsets: Ptr[DeviceSize],
        p_sizes: Ptr[DeviceSize],
        p_strides: Ptr[DeviceSize],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_vertex_buffers_2(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets, p_sizes, p_strides
        )

    fn cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    fn cmd_set_depth_write_enable(self, command_buffer: CommandBuffer, depth_write_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    fn cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    fn cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    fn cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_stencil_op(
            command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op
        )


struct HostImageCopy(Copyable, Movable):
    var _copy_memory_to_image: fn(
        device: Device, pCopyMemoryToImageInfo: Ptr[CopyMemoryToImageInfo]
    ) -> Result
    var _copy_image_to_memory: fn(
        device: Device, pCopyImageToMemoryInfo: Ptr[CopyImageToMemoryInfo]
    ) -> Result
    var _copy_image_to_image: fn(
        device: Device, pCopyImageToImageInfo: Ptr[CopyImageToImageInfo]
    ) -> Result
    var _transition_image_layout: fn(
        device: Device, transitionCount: UInt32, pTransitions: Ptr[HostImageLayoutTransitionInfo]
    ) -> Result
    var _get_image_subresource_layout_2: fn(
        device: Device, image: Image, pSubresource: Ptr[ImageSubresource2], pLayout: Ptr[SubresourceLayout2]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._copy_memory_to_image = Ptr(to=get_device_proc_addr(
            device, "vkCopyMemoryToImage".unsafe_ptr()
        )).bitcast[__type_of(self._copy_memory_to_image)]()[]
        self._copy_image_to_memory = Ptr(to=get_device_proc_addr(
            device, "vkCopyImageToMemory".unsafe_ptr()
        )).bitcast[__type_of(self._copy_image_to_memory)]()[]
        self._copy_image_to_image = Ptr(to=get_device_proc_addr(
            device, "vkCopyImageToImage".unsafe_ptr()
        )).bitcast[__type_of(self._copy_image_to_image)]()[]
        self._transition_image_layout = Ptr(to=get_device_proc_addr(
            device, "vkTransitionImageLayout".unsafe_ptr()
        )).bitcast[__type_of(self._transition_image_layout)]()[]
        self._get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout2".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_subresource_layout_2)]()[]

    fn copy_memory_to_image(
        self, device: Device, copy_memory_to_image_info: CopyMemoryToImageInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._copy_memory_to_image(device, Ptr(to=copy_memory_to_image_info))

    fn copy_image_to_memory(
        self, device: Device, copy_image_to_memory_info: CopyImageToMemoryInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._copy_image_to_memory(device, Ptr(to=copy_image_to_memory_info))

    fn copy_image_to_image(
        self, device: Device, copy_image_to_image_info: CopyImageToImageInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._copy_image_to_image(device, Ptr(to=copy_image_to_image_info))

    fn transition_image_layout(
        self,
        device: Device,
        transition_count: UInt32,
        p_transitions: Ptr[HostImageLayoutTransitionInfo],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._transition_image_layout(device, transition_count, p_transitions)

    fn get_image_subresource_layout_2(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource2,
        mut layout: SubresourceLayout2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_subresource_layout_2(
            device, image, Ptr(to=subresource), Ptr(to=layout)
        )


struct SwapchainMaintenance1(Copyable, Movable):
    var _release_swapchain_images_khr: fn(
        device: Device, pReleaseInfo: Ptr[ReleaseSwapchainImagesInfoKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._release_swapchain_images_khr = Ptr(to=get_device_proc_addr(
            device, "vkReleaseSwapchainImagesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._release_swapchain_images_khr)]()[]

    fn release_swapchain_images_khr(
        self, device: Device, release_info: ReleaseSwapchainImagesInfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._release_swapchain_images_khr(device, Ptr(to=release_info))


struct DepthBiasControl(Copyable, Movable):
    var _cmd_set_depth_bias_2_ext: fn(
        commandBuffer: CommandBuffer, pDepthBiasInfo: Ptr[DepthBiasInfoEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_bias_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBias2EXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_bias_2_ext)]()[]

    fn cmd_set_depth_bias_2_ext(
        self, command_buffer: CommandBuffer, depth_bias_info: DepthBiasInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_bias_2_ext(command_buffer, Ptr(to=depth_bias_info))


struct AcquireDrmDisplay(Copyable, Movable):
    var _acquire_drm_display_ext: fn(
        physicalDevice: PhysicalDevice, drmFd: Int32, display: DisplayKHR
    ) -> Result
    var _get_drm_display_ext: fn(
        physicalDevice: PhysicalDevice, drmFd: Int32, connectorId: UInt32, display: Ptr[DisplayKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._acquire_drm_display_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkAcquireDrmDisplayEXT".unsafe_ptr()
        )).bitcast[__type_of(self._acquire_drm_display_ext)]()[]
        self._get_drm_display_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDrmDisplayEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_drm_display_ext)]()[]

    fn acquire_drm_display_ext(
        self, physical_device: PhysicalDevice, drm_fd: Int32, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_drm_display_ext(physical_device, drm_fd, connector_id, Ptr(to=display))


struct PrivateData(Copyable, Movable):
    var _create_private_data_slot: fn(
        device: Device, pCreateInfo: Ptr[PrivateDataSlotCreateInfo], pAllocator: Ptr[AllocationCallbacks], pPrivateDataSlot: Ptr[PrivateDataSlot]
    ) -> Result
    var _destroy_private_data_slot: fn(
        device: Device, privateDataSlot: PrivateDataSlot, pAllocator: Ptr[AllocationCallbacks]
    )
    var _set_private_data: fn(
        device: Device, objectType: ObjectType, objectHandle: UInt64, privateDataSlot: PrivateDataSlot, data: UInt64
    ) -> Result
    var _get_private_data: fn(
        device: Device, objectType: ObjectType, objectHandle: UInt64, privateDataSlot: PrivateDataSlot, pData: Ptr[UInt64]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_private_data_slot = Ptr(to=get_device_proc_addr(
            device, "vkCreatePrivateDataSlot".unsafe_ptr()
        )).bitcast[__type_of(self._create_private_data_slot)]()[]
        self._destroy_private_data_slot = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPrivateDataSlot".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_private_data_slot)]()[]
        self._set_private_data = Ptr(to=get_device_proc_addr(
            device, "vkSetPrivateData".unsafe_ptr()
        )).bitcast[__type_of(self._set_private_data)]()[]
        self._get_private_data = Ptr(to=get_device_proc_addr(
            device, "vkGetPrivateData".unsafe_ptr()
        )).bitcast[__type_of(self._get_private_data)]()[]

    fn create_private_data_slot(
        self,
        device: Device,
        create_info: PrivateDataSlotCreateInfo,
        p_allocator: Ptr[AllocationCallbacks],
        mut private_data_slot: PrivateDataSlot,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_private_data_slot(
            device, Ptr(to=create_info), p_allocator, Ptr(to=private_data_slot)
        )

    fn destroy_private_data_slot(
        self,
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_private_data_slot(device, private_data_slot, p_allocator)

    fn set_private_data(
        self,
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        data: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_private_data(
            device, object_type, object_handle, private_data_slot, Ptr(to=data)
        )


struct MetalObjects(Copyable, Movable):
    var _export_metal_objects_ext: fn(
        device: Device, pMetalObjectsInfo: Ptr[ExportMetalObjectsInfoEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._export_metal_objects_ext = Ptr(to=get_device_proc_addr(
            device, "vkExportMetalObjectsEXT".unsafe_ptr()
        )).bitcast[__type_of(self._export_metal_objects_ext)]()[]

    fn export_metal_objects_ext(
        self, device: Device, mut metal_objects_info: ExportMetalObjectsInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._export_metal_objects_ext(device, Ptr(to=metal_objects_info))


struct DescriptorBuffer(Copyable, Movable):
    var _get_descriptor_set_layout_size_ext: fn(
        device: Device, layout: DescriptorSetLayout, pLayoutSizeInBytes: Ptr[DeviceSize]
    )
    var _get_descriptor_set_layout_binding_offset_ext: fn(
        device: Device, layout: DescriptorSetLayout, binding: UInt32, pOffset: Ptr[DeviceSize]
    )
    var _get_descriptor_ext: fn(
        device: Device, pDescriptorInfo: Ptr[DescriptorGetInfoEXT], dataSize: UInt, pDescriptor: Ptr[NoneType]
    )
    var _cmd_bind_descriptor_buffers_ext: fn(
        commandBuffer: CommandBuffer, bufferCount: UInt32, pBindingInfos: Ptr[DescriptorBufferBindingInfoEXT]
    )
    var _cmd_set_descriptor_buffer_offsets_ext: fn(
        commandBuffer: CommandBuffer, pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, firstSet: UInt32, setCount: UInt32, pBufferIndices: Ptr[UInt32], pOffsets: Ptr[DeviceSize]
    )
    var _cmd_bind_descriptor_buffer_embedded_samplers_ext: fn(
        commandBuffer: CommandBuffer, pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, set: UInt32
    )
    var _get_buffer_opaque_capture_descriptor_data_ext: fn(
        device: Device, pInfo: Ptr[BufferCaptureDescriptorDataInfoEXT], pData: Ptr[NoneType]
    ) -> Result
    var _get_image_opaque_capture_descriptor_data_ext: fn(
        device: Device, pInfo: Ptr[ImageCaptureDescriptorDataInfoEXT], pData: Ptr[NoneType]
    ) -> Result
    var _get_image_view_opaque_capture_descriptor_data_ext: fn(
        device: Device, pInfo: Ptr[ImageViewCaptureDescriptorDataInfoEXT], pData: Ptr[NoneType]
    ) -> Result
    var _get_sampler_opaque_capture_descriptor_data_ext: fn(
        device: Device, pInfo: Ptr[SamplerCaptureDescriptorDataInfoEXT], pData: Ptr[NoneType]
    ) -> Result
    var _get_acceleration_structure_opaque_capture_descriptor_data_ext: fn(
        device: Device, pInfo: Ptr[AccelerationStructureCaptureDescriptorDataInfoEXT], pData: Ptr[NoneType]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_descriptor_set_layout_size_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutSizeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_descriptor_set_layout_size_ext)]()[]
        self._get_descriptor_set_layout_binding_offset_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutBindingOffsetEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_descriptor_set_layout_binding_offset_ext)]()[]
        self._get_descriptor_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_descriptor_ext)]()[]
        self._cmd_bind_descriptor_buffers_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorBuffersEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_descriptor_buffers_ext)]()[]
        self._cmd_set_descriptor_buffer_offsets_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDescriptorBufferOffsetsEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_descriptor_buffer_offsets_ext)]()[]
        self._cmd_bind_descriptor_buffer_embedded_samplers_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorBufferEmbeddedSamplersEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_descriptor_buffer_embedded_samplers_ext)]()[]
        self._get_buffer_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferOpaqueCaptureDescriptorDataEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_buffer_opaque_capture_descriptor_data_ext)]()[]
        self._get_image_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetImageOpaqueCaptureDescriptorDataEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_opaque_capture_descriptor_data_ext)]()[]
        self._get_image_view_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetImageViewOpaqueCaptureDescriptorDataEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_view_opaque_capture_descriptor_data_ext)]()[]
        self._get_sampler_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetSamplerOpaqueCaptureDescriptorDataEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_sampler_opaque_capture_descriptor_data_ext)]()[]
        self._get_acceleration_structure_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_acceleration_structure_opaque_capture_descriptor_data_ext)]()[]

    fn get_descriptor_set_layout_size_ext(
        self, device: Device, layout: DescriptorSetLayout, mut layout_size_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_descriptor_set_layout_size_ext(
            device, layout, Ptr(to=layout_size_in_bytes)
        )

    fn get_descriptor_set_layout_binding_offset_ext(
        self, device: Device, layout: DescriptorSetLayout, binding: UInt32, mut offset: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_descriptor_set_layout_binding_offset_ext(
            device, layout, binding, Ptr(to=offset)
        )

    fn get_descriptor_ext(
        self,
        device: Device,
        descriptor_info: DescriptorGetInfoEXT,
        data_size: UInt,
        p_descriptor: Ptr[NoneType],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_descriptor_ext(device, Ptr(to=descriptor_info), data_size, p_descriptor)

    fn cmd_bind_descriptor_buffers_ext(
        self,
        command_buffer: CommandBuffer,
        buffer_count: UInt32,
        p_binding_infos: Ptr[DescriptorBufferBindingInfoEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_descriptor_buffers_ext(command_buffer, buffer_count, p_binding_infos)

    fn cmd_set_descriptor_buffer_offsets_ext(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        set_count: UInt32,
        p_buffer_indices: Ptr[UInt32],
        p_offsets: Ptr[DeviceSize],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_descriptor_buffer_offsets_ext(
            command_buffer,
            pipeline_bind_point,
            layout,
            first_set,
            set_count,
            p_buffer_indices,
            p_offsets,
        )

    fn cmd_bind_descriptor_buffer_embedded_samplers_ext(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_descriptor_buffer_embedded_samplers_ext(
            command_buffer, pipeline_bind_point, layout, set
        )

    fn get_buffer_opaque_capture_descriptor_data_ext(
        self, device: Device, info: BufferCaptureDescriptorDataInfoEXT, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_buffer_opaque_capture_descriptor_data_ext(
            device, Ptr(to=info), Ptr(to=data)
        )

    fn get_image_opaque_capture_descriptor_data_ext(
        self, device: Device, info: ImageCaptureDescriptorDataInfoEXT, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_opaque_capture_descriptor_data_ext(
            device, Ptr(to=info), Ptr(to=data)
        )

    fn get_image_view_opaque_capture_descriptor_data_ext(
        self, device: Device, info: ImageViewCaptureDescriptorDataInfoEXT, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_view_opaque_capture_descriptor_data_ext(
            device, Ptr(to=info), Ptr(to=data)
        )

    fn get_sampler_opaque_capture_descriptor_data_ext(
        self, device: Device, info: SamplerCaptureDescriptorDataInfoEXT, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_sampler_opaque_capture_descriptor_data_ext(
            device, Ptr(to=info), Ptr(to=data)
        )

    fn get_acceleration_structure_opaque_capture_descriptor_data_ext(
        self,
        device: Device,
        info: AccelerationStructureCaptureDescriptorDataInfoEXT,
        mut data: NoneType,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_acceleration_structure_opaque_capture_descriptor_data_ext(
            device, Ptr(to=info), Ptr(to=data)
        )


struct MeshShader(Copyable, Movable):
    var _cmd_draw_mesh_tasks_ext: fn(
        commandBuffer: CommandBuffer, groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32
    )
    var _cmd_draw_mesh_tasks_indirect_ext: fn(
        commandBuffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, drawCount: UInt32, stride: UInt32
    )
    var _cmd_draw_mesh_tasks_indirect_count_ext: fn(
        commandBuffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, countBuffer: Buffer, countBufferOffset: DeviceSize, maxDrawCount: UInt32, stride: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_mesh_tasks_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_mesh_tasks_ext)]()[]
        self._cmd_draw_mesh_tasks_indirect_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_mesh_tasks_indirect_ext)]()[]
        self._cmd_draw_mesh_tasks_indirect_count_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectCountEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_mesh_tasks_indirect_count_ext)]()[]

    fn cmd_draw_mesh_tasks_ext(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_mesh_tasks_ext(
            command_buffer, group_count_x, group_count_y, group_count_z
        )

    fn cmd_draw_mesh_tasks_indirect_ext(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_mesh_tasks_indirect_ext(
            command_buffer, buffer, offset, draw_count, stride
        )

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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_mesh_tasks_indirect_count_ext(
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )


struct ImageCompressionControl(Copyable, Movable):
    var _get_image_subresource_layout_2: fn(
        device: Device, image: Image, pSubresource: Ptr[ImageSubresource2], pLayout: Ptr[SubresourceLayout2]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout2".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_subresource_layout_2)]()[]

    fn get_image_subresource_layout_2(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource2,
        mut layout: SubresourceLayout2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_subresource_layout_2(
            device, image, Ptr(to=subresource), Ptr(to=layout)
        )


struct DeviceFault(Copyable, Movable):
    var _get_device_fault_info_ext: fn(
        device: Device, pFaultCounts: Ptr[DeviceFaultCountsEXT], pFaultInfo: Ptr[DeviceFaultInfoEXT]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_device_fault_info_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceFaultInfoEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_fault_info_ext)]()[]

    fn get_device_fault_info_ext(
        self,
        device: Device,
        mut fault_counts: DeviceFaultCountsEXT,
        p_fault_info: Ptr[DeviceFaultInfoEXT],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_fault_info_ext(device, Ptr(to=fault_counts), p_fault_info)


struct DirectfbSurface(Copyable, Movable):
    var _create_direct_fb_surface_ext: fn(
        instance: Instance, pCreateInfo: Ptr[DirectFBSurfaceCreateInfoEXT], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result
    var _get_physical_device_direct_fb_presentation_support_ext: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32, dfb: Ptr[IDirectFB]
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_direct_fb_surface_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDirectFBSurfaceEXT".unsafe_ptr()
        )).bitcast[__type_of(self._create_direct_fb_surface_ext)]()[]
        self._get_physical_device_direct_fb_presentation_support_ext = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDirectFBPresentationSupportEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_direct_fb_presentation_support_ext)]()[]

    fn create_direct_fb_surface_ext(
        self,
        instance: Instance,
        create_info: DirectFBSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_direct_fb_surface_ext(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )

    fn get_physical_device_direct_fb_presentation_support_ext(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32, mut dfb: IDirectFB
    ) -> Bool32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_direct_fb_presentation_support_ext(
            physical_device, queue_family_index, Ptr(to=dfb)
        )


struct VertexInputDynamicState(Copyable, Movable):
    var _cmd_set_vertex_input_ext: fn(
        commandBuffer: CommandBuffer, vertexBindingDescriptionCount: UInt32, pVertexBindingDescriptions: Ptr[VertexInputBindingDescription2EXT], vertexAttributeDescriptionCount: UInt32, pVertexAttributeDescriptions: Ptr[VertexInputAttributeDescription2EXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_vertex_input_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetVertexInputEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_vertex_input_ext)]()[]

    fn cmd_set_vertex_input_ext(
        self,
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_vertex_input_ext(
            command_buffer,
            vertex_binding_description_count,
            p_vertex_binding_descriptions,
            vertex_attribute_description_count,
            p_vertex_attribute_descriptions,
        )


struct PipelineProperties(Copyable, Movable):
    var _get_pipeline_properties_ext: fn(
        device: Device, pPipelineInfo: Ptr[PipelineInfoEXT], pPipelineProperties: Ptr[BaseOutStructure]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_pipeline_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelinePropertiesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_pipeline_properties_ext)]()[]

    fn get_pipeline_properties_ext(
        self,
        device: Device,
        pipeline_info: PipelineInfoEXT,
        mut pipeline_properties: BaseOutStructure,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_pipeline_properties_ext(
            device, Ptr(to=pipeline_info), Ptr(to=pipeline_properties)
        )


struct ExtendedDynamicState2(Copyable, Movable):
    var _cmd_set_patch_control_points_ext: fn(
        commandBuffer: CommandBuffer, patchControlPoints: UInt32
    )
    var _cmd_set_rasterizer_discard_enable: fn(
        commandBuffer: CommandBuffer, rasterizerDiscardEnable: Bool32
    )
    var _cmd_set_depth_bias_enable: fn(
        commandBuffer: CommandBuffer, depthBiasEnable: Bool32
    )
    var _cmd_set_logic_op_ext: fn(
        commandBuffer: CommandBuffer, logicOp: LogicOp
    )
    var _cmd_set_primitive_restart_enable: fn(
        commandBuffer: CommandBuffer, primitiveRestartEnable: Bool32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_patch_control_points_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPatchControlPointsEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_patch_control_points_ext)]()[]
        self._cmd_set_rasterizer_discard_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizerDiscardEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_rasterizer_discard_enable)]()[]
        self._cmd_set_depth_bias_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBiasEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_bias_enable)]()[]
        self._cmd_set_logic_op_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_logic_op_ext)]()[]
        self._cmd_set_primitive_restart_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveRestartEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_primitive_restart_enable)]()[]

    fn cmd_set_patch_control_points_ext(
        self, command_buffer: CommandBuffer, patch_control_points: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_patch_control_points_ext(command_buffer, patch_control_points)

    fn cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_rasterizer_discard_enable(command_buffer, rasterizer_discard_enable)

    fn cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    fn cmd_set_logic_op_ext(self, command_buffer: CommandBuffer, logic_op: LogicOp):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_logic_op_ext(command_buffer, logic_op)

    fn cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)


struct ColorWriteEnable(Copyable, Movable):
    var _cmd_set_color_write_enable_ext: fn(
        commandBuffer: CommandBuffer, attachmentCount: UInt32, pColorWriteEnables: Ptr[Bool32]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_color_write_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorWriteEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_color_write_enable_ext)]()[]

    fn cmd_set_color_write_enable_ext(
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_color_write_enables: Ptr[Bool32],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_color_write_enable_ext(
            command_buffer, attachment_count, p_color_write_enables
        )


struct MultiDraw(Copyable, Movable):
    var _cmd_draw_multi_ext: fn(
        commandBuffer: CommandBuffer, drawCount: UInt32, pVertexInfo: Ptr[MultiDrawInfoEXT], instanceCount: UInt32, firstInstance: UInt32, stride: UInt32
    )
    var _cmd_draw_multi_indexed_ext: fn(
        commandBuffer: CommandBuffer, drawCount: UInt32, pIndexInfo: Ptr[MultiDrawIndexedInfoEXT], instanceCount: UInt32, firstInstance: UInt32, stride: UInt32, pVertexOffset: Ptr[Int32]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_multi_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMultiEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_multi_ext)]()[]
        self._cmd_draw_multi_indexed_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMultiIndexedEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_multi_indexed_ext)]()[]

    fn cmd_draw_multi_ext(
        self,
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_vertex_info: Ptr[MultiDrawInfoEXT],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_multi_ext(
            command_buffer, draw_count, p_vertex_info, instance_count, first_instance, stride
        )

    fn cmd_draw_multi_indexed_ext(
        self,
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_index_info: Ptr[MultiDrawIndexedInfoEXT],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
        p_vertex_offset: Ptr[Int32],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_multi_indexed_ext(
            command_buffer,
            draw_count,
            p_index_info,
            instance_count,
            first_instance,
            stride,
            p_vertex_offset,
        )


struct OpacityMicromap(Copyable, Movable):
    var _create_micromap_ext: fn(
        device: Device, pCreateInfo: Ptr[MicromapCreateInfoEXT], pAllocator: Ptr[AllocationCallbacks], pMicromap: Ptr[MicromapEXT]
    ) -> Result
    var _destroy_micromap_ext: fn(
        device: Device, micromap: MicromapEXT, pAllocator: Ptr[AllocationCallbacks]
    )
    var _cmd_build_micromaps_ext: fn(
        commandBuffer: CommandBuffer, infoCount: UInt32, pInfos: Ptr[MicromapBuildInfoEXT]
    )
    var _build_micromaps_ext: fn(
        device: Device, deferredOperation: DeferredOperationKHR, infoCount: UInt32, pInfos: Ptr[MicromapBuildInfoEXT]
    ) -> Result
    var _copy_micromap_ext: fn(
        device: Device, deferredOperation: DeferredOperationKHR, pInfo: Ptr[CopyMicromapInfoEXT]
    ) -> Result
    var _copy_micromap_to_memory_ext: fn(
        device: Device, deferredOperation: DeferredOperationKHR, pInfo: Ptr[CopyMicromapToMemoryInfoEXT]
    ) -> Result
    var _copy_memory_to_micromap_ext: fn(
        device: Device, deferredOperation: DeferredOperationKHR, pInfo: Ptr[CopyMemoryToMicromapInfoEXT]
    ) -> Result
    var _write_micromaps_properties_ext: fn(
        device: Device, micromapCount: UInt32, pMicromaps: Ptr[MicromapEXT], queryType: QueryType, dataSize: UInt, pData: Ptr[NoneType], stride: UInt
    ) -> Result
    var _cmd_copy_micromap_ext: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[CopyMicromapInfoEXT]
    )
    var _cmd_copy_micromap_to_memory_ext: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[CopyMicromapToMemoryInfoEXT]
    )
    var _cmd_copy_memory_to_micromap_ext: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[CopyMemoryToMicromapInfoEXT]
    )
    var _cmd_write_micromaps_properties_ext: fn(
        commandBuffer: CommandBuffer, micromapCount: UInt32, pMicromaps: Ptr[MicromapEXT], queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32
    )
    var _get_device_micromap_compatibility_ext: fn(
        device: Device, pVersionInfo: Ptr[MicromapVersionInfoEXT], pCompatibility: Ptr[AccelerationStructureCompatibilityKHR]
    )
    var _get_micromap_build_sizes_ext: fn(
        device: Device, buildType: AccelerationStructureBuildTypeKHR, pBuildInfo: Ptr[MicromapBuildInfoEXT], pSizeInfo: Ptr[MicromapBuildSizesInfoEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkCreateMicromapEXT".unsafe_ptr()
        )).bitcast[__type_of(self._create_micromap_ext)]()[]
        self._destroy_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkDestroyMicromapEXT".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_micromap_ext)]()[]
        self._cmd_build_micromaps_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildMicromapsEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_build_micromaps_ext)]()[]
        self._build_micromaps_ext = Ptr(to=get_device_proc_addr(
            device, "vkBuildMicromapsEXT".unsafe_ptr()
        )).bitcast[__type_of(self._build_micromaps_ext)]()[]
        self._copy_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkCopyMicromapEXT".unsafe_ptr()
        )).bitcast[__type_of(self._copy_micromap_ext)]()[]
        self._copy_micromap_to_memory_ext = Ptr(to=get_device_proc_addr(
            device, "vkCopyMicromapToMemoryEXT".unsafe_ptr()
        )).bitcast[__type_of(self._copy_micromap_to_memory_ext)]()[]
        self._copy_memory_to_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkCopyMemoryToMicromapEXT".unsafe_ptr()
        )).bitcast[__type_of(self._copy_memory_to_micromap_ext)]()[]
        self._write_micromaps_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkWriteMicromapsPropertiesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._write_micromaps_properties_ext)]()[]
        self._cmd_copy_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMicromapEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_micromap_ext)]()[]
        self._cmd_copy_micromap_to_memory_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMicromapToMemoryEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_micromap_to_memory_ext)]()[]
        self._cmd_copy_memory_to_micromap_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToMicromapEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_memory_to_micromap_ext)]()[]
        self._cmd_write_micromaps_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteMicromapsPropertiesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_write_micromaps_properties_ext)]()[]
        self._get_device_micromap_compatibility_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceMicromapCompatibilityEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_micromap_compatibility_ext)]()[]
        self._get_micromap_build_sizes_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetMicromapBuildSizesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_micromap_build_sizes_ext)]()[]

    fn create_micromap_ext(
        self,
        device: Device,
        create_info: MicromapCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut micromap: MicromapEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_micromap_ext(device, Ptr(to=create_info), p_allocator, Ptr(to=micromap))

    fn destroy_micromap_ext(
        self, device: Device, micromap: MicromapEXT, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_micromap_ext(device, micromap, p_allocator)

    fn cmd_build_micromaps_ext(
        self, command_buffer: CommandBuffer, info_count: UInt32, p_infos: Ptr[MicromapBuildInfoEXT]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_build_micromaps_ext(command_buffer, info_count, p_infos)

    fn build_micromaps_ext(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._build_micromaps_ext(device, deferred_operation, info_count, p_infos)

    fn copy_micromap_ext(
        self, device: Device, deferred_operation: DeferredOperationKHR, info: CopyMicromapInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._copy_micromap_ext(device, deferred_operation, Ptr(to=info))

    fn copy_micromap_to_memory_ext(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMicromapToMemoryInfoEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._copy_micromap_to_memory_ext(device, deferred_operation, Ptr(to=info))

    fn copy_memory_to_micromap_ext(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMemoryToMicromapInfoEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._copy_memory_to_micromap_ext(device, deferred_operation, Ptr(to=info))

    fn write_micromaps_properties_ext(
        self,
        device: Device,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType],
        stride: UInt,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._write_micromaps_properties_ext(
            device, micromap_count, p_micromaps, query_type, data_size, p_data, stride
        )

    fn cmd_copy_micromap_ext(self, command_buffer: CommandBuffer, info: CopyMicromapInfoEXT):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_micromap_ext(command_buffer, Ptr(to=info))

    fn cmd_copy_micromap_to_memory_ext(
        self, command_buffer: CommandBuffer, info: CopyMicromapToMemoryInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_micromap_to_memory_ext(command_buffer, Ptr(to=info))

    fn cmd_copy_memory_to_micromap_ext(
        self, command_buffer: CommandBuffer, info: CopyMemoryToMicromapInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_memory_to_micromap_ext(command_buffer, Ptr(to=info))

    fn cmd_write_micromaps_properties_ext(
        self,
        command_buffer: CommandBuffer,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_write_micromaps_properties_ext(
            command_buffer, micromap_count, p_micromaps, query_type, query_pool, first_query
        )

    fn get_device_micromap_compatibility_ext(
        self,
        device: Device,
        version_info: MicromapVersionInfoEXT,
        mut compatibility: AccelerationStructureCompatibilityKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_micromap_build_sizes_ext(
            device, build_type, Ptr(to=build_info), Ptr(to=size_info)
        )


struct PageableDeviceLocalMemory(Copyable, Movable):
    var _set_device_memory_priority_ext: fn(
        device: Device, memory: DeviceMemory, priority: Float32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_device_memory_priority_ext = Ptr(to=get_device_proc_addr(
            device, "vkSetDeviceMemoryPriorityEXT".unsafe_ptr()
        )).bitcast[__type_of(self._set_device_memory_priority_ext)]()[]

    fn set_device_memory_priority_ext(
        self, device: Device, memory: DeviceMemory, priority: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._set_device_memory_priority_ext(device, memory, priority)


struct ExtendedDynamicState3(Copyable, Movable):
    var _cmd_set_depth_clamp_enable_ext: fn(
        commandBuffer: CommandBuffer, depthClampEnable: Bool32
    )
    var _cmd_set_polygon_mode_ext: fn(
        commandBuffer: CommandBuffer, polygonMode: PolygonMode
    )
    var _cmd_set_rasterization_samples_ext: fn(
        commandBuffer: CommandBuffer, rasterizationSamples: SampleCountFlagBits
    )
    var _cmd_set_sample_mask_ext: fn(
        commandBuffer: CommandBuffer, samples: SampleCountFlagBits, pSampleMask: Ptr[SampleMask]
    )
    var _cmd_set_alpha_to_coverage_enable_ext: fn(
        commandBuffer: CommandBuffer, alphaToCoverageEnable: Bool32
    )
    var _cmd_set_alpha_to_one_enable_ext: fn(
        commandBuffer: CommandBuffer, alphaToOneEnable: Bool32
    )
    var _cmd_set_logic_op_enable_ext: fn(
        commandBuffer: CommandBuffer, logicOpEnable: Bool32
    )
    var _cmd_set_color_blend_enable_ext: fn(
        commandBuffer: CommandBuffer, firstAttachment: UInt32, attachmentCount: UInt32, pColorBlendEnables: Ptr[Bool32]
    )
    var _cmd_set_color_blend_equation_ext: fn(
        commandBuffer: CommandBuffer, firstAttachment: UInt32, attachmentCount: UInt32, pColorBlendEquations: Ptr[ColorBlendEquationEXT]
    )
    var _cmd_set_color_write_mask_ext: fn(
        commandBuffer: CommandBuffer, firstAttachment: UInt32, attachmentCount: UInt32, pColorWriteMasks: Ptr[ColorComponentFlags]
    )
    var _cmd_set_tessellation_domain_origin_ext: fn(
        commandBuffer: CommandBuffer, domainOrigin: TessellationDomainOrigin
    )
    var _cmd_set_rasterization_stream_ext: fn(
        commandBuffer: CommandBuffer, rasterizationStream: UInt32
    )
    var _cmd_set_conservative_rasterization_mode_ext: fn(
        commandBuffer: CommandBuffer, conservativeRasterizationMode: ConservativeRasterizationModeEXT
    )
    var _cmd_set_extra_primitive_overestimation_size_ext: fn(
        commandBuffer: CommandBuffer, extraPrimitiveOverestimationSize: Float32
    )
    var _cmd_set_depth_clip_enable_ext: fn(
        commandBuffer: CommandBuffer, depthClipEnable: Bool32
    )
    var _cmd_set_sample_locations_enable_ext: fn(
        commandBuffer: CommandBuffer, sampleLocationsEnable: Bool32
    )
    var _cmd_set_color_blend_advanced_ext: fn(
        commandBuffer: CommandBuffer, firstAttachment: UInt32, attachmentCount: UInt32, pColorBlendAdvanced: Ptr[ColorBlendAdvancedEXT]
    )
    var _cmd_set_provoking_vertex_mode_ext: fn(
        commandBuffer: CommandBuffer, provokingVertexMode: ProvokingVertexModeEXT
    )
    var _cmd_set_line_rasterization_mode_ext: fn(
        commandBuffer: CommandBuffer, lineRasterizationMode: LineRasterizationModeEXT
    )
    var _cmd_set_line_stipple_enable_ext: fn(
        commandBuffer: CommandBuffer, stippledLineEnable: Bool32
    )
    var _cmd_set_depth_clip_negative_one_to_one_ext: fn(
        commandBuffer: CommandBuffer, negativeOneToOne: Bool32
    )
    var _cmd_set_viewport_w_scaling_enable_nv: fn(
        commandBuffer: CommandBuffer, viewportWScalingEnable: Bool32
    )
    var _cmd_set_viewport_swizzle_nv: fn(
        commandBuffer: CommandBuffer, firstViewport: UInt32, viewportCount: UInt32, pViewportSwizzles: Ptr[ViewportSwizzleNV]
    )
    var _cmd_set_coverage_to_color_enable_nv: fn(
        commandBuffer: CommandBuffer, coverageToColorEnable: Bool32
    )
    var _cmd_set_coverage_to_color_location_nv: fn(
        commandBuffer: CommandBuffer, coverageToColorLocation: UInt32
    )
    var _cmd_set_coverage_modulation_mode_nv: fn(
        commandBuffer: CommandBuffer, coverageModulationMode: CoverageModulationModeNV
    )
    var _cmd_set_coverage_modulation_table_enable_nv: fn(
        commandBuffer: CommandBuffer, coverageModulationTableEnable: Bool32
    )
    var _cmd_set_coverage_modulation_table_nv: fn(
        commandBuffer: CommandBuffer, coverageModulationTableCount: UInt32, pCoverageModulationTable: Ptr[Float32]
    )
    var _cmd_set_shading_rate_image_enable_nv: fn(
        commandBuffer: CommandBuffer, shadingRateImageEnable: Bool32
    )
    var _cmd_set_representative_fragment_test_enable_nv: fn(
        commandBuffer: CommandBuffer, representativeFragmentTestEnable: Bool32
    )
    var _cmd_set_coverage_reduction_mode_nv: fn(
        commandBuffer: CommandBuffer, coverageReductionMode: CoverageReductionModeNV
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_clamp_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_clamp_enable_ext)]()[]
        self._cmd_set_polygon_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPolygonModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_polygon_mode_ext)]()[]
        self._cmd_set_rasterization_samples_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationSamplesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_rasterization_samples_ext)]()[]
        self._cmd_set_sample_mask_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleMaskEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_sample_mask_ext)]()[]
        self._cmd_set_alpha_to_coverage_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToCoverageEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_alpha_to_coverage_enable_ext)]()[]
        self._cmd_set_alpha_to_one_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToOneEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_alpha_to_one_enable_ext)]()[]
        self._cmd_set_logic_op_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_logic_op_enable_ext)]()[]
        self._cmd_set_color_blend_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_color_blend_enable_ext)]()[]
        self._cmd_set_color_blend_equation_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEquationEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_color_blend_equation_ext)]()[]
        self._cmd_set_color_write_mask_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorWriteMaskEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_color_write_mask_ext)]()[]
        self._cmd_set_tessellation_domain_origin_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetTessellationDomainOriginEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_tessellation_domain_origin_ext)]()[]
        self._cmd_set_rasterization_stream_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationStreamEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_rasterization_stream_ext)]()[]
        self._cmd_set_conservative_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetConservativeRasterizationModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_conservative_rasterization_mode_ext)]()[]
        self._cmd_set_extra_primitive_overestimation_size_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExtraPrimitiveOverestimationSizeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_extra_primitive_overestimation_size_ext)]()[]
        self._cmd_set_depth_clip_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_clip_enable_ext)]()[]
        self._cmd_set_sample_locations_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleLocationsEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_sample_locations_enable_ext)]()[]
        self._cmd_set_color_blend_advanced_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendAdvancedEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_color_blend_advanced_ext)]()[]
        self._cmd_set_provoking_vertex_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetProvokingVertexModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_provoking_vertex_mode_ext)]()[]
        self._cmd_set_line_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineRasterizationModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_line_rasterization_mode_ext)]()[]
        self._cmd_set_line_stipple_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStippleEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_line_stipple_enable_ext)]()[]
        self._cmd_set_depth_clip_negative_one_to_one_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipNegativeOneToOneEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_clip_negative_one_to_one_ext)]()[]
        self._cmd_set_viewport_w_scaling_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWScalingEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_viewport_w_scaling_enable_nv)]()[]
        self._cmd_set_viewport_swizzle_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportSwizzleNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_viewport_swizzle_nv)]()[]
        self._cmd_set_coverage_to_color_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_to_color_enable_nv)]()[]
        self._cmd_set_coverage_to_color_location_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorLocationNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_to_color_location_nv)]()[]
        self._cmd_set_coverage_modulation_mode_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationModeNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_modulation_mode_nv)]()[]
        self._cmd_set_coverage_modulation_table_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_modulation_table_enable_nv)]()[]
        self._cmd_set_coverage_modulation_table_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_modulation_table_nv)]()[]
        self._cmd_set_shading_rate_image_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetShadingRateImageEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_shading_rate_image_enable_nv)]()[]
        self._cmd_set_representative_fragment_test_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRepresentativeFragmentTestEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_representative_fragment_test_enable_nv)]()[]
        self._cmd_set_coverage_reduction_mode_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageReductionModeNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_reduction_mode_nv)]()[]

    fn cmd_set_depth_clamp_enable_ext(
        self, command_buffer: CommandBuffer, depth_clamp_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_clamp_enable_ext(command_buffer, depth_clamp_enable)

    fn cmd_set_polygon_mode_ext(self, command_buffer: CommandBuffer, polygon_mode: PolygonMode):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_polygon_mode_ext(command_buffer, polygon_mode)

    fn cmd_set_rasterization_samples_ext(
        self, command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_rasterization_samples_ext(command_buffer, rasterization_samples)

    fn cmd_set_sample_mask_ext(
        self,
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_sample_mask_ext(command_buffer, samples, p_sample_mask)

    fn cmd_set_alpha_to_coverage_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_alpha_to_coverage_enable_ext(command_buffer, alpha_to_coverage_enable)

    fn cmd_set_alpha_to_one_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_alpha_to_one_enable_ext(command_buffer, alpha_to_one_enable)

    fn cmd_set_logic_op_enable_ext(self, command_buffer: CommandBuffer, logic_op_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_logic_op_enable_ext(command_buffer, logic_op_enable)

    fn cmd_set_color_blend_enable_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_color_blend_enable_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_enables
        )

    fn cmd_set_color_blend_equation_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_color_blend_equation_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_equations
        )

    fn cmd_set_color_write_mask_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_color_write_mask_ext(
            command_buffer, first_attachment, attachment_count, p_color_write_masks
        )

    fn cmd_set_tessellation_domain_origin_ext(
        self, command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_tessellation_domain_origin_ext(command_buffer, domain_origin)

    fn cmd_set_rasterization_stream_ext(
        self, command_buffer: CommandBuffer, rasterization_stream: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_rasterization_stream_ext(command_buffer, rasterization_stream)

    fn cmd_set_conservative_rasterization_mode_ext(
        self,
        command_buffer: CommandBuffer,
        conservative_rasterization_mode: ConservativeRasterizationModeEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_conservative_rasterization_mode_ext(
            command_buffer, conservative_rasterization_mode
        )

    fn cmd_set_extra_primitive_overestimation_size_ext(
        self, command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_extra_primitive_overestimation_size_ext(
            command_buffer, extra_primitive_overestimation_size
        )

    fn cmd_set_depth_clip_enable_ext(
        self, command_buffer: CommandBuffer, depth_clip_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_clip_enable_ext(command_buffer, depth_clip_enable)

    fn cmd_set_sample_locations_enable_ext(
        self, command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_sample_locations_enable_ext(command_buffer, sample_locations_enable)

    fn cmd_set_color_blend_advanced_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_color_blend_advanced_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_advanced
        )

    fn cmd_set_provoking_vertex_mode_ext(
        self, command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_provoking_vertex_mode_ext(command_buffer, provoking_vertex_mode)

    fn cmd_set_line_rasterization_mode_ext(
        self, command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_line_rasterization_mode_ext(command_buffer, line_rasterization_mode)

    fn cmd_set_line_stipple_enable_ext(
        self, command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_line_stipple_enable_ext(command_buffer, stippled_line_enable)

    fn cmd_set_depth_clip_negative_one_to_one_ext(
        self, command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_clip_negative_one_to_one_ext(command_buffer, negative_one_to_one)

    fn cmd_set_viewport_w_scaling_enable_nv(
        self, command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_viewport_w_scaling_enable_nv(command_buffer, viewport_w_scaling_enable)

    fn cmd_set_viewport_swizzle_nv(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_viewport_swizzle_nv(
            command_buffer, first_viewport, viewport_count, p_viewport_swizzles
        )

    fn cmd_set_coverage_to_color_enable_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_to_color_enable_nv(command_buffer, coverage_to_color_enable)

    fn cmd_set_coverage_to_color_location_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_to_color_location_nv(
            command_buffer, coverage_to_color_location
        )

    fn cmd_set_coverage_modulation_mode_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_modulation_mode_nv(command_buffer, coverage_modulation_mode)

    fn cmd_set_coverage_modulation_table_enable_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_modulation_table_enable_nv(
            command_buffer, coverage_modulation_table_enable
        )

    fn cmd_set_coverage_modulation_table_nv(
        self,
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_modulation_table_nv(
            command_buffer, coverage_modulation_table_count, p_coverage_modulation_table
        )

    fn cmd_set_shading_rate_image_enable_nv(
        self, command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_shading_rate_image_enable_nv(command_buffer, shading_rate_image_enable)

    fn cmd_set_representative_fragment_test_enable_nv(
        self, command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_representative_fragment_test_enable_nv(
            command_buffer, representative_fragment_test_enable
        )

    fn cmd_set_coverage_reduction_mode_nv(
        self, command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_reduction_mode_nv(command_buffer, coverage_reduction_mode)


struct ShaderModuleIdentifier(Copyable, Movable):
    var _get_shader_module_identifier_ext: fn(
        device: Device, shaderModule: ShaderModule, pIdentifier: Ptr[ShaderModuleIdentifierEXT]
    )
    var _get_shader_module_create_info_identifier_ext: fn(
        device: Device, pCreateInfo: Ptr[ShaderModuleCreateInfo], pIdentifier: Ptr[ShaderModuleIdentifierEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_shader_module_identifier_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderModuleIdentifierEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_shader_module_identifier_ext)]()[]
        self._get_shader_module_create_info_identifier_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderModuleCreateInfoIdentifierEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_shader_module_create_info_identifier_ext)]()[]

    fn get_shader_module_identifier_ext(
        self, device: Device, shader_module: ShaderModule, mut identifier: ShaderModuleIdentifierEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_shader_module_identifier_ext(device, shader_module, Ptr(to=identifier))

    fn get_shader_module_create_info_identifier_ext(
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        mut identifier: ShaderModuleIdentifierEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_shader_module_create_info_identifier_ext(
            device, Ptr(to=create_info), Ptr(to=identifier)
        )


struct ShaderObject(Copyable, Movable):
    var _create_shaders_ext: fn(
        device: Device, createInfoCount: UInt32, pCreateInfos: Ptr[ShaderCreateInfoEXT], pAllocator: Ptr[AllocationCallbacks], pShaders: Ptr[ShaderEXT]
    ) -> Result
    var _destroy_shader_ext: fn(
        device: Device, shader: ShaderEXT, pAllocator: Ptr[AllocationCallbacks]
    )
    var _get_shader_binary_data_ext: fn(
        device: Device, shader: ShaderEXT, pDataSize: Ptr[UInt], pData: Ptr[NoneType]
    ) -> Result
    var _cmd_bind_shaders_ext: fn(
        commandBuffer: CommandBuffer, stageCount: UInt32, pStages: Ptr[ShaderStageFlagBits], pShaders: Ptr[ShaderEXT]
    )
    var _cmd_set_cull_mode: fn(
        commandBuffer: CommandBuffer, cullMode: CullModeFlags
    )
    var _cmd_set_front_face: fn(
        commandBuffer: CommandBuffer, frontFace: FrontFace
    )
    var _cmd_set_primitive_topology: fn(
        commandBuffer: CommandBuffer, primitiveTopology: PrimitiveTopology
    )
    var _cmd_set_viewport_with_count: fn(
        commandBuffer: CommandBuffer, viewportCount: UInt32, pViewports: Ptr[Viewport]
    )
    var _cmd_set_scissor_with_count: fn(
        commandBuffer: CommandBuffer, scissorCount: UInt32, pScissors: Ptr[Rect2D]
    )
    var _cmd_bind_vertex_buffers_2: fn(
        commandBuffer: CommandBuffer, firstBinding: UInt32, bindingCount: UInt32, pBuffers: Ptr[Buffer], pOffsets: Ptr[DeviceSize], pSizes: Ptr[DeviceSize], pStrides: Ptr[DeviceSize]
    )
    var _cmd_set_depth_test_enable: fn(
        commandBuffer: CommandBuffer, depthTestEnable: Bool32
    )
    var _cmd_set_depth_write_enable: fn(
        commandBuffer: CommandBuffer, depthWriteEnable: Bool32
    )
    var _cmd_set_depth_compare_op: fn(
        commandBuffer: CommandBuffer, depthCompareOp: CompareOp
    )
    var _cmd_set_depth_bounds_test_enable: fn(
        commandBuffer: CommandBuffer, depthBoundsTestEnable: Bool32
    )
    var _cmd_set_stencil_test_enable: fn(
        commandBuffer: CommandBuffer, stencilTestEnable: Bool32
    )
    var _cmd_set_stencil_op: fn(
        commandBuffer: CommandBuffer, faceMask: StencilFaceFlags, failOp: StencilOp, passOp: StencilOp, depthFailOp: StencilOp, compareOp: CompareOp
    )
    var _cmd_set_vertex_input_ext: fn(
        commandBuffer: CommandBuffer, vertexBindingDescriptionCount: UInt32, pVertexBindingDescriptions: Ptr[VertexInputBindingDescription2EXT], vertexAttributeDescriptionCount: UInt32, pVertexAttributeDescriptions: Ptr[VertexInputAttributeDescription2EXT]
    )
    var _cmd_set_patch_control_points_ext: fn(
        commandBuffer: CommandBuffer, patchControlPoints: UInt32
    )
    var _cmd_set_rasterizer_discard_enable: fn(
        commandBuffer: CommandBuffer, rasterizerDiscardEnable: Bool32
    )
    var _cmd_set_depth_bias_enable: fn(
        commandBuffer: CommandBuffer, depthBiasEnable: Bool32
    )
    var _cmd_set_logic_op_ext: fn(
        commandBuffer: CommandBuffer, logicOp: LogicOp
    )
    var _cmd_set_primitive_restart_enable: fn(
        commandBuffer: CommandBuffer, primitiveRestartEnable: Bool32
    )
    var _cmd_set_tessellation_domain_origin_ext: fn(
        commandBuffer: CommandBuffer, domainOrigin: TessellationDomainOrigin
    )
    var _cmd_set_depth_clamp_enable_ext: fn(
        commandBuffer: CommandBuffer, depthClampEnable: Bool32
    )
    var _cmd_set_polygon_mode_ext: fn(
        commandBuffer: CommandBuffer, polygonMode: PolygonMode
    )
    var _cmd_set_rasterization_samples_ext: fn(
        commandBuffer: CommandBuffer, rasterizationSamples: SampleCountFlagBits
    )
    var _cmd_set_sample_mask_ext: fn(
        commandBuffer: CommandBuffer, samples: SampleCountFlagBits, pSampleMask: Ptr[SampleMask]
    )
    var _cmd_set_alpha_to_coverage_enable_ext: fn(
        commandBuffer: CommandBuffer, alphaToCoverageEnable: Bool32
    )
    var _cmd_set_alpha_to_one_enable_ext: fn(
        commandBuffer: CommandBuffer, alphaToOneEnable: Bool32
    )
    var _cmd_set_logic_op_enable_ext: fn(
        commandBuffer: CommandBuffer, logicOpEnable: Bool32
    )
    var _cmd_set_color_blend_enable_ext: fn(
        commandBuffer: CommandBuffer, firstAttachment: UInt32, attachmentCount: UInt32, pColorBlendEnables: Ptr[Bool32]
    )
    var _cmd_set_color_blend_equation_ext: fn(
        commandBuffer: CommandBuffer, firstAttachment: UInt32, attachmentCount: UInt32, pColorBlendEquations: Ptr[ColorBlendEquationEXT]
    )
    var _cmd_set_color_write_mask_ext: fn(
        commandBuffer: CommandBuffer, firstAttachment: UInt32, attachmentCount: UInt32, pColorWriteMasks: Ptr[ColorComponentFlags]
    )
    var _cmd_set_rasterization_stream_ext: fn(
        commandBuffer: CommandBuffer, rasterizationStream: UInt32
    )
    var _cmd_set_conservative_rasterization_mode_ext: fn(
        commandBuffer: CommandBuffer, conservativeRasterizationMode: ConservativeRasterizationModeEXT
    )
    var _cmd_set_extra_primitive_overestimation_size_ext: fn(
        commandBuffer: CommandBuffer, extraPrimitiveOverestimationSize: Float32
    )
    var _cmd_set_depth_clip_enable_ext: fn(
        commandBuffer: CommandBuffer, depthClipEnable: Bool32
    )
    var _cmd_set_sample_locations_enable_ext: fn(
        commandBuffer: CommandBuffer, sampleLocationsEnable: Bool32
    )
    var _cmd_set_color_blend_advanced_ext: fn(
        commandBuffer: CommandBuffer, firstAttachment: UInt32, attachmentCount: UInt32, pColorBlendAdvanced: Ptr[ColorBlendAdvancedEXT]
    )
    var _cmd_set_provoking_vertex_mode_ext: fn(
        commandBuffer: CommandBuffer, provokingVertexMode: ProvokingVertexModeEXT
    )
    var _cmd_set_line_rasterization_mode_ext: fn(
        commandBuffer: CommandBuffer, lineRasterizationMode: LineRasterizationModeEXT
    )
    var _cmd_set_line_stipple_enable_ext: fn(
        commandBuffer: CommandBuffer, stippledLineEnable: Bool32
    )
    var _cmd_set_depth_clip_negative_one_to_one_ext: fn(
        commandBuffer: CommandBuffer, negativeOneToOne: Bool32
    )
    var _cmd_set_viewport_w_scaling_enable_nv: fn(
        commandBuffer: CommandBuffer, viewportWScalingEnable: Bool32
    )
    var _cmd_set_viewport_swizzle_nv: fn(
        commandBuffer: CommandBuffer, firstViewport: UInt32, viewportCount: UInt32, pViewportSwizzles: Ptr[ViewportSwizzleNV]
    )
    var _cmd_set_coverage_to_color_enable_nv: fn(
        commandBuffer: CommandBuffer, coverageToColorEnable: Bool32
    )
    var _cmd_set_coverage_to_color_location_nv: fn(
        commandBuffer: CommandBuffer, coverageToColorLocation: UInt32
    )
    var _cmd_set_coverage_modulation_mode_nv: fn(
        commandBuffer: CommandBuffer, coverageModulationMode: CoverageModulationModeNV
    )
    var _cmd_set_coverage_modulation_table_enable_nv: fn(
        commandBuffer: CommandBuffer, coverageModulationTableEnable: Bool32
    )
    var _cmd_set_coverage_modulation_table_nv: fn(
        commandBuffer: CommandBuffer, coverageModulationTableCount: UInt32, pCoverageModulationTable: Ptr[Float32]
    )
    var _cmd_set_shading_rate_image_enable_nv: fn(
        commandBuffer: CommandBuffer, shadingRateImageEnable: Bool32
    )
    var _cmd_set_representative_fragment_test_enable_nv: fn(
        commandBuffer: CommandBuffer, representativeFragmentTestEnable: Bool32
    )
    var _cmd_set_coverage_reduction_mode_nv: fn(
        commandBuffer: CommandBuffer, coverageReductionMode: CoverageReductionModeNV
    )
    var _cmd_set_depth_clamp_range_ext: fn(
        commandBuffer: CommandBuffer, depthClampMode: DepthClampModeEXT, pDepthClampRange: Ptr[DepthClampRangeEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_shaders_ext = Ptr(to=get_device_proc_addr(
            device, "vkCreateShadersEXT".unsafe_ptr()
        )).bitcast[__type_of(self._create_shaders_ext)]()[]
        self._destroy_shader_ext = Ptr(to=get_device_proc_addr(
            device, "vkDestroyShaderEXT".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_shader_ext)]()[]
        self._get_shader_binary_data_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderBinaryDataEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_shader_binary_data_ext)]()[]
        self._cmd_bind_shaders_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindShadersEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_shaders_ext)]()[]
        self._cmd_set_cull_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCullMode".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_cull_mode)]()[]
        self._cmd_set_front_face = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFrontFace".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_front_face)]()[]
        self._cmd_set_primitive_topology = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveTopology".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_primitive_topology)]()[]
        self._cmd_set_viewport_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWithCount".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_viewport_with_count)]()[]
        self._cmd_set_scissor_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetScissorWithCount".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_scissor_with_count)]()[]
        self._cmd_bind_vertex_buffers_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindVertexBuffers2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_vertex_buffers_2)]()[]
        self._cmd_set_depth_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthTestEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_test_enable)]()[]
        self._cmd_set_depth_write_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthWriteEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_write_enable)]()[]
        self._cmd_set_depth_compare_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthCompareOp".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_compare_op)]()[]
        self._cmd_set_depth_bounds_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBoundsTestEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_bounds_test_enable)]()[]
        self._cmd_set_stencil_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilTestEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_stencil_test_enable)]()[]
        self._cmd_set_stencil_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilOp".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_stencil_op)]()[]
        self._cmd_set_vertex_input_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetVertexInputEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_vertex_input_ext)]()[]
        self._cmd_set_patch_control_points_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPatchControlPointsEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_patch_control_points_ext)]()[]
        self._cmd_set_rasterizer_discard_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizerDiscardEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_rasterizer_discard_enable)]()[]
        self._cmd_set_depth_bias_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBiasEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_bias_enable)]()[]
        self._cmd_set_logic_op_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_logic_op_ext)]()[]
        self._cmd_set_primitive_restart_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveRestartEnable".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_primitive_restart_enable)]()[]
        self._cmd_set_tessellation_domain_origin_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetTessellationDomainOriginEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_tessellation_domain_origin_ext)]()[]
        self._cmd_set_depth_clamp_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_clamp_enable_ext)]()[]
        self._cmd_set_polygon_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPolygonModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_polygon_mode_ext)]()[]
        self._cmd_set_rasterization_samples_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationSamplesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_rasterization_samples_ext)]()[]
        self._cmd_set_sample_mask_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleMaskEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_sample_mask_ext)]()[]
        self._cmd_set_alpha_to_coverage_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToCoverageEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_alpha_to_coverage_enable_ext)]()[]
        self._cmd_set_alpha_to_one_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAlphaToOneEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_alpha_to_one_enable_ext)]()[]
        self._cmd_set_logic_op_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLogicOpEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_logic_op_enable_ext)]()[]
        self._cmd_set_color_blend_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_color_blend_enable_ext)]()[]
        self._cmd_set_color_blend_equation_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendEquationEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_color_blend_equation_ext)]()[]
        self._cmd_set_color_write_mask_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorWriteMaskEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_color_write_mask_ext)]()[]
        self._cmd_set_rasterization_stream_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizationStreamEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_rasterization_stream_ext)]()[]
        self._cmd_set_conservative_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetConservativeRasterizationModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_conservative_rasterization_mode_ext)]()[]
        self._cmd_set_extra_primitive_overestimation_size_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExtraPrimitiveOverestimationSizeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_extra_primitive_overestimation_size_ext)]()[]
        self._cmd_set_depth_clip_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_clip_enable_ext)]()[]
        self._cmd_set_sample_locations_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetSampleLocationsEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_sample_locations_enable_ext)]()[]
        self._cmd_set_color_blend_advanced_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetColorBlendAdvancedEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_color_blend_advanced_ext)]()[]
        self._cmd_set_provoking_vertex_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetProvokingVertexModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_provoking_vertex_mode_ext)]()[]
        self._cmd_set_line_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineRasterizationModeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_line_rasterization_mode_ext)]()[]
        self._cmd_set_line_stipple_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStippleEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_line_stipple_enable_ext)]()[]
        self._cmd_set_depth_clip_negative_one_to_one_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClipNegativeOneToOneEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_clip_negative_one_to_one_ext)]()[]
        self._cmd_set_viewport_w_scaling_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWScalingEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_viewport_w_scaling_enable_nv)]()[]
        self._cmd_set_viewport_swizzle_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportSwizzleNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_viewport_swizzle_nv)]()[]
        self._cmd_set_coverage_to_color_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_to_color_enable_nv)]()[]
        self._cmd_set_coverage_to_color_location_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageToColorLocationNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_to_color_location_nv)]()[]
        self._cmd_set_coverage_modulation_mode_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationModeNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_modulation_mode_nv)]()[]
        self._cmd_set_coverage_modulation_table_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_modulation_table_enable_nv)]()[]
        self._cmd_set_coverage_modulation_table_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageModulationTableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_modulation_table_nv)]()[]
        self._cmd_set_shading_rate_image_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetShadingRateImageEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_shading_rate_image_enable_nv)]()[]
        self._cmd_set_representative_fragment_test_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRepresentativeFragmentTestEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_representative_fragment_test_enable_nv)]()[]
        self._cmd_set_coverage_reduction_mode_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoverageReductionModeNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coverage_reduction_mode_nv)]()[]
        self._cmd_set_depth_clamp_range_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampRangeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_clamp_range_ext)]()[]

    fn create_shaders_ext(
        self,
        device: Device,
        create_info_count: UInt32,
        p_create_infos: Ptr[ShaderCreateInfoEXT],
        p_allocator: Ptr[AllocationCallbacks],
        p_shaders: Ptr[ShaderEXT],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_shaders_ext(
            device, create_info_count, p_create_infos, p_allocator, p_shaders
        )

    fn destroy_shader_ext(
        self, device: Device, shader: ShaderEXT, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_shader_ext(device, shader, p_allocator)

    fn get_shader_binary_data_ext(
        self, device: Device, shader: ShaderEXT, mut data_size: UInt, p_data: Ptr[NoneType]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_shader_binary_data_ext(device, shader, Ptr(to=data_size), p_data)

    fn get_shader_binary_data_ext(self, device: Device, shader: ShaderEXT) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_shader_binary_data_ext(device, shader, count, Ptr[NoneType]())
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_shader_binary_data_ext(
                    device, shader, count, list.unsafe_ptr().bitcast[NoneType]()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn cmd_bind_shaders_ext(
        self,
        command_buffer: CommandBuffer,
        stage_count: UInt32,
        p_stages: Ptr[ShaderStageFlagBits],
        p_shaders: Ptr[ShaderEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_shaders_ext(command_buffer, stage_count, p_stages, p_shaders)

    fn cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_cull_mode(command_buffer, cull_mode)

    fn cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_front_face(command_buffer, front_face)

    fn cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_primitive_topology(command_buffer, primitive_topology)

    fn cmd_set_viewport_with_count(
        self, command_buffer: CommandBuffer, viewport_count: UInt32, p_viewports: Ptr[Viewport]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_viewport_with_count(command_buffer, viewport_count, p_viewports)

    fn cmd_set_scissor_with_count(
        self, command_buffer: CommandBuffer, scissor_count: UInt32, p_scissors: Ptr[Rect2D]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_scissor_with_count(command_buffer, scissor_count, p_scissors)

    fn cmd_bind_vertex_buffers_2(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer],
        p_offsets: Ptr[DeviceSize],
        p_sizes: Ptr[DeviceSize],
        p_strides: Ptr[DeviceSize],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_vertex_buffers_2(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets, p_sizes, p_strides
        )

    fn cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    fn cmd_set_depth_write_enable(self, command_buffer: CommandBuffer, depth_write_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    fn cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    fn cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    fn cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_stencil_op(
            command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op
        )

    fn cmd_set_vertex_input_ext(
        self,
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_vertex_input_ext(
            command_buffer,
            vertex_binding_description_count,
            p_vertex_binding_descriptions,
            vertex_attribute_description_count,
            p_vertex_attribute_descriptions,
        )

    fn cmd_set_patch_control_points_ext(
        self, command_buffer: CommandBuffer, patch_control_points: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_patch_control_points_ext(command_buffer, patch_control_points)

    fn cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_rasterizer_discard_enable(command_buffer, rasterizer_discard_enable)

    fn cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    fn cmd_set_logic_op_ext(self, command_buffer: CommandBuffer, logic_op: LogicOp):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_logic_op_ext(command_buffer, logic_op)

    fn cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)

    fn cmd_set_tessellation_domain_origin_ext(
        self, command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_tessellation_domain_origin_ext(command_buffer, domain_origin)

    fn cmd_set_depth_clamp_enable_ext(
        self, command_buffer: CommandBuffer, depth_clamp_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_clamp_enable_ext(command_buffer, depth_clamp_enable)

    fn cmd_set_polygon_mode_ext(self, command_buffer: CommandBuffer, polygon_mode: PolygonMode):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_polygon_mode_ext(command_buffer, polygon_mode)

    fn cmd_set_rasterization_samples_ext(
        self, command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_rasterization_samples_ext(command_buffer, rasterization_samples)

    fn cmd_set_sample_mask_ext(
        self,
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_sample_mask_ext(command_buffer, samples, p_sample_mask)

    fn cmd_set_alpha_to_coverage_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_alpha_to_coverage_enable_ext(command_buffer, alpha_to_coverage_enable)

    fn cmd_set_alpha_to_one_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_alpha_to_one_enable_ext(command_buffer, alpha_to_one_enable)

    fn cmd_set_logic_op_enable_ext(self, command_buffer: CommandBuffer, logic_op_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_logic_op_enable_ext(command_buffer, logic_op_enable)

    fn cmd_set_color_blend_enable_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_color_blend_enable_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_enables
        )

    fn cmd_set_color_blend_equation_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_color_blend_equation_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_equations
        )

    fn cmd_set_color_write_mask_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_color_write_mask_ext(
            command_buffer, first_attachment, attachment_count, p_color_write_masks
        )

    fn cmd_set_rasterization_stream_ext(
        self, command_buffer: CommandBuffer, rasterization_stream: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_rasterization_stream_ext(command_buffer, rasterization_stream)

    fn cmd_set_conservative_rasterization_mode_ext(
        self,
        command_buffer: CommandBuffer,
        conservative_rasterization_mode: ConservativeRasterizationModeEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_conservative_rasterization_mode_ext(
            command_buffer, conservative_rasterization_mode
        )

    fn cmd_set_extra_primitive_overestimation_size_ext(
        self, command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_extra_primitive_overestimation_size_ext(
            command_buffer, extra_primitive_overestimation_size
        )

    fn cmd_set_depth_clip_enable_ext(
        self, command_buffer: CommandBuffer, depth_clip_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_clip_enable_ext(command_buffer, depth_clip_enable)

    fn cmd_set_sample_locations_enable_ext(
        self, command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_sample_locations_enable_ext(command_buffer, sample_locations_enable)

    fn cmd_set_color_blend_advanced_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_color_blend_advanced_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_advanced
        )

    fn cmd_set_provoking_vertex_mode_ext(
        self, command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_provoking_vertex_mode_ext(command_buffer, provoking_vertex_mode)

    fn cmd_set_line_rasterization_mode_ext(
        self, command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_line_rasterization_mode_ext(command_buffer, line_rasterization_mode)

    fn cmd_set_line_stipple_enable_ext(
        self, command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_line_stipple_enable_ext(command_buffer, stippled_line_enable)

    fn cmd_set_depth_clip_negative_one_to_one_ext(
        self, command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_clip_negative_one_to_one_ext(command_buffer, negative_one_to_one)

    fn cmd_set_viewport_w_scaling_enable_nv(
        self, command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_viewport_w_scaling_enable_nv(command_buffer, viewport_w_scaling_enable)

    fn cmd_set_viewport_swizzle_nv(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_viewport_swizzle_nv(
            command_buffer, first_viewport, viewport_count, p_viewport_swizzles
        )

    fn cmd_set_coverage_to_color_enable_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_to_color_enable_nv(command_buffer, coverage_to_color_enable)

    fn cmd_set_coverage_to_color_location_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_to_color_location_nv(
            command_buffer, coverage_to_color_location
        )

    fn cmd_set_coverage_modulation_mode_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_modulation_mode_nv(command_buffer, coverage_modulation_mode)

    fn cmd_set_coverage_modulation_table_enable_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_modulation_table_enable_nv(
            command_buffer, coverage_modulation_table_enable
        )

    fn cmd_set_coverage_modulation_table_nv(
        self,
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_modulation_table_nv(
            command_buffer, coverage_modulation_table_count, p_coverage_modulation_table
        )

    fn cmd_set_shading_rate_image_enable_nv(
        self, command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_shading_rate_image_enable_nv(command_buffer, shading_rate_image_enable)

    fn cmd_set_representative_fragment_test_enable_nv(
        self, command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_representative_fragment_test_enable_nv(
            command_buffer, representative_fragment_test_enable
        )

    fn cmd_set_coverage_reduction_mode_nv(
        self, command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coverage_reduction_mode_nv(command_buffer, coverage_reduction_mode)

    fn cmd_set_depth_clamp_range_ext(
        self,
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_clamp_range_ext(
            command_buffer, depth_clamp_mode, p_depth_clamp_range
        )


struct AttachmentFeedbackLoopDynamicState(Copyable, Movable):
    var _cmd_set_attachment_feedback_loop_enable_ext: fn(
        commandBuffer: CommandBuffer, aspectMask: ImageAspectFlags
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_attachment_feedback_loop_enable_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetAttachmentFeedbackLoopEnableEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_attachment_feedback_loop_enable_ext)]()[]

    fn cmd_set_attachment_feedback_loop_enable_ext(
        self, command_buffer: CommandBuffer, aspect_mask: ImageAspectFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_attachment_feedback_loop_enable_ext(command_buffer, aspect_mask)


struct DeviceGeneratedCommands(Copyable, Movable):
    var _get_generated_commands_memory_requirements_ext: fn(
        device: Device, pInfo: Ptr[GeneratedCommandsMemoryRequirementsInfoEXT], pMemoryRequirements: Ptr[MemoryRequirements2]
    )
    var _cmd_preprocess_generated_commands_ext: fn(
        commandBuffer: CommandBuffer, pGeneratedCommandsInfo: Ptr[GeneratedCommandsInfoEXT], stateCommandBuffer: CommandBuffer
    )
    var _cmd_execute_generated_commands_ext: fn(
        commandBuffer: CommandBuffer, isPreprocessed: Bool32, pGeneratedCommandsInfo: Ptr[GeneratedCommandsInfoEXT]
    )
    var _create_indirect_commands_layout_ext: fn(
        device: Device, pCreateInfo: Ptr[IndirectCommandsLayoutCreateInfoEXT], pAllocator: Ptr[AllocationCallbacks], pIndirectCommandsLayout: Ptr[IndirectCommandsLayoutEXT]
    ) -> Result
    var _destroy_indirect_commands_layout_ext: fn(
        device: Device, indirectCommandsLayout: IndirectCommandsLayoutEXT, pAllocator: Ptr[AllocationCallbacks]
    )
    var _create_indirect_execution_set_ext: fn(
        device: Device, pCreateInfo: Ptr[IndirectExecutionSetCreateInfoEXT], pAllocator: Ptr[AllocationCallbacks], pIndirectExecutionSet: Ptr[IndirectExecutionSetEXT]
    ) -> Result
    var _destroy_indirect_execution_set_ext: fn(
        device: Device, indirectExecutionSet: IndirectExecutionSetEXT, pAllocator: Ptr[AllocationCallbacks]
    )
    var _update_indirect_execution_set_pipeline_ext: fn(
        device: Device, indirectExecutionSet: IndirectExecutionSetEXT, executionSetWriteCount: UInt32, pExecutionSetWrites: Ptr[WriteIndirectExecutionSetPipelineEXT]
    )
    var _update_indirect_execution_set_shader_ext: fn(
        device: Device, indirectExecutionSet: IndirectExecutionSetEXT, executionSetWriteCount: UInt32, pExecutionSetWrites: Ptr[WriteIndirectExecutionSetShaderEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_generated_commands_memory_requirements_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetGeneratedCommandsMemoryRequirementsEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_generated_commands_memory_requirements_ext)]()[]
        self._cmd_preprocess_generated_commands_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdPreprocessGeneratedCommandsEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_preprocess_generated_commands_ext)]()[]
        self._cmd_execute_generated_commands_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdExecuteGeneratedCommandsEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_execute_generated_commands_ext)]()[]
        self._create_indirect_commands_layout_ext = Ptr(to=get_device_proc_addr(
            device, "vkCreateIndirectCommandsLayoutEXT".unsafe_ptr()
        )).bitcast[__type_of(self._create_indirect_commands_layout_ext)]()[]
        self._destroy_indirect_commands_layout_ext = Ptr(to=get_device_proc_addr(
            device, "vkDestroyIndirectCommandsLayoutEXT".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_indirect_commands_layout_ext)]()[]
        self._create_indirect_execution_set_ext = Ptr(to=get_device_proc_addr(
            device, "vkCreateIndirectExecutionSetEXT".unsafe_ptr()
        )).bitcast[__type_of(self._create_indirect_execution_set_ext)]()[]
        self._destroy_indirect_execution_set_ext = Ptr(to=get_device_proc_addr(
            device, "vkDestroyIndirectExecutionSetEXT".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_indirect_execution_set_ext)]()[]
        self._update_indirect_execution_set_pipeline_ext = Ptr(to=get_device_proc_addr(
            device, "vkUpdateIndirectExecutionSetPipelineEXT".unsafe_ptr()
        )).bitcast[__type_of(self._update_indirect_execution_set_pipeline_ext)]()[]
        self._update_indirect_execution_set_shader_ext = Ptr(to=get_device_proc_addr(
            device, "vkUpdateIndirectExecutionSetShaderEXT".unsafe_ptr()
        )).bitcast[__type_of(self._update_indirect_execution_set_shader_ext)]()[]

    fn get_generated_commands_memory_requirements_ext(
        self,
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoEXT,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_execute_generated_commands_ext(
            command_buffer, is_preprocessed, Ptr(to=generated_commands_info)
        )

    fn create_indirect_commands_layout_ext(
        self,
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut indirect_commands_layout: IndirectCommandsLayoutEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_indirect_commands_layout_ext(
            device, Ptr(to=create_info), p_allocator, Ptr(to=indirect_commands_layout)
        )

    fn destroy_indirect_commands_layout_ext(
        self,
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutEXT,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_indirect_commands_layout_ext(
            device, indirect_commands_layout, p_allocator
        )

    fn create_indirect_execution_set_ext(
        self,
        device: Device,
        create_info: IndirectExecutionSetCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks],
        mut indirect_execution_set: IndirectExecutionSetEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_indirect_execution_set_ext(
            device, Ptr(to=create_info), p_allocator, Ptr(to=indirect_execution_set)
        )

    fn destroy_indirect_execution_set_ext(
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_indirect_execution_set_ext(device, indirect_execution_set, p_allocator)

    fn update_indirect_execution_set_pipeline_ext(
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetPipelineEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._update_indirect_execution_set_pipeline_ext(
            device, indirect_execution_set, execution_set_write_count, p_execution_set_writes
        )

    fn update_indirect_execution_set_shader_ext(
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetShaderEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._update_indirect_execution_set_shader_ext(
            device, indirect_execution_set, execution_set_write_count, p_execution_set_writes
        )


struct DepthClampControl(Copyable, Movable):
    var _cmd_set_depth_clamp_range_ext: fn(
        commandBuffer: CommandBuffer, depthClampMode: DepthClampModeEXT, pDepthClampRange: Ptr[DepthClampRangeEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_depth_clamp_range_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthClampRangeEXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_depth_clamp_range_ext)]()[]

    fn cmd_set_depth_clamp_range_ext(
        self,
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_depth_clamp_range_ext(
            command_buffer, depth_clamp_mode, p_depth_clamp_range
        )


struct ExternalMemoryMetal(Copyable, Movable):
    var _get_memory_metal_handle_ext: fn(
        device: Device, pGetMetalHandleInfo: Ptr[MemoryGetMetalHandleInfoEXT], pHandle: Ptr[Ptr[NoneType]]
    ) -> Result
    var _get_memory_metal_handle_properties_ext: fn(
        device: Device, handleType: ExternalMemoryHandleTypeFlagBits, pHandle: Ptr[NoneType], pMemoryMetalHandleProperties: Ptr[MemoryMetalHandlePropertiesEXT]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_metal_handle_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryMetalHandleEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_metal_handle_ext)]()[]
        self._get_memory_metal_handle_properties_ext = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryMetalHandlePropertiesEXT".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_metal_handle_properties_ext)]()[]

    fn get_memory_metal_handle_ext(
        self,
        device: Device,
        get_metal_handle_info: MemoryGetMetalHandleInfoEXT,
        p_handle: Ptr[Ptr[NoneType]],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_metal_handle_ext(device, Ptr(to=get_metal_handle_info), p_handle)

    fn get_memory_metal_handle_properties_ext(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        handle: NoneType,
        mut memory_metal_handle_properties: MemoryMetalHandlePropertiesEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_metal_handle_properties_ext(
            device, handle_type, Ptr(to=handle), Ptr(to=memory_metal_handle_properties)
        )


struct FragmentDensityMapOffset(Copyable, Movable):
    var _cmd_end_rendering_2_ext: fn(
        commandBuffer: CommandBuffer, pRenderingEndInfo: Ptr[RenderingEndInfoEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_end_rendering_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRendering2EXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_end_rendering_2_ext)]()[]

    fn cmd_end_rendering_2_ext(
        self, command_buffer: CommandBuffer, p_rendering_end_info: Ptr[RenderingEndInfoEXT]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_end_rendering_2_ext(command_buffer, p_rendering_end_info)
