from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions
from vk.structs import *


struct ScreenSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_screen_surface: def(
        instance: Instance,
        p_create_info: Ptr[ScreenSurfaceCreateInfoQNX, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_surface: Ptr[SurfaceKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_physical_device_screen_presentation_support: def(
        physical_device: PhysicalDevice, queue_family_index: UInt32, window: screen_window_t
    ) thin abi("C") -> Bool32

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_screen_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateScreenSurfaceQNX".as_c_string_slice()
        )).bitcast[type_of(self._create_screen_surface)]()[]
        self._get_physical_device_screen_presentation_support = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceScreenPresentationSupportQNX".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_screen_presentation_support)]()[]

    def create_screen_surface[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        instance: Instance,
        create_info: ScreenSurfaceCreateInfoQNX,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateScreenSurfaceQNX.html
        """
        return self._create_screen_surface(
            instance,
            Ptr(to=create_info).bitcast[ScreenSurfaceCreateInfoQNX]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=surface).bitcast[SurfaceKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_screen_presentation_support(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32, window: screen_window_t
    ) -> Bool32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceScreenPresentationSupportQNX.html
        """
        return self._get_physical_device_screen_presentation_support(
            physical_device, queue_family_index, window
        )


struct ExternalMemoryScreenBuffer(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_screen_buffer_properties: def(
        device: Device,
        buffer: screen_buffer_t,
        p_properties: Ptr[ScreenBufferPropertiesQNX, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_screen_buffer_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetScreenBufferPropertiesQNX".as_c_string_slice()
        )).bitcast[type_of(self._get_screen_buffer_properties)]()[]

    def get_screen_buffer_properties(
        self, device: Device, buffer: screen_buffer_t, mut properties: ScreenBufferPropertiesQNX
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetScreenBufferPropertiesQNX.html
        """
        return self._get_screen_buffer_properties(
            device,
            buffer,
            Ptr(to=properties).bitcast[ScreenBufferPropertiesQNX]().unsafe_origin_cast[MutUntrackedOrigin](),
        )
