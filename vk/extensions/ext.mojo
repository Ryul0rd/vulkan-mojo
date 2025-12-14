from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct DebugReport(Copyable):    var _vk_create_debug_report_callback_ext: fn(
        instance: Instance,
        pCreateInfo: Ptr[DebugReportCallbackCreateInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pCallback: Ptr[DebugReportCallbackEXT, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_debug_report_callback_ext: fn(
        instance: Instance,
        callback: DebugReportCallbackEXT,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_debug_report_message_ext: fn(
        instance: Instance,
        flags: DebugReportFlagsEXT,
        objectType: DebugReportObjectTypeEXT,
        object: UInt64,
        location: UInt,
        messageCode: Int32,
        pLayerPrefix: CStringSlice[ImmutAnyOrigin],
        pMessage: CStringSlice[ImmutAnyOrigin],
    )


struct DebugMarker(Copyable):    var _vk_debug_marker_set_object_tag_ext: fn(
        device: Device, pTagInfo: Ptr[DebugMarkerObjectTagInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _vk_debug_marker_set_object_name_ext: fn(
        device: Device, pNameInfo: Ptr[DebugMarkerObjectNameInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _vk_cmd_debug_marker_begin_ext: fn(
        commandBuffer: CommandBuffer, pMarkerInfo: Ptr[DebugMarkerMarkerInfoEXT, ImmutAnyOrigin]
    )
    var _vk_cmd_debug_marker_end_ext: fn(commandBuffer: CommandBuffer)
    var _vk_cmd_debug_marker_insert_ext: fn(
        commandBuffer: CommandBuffer, pMarkerInfo: Ptr[DebugMarkerMarkerInfoEXT, ImmutAnyOrigin]
    )


struct TransformFeedback(Copyable):    var _vk_cmd_bind_transform_feedback_buffers_ext: fn(
        commandBuffer: CommandBuffer,
        firstBinding: UInt32,
        bindingCount: UInt32,
        pBuffers: Ptr[Buffer, ImmutAnyOrigin],
        pOffsets: Ptr[DeviceSize, ImmutAnyOrigin],
        pSizes: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _vk_cmd_begin_transform_feedback_ext: fn(
        commandBuffer: CommandBuffer,
        firstCounterBuffer: UInt32,
        counterBufferCount: UInt32,
        pCounterBuffers: Ptr[Buffer, ImmutAnyOrigin],
        pCounterBufferOffsets: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _vk_cmd_end_transform_feedback_ext: fn(
        commandBuffer: CommandBuffer,
        firstCounterBuffer: UInt32,
        counterBufferCount: UInt32,
        pCounterBuffers: Ptr[Buffer, ImmutAnyOrigin],
        pCounterBufferOffsets: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _vk_cmd_begin_query_indexed_ext: fn(
        commandBuffer: CommandBuffer,
        queryPool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
        index: UInt32,
    )
    var _vk_cmd_end_query_indexed_ext: fn(
        commandBuffer: CommandBuffer, queryPool: QueryPool, query: UInt32, index: UInt32
    )
    var _vk_cmd_draw_indirect_byte_count_ext: fn(
        commandBuffer: CommandBuffer,
        instanceCount: UInt32,
        firstInstance: UInt32,
        counterBuffer: Buffer,
        counterBufferOffset: DeviceSize,
        counterOffset: UInt32,
        vertexStride: UInt32,
    )


struct ConditionalRendering(Copyable):    var _vk_cmd_begin_conditional_rendering_ext: fn(
        commandBuffer: CommandBuffer,
        pConditionalRenderingBegin: Ptr[ConditionalRenderingBeginInfoEXT, ImmutAnyOrigin],
    )
    var _vk_cmd_end_conditional_rendering_ext: fn(commandBuffer: CommandBuffer)


struct DirectModeDisplay(Copyable):    var _vk_release_display_ext: fn(physicalDevice: PhysicalDevice, display: DisplayKHR) -> Result


struct AcquireXlibDisplay(Copyable):    var _vk_acquire_xlib_display_ext: fn(
        physicalDevice: PhysicalDevice, dpy: Ptr[Display, MutAnyOrigin], display: DisplayKHR
    ) -> Result
    var _vk_get_rand_r_output_display_ext: fn(
        physicalDevice: PhysicalDevice,
        dpy: Ptr[Display, MutAnyOrigin],
        rrOutput: RROutput,
        pDisplay: Ptr[DisplayKHR, MutAnyOrigin],
    ) -> Result


struct DisplaySurfaceCounter(Copyable):    var _vk_get_physical_device_surface_capabilities_2_ext: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pSurfaceCapabilities: Ptr[SurfaceCapabilities2EXT, MutAnyOrigin],
    ) -> Result


struct DisplayControl(Copyable):    var _vk_display_power_control_ext: fn(
        device: Device,
        display: DisplayKHR,
        pDisplayPowerInfo: Ptr[DisplayPowerInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _vk_register_device_event_ext: fn(
        device: Device,
        pDeviceEventInfo: Ptr[DeviceEventInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pFence: Ptr[Fence, MutAnyOrigin],
    ) -> Result
    var _vk_register_display_event_ext: fn(
        device: Device,
        display: DisplayKHR,
        pDisplayEventInfo: Ptr[DisplayEventInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pFence: Ptr[Fence, MutAnyOrigin],
    ) -> Result
    var _vk_get_swapchain_counter_ext: fn(
        device: Device,
        swapchain: SwapchainKHR,
        counter: SurfaceCounterFlagBitsEXT,
        pCounterValue: Ptr[UInt64, MutAnyOrigin],
    ) -> Result


struct DiscardRectangles(Copyable):    var _vk_cmd_set_discard_rectangle_ext: fn(
        commandBuffer: CommandBuffer,
        firstDiscardRectangle: UInt32,
        discardRectangleCount: UInt32,
        pDiscardRectangles: Ptr[Rect2D, ImmutAnyOrigin],
    )
    var _vk_cmd_set_discard_rectangle_enable_ext: fn(
        commandBuffer: CommandBuffer, discardRectangleEnable: Bool32
    )
    var _vk_cmd_set_discard_rectangle_mode_ext: fn(
        commandBuffer: CommandBuffer, discardRectangleMode: DiscardRectangleModeEXT
    )


struct HdrMetadata(Copyable):    var _vk_set_hdr_metadata_ext: fn(
        device: Device,
        swapchainCount: UInt32,
        pSwapchains: Ptr[SwapchainKHR, ImmutAnyOrigin],
        pMetadata: Ptr[HdrMetadataEXT, ImmutAnyOrigin],
    )


struct DebugUtils(Copyable):    var _vk_set_debug_utils_object_name_ext: fn(
        device: Device, pNameInfo: Ptr[DebugUtilsObjectNameInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _vk_set_debug_utils_object_tag_ext: fn(
        device: Device, pTagInfo: Ptr[DebugUtilsObjectTagInfoEXT, ImmutAnyOrigin]
    ) -> Result
    var _vk_queue_begin_debug_utils_label_ext: fn(
        queue: Queue, pLabelInfo: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _vk_queue_end_debug_utils_label_ext: fn(queue: Queue)
    var _vk_queue_insert_debug_utils_label_ext: fn(
        queue: Queue, pLabelInfo: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _vk_cmd_begin_debug_utils_label_ext: fn(
        commandBuffer: CommandBuffer, pLabelInfo: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _vk_cmd_end_debug_utils_label_ext: fn(commandBuffer: CommandBuffer)
    var _vk_cmd_insert_debug_utils_label_ext: fn(
        commandBuffer: CommandBuffer, pLabelInfo: Ptr[DebugUtilsLabelEXT, ImmutAnyOrigin]
    )
    var _vk_create_debug_utils_messenger_ext: fn(
        instance: Instance,
        pCreateInfo: Ptr[DebugUtilsMessengerCreateInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pMessenger: Ptr[DebugUtilsMessengerEXT, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_debug_utils_messenger_ext: fn(
        instance: Instance,
        messenger: DebugUtilsMessengerEXT,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_submit_debug_utils_message_ext: fn(
        instance: Instance,
        messageSeverity: DebugUtilsMessageSeverityFlagBitsEXT,
        messageTypes: DebugUtilsMessageTypeFlagsEXT,
        pCallbackData: Ptr[DebugUtilsMessengerCallbackDataEXT, ImmutAnyOrigin],
    )


struct SampleLocations(Copyable):    var _vk_cmd_set_sample_locations_ext: fn(
        commandBuffer: CommandBuffer,
        pSampleLocationsInfo: Ptr[SampleLocationsInfoEXT, ImmutAnyOrigin],
    )
    var _vk_get_physical_device_multisample_properties_ext: fn(
        physicalDevice: PhysicalDevice,
        samples: SampleCountFlagBits,
        pMultisampleProperties: Ptr[MultisamplePropertiesEXT, MutAnyOrigin],
    )


struct ImageDrmFormatModifier(Copyable):    var _vk_get_image_drm_format_modifier_properties_ext: fn(
        device: Device,
        image: Image,
        pProperties: Ptr[ImageDrmFormatModifierPropertiesEXT, MutAnyOrigin],
    ) -> Result


struct ValidationCache(Copyable):    var _vk_create_validation_cache_ext: fn(
        device: Device,
        pCreateInfo: Ptr[ValidationCacheCreateInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pValidationCache: Ptr[ValidationCacheEXT, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_validation_cache_ext: fn(
        device: Device,
        validationCache: ValidationCacheEXT,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_merge_validation_caches_ext: fn(
        device: Device,
        dstCache: ValidationCacheEXT,
        srcCacheCount: UInt32,
        pSrcCaches: Ptr[ValidationCacheEXT, ImmutAnyOrigin],
    ) -> Result
    var _vk_get_validation_cache_data_ext: fn(
        device: Device,
        validationCache: ValidationCacheEXT,
        pDataSize: Ptr[UInt, MutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result


struct ExternalMemoryHost(Copyable):    var _vk_get_memory_host_pointer_properties_ext: fn(
        device: Device,
        handleType: ExternalMemoryHandleTypeFlagBits,
        pHostPointer: Ptr[NoneType, ImmutAnyOrigin],
        pMemoryHostPointerProperties: Ptr[MemoryHostPointerPropertiesEXT, MutAnyOrigin],
    ) -> Result


struct CalibratedTimestamps(Copyable):    var _vk_get_physical_device_calibrateable_time_domains_khr: fn(
        physicalDevice: PhysicalDevice,
        pTimeDomainCount: Ptr[UInt32, MutAnyOrigin],
        pTimeDomains: Ptr[TimeDomainKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_calibrated_timestamps_khr: fn(
        device: Device,
        timestampCount: UInt32,
        pTimestampInfos: Ptr[CalibratedTimestampInfoKHR, ImmutAnyOrigin],
        pTimestamps: Ptr[UInt64, MutAnyOrigin],
        pMaxDeviation: Ptr[UInt64, MutAnyOrigin],
    ) -> Result


struct MetalSurface(Copyable):    var _vk_create_metal_surface_ext: fn(
        instance: Instance,
        pCreateInfo: Ptr[MetalSurfaceCreateInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result


struct BufferDeviceAddress(Copyable):    var _vk_get_buffer_device_address: fn(
        device: Device, pInfo: Ptr[BufferDeviceAddressInfo, ImmutAnyOrigin]
    ) -> DeviceAddress


struct ToolingInfo(Copyable):    var _vk_get_physical_device_tool_properties: fn(
        physicalDevice: PhysicalDevice,
        pToolCount: Ptr[UInt32, MutAnyOrigin],
        pToolProperties: Ptr[PhysicalDeviceToolProperties, MutAnyOrigin],
    ) -> Result


struct FullScreenExclusive(Copyable):    var _vk_get_physical_device_surface_present_modes_2_ext: fn(
        physicalDevice: PhysicalDevice,
        pSurfaceInfo: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        pPresentModeCount: Ptr[UInt32, MutAnyOrigin],
        pPresentModes: Ptr[PresentModeKHR, MutAnyOrigin],
    ) -> Result
    var _vk_acquire_full_screen_exclusive_mode_ext: fn(
        device: Device, swapchain: SwapchainKHR
    ) -> Result
    var _vk_release_full_screen_exclusive_mode_ext: fn(
        device: Device, swapchain: SwapchainKHR
    ) -> Result
    var _vk_get_device_group_surface_present_modes_2_ext: fn(
        device: Device,
        pSurfaceInfo: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        pModes: Ptr[DeviceGroupPresentModeFlagsKHR, MutAnyOrigin],
    ) -> Result


struct HeadlessSurface(Copyable):    var _vk_create_headless_surface_ext: fn(
        instance: Instance,
        pCreateInfo: Ptr[HeadlessSurfaceCreateInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result


struct LineRasterization(Copyable):    var _vk_cmd_set_line_stipple: fn(
        commandBuffer: CommandBuffer, lineStippleFactor: UInt32, lineStipplePattern: UInt16
    )


struct HostQueryReset(Copyable):    var _vk_reset_query_pool: fn(
        device: Device, queryPool: QueryPool, firstQuery: UInt32, queryCount: UInt32
    )


struct ExtendedDynamicState(Copyable):    var _vk_cmd_set_cull_mode: fn(commandBuffer: CommandBuffer, cullMode: CullModeFlags)
    var _vk_cmd_set_front_face: fn(commandBuffer: CommandBuffer, frontFace: FrontFace)
    var _vk_cmd_set_primitive_topology: fn(
        commandBuffer: CommandBuffer, primitiveTopology: PrimitiveTopology
    )
    var _vk_cmd_set_viewport_with_count: fn(
        commandBuffer: CommandBuffer,
        viewportCount: UInt32,
        pViewports: Ptr[Viewport, ImmutAnyOrigin],
    )
    var _vk_cmd_set_scissor_with_count: fn(
        commandBuffer: CommandBuffer, scissorCount: UInt32, pScissors: Ptr[Rect2D, ImmutAnyOrigin]
    )
    var _vk_cmd_bind_vertex_buffers_2: fn(
        commandBuffer: CommandBuffer,
        firstBinding: UInt32,
        bindingCount: UInt32,
        pBuffers: Ptr[Buffer, ImmutAnyOrigin],
        pOffsets: Ptr[DeviceSize, ImmutAnyOrigin],
        pSizes: Ptr[DeviceSize, ImmutAnyOrigin],
        pStrides: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _vk_cmd_set_depth_test_enable: fn(commandBuffer: CommandBuffer, depthTestEnable: Bool32)
    var _vk_cmd_set_depth_write_enable: fn(commandBuffer: CommandBuffer, depthWriteEnable: Bool32)
    var _vk_cmd_set_depth_compare_op: fn(commandBuffer: CommandBuffer, depthCompareOp: CompareOp)
    var _vk_cmd_set_depth_bounds_test_enable: fn(
        commandBuffer: CommandBuffer, depthBoundsTestEnable: Bool32
    )
    var _vk_cmd_set_stencil_test_enable: fn(
        commandBuffer: CommandBuffer, stencilTestEnable: Bool32
    )
    var _vk_cmd_set_stencil_op: fn(
        commandBuffer: CommandBuffer,
        faceMask: StencilFaceFlags,
        failOp: StencilOp,
        passOp: StencilOp,
        depthFailOp: StencilOp,
        compareOp: CompareOp,
    )


struct HostImageCopy(Copyable):    var _vk_copy_memory_to_image: fn(
        device: Device, pCopyMemoryToImageInfo: Ptr[CopyMemoryToImageInfo, ImmutAnyOrigin]
    ) -> Result
    var _vk_copy_image_to_memory: fn(
        device: Device, pCopyImageToMemoryInfo: Ptr[CopyImageToMemoryInfo, ImmutAnyOrigin]
    ) -> Result
    var _vk_copy_image_to_image: fn(
        device: Device, pCopyImageToImageInfo: Ptr[CopyImageToImageInfo, ImmutAnyOrigin]
    ) -> Result
    var _vk_transition_image_layout: fn(
        device: Device,
        transitionCount: UInt32,
        pTransitions: Ptr[HostImageLayoutTransitionInfo, ImmutAnyOrigin],
    ) -> Result
    var _vk_get_image_subresource_layout_2: fn(
        device: Device,
        image: Image,
        pSubresource: Ptr[ImageSubresource2, ImmutAnyOrigin],
        pLayout: Ptr[SubresourceLayout2, MutAnyOrigin],
    )


struct SwapchainMaintenance1(Copyable):    var _vk_release_swapchain_images_khr: fn(
        device: Device, pReleaseInfo: Ptr[ReleaseSwapchainImagesInfoKHR, ImmutAnyOrigin]
    ) -> Result


struct DepthBiasControl(Copyable):    var _vk_cmd_set_depth_bias_2_ext: fn(
        commandBuffer: CommandBuffer, pDepthBiasInfo: Ptr[DepthBiasInfoEXT, ImmutAnyOrigin]
    )


struct AcquireDrmDisplay(Copyable):    var _vk_acquire_drm_display_ext: fn(
        physicalDevice: PhysicalDevice, drmFd: Int32, display: DisplayKHR
    ) -> Result
    var _vk_get_drm_display_ext: fn(
        physicalDevice: PhysicalDevice,
        drmFd: Int32,
        connectorId: UInt32,
        display: Ptr[DisplayKHR, MutAnyOrigin],
    ) -> Result


struct PrivateData(Copyable):    var _vk_create_private_data_slot: fn(
        device: Device,
        pCreateInfo: Ptr[PrivateDataSlotCreateInfo, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pPrivateDataSlot: Ptr[PrivateDataSlot, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_private_data_slot: fn(
        device: Device,
        privateDataSlot: PrivateDataSlot,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_set_private_data: fn(
        device: Device,
        objectType: ObjectType,
        objectHandle: UInt64,
        privateDataSlot: PrivateDataSlot,
        data: UInt64,
    ) -> Result
    var _vk_get_private_data: fn(
        device: Device,
        objectType: ObjectType,
        objectHandle: UInt64,
        privateDataSlot: PrivateDataSlot,
        pData: Ptr[UInt64, MutAnyOrigin],
    )


struct MetalObjects(Copyable):    var _vk_export_metal_objects_ext: fn(
        device: Device, pMetalObjectsInfo: Ptr[ExportMetalObjectsInfoEXT, MutAnyOrigin]
    )


struct DescriptorBuffer(Copyable):    var _vk_get_descriptor_set_layout_size_ext: fn(
        device: Device,
        layout: DescriptorSetLayout,
        pLayoutSizeInBytes: Ptr[DeviceSize, MutAnyOrigin],
    )
    var _vk_get_descriptor_set_layout_binding_offset_ext: fn(
        device: Device,
        layout: DescriptorSetLayout,
        binding: UInt32,
        pOffset: Ptr[DeviceSize, MutAnyOrigin],
    )
    var _vk_get_descriptor_ext: fn(
        device: Device,
        pDescriptorInfo: Ptr[DescriptorGetInfoEXT, ImmutAnyOrigin],
        dataSize: UInt,
        pDescriptor: Ptr[NoneType, MutAnyOrigin],
    )
    var _vk_cmd_bind_descriptor_buffers_ext: fn(
        commandBuffer: CommandBuffer,
        bufferCount: UInt32,
        pBindingInfos: Ptr[DescriptorBufferBindingInfoEXT, ImmutAnyOrigin],
    )
    var _vk_cmd_set_descriptor_buffer_offsets_ext: fn(
        commandBuffer: CommandBuffer,
        pipelineBindPoint: PipelineBindPoint,
        layout: PipelineLayout,
        firstSet: UInt32,
        setCount: UInt32,
        pBufferIndices: Ptr[UInt32, ImmutAnyOrigin],
        pOffsets: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _vk_cmd_bind_descriptor_buffer_embedded_samplers_ext: fn(
        commandBuffer: CommandBuffer,
        pipelineBindPoint: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
    )
    var _vk_get_buffer_opaque_capture_descriptor_data_ext: fn(
        device: Device,
        pInfo: Ptr[BufferCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_get_image_opaque_capture_descriptor_data_ext: fn(
        device: Device,
        pInfo: Ptr[ImageCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_get_image_view_opaque_capture_descriptor_data_ext: fn(
        device: Device,
        pInfo: Ptr[ImageViewCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_get_sampler_opaque_capture_descriptor_data_ext: fn(
        device: Device,
        pInfo: Ptr[SamplerCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_get_acceleration_structure_opaque_capture_descriptor_data_ext: fn(
        device: Device,
        pInfo: Ptr[AccelerationStructureCaptureDescriptorDataInfoEXT, ImmutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result


struct MeshShader(Copyable):    var _vk_cmd_draw_mesh_tasks_ext: fn(
        commandBuffer: CommandBuffer, groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32
    )
    var _vk_cmd_draw_mesh_tasks_indirect_ext: fn(
        commandBuffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        drawCount: UInt32,
        stride: UInt32,
    )
    var _vk_cmd_draw_mesh_tasks_indirect_count_ext: fn(
        commandBuffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        countBuffer: Buffer,
        countBufferOffset: DeviceSize,
        maxDrawCount: UInt32,
        stride: UInt32,
    )


struct ImageCompressionControl(Copyable):    var _vk_get_image_subresource_layout_2: fn(
        device: Device,
        image: Image,
        pSubresource: Ptr[ImageSubresource2, ImmutAnyOrigin],
        pLayout: Ptr[SubresourceLayout2, MutAnyOrigin],
    )


struct DeviceFault(Copyable):    var _vk_get_device_fault_info_ext: fn(
        device: Device,
        pFaultCounts: Ptr[DeviceFaultCountsEXT, MutAnyOrigin],
        pFaultInfo: Ptr[DeviceFaultInfoEXT, MutAnyOrigin],
    ) -> Result


struct DirectfbSurface(Copyable):    var _vk_create_direct_fb_surface_ext: fn(
        instance: Instance,
        pCreateInfo: Ptr[DirectFBSurfaceCreateInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_direct_fb_presentation_support_ext: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32, dfb: Ptr[IDirectFB, MutAnyOrigin]
    ) -> Bool32


struct VertexInputDynamicState(Copyable):    var _vk_cmd_set_vertex_input_ext: fn(
        commandBuffer: CommandBuffer,
        vertexBindingDescriptionCount: UInt32,
        pVertexBindingDescriptions: Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin],
        vertexAttributeDescriptionCount: UInt32,
        pVertexAttributeDescriptions: Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin],
    )


struct PipelineProperties(Copyable):    var _vk_get_pipeline_properties_ext: fn(
        device: Device,
        pPipelineInfo: Ptr[PipelineInfoEXT, ImmutAnyOrigin],
        pPipelineProperties: Ptr[BaseOutStructure, MutAnyOrigin],
    ) -> Result


struct ExtendedDynamicState2(Copyable):    var _vk_cmd_set_patch_control_points_ext: fn(
        commandBuffer: CommandBuffer, patchControlPoints: UInt32
    )
    var _vk_cmd_set_rasterizer_discard_enable: fn(
        commandBuffer: CommandBuffer, rasterizerDiscardEnable: Bool32
    )
    var _vk_cmd_set_depth_bias_enable: fn(commandBuffer: CommandBuffer, depthBiasEnable: Bool32)
    var _vk_cmd_set_logic_op_ext: fn(commandBuffer: CommandBuffer, logicOp: LogicOp)
    var _vk_cmd_set_primitive_restart_enable: fn(
        commandBuffer: CommandBuffer, primitiveRestartEnable: Bool32
    )


struct ColorWriteEnable(Copyable):    var _vk_cmd_set_color_write_enable_ext: fn(
        commandBuffer: CommandBuffer,
        attachmentCount: UInt32,
        pColorWriteEnables: Ptr[Bool32, ImmutAnyOrigin],
    )


struct MultiDraw(Copyable):    var _vk_cmd_draw_multi_ext: fn(
        commandBuffer: CommandBuffer,
        drawCount: UInt32,
        pVertexInfo: Ptr[MultiDrawInfoEXT, ImmutAnyOrigin],
        instanceCount: UInt32,
        firstInstance: UInt32,
        stride: UInt32,
    )
    var _vk_cmd_draw_multi_indexed_ext: fn(
        commandBuffer: CommandBuffer,
        drawCount: UInt32,
        pIndexInfo: Ptr[MultiDrawIndexedInfoEXT, ImmutAnyOrigin],
        instanceCount: UInt32,
        firstInstance: UInt32,
        stride: UInt32,
        pVertexOffset: Ptr[Int32, ImmutAnyOrigin],
    )


struct OpacityMicromap(Copyable):    var _vk_create_micromap_ext: fn(
        device: Device,
        pCreateInfo: Ptr[MicromapCreateInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pMicromap: Ptr[MicromapEXT, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_micromap_ext: fn(
        device: Device, micromap: MicromapEXT, pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _vk_cmd_build_micromaps_ext: fn(
        commandBuffer: CommandBuffer,
        infoCount: UInt32,
        pInfos: Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin],
    )
    var _vk_build_micromaps_ext: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        infoCount: UInt32,
        pInfos: Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _vk_copy_micromap_ext: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pInfo: Ptr[CopyMicromapInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _vk_copy_micromap_to_memory_ext: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pInfo: Ptr[CopyMicromapToMemoryInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _vk_copy_memory_to_micromap_ext: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pInfo: Ptr[CopyMemoryToMicromapInfoEXT, ImmutAnyOrigin],
    ) -> Result
    var _vk_write_micromaps_properties_ext: fn(
        device: Device,
        micromapCount: UInt32,
        pMicromaps: Ptr[MicromapEXT, ImmutAnyOrigin],
        queryType: QueryType,
        dataSize: UInt,
        pData: Ptr[NoneType, MutAnyOrigin],
        stride: UInt,
    ) -> Result
    var _vk_cmd_copy_micromap_ext: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[CopyMicromapInfoEXT, ImmutAnyOrigin]
    )
    var _vk_cmd_copy_micromap_to_memory_ext: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[CopyMicromapToMemoryInfoEXT, ImmutAnyOrigin]
    )
    var _vk_cmd_copy_memory_to_micromap_ext: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[CopyMemoryToMicromapInfoEXT, ImmutAnyOrigin]
    )
    var _vk_cmd_write_micromaps_properties_ext: fn(
        commandBuffer: CommandBuffer,
        micromapCount: UInt32,
        pMicromaps: Ptr[MicromapEXT, ImmutAnyOrigin],
        queryType: QueryType,
        queryPool: QueryPool,
        firstQuery: UInt32,
    )
    var _vk_get_device_micromap_compatibility_ext: fn(
        device: Device,
        pVersionInfo: Ptr[MicromapVersionInfoEXT, ImmutAnyOrigin],
        pCompatibility: Ptr[AccelerationStructureCompatibilityKHR, MutAnyOrigin],
    )
    var _vk_get_micromap_build_sizes_ext: fn(
        device: Device,
        buildType: AccelerationStructureBuildTypeKHR,
        pBuildInfo: Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin],
        pSizeInfo: Ptr[MicromapBuildSizesInfoEXT, MutAnyOrigin],
    )


struct PageableDeviceLocalMemory(Copyable):    var _vk_set_device_memory_priority_ext: fn(
        device: Device, memory: DeviceMemory, priority: Float32
    )


struct ExtendedDynamicState3(Copyable):    var _vk_cmd_set_depth_clamp_enable_ext: fn(
        commandBuffer: CommandBuffer, depthClampEnable: Bool32
    )
    var _vk_cmd_set_polygon_mode_ext: fn(commandBuffer: CommandBuffer, polygonMode: PolygonMode)
    var _vk_cmd_set_rasterization_samples_ext: fn(
        commandBuffer: CommandBuffer, rasterizationSamples: SampleCountFlagBits
    )
    var _vk_cmd_set_sample_mask_ext: fn(
        commandBuffer: CommandBuffer,
        samples: SampleCountFlagBits,
        pSampleMask: Ptr[SampleMask, ImmutAnyOrigin],
    )
    var _vk_cmd_set_alpha_to_coverage_enable_ext: fn(
        commandBuffer: CommandBuffer, alphaToCoverageEnable: Bool32
    )
    var _vk_cmd_set_alpha_to_one_enable_ext: fn(
        commandBuffer: CommandBuffer, alphaToOneEnable: Bool32
    )
    var _vk_cmd_set_logic_op_enable_ext: fn(commandBuffer: CommandBuffer, logicOpEnable: Bool32)
    var _vk_cmd_set_color_blend_enable_ext: fn(
        commandBuffer: CommandBuffer,
        firstAttachment: UInt32,
        attachmentCount: UInt32,
        pColorBlendEnables: Ptr[Bool32, ImmutAnyOrigin],
    )
    var _vk_cmd_set_color_blend_equation_ext: fn(
        commandBuffer: CommandBuffer,
        firstAttachment: UInt32,
        attachmentCount: UInt32,
        pColorBlendEquations: Ptr[ColorBlendEquationEXT, ImmutAnyOrigin],
    )
    var _vk_cmd_set_color_write_mask_ext: fn(
        commandBuffer: CommandBuffer,
        firstAttachment: UInt32,
        attachmentCount: UInt32,
        pColorWriteMasks: Ptr[ColorComponentFlags, ImmutAnyOrigin],
    )
    var _vk_cmd_set_tessellation_domain_origin_ext: fn(
        commandBuffer: CommandBuffer, domainOrigin: TessellationDomainOrigin
    )
    var _vk_cmd_set_rasterization_stream_ext: fn(
        commandBuffer: CommandBuffer, rasterizationStream: UInt32
    )
    var _vk_cmd_set_conservative_rasterization_mode_ext: fn(
        commandBuffer: CommandBuffer,
        conservativeRasterizationMode: ConservativeRasterizationModeEXT,
    )
    var _vk_cmd_set_extra_primitive_overestimation_size_ext: fn(
        commandBuffer: CommandBuffer, extraPrimitiveOverestimationSize: Float32
    )
    var _vk_cmd_set_depth_clip_enable_ext: fn(
        commandBuffer: CommandBuffer, depthClipEnable: Bool32
    )
    var _vk_cmd_set_sample_locations_enable_ext: fn(
        commandBuffer: CommandBuffer, sampleLocationsEnable: Bool32
    )
    var _vk_cmd_set_color_blend_advanced_ext: fn(
        commandBuffer: CommandBuffer,
        firstAttachment: UInt32,
        attachmentCount: UInt32,
        pColorBlendAdvanced: Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin],
    )
    var _vk_cmd_set_provoking_vertex_mode_ext: fn(
        commandBuffer: CommandBuffer, provokingVertexMode: ProvokingVertexModeEXT
    )
    var _vk_cmd_set_line_rasterization_mode_ext: fn(
        commandBuffer: CommandBuffer, lineRasterizationMode: LineRasterizationModeEXT
    )
    var _vk_cmd_set_line_stipple_enable_ext: fn(
        commandBuffer: CommandBuffer, stippledLineEnable: Bool32
    )
    var _vk_cmd_set_depth_clip_negative_one_to_one_ext: fn(
        commandBuffer: CommandBuffer, negativeOneToOne: Bool32
    )
    var _vk_cmd_set_viewport_w_scaling_enable_nv: fn(
        commandBuffer: CommandBuffer, viewportWScalingEnable: Bool32
    )
    var _vk_cmd_set_viewport_swizzle_nv: fn(
        commandBuffer: CommandBuffer,
        firstViewport: UInt32,
        viewportCount: UInt32,
        pViewportSwizzles: Ptr[ViewportSwizzleNV, ImmutAnyOrigin],
    )
    var _vk_cmd_set_coverage_to_color_enable_nv: fn(
        commandBuffer: CommandBuffer, coverageToColorEnable: Bool32
    )
    var _vk_cmd_set_coverage_to_color_location_nv: fn(
        commandBuffer: CommandBuffer, coverageToColorLocation: UInt32
    )
    var _vk_cmd_set_coverage_modulation_mode_nv: fn(
        commandBuffer: CommandBuffer, coverageModulationMode: CoverageModulationModeNV
    )
    var _vk_cmd_set_coverage_modulation_table_enable_nv: fn(
        commandBuffer: CommandBuffer, coverageModulationTableEnable: Bool32
    )
    var _vk_cmd_set_coverage_modulation_table_nv: fn(
        commandBuffer: CommandBuffer,
        coverageModulationTableCount: UInt32,
        pCoverageModulationTable: Ptr[Float32, ImmutAnyOrigin],
    )
    var _vk_cmd_set_shading_rate_image_enable_nv: fn(
        commandBuffer: CommandBuffer, shadingRateImageEnable: Bool32
    )
    var _vk_cmd_set_representative_fragment_test_enable_nv: fn(
        commandBuffer: CommandBuffer, representativeFragmentTestEnable: Bool32
    )
    var _vk_cmd_set_coverage_reduction_mode_nv: fn(
        commandBuffer: CommandBuffer, coverageReductionMode: CoverageReductionModeNV
    )


struct ShaderModuleIdentifier(Copyable):    var _vk_get_shader_module_identifier_ext: fn(
        device: Device,
        shaderModule: ShaderModule,
        pIdentifier: Ptr[ShaderModuleIdentifierEXT, MutAnyOrigin],
    )
    var _vk_get_shader_module_create_info_identifier_ext: fn(
        device: Device,
        pCreateInfo: Ptr[ShaderModuleCreateInfo, ImmutAnyOrigin],
        pIdentifier: Ptr[ShaderModuleIdentifierEXT, MutAnyOrigin],
    )


struct ShaderObject(Copyable):    var _vk_create_shaders_ext: fn(
        device: Device,
        createInfoCount: UInt32,
        pCreateInfos: Ptr[ShaderCreateInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pShaders: Ptr[ShaderEXT, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_shader_ext: fn(
        device: Device, shader: ShaderEXT, pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _vk_get_shader_binary_data_ext: fn(
        device: Device,
        shader: ShaderEXT,
        pDataSize: Ptr[UInt, MutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_cmd_bind_shaders_ext: fn(
        commandBuffer: CommandBuffer,
        stageCount: UInt32,
        pStages: Ptr[ShaderStageFlagBits, ImmutAnyOrigin],
        pShaders: Ptr[ShaderEXT, ImmutAnyOrigin],
    )
    var _vk_cmd_set_cull_mode: fn(commandBuffer: CommandBuffer, cullMode: CullModeFlags)
    var _vk_cmd_set_front_face: fn(commandBuffer: CommandBuffer, frontFace: FrontFace)
    var _vk_cmd_set_primitive_topology: fn(
        commandBuffer: CommandBuffer, primitiveTopology: PrimitiveTopology
    )
    var _vk_cmd_set_viewport_with_count: fn(
        commandBuffer: CommandBuffer,
        viewportCount: UInt32,
        pViewports: Ptr[Viewport, ImmutAnyOrigin],
    )
    var _vk_cmd_set_scissor_with_count: fn(
        commandBuffer: CommandBuffer, scissorCount: UInt32, pScissors: Ptr[Rect2D, ImmutAnyOrigin]
    )
    var _vk_cmd_bind_vertex_buffers_2: fn(
        commandBuffer: CommandBuffer,
        firstBinding: UInt32,
        bindingCount: UInt32,
        pBuffers: Ptr[Buffer, ImmutAnyOrigin],
        pOffsets: Ptr[DeviceSize, ImmutAnyOrigin],
        pSizes: Ptr[DeviceSize, ImmutAnyOrigin],
        pStrides: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var _vk_cmd_set_depth_test_enable: fn(commandBuffer: CommandBuffer, depthTestEnable: Bool32)
    var _vk_cmd_set_depth_write_enable: fn(commandBuffer: CommandBuffer, depthWriteEnable: Bool32)
    var _vk_cmd_set_depth_compare_op: fn(commandBuffer: CommandBuffer, depthCompareOp: CompareOp)
    var _vk_cmd_set_depth_bounds_test_enable: fn(
        commandBuffer: CommandBuffer, depthBoundsTestEnable: Bool32
    )
    var _vk_cmd_set_stencil_test_enable: fn(
        commandBuffer: CommandBuffer, stencilTestEnable: Bool32
    )
    var _vk_cmd_set_stencil_op: fn(
        commandBuffer: CommandBuffer,
        faceMask: StencilFaceFlags,
        failOp: StencilOp,
        passOp: StencilOp,
        depthFailOp: StencilOp,
        compareOp: CompareOp,
    )
    var _vk_cmd_set_vertex_input_ext: fn(
        commandBuffer: CommandBuffer,
        vertexBindingDescriptionCount: UInt32,
        pVertexBindingDescriptions: Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin],
        vertexAttributeDescriptionCount: UInt32,
        pVertexAttributeDescriptions: Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin],
    )
    var _vk_cmd_set_patch_control_points_ext: fn(
        commandBuffer: CommandBuffer, patchControlPoints: UInt32
    )
    var _vk_cmd_set_rasterizer_discard_enable: fn(
        commandBuffer: CommandBuffer, rasterizerDiscardEnable: Bool32
    )
    var _vk_cmd_set_depth_bias_enable: fn(commandBuffer: CommandBuffer, depthBiasEnable: Bool32)
    var _vk_cmd_set_logic_op_ext: fn(commandBuffer: CommandBuffer, logicOp: LogicOp)
    var _vk_cmd_set_primitive_restart_enable: fn(
        commandBuffer: CommandBuffer, primitiveRestartEnable: Bool32
    )
    var _vk_cmd_set_tessellation_domain_origin_ext: fn(
        commandBuffer: CommandBuffer, domainOrigin: TessellationDomainOrigin
    )
    var _vk_cmd_set_depth_clamp_enable_ext: fn(
        commandBuffer: CommandBuffer, depthClampEnable: Bool32
    )
    var _vk_cmd_set_polygon_mode_ext: fn(commandBuffer: CommandBuffer, polygonMode: PolygonMode)
    var _vk_cmd_set_rasterization_samples_ext: fn(
        commandBuffer: CommandBuffer, rasterizationSamples: SampleCountFlagBits
    )
    var _vk_cmd_set_sample_mask_ext: fn(
        commandBuffer: CommandBuffer,
        samples: SampleCountFlagBits,
        pSampleMask: Ptr[SampleMask, ImmutAnyOrigin],
    )
    var _vk_cmd_set_alpha_to_coverage_enable_ext: fn(
        commandBuffer: CommandBuffer, alphaToCoverageEnable: Bool32
    )
    var _vk_cmd_set_alpha_to_one_enable_ext: fn(
        commandBuffer: CommandBuffer, alphaToOneEnable: Bool32
    )
    var _vk_cmd_set_logic_op_enable_ext: fn(commandBuffer: CommandBuffer, logicOpEnable: Bool32)
    var _vk_cmd_set_color_blend_enable_ext: fn(
        commandBuffer: CommandBuffer,
        firstAttachment: UInt32,
        attachmentCount: UInt32,
        pColorBlendEnables: Ptr[Bool32, ImmutAnyOrigin],
    )
    var _vk_cmd_set_color_blend_equation_ext: fn(
        commandBuffer: CommandBuffer,
        firstAttachment: UInt32,
        attachmentCount: UInt32,
        pColorBlendEquations: Ptr[ColorBlendEquationEXT, ImmutAnyOrigin],
    )
    var _vk_cmd_set_color_write_mask_ext: fn(
        commandBuffer: CommandBuffer,
        firstAttachment: UInt32,
        attachmentCount: UInt32,
        pColorWriteMasks: Ptr[ColorComponentFlags, ImmutAnyOrigin],
    )
    var _vk_cmd_set_rasterization_stream_ext: fn(
        commandBuffer: CommandBuffer, rasterizationStream: UInt32
    )
    var _vk_cmd_set_conservative_rasterization_mode_ext: fn(
        commandBuffer: CommandBuffer,
        conservativeRasterizationMode: ConservativeRasterizationModeEXT,
    )
    var _vk_cmd_set_extra_primitive_overestimation_size_ext: fn(
        commandBuffer: CommandBuffer, extraPrimitiveOverestimationSize: Float32
    )
    var _vk_cmd_set_depth_clip_enable_ext: fn(
        commandBuffer: CommandBuffer, depthClipEnable: Bool32
    )
    var _vk_cmd_set_sample_locations_enable_ext: fn(
        commandBuffer: CommandBuffer, sampleLocationsEnable: Bool32
    )
    var _vk_cmd_set_color_blend_advanced_ext: fn(
        commandBuffer: CommandBuffer,
        firstAttachment: UInt32,
        attachmentCount: UInt32,
        pColorBlendAdvanced: Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin],
    )
    var _vk_cmd_set_provoking_vertex_mode_ext: fn(
        commandBuffer: CommandBuffer, provokingVertexMode: ProvokingVertexModeEXT
    )
    var _vk_cmd_set_line_rasterization_mode_ext: fn(
        commandBuffer: CommandBuffer, lineRasterizationMode: LineRasterizationModeEXT
    )
    var _vk_cmd_set_line_stipple_enable_ext: fn(
        commandBuffer: CommandBuffer, stippledLineEnable: Bool32
    )
    var _vk_cmd_set_depth_clip_negative_one_to_one_ext: fn(
        commandBuffer: CommandBuffer, negativeOneToOne: Bool32
    )
    var _vk_cmd_set_viewport_w_scaling_enable_nv: fn(
        commandBuffer: CommandBuffer, viewportWScalingEnable: Bool32
    )
    var _vk_cmd_set_viewport_swizzle_nv: fn(
        commandBuffer: CommandBuffer,
        firstViewport: UInt32,
        viewportCount: UInt32,
        pViewportSwizzles: Ptr[ViewportSwizzleNV, ImmutAnyOrigin],
    )
    var _vk_cmd_set_coverage_to_color_enable_nv: fn(
        commandBuffer: CommandBuffer, coverageToColorEnable: Bool32
    )
    var _vk_cmd_set_coverage_to_color_location_nv: fn(
        commandBuffer: CommandBuffer, coverageToColorLocation: UInt32
    )
    var _vk_cmd_set_coverage_modulation_mode_nv: fn(
        commandBuffer: CommandBuffer, coverageModulationMode: CoverageModulationModeNV
    )
    var _vk_cmd_set_coverage_modulation_table_enable_nv: fn(
        commandBuffer: CommandBuffer, coverageModulationTableEnable: Bool32
    )
    var _vk_cmd_set_coverage_modulation_table_nv: fn(
        commandBuffer: CommandBuffer,
        coverageModulationTableCount: UInt32,
        pCoverageModulationTable: Ptr[Float32, ImmutAnyOrigin],
    )
    var _vk_cmd_set_shading_rate_image_enable_nv: fn(
        commandBuffer: CommandBuffer, shadingRateImageEnable: Bool32
    )
    var _vk_cmd_set_representative_fragment_test_enable_nv: fn(
        commandBuffer: CommandBuffer, representativeFragmentTestEnable: Bool32
    )
    var _vk_cmd_set_coverage_reduction_mode_nv: fn(
        commandBuffer: CommandBuffer, coverageReductionMode: CoverageReductionModeNV
    )
    var _vk_cmd_set_depth_clamp_range_ext: fn(
        commandBuffer: CommandBuffer,
        depthClampMode: DepthClampModeEXT,
        pDepthClampRange: Ptr[DepthClampRangeEXT, ImmutAnyOrigin],
    )


struct AttachmentFeedbackLoopDynamicState(Copyable):    var _vk_cmd_set_attachment_feedback_loop_enable_ext: fn(
        commandBuffer: CommandBuffer, aspectMask: ImageAspectFlags
    )


struct DeviceGeneratedCommands(Copyable):    var _vk_get_generated_commands_memory_requirements_ext: fn(
        device: Device,
        pInfo: Ptr[GeneratedCommandsMemoryRequirementsInfoEXT, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _vk_cmd_preprocess_generated_commands_ext: fn(
        commandBuffer: CommandBuffer,
        pGeneratedCommandsInfo: Ptr[GeneratedCommandsInfoEXT, ImmutAnyOrigin],
        stateCommandBuffer: CommandBuffer,
    )
    var _vk_cmd_execute_generated_commands_ext: fn(
        commandBuffer: CommandBuffer,
        isPreprocessed: Bool32,
        pGeneratedCommandsInfo: Ptr[GeneratedCommandsInfoEXT, ImmutAnyOrigin],
    )
    var _vk_create_indirect_commands_layout_ext: fn(
        device: Device,
        pCreateInfo: Ptr[IndirectCommandsLayoutCreateInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pIndirectCommandsLayout: Ptr[IndirectCommandsLayoutEXT, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_indirect_commands_layout_ext: fn(
        device: Device,
        indirectCommandsLayout: IndirectCommandsLayoutEXT,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_create_indirect_execution_set_ext: fn(
        device: Device,
        pCreateInfo: Ptr[IndirectExecutionSetCreateInfoEXT, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pIndirectExecutionSet: Ptr[IndirectExecutionSetEXT, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_indirect_execution_set_ext: fn(
        device: Device,
        indirectExecutionSet: IndirectExecutionSetEXT,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_update_indirect_execution_set_pipeline_ext: fn(
        device: Device,
        indirectExecutionSet: IndirectExecutionSetEXT,
        executionSetWriteCount: UInt32,
        pExecutionSetWrites: Ptr[WriteIndirectExecutionSetPipelineEXT, ImmutAnyOrigin],
    )
    var _vk_update_indirect_execution_set_shader_ext: fn(
        device: Device,
        indirectExecutionSet: IndirectExecutionSetEXT,
        executionSetWriteCount: UInt32,
        pExecutionSetWrites: Ptr[WriteIndirectExecutionSetShaderEXT, ImmutAnyOrigin],
    )


struct DepthClampControl(Copyable):    var _vk_cmd_set_depth_clamp_range_ext: fn(
        commandBuffer: CommandBuffer,
        depthClampMode: DepthClampModeEXT,
        pDepthClampRange: Ptr[DepthClampRangeEXT, ImmutAnyOrigin],
    )


struct ExternalMemoryMetal(Copyable):    var _vk_get_memory_metal_handle_ext: fn(
        device: Device,
        pGetMetalHandleInfo: Ptr[MemoryGetMetalHandleInfoEXT, ImmutAnyOrigin],
        pHandle: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    ) -> Result
    var _vk_get_memory_metal_handle_properties_ext: fn(
        device: Device,
        handleType: ExternalMemoryHandleTypeFlagBits,
        pHandle: Ptr[NoneType, ImmutAnyOrigin],
        pMemoryMetalHandleProperties: Ptr[MemoryMetalHandlePropertiesEXT, MutAnyOrigin],
    ) -> Result


struct FragmentDensityMapOffset(Copyable):    var _vk_cmd_end_rendering_2_ext: fn(
        commandBuffer: CommandBuffer, pRenderingEndInfo: Ptr[RenderingEndInfoEXT, ImmutAnyOrigin]
    )
