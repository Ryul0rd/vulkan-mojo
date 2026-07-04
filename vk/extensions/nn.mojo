from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ViSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_vi_surface: def(
        instance: Instance,
        p_create_info: Ptr[ViSurfaceCreateInfoNN, ImmutUntrackedOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutUntrackedOrigin],
        p_surface: Ptr[SurfaceKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_vi_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateViSurfaceNN".as_c_string_slice()
        )).bitcast[type_of(self._create_vi_surface)]()[]

    def create_vi_surface[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        create_info: ViSurfaceCreateInfoNN,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateViSurfaceNN.html
        """
        return self._create_vi_surface(
            instance,
            Ptr(to=create_info).bitcast[ViSurfaceCreateInfoNN]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]()[],
            Ptr(to=surface).bitcast[SurfaceKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )
