from vk.core_functions import GlobalFunctions


struct BinaryImport(Copyable, Movable):
    var _create_cu_module_nvx: fn(
        device: Device, pCreateInfo: Ptr[CuModuleCreateInfoNVX], pAllocator: Ptr[AllocationCallbacks], pModule: Ptr[CuModuleNVX]
    ) -> Result
    var _create_cu_function_nvx: fn(
        device: Device, pCreateInfo: Ptr[CuFunctionCreateInfoNVX], pAllocator: Ptr[AllocationCallbacks], pFunction: Ptr[CuFunctionNVX]
    ) -> Result
    var _destroy_cu_module_nvx: fn(
        device: Device, module: CuModuleNVX, pAllocator: Ptr[AllocationCallbacks]
    )
    var _destroy_cu_function_nvx: fn(
        device: Device, function: CuFunctionNVX, pAllocator: Ptr[AllocationCallbacks]
    )
    var _cmd_cu_launch_kernel_nvx: fn(
        commandBuffer: CommandBuffer, pLaunchInfo: Ptr[CuLaunchInfoNVX]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_cu_module_nvx = Ptr(to=get_device_proc_addr(
            device, "vkCreateCuModuleNVX".unsafe_ptr()
        )).bitcast[__type_of(self._create_cu_module_nvx)]()[]
        self._create_cu_function_nvx = Ptr(to=get_device_proc_addr(
            device, "vkCreateCuFunctionNVX".unsafe_ptr()
        )).bitcast[__type_of(self._create_cu_function_nvx)]()[]
        self._destroy_cu_module_nvx = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCuModuleNVX".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_cu_module_nvx)]()[]
        self._destroy_cu_function_nvx = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCuFunctionNVX".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_cu_function_nvx)]()[]
        self._cmd_cu_launch_kernel_nvx = Ptr(to=get_device_proc_addr(
            device, "vkCmdCuLaunchKernelNVX".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_cu_launch_kernel_nvx)]()[]

    fn create_cu_module_nvx(
        self,
        device: Device,
        create_info: CuModuleCreateInfoNVX,
        p_allocator: Ptr[AllocationCallbacks],
        mut module: CuModuleNVX,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_cu_module_nvx(device, Ptr(to=create_info), p_allocator, Ptr(to=module))

    fn create_cu_function_nvx(
        self,
        device: Device,
        create_info: CuFunctionCreateInfoNVX,
        p_allocator: Ptr[AllocationCallbacks],
        mut function: CuFunctionNVX,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_cu_function_nvx(
            device, Ptr(to=create_info), p_allocator, Ptr(to=function)
        )

    fn destroy_cu_module_nvx(
        self, device: Device, module: CuModuleNVX, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_cu_module_nvx(device, module, p_allocator)

    fn destroy_cu_function_nvx(
        self, device: Device, function: CuFunctionNVX, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_cu_function_nvx(device, function, p_allocator)

    fn cmd_cu_launch_kernel_nvx(self, command_buffer: CommandBuffer, launch_info: CuLaunchInfoNVX):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_cu_launch_kernel_nvx(command_buffer, Ptr(to=launch_info))


struct ImageViewHandle(Copyable, Movable):
    var _get_image_view_handle_nvx: fn(
        device: Device, pInfo: Ptr[ImageViewHandleInfoNVX]
    ) -> UInt32
    var _get_image_view_handle_64_nvx: fn(
        device: Device, pInfo: Ptr[ImageViewHandleInfoNVX]
    ) -> UInt64
    var _get_image_view_address_nvx: fn(
        device: Device, imageView: ImageView, pProperties: Ptr[ImageViewAddressPropertiesNVX]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_image_view_handle_nvx = Ptr(to=get_device_proc_addr(
            device, "vkGetImageViewHandleNVX".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_view_handle_nvx)]()[]
        self._get_image_view_handle_64_nvx = Ptr(to=get_device_proc_addr(
            device, "vkGetImageViewHandle64NVX".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_view_handle_64_nvx)]()[]
        self._get_image_view_address_nvx = Ptr(to=get_device_proc_addr(
            device, "vkGetImageViewAddressNVX".unsafe_ptr()
        )).bitcast[__type_of(self._get_image_view_address_nvx)]()[]

    fn get_image_view_handle_nvx(self, device: Device, info: ImageViewHandleInfoNVX) -> UInt32:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_view_handle_nvx(device, Ptr(to=info))

    fn get_image_view_handle_64_nvx(self, device: Device, info: ImageViewHandleInfoNVX) -> UInt64:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_view_handle_64_nvx(device, Ptr(to=info))

    fn get_image_view_address_nvx(
        self, device: Device, image_view: ImageView, mut properties: ImageViewAddressPropertiesNVX
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_image_view_address_nvx(device, image_view, Ptr(to=properties))
