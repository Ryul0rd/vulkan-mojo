from vk.core_functions import GlobalFunctions


struct ScreenSurface(Copyable, Movable):
    var _create_screen_surface_qnx: fn(
        instance: Instance, pCreateInfo: Ptr[ScreenSurfaceCreateInfoQNX], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result
    var _get_physical_device_screen_presentation_support_qnx: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32, window: screen_window_t
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_screen_surface_qnx = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateScreenSurfaceQNX".unsafe_ptr()
        )).bitcast[__type_of(self._create_screen_surface_qnx)]()[]
        self._get_physical_device_screen_presentation_support_qnx = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceScreenPresentationSupportQNX".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_screen_presentation_support_qnx)]()[]

    fn create_screen_surface_qnx(
        self,
        instance: Instance,
        create_info: ScreenSurfaceCreateInfoQNX,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_screen_surface_qnx(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )

    fn get_physical_device_screen_presentation_support_qnx(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut window: screen_window_t,
    ) -> Bool32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_screen_presentation_support_qnx(
            physical_device, queue_family_index, window
        )


struct ExternalMemoryScreenBuffer(Copyable, Movable):
    var _get_screen_buffer_properties_qnx: fn(
        device: Device, buffer: screen_buffer_t, pProperties: Ptr[ScreenBufferPropertiesQNX]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_screen_buffer_properties_qnx = Ptr(to=get_device_proc_addr(
            device, "vkGetScreenBufferPropertiesQNX".unsafe_ptr()
        )).bitcast[__type_of(self._get_screen_buffer_properties_qnx)]()[]

    fn get_screen_buffer_properties_qnx(
        self, device: Device, buffer: screen_buffer_t, mut properties: ScreenBufferPropertiesQNX
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_screen_buffer_properties_qnx(device, buffer, Ptr(to=properties))
