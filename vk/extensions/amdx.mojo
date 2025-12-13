from vk.core_functions import GlobalFunctions


struct ShaderEnqueue(Copyable):    var _vk_create_execution_graph_pipelines_amdx: fn(
        device: Device,
        pipelineCache: PipelineCache,
        createInfoCount: UInt32,
        pCreateInfos: Ptr[ExecutionGraphPipelineCreateInfoAMDX, ImmutOrigin.external],
        pAllocator: Ptr[AllocationCallbacks, ImmutOrigin.external],
        pPipelines: Ptr[Pipeline, MutOrigin.external],
    ) -> Result
    var _vk_get_execution_graph_pipeline_scratch_size_amdx: fn(
        device: Device,
        executionGraph: Pipeline,
        pSizeInfo: Ptr[ExecutionGraphPipelineScratchSizeAMDX, MutOrigin.external],
    ) -> Result
    var _vk_get_execution_graph_pipeline_node_index_amdx: fn(
        device: Device,
        executionGraph: Pipeline,
        pNodeInfo: Ptr[PipelineShaderStageNodeCreateInfoAMDX, ImmutOrigin.external],
        pNodeIndex: Ptr[UInt32, MutOrigin.external],
    ) -> Result
    var _vk_cmd_initialize_graph_scratch_memory_amdx: fn(
        commandBuffer: CommandBuffer,
        executionGraph: Pipeline,
        scratch: DeviceAddress,
        scratchSize: DeviceSize,
    )
    var _vk_cmd_dispatch_graph_amdx: fn(
        commandBuffer: CommandBuffer,
        scratch: DeviceAddress,
        scratchSize: DeviceSize,
        pCountInfo: Ptr[DispatchGraphCountInfoAMDX, ImmutOrigin.external],
    )
    var _vk_cmd_dispatch_graph_indirect_amdx: fn(
        commandBuffer: CommandBuffer,
        scratch: DeviceAddress,
        scratchSize: DeviceSize,
        pCountInfo: Ptr[DispatchGraphCountInfoAMDX, ImmutOrigin.external],
    )
    var _vk_cmd_dispatch_graph_indirect_count_amdx: fn(
        commandBuffer: CommandBuffer,
        scratch: DeviceAddress,
        scratchSize: DeviceSize,
        countInfo: DeviceAddress,
    )
