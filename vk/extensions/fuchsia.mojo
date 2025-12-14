from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct ImagepipeSurface(Copyable):    var _vk_create_image_pipe_surface_fuchsia: fn(
        instance: Instance,
        pCreateInfo: Ptr[ImagePipeSurfaceCreateInfoFUCHSIA, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSurface: Ptr[SurfaceKHR, MutAnyOrigin],
    ) -> Result


struct ExternalMemory(Copyable):    var _vk_get_memory_zircon_handle_fuchsia: fn(
        device: Device,
        pGetZirconHandleInfo: Ptr[MemoryGetZirconHandleInfoFUCHSIA, ImmutAnyOrigin],
        pZirconHandle: Ptr[zx_handle_t, MutAnyOrigin],
    ) -> Result
    var _vk_get_memory_zircon_handle_properties_fuchsia: fn(
        device: Device,
        handleType: ExternalMemoryHandleTypeFlagBits,
        zirconHandle: zx_handle_t,
        pMemoryZirconHandleProperties: Ptr[MemoryZirconHandlePropertiesFUCHSIA, MutAnyOrigin],
    ) -> Result


struct ExternalSemaphore(Copyable):    var _vk_import_semaphore_zircon_handle_fuchsia: fn(
        device: Device,
        pImportSemaphoreZirconHandleInfo: Ptr[ImportSemaphoreZirconHandleInfoFUCHSIA, ImmutAnyOrigin],
    ) -> Result
    var _vk_get_semaphore_zircon_handle_fuchsia: fn(
        device: Device,
        pGetZirconHandleInfo: Ptr[SemaphoreGetZirconHandleInfoFUCHSIA, ImmutAnyOrigin],
        pZirconHandle: Ptr[zx_handle_t, MutAnyOrigin],
    ) -> Result


struct BufferCollection(Copyable):    var _vk_create_buffer_collection_fuchsia: fn(
        device: Device,
        pCreateInfo: Ptr[BufferCollectionCreateInfoFUCHSIA, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pCollection: Ptr[BufferCollectionFUCHSIA, MutAnyOrigin],
    ) -> Result
    var _vk_set_buffer_collection_image_constraints_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pImageConstraintsInfo: Ptr[ImageConstraintsInfoFUCHSIA, ImmutAnyOrigin],
    ) -> Result
    var _vk_set_buffer_collection_buffer_constraints_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pBufferConstraintsInfo: Ptr[BufferConstraintsInfoFUCHSIA, ImmutAnyOrigin],
    ) -> Result
    var _vk_destroy_buffer_collection_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_get_buffer_collection_properties_fuchsia: fn(
        device: Device,
        collection: BufferCollectionFUCHSIA,
        pProperties: Ptr[BufferCollectionPropertiesFUCHSIA, MutAnyOrigin],
    ) -> Result
