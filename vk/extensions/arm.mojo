from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions
from vk.structs import *


struct Tensors(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_tensor: def(
        device: Device,
        p_create_info: Ptr[TensorCreateInfoARM, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_tensor: Ptr[TensorARM, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_tensor: def(
        device: Device,
        tensor: TensorARM,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _create_tensor_view: def(
        device: Device,
        p_create_info: Ptr[TensorViewCreateInfoARM, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_view: Ptr[TensorViewARM, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_tensor_view: def(
        device: Device,
        tensor_view: TensorViewARM,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _get_tensor_memory_requirements: def(
        device: Device,
        p_info: Ptr[TensorMemoryRequirementsInfoARM, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutUntrackedOrigin],
    ) thin abi("C")
    var _bind_tensor_memory: def(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindTensorMemoryInfoARM, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_device_tensor_memory_requirements: def(
        device: Device,
        p_info: Ptr[DeviceTensorMemoryRequirementsARM, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_copy_tensor: def(
        command_buffer: CommandBuffer, p_copy_tensor_info: Ptr[CopyTensorInfoARM, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _get_physical_device_external_tensor_properties: def(
        physical_device: PhysicalDevice,
        p_external_tensor_info: Ptr[PhysicalDeviceExternalTensorInfoARM, ImmutUntrackedOrigin],
        p_external_tensor_properties: Ptr[ExternalTensorPropertiesARM, MutUntrackedOrigin],
    ) thin abi("C")
    var _get_tensor_opaque_capture_descriptor_data: def(
        device: Device,
        p_info: Ptr[TensorCaptureDescriptorDataInfoARM, ImmutUntrackedOrigin],
        p_data: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_tensor_view_opaque_capture_descriptor_data: def(
        device: Device,
        p_info: Ptr[TensorViewCaptureDescriptorDataInfoARM, ImmutUntrackedOrigin],
        p_data: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
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

    def create_tensor[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: TensorCreateInfoARM,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut tensor: TensorARM,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateTensorARM.html
        """
        return self._create_tensor(
            device,
            Ptr(to=create_info).bitcast[TensorCreateInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=tensor).bitcast[TensorARM]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_tensor[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        tensor: TensorARM,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyTensorARM.html
        """
        return self._destroy_tensor(
            device,
            tensor,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_tensor_view[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: TensorViewCreateInfoARM,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: TensorViewARM,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateTensorViewARM.html
        """
        return self._create_tensor_view(
            device,
            Ptr(to=create_info).bitcast[TensorViewCreateInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[TensorViewARM]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_tensor_view[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        tensor_view: TensorViewARM,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyTensorViewARM.html
        """
        return self._destroy_tensor_view(
            device,
            tensor_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_tensor_memory_requirements(
        self,
        device: Device,
        info: TensorMemoryRequirementsInfoARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorMemoryRequirementsARM.html
        """
        return self._get_tensor_memory_requirements(
            device,
            Ptr(to=info).bitcast[TensorMemoryRequirementsInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def bind_tensor_memory[p_bind_infos_origin: ImmutOrigin = ImmutUntrackedOrigin](
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
            Ptr(to=p_bind_infos).bitcast[Ptr[BindTensorMemoryInfoARM, ImmutUntrackedOrigin]]()[],
        )

    def get_device_tensor_memory_requirements(
        self,
        device: Device,
        info: DeviceTensorMemoryRequirementsARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceTensorMemoryRequirementsARM.html
        """
        return self._get_device_tensor_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceTensorMemoryRequirementsARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_copy_tensor(self, command_buffer: CommandBuffer, copy_tensor_info: CopyTensorInfoARM):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyTensorARM.html
        """
        return self._cmd_copy_tensor(
            command_buffer,
            Ptr(to=copy_tensor_info).bitcast[CopyTensorInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_physical_device_external_tensor_properties(
        self,
        physical_device: PhysicalDevice,
        external_tensor_info: PhysicalDeviceExternalTensorInfoARM,
        mut external_tensor_properties: ExternalTensorPropertiesARM,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalTensorPropertiesARM.html
        """
        return self._get_physical_device_external_tensor_properties(
            physical_device,
            Ptr(to=external_tensor_info).bitcast[PhysicalDeviceExternalTensorInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_tensor_properties).bitcast[ExternalTensorPropertiesARM]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_tensor_opaque_capture_descriptor_data[p_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        info: TensorCaptureDescriptorDataInfoARM,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorOpaqueCaptureDescriptorDataARM.html
        """
        return self._get_tensor_opaque_capture_descriptor_data(
            device,
            Ptr(to=info).bitcast[TensorCaptureDescriptorDataInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )

    def get_tensor_view_opaque_capture_descriptor_data[
        p_data_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        device: Device,
        info: TensorViewCaptureDescriptorDataInfoARM,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetTensorViewOpaqueCaptureDescriptorDataARM.html
        """
        return self._get_tensor_view_opaque_capture_descriptor_data(
            device,
            Ptr(to=info).bitcast[TensorViewCaptureDescriptorDataInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )


struct DataGraph(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_data_graph_pipelines: def(
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[DataGraphPipelineCreateInfoARM, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_pipelines: Ptr[Pipeline, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _create_data_graph_pipeline_session: def(
        device: Device,
        p_create_info: Ptr[DataGraphPipelineSessionCreateInfoARM, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_session: Ptr[DataGraphPipelineSessionARM, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_data_graph_pipeline_session_bind_point_requirements: def(
        device: Device,
        p_info: Ptr[DataGraphPipelineSessionBindPointRequirementsInfoARM, ImmutUntrackedOrigin],
        p_bind_point_requirement_count: Ptr[UInt32, MutUntrackedOrigin],
        p_bind_point_requirements: Optional[Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _get_data_graph_pipeline_session_memory_requirements: def(
        device: Device,
        p_info: Ptr[DataGraphPipelineSessionMemoryRequirementsInfoARM, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutUntrackedOrigin],
    ) thin abi("C")
    var _bind_data_graph_pipeline_session_memory: def(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindDataGraphPipelineSessionMemoryInfoARM, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_data_graph_pipeline_session: def(
        device: Device,
        session: DataGraphPipelineSessionARM,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _cmd_dispatch_data_graph: def(
        command_buffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        p_info: Optional[Ptr[DataGraphPipelineDispatchInfoARM, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _get_data_graph_pipeline_available_properties: def(
        device: Device,
        p_pipeline_info: Ptr[DataGraphPipelineInfoARM, ImmutUntrackedOrigin],
        p_properties_count: Ptr[UInt32, MutUntrackedOrigin],
        p_properties: Optional[Ptr[DataGraphPipelinePropertyARM, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _get_data_graph_pipeline_properties: def(
        device: Device,
        p_pipeline_info: Ptr[DataGraphPipelineInfoARM, ImmutUntrackedOrigin],
        properties_count: UInt32,
        p_properties: Ptr[DataGraphPipelinePropertyQueryResultARM, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_physical_device_queue_family_data_graph_properties: def(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        p_queue_family_data_graph_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_queue_family_data_graph_properties: Optional[Ptr[QueueFamilyDataGraphPropertiesARM, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _get_physical_device_queue_family_data_graph_processing_engine_properties: def(
        physical_device: PhysicalDevice,
        p_queue_family_data_graph_processing_engine_info: Ptr[PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM, ImmutUntrackedOrigin],
        p_queue_family_data_graph_processing_engine_properties: Ptr[QueueFamilyDataGraphProcessingEnginePropertiesARM, MutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
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

    def create_data_graph_pipelines[
        p_create_infos_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_pipelines_origin: MutOrigin = MutUntrackedOrigin,
    ](
        self,
        device: Device,
        deferred_operation: DeferredOperationKHR,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[DataGraphPipelineCreateInfoARM, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
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
            Ptr(to=p_create_infos).bitcast[Ptr[DataGraphPipelineCreateInfoARM, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def create_data_graph_pipeline_session[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: DataGraphPipelineSessionCreateInfoARM,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut session: DataGraphPipelineSessionARM,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDataGraphPipelineSessionARM.html
        """
        return self._create_data_graph_pipeline_session(
            device,
            Ptr(to=create_info).bitcast[DataGraphPipelineSessionCreateInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=session).bitcast[DataGraphPipelineSessionARM]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_data_graph_pipeline_session_bind_point_requirements[
        p_bind_point_requirements_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        device: Device,
        info: DataGraphPipelineSessionBindPointRequirementsInfoARM,
        mut bind_point_requirement_count: UInt32,
        p_bind_point_requirements: Optional[Ptr[DataGraphPipelineSessionBindPointRequirementARM, p_bind_point_requirements_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineSessionBindPointRequirementsARM.html
        """
        return self._get_data_graph_pipeline_session_bind_point_requirements(
            device,
            Ptr(to=info).bitcast[DataGraphPipelineSessionBindPointRequirementsInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=bind_point_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_bind_point_requirements).bitcast[Optional[Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutUntrackedOrigin]]]()[],
        )

    def get_data_graph_pipeline_session_bind_point_requirements[
        p_bind_point_requirements_origin: MutOrigin = MutUntrackedOrigin
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
                Ptr(to=info).bitcast[DataGraphPipelineSessionBindPointRequirementsInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[DataGraphPipelineSessionBindPointRequirementARM, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_data_graph_pipeline_session_bind_point_requirements(
                device,
                Ptr(to=info).bitcast[DataGraphPipelineSessionBindPointRequirementsInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_data_graph_pipeline_session_memory_requirements(
        self,
        device: Device,
        info: DataGraphPipelineSessionMemoryRequirementsInfoARM,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineSessionMemoryRequirementsARM.html
        """
        return self._get_data_graph_pipeline_session_memory_requirements(
            device,
            Ptr(to=info).bitcast[DataGraphPipelineSessionMemoryRequirementsInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def bind_data_graph_pipeline_session_memory[
        p_bind_infos_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
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
            Ptr(to=p_bind_infos).bitcast[Ptr[BindDataGraphPipelineSessionMemoryInfoARM, ImmutUntrackedOrigin]]()[],
        )

    def destroy_data_graph_pipeline_session[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        session: DataGraphPipelineSessionARM,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDataGraphPipelineSessionARM.html
        """
        return self._destroy_data_graph_pipeline_session(
            device,
            session,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_dispatch_data_graph[p_info_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        session: DataGraphPipelineSessionARM,
        p_info: Optional[Ptr[DataGraphPipelineDispatchInfoARM, p_info_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchDataGraphARM.html
        """
        return self._cmd_dispatch_data_graph(
            command_buffer,
            session,
            Ptr(to=p_info).bitcast[Optional[Ptr[DataGraphPipelineDispatchInfoARM, ImmutUntrackedOrigin]]]()[],
        )

    def get_data_graph_pipeline_available_properties[
        p_properties_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        device: Device,
        pipeline_info: DataGraphPipelineInfoARM,
        mut properties_count: UInt32,
        p_properties: Optional[Ptr[DataGraphPipelinePropertyARM, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDataGraphPipelineAvailablePropertiesARM.html
        """
        return self._get_data_graph_pipeline_available_properties(
            device,
            Ptr(to=pipeline_info).bitcast[DataGraphPipelineInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=properties_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[DataGraphPipelinePropertyARM, MutUntrackedOrigin]]]()[],
        )

    def get_data_graph_pipeline_available_properties[
        p_properties_origin: MutOrigin = MutUntrackedOrigin
    ](
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
                Ptr(to=pipeline_info).bitcast[DataGraphPipelineInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[DataGraphPipelinePropertyARM, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_data_graph_pipeline_available_properties(
                device,
                Ptr(to=pipeline_info).bitcast[DataGraphPipelineInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_data_graph_pipeline_properties[p_properties_origin: MutOrigin = MutUntrackedOrigin](
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
            Ptr(to=pipeline_info).bitcast[DataGraphPipelineInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            properties_count,
            Ptr(to=p_properties).bitcast[Ptr[DataGraphPipelinePropertyQueryResultARM, MutUntrackedOrigin]]()[],
        )

    def get_physical_device_queue_family_data_graph_properties[
        p_queue_family_data_graph_properties_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut queue_family_data_graph_property_count: UInt32,
        p_queue_family_data_graph_properties: Optional[Ptr[QueueFamilyDataGraphPropertiesARM, p_queue_family_data_graph_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyDataGraphPropertiesARM.html
        """
        return self._get_physical_device_queue_family_data_graph_properties(
            physical_device,
            queue_family_index,
            Ptr(to=queue_family_data_graph_property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_queue_family_data_graph_properties).bitcast[Optional[Ptr[QueueFamilyDataGraphPropertiesARM, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_queue_family_data_graph_properties[
        p_queue_family_data_graph_properties_origin: MutOrigin = MutUntrackedOrigin
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
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[QueueFamilyDataGraphPropertiesARM, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_queue_family_data_graph_properties(
                physical_device,
                queue_family_index,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_queue_family_data_graph_processing_engine_properties(
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
            Ptr(to=queue_family_data_graph_processing_engine_info).bitcast[PhysicalDeviceQueueFamilyDataGraphProcessingEngineInfoARM]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=queue_family_data_graph_processing_engine_properties).bitcast[QueueFamilyDataGraphProcessingEnginePropertiesARM]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct PerformanceCountersByRegion(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _enumerate_physical_device_queue_family_performance_counters_by_region: def(
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        p_counter_count: Ptr[UInt32, MutUntrackedOrigin],
        p_counters: Optional[Ptr[PerformanceCounterARM, MutUntrackedOrigin]],
        p_counter_descriptions: Optional[Ptr[PerformanceCounterDescriptionARM, MutUntrackedOrigin]],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._enumerate_physical_device_queue_family_performance_counters_by_region = Ptr(to=get_device_proc_addr(
            device, "vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM".as_c_string_slice()
        )).bitcast[type_of(self._enumerate_physical_device_queue_family_performance_counters_by_region)]()[]

    def enumerate_physical_device_queue_family_performance_counters_by_region[
        p_counters_origin: MutOrigin = MutUntrackedOrigin,
        p_counter_descriptions_origin: MutOrigin = MutUntrackedOrigin,
    ](
        self,
        physical_device: PhysicalDevice,
        queue_family_index: UInt32,
        mut counter_count: UInt32,
        p_counters: Optional[Ptr[PerformanceCounterARM, p_counters_origin]],
        p_counter_descriptions: Optional[Ptr[PerformanceCounterDescriptionARM, p_counter_descriptions_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceQueueFamilyPerformanceCountersByRegionARM.html
        """
        return self._enumerate_physical_device_queue_family_performance_counters_by_region(
            physical_device,
            queue_family_index,
            Ptr(to=counter_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_counters).bitcast[Optional[Ptr[PerformanceCounterARM, MutUntrackedOrigin]]]()[],
            Ptr(to=p_counter_descriptions).bitcast[Optional[Ptr[PerformanceCounterDescriptionARM, MutUntrackedOrigin]]]()[],
        )
