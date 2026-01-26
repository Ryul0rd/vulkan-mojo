from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ExternalMemory(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_native_buffer_properties_ohos: fn(
        device: Device,
        buffer: Ptr[OH_NativeBuffer, ImmutAnyOrigin],
        p_properties: Ptr[NativeBufferPropertiesOHOS, MutAnyOrigin],
    ) -> Result
    var _get_memory_native_buffer_ohos: fn(
        device: Device,
        p_info: Ptr[MemoryGetNativeBufferInfoOHOS, ImmutAnyOrigin],
        p_buffer: Ptr[Ptr[OH_NativeBuffer, MutAnyOrigin], MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_native_buffer_properties_ohos = Ptr(to=get_device_proc_addr(
            device, "vkGetNativeBufferPropertiesOHOS".as_c_string_slice()
        )).bitcast[type_of(self._get_native_buffer_properties_ohos)]()[]
        self._get_memory_native_buffer_ohos = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryNativeBufferOHOS".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_native_buffer_ohos)]()[]

    fn get_native_buffer_properties_ohos(
        self, device: Device, buffer: OH_NativeBuffer, mut properties: NativeBufferPropertiesOHOS
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetNativeBufferPropertiesOHOS.html
        """
        return self._get_native_buffer_properties_ohos(device, Ptr(to=buffer), Ptr(to=properties))

    fn get_memory_native_buffer_ohos[buffer_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: MemoryGetNativeBufferInfoOHOS,
        mut buffer: Ptr[OH_NativeBuffer, buffer_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryNativeBufferOHOS.html
        """
        return self._get_memory_native_buffer_ohos(
            device,
            Ptr(to=info),
            Ptr(to=Ptr(to=buffer)).bitcast[Ptr[Ptr[OH_NativeBuffer, MutAnyOrigin], MutAnyOrigin]]()[],
        )


struct Surface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_surface_ohos: fn(
        instance: Instance,
        p_create_info: Ptr[SurfaceCreateInfoOHOS, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_surface_ohos = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateSurfaceOHOS".as_c_string_slice()
        )).bitcast[type_of(self._create_surface_ohos)]()[]

    fn create_surface_ohos[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: SurfaceCreateInfoOHOS,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSurfaceOHOS.html
        """
        return self._create_surface_ohos(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )
