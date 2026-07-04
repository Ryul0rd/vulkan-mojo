from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct BinaryImport(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_cu_module: def(
        device: Device,
        p_create_info: Ptr[CuModuleCreateInfoNVX, ImmutUntrackedOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutUntrackedOrigin],
        p_module: Ptr[CuModuleNVX, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _create_cu_function: def(
        device: Device,
        p_create_info: Ptr[CuFunctionCreateInfoNVX, ImmutUntrackedOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutUntrackedOrigin],
        p_function: Ptr[CuFunctionNVX, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_cu_module: def(
        device: Device, module: CuModuleNVX, p_allocator: Ptr[AllocationCallbacks, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _destroy_cu_function: def(
        device: Device,
        function: CuFunctionNVX,
        p_allocator: Ptr[AllocationCallbacks, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_cu_launch_kernel: def(
        command_buffer: CommandBuffer, p_launch_info: Ptr[CuLaunchInfoNVX, ImmutUntrackedOrigin]
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_cu_module = Ptr(to=get_device_proc_addr(
            device, "vkCreateCuModuleNVX".as_c_string_slice()
        )).bitcast[type_of(self._create_cu_module)]()[]
        self._create_cu_function = Ptr(to=get_device_proc_addr(
            device, "vkCreateCuFunctionNVX".as_c_string_slice()
        )).bitcast[type_of(self._create_cu_function)]()[]
        self._destroy_cu_module = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCuModuleNVX".as_c_string_slice()
        )).bitcast[type_of(self._destroy_cu_module)]()[]
        self._destroy_cu_function = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCuFunctionNVX".as_c_string_slice()
        )).bitcast[type_of(self._destroy_cu_function)]()[]
        self._cmd_cu_launch_kernel = Ptr(to=get_device_proc_addr(
            device, "vkCmdCuLaunchKernelNVX".as_c_string_slice()
        )).bitcast[type_of(self._cmd_cu_launch_kernel)]()[]

    def create_cu_module[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: CuModuleCreateInfoNVX,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut module: CuModuleNVX,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCuModuleNVX.html
        """
        return self._create_cu_module(
            device,
            Ptr(to=create_info).bitcast[CuModuleCreateInfoNVX]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]()[],
            Ptr(to=module).bitcast[CuModuleNVX]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def create_cu_function[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: CuFunctionCreateInfoNVX,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut function: CuFunctionNVX,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCuFunctionNVX.html
        """
        return self._create_cu_function(
            device,
            Ptr(to=create_info).bitcast[CuFunctionCreateInfoNVX]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]()[],
            Ptr(to=function).bitcast[CuFunctionNVX]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_cu_module[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        module: CuModuleNVX,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCuModuleNVX.html
        """
        return self._destroy_cu_module(
            device, module, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]()[]
        )

    def destroy_cu_function[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        function: CuFunctionNVX,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCuFunctionNVX.html
        """
        return self._destroy_cu_function(
            device,
            function,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]()[],
        )

    def cmd_cu_launch_kernel(self, command_buffer: CommandBuffer, launch_info: CuLaunchInfoNVX):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCuLaunchKernelNVX.html
        """
        return self._cmd_cu_launch_kernel(
            command_buffer,
            Ptr(to=launch_info).bitcast[CuLaunchInfoNVX]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct ImageViewHandle(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_image_view_handle: def(
        device: Device, p_info: Ptr[ImageViewHandleInfoNVX, ImmutUntrackedOrigin]
    ) thin abi("C") -> UInt32
    var _get_image_view_handle_64: def(
        device: Device, p_info: Ptr[ImageViewHandleInfoNVX, ImmutUntrackedOrigin]
    ) thin abi("C") -> UInt64
    var _get_image_view_address: def(
        device: Device,
        image_view: ImageView,
        p_properties: Ptr[ImageViewAddressPropertiesNVX, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_device_combined_image_sampler_index: def(
        device: Device, image_view_index: UInt64, sampler_index: UInt64
    ) thin abi("C") -> UInt64

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_view_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetImageViewHandleNVX".as_c_string_slice()
        )).bitcast[type_of(self._get_image_view_handle)]()[]
        self._get_image_view_handle_64 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageViewHandle64NVX".as_c_string_slice()
        )).bitcast[type_of(self._get_image_view_handle_64)]()[]
        self._get_image_view_address = Ptr(to=get_device_proc_addr(
            device, "vkGetImageViewAddressNVX".as_c_string_slice()
        )).bitcast[type_of(self._get_image_view_address)]()[]
        self._get_device_combined_image_sampler_index = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceCombinedImageSamplerIndexNVX".as_c_string_slice()
        )).bitcast[type_of(self._get_device_combined_image_sampler_index)]()[]

    def get_image_view_handle(self, device: Device, info: ImageViewHandleInfoNVX) -> UInt32:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageViewHandleNVX.html
        """
        return self._get_image_view_handle(
            device,
            Ptr(to=info).bitcast[ImageViewHandleInfoNVX]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_image_view_handle_64(self, device: Device, info: ImageViewHandleInfoNVX) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageViewHandle64NVX.html
        """
        return self._get_image_view_handle_64(
            device,
            Ptr(to=info).bitcast[ImageViewHandleInfoNVX]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_image_view_address(
        self, device: Device, image_view: ImageView, mut properties: ImageViewAddressPropertiesNVX
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageViewAddressNVX.html
        """
        return self._get_image_view_address(
            device,
            image_view,
            Ptr(to=properties).bitcast[ImageViewAddressPropertiesNVX]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_device_combined_image_sampler_index(
        self, device: Device, image_view_index: UInt64, sampler_index: UInt64
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceCombinedImageSamplerIndexNVX.html
        """
        return self._get_device_combined_image_sampler_index(device, image_view_index, sampler_index)
