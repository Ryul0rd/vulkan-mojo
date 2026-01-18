from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct Surface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_surface_ohos: fn(
        instance: Instance,
        p_create_info: Ptr[SurfaceCreateInfoOHOS, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_surface_ohos = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateSurfaceOHOS".as_c_string_slice()
        )).bitcast[type_of(self._create_surface_ohos)]()[]

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
        return self._create_surface_ohos(instance, Ptr(to=create_info), p_allocator, Ptr(to=surface))
