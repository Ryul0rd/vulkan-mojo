from vk.core_functions import GlobalFunctions


struct IosSurface(Copyable):    var _vk_create_ios_surface_mvk: fn(
        instance: Instance,
        pCreateInfo: Ptr[IOSSurfaceCreateInfoMVK, MutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result


struct MacosSurface(Copyable):    var _vk_create_mac_os_surface_mvk: fn(
        instance: Instance,
        pCreateInfo: Ptr[MacOSSurfaceCreateInfoMVK, MutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
