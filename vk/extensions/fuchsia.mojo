from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ImagepipeSurface(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_image_pipe_surface: def(
        instance: Instance,
        p_create_info: Ptr[ImagePipeSurfaceCreateInfoFUCHSIA, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_surface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._create_image_pipe_surface = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateImagePipeSurfaceFUCHSIA".as_c_string_slice()
        )).bitcast[type_of(self._create_image_pipe_surface)]()[]

    def create_image_pipe_surface[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        instance: Instance,
        create_info: ImagePipeSurfaceCreateInfoFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut surface: SurfaceKHR,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImagePipeSurfaceFUCHSIA.html
        """
        return self._create_image_pipe_surface(
            instance,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=surface),
        )


struct ExternalMemory(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_zircon_handle: def(
        device: Device,
        p_get_zircon_handle_info: Ptr[MemoryGetZirconHandleInfoFUCHSIA, ImmutAnyOrigin],
        p_zircon_handle: Ptr[zx_handle_t, MutAnyOrigin],
    ) thin abi("C") -> Result
    var _get_memory_zircon_handle_properties: def(
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        zircon_handle: zx_handle_t,
        p_memory_zircon_handle_properties: Ptr[MemoryZirconHandlePropertiesFUCHSIA, MutAnyOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_zircon_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryZirconHandleFUCHSIA".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_zircon_handle)]()[]
        self._get_memory_zircon_handle_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryZirconHandlePropertiesFUCHSIA".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_zircon_handle_properties)]()[]

    def get_memory_zircon_handle(
        self,
        device: Device,
        get_zircon_handle_info: MemoryGetZirconHandleInfoFUCHSIA,
        mut zircon_handle: zx_handle_t,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryZirconHandleFUCHSIA.html
        """
        return self._get_memory_zircon_handle(device, Ptr(to=get_zircon_handle_info), Ptr(to=zircon_handle))

    def get_memory_zircon_handle_properties(
        self,
        device: Device,
        handle_type: ExternalMemoryHandleTypeFlagBits,
        zircon_handle: zx_handle_t,
        mut memory_zircon_handle_properties: MemoryZirconHandlePropertiesFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryZirconHandlePropertiesFUCHSIA.html
        """
        return self._get_memory_zircon_handle_properties(
            device, handle_type, zircon_handle, Ptr(to=memory_zircon_handle_properties)
        )


struct ExternalSemaphore(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _import_semaphore_zircon_handle: def(
        device: Device,
        p_import_semaphore_zircon_handle_info: Ptr[ImportSemaphoreZirconHandleInfoFUCHSIA, ImmutAnyOrigin],
    ) thin abi("C") -> Result
    var _get_semaphore_zircon_handle: def(
        device: Device,
        p_get_zircon_handle_info: Ptr[SemaphoreGetZirconHandleInfoFUCHSIA, ImmutAnyOrigin],
        p_zircon_handle: Ptr[zx_handle_t, MutAnyOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._import_semaphore_zircon_handle = Ptr(to=get_device_proc_addr(
            device, "vkImportSemaphoreZirconHandleFUCHSIA".as_c_string_slice()
        )).bitcast[type_of(self._import_semaphore_zircon_handle)]()[]
        self._get_semaphore_zircon_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreZirconHandleFUCHSIA".as_c_string_slice()
        )).bitcast[type_of(self._get_semaphore_zircon_handle)]()[]

    def import_semaphore_zircon_handle(
        self,
        device: Device,
        import_semaphore_zircon_handle_info: ImportSemaphoreZirconHandleInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkImportSemaphoreZirconHandleFUCHSIA.html
        """
        return self._import_semaphore_zircon_handle(device, Ptr(to=import_semaphore_zircon_handle_info))

    def get_semaphore_zircon_handle(
        self,
        device: Device,
        get_zircon_handle_info: SemaphoreGetZirconHandleInfoFUCHSIA,
        mut zircon_handle: zx_handle_t,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreZirconHandleFUCHSIA.html
        """
        return self._get_semaphore_zircon_handle(
            device, Ptr(to=get_zircon_handle_info), Ptr(to=zircon_handle)
        )


struct BufferCollection(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_buffer_collection: def(
        device: Device,
        p_create_info: Ptr[BufferCollectionCreateInfoFUCHSIA, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_collection: Ptr[BufferCollectionFUCHSIA, MutAnyOrigin],
    ) thin abi("C") -> Result
    var _set_buffer_collection_image_constraints: def(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        p_image_constraints_info: Ptr[ImageConstraintsInfoFUCHSIA, ImmutAnyOrigin],
    ) thin abi("C") -> Result
    var _set_buffer_collection_buffer_constraints: def(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        p_buffer_constraints_info: Ptr[BufferConstraintsInfoFUCHSIA, ImmutAnyOrigin],
    ) thin abi("C") -> Result
    var _destroy_buffer_collection: def(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ) thin abi("C")
    var _get_buffer_collection_properties: def(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        p_properties: Ptr[BufferCollectionPropertiesFUCHSIA, MutAnyOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_buffer_collection = Ptr(to=get_device_proc_addr(
            device, "vkCreateBufferCollectionFUCHSIA".as_c_string_slice()
        )).bitcast[type_of(self._create_buffer_collection)]()[]
        self._set_buffer_collection_image_constraints = Ptr(to=get_device_proc_addr(
            device, "vkSetBufferCollectionImageConstraintsFUCHSIA".as_c_string_slice()
        )).bitcast[type_of(self._set_buffer_collection_image_constraints)]()[]
        self._set_buffer_collection_buffer_constraints = Ptr(to=get_device_proc_addr(
            device, "vkSetBufferCollectionBufferConstraintsFUCHSIA".as_c_string_slice()
        )).bitcast[type_of(self._set_buffer_collection_buffer_constraints)]()[]
        self._destroy_buffer_collection = Ptr(to=get_device_proc_addr(
            device, "vkDestroyBufferCollectionFUCHSIA".as_c_string_slice()
        )).bitcast[type_of(self._destroy_buffer_collection)]()[]
        self._get_buffer_collection_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferCollectionPropertiesFUCHSIA".as_c_string_slice()
        )).bitcast[type_of(self._get_buffer_collection_properties)]()[]

    def create_buffer_collection[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: BufferCollectionCreateInfoFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut collection: BufferCollectionFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferCollectionFUCHSIA.html
        """
        return self._create_buffer_collection(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=collection),
        )

    def set_buffer_collection_image_constraints(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        image_constraints_info: ImageConstraintsInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetBufferCollectionImageConstraintsFUCHSIA.html
        """
        return self._set_buffer_collection_image_constraints(
            device, collection, Ptr(to=image_constraints_info)
        )

    def set_buffer_collection_buffer_constraints(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        buffer_constraints_info: BufferConstraintsInfoFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetBufferCollectionBufferConstraintsFUCHSIA.html
        """
        return self._set_buffer_collection_buffer_constraints(
            device, collection, Ptr(to=buffer_constraints_info)
        )

    def destroy_buffer_collection[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferCollectionFUCHSIA.html
        """
        return self._destroy_buffer_collection(
            device, collection, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    def get_buffer_collection_properties(
        self,
        device: Device,
        collection: BufferCollectionFUCHSIA,
        mut properties: BufferCollectionPropertiesFUCHSIA,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferCollectionPropertiesFUCHSIA.html
        """
        return self._get_buffer_collection_properties(device, collection, Ptr(to=properties))
