from vk.core_functions import GlobalFunctions


struct Surface(Copyable, Movable):
    var _destroy_surface_khr: fn(
        instance: Instance, surface: SurfaceKHR, pAllocator: Ptr[AllocationCallbacks]
    )
    var _get_physical_device_surface_support_khr: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32, surface: SurfaceKHR, pSupported: Ptr[Bool32]
    ) -> Result
    var _get_physical_device_surface_capabilities_khr: fn(
        physicalDevice: PhysicalDevice, surface: SurfaceKHR, pSurfaceCapabilities: Ptr[SurfaceCapabilitiesKHR]
    ) -> Result
    var _get_physical_device_surface_formats_khr: fn(
        physicalDevice: PhysicalDevice, surface: SurfaceKHR, pSurfaceFormatCount: Ptr[UInt32], pSurfaceFormats: Ptr[SurfaceFormatKHR]
    ) -> Result
    var _get_physical_device_surface_present_modes_khr: fn(
        physicalDevice: PhysicalDevice, surface: SurfaceKHR, pPresentModeCount: Ptr[UInt32], pPresentModes: Ptr[PresentModeKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._destroy_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroySurfaceKHR".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_surface_khr)]()[]
        self._get_physical_device_surface_support_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceSupportKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_surface_support_khr)]()[]
        self._get_physical_device_surface_capabilities_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_surface_capabilities_khr)]()[]
        self._get_physical_device_surface_formats_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceFormatsKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_surface_formats_khr)]()[]
        self._get_physical_device_surface_present_modes_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfacePresentModesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_surface_present_modes_khr)]()[]

    fn destroy_surface_khr(
        self, instance: Instance, surface: SurfaceKHR, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_surface_khr(instance, surface, p_allocator)

    fn get_physical_device_surface_support_khr(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        surface: SurfaceKHR,
        mut supported: Bool32,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_surface_support_khr(
            physical_device, queue_family_index, surface, Ptr(to=supported)
        )

    fn get_physical_device_surface_capabilities_khr(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_capabilities: SurfaceCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_surface_capabilities_khr(
            physical_device, surface, Ptr(to=surface_capabilities)
        )

    fn get_physical_device_surface_formats_khr(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_format_count: UInt32,
        p_surface_formats: Ptr[SurfaceFormatKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_surface_formats_khr(
            physical_device, surface, Ptr(to=surface_format_count), p_surface_formats
        )

    fn get_physical_device_surface_formats_khr(
        self, physical_device: PhysicalDevice, surface: SurfaceKHR
    ) -> ListResult[SurfaceFormatKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[SurfaceFormatKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_surface_formats_khr(
                physical_device, surface, count, Ptr[SurfaceFormatKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_surface_formats_khr(
                    physical_device, surface, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_surface_present_modes_khr(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut present_mode_count: UInt32,
        p_present_modes: Ptr[PresentModeKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_surface_present_modes_khr(
            physical_device, surface, Ptr(to=present_mode_count), p_present_modes
        )

    fn get_physical_device_surface_present_modes_khr(
        self, physical_device: PhysicalDevice, surface: SurfaceKHR
    ) -> ListResult[PresentModeKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[PresentModeKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_surface_present_modes_khr(
                physical_device, surface, count, Ptr[PresentModeKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_surface_present_modes_khr(
                    physical_device, surface, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)


struct Swapchain(Copyable, Movable):
    var _create_swapchain_khr: fn(
        device: Device, pCreateInfo: Ptr[SwapchainCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pSwapchain: Ptr[SwapchainKHR]
    ) -> Result
    var _destroy_swapchain_khr: fn(
        device: Device, swapchain: SwapchainKHR, pAllocator: Ptr[AllocationCallbacks]
    )
    var _get_swapchain_images_khr: fn(
        device: Device, swapchain: SwapchainKHR, pSwapchainImageCount: Ptr[UInt32], pSwapchainImages: Ptr[Image]
    ) -> Result
    var _acquire_next_image_khr: fn(
        device: Device, swapchain: SwapchainKHR, timeout: UInt64, semaphore: Semaphore, fence: Fence, pImageIndex: Ptr[UInt32]
    ) -> Result
    var _queue_present_khr: fn(
        queue: Queue, pPresentInfo: Ptr[PresentInfoKHR]
    ) -> Result
    var _get_device_group_present_capabilities_khr: fn(
        device: Device, pDeviceGroupPresentCapabilities: Ptr[DeviceGroupPresentCapabilitiesKHR]
    ) -> Result
    var _get_device_group_surface_present_modes_khr: fn(
        device: Device, surface: SurfaceKHR, pModes: Ptr[DeviceGroupPresentModeFlagsKHR]
    ) -> Result
    var _get_physical_device_present_rectangles_khr: fn(
        physicalDevice: PhysicalDevice, surface: SurfaceKHR, pRectCount: Ptr[UInt32], pRects: Ptr[Rect2D]
    ) -> Result
    var _acquire_next_image_2_khr: fn(
        device: Device, pAcquireInfo: Ptr[AcquireNextImageInfoKHR], pImageIndex: Ptr[UInt32]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_swapchain_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateSwapchainKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_swapchain_khr)]()[]
        self._destroy_swapchain_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroySwapchainKHR".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_swapchain_khr)]()[]
        self._get_swapchain_images_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainImagesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_swapchain_images_khr)]()[]
        self._acquire_next_image_khr = Ptr(to=get_device_proc_addr(
            device, "vkAcquireNextImageKHR".unsafe_ptr()
        )).bitcast[__type_of(self._acquire_next_image_khr)]()[]
        self._queue_present_khr = Ptr(to=get_device_proc_addr(
            device, "vkQueuePresentKHR".unsafe_ptr()
        )).bitcast[__type_of(self._queue_present_khr)]()[]
        self._get_device_group_present_capabilities_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupPresentCapabilitiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_group_present_capabilities_khr)]()[]
        self._get_device_group_surface_present_modes_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupSurfacePresentModesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_group_surface_present_modes_khr)]()[]
        self._get_physical_device_present_rectangles_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDevicePresentRectanglesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_present_rectangles_khr)]()[]
        self._acquire_next_image_2_khr = Ptr(to=get_device_proc_addr(
            device, "vkAcquireNextImage2KHR".unsafe_ptr()
        )).bitcast[__type_of(self._acquire_next_image_2_khr)]()[]

    fn create_swapchain_khr(
        self,
        device: Device,
        create_info: SwapchainCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut swapchain: SwapchainKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_swapchain_khr(
            device, Ptr(to=create_info), p_allocator, Ptr(to=swapchain)
        )

    fn destroy_swapchain_khr(
        self, device: Device, swapchain: SwapchainKHR, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_swapchain_khr(device, swapchain, p_allocator)

    fn get_swapchain_images_khr(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut swapchain_image_count: UInt32,
        p_swapchain_images: Ptr[Image],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_swapchain_images_khr(
            device, swapchain, Ptr(to=swapchain_image_count), p_swapchain_images
        )

    fn get_swapchain_images_khr(self, device: Device, swapchain: SwapchainKHR) -> ListResult[Image]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[Image]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_swapchain_images_khr(device, swapchain, count, Ptr[Image]())
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_swapchain_images_khr(device, swapchain, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn acquire_next_image_khr(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        timeout: UInt64,
        semaphore: Semaphore,
        fence: Fence,
        mut image_index: UInt32,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._acquire_next_image_khr(
            device, swapchain, timeout, semaphore, fence, Ptr(to=image_index)
        )

    fn queue_present_khr(self, queue: Queue, present_info: PresentInfoKHR) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._queue_present_khr(queue, Ptr(to=present_info))

    fn get_device_group_present_capabilities_khr(
        self,
        device: Device,
        mut device_group_present_capabilities: DeviceGroupPresentCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_group_present_capabilities_khr(
            device, Ptr(to=device_group_present_capabilities)
        )

    fn get_device_group_surface_present_modes_khr(
        self, device: Device, surface: SurfaceKHR, mut modes: DeviceGroupPresentModeFlagsKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_group_surface_present_modes_khr(device, surface, Ptr(to=modes))

    fn get_physical_device_present_rectangles_khr(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut rect_count: UInt32,
        p_rects: Ptr[Rect2D],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_present_rectangles_khr(
            physical_device, surface, Ptr(to=rect_count), p_rects
        )

    fn get_physical_device_present_rectangles_khr(
        self, physical_device: PhysicalDevice, surface: SurfaceKHR
    ) -> ListResult[Rect2D]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[Rect2D]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_present_rectangles_khr(
                physical_device, surface, count, Ptr[Rect2D]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_present_rectangles_khr(
                    physical_device, surface, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn acquire_next_image_2_khr(
        self, device: Device, acquire_info: AcquireNextImageInfoKHR, mut image_index: UInt32
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._acquire_next_image_2_khr(device, Ptr(to=acquire_info), Ptr(to=image_index))


struct Display(Copyable, Movable):
    var _get_physical_device_display_properties_khr: fn(
        physicalDevice: PhysicalDevice, pPropertyCount: Ptr[UInt32], pProperties: Ptr[DisplayPropertiesKHR]
    ) -> Result
    var _get_physical_device_display_plane_properties_khr: fn(
        physicalDevice: PhysicalDevice, pPropertyCount: Ptr[UInt32], pProperties: Ptr[DisplayPlanePropertiesKHR]
    ) -> Result
    var _get_display_plane_supported_displays_khr: fn(
        physicalDevice: PhysicalDevice, planeIndex: UInt32, pDisplayCount: Ptr[UInt32], pDisplays: Ptr[DisplayKHR]
    ) -> Result
    var _get_display_mode_properties_khr: fn(
        physicalDevice: PhysicalDevice, display: DisplayKHR, pPropertyCount: Ptr[UInt32], pProperties: Ptr[DisplayModePropertiesKHR]
    ) -> Result
    var _create_display_mode_khr: fn(
        physicalDevice: PhysicalDevice, display: DisplayKHR, pCreateInfo: Ptr[DisplayModeCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pMode: Ptr[DisplayModeKHR]
    ) -> Result
    var _get_display_plane_capabilities_khr: fn(
        physicalDevice: PhysicalDevice, mode: DisplayModeKHR, planeIndex: UInt32, pCapabilities: Ptr[DisplayPlaneCapabilitiesKHR]
    ) -> Result
    var _create_display_plane_surface_khr: fn(
        instance: Instance, pCreateInfo: Ptr[DisplaySurfaceCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_display_properties_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayPropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_display_properties_khr)]()[]
        self._get_physical_device_display_plane_properties_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayPlanePropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_display_plane_properties_khr)]()[]
        self._get_display_plane_supported_displays_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayPlaneSupportedDisplaysKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_display_plane_supported_displays_khr)]()[]
        self._get_display_mode_properties_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayModePropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_display_mode_properties_khr)]()[]
        self._create_display_mode_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDisplayModeKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_display_mode_khr)]()[]
        self._get_display_plane_capabilities_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayPlaneCapabilitiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_display_plane_capabilities_khr)]()[]
        self._create_display_plane_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDisplayPlaneSurfaceKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_display_plane_surface_khr)]()[]

    fn get_physical_device_display_properties_khr(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayPropertiesKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_display_properties_khr(
            physical_device, Ptr(to=property_count), p_properties
        )

    fn get_physical_device_display_properties_khr(
        self, physical_device: PhysicalDevice
    ) -> ListResult[DisplayPropertiesKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[DisplayPropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_display_properties_khr(
                physical_device, count, Ptr[DisplayPropertiesKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_display_properties_khr(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_display_plane_properties_khr(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayPlanePropertiesKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_display_plane_properties_khr(
            physical_device, Ptr(to=property_count), p_properties
        )

    fn get_physical_device_display_plane_properties_khr(
        self, physical_device: PhysicalDevice
    ) -> ListResult[DisplayPlanePropertiesKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[DisplayPlanePropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_display_plane_properties_khr(
                physical_device, count, Ptr[DisplayPlanePropertiesKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_display_plane_properties_khr(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_display_plane_supported_displays_khr(
        self,
        physical_device: PhysicalDevice,
        plane_index: UInt32,
        mut display_count: UInt32,
        p_displays: Ptr[DisplayKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_display_plane_supported_displays_khr(
            physical_device, plane_index, Ptr(to=display_count), p_displays
        )

    fn get_display_plane_supported_displays_khr(
        self, physical_device: PhysicalDevice, plane_index: UInt32
    ) -> ListResult[DisplayKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[DisplayKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_display_plane_supported_displays_khr(
                physical_device, plane_index, count, Ptr[DisplayKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_display_plane_supported_displays_khr(
                    physical_device, plane_index, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_display_mode_properties_khr(
        self,
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayModePropertiesKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_display_mode_properties_khr(
            physical_device, display, Ptr(to=property_count), p_properties
        )

    fn get_display_mode_properties_khr(
        self, physical_device: PhysicalDevice, display: DisplayKHR
    ) -> ListResult[DisplayModePropertiesKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[DisplayModePropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_display_mode_properties_khr(
                physical_device, display, count, Ptr[DisplayModePropertiesKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_display_mode_properties_khr(
                    physical_device, display, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn create_display_mode_khr(
        self,
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        create_info: DisplayModeCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut mode: DisplayModeKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_display_mode_khr(
            physical_device, display, Ptr(to=create_info), p_allocator, Ptr(to=mode)
        )

    fn get_display_plane_capabilities_khr(
        self,
        physical_device: PhysicalDevice,
        mode: DisplayModeKHR,
        plane_index: UInt32,
        mut capabilities: DisplayPlaneCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_display_plane_capabilities_khr(
            physical_device, mode, plane_index, Ptr(to=capabilities)
        )

    fn create_display_plane_surface_khr(
        self,
        instance: Instance,
        create_info: DisplaySurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_display_plane_surface_khr(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )


struct DisplaySwapchain(Copyable, Movable):
    var _create_shared_swapchains_khr: fn(
        device: Device, swapchainCount: UInt32, pCreateInfos: Ptr[SwapchainCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pSwapchains: Ptr[SwapchainKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_shared_swapchains_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateSharedSwapchainsKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_shared_swapchains_khr)]()[]

    fn create_shared_swapchains_khr(
        self,
        device: Device,
        swapchain_count: UInt32,
        p_create_infos: Ptr[SwapchainCreateInfoKHR],
        p_allocator: Ptr[AllocationCallbacks],
        p_swapchains: Ptr[SwapchainKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_shared_swapchains_khr(
            device, swapchain_count, p_create_infos, p_allocator, p_swapchains
        )


struct XlibSurface(Copyable, Movable):
    var _create_xlib_surface_khr: fn(
        instance: Instance, pCreateInfo: Ptr[XlibSurfaceCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result
    var _get_physical_device_xlib_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32, dpy: Ptr[Display], visualID: VisualID
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_xlib_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateXlibSurfaceKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_xlib_surface_khr)]()[]
        self._get_physical_device_xlib_presentation_support_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceXlibPresentationSupportKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_xlib_presentation_support_khr)]()[]

    fn create_xlib_surface_khr(
        self,
        instance: Instance,
        create_info: XlibSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_xlib_surface_khr(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )

    fn get_physical_device_xlib_presentation_support_khr(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut dpy: Display,
        visual_id: VisualID,
    ) -> Bool32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_xlib_presentation_support_khr(
            physical_device, queue_family_index, Ptr(to=dpy), visual_id
        )


struct XcbSurface(Copyable, Movable):
    var _create_xcb_surface_khr: fn(
        instance: Instance, pCreateInfo: Ptr[XcbSurfaceCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result
    var _get_physical_device_xcb_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32, connection: Ptr[xcb_connection_t], visual_id: xcb_visualid_t
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_xcb_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateXcbSurfaceKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_xcb_surface_khr)]()[]
        self._get_physical_device_xcb_presentation_support_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceXcbPresentationSupportKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_xcb_presentation_support_khr)]()[]

    fn create_xcb_surface_khr(
        self,
        instance: Instance,
        create_info: XcbSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_xcb_surface_khr(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )

    fn get_physical_device_xcb_presentation_support_khr(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut connection: xcb_connection_t,
        visual_id: xcb_visualid_t,
    ) -> Bool32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_xcb_presentation_support_khr(
            physical_device, queue_family_index, Ptr(to=connection), visual_id
        )


struct WaylandSurface(Copyable, Movable):
    var _create_wayland_surface_khr: fn(
        instance: Instance, pCreateInfo: Ptr[WaylandSurfaceCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result
    var _get_physical_device_wayland_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32, display: Ptr[wl_display]
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_wayland_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateWaylandSurfaceKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_wayland_surface_khr)]()[]
        self._get_physical_device_wayland_presentation_support_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceWaylandPresentationSupportKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_wayland_presentation_support_khr)]()[]

    fn create_wayland_surface_khr(
        self,
        instance: Instance,
        create_info: WaylandSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_wayland_surface_khr(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )

    fn get_physical_device_wayland_presentation_support_khr(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32, mut display: wl_display
    ) -> Bool32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_wayland_presentation_support_khr(
            physical_device, queue_family_index, Ptr(to=display)
        )


struct AndroidSurface(Copyable, Movable):
    var _create_android_surface_khr: fn(
        instance: Instance, pCreateInfo: Ptr[AndroidSurfaceCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_android_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateAndroidSurfaceKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_android_surface_khr)]()[]

    fn create_android_surface_khr(
        self,
        instance: Instance,
        create_info: AndroidSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_android_surface_khr(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )


struct Win32Surface(Copyable, Movable):
    var _create_win_32_surface_khr: fn(
        instance: Instance, pCreateInfo: Ptr[Win32SurfaceCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result
    var _get_physical_device_win_32_presentation_support_khr: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_win_32_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateWin32SurfaceKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_win_32_surface_khr)]()[]
        self._get_physical_device_win_32_presentation_support_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceWin32PresentationSupportKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_win_32_presentation_support_khr)]()[]

    fn create_win_32_surface_khr(
        self,
        instance: Instance,
        create_info: Win32SurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_win_32_surface_khr(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )

    fn get_physical_device_win_32_presentation_support_khr(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32
    ) -> Bool32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_win_32_presentation_support_khr(
            physical_device, queue_family_index
        )


struct VideoQueue(Copyable, Movable):
    var _get_physical_device_video_capabilities_khr: fn(
        physicalDevice: PhysicalDevice, pVideoProfile: Ptr[VideoProfileInfoKHR], pCapabilities: Ptr[VideoCapabilitiesKHR]
    ) -> Result
    var _get_physical_device_video_format_properties_khr: fn(
        physicalDevice: PhysicalDevice, pVideoFormatInfo: Ptr[PhysicalDeviceVideoFormatInfoKHR], pVideoFormatPropertyCount: Ptr[UInt32], pVideoFormatProperties: Ptr[VideoFormatPropertiesKHR]
    ) -> Result
    var _create_video_session_khr: fn(
        device: Device, pCreateInfo: Ptr[VideoSessionCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pVideoSession: Ptr[VideoSessionKHR]
    ) -> Result
    var _destroy_video_session_khr: fn(
        device: Device, videoSession: VideoSessionKHR, pAllocator: Ptr[AllocationCallbacks]
    )
    var _get_video_session_memory_requirements_khr: fn(
        device: Device, videoSession: VideoSessionKHR, pMemoryRequirementsCount: Ptr[UInt32], pMemoryRequirements: Ptr[VideoSessionMemoryRequirementsKHR]
    ) -> Result
    var _bind_video_session_memory_khr: fn(
        device: Device, videoSession: VideoSessionKHR, bindSessionMemoryInfoCount: UInt32, pBindSessionMemoryInfos: Ptr[BindVideoSessionMemoryInfoKHR]
    ) -> Result
    var _create_video_session_parameters_khr: fn(
        device: Device, pCreateInfo: Ptr[VideoSessionParametersCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pVideoSessionParameters: Ptr[VideoSessionParametersKHR]
    ) -> Result
    var _update_video_session_parameters_khr: fn(
        device: Device, videoSessionParameters: VideoSessionParametersKHR, pUpdateInfo: Ptr[VideoSessionParametersUpdateInfoKHR]
    ) -> Result
    var _destroy_video_session_parameters_khr: fn(
        device: Device, videoSessionParameters: VideoSessionParametersKHR, pAllocator: Ptr[AllocationCallbacks]
    )
    var _cmd_begin_video_coding_khr: fn(
        commandBuffer: CommandBuffer, pBeginInfo: Ptr[VideoBeginCodingInfoKHR]
    )
    var _cmd_end_video_coding_khr: fn(
        commandBuffer: CommandBuffer, pEndCodingInfo: Ptr[VideoEndCodingInfoKHR]
    )
    var _cmd_control_video_coding_khr: fn(
        commandBuffer: CommandBuffer, pCodingControlInfo: Ptr[VideoCodingControlInfoKHR]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_video_capabilities_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceVideoCapabilitiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_video_capabilities_khr)]()[]
        self._get_physical_device_video_format_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceVideoFormatPropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_video_format_properties_khr)]()[]
        self._create_video_session_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateVideoSessionKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_video_session_khr)]()[]
        self._destroy_video_session_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroyVideoSessionKHR".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_video_session_khr)]()[]
        self._get_video_session_memory_requirements_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetVideoSessionMemoryRequirementsKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_video_session_memory_requirements_khr)]()[]
        self._bind_video_session_memory_khr = Ptr(to=get_device_proc_addr(
            device, "vkBindVideoSessionMemoryKHR".unsafe_ptr()
        )).bitcast[__type_of(self._bind_video_session_memory_khr)]()[]
        self._create_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateVideoSessionParametersKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_video_session_parameters_khr)]()[]
        self._update_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
            device, "vkUpdateVideoSessionParametersKHR".unsafe_ptr()
        )).bitcast[__type_of(self._update_video_session_parameters_khr)]()[]
        self._destroy_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroyVideoSessionParametersKHR".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_video_session_parameters_khr)]()[]
        self._cmd_begin_video_coding_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginVideoCodingKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_begin_video_coding_khr)]()[]
        self._cmd_end_video_coding_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndVideoCodingKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_end_video_coding_khr)]()[]
        self._cmd_control_video_coding_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdControlVideoCodingKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_control_video_coding_khr)]()[]

    fn get_physical_device_video_capabilities_khr(
        self,
        physical_device: PhysicalDevice,
        video_profile: VideoProfileInfoKHR,
        mut capabilities: VideoCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_video_capabilities_khr(
            physical_device, Ptr(to=video_profile), Ptr(to=capabilities)
        )

    fn get_physical_device_video_format_properties_khr(
        self,
        physical_device: PhysicalDevice,
        video_format_info: PhysicalDeviceVideoFormatInfoKHR,
        mut video_format_property_count: UInt32,
        p_video_format_properties: Ptr[VideoFormatPropertiesKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_video_format_properties_khr(
            physical_device,
            Ptr(to=video_format_info),
            Ptr(to=video_format_property_count),
            p_video_format_properties,
        )

    fn get_physical_device_video_format_properties_khr(
        self, physical_device: PhysicalDevice, video_format_info: PhysicalDeviceVideoFormatInfoKHR
    ) -> ListResult[VideoFormatPropertiesKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[VideoFormatPropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_video_format_properties_khr(
                physical_device, video_format_info, count, Ptr[VideoFormatPropertiesKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_video_format_properties_khr(
                    physical_device, video_format_info, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn create_video_session_khr(
        self,
        device: Device,
        create_info: VideoSessionCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut video_session: VideoSessionKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_video_session_khr(
            device, Ptr(to=create_info), p_allocator, Ptr(to=video_session)
        )

    fn destroy_video_session_khr(
        self, device: Device, video_session: VideoSessionKHR, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_video_session_khr(device, video_session, p_allocator)

    fn get_video_session_memory_requirements_khr(
        self,
        device: Device,
        video_session: VideoSessionKHR,
        mut memory_requirements_count: UInt32,
        p_memory_requirements: Ptr[VideoSessionMemoryRequirementsKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_video_session_memory_requirements_khr(
            device, video_session, Ptr(to=memory_requirements_count), p_memory_requirements
        )

    fn get_video_session_memory_requirements_khr(
        self, device: Device, video_session: VideoSessionKHR
    ) -> ListResult[VideoSessionMemoryRequirementsKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[VideoSessionMemoryRequirementsKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_video_session_memory_requirements_khr(
                device, video_session, count, Ptr[VideoSessionMemoryRequirementsKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_video_session_memory_requirements_khr(
                    device, video_session, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn bind_video_session_memory_khr(
        self,
        device: Device,
        video_session: VideoSessionKHR,
        bind_session_memory_info_count: UInt32,
        p_bind_session_memory_infos: Ptr[BindVideoSessionMemoryInfoKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._bind_video_session_memory_khr(
            device, video_session, bind_session_memory_info_count, p_bind_session_memory_infos
        )

    fn create_video_session_parameters_khr(
        self,
        device: Device,
        create_info: VideoSessionParametersCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut video_session_parameters: VideoSessionParametersKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_video_session_parameters_khr(
            device, Ptr(to=create_info), p_allocator, Ptr(to=video_session_parameters)
        )

    fn update_video_session_parameters_khr(
        self,
        device: Device,
        video_session_parameters: VideoSessionParametersKHR,
        update_info: VideoSessionParametersUpdateInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._update_video_session_parameters_khr(
            device, video_session_parameters, Ptr(to=update_info)
        )

    fn destroy_video_session_parameters_khr(
        self,
        device: Device,
        video_session_parameters: VideoSessionParametersKHR,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_video_session_parameters_khr(
            device, video_session_parameters, p_allocator
        )

    fn cmd_begin_video_coding_khr(
        self, command_buffer: CommandBuffer, begin_info: VideoBeginCodingInfoKHR
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_begin_video_coding_khr(command_buffer, Ptr(to=begin_info))

    fn cmd_end_video_coding_khr(
        self, command_buffer: CommandBuffer, end_coding_info: VideoEndCodingInfoKHR
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_end_video_coding_khr(command_buffer, Ptr(to=end_coding_info))

    fn cmd_control_video_coding_khr(
        self, command_buffer: CommandBuffer, coding_control_info: VideoCodingControlInfoKHR
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_control_video_coding_khr(command_buffer, Ptr(to=coding_control_info))


struct VideoDecodeQueue(Copyable, Movable):
    var _cmd_decode_video_khr: fn(
        commandBuffer: CommandBuffer, pDecodeInfo: Ptr[VideoDecodeInfoKHR]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_decode_video_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecodeVideoKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_decode_video_khr)]()[]

    fn cmd_decode_video_khr(self, command_buffer: CommandBuffer, decode_info: VideoDecodeInfoKHR):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_decode_video_khr(command_buffer, Ptr(to=decode_info))


struct DynamicRendering(Copyable, Movable):
    var _cmd_begin_rendering: fn(
        commandBuffer: CommandBuffer, pRenderingInfo: Ptr[RenderingInfo]
    )
    var _cmd_end_rendering: fn(
        commandBuffer: CommandBuffer
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_begin_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginRendering".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_begin_rendering)]()[]
        self._cmd_end_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRendering".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_end_rendering)]()[]

    fn cmd_begin_rendering(self, command_buffer: CommandBuffer, rendering_info: RenderingInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_begin_rendering(command_buffer, Ptr(to=rendering_info))

    fn cmd_end_rendering(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_end_rendering(command_buffer)


struct GetPhysicalDeviceProperties2(Copyable, Movable):
    var _get_physical_device_features_2: fn(
        physicalDevice: PhysicalDevice, pFeatures: Ptr[PhysicalDeviceFeatures2]
    )
    var _get_physical_device_properties_2: fn(
        physicalDevice: PhysicalDevice, pProperties: Ptr[PhysicalDeviceProperties2]
    )
    var _get_physical_device_format_properties_2: fn(
        physicalDevice: PhysicalDevice, format: Format, pFormatProperties: Ptr[FormatProperties2]
    )
    var _get_physical_device_image_format_properties_2: fn(
        physicalDevice: PhysicalDevice, pImageFormatInfo: Ptr[PhysicalDeviceImageFormatInfo2], pImageFormatProperties: Ptr[ImageFormatProperties2]
    ) -> Result
    var _get_physical_device_queue_family_properties_2: fn(
        physicalDevice: PhysicalDevice, pQueueFamilyPropertyCount: Ptr[UInt32], pQueueFamilyProperties: Ptr[QueueFamilyProperties2]
    )
    var _get_physical_device_memory_properties_2: fn(
        physicalDevice: PhysicalDevice, pMemoryProperties: Ptr[PhysicalDeviceMemoryProperties2]
    )
    var _get_physical_device_sparse_image_format_properties_2: fn(
        physicalDevice: PhysicalDevice, pFormatInfo: Ptr[PhysicalDeviceSparseImageFormatInfo2], pPropertyCount: Ptr[UInt32], pProperties: Ptr[SparseImageFormatProperties2]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_features_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFeatures2".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_features_2)]()[]
        self._get_physical_device_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceProperties2".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_properties_2)]()[]
        self._get_physical_device_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFormatProperties2".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_format_properties_2)]()[]
        self._get_physical_device_image_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceImageFormatProperties2".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_image_format_properties_2)]()[]
        self._get_physical_device_queue_family_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceQueueFamilyProperties2".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_queue_family_properties_2)]()[]
        self._get_physical_device_memory_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceMemoryProperties2".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_memory_properties_2)]()[]
        self._get_physical_device_sparse_image_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSparseImageFormatProperties2".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_sparse_image_format_properties_2)]()[]

    fn get_physical_device_features_2(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_features_2(physical_device, Ptr(to=features))

    fn get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_properties_2(physical_device, Ptr(to=properties))

    fn get_physical_device_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_image_format_properties_2(
            physical_device, Ptr(to=image_format_info), Ptr(to=image_format_properties)
        )

    fn get_physical_device_queue_family_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties2],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_queue_family_properties_2(
            physical_device, Ptr(to=queue_family_property_count), p_queue_family_properties
        )

    fn get_physical_device_queue_family_properties_2(
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[QueueFamilyProperties2]()
        var count: UInt32 = 0
        self.get_physical_device_queue_family_properties_2(
            physical_device, count, Ptr[QueueFamilyProperties2]()
        )
        if count > 0:
            list.reserve(Int(count))
            self.get_physical_device_queue_family_properties_2(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_memory_properties_2(
            physical_device, Ptr(to=memory_properties)
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties2],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_sparse_image_format_properties_2(
            physical_device, Ptr(to=format_info), Ptr(to=property_count), p_properties
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self, physical_device: PhysicalDevice, format_info: PhysicalDeviceSparseImageFormatInfo2
    ) -> List[SparseImageFormatProperties2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[SparseImageFormatProperties2]()
        var count: UInt32 = 0
        self.get_physical_device_sparse_image_format_properties_2(
            physical_device, format_info, count, Ptr[SparseImageFormatProperties2]()
        )
        if count > 0:
            list.reserve(Int(count))
            self.get_physical_device_sparse_image_format_properties_2(
                physical_device, format_info, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return list^


struct DeviceGroup(Copyable, Movable):
    var _get_device_group_peer_memory_features: fn(
        device: Device, heapIndex: UInt32, localDeviceIndex: UInt32, remoteDeviceIndex: UInt32, pPeerMemoryFeatures: Ptr[PeerMemoryFeatureFlags]
    )
    var _cmd_set_device_mask: fn(
        commandBuffer: CommandBuffer, deviceMask: UInt32
    )
    var _cmd_dispatch_base: fn(
        commandBuffer: CommandBuffer, baseGroupX: UInt32, baseGroupY: UInt32, baseGroupZ: UInt32, groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32
    )
    var _get_device_group_present_capabilities_khr: fn(
        device: Device, pDeviceGroupPresentCapabilities: Ptr[DeviceGroupPresentCapabilitiesKHR]
    ) -> Result
    var _get_device_group_surface_present_modes_khr: fn(
        device: Device, surface: SurfaceKHR, pModes: Ptr[DeviceGroupPresentModeFlagsKHR]
    ) -> Result
    var _get_physical_device_present_rectangles_khr: fn(
        physicalDevice: PhysicalDevice, surface: SurfaceKHR, pRectCount: Ptr[UInt32], pRects: Ptr[Rect2D]
    ) -> Result
    var _acquire_next_image_2_khr: fn(
        device: Device, pAcquireInfo: Ptr[AcquireNextImageInfoKHR], pImageIndex: Ptr[UInt32]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_device_group_peer_memory_features = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupPeerMemoryFeatures".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_group_peer_memory_features)]()[]
        self._cmd_set_device_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDeviceMask".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_device_mask)]()[]
        self._cmd_dispatch_base = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchBase".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_dispatch_base)]()[]
        self._get_device_group_present_capabilities_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupPresentCapabilitiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_group_present_capabilities_khr)]()[]
        self._get_device_group_surface_present_modes_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupSurfacePresentModesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_group_surface_present_modes_khr)]()[]
        self._get_physical_device_present_rectangles_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDevicePresentRectanglesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_present_rectangles_khr)]()[]
        self._acquire_next_image_2_khr = Ptr(to=get_device_proc_addr(
            device, "vkAcquireNextImage2KHR".unsafe_ptr()
        )).bitcast[__type_of(self._acquire_next_image_2_khr)]()[]

    fn get_device_group_peer_memory_features(
        self,
        device: Device,
        heap_index: UInt32,
        local_device_index: UInt32,
        remote_device_index: UInt32,
        mut peer_memory_features: PeerMemoryFeatureFlags,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_group_peer_memory_features(
            device,
            heap_index,
            local_device_index,
            remote_device_index,
            Ptr(to=peer_memory_features),
        )

    fn cmd_set_device_mask(self, command_buffer: CommandBuffer, device_mask: UInt32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

    fn get_device_group_present_capabilities_khr(
        self,
        device: Device,
        mut device_group_present_capabilities: DeviceGroupPresentCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_group_present_capabilities_khr(
            device, Ptr(to=device_group_present_capabilities)
        )

    fn get_device_group_surface_present_modes_khr(
        self, device: Device, surface: SurfaceKHR, mut modes: DeviceGroupPresentModeFlagsKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_group_surface_present_modes_khr(device, surface, Ptr(to=modes))

    fn get_physical_device_present_rectangles_khr(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut rect_count: UInt32,
        p_rects: Ptr[Rect2D],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_present_rectangles_khr(
            physical_device, surface, Ptr(to=rect_count), p_rects
        )

    fn get_physical_device_present_rectangles_khr(
        self, physical_device: PhysicalDevice, surface: SurfaceKHR
    ) -> ListResult[Rect2D]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[Rect2D]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_present_rectangles_khr(
                physical_device, surface, count, Ptr[Rect2D]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_present_rectangles_khr(
                    physical_device, surface, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn acquire_next_image_2_khr(
        self, device: Device, acquire_info: AcquireNextImageInfoKHR, mut image_index: UInt32
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._acquire_next_image_2_khr(device, Ptr(to=acquire_info), Ptr(to=image_index))


struct Maintenance1(Copyable, Movable):
    var _trim_command_pool: fn(
        device: Device, commandPool: CommandPool, flags: CommandPoolTrimFlags
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._trim_command_pool = Ptr(to=get_device_proc_addr(
            device, "vkTrimCommandPool".unsafe_ptr()
        )).bitcast[__type_of(self._trim_command_pool)]()[]

    fn trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._trim_command_pool(device, command_pool, flags)


struct DeviceGroupCreation(Copyable, Movable):
    var _enumerate_physical_device_groups: fn(
        instance: Instance, pPhysicalDeviceGroupCount: Ptr[UInt32], pPhysicalDeviceGroupProperties: Ptr[PhysicalDeviceGroupProperties]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._enumerate_physical_device_groups = Ptr(to=get_instance_proc_addr(
            instance, "vkEnumeratePhysicalDeviceGroups".unsafe_ptr()
        )).bitcast[__type_of(self._enumerate_physical_device_groups)]()[]

    fn enumerate_physical_device_groups(
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Ptr[PhysicalDeviceGroupProperties],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._enumerate_physical_device_groups(
            instance, Ptr(to=physical_device_group_count), p_physical_device_group_properties
        )

    fn enumerate_physical_device_groups(
        self, instance: Instance
    ) -> ListResult[PhysicalDeviceGroupProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[PhysicalDeviceGroupProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_physical_device_groups(
                instance, count, Ptr[PhysicalDeviceGroupProperties]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.enumerate_physical_device_groups(instance, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)


struct ExternalMemoryCapabilities(Copyable, Movable):
    var _get_physical_device_external_buffer_properties: fn(
        physicalDevice: PhysicalDevice, pExternalBufferInfo: Ptr[PhysicalDeviceExternalBufferInfo], pExternalBufferProperties: Ptr[ExternalBufferProperties]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_external_buffer_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalBufferProperties".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_external_buffer_properties)]()[]

    fn get_physical_device_external_buffer_properties(
        self,
        physical_device: PhysicalDevice,
        external_buffer_info: PhysicalDeviceExternalBufferInfo,
        mut external_buffer_properties: ExternalBufferProperties,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_external_buffer_properties(
            physical_device, Ptr(to=external_buffer_info), Ptr(to=external_buffer_properties)
        )


struct ExternalMemoryWin32(Copyable, Movable):
    var _get_memory_win_32_handle_khr: fn(
        device: Device, pGetWin32HandleInfo: Ptr[MemoryGetWin32HandleInfoKHR], pHandle: Ptr[HANDLE]
    ) -> Result
    var _get_memory_win_32_handle_properties_khr: fn(
        device: Device, handleType: ExternalMemoryHandleTypeFlagBits, handle: HANDLE, pMemoryWin32HandleProperties: Ptr[MemoryWin32HandlePropertiesKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_win_32_handle_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryWin32HandleKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_win_32_handle_khr)]()[]
        self._get_memory_win_32_handle_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryWin32HandlePropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_win_32_handle_properties_khr)]()[]

    fn get_memory_win_32_handle_khr(
        self,
        device: Device,
        get_win_32_handle_info: MemoryGetWin32HandleInfoKHR,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_win_32_handle_khr(
            device, Ptr(to=get_win_32_handle_info), Ptr(to=handle)
        )

    fn get_memory_win_32_handle_properties_khr(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        handle: HANDLE,
        mut memory_win_32_handle_properties: MemoryWin32HandlePropertiesKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_win_32_handle_properties_khr(
            device, handle_type, handle, Ptr(to=memory_win_32_handle_properties)
        )


struct ExternalMemoryFd(Copyable, Movable):
    var _get_memory_fd_khr: fn(
        device: Device, pGetFdInfo: Ptr[MemoryGetFdInfoKHR], pFd: Ptr[Int32]
    ) -> Result
    var _get_memory_fd_properties_khr: fn(
        device: Device, handleType: ExternalMemoryHandleTypeFlagBits, fd: Int32, pMemoryFdProperties: Ptr[MemoryFdPropertiesKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_fd_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryFdKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_fd_khr)]()[]
        self._get_memory_fd_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryFdPropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_fd_properties_khr)]()[]

    fn get_memory_fd_khr(
        self, device: Device, get_fd_info: MemoryGetFdInfoKHR, mut fd: Int32
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_fd_khr(device, Ptr(to=get_fd_info), Ptr(to=fd))

    fn get_memory_fd_properties_khr(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        fd: Int32,
        mut memory_fd_properties: MemoryFdPropertiesKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_fd_properties_khr(
            device, handle_type, fd, Ptr(to=memory_fd_properties)
        )


struct ExternalSemaphoreCapabilities(Copyable, Movable):
    var _get_physical_device_external_semaphore_properties: fn(
        physicalDevice: PhysicalDevice, pExternalSemaphoreInfo: Ptr[PhysicalDeviceExternalSemaphoreInfo], pExternalSemaphoreProperties: Ptr[ExternalSemaphoreProperties]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_external_semaphore_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalSemaphoreProperties".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_external_semaphore_properties)]()[]

    fn get_physical_device_external_semaphore_properties(
        self,
        physical_device: PhysicalDevice,
        external_semaphore_info: PhysicalDeviceExternalSemaphoreInfo,
        mut external_semaphore_properties: ExternalSemaphoreProperties,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_external_semaphore_properties(
            physical_device, Ptr(to=external_semaphore_info), Ptr(to=external_semaphore_properties)
        )


struct ExternalSemaphoreWin32(Copyable, Movable):
    var _import_semaphore_win_32_handle_khr: fn(
        device: Device, pImportSemaphoreWin32HandleInfo: Ptr[ImportSemaphoreWin32HandleInfoKHR]
    ) -> Result
    var _get_semaphore_win_32_handle_khr: fn(
        device: Device, pGetWin32HandleInfo: Ptr[SemaphoreGetWin32HandleInfoKHR], pHandle: Ptr[HANDLE]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_semaphore_win_32_handle_khr = Ptr(to=get_device_proc_addr(
            device, "vkImportSemaphoreWin32HandleKHR".unsafe_ptr()
        )).bitcast[__type_of(self._import_semaphore_win_32_handle_khr)]()[]
        self._get_semaphore_win_32_handle_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreWin32HandleKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_semaphore_win_32_handle_khr)]()[]

    fn import_semaphore_win_32_handle_khr(
        self, device: Device, import_semaphore_win_32_handle_info: ImportSemaphoreWin32HandleInfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._import_semaphore_win_32_handle_khr(
            device, Ptr(to=import_semaphore_win_32_handle_info)
        )

    fn get_semaphore_win_32_handle_khr(
        self,
        device: Device,
        get_win_32_handle_info: SemaphoreGetWin32HandleInfoKHR,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_semaphore_win_32_handle_khr(
            device, Ptr(to=get_win_32_handle_info), Ptr(to=handle)
        )


struct ExternalSemaphoreFd(Copyable, Movable):
    var _import_semaphore_fd_khr: fn(
        device: Device, pImportSemaphoreFdInfo: Ptr[ImportSemaphoreFdInfoKHR]
    ) -> Result
    var _get_semaphore_fd_khr: fn(
        device: Device, pGetFdInfo: Ptr[SemaphoreGetFdInfoKHR], pFd: Ptr[Int32]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_semaphore_fd_khr = Ptr(to=get_device_proc_addr(
            device, "vkImportSemaphoreFdKHR".unsafe_ptr()
        )).bitcast[__type_of(self._import_semaphore_fd_khr)]()[]
        self._get_semaphore_fd_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreFdKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_semaphore_fd_khr)]()[]

    fn import_semaphore_fd_khr(
        self, device: Device, import_semaphore_fd_info: ImportSemaphoreFdInfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._import_semaphore_fd_khr(device, Ptr(to=import_semaphore_fd_info))

    fn get_semaphore_fd_khr(
        self, device: Device, get_fd_info: SemaphoreGetFdInfoKHR, mut fd: Int32
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_semaphore_fd_khr(device, Ptr(to=get_fd_info), Ptr(to=fd))


struct PushDescriptor(Copyable, Movable):
    var _cmd_push_descriptor_set: fn(
        commandBuffer: CommandBuffer, pipelineBindPoint: PipelineBindPoint, layout: PipelineLayout, set: UInt32, descriptorWriteCount: UInt32, pDescriptorWrites: Ptr[WriteDescriptorSet]
    )
    var _cmd_push_descriptor_set_with_template: fn(
        commandBuffer: CommandBuffer, descriptorUpdateTemplate: DescriptorUpdateTemplate, layout: PipelineLayout, set: UInt32, pData: Ptr[NoneType]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_push_descriptor_set = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSet".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_push_descriptor_set)]()[]
        self._cmd_push_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSetWithTemplate".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_push_descriptor_set_with_template)]()[]

    fn cmd_push_descriptor_set(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_push_descriptor_set(
            command_buffer,
            pipeline_bind_point,
            layout,
            set,
            descriptor_write_count,
            p_descriptor_writes,
        )

    fn cmd_push_descriptor_set_with_template(
        self,
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        data: NoneType,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_push_descriptor_set_with_template(
            command_buffer, descriptor_update_template, layout, set, Ptr(to=data)
        )


struct DescriptorUpdateTemplate(Copyable, Movable):
    var _create_descriptor_update_template: fn(
        device: Device, pCreateInfo: Ptr[DescriptorUpdateTemplateCreateInfo], pAllocator: Ptr[AllocationCallbacks], pDescriptorUpdateTemplate: Ptr[DescriptorUpdateTemplate]
    ) -> Result
    var _destroy_descriptor_update_template: fn(
        device: Device, descriptorUpdateTemplate: DescriptorUpdateTemplate, pAllocator: Ptr[AllocationCallbacks]
    )
    var _update_descriptor_set_with_template: fn(
        device: Device, descriptorSet: DescriptorSet, descriptorUpdateTemplate: DescriptorUpdateTemplate, pData: Ptr[NoneType]
    )
    var _cmd_push_descriptor_set_with_template: fn(
        commandBuffer: CommandBuffer, descriptorUpdateTemplate: DescriptorUpdateTemplate, layout: PipelineLayout, set: UInt32, pData: Ptr[NoneType]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_descriptor_update_template = Ptr(to=get_device_proc_addr(
            device, "vkCreateDescriptorUpdateTemplate".unsafe_ptr()
        )).bitcast[__type_of(self._create_descriptor_update_template)]()[]
        self._destroy_descriptor_update_template = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDescriptorUpdateTemplate".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_descriptor_update_template)]()[]
        self._update_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
            device, "vkUpdateDescriptorSetWithTemplate".unsafe_ptr()
        )).bitcast[__type_of(self._update_descriptor_set_with_template)]()[]
        self._cmd_push_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSetWithTemplate".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_push_descriptor_set_with_template)]()[]

    fn create_descriptor_update_template(
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Ptr[AllocationCallbacks],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_descriptor_update_template(
            device, Ptr(to=create_info), p_allocator, Ptr(to=descriptor_update_template)
        )

    fn destroy_descriptor_update_template(
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_descriptor_update_template(
            device, descriptor_update_template, p_allocator
        )

    fn update_descriptor_set_with_template(
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        data: NoneType,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._update_descriptor_set_with_template(
            device, descriptor_set, descriptor_update_template, Ptr(to=data)
        )

    fn cmd_push_descriptor_set_with_template(
        self,
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        data: NoneType,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_push_descriptor_set_with_template(
            command_buffer, descriptor_update_template, layout, set, Ptr(to=data)
        )


struct CreateRenderpass2(Copyable, Movable):
    var _create_render_pass_2: fn(
        device: Device, pCreateInfo: Ptr[RenderPassCreateInfo2], pAllocator: Ptr[AllocationCallbacks], pRenderPass: Ptr[RenderPass]
    ) -> Result
    var _cmd_begin_render_pass_2: fn(
        commandBuffer: CommandBuffer, pRenderPassBegin: Ptr[RenderPassBeginInfo], pSubpassBeginInfo: Ptr[SubpassBeginInfo]
    )
    var _cmd_next_subpass_2: fn(
        commandBuffer: CommandBuffer, pSubpassBeginInfo: Ptr[SubpassBeginInfo], pSubpassEndInfo: Ptr[SubpassEndInfo]
    )
    var _cmd_end_render_pass_2: fn(
        commandBuffer: CommandBuffer, pSubpassEndInfo: Ptr[SubpassEndInfo]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCreateRenderPass2".unsafe_ptr()
        )).bitcast[__type_of(self._create_render_pass_2)]()[]
        self._cmd_begin_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginRenderPass2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_begin_render_pass_2)]()[]
        self._cmd_next_subpass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdNextSubpass2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_next_subpass_2)]()[]
        self._cmd_end_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRenderPass2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_end_render_pass_2)]()[]

    fn create_render_pass_2(
        self,
        device: Device,
        create_info: RenderPassCreateInfo2,
        p_allocator: Ptr[AllocationCallbacks],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_render_pass_2(
            device, Ptr(to=create_info), p_allocator, Ptr(to=render_pass)
        )

    fn cmd_begin_render_pass_2(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        subpass_begin_info: SubpassBeginInfo,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_next_subpass_2(
            command_buffer, Ptr(to=subpass_begin_info), Ptr(to=subpass_end_info)
        )

    fn cmd_end_render_pass_2(self, command_buffer: CommandBuffer, subpass_end_info: SubpassEndInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_end_render_pass_2(command_buffer, Ptr(to=subpass_end_info))


struct SharedPresentableImage(Copyable, Movable):
    var _get_swapchain_status_khr: fn(
        device: Device, swapchain: SwapchainKHR
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_swapchain_status_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainStatusKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_swapchain_status_khr)]()[]

    fn get_swapchain_status_khr(self, device: Device, swapchain: SwapchainKHR) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_swapchain_status_khr(device, swapchain)


struct ExternalFenceCapabilities(Copyable, Movable):
    var _get_physical_device_external_fence_properties: fn(
        physicalDevice: PhysicalDevice, pExternalFenceInfo: Ptr[PhysicalDeviceExternalFenceInfo], pExternalFenceProperties: Ptr[ExternalFenceProperties]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_external_fence_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalFenceProperties".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_external_fence_properties)]()[]

    fn get_physical_device_external_fence_properties(
        self,
        physical_device: PhysicalDevice,
        external_fence_info: PhysicalDeviceExternalFenceInfo,
        mut external_fence_properties: ExternalFenceProperties,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_external_fence_properties(
            physical_device, Ptr(to=external_fence_info), Ptr(to=external_fence_properties)
        )


struct ExternalFenceWin32(Copyable, Movable):
    var _import_fence_win_32_handle_khr: fn(
        device: Device, pImportFenceWin32HandleInfo: Ptr[ImportFenceWin32HandleInfoKHR]
    ) -> Result
    var _get_fence_win_32_handle_khr: fn(
        device: Device, pGetWin32HandleInfo: Ptr[FenceGetWin32HandleInfoKHR], pHandle: Ptr[HANDLE]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_fence_win_32_handle_khr = Ptr(to=get_device_proc_addr(
            device, "vkImportFenceWin32HandleKHR".unsafe_ptr()
        )).bitcast[__type_of(self._import_fence_win_32_handle_khr)]()[]
        self._get_fence_win_32_handle_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetFenceWin32HandleKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_fence_win_32_handle_khr)]()[]

    fn import_fence_win_32_handle_khr(
        self, device: Device, import_fence_win_32_handle_info: ImportFenceWin32HandleInfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._import_fence_win_32_handle_khr(device, Ptr(to=import_fence_win_32_handle_info))

    fn get_fence_win_32_handle_khr(
        self, device: Device, get_win_32_handle_info: FenceGetWin32HandleInfoKHR, mut handle: HANDLE
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_fence_win_32_handle_khr(
            device, Ptr(to=get_win_32_handle_info), Ptr(to=handle)
        )


struct ExternalFenceFd(Copyable, Movable):
    var _import_fence_fd_khr: fn(
        device: Device, pImportFenceFdInfo: Ptr[ImportFenceFdInfoKHR]
    ) -> Result
    var _get_fence_fd_khr: fn(
        device: Device, pGetFdInfo: Ptr[FenceGetFdInfoKHR], pFd: Ptr[Int32]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_fence_fd_khr = Ptr(to=get_device_proc_addr(
            device, "vkImportFenceFdKHR".unsafe_ptr()
        )).bitcast[__type_of(self._import_fence_fd_khr)]()[]
        self._get_fence_fd_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetFenceFdKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_fence_fd_khr)]()[]

    fn import_fence_fd_khr(
        self, device: Device, import_fence_fd_info: ImportFenceFdInfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._import_fence_fd_khr(device, Ptr(to=import_fence_fd_info))

    fn get_fence_fd_khr(
        self, device: Device, get_fd_info: FenceGetFdInfoKHR, mut fd: Int32
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_fence_fd_khr(device, Ptr(to=get_fd_info), Ptr(to=fd))


struct PerformanceQuery(Copyable, Movable):
    var _enumerate_physical_device_queue_family_performance_query_counters_khr: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32, pCounterCount: Ptr[UInt32], pCounters: Ptr[PerformanceCounterKHR], pCounterDescriptions: Ptr[PerformanceCounterDescriptionKHR]
    ) -> Result
    var _get_physical_device_queue_family_performance_query_passes_khr: fn(
        physicalDevice: PhysicalDevice, pPerformanceQueryCreateInfo: Ptr[QueryPoolPerformanceCreateInfoKHR], pNumPasses: Ptr[UInt32]
    )
    var _acquire_profiling_lock_khr: fn(
        device: Device, pInfo: Ptr[AcquireProfilingLockInfoKHR]
    ) -> Result
    var _release_profiling_lock_khr: fn(
        device: Device
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._enumerate_physical_device_queue_family_performance_query_counters_khr = Ptr(to=get_device_proc_addr(
            device, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR".unsafe_ptr()
        )).bitcast[__type_of(self._enumerate_physical_device_queue_family_performance_query_counters_khr)]()[]
        self._get_physical_device_queue_family_performance_query_passes_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_queue_family_performance_query_passes_khr)]()[]
        self._acquire_profiling_lock_khr = Ptr(to=get_device_proc_addr(
            device, "vkAcquireProfilingLockKHR".unsafe_ptr()
        )).bitcast[__type_of(self._acquire_profiling_lock_khr)]()[]
        self._release_profiling_lock_khr = Ptr(to=get_device_proc_addr(
            device, "vkReleaseProfilingLockKHR".unsafe_ptr()
        )).bitcast[__type_of(self._release_profiling_lock_khr)]()[]

    fn enumerate_physical_device_queue_family_performance_query_counters_khr(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut counter_count: UInt32,
        p_counters: Ptr[PerformanceCounterKHR],
        p_counter_descriptions: Ptr[PerformanceCounterDescriptionKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._enumerate_physical_device_queue_family_performance_query_counters_khr(
            physical_device,
            queue_family_index,
            Ptr(to=counter_count),
            p_counters,
            p_counter_descriptions,
        )

    fn get_physical_device_queue_family_performance_query_passes_khr(
        self,
        physical_device: PhysicalDevice,
        performance_query_create_info: QueryPoolPerformanceCreateInfoKHR,
        mut num_passes: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_queue_family_performance_query_passes_khr(
            physical_device, Ptr(to=performance_query_create_info), Ptr(to=num_passes)
        )

    fn acquire_profiling_lock_khr(
        self, device: Device, info: AcquireProfilingLockInfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._acquire_profiling_lock_khr(device, Ptr(to=info))

    fn release_profiling_lock_khr(self, device: Device):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._release_profiling_lock_khr(device)


struct GetSurfaceCapabilities2(Copyable, Movable):
    var _get_physical_device_surface_capabilities_2_khr: fn(
        physicalDevice: PhysicalDevice, pSurfaceInfo: Ptr[PhysicalDeviceSurfaceInfo2KHR], pSurfaceCapabilities: Ptr[SurfaceCapabilities2KHR]
    ) -> Result
    var _get_physical_device_surface_formats_2_khr: fn(
        physicalDevice: PhysicalDevice, pSurfaceInfo: Ptr[PhysicalDeviceSurfaceInfo2KHR], pSurfaceFormatCount: Ptr[UInt32], pSurfaceFormats: Ptr[SurfaceFormat2KHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_surface_capabilities_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceCapabilities2KHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_surface_capabilities_2_khr)]()[]
        self._get_physical_device_surface_formats_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceFormats2KHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_surface_formats_2_khr)]()[]

    fn get_physical_device_surface_capabilities_2_khr(
        self,
        physical_device: PhysicalDevice,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut surface_capabilities: SurfaceCapabilities2KHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_surface_capabilities_2_khr(
            physical_device, Ptr(to=surface_info), Ptr(to=surface_capabilities)
        )

    fn get_physical_device_surface_formats_2_khr(
        self,
        physical_device: PhysicalDevice,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut surface_format_count: UInt32,
        p_surface_formats: Ptr[SurfaceFormat2KHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_surface_formats_2_khr(
            physical_device, Ptr(to=surface_info), Ptr(to=surface_format_count), p_surface_formats
        )

    fn get_physical_device_surface_formats_2_khr(
        self, physical_device: PhysicalDevice, surface_info: PhysicalDeviceSurfaceInfo2KHR
    ) -> ListResult[SurfaceFormat2KHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[SurfaceFormat2KHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_surface_formats_2_khr(
                physical_device, surface_info, count, Ptr[SurfaceFormat2KHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_surface_formats_2_khr(
                    physical_device, surface_info, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)


struct GetDisplayProperties2(Copyable, Movable):
    var _get_physical_device_display_properties_2_khr: fn(
        physicalDevice: PhysicalDevice, pPropertyCount: Ptr[UInt32], pProperties: Ptr[DisplayProperties2KHR]
    ) -> Result
    var _get_physical_device_display_plane_properties_2_khr: fn(
        physicalDevice: PhysicalDevice, pPropertyCount: Ptr[UInt32], pProperties: Ptr[DisplayPlaneProperties2KHR]
    ) -> Result
    var _get_display_mode_properties_2_khr: fn(
        physicalDevice: PhysicalDevice, display: DisplayKHR, pPropertyCount: Ptr[UInt32], pProperties: Ptr[DisplayModeProperties2KHR]
    ) -> Result
    var _get_display_plane_capabilities_2_khr: fn(
        physicalDevice: PhysicalDevice, pDisplayPlaneInfo: Ptr[DisplayPlaneInfo2KHR], pCapabilities: Ptr[DisplayPlaneCapabilities2KHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_display_properties_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayProperties2KHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_display_properties_2_khr)]()[]
        self._get_physical_device_display_plane_properties_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayPlaneProperties2KHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_display_plane_properties_2_khr)]()[]
        self._get_display_mode_properties_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayModeProperties2KHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_display_mode_properties_2_khr)]()[]
        self._get_display_plane_capabilities_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayPlaneCapabilities2KHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_display_plane_capabilities_2_khr)]()[]

    fn get_physical_device_display_properties_2_khr(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayProperties2KHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_display_properties_2_khr(
            physical_device, Ptr(to=property_count), p_properties
        )

    fn get_physical_device_display_properties_2_khr(
        self, physical_device: PhysicalDevice
    ) -> ListResult[DisplayProperties2KHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[DisplayProperties2KHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_display_properties_2_khr(
                physical_device, count, Ptr[DisplayProperties2KHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_display_properties_2_khr(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_display_plane_properties_2_khr(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayPlaneProperties2KHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_display_plane_properties_2_khr(
            physical_device, Ptr(to=property_count), p_properties
        )

    fn get_physical_device_display_plane_properties_2_khr(
        self, physical_device: PhysicalDevice
    ) -> ListResult[DisplayPlaneProperties2KHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[DisplayPlaneProperties2KHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_display_plane_properties_2_khr(
                physical_device, count, Ptr[DisplayPlaneProperties2KHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_display_plane_properties_2_khr(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_display_mode_properties_2_khr(
        self,
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayModeProperties2KHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_display_mode_properties_2_khr(
            physical_device, display, Ptr(to=property_count), p_properties
        )

    fn get_display_mode_properties_2_khr(
        self, physical_device: PhysicalDevice, display: DisplayKHR
    ) -> ListResult[DisplayModeProperties2KHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[DisplayModeProperties2KHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_display_mode_properties_2_khr(
                physical_device, display, count, Ptr[DisplayModeProperties2KHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_display_mode_properties_2_khr(
                    physical_device, display, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_display_plane_capabilities_2_khr(
        self,
        physical_device: PhysicalDevice,
        display_plane_info: DisplayPlaneInfo2KHR,
        mut capabilities: DisplayPlaneCapabilities2KHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_display_plane_capabilities_2_khr(
            physical_device, Ptr(to=display_plane_info), Ptr(to=capabilities)
        )


struct GetMemoryRequirements2(Copyable, Movable):
    var _get_image_memory_requirements_2: fn(
        device: Device, pInfo: Ptr[ImageMemoryRequirementsInfo2], pMemoryRequirements: Ptr[MemoryRequirements2]
    )
    var _get_buffer_memory_requirements_2: fn(
        device: Device, pInfo: Ptr[BufferMemoryRequirementsInfo2], pMemoryRequirements: Ptr[MemoryRequirements2]
    )
    var _get_image_sparse_memory_requirements_2: fn(
        device: Device, pInfo: Ptr[ImageSparseMemoryRequirementsInfo2], pSparseMemoryRequirementCount: Ptr[UInt32], pSparseMemoryRequirements: Ptr[SparseImageMemoryRequirements2]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageMemoryRequirements2".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_memory_requirements_2)]()[]
        self._get_buffer_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferMemoryRequirements2".unsafe_ptr()
        )).bitcast[__type_of(self._get_buffer_memory_requirements_2)]()[]
        self._get_image_sparse_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSparseMemoryRequirements2".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_sparse_memory_requirements_2)]()[]

    fn get_image_memory_requirements_2(
        self,
        device: Device,
        info: ImageMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_memory_requirements_2(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn get_buffer_memory_requirements_2(
        self,
        device: Device,
        info: BufferMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_buffer_memory_requirements_2(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn get_image_sparse_memory_requirements_2(
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info),
            Ptr(to=sparse_memory_requirement_count),
            p_sparse_memory_requirements,
        )

    fn get_image_sparse_memory_requirements_2(
        self, device: Device, info: ImageSparseMemoryRequirementsInfo2
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self.get_image_sparse_memory_requirements_2(
            device, info, count, Ptr[SparseImageMemoryRequirements2]()
        )
        if count > 0:
            list.reserve(Int(count))
            self.get_image_sparse_memory_requirements_2(device, info, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^


struct AccelerationStructure(Copyable, Movable):
    var _create_acceleration_structure_khr: fn(
        device: Device, pCreateInfo: Ptr[AccelerationStructureCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pAccelerationStructure: Ptr[AccelerationStructureKHR]
    ) -> Result
    var _destroy_acceleration_structure_khr: fn(
        device: Device, accelerationStructure: AccelerationStructureKHR, pAllocator: Ptr[AllocationCallbacks]
    )
    var _cmd_build_acceleration_structures_khr: fn(
        commandBuffer: CommandBuffer, infoCount: UInt32, pInfos: Ptr[AccelerationStructureBuildGeometryInfoKHR], ppBuildRangeInfos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR]]
    )
    var _cmd_build_acceleration_structures_indirect_khr: fn(
        commandBuffer: CommandBuffer, infoCount: UInt32, pInfos: Ptr[AccelerationStructureBuildGeometryInfoKHR], pIndirectDeviceAddresses: Ptr[DeviceAddress], pIndirectStrides: Ptr[UInt32], ppMaxPrimitiveCounts: Ptr[Ptr[UInt32]]
    )
    var _build_acceleration_structures_khr: fn(
        device: Device, deferredOperation: DeferredOperationKHR, infoCount: UInt32, pInfos: Ptr[AccelerationStructureBuildGeometryInfoKHR], ppBuildRangeInfos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR]]
    ) -> Result
    var _copy_acceleration_structure_khr: fn(
        device: Device, deferredOperation: DeferredOperationKHR, pInfo: Ptr[CopyAccelerationStructureInfoKHR]
    ) -> Result
    var _copy_acceleration_structure_to_memory_khr: fn(
        device: Device, deferredOperation: DeferredOperationKHR, pInfo: Ptr[CopyAccelerationStructureToMemoryInfoKHR]
    ) -> Result
    var _copy_memory_to_acceleration_structure_khr: fn(
        device: Device, deferredOperation: DeferredOperationKHR, pInfo: Ptr[CopyMemoryToAccelerationStructureInfoKHR]
    ) -> Result
    var _write_acceleration_structures_properties_khr: fn(
        device: Device, accelerationStructureCount: UInt32, pAccelerationStructures: Ptr[AccelerationStructureKHR], queryType: QueryType, dataSize: UInt, pData: Ptr[NoneType], stride: UInt
    ) -> Result
    var _cmd_copy_acceleration_structure_khr: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[CopyAccelerationStructureInfoKHR]
    )
    var _cmd_copy_acceleration_structure_to_memory_khr: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[CopyAccelerationStructureToMemoryInfoKHR]
    )
    var _cmd_copy_memory_to_acceleration_structure_khr: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[CopyMemoryToAccelerationStructureInfoKHR]
    )
    var _get_acceleration_structure_device_address_khr: fn(
        device: Device, pInfo: Ptr[AccelerationStructureDeviceAddressInfoKHR]
    ) -> DeviceAddress
    var _cmd_write_acceleration_structures_properties_khr: fn(
        commandBuffer: CommandBuffer, accelerationStructureCount: UInt32, pAccelerationStructures: Ptr[AccelerationStructureKHR], queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32
    )
    var _get_device_acceleration_structure_compatibility_khr: fn(
        device: Device, pVersionInfo: Ptr[AccelerationStructureVersionInfoKHR], pCompatibility: Ptr[AccelerationStructureCompatibilityKHR]
    )
    var _get_acceleration_structure_build_sizes_khr: fn(
        device: Device, buildType: AccelerationStructureBuildTypeKHR, pBuildInfo: Ptr[AccelerationStructureBuildGeometryInfoKHR], pMaxPrimitiveCounts: Ptr[UInt32], pSizeInfo: Ptr[AccelerationStructureBuildSizesInfoKHR]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateAccelerationStructureKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_acceleration_structure_khr)]()[]
        self._destroy_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroyAccelerationStructureKHR".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_acceleration_structure_khr)]()[]
        self._cmd_build_acceleration_structures_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildAccelerationStructuresKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_build_acceleration_structures_khr)]()[]
        self._cmd_build_acceleration_structures_indirect_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildAccelerationStructuresIndirectKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_build_acceleration_structures_indirect_khr)]()[]
        self._build_acceleration_structures_khr = Ptr(to=get_device_proc_addr(
            device, "vkBuildAccelerationStructuresKHR".unsafe_ptr()
        )).bitcast[__type_of(self._build_acceleration_structures_khr)]()[]
        self._copy_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkCopyAccelerationStructureKHR".unsafe_ptr()
        )).bitcast[__type_of(self._copy_acceleration_structure_khr)]()[]
        self._copy_acceleration_structure_to_memory_khr = Ptr(to=get_device_proc_addr(
            device, "vkCopyAccelerationStructureToMemoryKHR".unsafe_ptr()
        )).bitcast[__type_of(self._copy_acceleration_structure_to_memory_khr)]()[]
        self._copy_memory_to_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkCopyMemoryToAccelerationStructureKHR".unsafe_ptr()
        )).bitcast[__type_of(self._copy_memory_to_acceleration_structure_khr)]()[]
        self._write_acceleration_structures_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkWriteAccelerationStructuresPropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._write_acceleration_structures_properties_khr)]()[]
        self._cmd_copy_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyAccelerationStructureKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_acceleration_structure_khr)]()[]
        self._cmd_copy_acceleration_structure_to_memory_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyAccelerationStructureToMemoryKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_acceleration_structure_to_memory_khr)]()[]
        self._cmd_copy_memory_to_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToAccelerationStructureKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_memory_to_acceleration_structure_khr)]()[]
        self._get_acceleration_structure_device_address_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureDeviceAddressKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_acceleration_structure_device_address_khr)]()[]
        self._cmd_write_acceleration_structures_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteAccelerationStructuresPropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_write_acceleration_structures_properties_khr)]()[]
        self._get_device_acceleration_structure_compatibility_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceAccelerationStructureCompatibilityKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_acceleration_structure_compatibility_khr)]()[]
        self._get_acceleration_structure_build_sizes_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureBuildSizesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_acceleration_structure_build_sizes_khr)]()[]

    fn create_acceleration_structure_khr(
        self,
        device: Device,
        create_info: AccelerationStructureCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut acceleration_structure: AccelerationStructureKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_acceleration_structure_khr(
            device, Ptr(to=create_info), p_allocator, Ptr(to=acceleration_structure)
        )

    fn destroy_acceleration_structure_khr(
        self,
        device: Device,
        acceleration_structure: AccelerationStructureKHR,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_acceleration_structure_khr(device, acceleration_structure, p_allocator)

    fn cmd_build_acceleration_structures_khr(
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR],
        pp_build_range_infos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR]],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_build_acceleration_structures_khr(
            command_buffer, info_count, p_infos, pp_build_range_infos
        )

    fn cmd_build_acceleration_structures_indirect_khr(
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR],
        p_indirect_device_addresses: Ptr[DeviceAddress],
        p_indirect_strides: Ptr[UInt32],
        pp_max_primitive_counts: Ptr[Ptr[UInt32]],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_build_acceleration_structures_indirect_khr(
            command_buffer,
            info_count,
            p_infos,
            p_indirect_device_addresses,
            p_indirect_strides,
            pp_max_primitive_counts,
        )

    fn build_acceleration_structures_khr(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR],
        pp_build_range_infos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR]],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._build_acceleration_structures_khr(
            device, deferred_operation, info_count, p_infos, pp_build_range_infos
        )

    fn copy_acceleration_structure_khr(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyAccelerationStructureInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._copy_acceleration_structure_khr(device, deferred_operation, Ptr(to=info))

    fn copy_acceleration_structure_to_memory_khr(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyAccelerationStructureToMemoryInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._copy_acceleration_structure_to_memory_khr(
            device, deferred_operation, Ptr(to=info)
        )

    fn copy_memory_to_acceleration_structure_khr(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMemoryToAccelerationStructureInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._copy_memory_to_acceleration_structure_khr(
            device, deferred_operation, Ptr(to=info)
        )

    fn write_acceleration_structures_properties_khr(
        self,
        device: Device,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureKHR],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType],
        stride: UInt,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._write_acceleration_structures_properties_khr(
            device,
            acceleration_structure_count,
            p_acceleration_structures,
            query_type,
            data_size,
            p_data,
            stride,
        )

    fn cmd_copy_acceleration_structure_khr(
        self, command_buffer: CommandBuffer, info: CopyAccelerationStructureInfoKHR
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_acceleration_structure_khr(command_buffer, Ptr(to=info))

    fn cmd_copy_acceleration_structure_to_memory_khr(
        self, command_buffer: CommandBuffer, info: CopyAccelerationStructureToMemoryInfoKHR
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_acceleration_structure_to_memory_khr(command_buffer, Ptr(to=info))

    fn cmd_copy_memory_to_acceleration_structure_khr(
        self, command_buffer: CommandBuffer, info: CopyMemoryToAccelerationStructureInfoKHR
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_memory_to_acceleration_structure_khr(command_buffer, Ptr(to=info))

    fn get_acceleration_structure_device_address_khr(
        self, device: Device, info: AccelerationStructureDeviceAddressInfoKHR
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_acceleration_structure_device_address_khr(device, Ptr(to=info))

    fn cmd_write_acceleration_structures_properties_khr(
        self,
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureKHR],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_write_acceleration_structures_properties_khr(
            command_buffer,
            acceleration_structure_count,
            p_acceleration_structures,
            query_type,
            query_pool,
            first_query,
        )

    fn get_device_acceleration_structure_compatibility_khr(
        self,
        device: Device,
        version_info: AccelerationStructureVersionInfoKHR,
        mut compatibility: AccelerationStructureCompatibilityKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_acceleration_structure_compatibility_khr(
            device, Ptr(to=version_info), Ptr(to=compatibility)
        )

    fn get_acceleration_structure_build_sizes_khr(
        self,
        device: Device,
        build_type: AccelerationStructureBuildTypeKHR,
        build_info: AccelerationStructureBuildGeometryInfoKHR,
        p_max_primitive_counts: Ptr[UInt32],
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_acceleration_structure_build_sizes_khr(
            device, build_type, Ptr(to=build_info), p_max_primitive_counts, Ptr(to=size_info)
        )


struct RayTracingPipeline(Copyable, Movable):
    var _cmd_trace_rays_khr: fn(
        commandBuffer: CommandBuffer, pRaygenShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR], pMissShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR], pHitShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR], pCallableShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR], width: UInt32, height: UInt32, depth: UInt32
    )
    var _create_ray_tracing_pipelines_khr: fn(
        device: Device, deferredOperation: DeferredOperationKHR, pipelineCache: PipelineCache, createInfoCount: UInt32, pCreateInfos: Ptr[RayTracingPipelineCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pPipelines: Ptr[Pipeline]
    ) -> Result
    var _get_ray_tracing_shader_group_handles_khr: fn(
        device: Device, pipeline: Pipeline, firstGroup: UInt32, groupCount: UInt32, dataSize: UInt, pData: Ptr[NoneType]
    ) -> Result
    var _get_ray_tracing_capture_replay_shader_group_handles_khr: fn(
        device: Device, pipeline: Pipeline, firstGroup: UInt32, groupCount: UInt32, dataSize: UInt, pData: Ptr[NoneType]
    ) -> Result
    var _cmd_trace_rays_indirect_khr: fn(
        commandBuffer: CommandBuffer, pRaygenShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR], pMissShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR], pHitShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR], pCallableShaderBindingTable: Ptr[StridedDeviceAddressRegionKHR], indirectDeviceAddress: DeviceAddress
    )
    var _get_ray_tracing_shader_group_stack_size_khr: fn(
        device: Device, pipeline: Pipeline, group: UInt32, groupShader: ShaderGroupShaderKHR
    ) -> DeviceSize
    var _cmd_set_ray_tracing_pipeline_stack_size_khr: fn(
        commandBuffer: CommandBuffer, pipelineStackSize: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_trace_rays_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_trace_rays_khr)]()[]
        self._create_ray_tracing_pipelines_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateRayTracingPipelinesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_ray_tracing_pipelines_khr)]()[]
        self._get_ray_tracing_shader_group_handles_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingShaderGroupHandlesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_ray_tracing_shader_group_handles_khr)]()[]
        self._get_ray_tracing_capture_replay_shader_group_handles_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_ray_tracing_capture_replay_shader_group_handles_khr)]()[]
        self._cmd_trace_rays_indirect_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysIndirectKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_trace_rays_indirect_khr)]()[]
        self._get_ray_tracing_shader_group_stack_size_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingShaderGroupStackSizeKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_ray_tracing_shader_group_stack_size_khr)]()[]
        self._cmd_set_ray_tracing_pipeline_stack_size_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRayTracingPipelineStackSizeKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_ray_tracing_pipeline_stack_size_khr)]()[]

    fn cmd_trace_rays_khr(
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_trace_rays_khr(
            command_buffer,
            Ptr(to=raygen_shader_binding_table),
            Ptr(to=miss_shader_binding_table),
            Ptr(to=hit_shader_binding_table),
            Ptr(to=callable_shader_binding_table),
            width,
            height,
            depth,
        )

    fn create_ray_tracing_pipelines_khr(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoKHR],
        p_allocator: Ptr[AllocationCallbacks],
        p_pipelines: Ptr[Pipeline],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_ray_tracing_pipelines_khr(
            device,
            deferred_operation,
            pipeline_cache,
            create_info_count,
            p_create_infos,
            p_allocator,
            p_pipelines,
        )

    fn get_ray_tracing_shader_group_handles_khr(
        self,
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_ray_tracing_shader_group_handles_khr(
            device, pipeline, first_group, group_count, data_size, p_data
        )

    fn get_ray_tracing_capture_replay_shader_group_handles_khr(
        self,
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_ray_tracing_capture_replay_shader_group_handles_khr(
            device, pipeline, first_group, group_count, data_size, p_data
        )

    fn cmd_trace_rays_indirect_khr(
        self,
        command_buffer: CommandBuffer,
        raygen_shader_binding_table: StridedDeviceAddressRegionKHR,
        miss_shader_binding_table: StridedDeviceAddressRegionKHR,
        hit_shader_binding_table: StridedDeviceAddressRegionKHR,
        callable_shader_binding_table: StridedDeviceAddressRegionKHR,
        indirect_device_address: DeviceAddress,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_trace_rays_indirect_khr(
            command_buffer,
            Ptr(to=raygen_shader_binding_table),
            Ptr(to=miss_shader_binding_table),
            Ptr(to=hit_shader_binding_table),
            Ptr(to=callable_shader_binding_table),
            indirect_device_address,
        )

    fn get_ray_tracing_shader_group_stack_size_khr(
        self, device: Device, pipeline: Pipeline, group: UInt32, group_shader: ShaderGroupShaderKHR
    ) -> DeviceSize:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_ray_tracing_shader_group_stack_size_khr(
            device, pipeline, group, group_shader
        )

    fn cmd_set_ray_tracing_pipeline_stack_size_khr(
        self, command_buffer: CommandBuffer, pipeline_stack_size: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_ray_tracing_pipeline_stack_size_khr(
            command_buffer, pipeline_stack_size
        )


struct SamplerYcbcrConversion(Copyable, Movable):
    var _create_sampler_ycbcr_conversion: fn(
        device: Device, pCreateInfo: Ptr[SamplerYcbcrConversionCreateInfo], pAllocator: Ptr[AllocationCallbacks], pYcbcrConversion: Ptr[SamplerYcbcrConversion]
    ) -> Result
    var _destroy_sampler_ycbcr_conversion: fn(
        device: Device, ycbcrConversion: SamplerYcbcrConversion, pAllocator: Ptr[AllocationCallbacks]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_sampler_ycbcr_conversion = Ptr(to=get_device_proc_addr(
            device, "vkCreateSamplerYcbcrConversion".unsafe_ptr()
        )).bitcast[__type_of(self._create_sampler_ycbcr_conversion)]()[]
        self._destroy_sampler_ycbcr_conversion = Ptr(to=get_device_proc_addr(
            device, "vkDestroySamplerYcbcrConversion".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_sampler_ycbcr_conversion)]()[]

    fn create_sampler_ycbcr_conversion(
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Ptr[AllocationCallbacks],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_sampler_ycbcr_conversion(
            device, Ptr(to=create_info), p_allocator, Ptr(to=ycbcr_conversion)
        )

    fn destroy_sampler_ycbcr_conversion(
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_sampler_ycbcr_conversion(device, ycbcr_conversion, p_allocator)


struct BindMemory2(Copyable, Movable):
    var _bind_buffer_memory_2: fn(
        device: Device, bindInfoCount: UInt32, pBindInfos: Ptr[BindBufferMemoryInfo]
    ) -> Result
    var _bind_image_memory_2: fn(
        device: Device, bindInfoCount: UInt32, pBindInfos: Ptr[BindImageMemoryInfo]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._bind_buffer_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkBindBufferMemory2".unsafe_ptr()
        )).bitcast[__type_of(self._bind_buffer_memory_2)]()[]
        self._bind_image_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkBindImageMemory2".unsafe_ptr()
        )).bitcast[__type_of(self._bind_image_memory_2)]()[]

    fn bind_buffer_memory_2(
        self, device: Device, bind_info_count: UInt32, p_bind_infos: Ptr[BindBufferMemoryInfo]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._bind_buffer_memory_2(device, bind_info_count, p_bind_infos)

    fn bind_image_memory_2(
        self, device: Device, bind_info_count: UInt32, p_bind_infos: Ptr[BindImageMemoryInfo]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._bind_image_memory_2(device, bind_info_count, p_bind_infos)


struct Maintenance3(Copyable, Movable):
    var _get_descriptor_set_layout_support: fn(
        device: Device, pCreateInfo: Ptr[DescriptorSetLayoutCreateInfo], pSupport: Ptr[DescriptorSetLayoutSupport]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_descriptor_set_layout_support = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutSupport".unsafe_ptr()
        )).bitcast[__type_of(self._get_descriptor_set_layout_support)]()[]

    fn get_descriptor_set_layout_support(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        mut support: DescriptorSetLayoutSupport,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_descriptor_set_layout_support(device, Ptr(to=create_info), Ptr(to=support))


struct DrawIndirectCount(Copyable, Movable):
    var _cmd_draw_indirect_count: fn(
        commandBuffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, countBuffer: Buffer, countBufferOffset: DeviceSize, maxDrawCount: UInt32, stride: UInt32
    )
    var _cmd_draw_indexed_indirect_count: fn(
        commandBuffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, countBuffer: Buffer, countBufferOffset: DeviceSize, maxDrawCount: UInt32, stride: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirectCount".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_indirect_count)]()[]
        self._cmd_draw_indexed_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndexedIndirectCount".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_indexed_indirect_count)]()[]

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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_indirect_count(
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_indexed_indirect_count(
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )


struct TimelineSemaphore(Copyable, Movable):
    var _get_semaphore_counter_value: fn(
        device: Device, semaphore: Semaphore, pValue: Ptr[UInt64]
    ) -> Result
    var _wait_semaphores: fn(
        device: Device, pWaitInfo: Ptr[SemaphoreWaitInfo], timeout: UInt64
    ) -> Result
    var _signal_semaphore: fn(
        device: Device, pSignalInfo: Ptr[SemaphoreSignalInfo]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_semaphore_counter_value = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreCounterValue".unsafe_ptr()
        )).bitcast[__type_of(self._get_semaphore_counter_value)]()[]
        self._wait_semaphores = Ptr(to=get_device_proc_addr(
            device, "vkWaitSemaphores".unsafe_ptr()
        )).bitcast[__type_of(self._wait_semaphores)]()[]
        self._signal_semaphore = Ptr(to=get_device_proc_addr(
            device, "vkSignalSemaphore".unsafe_ptr()
        )).bitcast[__type_of(self._signal_semaphore)]()[]

    fn get_semaphore_counter_value(
        self, device: Device, semaphore: Semaphore, mut value: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_semaphore_counter_value(device, semaphore, Ptr(to=value))

    fn wait_semaphores(
        self, device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._wait_semaphores(device, Ptr(to=wait_info), timeout)

    fn signal_semaphore(self, device: Device, signal_info: SemaphoreSignalInfo) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._signal_semaphore(device, Ptr(to=signal_info))


struct FragmentShadingRate(Copyable, Movable):
    var _get_physical_device_fragment_shading_rates_khr: fn(
        physicalDevice: PhysicalDevice, pFragmentShadingRateCount: Ptr[UInt32], pFragmentShadingRates: Ptr[PhysicalDeviceFragmentShadingRateKHR]
    ) -> Result
    var _cmd_set_fragment_shading_rate_khr: fn(
        commandBuffer: CommandBuffer, pFragmentSize: Ptr[Extent2D], combinerOps: FragmentShadingRateCombinerOpKHR
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_fragment_shading_rates_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceFragmentShadingRatesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_fragment_shading_rates_khr)]()[]
        self._cmd_set_fragment_shading_rate_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFragmentShadingRateKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_fragment_shading_rate_khr)]()[]

    fn get_physical_device_fragment_shading_rates_khr(
        self,
        physical_device: PhysicalDevice,
        mut fragment_shading_rate_count: UInt32,
        p_fragment_shading_rates: Ptr[PhysicalDeviceFragmentShadingRateKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_fragment_shading_rates_khr(
            physical_device, Ptr(to=fragment_shading_rate_count), p_fragment_shading_rates
        )

    fn get_physical_device_fragment_shading_rates_khr(
        self, physical_device: PhysicalDevice
    ) -> ListResult[PhysicalDeviceFragmentShadingRateKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[PhysicalDeviceFragmentShadingRateKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_fragment_shading_rates_khr(
                physical_device, count, Ptr[PhysicalDeviceFragmentShadingRateKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_fragment_shading_rates_khr(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn cmd_set_fragment_shading_rate_khr(
        self,
        command_buffer: CommandBuffer,
        fragment_size: Extent2D,
        combiner_ops: FragmentShadingRateCombinerOpKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_fragment_shading_rate_khr(
            command_buffer, Ptr(to=fragment_size), combiner_ops
        )


struct DynamicRenderingLocalRead(Copyable, Movable):
    var _cmd_set_rendering_attachment_locations: fn(
        commandBuffer: CommandBuffer, pLocationInfo: Ptr[RenderingAttachmentLocationInfo]
    )
    var _cmd_set_rendering_input_attachment_indices: fn(
        commandBuffer: CommandBuffer, pInputAttachmentIndexInfo: Ptr[RenderingInputAttachmentIndexInfo]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_rendering_attachment_locations = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRenderingAttachmentLocations".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_rendering_attachment_locations)]()[]
        self._cmd_set_rendering_input_attachment_indices = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRenderingInputAttachmentIndices".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_rendering_input_attachment_indices)]()[]

    fn cmd_set_rendering_attachment_locations(
        self, command_buffer: CommandBuffer, location_info: RenderingAttachmentLocationInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_rendering_attachment_locations(command_buffer, Ptr(to=location_info))

    fn cmd_set_rendering_input_attachment_indices(
        self,
        command_buffer: CommandBuffer,
        input_attachment_index_info: RenderingInputAttachmentIndexInfo,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_rendering_input_attachment_indices(
            command_buffer, Ptr(to=input_attachment_index_info)
        )


struct PresentWait(Copyable, Movable):
    var _wait_for_present_khr: fn(
        device: Device, swapchain: SwapchainKHR, presentId: UInt64, timeout: UInt64
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._wait_for_present_khr = Ptr(to=get_device_proc_addr(
            device, "vkWaitForPresentKHR".unsafe_ptr()
        )).bitcast[__type_of(self._wait_for_present_khr)]()[]

    fn wait_for_present_khr(
        self, device: Device, swapchain: SwapchainKHR, present_id: UInt64, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._wait_for_present_khr(device, swapchain, present_id, timeout)


struct BufferDeviceAddress(Copyable, Movable):
    var _get_buffer_device_address: fn(
        device: Device, pInfo: Ptr[BufferDeviceAddressInfo]
    ) -> DeviceAddress
    var _get_buffer_opaque_capture_address: fn(
        device: Device, pInfo: Ptr[BufferDeviceAddressInfo]
    ) -> UInt64
    var _get_device_memory_opaque_capture_address: fn(
        device: Device, pInfo: Ptr[DeviceMemoryOpaqueCaptureAddressInfo]
    ) -> UInt64

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_buffer_device_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferDeviceAddress".unsafe_ptr()
        )).bitcast[__type_of(self._get_buffer_device_address)]()[]
        self._get_buffer_opaque_capture_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferOpaqueCaptureAddress".unsafe_ptr()
        )).bitcast[__type_of(self._get_buffer_opaque_capture_address)]()[]
        self._get_device_memory_opaque_capture_address = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceMemoryOpaqueCaptureAddress".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_memory_opaque_capture_address)]()[]

    fn get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_buffer_device_address(device, Ptr(to=info))

    fn get_buffer_opaque_capture_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_buffer_opaque_capture_address(device, Ptr(to=info))

    fn get_device_memory_opaque_capture_address(
        self, device: Device, info: DeviceMemoryOpaqueCaptureAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_memory_opaque_capture_address(device, Ptr(to=info))


struct DeferredHostOperations(Copyable, Movable):
    var _create_deferred_operation_khr: fn(
        device: Device, pAllocator: Ptr[AllocationCallbacks], pDeferredOperation: Ptr[DeferredOperationKHR]
    ) -> Result
    var _destroy_deferred_operation_khr: fn(
        device: Device, operation: DeferredOperationKHR, pAllocator: Ptr[AllocationCallbacks]
    )
    var _get_deferred_operation_max_concurrency_khr: fn(
        device: Device, operation: DeferredOperationKHR
    ) -> UInt32
    var _get_deferred_operation_result_khr: fn(
        device: Device, operation: DeferredOperationKHR
    ) -> Result
    var _deferred_operation_join_khr: fn(
        device: Device, operation: DeferredOperationKHR
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_deferred_operation_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateDeferredOperationKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_deferred_operation_khr)]()[]
        self._destroy_deferred_operation_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDeferredOperationKHR".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_deferred_operation_khr)]()[]
        self._get_deferred_operation_max_concurrency_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeferredOperationMaxConcurrencyKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_deferred_operation_max_concurrency_khr)]()[]
        self._get_deferred_operation_result_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeferredOperationResultKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_deferred_operation_result_khr)]()[]
        self._deferred_operation_join_khr = Ptr(to=get_device_proc_addr(
            device, "vkDeferredOperationJoinKHR".unsafe_ptr()
        )).bitcast[__type_of(self._deferred_operation_join_khr)]()[]

    fn create_deferred_operation_khr(
        self,
        device: Device,
        p_allocator: Ptr[AllocationCallbacks],
        mut deferred_operation: DeferredOperationKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_deferred_operation_khr(device, p_allocator, Ptr(to=deferred_operation))

    fn destroy_deferred_operation_khr(
        self, device: Device, operation: DeferredOperationKHR, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_deferred_operation_khr(device, operation, p_allocator)

    fn get_deferred_operation_max_concurrency_khr(
        self, device: Device, operation: DeferredOperationKHR
    ) -> UInt32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_deferred_operation_max_concurrency_khr(device, operation)

    fn get_deferred_operation_result_khr(
        self, device: Device, operation: DeferredOperationKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_deferred_operation_result_khr(device, operation)

    fn deferred_operation_join_khr(self, device: Device, operation: DeferredOperationKHR) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._deferred_operation_join_khr(device, operation)


struct PipelineExecutableProperties(Copyable, Movable):
    var _get_pipeline_executable_properties_khr: fn(
        device: Device, pPipelineInfo: Ptr[PipelineInfoKHR], pExecutableCount: Ptr[UInt32], pProperties: Ptr[PipelineExecutablePropertiesKHR]
    ) -> Result
    var _get_pipeline_executable_statistics_khr: fn(
        device: Device, pExecutableInfo: Ptr[PipelineExecutableInfoKHR], pStatisticCount: Ptr[UInt32], pStatistics: Ptr[PipelineExecutableStatisticKHR]
    ) -> Result
    var _get_pipeline_executable_internal_representations_khr: fn(
        device: Device, pExecutableInfo: Ptr[PipelineExecutableInfoKHR], pInternalRepresentationCount: Ptr[UInt32], pInternalRepresentations: Ptr[PipelineExecutableInternalRepresentationKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_pipeline_executable_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineExecutablePropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_pipeline_executable_properties_khr)]()[]
        self._get_pipeline_executable_statistics_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineExecutableStatisticsKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_pipeline_executable_statistics_khr)]()[]
        self._get_pipeline_executable_internal_representations_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineExecutableInternalRepresentationsKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_pipeline_executable_internal_representations_khr)]()[]

    fn get_pipeline_executable_properties_khr(
        self,
        device: Device,
        pipeline_info: PipelineInfoKHR,
        mut executable_count: UInt32,
        p_properties: Ptr[PipelineExecutablePropertiesKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_pipeline_executable_properties_khr(
            device, Ptr(to=pipeline_info), Ptr(to=executable_count), p_properties
        )

    fn get_pipeline_executable_properties_khr(
        self, device: Device, pipeline_info: PipelineInfoKHR
    ) -> ListResult[PipelineExecutablePropertiesKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[PipelineExecutablePropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_pipeline_executable_properties_khr(
                device, pipeline_info, count, Ptr[PipelineExecutablePropertiesKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_pipeline_executable_properties_khr(
                    device, pipeline_info, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_pipeline_executable_statistics_khr(
        self,
        device: Device,
        executable_info: PipelineExecutableInfoKHR,
        mut statistic_count: UInt32,
        p_statistics: Ptr[PipelineExecutableStatisticKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_pipeline_executable_statistics_khr(
            device, Ptr(to=executable_info), Ptr(to=statistic_count), p_statistics
        )

    fn get_pipeline_executable_statistics_khr(
        self, device: Device, executable_info: PipelineExecutableInfoKHR
    ) -> ListResult[PipelineExecutableStatisticKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[PipelineExecutableStatisticKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_pipeline_executable_statistics_khr(
                device, executable_info, count, Ptr[PipelineExecutableStatisticKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_pipeline_executable_statistics_khr(
                    device, executable_info, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_pipeline_executable_internal_representations_khr(
        self,
        device: Device,
        executable_info: PipelineExecutableInfoKHR,
        mut internal_representation_count: UInt32,
        p_internal_representations: Ptr[PipelineExecutableInternalRepresentationKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_pipeline_executable_internal_representations_khr(
            device,
            Ptr(to=executable_info),
            Ptr(to=internal_representation_count),
            p_internal_representations,
        )

    fn get_pipeline_executable_internal_representations_khr(
        self, device: Device, executable_info: PipelineExecutableInfoKHR
    ) -> ListResult[PipelineExecutableInternalRepresentationKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[PipelineExecutableInternalRepresentationKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_pipeline_executable_internal_representations_khr(
                device, executable_info, count, Ptr[PipelineExecutableInternalRepresentationKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_pipeline_executable_internal_representations_khr(
                    device, executable_info, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)


struct MapMemory2(Copyable, Movable):
    var _map_memory_2: fn(
        device: Device, pMemoryMapInfo: Ptr[MemoryMapInfo], ppData: Ptr[Ptr[NoneType]]
    ) -> Result
    var _unmap_memory_2: fn(
        device: Device, pMemoryUnmapInfo: Ptr[MemoryUnmapInfo]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._map_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkMapMemory2".unsafe_ptr()
        )).bitcast[__type_of(self._map_memory_2)]()[]
        self._unmap_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkUnmapMemory2".unsafe_ptr()
        )).bitcast[__type_of(self._unmap_memory_2)]()[]

    fn map_memory_2(
        self, device: Device, memory_map_info: MemoryMapInfo, pp_data: Ptr[Ptr[NoneType]]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._map_memory_2(device, Ptr(to=memory_map_info), pp_data)

    fn unmap_memory_2(self, device: Device, memory_unmap_info: MemoryUnmapInfo) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._unmap_memory_2(device, Ptr(to=memory_unmap_info))


struct VideoEncodeQueue(Copyable, Movable):
    var _get_physical_device_video_encode_quality_level_properties_khr: fn(
        physicalDevice: PhysicalDevice, pQualityLevelInfo: Ptr[PhysicalDeviceVideoEncodeQualityLevelInfoKHR], pQualityLevelProperties: Ptr[VideoEncodeQualityLevelPropertiesKHR]
    ) -> Result
    var _get_encoded_video_session_parameters_khr: fn(
        device: Device, pVideoSessionParametersInfo: Ptr[VideoEncodeSessionParametersGetInfoKHR], pFeedbackInfo: Ptr[VideoEncodeSessionParametersFeedbackInfoKHR], pDataSize: Ptr[UInt], pData: Ptr[NoneType]
    ) -> Result
    var _cmd_encode_video_khr: fn(
        commandBuffer: CommandBuffer, pEncodeInfo: Ptr[VideoEncodeInfoKHR]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_video_encode_quality_level_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_video_encode_quality_level_properties_khr)]()[]
        self._get_encoded_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetEncodedVideoSessionParametersKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_encoded_video_session_parameters_khr)]()[]
        self._cmd_encode_video_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdEncodeVideoKHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_encode_video_khr)]()[]

    fn get_physical_device_video_encode_quality_level_properties_khr(
        self,
        physical_device: PhysicalDevice,
        quality_level_info: PhysicalDeviceVideoEncodeQualityLevelInfoKHR,
        mut quality_level_properties: VideoEncodeQualityLevelPropertiesKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_video_encode_quality_level_properties_khr(
            physical_device, Ptr(to=quality_level_info), Ptr(to=quality_level_properties)
        )

    fn get_encoded_video_session_parameters_khr(
        self,
        device: Device,
        video_session_parameters_info: VideoEncodeSessionParametersGetInfoKHR,
        p_feedback_info: Ptr[VideoEncodeSessionParametersFeedbackInfoKHR],
        mut data_size: UInt,
        p_data: Ptr[NoneType],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_encoded_video_session_parameters_khr(
            device,
            Ptr(to=video_session_parameters_info),
            p_feedback_info,
            Ptr(to=data_size),
            p_data,
        )

    fn get_encoded_video_session_parameters_khr(
        self,
        device: Device,
        video_session_parameters_info: VideoEncodeSessionParametersGetInfoKHR,
        p_feedback_info: Ptr[VideoEncodeSessionParametersFeedbackInfoKHR],
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_encoded_video_session_parameters_khr(
                device, video_session_parameters_info, p_feedback_info, count, Ptr[NoneType]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_encoded_video_session_parameters_khr(
                    device,
                    video_session_parameters_info,
                    p_feedback_info,
                    count,
                    list.unsafe_ptr().bitcast[NoneType](),
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn cmd_encode_video_khr(self, command_buffer: CommandBuffer, encode_info: VideoEncodeInfoKHR):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_encode_video_khr(command_buffer, Ptr(to=encode_info))


struct Synchronization2(Copyable, Movable):
    var _cmd_set_event_2: fn(
        commandBuffer: CommandBuffer, event: Event, pDependencyInfo: Ptr[DependencyInfo]
    )
    var _cmd_reset_event_2: fn(
        commandBuffer: CommandBuffer, event: Event, stageMask: PipelineStageFlags2
    )
    var _cmd_wait_events_2: fn(
        commandBuffer: CommandBuffer, eventCount: UInt32, pEvents: Ptr[Event], pDependencyInfos: Ptr[DependencyInfo]
    )
    var _cmd_pipeline_barrier_2: fn(
        commandBuffer: CommandBuffer, pDependencyInfo: Ptr[DependencyInfo]
    )
    var _cmd_write_timestamp_2: fn(
        commandBuffer: CommandBuffer, stage: PipelineStageFlags2, queryPool: QueryPool, query: UInt32
    )
    var _queue_submit_2: fn(
        queue: Queue, submitCount: UInt32, pSubmits: Ptr[SubmitInfo2], fence: Fence
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_event_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetEvent2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_event_2)]()[]
        self._cmd_reset_event_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdResetEvent2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_reset_event_2)]()[]
        self._cmd_wait_events_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdWaitEvents2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_wait_events_2)]()[]
        self._cmd_pipeline_barrier_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPipelineBarrier2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_pipeline_barrier_2)]()[]
        self._cmd_write_timestamp_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteTimestamp2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_write_timestamp_2)]()[]
        self._queue_submit_2 = Ptr(to=get_device_proc_addr(
            device, "vkQueueSubmit2".unsafe_ptr()
        )).bitcast[__type_of(self._queue_submit_2)]()[]

    fn cmd_set_event_2(
        self, command_buffer: CommandBuffer, event: Event, dependency_info: DependencyInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_event_2(command_buffer, event, Ptr(to=dependency_info))

    fn cmd_reset_event_2(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_reset_event_2(command_buffer, event, stage_mask)

    fn cmd_wait_events_2(
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event],
        p_dependency_infos: Ptr[DependencyInfo],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_wait_events_2(command_buffer, event_count, p_events, p_dependency_infos)

    fn cmd_pipeline_barrier_2(self, command_buffer: CommandBuffer, dependency_info: DependencyInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_write_timestamp_2(command_buffer, stage, query_pool, query)

    fn queue_submit_2(
        self, queue: Queue, submit_count: UInt32, p_submits: Ptr[SubmitInfo2], fence: Fence
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._queue_submit_2(queue, submit_count, p_submits, fence)


struct CopyCommands2(Copyable, Movable):
    var _cmd_copy_buffer_2: fn(
        commandBuffer: CommandBuffer, pCopyBufferInfo: Ptr[CopyBufferInfo2]
    )
    var _cmd_copy_image_2: fn(
        commandBuffer: CommandBuffer, pCopyImageInfo: Ptr[CopyImageInfo2]
    )
    var _cmd_copy_buffer_to_image_2: fn(
        commandBuffer: CommandBuffer, pCopyBufferToImageInfo: Ptr[CopyBufferToImageInfo2]
    )
    var _cmd_copy_image_to_buffer_2: fn(
        commandBuffer: CommandBuffer, pCopyImageToBufferInfo: Ptr[CopyImageToBufferInfo2]
    )
    var _cmd_blit_image_2: fn(
        commandBuffer: CommandBuffer, pBlitImageInfo: Ptr[BlitImageInfo2]
    )
    var _cmd_resolve_image_2: fn(
        commandBuffer: CommandBuffer, pResolveImageInfo: Ptr[ResolveImageInfo2]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_copy_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBuffer2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_buffer_2)]()[]
        self._cmd_copy_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImage2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_image_2)]()[]
        self._cmd_copy_buffer_to_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBufferToImage2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_buffer_to_image_2)]()[]
        self._cmd_copy_image_to_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImageToBuffer2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_image_to_buffer_2)]()[]
        self._cmd_blit_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBlitImage2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_blit_image_2)]()[]
        self._cmd_resolve_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdResolveImage2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_resolve_image_2)]()[]

    fn cmd_copy_buffer_2(self, command_buffer: CommandBuffer, copy_buffer_info: CopyBufferInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_buffer_2(command_buffer, Ptr(to=copy_buffer_info))

    fn cmd_copy_image_2(self, command_buffer: CommandBuffer, copy_image_info: CopyImageInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_image_2(command_buffer, Ptr(to=copy_image_info))

    fn cmd_copy_buffer_to_image_2(
        self, command_buffer: CommandBuffer, copy_buffer_to_image_info: CopyBufferToImageInfo2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_buffer_to_image_2(command_buffer, Ptr(to=copy_buffer_to_image_info))

    fn cmd_copy_image_to_buffer_2(
        self, command_buffer: CommandBuffer, copy_image_to_buffer_info: CopyImageToBufferInfo2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_image_to_buffer_2(command_buffer, Ptr(to=copy_image_to_buffer_info))

    fn cmd_blit_image_2(self, command_buffer: CommandBuffer, blit_image_info: BlitImageInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_blit_image_2(command_buffer, Ptr(to=blit_image_info))

    fn cmd_resolve_image_2(
        self, command_buffer: CommandBuffer, resolve_image_info: ResolveImageInfo2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_resolve_image_2(command_buffer, Ptr(to=resolve_image_info))


struct RayTracingMaintenance1(Copyable, Movable):
    var _cmd_trace_rays_indirect_2_khr: fn(
        commandBuffer: CommandBuffer, indirectDeviceAddress: DeviceAddress
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_trace_rays_indirect_2_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysIndirect2KHR".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_trace_rays_indirect_2_khr)]()[]

    fn cmd_trace_rays_indirect_2_khr(
        self, command_buffer: CommandBuffer, indirect_device_address: DeviceAddress
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_trace_rays_indirect_2_khr(command_buffer, indirect_device_address)


struct Maintenance4(Copyable, Movable):
    var _get_device_buffer_memory_requirements: fn(
        device: Device, pInfo: Ptr[DeviceBufferMemoryRequirements], pMemoryRequirements: Ptr[MemoryRequirements2]
    )
    var _get_device_image_memory_requirements: fn(
        device: Device, pInfo: Ptr[DeviceImageMemoryRequirements], pMemoryRequirements: Ptr[MemoryRequirements2]
    )
    var _get_device_image_sparse_memory_requirements: fn(
        device: Device, pInfo: Ptr[DeviceImageMemoryRequirements], pSparseMemoryRequirementCount: Ptr[UInt32], pSparseMemoryRequirements: Ptr[SparseImageMemoryRequirements2]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_device_buffer_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceBufferMemoryRequirements".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_buffer_memory_requirements)]()[]
        self._get_device_image_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageMemoryRequirements".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_image_memory_requirements)]()[]
        self._get_device_image_sparse_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageSparseMemoryRequirements".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_image_sparse_memory_requirements)]()[]

    fn get_device_buffer_memory_requirements(
        self,
        device: Device,
        info: DeviceBufferMemoryRequirements,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_image_memory_requirements(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn get_device_image_sparse_memory_requirements(
        self,
        device: Device,
        info: DeviceImageMemoryRequirements,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_image_sparse_memory_requirements(
            device,
            Ptr(to=info),
            Ptr(to=sparse_memory_requirement_count),
            p_sparse_memory_requirements,
        )

    fn get_device_image_sparse_memory_requirements(
        self, device: Device, info: DeviceImageMemoryRequirements
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self.get_device_image_sparse_memory_requirements(
            device, info, count, Ptr[SparseImageMemoryRequirements2]()
        )
        if count > 0:
            list.reserve(Int(count))
            self.get_device_image_sparse_memory_requirements(device, info, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^


struct Maintenance5(Copyable, Movable):
    var _cmd_bind_index_buffer_2: fn(
        commandBuffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, size: DeviceSize, indexType: IndexType
    )
    var _get_rendering_area_granularity: fn(
        device: Device, pRenderingAreaInfo: Ptr[RenderingAreaInfo], pGranularity: Ptr[Extent2D]
    )
    var _get_device_image_subresource_layout: fn(
        device: Device, pInfo: Ptr[DeviceImageSubresourceInfo], pLayout: Ptr[SubresourceLayout2]
    )
    var _get_image_subresource_layout_2: fn(
        device: Device, image: Image, pSubresource: Ptr[ImageSubresource2], pLayout: Ptr[SubresourceLayout2]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_index_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindIndexBuffer2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_index_buffer_2)]()[]
        self._get_rendering_area_granularity = Ptr(to=get_device_proc_addr(
            device, "vkGetRenderingAreaGranularity".unsafe_ptr()
        )).bitcast[__type_of(self._get_rendering_area_granularity)]()[]
        self._get_device_image_subresource_layout = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageSubresourceLayout".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_image_subresource_layout)]()[]
        self._get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout2".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_subresource_layout_2)]()[]

    fn cmd_bind_index_buffer_2(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        size: DeviceSize,
        index_type: IndexType,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_index_buffer_2(command_buffer, buffer, offset, size, index_type)

    fn get_rendering_area_granularity(
        self, device: Device, rendering_area_info: RenderingAreaInfo, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_rendering_area_granularity(
            device, Ptr(to=rendering_area_info), Ptr(to=granularity)
        )

    fn get_device_image_subresource_layout(
        self, device: Device, info: DeviceImageSubresourceInfo, mut layout: SubresourceLayout2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_subresource_layout_2(
            device, image, Ptr(to=subresource), Ptr(to=layout)
        )


struct PresentWait2(Copyable, Movable):
    var _wait_for_present_2_khr: fn(
        device: Device, swapchain: SwapchainKHR, pPresentWait2Info: Ptr[PresentWait2InfoKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._wait_for_present_2_khr = Ptr(to=get_device_proc_addr(
            device, "vkWaitForPresent2KHR".unsafe_ptr()
        )).bitcast[__type_of(self._wait_for_present_2_khr)]()[]

    fn wait_for_present_2_khr(
        self, device: Device, swapchain: SwapchainKHR, present_wait_2_info: PresentWait2InfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._wait_for_present_2_khr(device, swapchain, Ptr(to=present_wait_2_info))


struct PipelineBinary(Copyable, Movable):
    var _create_pipeline_binaries_khr: fn(
        device: Device, pCreateInfo: Ptr[PipelineBinaryCreateInfoKHR], pAllocator: Ptr[AllocationCallbacks], pBinaries: Ptr[PipelineBinaryHandlesInfoKHR]
    ) -> Result
    var _destroy_pipeline_binary_khr: fn(
        device: Device, pipelineBinary: PipelineBinaryKHR, pAllocator: Ptr[AllocationCallbacks]
    )
    var _get_pipeline_key_khr: fn(
        device: Device, pPipelineCreateInfo: Ptr[PipelineCreateInfoKHR], pPipelineKey: Ptr[PipelineBinaryKeyKHR]
    ) -> Result
    var _get_pipeline_binary_data_khr: fn(
        device: Device, pInfo: Ptr[PipelineBinaryDataInfoKHR], pPipelineBinaryKey: Ptr[PipelineBinaryKeyKHR], pPipelineBinaryDataSize: Ptr[UInt], pPipelineBinaryData: Ptr[NoneType]
    ) -> Result
    var _release_captured_pipeline_data_khr: fn(
        device: Device, pInfo: Ptr[ReleaseCapturedPipelineDataInfoKHR], pAllocator: Ptr[AllocationCallbacks]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_pipeline_binaries_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreatePipelineBinariesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._create_pipeline_binaries_khr)]()[]
        self._destroy_pipeline_binary_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPipelineBinaryKHR".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_pipeline_binary_khr)]()[]
        self._get_pipeline_key_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineKeyKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_pipeline_key_khr)]()[]
        self._get_pipeline_binary_data_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineBinaryDataKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_pipeline_binary_data_khr)]()[]
        self._release_captured_pipeline_data_khr = Ptr(to=get_device_proc_addr(
            device, "vkReleaseCapturedPipelineDataKHR".unsafe_ptr()
        )).bitcast[__type_of(self._release_captured_pipeline_data_khr)]()[]

    fn create_pipeline_binaries_khr(
        self,
        device: Device,
        create_info: PipelineBinaryCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
        mut binaries: PipelineBinaryHandlesInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_pipeline_binaries_khr(
            device, Ptr(to=create_info), p_allocator, Ptr(to=binaries)
        )

    fn destroy_pipeline_binary_khr(
        self,
        device: Device,
        pipeline_binary: PipelineBinaryKHR,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_pipeline_binary_khr(device, pipeline_binary, p_allocator)

    fn get_pipeline_key_khr(
        self,
        device: Device,
        p_pipeline_create_info: Ptr[PipelineCreateInfoKHR],
        mut pipeline_key: PipelineBinaryKeyKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_pipeline_key_khr(device, p_pipeline_create_info, Ptr(to=pipeline_key))

    fn get_pipeline_binary_data_khr(
        self,
        device: Device,
        info: PipelineBinaryDataInfoKHR,
        mut pipeline_binary_key: PipelineBinaryKeyKHR,
        mut pipeline_binary_data_size: UInt,
        p_pipeline_binary_data: Ptr[NoneType],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_pipeline_binary_data_khr(
            device,
            Ptr(to=info),
            Ptr(to=pipeline_binary_key),
            Ptr(to=pipeline_binary_data_size),
            p_pipeline_binary_data,
        )

    fn get_pipeline_binary_data_khr(
        self,
        device: Device,
        info: PipelineBinaryDataInfoKHR,
        mut pipeline_binary_key: PipelineBinaryKeyKHR,
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_pipeline_binary_data_khr(
                device, info, pipeline_binary_key, count, Ptr[NoneType]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_pipeline_binary_data_khr(
                    device, info, pipeline_binary_key, count, list.unsafe_ptr().bitcast[NoneType]()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn release_captured_pipeline_data_khr(
        self,
        device: Device,
        info: ReleaseCapturedPipelineDataInfoKHR,
        p_allocator: Ptr[AllocationCallbacks],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._release_captured_pipeline_data_khr(device, Ptr(to=info), p_allocator)


struct SwapchainMaintenance1(Copyable, Movable):
    var _release_swapchain_images_khr: fn(
        device: Device, pReleaseInfo: Ptr[ReleaseSwapchainImagesInfoKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._release_swapchain_images_khr = Ptr(to=get_device_proc_addr(
            device, "vkReleaseSwapchainImagesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._release_swapchain_images_khr)]()[]

    fn release_swapchain_images_khr(
        self, device: Device, release_info: ReleaseSwapchainImagesInfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._release_swapchain_images_khr(device, Ptr(to=release_info))


struct CooperativeMatrix(Copyable, Movable):
    var _get_physical_device_cooperative_matrix_properties_khr: fn(
        physicalDevice: PhysicalDevice, pPropertyCount: Ptr[UInt32], pProperties: Ptr[CooperativeMatrixPropertiesKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_matrix_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_cooperative_matrix_properties_khr)]()[]

    fn get_physical_device_cooperative_matrix_properties_khr(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixPropertiesKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_cooperative_matrix_properties_khr(
            physical_device, Ptr(to=property_count), p_properties
        )

    fn get_physical_device_cooperative_matrix_properties_khr(
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeMatrixPropertiesKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[CooperativeMatrixPropertiesKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_cooperative_matrix_properties_khr(
                physical_device, count, Ptr[CooperativeMatrixPropertiesKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_cooperative_matrix_properties_khr(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)


struct LineRasterization(Copyable, Movable):
    var _cmd_set_line_stipple: fn(
        commandBuffer: CommandBuffer, lineStippleFactor: UInt32, lineStipplePattern: UInt16
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_line_stipple = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStipple".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_line_stipple)]()[]

    fn cmd_set_line_stipple(
        self,
        command_buffer: CommandBuffer,
        line_stipple_factor: UInt32,
        line_stipple_pattern: UInt16,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_line_stipple(command_buffer, line_stipple_factor, line_stipple_pattern)


struct CalibratedTimestamps(Copyable, Movable):
    var _get_physical_device_calibrateable_time_domains_khr: fn(
        physicalDevice: PhysicalDevice, pTimeDomainCount: Ptr[UInt32], pTimeDomains: Ptr[TimeDomainKHR]
    ) -> Result
    var _get_calibrated_timestamps_khr: fn(
        device: Device, timestampCount: UInt32, pTimestampInfos: Ptr[CalibratedTimestampInfoKHR], pTimestamps: Ptr[UInt64], pMaxDeviation: Ptr[UInt64]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_calibrateable_time_domains_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_calibrateable_time_domains_khr)]()[]
        self._get_calibrated_timestamps_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetCalibratedTimestampsKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_calibrated_timestamps_khr)]()[]

    fn get_physical_device_calibrateable_time_domains_khr(
        self,
        physical_device: PhysicalDevice,
        mut time_domain_count: UInt32,
        p_time_domains: Ptr[TimeDomainKHR],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_calibrateable_time_domains_khr(
            physical_device, Ptr(to=time_domain_count), p_time_domains
        )

    fn get_physical_device_calibrateable_time_domains_khr(
        self, physical_device: PhysicalDevice
    ) -> ListResult[TimeDomainKHR]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[TimeDomainKHR]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_calibrateable_time_domains_khr(
                physical_device, count, Ptr[TimeDomainKHR]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_calibrateable_time_domains_khr(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_calibrated_timestamps_khr(
        self,
        device: Device,
        timestamp_count: UInt32,
        p_timestamp_infos: Ptr[CalibratedTimestampInfoKHR],
        p_timestamps: Ptr[UInt64],
        mut max_deviation: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_calibrated_timestamps_khr(
            device, timestamp_count, p_timestamp_infos, p_timestamps, Ptr(to=max_deviation)
        )


struct Maintenance6(Copyable, Movable):
    var _cmd_bind_descriptor_sets_2: fn(
        commandBuffer: CommandBuffer, pBindDescriptorSetsInfo: Ptr[BindDescriptorSetsInfo]
    )
    var _cmd_push_constants_2: fn(
        commandBuffer: CommandBuffer, pPushConstantsInfo: Ptr[PushConstantsInfo]
    )
    var _cmd_push_descriptor_set_2: fn(
        commandBuffer: CommandBuffer, pPushDescriptorSetInfo: Ptr[PushDescriptorSetInfo]
    )
    var _cmd_push_descriptor_set_with_template_2: fn(
        commandBuffer: CommandBuffer, pPushDescriptorSetWithTemplateInfo: Ptr[PushDescriptorSetWithTemplateInfo]
    )
    var _cmd_set_descriptor_buffer_offsets_2_ext: fn(
        commandBuffer: CommandBuffer, pSetDescriptorBufferOffsetsInfo: Ptr[SetDescriptorBufferOffsetsInfoEXT]
    )
    var _cmd_bind_descriptor_buffer_embedded_samplers_2_ext: fn(
        commandBuffer: CommandBuffer, pBindDescriptorBufferEmbeddedSamplersInfo: Ptr[BindDescriptorBufferEmbeddedSamplersInfoEXT]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_descriptor_sets_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorSets2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_descriptor_sets_2)]()[]
        self._cmd_push_constants_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushConstants2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_push_constants_2)]()[]
        self._cmd_push_descriptor_set_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSet2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_push_descriptor_set_2)]()[]
        self._cmd_push_descriptor_set_with_template_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSetWithTemplate2".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_push_descriptor_set_with_template_2)]()[]
        self._cmd_set_descriptor_buffer_offsets_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDescriptorBufferOffsets2EXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_descriptor_buffer_offsets_2_ext)]()[]
        self._cmd_bind_descriptor_buffer_embedded_samplers_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorBufferEmbeddedSamplers2EXT".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_descriptor_buffer_embedded_samplers_2_ext)]()[]

    fn cmd_bind_descriptor_sets_2(
        self, command_buffer: CommandBuffer, bind_descriptor_sets_info: BindDescriptorSetsInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_descriptor_sets_2(command_buffer, Ptr(to=bind_descriptor_sets_info))

    fn cmd_push_constants_2(
        self, command_buffer: CommandBuffer, push_constants_info: PushConstantsInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_push_constants_2(command_buffer, Ptr(to=push_constants_info))

    fn cmd_push_descriptor_set_2(
        self, command_buffer: CommandBuffer, push_descriptor_set_info: PushDescriptorSetInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_push_descriptor_set_2(command_buffer, Ptr(to=push_descriptor_set_info))

    fn cmd_push_descriptor_set_with_template_2(
        self,
        command_buffer: CommandBuffer,
        push_descriptor_set_with_template_info: PushDescriptorSetWithTemplateInfo,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_push_descriptor_set_with_template_2(
            command_buffer, Ptr(to=push_descriptor_set_with_template_info)
        )

    fn cmd_set_descriptor_buffer_offsets_2_ext(
        self,
        command_buffer: CommandBuffer,
        set_descriptor_buffer_offsets_info: SetDescriptorBufferOffsetsInfoEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_descriptor_buffer_offsets_2_ext(
            command_buffer, Ptr(to=set_descriptor_buffer_offsets_info)
        )

    fn cmd_bind_descriptor_buffer_embedded_samplers_2_ext(
        self,
        command_buffer: CommandBuffer,
        bind_descriptor_buffer_embedded_samplers_info: BindDescriptorBufferEmbeddedSamplersInfoEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_descriptor_buffer_embedded_samplers_2_ext(
            command_buffer, Ptr(to=bind_descriptor_buffer_embedded_samplers_info)
        )
