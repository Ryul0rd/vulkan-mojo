from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ShaderEnqueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_execution_graph_pipelines_amdx: fn(
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ExecutionGraphPipelineCreateInfoAMDX, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _get_execution_graph_pipeline_scratch_size_amdx: fn(
        device: Device,
        execution_graph: Pipeline,
        p_size_info: Ptr[ExecutionGraphPipelineScratchSizeAMDX, MutAnyOrigin],
    ) -> Result
    var _get_execution_graph_pipeline_node_index_amdx: fn(
        device: Device,
        execution_graph: Pipeline,
        p_node_info: Ptr[PipelineShaderStageNodeCreateInfoAMDX, ImmutAnyOrigin],
        p_node_index: Ptr[UInt32, MutAnyOrigin],
    ) -> Result
    var _cmd_initialize_graph_scratch_memory_amdx: fn(
        command_buffer: CommandBuffer,
        execution_graph: Pipeline,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
    )
    var _cmd_dispatch_graph_amdx: fn(
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        p_count_info: Ptr[DispatchGraphCountInfoAMDX, ImmutAnyOrigin],
    )
    var _cmd_dispatch_graph_indirect_amdx: fn(
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        p_count_info: Ptr[DispatchGraphCountInfoAMDX, ImmutAnyOrigin],
    )
    var _cmd_dispatch_graph_indirect_count_amdx: fn(
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DeviceAddress,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_execution_graph_pipelines_amdx = Ptr(to=get_device_proc_addr(
            device, "vkCreateExecutionGraphPipelinesAMDX".as_c_string_slice()
        )).bitcast[type_of(self._create_execution_graph_pipelines_amdx)]()[]
        self._get_execution_graph_pipeline_scratch_size_amdx = Ptr(to=get_device_proc_addr(
            device, "vkGetExecutionGraphPipelineScratchSizeAMDX".as_c_string_slice()
        )).bitcast[type_of(self._get_execution_graph_pipeline_scratch_size_amdx)]()[]
        self._get_execution_graph_pipeline_node_index_amdx = Ptr(to=get_device_proc_addr(
            device, "vkGetExecutionGraphPipelineNodeIndexAMDX".as_c_string_slice()
        )).bitcast[type_of(self._get_execution_graph_pipeline_node_index_amdx)]()[]
        self._cmd_initialize_graph_scratch_memory_amdx = Ptr(to=get_device_proc_addr(
            device, "vkCmdInitializeGraphScratchMemoryAMDX".as_c_string_slice()
        )).bitcast[type_of(self._cmd_initialize_graph_scratch_memory_amdx)]()[]
        self._cmd_dispatch_graph_amdx = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchGraphAMDX".as_c_string_slice()
        )).bitcast[type_of(self._cmd_dispatch_graph_amdx)]()[]
        self._cmd_dispatch_graph_indirect_amdx = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchGraphIndirectAMDX".as_c_string_slice()
        )).bitcast[type_of(self._cmd_dispatch_graph_indirect_amdx)]()[]
        self._cmd_dispatch_graph_indirect_count_amdx = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchGraphIndirectCountAMDX".as_c_string_slice()
        )).bitcast[type_of(self._cmd_dispatch_graph_indirect_count_amdx)]()[]

    fn create_execution_graph_pipelines_amdx[
        p_create_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        p_allocator_origin: ImmutOrigin = ImmutAnyOrigin,
        p_pipelines_origin: MutOrigin = MutAnyOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ExecutionGraphPipelineCreateInfoAMDX, p_create_infos_origin],
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateExecutionGraphPipelinesAMDX.html
        """
        return self._create_execution_graph_pipelines_amdx(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[ExecutionGraphPipelineCreateInfoAMDX, ImmutAnyOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutAnyOrigin]]()[],
        )

    fn get_execution_graph_pipeline_scratch_size_amdx(
        self,
        device: Device,
        execution_graph: Pipeline,
        mut size_info: ExecutionGraphPipelineScratchSizeAMDX,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetExecutionGraphPipelineScratchSizeAMDX.html
        """
        return self._get_execution_graph_pipeline_scratch_size_amdx(
            device, execution_graph, Ptr(to=size_info)
        )

    fn get_execution_graph_pipeline_node_index_amdx(
        self,
        device: Device,
        execution_graph: Pipeline,
        node_info: PipelineShaderStageNodeCreateInfoAMDX,
        mut node_index: UInt32,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetExecutionGraphPipelineNodeIndexAMDX.html
        """
        return self._get_execution_graph_pipeline_node_index_amdx(
            device, execution_graph, Ptr(to=node_info), Ptr(to=node_index)
        )

    fn cmd_initialize_graph_scratch_memory_amdx(
        self,
        command_buffer: CommandBuffer,
        execution_graph: Pipeline,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdInitializeGraphScratchMemoryAMDX.html
        """
        return self._cmd_initialize_graph_scratch_memory_amdx(
            command_buffer, execution_graph, scratch, scratch_size
        )

    fn cmd_dispatch_graph_amdx(
        self,
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DispatchGraphCountInfoAMDX,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchGraphAMDX.html
        """
        return self._cmd_dispatch_graph_amdx(command_buffer, scratch, scratch_size, Ptr(to=count_info))

    fn cmd_dispatch_graph_indirect_amdx(
        self,
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DispatchGraphCountInfoAMDX,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchGraphIndirectAMDX.html
        """
        return self._cmd_dispatch_graph_indirect_amdx(
            command_buffer, scratch, scratch_size, Ptr(to=count_info)
        )

    fn cmd_dispatch_graph_indirect_count_amdx(
        self,
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DeviceAddress,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchGraphIndirectCountAMDX.html
        """
        return self._cmd_dispatch_graph_indirect_count_amdx(
            command_buffer, scratch, scratch_size, count_info
        )
