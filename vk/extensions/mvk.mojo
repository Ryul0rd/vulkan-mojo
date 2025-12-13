from vk.core_functions import GlobalFunctions


struct IosSurface(Copyable):    var _vk_create_ios_surface_mvk: fn(
        instance: Instance,
        pCreateInfo: Ptr[IOSSurfaceCreateInfoMVK, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result


struct MacosSurface(Copyable):    var _vk_create_mac_os_surface_mvk: fn(
        instance: Instance,
        pCreateInfo: Ptr[MacOSSurfaceCreateInfoMVK, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
