from vk.core_functions import GlobalFunctions


struct ViSurface(Copyable):    var _vk_create_vi_surface_nn: fn(
        instance: Instance,
        pCreateInfo: Ptr[ViSurfaceCreateInfoNN, MutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
