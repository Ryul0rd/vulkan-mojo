from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct ExternalMemoryAndroidHardwareBuffer(Copyable):    var _vk_get_android_hardware_buffer_properties_android: fn(
        device: Device,
        buffer: Ptr[AHardwareBuffer, ImmutAnyOrigin],
        pProperties: Ptr[AndroidHardwareBufferPropertiesANDROID, MutAnyOrigin],
    ) -> Result
    var _vk_get_memory_android_hardware_buffer_android: fn(
        device: Device,
        pInfo: Ptr[MemoryGetAndroidHardwareBufferInfoANDROID, ImmutAnyOrigin],
        pBuffer: Ptr[Ptr[AHardwareBuffer, MutAnyOrigin], MutAnyOrigin],
    ) -> Result
