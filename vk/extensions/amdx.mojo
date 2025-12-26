from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct ShaderEnqueue(Copyable):
    var _create_execution_graph_pipelines_amdx: fn(
        device: Device,
        pipelineCache: PipelineCache,
        createInfoCount: UInt32,
        pCreateInfos: Ptr[ExecutionGraphPipelineCreateInfoAMDX, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pPipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _get_execution_graph_pipeline_scratch_size_amdx: fn(
        device: Device,
        executionGraph: Pipeline,
        pSizeInfo: Ptr[ExecutionGraphPipelineScratchSizeAMDX, MutAnyOrigin],
    ) -> Result
    var _get_execution_graph_pipeline_node_index_amdx: fn(
        device: Device,
        executionGraph: Pipeline,
        pNodeInfo: Ptr[PipelineShaderStageNodeCreateInfoAMDX, ImmutAnyOrigin],
        pNodeIndex: Ptr[UInt32, MutAnyOrigin],
    ) -> Result
    var _cmd_initialize_graph_scratch_memory_amdx: fn(
        commandBuffer: CommandBuffer,
        executionGraph: Pipeline,
        scratch: DeviceAddress,
        scratchSize: DeviceSize,
    )
    var _cmd_dispatch_graph_amdx: fn(
        commandBuffer: CommandBuffer,
        scratch: DeviceAddress,
        scratchSize: DeviceSize,
        pCountInfo: Ptr[DispatchGraphCountInfoAMDX, ImmutAnyOrigin],
    )
    var _cmd_dispatch_graph_indirect_amdx: fn(
        commandBuffer: CommandBuffer,
        scratch: DeviceAddress,
        scratchSize: DeviceSize,
        pCountInfo: Ptr[DispatchGraphCountInfoAMDX, ImmutAnyOrigin],
    )
    var _cmd_dispatch_graph_indirect_count_amdx: fn(
        commandBuffer: CommandBuffer,
        scratch: DeviceAddress,
        scratchSize: DeviceSize,
        countInfo: DeviceAddress,
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device) raises:
        var get_device_proc_addr = global_fns.borrow_handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_execution_graph_pipelines_amdx = Ptr(to=get_device_proc_addr(
            device, "vkCreateExecutionGraphPipelinesAMDX".unsafe_ptr()
        )).bitcast[type_of(self._create_execution_graph_pipelines_amdx)]()[]
        if not Ptr(to=self._create_execution_graph_pipelines_amdx).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkCreateExecutionGraphPipelinesAMDX."
        self._get_execution_graph_pipeline_scratch_size_amdx = Ptr(to=get_device_proc_addr(
            device, "vkGetExecutionGraphPipelineScratchSizeAMDX".unsafe_ptr()
        )).bitcast[type_of(self._get_execution_graph_pipeline_scratch_size_amdx)]()[]
        if not Ptr(to=self._get_execution_graph_pipeline_scratch_size_amdx).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkGetExecutionGraphPipelineScratchSizeAMDX."
        self._get_execution_graph_pipeline_node_index_amdx = Ptr(to=get_device_proc_addr(
            device, "vkGetExecutionGraphPipelineNodeIndexAMDX".unsafe_ptr()
        )).bitcast[type_of(self._get_execution_graph_pipeline_node_index_amdx)]()[]
        if not Ptr(to=self._get_execution_graph_pipeline_node_index_amdx).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkGetExecutionGraphPipelineNodeIndexAMDX."
        self._cmd_initialize_graph_scratch_memory_amdx = Ptr(to=get_device_proc_addr(
            device, "vkCmdInitializeGraphScratchMemoryAMDX".unsafe_ptr()
        )).bitcast[type_of(self._cmd_initialize_graph_scratch_memory_amdx)]()[]
        if not Ptr(to=self._cmd_initialize_graph_scratch_memory_amdx).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkCmdInitializeGraphScratchMemoryAMDX."
        self._cmd_dispatch_graph_amdx = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchGraphAMDX".unsafe_ptr()
        )).bitcast[type_of(self._cmd_dispatch_graph_amdx)]()[]
        if not Ptr(to=self._cmd_dispatch_graph_amdx).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkCmdDispatchGraphAMDX."
        self._cmd_dispatch_graph_indirect_amdx = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchGraphIndirectAMDX".unsafe_ptr()
        )).bitcast[type_of(self._cmd_dispatch_graph_indirect_amdx)]()[]
        if not Ptr(to=self._cmd_dispatch_graph_indirect_amdx).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkCmdDispatchGraphIndirectAMDX."
        self._cmd_dispatch_graph_indirect_count_amdx = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchGraphIndirectCountAMDX".unsafe_ptr()
        )).bitcast[type_of(self._cmd_dispatch_graph_indirect_count_amdx)]()[]
        if not Ptr(to=self._cmd_dispatch_graph_indirect_count_amdx).bitcast[Ptr[NoneType, MutOrigin.external]]()[]:
            raise "Could not load vkCmdDispatchGraphIndirectCountAMDX."

    fn create_execution_graph_pipelines_amdx(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ExecutionGraphPipelineCreateInfoAMDX, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateExecutionGraphPipelinesAMDX.html
        """
        return self._create_execution_graph_pipelines_amdx(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
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
            device,
            execution_graph,
            Ptr(to=size_info).bitcast[ExecutionGraphPipelineScratchSizeAMDX](),
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
            device,
            execution_graph,
            Ptr(to=node_info).bitcast[PipelineShaderStageNodeCreateInfoAMDX](),
            Ptr(to=node_index).bitcast[UInt32](),
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
        return self._cmd_dispatch_graph_amdx(
            command_buffer,
            scratch,
            scratch_size,
            Ptr(to=count_info).bitcast[DispatchGraphCountInfoAMDX](),
        )

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
            command_buffer,
            scratch,
            scratch_size,
            Ptr(to=count_info).bitcast[DispatchGraphCountInfoAMDX](),
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
