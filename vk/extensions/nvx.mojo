from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct BinaryImport(Copyable):    var _vk_create_cu_module_nvx: fn(
        device: Device,
        pCreateInfo: Ptr[CuModuleCreateInfoNVX, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pModule: Ptr[CuModuleNVX, MutAnyOrigin],
    ) -> Result
    var _vk_create_cu_function_nvx: fn(
        device: Device,
        pCreateInfo: Ptr[CuFunctionCreateInfoNVX, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pFunction: Ptr[CuFunctionNVX, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_cu_module_nvx: fn(
        device: Device, module: CuModuleNVX, pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _vk_destroy_cu_function_nvx: fn(
        device: Device,
        function: CuFunctionNVX,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_cmd_cu_launch_kernel_nvx: fn(
        commandBuffer: CommandBuffer, pLaunchInfo: Ptr[CuLaunchInfoNVX, ImmutAnyOrigin]
    )


struct ImageViewHandle(Copyable):    var _vk_get_image_view_handle_nvx: fn(
        device: Device, pInfo: Ptr[ImageViewHandleInfoNVX, ImmutAnyOrigin]
    ) -> UInt32
    var _vk_get_image_view_handle_64_nvx: fn(
        device: Device, pInfo: Ptr[ImageViewHandleInfoNVX, ImmutAnyOrigin]
    ) -> UInt64
    var _vk_get_image_view_address_nvx: fn(
        device: Device,
        imageView: ImageView,
        pProperties: Ptr[ImageViewAddressPropertiesNVX, MutAnyOrigin],
    ) -> Result
