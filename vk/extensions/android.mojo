from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct NativeBuffer(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_swapchain_gralloc_usage_android: fn(
        device: Device,
        format: Format,
        image_usage: ImageUsageFlags,
        gralloc_usage: Ptr[Int32, MutAnyOrigin],
    ) -> Result
    var _acquire_image_android: fn(
        device: Device, image: Image, native_fence_fd: Int32, semaphore: Semaphore, fence: Fence
    ) -> Result
    var _queue_signal_release_image_android: fn(
        queue: Queue,
        wait_semaphore_count: UInt32,
        p_wait_semaphores: Ptr[Semaphore, ImmutAnyOrigin],
        image: Image,
        p_native_fence_fd: Ptr[Int32, MutAnyOrigin],
    ) -> Result
    var _get_swapchain_gralloc_usage_2_android: fn(
        device: Device,
        format: Format,
        image_usage: ImageUsageFlags,
        swapchain_image_usage: SwapchainImageUsageFlagsANDROID,
        gralloc_consumer_usage: Ptr[UInt64, MutAnyOrigin],
        gralloc_producer_usage: Ptr[UInt64, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_swapchain_gralloc_usage_android = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainGrallocUsageANDROID".as_c_string_slice()
        )).bitcast[type_of(self._get_swapchain_gralloc_usage_android)]()[]
        self._acquire_image_android = Ptr(to=get_device_proc_addr(
            device, "vkAcquireImageANDROID".as_c_string_slice()
        )).bitcast[type_of(self._acquire_image_android)]()[]
        self._queue_signal_release_image_android = Ptr(to=get_device_proc_addr(
            device, "vkQueueSignalReleaseImageANDROID".as_c_string_slice()
        )).bitcast[type_of(self._queue_signal_release_image_android)]()[]
        self._get_swapchain_gralloc_usage_2_android = Ptr(to=get_device_proc_addr(
            device, "vkGetSwapchainGrallocUsage2ANDROID".as_c_string_slice()
        )).bitcast[type_of(self._get_swapchain_gralloc_usage_2_android)]()[]

    fn get_swapchain_gralloc_usage_android(
        self, device: Device, format: Format, image_usage: ImageUsageFlags, mut gralloc_usage: Int32
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainGrallocUsageANDROID.html
        """
        return self._get_swapchain_gralloc_usage_android(
            device, format, image_usage, Ptr(to=gralloc_usage).bitcast[Int32]()
        )

    fn acquire_image_android(
        self,
        device: Device,
        image: Image,
        native_fence_fd: Int32,
        semaphore: Semaphore,
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireImageANDROID.html
        """
        return self._acquire_image_android(device, image, native_fence_fd, semaphore, fence)

    fn queue_signal_release_image_android(
        self,
        queue: Queue,
        wait_semaphore_count: UInt32,
        p_wait_semaphores: Ptr[Semaphore, ImmutAnyOrigin],
        image: Image,
        mut native_fence_fd: Int32,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSignalReleaseImageANDROID.html
        """
        return self._queue_signal_release_image_android(
            queue, wait_semaphore_count, p_wait_semaphores, image, Ptr(to=native_fence_fd).bitcast[Int32]()
        )

    fn get_swapchain_gralloc_usage_2_android(
        self,
        device: Device,
        format: Format,
        image_usage: ImageUsageFlags,
        swapchain_image_usage: SwapchainImageUsageFlagsANDROID,
        mut gralloc_consumer_usage: UInt64,
        mut gralloc_producer_usage: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSwapchainGrallocUsage2ANDROID.html
        """
        return self._get_swapchain_gralloc_usage_2_android(
            device,
            format,
            image_usage,
            swapchain_image_usage,
            Ptr(to=gralloc_consumer_usage).bitcast[UInt64](),
            Ptr(to=gralloc_producer_usage).bitcast[UInt64](),
        )


struct ExternalMemoryAndroidHardwareBuffer(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_android_hardware_buffer_properties_android: fn(
        device: Device,
        buffer: Ptr[AHardwareBuffer, ImmutAnyOrigin],
        p_properties: Ptr[AndroidHardwareBufferPropertiesANDROID, MutAnyOrigin],
    ) -> Result
    var _get_memory_android_hardware_buffer_android: fn(
        device: Device,
        p_info: Ptr[MemoryGetAndroidHardwareBufferInfoANDROID, ImmutAnyOrigin],
        p_buffer: Ptr[Ptr[AHardwareBuffer, MutAnyOrigin], MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_android_hardware_buffer_properties_android = Ptr(to=get_device_proc_addr(
            device, "vkGetAndroidHardwareBufferPropertiesANDROID".as_c_string_slice()
        )).bitcast[type_of(self._get_android_hardware_buffer_properties_android)]()[]
        self._get_memory_android_hardware_buffer_android = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryAndroidHardwareBufferANDROID".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_android_hardware_buffer_android)]()[]

    fn get_android_hardware_buffer_properties_android(
        self,
        device: Device,
        buffer: AHardwareBuffer,
        mut properties: AndroidHardwareBufferPropertiesANDROID,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAndroidHardwareBufferPropertiesANDROID.html
        """
        return self._get_android_hardware_buffer_properties_android(
            device,
            Ptr(to=buffer).bitcast[AHardwareBuffer](),
            Ptr(to=properties).bitcast[AndroidHardwareBufferPropertiesANDROID](),
        )

    fn get_memory_android_hardware_buffer_android(
        self,
        device: Device,
        info: MemoryGetAndroidHardwareBufferInfoANDROID,
        mut buffer: Ptr[AHardwareBuffer, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryAndroidHardwareBufferANDROID.html
        """
        return self._get_memory_android_hardware_buffer_android(
            device,
            Ptr(to=info).bitcast[MemoryGetAndroidHardwareBufferInfoANDROID](),
            Ptr(to=buffer).bitcast[Ptr[AHardwareBuffer, MutAnyOrigin]](),
        )
