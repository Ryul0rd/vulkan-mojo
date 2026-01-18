from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ScreenSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_screen_surface_qnx: fn(
        instance: Instance,
        p_create_info: Ptr[ScreenSurfaceCreateInfoQNX, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_screen_presentation_support_qnx: fn(
        physical_device: PhysicalDevice, queue_family_index: UInt32, window: screen_window_t
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_screen_surface_qnx = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateScreenSurfaceQNX".as_c_string_slice()
        )).bitcast[type_of(self._create_screen_surface_qnx)]()[]
        self._get_physical_device_screen_presentation_support_qnx = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceScreenPresentationSupportQNX".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_screen_presentation_support_qnx)]()[]

    fn create_screen_surface_qnx[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: ScreenSurfaceCreateInfoQNX,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateScreenSurfaceQNX.html
        """
        return self._create_screen_surface_qnx(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )

    fn get_physical_device_screen_presentation_support_qnx(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32, window: screen_window_t
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceScreenPresentationSupportQNX.html
        """
        return self._get_physical_device_screen_presentation_support_qnx(
            physical_device, queue_family_index, window
        )


struct ExternalMemoryScreenBuffer(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_screen_buffer_properties_qnx: fn(
        device: Device,
        buffer: screen_buffer_t,
        p_properties: Ptr[ScreenBufferPropertiesQNX, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_screen_buffer_properties_qnx = Ptr(to=get_device_proc_addr(
            device, "vkGetScreenBufferPropertiesQNX".as_c_string_slice()
        )).bitcast[type_of(self._get_screen_buffer_properties_qnx)]()[]

    fn get_screen_buffer_properties_qnx(
        self, device: Device, buffer: screen_buffer_t, mut properties: ScreenBufferPropertiesQNX
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetScreenBufferPropertiesQNX.html
        """
        return self._get_screen_buffer_properties_qnx(device, buffer, Ptr(to=properties))
