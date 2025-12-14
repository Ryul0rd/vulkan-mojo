from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_destroy_surface_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkDestroySurfaceKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_surface_khr)]()[]
    self._vk_get_physical_device_surface_support_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceSurfaceSupportKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_surface_support_khr)]()[]
    self._vk_get_physical_device_surface_capabilities_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceSurfaceCapabilitiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_surface_capabilities_khr)]()[]
    self._vk_get_physical_device_surface_formats_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceSurfaceFormatsKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_surface_formats_khr)]()[]
    self._vk_get_physical_device_surface_present_modes_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceSurfacePresentModesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_surface_present_modes_khr)]()[]

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
            physical_device,
            surface,
            Ptr(to=surface_format_count).bitcast[UInt32](),
            p_surface_formats,
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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_swapchain_khr = Ptr(to=get_device_proc_addr(
        device, "vkCreateSwapchainKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_swapchain_khr)]()[]
    self._vk_destroy_swapchain_khr = Ptr(to=get_device_proc_addr(
        device, "vkDestroySwapchainKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_swapchain_khr)]()[]
    self._vk_get_swapchain_images_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetSwapchainImagesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_swapchain_images_khr)]()[]
    self._vk_acquire_next_image_khr = Ptr(to=get_device_proc_addr(
        device, "vkAcquireNextImageKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_acquire_next_image_khr)]()[]
    self._vk_queue_present_khr = Ptr(to=get_device_proc_addr(
        device, "vkQueuePresentKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_queue_present_khr)]()[]
    self._vk_get_device_group_present_capabilities_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceGroupPresentCapabilitiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_group_present_capabilities_khr)]()[]
    self._vk_get_device_group_surface_present_modes_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceGroupSurfacePresentModesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_group_surface_present_modes_khr)]()[]
    self._vk_get_physical_device_present_rectangles_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDevicePresentRectanglesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_present_rectangles_khr)]()[]
    self._vk_acquire_next_image_2_khr = Ptr(to=get_device_proc_addr(
        device, "vkAcquireNextImage2KHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_acquire_next_image_2_khr)]()[]

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
            device,
            Ptr(to=device_group_present_capabilities).bitcast[DeviceGroupPresentCapabilitiesKHR](),
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

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_get_physical_device_display_properties_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceDisplayPropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_display_properties_khr)]()[]
    self._vk_get_physical_device_display_plane_properties_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceDisplayPlanePropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_display_plane_properties_khr)]()[]
    self._vk_get_display_plane_supported_displays_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetDisplayPlaneSupportedDisplaysKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_display_plane_supported_displays_khr)]()[]
    self._vk_get_display_mode_properties_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetDisplayModePropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_display_mode_properties_khr)]()[]
    self._vk_create_display_mode_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateDisplayModeKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_display_mode_khr)]()[]
    self._vk_get_display_plane_capabilities_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetDisplayPlaneCapabilitiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_display_plane_capabilities_khr)]()[]
    self._vk_create_display_plane_surface_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateDisplayPlaneSurfaceKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_display_plane_surface_khr)]()[]

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
            physical_device,
            mode,
            plane_index,
            Ptr(to=capabilities).bitcast[DisplayPlaneCapabilitiesKHR](),
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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_shared_swapchains_khr = Ptr(to=get_device_proc_addr(
        device, "vkCreateSharedSwapchainsKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_shared_swapchains_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_xlib_surface_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateXlibSurfaceKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_xlib_surface_khr)]()[]
    self._vk_get_physical_device_xlib_presentation_support_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceXlibPresentationSupportKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_xlib_presentation_support_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_xcb_surface_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateXcbSurfaceKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_xcb_surface_khr)]()[]
    self._vk_get_physical_device_xcb_presentation_support_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceXcbPresentationSupportKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_xcb_presentation_support_khr)]()[]

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
            physical_device,
            queue_family_index,
            Ptr(to=connection).bitcast[xcb_connection_t](),
            visual_id,
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_wayland_surface_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateWaylandSurfaceKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_wayland_surface_khr)]()[]
    self._vk_get_physical_device_wayland_presentation_support_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceWaylandPresentationSupportKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_wayland_presentation_support_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_android_surface_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateAndroidSurfaceKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_android_surface_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_win_32_surface_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateWin32SurfaceKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_win_32_surface_khr)]()[]
    self._vk_get_physical_device_win_32_presentation_support_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceWin32PresentationSupportKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_win_32_presentation_support_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_video_capabilities_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceVideoCapabilitiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_video_capabilities_khr)]()[]
    self._vk_get_physical_device_video_format_properties_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceVideoFormatPropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_video_format_properties_khr)]()[]
    self._vk_create_video_session_khr = Ptr(to=get_device_proc_addr(
        device, "vkCreateVideoSessionKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_video_session_khr)]()[]
    self._vk_destroy_video_session_khr = Ptr(to=get_device_proc_addr(
        device, "vkDestroyVideoSessionKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_video_session_khr)]()[]
    self._vk_get_video_session_memory_requirements_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetVideoSessionMemoryRequirementsKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_video_session_memory_requirements_khr)]()[]
    self._vk_bind_video_session_memory_khr = Ptr(to=get_device_proc_addr(
        device, "vkBindVideoSessionMemoryKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_bind_video_session_memory_khr)]()[]
    self._vk_create_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
        device, "vkCreateVideoSessionParametersKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_video_session_parameters_khr)]()[]
    self._vk_update_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
        device, "vkUpdateVideoSessionParametersKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_update_video_session_parameters_khr)]()[]
    self._vk_destroy_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
        device, "vkDestroyVideoSessionParametersKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_video_session_parameters_khr)]()[]
    self._vk_cmd_begin_video_coding_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdBeginVideoCodingKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_begin_video_coding_khr)]()[]
    self._vk_cmd_end_video_coding_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdEndVideoCodingKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_end_video_coding_khr)]()[]
    self._vk_cmd_control_video_coding_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdControlVideoCodingKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_control_video_coding_khr)]()[]

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
        return self._destroy_video_session_parameters_khr(
            device, video_session_parameters, p_allocator
        )

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_decode_video_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdDecodeVideoKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_decode_video_khr)]()[]

    fn cmd_decode_video_khr(self, command_buffer: CommandBuffer, decode_info: VideoDecodeInfoKHR):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecodeVideoKHR.html
        """
        return self._cmd_decode_video_khr(
            command_buffer, Ptr(to=decode_info).bitcast[VideoDecodeInfoKHR]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_begin_rendering = Ptr(to=get_device_proc_addr(
        device, "vkCmdBeginRendering".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_begin_rendering)]()[]
    self._vk_cmd_end_rendering = Ptr(to=get_device_proc_addr(
        device, "vkCmdEndRendering".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_end_rendering)]()[]

    fn cmd_begin_rendering(self, command_buffer: CommandBuffer, rendering_info: RenderingInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRendering.html
        """
        return self._cmd_begin_rendering(
            command_buffer, Ptr(to=rendering_info).bitcast[RenderingInfo]()
        )

    fn cmd_end_rendering(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering.html
        """
        return self._cmd_end_rendering(command_buffer)

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_get_physical_device_features_2 = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceFeatures2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_features_2)]()[]
    self._vk_get_physical_device_properties_2 = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceProperties2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_properties_2)]()[]
    self._vk_get_physical_device_format_properties_2 = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceFormatProperties2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_format_properties_2)]()[]
    self._vk_get_physical_device_image_format_properties_2 = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceImageFormatProperties2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_image_format_properties_2)]()[]
    self._vk_get_physical_device_queue_family_properties_2 = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceQueueFamilyProperties2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_queue_family_properties_2)]()[]
    self._vk_get_physical_device_memory_properties_2 = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceMemoryProperties2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_memory_properties_2)]()[]
    self._vk_get_physical_device_sparse_image_format_properties_2 = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceSparseImageFormatProperties2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_sparse_image_format_properties_2)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_device_group_peer_memory_features = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceGroupPeerMemoryFeatures".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_group_peer_memory_features)]()[]
    self._vk_cmd_set_device_mask = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDeviceMask".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_device_mask)]()[]
    self._vk_cmd_dispatch_base = Ptr(to=get_device_proc_addr(
        device, "vkCmdDispatchBase".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_dispatch_base)]()[]
    self._vk_get_device_group_present_capabilities_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceGroupPresentCapabilitiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_group_present_capabilities_khr)]()[]
    self._vk_get_device_group_surface_present_modes_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceGroupSurfacePresentModesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_group_surface_present_modes_khr)]()[]
    self._vk_get_physical_device_present_rectangles_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDevicePresentRectanglesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_present_rectangles_khr)]()[]
    self._vk_acquire_next_image_2_khr = Ptr(to=get_device_proc_addr(
        device, "vkAcquireNextImage2KHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_acquire_next_image_2_khr)]()[]

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
            device,
            Ptr(to=device_group_present_capabilities).bitcast[DeviceGroupPresentCapabilitiesKHR](),
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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_trim_command_pool = Ptr(to=get_device_proc_addr(
        device, "vkTrimCommandPool".unsafe_ptr()
    )).bitcast[type_of(self._vk_trim_command_pool)]()[]

    fn trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTrimCommandPool.html
        """
        return self._trim_command_pool(device, command_pool, flags)

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_enumerate_physical_device_groups = Ptr(to=get_instance_proc_addr(
        instance, "vkEnumeratePhysicalDeviceGroups".unsafe_ptr()
    )).bitcast[type_of(self._vk_enumerate_physical_device_groups)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_get_physical_device_external_buffer_properties = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceExternalBufferProperties".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_external_buffer_properties)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_memory_win_32_handle_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryWin32HandleKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_win_32_handle_khr)]()[]
    self._vk_get_memory_win_32_handle_properties_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryWin32HandlePropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_win_32_handle_properties_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_memory_fd_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryFdKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_fd_khr)]()[]
    self._vk_get_memory_fd_properties_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryFdPropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_fd_properties_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_get_physical_device_external_semaphore_properties = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceExternalSemaphoreProperties".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_external_semaphore_properties)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_import_semaphore_win_32_handle_khr = Ptr(to=get_device_proc_addr(
        device, "vkImportSemaphoreWin32HandleKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_import_semaphore_win_32_handle_khr)]()[]
    self._vk_get_semaphore_win_32_handle_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetSemaphoreWin32HandleKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_semaphore_win_32_handle_khr)]()[]

    fn import_semaphore_win_32_handle_khr(
        self, device: Device, import_semaphore_win_32_handle_info: ImportSemaphoreWin32HandleInfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportSemaphoreWin32HandleKHR.html
        """
        return self._import_semaphore_win_32_handle_khr(
            device,
            Ptr(to=import_semaphore_win_32_handle_info).bitcast[ImportSemaphoreWin32HandleInfoKHR](),
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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_import_semaphore_fd_khr = Ptr(to=get_device_proc_addr(
        device, "vkImportSemaphoreFdKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_import_semaphore_fd_khr)]()[]
    self._vk_get_semaphore_fd_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetSemaphoreFdKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_semaphore_fd_khr)]()[]

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
            device,
            Ptr(to=get_fd_info).bitcast[SemaphoreGetFdInfoKHR](),
            Ptr(to=fd).bitcast[Int32](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_push_descriptor_set = Ptr(to=get_device_proc_addr(
        device, "vkCmdPushDescriptorSet".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_push_descriptor_set)]()[]
    self._vk_cmd_push_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
        device, "vkCmdPushDescriptorSetWithTemplate".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_push_descriptor_set_with_template)]()[]

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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate.html
        """
        return self._cmd_push_descriptor_set_with_template(
            command_buffer,
            descriptor_update_template,
            layout,
            set,
            Ptr(to=data).bitcast[NoneType](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_descriptor_update_template = Ptr(to=get_device_proc_addr(
        device, "vkCreateDescriptorUpdateTemplate".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_descriptor_update_template)]()[]
    self._vk_destroy_descriptor_update_template = Ptr(to=get_device_proc_addr(
        device, "vkDestroyDescriptorUpdateTemplate".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_descriptor_update_template)]()[]
    self._vk_update_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
        device, "vkUpdateDescriptorSetWithTemplate".unsafe_ptr()
    )).bitcast[type_of(self._vk_update_descriptor_set_with_template)]()[]
    self._vk_cmd_push_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
        device, "vkCmdPushDescriptorSetWithTemplate".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_push_descriptor_set_with_template)]()[]

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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._update_descriptor_set_with_template(
            device, descriptor_set, descriptor_update_template, Ptr(to=data).bitcast[NoneType]()
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate.html
        """
        return self._cmd_push_descriptor_set_with_template(
            command_buffer,
            descriptor_update_template,
            layout,
            set,
            Ptr(to=data).bitcast[NoneType](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_render_pass_2 = Ptr(to=get_device_proc_addr(
        device, "vkCreateRenderPass2".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_render_pass_2)]()[]
    self._vk_cmd_begin_render_pass_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdBeginRenderPass2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_begin_render_pass_2)]()[]
    self._vk_cmd_next_subpass_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdNextSubpass2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_next_subpass_2)]()[]
    self._vk_cmd_end_render_pass_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdEndRenderPass2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_end_render_pass_2)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_swapchain_status_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetSwapchainStatusKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_swapchain_status_khr)]()[]

    fn get_swapchain_status_khr(self, device: Device, swapchain: SwapchainKHR) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainStatusKHR.html
        """
        return self._get_swapchain_status_khr(device, swapchain)

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_get_physical_device_external_fence_properties = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceExternalFenceProperties".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_external_fence_properties)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_import_fence_win_32_handle_khr = Ptr(to=get_device_proc_addr(
        device, "vkImportFenceWin32HandleKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_import_fence_win_32_handle_khr)]()[]
    self._vk_get_fence_win_32_handle_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetFenceWin32HandleKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_fence_win_32_handle_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_import_fence_fd_khr = Ptr(to=get_device_proc_addr(
        device, "vkImportFenceFdKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_import_fence_fd_khr)]()[]
    self._vk_get_fence_fd_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetFenceFdKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_fence_fd_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_enumerate_physical_device_queue_family_performance_query_counters_khr = Ptr(to=get_device_proc_addr(
        device, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceQueryCountersKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_enumerate_physical_device_queue_family_performance_query_counters_khr)]()[]
    self._vk_get_physical_device_queue_family_performance_query_passes_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceQueueFamilyPerformanceQueryPassesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_queue_family_performance_query_passes_khr)]()[]
    self._vk_acquire_profiling_lock_khr = Ptr(to=get_device_proc_addr(
        device, "vkAcquireProfilingLockKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_acquire_profiling_lock_khr)]()[]
    self._vk_release_profiling_lock_khr = Ptr(to=get_device_proc_addr(
        device, "vkReleaseProfilingLockKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_release_profiling_lock_khr)]()[]

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
        return self._acquire_profiling_lock_khr(
            device, Ptr(to=info).bitcast[AcquireProfilingLockInfoKHR]()
        )

    fn release_profiling_lock_khr(self, device: Device):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseProfilingLockKHR.html
        """
        return self._release_profiling_lock_khr(device)

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_get_physical_device_surface_capabilities_2_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceSurfaceCapabilities2KHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_surface_capabilities_2_khr)]()[]
    self._vk_get_physical_device_surface_formats_2_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceSurfaceFormats2KHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_surface_formats_2_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_get_physical_device_display_properties_2_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceDisplayProperties2KHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_display_properties_2_khr)]()[]
    self._vk_get_physical_device_display_plane_properties_2_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceDisplayPlaneProperties2KHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_display_plane_properties_2_khr)]()[]
    self._vk_get_display_mode_properties_2_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetDisplayModeProperties2KHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_display_mode_properties_2_khr)]()[]
    self._vk_get_display_plane_capabilities_2_khr = Ptr(to=get_instance_proc_addr(
        instance, "vkGetDisplayPlaneCapabilities2KHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_display_plane_capabilities_2_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_image_memory_requirements_2 = Ptr(to=get_device_proc_addr(
        device, "vkGetImageMemoryRequirements2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_memory_requirements_2)]()[]
    self._vk_get_buffer_memory_requirements_2 = Ptr(to=get_device_proc_addr(
        device, "vkGetBufferMemoryRequirements2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_buffer_memory_requirements_2)]()[]
    self._vk_get_image_sparse_memory_requirements_2 = Ptr(to=get_device_proc_addr(
        device, "vkGetImageSparseMemoryRequirements2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_sparse_memory_requirements_2)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
        device, "vkCreateAccelerationStructureKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_acceleration_structure_khr)]()[]
    self._vk_destroy_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
        device, "vkDestroyAccelerationStructureKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_acceleration_structure_khr)]()[]
    self._vk_cmd_build_acceleration_structures_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdBuildAccelerationStructuresKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_build_acceleration_structures_khr)]()[]
    self._vk_cmd_build_acceleration_structures_indirect_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdBuildAccelerationStructuresIndirectKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_build_acceleration_structures_indirect_khr)]()[]
    self._vk_build_acceleration_structures_khr = Ptr(to=get_device_proc_addr(
        device, "vkBuildAccelerationStructuresKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_build_acceleration_structures_khr)]()[]
    self._vk_copy_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
        device, "vkCopyAccelerationStructureKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_copy_acceleration_structure_khr)]()[]
    self._vk_copy_acceleration_structure_to_memory_khr = Ptr(to=get_device_proc_addr(
        device, "vkCopyAccelerationStructureToMemoryKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_copy_acceleration_structure_to_memory_khr)]()[]
    self._vk_copy_memory_to_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
        device, "vkCopyMemoryToAccelerationStructureKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_copy_memory_to_acceleration_structure_khr)]()[]
    self._vk_write_acceleration_structures_properties_khr = Ptr(to=get_device_proc_addr(
        device, "vkWriteAccelerationStructuresPropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_write_acceleration_structures_properties_khr)]()[]
    self._vk_cmd_copy_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyAccelerationStructureKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_acceleration_structure_khr)]()[]
    self._vk_cmd_copy_acceleration_structure_to_memory_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyAccelerationStructureToMemoryKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_acceleration_structure_to_memory_khr)]()[]
    self._vk_cmd_copy_memory_to_acceleration_structure_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyMemoryToAccelerationStructureKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_memory_to_acceleration_structure_khr)]()[]
    self._vk_get_acceleration_structure_device_address_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetAccelerationStructureDeviceAddressKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_acceleration_structure_device_address_khr)]()[]
    self._vk_cmd_write_acceleration_structures_properties_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdWriteAccelerationStructuresPropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_write_acceleration_structures_properties_khr)]()[]
    self._vk_get_device_acceleration_structure_compatibility_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceAccelerationStructureCompatibilityKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_acceleration_structure_compatibility_khr)]()[]
    self._vk_get_acceleration_structure_build_sizes_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetAccelerationStructureBuildSizesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_acceleration_structure_build_sizes_khr)]()[]

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
        return self._destroy_acceleration_structure_khr(
            device, acceleration_structure, p_allocator
        )

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
            device,
            deferred_operation,
            Ptr(to=info).bitcast[CopyAccelerationStructureToMemoryInfoKHR](),
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
            device,
            deferred_operation,
            Ptr(to=info).bitcast[CopyMemoryToAccelerationStructureInfoKHR](),
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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_trace_rays_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdTraceRaysKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_trace_rays_khr)]()[]
    self._vk_create_ray_tracing_pipelines_khr = Ptr(to=get_device_proc_addr(
        device, "vkCreateRayTracingPipelinesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_ray_tracing_pipelines_khr)]()[]
    self._vk_get_ray_tracing_shader_group_handles_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetRayTracingShaderGroupHandlesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_ray_tracing_shader_group_handles_khr)]()[]
    self._vk_get_ray_tracing_capture_replay_shader_group_handles_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetRayTracingCaptureReplayShaderGroupHandlesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_ray_tracing_capture_replay_shader_group_handles_khr)]()[]
    self._vk_cmd_trace_rays_indirect_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdTraceRaysIndirectKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_trace_rays_indirect_khr)]()[]
    self._vk_get_ray_tracing_shader_group_stack_size_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetRayTracingShaderGroupStackSizeKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_ray_tracing_shader_group_stack_size_khr)]()[]
    self._vk_cmd_set_ray_tracing_pipeline_stack_size_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRayTracingPipelineStackSizeKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_ray_tracing_pipeline_stack_size_khr)]()[]

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
        return self._get_ray_tracing_shader_group_stack_size_khr(
            device, pipeline, group, group_shader
        )

    fn cmd_set_ray_tracing_pipeline_stack_size_khr(
        self, command_buffer: CommandBuffer, pipeline_stack_size: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRayTracingPipelineStackSizeKHR.html
        """
        return self._cmd_set_ray_tracing_pipeline_stack_size_khr(
            command_buffer, pipeline_stack_size
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_sampler_ycbcr_conversion = Ptr(to=get_device_proc_addr(
        device, "vkCreateSamplerYcbcrConversion".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_sampler_ycbcr_conversion)]()[]
    self._vk_destroy_sampler_ycbcr_conversion = Ptr(to=get_device_proc_addr(
        device, "vkDestroySamplerYcbcrConversion".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_sampler_ycbcr_conversion)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_bind_buffer_memory_2 = Ptr(to=get_device_proc_addr(
        device, "vkBindBufferMemory2".unsafe_ptr()
    )).bitcast[type_of(self._vk_bind_buffer_memory_2)]()[]
    self._vk_bind_image_memory_2 = Ptr(to=get_device_proc_addr(
        device, "vkBindImageMemory2".unsafe_ptr()
    )).bitcast[type_of(self._vk_bind_image_memory_2)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_descriptor_set_layout_support = Ptr(to=get_device_proc_addr(
        device, "vkGetDescriptorSetLayoutSupport".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_descriptor_set_layout_support)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_draw_indirect_count = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawIndirectCount".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_indirect_count)]()[]
    self._vk_cmd_draw_indexed_indirect_count = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawIndexedIndirectCount".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_indexed_indirect_count)]()[]

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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirectCount.html
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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_semaphore_counter_value = Ptr(to=get_device_proc_addr(
        device, "vkGetSemaphoreCounterValue".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_semaphore_counter_value)]()[]
    self._vk_wait_semaphores = Ptr(to=get_device_proc_addr(
        device, "vkWaitSemaphores".unsafe_ptr()
    )).bitcast[type_of(self._vk_wait_semaphores)]()[]
    self._vk_signal_semaphore = Ptr(to=get_device_proc_addr(
        device, "vkSignalSemaphore".unsafe_ptr()
    )).bitcast[type_of(self._vk_signal_semaphore)]()[]

    fn get_semaphore_counter_value(
        self, device: Device, semaphore: Semaphore, mut value: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreCounterValue.html
        """
        return self._get_semaphore_counter_value(
            device, semaphore, Ptr(to=value).bitcast[UInt64]()
        )

    fn wait_semaphores(
        self, device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitSemaphores.html
        """
        return self._wait_semaphores(
            device, Ptr(to=wait_info).bitcast[SemaphoreWaitInfo](), timeout
        )

    fn signal_semaphore(self, device: Device, signal_info: SemaphoreSignalInfo) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSignalSemaphore.html
        """
        return self._signal_semaphore(device, Ptr(to=signal_info).bitcast[SemaphoreSignalInfo]())

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_fragment_shading_rates_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceFragmentShadingRatesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_fragment_shading_rates_khr)]()[]
    self._vk_cmd_set_fragment_shading_rate_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetFragmentShadingRateKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_fragment_shading_rate_khr)]()[]

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
            physical_device,
            Ptr(to=fragment_shading_rate_count).bitcast[UInt32](),
            p_fragment_shading_rates,
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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_rendering_attachment_locations = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRenderingAttachmentLocations".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_rendering_attachment_locations)]()[]
    self._vk_cmd_set_rendering_input_attachment_indices = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRenderingInputAttachmentIndices".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_rendering_input_attachment_indices)]()[]

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
            command_buffer,
            Ptr(to=input_attachment_index_info).bitcast[RenderingInputAttachmentIndexInfo](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_wait_for_present_khr = Ptr(to=get_device_proc_addr(
        device, "vkWaitForPresentKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_wait_for_present_khr)]()[]

    fn wait_for_present_khr(
        self, device: Device, swapchain: SwapchainKHR, present_id: UInt64, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForPresentKHR.html
        """
        return self._wait_for_present_khr(device, swapchain, present_id, timeout)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_buffer_device_address = Ptr(to=get_device_proc_addr(
        device, "vkGetBufferDeviceAddress".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_buffer_device_address)]()[]
    self._vk_get_buffer_opaque_capture_address = Ptr(to=get_device_proc_addr(
        device, "vkGetBufferOpaqueCaptureAddress".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_buffer_opaque_capture_address)]()[]
    self._vk_get_device_memory_opaque_capture_address = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceMemoryOpaqueCaptureAddress".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_memory_opaque_capture_address)]()[]

    fn get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._get_buffer_device_address(
            device, Ptr(to=info).bitcast[BufferDeviceAddressInfo]()
        )

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_deferred_operation_khr = Ptr(to=get_device_proc_addr(
        device, "vkCreateDeferredOperationKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_deferred_operation_khr)]()[]
    self._vk_destroy_deferred_operation_khr = Ptr(to=get_device_proc_addr(
        device, "vkDestroyDeferredOperationKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_deferred_operation_khr)]()[]
    self._vk_get_deferred_operation_max_concurrency_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetDeferredOperationMaxConcurrencyKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_deferred_operation_max_concurrency_khr)]()[]
    self._vk_get_deferred_operation_result_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetDeferredOperationResultKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_deferred_operation_result_khr)]()[]
    self._vk_deferred_operation_join_khr = Ptr(to=get_device_proc_addr(
        device, "vkDeferredOperationJoinKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_deferred_operation_join_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_pipeline_executable_properties_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPipelineExecutablePropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_pipeline_executable_properties_khr)]()[]
    self._vk_get_pipeline_executable_statistics_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPipelineExecutableStatisticsKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_pipeline_executable_statistics_khr)]()[]
    self._vk_get_pipeline_executable_internal_representations_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPipelineExecutableInternalRepresentationsKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_pipeline_executable_internal_representations_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_map_memory_2 = Ptr(to=get_device_proc_addr(
        device, "vkMapMemory2".unsafe_ptr()
    )).bitcast[type_of(self._vk_map_memory_2)]()[]
    self._vk_unmap_memory_2 = Ptr(to=get_device_proc_addr(
        device, "vkUnmapMemory2".unsafe_ptr()
    )).bitcast[type_of(self._vk_unmap_memory_2)]()[]

    fn map_memory_2(
        self,
        device: Device,
        memory_map_info: MemoryMapInfo,
        pp_data: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMapMemory2.html
        """
        return self._map_memory_2(
            device, Ptr(to=memory_map_info).bitcast[MemoryMapInfo](), pp_data
        )

    fn unmap_memory_2(self, device: Device, memory_unmap_info: MemoryUnmapInfo) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory2.html
        """
        return self._unmap_memory_2(device, Ptr(to=memory_unmap_info).bitcast[MemoryUnmapInfo]())

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_video_encode_quality_level_properties_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceVideoEncodeQualityLevelPropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_video_encode_quality_level_properties_khr)]()[]
    self._vk_get_encoded_video_session_parameters_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetEncodedVideoSessionParametersKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_encoded_video_session_parameters_khr)]()[]
    self._vk_cmd_encode_video_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdEncodeVideoKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_encode_video_khr)]()[]

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
        return self._cmd_encode_video_khr(
            command_buffer, Ptr(to=encode_info).bitcast[VideoEncodeInfoKHR]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_event_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetEvent2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_event_2)]()[]
    self._vk_cmd_reset_event_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdResetEvent2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_reset_event_2)]()[]
    self._vk_cmd_wait_events_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdWaitEvents2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_wait_events_2)]()[]
    self._vk_cmd_pipeline_barrier_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdPipelineBarrier2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_pipeline_barrier_2)]()[]
    self._vk_cmd_write_timestamp_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdWriteTimestamp2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_write_timestamp_2)]()[]
    self._vk_queue_submit_2 = Ptr(to=get_device_proc_addr(
        device, "vkQueueSubmit2".unsafe_ptr()
    )).bitcast[type_of(self._vk_queue_submit_2)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_copy_buffer_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyBuffer2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_buffer_2)]()[]
    self._vk_cmd_copy_image_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyImage2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_image_2)]()[]
    self._vk_cmd_copy_buffer_to_image_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyBufferToImage2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_buffer_to_image_2)]()[]
    self._vk_cmd_copy_image_to_buffer_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyImageToBuffer2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_image_to_buffer_2)]()[]
    self._vk_cmd_blit_image_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdBlitImage2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_blit_image_2)]()[]
    self._vk_cmd_resolve_image_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdResolveImage2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_resolve_image_2)]()[]

    fn cmd_copy_buffer_2(self, command_buffer: CommandBuffer, copy_buffer_info: CopyBufferInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer2.html
        """
        return self._cmd_copy_buffer_2(
            command_buffer, Ptr(to=copy_buffer_info).bitcast[CopyBufferInfo2]()
        )

    fn cmd_copy_image_2(self, command_buffer: CommandBuffer, copy_image_info: CopyImageInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage2.html
        """
        return self._cmd_copy_image_2(
            command_buffer, Ptr(to=copy_image_info).bitcast[CopyImageInfo2]()
        )

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
        return self._cmd_blit_image_2(
            command_buffer, Ptr(to=blit_image_info).bitcast[BlitImageInfo2]()
        )

    fn cmd_resolve_image_2(
        self, command_buffer: CommandBuffer, resolve_image_info: ResolveImageInfo2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage2.html
        """
        return self._cmd_resolve_image_2(
            command_buffer, Ptr(to=resolve_image_info).bitcast[ResolveImageInfo2]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_trace_rays_indirect_2_khr = Ptr(to=get_device_proc_addr(
        device, "vkCmdTraceRaysIndirect2KHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_trace_rays_indirect_2_khr)]()[]

    fn cmd_trace_rays_indirect_2_khr(
        self, command_buffer: CommandBuffer, indirect_device_address: DeviceAddress
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdTraceRaysIndirect2KHR.html
        """
        return self._cmd_trace_rays_indirect_2_khr(command_buffer, indirect_device_address)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_device_buffer_memory_requirements = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceBufferMemoryRequirements".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_buffer_memory_requirements)]()[]
    self._vk_get_device_image_memory_requirements = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceImageMemoryRequirements".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_image_memory_requirements)]()[]
    self._vk_get_device_image_sparse_memory_requirements = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceImageSparseMemoryRequirements".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_image_sparse_memory_requirements)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_bind_index_buffer_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindIndexBuffer2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_index_buffer_2)]()[]
    self._vk_get_rendering_area_granularity = Ptr(to=get_device_proc_addr(
        device, "vkGetRenderingAreaGranularity".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_rendering_area_granularity)]()[]
    self._vk_get_device_image_subresource_layout = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceImageSubresourceLayout".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_image_subresource_layout)]()[]
    self._vk_get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
        device, "vkGetImageSubresourceLayout2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_subresource_layout_2)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_wait_for_present_2_khr = Ptr(to=get_device_proc_addr(
        device, "vkWaitForPresent2KHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_wait_for_present_2_khr)]()[]

    fn wait_for_present_2_khr(
        self, device: Device, swapchain: SwapchainKHR, present_wait_2_info: PresentWait2InfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForPresent2KHR.html
        """
        return self._wait_for_present_2_khr(
            device, swapchain, Ptr(to=present_wait_2_info).bitcast[PresentWait2InfoKHR]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_pipeline_binaries_khr = Ptr(to=get_device_proc_addr(
        device, "vkCreatePipelineBinariesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_pipeline_binaries_khr)]()[]
    self._vk_destroy_pipeline_binary_khr = Ptr(to=get_device_proc_addr(
        device, "vkDestroyPipelineBinaryKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_pipeline_binary_khr)]()[]
    self._vk_get_pipeline_key_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPipelineKeyKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_pipeline_key_khr)]()[]
    self._vk_get_pipeline_binary_data_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPipelineBinaryDataKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_pipeline_binary_data_khr)]()[]
    self._vk_release_captured_pipeline_data_khr = Ptr(to=get_device_proc_addr(
        device, "vkReleaseCapturedPipelineDataKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_release_captured_pipeline_data_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_release_swapchain_images_khr = Ptr(to=get_device_proc_addr(
        device, "vkReleaseSwapchainImagesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_release_swapchain_images_khr)]()[]

    fn release_swapchain_images_khr(
        self, device: Device, release_info: ReleaseSwapchainImagesInfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseSwapchainImagesKHR.html
        """
        return self._release_swapchain_images_khr(
            device, Ptr(to=release_info).bitcast[ReleaseSwapchainImagesInfoKHR]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_cooperative_matrix_properties_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceCooperativeMatrixPropertiesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_cooperative_matrix_properties_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_line_stipple = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetLineStipple".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_line_stipple)]()[]

    fn cmd_set_line_stipple(
        self,
        command_buffer: CommandBuffer,
        line_stipple_factor: UInt32,
        line_stipple_pattern: UInt16,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStipple.html
        """
        return self._cmd_set_line_stipple(
            command_buffer, line_stipple_factor, line_stipple_pattern
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_calibrateable_time_domains_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_calibrateable_time_domains_khr)]()[]
    self._vk_get_calibrated_timestamps_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetCalibratedTimestampsKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_calibrated_timestamps_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_bind_descriptor_sets_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindDescriptorSets2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_descriptor_sets_2)]()[]
    self._vk_cmd_push_constants_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdPushConstants2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_push_constants_2)]()[]
    self._vk_cmd_push_descriptor_set_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdPushDescriptorSet2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_push_descriptor_set_2)]()[]
    self._vk_cmd_push_descriptor_set_with_template_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdPushDescriptorSetWithTemplate2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_push_descriptor_set_with_template_2)]()[]
    self._vk_cmd_set_descriptor_buffer_offsets_2_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDescriptorBufferOffsets2EXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_descriptor_buffer_offsets_2_ext)]()[]
    self._vk_cmd_bind_descriptor_buffer_embedded_samplers_2_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindDescriptorBufferEmbeddedSamplers2EXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_descriptor_buffer_embedded_samplers_2_ext)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_debug_report_callback_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateDebugReportCallbackEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_debug_report_callback_ext)]()[]
    self._vk_destroy_debug_report_callback_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkDestroyDebugReportCallbackEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_debug_report_callback_ext)]()[]
    self._vk_debug_report_message_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkDebugReportMessageEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_debug_report_message_ext)]()[]

    fn create_debug_report_callback_ext(
        self,
        instance: Instance,
        create_info: DebugReportCallbackCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut callback: DebugReportCallbackEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDebugReportCallbackEXT.html
        """
        return self._create_debug_report_callback_ext(
            instance,
            Ptr(to=create_info).bitcast[DebugReportCallbackCreateInfoEXT](),
            p_allocator,
            Ptr(to=callback).bitcast[DebugReportCallbackEXT](),
        )

    fn destroy_debug_report_callback_ext(
        self,
        instance: Instance,
        callback: DebugReportCallbackEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDebugReportCallbackEXT.html
        """
        return self._destroy_debug_report_callback_ext(instance, callback, p_allocator)

    fn debug_report_message_ext(
        self,
        instance: Instance,
        flags: DebugReportFlagsEXT,
        object_type: DebugReportObjectTypeEXT,
        object: UInt64,
        location: UInt,
        message_code: Int32,
        p_layer_prefix: CStringSlice[ImmutAnyOrigin],
        p_message: CStringSlice[ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDebugReportMessageEXT.html
        """
        return self._debug_report_message_ext(
            instance, flags, object_type, object, location, message_code, p_layer_prefix, p_message
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_debug_marker_set_object_tag_ext = Ptr(to=get_device_proc_addr(
        device, "vkDebugMarkerSetObjectTagEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_debug_marker_set_object_tag_ext)]()[]
    self._vk_debug_marker_set_object_name_ext = Ptr(to=get_device_proc_addr(
        device, "vkDebugMarkerSetObjectNameEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_debug_marker_set_object_name_ext)]()[]
    self._vk_cmd_debug_marker_begin_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdDebugMarkerBeginEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_debug_marker_begin_ext)]()[]
    self._vk_cmd_debug_marker_end_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdDebugMarkerEndEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_debug_marker_end_ext)]()[]
    self._vk_cmd_debug_marker_insert_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdDebugMarkerInsertEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_debug_marker_insert_ext)]()[]

    fn debug_marker_set_object_tag_ext(
        self, device: Device, tag_info: DebugMarkerObjectTagInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDebugMarkerSetObjectTagEXT.html
        """
        return self._debug_marker_set_object_tag_ext(
            device, Ptr(to=tag_info).bitcast[DebugMarkerObjectTagInfoEXT]()
        )

    fn debug_marker_set_object_name_ext(
        self, device: Device, name_info: DebugMarkerObjectNameInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDebugMarkerSetObjectNameEXT.html
        """
        return self._debug_marker_set_object_name_ext(
            device, Ptr(to=name_info).bitcast[DebugMarkerObjectNameInfoEXT]()
        )

    fn cmd_debug_marker_begin_ext(
        self, command_buffer: CommandBuffer, marker_info: DebugMarkerMarkerInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerBeginEXT.html
        """
        return self._cmd_debug_marker_begin_ext(
            command_buffer, Ptr(to=marker_info).bitcast[DebugMarkerMarkerInfoEXT]()
        )

    fn cmd_debug_marker_end_ext(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerEndEXT.html
        """
        return self._cmd_debug_marker_end_ext(command_buffer)

    fn cmd_debug_marker_insert_ext(
        self, command_buffer: CommandBuffer, marker_info: DebugMarkerMarkerInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDebugMarkerInsertEXT.html
        """
        return self._cmd_debug_marker_insert_ext(
            command_buffer, Ptr(to=marker_info).bitcast[DebugMarkerMarkerInfoEXT]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_bind_transform_feedback_buffers_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindTransformFeedbackBuffersEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_transform_feedback_buffers_ext)]()[]
    self._vk_cmd_begin_transform_feedback_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdBeginTransformFeedbackEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_begin_transform_feedback_ext)]()[]
    self._vk_cmd_end_transform_feedback_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdEndTransformFeedbackEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_end_transform_feedback_ext)]()[]
    self._vk_cmd_begin_query_indexed_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdBeginQueryIndexedEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_begin_query_indexed_ext)]()[]
    self._vk_cmd_end_query_indexed_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdEndQueryIndexedEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_end_query_indexed_ext)]()[]
    self._vk_cmd_draw_indirect_byte_count_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawIndirectByteCountEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_indirect_byte_count_ext)]()[]

    fn cmd_bind_transform_feedback_buffers_ext(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
        p_sizes: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindTransformFeedbackBuffersEXT.html
        """
        return self._cmd_bind_transform_feedback_buffers_ext(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets, p_sizes
        )

    fn cmd_begin_transform_feedback_ext(
        self,
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_counter_buffer_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginTransformFeedbackEXT.html
        """
        return self._cmd_begin_transform_feedback_ext(
            command_buffer,
            first_counter_buffer,
            counter_buffer_count,
            p_counter_buffers,
            p_counter_buffer_offsets,
        )

    fn cmd_end_transform_feedback_ext(
        self,
        command_buffer: CommandBuffer,
        first_counter_buffer: UInt32,
        counter_buffer_count: UInt32,
        p_counter_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_counter_buffer_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndTransformFeedbackEXT.html
        """
        return self._cmd_end_transform_feedback_ext(
            command_buffer,
            first_counter_buffer,
            counter_buffer_count,
            p_counter_buffers,
            p_counter_buffer_offsets,
        )

    fn cmd_begin_query_indexed_ext(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
        index: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginQueryIndexedEXT.html
        """
        return self._cmd_begin_query_indexed_ext(command_buffer, query_pool, query, flags, index)

    fn cmd_end_query_indexed_ext(
        self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32, index: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQueryIndexedEXT.html
        """
        return self._cmd_end_query_indexed_ext(command_buffer, query_pool, query, index)

    fn cmd_draw_indirect_byte_count_ext(
        self,
        command_buffer: CommandBuffer,
        instance_count: UInt32,
        first_instance: UInt32,
        counter_buffer: Buffer,
        counter_buffer_offset: DeviceSize,
        counter_offset: UInt32,
        vertex_stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirectByteCountEXT.html
        """
        return self._cmd_draw_indirect_byte_count_ext(
            command_buffer,
            instance_count,
            first_instance,
            counter_buffer,
            counter_buffer_offset,
            counter_offset,
            vertex_stride,
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_begin_conditional_rendering_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdBeginConditionalRenderingEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_begin_conditional_rendering_ext)]()[]
    self._vk_cmd_end_conditional_rendering_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdEndConditionalRenderingEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_end_conditional_rendering_ext)]()[]

    fn cmd_begin_conditional_rendering_ext(
        self,
        command_buffer: CommandBuffer,
        conditional_rendering_begin: ConditionalRenderingBeginInfoEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginConditionalRenderingEXT.html
        """
        return self._cmd_begin_conditional_rendering_ext(
            command_buffer,
            Ptr(to=conditional_rendering_begin).bitcast[ConditionalRenderingBeginInfoEXT](),
        )

    fn cmd_end_conditional_rendering_ext(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndConditionalRenderingEXT.html
        """
        return self._cmd_end_conditional_rendering_ext(command_buffer)

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_release_display_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkReleaseDisplayEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_release_display_ext)]()[]

    fn release_display_ext(self, physical_device: PhysicalDevice, display: DisplayKHR) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseDisplayEXT.html
        """
        return self._release_display_ext(physical_device, display)

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_acquire_xlib_display_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkAcquireXlibDisplayEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_acquire_xlib_display_ext)]()[]
    self._vk_get_rand_r_output_display_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkGetRandROutputDisplayEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_rand_r_output_display_ext)]()[]

    fn acquire_xlib_display_ext(
        self, physical_device: PhysicalDevice, mut dpy: Display, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireXlibDisplayEXT.html
        """
        return self._acquire_xlib_display_ext(
            physical_device, Ptr(to=dpy).bitcast[Display](), display
        )

    fn get_rand_r_output_display_ext(
        self,
        physical_device: PhysicalDevice,
        mut dpy: Display,
        rr_output: RROutput,
        mut display: DisplayKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRandROutputDisplayEXT.html
        """
        return self._get_rand_r_output_display_ext(
            physical_device,
            Ptr(to=dpy).bitcast[Display](),
            rr_output,
            Ptr(to=display).bitcast[DisplayKHR](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_get_physical_device_surface_capabilities_2_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceSurfaceCapabilities2EXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_surface_capabilities_2_ext)]()[]

    fn get_physical_device_surface_capabilities_2_ext(
        self,
        physical_device: PhysicalDevice,
        surface: SurfaceKHR,
        mut surface_capabilities: SurfaceCapabilities2EXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfaceCapabilities2EXT.html
        """
        return self._get_physical_device_surface_capabilities_2_ext(
            physical_device,
            surface,
            Ptr(to=surface_capabilities).bitcast[SurfaceCapabilities2EXT](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_display_power_control_ext = Ptr(to=get_device_proc_addr(
        device, "vkDisplayPowerControlEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_display_power_control_ext)]()[]
    self._vk_register_device_event_ext = Ptr(to=get_device_proc_addr(
        device, "vkRegisterDeviceEventEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_register_device_event_ext)]()[]
    self._vk_register_display_event_ext = Ptr(to=get_device_proc_addr(
        device, "vkRegisterDisplayEventEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_register_display_event_ext)]()[]
    self._vk_get_swapchain_counter_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetSwapchainCounterEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_swapchain_counter_ext)]()[]

    fn display_power_control_ext(
        self, device: Device, display: DisplayKHR, display_power_info: DisplayPowerInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDisplayPowerControlEXT.html
        """
        return self._display_power_control_ext(
            device, display, Ptr(to=display_power_info).bitcast[DisplayPowerInfoEXT]()
        )

    fn register_device_event_ext(
        self,
        device: Device,
        device_event_info: DeviceEventInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkRegisterDeviceEventEXT.html
        """
        return self._register_device_event_ext(
            device,
            Ptr(to=device_event_info).bitcast[DeviceEventInfoEXT](),
            p_allocator,
            Ptr(to=fence).bitcast[Fence](),
        )

    fn register_display_event_ext(
        self,
        device: Device,
        display: DisplayKHR,
        display_event_info: DisplayEventInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkRegisterDisplayEventEXT.html
        """
        return self._register_display_event_ext(
            device,
            display,
            Ptr(to=display_event_info).bitcast[DisplayEventInfoEXT](),
            p_allocator,
            Ptr(to=fence).bitcast[Fence](),
        )

    fn get_swapchain_counter_ext(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        counter: SurfaceCounterFlagBitsEXT,
        mut counter_value: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainCounterEXT.html
        """
        return self._get_swapchain_counter_ext(
            device, swapchain, counter, Ptr(to=counter_value).bitcast[UInt64]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_discard_rectangle_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDiscardRectangleEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_discard_rectangle_ext)]()[]
    self._vk_cmd_set_discard_rectangle_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDiscardRectangleEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_discard_rectangle_enable_ext)]()[]
    self._vk_cmd_set_discard_rectangle_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDiscardRectangleModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_discard_rectangle_mode_ext)]()[]

    fn cmd_set_discard_rectangle_ext(
        self,
        command_buffer: CommandBuffer,
        first_discard_rectangle: UInt32,
        discard_rectangle_count: UInt32,
        p_discard_rectangles: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleEXT.html
        """
        return self._cmd_set_discard_rectangle_ext(
            command_buffer, first_discard_rectangle, discard_rectangle_count, p_discard_rectangles
        )

    fn cmd_set_discard_rectangle_enable_ext(
        self, command_buffer: CommandBuffer, discard_rectangle_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleEnableEXT.html
        """
        return self._cmd_set_discard_rectangle_enable_ext(command_buffer, discard_rectangle_enable)

    fn cmd_set_discard_rectangle_mode_ext(
        self, command_buffer: CommandBuffer, discard_rectangle_mode: DiscardRectangleModeEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDiscardRectangleModeEXT.html
        """
        return self._cmd_set_discard_rectangle_mode_ext(command_buffer, discard_rectangle_mode)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_set_hdr_metadata_ext = Ptr(to=get_device_proc_addr(
        device, "vkSetHdrMetadataEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_set_hdr_metadata_ext)]()[]

    fn set_hdr_metadata_ext(
        self,
        device: Device,
        swapchain_count: UInt32,
        p_swapchains: Ptr[SwapchainKHR, ImmutAnyOrigin],
        p_metadata: Ptr[HdrMetadataEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetHdrMetadataEXT.html
        """
        return self._set_hdr_metadata_ext(device, swapchain_count, p_swapchains, p_metadata)

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_set_debug_utils_object_name_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkSetDebugUtilsObjectNameEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_set_debug_utils_object_name_ext)]()[]
    self._vk_set_debug_utils_object_tag_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkSetDebugUtilsObjectTagEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_set_debug_utils_object_tag_ext)]()[]
    self._vk_queue_begin_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkQueueBeginDebugUtilsLabelEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_queue_begin_debug_utils_label_ext)]()[]
    self._vk_queue_end_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkQueueEndDebugUtilsLabelEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_queue_end_debug_utils_label_ext)]()[]
    self._vk_queue_insert_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkQueueInsertDebugUtilsLabelEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_queue_insert_debug_utils_label_ext)]()[]
    self._vk_cmd_begin_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkCmdBeginDebugUtilsLabelEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_begin_debug_utils_label_ext)]()[]
    self._vk_cmd_end_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkCmdEndDebugUtilsLabelEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_end_debug_utils_label_ext)]()[]
    self._vk_cmd_insert_debug_utils_label_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkCmdInsertDebugUtilsLabelEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_insert_debug_utils_label_ext)]()[]
    self._vk_create_debug_utils_messenger_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateDebugUtilsMessengerEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_debug_utils_messenger_ext)]()[]
    self._vk_destroy_debug_utils_messenger_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkDestroyDebugUtilsMessengerEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_debug_utils_messenger_ext)]()[]
    self._vk_submit_debug_utils_message_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkSubmitDebugUtilsMessageEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_submit_debug_utils_message_ext)]()[]

    fn set_debug_utils_object_name_ext(
        self, device: Device, name_info: DebugUtilsObjectNameInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDebugUtilsObjectNameEXT.html
        """
        return self._set_debug_utils_object_name_ext(
            device, Ptr(to=name_info).bitcast[DebugUtilsObjectNameInfoEXT]()
        )

    fn set_debug_utils_object_tag_ext(
        self, device: Device, tag_info: DebugUtilsObjectTagInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDebugUtilsObjectTagEXT.html
        """
        return self._set_debug_utils_object_tag_ext(
            device, Ptr(to=tag_info).bitcast[DebugUtilsObjectTagInfoEXT]()
        )

    fn queue_begin_debug_utils_label_ext(self, queue: Queue, label_info: DebugUtilsLabelEXT):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBeginDebugUtilsLabelEXT.html
        """
        return self._queue_begin_debug_utils_label_ext(
            queue, Ptr(to=label_info).bitcast[DebugUtilsLabelEXT]()
        )

    fn queue_end_debug_utils_label_ext(self, queue: Queue):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueEndDebugUtilsLabelEXT.html
        """
        return self._queue_end_debug_utils_label_ext(queue)

    fn queue_insert_debug_utils_label_ext(self, queue: Queue, label_info: DebugUtilsLabelEXT):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueInsertDebugUtilsLabelEXT.html
        """
        return self._queue_insert_debug_utils_label_ext(
            queue, Ptr(to=label_info).bitcast[DebugUtilsLabelEXT]()
        )

    fn cmd_begin_debug_utils_label_ext(
        self, command_buffer: CommandBuffer, label_info: DebugUtilsLabelEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginDebugUtilsLabelEXT.html
        """
        return self._cmd_begin_debug_utils_label_ext(
            command_buffer, Ptr(to=label_info).bitcast[DebugUtilsLabelEXT]()
        )

    fn cmd_end_debug_utils_label_ext(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndDebugUtilsLabelEXT.html
        """
        return self._cmd_end_debug_utils_label_ext(command_buffer)

    fn cmd_insert_debug_utils_label_ext(
        self, command_buffer: CommandBuffer, label_info: DebugUtilsLabelEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdInsertDebugUtilsLabelEXT.html
        """
        return self._cmd_insert_debug_utils_label_ext(
            command_buffer, Ptr(to=label_info).bitcast[DebugUtilsLabelEXT]()
        )

    fn create_debug_utils_messenger_ext(
        self,
        instance: Instance,
        create_info: DebugUtilsMessengerCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut messenger: DebugUtilsMessengerEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDebugUtilsMessengerEXT.html
        """
        return self._create_debug_utils_messenger_ext(
            instance,
            Ptr(to=create_info).bitcast[DebugUtilsMessengerCreateInfoEXT](),
            p_allocator,
            Ptr(to=messenger).bitcast[DebugUtilsMessengerEXT](),
        )

    fn destroy_debug_utils_messenger_ext(
        self,
        instance: Instance,
        messenger: DebugUtilsMessengerEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDebugUtilsMessengerEXT.html
        """
        return self._destroy_debug_utils_messenger_ext(instance, messenger, p_allocator)

    fn submit_debug_utils_message_ext(
        self,
        instance: Instance,
        message_severity: DebugUtilsMessageSeverityFlagBitsEXT,
        message_types: DebugUtilsMessageTypeFlagsEXT,
        callback_data: DebugUtilsMessengerCallbackDataEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSubmitDebugUtilsMessageEXT.html
        """
        return self._submit_debug_utils_message_ext(
            instance,
            message_severity,
            message_types,
            Ptr(to=callback_data).bitcast[DebugUtilsMessengerCallbackDataEXT](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_sample_locations_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetSampleLocationsEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_sample_locations_ext)]()[]
    self._vk_get_physical_device_multisample_properties_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceMultisamplePropertiesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_multisample_properties_ext)]()[]

    fn cmd_set_sample_locations_ext(
        self, command_buffer: CommandBuffer, sample_locations_info: SampleLocationsInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEXT.html
        """
        return self._cmd_set_sample_locations_ext(
            command_buffer, Ptr(to=sample_locations_info).bitcast[SampleLocationsInfoEXT]()
        )

    fn get_physical_device_multisample_properties_ext(
        self,
        physical_device: PhysicalDevice,
        samples: SampleCountFlagBits,
        mut multisample_properties: MultisamplePropertiesEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMultisamplePropertiesEXT.html
        """
        return self._get_physical_device_multisample_properties_ext(
            physical_device,
            samples,
            Ptr(to=multisample_properties).bitcast[MultisamplePropertiesEXT](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_image_drm_format_modifier_properties_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetImageDrmFormatModifierPropertiesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_drm_format_modifier_properties_ext)]()[]

    fn get_image_drm_format_modifier_properties_ext(
        self, device: Device, image: Image, mut properties: ImageDrmFormatModifierPropertiesEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageDrmFormatModifierPropertiesEXT.html
        """
        return self._get_image_drm_format_modifier_properties_ext(
            device, image, Ptr(to=properties).bitcast[ImageDrmFormatModifierPropertiesEXT]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_validation_cache_ext = Ptr(to=get_device_proc_addr(
        device, "vkCreateValidationCacheEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_validation_cache_ext)]()[]
    self._vk_destroy_validation_cache_ext = Ptr(to=get_device_proc_addr(
        device, "vkDestroyValidationCacheEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_validation_cache_ext)]()[]
    self._vk_merge_validation_caches_ext = Ptr(to=get_device_proc_addr(
        device, "vkMergeValidationCachesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_merge_validation_caches_ext)]()[]
    self._vk_get_validation_cache_data_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetValidationCacheDataEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_validation_cache_data_ext)]()[]

    fn create_validation_cache_ext(
        self,
        device: Device,
        create_info: ValidationCacheCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut validation_cache: ValidationCacheEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateValidationCacheEXT.html
        """
        return self._create_validation_cache_ext(
            device,
            Ptr(to=create_info).bitcast[ValidationCacheCreateInfoEXT](),
            p_allocator,
            Ptr(to=validation_cache).bitcast[ValidationCacheEXT](),
        )

    fn destroy_validation_cache_ext(
        self,
        device: Device,
        validation_cache: ValidationCacheEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyValidationCacheEXT.html
        """
        return self._destroy_validation_cache_ext(device, validation_cache, p_allocator)

    fn merge_validation_caches_ext(
        self,
        device: Device,
        dst_cache: ValidationCacheEXT,
        src_cache_count: UInt32,
        p_src_caches: Ptr[ValidationCacheEXT, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergeValidationCachesEXT.html
        """
        return self._merge_validation_caches_ext(device, dst_cache, src_cache_count, p_src_caches)

    fn get_validation_cache_data_ext(
        self,
        device: Device,
        validation_cache: ValidationCacheEXT,
        mut data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetValidationCacheDataEXT.html
        """
        return self._get_validation_cache_data_ext(
            device, validation_cache, Ptr(to=data_size).bitcast[UInt](), p_data
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_memory_host_pointer_properties_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryHostPointerPropertiesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_host_pointer_properties_ext)]()[]

    fn get_memory_host_pointer_properties_ext(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        host_pointer: NoneType,
        mut memory_host_pointer_properties: MemoryHostPointerPropertiesEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryHostPointerPropertiesEXT.html
        """
        return self._get_memory_host_pointer_properties_ext(
            device,
            handle_type,
            Ptr(to=host_pointer).bitcast[NoneType](),
            Ptr(to=memory_host_pointer_properties).bitcast[MemoryHostPointerPropertiesEXT](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_calibrateable_time_domains_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceCalibrateableTimeDomainsKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_calibrateable_time_domains_khr)]()[]
    self._vk_get_calibrated_timestamps_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetCalibratedTimestampsKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_calibrated_timestamps_khr)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_metal_surface_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateMetalSurfaceEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_metal_surface_ext)]()[]

    fn create_metal_surface_ext(
        self,
        instance: Instance,
        create_info: MetalSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateMetalSurfaceEXT.html
        """
        return self._create_metal_surface_ext(
            instance,
            Ptr(to=create_info).bitcast[MetalSurfaceCreateInfoEXT](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_buffer_device_address = Ptr(to=get_device_proc_addr(
        device, "vkGetBufferDeviceAddress".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_buffer_device_address)]()[]

    fn get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._get_buffer_device_address(
            device, Ptr(to=info).bitcast[BufferDeviceAddressInfo]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_tool_properties = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceToolProperties".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_tool_properties)]()[]

    fn get_physical_device_tool_properties(
        self,
        physical_device: PhysicalDevice,
        mut tool_count: UInt32,
        p_tool_properties: Ptr[PhysicalDeviceToolProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        return self._get_physical_device_tool_properties(
            physical_device, Ptr(to=tool_count).bitcast[UInt32](), p_tool_properties
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_surface_present_modes_2_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceSurfacePresentModes2EXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_surface_present_modes_2_ext)]()[]
    self._vk_acquire_full_screen_exclusive_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkAcquireFullScreenExclusiveModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_acquire_full_screen_exclusive_mode_ext)]()[]
    self._vk_release_full_screen_exclusive_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkReleaseFullScreenExclusiveModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_release_full_screen_exclusive_mode_ext)]()[]
    self._vk_get_device_group_surface_present_modes_2_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceGroupSurfacePresentModes2EXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_group_surface_present_modes_2_ext)]()[]

    fn get_physical_device_surface_present_modes_2_ext(
        self,
        physical_device: PhysicalDevice,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut present_mode_count: UInt32,
        p_present_modes: Ptr[PresentModeKHR, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSurfacePresentModes2EXT.html
        """
        return self._get_physical_device_surface_present_modes_2_ext(
            physical_device,
            Ptr(to=surface_info).bitcast[PhysicalDeviceSurfaceInfo2KHR](),
            Ptr(to=present_mode_count).bitcast[UInt32](),
            p_present_modes,
        )

    fn acquire_full_screen_exclusive_mode_ext(
        self, device: Device, swapchain: SwapchainKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireFullScreenExclusiveModeEXT.html
        """
        return self._acquire_full_screen_exclusive_mode_ext(device, swapchain)

    fn release_full_screen_exclusive_mode_ext(
        self, device: Device, swapchain: SwapchainKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseFullScreenExclusiveModeEXT.html
        """
        return self._release_full_screen_exclusive_mode_ext(device, swapchain)

    fn get_device_group_surface_present_modes_2_ext(
        self,
        device: Device,
        surface_info: PhysicalDeviceSurfaceInfo2KHR,
        mut modes: DeviceGroupPresentModeFlagsKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupSurfacePresentModes2EXT.html
        """
        return self._get_device_group_surface_present_modes_2_ext(
            device,
            Ptr(to=surface_info).bitcast[PhysicalDeviceSurfaceInfo2KHR](),
            Ptr(to=modes).bitcast[DeviceGroupPresentModeFlagsKHR](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_headless_surface_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateHeadlessSurfaceEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_headless_surface_ext)]()[]

    fn create_headless_surface_ext(
        self,
        instance: Instance,
        create_info: HeadlessSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateHeadlessSurfaceEXT.html
        """
        return self._create_headless_surface_ext(
            instance,
            Ptr(to=create_info).bitcast[HeadlessSurfaceCreateInfoEXT](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_line_stipple = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetLineStipple".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_line_stipple)]()[]

    fn cmd_set_line_stipple(
        self,
        command_buffer: CommandBuffer,
        line_stipple_factor: UInt32,
        line_stipple_pattern: UInt16,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStipple.html
        """
        return self._cmd_set_line_stipple(
            command_buffer, line_stipple_factor, line_stipple_pattern
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_reset_query_pool = Ptr(to=get_device_proc_addr(
        device, "vkResetQueryPool".unsafe_ptr()
    )).bitcast[type_of(self._vk_reset_query_pool)]()[]

    fn reset_query_pool(
        self, device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetQueryPool.html
        """
        return self._reset_query_pool(device, query_pool, first_query, query_count)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_cull_mode = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCullMode".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_cull_mode)]()[]
    self._vk_cmd_set_front_face = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetFrontFace".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_front_face)]()[]
    self._vk_cmd_set_primitive_topology = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPrimitiveTopology".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_primitive_topology)]()[]
    self._vk_cmd_set_viewport_with_count = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetViewportWithCount".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_viewport_with_count)]()[]
    self._vk_cmd_set_scissor_with_count = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetScissorWithCount".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_scissor_with_count)]()[]
    self._vk_cmd_bind_vertex_buffers_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindVertexBuffers2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_vertex_buffers_2)]()[]
    self._vk_cmd_set_depth_test_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthTestEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_test_enable)]()[]
    self._vk_cmd_set_depth_write_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthWriteEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_write_enable)]()[]
    self._vk_cmd_set_depth_compare_op = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthCompareOp".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_compare_op)]()[]
    self._vk_cmd_set_depth_bounds_test_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthBoundsTestEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_bounds_test_enable)]()[]
    self._vk_cmd_set_stencil_test_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetStencilTestEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_stencil_test_enable)]()[]
    self._vk_cmd_set_stencil_op = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetStencilOp".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_stencil_op)]()[]

    fn cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCullMode.html
        """
        return self._cmd_set_cull_mode(command_buffer, cull_mode)

    fn cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFrontFace.html
        """
        return self._cmd_set_front_face(command_buffer, front_face)

    fn cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveTopology.html
        """
        return self._cmd_set_primitive_topology(command_buffer, primitive_topology)

    fn cmd_set_viewport_with_count(
        self,
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWithCount.html
        """
        return self._cmd_set_viewport_with_count(command_buffer, viewport_count, p_viewports)

    fn cmd_set_scissor_with_count(
        self,
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissorWithCount.html
        """
        return self._cmd_set_scissor_with_count(command_buffer, scissor_count, p_scissors)

    fn cmd_bind_vertex_buffers_2(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
        p_sizes: Ptr[DeviceSize, ImmutAnyOrigin],
        p_strides: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers2.html
        """
        return self._cmd_bind_vertex_buffers_2(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets, p_sizes, p_strides
        )

    fn cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthTestEnable.html
        """
        return self._cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    fn cmd_set_depth_write_enable(self, command_buffer: CommandBuffer, depth_write_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthWriteEnable.html
        """
        return self._cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    fn cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthCompareOp.html
        """
        return self._cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    fn cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBoundsTestEnable.html
        """
        return self._cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    fn cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilTestEnable.html
        """
        return self._cmd_set_stencil_test_enable(command_buffer, stencil_test_enable)

    fn cmd_set_stencil_op(
        self,
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilOp.html
        """
        return self._cmd_set_stencil_op(
            command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_copy_memory_to_image = Ptr(to=get_device_proc_addr(
        device, "vkCopyMemoryToImage".unsafe_ptr()
    )).bitcast[type_of(self._vk_copy_memory_to_image)]()[]
    self._vk_copy_image_to_memory = Ptr(to=get_device_proc_addr(
        device, "vkCopyImageToMemory".unsafe_ptr()
    )).bitcast[type_of(self._vk_copy_image_to_memory)]()[]
    self._vk_copy_image_to_image = Ptr(to=get_device_proc_addr(
        device, "vkCopyImageToImage".unsafe_ptr()
    )).bitcast[type_of(self._vk_copy_image_to_image)]()[]
    self._vk_transition_image_layout = Ptr(to=get_device_proc_addr(
        device, "vkTransitionImageLayout".unsafe_ptr()
    )).bitcast[type_of(self._vk_transition_image_layout)]()[]
    self._vk_get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
        device, "vkGetImageSubresourceLayout2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_subresource_layout_2)]()[]

    fn copy_memory_to_image(
        self, device: Device, copy_memory_to_image_info: CopyMemoryToImageInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToImage.html
        """
        return self._copy_memory_to_image(
            device, Ptr(to=copy_memory_to_image_info).bitcast[CopyMemoryToImageInfo]()
        )

    fn copy_image_to_memory(
        self, device: Device, copy_image_to_memory_info: CopyImageToMemoryInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyImageToMemory.html
        """
        return self._copy_image_to_memory(
            device, Ptr(to=copy_image_to_memory_info).bitcast[CopyImageToMemoryInfo]()
        )

    fn copy_image_to_image(
        self, device: Device, copy_image_to_image_info: CopyImageToImageInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyImageToImage.html
        """
        return self._copy_image_to_image(
            device, Ptr(to=copy_image_to_image_info).bitcast[CopyImageToImageInfo]()
        )

    fn transition_image_layout(
        self,
        device: Device,
        transition_count: UInt32,
        p_transitions: Ptr[HostImageLayoutTransitionInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTransitionImageLayout.html
        """
        return self._transition_image_layout(device, transition_count, p_transitions)

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_release_swapchain_images_khr = Ptr(to=get_device_proc_addr(
        device, "vkReleaseSwapchainImagesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_release_swapchain_images_khr)]()[]

    fn release_swapchain_images_khr(
        self, device: Device, release_info: ReleaseSwapchainImagesInfoKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleaseSwapchainImagesKHR.html
        """
        return self._release_swapchain_images_khr(
            device, Ptr(to=release_info).bitcast[ReleaseSwapchainImagesInfoKHR]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_depth_bias_2_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthBias2EXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_bias_2_ext)]()[]

    fn cmd_set_depth_bias_2_ext(
        self, command_buffer: CommandBuffer, depth_bias_info: DepthBiasInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBias2EXT.html
        """
        return self._cmd_set_depth_bias_2_ext(
            command_buffer, Ptr(to=depth_bias_info).bitcast[DepthBiasInfoEXT]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_acquire_drm_display_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkAcquireDrmDisplayEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_acquire_drm_display_ext)]()[]
    self._vk_get_drm_display_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkGetDrmDisplayEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_drm_display_ext)]()[]

    fn acquire_drm_display_ext(
        self, physical_device: PhysicalDevice, drm_fd: Int32, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireDrmDisplayEXT.html
        """
        return self._acquire_drm_display_ext(physical_device, drm_fd, display)

    fn get_drm_display_ext(
        self,
        physical_device: PhysicalDevice,
        drm_fd: Int32,
        connector_id: UInt32,
        mut display: DisplayKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDrmDisplayEXT.html
        """
        return self._get_drm_display_ext(
            physical_device, drm_fd, connector_id, Ptr(to=display).bitcast[DisplayKHR]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_private_data_slot = Ptr(to=get_device_proc_addr(
        device, "vkCreatePrivateDataSlot".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_private_data_slot)]()[]
    self._vk_destroy_private_data_slot = Ptr(to=get_device_proc_addr(
        device, "vkDestroyPrivateDataSlot".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_private_data_slot)]()[]
    self._vk_set_private_data = Ptr(to=get_device_proc_addr(
        device, "vkSetPrivateData".unsafe_ptr()
    )).bitcast[type_of(self._vk_set_private_data)]()[]
    self._vk_get_private_data = Ptr(to=get_device_proc_addr(
        device, "vkGetPrivateData".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_private_data)]()[]

    fn create_private_data_slot(
        self,
        device: Device,
        create_info: PrivateDataSlotCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut private_data_slot: PrivateDataSlot,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePrivateDataSlot.html
        """
        return self._create_private_data_slot(
            device,
            Ptr(to=create_info).bitcast[PrivateDataSlotCreateInfo](),
            p_allocator,
            Ptr(to=private_data_slot).bitcast[PrivateDataSlot](),
        )

    fn destroy_private_data_slot(
        self,
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPrivateDataSlot.html
        """
        return self._destroy_private_data_slot(device, private_data_slot, p_allocator)

    fn set_private_data(
        self,
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        data: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetPrivateData.html
        """
        return self._set_private_data(device, object_type, object_handle, private_data_slot, data)

    fn get_private_data(
        self,
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        mut data: UInt64,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPrivateData.html
        """
        return self._get_private_data(
            device, object_type, object_handle, private_data_slot, Ptr(to=data).bitcast[UInt64]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_export_metal_objects_ext = Ptr(to=get_device_proc_addr(
        device, "vkExportMetalObjectsEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_export_metal_objects_ext)]()[]

    fn export_metal_objects_ext(
        self, device: Device, mut metal_objects_info: ExportMetalObjectsInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkExportMetalObjectsEXT.html
        """
        return self._export_metal_objects_ext(
            device, Ptr(to=metal_objects_info).bitcast[ExportMetalObjectsInfoEXT]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_descriptor_set_layout_size_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetDescriptorSetLayoutSizeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_descriptor_set_layout_size_ext)]()[]
    self._vk_get_descriptor_set_layout_binding_offset_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetDescriptorSetLayoutBindingOffsetEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_descriptor_set_layout_binding_offset_ext)]()[]
    self._vk_get_descriptor_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetDescriptorEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_descriptor_ext)]()[]
    self._vk_cmd_bind_descriptor_buffers_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindDescriptorBuffersEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_descriptor_buffers_ext)]()[]
    self._vk_cmd_set_descriptor_buffer_offsets_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDescriptorBufferOffsetsEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_descriptor_buffer_offsets_ext)]()[]
    self._vk_cmd_bind_descriptor_buffer_embedded_samplers_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindDescriptorBufferEmbeddedSamplersEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_descriptor_buffer_embedded_samplers_ext)]()[]
    self._vk_get_buffer_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetBufferOpaqueCaptureDescriptorDataEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_buffer_opaque_capture_descriptor_data_ext)]()[]
    self._vk_get_image_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetImageOpaqueCaptureDescriptorDataEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_opaque_capture_descriptor_data_ext)]()[]
    self._vk_get_image_view_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetImageViewOpaqueCaptureDescriptorDataEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_view_opaque_capture_descriptor_data_ext)]()[]
    self._vk_get_sampler_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetSamplerOpaqueCaptureDescriptorDataEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_sampler_opaque_capture_descriptor_data_ext)]()[]
    self._vk_get_acceleration_structure_opaque_capture_descriptor_data_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_acceleration_structure_opaque_capture_descriptor_data_ext)]()[]

    fn get_descriptor_set_layout_size_ext(
        self, device: Device, layout: DescriptorSetLayout, mut layout_size_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutSizeEXT.html
        """
        return self._get_descriptor_set_layout_size_ext(
            device, layout, Ptr(to=layout_size_in_bytes).bitcast[DeviceSize]()
        )

    fn get_descriptor_set_layout_binding_offset_ext(
        self, device: Device, layout: DescriptorSetLayout, binding: UInt32, mut offset: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutBindingOffsetEXT.html
        """
        return self._get_descriptor_set_layout_binding_offset_ext(
            device, layout, binding, Ptr(to=offset).bitcast[DeviceSize]()
        )

    fn get_descriptor_ext(
        self,
        device: Device,
        descriptor_info: DescriptorGetInfoEXT,
        data_size: UInt,
        p_descriptor: Ptr[NoneType, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorEXT.html
        """
        return self._get_descriptor_ext(
            device, Ptr(to=descriptor_info).bitcast[DescriptorGetInfoEXT](), data_size, p_descriptor
        )

    fn cmd_bind_descriptor_buffers_ext(
        self,
        command_buffer: CommandBuffer,
        buffer_count: UInt32,
        p_binding_infos: Ptr[DescriptorBufferBindingInfoEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorBuffersEXT.html
        """
        return self._cmd_bind_descriptor_buffers_ext(command_buffer, buffer_count, p_binding_infos)

    fn cmd_set_descriptor_buffer_offsets_ext(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        set_count: UInt32,
        p_buffer_indices: Ptr[UInt32, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDescriptorBufferOffsetsEXT.html
        """
        return self._cmd_set_descriptor_buffer_offsets_ext(
            command_buffer,
            pipeline_bind_point,
            layout,
            first_set,
            set_count,
            p_buffer_indices,
            p_offsets,
        )

    fn cmd_bind_descriptor_buffer_embedded_samplers_ext(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorBufferEmbeddedSamplersEXT.html
        """
        return self._cmd_bind_descriptor_buffer_embedded_samplers_ext(
            command_buffer, pipeline_bind_point, layout, set
        )

    fn get_buffer_opaque_capture_descriptor_data_ext(
        self, device: Device, info: BufferCaptureDescriptorDataInfoEXT, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_buffer_opaque_capture_descriptor_data_ext(
            device,
            Ptr(to=info).bitcast[BufferCaptureDescriptorDataInfoEXT](),
            Ptr(to=data).bitcast[NoneType](),
        )

    fn get_image_opaque_capture_descriptor_data_ext(
        self, device: Device, info: ImageCaptureDescriptorDataInfoEXT, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_image_opaque_capture_descriptor_data_ext(
            device,
            Ptr(to=info).bitcast[ImageCaptureDescriptorDataInfoEXT](),
            Ptr(to=data).bitcast[NoneType](),
        )

    fn get_image_view_opaque_capture_descriptor_data_ext(
        self, device: Device, info: ImageViewCaptureDescriptorDataInfoEXT, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageViewOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_image_view_opaque_capture_descriptor_data_ext(
            device,
            Ptr(to=info).bitcast[ImageViewCaptureDescriptorDataInfoEXT](),
            Ptr(to=data).bitcast[NoneType](),
        )

    fn get_sampler_opaque_capture_descriptor_data_ext(
        self, device: Device, info: SamplerCaptureDescriptorDataInfoEXT, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSamplerOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_sampler_opaque_capture_descriptor_data_ext(
            device,
            Ptr(to=info).bitcast[SamplerCaptureDescriptorDataInfoEXT](),
            Ptr(to=data).bitcast[NoneType](),
        )

    fn get_acceleration_structure_opaque_capture_descriptor_data_ext(
        self,
        device: Device,
        info: AccelerationStructureCaptureDescriptorDataInfoEXT,
        mut data: NoneType,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureOpaqueCaptureDescriptorDataEXT.html
        """
        return self._get_acceleration_structure_opaque_capture_descriptor_data_ext(
            device,
            Ptr(to=info).bitcast[AccelerationStructureCaptureDescriptorDataInfoEXT](),
            Ptr(to=data).bitcast[NoneType](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_draw_mesh_tasks_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawMeshTasksEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_mesh_tasks_ext)]()[]
    self._vk_cmd_draw_mesh_tasks_indirect_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawMeshTasksIndirectEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_mesh_tasks_indirect_ext)]()[]
    self._vk_cmd_draw_mesh_tasks_indirect_count_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawMeshTasksIndirectCountEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_mesh_tasks_indirect_count_ext)]()[]

    fn cmd_draw_mesh_tasks_ext(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksEXT.html
        """
        return self._cmd_draw_mesh_tasks_ext(
            command_buffer, group_count_x, group_count_y, group_count_z
        )

    fn cmd_draw_mesh_tasks_indirect_ext(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksIndirectEXT.html
        """
        return self._cmd_draw_mesh_tasks_indirect_ext(
            command_buffer, buffer, offset, draw_count, stride
        )

    fn cmd_draw_mesh_tasks_indirect_count_ext(
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksIndirectCountEXT.html
        """
        return self._cmd_draw_mesh_tasks_indirect_count_ext(
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
        device, "vkGetImageSubresourceLayout2".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_subresource_layout_2)]()[]

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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_device_fault_info_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceFaultInfoEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_fault_info_ext)]()[]

    fn get_device_fault_info_ext(
        self,
        device: Device,
        mut fault_counts: DeviceFaultCountsEXT,
        p_fault_info: Ptr[DeviceFaultInfoEXT, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceFaultInfoEXT.html
        """
        return self._get_device_fault_info_ext(
            device, Ptr(to=fault_counts).bitcast[DeviceFaultCountsEXT](), p_fault_info
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_direct_fb_surface_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateDirectFBSurfaceEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_direct_fb_surface_ext)]()[]
    self._vk_get_physical_device_direct_fb_presentation_support_ext = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceDirectFBPresentationSupportEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_direct_fb_presentation_support_ext)]()[]

    fn create_direct_fb_surface_ext(
        self,
        instance: Instance,
        create_info: DirectFBSurfaceCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDirectFBSurfaceEXT.html
        """
        return self._create_direct_fb_surface_ext(
            instance,
            Ptr(to=create_info).bitcast[DirectFBSurfaceCreateInfoEXT](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

    fn get_physical_device_direct_fb_presentation_support_ext(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32, mut dfb: IDirectFB
    ) -> Bool32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceDirectFBPresentationSupportEXT.html
        """
        return self._get_physical_device_direct_fb_presentation_support_ext(
            physical_device, queue_family_index, Ptr(to=dfb).bitcast[IDirectFB]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_vertex_input_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetVertexInputEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_vertex_input_ext)]()[]

    fn cmd_set_vertex_input_ext(
        self,
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetVertexInputEXT.html
        """
        return self._cmd_set_vertex_input_ext(
            command_buffer,
            vertex_binding_description_count,
            p_vertex_binding_descriptions,
            vertex_attribute_description_count,
            p_vertex_attribute_descriptions,
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_pipeline_properties_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetPipelinePropertiesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_pipeline_properties_ext)]()[]

    fn get_pipeline_properties_ext(
        self,
        device: Device,
        pipeline_info: PipelineInfoEXT,
        mut pipeline_properties: BaseOutStructure,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelinePropertiesEXT.html
        """
        return self._get_pipeline_properties_ext(
            device,
            Ptr(to=pipeline_info).bitcast[PipelineInfoEXT](),
            Ptr(to=pipeline_properties).bitcast[BaseOutStructure](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_patch_control_points_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPatchControlPointsEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_patch_control_points_ext)]()[]
    self._vk_cmd_set_rasterizer_discard_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRasterizerDiscardEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_rasterizer_discard_enable)]()[]
    self._vk_cmd_set_depth_bias_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthBiasEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_bias_enable)]()[]
    self._vk_cmd_set_logic_op_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetLogicOpEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_logic_op_ext)]()[]
    self._vk_cmd_set_primitive_restart_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPrimitiveRestartEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_primitive_restart_enable)]()[]

    fn cmd_set_patch_control_points_ext(
        self, command_buffer: CommandBuffer, patch_control_points: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPatchControlPointsEXT.html
        """
        return self._cmd_set_patch_control_points_ext(command_buffer, patch_control_points)

    fn cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizerDiscardEnable.html
        """
        return self._cmd_set_rasterizer_discard_enable(command_buffer, rasterizer_discard_enable)

    fn cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBiasEnable.html
        """
        return self._cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    fn cmd_set_logic_op_ext(self, command_buffer: CommandBuffer, logic_op: LogicOp):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEXT.html
        """
        return self._cmd_set_logic_op_ext(command_buffer, logic_op)

    fn cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_color_write_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetColorWriteEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_color_write_enable_ext)]()[]

    fn cmd_set_color_write_enable_ext(
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_color_write_enables: Ptr[Bool32, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorWriteEnableEXT.html
        """
        return self._cmd_set_color_write_enable_ext(
            command_buffer, attachment_count, p_color_write_enables
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_draw_multi_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawMultiEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_multi_ext)]()[]
    self._vk_cmd_draw_multi_indexed_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawMultiIndexedEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_multi_indexed_ext)]()[]

    fn cmd_draw_multi_ext(
        self,
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_vertex_info: Ptr[MultiDrawInfoEXT, ImmutAnyOrigin],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMultiEXT.html
        """
        return self._cmd_draw_multi_ext(
            command_buffer, draw_count, p_vertex_info, instance_count, first_instance, stride
        )

    fn cmd_draw_multi_indexed_ext(
        self,
        command_buffer: CommandBuffer,
        draw_count: UInt32,
        p_index_info: Ptr[MultiDrawIndexedInfoEXT, ImmutAnyOrigin],
        instance_count: UInt32,
        first_instance: UInt32,
        stride: UInt32,
        p_vertex_offset: Ptr[Int32, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMultiIndexedEXT.html
        """
        return self._cmd_draw_multi_indexed_ext(
            command_buffer,
            draw_count,
            p_index_info,
            instance_count,
            first_instance,
            stride,
            p_vertex_offset,
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_micromap_ext = Ptr(to=get_device_proc_addr(
        device, "vkCreateMicromapEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_micromap_ext)]()[]
    self._vk_destroy_micromap_ext = Ptr(to=get_device_proc_addr(
        device, "vkDestroyMicromapEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_micromap_ext)]()[]
    self._vk_cmd_build_micromaps_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdBuildMicromapsEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_build_micromaps_ext)]()[]
    self._vk_build_micromaps_ext = Ptr(to=get_device_proc_addr(
        device, "vkBuildMicromapsEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_build_micromaps_ext)]()[]
    self._vk_copy_micromap_ext = Ptr(to=get_device_proc_addr(
        device, "vkCopyMicromapEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_copy_micromap_ext)]()[]
    self._vk_copy_micromap_to_memory_ext = Ptr(to=get_device_proc_addr(
        device, "vkCopyMicromapToMemoryEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_copy_micromap_to_memory_ext)]()[]
    self._vk_copy_memory_to_micromap_ext = Ptr(to=get_device_proc_addr(
        device, "vkCopyMemoryToMicromapEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_copy_memory_to_micromap_ext)]()[]
    self._vk_write_micromaps_properties_ext = Ptr(to=get_device_proc_addr(
        device, "vkWriteMicromapsPropertiesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_write_micromaps_properties_ext)]()[]
    self._vk_cmd_copy_micromap_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyMicromapEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_micromap_ext)]()[]
    self._vk_cmd_copy_micromap_to_memory_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyMicromapToMemoryEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_micromap_to_memory_ext)]()[]
    self._vk_cmd_copy_memory_to_micromap_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyMemoryToMicromapEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_memory_to_micromap_ext)]()[]
    self._vk_cmd_write_micromaps_properties_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdWriteMicromapsPropertiesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_write_micromaps_properties_ext)]()[]
    self._vk_get_device_micromap_compatibility_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceMicromapCompatibilityEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_micromap_compatibility_ext)]()[]
    self._vk_get_micromap_build_sizes_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetMicromapBuildSizesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_micromap_build_sizes_ext)]()[]

    fn create_micromap_ext(
        self,
        device: Device,
        create_info: MicromapCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut micromap: MicromapEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateMicromapEXT.html
        """
        return self._create_micromap_ext(
            device,
            Ptr(to=create_info).bitcast[MicromapCreateInfoEXT](),
            p_allocator,
            Ptr(to=micromap).bitcast[MicromapEXT](),
        )

    fn destroy_micromap_ext(
        self,
        device: Device,
        micromap: MicromapEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyMicromapEXT.html
        """
        return self._destroy_micromap_ext(device, micromap, p_allocator)

    fn cmd_build_micromaps_ext(
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildMicromapsEXT.html
        """
        return self._cmd_build_micromaps_ext(command_buffer, info_count, p_infos)

    fn build_micromaps_ext(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info_count: UInt32,
        p_infos: Ptr[MicromapBuildInfoEXT, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBuildMicromapsEXT.html
        """
        return self._build_micromaps_ext(device, deferred_operation, info_count, p_infos)

    fn copy_micromap_ext(
        self, device: Device, deferred_operation: DeferredOperationKHR, info: CopyMicromapInfoEXT
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMicromapEXT.html
        """
        return self._copy_micromap_ext(
            device, deferred_operation, Ptr(to=info).bitcast[CopyMicromapInfoEXT]()
        )

    fn copy_micromap_to_memory_ext(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMicromapToMemoryInfoEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMicromapToMemoryEXT.html
        """
        return self._copy_micromap_to_memory_ext(
            device, deferred_operation, Ptr(to=info).bitcast[CopyMicromapToMemoryInfoEXT]()
        )

    fn copy_memory_to_micromap_ext(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        info: CopyMemoryToMicromapInfoEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToMicromapEXT.html
        """
        return self._copy_memory_to_micromap_ext(
            device, deferred_operation, Ptr(to=info).bitcast[CopyMemoryToMicromapInfoEXT]()
        )

    fn write_micromaps_properties_ext(
        self,
        device: Device,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT, ImmutAnyOrigin],
        query_type: QueryType,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: UInt,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWriteMicromapsPropertiesEXT.html
        """
        return self._write_micromaps_properties_ext(
            device, micromap_count, p_micromaps, query_type, data_size, p_data, stride
        )

    fn cmd_copy_micromap_ext(self, command_buffer: CommandBuffer, info: CopyMicromapInfoEXT):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMicromapEXT.html
        """
        return self._cmd_copy_micromap_ext(
            command_buffer, Ptr(to=info).bitcast[CopyMicromapInfoEXT]()
        )

    fn cmd_copy_micromap_to_memory_ext(
        self, command_buffer: CommandBuffer, info: CopyMicromapToMemoryInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMicromapToMemoryEXT.html
        """
        return self._cmd_copy_micromap_to_memory_ext(
            command_buffer, Ptr(to=info).bitcast[CopyMicromapToMemoryInfoEXT]()
        )

    fn cmd_copy_memory_to_micromap_ext(
        self, command_buffer: CommandBuffer, info: CopyMemoryToMicromapInfoEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryToMicromapEXT.html
        """
        return self._cmd_copy_memory_to_micromap_ext(
            command_buffer, Ptr(to=info).bitcast[CopyMemoryToMicromapInfoEXT]()
        )

    fn cmd_write_micromaps_properties_ext(
        self,
        command_buffer: CommandBuffer,
        micromap_count: UInt32,
        p_micromaps: Ptr[MicromapEXT, ImmutAnyOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteMicromapsPropertiesEXT.html
        """
        return self._cmd_write_micromaps_properties_ext(
            command_buffer, micromap_count, p_micromaps, query_type, query_pool, first_query
        )

    fn get_device_micromap_compatibility_ext(
        self,
        device: Device,
        version_info: MicromapVersionInfoEXT,
        mut compatibility: AccelerationStructureCompatibilityKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMicromapCompatibilityEXT.html
        """
        return self._get_device_micromap_compatibility_ext(
            device,
            Ptr(to=version_info).bitcast[MicromapVersionInfoEXT](),
            Ptr(to=compatibility).bitcast[AccelerationStructureCompatibilityKHR](),
        )

    fn get_micromap_build_sizes_ext(
        self,
        device: Device,
        build_type: AccelerationStructureBuildTypeKHR,
        build_info: MicromapBuildInfoEXT,
        mut size_info: MicromapBuildSizesInfoEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMicromapBuildSizesEXT.html
        """
        return self._get_micromap_build_sizes_ext(
            device,
            build_type,
            Ptr(to=build_info).bitcast[MicromapBuildInfoEXT](),
            Ptr(to=size_info).bitcast[MicromapBuildSizesInfoEXT](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_set_device_memory_priority_ext = Ptr(to=get_device_proc_addr(
        device, "vkSetDeviceMemoryPriorityEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_set_device_memory_priority_ext)]()[]

    fn set_device_memory_priority_ext(
        self, device: Device, memory: DeviceMemory, priority: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetDeviceMemoryPriorityEXT.html
        """
        return self._set_device_memory_priority_ext(device, memory, priority)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_depth_clamp_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthClampEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_clamp_enable_ext)]()[]
    self._vk_cmd_set_polygon_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPolygonModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_polygon_mode_ext)]()[]
    self._vk_cmd_set_rasterization_samples_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRasterizationSamplesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_rasterization_samples_ext)]()[]
    self._vk_cmd_set_sample_mask_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetSampleMaskEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_sample_mask_ext)]()[]
    self._vk_cmd_set_alpha_to_coverage_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetAlphaToCoverageEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_alpha_to_coverage_enable_ext)]()[]
    self._vk_cmd_set_alpha_to_one_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetAlphaToOneEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_alpha_to_one_enable_ext)]()[]
    self._vk_cmd_set_logic_op_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetLogicOpEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_logic_op_enable_ext)]()[]
    self._vk_cmd_set_color_blend_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetColorBlendEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_color_blend_enable_ext)]()[]
    self._vk_cmd_set_color_blend_equation_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetColorBlendEquationEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_color_blend_equation_ext)]()[]
    self._vk_cmd_set_color_write_mask_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetColorWriteMaskEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_color_write_mask_ext)]()[]
    self._vk_cmd_set_tessellation_domain_origin_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetTessellationDomainOriginEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_tessellation_domain_origin_ext)]()[]
    self._vk_cmd_set_rasterization_stream_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRasterizationStreamEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_rasterization_stream_ext)]()[]
    self._vk_cmd_set_conservative_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetConservativeRasterizationModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_conservative_rasterization_mode_ext)]()[]
    self._vk_cmd_set_extra_primitive_overestimation_size_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetExtraPrimitiveOverestimationSizeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_extra_primitive_overestimation_size_ext)]()[]
    self._vk_cmd_set_depth_clip_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthClipEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_clip_enable_ext)]()[]
    self._vk_cmd_set_sample_locations_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetSampleLocationsEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_sample_locations_enable_ext)]()[]
    self._vk_cmd_set_color_blend_advanced_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetColorBlendAdvancedEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_color_blend_advanced_ext)]()[]
    self._vk_cmd_set_provoking_vertex_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetProvokingVertexModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_provoking_vertex_mode_ext)]()[]
    self._vk_cmd_set_line_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetLineRasterizationModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_line_rasterization_mode_ext)]()[]
    self._vk_cmd_set_line_stipple_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetLineStippleEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_line_stipple_enable_ext)]()[]
    self._vk_cmd_set_depth_clip_negative_one_to_one_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthClipNegativeOneToOneEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_clip_negative_one_to_one_ext)]()[]
    self._vk_cmd_set_viewport_w_scaling_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetViewportWScalingEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_viewport_w_scaling_enable_nv)]()[]
    self._vk_cmd_set_viewport_swizzle_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetViewportSwizzleNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_viewport_swizzle_nv)]()[]
    self._vk_cmd_set_coverage_to_color_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageToColorEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_to_color_enable_nv)]()[]
    self._vk_cmd_set_coverage_to_color_location_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageToColorLocationNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_to_color_location_nv)]()[]
    self._vk_cmd_set_coverage_modulation_mode_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageModulationModeNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_modulation_mode_nv)]()[]
    self._vk_cmd_set_coverage_modulation_table_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageModulationTableEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_modulation_table_enable_nv)]()[]
    self._vk_cmd_set_coverage_modulation_table_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageModulationTableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_modulation_table_nv)]()[]
    self._vk_cmd_set_shading_rate_image_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetShadingRateImageEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_shading_rate_image_enable_nv)]()[]
    self._vk_cmd_set_representative_fragment_test_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRepresentativeFragmentTestEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_representative_fragment_test_enable_nv)]()[]
    self._vk_cmd_set_coverage_reduction_mode_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageReductionModeNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_reduction_mode_nv)]()[]

    fn cmd_set_depth_clamp_enable_ext(
        self, command_buffer: CommandBuffer, depth_clamp_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampEnableEXT.html
        """
        return self._cmd_set_depth_clamp_enable_ext(command_buffer, depth_clamp_enable)

    fn cmd_set_polygon_mode_ext(self, command_buffer: CommandBuffer, polygon_mode: PolygonMode):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPolygonModeEXT.html
        """
        return self._cmd_set_polygon_mode_ext(command_buffer, polygon_mode)

    fn cmd_set_rasterization_samples_ext(
        self, command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationSamplesEXT.html
        """
        return self._cmd_set_rasterization_samples_ext(command_buffer, rasterization_samples)

    fn cmd_set_sample_mask_ext(
        self,
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleMaskEXT.html
        """
        return self._cmd_set_sample_mask_ext(command_buffer, samples, p_sample_mask)

    fn cmd_set_alpha_to_coverage_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToCoverageEnableEXT.html
        """
        return self._cmd_set_alpha_to_coverage_enable_ext(command_buffer, alpha_to_coverage_enable)

    fn cmd_set_alpha_to_one_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToOneEnableEXT.html
        """
        return self._cmd_set_alpha_to_one_enable_ext(command_buffer, alpha_to_one_enable)

    fn cmd_set_logic_op_enable_ext(self, command_buffer: CommandBuffer, logic_op_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEnableEXT.html
        """
        return self._cmd_set_logic_op_enable_ext(command_buffer, logic_op_enable)

    fn cmd_set_color_blend_enable_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendEnableEXT.html
        """
        return self._cmd_set_color_blend_enable_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_enables
        )

    fn cmd_set_color_blend_equation_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendEquationEXT.html
        """
        return self._cmd_set_color_blend_equation_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_equations
        )

    fn cmd_set_color_write_mask_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorWriteMaskEXT.html
        """
        return self._cmd_set_color_write_mask_ext(
            command_buffer, first_attachment, attachment_count, p_color_write_masks
        )

    fn cmd_set_tessellation_domain_origin_ext(
        self, command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetTessellationDomainOriginEXT.html
        """
        return self._cmd_set_tessellation_domain_origin_ext(command_buffer, domain_origin)

    fn cmd_set_rasterization_stream_ext(
        self, command_buffer: CommandBuffer, rasterization_stream: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationStreamEXT.html
        """
        return self._cmd_set_rasterization_stream_ext(command_buffer, rasterization_stream)

    fn cmd_set_conservative_rasterization_mode_ext(
        self,
        command_buffer: CommandBuffer,
        conservative_rasterization_mode: ConservativeRasterizationModeEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetConservativeRasterizationModeEXT.html
        """
        return self._cmd_set_conservative_rasterization_mode_ext(
            command_buffer, conservative_rasterization_mode
        )

    fn cmd_set_extra_primitive_overestimation_size_ext(
        self, command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExtraPrimitiveOverestimationSizeEXT.html
        """
        return self._cmd_set_extra_primitive_overestimation_size_ext(
            command_buffer, extra_primitive_overestimation_size
        )

    fn cmd_set_depth_clip_enable_ext(
        self, command_buffer: CommandBuffer, depth_clip_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipEnableEXT.html
        """
        return self._cmd_set_depth_clip_enable_ext(command_buffer, depth_clip_enable)

    fn cmd_set_sample_locations_enable_ext(
        self, command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEnableEXT.html
        """
        return self._cmd_set_sample_locations_enable_ext(command_buffer, sample_locations_enable)

    fn cmd_set_color_blend_advanced_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendAdvancedEXT.html
        """
        return self._cmd_set_color_blend_advanced_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_advanced
        )

    fn cmd_set_provoking_vertex_mode_ext(
        self, command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetProvokingVertexModeEXT.html
        """
        return self._cmd_set_provoking_vertex_mode_ext(command_buffer, provoking_vertex_mode)

    fn cmd_set_line_rasterization_mode_ext(
        self, command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineRasterizationModeEXT.html
        """
        return self._cmd_set_line_rasterization_mode_ext(command_buffer, line_rasterization_mode)

    fn cmd_set_line_stipple_enable_ext(
        self, command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStippleEnableEXT.html
        """
        return self._cmd_set_line_stipple_enable_ext(command_buffer, stippled_line_enable)

    fn cmd_set_depth_clip_negative_one_to_one_ext(
        self, command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipNegativeOneToOneEXT.html
        """
        return self._cmd_set_depth_clip_negative_one_to_one_ext(
            command_buffer, negative_one_to_one
        )

    fn cmd_set_viewport_w_scaling_enable_nv(
        self, command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingEnableNV.html
        """
        return self._cmd_set_viewport_w_scaling_enable_nv(
            command_buffer, viewport_w_scaling_enable
        )

    fn cmd_set_viewport_swizzle_nv(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportSwizzleNV.html
        """
        return self._cmd_set_viewport_swizzle_nv(
            command_buffer, first_viewport, viewport_count, p_viewport_swizzles
        )

    fn cmd_set_coverage_to_color_enable_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorEnableNV.html
        """
        return self._cmd_set_coverage_to_color_enable_nv(command_buffer, coverage_to_color_enable)

    fn cmd_set_coverage_to_color_location_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorLocationNV.html
        """
        return self._cmd_set_coverage_to_color_location_nv(
            command_buffer, coverage_to_color_location
        )

    fn cmd_set_coverage_modulation_mode_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationModeNV.html
        """
        return self._cmd_set_coverage_modulation_mode_nv(command_buffer, coverage_modulation_mode)

    fn cmd_set_coverage_modulation_table_enable_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableEnableNV.html
        """
        return self._cmd_set_coverage_modulation_table_enable_nv(
            command_buffer, coverage_modulation_table_enable
        )

    fn cmd_set_coverage_modulation_table_nv(
        self,
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableNV.html
        """
        return self._cmd_set_coverage_modulation_table_nv(
            command_buffer, coverage_modulation_table_count, p_coverage_modulation_table
        )

    fn cmd_set_shading_rate_image_enable_nv(
        self, command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetShadingRateImageEnableNV.html
        """
        return self._cmd_set_shading_rate_image_enable_nv(
            command_buffer, shading_rate_image_enable
        )

    fn cmd_set_representative_fragment_test_enable_nv(
        self, command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRepresentativeFragmentTestEnableNV.html
        """
        return self._cmd_set_representative_fragment_test_enable_nv(
            command_buffer, representative_fragment_test_enable
        )

    fn cmd_set_coverage_reduction_mode_nv(
        self, command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageReductionModeNV.html
        """
        return self._cmd_set_coverage_reduction_mode_nv(command_buffer, coverage_reduction_mode)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_shader_module_identifier_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetShaderModuleIdentifierEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_shader_module_identifier_ext)]()[]
    self._vk_get_shader_module_create_info_identifier_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetShaderModuleCreateInfoIdentifierEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_shader_module_create_info_identifier_ext)]()[]

    fn get_shader_module_identifier_ext(
        self, device: Device, shader_module: ShaderModule, mut identifier: ShaderModuleIdentifierEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderModuleIdentifierEXT.html
        """
        return self._get_shader_module_identifier_ext(
            device, shader_module, Ptr(to=identifier).bitcast[ShaderModuleIdentifierEXT]()
        )

    fn get_shader_module_create_info_identifier_ext(
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        mut identifier: ShaderModuleIdentifierEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderModuleCreateInfoIdentifierEXT.html
        """
        return self._get_shader_module_create_info_identifier_ext(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo](),
            Ptr(to=identifier).bitcast[ShaderModuleIdentifierEXT](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_shaders_ext = Ptr(to=get_device_proc_addr(
        device, "vkCreateShadersEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_shaders_ext)]()[]
    self._vk_destroy_shader_ext = Ptr(to=get_device_proc_addr(
        device, "vkDestroyShaderEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_shader_ext)]()[]
    self._vk_get_shader_binary_data_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetShaderBinaryDataEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_shader_binary_data_ext)]()[]
    self._vk_cmd_bind_shaders_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindShadersEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_shaders_ext)]()[]
    self._vk_cmd_set_cull_mode = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCullMode".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_cull_mode)]()[]
    self._vk_cmd_set_front_face = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetFrontFace".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_front_face)]()[]
    self._vk_cmd_set_primitive_topology = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPrimitiveTopology".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_primitive_topology)]()[]
    self._vk_cmd_set_viewport_with_count = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetViewportWithCount".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_viewport_with_count)]()[]
    self._vk_cmd_set_scissor_with_count = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetScissorWithCount".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_scissor_with_count)]()[]
    self._vk_cmd_bind_vertex_buffers_2 = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindVertexBuffers2".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_vertex_buffers_2)]()[]
    self._vk_cmd_set_depth_test_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthTestEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_test_enable)]()[]
    self._vk_cmd_set_depth_write_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthWriteEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_write_enable)]()[]
    self._vk_cmd_set_depth_compare_op = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthCompareOp".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_compare_op)]()[]
    self._vk_cmd_set_depth_bounds_test_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthBoundsTestEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_bounds_test_enable)]()[]
    self._vk_cmd_set_stencil_test_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetStencilTestEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_stencil_test_enable)]()[]
    self._vk_cmd_set_stencil_op = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetStencilOp".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_stencil_op)]()[]
    self._vk_cmd_set_vertex_input_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetVertexInputEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_vertex_input_ext)]()[]
    self._vk_cmd_set_patch_control_points_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPatchControlPointsEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_patch_control_points_ext)]()[]
    self._vk_cmd_set_rasterizer_discard_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRasterizerDiscardEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_rasterizer_discard_enable)]()[]
    self._vk_cmd_set_depth_bias_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthBiasEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_bias_enable)]()[]
    self._vk_cmd_set_logic_op_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetLogicOpEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_logic_op_ext)]()[]
    self._vk_cmd_set_primitive_restart_enable = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPrimitiveRestartEnable".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_primitive_restart_enable)]()[]
    self._vk_cmd_set_tessellation_domain_origin_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetTessellationDomainOriginEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_tessellation_domain_origin_ext)]()[]
    self._vk_cmd_set_depth_clamp_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthClampEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_clamp_enable_ext)]()[]
    self._vk_cmd_set_polygon_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPolygonModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_polygon_mode_ext)]()[]
    self._vk_cmd_set_rasterization_samples_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRasterizationSamplesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_rasterization_samples_ext)]()[]
    self._vk_cmd_set_sample_mask_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetSampleMaskEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_sample_mask_ext)]()[]
    self._vk_cmd_set_alpha_to_coverage_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetAlphaToCoverageEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_alpha_to_coverage_enable_ext)]()[]
    self._vk_cmd_set_alpha_to_one_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetAlphaToOneEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_alpha_to_one_enable_ext)]()[]
    self._vk_cmd_set_logic_op_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetLogicOpEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_logic_op_enable_ext)]()[]
    self._vk_cmd_set_color_blend_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetColorBlendEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_color_blend_enable_ext)]()[]
    self._vk_cmd_set_color_blend_equation_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetColorBlendEquationEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_color_blend_equation_ext)]()[]
    self._vk_cmd_set_color_write_mask_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetColorWriteMaskEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_color_write_mask_ext)]()[]
    self._vk_cmd_set_rasterization_stream_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRasterizationStreamEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_rasterization_stream_ext)]()[]
    self._vk_cmd_set_conservative_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetConservativeRasterizationModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_conservative_rasterization_mode_ext)]()[]
    self._vk_cmd_set_extra_primitive_overestimation_size_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetExtraPrimitiveOverestimationSizeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_extra_primitive_overestimation_size_ext)]()[]
    self._vk_cmd_set_depth_clip_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthClipEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_clip_enable_ext)]()[]
    self._vk_cmd_set_sample_locations_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetSampleLocationsEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_sample_locations_enable_ext)]()[]
    self._vk_cmd_set_color_blend_advanced_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetColorBlendAdvancedEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_color_blend_advanced_ext)]()[]
    self._vk_cmd_set_provoking_vertex_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetProvokingVertexModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_provoking_vertex_mode_ext)]()[]
    self._vk_cmd_set_line_rasterization_mode_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetLineRasterizationModeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_line_rasterization_mode_ext)]()[]
    self._vk_cmd_set_line_stipple_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetLineStippleEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_line_stipple_enable_ext)]()[]
    self._vk_cmd_set_depth_clip_negative_one_to_one_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthClipNegativeOneToOneEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_clip_negative_one_to_one_ext)]()[]
    self._vk_cmd_set_viewport_w_scaling_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetViewportWScalingEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_viewport_w_scaling_enable_nv)]()[]
    self._vk_cmd_set_viewport_swizzle_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetViewportSwizzleNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_viewport_swizzle_nv)]()[]
    self._vk_cmd_set_coverage_to_color_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageToColorEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_to_color_enable_nv)]()[]
    self._vk_cmd_set_coverage_to_color_location_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageToColorLocationNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_to_color_location_nv)]()[]
    self._vk_cmd_set_coverage_modulation_mode_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageModulationModeNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_modulation_mode_nv)]()[]
    self._vk_cmd_set_coverage_modulation_table_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageModulationTableEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_modulation_table_enable_nv)]()[]
    self._vk_cmd_set_coverage_modulation_table_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageModulationTableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_modulation_table_nv)]()[]
    self._vk_cmd_set_shading_rate_image_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetShadingRateImageEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_shading_rate_image_enable_nv)]()[]
    self._vk_cmd_set_representative_fragment_test_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetRepresentativeFragmentTestEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_representative_fragment_test_enable_nv)]()[]
    self._vk_cmd_set_coverage_reduction_mode_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoverageReductionModeNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coverage_reduction_mode_nv)]()[]
    self._vk_cmd_set_depth_clamp_range_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthClampRangeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_clamp_range_ext)]()[]

    fn create_shaders_ext(
        self,
        device: Device,
        create_info_count: UInt32,
        p_create_infos: Ptr[ShaderCreateInfoEXT, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_shaders: Ptr[ShaderEXT, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShadersEXT.html
        """
        return self._create_shaders_ext(
            device, create_info_count, p_create_infos, p_allocator, p_shaders
        )

    fn destroy_shader_ext(
        self,
        device: Device,
        shader: ShaderEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderEXT.html
        """
        return self._destroy_shader_ext(device, shader, p_allocator)

    fn get_shader_binary_data_ext(
        self,
        device: Device,
        shader: ShaderEXT,
        mut data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderBinaryDataEXT.html
        """
        return self._get_shader_binary_data_ext(
            device, shader, Ptr(to=data_size).bitcast[UInt](), p_data
        )

    fn cmd_bind_shaders_ext(
        self,
        command_buffer: CommandBuffer,
        stage_count: UInt32,
        p_stages: Ptr[ShaderStageFlagBits, ImmutAnyOrigin],
        p_shaders: Ptr[ShaderEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindShadersEXT.html
        """
        return self._cmd_bind_shaders_ext(command_buffer, stage_count, p_stages, p_shaders)

    fn cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCullMode.html
        """
        return self._cmd_set_cull_mode(command_buffer, cull_mode)

    fn cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFrontFace.html
        """
        return self._cmd_set_front_face(command_buffer, front_face)

    fn cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveTopology.html
        """
        return self._cmd_set_primitive_topology(command_buffer, primitive_topology)

    fn cmd_set_viewport_with_count(
        self,
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWithCount.html
        """
        return self._cmd_set_viewport_with_count(command_buffer, viewport_count, p_viewports)

    fn cmd_set_scissor_with_count(
        self,
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissorWithCount.html
        """
        return self._cmd_set_scissor_with_count(command_buffer, scissor_count, p_scissors)

    fn cmd_bind_vertex_buffers_2(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
        p_sizes: Ptr[DeviceSize, ImmutAnyOrigin],
        p_strides: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers2.html
        """
        return self._cmd_bind_vertex_buffers_2(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets, p_sizes, p_strides
        )

    fn cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthTestEnable.html
        """
        return self._cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    fn cmd_set_depth_write_enable(self, command_buffer: CommandBuffer, depth_write_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthWriteEnable.html
        """
        return self._cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    fn cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthCompareOp.html
        """
        return self._cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    fn cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBoundsTestEnable.html
        """
        return self._cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    fn cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilTestEnable.html
        """
        return self._cmd_set_stencil_test_enable(command_buffer, stencil_test_enable)

    fn cmd_set_stencil_op(
        self,
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilOp.html
        """
        return self._cmd_set_stencil_op(
            command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op
        )

    fn cmd_set_vertex_input_ext(
        self,
        command_buffer: CommandBuffer,
        vertex_binding_description_count: UInt32,
        p_vertex_binding_descriptions: Ptr[VertexInputBindingDescription2EXT, ImmutAnyOrigin],
        vertex_attribute_description_count: UInt32,
        p_vertex_attribute_descriptions: Ptr[VertexInputAttributeDescription2EXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetVertexInputEXT.html
        """
        return self._cmd_set_vertex_input_ext(
            command_buffer,
            vertex_binding_description_count,
            p_vertex_binding_descriptions,
            vertex_attribute_description_count,
            p_vertex_attribute_descriptions,
        )

    fn cmd_set_patch_control_points_ext(
        self, command_buffer: CommandBuffer, patch_control_points: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPatchControlPointsEXT.html
        """
        return self._cmd_set_patch_control_points_ext(command_buffer, patch_control_points)

    fn cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizerDiscardEnable.html
        """
        return self._cmd_set_rasterizer_discard_enable(command_buffer, rasterizer_discard_enable)

    fn cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBiasEnable.html
        """
        return self._cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    fn cmd_set_logic_op_ext(self, command_buffer: CommandBuffer, logic_op: LogicOp):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEXT.html
        """
        return self._cmd_set_logic_op_ext(command_buffer, logic_op)

    fn cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)

    fn cmd_set_tessellation_domain_origin_ext(
        self, command_buffer: CommandBuffer, domain_origin: TessellationDomainOrigin
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetTessellationDomainOriginEXT.html
        """
        return self._cmd_set_tessellation_domain_origin_ext(command_buffer, domain_origin)

    fn cmd_set_depth_clamp_enable_ext(
        self, command_buffer: CommandBuffer, depth_clamp_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampEnableEXT.html
        """
        return self._cmd_set_depth_clamp_enable_ext(command_buffer, depth_clamp_enable)

    fn cmd_set_polygon_mode_ext(self, command_buffer: CommandBuffer, polygon_mode: PolygonMode):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPolygonModeEXT.html
        """
        return self._cmd_set_polygon_mode_ext(command_buffer, polygon_mode)

    fn cmd_set_rasterization_samples_ext(
        self, command_buffer: CommandBuffer, rasterization_samples: SampleCountFlagBits
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationSamplesEXT.html
        """
        return self._cmd_set_rasterization_samples_ext(command_buffer, rasterization_samples)

    fn cmd_set_sample_mask_ext(
        self,
        command_buffer: CommandBuffer,
        samples: SampleCountFlagBits,
        p_sample_mask: Ptr[SampleMask, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleMaskEXT.html
        """
        return self._cmd_set_sample_mask_ext(command_buffer, samples, p_sample_mask)

    fn cmd_set_alpha_to_coverage_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_coverage_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToCoverageEnableEXT.html
        """
        return self._cmd_set_alpha_to_coverage_enable_ext(command_buffer, alpha_to_coverage_enable)

    fn cmd_set_alpha_to_one_enable_ext(
        self, command_buffer: CommandBuffer, alpha_to_one_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAlphaToOneEnableEXT.html
        """
        return self._cmd_set_alpha_to_one_enable_ext(command_buffer, alpha_to_one_enable)

    fn cmd_set_logic_op_enable_ext(self, command_buffer: CommandBuffer, logic_op_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLogicOpEnableEXT.html
        """
        return self._cmd_set_logic_op_enable_ext(command_buffer, logic_op_enable)

    fn cmd_set_color_blend_enable_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_enables: Ptr[Bool32, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendEnableEXT.html
        """
        return self._cmd_set_color_blend_enable_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_enables
        )

    fn cmd_set_color_blend_equation_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_equations: Ptr[ColorBlendEquationEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendEquationEXT.html
        """
        return self._cmd_set_color_blend_equation_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_equations
        )

    fn cmd_set_color_write_mask_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_write_masks: Ptr[ColorComponentFlags, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorWriteMaskEXT.html
        """
        return self._cmd_set_color_write_mask_ext(
            command_buffer, first_attachment, attachment_count, p_color_write_masks
        )

    fn cmd_set_rasterization_stream_ext(
        self, command_buffer: CommandBuffer, rasterization_stream: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizationStreamEXT.html
        """
        return self._cmd_set_rasterization_stream_ext(command_buffer, rasterization_stream)

    fn cmd_set_conservative_rasterization_mode_ext(
        self,
        command_buffer: CommandBuffer,
        conservative_rasterization_mode: ConservativeRasterizationModeEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetConservativeRasterizationModeEXT.html
        """
        return self._cmd_set_conservative_rasterization_mode_ext(
            command_buffer, conservative_rasterization_mode
        )

    fn cmd_set_extra_primitive_overestimation_size_ext(
        self, command_buffer: CommandBuffer, extra_primitive_overestimation_size: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExtraPrimitiveOverestimationSizeEXT.html
        """
        return self._cmd_set_extra_primitive_overestimation_size_ext(
            command_buffer, extra_primitive_overestimation_size
        )

    fn cmd_set_depth_clip_enable_ext(
        self, command_buffer: CommandBuffer, depth_clip_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipEnableEXT.html
        """
        return self._cmd_set_depth_clip_enable_ext(command_buffer, depth_clip_enable)

    fn cmd_set_sample_locations_enable_ext(
        self, command_buffer: CommandBuffer, sample_locations_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetSampleLocationsEnableEXT.html
        """
        return self._cmd_set_sample_locations_enable_ext(command_buffer, sample_locations_enable)

    fn cmd_set_color_blend_advanced_ext(
        self,
        command_buffer: CommandBuffer,
        first_attachment: UInt32,
        attachment_count: UInt32,
        p_color_blend_advanced: Ptr[ColorBlendAdvancedEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetColorBlendAdvancedEXT.html
        """
        return self._cmd_set_color_blend_advanced_ext(
            command_buffer, first_attachment, attachment_count, p_color_blend_advanced
        )

    fn cmd_set_provoking_vertex_mode_ext(
        self, command_buffer: CommandBuffer, provoking_vertex_mode: ProvokingVertexModeEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetProvokingVertexModeEXT.html
        """
        return self._cmd_set_provoking_vertex_mode_ext(command_buffer, provoking_vertex_mode)

    fn cmd_set_line_rasterization_mode_ext(
        self, command_buffer: CommandBuffer, line_rasterization_mode: LineRasterizationModeEXT
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineRasterizationModeEXT.html
        """
        return self._cmd_set_line_rasterization_mode_ext(command_buffer, line_rasterization_mode)

    fn cmd_set_line_stipple_enable_ext(
        self, command_buffer: CommandBuffer, stippled_line_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStippleEnableEXT.html
        """
        return self._cmd_set_line_stipple_enable_ext(command_buffer, stippled_line_enable)

    fn cmd_set_depth_clip_negative_one_to_one_ext(
        self, command_buffer: CommandBuffer, negative_one_to_one: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClipNegativeOneToOneEXT.html
        """
        return self._cmd_set_depth_clip_negative_one_to_one_ext(
            command_buffer, negative_one_to_one
        )

    fn cmd_set_viewport_w_scaling_enable_nv(
        self, command_buffer: CommandBuffer, viewport_w_scaling_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingEnableNV.html
        """
        return self._cmd_set_viewport_w_scaling_enable_nv(
            command_buffer, viewport_w_scaling_enable
        )

    fn cmd_set_viewport_swizzle_nv(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_swizzles: Ptr[ViewportSwizzleNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportSwizzleNV.html
        """
        return self._cmd_set_viewport_swizzle_nv(
            command_buffer, first_viewport, viewport_count, p_viewport_swizzles
        )

    fn cmd_set_coverage_to_color_enable_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorEnableNV.html
        """
        return self._cmd_set_coverage_to_color_enable_nv(command_buffer, coverage_to_color_enable)

    fn cmd_set_coverage_to_color_location_nv(
        self, command_buffer: CommandBuffer, coverage_to_color_location: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageToColorLocationNV.html
        """
        return self._cmd_set_coverage_to_color_location_nv(
            command_buffer, coverage_to_color_location
        )

    fn cmd_set_coverage_modulation_mode_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_mode: CoverageModulationModeNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationModeNV.html
        """
        return self._cmd_set_coverage_modulation_mode_nv(command_buffer, coverage_modulation_mode)

    fn cmd_set_coverage_modulation_table_enable_nv(
        self, command_buffer: CommandBuffer, coverage_modulation_table_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableEnableNV.html
        """
        return self._cmd_set_coverage_modulation_table_enable_nv(
            command_buffer, coverage_modulation_table_enable
        )

    fn cmd_set_coverage_modulation_table_nv(
        self,
        command_buffer: CommandBuffer,
        coverage_modulation_table_count: UInt32,
        p_coverage_modulation_table: Ptr[Float32, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageModulationTableNV.html
        """
        return self._cmd_set_coverage_modulation_table_nv(
            command_buffer, coverage_modulation_table_count, p_coverage_modulation_table
        )

    fn cmd_set_shading_rate_image_enable_nv(
        self, command_buffer: CommandBuffer, shading_rate_image_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetShadingRateImageEnableNV.html
        """
        return self._cmd_set_shading_rate_image_enable_nv(
            command_buffer, shading_rate_image_enable
        )

    fn cmd_set_representative_fragment_test_enable_nv(
        self, command_buffer: CommandBuffer, representative_fragment_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRepresentativeFragmentTestEnableNV.html
        """
        return self._cmd_set_representative_fragment_test_enable_nv(
            command_buffer, representative_fragment_test_enable
        )

    fn cmd_set_coverage_reduction_mode_nv(
        self, command_buffer: CommandBuffer, coverage_reduction_mode: CoverageReductionModeNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoverageReductionModeNV.html
        """
        return self._cmd_set_coverage_reduction_mode_nv(command_buffer, coverage_reduction_mode)

    fn cmd_set_depth_clamp_range_ext(
        self,
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampRangeEXT.html
        """
        return self._cmd_set_depth_clamp_range_ext(
            command_buffer, depth_clamp_mode, p_depth_clamp_range
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_attachment_feedback_loop_enable_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetAttachmentFeedbackLoopEnableEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_attachment_feedback_loop_enable_ext)]()[]

    fn cmd_set_attachment_feedback_loop_enable_ext(
        self, command_buffer: CommandBuffer, aspect_mask: ImageAspectFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetAttachmentFeedbackLoopEnableEXT.html
        """
        return self._cmd_set_attachment_feedback_loop_enable_ext(command_buffer, aspect_mask)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_generated_commands_memory_requirements_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetGeneratedCommandsMemoryRequirementsEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_generated_commands_memory_requirements_ext)]()[]
    self._vk_cmd_preprocess_generated_commands_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdPreprocessGeneratedCommandsEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_preprocess_generated_commands_ext)]()[]
    self._vk_cmd_execute_generated_commands_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdExecuteGeneratedCommandsEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_execute_generated_commands_ext)]()[]
    self._vk_create_indirect_commands_layout_ext = Ptr(to=get_device_proc_addr(
        device, "vkCreateIndirectCommandsLayoutEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_indirect_commands_layout_ext)]()[]
    self._vk_destroy_indirect_commands_layout_ext = Ptr(to=get_device_proc_addr(
        device, "vkDestroyIndirectCommandsLayoutEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_indirect_commands_layout_ext)]()[]
    self._vk_create_indirect_execution_set_ext = Ptr(to=get_device_proc_addr(
        device, "vkCreateIndirectExecutionSetEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_indirect_execution_set_ext)]()[]
    self._vk_destroy_indirect_execution_set_ext = Ptr(to=get_device_proc_addr(
        device, "vkDestroyIndirectExecutionSetEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_indirect_execution_set_ext)]()[]
    self._vk_update_indirect_execution_set_pipeline_ext = Ptr(to=get_device_proc_addr(
        device, "vkUpdateIndirectExecutionSetPipelineEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_update_indirect_execution_set_pipeline_ext)]()[]
    self._vk_update_indirect_execution_set_shader_ext = Ptr(to=get_device_proc_addr(
        device, "vkUpdateIndirectExecutionSetShaderEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_update_indirect_execution_set_shader_ext)]()[]

    fn get_generated_commands_memory_requirements_ext(
        self,
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoEXT,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetGeneratedCommandsMemoryRequirementsEXT.html
        """
        return self._get_generated_commands_memory_requirements_ext(
            device,
            Ptr(to=info).bitcast[GeneratedCommandsMemoryRequirementsInfoEXT](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn cmd_preprocess_generated_commands_ext(
        self,
        command_buffer: CommandBuffer,
        generated_commands_info: GeneratedCommandsInfoEXT,
        state_command_buffer: CommandBuffer,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPreprocessGeneratedCommandsEXT.html
        """
        return self._cmd_preprocess_generated_commands_ext(
            command_buffer,
            Ptr(to=generated_commands_info).bitcast[GeneratedCommandsInfoEXT](),
            state_command_buffer,
        )

    fn cmd_execute_generated_commands_ext(
        self,
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        generated_commands_info: GeneratedCommandsInfoEXT,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteGeneratedCommandsEXT.html
        """
        return self._cmd_execute_generated_commands_ext(
            command_buffer,
            is_preprocessed,
            Ptr(to=generated_commands_info).bitcast[GeneratedCommandsInfoEXT](),
        )

    fn create_indirect_commands_layout_ext(
        self,
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut indirect_commands_layout: IndirectCommandsLayoutEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectCommandsLayoutEXT.html
        """
        return self._create_indirect_commands_layout_ext(
            device,
            Ptr(to=create_info).bitcast[IndirectCommandsLayoutCreateInfoEXT](),
            p_allocator,
            Ptr(to=indirect_commands_layout).bitcast[IndirectCommandsLayoutEXT](),
        )

    fn destroy_indirect_commands_layout_ext(
        self,
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectCommandsLayoutEXT.html
        """
        return self._destroy_indirect_commands_layout_ext(
            device, indirect_commands_layout, p_allocator
        )

    fn create_indirect_execution_set_ext(
        self,
        device: Device,
        create_info: IndirectExecutionSetCreateInfoEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut indirect_execution_set: IndirectExecutionSetEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectExecutionSetEXT.html
        """
        return self._create_indirect_execution_set_ext(
            device,
            Ptr(to=create_info).bitcast[IndirectExecutionSetCreateInfoEXT](),
            p_allocator,
            Ptr(to=indirect_execution_set).bitcast[IndirectExecutionSetEXT](),
        )

    fn destroy_indirect_execution_set_ext(
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectExecutionSetEXT.html
        """
        return self._destroy_indirect_execution_set_ext(
            device, indirect_execution_set, p_allocator
        )

    fn update_indirect_execution_set_pipeline_ext(
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetPipelineEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateIndirectExecutionSetPipelineEXT.html
        """
        return self._update_indirect_execution_set_pipeline_ext(
            device, indirect_execution_set, execution_set_write_count, p_execution_set_writes
        )

    fn update_indirect_execution_set_shader_ext(
        self,
        device: Device,
        indirect_execution_set: IndirectExecutionSetEXT,
        execution_set_write_count: UInt32,
        p_execution_set_writes: Ptr[WriteIndirectExecutionSetShaderEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateIndirectExecutionSetShaderEXT.html
        """
        return self._update_indirect_execution_set_shader_ext(
            device, indirect_execution_set, execution_set_write_count, p_execution_set_writes
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_depth_clamp_range_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetDepthClampRangeEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_depth_clamp_range_ext)]()[]

    fn cmd_set_depth_clamp_range_ext(
        self,
        command_buffer: CommandBuffer,
        depth_clamp_mode: DepthClampModeEXT,
        p_depth_clamp_range: Ptr[DepthClampRangeEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthClampRangeEXT.html
        """
        return self._cmd_set_depth_clamp_range_ext(
            command_buffer, depth_clamp_mode, p_depth_clamp_range
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_memory_metal_handle_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryMetalHandleEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_metal_handle_ext)]()[]
    self._vk_get_memory_metal_handle_properties_ext = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryMetalHandlePropertiesEXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_metal_handle_properties_ext)]()[]

    fn get_memory_metal_handle_ext(
        self,
        device: Device,
        get_metal_handle_info: MemoryGetMetalHandleInfoEXT,
        p_handle: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryMetalHandleEXT.html
        """
        return self._get_memory_metal_handle_ext(
            device, Ptr(to=get_metal_handle_info).bitcast[MemoryGetMetalHandleInfoEXT](), p_handle
        )

    fn get_memory_metal_handle_properties_ext(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        handle: NoneType,
        mut memory_metal_handle_properties: MemoryMetalHandlePropertiesEXT,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryMetalHandlePropertiesEXT.html
        """
        return self._get_memory_metal_handle_properties_ext(
            device,
            handle_type,
            Ptr(to=handle).bitcast[NoneType](),
            Ptr(to=memory_metal_handle_properties).bitcast[MemoryMetalHandlePropertiesEXT](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_end_rendering_2_ext = Ptr(to=get_device_proc_addr(
        device, "vkCmdEndRendering2EXT".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_end_rendering_2_ext)]()[]

    fn cmd_end_rendering_2_ext(
        self,
        command_buffer: CommandBuffer,
        p_rendering_end_info: Ptr[RenderingEndInfoEXT, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering2EXT.html
        """
        return self._cmd_end_rendering_2_ext(command_buffer, p_rendering_end_info)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_cu_module_nvx = Ptr(to=get_device_proc_addr(
        device, "vkCreateCuModuleNVX".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_cu_module_nvx)]()[]
    self._vk_create_cu_function_nvx = Ptr(to=get_device_proc_addr(
        device, "vkCreateCuFunctionNVX".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_cu_function_nvx)]()[]
    self._vk_destroy_cu_module_nvx = Ptr(to=get_device_proc_addr(
        device, "vkDestroyCuModuleNVX".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_cu_module_nvx)]()[]
    self._vk_destroy_cu_function_nvx = Ptr(to=get_device_proc_addr(
        device, "vkDestroyCuFunctionNVX".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_cu_function_nvx)]()[]
    self._vk_cmd_cu_launch_kernel_nvx = Ptr(to=get_device_proc_addr(
        device, "vkCmdCuLaunchKernelNVX".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_cu_launch_kernel_nvx)]()[]

    fn create_cu_module_nvx(
        self,
        device: Device,
        create_info: CuModuleCreateInfoNVX,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut module: CuModuleNVX,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCuModuleNVX.html
        """
        return self._create_cu_module_nvx(
            device,
            Ptr(to=create_info).bitcast[CuModuleCreateInfoNVX](),
            p_allocator,
            Ptr(to=module).bitcast[CuModuleNVX](),
        )

    fn create_cu_function_nvx(
        self,
        device: Device,
        create_info: CuFunctionCreateInfoNVX,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut function: CuFunctionNVX,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCuFunctionNVX.html
        """
        return self._create_cu_function_nvx(
            device,
            Ptr(to=create_info).bitcast[CuFunctionCreateInfoNVX](),
            p_allocator,
            Ptr(to=function).bitcast[CuFunctionNVX](),
        )

    fn destroy_cu_module_nvx(
        self,
        device: Device,
        module: CuModuleNVX,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCuModuleNVX.html
        """
        return self._destroy_cu_module_nvx(device, module, p_allocator)

    fn destroy_cu_function_nvx(
        self,
        device: Device,
        function: CuFunctionNVX,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCuFunctionNVX.html
        """
        return self._destroy_cu_function_nvx(device, function, p_allocator)

    fn cmd_cu_launch_kernel_nvx(self, command_buffer: CommandBuffer, launch_info: CuLaunchInfoNVX):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCuLaunchKernelNVX.html
        """
        return self._cmd_cu_launch_kernel_nvx(
            command_buffer, Ptr(to=launch_info).bitcast[CuLaunchInfoNVX]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_image_view_handle_nvx = Ptr(to=get_device_proc_addr(
        device, "vkGetImageViewHandleNVX".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_view_handle_nvx)]()[]
    self._vk_get_image_view_handle_64_nvx = Ptr(to=get_device_proc_addr(
        device, "vkGetImageViewHandle64NVX".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_view_handle_64_nvx)]()[]
    self._vk_get_image_view_address_nvx = Ptr(to=get_device_proc_addr(
        device, "vkGetImageViewAddressNVX".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_image_view_address_nvx)]()[]

    fn get_image_view_handle_nvx(self, device: Device, info: ImageViewHandleInfoNVX) -> UInt32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageViewHandleNVX.html
        """
        return self._get_image_view_handle_nvx(
            device, Ptr(to=info).bitcast[ImageViewHandleInfoNVX]()
        )

    fn get_image_view_handle_64_nvx(self, device: Device, info: ImageViewHandleInfoNVX) -> UInt64:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageViewHandle64NVX.html
        """
        return self._get_image_view_handle_64_nvx(
            device, Ptr(to=info).bitcast[ImageViewHandleInfoNVX]()
        )

    fn get_image_view_address_nvx(
        self, device: Device, image_view: ImageView, mut properties: ImageViewAddressPropertiesNVX
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageViewAddressNVX.html
        """
        return self._get_image_view_address_nvx(
            device, image_view, Ptr(to=properties).bitcast[ImageViewAddressPropertiesNVX]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_draw_indirect_count = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawIndirectCount".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_indirect_count)]()[]
    self._vk_cmd_draw_indexed_indirect_count = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawIndexedIndirectCount".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_indexed_indirect_count)]()[]

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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirectCount.html
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

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_shader_info_amd = Ptr(to=get_device_proc_addr(
        device, "vkGetShaderInfoAMD".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_shader_info_amd)]()[]

    fn get_shader_info_amd(
        self,
        device: Device,
        pipeline: Pipeline,
        shader_stage: ShaderStageFlagBits,
        info_type: ShaderInfoTypeAMD,
        mut info_size: UInt,
        p_info: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderInfoAMD.html
        """
        return self._get_shader_info_amd(
            device, pipeline, shader_stage, info_type, Ptr(to=info_size).bitcast[UInt](), p_info
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_write_buffer_marker_amd = Ptr(to=get_device_proc_addr(
        device, "vkCmdWriteBufferMarkerAMD".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_write_buffer_marker_amd)]()[]
    self._vk_cmd_write_buffer_marker_2_amd = Ptr(to=get_device_proc_addr(
        device, "vkCmdWriteBufferMarker2AMD".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_write_buffer_marker_2_amd)]()[]

    fn cmd_write_buffer_marker_amd(
        self,
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteBufferMarkerAMD.html
        """
        return self._cmd_write_buffer_marker_amd(
            command_buffer, pipeline_stage, dst_buffer, dst_offset, marker
        )

    fn cmd_write_buffer_marker_2_amd(
        self,
        command_buffer: CommandBuffer,
        stage: PipelineStageFlags2,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteBufferMarker2AMD.html
        """
        return self._cmd_write_buffer_marker_2_amd(
            command_buffer, stage, dst_buffer, dst_offset, marker
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_set_local_dimming_amd = Ptr(to=get_device_proc_addr(
        device, "vkSetLocalDimmingAMD".unsafe_ptr()
    )).bitcast[type_of(self._vk_set_local_dimming_amd)]()[]

    fn set_local_dimming_amd(
        self, device: Device, swap_chain: SwapchainKHR, local_dimming_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLocalDimmingAMD.html
        """
        return self._set_local_dimming_amd(device, swap_chain, local_dimming_enable)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_anti_lag_update_amd = Ptr(to=get_device_proc_addr(
        device, "vkAntiLagUpdateAMD".unsafe_ptr()
    )).bitcast[type_of(self._vk_anti_lag_update_amd)]()[]

    fn anti_lag_update_amd(self, device: Device, data: AntiLagDataAMD):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAntiLagUpdateAMD.html
        """
        return self._anti_lag_update_amd(device, Ptr(to=data).bitcast[AntiLagDataAMD]())

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_stream_descriptor_surface_ggp = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateStreamDescriptorSurfaceGGP".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_stream_descriptor_surface_ggp)]()[]

    fn create_stream_descriptor_surface_ggp(
        self,
        instance: Instance,
        create_info: StreamDescriptorSurfaceCreateInfoGGP,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateStreamDescriptorSurfaceGGP.html
        """
        return self._create_stream_descriptor_surface_ggp(
            instance,
            Ptr(to=create_info).bitcast[StreamDescriptorSurfaceCreateInfoGGP](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_get_physical_device_external_image_format_properties_nv = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceExternalImageFormatPropertiesNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_external_image_format_properties_nv)]()[]

    fn get_physical_device_external_image_format_properties_nv(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        external_handle_type: ExternalMemoryHandleTypeFlagsNV,
        mut external_image_format_properties: ExternalImageFormatPropertiesNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalImageFormatPropertiesNV.html
        """
        return self._get_physical_device_external_image_format_properties_nv(
            physical_device,
            format,
            type,
            tiling,
            usage,
            flags,
            external_handle_type,
            Ptr(to=external_image_format_properties).bitcast[ExternalImageFormatPropertiesNV](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_memory_win_32_handle_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryWin32HandleNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_win_32_handle_nv)]()[]

    fn get_memory_win_32_handle_nv(
        self,
        device: Device,
        memory: DeviceMemory,
        handle_type: ExternalMemoryHandleTypeFlagsNV,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryWin32HandleNV.html
        """
        return self._get_memory_win_32_handle_nv(
            device, memory, handle_type, Ptr(to=handle).bitcast[HANDLE]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_viewport_w_scaling_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetViewportWScalingNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_viewport_w_scaling_nv)]()[]

    fn cmd_set_viewport_w_scaling_nv(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_w_scalings: Ptr[ViewportWScalingNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingNV.html
        """
        return self._cmd_set_viewport_w_scaling_nv(
            command_buffer, first_viewport, viewport_count, p_viewport_w_scalings
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_bind_shading_rate_image_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindShadingRateImageNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_shading_rate_image_nv)]()[]
    self._vk_cmd_set_viewport_shading_rate_palette_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetViewportShadingRatePaletteNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_viewport_shading_rate_palette_nv)]()[]
    self._vk_cmd_set_coarse_sample_order_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCoarseSampleOrderNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_coarse_sample_order_nv)]()[]

    fn cmd_bind_shading_rate_image_nv(
        self, command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindShadingRateImageNV.html
        """
        return self._cmd_bind_shading_rate_image_nv(command_buffer, image_view, image_layout)

    fn cmd_set_viewport_shading_rate_palette_nv(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_shading_rate_palettes: Ptr[ShadingRatePaletteNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportShadingRatePaletteNV.html
        """
        return self._cmd_set_viewport_shading_rate_palette_nv(
            command_buffer, first_viewport, viewport_count, p_shading_rate_palettes
        )

    fn cmd_set_coarse_sample_order_nv(
        self,
        command_buffer: CommandBuffer,
        sample_order_type: CoarseSampleOrderTypeNV,
        custom_sample_order_count: UInt32,
        p_custom_sample_orders: Ptr[CoarseSampleOrderCustomNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoarseSampleOrderNV.html
        """
        return self._cmd_set_coarse_sample_order_nv(
            command_buffer, sample_order_type, custom_sample_order_count, p_custom_sample_orders
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
        device, "vkCreateAccelerationStructureNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_acceleration_structure_nv)]()[]
    self._vk_destroy_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
        device, "vkDestroyAccelerationStructureNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_acceleration_structure_nv)]()[]
    self._vk_get_acceleration_structure_memory_requirements_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetAccelerationStructureMemoryRequirementsNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_acceleration_structure_memory_requirements_nv)]()[]
    self._vk_bind_acceleration_structure_memory_nv = Ptr(to=get_device_proc_addr(
        device, "vkBindAccelerationStructureMemoryNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_bind_acceleration_structure_memory_nv)]()[]
    self._vk_cmd_build_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdBuildAccelerationStructureNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_build_acceleration_structure_nv)]()[]
    self._vk_cmd_copy_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyAccelerationStructureNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_acceleration_structure_nv)]()[]
    self._vk_cmd_trace_rays_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdTraceRaysNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_trace_rays_nv)]()[]
    self._vk_create_ray_tracing_pipelines_nv = Ptr(to=get_device_proc_addr(
        device, "vkCreateRayTracingPipelinesNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_ray_tracing_pipelines_nv)]()[]
    self._vk_get_ray_tracing_shader_group_handles_khr = Ptr(to=get_device_proc_addr(
        device, "vkGetRayTracingShaderGroupHandlesKHR".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_ray_tracing_shader_group_handles_khr)]()[]
    self._vk_get_acceleration_structure_handle_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetAccelerationStructureHandleNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_acceleration_structure_handle_nv)]()[]
    self._vk_cmd_write_acceleration_structures_properties_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdWriteAccelerationStructuresPropertiesNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_write_acceleration_structures_properties_nv)]()[]
    self._vk_compile_deferred_nv = Ptr(to=get_device_proc_addr(
        device, "vkCompileDeferredNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_compile_deferred_nv)]()[]

    fn create_acceleration_structure_nv(
        self,
        device: Device,
        create_info: AccelerationStructureCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut acceleration_structure: AccelerationStructureNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateAccelerationStructureNV.html
        """
        return self._create_acceleration_structure_nv(
            device,
            Ptr(to=create_info).bitcast[AccelerationStructureCreateInfoNV](),
            p_allocator,
            Ptr(to=acceleration_structure).bitcast[AccelerationStructureNV](),
        )

    fn destroy_acceleration_structure_nv(
        self,
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyAccelerationStructureNV.html
        """
        return self._destroy_acceleration_structure_nv(device, acceleration_structure, p_allocator)

    fn get_acceleration_structure_memory_requirements_nv(
        self,
        device: Device,
        info: AccelerationStructureMemoryRequirementsInfoNV,
        mut memory_requirements: MemoryRequirements2KHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureMemoryRequirementsNV.html
        """
        return self._get_acceleration_structure_memory_requirements_nv(
            device,
            Ptr(to=info).bitcast[AccelerationStructureMemoryRequirementsInfoNV](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2KHR](),
        )

    fn bind_acceleration_structure_memory_nv(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindAccelerationStructureMemoryInfoNV, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindAccelerationStructureMemoryNV.html
        """
        return self._bind_acceleration_structure_memory_nv(device, bind_info_count, p_bind_infos)

    fn cmd_build_acceleration_structure_nv(
        self,
        command_buffer: CommandBuffer,
        info: AccelerationStructureInfoNV,
        instance_data: Buffer,
        instance_offset: DeviceSize,
        update: Bool32,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        scratch: Buffer,
        scratch_offset: DeviceSize,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildAccelerationStructureNV.html
        """
        return self._cmd_build_acceleration_structure_nv(
            command_buffer,
            Ptr(to=info).bitcast[AccelerationStructureInfoNV](),
            instance_data,
            instance_offset,
            update,
            dst,
            src,
            scratch,
            scratch_offset,
        )

    fn cmd_copy_acceleration_structure_nv(
        self,
        command_buffer: CommandBuffer,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        mode: CopyAccelerationStructureModeKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyAccelerationStructureNV.html
        """
        return self._cmd_copy_acceleration_structure_nv(command_buffer, dst, src, mode)

    fn cmd_trace_rays_nv(
        self,
        command_buffer: CommandBuffer,
        raygen_shader_binding_table_buffer: Buffer,
        raygen_shader_binding_offset: DeviceSize,
        miss_shader_binding_table_buffer: Buffer,
        miss_shader_binding_offset: DeviceSize,
        miss_shader_binding_stride: DeviceSize,
        hit_shader_binding_table_buffer: Buffer,
        hit_shader_binding_offset: DeviceSize,
        hit_shader_binding_stride: DeviceSize,
        callable_shader_binding_table_buffer: Buffer,
        callable_shader_binding_offset: DeviceSize,
        callable_shader_binding_stride: DeviceSize,
        width: UInt32,
        height: UInt32,
        depth: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdTraceRaysNV.html
        """
        return self._cmd_trace_rays_nv(
            command_buffer,
            raygen_shader_binding_table_buffer,
            raygen_shader_binding_offset,
            miss_shader_binding_table_buffer,
            miss_shader_binding_offset,
            miss_shader_binding_stride,
            hit_shader_binding_table_buffer,
            hit_shader_binding_offset,
            hit_shader_binding_stride,
            callable_shader_binding_table_buffer,
            callable_shader_binding_offset,
            callable_shader_binding_stride,
            width,
            height,
            depth,
        )

    fn create_ray_tracing_pipelines_nv(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoNV, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRayTracingPipelinesNV.html
        """
        return self._create_ray_tracing_pipelines_nv(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
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

    fn get_acceleration_structure_handle_nv(
        self,
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureHandleNV.html
        """
        return self._get_acceleration_structure_handle_nv(
            device, acceleration_structure, data_size, p_data
        )

    fn cmd_write_acceleration_structures_properties_nv(
        self,
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureNV, ImmutAnyOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteAccelerationStructuresPropertiesNV.html
        """
        return self._cmd_write_acceleration_structures_properties_nv(
            command_buffer,
            acceleration_structure_count,
            p_acceleration_structures,
            query_type,
            query_pool,
            first_query,
        )

    fn compile_deferred_nv(self, device: Device, pipeline: Pipeline, shader: UInt32) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCompileDeferredNV.html
        """
        return self._compile_deferred_nv(device, pipeline, shader)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_draw_mesh_tasks_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawMeshTasksNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_mesh_tasks_nv)]()[]
    self._vk_cmd_draw_mesh_tasks_indirect_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawMeshTasksIndirectNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_mesh_tasks_indirect_nv)]()[]
    self._vk_cmd_draw_mesh_tasks_indirect_count_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawMeshTasksIndirectCountNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_mesh_tasks_indirect_count_nv)]()[]

    fn cmd_draw_mesh_tasks_nv(
        self, command_buffer: CommandBuffer, task_count: UInt32, first_task: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksNV.html
        """
        return self._cmd_draw_mesh_tasks_nv(command_buffer, task_count, first_task)

    fn cmd_draw_mesh_tasks_indirect_nv(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksIndirectNV.html
        """
        return self._cmd_draw_mesh_tasks_indirect_nv(
            command_buffer, buffer, offset, draw_count, stride
        )

    fn cmd_draw_mesh_tasks_indirect_count_nv(
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksIndirectCountNV.html
        """
        return self._cmd_draw_mesh_tasks_indirect_count_nv(
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_exclusive_scissor_enable_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetExclusiveScissorEnableNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_exclusive_scissor_enable_nv)]()[]
    self._vk_cmd_set_exclusive_scissor_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetExclusiveScissorNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_exclusive_scissor_nv)]()[]

    fn cmd_set_exclusive_scissor_enable_nv(
        self,
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissor_enables: Ptr[Bool32, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExclusiveScissorEnableNV.html
        """
        return self._cmd_set_exclusive_scissor_enable_nv(
            command_buffer,
            first_exclusive_scissor,
            exclusive_scissor_count,
            p_exclusive_scissor_enables,
        )

    fn cmd_set_exclusive_scissor_nv(
        self,
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExclusiveScissorNV.html
        """
        return self._cmd_set_exclusive_scissor_nv(
            command_buffer, first_exclusive_scissor, exclusive_scissor_count, p_exclusive_scissors
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_checkpoint_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetCheckpointNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_checkpoint_nv)]()[]
    self._vk_get_queue_checkpoint_data_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetQueueCheckpointDataNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_queue_checkpoint_data_nv)]()[]
    self._vk_get_queue_checkpoint_data_2_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetQueueCheckpointData2NV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_queue_checkpoint_data_2_nv)]()[]

    fn cmd_set_checkpoint_nv(self, command_buffer: CommandBuffer, checkpoint_marker: NoneType):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCheckpointNV.html
        """
        return self._cmd_set_checkpoint_nv(
            command_buffer, Ptr(to=checkpoint_marker).bitcast[NoneType]()
        )

    fn get_queue_checkpoint_data_nv(
        self,
        queue: Queue,
        mut checkpoint_data_count: UInt32,
        p_checkpoint_data: Ptr[CheckpointDataNV, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointDataNV.html
        """
        return self._get_queue_checkpoint_data_nv(
            queue, Ptr(to=checkpoint_data_count).bitcast[UInt32](), p_checkpoint_data
        )

    fn get_queue_checkpoint_data_2_nv(
        self,
        queue: Queue,
        mut checkpoint_data_count: UInt32,
        p_checkpoint_data: Ptr[CheckpointData2NV, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointData2NV.html
        """
        return self._get_queue_checkpoint_data_2_nv(
            queue, Ptr(to=checkpoint_data_count).bitcast[UInt32](), p_checkpoint_data
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_cooperative_matrix_properties_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_cooperative_matrix_properties_nv)]()[]

    fn get_physical_device_cooperative_matrix_properties_nv(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixPropertiesNV, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixPropertiesNV.html
        """
        return self._get_physical_device_cooperative_matrix_properties_nv(
            physical_device, Ptr(to=property_count).bitcast[UInt32](), p_properties
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_supported_framebuffer_mixed_samples_combinations_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_supported_framebuffer_mixed_samples_combinations_nv)]()[]

    fn get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
        self,
        physical_device: PhysicalDevice,
        mut combination_count: UInt32,
        p_combinations: Ptr[FramebufferMixedSamplesCombinationNV, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV.html
        """
        return self._get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
            physical_device, Ptr(to=combination_count).bitcast[UInt32](), p_combinations
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_generated_commands_memory_requirements_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetGeneratedCommandsMemoryRequirementsNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_generated_commands_memory_requirements_nv)]()[]
    self._vk_cmd_preprocess_generated_commands_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdPreprocessGeneratedCommandsNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_preprocess_generated_commands_nv)]()[]
    self._vk_cmd_execute_generated_commands_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdExecuteGeneratedCommandsNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_execute_generated_commands_nv)]()[]
    self._vk_cmd_bind_pipeline_shader_group_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindPipelineShaderGroupNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_pipeline_shader_group_nv)]()[]
    self._vk_create_indirect_commands_layout_nv = Ptr(to=get_device_proc_addr(
        device, "vkCreateIndirectCommandsLayoutNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_indirect_commands_layout_nv)]()[]
    self._vk_destroy_indirect_commands_layout_nv = Ptr(to=get_device_proc_addr(
        device, "vkDestroyIndirectCommandsLayoutNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_indirect_commands_layout_nv)]()[]

    fn get_generated_commands_memory_requirements_nv(
        self,
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoNV,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetGeneratedCommandsMemoryRequirementsNV.html
        """
        return self._get_generated_commands_memory_requirements_nv(
            device,
            Ptr(to=info).bitcast[GeneratedCommandsMemoryRequirementsInfoNV](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn cmd_preprocess_generated_commands_nv(
        self, command_buffer: CommandBuffer, generated_commands_info: GeneratedCommandsInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPreprocessGeneratedCommandsNV.html
        """
        return self._cmd_preprocess_generated_commands_nv(
            command_buffer, Ptr(to=generated_commands_info).bitcast[GeneratedCommandsInfoNV]()
        )

    fn cmd_execute_generated_commands_nv(
        self,
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        generated_commands_info: GeneratedCommandsInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteGeneratedCommandsNV.html
        """
        return self._cmd_execute_generated_commands_nv(
            command_buffer,
            is_preprocessed,
            Ptr(to=generated_commands_info).bitcast[GeneratedCommandsInfoNV](),
        )

    fn cmd_bind_pipeline_shader_group_nv(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
        group_index: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipelineShaderGroupNV.html
        """
        return self._cmd_bind_pipeline_shader_group_nv(
            command_buffer, pipeline_bind_point, pipeline, group_index
        )

    fn create_indirect_commands_layout_nv(
        self,
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut indirect_commands_layout: IndirectCommandsLayoutNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectCommandsLayoutNV.html
        """
        return self._create_indirect_commands_layout_nv(
            device,
            Ptr(to=create_info).bitcast[IndirectCommandsLayoutCreateInfoNV](),
            p_allocator,
            Ptr(to=indirect_commands_layout).bitcast[IndirectCommandsLayoutNV](),
        )

    fn destroy_indirect_commands_layout_nv(
        self,
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectCommandsLayoutNV.html
        """
        return self._destroy_indirect_commands_layout_nv(
            device, indirect_commands_layout, p_allocator
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_cuda_module_nv = Ptr(to=get_device_proc_addr(
        device, "vkCreateCudaModuleNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_cuda_module_nv)]()[]
    self._vk_get_cuda_module_cache_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetCudaModuleCacheNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_cuda_module_cache_nv)]()[]
    self._vk_create_cuda_function_nv = Ptr(to=get_device_proc_addr(
        device, "vkCreateCudaFunctionNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_cuda_function_nv)]()[]
    self._vk_destroy_cuda_module_nv = Ptr(to=get_device_proc_addr(
        device, "vkDestroyCudaModuleNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_cuda_module_nv)]()[]
    self._vk_destroy_cuda_function_nv = Ptr(to=get_device_proc_addr(
        device, "vkDestroyCudaFunctionNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_cuda_function_nv)]()[]
    self._vk_cmd_cuda_launch_kernel_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdCudaLaunchKernelNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_cuda_launch_kernel_nv)]()[]

    fn create_cuda_module_nv(
        self,
        device: Device,
        create_info: CudaModuleCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut module: CudaModuleNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCudaModuleNV.html
        """
        return self._create_cuda_module_nv(
            device,
            Ptr(to=create_info).bitcast[CudaModuleCreateInfoNV](),
            p_allocator,
            Ptr(to=module).bitcast[CudaModuleNV](),
        )

    fn get_cuda_module_cache_nv(
        self,
        device: Device,
        module: CudaModuleNV,
        mut cache_size: UInt,
        p_cache_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetCudaModuleCacheNV.html
        """
        return self._get_cuda_module_cache_nv(
            device, module, Ptr(to=cache_size).bitcast[UInt](), p_cache_data
        )

    fn create_cuda_function_nv(
        self,
        device: Device,
        create_info: CudaFunctionCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut function: CudaFunctionNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCudaFunctionNV.html
        """
        return self._create_cuda_function_nv(
            device,
            Ptr(to=create_info).bitcast[CudaFunctionCreateInfoNV](),
            p_allocator,
            Ptr(to=function).bitcast[CudaFunctionNV](),
        )

    fn destroy_cuda_module_nv(
        self,
        device: Device,
        module: CudaModuleNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCudaModuleNV.html
        """
        return self._destroy_cuda_module_nv(device, module, p_allocator)

    fn destroy_cuda_function_nv(
        self,
        device: Device,
        function: CudaFunctionNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCudaFunctionNV.html
        """
        return self._destroy_cuda_function_nv(device, function, p_allocator)

    fn cmd_cuda_launch_kernel_nv(
        self, command_buffer: CommandBuffer, launch_info: CudaLaunchInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCudaLaunchKernelNV.html
        """
        return self._cmd_cuda_launch_kernel_nv(
            command_buffer, Ptr(to=launch_info).bitcast[CudaLaunchInfoNV]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_set_fragment_shading_rate_enum_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetFragmentShadingRateEnumNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_fragment_shading_rate_enum_nv)]()[]

    fn cmd_set_fragment_shading_rate_enum_nv(
        self,
        command_buffer: CommandBuffer,
        shading_rate: FragmentShadingRateNV,
        combiner_ops: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFragmentShadingRateEnumNV.html
        """
        return self._cmd_set_fragment_shading_rate_enum_nv(
            command_buffer, shading_rate, combiner_ops
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_acquire_winrt_display_nv = Ptr(to=get_device_proc_addr(
        device, "vkAcquireWinrtDisplayNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_acquire_winrt_display_nv)]()[]
    self._vk_get_winrt_display_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetWinrtDisplayNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_winrt_display_nv)]()[]

    fn acquire_winrt_display_nv(
        self, physical_device: PhysicalDevice, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireWinrtDisplayNV.html
        """
        return self._acquire_winrt_display_nv(physical_device, display)

    fn get_winrt_display_nv(
        self, physical_device: PhysicalDevice, device_relative_id: UInt32, mut display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetWinrtDisplayNV.html
        """
        return self._get_winrt_display_nv(
            physical_device, device_relative_id, Ptr(to=display).bitcast[DisplayKHR]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_memory_remote_address_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryRemoteAddressNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_remote_address_nv)]()[]

    fn get_memory_remote_address_nv(
        self,
        device: Device,
        memory_get_remote_address_info: MemoryGetRemoteAddressInfoNV,
        mut address: RemoteAddressNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryRemoteAddressNV.html
        """
        return self._get_memory_remote_address_nv(
            device,
            Ptr(to=memory_get_remote_address_info).bitcast[MemoryGetRemoteAddressInfoNV](),
            Ptr(to=address).bitcast[RemoteAddressNV](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_copy_memory_indirect_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyMemoryIndirectNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_memory_indirect_nv)]()[]
    self._vk_cmd_copy_memory_to_image_indirect_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyMemoryToImageIndirectNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_memory_to_image_indirect_nv)]()[]

    fn cmd_copy_memory_indirect_nv(
        self,
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryIndirectNV.html
        """
        return self._cmd_copy_memory_indirect_nv(
            command_buffer, copy_buffer_address, copy_count, stride
        )

    fn cmd_copy_memory_to_image_indirect_nv(
        self,
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        p_image_subresources: Ptr[ImageSubresourceLayers, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryToImageIndirectNV.html
        """
        return self._cmd_copy_memory_to_image_indirect_nv(
            command_buffer,
            copy_buffer_address,
            copy_count,
            stride,
            dst_image,
            dst_image_layout,
            p_image_subresources,
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_decompress_memory_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdDecompressMemoryNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_decompress_memory_nv)]()[]
    self._vk_cmd_decompress_memory_indirect_count_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdDecompressMemoryIndirectCountNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_decompress_memory_indirect_count_nv)]()[]

    fn cmd_decompress_memory_nv(
        self,
        command_buffer: CommandBuffer,
        decompress_region_count: UInt32,
        p_decompress_memory_regions: Ptr[DecompressMemoryRegionNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecompressMemoryNV.html
        """
        return self._cmd_decompress_memory_nv(
            command_buffer, decompress_region_count, p_decompress_memory_regions
        )

    fn cmd_decompress_memory_indirect_count_nv(
        self,
        command_buffer: CommandBuffer,
        indirect_commands_address: DeviceAddress,
        indirect_commands_count_address: DeviceAddress,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecompressMemoryIndirectCountNV.html
        """
        return self._cmd_decompress_memory_indirect_count_nv(
            command_buffer, indirect_commands_address, indirect_commands_count_address, stride
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_pipeline_indirect_memory_requirements_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetPipelineIndirectMemoryRequirementsNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_pipeline_indirect_memory_requirements_nv)]()[]
    self._vk_cmd_update_pipeline_indirect_buffer_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdUpdatePipelineIndirectBufferNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_update_pipeline_indirect_buffer_nv)]()[]
    self._vk_get_pipeline_indirect_device_address_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetPipelineIndirectDeviceAddressNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_pipeline_indirect_device_address_nv)]()[]

    fn get_pipeline_indirect_memory_requirements_nv(
        self,
        device: Device,
        create_info: ComputePipelineCreateInfo,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineIndirectMemoryRequirementsNV.html
        """
        return self._get_pipeline_indirect_memory_requirements_nv(
            device,
            Ptr(to=create_info).bitcast[ComputePipelineCreateInfo](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn cmd_update_pipeline_indirect_buffer_nv(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdatePipelineIndirectBufferNV.html
        """
        return self._cmd_update_pipeline_indirect_buffer_nv(
            command_buffer, pipeline_bind_point, pipeline
        )

    fn get_pipeline_indirect_device_address_nv(
        self, device: Device, info: PipelineIndirectDeviceAddressInfoNV
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineIndirectDeviceAddressNV.html
        """
        return self._get_pipeline_indirect_device_address_nv(
            device, Ptr(to=info).bitcast[PipelineIndirectDeviceAddressInfoNV]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_optical_flow_image_formats_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceOpticalFlowImageFormatsNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_optical_flow_image_formats_nv)]()[]
    self._vk_create_optical_flow_session_nv = Ptr(to=get_device_proc_addr(
        device, "vkCreateOpticalFlowSessionNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_optical_flow_session_nv)]()[]
    self._vk_destroy_optical_flow_session_nv = Ptr(to=get_device_proc_addr(
        device, "vkDestroyOpticalFlowSessionNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_optical_flow_session_nv)]()[]
    self._vk_bind_optical_flow_session_image_nv = Ptr(to=get_device_proc_addr(
        device, "vkBindOpticalFlowSessionImageNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_bind_optical_flow_session_image_nv)]()[]
    self._vk_cmd_optical_flow_execute_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdOpticalFlowExecuteNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_optical_flow_execute_nv)]()[]

    fn get_physical_device_optical_flow_image_formats_nv(
        self,
        physical_device: PhysicalDevice,
        optical_flow_image_format_info: OpticalFlowImageFormatInfoNV,
        mut format_count: UInt32,
        p_image_format_properties: Ptr[OpticalFlowImageFormatPropertiesNV, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceOpticalFlowImageFormatsNV.html
        """
        return self._get_physical_device_optical_flow_image_formats_nv(
            physical_device,
            Ptr(to=optical_flow_image_format_info).bitcast[OpticalFlowImageFormatInfoNV](),
            Ptr(to=format_count).bitcast[UInt32](),
            p_image_format_properties,
        )

    fn create_optical_flow_session_nv(
        self,
        device: Device,
        create_info: OpticalFlowSessionCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut session: OpticalFlowSessionNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateOpticalFlowSessionNV.html
        """
        return self._create_optical_flow_session_nv(
            device,
            Ptr(to=create_info).bitcast[OpticalFlowSessionCreateInfoNV](),
            p_allocator,
            Ptr(to=session).bitcast[OpticalFlowSessionNV](),
        )

    fn destroy_optical_flow_session_nv(
        self,
        device: Device,
        session: OpticalFlowSessionNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyOpticalFlowSessionNV.html
        """
        return self._destroy_optical_flow_session_nv(device, session, p_allocator)

    fn bind_optical_flow_session_image_nv(
        self,
        device: Device,
        session: OpticalFlowSessionNV,
        binding_point: OpticalFlowSessionBindingPointNV,
        view: ImageView,
        layout: ImageLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindOpticalFlowSessionImageNV.html
        """
        return self._bind_optical_flow_session_image_nv(
            device, session, binding_point, view, layout
        )

    fn cmd_optical_flow_execute_nv(
        self,
        command_buffer: CommandBuffer,
        session: OpticalFlowSessionNV,
        execute_info: OpticalFlowExecuteInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdOpticalFlowExecuteNV.html
        """
        return self._cmd_optical_flow_execute_nv(
            command_buffer, session, Ptr(to=execute_info).bitcast[OpticalFlowExecuteInfoNV]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_cooperative_vector_properties_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceCooperativeVectorPropertiesNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_cooperative_vector_properties_nv)]()[]
    self._vk_convert_cooperative_vector_matrix_nv = Ptr(to=get_device_proc_addr(
        device, "vkConvertCooperativeVectorMatrixNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_convert_cooperative_vector_matrix_nv)]()[]
    self._vk_cmd_convert_cooperative_vector_matrix_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdConvertCooperativeVectorMatrixNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_convert_cooperative_vector_matrix_nv)]()[]

    fn get_physical_device_cooperative_vector_properties_nv(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeVectorPropertiesNV, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeVectorPropertiesNV.html
        """
        return self._get_physical_device_cooperative_vector_properties_nv(
            physical_device, Ptr(to=property_count).bitcast[UInt32](), p_properties
        )

    fn convert_cooperative_vector_matrix_nv(
        self, device: Device, info: ConvertCooperativeVectorMatrixInfoNV
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkConvertCooperativeVectorMatrixNV.html
        """
        return self._convert_cooperative_vector_matrix_nv(
            device, Ptr(to=info).bitcast[ConvertCooperativeVectorMatrixInfoNV]()
        )

    fn cmd_convert_cooperative_vector_matrix_nv(
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdConvertCooperativeVectorMatrixNV.html
        """
        return self._cmd_convert_cooperative_vector_matrix_nv(command_buffer, info_count, p_infos)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_set_latency_sleep_mode_nv = Ptr(to=get_device_proc_addr(
        device, "vkSetLatencySleepModeNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_set_latency_sleep_mode_nv)]()[]
    self._vk_latency_sleep_nv = Ptr(to=get_device_proc_addr(
        device, "vkLatencySleepNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_latency_sleep_nv)]()[]
    self._vk_set_latency_marker_nv = Ptr(to=get_device_proc_addr(
        device, "vkSetLatencyMarkerNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_set_latency_marker_nv)]()[]
    self._vk_get_latency_timings_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetLatencyTimingsNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_latency_timings_nv)]()[]
    self._vk_queue_notify_out_of_band_nv = Ptr(to=get_device_proc_addr(
        device, "vkQueueNotifyOutOfBandNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_queue_notify_out_of_band_nv)]()[]

    fn set_latency_sleep_mode_nv(
        self, device: Device, swapchain: SwapchainKHR, sleep_mode_info: LatencySleepModeInfoNV
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLatencySleepModeNV.html
        """
        return self._set_latency_sleep_mode_nv(
            device, swapchain, Ptr(to=sleep_mode_info).bitcast[LatencySleepModeInfoNV]()
        )

    fn latency_sleep_nv(
        self, device: Device, swapchain: SwapchainKHR, sleep_info: LatencySleepInfoNV
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkLatencySleepNV.html
        """
        return self._latency_sleep_nv(
            device, swapchain, Ptr(to=sleep_info).bitcast[LatencySleepInfoNV]()
        )

    fn set_latency_marker_nv(
        self, device: Device, swapchain: SwapchainKHR, latency_marker_info: SetLatencyMarkerInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLatencyMarkerNV.html
        """
        return self._set_latency_marker_nv(
            device, swapchain, Ptr(to=latency_marker_info).bitcast[SetLatencyMarkerInfoNV]()
        )

    fn get_latency_timings_nv(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut latency_marker_info: GetLatencyMarkerInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetLatencyTimingsNV.html
        """
        return self._get_latency_timings_nv(
            device, swapchain, Ptr(to=latency_marker_info).bitcast[GetLatencyMarkerInfoNV]()
        )

    fn queue_notify_out_of_band_nv(self, queue: Queue, queue_type_info: OutOfBandQueueTypeInfoNV):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueNotifyOutOfBandNV.html
        """
        return self._queue_notify_out_of_band_nv(
            queue, Ptr(to=queue_type_info).bitcast[OutOfBandQueueTypeInfoNV]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_external_compute_queue_nv = Ptr(to=get_device_proc_addr(
        device, "vkCreateExternalComputeQueueNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_external_compute_queue_nv)]()[]
    self._vk_destroy_external_compute_queue_nv = Ptr(to=get_device_proc_addr(
        device, "vkDestroyExternalComputeQueueNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_external_compute_queue_nv)]()[]
    self._vk_get_external_compute_queue_data_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetExternalComputeQueueDataNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_external_compute_queue_data_nv)]()[]

    fn create_external_compute_queue_nv(
        self,
        device: Device,
        create_info: ExternalComputeQueueCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut external_queue: ExternalComputeQueueNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateExternalComputeQueueNV.html
        """
        return self._create_external_compute_queue_nv(
            device,
            Ptr(to=create_info).bitcast[ExternalComputeQueueCreateInfoNV](),
            p_allocator,
            Ptr(to=external_queue).bitcast[ExternalComputeQueueNV](),
        )

    fn destroy_external_compute_queue_nv(
        self,
        device: Device,
        external_queue: ExternalComputeQueueNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyExternalComputeQueueNV.html
        """
        return self._destroy_external_compute_queue_nv(device, external_queue, p_allocator)

    fn get_external_compute_queue_data_nv(
        self,
        external_queue: ExternalComputeQueueNV,
        mut params: ExternalComputeQueueDataParamsNV,
        mut data: NoneType,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetExternalComputeQueueDataNV.html
        """
        return self._get_external_compute_queue_data_nv(
            external_queue,
            Ptr(to=params).bitcast[ExternalComputeQueueDataParamsNV](),
            Ptr(to=data).bitcast[NoneType](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_cluster_acceleration_structure_build_sizes_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetClusterAccelerationStructureBuildSizesNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_cluster_acceleration_structure_build_sizes_nv)]()[]
    self._vk_cmd_build_cluster_acceleration_structure_indirect_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdBuildClusterAccelerationStructureIndirectNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_build_cluster_acceleration_structure_indirect_nv)]()[]

    fn get_cluster_acceleration_structure_build_sizes_nv(
        self,
        device: Device,
        info: ClusterAccelerationStructureInputInfoNV,
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetClusterAccelerationStructureBuildSizesNV.html
        """
        return self._get_cluster_acceleration_structure_build_sizes_nv(
            device,
            Ptr(to=info).bitcast[ClusterAccelerationStructureInputInfoNV](),
            Ptr(to=size_info).bitcast[AccelerationStructureBuildSizesInfoKHR](),
        )

    fn cmd_build_cluster_acceleration_structure_indirect_nv(
        self,
        command_buffer: CommandBuffer,
        command_infos: ClusterAccelerationStructureCommandsInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildClusterAccelerationStructureIndirectNV.html
        """
        return self._cmd_build_cluster_acceleration_structure_indirect_nv(
            command_buffer,
            Ptr(to=command_infos).bitcast[ClusterAccelerationStructureCommandsInfoNV](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_partitioned_acceleration_structures_build_sizes_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetPartitionedAccelerationStructuresBuildSizesNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_partitioned_acceleration_structures_build_sizes_nv)]()[]
    self._vk_cmd_build_partitioned_acceleration_structures_nv = Ptr(to=get_device_proc_addr(
        device, "vkCmdBuildPartitionedAccelerationStructuresNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_build_partitioned_acceleration_structures_nv)]()[]

    fn get_partitioned_acceleration_structures_build_sizes_nv(
        self,
        device: Device,
        info: PartitionedAccelerationStructureInstancesInputNV,
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPartitionedAccelerationStructuresBuildSizesNV.html
        """
        return self._get_partitioned_acceleration_structures_build_sizes_nv(
            device,
            Ptr(to=info).bitcast[PartitionedAccelerationStructureInstancesInputNV](),
            Ptr(to=size_info).bitcast[AccelerationStructureBuildSizesInfoKHR](),
        )

    fn cmd_build_partitioned_acceleration_structures_nv(
        self, command_buffer: CommandBuffer, build_info: BuildPartitionedAccelerationStructureInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildPartitionedAccelerationStructuresNV.html
        """
        return self._cmd_build_partitioned_acceleration_structures_nv(
            command_buffer,
            Ptr(to=build_info).bitcast[BuildPartitionedAccelerationStructureInfoNV](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv)]()[]

    fn get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV.html
        """
        return self._get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
            physical_device, Ptr(to=property_count).bitcast[UInt32](), p_properties
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_vi_surface_nn = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateViSurfaceNN".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_vi_surface_nn)]()[]

    fn create_vi_surface_nn(
        self,
        instance: Instance,
        create_info: ViSurfaceCreateInfoNN,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateViSurfaceNN.html
        """
        return self._create_vi_surface_nn(
            instance,
            Ptr(to=create_info).bitcast[ViSurfaceCreateInfoNN](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_refresh_cycle_duration_google = Ptr(to=get_device_proc_addr(
        device, "vkGetRefreshCycleDurationGOOGLE".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_refresh_cycle_duration_google)]()[]
    self._vk_get_past_presentation_timing_google = Ptr(to=get_device_proc_addr(
        device, "vkGetPastPresentationTimingGOOGLE".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_past_presentation_timing_google)]()[]

    fn get_refresh_cycle_duration_google(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut display_timing_properties: RefreshCycleDurationGOOGLE,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRefreshCycleDurationGOOGLE.html
        """
        return self._get_refresh_cycle_duration_google(
            device,
            swapchain,
            Ptr(to=display_timing_properties).bitcast[RefreshCycleDurationGOOGLE](),
        )

    fn get_past_presentation_timing_google(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut presentation_timing_count: UInt32,
        p_presentation_timings: Ptr[PastPresentationTimingGOOGLE, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPastPresentationTimingGOOGLE.html
        """
        return self._get_past_presentation_timing_google(
            device,
            swapchain,
            Ptr(to=presentation_timing_count).bitcast[UInt32](),
            p_presentation_timings,
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_ios_surface_mvk = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateIOSSurfaceMVK".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_ios_surface_mvk)]()[]

    fn create_ios_surface_mvk(
        self,
        instance: Instance,
        create_info: IOSSurfaceCreateInfoMVK,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIOSSurfaceMVK.html
        """
        return self._create_ios_surface_mvk(
            instance,
            Ptr(to=create_info).bitcast[IOSSurfaceCreateInfoMVK](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_mac_os_surface_mvk = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateMacOSSurfaceMVK".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_mac_os_surface_mvk)]()[]

    fn create_mac_os_surface_mvk(
        self,
        instance: Instance,
        create_info: MacOSSurfaceCreateInfoMVK,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateMacOSSurfaceMVK.html
        """
        return self._create_mac_os_surface_mvk(
            instance,
            Ptr(to=create_info).bitcast[MacOSSurfaceCreateInfoMVK](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_android_hardware_buffer_properties_android = Ptr(to=get_device_proc_addr(
        device, "vkGetAndroidHardwareBufferPropertiesANDROID".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_android_hardware_buffer_properties_android)]()[]
    self._vk_get_memory_android_hardware_buffer_android = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryAndroidHardwareBufferANDROID".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_android_hardware_buffer_android)]()[]

    fn get_android_hardware_buffer_properties_android(
        self,
        device: Device,
        buffer: AHardwareBuffer,
        mut properties: AndroidHardwareBufferPropertiesANDROID,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAndroidHardwareBufferPropertiesANDROID.html
        """
        return self._get_android_hardware_buffer_properties_android(
            device,
            Ptr(to=buffer).bitcast[AHardwareBuffer](),
            Ptr(to=properties).bitcast[AndroidHardwareBufferPropertiesANDROID](),
        )

    fn get_memory_android_hardware_buffer_android(
        self,
        device: Device,
        info: MemoryGetAndroidHardwareBufferInfoANDROID,
        p_buffer: Ptr[Ptr[AHardwareBuffer, MutAnyOrigin], MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryAndroidHardwareBufferANDROID.html
        """
        return self._get_memory_android_hardware_buffer_android(
            device, Ptr(to=info).bitcast[MemoryGetAndroidHardwareBufferInfoANDROID](), p_buffer
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_execution_graph_pipelines_amdx = Ptr(to=get_device_proc_addr(
        device, "vkCreateExecutionGraphPipelinesAMDX".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_execution_graph_pipelines_amdx)]()[]
    self._vk_get_execution_graph_pipeline_scratch_size_amdx = Ptr(to=get_device_proc_addr(
        device, "vkGetExecutionGraphPipelineScratchSizeAMDX".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_execution_graph_pipeline_scratch_size_amdx)]()[]
    self._vk_get_execution_graph_pipeline_node_index_amdx = Ptr(to=get_device_proc_addr(
        device, "vkGetExecutionGraphPipelineNodeIndexAMDX".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_execution_graph_pipeline_node_index_amdx)]()[]
    self._vk_cmd_initialize_graph_scratch_memory_amdx = Ptr(to=get_device_proc_addr(
        device, "vkCmdInitializeGraphScratchMemoryAMDX".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_initialize_graph_scratch_memory_amdx)]()[]
    self._vk_cmd_dispatch_graph_amdx = Ptr(to=get_device_proc_addr(
        device, "vkCmdDispatchGraphAMDX".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_dispatch_graph_amdx)]()[]
    self._vk_cmd_dispatch_graph_indirect_amdx = Ptr(to=get_device_proc_addr(
        device, "vkCmdDispatchGraphIndirectAMDX".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_dispatch_graph_indirect_amdx)]()[]
    self._vk_cmd_dispatch_graph_indirect_count_amdx = Ptr(to=get_device_proc_addr(
        device, "vkCmdDispatchGraphIndirectCountAMDX".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_dispatch_graph_indirect_count_amdx)]()[]

    fn create_execution_graph_pipelines_amdx(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ExecutionGraphPipelineCreateInfoAMDX, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateExecutionGraphPipelinesAMDX.html
        """
        return self._create_execution_graph_pipelines_amdx(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn get_execution_graph_pipeline_scratch_size_amdx(
        self,
        device: Device,
        execution_graph: Pipeline,
        mut size_info: ExecutionGraphPipelineScratchSizeAMDX,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetExecutionGraphPipelineScratchSizeAMDX.html
        """
        return self._get_execution_graph_pipeline_scratch_size_amdx(
            device,
            execution_graph,
            Ptr(to=size_info).bitcast[ExecutionGraphPipelineScratchSizeAMDX](),
        )

    fn get_execution_graph_pipeline_node_index_amdx(
        self,
        device: Device,
        execution_graph: Pipeline,
        node_info: PipelineShaderStageNodeCreateInfoAMDX,
        mut node_index: UInt32,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetExecutionGraphPipelineNodeIndexAMDX.html
        """
        return self._get_execution_graph_pipeline_node_index_amdx(
            device,
            execution_graph,
            Ptr(to=node_info).bitcast[PipelineShaderStageNodeCreateInfoAMDX](),
            Ptr(to=node_index).bitcast[UInt32](),
        )

    fn cmd_initialize_graph_scratch_memory_amdx(
        self,
        command_buffer: CommandBuffer,
        execution_graph: Pipeline,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdInitializeGraphScratchMemoryAMDX.html
        """
        return self._cmd_initialize_graph_scratch_memory_amdx(
            command_buffer, execution_graph, scratch, scratch_size
        )

    fn cmd_dispatch_graph_amdx(
        self,
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DispatchGraphCountInfoAMDX,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchGraphAMDX.html
        """
        return self._cmd_dispatch_graph_amdx(
            command_buffer,
            scratch,
            scratch_size,
            Ptr(to=count_info).bitcast[DispatchGraphCountInfoAMDX](),
        )

    fn cmd_dispatch_graph_indirect_amdx(
        self,
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DispatchGraphCountInfoAMDX,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchGraphIndirectAMDX.html
        """
        return self._cmd_dispatch_graph_indirect_amdx(
            command_buffer,
            scratch,
            scratch_size,
            Ptr(to=count_info).bitcast[DispatchGraphCountInfoAMDX](),
        )

    fn cmd_dispatch_graph_indirect_count_amdx(
        self,
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DeviceAddress,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchGraphIndirectCountAMDX.html
        """
        return self._cmd_dispatch_graph_indirect_count_amdx(
            command_buffer, scratch, scratch_size, count_info
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_initialize_performance_api_intel = Ptr(to=get_device_proc_addr(
        device, "vkInitializePerformanceApiINTEL".unsafe_ptr()
    )).bitcast[type_of(self._vk_initialize_performance_api_intel)]()[]
    self._vk_uninitialize_performance_api_intel = Ptr(to=get_device_proc_addr(
        device, "vkUninitializePerformanceApiINTEL".unsafe_ptr()
    )).bitcast[type_of(self._vk_uninitialize_performance_api_intel)]()[]
    self._vk_cmd_set_performance_marker_intel = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPerformanceMarkerINTEL".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_performance_marker_intel)]()[]
    self._vk_cmd_set_performance_stream_marker_intel = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPerformanceStreamMarkerINTEL".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_performance_stream_marker_intel)]()[]
    self._vk_cmd_set_performance_override_intel = Ptr(to=get_device_proc_addr(
        device, "vkCmdSetPerformanceOverrideINTEL".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_set_performance_override_intel)]()[]
    self._vk_acquire_performance_configuration_intel = Ptr(to=get_device_proc_addr(
        device, "vkAcquirePerformanceConfigurationINTEL".unsafe_ptr()
    )).bitcast[type_of(self._vk_acquire_performance_configuration_intel)]()[]
    self._vk_release_performance_configuration_intel = Ptr(to=get_device_proc_addr(
        device, "vkReleasePerformanceConfigurationINTEL".unsafe_ptr()
    )).bitcast[type_of(self._vk_release_performance_configuration_intel)]()[]
    self._vk_queue_set_performance_configuration_intel = Ptr(to=get_device_proc_addr(
        device, "vkQueueSetPerformanceConfigurationINTEL".unsafe_ptr()
    )).bitcast[type_of(self._vk_queue_set_performance_configuration_intel)]()[]
    self._vk_get_performance_parameter_intel = Ptr(to=get_device_proc_addr(
        device, "vkGetPerformanceParameterINTEL".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_performance_parameter_intel)]()[]

    fn initialize_performance_api_intel(
        self, device: Device, initialize_info: InitializePerformanceApiInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInitializePerformanceApiINTEL.html
        """
        return self._initialize_performance_api_intel(
            device, Ptr(to=initialize_info).bitcast[InitializePerformanceApiInfoINTEL]()
        )

    fn uninitialize_performance_api_intel(self, device: Device):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUninitializePerformanceApiINTEL.html
        """
        return self._uninitialize_performance_api_intel(device)

    fn cmd_set_performance_marker_intel(
        self, command_buffer: CommandBuffer, marker_info: PerformanceMarkerInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPerformanceMarkerINTEL.html
        """
        return self._cmd_set_performance_marker_intel(
            command_buffer, Ptr(to=marker_info).bitcast[PerformanceMarkerInfoINTEL]()
        )

    fn cmd_set_performance_stream_marker_intel(
        self, command_buffer: CommandBuffer, marker_info: PerformanceStreamMarkerInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPerformanceStreamMarkerINTEL.html
        """
        return self._cmd_set_performance_stream_marker_intel(
            command_buffer, Ptr(to=marker_info).bitcast[PerformanceStreamMarkerInfoINTEL]()
        )

    fn cmd_set_performance_override_intel(
        self, command_buffer: CommandBuffer, override_info: PerformanceOverrideInfoINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPerformanceOverrideINTEL.html
        """
        return self._cmd_set_performance_override_intel(
            command_buffer, Ptr(to=override_info).bitcast[PerformanceOverrideInfoINTEL]()
        )

    fn acquire_performance_configuration_intel(
        self,
        device: Device,
        acquire_info: PerformanceConfigurationAcquireInfoINTEL,
        mut configuration: PerformanceConfigurationINTEL,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquirePerformanceConfigurationINTEL.html
        """
        return self._acquire_performance_configuration_intel(
            device,
            Ptr(to=acquire_info).bitcast[PerformanceConfigurationAcquireInfoINTEL](),
            Ptr(to=configuration).bitcast[PerformanceConfigurationINTEL](),
        )

    fn release_performance_configuration_intel(
        self, device: Device, configuration: PerformanceConfigurationINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkReleasePerformanceConfigurationINTEL.html
        """
        return self._release_performance_configuration_intel(device, configuration)

    fn queue_set_performance_configuration_intel(
        self, queue: Queue, configuration: PerformanceConfigurationINTEL
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSetPerformanceConfigurationINTEL.html
        """
        return self._queue_set_performance_configuration_intel(queue, configuration)

    fn get_performance_parameter_intel(
        self,
        device: Device,
        parameter: PerformanceParameterTypeINTEL,
        mut value: PerformanceValueINTEL,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPerformanceParameterINTEL.html
        """
        return self._get_performance_parameter_intel(
            device, parameter, Ptr(to=value).bitcast[PerformanceValueINTEL]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_image_pipe_surface_fuchsia = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateImagePipeSurfaceFUCHSIA".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_image_pipe_surface_fuchsia)]()[]

    fn create_image_pipe_surface_fuchsia(
        self,
        instance: Instance,
        create_info: ImagePipeSurfaceCreateInfoFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImagePipeSurfaceFUCHSIA.html
        """
        return self._create_image_pipe_surface_fuchsia(
            instance,
            Ptr(to=create_info).bitcast[ImagePipeSurfaceCreateInfoFUCHSIA](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_memory_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryZirconHandleFUCHSIA".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_zircon_handle_fuchsia)]()[]
    self._vk_get_memory_zircon_handle_properties_fuchsia = Ptr(to=get_device_proc_addr(
        device, "vkGetMemoryZirconHandlePropertiesFUCHSIA".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_memory_zircon_handle_properties_fuchsia)]()[]

    fn get_memory_zircon_handle_fuchsia(
        self,
        device: Device,
        get_zircon_handle_info: MemoryGetZirconHandleInfoFUCHSIA,
        mut zircon_handle: zx_handle_t,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryZirconHandleFUCHSIA.html
        """
        return self._get_memory_zircon_handle_fuchsia(
            device,
            Ptr(to=get_zircon_handle_info).bitcast[MemoryGetZirconHandleInfoFUCHSIA](),
            Ptr(to=zircon_handle).bitcast[zx_handle_t](),
        )

    fn get_memory_zircon_handle_properties_fuchsia(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        zircon_handle: zx_handle_t,
        mut memory_zircon_handle_properties: MemoryZirconHandlePropertiesFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryZirconHandlePropertiesFUCHSIA.html
        """
        return self._get_memory_zircon_handle_properties_fuchsia(
            device,
            handle_type,
            zircon_handle,
            Ptr(to=memory_zircon_handle_properties).bitcast[MemoryZirconHandlePropertiesFUCHSIA](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_import_semaphore_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
        device, "vkImportSemaphoreZirconHandleFUCHSIA".unsafe_ptr()
    )).bitcast[type_of(self._vk_import_semaphore_zircon_handle_fuchsia)]()[]
    self._vk_get_semaphore_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
        device, "vkGetSemaphoreZirconHandleFUCHSIA".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_semaphore_zircon_handle_fuchsia)]()[]

    fn import_semaphore_zircon_handle_fuchsia(
        self,
        device: Device,
        import_semaphore_zircon_handle_info: ImportSemaphoreZirconHandleInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportSemaphoreZirconHandleFUCHSIA.html
        """
        return self._import_semaphore_zircon_handle_fuchsia(
            device,
            Ptr(to=import_semaphore_zircon_handle_info).bitcast[ImportSemaphoreZirconHandleInfoFUCHSIA](),
        )

    fn get_semaphore_zircon_handle_fuchsia(
        self,
        device: Device,
        get_zircon_handle_info: SemaphoreGetZirconHandleInfoFUCHSIA,
        mut zircon_handle: zx_handle_t,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreZirconHandleFUCHSIA.html
        """
        return self._get_semaphore_zircon_handle_fuchsia(
            device,
            Ptr(to=get_zircon_handle_info).bitcast[SemaphoreGetZirconHandleInfoFUCHSIA](),
            Ptr(to=zircon_handle).bitcast[zx_handle_t](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_buffer_collection_fuchsia = Ptr(to=get_device_proc_addr(
        device, "vkCreateBufferCollectionFUCHSIA".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_buffer_collection_fuchsia)]()[]
    self._vk_set_buffer_collection_image_constraints_fuchsia = Ptr(to=get_device_proc_addr(
        device, "vkSetBufferCollectionImageConstraintsFUCHSIA".unsafe_ptr()
    )).bitcast[type_of(self._vk_set_buffer_collection_image_constraints_fuchsia)]()[]
    self._vk_set_buffer_collection_buffer_constraints_fuchsia = Ptr(to=get_device_proc_addr(
        device, "vkSetBufferCollectionBufferConstraintsFUCHSIA".unsafe_ptr()
    )).bitcast[type_of(self._vk_set_buffer_collection_buffer_constraints_fuchsia)]()[]
    self._vk_destroy_buffer_collection_fuchsia = Ptr(to=get_device_proc_addr(
        device, "vkDestroyBufferCollectionFUCHSIA".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_buffer_collection_fuchsia)]()[]
    self._vk_get_buffer_collection_properties_fuchsia = Ptr(to=get_device_proc_addr(
        device, "vkGetBufferCollectionPropertiesFUCHSIA".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_buffer_collection_properties_fuchsia)]()[]

    fn create_buffer_collection_fuchsia(
        self,
        device: Device,
        create_info: BufferCollectionCreateInfoFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut collection: BufferCollectionFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferCollectionFUCHSIA.html
        """
        return self._create_buffer_collection_fuchsia(
            device,
            Ptr(to=create_info).bitcast[BufferCollectionCreateInfoFUCHSIA](),
            p_allocator,
            Ptr(to=collection).bitcast[BufferCollectionFUCHSIA](),
        )

    fn set_buffer_collection_image_constraints_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        image_constraints_info: ImageConstraintsInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetBufferCollectionImageConstraintsFUCHSIA.html
        """
        return self._set_buffer_collection_image_constraints_fuchsia(
            device,
            collection,
            Ptr(to=image_constraints_info).bitcast[ImageConstraintsInfoFUCHSIA](),
        )

    fn set_buffer_collection_buffer_constraints_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        buffer_constraints_info: BufferConstraintsInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetBufferCollectionBufferConstraintsFUCHSIA.html
        """
        return self._set_buffer_collection_buffer_constraints_fuchsia(
            device,
            collection,
            Ptr(to=buffer_constraints_info).bitcast[BufferConstraintsInfoFUCHSIA](),
        )

    fn destroy_buffer_collection_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferCollectionFUCHSIA.html
        """
        return self._destroy_buffer_collection_fuchsia(device, collection, p_allocator)

    fn get_buffer_collection_properties_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        mut properties: BufferCollectionPropertiesFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferCollectionPropertiesFUCHSIA.html
        """
        return self._get_buffer_collection_properties_fuchsia(
            device, collection, Ptr(to=properties).bitcast[BufferCollectionPropertiesFUCHSIA]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_dispatch_tile_qcom = Ptr(to=get_device_proc_addr(
        device, "vkCmdDispatchTileQCOM".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_dispatch_tile_qcom)]()[]
    self._vk_cmd_begin_per_tile_execution_qcom = Ptr(to=get_device_proc_addr(
        device, "vkCmdBeginPerTileExecutionQCOM".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_begin_per_tile_execution_qcom)]()[]
    self._vk_cmd_end_per_tile_execution_qcom = Ptr(to=get_device_proc_addr(
        device, "vkCmdEndPerTileExecutionQCOM".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_end_per_tile_execution_qcom)]()[]

    fn cmd_dispatch_tile_qcom(
        self, command_buffer: CommandBuffer, dispatch_tile_info: DispatchTileInfoQCOM
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchTileQCOM.html
        """
        return self._cmd_dispatch_tile_qcom(
            command_buffer, Ptr(to=dispatch_tile_info).bitcast[DispatchTileInfoQCOM]()
        )

    fn cmd_begin_per_tile_execution_qcom(
        self, command_buffer: CommandBuffer, per_tile_begin_info: PerTileBeginInfoQCOM
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginPerTileExecutionQCOM.html
        """
        return self._cmd_begin_per_tile_execution_qcom(
            command_buffer, Ptr(to=per_tile_begin_info).bitcast[PerTileBeginInfoQCOM]()
        )

    fn cmd_end_per_tile_execution_qcom(
        self, command_buffer: CommandBuffer, per_tile_end_info: PerTileEndInfoQCOM
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndPerTileExecutionQCOM.html
        """
        return self._cmd_end_per_tile_execution_qcom(
            command_buffer, Ptr(to=per_tile_end_info).bitcast[PerTileEndInfoQCOM]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_framebuffer_tile_properties_qcom = Ptr(to=get_device_proc_addr(
        device, "vkGetFramebufferTilePropertiesQCOM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_framebuffer_tile_properties_qcom)]()[]
    self._vk_get_dynamic_rendering_tile_properties_qcom = Ptr(to=get_device_proc_addr(
        device, "vkGetDynamicRenderingTilePropertiesQCOM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_dynamic_rendering_tile_properties_qcom)]()[]

    fn get_framebuffer_tile_properties_qcom(
        self,
        device: Device,
        framebuffer: Framebuffer,
        mut properties_count: UInt32,
        p_properties: Ptr[TilePropertiesQCOM, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFramebufferTilePropertiesQCOM.html
        """
        return self._get_framebuffer_tile_properties_qcom(
            device, framebuffer, Ptr(to=properties_count).bitcast[UInt32](), p_properties
        )

    fn get_dynamic_rendering_tile_properties_qcom(
        self, device: Device, rendering_info: RenderingInfo, mut properties: TilePropertiesQCOM
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDynamicRenderingTilePropertiesQCOM.html
        """
        return self._get_dynamic_rendering_tile_properties_qcom(
            device,
            Ptr(to=rendering_info).bitcast[RenderingInfo](),
            Ptr(to=properties).bitcast[TilePropertiesQCOM](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_bind_tile_memory_qcom = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindTileMemoryQCOM".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_tile_memory_qcom)]()[]

    fn cmd_bind_tile_memory_qcom(
        self,
        command_buffer: CommandBuffer,
        p_tile_memory_bind_info: Ptr[TileMemoryBindInfoQCOM, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindTileMemoryQCOM.html
        """
        return self._cmd_bind_tile_memory_qcom(command_buffer, p_tile_memory_bind_info)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_device_subpass_shading_max_workgroup_size_huawei = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_subpass_shading_max_workgroup_size_huawei)]()[]
    self._vk_cmd_subpass_shading_huawei = Ptr(to=get_device_proc_addr(
        device, "vkCmdSubpassShadingHUAWEI".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_subpass_shading_huawei)]()[]

    fn get_device_subpass_shading_max_workgroup_size_huawei(
        self,
        device: Device,
        renderpass: RenderPass,
        p_max_workgroup_size: Ptr[Extent2D, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI.html
        """
        return self._get_device_subpass_shading_max_workgroup_size_huawei(
            device, renderpass, p_max_workgroup_size
        )

    fn cmd_subpass_shading_huawei(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSubpassShadingHUAWEI.html
        """
        return self._cmd_subpass_shading_huawei(command_buffer)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_bind_invocation_mask_huawei = Ptr(to=get_device_proc_addr(
        device, "vkCmdBindInvocationMaskHUAWEI".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_bind_invocation_mask_huawei)]()[]

    fn cmd_bind_invocation_mask_huawei(
        self, command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindInvocationMaskHUAWEI.html
        """
        return self._cmd_bind_invocation_mask_huawei(command_buffer, image_view, image_layout)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_cmd_draw_cluster_huawei = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawClusterHUAWEI".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_cluster_huawei)]()[]
    self._vk_cmd_draw_cluster_indirect_huawei = Ptr(to=get_device_proc_addr(
        device, "vkCmdDrawClusterIndirectHUAWEI".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_draw_cluster_indirect_huawei)]()[]

    fn cmd_draw_cluster_huawei(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawClusterHUAWEI.html
        """
        return self._cmd_draw_cluster_huawei(
            command_buffer, group_count_x, group_count_y, group_count_z
        )

    fn cmd_draw_cluster_indirect_huawei(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawClusterIndirectHUAWEI.html
        """
        return self._cmd_draw_cluster_indirect_huawei(command_buffer, buffer, offset)

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_screen_surface_qnx = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateScreenSurfaceQNX".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_screen_surface_qnx)]()[]
    self._vk_get_physical_device_screen_presentation_support_qnx = Ptr(to=get_instance_proc_addr(
        instance, "vkGetPhysicalDeviceScreenPresentationSupportQNX".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_screen_presentation_support_qnx)]()[]

    fn create_screen_surface_qnx(
        self,
        instance: Instance,
        create_info: ScreenSurfaceCreateInfoQNX,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateScreenSurfaceQNX.html
        """
        return self._create_screen_surface_qnx(
            instance,
            Ptr(to=create_info).bitcast[ScreenSurfaceCreateInfoQNX](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )

    fn get_physical_device_screen_presentation_support_qnx(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut window: Ptr[_screen_window, MutOrigin.external],
    ) -> Bool32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceScreenPresentationSupportQNX.html
        """
        return self._get_physical_device_screen_presentation_support_qnx(
            physical_device, queue_family_index, window
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_screen_buffer_properties_qnx = Ptr(to=get_device_proc_addr(
        device, "vkGetScreenBufferPropertiesQNX".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_screen_buffer_properties_qnx)]()[]

    fn get_screen_buffer_properties_qnx(
        self,
        device: Device,
        buffer: Ptr[_screen_buffer, ImmutOrigin.external],
        mut properties: ScreenBufferPropertiesQNX,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetScreenBufferPropertiesQNX.html
        """
        return self._get_screen_buffer_properties_qnx(
            device, buffer, Ptr(to=properties).bitcast[ScreenBufferPropertiesQNX]()
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_get_descriptor_set_layout_host_mapping_info_valve = Ptr(to=get_device_proc_addr(
        device, "vkGetDescriptorSetLayoutHostMappingInfoVALVE".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_descriptor_set_layout_host_mapping_info_valve)]()[]
    self._vk_get_descriptor_set_host_mapping_valve = Ptr(to=get_device_proc_addr(
        device, "vkGetDescriptorSetHostMappingVALVE".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_descriptor_set_host_mapping_valve)]()[]

    fn get_descriptor_set_layout_host_mapping_info_valve(
        self,
        device: Device,
        binding_reference: DescriptorSetBindingReferenceVALVE,
        mut host_mapping: DescriptorSetLayoutHostMappingInfoVALVE,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutHostMappingInfoVALVE.html
        """
        return self._get_descriptor_set_layout_host_mapping_info_valve(
            device,
            Ptr(to=binding_reference).bitcast[DescriptorSetBindingReferenceVALVE](),
            Ptr(to=host_mapping).bitcast[DescriptorSetLayoutHostMappingInfoVALVE](),
        )

    fn get_descriptor_set_host_mapping_valve(
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        pp_data: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetHostMappingVALVE.html
        """
        return self._get_descriptor_set_host_mapping_valve(device, descriptor_set, pp_data)

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_tensor_arm = Ptr(to=get_device_proc_addr(
        device, "vkCreateTensorARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_tensor_arm)]()[]
    self._vk_destroy_tensor_arm = Ptr(to=get_device_proc_addr(
        device, "vkDestroyTensorARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_tensor_arm)]()[]
    self._vk_create_tensor_view_arm = Ptr(to=get_device_proc_addr(
        device, "vkCreateTensorViewARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_tensor_view_arm)]()[]
    self._vk_destroy_tensor_view_arm = Ptr(to=get_device_proc_addr(
        device, "vkDestroyTensorViewARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_tensor_view_arm)]()[]
    self._vk_get_tensor_memory_requirements_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetTensorMemoryRequirementsARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_tensor_memory_requirements_arm)]()[]
    self._vk_bind_tensor_memory_arm = Ptr(to=get_device_proc_addr(
        device, "vkBindTensorMemoryARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_bind_tensor_memory_arm)]()[]
    self._vk_get_device_tensor_memory_requirements_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetDeviceTensorMemoryRequirementsARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_device_tensor_memory_requirements_arm)]()[]
    self._vk_cmd_copy_tensor_arm = Ptr(to=get_device_proc_addr(
        device, "vkCmdCopyTensorARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_copy_tensor_arm)]()[]
    self._vk_get_physical_device_external_tensor_properties_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceExternalTensorPropertiesARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_external_tensor_properties_arm)]()[]
    self._vk_get_tensor_opaque_capture_descriptor_data_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetTensorOpaqueCaptureDescriptorDataARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_tensor_opaque_capture_descriptor_data_arm)]()[]
    self._vk_get_tensor_view_opaque_capture_descriptor_data_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetTensorViewOpaqueCaptureDescriptorDataARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_tensor_view_opaque_capture_descriptor_data_arm)]()[]

    fn create_tensor_arm(
        self,
        device: Device,
        create_info: TensorCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut tensor: TensorARM,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateTensorARM.html
        """
        return self._create_tensor_arm(
            device,
            Ptr(to=create_info).bitcast[TensorCreateInfoARM](),
            p_allocator,
            Ptr(to=tensor).bitcast[TensorARM](),
        )

    fn destroy_tensor_arm(
        self,
        device: Device,
        tensor: TensorARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyTensorARM.html
        """
        return self._destroy_tensor_arm(device, tensor, p_allocator)

    fn create_tensor_view_arm(
        self,
        device: Device,
        create_info: TensorViewCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: TensorViewARM,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateTensorViewARM.html
        """
        return self._create_tensor_view_arm(
            device,
            Ptr(to=create_info).bitcast[TensorViewCreateInfoARM](),
            p_allocator,
            Ptr(to=view).bitcast[TensorViewARM](),
        )

    fn destroy_tensor_view_arm(
        self,
        device: Device,
        tensor_view: TensorViewARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyTensorViewARM.html
        """
        return self._destroy_tensor_view_arm(device, tensor_view, p_allocator)

    fn get_tensor_memory_requirements_arm(
        self,
        device: Device,
        info: TensorMemoryRequirementsInfoARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorMemoryRequirementsARM.html
        """
        return self._get_tensor_memory_requirements_arm(
            device,
            Ptr(to=info).bitcast[TensorMemoryRequirementsInfoARM](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn bind_tensor_memory_arm(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindTensorMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindTensorMemoryARM.html
        """
        return self._bind_tensor_memory_arm(device, bind_info_count, p_bind_infos)

    fn get_device_tensor_memory_requirements_arm(
        self,
        device: Device,
        info: DeviceTensorMemoryRequirementsARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceTensorMemoryRequirementsARM.html
        """
        return self._get_device_tensor_memory_requirements_arm(
            device,
            Ptr(to=info).bitcast[DeviceTensorMemoryRequirementsARM](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn cmd_copy_tensor_arm(
        self, command_buffer: CommandBuffer, copy_tensor_info: CopyTensorInfoARM
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyTensorARM.html
        """
        return self._cmd_copy_tensor_arm(
            command_buffer, Ptr(to=copy_tensor_info).bitcast[CopyTensorInfoARM]()
        )

    fn get_physical_device_external_tensor_properties_arm(
        self,
        physical_device: PhysicalDevice,
        external_tensor_info: PhysicalDeviceExternalTensorInfoARM,
        mut external_tensor_properties: ExternalTensorPropertiesARM,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalTensorPropertiesARM.html
        """
        return self._get_physical_device_external_tensor_properties_arm(
            physical_device,
            Ptr(to=external_tensor_info).bitcast[PhysicalDeviceExternalTensorInfoARM](),
            Ptr(to=external_tensor_properties).bitcast[ExternalTensorPropertiesARM](),
        )

    fn get_tensor_opaque_capture_descriptor_data_arm(
        self, device: Device, info: TensorCaptureDescriptorDataInfoARM, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorOpaqueCaptureDescriptorDataARM.html
        """
        return self._get_tensor_opaque_capture_descriptor_data_arm(
            device,
            Ptr(to=info).bitcast[TensorCaptureDescriptorDataInfoARM](),
            Ptr(to=data).bitcast[NoneType](),
        )

    fn get_tensor_view_opaque_capture_descriptor_data_arm(
        self, device: Device, info: TensorViewCaptureDescriptorDataInfoARM, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorViewOpaqueCaptureDescriptorDataARM.html
        """
        return self._get_tensor_view_opaque_capture_descriptor_data_arm(
            device,
            Ptr(to=info).bitcast[TensorViewCaptureDescriptorDataInfoARM](),
            Ptr(to=data).bitcast[NoneType](),
        )

fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
    var get_device_proc_addr = global_fns.borrow_handle().get_function[
        fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetDeviceProcAddr")
    self._vk_create_data_graph_pipelines_arm = Ptr(to=get_device_proc_addr(
        device, "vkCreateDataGraphPipelinesARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_data_graph_pipelines_arm)]()[]
    self._vk_create_data_graph_pipeline_session_arm = Ptr(to=get_device_proc_addr(
        device, "vkCreateDataGraphPipelineSessionARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_data_graph_pipeline_session_arm)]()[]
    self._vk_get_data_graph_pipeline_session_bind_point_requirements_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetDataGraphPipelineSessionBindPointRequirementsARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_data_graph_pipeline_session_bind_point_requirements_arm)]()[]
    self._vk_get_data_graph_pipeline_session_memory_requirements_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetDataGraphPipelineSessionMemoryRequirementsARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_data_graph_pipeline_session_memory_requirements_arm)]()[]
    self._vk_bind_data_graph_pipeline_session_memory_arm = Ptr(to=get_device_proc_addr(
        device, "vkBindDataGraphPipelineSessionMemoryARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_bind_data_graph_pipeline_session_memory_arm)]()[]
    self._vk_destroy_data_graph_pipeline_session_arm = Ptr(to=get_device_proc_addr(
        device, "vkDestroyDataGraphPipelineSessionARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_destroy_data_graph_pipeline_session_arm)]()[]
    self._vk_cmd_dispatch_data_graph_arm = Ptr(to=get_device_proc_addr(
        device, "vkCmdDispatchDataGraphARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_cmd_dispatch_data_graph_arm)]()[]
    self._vk_get_data_graph_pipeline_available_properties_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetDataGraphPipelineAvailablePropertiesARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_data_graph_pipeline_available_properties_arm)]()[]
    self._vk_get_data_graph_pipeline_properties_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetDataGraphPipelinePropertiesARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_data_graph_pipeline_properties_arm)]()[]
    self._vk_get_physical_device_queue_family_data_graph_properties_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_queue_family_data_graph_properties_arm)]()[]
    self._vk_get_physical_device_queue_family_data_graph_processing_engine_properties_arm = Ptr(to=get_device_proc_addr(
        device, "vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM".unsafe_ptr()
    )).bitcast[type_of(self._vk_get_physical_device_queue_family_data_graph_processing_engine_properties_arm)]()[]

    fn create_data_graph_pipelines_arm(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[DataGraphPipelineCreateInfoARM, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDataGraphPipelinesARM.html
        """
        return self._create_data_graph_pipelines_arm(
            device,
            deferred_operation,
            pipeline_cache,
            create_info_count,
            p_create_infos,
            p_allocator,
            p_pipelines,
        )

    fn create_data_graph_pipeline_session_arm(
        self,
        device: Device,
        create_info: DataGraphPipelineSessionCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut session: DataGraphPipelineSessionARM,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDataGraphPipelineSessionARM.html
        """
        return self._create_data_graph_pipeline_session_arm(
            device,
            Ptr(to=create_info).bitcast[DataGraphPipelineSessionCreateInfoARM](),
            p_allocator,
            Ptr(to=session).bitcast[DataGraphPipelineSessionARM](),
        )

    fn get_data_graph_pipeline_session_bind_point_requirements_arm(
        self,
        device: Device,
        info: DataGraphPipelineSessionBindPointRequirementsInfoARM,
        mut bind_point_requirement_count: UInt32,
        p_bind_point_requirements: Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineSessionBindPointRequirementsARM.html
        """
        return self._get_data_graph_pipeline_session_bind_point_requirements_arm(
            device,
            Ptr(to=info).bitcast[DataGraphPipelineSessionBindPointRequirementsInfoARM](),
            Ptr(to=bind_point_requirement_count).bitcast[UInt32](),
            p_bind_point_requirements,
        )

    fn get_data_graph_pipeline_session_memory_requirements_arm(
        self,
        device: Device,
        info: DataGraphPipelineSessionMemoryRequirementsInfoARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineSessionMemoryRequirementsARM.html
        """
        return self._get_data_graph_pipeline_session_memory_requirements_arm(
            device,
            Ptr(to=info).bitcast[DataGraphPipelineSessionMemoryRequirementsInfoARM](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn bind_data_graph_pipeline_session_memory_arm(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindDataGraphPipelineSessionMemoryARM.html
        """
        return self._bind_data_graph_pipeline_session_memory_arm(
            device, bind_info_count, p_bind_infos
        )

    fn destroy_data_graph_pipeline_session_arm(
        self,
        device: Device,
        session: DataGraphPipelineSessionARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDataGraphPipelineSessionARM.html
        """
        return self._destroy_data_graph_pipeline_session_arm(device, session, p_allocator)

    fn cmd_dispatch_data_graph_arm(
        self,
        command_buffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        p_info: Ptr[DataGraphPipelineDispatchInfoARM, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchDataGraphARM.html
        """
        return self._cmd_dispatch_data_graph_arm(command_buffer, session, p_info)

    fn get_data_graph_pipeline_available_properties_arm(
        self,
        device: Device,
        pipeline_info: DataGraphPipelineInfoARM,
        mut properties_count: UInt32,
        p_properties: Ptr[DataGraphPipelinePropertyARM, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineAvailablePropertiesARM.html
        """
        return self._get_data_graph_pipeline_available_properties_arm(
            device,
            Ptr(to=pipeline_info).bitcast[DataGraphPipelineInfoARM](),
            Ptr(to=properties_count).bitcast[UInt32](),
            p_properties,
        )

    fn get_data_graph_pipeline_properties_arm(
        self,
        device: Device,
        pipeline_info: DataGraphPipelineInfoARM,
        properties_count: UInt32,
        p_properties: Ptr[DataGraphPipelinePropertyQueryResultARM, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelinePropertiesARM.html
        """
        return self._get_data_graph_pipeline_properties_arm(
            device,
            Ptr(to=pipeline_info).bitcast[DataGraphPipelineInfoARM](),
            properties_count,
            p_properties,
        )

    fn get_physical_device_queue_family_data_graph_properties_arm(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut queue_family_data_graph_property_count: UInt32,
        p_queue_family_data_graph_properties: Ptr[QueueFamilyDataGraphPropertiesARM, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM.html
        """
        return self._get_physical_device_queue_family_data_graph_properties_arm(
            physical_device,
            queue_family_index,
            Ptr(to=queue_family_data_graph_property_count).bitcast[UInt32](),
            p_queue_family_data_graph_properties,
        )

    fn get_physical_device_queue_family_data_graph_processing_engine_properties_arm(
        self,
        physical_device: PhysicalDevice,
        queue_family_data_graph_processing_engine_info: PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM,
        mut queue_family_data_graph_processing_engine_properties: QueueFamilyDataGraphProcessingEnginePropertiesARM,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM.html
        """
        return self._get_physical_device_queue_family_data_graph_processing_engine_properties_arm(
            physical_device,
            Ptr(to=queue_family_data_graph_processing_engine_info).bitcast[PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM](),
            Ptr(to=queue_family_data_graph_processing_engine_properties).bitcast[QueueFamilyDataGraphProcessingEnginePropertiesARM](),
        )


struct Surface(Copyable):    var _vk_create_surface_ohos: fn(
        instance: Instance,
        pCreateInfo: Ptr[SurfaceCreateInfoOHOS, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
    var get_instance_proc_addr = global_fns.borrow_handle().get_function[
        fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
    ]("vkGetInstanceProcAddr")
    self._vk_create_surface_ohos = Ptr(to=get_instance_proc_addr(
        instance, "vkCreateSurfaceOHOS".unsafe_ptr()
    )).bitcast[type_of(self._vk_create_surface_ohos)]()[]

    fn create_surface_ohos(
        self,
        instance: Instance,
        create_info: SurfaceCreateInfoOHOS,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSurfaceOHOS.html
        """
        return self._create_surface_ohos(
            instance,
            Ptr(to=create_info).bitcast[SurfaceCreateInfoOHOS](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )
