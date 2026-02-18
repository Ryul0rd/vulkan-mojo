from ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct Surface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _destroy_surface: fn(
        instance: Instance, surface: SurfaceKHR, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _get_physical_device_surface_support: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        surface: SurfaceKHR,
        p_supported: Ptr[Bool32, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_surface_capabilities: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_surface_capabilities: Ptr[SurfaceCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_surface_formats: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_surface_format_count: Ptr[UInt32, MutAnyOrigin],
        p_surface_formats: Ptr[SurfaceFormatKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_surface_present_modes: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_present_mode_count: Ptr[UInt32, MutAnyOrigin],
        p_present_modes: Ptr[PresentModeKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._destroy_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroySurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_surface)]()[]
        self._get_physical_device_surface_support = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceSupportKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_support)]()[]
        self._get_physical_device_surface_capabilities = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_capabilities)]()[]
        self._get_physical_device_surface_formats = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceFormatsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_formats)]()[]
        self._get_physical_device_surface_present_modes = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfacePresentModesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_present_modes)]()[]

    fn destroy_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        surface: SurfaceKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySurfaceKHR.html
        """
        return self._destroy_surface(
            instance, surface, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn get_physical_device_surface_support(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        surface: SurfaceKHR,
        mut supported: Bool32,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceSupportKHR.html
        """
        return self._get_physical_device_surface_support(
            physical_device, queue_family_index, surface, Ptr(to=supported)
        )

    fn get_physical_device_surface_capabilities(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_capabilities: SurfaceCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceCapabilitiesKHR.html
        """
        return self._get_physical_device_surface_capabilities(
            physical_device, surface, Ptr(to=surface_capabilities)
        )

    fn get_physical_device_surface_formats[p_surface_formats_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_format_count: UInt32,
        p_surface_formats: Ptr[SurfaceFormatKHR, p_surface_formats_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceFormatsKHR.html
        """
        return self._get_physical_device_surface_formats(
            physical_device,
            surface,
            Ptr(to=surface_format_count),
            Ptr(to=p_surface_formats).bitcast[Ptr[SurfaceFormatKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_surface_formats[p_surface_formats_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice, surface: SurfaceKHR
    ) -> ListResult[SurfaceFormatKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceFormatsKHR.html
        """
        var list = List[SurfaceFormatKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_surface_formats(
        physical_device, surface, Ptr(to=count), Ptr[SurfaceFormatKHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_surface_formats(
        physical_device, surface, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_surface_present_modes[p_present_modes_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut present_mode_count: UInt32,
        p_present_modes: Ptr[PresentModeKHR, p_present_modes_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfacePresentModesKHR.html
        """
        return self._get_physical_device_surface_present_modes(
            physical_device,
            surface,
            Ptr(to=present_mode_count),
            Ptr(to=p_present_modes).bitcast[Ptr[PresentModeKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_surface_present_modes[p_present_modes_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice, surface: SurfaceKHR
    ) -> ListResult[PresentModeKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfacePresentModesKHR.html
        """
        var list = List[PresentModeKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_surface_present_modes(
        physical_device, surface, Ptr(to=count), Ptr[PresentModeKHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_surface_present_modes(
        physical_device, surface, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct Swapchain(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_swapchain: fn(
        device: Device,
        p_create_info: Ptr[SwapchainCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_swapchain: Ptr[SwapchainKHR, MutAnyOrigin],
    ) -> Result
    var _destroy_swapchain: fn(
        device: Device, swapchain: SwapchainKHR, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _get_swapchain_images: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_swapchain_image_count: Ptr[UInt32, MutAnyOrigin],
        p_swapchain_images: Ptr[Image, MutAnyOrigin],
    ) -> Result
    var _acquire_next_image: fn(
        device: Device,
        swapchain: SwapchainKHR,
        timeout: UInt64,
        semaphore: Semaphore,
        fence: Fence,
        p_image_index: Ptr[UInt32, MutAnyOrigin],
    ) -> Result
    var _queue_present: fn(queue: Queue, p_present_info: Ptr[PresentInfoKHR, ImmutAnyOrigin]) -> Result
    var _get_device_group_present_capabilities: fn(
        device: Device,
        p_device_group_present_capabilities: Ptr[DeviceGroupPresentCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_device_group_surface_present_modes: fn(
        device: Device, surface: SurfaceKHR, p_modes: Ptr[DeviceGroupPresentModeFlagsKHR, MutAnyOrigin]
    ) -> Result
    var _get_physical_device_present_rectangles: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_rect_count: Ptr[UInt32, MutAnyOrigin],
        p_rects: Ptr[Rect2D, MutAnyOrigin],
    ) -> Result
    var _acquire_next_image_2: fn(
        device: Device,
        p_acquire_info: Ptr[AcquireNextImageInfoKHR, ImmutAnyOrigin],
        p_image_index: Ptr[UInt32, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_swapchain = Ptr(to=get_device_proc_addr(
            device, "vkCreateSwapchainKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_swapchain)]()[]
        self._destroy_swapchain = Ptr(to=get_device_proc_addr(
            device, "vkDestroySwapchainKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_swapchain)]()[]
        self._get_swapchain_images = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainImagesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_swapchain_images)]()[]
        self._acquire_next_image = Ptr(to=get_device_proc_addr(
            device, "vkAcquireNextImageKHR".as_c_string_slice()
        )).bitcast[type_of(self._acquire_next_image)]()[]
        self._queue_present = Ptr(to=get_device_proc_addr(
            device, "vkQueuePresentKHR".as_c_string_slice()
        )).bitcast[type_of(self._queue_present)]()[]
        self._get_device_group_present_capabilities = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupPresentCapabilitiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_present_capabilities)]()[]
        self._get_device_group_surface_present_modes = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupSurfacePresentModesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_surface_present_modes)]()[]
        self._get_physical_device_present_rectangles = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDevicePresentRectanglesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_present_rectangles)]()[]
        self._acquire_next_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkAcquireNextImage2KHR".as_c_string_slice()
        )).bitcast[type_of(self._acquire_next_image_2)]()[]

    fn create_swapchain[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: SwapchainCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut swapchain: SwapchainKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSwapchainKHR.html
        """
        return self._create_swapchain(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=swapchain),
        )

    fn destroy_swapchain[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        swapchain: SwapchainKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySwapchainKHR.html
        """
        return self._destroy_swapchain(
            device, swapchain, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn get_swapchain_images[p_swapchain_images_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut swapchain_image_count: UInt32,
        p_swapchain_images: Ptr[Image, p_swapchain_images_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainImagesKHR.html
        """
        return self._get_swapchain_images(
            device,
            swapchain,
            Ptr(to=swapchain_image_count),
            Ptr(to=p_swapchain_images).bitcast[Ptr[Image, MutAnyOrigin]]()[],
        )

    fn get_swapchain_images[p_swapchain_images_origin: MutOrigin = MutAnyOrigin](
        self, device: Device, swapchain: SwapchainKHR
    ) -> ListResult[Image]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainImagesKHR.html
        """
        var list = List[Image]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_swapchain_images(
        device, swapchain, Ptr(to=count), Ptr[Image, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_swapchain_images(device, swapchain, Ptr(to=count), list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn acquire_next_image(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        timeout: UInt64,
        semaphore: Semaphore,
        fence: Fence,
        mut image_index: UInt32,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireNextImageKHR.html
        """
        return self._acquire_next_image(device, swapchain, timeout, semaphore, fence, Ptr(to=image_index))

    fn queue_present(self, queue: Queue, present_info: PresentInfoKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueuePresentKHR.html
        """
        return self._queue_present(queue, Ptr(to=present_info))

    fn get_device_group_present_capabilities(
        self,
        device: Device,
        mut device_group_present_capabilities: DeviceGroupPresentCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupPresentCapabilitiesKHR.html
        """
        return self._get_device_group_present_capabilities(
            device, Ptr(to=device_group_present_capabilities)
        )

    fn get_device_group_surface_present_modes(
        self, device: Device, surface: SurfaceKHR, mut modes: DeviceGroupPresentModeFlagsKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupSurfacePresentModesKHR.html
        """
        return self._get_device_group_surface_present_modes(device, surface, Ptr(to=modes))

    fn get_physical_device_present_rectangles[p_rects_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut rect_count: UInt32,
        p_rects: Ptr[Rect2D, p_rects_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDevicePresentRectanglesKHR.html
        """
        return self._get_physical_device_present_rectangles(
            physical_device,
            surface,
            Ptr(to=rect_count),
            Ptr(to=p_rects).bitcast[Ptr[Rect2D, MutAnyOrigin]]()[],
        )

    fn get_physical_device_present_rectangles[p_rects_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice, surface: SurfaceKHR
    ) -> ListResult[Rect2D]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDevicePresentRectanglesKHR.html
        """
        var list = List[Rect2D]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_present_rectangles(
        physical_device, surface, Ptr(to=count), Ptr[Rect2D, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_present_rectangles(
        physical_device, surface, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn acquire_next_image_2(
        self, device: Device, acquire_info: AcquireNextImageInfoKHR, mut image_index: UInt32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireNextImage2KHR.html
        """
        return self._acquire_next_image_2(device, Ptr(to=acquire_info), Ptr(to=image_index))


struct Display(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_display_properties: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayPropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_display_plane_properties: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayPlanePropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_display_plane_supported_displays: fn(
        physical_device: PhysicalDevice,
        plane_index: UInt32,
        p_display_count: Ptr[UInt32, MutAnyOrigin],
        p_displays: Ptr[DisplayKHR, MutAnyOrigin],
    ) -> Result
    var _get_display_mode_properties: fn(
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayModePropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _create_display_mode: fn(
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        p_create_info: Ptr[DisplayModeCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_mode: Ptr[DisplayModeKHR, MutAnyOrigin],
    ) -> Result
    var _get_display_plane_capabilities: fn(
        physical_device: PhysicalDevice,
        mode: DisplayModeKHR,
        plane_index: UInt32,
        p_capabilities: Ptr[DisplayPlaneCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _create_display_plane_surface: fn(
        instance: Instance,
        p_create_info: Ptr[DisplaySurfaceCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_display_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_display_properties)]()[]
        self._get_physical_device_display_plane_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayPlanePropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_display_plane_properties)]()[]
        self._get_display_plane_supported_displays = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayPlaneSupportedDisplaysKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_display_plane_supported_displays)]()[]
        self._get_display_mode_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayModePropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_display_mode_properties)]()[]
        self._create_display_mode = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDisplayModeKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_display_mode)]()[]
        self._get_display_plane_capabilities = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayPlaneCapabilitiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_display_plane_capabilities)]()[]
        self._create_display_plane_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDisplayPlaneSurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_display_plane_surface)]()[]

    fn get_physical_device_display_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayPropertiesKHR, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayPropertiesKHR.html
        """
        return self._get_physical_device_display_properties(
            physical_device,
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[DisplayPropertiesKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_display_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice
    ) -> ListResult[DisplayPropertiesKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayPropertiesKHR.html
        """
        var list = List[DisplayPropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_display_properties(
        physical_device, Ptr(to=count), Ptr[DisplayPropertiesKHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_display_properties(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_display_plane_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayPlanePropertiesKHR, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayPlanePropertiesKHR.html
        """
        return self._get_physical_device_display_plane_properties(
            physical_device,
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[DisplayPlanePropertiesKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_display_plane_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice
    ) -> ListResult[DisplayPlanePropertiesKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayPlanePropertiesKHR.html
        """
        var list = List[DisplayPlanePropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_display_plane_properties(
        physical_device, Ptr(to=count), Ptr[DisplayPlanePropertiesKHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_display_plane_properties(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_display_plane_supported_displays[p_displays_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        plane_index: UInt32,
        mut display_count: UInt32,
        p_displays: Ptr[DisplayKHR, p_displays_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayPlaneSupportedDisplaysKHR.html
        """
        return self._get_display_plane_supported_displays(
            physical_device,
            plane_index,
            Ptr(to=display_count),
            Ptr(to=p_displays).bitcast[Ptr[DisplayKHR, MutAnyOrigin]]()[],
        )

    fn get_display_plane_supported_displays[p_displays_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice, plane_index: UInt32
    ) -> ListResult[DisplayKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayPlaneSupportedDisplaysKHR.html
        """
        var list = List[DisplayKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_display_plane_supported_displays(
        physical_device, plane_index, Ptr(to=count), Ptr[DisplayKHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_display_plane_supported_displays(
        physical_device, plane_index, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_display_mode_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayModePropertiesKHR, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayModePropertiesKHR.html
        """
        return self._get_display_mode_properties(
            physical_device,
            display,
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[DisplayModePropertiesKHR, MutAnyOrigin]]()[],
        )

    fn get_display_mode_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice, display: DisplayKHR
    ) -> ListResult[DisplayModePropertiesKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayModePropertiesKHR.html
        """
        var list = List[DisplayModePropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_display_mode_properties(
        physical_device, display, Ptr(to=count), Ptr[DisplayModePropertiesKHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_display_mode_properties(
        physical_device, display, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn create_display_mode[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        create_info: DisplayModeCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut mode: DisplayModeKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDisplayModeKHR.html
        """
        return self._create_display_mode(
            physical_device,
            display,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=mode),
        )

    fn get_display_plane_capabilities(
        self,
        physical_device: PhysicalDevice,
        mode: DisplayModeKHR,
        plane_index: UInt32,
        mut capabilities: DisplayPlaneCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayPlaneCapabilitiesKHR.html
        """
        return self._get_display_plane_capabilities(
            physical_device, mode, plane_index, Ptr(to=capabilities)
        )

    fn create_display_plane_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: DisplaySurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDisplayPlaneSurfaceKHR.html
        """
        return self._create_display_plane_surface(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )


struct DisplaySwapchain(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_shared_swapchains: fn(
        device: Device,
        swapchain_count: UInt32,
        p_create_infos: Ptr[SwapchainCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_swapchains: Ptr[SwapchainKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_shared_swapchains = Ptr(to=get_device_proc_addr(
            device, "vkCreateSharedSwapchainsKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_shared_swapchains)]()[]

    fn create_shared_swapchains[
        p_create_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        p_allocator_origin: ImmutOrigin = ImmutAnyOrigin,
        p_swapchains_origin: MutOrigin = MutAnyOrigin,
    ](
        self,
        device: Device,
        swapchain_count: UInt32,
        p_create_infos: Ptr[SwapchainCreateInfoKHR, p_create_infos_origin],
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        p_swapchains: Ptr[SwapchainKHR, p_swapchains_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSharedSwapchainsKHR.html
        """
        return self._create_shared_swapchains(
            device,
            swapchain_count,
            Ptr(to=p_create_infos).bitcast[Ptr[SwapchainCreateInfoKHR, ImmutAnyOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=p_swapchains).bitcast[Ptr[SwapchainKHR, MutAnyOrigin]]()[],
        )


struct XlibSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_xlib_surface: fn(
        instance: Instance,
        p_create_info: Ptr[XlibSurfaceCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_xlib_presentation_support: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        dpy: Ptr[Display, MutAnyOrigin],
        visual_id: VisualID,
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_xlib_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateXlibSurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_xlib_surface)]()[]
        self._get_physical_device_xlib_presentation_support = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceXlibPresentationSupportKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_xlib_presentation_support)]()[]

    fn create_xlib_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: XlibSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateXlibSurfaceKHR.html
        """
        return self._create_xlib_surface(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )

    fn get_physical_device_xlib_presentation_support(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut dpy: Display,
        visual_id: VisualID,
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceXlibPresentationSupportKHR.html
        """
        return self._get_physical_device_xlib_presentation_support(
            physical_device, queue_family_index, Ptr(to=dpy), visual_id
        )


struct XcbSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_xcb_surface: fn(
        instance: Instance,
        p_create_info: Ptr[XcbSurfaceCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_xcb_presentation_support: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        connection: Ptr[xcb_connection_t, MutAnyOrigin],
        visual_id: xcb_visualid_t,
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_xcb_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateXcbSurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_xcb_surface)]()[]
        self._get_physical_device_xcb_presentation_support = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceXcbPresentationSupportKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_xcb_presentation_support)]()[]

    fn create_xcb_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: XcbSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateXcbSurfaceKHR.html
        """
        return self._create_xcb_surface(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )

    fn get_physical_device_xcb_presentation_support(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut connection: xcb_connection_t,
        visual_id: xcb_visualid_t,
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceXcbPresentationSupportKHR.html
        """
        return self._get_physical_device_xcb_presentation_support(
            physical_device, queue_family_index, Ptr(to=connection), visual_id
        )


struct WaylandSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_wayland_surface: fn(
        instance: Instance,
        p_create_info: Ptr[WaylandSurfaceCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_wayland_presentation_support: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        display: Ptr[wl_display, MutAnyOrigin],
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_wayland_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateWaylandSurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_wayland_surface)]()[]
        self._get_physical_device_wayland_presentation_support = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceWaylandPresentationSupportKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_wayland_presentation_support)]()[]

    fn create_wayland_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: WaylandSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateWaylandSurfaceKHR.html
        """
        return self._create_wayland_surface(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )

    fn get_physical_device_wayland_presentation_support(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32, mut display: wl_display
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceWaylandPresentationSupportKHR.html
        """
        return self._get_physical_device_wayland_presentation_support(
            physical_device, queue_family_index, Ptr(to=display)
        )


struct AndroidSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_android_surface: fn(
        instance: Instance,
        p_create_info: Ptr[AndroidSurfaceCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_android_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateAndroidSurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_android_surface)]()[]

    fn create_android_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: AndroidSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateAndroidSurfaceKHR.html
        """
        return self._create_android_surface(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )


struct Win32Surface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_win_32_surface: fn(
        instance: Instance,
        p_create_info: Ptr[Win32SurfaceCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_win_32_presentation_support: fn(
        physical_device: PhysicalDevice, queue_family_index: UInt32
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_win_32_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateWin32SurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_win_32_surface)]()[]
        self._get_physical_device_win_32_presentation_support = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceWin32PresentationSupportKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_win_32_presentation_support)]()[]

    fn create_win_32_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: Win32SurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateWin32SurfaceKHR.html
        """
        return self._create_win_32_surface(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )

    fn get_physical_device_win_32_presentation_support(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceWin32PresentationSupportKHR.html
        """
        return self._get_physical_device_win_32_presentation_support(physical_device, queue_family_index)


struct VideoQueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_video_capabilities: fn(
        physical_device: PhysicalDevice,
        p_video_profile: Ptr[VideoProfileInfoKHR, ImmutAnyOrigin],
        p_capabilities: Ptr[VideoCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_video_format_properties: fn(
        physical_device: PhysicalDevice,
        p_video_format_info: Ptr[PhysicalDeviceVideoFormatInfoKHR, ImmutAnyOrigin],
        p_video_format_property_count: Ptr[UInt32, MutAnyOrigin],
        p_video_format_properties: Ptr[VideoFormatPropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _create_video_session: fn(
        device: Device,
        p_create_info: Ptr[VideoSessionCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_video_session: Ptr[VideoSessionKHR, MutAnyOrigin],
    ) -> Result
    var _destroy_video_session: fn(
        device: Device,
        video_session: VideoSessionKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_video_session_memory_requirements: fn(
        device: Device,
        video_session: VideoSessionKHR,
        p_memory_requirements_count: Ptr[UInt32, MutAnyOrigin],
        p_memory_requirements: Ptr[VideoSessionMemoryRequirementsKHR, MutAnyOrigin],
    ) -> Result
    var _bind_video_session_memory: fn(
        device: Device,
        video_session: VideoSessionKHR,
        bind_session_memory_info_count: UInt32,
        p_bind_session_memory_infos: Ptr[BindVideoSessionMemoryInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _create_video_session_parameters: fn(
        device: Device,
        p_create_info: Ptr[VideoSessionParametersCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_video_session_parameters: Ptr[VideoSessionParametersKHR, MutAnyOrigin],
    ) -> Result
    var _update_video_session_parameters: fn(
        device: Device,
        video_session_parameters: VideoSessionParametersKHR,
        p_update_info: Ptr[VideoSessionParametersUpdateInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _destroy_video_session_parameters: fn(
        device: Device,
        video_session_parameters: VideoSessionParametersKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _cmd_begin_video_coding: fn(
        command_buffer: CommandBuffer, p_begin_info: Ptr[VideoBeginCodingInfoKHR, ImmutAnyOrigin]
    )
    var _cmd_end_video_coding: fn(
        command_buffer: CommandBuffer, p_end_coding_info: Ptr[VideoEndCodingInfoKHR, ImmutAnyOrigin]
    )
    var _cmd_control_video_coding: fn(
        command_buffer: CommandBuffer,
        p_coding_control_info: Ptr[VideoCodingControlInfoKHR, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_video_capabilities = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceVideoCapabilitiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_video_capabilities)]()[]
        self._get_physical_device_video_format_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceVideoFormatPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_video_format_properties)]()[]
        self._create_video_session = Ptr(to=get_device_proc_addr(
            device, "vkCreateVideoSessionKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_video_session)]()[]
        self._destroy_video_session = Ptr(to=get_device_proc_addr(
            device, "vkDestroyVideoSessionKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_video_session)]()[]
        self._get_video_session_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetVideoSessionMemoryRequirementsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_video_session_memory_requirements)]()[]
        self._bind_video_session_memory = Ptr(to=get_device_proc_addr(
            device, "vkBindVideoSessionMemoryKHR".as_c_string_slice()
        )).bitcast[type_of(self._bind_video_session_memory)]()[]
        self._create_video_session_parameters = Ptr(to=get_device_proc_addr(
            device, "vkCreateVideoSessionParametersKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_video_session_parameters)]()[]
        self._update_video_session_parameters = Ptr(to=get_device_proc_addr(
            device, "vkUpdateVideoSessionParametersKHR".as_c_string_slice()
        )).bitcast[type_of(self._update_video_session_parameters)]()[]
        self._destroy_video_session_parameters = Ptr(to=get_device_proc_addr(
            device, "vkDestroyVideoSessionParametersKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_video_session_parameters)]()[]
        self._cmd_begin_video_coding = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginVideoCodingKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_video_coding)]()[]
        self._cmd_end_video_coding = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndVideoCodingKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_video_coding)]()[]
        self._cmd_control_video_coding = Ptr(to=get_device_proc_addr(
            device, "vkCmdControlVideoCodingKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_control_video_coding)]()[]

    fn get_physical_device_video_capabilities(
        self,
        physical_device: PhysicalDevice,
        video_profile: VideoProfileInfoKHR,
        mut capabilities: VideoCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceVideoCapabilitiesKHR.html
        """
        return self._get_physical_device_video_capabilities(
            physical_device, Ptr(to=video_profile), Ptr(to=capabilities)
        )

    fn get_physical_device_video_format_properties[
        p_video_format_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        video_format_info: PhysicalDeviceVideoFormatInfoKHR,
        mut video_format_property_count: UInt32,
        p_video_format_properties: Ptr[VideoFormatPropertiesKHR, p_video_format_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceVideoFormatPropertiesKHR.html
        """
        return self._get_physical_device_video_format_properties(
            physical_device,
            Ptr(to=video_format_info),
            Ptr(to=video_format_property_count),
            Ptr(to=p_video_format_properties).bitcast[Ptr[VideoFormatPropertiesKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_video_format_properties[
        p_video_format_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice, video_format_info: PhysicalDeviceVideoFormatInfoKHR
    ) -> ListResult[VideoFormatPropertiesKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceVideoFormatPropertiesKHR.html
        """
        var list = List[VideoFormatPropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_video_format_properties(
        physical_device,
        Ptr(to=video_format_info),
        Ptr(to=count),
        Ptr[VideoFormatPropertiesKHR, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_video_format_properties(
        physical_device, Ptr(to=video_format_info), Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn create_video_session[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: VideoSessionCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut video_session: VideoSessionKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateVideoSessionKHR.html
        """
        return self._create_video_session(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=video_session),
        )

    fn destroy_video_session[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        video_session: VideoSessionKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyVideoSessionKHR.html
        """
        return self._destroy_video_session(
            device, video_session, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn get_video_session_memory_requirements[
        p_memory_requirements_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        device: Device,
        video_session: VideoSessionKHR,
        mut memory_requirements_count: UInt32,
        p_memory_requirements: Ptr[VideoSessionMemoryRequirementsKHR, p_memory_requirements_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetVideoSessionMemoryRequirementsKHR.html
        """
        return self._get_video_session_memory_requirements(
            device,
            video_session,
            Ptr(to=memory_requirements_count),
            Ptr(to=p_memory_requirements).bitcast[Ptr[VideoSessionMemoryRequirementsKHR, MutAnyOrigin]]()[],
        )

    fn get_video_session_memory_requirements[
        p_memory_requirements_origin: MutOrigin = MutAnyOrigin
    ](
        self, device: Device, video_session: VideoSessionKHR
    ) -> ListResult[VideoSessionMemoryRequirementsKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetVideoSessionMemoryRequirementsKHR.html
        """
        var list = List[VideoSessionMemoryRequirementsKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_video_session_memory_requirements(
        device,
        video_session,
        Ptr(to=count),
        Ptr[VideoSessionMemoryRequirementsKHR, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_video_session_memory_requirements(
        device, video_session, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn bind_video_session_memory[p_bind_session_memory_infos_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        video_session: VideoSessionKHR,
        bind_session_memory_info_count: UInt32,
        p_bind_session_memory_infos: Ptr[BindVideoSessionMemoryInfoKHR, p_bind_session_memory_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindVideoSessionMemoryKHR.html
        """
        return self._bind_video_session_memory(
            device,
            video_session,
            bind_session_memory_info_count,
            Ptr(to=p_bind_session_memory_infos).bitcast[Ptr[BindVideoSessionMemoryInfoKHR, ImmutAnyOrigin]]()[],
        )

    fn create_video_session_parameters[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: VideoSessionParametersCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut video_session_parameters: VideoSessionParametersKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateVideoSessionParametersKHR.html
        """
        return self._create_video_session_parameters(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=video_session_parameters),
        )

    fn update_video_session_parameters(
        self,
        device: Device,
        video_session_parameters: VideoSessionParametersKHR,
        update_info: VideoSessionParametersUpdateInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateVideoSessionParametersKHR.html
        """
        return self._update_video_session_parameters(device, video_session_parameters, Ptr(to=update_info))

    fn destroy_video_session_parameters[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        video_session_parameters: VideoSessionParametersKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyVideoSessionParametersKHR.html
        """
        return self._destroy_video_session_parameters(
            device,
            video_session_parameters,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn cmd_begin_video_coding(
        self, command_buffer: CommandBuffer, begin_info: VideoBeginCodingInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginVideoCodingKHR.html
        """
        return self._cmd_begin_video_coding(command_buffer, Ptr(to=begin_info))

    fn cmd_end_video_coding(
        self, command_buffer: CommandBuffer, end_coding_info: VideoEndCodingInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndVideoCodingKHR.html
        """
        return self._cmd_end_video_coding(command_buffer, Ptr(to=end_coding_info))

    fn cmd_control_video_coding(
        self, command_buffer: CommandBuffer, coding_control_info: VideoCodingControlInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdControlVideoCodingKHR.html
        """
        return self._cmd_control_video_coding(command_buffer, Ptr(to=coding_control_info))


struct VideoDecodeQueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_decode_video: fn(
        command_buffer: CommandBuffer, p_decode_info: Ptr[VideoDecodeInfoKHR, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_decode_video = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecodeVideoKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_decode_video)]()[]

    fn cmd_decode_video(self, command_buffer: CommandBuffer, decode_info: VideoDecodeInfoKHR):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecodeVideoKHR.html
        """
        return self._cmd_decode_video(command_buffer, Ptr(to=decode_info))


struct DynamicRendering(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_begin_rendering: fn(
        command_buffer: CommandBuffer, p_rendering_info: Ptr[RenderingInfo, ImmutAnyOrigin]
    )
    var _cmd_end_rendering: fn(command_buffer: CommandBuffer)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_begin_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginRendering".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_rendering)]()[]
        self._cmd_end_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRendering".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_rendering)]()[]

    fn cmd_begin_rendering(self, command_buffer: CommandBuffer, rendering_info: RenderingInfo):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRendering.html
        """
        return self._cmd_begin_rendering(command_buffer, Ptr(to=rendering_info))

    fn cmd_end_rendering(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering.html
        """
        return self._cmd_end_rendering(command_buffer)


struct GetPhysicalDeviceProperties2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_features_2: fn(
        physical_device: PhysicalDevice, p_features: Ptr[PhysicalDeviceFeatures2, MutAnyOrigin]
    )
    var _get_physical_device_properties_2: fn(
        physical_device: PhysicalDevice, p_properties: Ptr[PhysicalDeviceProperties2, MutAnyOrigin]
    )
    var _get_physical_device_format_properties_2: fn(
        physical_device: PhysicalDevice,
        format: Format,
        p_format_properties: Ptr[FormatProperties2, MutAnyOrigin],
    )
    var _get_physical_device_image_format_properties_2: fn(
        physical_device: PhysicalDevice,
        p_image_format_info: Ptr[PhysicalDeviceImageFormatInfo2, ImmutAnyOrigin],
        p_image_format_properties: Ptr[ImageFormatProperties2, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_queue_family_properties_2: fn(
        physical_device: PhysicalDevice,
        p_queue_family_property_count: Ptr[UInt32, MutAnyOrigin],
        p_queue_family_properties: Ptr[QueueFamilyProperties2, MutAnyOrigin],
    )
    var _get_physical_device_memory_properties_2: fn(
        physical_device: PhysicalDevice,
        p_memory_properties: Ptr[PhysicalDeviceMemoryProperties2, MutAnyOrigin],
    )
    var _get_physical_device_sparse_image_format_properties_2: fn(
        physical_device: PhysicalDevice,
        p_format_info: Ptr[PhysicalDeviceSparseImageFormatInfo2, ImmutAnyOrigin],
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[SparseImageFormatProperties2, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_features_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFeatures2".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_features_2)]()[]
        self._get_physical_device_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceProperties2".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_properties_2)]()[]
        self._get_physical_device_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFormatProperties2".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_format_properties_2)]()[]
        self._get_physical_device_image_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceImageFormatProperties2".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_image_format_properties_2)]()[]
        self._get_physical_device_queue_family_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceQueueFamilyProperties2".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_queue_family_properties_2)]()[]
        self._get_physical_device_memory_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceMemoryProperties2".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_memory_properties_2)]()[]
        self._get_physical_device_sparse_image_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSparseImageFormatProperties2".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_sparse_image_format_properties_2)]()[]

    fn get_physical_device_features_2(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures2.html
        """
        return self._get_physical_device_features_2(physical_device, Ptr(to=features))

    fn get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties2.html
        """
        return self._get_physical_device_properties_2(physical_device, Ptr(to=properties))

    fn get_physical_device_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties2.html
        """
        return self._get_physical_device_format_properties_2(
            physical_device, format, Ptr(to=format_properties)
        )

    fn get_physical_device_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        image_format_info: PhysicalDeviceImageFormatInfo2,
        mut image_format_properties: ImageFormatProperties2,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceImageFormatProperties2.html
        """
        return self._get_physical_device_image_format_properties_2(
            physical_device, Ptr(to=image_format_info), Ptr(to=image_format_properties)
        )

    fn get_physical_device_queue_family_properties_2[
        p_queue_family_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties2, p_queue_family_properties_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        return self._get_physical_device_queue_family_properties_2(
            physical_device,
            Ptr(to=queue_family_property_count),
            Ptr(to=p_queue_family_properties).bitcast[Ptr[QueueFamilyProperties2, MutAnyOrigin]]()[],
        )

    fn get_physical_device_queue_family_properties_2[
        p_queue_family_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        var list = List[QueueFamilyProperties2]()
        var count: UInt32 = 0
        self._get_physical_device_queue_family_properties_2(
    physical_device, Ptr(to=count), Ptr[QueueFamilyProperties2, MutExternalOrigin]()
)
        list.reserve(Int(count))
        self._get_physical_device_queue_family_properties_2(
    physical_device, Ptr(to=count), list.unsafe_ptr()
)
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties2.html
        """
        return self._get_physical_device_memory_properties_2(physical_device, Ptr(to=memory_properties))

    fn get_physical_device_sparse_image_format_properties_2[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties2, p_properties_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        return self._get_physical_device_sparse_image_format_properties_2(
            physical_device,
            Ptr(to=format_info),
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[SparseImageFormatProperties2, MutAnyOrigin]]()[],
        )

    fn get_physical_device_sparse_image_format_properties_2[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice, format_info: PhysicalDeviceSparseImageFormatInfo2
    ) -> List[SparseImageFormatProperties2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        var list = List[SparseImageFormatProperties2]()
        var count: UInt32 = 0
        self._get_physical_device_sparse_image_format_properties_2(
    physical_device,
    Ptr(to=format_info),
    Ptr(to=count),
    Ptr[SparseImageFormatProperties2, MutExternalOrigin](),
)
        list.reserve(Int(count))
        self._get_physical_device_sparse_image_format_properties_2(
    physical_device, Ptr(to=format_info), Ptr(to=count), list.unsafe_ptr()
)
        list._len = Int(count)
        return list^


struct DeviceGroup(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_device_group_peer_memory_features: fn(
        device: Device,
        heap_index: UInt32,
        local_device_index: UInt32,
        remote_device_index: UInt32,
        p_peer_memory_features: Ptr[PeerMemoryFeatureFlags, MutAnyOrigin],
    )
    var _cmd_set_device_mask: fn(command_buffer: CommandBuffer, device_mask: UInt32)
    var _cmd_dispatch_base: fn(
        command_buffer: CommandBuffer,
        base_group_x: UInt32,
        base_group_y: UInt32,
        base_group_z: UInt32,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    )
    var _get_device_group_present_capabilities: fn(
        device: Device,
        p_device_group_present_capabilities: Ptr[DeviceGroupPresentCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_device_group_surface_present_modes: fn(
        device: Device, surface: SurfaceKHR, p_modes: Ptr[DeviceGroupPresentModeFlagsKHR, MutAnyOrigin]
    ) -> Result
    var _get_physical_device_present_rectangles: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_rect_count: Ptr[UInt32, MutAnyOrigin],
        p_rects: Ptr[Rect2D, MutAnyOrigin],
    ) -> Result
    var _acquire_next_image_2: fn(
        device: Device,
        p_acquire_info: Ptr[AcquireNextImageInfoKHR, ImmutAnyOrigin],
        p_image_index: Ptr[UInt32, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_device_group_peer_memory_features = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupPeerMemoryFeatures".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_peer_memory_features)]()[]
        self._cmd_set_device_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDeviceMask".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_device_mask)]()[]
        self._cmd_dispatch_base = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchBase".as_c_string_slice()
        )).bitcast[type_of(self._cmd_dispatch_base)]()[]
        self._get_device_group_present_capabilities = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupPresentCapabilitiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_present_capabilities)]()[]
        self._get_device_group_surface_present_modes = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupSurfacePresentModesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_surface_present_modes)]()[]
        self._get_physical_device_present_rectangles = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDevicePresentRectanglesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_present_rectangles)]()[]
        self._acquire_next_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkAcquireNextImage2KHR".as_c_string_slice()
        )).bitcast[type_of(self._acquire_next_image_2)]()[]

    fn get_device_group_peer_memory_features(
        self,
        device: Device,
        heap_index: UInt32,
        local_device_index: UInt32,
        remote_device_index: UInt32,
        mut peer_memory_features: PeerMemoryFeatureFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupPeerMemoryFeatures.html
        """
        return self._get_device_group_peer_memory_features(
            device, heap_index, local_device_index, remote_device_index, Ptr(to=peer_memory_features)
        )

    fn cmd_set_device_mask(self, command_buffer: CommandBuffer, device_mask: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDeviceMask.html
        """
        return self._cmd_set_device_mask(command_buffer, device_mask)

    fn cmd_dispatch_base(
        self,
        command_buffer: CommandBuffer,
        base_group_x: UInt32,
        base_group_y: UInt32,
        base_group_z: UInt32,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchBase.html
        """
        return self._cmd_dispatch_base(
            command_buffer,
            base_group_x,
            base_group_y,
            base_group_z,
            group_count_x,
            group_count_y,
            group_count_z,
        )

    fn get_device_group_present_capabilities(
        self,
        device: Device,
        mut device_group_present_capabilities: DeviceGroupPresentCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupPresentCapabilitiesKHR.html
        """
        return self._get_device_group_present_capabilities(
            device, Ptr(to=device_group_present_capabilities)
        )

    fn get_device_group_surface_present_modes(
        self, device: Device, surface: SurfaceKHR, mut modes: DeviceGroupPresentModeFlagsKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupSurfacePresentModesKHR.html
        """
        return self._get_device_group_surface_present_modes(device, surface, Ptr(to=modes))

    fn get_physical_device_present_rectangles[p_rects_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut rect_count: UInt32,
        p_rects: Ptr[Rect2D, p_rects_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDevicePresentRectanglesKHR.html
        """
        return self._get_physical_device_present_rectangles(
            physical_device,
            surface,
            Ptr(to=rect_count),
            Ptr(to=p_rects).bitcast[Ptr[Rect2D, MutAnyOrigin]]()[],
        )

    fn get_physical_device_present_rectangles[p_rects_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice, surface: SurfaceKHR
    ) -> ListResult[Rect2D]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDevicePresentRectanglesKHR.html
        """
        var list = List[Rect2D]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_present_rectangles(
        physical_device, surface, Ptr(to=count), Ptr[Rect2D, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_present_rectangles(
        physical_device, surface, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn acquire_next_image_2(
        self, device: Device, acquire_info: AcquireNextImageInfoKHR, mut image_index: UInt32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireNextImage2KHR.html
        """
        return self._acquire_next_image_2(device, Ptr(to=acquire_info), Ptr(to=image_index))


struct Maintenance1(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _trim_command_pool: fn(device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._trim_command_pool = Ptr(to=get_device_proc_addr(
            device, "vkTrimCommandPool".as_c_string_slice()
        )).bitcast[type_of(self._trim_command_pool)]()[]

    fn trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTrimCommandPool.html
        """
        return self._trim_command_pool(device, command_pool, flags)


struct DeviceGroupCreation(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _enumerate_physical_device_groups: fn(
        instance: Instance,
        p_physical_device_group_count: Ptr[UInt32, MutAnyOrigin],
        p_physical_device_group_properties: Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._enumerate_physical_device_groups = Ptr(to=get_instance_proc_addr(
            instance, "vkEnumeratePhysicalDeviceGroups".as_c_string_slice()
        )).bitcast[type_of(self._enumerate_physical_device_groups)]()[]

    fn enumerate_physical_device_groups[
        p_physical_device_group_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Ptr[PhysicalDeviceGroupProperties, p_physical_device_group_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        return self._enumerate_physical_device_groups(
            instance,
            Ptr(to=physical_device_group_count),
            Ptr(to=p_physical_device_group_properties).bitcast[Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin]]()[],
        )

    fn enumerate_physical_device_groups[
        p_physical_device_group_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self, instance: Instance
    ) -> ListResult[PhysicalDeviceGroupProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        var list = List[PhysicalDeviceGroupProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._enumerate_physical_device_groups(
        instance, Ptr(to=count), Ptr[PhysicalDeviceGroupProperties, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._enumerate_physical_device_groups(instance, Ptr(to=count), list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)


struct ExternalMemoryCapabilities(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_external_buffer_properties: fn(
        physical_device: PhysicalDevice,
        p_external_buffer_info: Ptr[PhysicalDeviceExternalBufferInfo, ImmutAnyOrigin],
        p_external_buffer_properties: Ptr[ExternalBufferProperties, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_external_buffer_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalBufferProperties".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_external_buffer_properties)]()[]

    fn get_physical_device_external_buffer_properties(
        self,
        physical_device: PhysicalDevice,
        external_buffer_info: PhysicalDeviceExternalBufferInfo,
        mut external_buffer_properties: ExternalBufferProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalBufferProperties.html
        """
        return self._get_physical_device_external_buffer_properties(
            physical_device, Ptr(to=external_buffer_info), Ptr(to=external_buffer_properties)
        )


struct ExternalMemoryWin32(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_win_32_handle: fn(
        device: Device,
        p_get_win_32_handle_info: Ptr[MemoryGetWin32HandleInfoKHR, ImmutAnyOrigin],
        p_handle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result
    var _get_memory_win_32_handle_properties: fn(
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        handle: HANDLE,
        p_memory_win_32_handle_properties: Ptr[MemoryWin32HandlePropertiesKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_win_32_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryWin32HandleKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_win_32_handle)]()[]
        self._get_memory_win_32_handle_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryWin32HandlePropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_win_32_handle_properties)]()[]

    fn get_memory_win_32_handle(
        self,
        device: Device,
        get_win_32_handle_info: MemoryGetWin32HandleInfoKHR,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryWin32HandleKHR.html
        """
        return self._get_memory_win_32_handle(device, Ptr(to=get_win_32_handle_info), Ptr(to=handle))

    fn get_memory_win_32_handle_properties(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        handle: HANDLE,
        mut memory_win_32_handle_properties: MemoryWin32HandlePropertiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryWin32HandlePropertiesKHR.html
        """
        return self._get_memory_win_32_handle_properties(
            device, handle_type, handle, Ptr(to=memory_win_32_handle_properties)
        )


struct ExternalMemoryFd(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_fd: fn(
        device: Device,
        p_get_fd_info: Ptr[MemoryGetFdInfoKHR, ImmutAnyOrigin],
        p_fd: Ptr[Int32, MutAnyOrigin],
    ) -> Result
    var _get_memory_fd_properties: fn(
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        fd: Int32,
        p_memory_fd_properties: Ptr[MemoryFdPropertiesKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_fd = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryFdKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_fd)]()[]
        self._get_memory_fd_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryFdPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_fd_properties)]()[]

    fn get_memory_fd(
        self, device: Device, get_fd_info: MemoryGetFdInfoKHR, mut fd: Int32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryFdKHR.html
        """
        return self._get_memory_fd(device, Ptr(to=get_fd_info), Ptr(to=fd))

    fn get_memory_fd_properties(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        fd: Int32,
        mut memory_fd_properties: MemoryFdPropertiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryFdPropertiesKHR.html
        """
        return self._get_memory_fd_properties(device, handle_type, fd, Ptr(to=memory_fd_properties))


struct ExternalSemaphoreCapabilities(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_external_semaphore_properties: fn(
        physical_device: PhysicalDevice,
        p_external_semaphore_info: Ptr[PhysicalDeviceExternalSemaphoreInfo, ImmutAnyOrigin],
        p_external_semaphore_properties: Ptr[ExternalSemaphoreProperties, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_external_semaphore_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalSemaphoreProperties".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_external_semaphore_properties)]()[]

    fn get_physical_device_external_semaphore_properties(
        self,
        physical_device: PhysicalDevice,
        external_semaphore_info: PhysicalDeviceExternalSemaphoreInfo,
        mut external_semaphore_properties: ExternalSemaphoreProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalSemaphoreProperties.html
        """
        return self._get_physical_device_external_semaphore_properties(
            physical_device, Ptr(to=external_semaphore_info), Ptr(to=external_semaphore_properties)
        )


struct ExternalSemaphoreWin32(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _import_semaphore_win_32_handle: fn(
        device: Device,
        p_import_semaphore_win_32_handle_info: Ptr[ImportSemaphoreWin32HandleInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _get_semaphore_win_32_handle: fn(
        device: Device,
        p_get_win_32_handle_info: Ptr[SemaphoreGetWin32HandleInfoKHR, ImmutAnyOrigin],
        p_handle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_semaphore_win_32_handle = Ptr(to=get_device_proc_addr(
            device, "vkImportSemaphoreWin32HandleKHR".as_c_string_slice()
        )).bitcast[type_of(self._import_semaphore_win_32_handle)]()[]
        self._get_semaphore_win_32_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreWin32HandleKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_semaphore_win_32_handle)]()[]

    fn import_semaphore_win_32_handle(
        self, device: Device, import_semaphore_win_32_handle_info: ImportSemaphoreWin32HandleInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportSemaphoreWin32HandleKHR.html
        """
        return self._import_semaphore_win_32_handle(device, Ptr(to=import_semaphore_win_32_handle_info))

    fn get_semaphore_win_32_handle(
        self,
        device: Device,
        get_win_32_handle_info: SemaphoreGetWin32HandleInfoKHR,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreWin32HandleKHR.html
        """
        return self._get_semaphore_win_32_handle(device, Ptr(to=get_win_32_handle_info), Ptr(to=handle))


struct ExternalSemaphoreFd(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _import_semaphore_fd: fn(
        device: Device, p_import_semaphore_fd_info: Ptr[ImportSemaphoreFdInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _get_semaphore_fd: fn(
        device: Device,
        p_get_fd_info: Ptr[SemaphoreGetFdInfoKHR, ImmutAnyOrigin],
        p_fd: Ptr[Int32, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_semaphore_fd = Ptr(to=get_device_proc_addr(
            device, "vkImportSemaphoreFdKHR".as_c_string_slice()
        )).bitcast[type_of(self._import_semaphore_fd)]()[]
        self._get_semaphore_fd = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreFdKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_semaphore_fd)]()[]

    fn import_semaphore_fd(
        self, device: Device, import_semaphore_fd_info: ImportSemaphoreFdInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportSemaphoreFdKHR.html
        """
        return self._import_semaphore_fd(device, Ptr(to=import_semaphore_fd_info))

    fn get_semaphore_fd(
        self, device: Device, get_fd_info: SemaphoreGetFdInfoKHR, mut fd: Int32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreFdKHR.html
        """
        return self._get_semaphore_fd(device, Ptr(to=get_fd_info), Ptr(to=fd))


struct PushDescriptor(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_push_descriptor_set: fn(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
    )
    var _cmd_push_descriptor_set_with_template: fn(
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_push_descriptor_set = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSet".as_c_string_slice()
        )).bitcast[type_of(self._cmd_push_descriptor_set)]()[]
        self._cmd_push_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSetWithTemplate".as_c_string_slice()
        )).bitcast[type_of(self._cmd_push_descriptor_set_with_template)]()[]

    fn cmd_push_descriptor_set[p_descriptor_writes_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, p_descriptor_writes_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSet.html
        """
        return self._cmd_push_descriptor_set(
            command_buffer,
            pipeline_bind_point,
            layout,
            set,
            descriptor_write_count,
            Ptr(to=p_descriptor_writes).bitcast[Ptr[WriteDescriptorSet, ImmutAnyOrigin]]()[],
        )

    fn cmd_push_descriptor_set_with_template[p_data_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate.html
        """
        return self._cmd_push_descriptor_set_with_template(
            command_buffer,
            descriptor_update_template,
            layout,
            set,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutAnyOrigin]]()[],
        )


struct DescriptorUpdateTemplate(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_descriptor_update_template: fn(
        device: Device,
        p_create_info: Ptr[DescriptorUpdateTemplateCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_descriptor_update_template: Ptr[DescriptorUpdateTemplate, MutAnyOrigin],
    ) -> Result
    var _destroy_descriptor_update_template: fn(
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _update_descriptor_set_with_template: fn(
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    )
    var _cmd_push_descriptor_set_with_template: fn(
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_descriptor_update_template = Ptr(to=get_device_proc_addr(
            device, "vkCreateDescriptorUpdateTemplate".as_c_string_slice()
        )).bitcast[type_of(self._create_descriptor_update_template)]()[]
        self._destroy_descriptor_update_template = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDescriptorUpdateTemplate".as_c_string_slice()
        )).bitcast[type_of(self._destroy_descriptor_update_template)]()[]
        self._update_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
            device, "vkUpdateDescriptorSetWithTemplate".as_c_string_slice()
        )).bitcast[type_of(self._update_descriptor_set_with_template)]()[]
        self._cmd_push_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSetWithTemplate".as_c_string_slice()
        )).bitcast[type_of(self._cmd_push_descriptor_set_with_template)]()[]

    fn create_descriptor_update_template[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorUpdateTemplate.html
        """
        return self._create_descriptor_update_template(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=descriptor_update_template),
        )

    fn destroy_descriptor_update_template[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorUpdateTemplate.html
        """
        return self._destroy_descriptor_update_template(
            device,
            descriptor_update_template,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn update_descriptor_set_with_template[p_data_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._update_descriptor_set_with_template(
            device,
            descriptor_set,
            descriptor_update_template,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutAnyOrigin]]()[],
        )

    fn cmd_push_descriptor_set_with_template[p_data_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate.html
        """
        return self._cmd_push_descriptor_set_with_template(
            command_buffer,
            descriptor_update_template,
            layout,
            set,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutAnyOrigin]]()[],
        )


struct CreateRenderpass2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_render_pass_2: fn(
        device: Device,
        p_create_info: Ptr[RenderPassCreateInfo2, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_render_pass: Ptr[RenderPass, MutAnyOrigin],
    ) -> Result
    var _cmd_begin_render_pass_2: fn(
        command_buffer: CommandBuffer,
        p_render_pass_begin: Ptr[RenderPassBeginInfo, ImmutAnyOrigin],
        p_subpass_begin_info: Ptr[SubpassBeginInfo, ImmutAnyOrigin],
    )
    var _cmd_next_subpass_2: fn(
        command_buffer: CommandBuffer,
        p_subpass_begin_info: Ptr[SubpassBeginInfo, ImmutAnyOrigin],
        p_subpass_end_info: Ptr[SubpassEndInfo, ImmutAnyOrigin],
    )
    var _cmd_end_render_pass_2: fn(
        command_buffer: CommandBuffer, p_subpass_end_info: Ptr[SubpassEndInfo, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCreateRenderPass2".as_c_string_slice()
        )).bitcast[type_of(self._create_render_pass_2)]()[]
        self._cmd_begin_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginRenderPass2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_render_pass_2)]()[]
        self._cmd_next_subpass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdNextSubpass2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_next_subpass_2)]()[]
        self._cmd_end_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRenderPass2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_render_pass_2)]()[]

    fn create_render_pass_2[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: RenderPassCreateInfo2,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass2.html
        """
        return self._create_render_pass_2(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=render_pass),
        )

    fn cmd_begin_render_pass_2(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        subpass_begin_info: SubpassBeginInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass2.html
        """
        return self._cmd_begin_render_pass_2(
            command_buffer, Ptr(to=render_pass_begin), Ptr(to=subpass_begin_info)
        )

    fn cmd_next_subpass_2(
        self,
        command_buffer: CommandBuffer,
        subpass_begin_info: SubpassBeginInfo,
        subpass_end_info: SubpassEndInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass2.html
        """
        return self._cmd_next_subpass_2(
            command_buffer, Ptr(to=subpass_begin_info), Ptr(to=subpass_end_info)
        )

    fn cmd_end_render_pass_2(
        self, command_buffer: CommandBuffer, subpass_end_info: SubpassEndInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass2.html
        """
        return self._cmd_end_render_pass_2(command_buffer, Ptr(to=subpass_end_info))


struct SharedPresentableImage(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_swapchain_status: fn(device: Device, swapchain: SwapchainKHR) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_swapchain_status = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainStatusKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_swapchain_status)]()[]

    fn get_swapchain_status(self, device: Device, swapchain: SwapchainKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainStatusKHR.html
        """
        return self._get_swapchain_status(device, swapchain)


struct ExternalFenceCapabilities(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_external_fence_properties: fn(
        physical_device: PhysicalDevice,
        p_external_fence_info: Ptr[PhysicalDeviceExternalFenceInfo, ImmutAnyOrigin],
        p_external_fence_properties: Ptr[ExternalFenceProperties, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_external_fence_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalFenceProperties".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_external_fence_properties)]()[]

    fn get_physical_device_external_fence_properties(
        self,
        physical_device: PhysicalDevice,
        external_fence_info: PhysicalDeviceExternalFenceInfo,
        mut external_fence_properties: ExternalFenceProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalFenceProperties.html
        """
        return self._get_physical_device_external_fence_properties(
            physical_device, Ptr(to=external_fence_info), Ptr(to=external_fence_properties)
        )


struct ExternalFenceWin32(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _import_fence_win_32_handle: fn(
        device: Device,
        p_import_fence_win_32_handle_info: Ptr[ImportFenceWin32HandleInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _get_fence_win_32_handle: fn(
        device: Device,
        p_get_win_32_handle_info: Ptr[FenceGetWin32HandleInfoKHR, ImmutAnyOrigin],
        p_handle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_fence_win_32_handle = Ptr(to=get_device_proc_addr(
            device, "vkImportFenceWin32HandleKHR".as_c_string_slice()
        )).bitcast[type_of(self._import_fence_win_32_handle)]()[]
        self._get_fence_win_32_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetFenceWin32HandleKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_fence_win_32_handle)]()[]

    fn import_fence_win_32_handle(
        self, device: Device, import_fence_win_32_handle_info: ImportFenceWin32HandleInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportFenceWin32HandleKHR.html
        """
        return self._import_fence_win_32_handle(device, Ptr(to=import_fence_win_32_handle_info))

    fn get_fence_win_32_handle(
        self, device: Device, get_win_32_handle_info: FenceGetWin32HandleInfoKHR, mut handle: HANDLE
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceWin32HandleKHR.html
        """
        return self._get_fence_win_32_handle(device, Ptr(to=get_win_32_handle_info), Ptr(to=handle))


struct ExternalFenceFd(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _import_fence_fd: fn(
        device: Device, p_import_fence_fd_info: Ptr[ImportFenceFdInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _get_fence_fd: fn(
        device: Device,
        p_get_fd_info: Ptr[FenceGetFdInfoKHR, ImmutAnyOrigin],
        p_fd: Ptr[Int32, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_fence_fd = Ptr(to=get_device_proc_addr(
            device, "vkImportFenceFdKHR".as_c_string_slice()
        )).bitcast[type_of(self._import_fence_fd)]()[]
        self._get_fence_fd = Ptr(to=get_device_proc_addr(
            device, "vkGetFenceFdKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_fence_fd)]()[]

    fn import_fence_fd(self, device: Device, import_fence_fd_info: ImportFenceFdInfoKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportFenceFdKHR.html
        """
        return self._import_fence_fd(device, Ptr(to=import_fence_fd_info))

    fn get_fence_fd(self, device: Device, get_fd_info: FenceGetFdInfoKHR, mut fd: Int32) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceFdKHR.html
        """
        return self._get_fence_fd(device, Ptr(to=get_fd_info), Ptr(to=fd))


struct PerformanceQuery(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _enumerate_physical_device_queue_family_performance_query_counters: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        p_counter_count: Ptr[UInt32, MutAnyOrigin],
        p_counters: Ptr[PerformanceCounterKHR, MutAnyOrigin],
        p_counter_descriptions: Ptr[PerformanceCounterDescriptionKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_queue_family_performance_query_passes: fn(
        physical_device: PhysicalDevice,
        p_performance_query_create_info: Ptr[QueryPoolPerformanceCreateInfoKHR, ImmutAnyOrigin],
        p_num_passes: Ptr[UInt32, MutAnyOrigin],
    )
    var _acquire_profiling_lock: fn(
        device: Device, p_info: Ptr[AcquireProfilingLockInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _release_profiling_lock: fn(device: Device)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._enumerate_physical_device_queue_family_performance_query_counters = Ptr(to=get_device_proc_addr(
            device, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR".as_c_string_slice()
        )).bitcast[type_of(self._enumerate_physical_device_queue_family_performance_query_counters)]()[]
        self._get_physical_device_queue_family_performance_query_passes = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_queue_family_performance_query_passes)]()[]
        self._acquire_profiling_lock = Ptr(to=get_device_proc_addr(
            device, "vkAcquireProfilingLockKHR".as_c_string_slice()
        )).bitcast[type_of(self._acquire_profiling_lock)]()[]
        self._release_profiling_lock = Ptr(to=get_device_proc_addr(
            device, "vkReleaseProfilingLockKHR".as_c_string_slice()
        )).bitcast[type_of(self._release_profiling_lock)]()[]

    fn enumerate_physical_device_queue_family_performance_query_counters[
        p_counters_origin: MutOrigin = MutAnyOrigin,
        p_counter_descriptions_origin: MutOrigin = MutAnyOrigin,
    ](
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut counter_count: UInt32,
        p_counters: Ptr[PerformanceCounterKHR, p_counters_origin],
        p_counter_descriptions: Ptr[PerformanceCounterDescriptionKHR, p_counter_descriptions_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR.html
        """
        return self._enumerate_physical_device_queue_family_performance_query_counters(
            physical_device,
            queue_family_index,
            Ptr(to=counter_count),
            Ptr(to=p_counters).bitcast[Ptr[PerformanceCounterKHR, MutAnyOrigin]]()[],
            Ptr(to=p_counter_descriptions).bitcast[Ptr[PerformanceCounterDescriptionKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_queue_family_performance_query_passes(
        self,
        physical_device: PhysicalDevice,
        performance_query_create_info: QueryPoolPerformanceCreateInfoKHR,
        mut num_passes: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR.html
        """
        return self._get_physical_device_queue_family_performance_query_passes(
            physical_device, Ptr(to=performance_query_create_info), Ptr(to=num_passes)
        )

    fn acquire_profiling_lock(self, device: Device, info: AcquireProfilingLockInfoKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireProfilingLockKHR.html
        """
        return self._acquire_profiling_lock(device, Ptr(to=info))

    fn release_profiling_lock(self, device: Device):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseProfilingLockKHR.html
        """
        return self._release_profiling_lock(device)


struct GetSurfaceCapabilities2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_surface_capabilities_2: fn(
        physical_device: PhysicalDevice,
        p_surface_info: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        p_surface_capabilities: Ptr[SurfaceCapabilities2KHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_surface_formats_2: fn(
        physical_device: PhysicalDevice,
        p_surface_info: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        p_surface_format_count: Ptr[UInt32, MutAnyOrigin],
        p_surface_formats: Ptr[SurfaceFormat2KHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_surface_capabilities_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceCapabilities2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_capabilities_2)]()[]
        self._get_physical_device_surface_formats_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceFormats2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_formats_2)]()[]

    fn get_physical_device_surface_capabilities_2(
        self,
        physical_device: PhysicalDevice,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut surface_capabilities: SurfaceCapabilities2KHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceCapabilities2KHR.html
        """
        return self._get_physical_device_surface_capabilities_2(
            physical_device, Ptr(to=surface_info), Ptr(to=surface_capabilities)
        )

    fn get_physical_device_surface_formats_2[p_surface_formats_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut surface_format_count: UInt32,
        p_surface_formats: Ptr[SurfaceFormat2KHR, p_surface_formats_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceFormats2KHR.html
        """
        return self._get_physical_device_surface_formats_2(
            physical_device,
            Ptr(to=surface_info),
            Ptr(to=surface_format_count),
            Ptr(to=p_surface_formats).bitcast[Ptr[SurfaceFormat2KHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_surface_formats_2[p_surface_formats_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice, surface_info: PhysicalDeviceSurfaceInfo2KHR
    ) -> ListResult[SurfaceFormat2KHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceFormats2KHR.html
        """
        var list = List[SurfaceFormat2KHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_surface_formats_2(
        physical_device,
        Ptr(to=surface_info),
        Ptr(to=count),
        Ptr[SurfaceFormat2KHR, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_surface_formats_2(
        physical_device, Ptr(to=surface_info), Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct GetDisplayProperties2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_display_properties_2: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayProperties2KHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_display_plane_properties_2: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayPlaneProperties2KHR, MutAnyOrigin],
    ) -> Result
    var _get_display_mode_properties_2: fn(
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayModeProperties2KHR, MutAnyOrigin],
    ) -> Result
    var _get_display_plane_capabilities_2: fn(
        physical_device: PhysicalDevice,
        p_display_plane_info: Ptr[DisplayPlaneInfo2KHR, ImmutAnyOrigin],
        p_capabilities: Ptr[DisplayPlaneCapabilities2KHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_display_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayProperties2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_display_properties_2)]()[]
        self._get_physical_device_display_plane_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayPlaneProperties2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_display_plane_properties_2)]()[]
        self._get_display_mode_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayModeProperties2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_display_mode_properties_2)]()[]
        self._get_display_plane_capabilities_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayPlaneCapabilities2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_display_plane_capabilities_2)]()[]

    fn get_physical_device_display_properties_2[p_properties_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayProperties2KHR, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayProperties2KHR.html
        """
        return self._get_physical_device_display_properties_2(
            physical_device,
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[DisplayProperties2KHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_display_properties_2[p_properties_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice
    ) -> ListResult[DisplayProperties2KHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayProperties2KHR.html
        """
        var list = List[DisplayProperties2KHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_display_properties_2(
        physical_device, Ptr(to=count), Ptr[DisplayProperties2KHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_display_properties_2(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_display_plane_properties_2[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayPlaneProperties2KHR, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayPlaneProperties2KHR.html
        """
        return self._get_physical_device_display_plane_properties_2(
            physical_device,
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[DisplayPlaneProperties2KHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_display_plane_properties_2[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> ListResult[DisplayPlaneProperties2KHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayPlaneProperties2KHR.html
        """
        var list = List[DisplayPlaneProperties2KHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_display_plane_properties_2(
        physical_device, Ptr(to=count), Ptr[DisplayPlaneProperties2KHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_display_plane_properties_2(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_display_mode_properties_2[p_properties_origin: MutOrigin = MutAnyOrigin](
        self,
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayModeProperties2KHR, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayModeProperties2KHR.html
        """
        return self._get_display_mode_properties_2(
            physical_device,
            display,
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[DisplayModeProperties2KHR, MutAnyOrigin]]()[],
        )

    fn get_display_mode_properties_2[p_properties_origin: MutOrigin = MutAnyOrigin](
        self, physical_device: PhysicalDevice, display: DisplayKHR
    ) -> ListResult[DisplayModeProperties2KHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayModeProperties2KHR.html
        """
        var list = List[DisplayModeProperties2KHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_display_mode_properties_2(
        physical_device, display, Ptr(to=count), Ptr[DisplayModeProperties2KHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_display_mode_properties_2(
        physical_device, display, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_display_plane_capabilities_2(
        self,
        physical_device: PhysicalDevice,
        display_plane_info: DisplayPlaneInfo2KHR,
        mut capabilities: DisplayPlaneCapabilities2KHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayPlaneCapabilities2KHR.html
        """
        return self._get_display_plane_capabilities_2(
            physical_device, Ptr(to=display_plane_info), Ptr(to=capabilities)
        )


struct GetMemoryRequirements2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_image_memory_requirements_2: fn(
        device: Device,
        p_info: Ptr[ImageMemoryRequirementsInfo2, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _get_buffer_memory_requirements_2: fn(
        device: Device,
        p_info: Ptr[BufferMemoryRequirementsInfo2, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _get_image_sparse_memory_requirements_2: fn(
        device: Device,
        p_info: Ptr[ImageSparseMemoryRequirementsInfo2, ImmutAnyOrigin],
        p_sparse_memory_requirement_count: Ptr[UInt32, MutAnyOrigin],
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageMemoryRequirements2".as_c_string_slice()
        )).bitcast[type_of(self._get_image_memory_requirements_2)]()[]
        self._get_buffer_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferMemoryRequirements2".as_c_string_slice()
        )).bitcast[type_of(self._get_buffer_memory_requirements_2)]()[]
        self._get_image_sparse_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSparseMemoryRequirements2".as_c_string_slice()
        )).bitcast[type_of(self._get_image_sparse_memory_requirements_2)]()[]

    fn get_image_memory_requirements_2(
        self,
        device: Device,
        info: ImageMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements2.html
        """
        return self._get_image_memory_requirements_2(device, Ptr(to=info), Ptr(to=memory_requirements))

    fn get_buffer_memory_requirements_2(
        self,
        device: Device,
        info: BufferMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements2.html
        """
        return self._get_buffer_memory_requirements_2(device, Ptr(to=info), Ptr(to=memory_requirements))

    fn get_image_sparse_memory_requirements_2[
        p_sparse_memory_requirements_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, p_sparse_memory_requirements_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        return self._get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info),
            Ptr(to=sparse_memory_requirement_count),
            Ptr(to=p_sparse_memory_requirements).bitcast[Ptr[SparseImageMemoryRequirements2, MutAnyOrigin]]()[],
        )

    fn get_image_sparse_memory_requirements_2[
        p_sparse_memory_requirements_origin: MutOrigin = MutAnyOrigin
    ](
        self, device: Device, info: ImageSparseMemoryRequirementsInfo2
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self._get_image_sparse_memory_requirements_2(
    device, Ptr(to=info), Ptr(to=count), Ptr[SparseImageMemoryRequirements2, MutExternalOrigin]()
)
        list.reserve(Int(count))
        self._get_image_sparse_memory_requirements_2(device, Ptr(to=info), Ptr(to=count), list.unsafe_ptr())
        list._len = Int(count)
        return list^


struct AccelerationStructure(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_acceleration_structure: fn(
        device: Device,
        p_create_info: Ptr[AccelerationStructureCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_acceleration_structure: Ptr[AccelerationStructureKHR, MutAnyOrigin],
    ) -> Result
    var _destroy_acceleration_structure: fn(
        device: Device,
        acceleration_structure: AccelerationStructureKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _cmd_build_acceleration_structures: fn(
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        pp_build_range_infos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, ImmutAnyOrigin], ImmutAnyOrigin],
    )
    var _cmd_build_acceleration_structures_indirect: fn(
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        p_indirect_device_addresses: Ptr[DeviceAddress, ImmutAnyOrigin],
        p_indirect_strides: Ptr[UInt32, ImmutAnyOrigin],
        pp_max_primitive_counts: Ptr[Ptr[UInt32, ImmutAnyOrigin], ImmutAnyOrigin],
    )
    var _build_acceleration_structures: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        pp_build_range_infos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, ImmutAnyOrigin], ImmutAnyOrigin],
    ) -> Result
    var _copy_acceleration_structure: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyAccelerationStructureInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _copy_acceleration_structure_to_memory: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyAccelerationStructureToMemoryInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _copy_memory_to_acceleration_structure: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMemoryToAccelerationStructureInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _write_acceleration_structures_properties: fn(
        device: Device,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureKHR, ImmutAnyOrigin],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: UInt,
    ) -> Result
    var _cmd_copy_acceleration_structure: fn(
        command_buffer: CommandBuffer, p_info: Ptr[CopyAccelerationStructureInfoKHR, ImmutAnyOrigin]
    )
    var _cmd_copy_acceleration_structure_to_memory: fn(
        command_buffer: CommandBuffer,
        p_info: Ptr[CopyAccelerationStructureToMemoryInfoKHR, ImmutAnyOrigin],
    )
    var _cmd_copy_memory_to_acceleration_structure: fn(
        command_buffer: CommandBuffer,
        p_info: Ptr[CopyMemoryToAccelerationStructureInfoKHR, ImmutAnyOrigin],
    )
    var _get_acceleration_structure_device_address: fn(
        device: Device, p_info: Ptr[AccelerationStructureDeviceAddressInfoKHR, ImmutAnyOrigin]
    ) -> DeviceAddress
    var _cmd_write_acceleration_structures_properties: fn(
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureKHR, ImmutAnyOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    )
    var _get_device_acceleration_structure_compatibility: fn(
        device: Device,
        p_version_info: Ptr[AccelerationStructureVersionInfoKHR, ImmutAnyOrigin],
        p_compatibility: Ptr[AccelerationStructureCompatibilityKHR, MutAnyOrigin],
    )
    var _get_acceleration_structure_build_sizes: fn(
        device: Device,
        build_type: AccelerationStructureBuildTypeKHR,
        p_build_info: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        p_max_primitive_counts: Ptr[UInt32, ImmutAnyOrigin],
        p_size_info: Ptr[AccelerationStructureBuildSizesInfoKHR, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_acceleration_structure = Ptr(to=get_device_proc_addr(
            device, "vkCreateAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_acceleration_structure)]()[]
        self._destroy_acceleration_structure = Ptr(to=get_device_proc_addr(
            device, "vkDestroyAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_acceleration_structure)]()[]
        self._cmd_build_acceleration_structures = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildAccelerationStructuresKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_acceleration_structures)]()[]
        self._cmd_build_acceleration_structures_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildAccelerationStructuresIndirectKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_acceleration_structures_indirect)]()[]
        self._build_acceleration_structures = Ptr(to=get_device_proc_addr(
            device, "vkBuildAccelerationStructuresKHR".as_c_string_slice()
        )).bitcast[type_of(self._build_acceleration_structures)]()[]
        self._copy_acceleration_structure = Ptr(to=get_device_proc_addr(
            device, "vkCopyAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._copy_acceleration_structure)]()[]
        self._copy_acceleration_structure_to_memory = Ptr(to=get_device_proc_addr(
            device, "vkCopyAccelerationStructureToMemoryKHR".as_c_string_slice()
        )).bitcast[type_of(self._copy_acceleration_structure_to_memory)]()[]
        self._copy_memory_to_acceleration_structure = Ptr(to=get_device_proc_addr(
            device, "vkCopyMemoryToAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._copy_memory_to_acceleration_structure)]()[]
        self._write_acceleration_structures_properties = Ptr(to=get_device_proc_addr(
            device, "vkWriteAccelerationStructuresPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._write_acceleration_structures_properties)]()[]
        self._cmd_copy_acceleration_structure = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_acceleration_structure)]()[]
        self._cmd_copy_acceleration_structure_to_memory = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyAccelerationStructureToMemoryKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_acceleration_structure_to_memory)]()[]
        self._cmd_copy_memory_to_acceleration_structure = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_memory_to_acceleration_structure)]()[]
        self._get_acceleration_structure_device_address = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureDeviceAddressKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_acceleration_structure_device_address)]()[]
        self._cmd_write_acceleration_structures_properties = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteAccelerationStructuresPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_write_acceleration_structures_properties)]()[]
        self._get_device_acceleration_structure_compatibility = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceAccelerationStructureCompatibilityKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_device_acceleration_structure_compatibility)]()[]
        self._get_acceleration_structure_build_sizes = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureBuildSizesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_acceleration_structure_build_sizes)]()[]

    fn create_acceleration_structure[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: AccelerationStructureCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut acceleration_structure: AccelerationStructureKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateAccelerationStructureKHR.html
        """
        return self._create_acceleration_structure(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=acceleration_structure),
        )

    fn destroy_acceleration_structure[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        acceleration_structure: AccelerationStructureKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyAccelerationStructureKHR.html
        """
        return self._destroy_acceleration_structure(
            device,
            acceleration_structure,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn cmd_build_acceleration_structures[
        p_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        pp_build_range_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        pp_build_range_infos_origin_2: ImmutOrigin = ImmutAnyOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, p_infos_origin],
        pp_build_range_infos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, pp_build_range_infos_origin_2], pp_build_range_infos_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildAccelerationStructuresKHR.html
        """
        return self._cmd_build_acceleration_structures(
            command_buffer,
            info_count,
            Ptr(to=p_infos).bitcast[Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin]]()[],
            Ptr(to=pp_build_range_infos).bitcast[Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, ImmutAnyOrigin], ImmutAnyOrigin]]()[],
        )

    fn cmd_build_acceleration_structures_indirect[
        p_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        p_indirect_device_addresses_origin: ImmutOrigin = ImmutAnyOrigin,
        p_indirect_strides_origin: ImmutOrigin = ImmutAnyOrigin,
        pp_max_primitive_counts_origin: ImmutOrigin = ImmutAnyOrigin,
        pp_max_primitive_counts_origin_2: ImmutOrigin = ImmutAnyOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, p_infos_origin],
        p_indirect_device_addresses: Ptr[DeviceAddress, p_indirect_device_addresses_origin],
        p_indirect_strides: Ptr[UInt32, p_indirect_strides_origin],
        pp_max_primitive_counts: Ptr[Ptr[UInt32, pp_max_primitive_counts_origin_2], pp_max_primitive_counts_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildAccelerationStructuresIndirectKHR.html
        """
        return self._cmd_build_acceleration_structures_indirect(
            command_buffer,
            info_count,
            Ptr(to=p_infos).bitcast[Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin]]()[],
            Ptr(to=p_indirect_device_addresses).bitcast[Ptr[DeviceAddress, ImmutAnyOrigin]]()[],
            Ptr(to=p_indirect_strides).bitcast[Ptr[UInt32, ImmutAnyOrigin]]()[],
            Ptr(to=pp_max_primitive_counts).bitcast[Ptr[Ptr[UInt32, ImmutAnyOrigin], ImmutAnyOrigin]]()[],
        )

    fn build_acceleration_structures[
        p_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        pp_build_range_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        pp_build_range_infos_origin_2: ImmutOrigin = ImmutAnyOrigin,
    ](
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, p_infos_origin],
        pp_build_range_infos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, pp_build_range_infos_origin_2], pp_build_range_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBuildAccelerationStructuresKHR.html
        """
        return self._build_acceleration_structures(
            device,
            deferred_operation,
            info_count,
            Ptr(to=p_infos).bitcast[Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin]]()[],
            Ptr(to=pp_build_range_infos).bitcast[Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, ImmutAnyOrigin], ImmutAnyOrigin]]()[],
        )

    fn copy_acceleration_structure(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyAccelerationStructureInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyAccelerationStructureKHR.html
        """
        return self._copy_acceleration_structure(device, deferred_operation, Ptr(to=info))

    fn copy_acceleration_structure_to_memory(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyAccelerationStructureToMemoryInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyAccelerationStructureToMemoryKHR.html
        """
        return self._copy_acceleration_structure_to_memory(device, deferred_operation, Ptr(to=info))

    fn copy_memory_to_acceleration_structure(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMemoryToAccelerationStructureInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToAccelerationStructureKHR.html
        """
        return self._copy_memory_to_acceleration_structure(device, deferred_operation, Ptr(to=info))

    fn write_acceleration_structures_properties[
        p_acceleration_structures_origin: ImmutOrigin = ImmutAnyOrigin,
        p_data_origin: MutOrigin = MutAnyOrigin,
    ](
        self,
        device: Device,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureKHR, p_acceleration_structures_origin],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
        stride: UInt,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWriteAccelerationStructuresPropertiesKHR.html
        """
        return self._write_acceleration_structures_properties(
            device,
            acceleration_structure_count,
            Ptr(to=p_acceleration_structures).bitcast[Ptr[AccelerationStructureKHR, ImmutAnyOrigin]]()[],
            query_type,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
            stride,
        )

    fn cmd_copy_acceleration_structure(
        self, command_buffer: CommandBuffer, info: CopyAccelerationStructureInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyAccelerationStructureKHR.html
        """
        return self._cmd_copy_acceleration_structure(command_buffer, Ptr(to=info))

    fn cmd_copy_acceleration_structure_to_memory(
        self, command_buffer: CommandBuffer, info: CopyAccelerationStructureToMemoryInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyAccelerationStructureToMemoryKHR.html
        """
        return self._cmd_copy_acceleration_structure_to_memory(command_buffer, Ptr(to=info))

    fn cmd_copy_memory_to_acceleration_structure(
        self, command_buffer: CommandBuffer, info: CopyMemoryToAccelerationStructureInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryToAccelerationStructureKHR.html
        """
        return self._cmd_copy_memory_to_acceleration_structure(command_buffer, Ptr(to=info))

    fn get_acceleration_structure_device_address(
        self, device: Device, info: AccelerationStructureDeviceAddressInfoKHR
    ) -> DeviceAddress:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureDeviceAddressKHR.html
        """
        return self._get_acceleration_structure_device_address(device, Ptr(to=info))

    fn cmd_write_acceleration_structures_properties[
        p_acceleration_structures_origin: ImmutOrigin = ImmutAnyOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureKHR, p_acceleration_structures_origin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteAccelerationStructuresPropertiesKHR.html
        """
        return self._cmd_write_acceleration_structures_properties(
            command_buffer,
            acceleration_structure_count,
            Ptr(to=p_acceleration_structures).bitcast[Ptr[AccelerationStructureKHR, ImmutAnyOrigin]]()[],
            query_type,
            query_pool,
            first_query,
        )

    fn get_device_acceleration_structure_compatibility(
        self,
        device: Device,
        version_info: AccelerationStructureVersionInfoKHR,
        mut compatibility: AccelerationStructureCompatibilityKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceAccelerationStructureCompatibilityKHR.html
        """
        return self._get_device_acceleration_structure_compatibility(
            device, Ptr(to=version_info), Ptr(to=compatibility)
        )

    fn get_acceleration_structure_build_sizes[
        p_max_primitive_counts_origin: ImmutOrigin = ImmutAnyOrigin
    ](
        self,
        device: Device,
        build_type: AccelerationStructureBuildTypeKHR,
        build_info: AccelerationStructureBuildGeometryInfoKHR,
        p_max_primitive_counts: Ptr[UInt32, p_max_primitive_counts_origin],
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureBuildSizesKHR.html
        """
        return self._get_acceleration_structure_build_sizes(
            device,
            build_type,
            Ptr(to=build_info),
            Ptr(to=p_max_primitive_counts).bitcast[Ptr[UInt32, ImmutAnyOrigin]]()[],
            Ptr(to=size_info),
        )


struct RayTracingPipeline(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_trace_rays: fn(
        command_buffer: CommandBuffer,
        p_raygen_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_miss_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_hit_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_callable_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        width: UInt32,
        height: UInt32,
        depth: UInt32,
    )
    var _create_ray_tracing_pipelines: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _get_ray_tracing_shader_group_handles: fn(
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_ray_tracing_capture_replay_shader_group_handles: fn(
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _cmd_trace_rays_indirect: fn(
        command_buffer: CommandBuffer,
        p_raygen_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_miss_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_hit_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_callable_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        indirect_device_address: DeviceAddress,
    )
    var _get_ray_tracing_shader_group_stack_size: fn(
        device: Device, pipeline: Pipeline, group: UInt32, group_shader: ShaderGroupShaderKHR
    ) -> DeviceSize
    var _cmd_set_ray_tracing_pipeline_stack_size: fn(
        command_buffer: CommandBuffer, pipeline_stack_size: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_trace_rays = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_trace_rays)]()[]
        self._create_ray_tracing_pipelines = Ptr(to=get_device_proc_addr(
            device, "vkCreateRayTracingPipelinesKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_ray_tracing_pipelines)]()[]
        self._get_ray_tracing_shader_group_handles = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingShaderGroupHandlesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_ray_tracing_shader_group_handles)]()[]
        self._get_ray_tracing_capture_replay_shader_group_handles = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_ray_tracing_capture_replay_shader_group_handles)]()[]
        self._cmd_trace_rays_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysIndirectKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_trace_rays_indirect)]()[]
        self._get_ray_tracing_shader_group_stack_size = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingShaderGroupStackSizeKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_ray_tracing_shader_group_stack_size)]()[]
        self._cmd_set_ray_tracing_pipeline_stack_size = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRayTracingPipelineStackSizeKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_ray_tracing_pipeline_stack_size)]()[]

    fn cmd_trace_rays(
        self,
        command_buffer: CommandBuffer,
        raygen_shader_binding_table: StridedDeviceAddressRegionKHR,
        miss_shader_binding_table: StridedDeviceAddressRegionKHR,
        hit_shader_binding_table: StridedDeviceAddressRegionKHR,
        callable_shader_binding_table: StridedDeviceAddressRegionKHR,
        width: UInt32,
        height: UInt32,
        depth: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdTraceRaysKHR.html
        """
        return self._cmd_trace_rays(
            command_buffer,
            Ptr(to=raygen_shader_binding_table),
            Ptr(to=miss_shader_binding_table),
            Ptr(to=hit_shader_binding_table),
            Ptr(to=callable_shader_binding_table),
            width,
            height,
            depth,
        )

    fn create_ray_tracing_pipelines[
        p_create_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        p_allocator_origin: ImmutOrigin = ImmutAnyOrigin,
        p_pipelines_origin: MutOrigin = MutAnyOrigin,
    ](
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoKHR, p_create_infos_origin],
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRayTracingPipelinesKHR.html
        """
        return self._create_ray_tracing_pipelines(
            device,
            deferred_operation,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[RayTracingPipelineCreateInfoKHR, ImmutAnyOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutAnyOrigin]]()[],
        )

    fn get_ray_tracing_shader_group_handles[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRayTracingShaderGroupHandlesKHR.html
        """
        return self._get_ray_tracing_shader_group_handles(
            device,
            pipeline,
            first_group,
            group_count,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn get_ray_tracing_capture_replay_shader_group_handles[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRayTracingCaptureReplayShaderGroupHandlesKHR.html
        """
        return self._get_ray_tracing_capture_replay_shader_group_handles(
            device,
            pipeline,
            first_group,
            group_count,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn cmd_trace_rays_indirect(
        self,
        command_buffer: CommandBuffer,
        raygen_shader_binding_table: StridedDeviceAddressRegionKHR,
        miss_shader_binding_table: StridedDeviceAddressRegionKHR,
        hit_shader_binding_table: StridedDeviceAddressRegionKHR,
        callable_shader_binding_table: StridedDeviceAddressRegionKHR,
        indirect_device_address: DeviceAddress,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdTraceRaysIndirectKHR.html
        """
        return self._cmd_trace_rays_indirect(
            command_buffer,
            Ptr(to=raygen_shader_binding_table),
            Ptr(to=miss_shader_binding_table),
            Ptr(to=hit_shader_binding_table),
            Ptr(to=callable_shader_binding_table),
            indirect_device_address,
        )

    fn get_ray_tracing_shader_group_stack_size(
        self, device: Device, pipeline: Pipeline, group: UInt32, group_shader: ShaderGroupShaderKHR
    ) -> DeviceSize:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRayTracingShaderGroupStackSizeKHR.html
        """
        return self._get_ray_tracing_shader_group_stack_size(device, pipeline, group, group_shader)

    fn cmd_set_ray_tracing_pipeline_stack_size(
        self, command_buffer: CommandBuffer, pipeline_stack_size: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRayTracingPipelineStackSizeKHR.html
        """
        return self._cmd_set_ray_tracing_pipeline_stack_size(command_buffer, pipeline_stack_size)


struct SamplerYcbcrConversion(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_sampler_ycbcr_conversion: fn(
        device: Device,
        p_create_info: Ptr[SamplerYcbcrConversionCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_ycbcr_conversion: Ptr[SamplerYcbcrConversion, MutAnyOrigin],
    ) -> Result
    var _destroy_sampler_ycbcr_conversion: fn(
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_sampler_ycbcr_conversion = Ptr(to=get_device_proc_addr(
            device, "vkCreateSamplerYcbcrConversion".as_c_string_slice()
        )).bitcast[type_of(self._create_sampler_ycbcr_conversion)]()[]
        self._destroy_sampler_ycbcr_conversion = Ptr(to=get_device_proc_addr(
            device, "vkDestroySamplerYcbcrConversion".as_c_string_slice()
        )).bitcast[type_of(self._destroy_sampler_ycbcr_conversion)]()[]

    fn create_sampler_ycbcr_conversion[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSamplerYcbcrConversion.html
        """
        return self._create_sampler_ycbcr_conversion(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=ycbcr_conversion),
        )

    fn destroy_sampler_ycbcr_conversion[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySamplerYcbcrConversion.html
        """
        return self._destroy_sampler_ycbcr_conversion(
            device,
            ycbcr_conversion,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )


struct BindMemory2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _bind_buffer_memory_2: fn(
        device: Device, bind_info_count: UInt32, p_bind_infos: Ptr[BindBufferMemoryInfo, ImmutAnyOrigin]
    ) -> Result
    var _bind_image_memory_2: fn(
        device: Device, bind_info_count: UInt32, p_bind_infos: Ptr[BindImageMemoryInfo, ImmutAnyOrigin]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._bind_buffer_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkBindBufferMemory2".as_c_string_slice()
        )).bitcast[type_of(self._bind_buffer_memory_2)]()[]
        self._bind_image_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkBindImageMemory2".as_c_string_slice()
        )).bitcast[type_of(self._bind_image_memory_2)]()[]

    fn bind_buffer_memory_2[p_bind_infos_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory2.html
        """
        return self._bind_buffer_memory_2(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindBufferMemoryInfo, ImmutAnyOrigin]]()[],
        )

    fn bind_image_memory_2[p_bind_infos_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory2.html
        """
        return self._bind_image_memory_2(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindImageMemoryInfo, ImmutAnyOrigin]]()[],
        )


struct Maintenance3(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_descriptor_set_layout_support: fn(
        device: Device,
        p_create_info: Ptr[DescriptorSetLayoutCreateInfo, ImmutAnyOrigin],
        p_support: Ptr[DescriptorSetLayoutSupport, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_descriptor_set_layout_support = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutSupport".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_set_layout_support)]()[]

    fn get_descriptor_set_layout_support(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        mut support: DescriptorSetLayoutSupport,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutSupport.html
        """
        return self._get_descriptor_set_layout_support(device, Ptr(to=create_info), Ptr(to=support))


struct DrawIndirectCount(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_indirect_count: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    )
    var _cmd_draw_indexed_indirect_count: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirectCount".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_indirect_count)]()[]
        self._cmd_draw_indexed_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndexedIndirectCount".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_indexed_indirect_count)]()[]

    fn cmd_draw_indirect_count(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirectCount.html
        """
        return self._cmd_draw_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )

    fn cmd_draw_indexed_indirect_count(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirectCount.html
        """
        return self._cmd_draw_indexed_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )


struct TimelineSemaphore(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_semaphore_counter_value: fn(
        device: Device, semaphore: Semaphore, p_value: Ptr[UInt64, MutAnyOrigin]
    ) -> Result
    var _wait_semaphores: fn(
        device: Device, p_wait_info: Ptr[SemaphoreWaitInfo, ImmutAnyOrigin], timeout: UInt64
    ) -> Result
    var _signal_semaphore: fn(
        device: Device, p_signal_info: Ptr[SemaphoreSignalInfo, ImmutAnyOrigin]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_semaphore_counter_value = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreCounterValue".as_c_string_slice()
        )).bitcast[type_of(self._get_semaphore_counter_value)]()[]
        self._wait_semaphores = Ptr(to=get_device_proc_addr(
            device, "vkWaitSemaphores".as_c_string_slice()
        )).bitcast[type_of(self._wait_semaphores)]()[]
        self._signal_semaphore = Ptr(to=get_device_proc_addr(
            device, "vkSignalSemaphore".as_c_string_slice()
        )).bitcast[type_of(self._signal_semaphore)]()[]

    fn get_semaphore_counter_value(
        self, device: Device, semaphore: Semaphore, mut value: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreCounterValue.html
        """
        return self._get_semaphore_counter_value(device, semaphore, Ptr(to=value))

    fn wait_semaphores(
        self, device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitSemaphores.html
        """
        return self._wait_semaphores(device, Ptr(to=wait_info), timeout)

    fn signal_semaphore(self, device: Device, signal_info: SemaphoreSignalInfo) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSignalSemaphore.html
        """
        return self._signal_semaphore(device, Ptr(to=signal_info))


struct FragmentShadingRate(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_fragment_shading_rates: fn(
        physical_device: PhysicalDevice,
        p_fragment_shading_rate_count: Ptr[UInt32, MutAnyOrigin],
        p_fragment_shading_rates: Ptr[PhysicalDeviceFragmentShadingRateKHR, MutAnyOrigin],
    ) -> Result
    var _cmd_set_fragment_shading_rate: fn(
        command_buffer: CommandBuffer,
        p_fragment_size: Ptr[Extent2D, ImmutAnyOrigin],
        combiner_ops: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_fragment_shading_rates = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceFragmentShadingRatesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_fragment_shading_rates)]()[]
        self._cmd_set_fragment_shading_rate = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFragmentShadingRateKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_fragment_shading_rate)]()[]

    fn get_physical_device_fragment_shading_rates[
        p_fragment_shading_rates_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut fragment_shading_rate_count: UInt32,
        p_fragment_shading_rates: Ptr[PhysicalDeviceFragmentShadingRateKHR, p_fragment_shading_rates_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFragmentShadingRatesKHR.html
        """
        return self._get_physical_device_fragment_shading_rates(
            physical_device,
            Ptr(to=fragment_shading_rate_count),
            Ptr(to=p_fragment_shading_rates).bitcast[Ptr[PhysicalDeviceFragmentShadingRateKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_fragment_shading_rates[
        p_fragment_shading_rates_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> ListResult[PhysicalDeviceFragmentShadingRateKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFragmentShadingRatesKHR.html
        """
        var list = List[PhysicalDeviceFragmentShadingRateKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_fragment_shading_rates(
        physical_device,
        Ptr(to=count),
        Ptr[PhysicalDeviceFragmentShadingRateKHR, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_fragment_shading_rates(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn cmd_set_fragment_shading_rate(
        self,
        command_buffer: CommandBuffer,
        fragment_size: Extent2D,
        combiner_ops: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFragmentShadingRateKHR.html
        """
        return self._cmd_set_fragment_shading_rate(command_buffer, Ptr(to=fragment_size), combiner_ops)


struct DynamicRenderingLocalRead(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_rendering_attachment_locations: fn(
        command_buffer: CommandBuffer,
        p_location_info: Ptr[RenderingAttachmentLocationInfo, ImmutAnyOrigin],
    )
    var _cmd_set_rendering_input_attachment_indices: fn(
        command_buffer: CommandBuffer,
        p_input_attachment_index_info: Ptr[RenderingInputAttachmentIndexInfo, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_rendering_attachment_locations = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRenderingAttachmentLocations".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rendering_attachment_locations)]()[]
        self._cmd_set_rendering_input_attachment_indices = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRenderingInputAttachmentIndices".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_rendering_input_attachment_indices)]()[]

    fn cmd_set_rendering_attachment_locations(
        self, command_buffer: CommandBuffer, location_info: RenderingAttachmentLocationInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRenderingAttachmentLocations.html
        """
        return self._cmd_set_rendering_attachment_locations(command_buffer, Ptr(to=location_info))

    fn cmd_set_rendering_input_attachment_indices(
        self,
        command_buffer: CommandBuffer,
        input_attachment_index_info: RenderingInputAttachmentIndexInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRenderingInputAttachmentIndices.html
        """
        return self._cmd_set_rendering_input_attachment_indices(
            command_buffer, Ptr(to=input_attachment_index_info)
        )


struct PresentWait(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _wait_for_present: fn(
        device: Device, swapchain: SwapchainKHR, present_id: UInt64, timeout: UInt64
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._wait_for_present = Ptr(to=get_device_proc_addr(
            device, "vkWaitForPresentKHR".as_c_string_slice()
        )).bitcast[type_of(self._wait_for_present)]()[]

    fn wait_for_present(
        self, device: Device, swapchain: SwapchainKHR, present_id: UInt64, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForPresentKHR.html
        """
        return self._wait_for_present(device, swapchain, present_id, timeout)


struct BufferDeviceAddress(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_buffer_device_address: fn(
        device: Device, p_info: Ptr[BufferDeviceAddressInfo, ImmutAnyOrigin]
    ) -> DeviceAddress
    var _get_buffer_opaque_capture_address: fn(
        device: Device, p_info: Ptr[BufferDeviceAddressInfo, ImmutAnyOrigin]
    ) -> UInt64
    var _get_device_memory_opaque_capture_address: fn(
        device: Device, p_info: Ptr[DeviceMemoryOpaqueCaptureAddressInfo, ImmutAnyOrigin]
    ) -> UInt64

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_buffer_device_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferDeviceAddress".as_c_string_slice()
        )).bitcast[type_of(self._get_buffer_device_address)]()[]
        self._get_buffer_opaque_capture_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferOpaqueCaptureAddress".as_c_string_slice()
        )).bitcast[type_of(self._get_buffer_opaque_capture_address)]()[]
        self._get_device_memory_opaque_capture_address = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceMemoryOpaqueCaptureAddress".as_c_string_slice()
        )).bitcast[type_of(self._get_device_memory_opaque_capture_address)]()[]

    fn get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._get_buffer_device_address(device, Ptr(to=info))

    fn get_buffer_opaque_capture_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureAddress.html
        """
        return self._get_buffer_opaque_capture_address(device, Ptr(to=info))

    fn get_device_memory_opaque_capture_address(
        self, device: Device, info: DeviceMemoryOpaqueCaptureAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryOpaqueCaptureAddress.html
        """
        return self._get_device_memory_opaque_capture_address(device, Ptr(to=info))


struct DeferredHostOperations(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_deferred_operation: fn(
        device: Device,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_deferred_operation: Ptr[DeferredOperationKHR, MutAnyOrigin],
    ) -> Result
    var _destroy_deferred_operation: fn(
        device: Device,
        operation: DeferredOperationKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_deferred_operation_max_concurrency: fn(
        device: Device, operation: DeferredOperationKHR
    ) -> UInt32
    var _get_deferred_operation_result: fn(device: Device, operation: DeferredOperationKHR) -> Result
    var _deferred_operation_join: fn(device: Device, operation: DeferredOperationKHR) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_deferred_operation = Ptr(to=get_device_proc_addr(
            device, "vkCreateDeferredOperationKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_deferred_operation)]()[]
        self._destroy_deferred_operation = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDeferredOperationKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_deferred_operation)]()[]
        self._get_deferred_operation_max_concurrency = Ptr(to=get_device_proc_addr(
            device, "vkGetDeferredOperationMaxConcurrencyKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_deferred_operation_max_concurrency)]()[]
        self._get_deferred_operation_result = Ptr(to=get_device_proc_addr(
            device, "vkGetDeferredOperationResultKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_deferred_operation_result)]()[]
        self._deferred_operation_join = Ptr(to=get_device_proc_addr(
            device, "vkDeferredOperationJoinKHR".as_c_string_slice()
        )).bitcast[type_of(self._deferred_operation_join)]()[]

    fn create_deferred_operation[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut deferred_operation: DeferredOperationKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDeferredOperationKHR.html
        """
        return self._create_deferred_operation(
            device,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=deferred_operation),
        )

    fn destroy_deferred_operation[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        operation: DeferredOperationKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDeferredOperationKHR.html
        """
        return self._destroy_deferred_operation(
            device, operation, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn get_deferred_operation_max_concurrency(
        self, device: Device, operation: DeferredOperationKHR
    ) -> UInt32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeferredOperationMaxConcurrencyKHR.html
        """
        return self._get_deferred_operation_max_concurrency(device, operation)

    fn get_deferred_operation_result(
        self, device: Device, operation: DeferredOperationKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeferredOperationResultKHR.html
        """
        return self._get_deferred_operation_result(device, operation)

    fn deferred_operation_join(self, device: Device, operation: DeferredOperationKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeferredOperationJoinKHR.html
        """
        return self._deferred_operation_join(device, operation)


struct PipelineExecutableProperties(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_pipeline_executable_properties: fn(
        device: Device,
        p_pipeline_info: Ptr[PipelineInfoKHR, ImmutAnyOrigin],
        p_executable_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[PipelineExecutablePropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_pipeline_executable_statistics: fn(
        device: Device,
        p_executable_info: Ptr[PipelineExecutableInfoKHR, ImmutAnyOrigin],
        p_statistic_count: Ptr[UInt32, MutAnyOrigin],
        p_statistics: Ptr[PipelineExecutableStatisticKHR, MutAnyOrigin],
    ) -> Result
    var _get_pipeline_executable_internal_representations: fn(
        device: Device,
        p_executable_info: Ptr[PipelineExecutableInfoKHR, ImmutAnyOrigin],
        p_internal_representation_count: Ptr[UInt32, MutAnyOrigin],
        p_internal_representations: Ptr[PipelineExecutableInternalRepresentationKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_pipeline_executable_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineExecutablePropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_executable_properties)]()[]
        self._get_pipeline_executable_statistics = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineExecutableStatisticsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_executable_statistics)]()[]
        self._get_pipeline_executable_internal_representations = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineExecutableInternalRepresentationsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_executable_internal_representations)]()[]

    fn get_pipeline_executable_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        pipeline_info: PipelineInfoKHR,
        mut executable_count: UInt32,
        p_properties: Ptr[PipelineExecutablePropertiesKHR, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineExecutablePropertiesKHR.html
        """
        return self._get_pipeline_executable_properties(
            device,
            Ptr(to=pipeline_info),
            Ptr(to=executable_count),
            Ptr(to=p_properties).bitcast[Ptr[PipelineExecutablePropertiesKHR, MutAnyOrigin]]()[],
        )

    fn get_pipeline_executable_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self, device: Device, pipeline_info: PipelineInfoKHR
    ) -> ListResult[PipelineExecutablePropertiesKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineExecutablePropertiesKHR.html
        """
        var list = List[PipelineExecutablePropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_pipeline_executable_properties(
        device,
        Ptr(to=pipeline_info),
        Ptr(to=count),
        Ptr[PipelineExecutablePropertiesKHR, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_pipeline_executable_properties(
        device, Ptr(to=pipeline_info), Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_pipeline_executable_statistics[p_statistics_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        executable_info: PipelineExecutableInfoKHR,
        mut statistic_count: UInt32,
        p_statistics: Ptr[PipelineExecutableStatisticKHR, p_statistics_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineExecutableStatisticsKHR.html
        """
        return self._get_pipeline_executable_statistics(
            device,
            Ptr(to=executable_info),
            Ptr(to=statistic_count),
            Ptr(to=p_statistics).bitcast[Ptr[PipelineExecutableStatisticKHR, MutAnyOrigin]]()[],
        )

    fn get_pipeline_executable_statistics[p_statistics_origin: MutOrigin = MutAnyOrigin](
        self, device: Device, executable_info: PipelineExecutableInfoKHR
    ) -> ListResult[PipelineExecutableStatisticKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineExecutableStatisticsKHR.html
        """
        var list = List[PipelineExecutableStatisticKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_pipeline_executable_statistics(
        device,
        Ptr(to=executable_info),
        Ptr(to=count),
        Ptr[PipelineExecutableStatisticKHR, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_pipeline_executable_statistics(
        device, Ptr(to=executable_info), Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_pipeline_executable_internal_representations[
        p_internal_representations_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        device: Device,
        executable_info: PipelineExecutableInfoKHR,
        mut internal_representation_count: UInt32,
        p_internal_representations: Ptr[PipelineExecutableInternalRepresentationKHR, p_internal_representations_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineExecutableInternalRepresentationsKHR.html
        """
        return self._get_pipeline_executable_internal_representations(
            device,
            Ptr(to=executable_info),
            Ptr(to=internal_representation_count),
            Ptr(to=p_internal_representations).bitcast[Ptr[PipelineExecutableInternalRepresentationKHR, MutAnyOrigin]]()[],
        )

    fn get_pipeline_executable_internal_representations[
        p_internal_representations_origin: MutOrigin = MutAnyOrigin
    ](
        self, device: Device, executable_info: PipelineExecutableInfoKHR
    ) -> ListResult[PipelineExecutableInternalRepresentationKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineExecutableInternalRepresentationsKHR.html
        """
        var list = List[PipelineExecutableInternalRepresentationKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_pipeline_executable_internal_representations(
        device,
        Ptr(to=executable_info),
        Ptr(to=count),
        Ptr[PipelineExecutableInternalRepresentationKHR, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_pipeline_executable_internal_representations(
        device, Ptr(to=executable_info), Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct MapMemory2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _map_memory_2: fn(
        device: Device,
        p_memory_map_info: Ptr[MemoryMapInfo, ImmutAnyOrigin],
        pp_data: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    ) -> Result
    var _unmap_memory_2: fn(
        device: Device, p_memory_unmap_info: Ptr[MemoryUnmapInfo, ImmutAnyOrigin]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._map_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkMapMemory2".as_c_string_slice()
        )).bitcast[type_of(self._map_memory_2)]()[]
        self._unmap_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkUnmapMemory2".as_c_string_slice()
        )).bitcast[type_of(self._unmap_memory_2)]()[]

    fn map_memory_2[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        memory_map_info: MemoryMapInfo,
        mut p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMapMemory2.html
        """
        return self._map_memory_2(
            device,
            Ptr(to=memory_map_info),
            Ptr(to=Ptr(to=p_data)).bitcast[Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin]]()[],
        )

    fn unmap_memory_2(self, device: Device, memory_unmap_info: MemoryUnmapInfo) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory2.html
        """
        return self._unmap_memory_2(device, Ptr(to=memory_unmap_info))


struct VideoEncodeQueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_video_encode_quality_level_properties: fn(
        physical_device: PhysicalDevice,
        p_quality_level_info: Ptr[PhysicalDeviceVideoEncodeQualityLevelInfoKHR, ImmutAnyOrigin],
        p_quality_level_properties: Ptr[VideoEncodeQualityLevelPropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_encoded_video_session_parameters: fn(
        device: Device,
        p_video_session_parameters_info: Ptr[VideoEncodeSessionParametersGetInfoKHR, ImmutAnyOrigin],
        p_feedback_info: Ptr[VideoEncodeSessionParametersFeedbackInfoKHR, MutAnyOrigin],
        p_data_size: Ptr[UInt, MutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _cmd_encode_video: fn(
        command_buffer: CommandBuffer, p_encode_info: Ptr[VideoEncodeInfoKHR, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_video_encode_quality_level_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_video_encode_quality_level_properties)]()[]
        self._get_encoded_video_session_parameters = Ptr(to=get_device_proc_addr(
            device, "vkGetEncodedVideoSessionParametersKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_encoded_video_session_parameters)]()[]
        self._cmd_encode_video = Ptr(to=get_device_proc_addr(
            device, "vkCmdEncodeVideoKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_encode_video)]()[]

    fn get_physical_device_video_encode_quality_level_properties(
        self,
        physical_device: PhysicalDevice,
        quality_level_info: PhysicalDeviceVideoEncodeQualityLevelInfoKHR,
        mut quality_level_properties: VideoEncodeQualityLevelPropertiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR.html
        """
        return self._get_physical_device_video_encode_quality_level_properties(
            physical_device, Ptr(to=quality_level_info), Ptr(to=quality_level_properties)
        )

    fn get_encoded_video_session_parameters[
        p_feedback_info_origin: MutOrigin = MutAnyOrigin, p_data_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        device: Device,
        video_session_parameters_info: VideoEncodeSessionParametersGetInfoKHR,
        p_feedback_info: Ptr[VideoEncodeSessionParametersFeedbackInfoKHR, p_feedback_info_origin],
        mut data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEncodedVideoSessionParametersKHR.html
        """
        return self._get_encoded_video_session_parameters(
            device,
            Ptr(to=video_session_parameters_info),
            Ptr(to=p_feedback_info).bitcast[Ptr[VideoEncodeSessionParametersFeedbackInfoKHR, MutAnyOrigin]]()[],
            Ptr(to=data_size),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn get_encoded_video_session_parameters[
        p_feedback_info_origin: MutOrigin = MutAnyOrigin, p_data_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        device: Device,
        video_session_parameters_info: VideoEncodeSessionParametersGetInfoKHR,
        p_feedback_info: Ptr[VideoEncodeSessionParametersFeedbackInfoKHR, p_feedback_info_origin],
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEncodedVideoSessionParametersKHR.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_encoded_video_session_parameters(
        device,
        Ptr(to=video_session_parameters_info),
        Ptr(to=p_feedback_info).bitcast[Ptr[VideoEncodeSessionParametersFeedbackInfoKHR, MutAnyOrigin]]()[],
        Ptr(to=count),
        Ptr[NoneType, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_encoded_video_session_parameters(
        device,
        Ptr(to=video_session_parameters_info),
        Ptr(to=p_feedback_info).bitcast[Ptr[VideoEncodeSessionParametersFeedbackInfoKHR, MutAnyOrigin]]()[],
        Ptr(to=count),
        list.unsafe_ptr().bitcast[NoneType](),
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn cmd_encode_video(self, command_buffer: CommandBuffer, encode_info: VideoEncodeInfoKHR):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEncodeVideoKHR.html
        """
        return self._cmd_encode_video(command_buffer, Ptr(to=encode_info))


struct Synchronization2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_event_2: fn(
        command_buffer: CommandBuffer,
        event: Event,
        p_dependency_info: Ptr[DependencyInfo, ImmutAnyOrigin],
    )
    var _cmd_reset_event_2: fn(
        command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2
    )
    var _cmd_wait_events_2: fn(
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        p_dependency_infos: Ptr[DependencyInfo, ImmutAnyOrigin],
    )
    var _cmd_pipeline_barrier_2: fn(
        command_buffer: CommandBuffer, p_dependency_info: Ptr[DependencyInfo, ImmutAnyOrigin]
    )
    var _cmd_write_timestamp_2: fn(
        command_buffer: CommandBuffer, stage: PipelineStageFlags2, query_pool: QueryPool, query: UInt32
    )
    var _queue_submit_2: fn(
        queue: Queue, submit_count: UInt32, p_submits: Ptr[SubmitInfo2, ImmutAnyOrigin], fence: Fence
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_event_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetEvent2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_event_2)]()[]
        self._cmd_reset_event_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdResetEvent2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_reset_event_2)]()[]
        self._cmd_wait_events_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdWaitEvents2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_wait_events_2)]()[]
        self._cmd_pipeline_barrier_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPipelineBarrier2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_pipeline_barrier_2)]()[]
        self._cmd_write_timestamp_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteTimestamp2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_write_timestamp_2)]()[]
        self._queue_submit_2 = Ptr(to=get_device_proc_addr(
            device, "vkQueueSubmit2".as_c_string_slice()
        )).bitcast[type_of(self._queue_submit_2)]()[]

    fn cmd_set_event_2(
        self, command_buffer: CommandBuffer, event: Event, dependency_info: DependencyInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent2.html
        """
        return self._cmd_set_event_2(command_buffer, event, Ptr(to=dependency_info))

    fn cmd_reset_event_2(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent2.html
        """
        return self._cmd_reset_event_2(command_buffer, event, stage_mask)

    fn cmd_wait_events_2[
        p_events_origin: ImmutOrigin = ImmutAnyOrigin,
        p_dependency_infos_origin: ImmutOrigin = ImmutAnyOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, p_events_origin],
        p_dependency_infos: Ptr[DependencyInfo, p_dependency_infos_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents2.html
        """
        return self._cmd_wait_events_2(
            command_buffer,
            event_count,
            Ptr(to=p_events).bitcast[Ptr[Event, ImmutAnyOrigin]]()[],
            Ptr(to=p_dependency_infos).bitcast[Ptr[DependencyInfo, ImmutAnyOrigin]]()[],
        )

    fn cmd_pipeline_barrier_2(
        self, command_buffer: CommandBuffer, dependency_info: DependencyInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier2.html
        """
        return self._cmd_pipeline_barrier_2(command_buffer, Ptr(to=dependency_info))

    fn cmd_write_timestamp_2(
        self,
        command_buffer: CommandBuffer,
        stage: PipelineStageFlags2,
        query_pool: QueryPool,
        query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteTimestamp2.html
        """
        return self._cmd_write_timestamp_2(command_buffer, stage, query_pool, query)

    fn queue_submit_2[p_submits_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo2, p_submits_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit2.html
        """
        return self._queue_submit_2(
            queue, submit_count, Ptr(to=p_submits).bitcast[Ptr[SubmitInfo2, ImmutAnyOrigin]]()[], fence
        )


struct CopyCommands2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_copy_buffer_2: fn(
        command_buffer: CommandBuffer, p_copy_buffer_info: Ptr[CopyBufferInfo2, ImmutAnyOrigin]
    )
    var _cmd_copy_image_2: fn(
        command_buffer: CommandBuffer, p_copy_image_info: Ptr[CopyImageInfo2, ImmutAnyOrigin]
    )
    var _cmd_copy_buffer_to_image_2: fn(
        command_buffer: CommandBuffer,
        p_copy_buffer_to_image_info: Ptr[CopyBufferToImageInfo2, ImmutAnyOrigin],
    )
    var _cmd_copy_image_to_buffer_2: fn(
        command_buffer: CommandBuffer,
        p_copy_image_to_buffer_info: Ptr[CopyImageToBufferInfo2, ImmutAnyOrigin],
    )
    var _cmd_blit_image_2: fn(
        command_buffer: CommandBuffer, p_blit_image_info: Ptr[BlitImageInfo2, ImmutAnyOrigin]
    )
    var _cmd_resolve_image_2: fn(
        command_buffer: CommandBuffer, p_resolve_image_info: Ptr[ResolveImageInfo2, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_copy_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBuffer2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_buffer_2)]()[]
        self._cmd_copy_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImage2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_image_2)]()[]
        self._cmd_copy_buffer_to_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBufferToImage2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_buffer_to_image_2)]()[]
        self._cmd_copy_image_to_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImageToBuffer2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_image_to_buffer_2)]()[]
        self._cmd_blit_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBlitImage2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_blit_image_2)]()[]
        self._cmd_resolve_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdResolveImage2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_resolve_image_2)]()[]

    fn cmd_copy_buffer_2(self, command_buffer: CommandBuffer, copy_buffer_info: CopyBufferInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer2.html
        """
        return self._cmd_copy_buffer_2(command_buffer, Ptr(to=copy_buffer_info))

    fn cmd_copy_image_2(self, command_buffer: CommandBuffer, copy_image_info: CopyImageInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage2.html
        """
        return self._cmd_copy_image_2(command_buffer, Ptr(to=copy_image_info))

    fn cmd_copy_buffer_to_image_2(
        self, command_buffer: CommandBuffer, copy_buffer_to_image_info: CopyBufferToImageInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage2.html
        """
        return self._cmd_copy_buffer_to_image_2(command_buffer, Ptr(to=copy_buffer_to_image_info))

    fn cmd_copy_image_to_buffer_2(
        self, command_buffer: CommandBuffer, copy_image_to_buffer_info: CopyImageToBufferInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer2.html
        """
        return self._cmd_copy_image_to_buffer_2(command_buffer, Ptr(to=copy_image_to_buffer_info))

    fn cmd_blit_image_2(self, command_buffer: CommandBuffer, blit_image_info: BlitImageInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage2.html
        """
        return self._cmd_blit_image_2(command_buffer, Ptr(to=blit_image_info))

    fn cmd_resolve_image_2(
        self, command_buffer: CommandBuffer, resolve_image_info: ResolveImageInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage2.html
        """
        return self._cmd_resolve_image_2(command_buffer, Ptr(to=resolve_image_info))


struct RayTracingMaintenance1(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_trace_rays_indirect_2: fn(
        command_buffer: CommandBuffer, indirect_device_address: DeviceAddress
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_trace_rays_indirect_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysIndirect2KHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_trace_rays_indirect_2)]()[]

    fn cmd_trace_rays_indirect_2(
        self, command_buffer: CommandBuffer, indirect_device_address: DeviceAddress
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdTraceRaysIndirect2KHR.html
        """
        return self._cmd_trace_rays_indirect_2(command_buffer, indirect_device_address)


struct Maintenance4(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_device_buffer_memory_requirements: fn(
        device: Device,
        p_info: Ptr[DeviceBufferMemoryRequirements, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _get_device_image_memory_requirements: fn(
        device: Device,
        p_info: Ptr[DeviceImageMemoryRequirements, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _get_device_image_sparse_memory_requirements: fn(
        device: Device,
        p_info: Ptr[DeviceImageMemoryRequirements, ImmutAnyOrigin],
        p_sparse_memory_requirement_count: Ptr[UInt32, MutAnyOrigin],
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_device_buffer_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceBufferMemoryRequirements".as_c_string_slice()
        )).bitcast[type_of(self._get_device_buffer_memory_requirements)]()[]
        self._get_device_image_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageMemoryRequirements".as_c_string_slice()
        )).bitcast[type_of(self._get_device_image_memory_requirements)]()[]
        self._get_device_image_sparse_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageSparseMemoryRequirements".as_c_string_slice()
        )).bitcast[type_of(self._get_device_image_sparse_memory_requirements)]()[]

    fn get_device_buffer_memory_requirements(
        self,
        device: Device,
        info: DeviceBufferMemoryRequirements,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceBufferMemoryRequirements.html
        """
        return self._get_device_buffer_memory_requirements(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn get_device_image_memory_requirements(
        self,
        device: Device,
        info: DeviceImageMemoryRequirements,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageMemoryRequirements.html
        """
        return self._get_device_image_memory_requirements(device, Ptr(to=info), Ptr(to=memory_requirements))

    fn get_device_image_sparse_memory_requirements[
        p_sparse_memory_requirements_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        device: Device,
        info: DeviceImageMemoryRequirements,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, p_sparse_memory_requirements_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        return self._get_device_image_sparse_memory_requirements(
            device,
            Ptr(to=info),
            Ptr(to=sparse_memory_requirement_count),
            Ptr(to=p_sparse_memory_requirements).bitcast[Ptr[SparseImageMemoryRequirements2, MutAnyOrigin]]()[],
        )

    fn get_device_image_sparse_memory_requirements[
        p_sparse_memory_requirements_origin: MutOrigin = MutAnyOrigin
    ](
        self, device: Device, info: DeviceImageMemoryRequirements
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self._get_device_image_sparse_memory_requirements(
    device, Ptr(to=info), Ptr(to=count), Ptr[SparseImageMemoryRequirements2, MutExternalOrigin]()
)
        list.reserve(Int(count))
        self._get_device_image_sparse_memory_requirements(
    device, Ptr(to=info), Ptr(to=count), list.unsafe_ptr()
)
        list._len = Int(count)
        return list^


struct Maintenance5(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_bind_index_buffer_2: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        size: DeviceSize,
        index_type: IndexType,
    )
    var _get_rendering_area_granularity: fn(
        device: Device,
        p_rendering_area_info: Ptr[RenderingAreaInfo, ImmutAnyOrigin],
        p_granularity: Ptr[Extent2D, MutAnyOrigin],
    )
    var _get_device_image_subresource_layout: fn(
        device: Device,
        p_info: Ptr[DeviceImageSubresourceInfo, ImmutAnyOrigin],
        p_layout: Ptr[SubresourceLayout2, MutAnyOrigin],
    )
    var _get_image_subresource_layout_2: fn(
        device: Device,
        image: Image,
        p_subresource: Ptr[ImageSubresource2, ImmutAnyOrigin],
        p_layout: Ptr[SubresourceLayout2, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_index_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindIndexBuffer2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_index_buffer_2)]()[]
        self._get_rendering_area_granularity = Ptr(to=get_device_proc_addr(
            device, "vkGetRenderingAreaGranularity".as_c_string_slice()
        )).bitcast[type_of(self._get_rendering_area_granularity)]()[]
        self._get_device_image_subresource_layout = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageSubresourceLayout".as_c_string_slice()
        )).bitcast[type_of(self._get_device_image_subresource_layout)]()[]
        self._get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout2".as_c_string_slice()
        )).bitcast[type_of(self._get_image_subresource_layout_2)]()[]

    fn cmd_bind_index_buffer_2(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        size: DeviceSize,
        index_type: IndexType,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindIndexBuffer2.html
        """
        return self._cmd_bind_index_buffer_2(command_buffer, buffer, offset, size, index_type)

    fn get_rendering_area_granularity(
        self, device: Device, rendering_area_info: RenderingAreaInfo, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderingAreaGranularity.html
        """
        return self._get_rendering_area_granularity(
            device, Ptr(to=rendering_area_info), Ptr(to=granularity)
        )

    fn get_device_image_subresource_layout(
        self, device: Device, info: DeviceImageSubresourceInfo, mut layout: SubresourceLayout2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSubresourceLayout.html
        """
        return self._get_device_image_subresource_layout(device, Ptr(to=info), Ptr(to=layout))

    fn get_image_subresource_layout_2(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource2,
        mut layout: SubresourceLayout2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout2.html
        """
        return self._get_image_subresource_layout_2(device, image, Ptr(to=subresource), Ptr(to=layout))


struct PresentWait2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _wait_for_present_2: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_present_wait_2_info: Ptr[PresentWait2InfoKHR, ImmutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._wait_for_present_2 = Ptr(to=get_device_proc_addr(
            device, "vkWaitForPresent2KHR".as_c_string_slice()
        )).bitcast[type_of(self._wait_for_present_2)]()[]

    fn wait_for_present_2(
        self, device: Device, swapchain: SwapchainKHR, present_wait_2_info: PresentWait2InfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForPresent2KHR.html
        """
        return self._wait_for_present_2(device, swapchain, Ptr(to=present_wait_2_info))


struct PipelineBinary(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_pipeline_binaries: fn(
        device: Device,
        p_create_info: Ptr[PipelineBinaryCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_binaries: Ptr[PipelineBinaryHandlesInfoKHR, MutAnyOrigin],
    ) -> Result
    var _destroy_pipeline_binary: fn(
        device: Device,
        pipeline_binary: PipelineBinaryKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_pipeline_key: fn(
        device: Device,
        p_pipeline_create_info: Ptr[PipelineCreateInfoKHR, ImmutAnyOrigin],
        p_pipeline_key: Ptr[PipelineBinaryKeyKHR, MutAnyOrigin],
    ) -> Result
    var _get_pipeline_binary_data: fn(
        device: Device,
        p_info: Ptr[PipelineBinaryDataInfoKHR, ImmutAnyOrigin],
        p_pipeline_binary_key: Ptr[PipelineBinaryKeyKHR, MutAnyOrigin],
        p_pipeline_binary_data_size: Ptr[UInt, MutAnyOrigin],
        p_pipeline_binary_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _release_captured_pipeline_data: fn(
        device: Device,
        p_info: Ptr[ReleaseCapturedPipelineDataInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_pipeline_binaries = Ptr(to=get_device_proc_addr(
            device, "vkCreatePipelineBinariesKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_pipeline_binaries)]()[]
        self._destroy_pipeline_binary = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPipelineBinaryKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_pipeline_binary)]()[]
        self._get_pipeline_key = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineKeyKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_key)]()[]
        self._get_pipeline_binary_data = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineBinaryDataKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_binary_data)]()[]
        self._release_captured_pipeline_data = Ptr(to=get_device_proc_addr(
            device, "vkReleaseCapturedPipelineDataKHR".as_c_string_slice()
        )).bitcast[type_of(self._release_captured_pipeline_data)]()[]

    fn create_pipeline_binaries[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: PipelineBinaryCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut binaries: PipelineBinaryHandlesInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineBinariesKHR.html
        """
        return self._create_pipeline_binaries(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=binaries),
        )

    fn destroy_pipeline_binary[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        pipeline_binary: PipelineBinaryKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineBinaryKHR.html
        """
        return self._destroy_pipeline_binary(
            device,
            pipeline_binary,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn get_pipeline_key[p_pipeline_create_info_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        p_pipeline_create_info: Ptr[PipelineCreateInfoKHR, p_pipeline_create_info_origin],
        mut pipeline_key: PipelineBinaryKeyKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineKeyKHR.html
        """
        return self._get_pipeline_key(
            device,
            Ptr(to=p_pipeline_create_info).bitcast[Ptr[PipelineCreateInfoKHR, ImmutAnyOrigin]]()[],
            Ptr(to=pipeline_key),
        )

    fn get_pipeline_binary_data[p_pipeline_binary_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: PipelineBinaryDataInfoKHR,
        mut pipeline_binary_key: PipelineBinaryKeyKHR,
        mut pipeline_binary_data_size: UInt,
        p_pipeline_binary_data: Ptr[NoneType, p_pipeline_binary_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineBinaryDataKHR.html
        """
        return self._get_pipeline_binary_data(
            device,
            Ptr(to=info),
            Ptr(to=pipeline_binary_key),
            Ptr(to=pipeline_binary_data_size),
            Ptr(to=p_pipeline_binary_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn get_pipeline_binary_data[p_pipeline_binary_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: PipelineBinaryDataInfoKHR,
        mut pipeline_binary_key: PipelineBinaryKeyKHR,
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineBinaryDataKHR.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_pipeline_binary_data(
        device,
        Ptr(to=info),
        Ptr(to=pipeline_binary_key),
        Ptr(to=count),
        Ptr[NoneType, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_pipeline_binary_data(
        device,
        Ptr(to=info),
        Ptr(to=pipeline_binary_key),
        Ptr(to=count),
        list.unsafe_ptr().bitcast[NoneType](),
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn release_captured_pipeline_data[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        info: ReleaseCapturedPipelineDataInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseCapturedPipelineDataKHR.html
        """
        return self._release_captured_pipeline_data(
            device, Ptr(to=info), Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )


struct SwapchainMaintenance1(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _release_swapchain_images: fn(
        device: Device, p_release_info: Ptr[ReleaseSwapchainImagesInfoKHR, ImmutAnyOrigin]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._release_swapchain_images = Ptr(to=get_device_proc_addr(
            device, "vkReleaseSwapchainImagesKHR".as_c_string_slice()
        )).bitcast[type_of(self._release_swapchain_images)]()[]

    fn release_swapchain_images(
        self, device: Device, release_info: ReleaseSwapchainImagesInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseSwapchainImagesKHR.html
        """
        return self._release_swapchain_images(device, Ptr(to=release_info))


struct CooperativeMatrix(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_matrix_properties: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[CooperativeMatrixPropertiesKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_matrix_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_cooperative_matrix_properties)]()[]

    fn get_physical_device_cooperative_matrix_properties[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixPropertiesKHR, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR.html
        """
        return self._get_physical_device_cooperative_matrix_properties(
            physical_device,
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[CooperativeMatrixPropertiesKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_cooperative_matrix_properties[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeMatrixPropertiesKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR.html
        """
        var list = List[CooperativeMatrixPropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_cooperative_matrix_properties(
        physical_device, Ptr(to=count), Ptr[CooperativeMatrixPropertiesKHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_cooperative_matrix_properties(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct LineRasterization(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_line_stipple: fn(
        command_buffer: CommandBuffer, line_stipple_factor: UInt32, line_stipple_pattern: UInt16
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_line_stipple = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStipple".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_line_stipple)]()[]

    fn cmd_set_line_stipple(
        self,
        command_buffer: CommandBuffer,
        line_stipple_factor: UInt32,
        line_stipple_pattern: UInt16,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStipple.html
        """
        return self._cmd_set_line_stipple(command_buffer, line_stipple_factor, line_stipple_pattern)


struct CalibratedTimestamps(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_calibrateable_time_domains: fn(
        physical_device: PhysicalDevice,
        p_time_domain_count: Ptr[UInt32, MutAnyOrigin],
        p_time_domains: Ptr[TimeDomainKHR, MutAnyOrigin],
    ) -> Result
    var _get_calibrated_timestamps: fn(
        device: Device,
        timestamp_count: UInt32,
        p_timestamp_infos: Ptr[CalibratedTimestampInfoKHR, ImmutAnyOrigin],
        p_timestamps: Ptr[UInt64, MutAnyOrigin],
        p_max_deviation: Ptr[UInt64, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_calibrateable_time_domains = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_calibrateable_time_domains)]()[]
        self._get_calibrated_timestamps = Ptr(to=get_device_proc_addr(
            device, "vkGetCalibratedTimestampsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_calibrated_timestamps)]()[]

    fn get_physical_device_calibrateable_time_domains[
        p_time_domains_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut time_domain_count: UInt32,
        p_time_domains: Ptr[TimeDomainKHR, p_time_domains_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCalibrateableTimeDomainsKHR.html
        """
        return self._get_physical_device_calibrateable_time_domains(
            physical_device,
            Ptr(to=time_domain_count),
            Ptr(to=p_time_domains).bitcast[Ptr[TimeDomainKHR, MutAnyOrigin]]()[],
        )

    fn get_physical_device_calibrateable_time_domains[
        p_time_domains_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> ListResult[TimeDomainKHR]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCalibrateableTimeDomainsKHR.html
        """
        var list = List[TimeDomainKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_calibrateable_time_domains(
        physical_device, Ptr(to=count), Ptr[TimeDomainKHR, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_calibrateable_time_domains(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_calibrated_timestamps[
        p_timestamp_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        p_timestamps_origin: MutOrigin = MutAnyOrigin,
    ](
        self,
        device: Device,
        timestamp_count: UInt32,
        p_timestamp_infos: Ptr[CalibratedTimestampInfoKHR, p_timestamp_infos_origin],
        p_timestamps: Ptr[UInt64, p_timestamps_origin],
        mut max_deviation: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetCalibratedTimestampsKHR.html
        """
        return self._get_calibrated_timestamps(
            device,
            timestamp_count,
            Ptr(to=p_timestamp_infos).bitcast[Ptr[CalibratedTimestampInfoKHR, ImmutAnyOrigin]]()[],
            Ptr(to=p_timestamps).bitcast[Ptr[UInt64, MutAnyOrigin]]()[],
            Ptr(to=max_deviation),
        )


struct Maintenance6(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_bind_descriptor_sets_2: fn(
        command_buffer: CommandBuffer,
        p_bind_descriptor_sets_info: Ptr[BindDescriptorSetsInfo, ImmutAnyOrigin],
    )
    var _cmd_push_constants_2: fn(
        command_buffer: CommandBuffer, p_push_constants_info: Ptr[PushConstantsInfo, ImmutAnyOrigin]
    )
    var _cmd_push_descriptor_set_2: fn(
        command_buffer: CommandBuffer,
        p_push_descriptor_set_info: Ptr[PushDescriptorSetInfo, ImmutAnyOrigin],
    )
    var _cmd_push_descriptor_set_with_template_2: fn(
        command_buffer: CommandBuffer,
        p_push_descriptor_set_with_template_info: Ptr[PushDescriptorSetWithTemplateInfo, ImmutAnyOrigin],
    )
    var _cmd_set_descriptor_buffer_offsets_2: fn(
        command_buffer: CommandBuffer,
        p_set_descriptor_buffer_offsets_info: Ptr[SetDescriptorBufferOffsetsInfoEXT, ImmutAnyOrigin],
    )
    var _cmd_bind_descriptor_buffer_embedded_samplers_2: fn(
        command_buffer: CommandBuffer,
        p_bind_descriptor_buffer_embedded_samplers_info: Ptr[BindDescriptorBufferEmbeddedSamplersInfoEXT, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_descriptor_sets_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorSets2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_descriptor_sets_2)]()[]
        self._cmd_push_constants_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushConstants2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_push_constants_2)]()[]
        self._cmd_push_descriptor_set_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSet2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_push_descriptor_set_2)]()[]
        self._cmd_push_descriptor_set_with_template_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSetWithTemplate2".as_c_string_slice()
        )).bitcast[type_of(self._cmd_push_descriptor_set_with_template_2)]()[]
        self._cmd_set_descriptor_buffer_offsets_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDescriptorBufferOffsets2EXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_descriptor_buffer_offsets_2)]()[]
        self._cmd_bind_descriptor_buffer_embedded_samplers_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorBufferEmbeddedSamplers2EXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_descriptor_buffer_embedded_samplers_2)]()[]

    fn cmd_bind_descriptor_sets_2(
        self, command_buffer: CommandBuffer, bind_descriptor_sets_info: BindDescriptorSetsInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorSets2.html
        """
        return self._cmd_bind_descriptor_sets_2(command_buffer, Ptr(to=bind_descriptor_sets_info))

    fn cmd_push_constants_2(
        self, command_buffer: CommandBuffer, push_constants_info: PushConstantsInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants2.html
        """
        return self._cmd_push_constants_2(command_buffer, Ptr(to=push_constants_info))

    fn cmd_push_descriptor_set_2(
        self, command_buffer: CommandBuffer, push_descriptor_set_info: PushDescriptorSetInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSet2.html
        """
        return self._cmd_push_descriptor_set_2(command_buffer, Ptr(to=push_descriptor_set_info))

    fn cmd_push_descriptor_set_with_template_2(
        self,
        command_buffer: CommandBuffer,
        push_descriptor_set_with_template_info: PushDescriptorSetWithTemplateInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate2.html
        """
        return self._cmd_push_descriptor_set_with_template_2(
            command_buffer, Ptr(to=push_descriptor_set_with_template_info)
        )

    fn cmd_set_descriptor_buffer_offsets_2(
        self,
        command_buffer: CommandBuffer,
        set_descriptor_buffer_offsets_info: SetDescriptorBufferOffsetsInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDescriptorBufferOffsets2EXT.html
        """
        return self._cmd_set_descriptor_buffer_offsets_2(
            command_buffer, Ptr(to=set_descriptor_buffer_offsets_info)
        )

    fn cmd_bind_descriptor_buffer_embedded_samplers_2(
        self,
        command_buffer: CommandBuffer,
        bind_descriptor_buffer_embedded_samplers_info: BindDescriptorBufferEmbeddedSamplersInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorBufferEmbeddedSamplers2EXT.html
        """
        return self._cmd_bind_descriptor_buffer_embedded_samplers_2(
            command_buffer, Ptr(to=bind_descriptor_buffer_embedded_samplers_info)
        )


struct CopyMemoryIndirect(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_copy_memory_indirect: fn(
        command_buffer: CommandBuffer,
        p_copy_memory_indirect_info: Ptr[CopyMemoryIndirectInfoKHR, ImmutAnyOrigin],
    )
    var _cmd_copy_memory_to_image_indirect: fn(
        command_buffer: CommandBuffer,
        p_copy_memory_to_image_indirect_info: Ptr[CopyMemoryToImageIndirectInfoKHR, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_copy_memory_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryIndirectKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_memory_indirect)]()[]
        self._cmd_copy_memory_to_image_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToImageIndirectKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_memory_to_image_indirect)]()[]

    fn cmd_copy_memory_indirect(
        self, command_buffer: CommandBuffer, copy_memory_indirect_info: CopyMemoryIndirectInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryIndirectKHR.html
        """
        return self._cmd_copy_memory_indirect(command_buffer, Ptr(to=copy_memory_indirect_info))

    fn cmd_copy_memory_to_image_indirect(
        self,
        command_buffer: CommandBuffer,
        copy_memory_to_image_indirect_info: CopyMemoryToImageIndirectInfoKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryToImageIndirectKHR.html
        """
        return self._cmd_copy_memory_to_image_indirect(
            command_buffer, Ptr(to=copy_memory_to_image_indirect_info)
        )


struct Maintenance10(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_end_rendering_2: fn(
        command_buffer: CommandBuffer, p_rendering_end_info: Ptr[RenderingEndInfoKHR, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_end_rendering_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRendering2KHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_rendering_2)]()[]

    fn cmd_end_rendering_2[p_rendering_end_info_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        p_rendering_end_info: Ptr[RenderingEndInfoKHR, p_rendering_end_info_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering2KHR.html
        """
        return self._cmd_end_rendering_2(
            command_buffer,
            Ptr(to=p_rendering_end_info).bitcast[Ptr[RenderingEndInfoKHR, ImmutAnyOrigin]]()[],
        )
