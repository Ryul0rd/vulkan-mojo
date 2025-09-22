from vk.core_functions import GlobalFunctions


struct ViSurface(Copyable, Movable):
    var _create_vi_surface_nn: fn(
        instance: Instance, pCreateInfo: Ptr[ViSurfaceCreateInfoNN], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_vi_surface_nn = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateViSurfaceNN".unsafe_ptr()
        )).bitcast[__type_of(self._create_vi_surface_nn)]()[]

    fn create_vi_surface_nn(
        self,
        instance: Instance,
        create_info: ViSurfaceCreateInfoNN,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_vi_surface_nn(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )
