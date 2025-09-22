from vk.core_functions import GlobalFunctions


struct IosSurface(Copyable, Movable):
    var _create_ios_surface_mvk: fn(
        instance: Instance, pCreateInfo: Ptr[IOSSurfaceCreateInfoMVK], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_ios_surface_mvk = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateIOSSurfaceMVK".unsafe_ptr()
        )).bitcast[__type_of(self._create_ios_surface_mvk)]()[]

    fn create_ios_surface_mvk(
        self,
        instance: Instance,
        create_info: IOSSurfaceCreateInfoMVK,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_ios_surface_mvk(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )


struct MacosSurface(Copyable, Movable):
    var _create_mac_os_surface_mvk: fn(
        instance: Instance, pCreateInfo: Ptr[MacOSSurfaceCreateInfoMVK], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_mac_os_surface_mvk = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateMacOSSurfaceMVK".unsafe_ptr()
        )).bitcast[__type_of(self._create_mac_os_surface_mvk)]()[]

    fn create_mac_os_surface_mvk(
        self,
        instance: Instance,
        create_info: MacOSSurfaceCreateInfoMVK,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_mac_os_surface_mvk(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )
