from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct Tensors(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_tensor: fn(
        device: Device,
        p_create_info: Ptr[TensorCreateInfoARM, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_tensor: Ptr[TensorARM, MutAnyOrigin],
    ) -> Result
    var _destroy_tensor: fn(
        device: Device, tensor: TensorARM, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _create_tensor_view: fn(
        device: Device,
        p_create_info: Ptr[TensorViewCreateInfoARM, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_view: Ptr[TensorViewARM, MutAnyOrigin],
    ) -> Result
    var _destroy_tensor_view: fn(
        device: Device,
        tensor_view: TensorViewARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_tensor_memory_requirements: fn(
        device: Device,
        p_info: Ptr[TensorMemoryRequirementsInfoARM, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _bind_tensor_memory: fn(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindTensorMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result
    var _get_device_tensor_memory_requirements: fn(
        device: Device,
        p_info: Ptr[DeviceTensorMemoryRequirementsARM, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _cmd_copy_tensor: fn(
        command_buffer: CommandBuffer, p_copy_tensor_info: Ptr[CopyTensorInfoARM, ImmutAnyOrigin]
    )
    var _get_physical_device_external_tensor_properties: fn(
        physical_device: PhysicalDevice,
        p_external_tensor_info: Ptr[PhysicalDeviceExternalTensorInfoARM, ImmutAnyOrigin],
        p_external_tensor_properties: Ptr[ExternalTensorPropertiesARM, MutAnyOrigin],
    )
    var _get_tensor_opaque_capture_descriptor_data: fn(
        device: Device,
        p_info: Ptr[TensorCaptureDescriptorDataInfoARM, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_tensor_view_opaque_capture_descriptor_data: fn(
        device: Device,
        p_info: Ptr[TensorViewCaptureDescriptorDataInfoARM, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_tensor = Ptr(to=get_device_proc_addr(
            device, "vkCreateTensorARM".as_c_string_slice()
        )).bitcast[type_of(self._create_tensor)]()[]
        self._destroy_tensor = Ptr(to=get_device_proc_addr(
            device, "vkDestroyTensorARM".as_c_string_slice()
        )).bitcast[type_of(self._destroy_tensor)]()[]
        self._create_tensor_view = Ptr(to=get_device_proc_addr(
            device, "vkCreateTensorViewARM".as_c_string_slice()
        )).bitcast[type_of(self._create_tensor_view)]()[]
        self._destroy_tensor_view = Ptr(to=get_device_proc_addr(
            device, "vkDestroyTensorViewARM".as_c_string_slice()
        )).bitcast[type_of(self._destroy_tensor_view)]()[]
        self._get_tensor_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorMemoryRequirementsARM".as_c_string_slice()
        )).bitcast[type_of(self._get_tensor_memory_requirements)]()[]
        self._bind_tensor_memory = Ptr(to=get_device_proc_addr(
            device, "vkBindTensorMemoryARM".as_c_string_slice()
        )).bitcast[type_of(self._bind_tensor_memory)]()[]
        self._get_device_tensor_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceTensorMemoryRequirementsARM".as_c_string_slice()
        )).bitcast[type_of(self._get_device_tensor_memory_requirements)]()[]
        self._cmd_copy_tensor = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyTensorARM".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_tensor)]()[]
        self._get_physical_device_external_tensor_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceExternalTensorPropertiesARM".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_external_tensor_properties)]()[]
        self._get_tensor_opaque_capture_descriptor_data = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorOpaqueCaptureDescriptorDataARM".as_c_string_slice()
        )).bitcast[type_of(self._get_tensor_opaque_capture_descriptor_data)]()[]
        self._get_tensor_view_opaque_capture_descriptor_data = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorViewOpaqueCaptureDescriptorDataARM".as_c_string_slice()
        )).bitcast[type_of(self._get_tensor_view_opaque_capture_descriptor_data)]()[]

    fn create_tensor[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: TensorCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut tensor: TensorARM,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateTensorARM.html
        """
        return self._create_tensor(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=tensor),
        )

    fn destroy_tensor[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        tensor: TensorARM,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyTensorARM.html
        """
        return self._destroy_tensor(
            device, tensor, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn create_tensor_view[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: TensorViewCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut view: TensorViewARM,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateTensorViewARM.html
        """
        return self._create_tensor_view(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=view),
        )

    fn destroy_tensor_view[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        tensor_view: TensorViewARM,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyTensorViewARM.html
        """
        return self._destroy_tensor_view(
            device, tensor_view, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn get_tensor_memory_requirements(
        self,
        device: Device,
        info: TensorMemoryRequirementsInfoARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorMemoryRequirementsARM.html
        """
        return self._get_tensor_memory_requirements(device, Ptr(to=info), Ptr(to=memory_requirements))

    fn bind_tensor_memory[p_bind_infos_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindTensorMemoryInfoARM, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindTensorMemoryARM.html
        """
        return self._bind_tensor_memory(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindTensorMemoryInfoARM, ImmutAnyOrigin]]()[],
        )

    fn get_device_tensor_memory_requirements(
        self,
        device: Device,
        info: DeviceTensorMemoryRequirementsARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceTensorMemoryRequirementsARM.html
        """
        return self._get_device_tensor_memory_requirements(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn cmd_copy_tensor(self, command_buffer: CommandBuffer, copy_tensor_info: CopyTensorInfoARM):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyTensorARM.html
        """
        return self._cmd_copy_tensor(command_buffer, Ptr(to=copy_tensor_info))

    fn get_physical_device_external_tensor_properties(
        self,
        physical_device: PhysicalDevice,
        external_tensor_info: PhysicalDeviceExternalTensorInfoARM,
        mut external_tensor_properties: ExternalTensorPropertiesARM,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalTensorPropertiesARM.html
        """
        return self._get_physical_device_external_tensor_properties(
            physical_device, Ptr(to=external_tensor_info), Ptr(to=external_tensor_properties)
        )

    fn get_tensor_opaque_capture_descriptor_data[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: TensorCaptureDescriptorDataInfoARM,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorOpaqueCaptureDescriptorDataARM.html
        """
        return self._get_tensor_opaque_capture_descriptor_data(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )

    fn get_tensor_view_opaque_capture_descriptor_data[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        info: TensorViewCaptureDescriptorDataInfoARM,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorViewOpaqueCaptureDescriptorDataARM.html
        """
        return self._get_tensor_view_opaque_capture_descriptor_data(
            device, Ptr(to=info), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )


struct DataGraph(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_data_graph_pipelines: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[DataGraphPipelineCreateInfoARM, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _create_data_graph_pipeline_session: fn(
        device: Device,
        p_create_info: Ptr[DataGraphPipelineSessionCreateInfoARM, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_session: Ptr[DataGraphPipelineSessionARM, MutAnyOrigin],
    ) -> Result
    var _get_data_graph_pipeline_session_bind_point_requirements: fn(
        device: Device,
        p_info: Ptr[DataGraphPipelineSessionBindPointRequirementsInfoARM, ImmutAnyOrigin],
        p_bind_point_requirement_count: Ptr[UInt32, MutAnyOrigin],
        p_bind_point_requirements: Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutAnyOrigin],
    ) -> Result
    var _get_data_graph_pipeline_session_memory_requirements: fn(
        device: Device,
        p_info: Ptr[DataGraphPipelineSessionMemoryRequirementsInfoARM, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _bind_data_graph_pipeline_session_memory: fn(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result
    var _destroy_data_graph_pipeline_session: fn(
        device: Device,
        session: DataGraphPipelineSessionARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _cmd_dispatch_data_graph: fn(
        command_buffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        p_info: Ptr[DataGraphPipelineDispatchInfoARM, ImmutAnyOrigin],
    )
    var _get_data_graph_pipeline_available_properties: fn(
        device: Device,
        p_pipeline_info: Ptr[DataGraphPipelineInfoARM, ImmutAnyOrigin],
        p_properties_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DataGraphPipelinePropertyARM, MutAnyOrigin],
    ) -> Result
    var _get_data_graph_pipeline_properties: fn(
        device: Device,
        p_pipeline_info: Ptr[DataGraphPipelineInfoARM, ImmutAnyOrigin],
        properties_count: UInt32,
        p_properties: Ptr[DataGraphPipelinePropertyQueryResultARM, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_queue_family_data_graph_properties: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        p_queue_family_data_graph_property_count: Ptr[UInt32, MutAnyOrigin],
        p_queue_family_data_graph_properties: Ptr[QueueFamilyDataGraphPropertiesARM, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_queue_family_data_graph_processing_engine_properties: fn(
        physical_device: PhysicalDevice,
        p_queue_family_data_graph_processing_engine_info: Ptr[PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM, ImmutAnyOrigin],
        p_queue_family_data_graph_processing_engine_properties: Ptr[QueueFamilyDataGraphProcessingEnginePropertiesARM, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_data_graph_pipelines = Ptr(to=get_device_proc_addr(
            device, "vkCreateDataGraphPipelinesARM".as_c_string_slice()
        )).bitcast[type_of(self._create_data_graph_pipelines)]()[]
        self._create_data_graph_pipeline_session = Ptr(to=get_device_proc_addr(
            device, "vkCreateDataGraphPipelineSessionARM".as_c_string_slice()
        )).bitcast[type_of(self._create_data_graph_pipeline_session)]()[]
        self._get_data_graph_pipeline_session_bind_point_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineSessionBindPointRequirementsARM".as_c_string_slice()
        )).bitcast[type_of(self._get_data_graph_pipeline_session_bind_point_requirements)]()[]
        self._get_data_graph_pipeline_session_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineSessionMemoryRequirementsARM".as_c_string_slice()
        )).bitcast[type_of(self._get_data_graph_pipeline_session_memory_requirements)]()[]
        self._bind_data_graph_pipeline_session_memory = Ptr(to=get_device_proc_addr(
            device, "vkBindDataGraphPipelineSessionMemoryARM".as_c_string_slice()
        )).bitcast[type_of(self._bind_data_graph_pipeline_session_memory)]()[]
        self._destroy_data_graph_pipeline_session = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDataGraphPipelineSessionARM".as_c_string_slice()
        )).bitcast[type_of(self._destroy_data_graph_pipeline_session)]()[]
        self._cmd_dispatch_data_graph = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchDataGraphARM".as_c_string_slice()
        )).bitcast[type_of(self._cmd_dispatch_data_graph)]()[]
        self._get_data_graph_pipeline_available_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineAvailablePropertiesARM".as_c_string_slice()
        )).bitcast[type_of(self._get_data_graph_pipeline_available_properties)]()[]
        self._get_data_graph_pipeline_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelinePropertiesARM".as_c_string_slice()
        )).bitcast[type_of(self._get_data_graph_pipeline_properties)]()[]
        self._get_physical_device_queue_family_data_graph_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_queue_family_data_graph_properties)]()[]
        self._get_physical_device_queue_family_data_graph_processing_engine_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_queue_family_data_graph_processing_engine_properties)]()[]

    fn create_data_graph_pipelines[
        p_create_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        p_allocator_origin: ImmutOrigin = ImmutAnyOrigin,
        p_pipelines_origin: MutOrigin = MutAnyOrigin,
    ](
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[DataGraphPipelineCreateInfoARM, p_create_infos_origin],
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDataGraphPipelinesARM.html
        """
        return self._create_data_graph_pipelines(
            device,
            deferred_operation,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[DataGraphPipelineCreateInfoARM, ImmutAnyOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutAnyOrigin]]()[],
        )

    fn create_data_graph_pipeline_session[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: DataGraphPipelineSessionCreateInfoARM,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut session: DataGraphPipelineSessionARM,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDataGraphPipelineSessionARM.html
        """
        return self._create_data_graph_pipeline_session(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=session),
        )

    fn get_data_graph_pipeline_session_bind_point_requirements[
        p_bind_point_requirements_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        device: Device,
        info: DataGraphPipelineSessionBindPointRequirementsInfoARM,
        mut bind_point_requirement_count: UInt32,
        p_bind_point_requirements: Ptr[DataGraphPipelineSessionBindPointRequirementARM, p_bind_point_requirements_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineSessionBindPointRequirementsARM.html
        """
        return self._get_data_graph_pipeline_session_bind_point_requirements(
            device,
            Ptr(to=info),
            Ptr(to=bind_point_requirement_count),
            Ptr(to=p_bind_point_requirements).bitcast[Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutAnyOrigin]]()[],
        )

    fn get_data_graph_pipeline_session_bind_point_requirements[
        p_bind_point_requirements_origin: MutOrigin = MutAnyOrigin
    ](
        self, device: Device, info: DataGraphPipelineSessionBindPointRequirementsInfoARM
    ) -> ListResult[DataGraphPipelineSessionBindPointRequirementARM]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineSessionBindPointRequirementsARM.html
        """
        var list = List[DataGraphPipelineSessionBindPointRequirementARM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_data_graph_pipeline_session_bind_point_requirements(
        device,
        Ptr(to=info),
        Ptr(to=count),
        Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_data_graph_pipeline_session_bind_point_requirements(
        device, Ptr(to=info), Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_data_graph_pipeline_session_memory_requirements(
        self,
        device: Device,
        info: DataGraphPipelineSessionMemoryRequirementsInfoARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineSessionMemoryRequirementsARM.html
        """
        return self._get_data_graph_pipeline_session_memory_requirements(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn bind_data_graph_pipeline_session_memory[p_bind_infos_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindDataGraphPipelineSessionMemoryARM.html
        """
        return self._bind_data_graph_pipeline_session_memory(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindDataGraphPipelineSessionMemoryInfoARM, ImmutAnyOrigin]]()[],
        )

    fn destroy_data_graph_pipeline_session[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        session: DataGraphPipelineSessionARM,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDataGraphPipelineSessionARM.html
        """
        return self._destroy_data_graph_pipeline_session(
            device, session, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn cmd_dispatch_data_graph[p_info_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        p_info: Ptr[DataGraphPipelineDispatchInfoARM, p_info_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchDataGraphARM.html
        """
        return self._cmd_dispatch_data_graph(
            command_buffer,
            session,
            Ptr(to=p_info).bitcast[Ptr[DataGraphPipelineDispatchInfoARM, ImmutAnyOrigin]]()[],
        )

    fn get_data_graph_pipeline_available_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        pipeline_info: DataGraphPipelineInfoARM,
        mut properties_count: UInt32,
        p_properties: Ptr[DataGraphPipelinePropertyARM, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineAvailablePropertiesARM.html
        """
        return self._get_data_graph_pipeline_available_properties(
            device,
            Ptr(to=pipeline_info),
            Ptr(to=properties_count),
            Ptr(to=p_properties).bitcast[Ptr[DataGraphPipelinePropertyARM, MutAnyOrigin]]()[],
        )

    fn get_data_graph_pipeline_available_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self, device: Device, pipeline_info: DataGraphPipelineInfoARM
    ) -> ListResult[DataGraphPipelinePropertyARM]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineAvailablePropertiesARM.html
        """
        var list = List[DataGraphPipelinePropertyARM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_data_graph_pipeline_available_properties(
        device,
        Ptr(to=pipeline_info),
        Ptr(to=count),
        Ptr[DataGraphPipelinePropertyARM, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_data_graph_pipeline_available_properties(
        device, Ptr(to=pipeline_info), Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_data_graph_pipeline_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        pipeline_info: DataGraphPipelineInfoARM,
        properties_count: UInt32,
        p_properties: Ptr[DataGraphPipelinePropertyQueryResultARM, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelinePropertiesARM.html
        """
        return self._get_data_graph_pipeline_properties(
            device,
            Ptr(to=pipeline_info),
            properties_count,
            Ptr(to=p_properties).bitcast[Ptr[DataGraphPipelinePropertyQueryResultARM, MutAnyOrigin]]()[],
        )

    fn get_physical_device_queue_family_data_graph_properties[
        p_queue_family_data_graph_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut queue_family_data_graph_property_count: UInt32,
        p_queue_family_data_graph_properties: Ptr[QueueFamilyDataGraphPropertiesARM, p_queue_family_data_graph_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM.html
        """
        return self._get_physical_device_queue_family_data_graph_properties(
            physical_device,
            queue_family_index,
            Ptr(to=queue_family_data_graph_property_count),
            Ptr(to=p_queue_family_data_graph_properties).bitcast[Ptr[QueueFamilyDataGraphPropertiesARM, MutAnyOrigin]]()[],
        )

    fn get_physical_device_queue_family_data_graph_properties[
        p_queue_family_data_graph_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice, queue_family_index: UInt32
    ) -> ListResult[QueueFamilyDataGraphPropertiesARM]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM.html
        """
        var list = List[QueueFamilyDataGraphPropertiesARM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_queue_family_data_graph_properties(
        physical_device,
        queue_family_index,
        Ptr(to=count),
        Ptr[QueueFamilyDataGraphPropertiesARM, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_queue_family_data_graph_properties(
        physical_device, queue_family_index, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_queue_family_data_graph_processing_engine_properties(
        self,
        physical_device: PhysicalDevice,
        queue_family_data_graph_processing_engine_info: PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM,
        mut queue_family_data_graph_processing_engine_properties: QueueFamilyDataGraphProcessingEnginePropertiesARM,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM.html
        """
        return self._get_physical_device_queue_family_data_graph_processing_engine_properties(
            physical_device,
            Ptr(to=queue_family_data_graph_processing_engine_info),
            Ptr(to=queue_family_data_graph_processing_engine_properties),
        )


struct PerformanceCountersByRegion(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _enumerate_physical_device_queue_family_performance_counters_by_region: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        p_counter_count: Ptr[UInt32, MutAnyOrigin],
        p_counters: Ptr[PerformanceCounterARM, MutAnyOrigin],
        p_counter_descriptions: Ptr[PerformanceCounterDescriptionARM, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._enumerate_physical_device_queue_family_performance_counters_by_region = Ptr(to=get_device_proc_addr(
            device, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM".as_c_string_slice()
        )).bitcast[type_of(self._enumerate_physical_device_queue_family_performance_counters_by_region)]()[]

    fn enumerate_physical_device_queue_family_performance_counters_by_region[
        p_counters_origin: MutOrigin = MutAnyOrigin,
        p_counter_descriptions_origin: MutOrigin = MutAnyOrigin,
    ](
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut counter_count: UInt32,
        p_counters: Ptr[PerformanceCounterARM, p_counters_origin],
        p_counter_descriptions: Ptr[PerformanceCounterDescriptionARM, p_counter_descriptions_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM.html
        """
        return self._enumerate_physical_device_queue_family_performance_counters_by_region(
            physical_device,
            queue_family_index,
            Ptr(to=counter_count),
            Ptr(to=p_counters).bitcast[Ptr[PerformanceCounterARM, MutAnyOrigin]]()[],
            Ptr(to=p_counter_descriptions).bitcast[Ptr[PerformanceCounterDescriptionARM, MutAnyOrigin]]()[],
        )
