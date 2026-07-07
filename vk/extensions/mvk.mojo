from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions
from vk.structs import *


struct IosSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_ios_surface: def(
        instance: Instance,
        p_create_info: Ptr[IOSSurfaceCreateInfoMVK, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_surface: Ptr[SurfaceKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_ios_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateIOSSurfaceMVK".as_c_string_slice()
        )).bitcast[type_of(self._create_ios_surface)]()[]

    def create_ios_surface[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        create_info: IOSSurfaceCreateInfoMVK,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIOSSurfaceMVK.html
        """
        return self._create_ios_surface(
            instance,
            Ptr(to=create_info).bitcast[IOSSurfaceCreateInfoMVK]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=surface).bitcast[SurfaceKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct MacosSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_mac_os_surface: def(
        instance: Instance,
        p_create_info: Ptr[MacOSSurfaceCreateInfoMVK, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_surface: Ptr[SurfaceKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_mac_os_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateMacOSSurfaceMVK".as_c_string_slice()
        )).bitcast[type_of(self._create_mac_os_surface)]()[]

    def create_mac_os_surface[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        create_info: MacOSSurfaceCreateInfoMVK,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateMacOSSurfaceMVK.html
        """
        return self._create_mac_os_surface(
            instance,
            Ptr(to=create_info).bitcast[MacOSSurfaceCreateInfoMVK]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=surface).bitcast[SurfaceKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )
