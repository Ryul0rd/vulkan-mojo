from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct IosSurface(Copyable):    var _vk_create_ios_surface_mvk: fn(
        instance: Instance,
        pCreateInfo: Ptr[IOSSurfaceCreateInfoMVK, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result


struct MacosSurface(Copyable):    var _vk_create_mac_os_surface_mvk: fn(
        instance: Instance,
        pCreateInfo: Ptr[MacOSSurfaceCreateInfoMVK, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
