from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ViSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_vi_surface_nn: fn(
        instance: Instance,
        pCreateInfo: Ptr[ViSurfaceCreateInfoNN, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_vi_surface_nn = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateViSurfaceNN".unsafe_ptr()
        )).bitcast[type_of(self._create_vi_surface_nn)]()[]

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
