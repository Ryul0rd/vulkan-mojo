from vk.core_functions import GlobalFunctions


struct Tensors(Copyable):    var _vk_create_tensor_arm: fn(
        device: Device,
        pCreateInfo: Ptr[TensorCreateInfoARM, MutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
        pTensor: Ptr[TensorARM, MutOrigin.external],
    ) -> Result
    var _vk_destroy_tensor_arm: fn(
        device: Device, tensor: TensorARM, pAllocator: Ptr[AllocationCallbacks, MutOrigin.external]
    )
    var _vk_create_tensor_view_arm: fn(
        device: Device,
        pCreateInfo: Ptr[TensorViewCreateInfoARM, MutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
        pView: Ptr[TensorViewARM, MutOrigin.external],
    ) -> Result
    var _vk_destroy_tensor_view_arm: fn(
        device: Device,
        tensorView: TensorViewARM,
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
    )
    var _vk_get_tensor_memory_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[TensorMemoryRequirementsInfoARM, MutOrigin.external],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutOrigin.external],
    )
    var _vk_bind_tensor_memory_arm: fn(
        device: Device,
        bindInfoCount: UInt32,
        pBindInfos: Ptr[BindTensorMemoryInfoARM, MutOrigin.external],
    ) -> Result
    var _vk_get_device_tensor_memory_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[DeviceTensorMemoryRequirementsARM, MutOrigin.external],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutOrigin.external],
    )
    var _vk_cmd_copy_tensor_arm: fn(
        commandBuffer: CommandBuffer, pCopyTensorInfo: Ptr[CopyTensorInfoARM, MutOrigin.external]
    )
    var _vk_get_physical_device_external_tensor_properties_arm: fn(
        physicalDevice: PhysicalDevice,
        pExternalTensorInfo: Ptr[PhysicalDeviceExternalTensorInfoARM, MutOrigin.external],
        pExternalTensorProperties: Ptr[ExternalTensorPropertiesARM, MutOrigin.external],
    )
    var _vk_get_tensor_opaque_capture_descriptor_data_arm: fn(
        device: Device,
        pInfo: Ptr[TensorCaptureDescriptorDataInfoARM, MutOrigin.external],
        pData: Ptr[NoneType, MutOrigin.external],
    ) -> Result
    var _vk_get_tensor_view_opaque_capture_descriptor_data_arm: fn(
        device: Device,
        pInfo: Ptr[TensorViewCaptureDescriptorDataInfoARM, MutOrigin.external],
        pData: Ptr[NoneType, MutOrigin.external],
    ) -> Result


struct DataGraph(Copyable):    var _vk_create_data_graph_pipelines_arm: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pipelineCache: PipelineCache,
        createInfoCount: UInt32,
        pCreateInfos: Ptr[DataGraphPipelineCreateInfoARM, MutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
        pPipelines: Ptr[Pipeline, MutOrigin.external],
    ) -> Result
    var _vk_create_data_graph_pipeline_session_arm: fn(
        device: Device,
        pCreateInfo: Ptr[DataGraphPipelineSessionCreateInfoARM, MutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
        pSession: Ptr[DataGraphPipelineSessionARM, MutOrigin.external],
    ) -> Result
    var _vk_get_data_graph_pipeline_session_bind_point_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[DataGraphPipelineSessionBindPointRequirementsInfoARM, MutOrigin.external],
        pBindPointRequirementCount: Ptr[UInt32, MutOrigin.external],
        pBindPointRequirements: Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutOrigin.external],
    ) -> Result
    var _vk_get_data_graph_pipeline_session_memory_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[DataGraphPipelineSessionMemoryRequirementsInfoARM, MutOrigin.external],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutOrigin.external],
    )
    var _vk_bind_data_graph_pipeline_session_memory_arm: fn(
        device: Device,
        bindInfoCount: UInt32,
        pBindInfos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM, MutOrigin.external],
    ) -> Result
    var _vk_destroy_data_graph_pipeline_session_arm: fn(
        device: Device,
        session: DataGraphPipelineSessionARM,
        pAllocator: Ptr[AllocationCallbacks, MutOrigin.external],
    )
    var _vk_cmd_dispatch_data_graph_arm: fn(
        commandBuffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        pInfo: Ptr[DataGraphPipelineDispatchInfoARM, MutOrigin.external],
    )
    var _vk_get_data_graph_pipeline_available_properties_arm: fn(
        device: Device,
        pPipelineInfo: Ptr[DataGraphPipelineInfoARM, MutOrigin.external],
        pPropertiesCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[DataGraphPipelinePropertyARM, MutOrigin.external],
    ) -> Result
    var _vk_get_data_graph_pipeline_properties_arm: fn(
        device: Device,
        pPipelineInfo: Ptr[DataGraphPipelineInfoARM, MutOrigin.external],
        propertiesCount: UInt32,
        pProperties: Ptr[DataGraphPipelinePropertyQueryResultARM, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_queue_family_data_graph_properties_arm: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        pQueueFamilyDataGraphPropertyCount: Ptr[UInt32, MutOrigin.external],
        pQueueFamilyDataGraphProperties: Ptr[QueueFamilyDataGraphPropertiesARM, MutOrigin.external],
    ) -> Result
    var _vk_get_physical_device_queue_family_data_graph_processing_engine_properties_arm: fn(
        physicalDevice: PhysicalDevice,
        pQueueFamilyDataGraphProcessingEngineInfo: Ptr[PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM, MutOrigin.external],
        pQueueFamilyDataGraphProcessingEngineProperties: Ptr[QueueFamilyDataGraphProcessingEnginePropertiesARM, MutOrigin.external],
    )
