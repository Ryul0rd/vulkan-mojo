from vk.core_functions import GlobalFunctions


struct Surface(Copyable, Movable):
    var _create_surface_ohos: fn(
        instance: Instance, pCreateInfo: Ptr[SurfaceCreateInfoOHOS], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_surface_ohos = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateSurfaceOHOS".unsafe_ptr()
        )).bitcast[__type_of(self._create_surface_ohos)]()[]

    fn create_surface_ohos(
        self,
        instance: Instance,
        create_info: SurfaceCreateInfoOHOS,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_surface_ohos(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )
