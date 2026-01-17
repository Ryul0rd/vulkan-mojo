from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct Surface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _destroy_surface_khr: fn(
        instance: Instance, surface: SurfaceKHR, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _get_physical_device_surface_support_khr: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        surface: SurfaceKHR,
        p_supported: Ptr[Bool32, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_surface_capabilities_khr: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_surface_capabilities: Ptr[SurfaceCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_surface_formats_khr: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_surface_format_count: Ptr[UInt32, MutAnyOrigin],
        p_surface_formats: Ptr[SurfaceFormatKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_surface_present_modes_khr: fn(
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
        self._destroy_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroySurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_surface_khr)]()[]
        self._get_physical_device_surface_support_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceSupportKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_support_khr)]()[]
        self._get_physical_device_surface_capabilities_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_capabilities_khr)]()[]
        self._get_physical_device_surface_formats_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceFormatsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_formats_khr)]()[]
        self._get_physical_device_surface_present_modes_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfacePresentModesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_present_modes_khr)]()[]

    fn destroy_surface_khr(
        self,
        instance: Instance,
        surface: SurfaceKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySurfaceKHR.html
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceSupportKHR.html
        """
        return self._get_physical_device_surface_support_khr(
            physical_device, queue_family_index, surface, Ptr(to=supported).bitcast[Bool32]()
        )

    fn get_physical_device_surface_capabilities_khr(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_capabilities: SurfaceCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceCapabilitiesKHR.html
        """
        return self._get_physical_device_surface_capabilities_khr(
            physical_device, surface, Ptr(to=surface_capabilities).bitcast[SurfaceCapabilitiesKHR]()
        )

    fn get_physical_device_surface_formats_khr(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_format_count: UInt32,
        p_surface_formats: Ptr[SurfaceFormatKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceFormatsKHR.html
        """
        return self._get_physical_device_surface_formats_khr(
            physical_device, surface, Ptr(to=surface_format_count).bitcast[UInt32](), p_surface_formats
        )

    fn get_physical_device_surface_present_modes_khr(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut present_mode_count: UInt32,
        p_present_modes: Ptr[PresentModeKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfacePresentModesKHR.html
        """
        return self._get_physical_device_surface_present_modes_khr(
            physical_device, surface, Ptr(to=present_mode_count).bitcast[UInt32](), p_present_modes
        )


struct Swapchain(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_swapchain_khr: fn(
        device: Device,
        p_create_info: Ptr[SwapchainCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_swapchain: Ptr[SwapchainKHR, MutAnyOrigin],
    ) -> Result
    var _destroy_swapchain_khr: fn(
        device: Device, swapchain: SwapchainKHR, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _get_swapchain_images_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_swapchain_image_count: Ptr[UInt32, MutAnyOrigin],
        p_swapchain_images: Ptr[Image, MutAnyOrigin],
    ) -> Result
    var _acquire_next_image_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        timeout: UInt64,
        semaphore: Semaphore,
        fence: Fence,
        p_image_index: Ptr[UInt32, MutAnyOrigin],
    ) -> Result
    var _queue_present_khr: fn(
        queue: Queue, p_present_info: Ptr[PresentInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _get_device_group_present_capabilities_khr: fn(
        device: Device,
        p_device_group_present_capabilities: Ptr[DeviceGroupPresentCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_device_group_surface_present_modes_khr: fn(
        device: Device, surface: SurfaceKHR, p_modes: Ptr[DeviceGroupPresentModeFlagsKHR, MutAnyOrigin]
    ) -> Result
    var _get_physical_device_present_rectangles_khr: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_rect_count: Ptr[UInt32, MutAnyOrigin],
        p_rects: Ptr[Rect2D, MutAnyOrigin],
    ) -> Result
    var _acquire_next_image_2_khr: fn(
        device: Device,
        p_acquire_info: Ptr[AcquireNextImageInfoKHR, ImmutAnyOrigin],
        p_image_index: Ptr[UInt32, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_swapchain_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateSwapchainKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_swapchain_khr)]()[]
        self._destroy_swapchain_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroySwapchainKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_swapchain_khr)]()[]
        self._get_swapchain_images_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainImagesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_swapchain_images_khr)]()[]
        self._acquire_next_image_khr = Ptr(to=get_device_proc_addr(
            device, "vkAcquireNextImageKHR".as_c_string_slice()
        )).bitcast[type_of(self._acquire_next_image_khr)]()[]
        self._queue_present_khr = Ptr(to=get_device_proc_addr(
            device, "vkQueuePresentKHR".as_c_string_slice()
        )).bitcast[type_of(self._queue_present_khr)]()[]
        self._get_device_group_present_capabilities_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupPresentCapabilitiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_present_capabilities_khr)]()[]
        self._get_device_group_surface_present_modes_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupSurfacePresentModesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_surface_present_modes_khr)]()[]
        self._get_physical_device_present_rectangles_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDevicePresentRectanglesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_present_rectangles_khr)]()[]
        self._acquire_next_image_2_khr = Ptr(to=get_device_proc_addr(
            device, "vkAcquireNextImage2KHR".as_c_string_slice()
        )).bitcast[type_of(self._acquire_next_image_2_khr)]()[]

    fn create_swapchain_khr(
        self,
        device: Device,
        create_info: SwapchainCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut swapchain: SwapchainKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSwapchainKHR.html
        """
        return self._create_swapchain_khr(
            device,
            Ptr(to=create_info).bitcast[SwapchainCreateInfoKHR](),
            p_allocator,
            Ptr(to=swapchain).bitcast[SwapchainKHR](),
        )

    fn destroy_swapchain_khr(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySwapchainKHR.html
        """
        return self._destroy_swapchain_khr(device, swapchain, p_allocator)

    fn get_swapchain_images_khr(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut swapchain_image_count: UInt32,
        p_swapchain_images: Ptr[Image, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainImagesKHR.html
        """
        return self._get_swapchain_images_khr(
            device, swapchain, Ptr(to=swapchain_image_count).bitcast[UInt32](), p_swapchain_images
        )

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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireNextImageKHR.html
        """
        return self._acquire_next_image_khr(
            device, swapchain, timeout, semaphore, fence, Ptr(to=image_index).bitcast[UInt32]()
        )

    fn queue_present_khr(self, queue: Queue, present_info: PresentInfoKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueuePresentKHR.html
        """
        return self._queue_present_khr(queue, Ptr(to=present_info).bitcast[PresentInfoKHR]())

    fn get_device_group_present_capabilities_khr(
        self,
        device: Device,
        mut device_group_present_capabilities: DeviceGroupPresentCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupPresentCapabilitiesKHR.html
        """
        return self._get_device_group_present_capabilities_khr(
            device, Ptr(to=device_group_present_capabilities).bitcast[DeviceGroupPresentCapabilitiesKHR]()
        )

    fn get_device_group_surface_present_modes_khr(
        self, device: Device, surface: SurfaceKHR, mut modes: DeviceGroupPresentModeFlagsKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupSurfacePresentModesKHR.html
        """
        return self._get_device_group_surface_present_modes_khr(
            device, surface, Ptr(to=modes).bitcast[DeviceGroupPresentModeFlagsKHR]()
        )

    fn get_physical_device_present_rectangles_khr(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut rect_count: UInt32,
        p_rects: Ptr[Rect2D, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDevicePresentRectanglesKHR.html
        """
        return self._get_physical_device_present_rectangles_khr(
            physical_device, surface, Ptr(to=rect_count).bitcast[UInt32](), p_rects
        )

    fn acquire_next_image_2_khr(
        self, device: Device, acquire_info: AcquireNextImageInfoKHR, mut image_index: UInt32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireNextImage2KHR.html
        """
        return self._acquire_next_image_2_khr(
            device,
            Ptr(to=acquire_info).bitcast[AcquireNextImageInfoKHR](),
            Ptr(to=image_index).bitcast[UInt32](),
        )


struct Display(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_display_properties_khr: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayPropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_display_plane_properties_khr: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayPlanePropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_display_plane_supported_displays_khr: fn(
        physical_device: PhysicalDevice,
        plane_index: UInt32,
        p_display_count: Ptr[UInt32, MutAnyOrigin],
        p_displays: Ptr[DisplayKHR, MutAnyOrigin],
    ) -> Result
    var _get_display_mode_properties_khr: fn(
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayModePropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _create_display_mode_khr: fn(
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        p_create_info: Ptr[DisplayModeCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_mode: Ptr[DisplayModeKHR, MutAnyOrigin],
    ) -> Result
    var _get_display_plane_capabilities_khr: fn(
        physical_device: PhysicalDevice,
        mode: DisplayModeKHR,
        plane_index: UInt32,
        p_capabilities: Ptr[DisplayPlaneCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _create_display_plane_surface_khr: fn(
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
        self._get_physical_device_display_properties_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_display_properties_khr)]()[]
        self._get_physical_device_display_plane_properties_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayPlanePropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_display_plane_properties_khr)]()[]
        self._get_display_plane_supported_displays_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayPlaneSupportedDisplaysKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_display_plane_supported_displays_khr)]()[]
        self._get_display_mode_properties_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayModePropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_display_mode_properties_khr)]()[]
        self._create_display_mode_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDisplayModeKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_display_mode_khr)]()[]
        self._get_display_plane_capabilities_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayPlaneCapabilitiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_display_plane_capabilities_khr)]()[]
        self._create_display_plane_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDisplayPlaneSurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_display_plane_surface_khr)]()[]

    fn get_physical_device_display_properties_khr(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayPropertiesKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayPropertiesKHR.html
        """
        return self._get_physical_device_display_properties_khr(
            physical_device, Ptr(to=property_count).bitcast[UInt32](), p_properties
        )

    fn get_physical_device_display_plane_properties_khr(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayPlanePropertiesKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayPlanePropertiesKHR.html
        """
        return self._get_physical_device_display_plane_properties_khr(
            physical_device, Ptr(to=property_count).bitcast[UInt32](), p_properties
        )

    fn get_display_plane_supported_displays_khr(
        self,
        physical_device: PhysicalDevice,
        plane_index: UInt32,
        mut display_count: UInt32,
        p_displays: Ptr[DisplayKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayPlaneSupportedDisplaysKHR.html
        """
        return self._get_display_plane_supported_displays_khr(
            physical_device, plane_index, Ptr(to=display_count).bitcast[UInt32](), p_displays
        )

    fn get_display_mode_properties_khr(
        self,
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayModePropertiesKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayModePropertiesKHR.html
        """
        return self._get_display_mode_properties_khr(
            physical_device, display, Ptr(to=property_count).bitcast[UInt32](), p_properties
        )

    fn create_display_mode_khr(
        self,
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        create_info: DisplayModeCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut mode: DisplayModeKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDisplayModeKHR.html
        """
        return self._create_display_mode_khr(
            physical_device,
            display,
            Ptr(to=create_info).bitcast[DisplayModeCreateInfoKHR](),
            p_allocator,
            Ptr(to=mode).bitcast[DisplayModeKHR](),
        )

    fn get_display_plane_capabilities_khr(
        self,
        physical_device: PhysicalDevice,
        mode: DisplayModeKHR,
        plane_index: UInt32,
        mut capabilities: DisplayPlaneCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayPlaneCapabilitiesKHR.html
        """
        return self._get_display_plane_capabilities_khr(
            physical_device, mode, plane_index, Ptr(to=capabilities).bitcast[DisplayPlaneCapabilitiesKHR]()
        )

    fn create_display_plane_surface_khr(
        self,
        instance: Instance,
        create_info: DisplaySurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDisplayPlaneSurfaceKHR.html
        """
        return self._create_display_plane_surface_khr(
            instance,
            Ptr(to=create_info).bitcast[DisplaySurfaceCreateInfoKHR](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )


struct DisplaySwapchain(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_shared_swapchains_khr: fn(
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
        self._create_shared_swapchains_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateSharedSwapchainsKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_shared_swapchains_khr)]()[]

    fn create_shared_swapchains_khr(
        self,
        device: Device,
        swapchain_count: UInt32,
        p_create_infos: Ptr[SwapchainCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_swapchains: Ptr[SwapchainKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSharedSwapchainsKHR.html
        """
        return self._create_shared_swapchains_khr(
            device, swapchain_count, p_create_infos, p_allocator, p_swapchains
        )


struct XlibSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_xlib_surface_khr: fn(
        instance: Instance,
        p_create_info: Ptr[XlibSurfaceCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_xlib_presentation_support_khr: fn(
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
        self._create_xlib_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateXlibSurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_xlib_surface_khr)]()[]
        self._get_physical_device_xlib_presentation_support_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceXlibPresentationSupportKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_xlib_presentation_support_khr)]()[]

    fn create_xlib_surface_khr(
        self,
        instance: Instance,
        create_info: XlibSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateXlibSurfaceKHR.html
        """
        return self._create_xlib_surface_khr(
            instance,
            Ptr(to=create_info).bitcast[XlibSurfaceCreateInfoKHR](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

    fn get_physical_device_xlib_presentation_support_khr(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut dpy: Display,
        visual_id: VisualID,
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceXlibPresentationSupportKHR.html
        """
        return self._get_physical_device_xlib_presentation_support_khr(
            physical_device, queue_family_index, Ptr(to=dpy).bitcast[Display](), visual_id
        )


struct XcbSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_xcb_surface_khr: fn(
        instance: Instance,
        p_create_info: Ptr[XcbSurfaceCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_xcb_presentation_support_khr: fn(
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
        self._create_xcb_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateXcbSurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_xcb_surface_khr)]()[]
        self._get_physical_device_xcb_presentation_support_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceXcbPresentationSupportKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_xcb_presentation_support_khr)]()[]

    fn create_xcb_surface_khr(
        self,
        instance: Instance,
        create_info: XcbSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateXcbSurfaceKHR.html
        """
        return self._create_xcb_surface_khr(
            instance,
            Ptr(to=create_info).bitcast[XcbSurfaceCreateInfoKHR](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

    fn get_physical_device_xcb_presentation_support_khr(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut connection: xcb_connection_t,
        visual_id: xcb_visualid_t,
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceXcbPresentationSupportKHR.html
        """
        return self._get_physical_device_xcb_presentation_support_khr(
            physical_device, queue_family_index, Ptr(to=connection).bitcast[xcb_connection_t](), visual_id
        )


struct WaylandSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_wayland_surface_khr: fn(
        instance: Instance,
        p_create_info: Ptr[WaylandSurfaceCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_wayland_presentation_support_khr: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        display: Ptr[wl_display, MutAnyOrigin],
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_wayland_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateWaylandSurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_wayland_surface_khr)]()[]
        self._get_physical_device_wayland_presentation_support_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceWaylandPresentationSupportKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_wayland_presentation_support_khr)]()[]

    fn create_wayland_surface_khr(
        self,
        instance: Instance,
        create_info: WaylandSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateWaylandSurfaceKHR.html
        """
        return self._create_wayland_surface_khr(
            instance,
            Ptr(to=create_info).bitcast[WaylandSurfaceCreateInfoKHR](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

    fn get_physical_device_wayland_presentation_support_khr(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32, mut display: wl_display
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceWaylandPresentationSupportKHR.html
        """
        return self._get_physical_device_wayland_presentation_support_khr(
            physical_device, queue_family_index, Ptr(to=display).bitcast[wl_display]()
        )


struct AndroidSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_android_surface_khr: fn(
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
        self._create_android_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateAndroidSurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_android_surface_khr)]()[]

    fn create_android_surface_khr(
        self,
        instance: Instance,
        create_info: AndroidSurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateAndroidSurfaceKHR.html
        """
        return self._create_android_surface_khr(
            instance,
            Ptr(to=create_info).bitcast[AndroidSurfaceCreateInfoKHR](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )


struct Win32Surface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_win_32_surface_khr: fn(
        instance: Instance,
        p_create_info: Ptr[Win32SurfaceCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_win_32_presentation_support_khr: fn(
        physical_device: PhysicalDevice, queue_family_index: UInt32
    ) -> Bool32

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_win_32_surface_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateWin32SurfaceKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_win_32_surface_khr)]()[]
        self._get_physical_device_win_32_presentation_support_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceWin32PresentationSupportKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_win_32_presentation_support_khr)]()[]

    fn create_win_32_surface_khr(
        self,
        instance: Instance,
        create_info: Win32SurfaceCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateWin32SurfaceKHR.html
        """
        return self._create_win_32_surface_khr(
            instance,
            Ptr(to=create_info).bitcast[Win32SurfaceCreateInfoKHR](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

    fn get_physical_device_win_32_presentation_support_khr(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceWin32PresentationSupportKHR.html
        """
        return self._get_physical_device_win_32_presentation_support_khr(
            physical_device, queue_family_index
        )


struct VideoQueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_video_capabilities_khr: fn(
        physical_device: PhysicalDevice,
        p_video_profile: Ptr[VideoProfileInfoKHR, ImmutAnyOrigin],
        p_capabilities: Ptr[VideoCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_video_format_properties_khr: fn(
        physical_device: PhysicalDevice,
        p_video_format_info: Ptr[PhysicalDeviceVideoFormatInfoKHR, ImmutAnyOrigin],
        p_video_format_property_count: Ptr[UInt32, MutAnyOrigin],
        p_video_format_properties: Ptr[VideoFormatPropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _create_video_session_khr: fn(
        device: Device,
        p_create_info: Ptr[VideoSessionCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_video_session: Ptr[VideoSessionKHR, MutAnyOrigin],
    ) -> Result
    var _destroy_video_session_khr: fn(
        device: Device,
        video_session: VideoSessionKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_video_session_memory_requirements_khr: fn(
        device: Device,
        video_session: VideoSessionKHR,
        p_memory_requirements_count: Ptr[UInt32, MutAnyOrigin],
        p_memory_requirements: Ptr[VideoSessionMemoryRequirementsKHR, MutAnyOrigin],
    ) -> Result
    var _bind_video_session_memory_khr: fn(
        device: Device,
        video_session: VideoSessionKHR,
        bind_session_memory_info_count: UInt32,
        p_bind_session_memory_infos: Ptr[BindVideoSessionMemoryInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _create_video_session_parameters_khr: fn(
        device: Device,
        p_create_info: Ptr[VideoSessionParametersCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_video_session_parameters: Ptr[VideoSessionParametersKHR, MutAnyOrigin],
    ) -> Result
    var _update_video_session_parameters_khr: fn(
        device: Device,
        video_session_parameters: VideoSessionParametersKHR,
        p_update_info: Ptr[VideoSessionParametersUpdateInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _destroy_video_session_parameters_khr: fn(
        device: Device,
        video_session_parameters: VideoSessionParametersKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _cmd_begin_video_coding_khr: fn(
        command_buffer: CommandBuffer, p_begin_info: Ptr[VideoBeginCodingInfoKHR, ImmutAnyOrigin]
    )
    var _cmd_end_video_coding_khr: fn(
        command_buffer: CommandBuffer, p_end_coding_info: Ptr[VideoEndCodingInfoKHR, ImmutAnyOrigin]
    )
    var _cmd_control_video_coding_khr: fn(
        command_buffer: CommandBuffer,
        p_coding_control_info: Ptr[VideoCodingControlInfoKHR, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_video_capabilities_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceVideoCapabilitiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_video_capabilities_khr)]()[]
        self._get_physical_device_video_format_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceVideoFormatPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_video_format_properties_khr)]()[]
        self._create_video_session_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateVideoSessionKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_video_session_khr)]()[]
        self._destroy_video_session_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroyVideoSessionKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_video_session_khr)]()[]
        self._get_video_session_memory_requirements_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetVideoSessionMemoryRequirementsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_video_session_memory_requirements_khr)]()[]
        self._bind_video_session_memory_khr = Ptr(to=get_device_proc_addr(
            device, "vkBindVideoSessionMemoryKHR".as_c_string_slice()
        )).bitcast[type_of(self._bind_video_session_memory_khr)]()[]
        self._create_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateVideoSessionParametersKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_video_session_parameters_khr)]()[]
        self._update_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
            device, "vkUpdateVideoSessionParametersKHR".as_c_string_slice()
        )).bitcast[type_of(self._update_video_session_parameters_khr)]()[]
        self._destroy_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroyVideoSessionParametersKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_video_session_parameters_khr)]()[]
        self._cmd_begin_video_coding_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginVideoCodingKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_video_coding_khr)]()[]
        self._cmd_end_video_coding_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndVideoCodingKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_video_coding_khr)]()[]
        self._cmd_control_video_coding_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdControlVideoCodingKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_control_video_coding_khr)]()[]

    fn get_physical_device_video_capabilities_khr(
        self,
        physical_device: PhysicalDevice,
        video_profile: VideoProfileInfoKHR,
        mut capabilities: VideoCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceVideoCapabilitiesKHR.html
        """
        return self._get_physical_device_video_capabilities_khr(
            physical_device,
            Ptr(to=video_profile).bitcast[VideoProfileInfoKHR](),
            Ptr(to=capabilities).bitcast[VideoCapabilitiesKHR](),
        )

    fn get_physical_device_video_format_properties_khr(
        self,
        physical_device: PhysicalDevice,
        video_format_info: PhysicalDeviceVideoFormatInfoKHR,
        mut video_format_property_count: UInt32,
        p_video_format_properties: Ptr[VideoFormatPropertiesKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceVideoFormatPropertiesKHR.html
        """
        return self._get_physical_device_video_format_properties_khr(
            physical_device,
            Ptr(to=video_format_info).bitcast[PhysicalDeviceVideoFormatInfoKHR](),
            Ptr(to=video_format_property_count).bitcast[UInt32](),
            p_video_format_properties,
        )

    fn create_video_session_khr(
        self,
        device: Device,
        create_info: VideoSessionCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut video_session: VideoSessionKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateVideoSessionKHR.html
        """
        return self._create_video_session_khr(
            device,
            Ptr(to=create_info).bitcast[VideoSessionCreateInfoKHR](),
            p_allocator,
            Ptr(to=video_session).bitcast[VideoSessionKHR](),
        )

    fn destroy_video_session_khr(
        self,
        device: Device,
        video_session: VideoSessionKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyVideoSessionKHR.html
        """
        return self._destroy_video_session_khr(device, video_session, p_allocator)

    fn get_video_session_memory_requirements_khr(
        self,
        device: Device,
        video_session: VideoSessionKHR,
        mut memory_requirements_count: UInt32,
        p_memory_requirements: Ptr[VideoSessionMemoryRequirementsKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetVideoSessionMemoryRequirementsKHR.html
        """
        return self._get_video_session_memory_requirements_khr(
            device,
            video_session,
            Ptr(to=memory_requirements_count).bitcast[UInt32](),
            p_memory_requirements,
        )

    fn bind_video_session_memory_khr(
        self,
        device: Device,
        video_session: VideoSessionKHR,
        bind_session_memory_info_count: UInt32,
        p_bind_session_memory_infos: Ptr[BindVideoSessionMemoryInfoKHR, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindVideoSessionMemoryKHR.html
        """
        return self._bind_video_session_memory_khr(
            device, video_session, bind_session_memory_info_count, p_bind_session_memory_infos
        )

    fn create_video_session_parameters_khr(
        self,
        device: Device,
        create_info: VideoSessionParametersCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut video_session_parameters: VideoSessionParametersKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateVideoSessionParametersKHR.html
        """
        return self._create_video_session_parameters_khr(
            device,
            Ptr(to=create_info).bitcast[VideoSessionParametersCreateInfoKHR](),
            p_allocator,
            Ptr(to=video_session_parameters).bitcast[VideoSessionParametersKHR](),
        )

    fn update_video_session_parameters_khr(
        self,
        device: Device,
        video_session_parameters: VideoSessionParametersKHR,
        update_info: VideoSessionParametersUpdateInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateVideoSessionParametersKHR.html
        """
        return self._update_video_session_parameters_khr(
            device,
            video_session_parameters,
            Ptr(to=update_info).bitcast[VideoSessionParametersUpdateInfoKHR](),
        )

    fn destroy_video_session_parameters_khr(
        self,
        device: Device,
        video_session_parameters: VideoSessionParametersKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyVideoSessionParametersKHR.html
        """
        return self._destroy_video_session_parameters_khr(device, video_session_parameters, p_allocator)

    fn cmd_begin_video_coding_khr(
        self, command_buffer: CommandBuffer, begin_info: VideoBeginCodingInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginVideoCodingKHR.html
        """
        return self._cmd_begin_video_coding_khr(
            command_buffer, Ptr(to=begin_info).bitcast[VideoBeginCodingInfoKHR]()
        )

    fn cmd_end_video_coding_khr(
        self, command_buffer: CommandBuffer, end_coding_info: VideoEndCodingInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndVideoCodingKHR.html
        """
        return self._cmd_end_video_coding_khr(
            command_buffer, Ptr(to=end_coding_info).bitcast[VideoEndCodingInfoKHR]()
        )

    fn cmd_control_video_coding_khr(
        self, command_buffer: CommandBuffer, coding_control_info: VideoCodingControlInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdControlVideoCodingKHR.html
        """
        return self._cmd_control_video_coding_khr(
            command_buffer, Ptr(to=coding_control_info).bitcast[VideoCodingControlInfoKHR]()
        )


struct VideoDecodeQueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_decode_video_khr: fn(
        command_buffer: CommandBuffer, p_decode_info: Ptr[VideoDecodeInfoKHR, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_decode_video_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecodeVideoKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_decode_video_khr)]()[]

    fn cmd_decode_video_khr(self, command_buffer: CommandBuffer, decode_info: VideoDecodeInfoKHR):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecodeVideoKHR.html
        """
        return self._cmd_decode_video_khr(command_buffer, Ptr(to=decode_info).bitcast[VideoDecodeInfoKHR]())


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
        return self._cmd_begin_rendering(command_buffer, Ptr(to=rendering_info).bitcast[RenderingInfo]())

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
        return self._get_physical_device_features_2(
            physical_device, Ptr(to=features).bitcast[PhysicalDeviceFeatures2]()
        )

    fn get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties2.html
        """
        return self._get_physical_device_properties_2(
            physical_device, Ptr(to=properties).bitcast[PhysicalDeviceProperties2]()
        )

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
            physical_device, format, Ptr(to=format_properties).bitcast[FormatProperties2]()
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
            physical_device,
            Ptr(to=image_format_info).bitcast[PhysicalDeviceImageFormatInfo2](),
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties2](),
        )

    fn get_physical_device_queue_family_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        return self._get_physical_device_queue_family_properties_2(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32](),
            p_queue_family_properties,
        )

    fn get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties2.html
        """
        return self._get_physical_device_memory_properties_2(
            physical_device, Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties2]()
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        return self._get_physical_device_sparse_image_format_properties_2(
            physical_device,
            Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2](),
            Ptr(to=property_count).bitcast[UInt32](),
            p_properties,
        )


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
    var _get_device_group_present_capabilities_khr: fn(
        device: Device,
        p_device_group_present_capabilities: Ptr[DeviceGroupPresentCapabilitiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_device_group_surface_present_modes_khr: fn(
        device: Device, surface: SurfaceKHR, p_modes: Ptr[DeviceGroupPresentModeFlagsKHR, MutAnyOrigin]
    ) -> Result
    var _get_physical_device_present_rectangles_khr: fn(
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        p_rect_count: Ptr[UInt32, MutAnyOrigin],
        p_rects: Ptr[Rect2D, MutAnyOrigin],
    ) -> Result
    var _acquire_next_image_2_khr: fn(
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
        self._get_device_group_present_capabilities_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupPresentCapabilitiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_present_capabilities_khr)]()[]
        self._get_device_group_surface_present_modes_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupSurfacePresentModesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_device_group_surface_present_modes_khr)]()[]
        self._get_physical_device_present_rectangles_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDevicePresentRectanglesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_present_rectangles_khr)]()[]
        self._acquire_next_image_2_khr = Ptr(to=get_device_proc_addr(
            device, "vkAcquireNextImage2KHR".as_c_string_slice()
        )).bitcast[type_of(self._acquire_next_image_2_khr)]()[]

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
            device,
            heap_index,
            local_device_index,
            remote_device_index,
            Ptr(to=peer_memory_features).bitcast[PeerMemoryFeatureFlags](),
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

    fn get_device_group_present_capabilities_khr(
        self,
        device: Device,
        mut device_group_present_capabilities: DeviceGroupPresentCapabilitiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupPresentCapabilitiesKHR.html
        """
        return self._get_device_group_present_capabilities_khr(
            device, Ptr(to=device_group_present_capabilities).bitcast[DeviceGroupPresentCapabilitiesKHR]()
        )

    fn get_device_group_surface_present_modes_khr(
        self, device: Device, surface: SurfaceKHR, mut modes: DeviceGroupPresentModeFlagsKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupSurfacePresentModesKHR.html
        """
        return self._get_device_group_surface_present_modes_khr(
            device, surface, Ptr(to=modes).bitcast[DeviceGroupPresentModeFlagsKHR]()
        )

    fn get_physical_device_present_rectangles_khr(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut rect_count: UInt32,
        p_rects: Ptr[Rect2D, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDevicePresentRectanglesKHR.html
        """
        return self._get_physical_device_present_rectangles_khr(
            physical_device, surface, Ptr(to=rect_count).bitcast[UInt32](), p_rects
        )

    fn acquire_next_image_2_khr(
        self, device: Device, acquire_info: AcquireNextImageInfoKHR, mut image_index: UInt32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireNextImage2KHR.html
        """
        return self._acquire_next_image_2_khr(
            device,
            Ptr(to=acquire_info).bitcast[AcquireNextImageInfoKHR](),
            Ptr(to=image_index).bitcast[UInt32](),
        )


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

    fn enumerate_physical_device_groups(
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        return self._enumerate_physical_device_groups(
            instance,
            Ptr(to=physical_device_group_count).bitcast[UInt32](),
            p_physical_device_group_properties,
        )


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
            physical_device,
            Ptr(to=external_buffer_info).bitcast[PhysicalDeviceExternalBufferInfo](),
            Ptr(to=external_buffer_properties).bitcast[ExternalBufferProperties](),
        )


struct ExternalMemoryWin32(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_win_32_handle_khr: fn(
        device: Device,
        p_get_win_32_handle_info: Ptr[MemoryGetWin32HandleInfoKHR, ImmutAnyOrigin],
        p_handle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result
    var _get_memory_win_32_handle_properties_khr: fn(
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
        self._get_memory_win_32_handle_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryWin32HandleKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_win_32_handle_khr)]()[]
        self._get_memory_win_32_handle_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryWin32HandlePropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_win_32_handle_properties_khr)]()[]

    fn get_memory_win_32_handle_khr(
        self,
        device: Device,
        get_win_32_handle_info: MemoryGetWin32HandleInfoKHR,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryWin32HandleKHR.html
        """
        return self._get_memory_win_32_handle_khr(
            device,
            Ptr(to=get_win_32_handle_info).bitcast[MemoryGetWin32HandleInfoKHR](),
            Ptr(to=handle).bitcast[HANDLE](),
        )

    fn get_memory_win_32_handle_properties_khr(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        handle: HANDLE,
        mut memory_win_32_handle_properties: MemoryWin32HandlePropertiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryWin32HandlePropertiesKHR.html
        """
        return self._get_memory_win_32_handle_properties_khr(
            device,
            handle_type,
            handle,
            Ptr(to=memory_win_32_handle_properties).bitcast[MemoryWin32HandlePropertiesKHR](),
        )


struct ExternalMemoryFd(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_fd_khr: fn(
        device: Device,
        p_get_fd_info: Ptr[MemoryGetFdInfoKHR, ImmutAnyOrigin],
        p_fd: Ptr[Int32, MutAnyOrigin],
    ) -> Result
    var _get_memory_fd_properties_khr: fn(
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
        self._get_memory_fd_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryFdKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_fd_khr)]()[]
        self._get_memory_fd_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryFdPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_fd_properties_khr)]()[]

    fn get_memory_fd_khr(
        self, device: Device, get_fd_info: MemoryGetFdInfoKHR, mut fd: Int32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryFdKHR.html
        """
        return self._get_memory_fd_khr(
            device, Ptr(to=get_fd_info).bitcast[MemoryGetFdInfoKHR](), Ptr(to=fd).bitcast[Int32]()
        )

    fn get_memory_fd_properties_khr(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        fd: Int32,
        mut memory_fd_properties: MemoryFdPropertiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryFdPropertiesKHR.html
        """
        return self._get_memory_fd_properties_khr(
            device, handle_type, fd, Ptr(to=memory_fd_properties).bitcast[MemoryFdPropertiesKHR]()
        )


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
            physical_device,
            Ptr(to=external_semaphore_info).bitcast[PhysicalDeviceExternalSemaphoreInfo](),
            Ptr(to=external_semaphore_properties).bitcast[ExternalSemaphoreProperties](),
        )


struct ExternalSemaphoreWin32(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _import_semaphore_win_32_handle_khr: fn(
        device: Device,
        p_import_semaphore_win_32_handle_info: Ptr[ImportSemaphoreWin32HandleInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _get_semaphore_win_32_handle_khr: fn(
        device: Device,
        p_get_win_32_handle_info: Ptr[SemaphoreGetWin32HandleInfoKHR, ImmutAnyOrigin],
        p_handle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_semaphore_win_32_handle_khr = Ptr(to=get_device_proc_addr(
            device, "vkImportSemaphoreWin32HandleKHR".as_c_string_slice()
        )).bitcast[type_of(self._import_semaphore_win_32_handle_khr)]()[]
        self._get_semaphore_win_32_handle_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreWin32HandleKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_semaphore_win_32_handle_khr)]()[]

    fn import_semaphore_win_32_handle_khr(
        self, device: Device, import_semaphore_win_32_handle_info: ImportSemaphoreWin32HandleInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportSemaphoreWin32HandleKHR.html
        """
        return self._import_semaphore_win_32_handle_khr(
            device, Ptr(to=import_semaphore_win_32_handle_info).bitcast[ImportSemaphoreWin32HandleInfoKHR]()
        )

    fn get_semaphore_win_32_handle_khr(
        self,
        device: Device,
        get_win_32_handle_info: SemaphoreGetWin32HandleInfoKHR,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreWin32HandleKHR.html
        """
        return self._get_semaphore_win_32_handle_khr(
            device,
            Ptr(to=get_win_32_handle_info).bitcast[SemaphoreGetWin32HandleInfoKHR](),
            Ptr(to=handle).bitcast[HANDLE](),
        )


struct ExternalSemaphoreFd(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _import_semaphore_fd_khr: fn(
        device: Device, p_import_semaphore_fd_info: Ptr[ImportSemaphoreFdInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _get_semaphore_fd_khr: fn(
        device: Device,
        p_get_fd_info: Ptr[SemaphoreGetFdInfoKHR, ImmutAnyOrigin],
        p_fd: Ptr[Int32, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_semaphore_fd_khr = Ptr(to=get_device_proc_addr(
            device, "vkImportSemaphoreFdKHR".as_c_string_slice()
        )).bitcast[type_of(self._import_semaphore_fd_khr)]()[]
        self._get_semaphore_fd_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreFdKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_semaphore_fd_khr)]()[]

    fn import_semaphore_fd_khr(
        self, device: Device, import_semaphore_fd_info: ImportSemaphoreFdInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportSemaphoreFdKHR.html
        """
        return self._import_semaphore_fd_khr(
            device, Ptr(to=import_semaphore_fd_info).bitcast[ImportSemaphoreFdInfoKHR]()
        )

    fn get_semaphore_fd_khr(
        self, device: Device, get_fd_info: SemaphoreGetFdInfoKHR, mut fd: Int32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreFdKHR.html
        """
        return self._get_semaphore_fd_khr(
            device, Ptr(to=get_fd_info).bitcast[SemaphoreGetFdInfoKHR](), Ptr(to=fd).bitcast[Int32]()
        )


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

    fn cmd_push_descriptor_set(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSet.html
        """
        return self._cmd_push_descriptor_set(
            command_buffer, pipeline_bind_point, layout, set, descriptor_write_count, p_descriptor_writes
        )

    fn cmd_push_descriptor_set_with_template(
        self,
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate.html
        """
        return self._cmd_push_descriptor_set_with_template(
            command_buffer, descriptor_update_template, layout, set, p_data
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

    fn create_descriptor_update_template(
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorUpdateTemplate.html
        """
        return self._create_descriptor_update_template(
            device,
            Ptr(to=create_info).bitcast[DescriptorUpdateTemplateCreateInfo](),
            p_allocator,
            Ptr(to=descriptor_update_template).bitcast[DescriptorUpdateTemplate](),
        )

    fn destroy_descriptor_update_template(
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorUpdateTemplate.html
        """
        return self._destroy_descriptor_update_template(device, descriptor_update_template, p_allocator)

    fn update_descriptor_set_with_template(
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._update_descriptor_set_with_template(
            device, descriptor_set, descriptor_update_template, p_data
        )

    fn cmd_push_descriptor_set_with_template(
        self,
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate.html
        """
        return self._cmd_push_descriptor_set_with_template(
            command_buffer, descriptor_update_template, layout, set, p_data
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

    fn create_render_pass_2(
        self,
        device: Device,
        create_info: RenderPassCreateInfo2,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass2.html
        """
        return self._create_render_pass_2(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo2](),
            p_allocator,
            Ptr(to=render_pass).bitcast[RenderPass](),
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
            command_buffer,
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo](),
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo](),
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
            command_buffer,
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo](),
            Ptr(to=subpass_end_info).bitcast[SubpassEndInfo](),
        )

    fn cmd_end_render_pass_2(
        self, command_buffer: CommandBuffer, subpass_end_info: SubpassEndInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass2.html
        """
        return self._cmd_end_render_pass_2(
            command_buffer, Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]()
        )


struct SharedPresentableImage(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_swapchain_status_khr: fn(device: Device, swapchain: SwapchainKHR) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_swapchain_status_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainStatusKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_swapchain_status_khr)]()[]

    fn get_swapchain_status_khr(self, device: Device, swapchain: SwapchainKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainStatusKHR.html
        """
        return self._get_swapchain_status_khr(device, swapchain)


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
            physical_device,
            Ptr(to=external_fence_info).bitcast[PhysicalDeviceExternalFenceInfo](),
            Ptr(to=external_fence_properties).bitcast[ExternalFenceProperties](),
        )


struct ExternalFenceWin32(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _import_fence_win_32_handle_khr: fn(
        device: Device,
        p_import_fence_win_32_handle_info: Ptr[ImportFenceWin32HandleInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _get_fence_win_32_handle_khr: fn(
        device: Device,
        p_get_win_32_handle_info: Ptr[FenceGetWin32HandleInfoKHR, ImmutAnyOrigin],
        p_handle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_fence_win_32_handle_khr = Ptr(to=get_device_proc_addr(
            device, "vkImportFenceWin32HandleKHR".as_c_string_slice()
        )).bitcast[type_of(self._import_fence_win_32_handle_khr)]()[]
        self._get_fence_win_32_handle_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetFenceWin32HandleKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_fence_win_32_handle_khr)]()[]

    fn import_fence_win_32_handle_khr(
        self, device: Device, import_fence_win_32_handle_info: ImportFenceWin32HandleInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportFenceWin32HandleKHR.html
        """
        return self._import_fence_win_32_handle_khr(
            device, Ptr(to=import_fence_win_32_handle_info).bitcast[ImportFenceWin32HandleInfoKHR]()
        )

    fn get_fence_win_32_handle_khr(
        self, device: Device, get_win_32_handle_info: FenceGetWin32HandleInfoKHR, mut handle: HANDLE
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceWin32HandleKHR.html
        """
        return self._get_fence_win_32_handle_khr(
            device,
            Ptr(to=get_win_32_handle_info).bitcast[FenceGetWin32HandleInfoKHR](),
            Ptr(to=handle).bitcast[HANDLE](),
        )


struct ExternalFenceFd(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _import_fence_fd_khr: fn(
        device: Device, p_import_fence_fd_info: Ptr[ImportFenceFdInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _get_fence_fd_khr: fn(
        device: Device,
        p_get_fd_info: Ptr[FenceGetFdInfoKHR, ImmutAnyOrigin],
        p_fd: Ptr[Int32, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_fence_fd_khr = Ptr(to=get_device_proc_addr(
            device, "vkImportFenceFdKHR".as_c_string_slice()
        )).bitcast[type_of(self._import_fence_fd_khr)]()[]
        self._get_fence_fd_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetFenceFdKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_fence_fd_khr)]()[]

    fn import_fence_fd_khr(
        self, device: Device, import_fence_fd_info: ImportFenceFdInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportFenceFdKHR.html
        """
        return self._import_fence_fd_khr(
            device, Ptr(to=import_fence_fd_info).bitcast[ImportFenceFdInfoKHR]()
        )

    fn get_fence_fd_khr(
        self, device: Device, get_fd_info: FenceGetFdInfoKHR, mut fd: Int32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceFdKHR.html
        """
        return self._get_fence_fd_khr(
            device, Ptr(to=get_fd_info).bitcast[FenceGetFdInfoKHR](), Ptr(to=fd).bitcast[Int32]()
        )


struct PerformanceQuery(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _enumerate_physical_device_queue_family_performance_query_counters_khr: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        p_counter_count: Ptr[UInt32, MutAnyOrigin],
        p_counters: Ptr[PerformanceCounterKHR, MutAnyOrigin],
        p_counter_descriptions: Ptr[PerformanceCounterDescriptionKHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_queue_family_performance_query_passes_khr: fn(
        physical_device: PhysicalDevice,
        p_performance_query_create_info: Ptr[QueryPoolPerformanceCreateInfoKHR, ImmutAnyOrigin],
        p_num_passes: Ptr[UInt32, MutAnyOrigin],
    )
    var _acquire_profiling_lock_khr: fn(
        device: Device, p_info: Ptr[AcquireProfilingLockInfoKHR, ImmutAnyOrigin]
    ) -> Result
    var _release_profiling_lock_khr: fn(device: Device)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._enumerate_physical_device_queue_family_performance_query_counters_khr = Ptr(to=get_device_proc_addr(
            device, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR".as_c_string_slice()
        )).bitcast[type_of(self._enumerate_physical_device_queue_family_performance_query_counters_khr)]()[]
        self._get_physical_device_queue_family_performance_query_passes_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_queue_family_performance_query_passes_khr)]()[]
        self._acquire_profiling_lock_khr = Ptr(to=get_device_proc_addr(
            device, "vkAcquireProfilingLockKHR".as_c_string_slice()
        )).bitcast[type_of(self._acquire_profiling_lock_khr)]()[]
        self._release_profiling_lock_khr = Ptr(to=get_device_proc_addr(
            device, "vkReleaseProfilingLockKHR".as_c_string_slice()
        )).bitcast[type_of(self._release_profiling_lock_khr)]()[]

    fn enumerate_physical_device_queue_family_performance_query_counters_khr(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut counter_count: UInt32,
        p_counters: Ptr[PerformanceCounterKHR, MutAnyOrigin],
        p_counter_descriptions: Ptr[PerformanceCounterDescriptionKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR.html
        """
        return self._enumerate_physical_device_queue_family_performance_query_counters_khr(
            physical_device,
            queue_family_index,
            Ptr(to=counter_count).bitcast[UInt32](),
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR.html
        """
        return self._get_physical_device_queue_family_performance_query_passes_khr(
            physical_device,
            Ptr(to=performance_query_create_info).bitcast[QueryPoolPerformanceCreateInfoKHR](),
            Ptr(to=num_passes).bitcast[UInt32](),
        )

    fn acquire_profiling_lock_khr(
        self, device: Device, info: AcquireProfilingLockInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireProfilingLockKHR.html
        """
        return self._acquire_profiling_lock_khr(device, Ptr(to=info).bitcast[AcquireProfilingLockInfoKHR]())

    fn release_profiling_lock_khr(self, device: Device):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseProfilingLockKHR.html
        """
        return self._release_profiling_lock_khr(device)


struct GetSurfaceCapabilities2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_surface_capabilities_2_khr: fn(
        physical_device: PhysicalDevice,
        p_surface_info: Ptr[PhysicalDeviceSurfaceInfo2KHR, ImmutAnyOrigin],
        p_surface_capabilities: Ptr[SurfaceCapabilities2KHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_surface_formats_2_khr: fn(
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
        self._get_physical_device_surface_capabilities_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceCapabilities2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_capabilities_2_khr)]()[]
        self._get_physical_device_surface_formats_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSurfaceFormats2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_surface_formats_2_khr)]()[]

    fn get_physical_device_surface_capabilities_2_khr(
        self,
        physical_device: PhysicalDevice,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut surface_capabilities: SurfaceCapabilities2KHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceCapabilities2KHR.html
        """
        return self._get_physical_device_surface_capabilities_2_khr(
            physical_device,
            Ptr(to=surface_info).bitcast[PhysicalDeviceSurfaceInfo2KHR](),
            Ptr(to=surface_capabilities).bitcast[SurfaceCapabilities2KHR](),
        )

    fn get_physical_device_surface_formats_2_khr(
        self,
        physical_device: PhysicalDevice,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut surface_format_count: UInt32,
        p_surface_formats: Ptr[SurfaceFormat2KHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceFormats2KHR.html
        """
        return self._get_physical_device_surface_formats_2_khr(
            physical_device,
            Ptr(to=surface_info).bitcast[PhysicalDeviceSurfaceInfo2KHR](),
            Ptr(to=surface_format_count).bitcast[UInt32](),
            p_surface_formats,
        )


struct GetDisplayProperties2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_display_properties_2_khr: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayProperties2KHR, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_display_plane_properties_2_khr: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayPlaneProperties2KHR, MutAnyOrigin],
    ) -> Result
    var _get_display_mode_properties_2_khr: fn(
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DisplayModeProperties2KHR, MutAnyOrigin],
    ) -> Result
    var _get_display_plane_capabilities_2_khr: fn(
        physical_device: PhysicalDevice,
        p_display_plane_info: Ptr[DisplayPlaneInfo2KHR, ImmutAnyOrigin],
        p_capabilities: Ptr[DisplayPlaneCapabilities2KHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_display_properties_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayProperties2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_display_properties_2_khr)]()[]
        self._get_physical_device_display_plane_properties_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceDisplayPlaneProperties2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_display_plane_properties_2_khr)]()[]
        self._get_display_mode_properties_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayModeProperties2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_display_mode_properties_2_khr)]()[]
        self._get_display_plane_capabilities_2_khr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDisplayPlaneCapabilities2KHR".as_c_string_slice()
        )).bitcast[type_of(self._get_display_plane_capabilities_2_khr)]()[]

    fn get_physical_device_display_properties_2_khr(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayProperties2KHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayProperties2KHR.html
        """
        return self._get_physical_device_display_properties_2_khr(
            physical_device, Ptr(to=property_count).bitcast[UInt32](), p_properties
        )

    fn get_physical_device_display_plane_properties_2_khr(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayPlaneProperties2KHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDisplayPlaneProperties2KHR.html
        """
        return self._get_physical_device_display_plane_properties_2_khr(
            physical_device, Ptr(to=property_count).bitcast[UInt32](), p_properties
        )

    fn get_display_mode_properties_2_khr(
        self,
        physical_device: PhysicalDevice,
        display: DisplayKHR,
        mut property_count: UInt32,
        p_properties: Ptr[DisplayModeProperties2KHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayModeProperties2KHR.html
        """
        return self._get_display_mode_properties_2_khr(
            physical_device, display, Ptr(to=property_count).bitcast[UInt32](), p_properties
        )

    fn get_display_plane_capabilities_2_khr(
        self,
        physical_device: PhysicalDevice,
        display_plane_info: DisplayPlaneInfo2KHR,
        mut capabilities: DisplayPlaneCapabilities2KHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDisplayPlaneCapabilities2KHR.html
        """
        return self._get_display_plane_capabilities_2_khr(
            physical_device,
            Ptr(to=display_plane_info).bitcast[DisplayPlaneInfo2KHR](),
            Ptr(to=capabilities).bitcast[DisplayPlaneCapabilities2KHR](),
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
        return self._get_image_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageMemoryRequirementsInfo2](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn get_buffer_memory_requirements_2(
        self,
        device: Device,
        info: BufferMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements2.html
        """
        return self._get_buffer_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[BufferMemoryRequirementsInfo2](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn get_image_sparse_memory_requirements_2(
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        return self._get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2](),
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32](),
            p_sparse_memory_requirements,
        )


struct AccelerationStructure(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_acceleration_structure_khr: fn(
        device: Device,
        p_create_info: Ptr[AccelerationStructureCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_acceleration_structure: Ptr[AccelerationStructureKHR, MutAnyOrigin],
    ) -> Result
    var _destroy_acceleration_structure_khr: fn(
        device: Device,
        acceleration_structure: AccelerationStructureKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _cmd_build_acceleration_structures_khr: fn(
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        pp_build_range_infos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, ImmutAnyOrigin], ImmutAnyOrigin],
    )
    var _cmd_build_acceleration_structures_indirect_khr: fn(
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        p_indirect_device_addresses: Ptr[DeviceAddress, ImmutAnyOrigin],
        p_indirect_strides: Ptr[UInt32, ImmutAnyOrigin],
        pp_max_primitive_counts: Ptr[Ptr[UInt32, ImmutAnyOrigin], ImmutAnyOrigin],
    )
    var _build_acceleration_structures_khr: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        pp_build_range_infos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, ImmutAnyOrigin], ImmutAnyOrigin],
    ) -> Result
    var _copy_acceleration_structure_khr: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyAccelerationStructureInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _copy_acceleration_structure_to_memory_khr: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyAccelerationStructureToMemoryInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _copy_memory_to_acceleration_structure_khr: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        p_info: Ptr[CopyMemoryToAccelerationStructureInfoKHR, ImmutAnyOrigin],
    ) -> Result
    var _write_acceleration_structures_properties_khr: fn(
        device: Device,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureKHR, ImmutAnyOrigin],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: UInt,
    ) -> Result
    var _cmd_copy_acceleration_structure_khr: fn(
        command_buffer: CommandBuffer, p_info: Ptr[CopyAccelerationStructureInfoKHR, ImmutAnyOrigin]
    )
    var _cmd_copy_acceleration_structure_to_memory_khr: fn(
        command_buffer: CommandBuffer,
        p_info: Ptr[CopyAccelerationStructureToMemoryInfoKHR, ImmutAnyOrigin],
    )
    var _cmd_copy_memory_to_acceleration_structure_khr: fn(
        command_buffer: CommandBuffer,
        p_info: Ptr[CopyMemoryToAccelerationStructureInfoKHR, ImmutAnyOrigin],
    )
    var _get_acceleration_structure_device_address_khr: fn(
        device: Device, p_info: Ptr[AccelerationStructureDeviceAddressInfoKHR, ImmutAnyOrigin]
    ) -> DeviceAddress
    var _cmd_write_acceleration_structures_properties_khr: fn(
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureKHR, ImmutAnyOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    )
    var _get_device_acceleration_structure_compatibility_khr: fn(
        device: Device,
        p_version_info: Ptr[AccelerationStructureVersionInfoKHR, ImmutAnyOrigin],
        p_compatibility: Ptr[AccelerationStructureCompatibilityKHR, MutAnyOrigin],
    )
    var _get_acceleration_structure_build_sizes_khr: fn(
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
        self._create_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_acceleration_structure_khr)]()[]
        self._destroy_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroyAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_acceleration_structure_khr)]()[]
        self._cmd_build_acceleration_structures_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildAccelerationStructuresKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_acceleration_structures_khr)]()[]
        self._cmd_build_acceleration_structures_indirect_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildAccelerationStructuresIndirectKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_acceleration_structures_indirect_khr)]()[]
        self._build_acceleration_structures_khr = Ptr(to=get_device_proc_addr(
            device, "vkBuildAccelerationStructuresKHR".as_c_string_slice()
        )).bitcast[type_of(self._build_acceleration_structures_khr)]()[]
        self._copy_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkCopyAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._copy_acceleration_structure_khr)]()[]
        self._copy_acceleration_structure_to_memory_khr = Ptr(to=get_device_proc_addr(
            device, "vkCopyAccelerationStructureToMemoryKHR".as_c_string_slice()
        )).bitcast[type_of(self._copy_acceleration_structure_to_memory_khr)]()[]
        self._copy_memory_to_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkCopyMemoryToAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._copy_memory_to_acceleration_structure_khr)]()[]
        self._write_acceleration_structures_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkWriteAccelerationStructuresPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._write_acceleration_structures_properties_khr)]()[]
        self._cmd_copy_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_acceleration_structure_khr)]()[]
        self._cmd_copy_acceleration_structure_to_memory_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyAccelerationStructureToMemoryKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_acceleration_structure_to_memory_khr)]()[]
        self._cmd_copy_memory_to_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToAccelerationStructureKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_memory_to_acceleration_structure_khr)]()[]
        self._get_acceleration_structure_device_address_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureDeviceAddressKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_acceleration_structure_device_address_khr)]()[]
        self._cmd_write_acceleration_structures_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteAccelerationStructuresPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_write_acceleration_structures_properties_khr)]()[]
        self._get_device_acceleration_structure_compatibility_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceAccelerationStructureCompatibilityKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_device_acceleration_structure_compatibility_khr)]()[]
        self._get_acceleration_structure_build_sizes_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureBuildSizesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_acceleration_structure_build_sizes_khr)]()[]

    fn create_acceleration_structure_khr(
        self,
        device: Device,
        create_info: AccelerationStructureCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut acceleration_structure: AccelerationStructureKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateAccelerationStructureKHR.html
        """
        return self._create_acceleration_structure_khr(
            device,
            Ptr(to=create_info).bitcast[AccelerationStructureCreateInfoKHR](),
            p_allocator,
            Ptr(to=acceleration_structure).bitcast[AccelerationStructureKHR](),
        )

    fn destroy_acceleration_structure_khr(
        self,
        device: Device,
        acceleration_structure: AccelerationStructureKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyAccelerationStructureKHR.html
        """
        return self._destroy_acceleration_structure_khr(device, acceleration_structure, p_allocator)

    fn cmd_build_acceleration_structures_khr(
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        pp_build_range_infos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, ImmutAnyOrigin], ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildAccelerationStructuresKHR.html
        """
        return self._cmd_build_acceleration_structures_khr(
            command_buffer, info_count, p_infos, pp_build_range_infos
        )

    fn cmd_build_acceleration_structures_indirect_khr(
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        p_indirect_device_addresses: Ptr[DeviceAddress, ImmutAnyOrigin],
        p_indirect_strides: Ptr[UInt32, ImmutAnyOrigin],
        pp_max_primitive_counts: Ptr[Ptr[UInt32, ImmutAnyOrigin], ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildAccelerationStructuresIndirectKHR.html
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
        p_infos: Ptr[AccelerationStructureBuildGeometryInfoKHR, ImmutAnyOrigin],
        pp_build_range_infos: Ptr[Ptr[AccelerationStructureBuildRangeInfoKHR, ImmutAnyOrigin], ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBuildAccelerationStructuresKHR.html
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyAccelerationStructureKHR.html
        """
        return self._copy_acceleration_structure_khr(
            device, deferred_operation, Ptr(to=info).bitcast[CopyAccelerationStructureInfoKHR]()
        )

    fn copy_acceleration_structure_to_memory_khr(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyAccelerationStructureToMemoryInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyAccelerationStructureToMemoryKHR.html
        """
        return self._copy_acceleration_structure_to_memory_khr(
            device, deferred_operation, Ptr(to=info).bitcast[CopyAccelerationStructureToMemoryInfoKHR]()
        )

    fn copy_memory_to_acceleration_structure_khr(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMemoryToAccelerationStructureInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToAccelerationStructureKHR.html
        """
        return self._copy_memory_to_acceleration_structure_khr(
            device, deferred_operation, Ptr(to=info).bitcast[CopyMemoryToAccelerationStructureInfoKHR]()
        )

    fn write_acceleration_structures_properties_khr(
        self,
        device: Device,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureKHR, ImmutAnyOrigin],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: UInt,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWriteAccelerationStructuresPropertiesKHR.html
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyAccelerationStructureKHR.html
        """
        return self._cmd_copy_acceleration_structure_khr(
            command_buffer, Ptr(to=info).bitcast[CopyAccelerationStructureInfoKHR]()
        )

    fn cmd_copy_acceleration_structure_to_memory_khr(
        self, command_buffer: CommandBuffer, info: CopyAccelerationStructureToMemoryInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyAccelerationStructureToMemoryKHR.html
        """
        return self._cmd_copy_acceleration_structure_to_memory_khr(
            command_buffer, Ptr(to=info).bitcast[CopyAccelerationStructureToMemoryInfoKHR]()
        )

    fn cmd_copy_memory_to_acceleration_structure_khr(
        self, command_buffer: CommandBuffer, info: CopyMemoryToAccelerationStructureInfoKHR
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryToAccelerationStructureKHR.html
        """
        return self._cmd_copy_memory_to_acceleration_structure_khr(
            command_buffer, Ptr(to=info).bitcast[CopyMemoryToAccelerationStructureInfoKHR]()
        )

    fn get_acceleration_structure_device_address_khr(
        self, device: Device, info: AccelerationStructureDeviceAddressInfoKHR
    ) -> DeviceAddress:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureDeviceAddressKHR.html
        """
        return self._get_acceleration_structure_device_address_khr(
            device, Ptr(to=info).bitcast[AccelerationStructureDeviceAddressInfoKHR]()
        )

    fn cmd_write_acceleration_structures_properties_khr(
        self,
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureKHR, ImmutAnyOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteAccelerationStructuresPropertiesKHR.html
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceAccelerationStructureCompatibilityKHR.html
        """
        return self._get_device_acceleration_structure_compatibility_khr(
            device,
            Ptr(to=version_info).bitcast[AccelerationStructureVersionInfoKHR](),
            Ptr(to=compatibility).bitcast[AccelerationStructureCompatibilityKHR](),
        )

    fn get_acceleration_structure_build_sizes_khr(
        self,
        device: Device,
        build_type: AccelerationStructureBuildTypeKHR,
        build_info: AccelerationStructureBuildGeometryInfoKHR,
        p_max_primitive_counts: Ptr[UInt32, ImmutAnyOrigin],
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureBuildSizesKHR.html
        """
        return self._get_acceleration_structure_build_sizes_khr(
            device,
            build_type,
            Ptr(to=build_info).bitcast[AccelerationStructureBuildGeometryInfoKHR](),
            p_max_primitive_counts,
            Ptr(to=size_info).bitcast[AccelerationStructureBuildSizesInfoKHR](),
        )


struct RayTracingPipeline(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_trace_rays_khr: fn(
        command_buffer: CommandBuffer,
        p_raygen_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_miss_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_hit_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_callable_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        width: UInt32,
        height: UInt32,
        depth: UInt32,
    )
    var _create_ray_tracing_pipelines_khr: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _get_ray_tracing_shader_group_handles_khr: fn(
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_ray_tracing_capture_replay_shader_group_handles_khr: fn(
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _cmd_trace_rays_indirect_khr: fn(
        command_buffer: CommandBuffer,
        p_raygen_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_miss_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_hit_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        p_callable_shader_binding_table: Ptr[StridedDeviceAddressRegionKHR, ImmutAnyOrigin],
        indirect_device_address: DeviceAddress,
    )
    var _get_ray_tracing_shader_group_stack_size_khr: fn(
        device: Device, pipeline: Pipeline, group: UInt32, group_shader: ShaderGroupShaderKHR
    ) -> DeviceSize
    var _cmd_set_ray_tracing_pipeline_stack_size_khr: fn(
        command_buffer: CommandBuffer, pipeline_stack_size: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_trace_rays_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_trace_rays_khr)]()[]
        self._create_ray_tracing_pipelines_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateRayTracingPipelinesKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_ray_tracing_pipelines_khr)]()[]
        self._get_ray_tracing_shader_group_handles_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingShaderGroupHandlesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_ray_tracing_shader_group_handles_khr)]()[]
        self._get_ray_tracing_capture_replay_shader_group_handles_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_ray_tracing_capture_replay_shader_group_handles_khr)]()[]
        self._cmd_trace_rays_indirect_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysIndirectKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_trace_rays_indirect_khr)]()[]
        self._get_ray_tracing_shader_group_stack_size_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingShaderGroupStackSizeKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_ray_tracing_shader_group_stack_size_khr)]()[]
        self._cmd_set_ray_tracing_pipeline_stack_size_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRayTracingPipelineStackSizeKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_ray_tracing_pipeline_stack_size_khr)]()[]

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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdTraceRaysKHR.html
        """
        return self._cmd_trace_rays_khr(
            command_buffer,
            Ptr(to=raygen_shader_binding_table).bitcast[StridedDeviceAddressRegionKHR](),
            Ptr(to=miss_shader_binding_table).bitcast[StridedDeviceAddressRegionKHR](),
            Ptr(to=hit_shader_binding_table).bitcast[StridedDeviceAddressRegionKHR](),
            Ptr(to=callable_shader_binding_table).bitcast[StridedDeviceAddressRegionKHR](),
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
        p_create_infos: Ptr[RayTracingPipelineCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRayTracingPipelinesKHR.html
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
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRayTracingShaderGroupHandlesKHR.html
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
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRayTracingCaptureReplayShaderGroupHandlesKHR.html
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdTraceRaysIndirectKHR.html
        """
        return self._cmd_trace_rays_indirect_khr(
            command_buffer,
            Ptr(to=raygen_shader_binding_table).bitcast[StridedDeviceAddressRegionKHR](),
            Ptr(to=miss_shader_binding_table).bitcast[StridedDeviceAddressRegionKHR](),
            Ptr(to=hit_shader_binding_table).bitcast[StridedDeviceAddressRegionKHR](),
            Ptr(to=callable_shader_binding_table).bitcast[StridedDeviceAddressRegionKHR](),
            indirect_device_address,
        )

    fn get_ray_tracing_shader_group_stack_size_khr(
        self, device: Device, pipeline: Pipeline, group: UInt32, group_shader: ShaderGroupShaderKHR
    ) -> DeviceSize:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRayTracingShaderGroupStackSizeKHR.html
        """
        return self._get_ray_tracing_shader_group_stack_size_khr(device, pipeline, group, group_shader)

    fn cmd_set_ray_tracing_pipeline_stack_size_khr(
        self, command_buffer: CommandBuffer, pipeline_stack_size: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRayTracingPipelineStackSizeKHR.html
        """
        return self._cmd_set_ray_tracing_pipeline_stack_size_khr(command_buffer, pipeline_stack_size)


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

    fn create_sampler_ycbcr_conversion(
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSamplerYcbcrConversion.html
        """
        return self._create_sampler_ycbcr_conversion(
            device,
            Ptr(to=create_info).bitcast[SamplerYcbcrConversionCreateInfo](),
            p_allocator,
            Ptr(to=ycbcr_conversion).bitcast[SamplerYcbcrConversion](),
        )

    fn destroy_sampler_ycbcr_conversion(
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySamplerYcbcrConversion.html
        """
        return self._destroy_sampler_ycbcr_conversion(device, ycbcr_conversion, p_allocator)


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

    fn bind_buffer_memory_2(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory2.html
        """
        return self._bind_buffer_memory_2(device, bind_info_count, p_bind_infos)

    fn bind_image_memory_2(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory2.html
        """
        return self._bind_image_memory_2(device, bind_info_count, p_bind_infos)


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
        return self._get_descriptor_set_layout_support(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo](),
            Ptr(to=support).bitcast[DescriptorSetLayoutSupport](),
        )


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
        return self._get_semaphore_counter_value(device, semaphore, Ptr(to=value).bitcast[UInt64]())

    fn wait_semaphores(
        self, device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitSemaphores.html
        """
        return self._wait_semaphores(device, Ptr(to=wait_info).bitcast[SemaphoreWaitInfo](), timeout)

    fn signal_semaphore(self, device: Device, signal_info: SemaphoreSignalInfo) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSignalSemaphore.html
        """
        return self._signal_semaphore(device, Ptr(to=signal_info).bitcast[SemaphoreSignalInfo]())


struct FragmentShadingRate(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_fragment_shading_rates_khr: fn(
        physical_device: PhysicalDevice,
        p_fragment_shading_rate_count: Ptr[UInt32, MutAnyOrigin],
        p_fragment_shading_rates: Ptr[PhysicalDeviceFragmentShadingRateKHR, MutAnyOrigin],
    ) -> Result
    var _cmd_set_fragment_shading_rate_khr: fn(
        command_buffer: CommandBuffer,
        p_fragment_size: Ptr[Extent2D, ImmutAnyOrigin],
        combiner_ops: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_fragment_shading_rates_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceFragmentShadingRatesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_fragment_shading_rates_khr)]()[]
        self._cmd_set_fragment_shading_rate_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFragmentShadingRateKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_fragment_shading_rate_khr)]()[]

    fn get_physical_device_fragment_shading_rates_khr(
        self,
        physical_device: PhysicalDevice,
        mut fragment_shading_rate_count: UInt32,
        p_fragment_shading_rates: Ptr[PhysicalDeviceFragmentShadingRateKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFragmentShadingRatesKHR.html
        """
        return self._get_physical_device_fragment_shading_rates_khr(
            physical_device, Ptr(to=fragment_shading_rate_count).bitcast[UInt32](), p_fragment_shading_rates
        )

    fn cmd_set_fragment_shading_rate_khr(
        self,
        command_buffer: CommandBuffer,
        fragment_size: Extent2D,
        combiner_ops: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFragmentShadingRateKHR.html
        """
        return self._cmd_set_fragment_shading_rate_khr(
            command_buffer, Ptr(to=fragment_size).bitcast[Extent2D](), combiner_ops
        )


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
        return self._cmd_set_rendering_attachment_locations(
            command_buffer, Ptr(to=location_info).bitcast[RenderingAttachmentLocationInfo]()
        )

    fn cmd_set_rendering_input_attachment_indices(
        self,
        command_buffer: CommandBuffer,
        input_attachment_index_info: RenderingInputAttachmentIndexInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRenderingInputAttachmentIndices.html
        """
        return self._cmd_set_rendering_input_attachment_indices(
            command_buffer, Ptr(to=input_attachment_index_info).bitcast[RenderingInputAttachmentIndexInfo]()
        )


struct PresentWait(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _wait_for_present_khr: fn(
        device: Device, swapchain: SwapchainKHR, present_id: UInt64, timeout: UInt64
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._wait_for_present_khr = Ptr(to=get_device_proc_addr(
            device, "vkWaitForPresentKHR".as_c_string_slice()
        )).bitcast[type_of(self._wait_for_present_khr)]()[]

    fn wait_for_present_khr(
        self, device: Device, swapchain: SwapchainKHR, present_id: UInt64, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForPresentKHR.html
        """
        return self._wait_for_present_khr(device, swapchain, present_id, timeout)


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
        return self._get_buffer_device_address(device, Ptr(to=info).bitcast[BufferDeviceAddressInfo]())

    fn get_buffer_opaque_capture_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureAddress.html
        """
        return self._get_buffer_opaque_capture_address(
            device, Ptr(to=info).bitcast[BufferDeviceAddressInfo]()
        )

    fn get_device_memory_opaque_capture_address(
        self, device: Device, info: DeviceMemoryOpaqueCaptureAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryOpaqueCaptureAddress.html
        """
        return self._get_device_memory_opaque_capture_address(
            device, Ptr(to=info).bitcast[DeviceMemoryOpaqueCaptureAddressInfo]()
        )


struct DeferredHostOperations(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_deferred_operation_khr: fn(
        device: Device,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_deferred_operation: Ptr[DeferredOperationKHR, MutAnyOrigin],
    ) -> Result
    var _destroy_deferred_operation_khr: fn(
        device: Device,
        operation: DeferredOperationKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_deferred_operation_max_concurrency_khr: fn(
        device: Device, operation: DeferredOperationKHR
    ) -> UInt32
    var _get_deferred_operation_result_khr: fn(
        device: Device, operation: DeferredOperationKHR
    ) -> Result
    var _deferred_operation_join_khr: fn(device: Device, operation: DeferredOperationKHR) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_deferred_operation_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreateDeferredOperationKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_deferred_operation_khr)]()[]
        self._destroy_deferred_operation_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDeferredOperationKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_deferred_operation_khr)]()[]
        self._get_deferred_operation_max_concurrency_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeferredOperationMaxConcurrencyKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_deferred_operation_max_concurrency_khr)]()[]
        self._get_deferred_operation_result_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeferredOperationResultKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_deferred_operation_result_khr)]()[]
        self._deferred_operation_join_khr = Ptr(to=get_device_proc_addr(
            device, "vkDeferredOperationJoinKHR".as_c_string_slice()
        )).bitcast[type_of(self._deferred_operation_join_khr)]()[]

    fn create_deferred_operation_khr(
        self,
        device: Device,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut deferred_operation: DeferredOperationKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDeferredOperationKHR.html
        """
        return self._create_deferred_operation_khr(
            device, p_allocator, Ptr(to=deferred_operation).bitcast[DeferredOperationKHR]()
        )

    fn destroy_deferred_operation_khr(
        self,
        device: Device,
        operation: DeferredOperationKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDeferredOperationKHR.html
        """
        return self._destroy_deferred_operation_khr(device, operation, p_allocator)

    fn get_deferred_operation_max_concurrency_khr(
        self, device: Device, operation: DeferredOperationKHR
    ) -> UInt32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeferredOperationMaxConcurrencyKHR.html
        """
        return self._get_deferred_operation_max_concurrency_khr(device, operation)

    fn get_deferred_operation_result_khr(
        self, device: Device, operation: DeferredOperationKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeferredOperationResultKHR.html
        """
        return self._get_deferred_operation_result_khr(device, operation)

    fn deferred_operation_join_khr(
        self, device: Device, operation: DeferredOperationKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeferredOperationJoinKHR.html
        """
        return self._deferred_operation_join_khr(device, operation)


struct PipelineExecutableProperties(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_pipeline_executable_properties_khr: fn(
        device: Device,
        p_pipeline_info: Ptr[PipelineInfoKHR, ImmutAnyOrigin],
        p_executable_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[PipelineExecutablePropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_pipeline_executable_statistics_khr: fn(
        device: Device,
        p_executable_info: Ptr[PipelineExecutableInfoKHR, ImmutAnyOrigin],
        p_statistic_count: Ptr[UInt32, MutAnyOrigin],
        p_statistics: Ptr[PipelineExecutableStatisticKHR, MutAnyOrigin],
    ) -> Result
    var _get_pipeline_executable_internal_representations_khr: fn(
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
        self._get_pipeline_executable_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineExecutablePropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_executable_properties_khr)]()[]
        self._get_pipeline_executable_statistics_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineExecutableStatisticsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_executable_statistics_khr)]()[]
        self._get_pipeline_executable_internal_representations_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineExecutableInternalRepresentationsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_executable_internal_representations_khr)]()[]

    fn get_pipeline_executable_properties_khr(
        self,
        device: Device,
        pipeline_info: PipelineInfoKHR,
        mut executable_count: UInt32,
        p_properties: Ptr[PipelineExecutablePropertiesKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineExecutablePropertiesKHR.html
        """
        return self._get_pipeline_executable_properties_khr(
            device,
            Ptr(to=pipeline_info).bitcast[PipelineInfoKHR](),
            Ptr(to=executable_count).bitcast[UInt32](),
            p_properties,
        )

    fn get_pipeline_executable_statistics_khr(
        self,
        device: Device,
        executable_info: PipelineExecutableInfoKHR,
        mut statistic_count: UInt32,
        p_statistics: Ptr[PipelineExecutableStatisticKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineExecutableStatisticsKHR.html
        """
        return self._get_pipeline_executable_statistics_khr(
            device,
            Ptr(to=executable_info).bitcast[PipelineExecutableInfoKHR](),
            Ptr(to=statistic_count).bitcast[UInt32](),
            p_statistics,
        )

    fn get_pipeline_executable_internal_representations_khr(
        self,
        device: Device,
        executable_info: PipelineExecutableInfoKHR,
        mut internal_representation_count: UInt32,
        p_internal_representations: Ptr[PipelineExecutableInternalRepresentationKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineExecutableInternalRepresentationsKHR.html
        """
        return self._get_pipeline_executable_internal_representations_khr(
            device,
            Ptr(to=executable_info).bitcast[PipelineExecutableInfoKHR](),
            Ptr(to=internal_representation_count).bitcast[UInt32](),
            p_internal_representations,
        )


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

    fn map_memory_2(
        self,
        device: Device,
        memory_map_info: MemoryMapInfo,
        mut p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMapMemory2.html
        """
        return self._map_memory_2(
            device,
            Ptr(to=memory_map_info).bitcast[MemoryMapInfo](),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]](),
        )

    fn unmap_memory_2(self, device: Device, memory_unmap_info: MemoryUnmapInfo) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory2.html
        """
        return self._unmap_memory_2(device, Ptr(to=memory_unmap_info).bitcast[MemoryUnmapInfo]())


struct VideoEncodeQueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_video_encode_quality_level_properties_khr: fn(
        physical_device: PhysicalDevice,
        p_quality_level_info: Ptr[PhysicalDeviceVideoEncodeQualityLevelInfoKHR, ImmutAnyOrigin],
        p_quality_level_properties: Ptr[VideoEncodeQualityLevelPropertiesKHR, MutAnyOrigin],
    ) -> Result
    var _get_encoded_video_session_parameters_khr: fn(
        device: Device,
        p_video_session_parameters_info: Ptr[VideoEncodeSessionParametersGetInfoKHR, ImmutAnyOrigin],
        p_feedback_info: Ptr[VideoEncodeSessionParametersFeedbackInfoKHR, MutAnyOrigin],
        p_data_size: Ptr[UInt, MutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _cmd_encode_video_khr: fn(
        command_buffer: CommandBuffer, p_encode_info: Ptr[VideoEncodeInfoKHR, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_video_encode_quality_level_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_video_encode_quality_level_properties_khr)]()[]
        self._get_encoded_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetEncodedVideoSessionParametersKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_encoded_video_session_parameters_khr)]()[]
        self._cmd_encode_video_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdEncodeVideoKHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_encode_video_khr)]()[]

    fn get_physical_device_video_encode_quality_level_properties_khr(
        self,
        physical_device: PhysicalDevice,
        quality_level_info: PhysicalDeviceVideoEncodeQualityLevelInfoKHR,
        mut quality_level_properties: VideoEncodeQualityLevelPropertiesKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR.html
        """
        return self._get_physical_device_video_encode_quality_level_properties_khr(
            physical_device,
            Ptr(to=quality_level_info).bitcast[PhysicalDeviceVideoEncodeQualityLevelInfoKHR](),
            Ptr(to=quality_level_properties).bitcast[VideoEncodeQualityLevelPropertiesKHR](),
        )

    fn get_encoded_video_session_parameters_khr(
        self,
        device: Device,
        video_session_parameters_info: VideoEncodeSessionParametersGetInfoKHR,
        p_feedback_info: Ptr[VideoEncodeSessionParametersFeedbackInfoKHR, MutAnyOrigin],
        mut data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEncodedVideoSessionParametersKHR.html
        """
        return self._get_encoded_video_session_parameters_khr(
            device,
            Ptr(to=video_session_parameters_info).bitcast[VideoEncodeSessionParametersGetInfoKHR](),
            p_feedback_info,
            Ptr(to=data_size).bitcast[UInt](),
            p_data,
        )

    fn cmd_encode_video_khr(self, command_buffer: CommandBuffer, encode_info: VideoEncodeInfoKHR):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEncodeVideoKHR.html
        """
        return self._cmd_encode_video_khr(command_buffer, Ptr(to=encode_info).bitcast[VideoEncodeInfoKHR]())


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
        return self._cmd_set_event_2(
            command_buffer, event, Ptr(to=dependency_info).bitcast[DependencyInfo]()
        )

    fn cmd_reset_event_2(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent2.html
        """
        return self._cmd_reset_event_2(command_buffer, event, stage_mask)

    fn cmd_wait_events_2(
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        p_dependency_infos: Ptr[DependencyInfo, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents2.html
        """
        return self._cmd_wait_events_2(command_buffer, event_count, p_events, p_dependency_infos)

    fn cmd_pipeline_barrier_2(
        self, command_buffer: CommandBuffer, dependency_info: DependencyInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier2.html
        """
        return self._cmd_pipeline_barrier_2(
            command_buffer, Ptr(to=dependency_info).bitcast[DependencyInfo]()
        )

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

    fn queue_submit_2(
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo2, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit2.html
        """
        return self._queue_submit_2(queue, submit_count, p_submits, fence)


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
        return self._cmd_copy_buffer_2(command_buffer, Ptr(to=copy_buffer_info).bitcast[CopyBufferInfo2]())

    fn cmd_copy_image_2(self, command_buffer: CommandBuffer, copy_image_info: CopyImageInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage2.html
        """
        return self._cmd_copy_image_2(command_buffer, Ptr(to=copy_image_info).bitcast[CopyImageInfo2]())

    fn cmd_copy_buffer_to_image_2(
        self, command_buffer: CommandBuffer, copy_buffer_to_image_info: CopyBufferToImageInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage2.html
        """
        return self._cmd_copy_buffer_to_image_2(
            command_buffer, Ptr(to=copy_buffer_to_image_info).bitcast[CopyBufferToImageInfo2]()
        )

    fn cmd_copy_image_to_buffer_2(
        self, command_buffer: CommandBuffer, copy_image_to_buffer_info: CopyImageToBufferInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer2.html
        """
        return self._cmd_copy_image_to_buffer_2(
            command_buffer, Ptr(to=copy_image_to_buffer_info).bitcast[CopyImageToBufferInfo2]()
        )

    fn cmd_blit_image_2(self, command_buffer: CommandBuffer, blit_image_info: BlitImageInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage2.html
        """
        return self._cmd_blit_image_2(command_buffer, Ptr(to=blit_image_info).bitcast[BlitImageInfo2]())

    fn cmd_resolve_image_2(
        self, command_buffer: CommandBuffer, resolve_image_info: ResolveImageInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage2.html
        """
        return self._cmd_resolve_image_2(
            command_buffer, Ptr(to=resolve_image_info).bitcast[ResolveImageInfo2]()
        )


struct RayTracingMaintenance1(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_trace_rays_indirect_2_khr: fn(
        command_buffer: CommandBuffer, indirect_device_address: DeviceAddress
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_trace_rays_indirect_2_khr = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysIndirect2KHR".as_c_string_slice()
        )).bitcast[type_of(self._cmd_trace_rays_indirect_2_khr)]()[]

    fn cmd_trace_rays_indirect_2_khr(
        self, command_buffer: CommandBuffer, indirect_device_address: DeviceAddress
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdTraceRaysIndirect2KHR.html
        """
        return self._cmd_trace_rays_indirect_2_khr(command_buffer, indirect_device_address)


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
            device,
            Ptr(to=info).bitcast[DeviceBufferMemoryRequirements](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
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
        return self._get_device_image_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceImageMemoryRequirements](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn get_device_image_sparse_memory_requirements(
        self,
        device: Device,
        info: DeviceImageMemoryRequirements,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        return self._get_device_image_sparse_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceImageMemoryRequirements](),
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32](),
            p_sparse_memory_requirements,
        )


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
            device,
            Ptr(to=rendering_area_info).bitcast[RenderingAreaInfo](),
            Ptr(to=granularity).bitcast[Extent2D](),
        )

    fn get_device_image_subresource_layout(
        self, device: Device, info: DeviceImageSubresourceInfo, mut layout: SubresourceLayout2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSubresourceLayout.html
        """
        return self._get_device_image_subresource_layout(
            device,
            Ptr(to=info).bitcast[DeviceImageSubresourceInfo](),
            Ptr(to=layout).bitcast[SubresourceLayout2](),
        )

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
        return self._get_image_subresource_layout_2(
            device,
            image,
            Ptr(to=subresource).bitcast[ImageSubresource2](),
            Ptr(to=layout).bitcast[SubresourceLayout2](),
        )


struct PresentWait2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _wait_for_present_2_khr: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_present_wait_2_info: Ptr[PresentWait2InfoKHR, ImmutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._wait_for_present_2_khr = Ptr(to=get_device_proc_addr(
            device, "vkWaitForPresent2KHR".as_c_string_slice()
        )).bitcast[type_of(self._wait_for_present_2_khr)]()[]

    fn wait_for_present_2_khr(
        self, device: Device, swapchain: SwapchainKHR, present_wait_2_info: PresentWait2InfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForPresent2KHR.html
        """
        return self._wait_for_present_2_khr(
            device, swapchain, Ptr(to=present_wait_2_info).bitcast[PresentWait2InfoKHR]()
        )


struct PipelineBinary(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_pipeline_binaries_khr: fn(
        device: Device,
        p_create_info: Ptr[PipelineBinaryCreateInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_binaries: Ptr[PipelineBinaryHandlesInfoKHR, MutAnyOrigin],
    ) -> Result
    var _destroy_pipeline_binary_khr: fn(
        device: Device,
        pipeline_binary: PipelineBinaryKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_pipeline_key_khr: fn(
        device: Device,
        p_pipeline_create_info: Ptr[PipelineCreateInfoKHR, ImmutAnyOrigin],
        p_pipeline_key: Ptr[PipelineBinaryKeyKHR, MutAnyOrigin],
    ) -> Result
    var _get_pipeline_binary_data_khr: fn(
        device: Device,
        p_info: Ptr[PipelineBinaryDataInfoKHR, ImmutAnyOrigin],
        p_pipeline_binary_key: Ptr[PipelineBinaryKeyKHR, MutAnyOrigin],
        p_pipeline_binary_data_size: Ptr[UInt, MutAnyOrigin],
        p_pipeline_binary_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _release_captured_pipeline_data_khr: fn(
        device: Device,
        p_info: Ptr[ReleaseCapturedPipelineDataInfoKHR, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_pipeline_binaries_khr = Ptr(to=get_device_proc_addr(
            device, "vkCreatePipelineBinariesKHR".as_c_string_slice()
        )).bitcast[type_of(self._create_pipeline_binaries_khr)]()[]
        self._destroy_pipeline_binary_khr = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPipelineBinaryKHR".as_c_string_slice()
        )).bitcast[type_of(self._destroy_pipeline_binary_khr)]()[]
        self._get_pipeline_key_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineKeyKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_key_khr)]()[]
        self._get_pipeline_binary_data_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineBinaryDataKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_binary_data_khr)]()[]
        self._release_captured_pipeline_data_khr = Ptr(to=get_device_proc_addr(
            device, "vkReleaseCapturedPipelineDataKHR".as_c_string_slice()
        )).bitcast[type_of(self._release_captured_pipeline_data_khr)]()[]

    fn create_pipeline_binaries_khr(
        self,
        device: Device,
        create_info: PipelineBinaryCreateInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut binaries: PipelineBinaryHandlesInfoKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineBinariesKHR.html
        """
        return self._create_pipeline_binaries_khr(
            device,
            Ptr(to=create_info).bitcast[PipelineBinaryCreateInfoKHR](),
            p_allocator,
            Ptr(to=binaries).bitcast[PipelineBinaryHandlesInfoKHR](),
        )

    fn destroy_pipeline_binary_khr(
        self,
        device: Device,
        pipeline_binary: PipelineBinaryKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineBinaryKHR.html
        """
        return self._destroy_pipeline_binary_khr(device, pipeline_binary, p_allocator)

    fn get_pipeline_key_khr(
        self,
        device: Device,
        p_pipeline_create_info: Ptr[PipelineCreateInfoKHR, ImmutAnyOrigin],
        mut pipeline_key: PipelineBinaryKeyKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineKeyKHR.html
        """
        return self._get_pipeline_key_khr(
            device, p_pipeline_create_info, Ptr(to=pipeline_key).bitcast[PipelineBinaryKeyKHR]()
        )

    fn get_pipeline_binary_data_khr(
        self,
        device: Device,
        info: PipelineBinaryDataInfoKHR,
        mut pipeline_binary_key: PipelineBinaryKeyKHR,
        mut pipeline_binary_data_size: UInt,
        p_pipeline_binary_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineBinaryDataKHR.html
        """
        return self._get_pipeline_binary_data_khr(
            device,
            Ptr(to=info).bitcast[PipelineBinaryDataInfoKHR](),
            Ptr(to=pipeline_binary_key).bitcast[PipelineBinaryKeyKHR](),
            Ptr(to=pipeline_binary_data_size).bitcast[UInt](),
            p_pipeline_binary_data,
        )

    fn release_captured_pipeline_data_khr(
        self,
        device: Device,
        info: ReleaseCapturedPipelineDataInfoKHR,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseCapturedPipelineDataKHR.html
        """
        return self._release_captured_pipeline_data_khr(
            device, Ptr(to=info).bitcast[ReleaseCapturedPipelineDataInfoKHR](), p_allocator
        )


struct SwapchainMaintenance1(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _release_swapchain_images_khr: fn(
        device: Device, p_release_info: Ptr[ReleaseSwapchainImagesInfoKHR, ImmutAnyOrigin]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._release_swapchain_images_khr = Ptr(to=get_device_proc_addr(
            device, "vkReleaseSwapchainImagesKHR".as_c_string_slice()
        )).bitcast[type_of(self._release_swapchain_images_khr)]()[]

    fn release_swapchain_images_khr(
        self, device: Device, release_info: ReleaseSwapchainImagesInfoKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseSwapchainImagesKHR.html
        """
        return self._release_swapchain_images_khr(
            device, Ptr(to=release_info).bitcast[ReleaseSwapchainImagesInfoKHR]()
        )


struct CooperativeMatrix(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_matrix_properties_khr: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[CooperativeMatrixPropertiesKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_matrix_properties_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_cooperative_matrix_properties_khr)]()[]

    fn get_physical_device_cooperative_matrix_properties_khr(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixPropertiesKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR.html
        """
        return self._get_physical_device_cooperative_matrix_properties_khr(
            physical_device, Ptr(to=property_count).bitcast[UInt32](), p_properties
        )


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
    var _get_physical_device_calibrateable_time_domains_khr: fn(
        physical_device: PhysicalDevice,
        p_time_domain_count: Ptr[UInt32, MutAnyOrigin],
        p_time_domains: Ptr[TimeDomainKHR, MutAnyOrigin],
    ) -> Result
    var _get_calibrated_timestamps_khr: fn(
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
        self._get_physical_device_calibrateable_time_domains_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_calibrateable_time_domains_khr)]()[]
        self._get_calibrated_timestamps_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetCalibratedTimestampsKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_calibrated_timestamps_khr)]()[]

    fn get_physical_device_calibrateable_time_domains_khr(
        self,
        physical_device: PhysicalDevice,
        mut time_domain_count: UInt32,
        p_time_domains: Ptr[TimeDomainKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCalibrateableTimeDomainsKHR.html
        """
        return self._get_physical_device_calibrateable_time_domains_khr(
            physical_device, Ptr(to=time_domain_count).bitcast[UInt32](), p_time_domains
        )

    fn get_calibrated_timestamps_khr(
        self,
        device: Device,
        timestamp_count: UInt32,
        p_timestamp_infos: Ptr[CalibratedTimestampInfoKHR, ImmutAnyOrigin],
        p_timestamps: Ptr[UInt64, MutAnyOrigin],
        mut max_deviation: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetCalibratedTimestampsKHR.html
        """
        return self._get_calibrated_timestamps_khr(
            device,
            timestamp_count,
            p_timestamp_infos,
            p_timestamps,
            Ptr(to=max_deviation).bitcast[UInt64](),
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
    var _cmd_set_descriptor_buffer_offsets_2_ext: fn(
        command_buffer: CommandBuffer,
        p_set_descriptor_buffer_offsets_info: Ptr[SetDescriptorBufferOffsetsInfoEXT, ImmutAnyOrigin],
    )
    var _cmd_bind_descriptor_buffer_embedded_samplers_2_ext: fn(
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
        self._cmd_set_descriptor_buffer_offsets_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDescriptorBufferOffsets2EXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_descriptor_buffer_offsets_2_ext)]()[]
        self._cmd_bind_descriptor_buffer_embedded_samplers_2_ext = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorBufferEmbeddedSamplers2EXT".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_descriptor_buffer_embedded_samplers_2_ext)]()[]

    fn cmd_bind_descriptor_sets_2(
        self, command_buffer: CommandBuffer, bind_descriptor_sets_info: BindDescriptorSetsInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorSets2.html
        """
        return self._cmd_bind_descriptor_sets_2(
            command_buffer, Ptr(to=bind_descriptor_sets_info).bitcast[BindDescriptorSetsInfo]()
        )

    fn cmd_push_constants_2(
        self, command_buffer: CommandBuffer, push_constants_info: PushConstantsInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants2.html
        """
        return self._cmd_push_constants_2(
            command_buffer, Ptr(to=push_constants_info).bitcast[PushConstantsInfo]()
        )

    fn cmd_push_descriptor_set_2(
        self, command_buffer: CommandBuffer, push_descriptor_set_info: PushDescriptorSetInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSet2.html
        """
        return self._cmd_push_descriptor_set_2(
            command_buffer, Ptr(to=push_descriptor_set_info).bitcast[PushDescriptorSetInfo]()
        )

    fn cmd_push_descriptor_set_with_template_2(
        self,
        command_buffer: CommandBuffer,
        push_descriptor_set_with_template_info: PushDescriptorSetWithTemplateInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate2.html
        """
        return self._cmd_push_descriptor_set_with_template_2(
            command_buffer,
            Ptr(to=push_descriptor_set_with_template_info).bitcast[PushDescriptorSetWithTemplateInfo](),
        )

    fn cmd_set_descriptor_buffer_offsets_2_ext(
        self,
        command_buffer: CommandBuffer,
        set_descriptor_buffer_offsets_info: SetDescriptorBufferOffsetsInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDescriptorBufferOffsets2EXT.html
        """
        return self._cmd_set_descriptor_buffer_offsets_2_ext(
            command_buffer,
            Ptr(to=set_descriptor_buffer_offsets_info).bitcast[SetDescriptorBufferOffsetsInfoEXT](),
        )

    fn cmd_bind_descriptor_buffer_embedded_samplers_2_ext(
        self,
        command_buffer: CommandBuffer,
        bind_descriptor_buffer_embedded_samplers_info: BindDescriptorBufferEmbeddedSamplersInfoEXT,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorBufferEmbeddedSamplers2EXT.html
        """
        return self._cmd_bind_descriptor_buffer_embedded_samplers_2_ext(
            command_buffer,
            Ptr(to=bind_descriptor_buffer_embedded_samplers_info).bitcast[BindDescriptorBufferEmbeddedSamplersInfoEXT](),
        )
