from ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct StreamDescriptorSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_stream_descriptor_surface: fn(
        instance: Instance,
        p_create_info: Ptr[StreamDescriptorSurfaceCreateInfoGGP, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_stream_descriptor_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateStreamDescriptorSurfaceGGP".as_c_string_slice()
        )).bitcast[type_of(self._create_stream_descriptor_surface)]()[]

    fn create_stream_descriptor_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: StreamDescriptorSurfaceCreateInfoGGP,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateStreamDescriptorSurfaceGGP.html
        """
        return self._create_stream_descriptor_surface(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )
