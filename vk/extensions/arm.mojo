from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct Tensors(Copyable):    var _vk_create_tensor_arm: fn(
        device: Device,
        pCreateInfo: Ptr[TensorCreateInfoARM, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pTensor: Ptr[TensorARM, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_tensor_arm: fn(
        device: Device, tensor: TensorARM, pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _vk_create_tensor_view_arm: fn(
        device: Device,
        pCreateInfo: Ptr[TensorViewCreateInfoARM, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pView: Ptr[TensorViewARM, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_tensor_view_arm: fn(
        device: Device,
        tensorView: TensorViewARM,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_get_tensor_memory_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[TensorMemoryRequirementsInfoARM, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _vk_bind_tensor_memory_arm: fn(
        device: Device,
        bindInfoCount: UInt32,
        pBindInfos: Ptr[BindTensorMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result
    var _vk_get_device_tensor_memory_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[DeviceTensorMemoryRequirementsARM, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _vk_cmd_copy_tensor_arm: fn(
        commandBuffer: CommandBuffer, pCopyTensorInfo: Ptr[CopyTensorInfoARM, ImmutAnyOrigin]
    )
    var _vk_get_physical_device_external_tensor_properties_arm: fn(
        physicalDevice: PhysicalDevice,
        pExternalTensorInfo: Ptr[PhysicalDeviceExternalTensorInfoARM, ImmutAnyOrigin],
        pExternalTensorProperties: Ptr[ExternalTensorPropertiesARM, MutAnyOrigin],
    )
    var _vk_get_tensor_opaque_capture_descriptor_data_arm: fn(
        device: Device,
        pInfo: Ptr[TensorCaptureDescriptorDataInfoARM, ImmutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_get_tensor_view_opaque_capture_descriptor_data_arm: fn(
        device: Device,
        pInfo: Ptr[TensorViewCaptureDescriptorDataInfoARM, ImmutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result


struct DataGraph(Copyable):    var _vk_create_data_graph_pipelines_arm: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pipelineCache: PipelineCache,
        createInfoCount: UInt32,
        pCreateInfos: Ptr[DataGraphPipelineCreateInfoARM, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pPipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _vk_create_data_graph_pipeline_session_arm: fn(
        device: Device,
        pCreateInfo: Ptr[DataGraphPipelineSessionCreateInfoARM, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSession: Ptr[DataGraphPipelineSessionARM, MutAnyOrigin],
    ) -> Result
    var _vk_get_data_graph_pipeline_session_bind_point_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[DataGraphPipelineSessionBindPointRequirementsInfoARM, ImmutAnyOrigin],
        pBindPointRequirementCount: Ptr[UInt32, MutAnyOrigin],
        pBindPointRequirements: Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutAnyOrigin],
    ) -> Result
    var _vk_get_data_graph_pipeline_session_memory_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[DataGraphPipelineSessionMemoryRequirementsInfoARM, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _vk_bind_data_graph_pipeline_session_memory_arm: fn(
        device: Device,
        bindInfoCount: UInt32,
        pBindInfos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result
    var _vk_destroy_data_graph_pipeline_session_arm: fn(
        device: Device,
        session: DataGraphPipelineSessionARM,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_cmd_dispatch_data_graph_arm: fn(
        commandBuffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        pInfo: Ptr[DataGraphPipelineDispatchInfoARM, ImmutAnyOrigin],
    )
    var _vk_get_data_graph_pipeline_available_properties_arm: fn(
        device: Device,
        pPipelineInfo: Ptr[DataGraphPipelineInfoARM, ImmutAnyOrigin],
        pPropertiesCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[DataGraphPipelinePropertyARM, MutAnyOrigin],
    ) -> Result
    var _vk_get_data_graph_pipeline_properties_arm: fn(
        device: Device,
        pPipelineInfo: Ptr[DataGraphPipelineInfoARM, ImmutAnyOrigin],
        propertiesCount: UInt32,
        pProperties: Ptr[DataGraphPipelinePropertyQueryResultARM, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_queue_family_data_graph_properties_arm: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        pQueueFamilyDataGraphPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pQueueFamilyDataGraphProperties: Ptr[QueueFamilyDataGraphPropertiesARM, MutAnyOrigin],
    ) -> Result
    var _vk_get_physical_device_queue_family_data_graph_processing_engine_properties_arm: fn(
        physicalDevice: PhysicalDevice,
        pQueueFamilyDataGraphProcessingEngineInfo: Ptr[PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM, ImmutAnyOrigin],
        pQueueFamilyDataGraphProcessingEngineProperties: Ptr[QueueFamilyDataGraphProcessingEnginePropertiesARM, MutAnyOrigin],
    )
