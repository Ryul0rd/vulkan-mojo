from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct Surface(Copyable):    var _vk_destroy_surface_khr: fn(
        instance: Instance,
        surface: SurfaceKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_get_physical_device_surface_support_khr: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        surface: SurfaceKHR,
        pSupported: Ptr[Bool32, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_surface_capabilities_khr: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pSurfaceCapabilities: Ptr[SurfaceCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_surface_formats_khr: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pSurfaceFormatCount: Ptr[UInt32, MutAnyOrigin],
        pSurfaceFormats: Ptr[SurfaceFormatKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_surface_present_modes_khr: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pPresentModeCount: Ptr[UInt32, MutAnyOrigin],
        pPresentModes: Ptr[PresentModeKHR, MutAnyOrigin],
    ) -> Result


struct Swapchain(Copyable):    var _vk_create_swapchain_khr: fn(
        device: Device,
        pCreateInfo: Ptr[SwapchainCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSwapchain: Ptr[SwapchainKHR, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_swapchain_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_get_swapchain_images_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pSwapchainImageCount: Ptr[UInt32, MutAnyOrigin],
        pSwapchainImages: Ptr[Image, MutAnyOrigin],
    ) -> Result
    var _vk_acquire_next_image_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        timeout: UInt64,
        semaphore: Semaphore,
        fence: Fence,
        pImageIndex: Ptr[UInt32, MutAnyOrigin],
    ) -> Result
    var _vk_queue_present_khr: fn(
        queue: Queue, pPresentInfo: Ptr[PresentInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _vk_get_device_group_present_capabilities_khr: fn(
        device: Device,
        pDeviceGroupPresentCapabilities: Ptr[DeviceGroupPresentCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_device_group_surface_present_modes_khr: fn(
        device: Device,
        surface: SurfaceKHR,
        pModes: Ptr[DeviceGroupPresentModeFlagsKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_present_rectangles_khr: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pRectCount: Ptr[UInt32, MutAnyOrigin],
        pRects: Ptr[Rect2D, MutAnyOrigin],
    ) -> Result
    var _vk_acquire_next_image_2_khr: fn(
        device: Device,
        pAcquireInfo: Ptr[AcquireNextImageInfoKHR, ImmutAnyOrigin],
        pImageIndex: Ptr[UInt32, MutAnyOrigin],
    ) -> Result


struct Display(Copyable):    var _vk_get_physical_device_display_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[DisplayPropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_display_plane_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[DisplayPlanePropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_display_plane_supported_displays_khr: fn(
        physicalDevice: PhysicalDevice,
        planeIndex: UInt32,
        pDisplayCount: Ptr[UInt32, MutAnyOrigin],
        pDisplays: Ptr[DisplayKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_display_mode_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        display: DisplayKHR,
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[DisplayModePropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_create_display_mode_khr: fn(
        physicalDevice: PhysicalDevice,
        display: DisplayKHR,
        pCreateInfo: Ptr[DisplayModeCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pMode: Ptr[DisplayModeKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_display_plane_capabilities_khr: fn(
        physicalDevice: PhysicalDevice,
        mode: DisplayModeKHR,
        planeIndex: UInt32,
        pCapabilities: Ptr[DisplayPlaneCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_create_display_plane_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[DisplaySurfaceCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result


struct DisplaySwapchain(Copyable):    var _vk_create_shared_swapchains_khr: fn(
        device: Device,
        swapchainCount: UInt32,
        pCreateInfos: Ptr[SwapchainCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSwapchains: Ptr[SwapchainKHR, MutAnyOrigin],
    ) -> Result


struct XlibSurface(Copyable):    var _vk_create_xlib_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[XlibSurfaceCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_xlib_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        dpy: Ptr[Display, MutAnyOrigin],
        visualID: VisualID,
    ) -> Bool32


struct XcbSurface(Copyable):    var _vk_create_xcb_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[XcbSurfaceCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_xcb_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        connection: Ptr[xcb_connection_t, MutAnyOrigin],
        visual_id: xcb_visualid_t,
    ) -> Bool32


struct WaylandSurface(Copyable):    var _vk_create_wayland_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[WaylandSurfaceCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_wayland_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        display: Ptr[wl_display, MutAnyOrigin],
    ) -> Bool32


struct AndroidSurface(Copyable):    var _vk_create_android_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[AndroidSurfaceCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result


struct Win32Surface(Copyable):    var _vk_create_win_32_surface_khr: fn(
        instance: Instance,
        pCreateInfo: Ptr[Win32SurfaceCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_win_32_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32
    ) -> Bool32


struct VideoQueue(Copyable):    var _vk_get_physical_device_video_capabilities_khr: fn(
        physicalDevice: PhysicalDevice,
        pVideoProfile: Ptr[VideoProfileInfoKHR, ImmutAnyOrigin],
        pCapabilities: Ptr[VideoCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_video_format_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        pVideoFormatInfo: Ptr[PhysicalDeviceVideoFormatInfoKHR, ImmutAnyOrigin],
        pVideoFormatPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pVideoFormatProperties: Ptr[VideoFormatPropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_create_video_session_khr: fn(
        device: Device,
        pCreateInfo: Ptr[VideoSessionCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pVideoSession: Ptr[VideoSessionKHR, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_video_session_khr: fn(
        device: Device,
        videoSession: VideoSessionKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_get_video_session_memory_requirements_khr: fn(
        device: Device,
        videoSession: VideoSessionKHR,
        pMemoryRequirementsCount: Ptr[UInt32, MutAnyOrigin],
        pMemoryRequirements: Ptr[VideoSessionMemoryRequirementsKHR, MutAnyOrigin],
    ) -> Result
    var _vk_bind_video_session_memory_khr: fn(
        device: Device,
        videoSession: VideoSessionKHR,
        bindSessionMemoryInfoCount: UInt32,
        pBindSessionMemoryInfos: Ptr[BindVideoSessionMemoryInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _vk_create_video_session_parameters_khr: fn(
        device: Device,
        pCreateInfo: Ptr[VideoSessionParametersCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pVideoSessionParameters: Ptr[VideoSessionParametersKHR, MutAnyOrigin],
    ) -> Result
    var _vk_update_video_session_parameters_khr: fn(
        device: Device,
        videoSessionParameters: VideoSessionParametersKHR,
        pUpdateInfo: Ptr[VideoSessionParametersUpdateInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _vk_destroy_video_session_parameters_khr: fn(
        device: Device,
        videoSessionParameters: VideoSessionParametersKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_cmd_begin_video_coding_khr: fn(
        commandBuffer: CommandBuffer, pBeginInfo: Ptr[VideoBeginCodingInfoKHR, ImmutAnyOrigin]
    )
    var _vk_cmd_end_video_coding_khr: fn(
        commandBuffer: CommandBuffer, pEndCodingInfo: Ptr[VideoEndCodingInfoKHR, ImmutAnyOrigin]
    )
    var _vk_cmd_control_video_coding_khr: fn(
        commandBuffer: CommandBuffer,
        pCodingControlInfo: Ptr[VideoCodingControlInfoKHR, ImmutAnyOrigin],
    )


struct VideoDecodeQueue(Copyable):    var _vk_cmd_decode_video_khr: fn(
        commandBuffer: CommandBuffer, pDecodeInfo: Ptr[VideoDecodeInfoKHR, ImmutAnyOrigin]
    )


struct DynamicRendering(Copyable):    var _vk_cmd_begin_rendering: fn(
        commandBuffer: CommandBuffer, pRenderingInfo: Ptr[RenderingInfo, ImmutAnyOrigin]
    )
    var _vk_cmd_end_rendering: fn(commandBuffer: CommandBuffer)


struct GetPhysicalDeviceProperties2(Copyable):    var _vk_get_physical_device_features_2: fn(
        physicalDevice: PhysicalDevice, pFeatures: Ptr[PhysicalDeviceFeatures2, MutAnyOrigin]
    )
    var _vk_get_physical_device_properties_2: fn(
        physicalDevice: PhysicalDevice, pProperties: Ptr[PhysicalDeviceProperties2, MutAnyOrigin]
    )
    var _vk_get_physical_device_format_properties_2: fn(
        physicalDevice: PhysicalDevice,
        format: Format,
        pFormatProperties: Ptr[FormatProperties2, MutAnyOrigin],
    )
    var _vk_get_physical_device_image_format_properties_2: fn(
        physicalDevice: PhysicalDevice,
        pImageFormatInfo: Ptr[PhysicalDeviceImageFormatInfo2, ImmutAnyOrigin],
        pImageFormatProperties: Ptr[ImageFormatProperties2, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_queue_family_properties_2: fn(
        physicalDevice: PhysicalDevice,
        pQueueFamilyPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pQueueFamilyProperties: Ptr[QueueFamilyProperties2, MutAnyOrigin],
    )
    var _vk_get_physical_device_memory_properties_2: fn(
        physicalDevice: PhysicalDevice,
        pMemoryProperties: Ptr[PhysicalDeviceMemoryProperties2, MutAnyOrigin],
    )
    var _vk_get_physical_device_sparse_image_format_properties_2: fn(
        physicalDevice: PhysicalDevice,
        pFormatInfo: Ptr[PhysicalDeviceSparseImageFormatInfo2, ImmutAnyOrigin],
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[SparseImageFormatProperties2, MutAnyOrigin],
    )


struct DeviceGroup(Copyable):    var _vk_get_device_group_peer_memory_features: fn(
        device: Device,
        heapIndex: UInt32,
        localDeviceIndex: UInt32,
        remoteDeviceIndex: UInt32,
        pPeerMemoryFeatures: Ptr[PeerMemoryFeatureFlags, MutAnyOrigin],
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
        pDeviceGroupPresentCapabilities: Ptr[DeviceGroupPresentCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_device_group_surface_present_modes_khr: fn(
        device: Device,
        surface: SurfaceKHR,
        pModes: Ptr[DeviceGroupPresentModeFlagsKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_present_rectangles_khr: fn(
        physicalDevice: PhysicalDevice,
        surface: SurfaceKHR,
        pRectCount: Ptr[UInt32, MutAnyOrigin],
        pRects: Ptr[Rect2D, MutAnyOrigin],
    ) -> Result
    var _vk_acquire_next_image_2_khr: fn(
        device: Device,
        pAcquireInfo: Ptr[AcquireNextImageInfoKHR, ImmutAnyOrigin],
        pImageIndex: Ptr[UInt32, MutAnyOrigin],
    ) -> Result


struct Maintenance1(Copyable):    var _vk_trim_command_pool: fn(
        device: Device, commandPool: CommandPool, flags: CommandPoolTrimFlags
    )


struct DeviceGroupCreation(Copyable):    var _vk_enumerate_physical_device_groups: fn(
        instance: Instance,
        pPhysicalDeviceGroupCount: Ptr[UInt32, MutAnyOrigin],
        pPhysicalDeviceGroupProperties: Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin],
    ) -> Result


struct ExternalMemoryCapabilities(Copyable):    var _vk_get_physical_device_external_buffer_properties: fn(
        physicalDevice: PhysicalDevice,
        pExternalBufferInfo: Ptr[PhysicalDeviceExternalBufferInfo, ImmutAnyOrigin],
        pExternalBufferProperties: Ptr[ExternalBufferProperties, MutAnyOrigin],
    )


struct ExternalMemoryWin32(Copyable):    var _vk_get_memory_win_32_handle_khr: fn(
        device: Device,
        pGetWin32HandleInfo: Ptr[MemoryGetWin32HandleInfoKHR, ImmutAnyOrigin],
        pHandle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result
    var _vk_get_memory_win_32_handle_properties_khr: fn(
        device: Device,
        handleType: ExternalMemoryHandleTypeFlagBits,
        handle: HANDLE,
        pMemoryWin32HandleProperties: Ptr[MemoryWin32HandlePropertiesKHR, MutAnyOrigin],
    ) -> Result


struct ExternalMemoryFd(Copyable):    var _vk_get_memory_fd_khr: fn(
        device: Device,
        pGetFdInfo: Ptr[MemoryGetFdInfoKHR, ImmutAnyOrigin],
        pFd: Ptr[Int32, MutAnyOrigin],
    ) -> Result
    var _vk_get_memory_fd_properties_khr: fn(
        device: Device,
        handleType: ExternalMemoryHandleTypeFlagBits,
        fd: Int32,
        pMemoryFdProperties: Ptr[MemoryFdPropertiesKHR, MutAnyOrigin],
    ) -> Result


struct ExternalSemaphoreCapabilities(Copyable):    var _vk_get_physical_device_external_semaphore_properties: fn(
        physicalDevice: PhysicalDevice,
        pExternalSemaphoreInfo: Ptr[PhysicalDeviceExternalSemaphoreInfo, ImmutAnyOrigin],
        pExternalSemaphoreProperties: Ptr[ExternalSemaphoreProperties, MutAnyOrigin],
    )


struct ExternalSemaphoreWin32(Copyable):    var _vk_import_semaphore_win_32_handle_khr: fn(
        device: Device,
        pImportSemaphoreWin32HandleInfo: Ptr[ImportSemaphoreWin32HandleInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _vk_get_semaphore_win_32_handle_khr: fn(
        device: Device,
        pGetWin32HandleInfo: Ptr[SemaphoreGetWin32HandleInfoKHR, ImmutAnyOrigin],
        pHandle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result


struct ExternalSemaphoreFd(Copyable):    var _vk_import_semaphore_fd_khr: fn(
        device: Device, pImportSemaphoreFdInfo: Ptr[ImportSemaphoreFdInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _vk_get_semaphore_fd_khr: fn(
        device: Device,
        pGetFdInfo: Ptr[SemaphoreGetFdInfoKHR, ImmutAnyOrigin],
        pFd: Ptr[Int32, MutAnyOrigin],
    ) -> Result


struct PushDescriptor(Copyable):    var _vk_cmd_push_descriptor_set: fn(
        commandBuffer: CommandBuffer,
        pipelineBindPoint: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
        descriptorWriteCount: UInt32,
        pDescriptorWrites: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
    )
    var _vk_cmd_push_descriptor_set_with_template: fn(
        commandBuffer: CommandBuffer,
        descriptorUpdateTemplate: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        pData: Ptr[NoneType, ImmutAnyOrigin],
    )


struct DescriptorUpdateTemplate(Copyable):    var _vk_create_descriptor_update_template: fn(
        device: Device,
        pCreateInfo: Ptr[DescriptorUpdateTemplateCreateInfo, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pDescriptorUpdateTemplate: Ptr[DescriptorUpdateTemplate, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_descriptor_update_template: fn(
        device: Device,
        descriptorUpdateTemplate: DescriptorUpdateTemplate,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_update_descriptor_set_with_template: fn(
        device: Device,
        descriptorSet: DescriptorSet,
        descriptorUpdateTemplate: DescriptorUpdateTemplate,
        pData: Ptr[NoneType, ImmutAnyOrigin],
    )
    var _vk_cmd_push_descriptor_set_with_template: fn(
        commandBuffer: CommandBuffer,
        descriptorUpdateTemplate: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        pData: Ptr[NoneType, ImmutAnyOrigin],
    )


struct CreateRenderpass2(Copyable):    var _vk_create_render_pass_2: fn(
        device: Device,
        pCreateInfo: Ptr[RenderPassCreateInfo2, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pRenderPass: Ptr[RenderPass, MutAnyOrigin],
    ) -> Result
    var _vk_cmd_begin_render_pass_2: fn(
        commandBuffer: CommandBuffer,
        pRenderPassBegin: Ptr[RenderPassBeginInfo, ImmutAnyOrigin],
        pSubpassBeginInfo: Ptr[SubpassBeginInfo, ImmutAnyOrigin],
    )
    var _vk_cmd_next_subpass_2: fn(
        commandBuffer: CommandBuffer,
        pSubpassBeginInfo: Ptr[SubpassBeginInfo, ImmutAnyOrigin],
        pSubpassEndInfo: Ptr[SubpassEndInfo, ImmutAnyOrigin],
    )
    var _vk_cmd_end_render_pass_2: fn(
        commandBuffer: CommandBuffer, pSubpassEndInfo: Ptr[SubpassEndInfo, ImmutAnyOrigin]
    )


struct SharedPresentableImage(Copyable):    var _vk_get_swapchain_status_khr: fn(device: Device, swapchain: SwapchainKHR) -> Result


struct ExternalFenceCapabilities(Copyable):    var _vk_get_physical_device_external_fence_properties: fn(
        physicalDevice: PhysicalDevice,
        pExternalFenceInfo: Ptr[PhysicalDeviceExternalFenceInfo, ImmutAnyOrigin],
        pExternalFenceProperties: Ptr[ExternalFenceProperties, MutAnyOrigin],
    )


struct ExternalFenceWin32(Copyable):    var _vk_import_fence_win_32_handle_khr: fn(
        device: Device,
        pImportFenceWin32HandleInfo: Ptr[ImportFenceWin32HandleInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _vk_get_fence_win_32_handle_khr: fn(
        device: Device,
        pGetWin32HandleInfo: Ptr[FenceGetWin32HandleInfoKHR, ImmutAnyOrigin],
        pHandle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result


struct ExternalFenceFd(Copyable):    var _vk_import_fence_fd_khr: fn(
        device: Device, pImportFenceFdInfo: Ptr[ImportFenceFdInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _vk_get_fence_fd_khr: fn(
        device: Device,
        pGetFdInfo: Ptr[FenceGetFdInfoKHR, ImmutAnyOrigin],
        pFd: Ptr[Int32, MutAnyOrigin],
    ) -> Result


struct PerformanceQuery(Copyable):    var _vk_enumerate_physical_device_queue_family_performance_query_counters_khr: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        pCounterCount: Ptr[UInt32, MutAnyOrigin],
        pCounters: Ptr[PerformanceCounterKHR, MutAnyOrigin],
        pCounterDescriptions: Ptr[PerformanceCounterDescriptionKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_queue_family_performance_query_passes_khr: fn(
        physicalDevice: PhysicalDevice,
        pPerformanceQueryCreateInfo: Ptr[QueryPoolPerformanceCreateInfoKHR, ImmutAnyOrigin],
        pNumPasses: Ptr[UInt32, MutAnyOrigin],
    )
    var _vk_acquire_profiling_lock_khr: fn(
        device: Device, pInfo: Ptr[AcquireProfilingLockInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _vk_release_profiling_lock_khr: fn(device: Device)


struct GetSurfaceCapabilities2(Copyable):    var _vk_get_physical_device_surface_capabilities_2_khr: fn(
        physicalDevice: PhysicalDevice,
        pSurfaceInfo: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        pSurfaceCapabilities: Ptr[SurfaceCapabilities2KHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_surface_formats_2_khr: fn(
        physicalDevice: PhysicalDevice,
        pSurfaceInfo: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        pSurfaceFormatCount: Ptr[UInt32, MutAnyOrigin],
        pSurfaceFormats: Ptr[SurfaceFormat2KHR, MutAnyOrigin],
    ) -> Result


struct GetDisplayProperties2(Copyable):    var _vk_get_physical_device_display_properties_2_khr: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[DisplayProperties2KHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_display_plane_properties_2_khr: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[DisplayPlaneProperties2KHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_display_mode_properties_2_khr: fn(
        physicalDevice: PhysicalDevice,
        display: DisplayKHR,
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[DisplayModeProperties2KHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_display_plane_capabilities_2_khr: fn(
        physicalDevice: PhysicalDevice,
        pDisplayPlaneInfo: Ptr[DisplayPlaneInfo2KHR, ImmutAnyOrigin],
        pCapabilities: Ptr[DisplayPlaneCapabilities2KHR, MutAnyOrigin],
    ) -> Result


struct GetMemoryRequirements2(Copyable):    var _vk_get_image_memory_requirements_2: fn(
        device: Device,
        pInfo: Ptr[ImageMemoryRequirementsInfo2, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _vk_get_buffer_memory_requirements_2: fn(
        device: Device,
        pInfo: Ptr[BufferMemoryRequirementsInfo2, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _vk_get_image_sparse_memory_requirements_2: fn(
        device: Device,
        pInfo: Ptr[ImageSparseMemoryRequirementsInfo2, ImmutAnyOrigin],
        pSparseMemoryRequirementCount: Ptr[UInt32, MutAnyOrigin],
        pSparseMemoryRequirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    )


struct AccelerationStructure(Copyable):    var _vk_create_acceleration_structure_khr: fn(
        device: Device,
        pCreateInfo: Ptr[AccelerationStructureCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pAccelerationStructure: Ptr[AccelerationStructureKHR, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_acceleration_structure_khr: fn(
        device: Device,
        accelerationStructure: AccelerationStructureKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_cmd_build_acceleration_structures_khr: fn(
        commandBuffer: CommandBuffer,
        infoCount: UInt32,
        pInfos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        ppBuildRangeInfos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, ImmutAnyOrigin], ImmutAnyOrigin],
    )
    var _vk_cmd_build_acceleration_structures_indirect_khr: fn(
        commandBuffer: CommandBuffer,
        infoCount: UInt32,
        pInfos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        pIndirectDeviceAddresses: Ptr[DeviceAddress, ImmutAnyOrigin],
        pIndirectStrides: Ptr[UInt32, ImmutAnyOrigin],
        ppMaxPrimitiveCounts: Ptr[Ptr[UInt32, ImmutAnyOrigin], ImmutAnyOrigin],
    )
    var _vk_build_acceleration_structures_khr: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        infoCount: UInt32,
        pInfos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        ppBuildRangeInfos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, ImmutAnyOrigin], ImmutAnyOrigin],
    ) -> Result
    var _vk_copy_acceleration_structure_khr: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pInfo: Ptr[CopyAccelerationStructureInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _vk_copy_acceleration_structure_to_memory_khr: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pInfo: Ptr[CopyAccelerationStructureToMemoryInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _vk_copy_memory_to_acceleration_structure_khr: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pInfo: Ptr[CopyMemoryToAccelerationStructureInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _vk_write_acceleration_structures_properties_khr: fn(
        device: Device,
        accelerationStructureCount: UInt32,
        pAccelerationStructures: Ptr[AccelerationStructureKHR, ImmutAnyOrigin],
        queryType: QueryType,
        dataSize: UInt,
        pData: Ptr[NoneType, MutAnyOrigin],
        stride: UInt,
    ) -> Result
    var _vk_cmd_copy_acceleration_structure_khr: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[CopyAccelerationStructureInfoKHR, ImmutAnyOrigin]
    )
    var _vk_cmd_copy_acceleration_structure_to_memory_khr: fn(
        commandBuffer: CommandBuffer,
        pInfo: Ptr[CopyAccelerationStructureToMemoryInfoKHR, ImmutAnyOrigin],
    )
    var _vk_cmd_copy_memory_to_acceleration_structure_khr: fn(
        commandBuffer: CommandBuffer,
        pInfo: Ptr[CopyMemoryToAccelerationStructureInfoKHR, ImmutAnyOrigin],
    )
    var _vk_get_acceleration_structure_device_address_khr: fn(
        device: Device, pInfo: Ptr[AccelerationStructureDeviceAddressInfoKHR, ImmutAnyOrigin]
    ) -> DeviceAddress
    var _vk_cmd_write_acceleration_structures_properties_khr: fn(
        commandBuffer: CommandBuffer,
        accelerationStructureCount: UInt32,
        pAccelerationStructures: Ptr[AccelerationStructureKHR, ImmutAnyOrigin],
        queryType: QueryType,
        queryPool: QueryPool,
        firstQuery: UInt32,
    )
    var _vk_get_device_acceleration_structure_compatibility_khr: fn(
        device: Device,
        pVersionInfo: Ptr[AccelerationStructureVersionInfoKHR, ImmutAnyOrigin],
        pCompatibility: Ptr[AccelerationStructureCompatibilityKHR, MutAnyOrigin],
    )
    var _vk_get_acceleration_structure_build_sizes_khr: fn(
        device: Device,
        buildType: AccelerationStructureBuildTypeKHR,
        pBuildInfo: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        pMaxPrimitiveCounts: Ptr[UInt32, ImmutAnyOrigin],
        pSizeInfo: Ptr[AccelerationStructureBuildSizesInfoKHR, MutAnyOrigin],
    )


struct RayTracingPipeline(Copyable):    var _vk_cmd_trace_rays_khr: fn(
        commandBuffer: CommandBuffer,
        pRaygenShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        pMissShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        pHitShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        pCallableShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        width: UInt32,
        height: UInt32,
        depth: UInt32,
    )
    var _vk_create_ray_tracing_pipelines_khr: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pipelineCache: PipelineCache,
        createInfoCount: UInt32,
        pCreateInfos: Ptr[RayTracingPipelineCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pPipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _vk_get_ray_tracing_shader_group_handles_khr: fn(
        device: Device,
        pipeline: Pipeline,
        firstGroup: UInt32,
        groupCount: UInt32,
        dataSize: UInt,
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_get_ray_tracing_capture_replay_shader_group_handles_khr: fn(
        device: Device,
        pipeline: Pipeline,
        firstGroup: UInt32,
        groupCount: UInt32,
        dataSize: UInt,
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_cmd_trace_rays_indirect_khr: fn(
        commandBuffer: CommandBuffer,
        pRaygenShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        pMissShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        pHitShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        pCallableShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
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
        pCreateInfo: Ptr[SamplerYcbcrConversionCreateInfo, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pYcbcrConversion: Ptr[SamplerYcbcrConversion, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_sampler_ycbcr_conversion: fn(
        device: Device,
        ycbcrConversion: SamplerYcbcrConversion,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )


struct BindMemory2(Copyable):    var _vk_bind_buffer_memory_2: fn(
        device: Device, bindInfoCount: UInt32, pBindInfos: Ptr[BindBufferMemoryInfo, ImmutAnyOrigin]
    ) -> Result
    var _vk_bind_image_memory_2: fn(
        device: Device, bindInfoCount: UInt32, pBindInfos: Ptr[BindImageMemoryInfo, ImmutAnyOrigin]
    ) -> Result


struct Maintenance3(Copyable):    var _vk_get_descriptor_set_layout_support: fn(
        device: Device,
        pCreateInfo: Ptr[DescriptorSetLayoutCreateInfo, ImmutAnyOrigin],
        pSupport: Ptr[DescriptorSetLayoutSupport, MutAnyOrigin],
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
        device: Device, semaphore: Semaphore, pValue: Ptr[UInt64, MutAnyOrigin]
    ) -> Result
    var _vk_wait_semaphores: fn(
        device: Device, pWaitInfo: Ptr[SemaphoreWaitInfo, ImmutAnyOrigin], timeout: UInt64
    ) -> Result
    var _vk_signal_semaphore: fn(
        device: Device, pSignalInfo: Ptr[SemaphoreSignalInfo, ImmutAnyOrigin]
    ) -> Result


struct FragmentShadingRate(Copyable):    var _vk_get_physical_device_fragment_shading_rates_khr: fn(
        physicalDevice: PhysicalDevice,
        pFragmentShadingRateCount: Ptr[UInt32, MutAnyOrigin],
        pFragmentShadingRates: Ptr[PhysicalDeviceFragmentShadingRateKHR, MutAnyOrigin],
    ) -> Result
    var _vk_cmd_set_fragment_shading_rate_khr: fn(
        commandBuffer: CommandBuffer,
        pFragmentSize: Ptr[Extent2D, ImmutAnyOrigin],
        combinerOps: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    )


struct DynamicRenderingLocalRead(Copyable):    var _vk_cmd_set_rendering_attachment_locations: fn(
        commandBuffer: CommandBuffer,
        pLocationInfo: Ptr[RenderingAttachmentLocationInfo, ImmutAnyOrigin],
    )
    var _vk_cmd_set_rendering_input_attachment_indices: fn(
        commandBuffer: CommandBuffer,
        pInputAttachmentIndexInfo: Ptr[RenderingInputAttachmentIndexInfo, ImmutAnyOrigin],
    )


struct PresentWait(Copyable):    var _vk_wait_for_present_khr: fn(
        device: Device, swapchain: SwapchainKHR, presentId: UInt64, timeout: UInt64
    ) -> Result


struct BufferDeviceAddress(Copyable):    var _vk_get_buffer_device_address: fn(
        device: Device, pInfo: Ptr[BufferDeviceAddressInfo, ImmutAnyOrigin]
    ) -> DeviceAddress
    var _vk_get_buffer_opaque_capture_address: fn(
        device: Device, pInfo: Ptr[BufferDeviceAddressInfo, ImmutAnyOrigin]
    ) -> UInt64
    var _vk_get_device_memory_opaque_capture_address: fn(
        device: Device, pInfo: Ptr[DeviceMemoryOpaqueCaptureAddressInfo, ImmutAnyOrigin]
    ) -> UInt64


struct DeferredHostOperations(Copyable):    var _vk_create_deferred_operation_khr: fn(
        device: Device,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pDeferredOperation: Ptr[DeferredOperationKHR, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_deferred_operation_khr: fn(
        device: Device,
        operation: DeferredOperationKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
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
        pPipelineInfo: Ptr[PipelineInfoKHR, ImmutAnyOrigin],
        pExecutableCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[PipelineExecutablePropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_pipeline_executable_statistics_khr: fn(
        device: Device,
        pExecutableInfo: Ptr[PipelineExecutableInfoKHR, ImmutAnyOrigin],
        pStatisticCount: Ptr[UInt32, MutAnyOrigin],
        pStatistics: Ptr[PipelineExecutableStatisticKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_pipeline_executable_internal_representations_khr: fn(
        device: Device,
        pExecutableInfo: Ptr[PipelineExecutableInfoKHR, ImmutAnyOrigin],
        pInternalRepresentationCount: Ptr[UInt32, MutAnyOrigin],
        pInternalRepresentations: Ptr[PipelineExecutableInternalRepresentationKHR, MutAnyOrigin],
    ) -> Result


struct MapMemory2(Copyable):    var _vk_map_memory_2: fn(
        device: Device,
        pMemoryMapInfo: Ptr[MemoryMapInfo, ImmutAnyOrigin],
        ppData: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    ) -> Result
    var _vk_unmap_memory_2: fn(
        device: Device, pMemoryUnmapInfo: Ptr[MemoryUnmapInfo, ImmutAnyOrigin]
    ) -> Result


struct VideoEncodeQueue(Copyable):    var _vk_get_physical_device_video_encode_quality_level_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        pQualityLevelInfo: Ptr[PhysicalDeviceVideoEncodeQualityLevelInfoKHR, ImmutAnyOrigin],
        pQualityLevelProperties: Ptr[VideoEncodeQualityLevelPropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_encoded_video_session_parameters_khr: fn(
        device: Device,
        pVideoSessionParametersInfo: Ptr[VideoEncodeSessionParametersGetInfoKHR, ImmutAnyOrigin],
        pFeedbackInfo: Ptr[VideoEncodeSessionParametersFeedbackInfoKHR, MutAnyOrigin],
        pDataSize: Ptr[UInt, MutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_cmd_encode_video_khr: fn(
        commandBuffer: CommandBuffer, pEncodeInfo: Ptr[VideoEncodeInfoKHR, ImmutAnyOrigin]
    )


struct Synchronization2(Copyable):    var _vk_cmd_set_event_2: fn(
        commandBuffer: CommandBuffer,
        event: Event,
        pDependencyInfo: Ptr[DependencyInfo, ImmutAnyOrigin],
    )
    var _vk_cmd_reset_event_2: fn(
        commandBuffer: CommandBuffer, event: Event, stageMask: PipelineStageFlags2
    )
    var _vk_cmd_wait_events_2: fn(
        commandBuffer: CommandBuffer,
        eventCount: UInt32,
        pEvents: Ptr[Event, ImmutAnyOrigin],
        pDependencyInfos: Ptr[DependencyInfo, ImmutAnyOrigin],
    )
    var _vk_cmd_pipeline_barrier_2: fn(
        commandBuffer: CommandBuffer, pDependencyInfo: Ptr[DependencyInfo, ImmutAnyOrigin]
    )
    var _vk_cmd_write_timestamp_2: fn(
        commandBuffer: CommandBuffer,
        stage: PipelineStageFlags2,
        queryPool: QueryPool,
        query: UInt32,
    )
    var _vk_queue_submit_2: fn(
        queue: Queue, submitCount: UInt32, pSubmits: Ptr[SubmitInfo2, ImmutAnyOrigin], fence: Fence
    ) -> Result


struct CopyCommands2(Copyable):    var _vk_cmd_copy_buffer_2: fn(
        commandBuffer: CommandBuffer, pCopyBufferInfo: Ptr[CopyBufferInfo2, ImmutAnyOrigin]
    )
    var _vk_cmd_copy_image_2: fn(
        commandBuffer: CommandBuffer, pCopyImageInfo: Ptr[CopyImageInfo2, ImmutAnyOrigin]
    )
    var _vk_cmd_copy_buffer_to_image_2: fn(
        commandBuffer: CommandBuffer,
        pCopyBufferToImageInfo: Ptr[CopyBufferToImageInfo2, ImmutAnyOrigin],
    )
    var _vk_cmd_copy_image_to_buffer_2: fn(
        commandBuffer: CommandBuffer,
        pCopyImageToBufferInfo: Ptr[CopyImageToBufferInfo2, ImmutAnyOrigin],
    )
    var _vk_cmd_blit_image_2: fn(
        commandBuffer: CommandBuffer, pBlitImageInfo: Ptr[BlitImageInfo2, ImmutAnyOrigin]
    )
    var _vk_cmd_resolve_image_2: fn(
        commandBuffer: CommandBuffer, pResolveImageInfo: Ptr[ResolveImageInfo2, ImmutAnyOrigin]
    )


struct RayTracingMaintenance1(Copyable):    var _vk_cmd_trace_rays_indirect_2_khr: fn(
        commandBuffer: CommandBuffer, indirectDeviceAddress: DeviceAddress
    )


struct Maintenance4(Copyable):    var _vk_get_device_buffer_memory_requirements: fn(
        device: Device,
        pInfo: Ptr[DeviceBufferMemoryRequirements, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _vk_get_device_image_memory_requirements: fn(
        device: Device,
        pInfo: Ptr[DeviceImageMemoryRequirements, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _vk_get_device_image_sparse_memory_requirements: fn(
        device: Device,
        pInfo: Ptr[DeviceImageMemoryRequirements, ImmutAnyOrigin],
        pSparseMemoryRequirementCount: Ptr[UInt32, MutAnyOrigin],
        pSparseMemoryRequirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
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
        pRenderingAreaInfo: Ptr[RenderingAreaInfo, ImmutAnyOrigin],
        pGranularity: Ptr[Extent2D, MutAnyOrigin],
    )
    var _vk_get_device_image_subresource_layout: fn(
        device: Device,
        pInfo: Ptr[DeviceImageSubresourceInfo, ImmutAnyOrigin],
        pLayout: Ptr[SubresourceLayout2, MutAnyOrigin],
    )
    var _vk_get_image_subresource_layout_2: fn(
        device: Device,
        image: Image,
        pSubresource: Ptr[ImageSubresource2, ImmutAnyOrigin],
        pLayout: Ptr[SubresourceLayout2, MutAnyOrigin],
    )


struct PresentWait2(Copyable):    var _vk_wait_for_present_2_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pPresentWait2Info: Ptr[PresentWait2InfoKHR, ImmutAnyOrigin],
    ) -> Result


struct PipelineBinary(Copyable):    var _vk_create_pipeline_binaries_khr: fn(
        device: Device,
        pCreateInfo: Ptr[PipelineBinaryCreateInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pBinaries: Ptr[PipelineBinaryHandlesInfoKHR, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_pipeline_binary_khr: fn(
        device: Device,
        pipelineBinary: PipelineBinaryKHR,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_get_pipeline_key_khr: fn(
        device: Device,
        pPipelineCreateInfo: Ptr[PipelineCreateInfoKHR, ImmutAnyOrigin],
        pPipelineKey: Ptr[PipelineBinaryKeyKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_pipeline_binary_data_khr: fn(
        device: Device,
        pInfo: Ptr[PipelineBinaryDataInfoKHR, ImmutAnyOrigin],
        pPipelineBinaryKey: Ptr[PipelineBinaryKeyKHR, MutAnyOrigin],
        pPipelineBinaryDataSize: Ptr[UInt, MutAnyOrigin],
        pPipelineBinaryData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_release_captured_pipeline_data_khr: fn(
        device: Device,
        pInfo: Ptr[ReleaseCapturedPipelineDataInfoKHR, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ) -> Result


struct SwapchainMaintenance1(Copyable):    var _vk_release_swapchain_images_khr: fn(
        device: Device, pReleaseInfo: Ptr[ReleaseSwapchainImagesInfoKHR, ImmutAnyOrigin]
    ) -> Result


struct CooperativeMatrix(Copyable):    var _vk_get_physical_device_cooperative_matrix_properties_khr: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[CooperativeMatrixPropertiesKHR, MutAnyOrigin],
    ) -> Result


struct LineRasterization(Copyable):    var _vk_cmd_set_line_stipple: fn(
        commandBuffer: CommandBuffer, lineStippleFactor: UInt32, lineStipplePattern: UInt16
    )


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


struct Maintenance6(Copyable):    var _vk_cmd_bind_descriptor_sets_2: fn(
        commandBuffer: CommandBuffer,
        pBindDescriptorSetsInfo: Ptr[BindDescriptorSetsInfo, ImmutAnyOrigin],
    )
    var _vk_cmd_push_constants_2: fn(
        commandBuffer: CommandBuffer, pPushConstantsInfo: Ptr[PushConstantsInfo, ImmutAnyOrigin]
    )
    var _vk_cmd_push_descriptor_set_2: fn(
        commandBuffer: CommandBuffer,
        pPushDescriptorSetInfo: Ptr[PushDescriptorSetInfo, ImmutAnyOrigin],
    )
    var _vk_cmd_push_descriptor_set_with_template_2: fn(
        commandBuffer: CommandBuffer,
        pPushDescriptorSetWithTemplateInfo: Ptr[PushDescriptorSetWithTemplateInfo, ImmutAnyOrigin],
    )
    var _vk_cmd_set_descriptor_buffer_offsets_2_ext: fn(
        commandBuffer: CommandBuffer,
        pSetDescriptorBufferOffsetsInfo: Ptr[SetDescriptorBufferOffsetsInfoEXT, ImmutAnyOrigin],
    )
    var _vk_cmd_bind_descriptor_buffer_embedded_samplers_2_ext: fn(
        commandBuffer: CommandBuffer,
        pBindDescriptorBufferEmbeddedSamplersInfo: Ptr[BindDescriptorBufferEmbeddedSamplersInfoEXT, ImmutAnyOrigin],
    )
