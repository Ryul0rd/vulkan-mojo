from vk.core_functions import GlobalFunctions


struct ExternalMemoryAndroidHardwareBuffer(Copyable):    var _vk_get_android_hardware_buffer_properties_android: fn(
        device: Device,
        buffer: Ptr[AHardwareBuffer, MutOrigin.external],
        pProperties: Ptr[AndroidHardwareBufferPropertiesANDROID, MutOrigin.external],
    ) -> Result
    var _vk_get_memory_android_hardware_buffer_android: fn(
        device: Device,
        pInfo: Ptr[MemoryGetAndroidHardwareBufferInfoANDROID, MutOrigin.external],
        pBuffer: Ptr[Ptr[AHardwareBuffer, MutOrigin.external], MutOrigin.external],
    ) -> Result
