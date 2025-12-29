from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct StreamDescriptorSurface(Copyable):
    var _create_stream_descriptor_surface_ggp: fn(
        instance: Instance,
        pCreateInfo: Ptr[StreamDescriptorSurfaceCreateInfoGGP, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance) raises:
        var get_instance_proc_addr = global_fns.borrow_handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_stream_descriptor_surface_ggp = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateStreamDescriptorSurfaceGGP".unsafe_ptr()
        )).bitcast[type_of(self._create_stream_descriptor_surface_ggp)]()[]

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
