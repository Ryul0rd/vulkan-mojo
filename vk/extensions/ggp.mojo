from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions
from vk.structs import *


struct StreamDescriptorSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_stream_descriptor_surface: def(
        instance: Instance,
        p_create_info: Ptr[StreamDescriptorSurfaceCreateInfoGGP, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_surface: Ptr[SurfaceKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_stream_descriptor_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateStreamDescriptorSurfaceGGP".as_c_string_slice()
        )).bitcast[type_of(self._create_stream_descriptor_surface)]()[]

    def create_stream_descriptor_surface[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        create_info: StreamDescriptorSurfaceCreateInfoGGP,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateStreamDescriptorSurfaceGGP.html
        """
        return self._create_stream_descriptor_surface(
            instance,
            Ptr(to=create_info).bitcast[StreamDescriptorSurfaceCreateInfoGGP]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=surface).bitcast[SurfaceKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )
