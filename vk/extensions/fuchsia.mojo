from vk.core_functions import GlobalFunctions


struct ImagepipeSurface(Copyable, Movable):
    var _create_image_pipe_surface_fuchsia: fn(
        instance: Instance, pCreateInfo: Ptr[ImagePipeSurfaceCreateInfoFUCHSIA], pAllocator: Ptr[AllocationCallbacks], pSurface: Ptr[SurfaceKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_image_pipe_surface_fuchsia = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateImagePipeSurfaceFUCHSIA".unsafe_ptr()
        )).bitcast[__type_of(self._create_image_pipe_surface_fuchsia)]()[]

    fn create_image_pipe_surface_fuchsia(
        self,
        instance: Instance,
        create_info: ImagePipeSurfaceCreateInfoFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_image_pipe_surface_fuchsia(
            instance, Ptr(to=create_info), p_allocator, Ptr(to=surface)
        )


struct ExternalMemory(Copyable, Movable):
    var _get_memory_zircon_handle_fuchsia: fn(
        device: Device, pGetZirconHandleInfo: Ptr[MemoryGetZirconHandleInfoFUCHSIA], pZirconHandle: Ptr[zx_handle_t]
    ) -> Result
    var _get_memory_zircon_handle_properties_fuchsia: fn(
        device: Device, handleType: ExternalMemoryHandleTypeFlagBits, zirconHandle: zx_handle_t, pMemoryZirconHandleProperties: Ptr[MemoryZirconHandlePropertiesFUCHSIA]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryZirconHandleFUCHSIA".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_zircon_handle_fuchsia)]()[]
        self._get_memory_zircon_handle_properties_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryZirconHandlePropertiesFUCHSIA".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_zircon_handle_properties_fuchsia)]()[]

    fn get_memory_zircon_handle_fuchsia(
        self,
        device: Device,
        get_zircon_handle_info: MemoryGetZirconHandleInfoFUCHSIA,
        mut zircon_handle: zx_handle_t,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_zircon_handle_fuchsia(
            device, Ptr(to=get_zircon_handle_info), Ptr(to=zircon_handle)
        )

    fn get_memory_zircon_handle_properties_fuchsia(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        zircon_handle: zx_handle_t,
        mut memory_zircon_handle_properties: MemoryZirconHandlePropertiesFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_zircon_handle_properties_fuchsia(
            device, handle_type, zircon_handle, Ptr(to=memory_zircon_handle_properties)
        )


struct ExternalSemaphore(Copyable, Movable):
    var _import_semaphore_zircon_handle_fuchsia: fn(
        device: Device, pImportSemaphoreZirconHandleInfo: Ptr[ImportSemaphoreZirconHandleInfoFUCHSIA]
    ) -> Result
    var _get_semaphore_zircon_handle_fuchsia: fn(
        device: Device, pGetZirconHandleInfo: Ptr[SemaphoreGetZirconHandleInfoFUCHSIA], pZirconHandle: Ptr[zx_handle_t]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_semaphore_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkImportSemaphoreZirconHandleFUCHSIA".unsafe_ptr()
        )).bitcast[__type_of(self._import_semaphore_zircon_handle_fuchsia)]()[]
        self._get_semaphore_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreZirconHandleFUCHSIA".unsafe_ptr()
        )).bitcast[__type_of(self._get_semaphore_zircon_handle_fuchsia)]()[]

    fn import_semaphore_zircon_handle_fuchsia(
        self,
        device: Device,
        import_semaphore_zircon_handle_info: ImportSemaphoreZirconHandleInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._import_semaphore_zircon_handle_fuchsia(
            device, Ptr(to=import_semaphore_zircon_handle_info)
        )

    fn get_semaphore_zircon_handle_fuchsia(
        self,
        device: Device,
        get_zircon_handle_info: SemaphoreGetZirconHandleInfoFUCHSIA,
        mut zircon_handle: zx_handle_t,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_semaphore_zircon_handle_fuchsia(
            device, Ptr(to=get_zircon_handle_info), Ptr(to=zircon_handle)
        )


struct BufferCollection(Copyable, Movable):
    var _create_buffer_collection_fuchsia: fn(
        device: Device, pCreateInfo: Ptr[BufferCollectionCreateInfoFUCHSIA], pAllocator: Ptr[AllocationCallbacks], pCollection: Ptr[BufferCollectionFUCHSIA]
    ) -> Result
    var _set_buffer_collection_image_constraints_fuchsia: fn(
        device: Device, collection: BufferCollectionFUCHSIA, pImageConstraintsInfo: Ptr[ImageConstraintsInfoFUCHSIA]
    ) -> Result
    var _set_buffer_collection_buffer_constraints_fuchsia: fn(
        device: Device, collection: BufferCollectionFUCHSIA, pBufferConstraintsInfo: Ptr[BufferConstraintsInfoFUCHSIA]
    ) -> Result
    var _destroy_buffer_collection_fuchsia: fn(
        device: Device, collection: BufferCollectionFUCHSIA, pAllocator: Ptr[AllocationCallbacks]
    )
    var _get_buffer_collection_properties_fuchsia: fn(
        device: Device, collection: BufferCollectionFUCHSIA, pProperties: Ptr[BufferCollectionPropertiesFUCHSIA]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_buffer_collection_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkCreateBufferCollectionFUCHSIA".unsafe_ptr()
        )).bitcast[__type_of(self._create_buffer_collection_fuchsia)]()[]
        self._set_buffer_collection_image_constraints_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkSetBufferCollectionImageConstraintsFUCHSIA".unsafe_ptr()
        )).bitcast[__type_of(self._set_buffer_collection_image_constraints_fuchsia)]()[]
        self._set_buffer_collection_buffer_constraints_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkSetBufferCollectionBufferConstraintsFUCHSIA".unsafe_ptr()
        )).bitcast[__type_of(self._set_buffer_collection_buffer_constraints_fuchsia)]()[]
        self._destroy_buffer_collection_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkDestroyBufferCollectionFUCHSIA".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_buffer_collection_fuchsia)]()[]
        self._get_buffer_collection_properties_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferCollectionPropertiesFUCHSIA".unsafe_ptr()
        )).bitcast[__type_of(self._get_buffer_collection_properties_fuchsia)]()[]

    fn create_buffer_collection_fuchsia(
        self,
        device: Device,
        create_info: BufferCollectionCreateInfoFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks],
        mut collection: BufferCollectionFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_buffer_collection_fuchsia(
            device, Ptr(to=create_info), p_allocator, Ptr(to=collection)
        )

    fn set_buffer_collection_image_constraints_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        image_constraints_info: ImageConstraintsInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._set_buffer_collection_image_constraints_fuchsia(
            device, collection, Ptr(to=image_constraints_info)
        )

    fn set_buffer_collection_buffer_constraints_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        buffer_constraints_info: BufferConstraintsInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._set_buffer_collection_buffer_constraints_fuchsia(
            device, collection, Ptr(to=buffer_constraints_info)
        )

    fn destroy_buffer_collection_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_buffer_collection_fuchsia(device, collection, p_allocator)

    fn get_buffer_collection_properties_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        mut properties: BufferCollectionPropertiesFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_buffer_collection_properties_fuchsia(
            device, collection, Ptr(to=properties)
        )
