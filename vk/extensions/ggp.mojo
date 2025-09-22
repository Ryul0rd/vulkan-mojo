from vk.core_functions import GlobalFunctions


struct StreamDescriptorSurface(Copyable, Movable):
    var _create_stream_descriptor_surface_ggp: fn(
        instance: Instance, pCreateInfo: Ptr[StreamDescriptorSurfaceCreateInfoGGP], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_stream_descriptor_surface_ggp = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateStreamDescriptorSurfaceGGP".unsafe_ptr()
        )).bitcast[__type_of(self._create_stream_descriptor_surface_ggp)]()[]

    fn create_stream_descriptor_surface_ggp(
        self,
        instance: Instance,
        create_info: StreamDescriptorSurfaceCreateInfoGGP,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_stream_descriptor_surface_ggp(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )
