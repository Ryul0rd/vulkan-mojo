from vk.core_functions import GlobalFunctions


struct BinaryImport(Copyable):    var _vk_create_cu_module_nvx: fn(
        device: Device,
        pCreateInfo: Ptr[CuModuleCreateInfoNVX, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pModule: Ptr[CuModuleNVX, MutOrigin.external],
    ) -> Result
    var _vk_create_cu_function_nvx: fn(
        device: Device,
        pCreateInfo: Ptr[CuFunctionCreateInfoNVX, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pFunction: Ptr[CuFunctionNVX, MutOrigin.external],
    ) -> Result
    var _vk_destroy_cu_module_nvx: fn(
        device: Device,
        module: CuModuleNVX,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_destroy_cu_function_nvx: fn(
        device: Device,
        function: CuFunctionNVX,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_cmd_cu_launch_kernel_nvx: fn(
        commandBuffer: CommandBuffer, pLaunchInfo: Ptr[CuLaunchInfoNVX, ImmutOrigin.external]
    )


struct ImageViewHandle(Copyable):    var _vk_get_image_view_handle_nvx: fn(
        device: Device, pInfo: Ptr[ImageViewHandleInfoNVX, ImmutOrigin.external]
    ) -> UInt32
    var _vk_get_image_view_handle_64_nvx: fn(
        device: Device, pInfo: Ptr[ImageViewHandleInfoNVX, ImmutOrigin.external]
    ) -> UInt64
    var _vk_get_image_view_address_nvx: fn(
        device: Device,
        imageView: ImageView,
        pProperties: Ptr[ImageViewAddressPropertiesNVX, MutOrigin.external],
    ) -> Result
