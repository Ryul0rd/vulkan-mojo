from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct Tensors(Copyable):
    var _create_tensor_arm: fn(
        device: Device,
        pCreateInfo: Ptr[TensorCreateInfoARM, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pTensor: Ptr[TensorARM, MutAnyOrigin],
    ) -> Result
    var _destroy_tensor_arm: fn(
        device: Device, tensor: TensorARM, pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _create_tensor_view_arm: fn(
        device: Device,
        pCreateInfo: Ptr[TensorViewCreateInfoARM, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pView: Ptr[TensorViewARM, MutAnyOrigin],
    ) -> Result
    var _destroy_tensor_view_arm: fn(
        device: Device,
        tensorView: TensorViewARM,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_tensor_memory_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[TensorMemoryRequirementsInfoARM, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _bind_tensor_memory_arm: fn(
        device: Device,
        bindInfoCount: UInt32,
        pBindInfos: Ptr[BindTensorMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result
    var _get_device_tensor_memory_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[DeviceTensorMemoryRequirementsARM, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _cmd_copy_tensor_arm: fn(
        commandBuffer: CommandBuffer, pCopyTensorInfo: Ptr[CopyTensorInfoARM, ImmutAnyOrigin]
    )
    var _get_physical_device_external_tensor_properties_arm: fn(
        physicalDevice: PhysicalDevice,
        pExternalTensorInfo: Ptr[PhysicalDeviceExternalTensorInfoARM, ImmutAnyOrigin],
        pExternalTensorProperties: Ptr[ExternalTensorPropertiesARM, MutAnyOrigin],
    )
    var _get_tensor_opaque_capture_descriptor_data_arm: fn(
        device: Device,
        pInfo: Ptr[TensorCaptureDescriptorDataInfoARM, ImmutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_tensor_view_opaque_capture_descriptor_data_arm: fn(
        device: Device,
        pInfo: Ptr[TensorViewCaptureDescriptorDataInfoARM, ImmutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.borrow_handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_tensor_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateTensorARM".unsafe_ptr()
        )).bitcast[type_of(self._create_tensor_arm)]()[]
        self._destroy_tensor_arm = Ptr(to=get_device_proc_addr(
            device, "vkDestroyTensorARM".unsafe_ptr()
        )).bitcast[type_of(self._destroy_tensor_arm)]()[]
        self._create_tensor_view_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateTensorViewARM".unsafe_ptr()
        )).bitcast[type_of(self._create_tensor_view_arm)]()[]
        self._destroy_tensor_view_arm = Ptr(to=get_device_proc_addr(
            device, "vkDestroyTensorViewARM".unsafe_ptr()
        )).bitcast[type_of(self._destroy_tensor_view_arm)]()[]
        self._get_tensor_memory_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorMemoryRequirementsARM".unsafe_ptr()
        )).bitcast[type_of(self._get_tensor_memory_requirements_arm)]()[]
        self._bind_tensor_memory_arm = Ptr(to=get_device_proc_addr(
            device, "vkBindTensorMemoryARM".unsafe_ptr()
        )).bitcast[type_of(self._bind_tensor_memory_arm)]()[]
        self._get_device_tensor_memory_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceTensorMemoryRequirementsARM".unsafe_ptr()
        )).bitcast[type_of(self._get_device_tensor_memory_requirements_arm)]()[]
        self._cmd_copy_tensor_arm = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyTensorARM".unsafe_ptr()
        )).bitcast[type_of(self._cmd_copy_tensor_arm)]()[]
        self._get_physical_device_external_tensor_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceExternalTensorPropertiesARM".unsafe_ptr()
        )).bitcast[type_of(self._get_physical_device_external_tensor_properties_arm)]()[]
        self._get_tensor_opaque_capture_descriptor_data_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorOpaqueCaptureDescriptorDataARM".unsafe_ptr()
        )).bitcast[type_of(self._get_tensor_opaque_capture_descriptor_data_arm)]()[]
        self._get_tensor_view_opaque_capture_descriptor_data_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorViewOpaqueCaptureDescriptorDataARM".unsafe_ptr()
        )).bitcast[type_of(self._get_tensor_view_opaque_capture_descriptor_data_arm)]()[]

    fn create_tensor_arm(
        self,
        device: Device,
        create_info: TensorCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut tensor: TensorARM,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateTensorARM.html
        """
        return self._create_tensor_arm(
            device,
            Ptr(to=create_info).bitcast[TensorCreateInfoARM](),
            p_allocator,
            Ptr(to=tensor).bitcast[TensorARM](),
        )

    fn destroy_tensor_arm(
        self,
        device: Device,
        tensor: TensorARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyTensorARM.html
        """
        return self._destroy_tensor_arm(device, tensor, p_allocator)

    fn create_tensor_view_arm(
        self,
        device: Device,
        create_info: TensorViewCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: TensorViewARM,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateTensorViewARM.html
        """
        return self._create_tensor_view_arm(
            device,
            Ptr(to=create_info).bitcast[TensorViewCreateInfoARM](),
            p_allocator,
            Ptr(to=view).bitcast[TensorViewARM](),
        )

    fn destroy_tensor_view_arm(
        self,
        device: Device,
        tensor_view: TensorViewARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyTensorViewARM.html
        """
        return self._destroy_tensor_view_arm(device, tensor_view, p_allocator)

    fn get_tensor_memory_requirements_arm(
        self,
        device: Device,
        info: TensorMemoryRequirementsInfoARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorMemoryRequirementsARM.html
        """
        return self._get_tensor_memory_requirements_arm(
            device,
            Ptr(to=info).bitcast[TensorMemoryRequirementsInfoARM](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn bind_tensor_memory_arm(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindTensorMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindTensorMemoryARM.html
        """
        return self._bind_tensor_memory_arm(device, bind_info_count, p_bind_infos)

    fn get_device_tensor_memory_requirements_arm(
        self,
        device: Device,
        info: DeviceTensorMemoryRequirementsARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceTensorMemoryRequirementsARM.html
        """
        return self._get_device_tensor_memory_requirements_arm(
            device,
            Ptr(to=info).bitcast[DeviceTensorMemoryRequirementsARM](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn cmd_copy_tensor_arm(
        self, command_buffer: CommandBuffer, copy_tensor_info: CopyTensorInfoARM
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyTensorARM.html
        """
        return self._cmd_copy_tensor_arm(
            command_buffer, Ptr(to=copy_tensor_info).bitcast[CopyTensorInfoARM]()
        )

    fn get_physical_device_external_tensor_properties_arm(
        self,
        physical_device: PhysicalDevice,
        external_tensor_info: PhysicalDeviceExternalTensorInfoARM,
        mut external_tensor_properties: ExternalTensorPropertiesARM,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalTensorPropertiesARM.html
        """
        return self._get_physical_device_external_tensor_properties_arm(
            physical_device,
            Ptr(to=external_tensor_info).bitcast[PhysicalDeviceExternalTensorInfoARM](),
            Ptr(to=external_tensor_properties).bitcast[ExternalTensorPropertiesARM](),
        )

    fn get_tensor_opaque_capture_descriptor_data_arm(
        self, device: Device, info: TensorCaptureDescriptorDataInfoARM, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorOpaqueCaptureDescriptorDataARM.html
        """
        return self._get_tensor_opaque_capture_descriptor_data_arm(
            device,
            Ptr(to=info).bitcast[TensorCaptureDescriptorDataInfoARM](),
            Ptr(to=data).bitcast[NoneType](),
        )

    fn get_tensor_view_opaque_capture_descriptor_data_arm(
        self, device: Device, info: TensorViewCaptureDescriptorDataInfoARM, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorViewOpaqueCaptureDescriptorDataARM.html
        """
        return self._get_tensor_view_opaque_capture_descriptor_data_arm(
            device,
            Ptr(to=info).bitcast[TensorViewCaptureDescriptorDataInfoARM](),
            Ptr(to=data).bitcast[NoneType](),
        )


struct DataGraph(Copyable):
    var _create_data_graph_pipelines_arm: fn(
        device: Device,
        deferredOperation: DeferredOperationKHR,
        pipelineCache: PipelineCache,
        createInfoCount: UInt32,
        pCreateInfos: Ptr[DataGraphPipelineCreateInfoARM, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pPipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _create_data_graph_pipeline_session_arm: fn(
        device: Device,
        pCreateInfo: Ptr[DataGraphPipelineSessionCreateInfoARM, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSession: Ptr[DataGraphPipelineSessionARM, MutAnyOrigin],
    ) -> Result
    var _get_data_graph_pipeline_session_bind_point_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[DataGraphPipelineSessionBindPointRequirementsInfoARM, ImmutAnyOrigin],
        pBindPointRequirementCount: Ptr[UInt32, MutAnyOrigin],
        pBindPointRequirements: Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutAnyOrigin],
    ) -> Result
    var _get_data_graph_pipeline_session_memory_requirements_arm: fn(
        device: Device,
        pInfo: Ptr[DataGraphPipelineSessionMemoryRequirementsInfoARM, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _bind_data_graph_pipeline_session_memory_arm: fn(
        device: Device,
        bindInfoCount: UInt32,
        pBindInfos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result
    var _destroy_data_graph_pipeline_session_arm: fn(
        device: Device,
        session: DataGraphPipelineSessionARM,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _cmd_dispatch_data_graph_arm: fn(
        commandBuffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        pInfo: Ptr[DataGraphPipelineDispatchInfoARM, ImmutAnyOrigin],
    )
    var _get_data_graph_pipeline_available_properties_arm: fn(
        device: Device,
        pPipelineInfo: Ptr[DataGraphPipelineInfoARM, ImmutAnyOrigin],
        pPropertiesCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[DataGraphPipelinePropertyARM, MutAnyOrigin],
    ) -> Result
    var _get_data_graph_pipeline_properties_arm: fn(
        device: Device,
        pPipelineInfo: Ptr[DataGraphPipelineInfoARM, ImmutAnyOrigin],
        propertiesCount: UInt32,
        pProperties: Ptr[DataGraphPipelinePropertyQueryResultARM, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_queue_family_data_graph_properties_arm: fn(
        physicalDevice: PhysicalDevice,
        queueFamilyIndex: UInt32,
        pQueueFamilyDataGraphPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pQueueFamilyDataGraphProperties: Ptr[QueueFamilyDataGraphPropertiesARM, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_queue_family_data_graph_processing_engine_properties_arm: fn(
        physicalDevice: PhysicalDevice,
        pQueueFamilyDataGraphProcessingEngineInfo: Ptr[PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM, ImmutAnyOrigin],
        pQueueFamilyDataGraphProcessingEngineProperties: Ptr[QueueFamilyDataGraphProcessingEnginePropertiesARM, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.borrow_handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_data_graph_pipelines_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateDataGraphPipelinesARM".unsafe_ptr()
        )).bitcast[type_of(self._create_data_graph_pipelines_arm)]()[]
        self._create_data_graph_pipeline_session_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateDataGraphPipelineSessionARM".unsafe_ptr()
        )).bitcast[type_of(self._create_data_graph_pipeline_session_arm)]()[]
        self._get_data_graph_pipeline_session_bind_point_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineSessionBindPointRequirementsARM".unsafe_ptr()
        )).bitcast[type_of(self._get_data_graph_pipeline_session_bind_point_requirements_arm)]()[]
        self._get_data_graph_pipeline_session_memory_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineSessionMemoryRequirementsARM".unsafe_ptr()
        )).bitcast[type_of(self._get_data_graph_pipeline_session_memory_requirements_arm)]()[]
        self._bind_data_graph_pipeline_session_memory_arm = Ptr(to=get_device_proc_addr(
            device, "vkBindDataGraphPipelineSessionMemoryARM".unsafe_ptr()
        )).bitcast[type_of(self._bind_data_graph_pipeline_session_memory_arm)]()[]
        self._destroy_data_graph_pipeline_session_arm = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDataGraphPipelineSessionARM".unsafe_ptr()
        )).bitcast[type_of(self._destroy_data_graph_pipeline_session_arm)]()[]
        self._cmd_dispatch_data_graph_arm = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchDataGraphARM".unsafe_ptr()
        )).bitcast[type_of(self._cmd_dispatch_data_graph_arm)]()[]
        self._get_data_graph_pipeline_available_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineAvailablePropertiesARM".unsafe_ptr()
        )).bitcast[type_of(self._get_data_graph_pipeline_available_properties_arm)]()[]
        self._get_data_graph_pipeline_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelinePropertiesARM".unsafe_ptr()
        )).bitcast[type_of(self._get_data_graph_pipeline_properties_arm)]()[]
        self._get_physical_device_queue_family_data_graph_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM".unsafe_ptr()
        )).bitcast[type_of(self._get_physical_device_queue_family_data_graph_properties_arm)]()[]
        self._get_physical_device_queue_family_data_graph_processing_engine_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM".unsafe_ptr()
        )).bitcast[type_of(self._get_physical_device_queue_family_data_graph_processing_engine_properties_arm)]()[]

    fn create_data_graph_pipelines_arm(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[DataGraphPipelineCreateInfoARM, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDataGraphPipelinesARM.html
        """
        return self._create_data_graph_pipelines_arm(
            device,
            deferred_operation,
            pipeline_cache,
            create_info_count,
            p_create_infos,
            p_allocator,
            p_pipelines,
        )

    fn create_data_graph_pipeline_session_arm(
        self,
        device: Device,
        create_info: DataGraphPipelineSessionCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut session: DataGraphPipelineSessionARM,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDataGraphPipelineSessionARM.html
        """
        return self._create_data_graph_pipeline_session_arm(
            device,
            Ptr(to=create_info).bitcast[DataGraphPipelineSessionCreateInfoARM](),
            p_allocator,
            Ptr(to=session).bitcast[DataGraphPipelineSessionARM](),
        )

    fn get_data_graph_pipeline_session_bind_point_requirements_arm(
        self,
        device: Device,
        info: DataGraphPipelineSessionBindPointRequirementsInfoARM,
        mut bind_point_requirement_count: UInt32,
        p_bind_point_requirements: Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineSessionBindPointRequirementsARM.html
        """
        return self._get_data_graph_pipeline_session_bind_point_requirements_arm(
            device,
            Ptr(to=info).bitcast[DataGraphPipelineSessionBindPointRequirementsInfoARM](),
            Ptr(to=bind_point_requirement_count).bitcast[UInt32](),
            p_bind_point_requirements,
        )

    fn get_data_graph_pipeline_session_bind_point_requirements_arm(
        self, device: Device, info: DataGraphPipelineSessionBindPointRequirementsInfoARM
    ) -> ListResult[DataGraphPipelineSessionBindPointRequirementARM]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineSessionBindPointRequirementsARM.html
        """
        var list = List[DataGraphPipelineSessionBindPointRequirementARM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_data_graph_pipeline_session_bind_point_requirements_arm(
                device,
                info,
                count,
                Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutAnyOrigin](),
            )
        if result == Result.SUCCESS and count > 0:
            list.reserve(Int(count))
            result = self.get_data_graph_pipeline_session_bind_point_requirements_arm(
                device, info, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_data_graph_pipeline_session_memory_requirements_arm(
        self,
        device: Device,
        info: DataGraphPipelineSessionMemoryRequirementsInfoARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineSessionMemoryRequirementsARM.html
        """
        return self._get_data_graph_pipeline_session_memory_requirements_arm(
            device,
            Ptr(to=info).bitcast[DataGraphPipelineSessionMemoryRequirementsInfoARM](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2](),
        )

    fn bind_data_graph_pipeline_session_memory_arm(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindDataGraphPipelineSessionMemoryARM.html
        """
        return self._bind_data_graph_pipeline_session_memory_arm(
            device, bind_info_count, p_bind_infos
        )

    fn destroy_data_graph_pipeline_session_arm(
        self,
        device: Device,
        session: DataGraphPipelineSessionARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDataGraphPipelineSessionARM.html
        """
        return self._destroy_data_graph_pipeline_session_arm(device, session, p_allocator)

    fn cmd_dispatch_data_graph_arm(
        self,
        command_buffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        p_info: Ptr[DataGraphPipelineDispatchInfoARM, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchDataGraphARM.html
        """
        return self._cmd_dispatch_data_graph_arm(command_buffer, session, p_info)

    fn get_data_graph_pipeline_available_properties_arm(
        self,
        device: Device,
        pipeline_info: DataGraphPipelineInfoARM,
        mut properties_count: UInt32,
        p_properties: Ptr[DataGraphPipelinePropertyARM, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineAvailablePropertiesARM.html
        """
        return self._get_data_graph_pipeline_available_properties_arm(
            device,
            Ptr(to=pipeline_info).bitcast[DataGraphPipelineInfoARM](),
            Ptr(to=properties_count).bitcast[UInt32](),
            p_properties,
        )

    fn get_data_graph_pipeline_available_properties_arm(
        self, device: Device, pipeline_info: DataGraphPipelineInfoARM
    ) -> ListResult[DataGraphPipelinePropertyARM]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineAvailablePropertiesARM.html
        """
        var list = List[DataGraphPipelinePropertyARM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_data_graph_pipeline_available_properties_arm(
                device, pipeline_info, count, Ptr[DataGraphPipelinePropertyARM, MutAnyOrigin]()
            )
        if result == Result.SUCCESS and count > 0:
            list.reserve(Int(count))
            result = self.get_data_graph_pipeline_available_properties_arm(
                device, pipeline_info, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_data_graph_pipeline_properties_arm(
        self,
        device: Device,
        pipeline_info: DataGraphPipelineInfoARM,
        properties_count: UInt32,
        p_properties: Ptr[DataGraphPipelinePropertyQueryResultARM, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelinePropertiesARM.html
        """
        return self._get_data_graph_pipeline_properties_arm(
            device,
            Ptr(to=pipeline_info).bitcast[DataGraphPipelineInfoARM](),
            properties_count,
            p_properties,
        )

    fn get_physical_device_queue_family_data_graph_properties_arm(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut queue_family_data_graph_property_count: UInt32,
        p_queue_family_data_graph_properties: Ptr[QueueFamilyDataGraphPropertiesARM, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM.html
        """
        return self._get_physical_device_queue_family_data_graph_properties_arm(
            physical_device,
            queue_family_index,
            Ptr(to=queue_family_data_graph_property_count).bitcast[UInt32](),
            p_queue_family_data_graph_properties,
        )

    fn get_physical_device_queue_family_data_graph_properties_arm(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32
    ) -> ListResult[QueueFamilyDataGraphPropertiesARM]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM.html
        """
        var list = List[QueueFamilyDataGraphPropertiesARM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_queue_family_data_graph_properties_arm(
                physical_device,
                queue_family_index,
                count,
                Ptr[QueueFamilyDataGraphPropertiesARM, MutAnyOrigin](),
            )
        if result == Result.SUCCESS and count > 0:
            list.reserve(Int(count))
            result = self.get_physical_device_queue_family_data_graph_properties_arm(
                physical_device, queue_family_index, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_queue_family_data_graph_processing_engine_properties_arm(
        self,
        physical_device: PhysicalDevice,
        queue_family_data_graph_processing_engine_info: PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM,
        mut queue_family_data_graph_processing_engine_properties: QueueFamilyDataGraphProcessingEnginePropertiesARM,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM.html
        """
        return self._get_physical_device_queue_family_data_graph_processing_engine_properties_arm(
            physical_device,
            Ptr(to=queue_family_data_graph_processing_engine_info).bitcast[PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM](),
            Ptr(to=queue_family_data_graph_processing_engine_properties).bitcast[QueueFamilyDataGraphProcessingEnginePropertiesARM](),
        )
