from vk.core_functions import GlobalFunctions


struct Surface(Copyable):    var _vk_destroy_surface_khr: fn(
        instance: Instance,
        surface: SurfaceKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_get_physical_device_surface_support_khr: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        surface: SurfaceKHR,
        pSupported: Ptr[Bool32, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_surface_capabilities_khr: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pSurfaceCapabilities: Ptr[SurfaceCapabilitiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_surface_formats_khr: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pSurfaceFormatCount: Ptr[UInt32, MutOrigin.external],
        pSurfaceFormats: Ptr[SurfaceFormatKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_surface_present_modes_khr: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pPresentModeCount: Ptr[UInt32, MutOrigin.external],
        pPresentModes: Ptr[PresentModeKHR, MutOrigin.external],
    ) -> Result


struct Swapchain(Copyable):    var _vk_create_swapchain_khr: fn(
        device: Device,
        pCreateInfo: Ptr[SwapchainCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSwapchain: Ptr[SwapchainKHR, MutOrigin.external],
    ) -> Result
    var _vk_destroy_swapchain_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_get_swapchain_images_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pSwapchainImageCount: Ptr[UInt32, MutOrigin.external],
        pSwapchainImages: Ptr[Image, MutOrigin.external],
    ) -> Result
    var _vk_acquire_next_image_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        timeout: UInt64,
        semaphore: Semaphore,
        fence: Fence,
        pImageIndex: Ptr[UInt32, MutOrigin.external],
    ) -> Result
    var _vk_queue_present_khr: fn(
        queue: Queue, pPresentInfo: Ptr[PresentInfoKHR, ImmutOrigin.external]
    ) -> Result
    var _vk_get_device_group_present_capabilities_khr: fn(
        device: Device,
        pDeviceGroupPresentCapabilities: Ptr[DeviceGroupPresentCapabilitiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_device_group_surface_present_modes_khr: fn(
        device: Device,
        surface: SurfaceKHR,
        pModes: Ptr[DeviceGroupPresentModeFlagsKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_present_rectangles_khr: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pRectCount: Ptr[UInt32, MutOrigin.external],
        pRects: Ptr[Rect2D, MutOrigin.external],
    ) -> Result
    var _vk_acquire_next_image_2_khr: fn(
        device: Device,
        pAcquireInfo: Ptr[AcquireNextImageInfoKHR, ImmutOrigin.external],
        pImageIndex: Ptr[UInt32, MutOrigin.external],
    ) -> Result


struct Display(Copyable):    var _vk_get_physical_device_display_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[DisplayPropertiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_display_plane_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[DisplayPlanePropertiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_display_plane_supported_displays_khr: fn(
        physicalDevice: PhysicalDevice,
        planeIndex: UInt32,
        pDisplayCount: Ptr[UInt32, MutOrigin.external],
        pDisplays: Ptr[DisplayKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_display_mode_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        display: DisplayKHR,
        pPropertyCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[DisplayModePropertiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_create_display_mode_khr: fn(
        physicalDevice: PhysicalDevice,
        display: DisplayKHR,
        pCreateInfo: Ptr[DisplayModeCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pMode: Ptr[DisplayModeKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_display_plane_capabilities_khr: fn(
        physicalDevice: PhysicalDevice,
        mode: DisplayModeKHR,
        planeIndex: UInt32,
        pCapabilities: Ptr[DisplayPlaneCapabilitiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_create_display_plane_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[DisplaySurfaceCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result


struct DisplaySwapchain(Copyable):    var _vk_create_shared_swapchains_khr: fn(
        device: Device,
        swapchainCount: UInt32,
        pCreateInfos: Ptr[SwapchainCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSwapchains: Ptr[SwapchainKHR, MutOrigin.external],
    ) -> Result


struct XlibSurface(Copyable):    var _vk_create_xlib_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[XlibSurfaceCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_xlib_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        dpy: Ptr[Display, MutOrigin.external],
        visualID: VisualID,
    ) -> Bool32


struct XcbSurface(Copyable):    var _vk_create_xcb_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[XcbSurfaceCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_xcb_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        connection: Ptr[xcb_connection_t, MutOrigin.external],
        visual_id: xcb_visualid_t,
    ) -> Bool32


struct WaylandSurface(Copyable):    var _vk_create_wayland_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[WaylandSurfaceCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_wayland_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        display: Ptr[wl_display, MutOrigin.external],
    ) -> Bool32


struct AndroidSurface(Copyable):    var _vk_create_android_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[AndroidSurfaceCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result


struct Win32Surface(Copyable):    var _vk_create_win_32_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[Win32SurfaceCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_win_32_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32
    ) -> Bool32


struct VideoQueue(Copyable):    var _vk_get_physical_device_video_capabilities_khr: fn(
        physicalDevice: PhysicalDevice,
        pVideoProfile: Ptr[VideoProfileInfoKHR, ImmutOrigin.external],
        pCapabilities: Ptr[VideoCapabilitiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_video_format_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        pVideoFormatInfo: Ptr[PhysicalDeviceVideoFormatInfoKHR, ImmutOrigin.external],
        pVideoFormatPropertyCount: Ptr[UInt32, MutOrigin.external],
        pVideoFormatProperties: Ptr[VideoFormatPropertiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_create_video_session_khr: fn(
        device: Device,
        pCreateInfo: Ptr[VideoSessionCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pVideoSession: Ptr[VideoSessionKHR, MutOrigin.external],
    ) -> Result
    var _vk_destroy_video_session_khr: fn(
        device: Device,
        videoSession: VideoSessionKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_get_video_session_memory_requirements_khr: fn(
        device: Device,
        videoSession: VideoSessionKHR,
        pMemoryRequirementsCount: Ptr[UInt32, MutOrigin.external],
        pMemoryRequirements: Ptr[VideoSessionMemoryRequirementsKHR, MutOrigin.external],
    ) -> Result
    var _vk_bind_video_session_memory_khr: fn(
        device: Device,
        videoSession: VideoSessionKHR,
        bindSessionMemoryInfoCount: UInt32,
        pBindSessionMemoryInfos: Ptr[BindVideoSessionMemoryInfoKHR, ImmutOrigin.external],
    ) -> Result
    var _vk_create_video_session_parameters_khr: fn(
        device: Device,
        pCreateInfo: Ptr[VideoSessionParametersCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pVideoSessionParameters: Ptr[VideoSessionParametersKHR, MutOrigin.external],
    ) -> Result
    var _vk_update_video_session_parameters_khr: fn(
        device: Device,
        videoSessionParameters: VideoSessionParametersKHR,
        pUpdateInfo: Ptr[VideoSessionParametersUpdateInfoKHR, ImmutOrigin.external],
    ) -> Result
    var _vk_destroy_video_session_parameters_khr: fn(
        device: Device,
        videoSessionParameters: VideoSessionParametersKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_cmd_begin_video_coding_khr: fn(
        commandBuffer: CommandBuffer, pBeginInfo: Ptr[VideoBeginCodingInfoKHR, ImmutOrigin.external]
    )
    var _vk_cmd_end_video_coding_khr: fn(
        commandBuffer: CommandBuffer,
        pEndCodingInfo: Ptr[VideoEndCodingInfoKHR, ImmutOrigin.external],
    )
    var _vk_cmd_control_video_coding_khr: fn(
        commandBuffer: CommandBuffer,
        pCodingControlInfo: Ptr[VideoCodingControlInfoKHR, ImmutOrigin.external],
    )


struct VideoDecodeQueue(Copyable):    var _vk_cmd_decode_video_khr: fn(
        commandBuffer: CommandBuffer, pDecodeInfo: Ptr[VideoDecodeInfoKHR, ImmutOrigin.external]
    )


struct DynamicRendering(Copyable):    var _vk_cmd_begin_rendering: fn(
        commandBuffer: CommandBuffer, pRenderingInfo: Ptr[RenderingInfo, ImmutOrigin.external]
    )
    var _vk_cmd_end_rendering: fn(commandBuffer: CommandBuffer)


struct GetPhysicalDeviceProperties2(Copyable):    var _vk_get_physical_device_features_2: fn(
        physicalDevice: PhysicalDevice, pFeatures: Ptr[PhysicalDeviceFeatures2, MutOrigin.external]
    )
    var _vk_get_physical_device_properties_2: fn(
        physicalDevice: PhysicalDevice,
        pProperties: Ptr[PhysicalDeviceProperties2, MutOrigin.external],
    )
    var _vk_get_physical_device_format_properties_2: fn(
        physicalDevice: PhysicalDevice,
        format: Format,
        pFormatProperties: Ptr[FormatProperties2, MutOrigin.external],
    )
    var _vk_get_physical_device_image_format_properties_2: fn(
        physicalDevice: PhysicalDevice,
        pImageFormatInfo: Ptr[PhysicalDeviceImageFormatInfo2, ImmutOrigin.external],
        pImageFormatProperties: Ptr[ImageFormatProperties2, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_queue_family_properties_2: fn(
        physicalDevice: PhysicalDevice,
        pQueueFamilyPropertyCount: Ptr[UInt32, MutOrigin.external],
        pQueueFamilyProperties: Ptr[QueueFamilyProperties2, MutOrigin.external],
    )
    var _vk_get_physical_device_memory_properties_2: fn(
        physicalDevice: PhysicalDevice,
        pMemoryProperties: Ptr[PhysicalDeviceMemoryProperties2, MutOrigin.external],
    )
    var _vk_get_physical_device_sparse_image_format_properties_2: fn(
        physicalDevice: PhysicalDevice,
        pFormatInfo: Ptr[PhysicalDeviceSparseImageFormatInfo2, ImmutOrigin.external],
        pPropertyCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[SparseImageFormatProperties2, MutOrigin.external],
    )


struct DeviceGroup(Copyable):    var _vk_get_device_group_peer_memory_features: fn(
        device: Device,
        heapIndex: UInt32,
        localDeviceIndex: UInt32,
        remoteDeviceIndex: UInt32,
        pPeerMemoryFeatures: Ptr[PeerMemoryFeatureFlags, MutOrigin.external],
    )
    var _vk_cmd_set_device_mask: fn(commandBuffer: CommandBuffer, deviceMask: UInt32)
    var _vk_cmd_dispatch_base: fn(
        commandBuffer: CommandBuffer,
        baseGroupX: UInt32,
        baseGroupY: UInt32,
        baseGroupZ: UInt32,
        groupCountX: UInt32,
        groupCountY: UInt32,
        groupCountZ: UInt32,
    )
    var _vk_get_device_group_present_capabilities_khr: fn(
        device: Device,
        pDeviceGroupPresentCapabilities: Ptr[DeviceGroupPresentCapabilitiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_device_group_surface_present_modes_khr: fn(
        device: Device,
        surface: SurfaceKHR,
        pModes: Ptr[DeviceGroupPresentModeFlagsKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_present_rectangles_khr: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pRectCount: Ptr[UInt32, MutOrigin.external],
        pRects: Ptr[Rect2D, MutOrigin.external],
    ) -> Result
    var _vk_acquire_next_image_2_khr: fn(
        device: Device,
        pAcquireInfo: Ptr[AcquireNextImageInfoKHR, ImmutOrigin.external],
        pImageIndex: Ptr[UInt32, MutOrigin.external],
    ) -> Result


struct Maintenance1(Copyable):    var _vk_trim_command_pool: fn(
        device: Device, commandPool: CommandPool, flags: CommandPoolTrimFlags
    )


struct DeviceGroupCreation(Copyable):    var _vk_enumerate_physical_device_groups: fn(
        instance: Instance,
        pPhysicalDeviceGroupCount: Ptr[UInt32, MutOrigin.external],
        pPhysicalDeviceGroupProperties: Ptr[PhysicalDeviceGroupProperties, MutOrigin.external],
    ) -> Result


struct ExternalMemoryCapabilities(Copyable):    var _vk_get_physical_device_external_buffer_properties: fn(
        physicalDevice: PhysicalDevice,
        pExternalBufferInfo: Ptr[PhysicalDeviceExternalBufferInfo, ImmutOrigin.external],
        pExternalBufferProperties: Ptr[ExternalBufferProperties, MutOrigin.external],
    )


struct ExternalMemoryWin32(Copyable):    var _vk_get_memory_win_32_handle_khr: fn(
        device: Device,
        pGetWin32HandleInfo: Ptr[MemoryGetWin32HandleInfoKHR, ImmutOrigin.external],
        pHandle: Ptr[HANDLE, MutOrigin.external],
    ) -> Result
    var _vk_get_memory_win_32_handle_properties_khr: fn(
        device: Device,
        handleType: ExternalMemoryHandleTypeFlagBits,
        handle: HANDLE,
        pMemoryWin32HandleProperties: Ptr[MemoryWin32HandlePropertiesKHR, MutOrigin.external],
    ) -> Result


struct ExternalMemoryFd(Copyable):    var _vk_get_memory_fd_khr: fn(
        device: Device,
        pGetFdInfo: Ptr[MemoryGetFdInfoKHR, ImmutOrigin.external],
        pFd: Ptr[Int32, MutOrigin.external],
    ) -> Result
    var _vk_get_memory_fd_properties_khr: fn(
        device: Device,
        handleType: ExternalMemoryHandleTypeFlagBits,
        fd: Int32,
        pMemoryFdProperties: Ptr[MemoryFdPropertiesKHR, MutOrigin.external],
    ) -> Result


struct ExternalSemaphoreCapabilities(Copyable):    var _vk_get_physical_device_external_semaphore_properties: fn(
        physicalDevice: PhysicalDevice,
        pExternalSemaphoreInfo: Ptr[PhysicalDeviceExternalSemaphoreInfo, ImmutOrigin.external],
        pExternalSemaphoreProperties: Ptr[ExternalSemaphoreProperties, MutOrigin.external],
    )


struct ExternalSemaphoreWin32(Copyable):    var _vk_import_semaphore_win_32_handle_khr: fn(
        device: Device,
        pImportSemaphoreWin32HandleInfo: Ptr[ImportSemaphoreWin32HandleInfoKHR, ImmutOrigin.external],
    ) -> Result
    var _vk_get_semaphore_win_32_handle_khr: fn(
        device: Device,
        pGetWin32HandleInfo: Ptr[SemaphoreGetWin32HandleInfoKHR, ImmutOrigin.external],
        pHandle: Ptr[HANDLE, MutOrigin.external],
    ) -> Result


struct ExternalSemaphoreFd(Copyable):    var _vk_import_semaphore_fd_khr: fn(
        device: Device, pImportSemaphoreFdInfo: Ptr[ImportSemaphoreFdInfoKHR, ImmutOrigin.external]
    ) -> Result
    var _vk_get_semaphore_fd_khr: fn(
        device: Device,
        pGetFdInfo: Ptr[SemaphoreGetFdInfoKHR, ImmutOrigin.external],
        pFd: Ptr[Int32, MutOrigin.external],
    ) -> Result


struct PushDescriptor(Copyable):    var _vk_cmd_push_descriptor_set: fn(
        commandBuffer: CommandBuffer,
        pipelineBindPoint: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
        descriptorWriteCount: UInt32,
        pDescriptorWrites: Ptr[WriteDescriptorSet, ImmutOrigin.external],
    )
    var _vk_cmd_push_descriptor_set_with_template: fn(
        commandBuffer: CommandBuffer,
        descriptorUpdateTemplate: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        pData: Ptr[NoneType, ImmutOrigin.external],
    )


struct DescriptorUpdateTemplate(Copyable):    var _vk_create_descriptor_update_template: fn(
        device: Device,
        pCreateInfo: Ptr[DescriptorUpdateTemplateCreateInfo, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pDescriptorUpdateTemplate: Ptr[DescriptorUpdateTemplate, MutOrigin.external],
    ) -> Result
    var _vk_destroy_descriptor_update_template: fn(
        device: Device,
        descriptorUpdateTemplate: DescriptorUpdateTemplate,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_update_descriptor_set_with_template: fn(
        device: Device,
        descriptorSet: DescriptorSet,
        descriptorUpdateTemplate: DescriptorUpdateTemplate,
        pData: Ptr[NoneType, ImmutOrigin.external],
    )
    var _vk_cmd_push_descriptor_set_with_template: fn(
        commandBuffer: CommandBuffer,
        descriptorUpdateTemplate: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        pData: Ptr[NoneType, ImmutOrigin.external],
    )


struct CreateRenderpass2(Copyable):    var _vk_create_render_pass_2: fn(
        device: Device,
        pCreateInfo: Ptr[RenderPassCreateInfo2, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pRenderPass: Ptr[RenderPass, MutOrigin.external],
    ) -> Result
    var _vk_cmd_begin_render_pass_2: fn(
        commandBuffer: CommandBuffer,
        pRenderPassBegin: Ptr[RenderPassBeginInfo, ImmutOrigin.external],
        pSubpassBeginInfo: Ptr[SubpassBeginInfo, ImmutOrigin.external],
    )
    var _vk_cmd_next_subpass_2: fn(
        commandBuffer: CommandBuffer,
        pSubpassBeginInfo: Ptr[SubpassBeginInfo, ImmutOrigin.external],
        pSubpassEndInfo: Ptr[SubpassEndInfo, ImmutOrigin.external],
    )
    var _vk_cmd_end_render_pass_2: fn(
        commandBuffer: CommandBuffer, pSubpassEndInfo: Ptr[SubpassEndInfo, ImmutOrigin.external]
    )


struct SharedPresentableImage(Copyable):    var _vk_get_swapchain_status_khr: fn(device: Device, swapchain: SwapchainKHR) -> Result


struct ExternalFenceCapabilities(Copyable):    var _vk_get_physical_device_external_fence_properties: fn(
        physicalDevice: PhysicalDevice,
        pExternalFenceInfo: Ptr[PhysicalDeviceExternalFenceInfo, ImmutOrigin.external],
        pExternalFenceProperties: Ptr[ExternalFenceProperties, MutOrigin.external],
    )


struct ExternalFenceWin32(Copyable):    var _vk_import_fence_win_32_handle_khr: fn(
        device: Device,
        pImportFenceWin32HandleInfo: Ptr[ImportFenceWin32HandleInfoKHR, ImmutOrigin.external],
    ) -> Result
    var _vk_get_fence_win_32_handle_khr: fn(
        device: Device,
        pGetWin32HandleInfo: Ptr[FenceGetWin32HandleInfoKHR, ImmutOrigin.external],
        pHandle: Ptr[HANDLE, MutOrigin.external],
    ) -> Result


struct ExternalFenceFd(Copyable):    var _vk_import_fence_fd_khr: fn(
        device: Device, pImportFenceFdInfo: Ptr[ImportFenceFdInfoKHR, ImmutOrigin.external]
    ) -> Result
    var _vk_get_fence_fd_khr: fn(
        device: Device,
        pGetFdInfo: Ptr[FenceGetFdInfoKHR, ImmutOrigin.external],
        pFd: Ptr[Int32, MutOrigin.external],
    ) -> Result


struct PerformanceQuery(Copyable):    var _vk_enumerate_physical_device_queue_family_performance_query_counters_khr: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        pCounterCount: Ptr[UInt32, MutOrigin.external],
        pCounters: Ptr[PerformanceCounterKHR, MutOrigin.external],
        pCounterDescriptions: Ptr[PerformanceCounterDescriptionKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_queue_family_performance_query_passes_khr: fn(
        physicalDevice: PhysicalDevice,
        pPerformanceQueryCreateInfo: Ptr[QueryPoolPerformanceCreateInfoKHR, ImmutOrigin.external],
        pNumPasses: Ptr[UInt32, MutOrigin.external],
    )
    var _vk_acquire_profiling_lock_khr: fn(
        device: Device, pInfo: Ptr[AcquireProfilingLockInfoKHR, ImmutOrigin.external]
    ) -> Result
    var _vk_release_profiling_lock_khr: fn(device: Device)


struct GetSurfaceCapabilities2(Copyable):    var _vk_get_physical_device_surface_capabilities_2_khr: fn(
        physicalDevice: PhysicalDevice,
        pSurfaceInfo: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutOrigin.external],
        pSurfaceCapabilities: Ptr[SurfaceCapabilities2KHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_surface_formats_2_khr: fn(
        physicalDevice: PhysicalDevice,
        pSurfaceInfo: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutOrigin.external],
        pSurfaceFormatCount: Ptr[UInt32, MutOrigin.external],
        pSurfaceFormats: Ptr[SurfaceFormat2KHR, MutOrigin.external],
    ) -> Result


struct GetDisplayProperties2(Copyable):    var _vk_get_physical_device_display_properties_2_khr: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[DisplayProperties2KHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_display_plane_properties_2_khr: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[DisplayPlaneProperties2KHR, MutOrigin.external],
    ) -> Result
    var _vk_get_display_mode_properties_2_khr: fn(
        physicalDevice: PhysicalDevice,
        display: DisplayKHR,
        pPropertyCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[DisplayModeProperties2KHR, MutOrigin.external],
    ) -> Result
    var _vk_get_display_plane_capabilities_2_khr: fn(
        physicalDevice: PhysicalDevice,
        pDisplayPlaneInfo: Ptr[DisplayPlaneInfo2KHR, ImmutOrigin.external],
        pCapabilities: Ptr[DisplayPlaneCapabilities2KHR, MutOrigin.external],
    ) -> Result


struct GetMemoryRequirements2(Copyable):    var _vk_get_image_memory_requirements_2: fn(
        device: Device,
        pInfo: Ptr[ImageMemoryRequirementsInfo2, ImmutOrigin.external],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutOrigin.external],
    )
    var _vk_get_buffer_memory_requirements_2: fn(
        device: Device,
        pInfo: Ptr[BufferMemoryRequirementsInfo2, ImmutOrigin.external],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutOrigin.external],
    )
    var _vk_get_image_sparse_memory_requirements_2: fn(
        device: Device,
        pInfo: Ptr[ImageSparseMemoryRequirementsInfo2, ImmutOrigin.external],
        pSparseMemoryRequirementCount: Ptr[UInt32, MutOrigin.external],
        pSparseMemoryRequirements: Ptr[SparseImageMemoryRequirements2, MutOrigin.external],
    )


struct AccelerationStructure(Copyable):    var _vk_create_acceleration_structure_khr: fn(
        device: Device,
        pCreateInfo: Ptr[AccelerationStructureCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pAccelerationStructure: Ptr[AccelerationStructureKHR, MutOrigin.external],
    ) -> Result
    var _vk_destroy_acceleration_structure_khr: fn(
        device: Device,
        accelerationStructure: AccelerationStructureKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_cmd_build_acceleration_structures_khr: fn(
        commandBuffer: CommandBuffer,
        infoCount: UInt32,
        pInfos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutOrigin.external],
        ppBuildRangeInfos: Ptr[Ptr[*, ImmutOrigin.external], MutOrigin.external],
    )
    var _vk_cmd_build_acceleration_structures_indirect_khr: fn(
        commandBuffer: CommandBuffer,
        infoCount: UInt32,
        pInfos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutOrigin.external],
        pIndirectDeviceAddresses: Ptr[DeviceAddress, ImmutOrigin.external],
        pIndirectStrides: Ptr[UInt32, ImmutOrigin.external],
        ppMaxPrimitiveCounts: Ptr[Ptr[*, ImmutOrigin.external], MutOrigin.external],
    )
    var _vk_build_acceleration_structures_khr: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        infoCount: UInt32,
        pInfos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutOrigin.external],
        ppBuildRangeInfos: Ptr[Ptr[*, ImmutOrigin.external], MutOrigin.external],
    ) -> Result
    var _vk_copy_acceleration_structure_khr: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pInfo: Ptr[CopyAccelerationStructureInfoKHR, ImmutOrigin.external],
    ) -> Result
    var _vk_copy_acceleration_structure_to_memory_khr: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pInfo: Ptr[CopyAccelerationStructureToMemoryInfoKHR, ImmutOrigin.external],
    ) -> Result
    var _vk_copy_memory_to_acceleration_structure_khr: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pInfo: Ptr[CopyMemoryToAccelerationStructureInfoKHR, ImmutOrigin.external],
    ) -> Result
    var _vk_write_acceleration_structures_properties_khr: fn(
        device: Device,
        accelerationStructureCount: UInt32,
        pAccelerationStructures: Ptr[AccelerationStructureKHR, ImmutOrigin.external],
        queryType: QueryType,
        dataSize: UInt,
        pData: Ptr[NoneType, MutOrigin.external],
        stride: UInt,
    ) -> Result
    var _vk_cmd_copy_acceleration_structure_khr: fn(
        commandBuffer: CommandBuffer,
        pInfo: Ptr[CopyAccelerationStructureInfoKHR, ImmutOrigin.external],
    )
    var _vk_cmd_copy_acceleration_structure_to_memory_khr: fn(
        commandBuffer: CommandBuffer,
        pInfo: Ptr[CopyAccelerationStructureToMemoryInfoKHR, ImmutOrigin.external],
    )
    var _vk_cmd_copy_memory_to_acceleration_structure_khr: fn(
        commandBuffer: CommandBuffer,
        pInfo: Ptr[CopyMemoryToAccelerationStructureInfoKHR, ImmutOrigin.external],
    )
    var _vk_get_acceleration_structure_device_address_khr: fn(
        device: Device, pInfo: Ptr[AccelerationStructureDeviceAddressInfoKHR, ImmutOrigin.external]
    ) -> DeviceAddress
    var _vk_cmd_write_acceleration_structures_properties_khr: fn(
        commandBuffer: CommandBuffer,
        accelerationStructureCount: UInt32,
        pAccelerationStructures: Ptr[AccelerationStructureKHR, ImmutOrigin.external],
        queryType: QueryType,
        queryPool: QueryPool,
        firstQuery: UInt32,
    )
    var _vk_get_device_acceleration_structure_compatibility_khr: fn(
        device: Device,
        pVersionInfo: Ptr[AccelerationStructureVersionInfoKHR, ImmutOrigin.external],
        pCompatibility: Ptr[AccelerationStructureCompatibilityKHR, MutOrigin.external],
    )
    var _vk_get_acceleration_structure_build_sizes_khr: fn(
        device: Device,
        buildType: AccelerationStructureBuildTypeKHR,
        pBuildInfo: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutOrigin.external],
        pMaxPrimitiveCounts: Ptr[UInt32, ImmutOrigin.external],
        pSizeInfo: Ptr[AccelerationStructureBuildSizesInfoKHR, MutOrigin.external],
    )


struct RayTracingPipeline(Copyable):    var _vk_cmd_trace_rays_khr: fn(
        commandBuffer: CommandBuffer,
        pRaygenShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutOrigin.external],
        pMissShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutOrigin.external],
        pHitShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutOrigin.external],
        pCallableShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutOrigin.external],
        width: UInt32,
        height: UInt32,
        depth: UInt32,
    )
    var _vk_create_ray_tracing_pipelines_khr: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pipelineCache: PipelineCache,
        createInfoCount: UInt32,
        pCreateInfos: Ptr[RayTracingPipelineCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pPipelines: Ptr[Pipeline, MutOrigin.external],
    ) -> Result
    var _vk_get_ray_tracing_shader_group_handles_khr: fn(
        device: Device,
        pipeline: Pipeline,
        firstGroup: UInt32,
        groupCount: UInt32,
        dataSize: UInt,
        pData: Ptr[NoneType, MutOrigin.external],
    ) -> Result
    var _vk_get_ray_tracing_capture_replay_shader_group_handles_khr: fn(
        device: Device,
        pipeline: Pipeline,
        firstGroup: UInt32,
        groupCount: UInt32,
        dataSize: UInt,
        pData: Ptr[NoneType, MutOrigin.external],
    ) -> Result
    var _vk_cmd_trace_rays_indirect_khr: fn(
        commandBuffer: CommandBuffer,
        pRaygenShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutOrigin.external],
        pMissShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutOrigin.external],
        pHitShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutOrigin.external],
        pCallableShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutOrigin.external],
        indirectDeviceAddress: DeviceAddress,
    )
    var _vk_get_ray_tracing_shader_group_stack_size_khr: fn(
        device: Device, pipeline: Pipeline, group: UInt32, groupShader: ShaderGroupShaderKHR
    ) -> DeviceSize
    var _vk_cmd_set_ray_tracing_pipeline_stack_size_khr: fn(
        commandBuffer: CommandBuffer, pipelineStackSize: UInt32
    )


struct SamplerYcbcrConversion(Copyable):    var _vk_create_sampler_ycbcr_conversion: fn(
        device: Device,
        pCreateInfo: Ptr[SamplerYcbcrConversionCreateInfo, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pYcbcrConversion: Ptr[SamplerYcbcrConversion, MutOrigin.external],
    ) -> Result
    var _vk_destroy_sampler_ycbcr_conversion: fn(
        device: Device,
        ycbcrConversion: SamplerYcbcrConversion,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )


struct BindMemory2(Copyable):    var _vk_bind_buffer_memory_2: fn(
        device: Device,
        bindInfoCount: UInt32,
        pBindInfos: Ptr[BindBufferMemoryInfo, ImmutOrigin.external],
    ) -> Result
    var _vk_bind_image_memory_2: fn(
        device: Device,
        bindInfoCount: UInt32,
        pBindInfos: Ptr[BindImageMemoryInfo, ImmutOrigin.external],
    ) -> Result


struct Maintenance3(Copyable):    var _vk_get_descriptor_set_layout_support: fn(
        device: Device,
        pCreateInfo: Ptr[DescriptorSetLayoutCreateInfo, ImmutOrigin.external],
        pSupport: Ptr[DescriptorSetLayoutSupport, MutOrigin.external],
    )


struct DrawIndirectCount(Copyable):    var _vk_cmd_draw_indirect_count: fn(
        commandBuffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        countBuffer: Buffer,
        countBufferOffset: DeviceSize,
        maxDrawCount: UInt32,
        stride: UInt32,
    )
    var _vk_cmd_draw_indexed_indirect_count: fn(
        commandBuffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        countBuffer: Buffer,
        countBufferOffset: DeviceSize,
        maxDrawCount: UInt32,
        stride: UInt32,
    )


struct TimelineSemaphore(Copyable):    var _vk_get_semaphore_counter_value: fn(
        device: Device, semaphore: Semaphore, pValue: Ptr[UInt64, MutOrigin.external]
    ) -> Result
    var _vk_wait_semaphores: fn(
        device: Device, pWaitInfo: Ptr[SemaphoreWaitInfo, ImmutOrigin.external], timeout: UInt64
    ) -> Result
    var _vk_signal_semaphore: fn(
        device: Device, pSignalInfo: Ptr[SemaphoreSignalInfo, ImmutOrigin.external]
    ) -> Result


struct FragmentShadingRate(Copyable):    var _vk_get_physical_device_fragment_shading_rates_khr: fn(
        physicalDevice: PhysicalDevice,
        pFragmentShadingRateCount: Ptr[UInt32, MutOrigin.external],
        pFragmentShadingRates: Ptr[PhysicalDeviceFragmentShadingRateKHR, MutOrigin.external],
    ) -> Result
    var _vk_cmd_set_fragment_shading_rate_khr: fn(
        commandBuffer: CommandBuffer,
        pFragmentSize: Ptr[Extent2D, ImmutOrigin.external],
        combinerOps: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    )


struct DynamicRenderingLocalRead(Copyable):    var _vk_cmd_set_rendering_attachment_locations: fn(
        commandBuffer: CommandBuffer,
        pLocationInfo: Ptr[RenderingAttachmentLocationInfo, ImmutOrigin.external],
    )
    var _vk_cmd_set_rendering_input_attachment_indices: fn(
        commandBuffer: CommandBuffer,
        pInputAttachmentIndexInfo: Ptr[RenderingInputAttachmentIndexInfo, ImmutOrigin.external],
    )


struct PresentWait(Copyable):    var _vk_wait_for_present_khr: fn(
        device: Device, swapchain: SwapchainKHR, presentId: UInt64, timeout: UInt64
    ) -> Result


struct BufferDeviceAddress(Copyable):    var _vk_get_buffer_device_address: fn(
        device: Device, pInfo: Ptr[BufferDeviceAddressInfo, ImmutOrigin.external]
    ) -> DeviceAddress
    var _vk_get_buffer_opaque_capture_address: fn(
        device: Device, pInfo: Ptr[BufferDeviceAddressInfo, ImmutOrigin.external]
    ) -> UInt64
    var _vk_get_device_memory_opaque_capture_address: fn(
        device: Device, pInfo: Ptr[DeviceMemoryOpaqueCaptureAddressInfo, ImmutOrigin.external]
    ) -> UInt64


struct DeferredHostOperations(Copyable):    var _vk_create_deferred_operation_khr: fn(
        device: Device,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pDeferredOperation: Ptr[DeferredOperationKHR, MutOrigin.external],
    ) -> Result
    var _vk_destroy_deferred_operation_khr: fn(
        device: Device,
        operation: DeferredOperationKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_get_deferred_operation_max_concurrency_khr: fn(
        device: Device, operation: DeferredOperationKHR
    ) -> UInt32
    var _vk_get_deferred_operation_result_khr: fn(
        device: Device, operation: DeferredOperationKHR
    ) -> Result
    var _vk_deferred_operation_join_khr: fn(
        device: Device, operation: DeferredOperationKHR
    ) -> Result


struct PipelineExecutableProperties(Copyable):    var _vk_get_pipeline_executable_properties_khr: fn(
        device: Device,
        pPipelineInfo: Ptr[PipelineInfoKHR, ImmutOrigin.external],
        pExecutableCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[PipelineExecutablePropertiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_pipeline_executable_statistics_khr: fn(
        device: Device,
        pExecutableInfo: Ptr[PipelineExecutableInfoKHR, ImmutOrigin.external],
        pStatisticCount: Ptr[UInt32, MutOrigin.external],
        pStatistics: Ptr[PipelineExecutableStatisticKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_pipeline_executable_internal_representations_khr: fn(
        device: Device,
        pExecutableInfo: Ptr[PipelineExecutableInfoKHR, ImmutOrigin.external],
        pInternalRepresentationCount: Ptr[UInt32, MutOrigin.external],
        pInternalRepresentations: Ptr[PipelineExecutableInternalRepresentationKHR, MutOrigin.external],
    ) -> Result


struct MapMemory2(Copyable):    var _vk_map_memory_2: fn(
        device: Device,
        pMemoryMapInfo: Ptr[MemoryMapInfo, ImmutOrigin.external],
        ppData: Ptr[Ptr[NoneType, MutOrigin.external], MutOrigin.external],
    ) -> Result
    var _vk_unmap_memory_2: fn(
        device: Device, pMemoryUnmapInfo: Ptr[MemoryUnmapInfo, ImmutOrigin.external]
    ) -> Result


struct VideoEncodeQueue(Copyable):    var _vk_get_physical_device_video_encode_quality_level_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        pQualityLevelInfo: Ptr[PhysicalDeviceVideoEncodeQualityLevelInfoKHR, ImmutOrigin.external],
        pQualityLevelProperties: Ptr[VideoEncodeQualityLevelPropertiesKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_encoded_video_session_parameters_khr: fn(
        device: Device,
        pVideoSessionParametersInfo: Ptr[VideoEncodeSessionParametersGetInfoKHR, ImmutOrigin.external],
        pFeedbackInfo: Ptr[VideoEncodeSessionParametersFeedbackInfoKHR, MutOrigin.external],
        pDataSize: Ptr[UInt, MutOrigin.external],
        pData: Ptr[NoneType, MutOrigin.external],
    ) -> Result
    var _vk_cmd_encode_video_khr: fn(
        commandBuffer: CommandBuffer, pEncodeInfo: Ptr[VideoEncodeInfoKHR, ImmutOrigin.external]
    )


struct Synchronization2(Copyable):    var _vk_cmd_set_event_2: fn(
        commandBuffer: CommandBuffer,
        event: Event,
        pDependencyInfo: Ptr[DependencyInfo, ImmutOrigin.external],
    )
    var _vk_cmd_reset_event_2: fn(
        commandBuffer: CommandBuffer, event: Event, stageMask: PipelineStageFlags2
    )
    var _vk_cmd_wait_events_2: fn(
        commandBuffer: CommandBuffer,
        eventCount: UInt32,
        pEvents: Ptr[Event, ImmutOrigin.external],
        pDependencyInfos: Ptr[DependencyInfo, ImmutOrigin.external],
    )
    var _vk_cmd_pipeline_barrier_2: fn(
        commandBuffer: CommandBuffer, pDependencyInfo: Ptr[DependencyInfo, ImmutOrigin.external]
    )
    var _vk_cmd_write_timestamp_2: fn(
        commandBuffer: CommandBuffer,
        stage: PipelineStageFlags2,
        queryPool: QueryPool,
        query: UInt32,
    )
    var _vk_queue_submit_2: fn(
        queue: Queue,
        submitCount: UInt32,
        pSubmits: Ptr[SubmitInfo2, ImmutOrigin.external],
        fence: Fence,
    ) -> Result


struct CopyCommands2(Copyable):    var _vk_cmd_copy_buffer_2: fn(
        commandBuffer: CommandBuffer, pCopyBufferInfo: Ptr[CopyBufferInfo2, ImmutOrigin.external]
    )
    var _vk_cmd_copy_image_2: fn(
        commandBuffer: CommandBuffer, pCopyImageInfo: Ptr[CopyImageInfo2, ImmutOrigin.external]
    )
    var _vk_cmd_copy_buffer_to_image_2: fn(
        commandBuffer: CommandBuffer,
        pCopyBufferToImageInfo: Ptr[CopyBufferToImageInfo2, ImmutOrigin.external],
    )
    var _vk_cmd_copy_image_to_buffer_2: fn(
        commandBuffer: CommandBuffer,
        pCopyImageToBufferInfo: Ptr[CopyImageToBufferInfo2, ImmutOrigin.external],
    )
    var _vk_cmd_blit_image_2: fn(
        commandBuffer: CommandBuffer, pBlitImageInfo: Ptr[BlitImageInfo2, ImmutOrigin.external]
    )
    var _vk_cmd_resolve_image_2: fn(
        commandBuffer: CommandBuffer,
        pResolveImageInfo: Ptr[ResolveImageInfo2, ImmutOrigin.external],
    )


struct RayTracingMaintenance1(Copyable):    var _vk_cmd_trace_rays_indirect_2_khr: fn(
        commandBuffer: CommandBuffer, indirectDeviceAddress: DeviceAddress
    )


struct Maintenance4(Copyable):    var _vk_get_device_buffer_memory_requirements: fn(
        device: Device,
        pInfo: Ptr[DeviceBufferMemoryRequirements, ImmutOrigin.external],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutOrigin.external],
    )
    var _vk_get_device_image_memory_requirements: fn(
        device: Device,
        pInfo: Ptr[DeviceImageMemoryRequirements, ImmutOrigin.external],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutOrigin.external],
    )
    var _vk_get_device_image_sparse_memory_requirements: fn(
        device: Device,
        pInfo: Ptr[DeviceImageMemoryRequirements, ImmutOrigin.external],
        pSparseMemoryRequirementCount: Ptr[UInt32, MutOrigin.external],
        pSparseMemoryRequirements: Ptr[SparseImageMemoryRequirements2, MutOrigin.external],
    )


struct Maintenance5(Copyable):    var _vk_cmd_bind_index_buffer_2: fn(
        commandBuffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        size: DeviceSize,
        indexType: IndexType,
    )
    var _vk_get_rendering_area_granularity: fn(
        device: Device,
        pRenderingAreaInfo: Ptr[RenderingAreaInfo, ImmutOrigin.external],
        pGranularity: Ptr[Extent2D, MutOrigin.external],
    )
    var _vk_get_device_image_subresource_layout: fn(
        device: Device,
        pInfo: Ptr[DeviceImageSubresourceInfo, ImmutOrigin.external],
        pLayout: Ptr[SubresourceLayout2, MutOrigin.external],
    )
    var _vk_get_image_subresource_layout_2: fn(
        device: Device,
        image: Image,
        pSubresource: Ptr[ImageSubresource2, ImmutOrigin.external],
        pLayout: Ptr[SubresourceLayout2, MutOrigin.external],
    )


struct PresentWait2(Copyable):    var _vk_wait_for_present_2_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pPresentWait2Info: Ptr[PresentWait2InfoKHR, ImmutOrigin.external],
    ) -> Result


struct PipelineBinary(Copyable):    var _vk_create_pipeline_binaries_khr: fn(
        device: Device,
        pCreateInfo: Ptr[PipelineBinaryCreateInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pBinaries: Ptr[PipelineBinaryHandlesInfoKHR, MutOrigin.external],
    ) -> Result
    var _vk_destroy_pipeline_binary_khr: fn(
        device: Device,
        pipelineBinary: PipelineBinaryKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_get_pipeline_key_khr: fn(
        device: Device,
        pPipelineCreateInfo: Ptr[PipelineCreateInfoKHR, ImmutOrigin.external],
        pPipelineKey: Ptr[PipelineBinaryKeyKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_pipeline_binary_data_khr: fn(
        device: Device,
        pInfo: Ptr[PipelineBinaryDataInfoKHR, ImmutOrigin.external],
        pPipelineBinaryKey: Ptr[PipelineBinaryKeyKHR, MutOrigin.external],
        pPipelineBinaryDataSize: Ptr[UInt, MutOrigin.external],
        pPipelineBinaryData: Ptr[NoneType, MutOrigin.external],
    ) -> Result
    var _vk_release_captured_pipeline_data_khr: fn(
        device: Device,
        pInfo: Ptr[ReleaseCapturedPipelineDataInfoKHR, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    ) -> Result


struct SwapchainMaintenance1(Copyable):    var _vk_release_swapchain_images_khr: fn(
        device: Device, pReleaseInfo: Ptr[ReleaseSwapchainImagesInfoKHR, ImmutOrigin.external]
    ) -> Result


struct CooperativeMatrix(Copyable):    var _vk_get_physical_device_cooperative_matrix_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[CooperativeMatrixPropertiesKHR, MutOrigin.external],
    ) -> Result


struct LineRasterization(Copyable):    var _vk_cmd_set_line_stipple: fn(
        commandBuffer: CommandBuffer, lineStippleFactor: UInt32, lineStipplePattern: UInt16
    )


struct CalibratedTimestamps(Copyable):    var _vk_get_physical_device_calibrateable_time_domains_khr: fn(
        physicalDevice: PhysicalDevice,
        pTimeDomainCount: Ptr[UInt32, MutOrigin.external],
        pTimeDomains: Ptr[TimeDomainKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_calibrated_timestamps_khr: fn(
        device: Device,
        timestampCount: UInt32,
        pTimestampInfos: Ptr[CalibratedTimestampInfoKHR, ImmutOrigin.external],
        pTimestamps: Ptr[UInt64, MutOrigin.external],
        pMaxDeviation: Ptr[UInt64, MutOrigin.external],
    ) -> Result


struct Maintenance6(Copyable):    var _vk_cmd_bind_descriptor_sets_2: fn(
        commandBuffer: CommandBuffer,
        pBindDescriptorSetsInfo: Ptr[BindDescriptorSetsInfo, ImmutOrigin.external],
    )
    var _vk_cmd_push_constants_2: fn(
        commandBuffer: CommandBuffer,
        pPushConstantsInfo: Ptr[PushConstantsInfo, ImmutOrigin.external],
    )
    var _vk_cmd_push_descriptor_set_2: fn(
        commandBuffer: CommandBuffer,
        pPushDescriptorSetInfo: Ptr[PushDescriptorSetInfo, ImmutOrigin.external],
    )
    var _vk_cmd_push_descriptor_set_with_template_2: fn(
        commandBuffer: CommandBuffer,
        pPushDescriptorSetWithTemplateInfo: Ptr[PushDescriptorSetWithTemplateInfo, ImmutOrigin.external],
    )
    var _vk_cmd_set_descriptor_buffer_offsets_2_ext: fn(
        commandBuffer: CommandBuffer,
        pSetDescriptorBufferOffsetsInfo: Ptr[SetDescriptorBufferOffsetsInfoEXT, ImmutOrigin.external],
    )
    var _vk_cmd_bind_descriptor_buffer_embedded_samplers_2_ext: fn(
        commandBuffer: CommandBuffer,
        pBindDescriptorBufferEmbeddedSamplersInfo: Ptr[BindDescriptorBufferEmbeddedSamplersInfoEXT, ImmutOrigin.external],
    )
