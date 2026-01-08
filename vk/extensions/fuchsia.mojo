from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ImagepipeSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_image_pipe_surface_fuchsia: fn(
        instance: Instance,
        create_info: ImagePipeSurfaceCreateInfoFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        surface: SurfaceKHR,
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_image_pipe_surface_fuchsia = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateImagePipeSurfaceFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._create_image_pipe_surface_fuchsia)]()[]

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
            Ptr(to=create_info).bitcast[ImagePipeSurfaceCreateInfoFUCHSIA]()[],
            p_allocator,
            Ptr(to=surface).bitcast[SurfaceKHR]()[],
        )


struct ExternalMemory(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_zircon_handle_fuchsia: fn(
        device: Device,
        get_zircon_handle_info: MemoryGetZirconHandleInfoFUCHSIA,
        zircon_handle: zx_handle_t,
    ) -> Result
    var _get_memory_zircon_handle_properties_fuchsia: fn(
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        zircon_handle: zx_handle_t,
        memory_zircon_handle_properties: MemoryZirconHandlePropertiesFUCHSIA,
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryZirconHandleFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._get_memory_zircon_handle_fuchsia)]()[]
        self._get_memory_zircon_handle_properties_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryZirconHandlePropertiesFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._get_memory_zircon_handle_properties_fuchsia)]()[]

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
            Ptr(to=get_zircon_handle_info).bitcast[MemoryGetZirconHandleInfoFUCHSIA]()[],
            Ptr(to=zircon_handle).bitcast[zx_handle_t]()[],
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
            Ptr(to=memory_zircon_handle_properties).bitcast[MemoryZirconHandlePropertiesFUCHSIA]()[],
        )


struct ExternalSemaphore(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _import_semaphore_zircon_handle_fuchsia: fn(
        device: Device, import_semaphore_zircon_handle_info: ImportSemaphoreZirconHandleInfoFUCHSIA
    ) -> Result
    var _get_semaphore_zircon_handle_fuchsia: fn(
        device: Device,
        get_zircon_handle_info: SemaphoreGetZirconHandleInfoFUCHSIA,
        zircon_handle: zx_handle_t,
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_semaphore_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkImportSemaphoreZirconHandleFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._import_semaphore_zircon_handle_fuchsia)]()[]
        self._get_semaphore_zircon_handle_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreZirconHandleFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._get_semaphore_zircon_handle_fuchsia)]()[]

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
            Ptr(to=import_semaphore_zircon_handle_info).bitcast[ImportSemaphoreZirconHandleInfoFUCHSIA]()[],
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
            Ptr(to=get_zircon_handle_info).bitcast[SemaphoreGetZirconHandleInfoFUCHSIA]()[],
            Ptr(to=zircon_handle).bitcast[zx_handle_t]()[],
        )


struct BufferCollection(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_buffer_collection_fuchsia: fn(
        device: Device,
        create_info: BufferCollectionCreateInfoFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        collection: BufferCollectionFUCHSIA,
    ) -> Result
    var _set_buffer_collection_image_constraints_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        image_constraints_info: ImageConstraintsInfoFUCHSIA,
    ) -> Result
    var _set_buffer_collection_buffer_constraints_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        buffer_constraints_info: BufferConstraintsInfoFUCHSIA,
    ) -> Result
    var _destroy_buffer_collection_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_buffer_collection_properties_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        properties: BufferCollectionPropertiesFUCHSIA,
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_buffer_collection_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkCreateBufferCollectionFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._create_buffer_collection_fuchsia)]()[]
        self._set_buffer_collection_image_constraints_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkSetBufferCollectionImageConstraintsFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._set_buffer_collection_image_constraints_fuchsia)]()[]
        self._set_buffer_collection_buffer_constraints_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkSetBufferCollectionBufferConstraintsFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._set_buffer_collection_buffer_constraints_fuchsia)]()[]
        self._destroy_buffer_collection_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkDestroyBufferCollectionFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._destroy_buffer_collection_fuchsia)]()[]
        self._get_buffer_collection_properties_fuchsia = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferCollectionPropertiesFUCHSIA".unsafe_ptr()
        )).bitcast[type_of(self._get_buffer_collection_properties_fuchsia)]()[]

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
            Ptr(to=create_info).bitcast[BufferCollectionCreateInfoFUCHSIA]()[],
            p_allocator,
            Ptr(to=collection).bitcast[BufferCollectionFUCHSIA]()[],
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
            Ptr(to=image_constraints_info).bitcast[ImageConstraintsInfoFUCHSIA]()[],
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
            Ptr(to=buffer_constraints_info).bitcast[BufferConstraintsInfoFUCHSIA]()[],
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
            device, collection, Ptr(to=properties).bitcast[BufferCollectionPropertiesFUCHSIA]()[]
        )
