from ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ExternalMemory(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_native_buffer_properties: fn(
        device: Device,
        buffer: Ptr[OH_NativeBuffer, ImmutAnyOrigin],
        p_properties: Ptr[NativeBufferPropertiesOHOS, MutAnyOrigin],
    ) -> Result
    var _get_memory_native_buffer: fn(
        device: Device,
        p_info: Ptr[MemoryGetNativeBufferInfoOHOS, ImmutAnyOrigin],
        p_buffer: Ptr[Ptr[OH_NativeBuffer, MutAnyOrigin], MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_native_buffer_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetNativeBufferPropertiesOHOS".as_c_string_slice()
        )).bitcast[type_of(self._get_native_buffer_properties)]()[]
        self._get_memory_native_buffer = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryNativeBufferOHOS".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_native_buffer)]()[]

    fn get_native_buffer_properties(
        self, device: Device, buffer: OH_NativeBuffer, mut properties: NativeBufferPropertiesOHOS
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetNativeBufferPropertiesOHOS.html
        """
        return self._get_native_buffer_properties(device, Ptr(to=buffer), Ptr(to=properties))

    fn get_memory_native_buffer[buffer_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: MemoryGetNativeBufferInfoOHOS,
        mut buffer: Ptr[OH_NativeBuffer, buffer_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryNativeBufferOHOS.html
        """
        return self._get_memory_native_buffer(
            device,
            Ptr(to=info),
            Ptr(to=Ptr(to=buffer)).bitcast[Ptr[Ptr[OH_NativeBuffer, MutAnyOrigin], MutAnyOrigin]]()[],
        )


struct Surface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_surface: fn(
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
        self._create_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateSurfaceOHOS".as_c_string_slice()
        )).bitcast[type_of(self._create_surface)]()[]

    fn create_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: SurfaceCreateInfoOHOS,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSurfaceOHOS.html
        """
        return self._create_surface(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )
