from vk.core_functions import GlobalFunctions


struct StreamDescriptorSurface(Copyable):    var _vk_create_stream_descriptor_surface_ggp: fn(
        instance: Instance,
        pCreateInfo: Ptr[StreamDescriptorSurfaceCreateInfoGGP, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result
