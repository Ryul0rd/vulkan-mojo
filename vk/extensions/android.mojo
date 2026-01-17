from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ExternalMemoryAndroidHardwareBuffer(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_android_hardware_buffer_properties_android: fn(
        device: Device,
        buffer: Ptr[AHardwareBuffer, ImmutAnyOrigin],
        p_properties: Ptr[AndroidHardwareBufferPropertiesANDROID, MutAnyOrigin],
    ) -> Result
    var _get_memory_android_hardware_buffer_android: fn(
        device: Device,
        p_info: Ptr[MemoryGetAndroidHardwareBufferInfoANDROID, ImmutAnyOrigin],
        p_buffer: Ptr[Ptr[AHardwareBuffer, MutAnyOrigin], MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_android_hardware_buffer_properties_android = Ptr(to=get_device_proc_addr(
            device, "vkGetAndroidHardwareBufferPropertiesANDROID".as_c_string_slice()
        )).bitcast[type_of(self._get_android_hardware_buffer_properties_android)]()[]
        self._get_memory_android_hardware_buffer_android = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryAndroidHardwareBufferANDROID".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_android_hardware_buffer_android)]()[]

    fn get_android_hardware_buffer_properties_android(
        self,
        device: Device,
        buffer: AHardwareBuffer,
        mut properties: AndroidHardwareBufferPropertiesANDROID,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAndroidHardwareBufferPropertiesANDROID.html
        """
        return self._get_android_hardware_buffer_properties_android(
            device,
            Ptr(to=buffer).bitcast[AHardwareBuffer](),
            Ptr(to=properties).bitcast[AndroidHardwareBufferPropertiesANDROID](),
        )

    fn get_memory_android_hardware_buffer_android(
        self,
        device: Device,
        info: MemoryGetAndroidHardwareBufferInfoANDROID,
        mut buffer: Ptr[AHardwareBuffer, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryAndroidHardwareBufferANDROID.html
        """
        return self._get_memory_android_hardware_buffer_android(
            device,
            Ptr(to=info).bitcast[MemoryGetAndroidHardwareBufferInfoANDROID](),
            Ptr(to=buffer).bitcast[Ptr[AHardwareBuffer, MutAnyOrigin]](),
        )
