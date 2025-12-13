from vk.core_functions import GlobalFunctions


struct ViSurface(Copyable):    var _vk_create_vi_surface_nn: fn(
        instance: Instance,
        pCreateInfo: Ptr[ViSurfaceCreateInfoNN, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
