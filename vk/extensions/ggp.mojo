from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct StreamDescriptorSurface(Copyable):    var _vk_create_stream_descriptor_surface_ggp: fn(
        instance: Instance,
        pCreateInfo: Ptr[StreamDescriptorSurfaceCreateInfoGGP, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
