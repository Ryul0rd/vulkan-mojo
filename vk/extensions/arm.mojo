from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct Tensors(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_tensor_arm: fn(
        device: Device,
        p_create_info: Ptr[TensorCreateInfoARM, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_tensor: Ptr[TensorARM, MutAnyOrigin],
    ) -> Result
    var _destroy_tensor_arm: fn(
        device: Device, tensor: TensorARM, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _create_tensor_view_arm: fn(
        device: Device,
        p_create_info: Ptr[TensorViewCreateInfoARM, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_view: Ptr[TensorViewARM, MutAnyOrigin],
    ) -> Result
    var _destroy_tensor_view_arm: fn(
        device: Device,
        tensor_view: TensorViewARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_tensor_memory_requirements_arm: fn(
        device: Device,
        p_info: Ptr[TensorMemoryRequirementsInfoARM, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _bind_tensor_memory_arm: fn(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindTensorMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result
    var _get_device_tensor_memory_requirements_arm: fn(
        device: Device,
        p_info: Ptr[DeviceTensorMemoryRequirementsARM, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _cmd_copy_tensor_arm: fn(
        command_buffer: CommandBuffer, p_copy_tensor_info: Ptr[CopyTensorInfoARM, ImmutAnyOrigin]
    )
    var _get_physical_device_external_tensor_properties_arm: fn(
        physical_device: PhysicalDevice,
        p_external_tensor_info: Ptr[PhysicalDeviceExternalTensorInfoARM, ImmutAnyOrigin],
        p_external_tensor_properties: Ptr[ExternalTensorPropertiesARM, MutAnyOrigin],
    )
    var _get_tensor_opaque_capture_descriptor_data_arm: fn(
        device: Device,
        p_info: Ptr[TensorCaptureDescriptorDataInfoARM, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_tensor_view_opaque_capture_descriptor_data_arm: fn(
        device: Device,
        p_info: Ptr[TensorViewCaptureDescriptorDataInfoARM, ImmutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_tensor_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateTensorARM".as_c_string_slice()
        )).bitcast[type_of(self._create_tensor_arm)]()[]
        self._destroy_tensor_arm = Ptr(to=get_device_proc_addr(
            device, "vkDestroyTensorARM".as_c_string_slice()
        )).bitcast[type_of(self._destroy_tensor_arm)]()[]
        self._create_tensor_view_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateTensorViewARM".as_c_string_slice()
        )).bitcast[type_of(self._create_tensor_view_arm)]()[]
        self._destroy_tensor_view_arm = Ptr(to=get_device_proc_addr(
            device, "vkDestroyTensorViewARM".as_c_string_slice()
        )).bitcast[type_of(self._destroy_tensor_view_arm)]()[]
        self._get_tensor_memory_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorMemoryRequirementsARM".as_c_string_slice()
        )).bitcast[type_of(self._get_tensor_memory_requirements_arm)]()[]
        self._bind_tensor_memory_arm = Ptr(to=get_device_proc_addr(
            device, "vkBindTensorMemoryARM".as_c_string_slice()
        )).bitcast[type_of(self._bind_tensor_memory_arm)]()[]
        self._get_device_tensor_memory_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceTensorMemoryRequirementsARM".as_c_string_slice()
        )).bitcast[type_of(self._get_device_tensor_memory_requirements_arm)]()[]
        self._cmd_copy_tensor_arm = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyTensorARM".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_tensor_arm)]()[]
        self._get_physical_device_external_tensor_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceExternalTensorPropertiesARM".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_external_tensor_properties_arm)]()[]
        self._get_tensor_opaque_capture_descriptor_data_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorOpaqueCaptureDescriptorDataARM".as_c_string_slice()
        )).bitcast[type_of(self._get_tensor_opaque_capture_descriptor_data_arm)]()[]
        self._get_tensor_view_opaque_capture_descriptor_data_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetTensorViewOpaqueCaptureDescriptorDataARM".as_c_string_slice()
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
        self,
        device: Device,
        info: TensorCaptureDescriptorDataInfoARM,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorOpaqueCaptureDescriptorDataARM.html
        """
        return self._get_tensor_opaque_capture_descriptor_data_arm(
            device, Ptr(to=info).bitcast[TensorCaptureDescriptorDataInfoARM](), p_data
        )

    fn get_tensor_view_opaque_capture_descriptor_data_arm(
        self,
        device: Device,
        info: TensorViewCaptureDescriptorDataInfoARM,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorViewOpaqueCaptureDescriptorDataARM.html
        """
        return self._get_tensor_view_opaque_capture_descriptor_data_arm(
            device, Ptr(to=info).bitcast[TensorViewCaptureDescriptorDataInfoARM](), p_data
        )


struct DataGraph(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_data_graph_pipelines_arm: fn(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[DataGraphPipelineCreateInfoARM, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _create_data_graph_pipeline_session_arm: fn(
        device: Device,
        p_create_info: Ptr[DataGraphPipelineSessionCreateInfoARM, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_session: Ptr[DataGraphPipelineSessionARM, MutAnyOrigin],
    ) -> Result
    var _get_data_graph_pipeline_session_bind_point_requirements_arm: fn(
        device: Device,
        p_info: Ptr[DataGraphPipelineSessionBindPointRequirementsInfoARM, ImmutAnyOrigin],
        p_bind_point_requirement_count: Ptr[UInt32, MutAnyOrigin],
        p_bind_point_requirements: Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutAnyOrigin],
    ) -> Result
    var _get_data_graph_pipeline_session_memory_requirements_arm: fn(
        device: Device,
        p_info: Ptr[DataGraphPipelineSessionMemoryRequirementsInfoARM, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _bind_data_graph_pipeline_session_memory_arm: fn(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM, ImmutAnyOrigin],
    ) -> Result
    var _destroy_data_graph_pipeline_session_arm: fn(
        device: Device,
        session: DataGraphPipelineSessionARM,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _cmd_dispatch_data_graph_arm: fn(
        command_buffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        p_info: Ptr[DataGraphPipelineDispatchInfoARM, ImmutAnyOrigin],
    )
    var _get_data_graph_pipeline_available_properties_arm: fn(
        device: Device,
        p_pipeline_info: Ptr[DataGraphPipelineInfoARM, ImmutAnyOrigin],
        p_properties_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[DataGraphPipelinePropertyARM, MutAnyOrigin],
    ) -> Result
    var _get_data_graph_pipeline_properties_arm: fn(
        device: Device,
        p_pipeline_info: Ptr[DataGraphPipelineInfoARM, ImmutAnyOrigin],
        properties_count: UInt32,
        p_properties: Ptr[DataGraphPipelinePropertyQueryResultARM, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_queue_family_data_graph_properties_arm: fn(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        p_queue_family_data_graph_property_count: Ptr[UInt32, MutAnyOrigin],
        p_queue_family_data_graph_properties: Ptr[QueueFamilyDataGraphPropertiesARM, MutAnyOrigin],
    ) -> Result
    var _get_physical_device_queue_family_data_graph_processing_engine_properties_arm: fn(
        physical_device: PhysicalDevice,
        p_queue_family_data_graph_processing_engine_info: Ptr[PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM, ImmutAnyOrigin],
        p_queue_family_data_graph_processing_engine_properties: Ptr[QueueFamilyDataGraphProcessingEnginePropertiesARM, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_data_graph_pipelines_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateDataGraphPipelinesARM".as_c_string_slice()
        )).bitcast[type_of(self._create_data_graph_pipelines_arm)]()[]
        self._create_data_graph_pipeline_session_arm = Ptr(to=get_device_proc_addr(
            device, "vkCreateDataGraphPipelineSessionARM".as_c_string_slice()
        )).bitcast[type_of(self._create_data_graph_pipeline_session_arm)]()[]
        self._get_data_graph_pipeline_session_bind_point_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineSessionBindPointRequirementsARM".as_c_string_slice()
        )).bitcast[type_of(self._get_data_graph_pipeline_session_bind_point_requirements_arm)]()[]
        self._get_data_graph_pipeline_session_memory_requirements_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineSessionMemoryRequirementsARM".as_c_string_slice()
        )).bitcast[type_of(self._get_data_graph_pipeline_session_memory_requirements_arm)]()[]
        self._bind_data_graph_pipeline_session_memory_arm = Ptr(to=get_device_proc_addr(
            device, "vkBindDataGraphPipelineSessionMemoryARM".as_c_string_slice()
        )).bitcast[type_of(self._bind_data_graph_pipeline_session_memory_arm)]()[]
        self._destroy_data_graph_pipeline_session_arm = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDataGraphPipelineSessionARM".as_c_string_slice()
        )).bitcast[type_of(self._destroy_data_graph_pipeline_session_arm)]()[]
        self._cmd_dispatch_data_graph_arm = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchDataGraphARM".as_c_string_slice()
        )).bitcast[type_of(self._cmd_dispatch_data_graph_arm)]()[]
        self._get_data_graph_pipeline_available_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelineAvailablePropertiesARM".as_c_string_slice()
        )).bitcast[type_of(self._get_data_graph_pipeline_available_properties_arm)]()[]
        self._get_data_graph_pipeline_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetDataGraphPipelinePropertiesARM".as_c_string_slice()
        )).bitcast[type_of(self._get_data_graph_pipeline_properties_arm)]()[]
        self._get_physical_device_queue_family_data_graph_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_queue_family_data_graph_properties_arm)]()[]
        self._get_physical_device_queue_family_data_graph_processing_engine_properties_arm = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceQueueFamilyDataGraphProcessingEnginePropertiesARM".as_c_string_slice()
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
        return self._bind_data_graph_pipeline_session_memory_arm(device, bind_info_count, p_bind_infos)

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
