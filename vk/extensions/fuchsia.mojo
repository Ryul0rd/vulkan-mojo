from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct ImagepipeSurface(Copyable):
    var _create_image_pipe_surface_fuchsia: fn(
        instance: Instance,
        pCreateInfo: Ptr[ImagePipeSurfaceCreateInfoFUCHSIA, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance) raises:
        var get_instance_proc_addr = global_fns.borrow_handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_image_pipe_surface_fuchsia = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateImagePipeSurfaceFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._create_image_pipe_surface_fuchsia)]()[]
        if not Ptr(to=self._create_image_pipe_surface_fuchsia).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkCreateImagePipeSurfaceFUCHSIA."

    fn create_image_pipe_surface_fuchsia(
        self,
        instance: Instance,
        create_info: ImagePipeSurfaceCreateInfoFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImagePipeSurfaceFUCHSIA.html
        """
        return self._create_image_pipe_surface_fuchsia(
            instance,
            Ptr(to=create_info).bitcast[ImagePipeSurfaceCreateInfoFUCHSIA](),
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR](),
        )


struct ExternalMemory(Copyable):
    var _get_memory_zircon_handle_fuchsia: fn(
        device: Device,
        pGetZirconHandleInfo: Ptr[MemoryGetZirconHandleInfoFUCHSIA, ImmutAnyOrigin],
        pZirconHandle: Ptr[zx_handle_t, MutAnyOrigin],
    ) -> Result
    var _get_memory_zircon_handle_properties_fuchsia: fn(
        device: Device,
        handleType: ExternalMemoryHandleTypeFlagBits,
        zirconHandle: zx_handle_t,
        pMemoryZirconHandleProperties: Ptr[MemoryZirconHandlePropertiesFUCHSIA, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device) raises:
        var get_device_proc_addr = global_fns.borrow_handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryZirconHandleFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._get_memory_zircon_handle_fuchsia)]()[]
        if not Ptr(to=self._get_memory_zircon_handle_fuchsia).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkGetMemoryZirconHandleFUCHSIA."
        self._get_memory_zircon_handle_properties_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryZirconHandlePropertiesFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._get_memory_zircon_handle_properties_fuchsia)]()[]
        if not Ptr(to=self._get_memory_zircon_handle_properties_fuchsia).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkGetMemoryZirconHandlePropertiesFUCHSIA."

    fn get_memory_zircon_handle_fuchsia(
        self,
        device: Device,
        get_zircon_handle_info: MemoryGetZirconHandleInfoFUCHSIA,
        mut zircon_handle: zx_handle_t,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryZirconHandleFUCHSIA.html
        """
        return self._get_memory_zircon_handle_fuchsia(
            device,
            Ptr(to=get_zircon_handle_info).bitcast[MemoryGetZirconHandleInfoFUCHSIA](),
            Ptr(to=zircon_handle).bitcast[zx_handle_t](),
        )

    fn get_memory_zircon_handle_properties_fuchsia(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        zircon_handle: zx_handle_t,
        mut memory_zircon_handle_properties: MemoryZirconHandlePropertiesFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryZirconHandlePropertiesFUCHSIA.html
        """
        return self._get_memory_zircon_handle_properties_fuchsia(
            device,
            handle_type,
            zircon_handle,
            Ptr(to=memory_zircon_handle_properties).bitcast[MemoryZirconHandlePropertiesFUCHSIA](),
        )


struct ExternalSemaphore(Copyable):
    var _import_semaphore_zircon_handle_fuchsia: fn(
        device: Device,
        pImportSemaphoreZirconHandleInfo: Ptr[ImportSemaphoreZirconHandleInfoFUCHSIA, ImmutAnyOrigin],
    ) -> Result
    var _get_semaphore_zircon_handle_fuchsia: fn(
        device: Device,
        pGetZirconHandleInfo: Ptr[SemaphoreGetZirconHandleInfoFUCHSIA, ImmutAnyOrigin],
        pZirconHandle: Ptr[zx_handle_t, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device) raises:
        var get_device_proc_addr = global_fns.borrow_handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_semaphore_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkImportSemaphoreZirconHandleFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._import_semaphore_zircon_handle_fuchsia)]()[]
        if not Ptr(to=self._import_semaphore_zircon_handle_fuchsia).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkImportSemaphoreZirconHandleFUCHSIA."
        self._get_semaphore_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreZirconHandleFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._get_semaphore_zircon_handle_fuchsia)]()[]
        if not Ptr(to=self._get_semaphore_zircon_handle_fuchsia).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkGetSemaphoreZirconHandleFUCHSIA."

    fn import_semaphore_zircon_handle_fuchsia(
        self,
        device: Device,
        import_semaphore_zircon_handle_info: ImportSemaphoreZirconHandleInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportSemaphoreZirconHandleFUCHSIA.html
        """
        return self._import_semaphore_zircon_handle_fuchsia(
            device,
            Ptr(to=import_semaphore_zircon_handle_info).bitcast[ImportSemaphoreZirconHandleInfoFUCHSIA](),
        )

    fn get_semaphore_zircon_handle_fuchsia(
        self,
        device: Device,
        get_zircon_handle_info: SemaphoreGetZirconHandleInfoFUCHSIA,
        mut zircon_handle: zx_handle_t,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreZirconHandleFUCHSIA.html
        """
        return self._get_semaphore_zircon_handle_fuchsia(
            device,
            Ptr(to=get_zircon_handle_info).bitcast[SemaphoreGetZirconHandleInfoFUCHSIA](),
            Ptr(to=zircon_handle).bitcast[zx_handle_t](),
        )


struct BufferCollection(Copyable):
    var _create_buffer_collection_fuchsia: fn(
        device: Device,
        pCreateInfo: Ptr[BufferCollectionCreateInfoFUCHSIA, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pCollection: Ptr[BufferCollectionFUCHSIA, MutAnyOrigin],
    ) -> Result
    var _set_buffer_collection_image_constraints_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pImageConstraintsInfo: Ptr[ImageConstraintsInfoFUCHSIA, ImmutAnyOrigin],
    ) -> Result
    var _set_buffer_collection_buffer_constraints_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pBufferConstraintsInfo: Ptr[BufferConstraintsInfoFUCHSIA, ImmutAnyOrigin],
    ) -> Result
    var _destroy_buffer_collection_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_buffer_collection_properties_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pProperties: Ptr[BufferCollectionPropertiesFUCHSIA, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device) raises:
        var get_device_proc_addr = global_fns.borrow_handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_buffer_collection_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkCreateBufferCollectionFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._create_buffer_collection_fuchsia)]()[]
        if not Ptr(to=self._create_buffer_collection_fuchsia).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkCreateBufferCollectionFUCHSIA."
        self._set_buffer_collection_image_constraints_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkSetBufferCollectionImageConstraintsFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._set_buffer_collection_image_constraints_fuchsia)]()[]
        if not Ptr(to=self._set_buffer_collection_image_constraints_fuchsia).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkSetBufferCollectionImageConstraintsFUCHSIA."
        self._set_buffer_collection_buffer_constraints_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkSetBufferCollectionBufferConstraintsFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._set_buffer_collection_buffer_constraints_fuchsia)]()[]
        if not Ptr(to=self._set_buffer_collection_buffer_constraints_fuchsia).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkSetBufferCollectionBufferConstraintsFUCHSIA."
        self._destroy_buffer_collection_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkDestroyBufferCollectionFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._destroy_buffer_collection_fuchsia)]()[]
        if not Ptr(to=self._destroy_buffer_collection_fuchsia).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkDestroyBufferCollectionFUCHSIA."
        self._get_buffer_collection_properties_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferCollectionPropertiesFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._get_buffer_collection_properties_fuchsia)]()[]
        if not Ptr(to=self._get_buffer_collection_properties_fuchsia).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkGetBufferCollectionPropertiesFUCHSIA."

    fn create_buffer_collection_fuchsia(
        self,
        device: Device,
        create_info: BufferCollectionCreateInfoFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut collection: BufferCollectionFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferCollectionFUCHSIA.html
        """
        return self._create_buffer_collection_fuchsia(
            device,
            Ptr(to=create_info).bitcast[BufferCollectionCreateInfoFUCHSIA](),
            p_allocator,
            Ptr(to=collection).bitcast[BufferCollectionFUCHSIA](),
        )

    fn set_buffer_collection_image_constraints_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        image_constraints_info: ImageConstraintsInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetBufferCollectionImageConstraintsFUCHSIA.html
        """
        return self._set_buffer_collection_image_constraints_fuchsia(
            device,
            collection,
            Ptr(to=image_constraints_info).bitcast[ImageConstraintsInfoFUCHSIA](),
        )

    fn set_buffer_collection_buffer_constraints_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        buffer_constraints_info: BufferConstraintsInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetBufferCollectionBufferConstraintsFUCHSIA.html
        """
        return self._set_buffer_collection_buffer_constraints_fuchsia(
            device,
            collection,
            Ptr(to=buffer_constraints_info).bitcast[BufferConstraintsInfoFUCHSIA](),
        )

    fn destroy_buffer_collection_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferCollectionFUCHSIA.html
        """
        return self._destroy_buffer_collection_fuchsia(device, collection, p_allocator)

    fn get_buffer_collection_properties_fuchsia(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        mut properties: BufferCollectionPropertiesFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferCollectionPropertiesFUCHSIA.html
        """
        return self._get_buffer_collection_properties_fuchsia(
            device, collection, Ptr(to=properties).bitcast[BufferCollectionPropertiesFUCHSIA]()
        )
