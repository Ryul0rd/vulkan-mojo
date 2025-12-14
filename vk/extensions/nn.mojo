from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct ViSurface(Copyable):    var _vk_create_vi_surface_nn: fn(
        instance: Instance,
        pCreateInfo: Ptr[ViSurfaceCreateInfoNN, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
