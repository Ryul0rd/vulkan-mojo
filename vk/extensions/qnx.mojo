from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct ScreenSurface(Copyable):    var _vk_create_screen_surface_qnx: fn(
        instance: Instance,
        pCreateInfo: Ptr[ScreenSurfaceCreateInfoQNX, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_screen_presentation_support_qnx: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        window: Ptr[_screen_window, MutAnyOrigin],
    ) -> Bool32


struct ExternalMemoryScreenBuffer(Copyable):    var _vk_get_screen_buffer_properties_qnx: fn(
        device: Device,
        buffer: Ptr[_screen_buffer, ImmutAnyOrigin],
        pProperties: Ptr[ScreenBufferPropertiesQNX, MutAnyOrigin],
    ) -> Result
