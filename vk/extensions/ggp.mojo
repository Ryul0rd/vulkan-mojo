from vk.core_functions import GlobalFunctions


struct StreamDescriptorSurface(Copyable):    var _vk_create_stream_descriptor_surface_ggp: fn(
        instance: Instance,
        pCreateInfo: Ptr[StreamDescriptorSurfaceCreateInfoGGP, MutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
