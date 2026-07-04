from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ExternalMemoryAndroidHardwareBuffer(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_android_hardware_buffer_properties: def(
        device: Device,
        buffer: Ptr[AHardwareBuffer, ImmutAnyOrigin],
        p_properties: Ptr[AndroidHardwareBufferPropertiesANDROID, MutAnyOrigin],
    ) thin abi("C") -> Result
    var _get_memory_android_hardware_buffer: def(
        device: Device,
        p_info: Ptr[MemoryGetAndroidHardwareBufferInfoANDROID, ImmutAnyOrigin],
        p_buffer: Ptr[Ptr[AHardwareBuffer, MutAnyOrigin], MutAnyOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_android_hardware_buffer_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetAndroidHardwareBufferPropertiesANDROID".as_c_string_slice()
        )).bitcast[type_of(self._get_android_hardware_buffer_properties)]()[]
        self._get_memory_android_hardware_buffer = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryAndroidHardwareBufferANDROID".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_android_hardware_buffer)]()[]

    def get_android_hardware_buffer_properties(
        self,
        device: Device,
        buffer: AHardwareBuffer,
        mut properties: AndroidHardwareBufferPropertiesANDROID,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAndroidHardwareBufferPropertiesANDROID.html
        """
        return self._get_android_hardware_buffer_properties(device, Ptr(to=buffer), Ptr(to=properties))

    def get_memory_android_hardware_buffer[buffer_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: MemoryGetAndroidHardwareBufferInfoANDROID,
        mut buffer: Ptr[AHardwareBuffer, buffer_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryAndroidHardwareBufferANDROID.html
        """
        return self._get_memory_android_hardware_buffer(
            device,
            Ptr(to=info),
            Ptr(to=Ptr(to=buffer)).bitcast[Ptr[Ptr[AHardwareBuffer, MutAnyOrigin], MutAnyOrigin]]()[],
        )
