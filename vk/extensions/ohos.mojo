from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ExternalMemory(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_native_buffer_properties: def(
        device: Device,
        buffer: Ptr[OH_NativeBuffer, ImmutUntrackedOrigin],
        p_properties: Ptr[NativeBufferPropertiesOHOS, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_memory_native_buffer: def(
        device: Device,
        p_info: Ptr[MemoryGetNativeBufferInfoOHOS, ImmutUntrackedOrigin],
        p_buffer: Ptr[Ptr[OH_NativeBuffer, MutUntrackedOrigin], MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_native_buffer_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetNativeBufferPropertiesOHOS".as_c_string_slice()
        )).bitcast[type_of(self._get_native_buffer_properties)]()[]
        self._get_memory_native_buffer = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryNativeBufferOHOS".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_native_buffer)]()[]

    def get_native_buffer_properties(
        self, device: Device, buffer: OH_NativeBuffer, mut properties: NativeBufferPropertiesOHOS
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetNativeBufferPropertiesOHOS.html
        """
        return self._get_native_buffer_properties(
            device,
            Ptr(to=buffer).bitcast[OH_NativeBuffer]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=properties).bitcast[NativeBufferPropertiesOHOS]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_memory_native_buffer[buffer_origin: MutOrigin](
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
            Ptr(to=info).bitcast[MemoryGetNativeBufferInfoOHOS]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=buffer).bitcast[Ptr[OH_NativeBuffer, MutUntrackedOrigin]]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct Surface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_surface: def(
        instance: Instance,
        p_create_info: Ptr[SurfaceCreateInfoOHOS, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_surface: Ptr[SurfaceKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateSurfaceOHOS".as_c_string_slice()
        )).bitcast[type_of(self._create_surface)]()[]

    def create_surface[p_allocator_origin: ImmutOrigin](
        self,
        instance: Instance,
        create_info: SurfaceCreateInfoOHOS,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSurfaceOHOS.html
        """
        return self._create_surface(
            instance,
            Ptr(to=create_info).bitcast[SurfaceCreateInfoOHOS]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=surface).bitcast[SurfaceKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )
