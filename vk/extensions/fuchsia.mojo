from vk.core_functions import GlobalFunctions


struct ImagepipeSurface(Copyable):    var _vk_create_image_pipe_surface_fuchsia: fn(
        instance: Instance,
        pCreateInfo: Ptr[ImagePipeSurfaceCreateInfoFUCHSIA, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pSurface: Ptr[SurfaceKHR, MutOrigin.external],
    ) -> Result


struct ExternalMemory(Copyable):    var _vk_get_memory_zircon_handle_fuchsia: fn(
        device: Device,
        pGetZirconHandleInfo: Ptr[MemoryGetZirconHandleInfoFUCHSIA, ImmutOrigin.external],
        pZirconHandle: Ptr[zx_handle_t, MutOrigin.external],
    ) -> Result
    var _vk_get_memory_zircon_handle_properties_fuchsia: fn(
        device: Device,
        handleType: ExternalMemoryHandleTypeFlagBits,
        zirconHandle: zx_handle_t,
        pMemoryZirconHandleProperties: Ptr[MemoryZirconHandlePropertiesFUCHSIA, MutOrigin.external],
    ) -> Result


struct ExternalSemaphore(Copyable):    var _vk_import_semaphore_zircon_handle_fuchsia: fn(
        device: Device,
        pImportSemaphoreZirconHandleInfo: Ptr[ImportSemaphoreZirconHandleInfoFUCHSIA, ImmutOrigin.external],
    ) -> Result
    var _vk_get_semaphore_zircon_handle_fuchsia: fn(
        device: Device,
        pGetZirconHandleInfo: Ptr[SemaphoreGetZirconHandleInfoFUCHSIA, ImmutOrigin.external],
        pZirconHandle: Ptr[zx_handle_t, MutOrigin.external],
    ) -> Result


struct BufferCollection(Copyable):    var _vk_create_buffer_collection_fuchsia: fn(
        device: Device,
        pCreateInfo: Ptr[BufferCollectionCreateInfoFUCHSIA, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pCollection: Ptr[BufferCollectionFUCHSIA, MutOrigin.external],
    ) -> Result
    var _vk_set_buffer_collection_image_constraints_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pImageConstraintsInfo: Ptr[ImageConstraintsInfoFUCHSIA, ImmutOrigin.external],
    ) -> Result
    var _vk_set_buffer_collection_buffer_constraints_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pBufferConstraintsInfo: Ptr[BufferConstraintsInfoFUCHSIA, ImmutOrigin.external],
    ) -> Result
    var _vk_destroy_buffer_collection_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
    )
    var _vk_get_buffer_collection_properties_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pProperties: Ptr[BufferCollectionPropertiesFUCHSIA, MutOrigin.external],
    ) -> Result
