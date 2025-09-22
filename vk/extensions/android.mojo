from vk.core_functions import GlobalFunctions


struct ExternalMemoryAndroidHardwareBuffer(Copyable, Movable):
    var _get_android_hardware_buffer_properties_android: fn(
        device: Device, buffer: Ptr[AHardwareBuffer], pProperties: Ptr[AndroidHardwareBufferPropertiesANDROID]
    ) -> Result
    var _get_memory_android_hardware_buffer_android: fn(
        device: Device, pInfo: Ptr[MemoryGetAndroidHardwareBufferInfoANDROID], pBuffer: Ptr[Ptr[AHardwareBuffer]]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_android_hardware_buffer_properties_android = Ptr(to=get_device_proc_addr(
            device, "vkGetAndroidHardwareBufferPropertiesANDROID".unsafe_ptr()
        )).bitcast[__type_of(self._get_android_hardware_buffer_properties_android)]()[]
        self._get_memory_android_hardware_buffer_android = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryAndroidHardwareBufferANDROID".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_android_hardware_buffer_android)]()[]

    fn get_android_hardware_buffer_properties_android(
        self,
        device: Device,
        buffer: AHardwareBuffer,
        mut properties: AndroidHardwareBufferPropertiesANDROID,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_android_hardware_buffer_properties_android(
            device, Ptr(to=buffer), Ptr(to=properties)
        )

    fn get_memory_android_hardware_buffer_android(
        self,
        device: Device,
        info: MemoryGetAndroidHardwareBufferInfoANDROID,
        p_buffer: Ptr[Ptr[AHardwareBuffer]],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_android_hardware_buffer_android(device, Ptr(to=info), p_buffer)
