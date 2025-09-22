from vk.core_functions import GlobalFunctions


struct Tensors(Copyable, Movable):
    var _create_tensor_arm: fn(
        device: Device, pCreateInfo: Ptr[TensorCreateInfoARM], pAllocator: Ptr[AllocationCallbacks], pTensor: Ptr[TensorARM]
    ) -> Result
    var _destroy_tensor_arm: fn(
        device: Device, tensor: TensorARM, pAllocator: Ptr[AllocationCallbacks]
    )
    var _create_tensor_view_arm: fn(
        device: Device, pCreateInfo: Ptr[TensorViewCreateInfoARM], pAllocator: Ptr[AllocationCallbacks], pView: Ptr[TensorViewARM]
    ) -> Result
    var _destroy_tensor_view_arm: fn(
        device: Device, tensorView: TensorViewARM, pAllocator: Ptr[AllocationCallbacks]
    )
    var _get_tensor_memory_requirements_arm: fn(
        device: Device, pInfo: Ptr[TensorMemoryRequirementsInfoARM], pMemoryRequirements: Ptr[MemoryRequirements2]
    )
    var _bind_tensor_memory_arm: fn(
        device: Device, bindInfoCount: UInt32, pBindInfos: Ptr[BindTensorMemoryInfoARM]
    ) -> Result
    var _get_device_tensor_memory_requirements_arm: fn(
        device: Device, pInfo: Ptr[DeviceTensorMemoryRequirementsARM], pMemoryRequirements: Ptr[MemoryRequirements2]
    )
    var _cmd_copy_tensor_arm: fn(
        commandBuffer: CommandBuffer, pCopyTensorInfo: Ptr[CopyTensorInfoARM]
    )
    var _get_physical_device_external_tensor_properties_arm: fn(
        physicalDevice: PhysicalDevice, pExternalTensorInfo: Ptr[PhysicalDeviceExternalTensorInfoARM], pExternalTensorProperties: Ptr[ExternalTensorPropertiesARM]
    )
    var _get_tensor_opaque_capture_descriptor_data_arm: fn(
        device: Device, pInfo: Ptr[TensorCaptureDescriptorDataInfoARM], pData: Ptr[NoneType]
    ) -> Result
    var _get_tensor_view_opaque_capture_descriptor_data_arm: fn(
        device: Device, pInfo: Ptr[TensorViewCaptureDescriptorDataInfoARM], pData: Ptr[NoneType]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_tensor_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateTensorARM".unsafe_ptr()
        )).bitcast[__type_of(self._create_tensor_arm)]()[]
        self._destroy_tensor_arm = Ptr(to=get_device_proc_addr(
            device, "vkDestroyTensorARM".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_tensor_arm)]()[]
        self._create_tensor_view_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateTensorViewARM".unsafe_ptr()
        )).bitcast[__type_of(self._create_tensor_view_arm)]()[]
        self._destroy_tensor_view_arm = Ptr(to=get_device_proc_addr(
            device, "vkDestroyTensorViewARM".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_tensor_view_arm)]()[]
        self._get_tensor_memory_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorMemoryRequirementsARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_tensor_memory_requirements_arm)]()[]
        self._bind_tensor_memory_arm = Ptr(to=get_device_proc_addr(
            device, "vkBindTensorMemoryARM".unsafe_ptr()
        )).bitcast[__type_of(self._bind_tensor_memory_arm)]()[]
        self._get_device_tensor_memory_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceTensorMemoryRequirementsARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_device_tensor_memory_requirements_arm)]()[]
        self._cmd_copy_tensor_arm = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyTensorARM".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_tensor_arm)]()[]
        self._get_physical_device_external_tensor_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceExternalTensorPropertiesARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_external_tensor_properties_arm)]()[]
        self._get_tensor_opaque_capture_descriptor_data_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorOpaqueCaptureDescriptorDataARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_tensor_opaque_capture_descriptor_data_arm)]()[]
        self._get_tensor_view_opaque_capture_descriptor_data_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorViewOpaqueCaptureDescriptorDataARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_tensor_view_opaque_capture_descriptor_data_arm)]()[]

    fn create_tensor_arm(
        self,
        device: Device,
        create_info: TensorCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks],
        mut tensor: TensorARM,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_tensor_arm(device, Ptr(to=create_info), p_allocator, Ptr(to=tensor))

    fn destroy_tensor_arm(
        self, device: Device, tensor: TensorARM, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_tensor_arm(device, tensor, p_allocator)

    fn create_tensor_view_arm(
        self,
        device: Device,
        create_info: TensorViewCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks],
        mut view: TensorViewARM,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_tensor_view_arm(device, Ptr(to=create_info), p_allocator, Ptr(to=view))

    fn destroy_tensor_view_arm(
        self, device: Device, tensor_view: TensorViewARM, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_tensor_view_arm(device, tensor_view, p_allocator)

    fn get_tensor_memory_requirements_arm(
        self,
        device: Device,
        info: TensorMemoryRequirementsInfoARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_tensor_memory_requirements_arm(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn bind_tensor_memory_arm(
        self, device: Device, bind_info_count: UInt32, p_bind_infos: Ptr[BindTensorMemoryInfoARM]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._bind_tensor_memory_arm(device, bind_info_count, p_bind_infos)

    fn get_device_tensor_memory_requirements_arm(
        self,
        device: Device,
        info: DeviceTensorMemoryRequirementsARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_device_tensor_memory_requirements_arm(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn cmd_copy_tensor_arm(
        self, command_buffer: CommandBuffer, mut copy_tensor_info: CopyTensorInfoARM
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_tensor_arm(command_buffer, Ptr(to=copy_tensor_info))

    fn get_physical_device_external_tensor_properties_arm(
        self,
        physical_device: PhysicalDevice,
        external_tensor_info: PhysicalDeviceExternalTensorInfoARM,
        mut external_tensor_properties: ExternalTensorPropertiesARM,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_external_tensor_properties_arm(
            physical_device, Ptr(to=external_tensor_info), Ptr(to=external_tensor_properties)
        )

    fn get_tensor_opaque_capture_descriptor_data_arm(
        self, device: Device, info: TensorCaptureDescriptorDataInfoARM, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_tensor_opaque_capture_descriptor_data_arm(
            device, Ptr(to=info), Ptr(to=data)
        )

    fn get_tensor_view_opaque_capture_descriptor_data_arm(
        self, device: Device, info: TensorViewCaptureDescriptorDataInfoARM, mut data: NoneType
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_tensor_view_opaque_capture_descriptor_data_arm(
            device, Ptr(to=info), Ptr(to=data)
        )


struct DataGraph(Copyable, Movable):
    var _create_data_graph_pipelines_arm: fn(
        device: Device, deferredOperation: DeferredOperationKHR, pipelineCache: PipelineCache, createInfoCount: UInt32, pCreateInfos: Ptr[DataGraphPipelineCreateInfoARM], pAllocator: Ptr[AllocationCallbacks], pPipelines: Ptr[Pipeline]
    ) -> Result
    var _create_data_graph_pipeline_session_arm: fn(
        device: Device, pCreateInfo: Ptr[DataGraphPipelineSessionCreateInfoARM], pAllocator: Ptr[AllocationCallbacks], pSession: Ptr[DataGraphPipelineSessionARM]
    ) -> Result
    var _get_data_graph_pipeline_session_bind_point_requirements_arm: fn(
        device: Device, pInfo: Ptr[DataGraphPipelineSessionBindPointRequirementsInfoARM], pBindPointRequirementCount: Ptr[UInt32], pBindPointRequirements: Ptr[DataGraphPipelineSessionBindPointRequirementARM]
    ) -> Result
    var _get_data_graph_pipeline_session_memory_requirements_arm: fn(
        device: Device, pInfo: Ptr[DataGraphPipelineSessionMemoryRequirementsInfoARM], pMemoryRequirements: Ptr[MemoryRequirements2]
    )
    var _bind_data_graph_pipeline_session_memory_arm: fn(
        device: Device, bindInfoCount: UInt32, pBindInfos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM]
    ) -> Result
    var _destroy_data_graph_pipeline_session_arm: fn(
        device: Device, session: DataGraphPipelineSessionARM, pAllocator: Ptr[AllocationCallbacks]
    )
    var _cmd_dispatch_data_graph_arm: fn(
        commandBuffer: CommandBuffer, session: DataGraphPipelineSessionARM, pInfo: Ptr[DataGraphPipelineDispatchInfoARM]
    )
    var _get_data_graph_pipeline_available_properties_arm: fn(
        device: Device, pPipelineInfo: Ptr[DataGraphPipelineInfoARM], pPropertiesCount: Ptr[UInt32], pProperties: Ptr[DataGraphPipelinePropertyARM]
    ) -> Result
    var _get_data_graph_pipeline_properties_arm: fn(
        device: Device, pPipelineInfo: Ptr[DataGraphPipelineInfoARM], propertiesCount: UInt32, pProperties: Ptr[DataGraphPipelinePropertyQueryResultARM]
    ) -> Result
    var _get_physical_device_queue_family_data_graph_properties_arm: fn(
        physicalDevice: PhysicalDevice, queueFamilyIndex: UInt32, pQueueFamilyDataGraphPropertyCount: Ptr[UInt32], pQueueFamilyDataGraphProperties: Ptr[QueueFamilyDataGraphPropertiesARM]
    ) -> Result
    var _get_physical_device_queue_family_data_graph_processing_engine_properties_arm: fn(
        physicalDevice: PhysicalDevice, pQueueFamilyDataGraphProcessingEngineInfo: Ptr[PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM], pQueueFamilyDataGraphProcessingEngineProperties: Ptr[QueueFamilyDataGraphProcessingEnginePropertiesARM]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_data_graph_pipelines_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateDataGraphPipelinesARM".unsafe_ptr()
        )).bitcast[__type_of(self._create_data_graph_pipelines_arm)]()[]
        self._create_data_graph_pipeline_session_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateDataGraphPipelineSessionARM".unsafe_ptr()
        )).bitcast[__type_of(self._create_data_graph_pipeline_session_arm)]()[]
        self._get_data_graph_pipeline_session_bind_point_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineSessionBindPointRequirementsARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_data_graph_pipeline_session_bind_point_requirements_arm)]()[]
        self._get_data_graph_pipeline_session_memory_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineSessionMemoryRequirementsARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_data_graph_pipeline_session_memory_requirements_arm)]()[]
        self._bind_data_graph_pipeline_session_memory_arm = Ptr(to=get_device_proc_addr(
            device, "vkBindDataGraphPipelineSessionMemoryARM".unsafe_ptr()
        )).bitcast[__type_of(self._bind_data_graph_pipeline_session_memory_arm)]()[]
        self._destroy_data_graph_pipeline_session_arm = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDataGraphPipelineSessionARM".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_data_graph_pipeline_session_arm)]()[]
        self._cmd_dispatch_data_graph_arm = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchDataGraphARM".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_dispatch_data_graph_arm)]()[]
        self._get_data_graph_pipeline_available_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineAvailablePropertiesARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_data_graph_pipeline_available_properties_arm)]()[]
        self._get_data_graph_pipeline_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelinePropertiesARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_data_graph_pipeline_properties_arm)]()[]
        self._get_physical_device_queue_family_data_graph_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_queue_family_data_graph_properties_arm)]()[]
        self._get_physical_device_queue_family_data_graph_processing_engine_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_queue_family_data_graph_processing_engine_properties_arm)]()[]

    fn create_data_graph_pipelines_arm(
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[DataGraphPipelineCreateInfoARM],
        p_allocator: Ptr[AllocationCallbacks],
        p_pipelines: Ptr[Pipeline],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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
        p_allocator: Ptr[AllocationCallbacks],
        mut session: DataGraphPipelineSessionARM,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_data_graph_pipeline_session_arm(
            device, Ptr(to=create_info), p_allocator, Ptr(to=session)
        )

    fn get_data_graph_pipeline_session_bind_point_requirements_arm(
        self,
        device: Device,
        info: DataGraphPipelineSessionBindPointRequirementsInfoARM,
        mut bind_point_requirement_count: UInt32,
        p_bind_point_requirements: Ptr[DataGraphPipelineSessionBindPointRequirementARM],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_data_graph_pipeline_session_bind_point_requirements_arm(
            device, Ptr(to=info), Ptr(to=bind_point_requirement_count), p_bind_point_requirements
        )

    fn get_data_graph_pipeline_session_bind_point_requirements_arm(
        self, device: Device, info: DataGraphPipelineSessionBindPointRequirementsInfoARM
    ) -> ListResult[DataGraphPipelineSessionBindPointRequirementARM]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[DataGraphPipelineSessionBindPointRequirementARM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_data_graph_pipeline_session_bind_point_requirements_arm(
                device, info, count, Ptr[DataGraphPipelineSessionBindPointRequirementARM]()
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_data_graph_pipeline_session_memory_requirements_arm(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn bind_data_graph_pipeline_session_memory_arm(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._bind_data_graph_pipeline_session_memory_arm(
            device, bind_info_count, p_bind_infos
        )

    fn destroy_data_graph_pipeline_session_arm(
        self,
        device: Device,
        session: DataGraphPipelineSessionARM,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_data_graph_pipeline_session_arm(device, session, p_allocator)

    fn cmd_dispatch_data_graph_arm(
        self,
        command_buffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        p_info: Ptr[DataGraphPipelineDispatchInfoARM],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_dispatch_data_graph_arm(command_buffer, session, p_info)

    fn get_data_graph_pipeline_available_properties_arm(
        self,
        device: Device,
        pipeline_info: DataGraphPipelineInfoARM,
        mut properties_count: UInt32,
        p_properties: Ptr[DataGraphPipelinePropertyARM],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_data_graph_pipeline_available_properties_arm(
            device, Ptr(to=pipeline_info), Ptr(to=properties_count), p_properties
        )

    fn get_data_graph_pipeline_available_properties_arm(
        self, device: Device, pipeline_info: DataGraphPipelineInfoARM
    ) -> ListResult[DataGraphPipelinePropertyARM]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[DataGraphPipelinePropertyARM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_data_graph_pipeline_available_properties_arm(
                device, pipeline_info, count, Ptr[DataGraphPipelinePropertyARM]()
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
        p_properties: Ptr[DataGraphPipelinePropertyQueryResultARM],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_data_graph_pipeline_properties_arm(
            device, Ptr(to=pipeline_info), properties_count, p_properties
        )

    fn get_physical_device_queue_family_data_graph_properties_arm(
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut queue_family_data_graph_property_count: UInt32,
        p_queue_family_data_graph_properties: Ptr[QueueFamilyDataGraphPropertiesARM],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_queue_family_data_graph_properties_arm(
            physical_device,
            queue_family_index,
            Ptr(to=queue_family_data_graph_property_count),
            p_queue_family_data_graph_properties,
        )

    fn get_physical_device_queue_family_data_graph_properties_arm(
        self, physical_device: PhysicalDevice, queue_family_index: UInt32
    ) -> ListResult[QueueFamilyDataGraphPropertiesARM]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[QueueFamilyDataGraphPropertiesARM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_queue_family_data_graph_properties_arm(
                physical_device, queue_family_index, count, Ptr[QueueFamilyDataGraphPropertiesARM]()
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_queue_family_data_graph_processing_engine_properties_arm(
            physical_device,
            Ptr(to=queue_family_data_graph_processing_engine_info),
            Ptr(to=queue_family_data_graph_processing_engine_properties),
        )
