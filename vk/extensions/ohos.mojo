from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct Surface(Copyable):
    var _create_surface_ohos: fn(
        instance: Instance,
        pCreateInfo: Ptr[SurfaceCreateInfoOHOS, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance) raises:
        var get_instance_proc_addr = global_fns.borrow_handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_surface_ohos = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateSurfaceOHOS".unsafe_ptr()
        )).bitcast[type_of(self._create_surface_ohos)]()[]
        if not Ptr(to=self._create_surface_ohos).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkCreateSurfaceOHOS."

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
