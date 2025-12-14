from vk.core_functions import GlobalFunctions


struct ScreenSurface(Copyable):    var _vk_create_screen_surface_qnx: fn(
        instance: Instance,
        pCreateInfo: Ptr[ScreenSurfaceCreateInfoQNX, MutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_screen_presentation_support_qnx: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        window: Ptr[_screen_window, MutOrigin.external],
    ) -> Bool32


struct ExternalMemoryScreenBuffer(Copyable):    var _vk_get_screen_buffer_properties_qnx: fn(
        device: Device,
        buffer: Ptr[_screen_buffer, MutOrigin.external],
        pProperties: Ptr[ScreenBufferPropertiesQNX, MutOrigin.external],
    ) -> Result
