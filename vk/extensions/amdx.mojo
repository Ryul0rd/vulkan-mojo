from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ShaderEnqueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_execution_graph_pipelines: def(
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ExecutionGraphPipelineCreateInfoAMDX, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) thin abi("C") -> Result
    var _get_execution_graph_pipeline_scratch_size: def(
        device: Device,
        execution_graph: Pipeline,
        p_size_info: Ptr[ExecutionGraphPipelineScratchSizeAMDX, MutAnyOrigin],
    ) thin abi("C") -> Result
    var _get_execution_graph_pipeline_node_index: def(
        device: Device,
        execution_graph: Pipeline,
        p_node_info: Ptr[PipelineShaderStageNodeCreateInfoAMDX, ImmutAnyOrigin],
        p_node_index: Ptr[UInt32, MutAnyOrigin],
    ) thin abi("C") -> Result
    var _cmd_initialize_graph_scratch_memory: def(
        command_buffer: CommandBuffer,
        execution_graph: Pipeline,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
    ) thin abi("C")
    var _cmd_dispatch_graph: def(
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        p_count_info: Ptr[DispatchGraphCountInfoAMDX, ImmutAnyOrigin],
    ) thin abi("C")
    var _cmd_dispatch_graph_indirect: def(
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        p_count_info: Ptr[DispatchGraphCountInfoAMDX, ImmutAnyOrigin],
    ) thin abi("C")
    var _cmd_dispatch_graph_indirect_count: def(
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DeviceAddress,
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_execution_graph_pipelines = Ptr(to=get_device_proc_addr(
            device, "vkCreateExecutionGraphPipelinesAMDX".as_c_string_slice()
        )).bitcast[type_of(self._create_execution_graph_pipelines)]()[]
        self._get_execution_graph_pipeline_scratch_size = Ptr(to=get_device_proc_addr(
            device, "vkGetExecutionGraphPipelineScratchSizeAMDX".as_c_string_slice()
        )).bitcast[type_of(self._get_execution_graph_pipeline_scratch_size)]()[]
        self._get_execution_graph_pipeline_node_index = Ptr(to=get_device_proc_addr(
            device, "vkGetExecutionGraphPipelineNodeIndexAMDX".as_c_string_slice()
        )).bitcast[type_of(self._get_execution_graph_pipeline_node_index)]()[]
        self._cmd_initialize_graph_scratch_memory = Ptr(to=get_device_proc_addr(
            device, "vkCmdInitializeGraphScratchMemoryAMDX".as_c_string_slice()
        )).bitcast[type_of(self._cmd_initialize_graph_scratch_memory)]()[]
        self._cmd_dispatch_graph = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchGraphAMDX".as_c_string_slice()
        )).bitcast[type_of(self._cmd_dispatch_graph)]()[]
        self._cmd_dispatch_graph_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchGraphIndirectAMDX".as_c_string_slice()
        )).bitcast[type_of(self._cmd_dispatch_graph_indirect)]()[]
        self._cmd_dispatch_graph_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchGraphIndirectCountAMDX".as_c_string_slice()
        )).bitcast[type_of(self._cmd_dispatch_graph_indirect_count)]()[]

    def create_execution_graph_pipelines[
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
        return self._create_execution_graph_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[ExecutionGraphPipelineCreateInfoAMDX, ImmutAnyOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutAnyOrigin]]()[],
        )

    def get_execution_graph_pipeline_scratch_size(
        self,
        device: Device,
        execution_graph: Pipeline,
        mut size_info: ExecutionGraphPipelineScratchSizeAMDX,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetExecutionGraphPipelineScratchSizeAMDX.html
        """
        return self._get_execution_graph_pipeline_scratch_size(device, execution_graph, Ptr(to=size_info))

    def get_execution_graph_pipeline_node_index(
        self,
        device: Device,
        execution_graph: Pipeline,
        node_info: PipelineShaderStageNodeCreateInfoAMDX,
        mut node_index: UInt32,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetExecutionGraphPipelineNodeIndexAMDX.html
        """
        return self._get_execution_graph_pipeline_node_index(
            device, execution_graph, Ptr(to=node_info), Ptr(to=node_index)
        )

    def cmd_initialize_graph_scratch_memory(
        self,
        command_buffer: CommandBuffer,
        execution_graph: Pipeline,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdInitializeGraphScratchMemoryAMDX.html
        """
        return self._cmd_initialize_graph_scratch_memory(
            command_buffer, execution_graph, scratch, scratch_size
        )

    def cmd_dispatch_graph(
        self,
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DispatchGraphCountInfoAMDX,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchGraphAMDX.html
        """
        return self._cmd_dispatch_graph(command_buffer, scratch, scratch_size, Ptr(to=count_info))

    def cmd_dispatch_graph_indirect(
        self,
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DispatchGraphCountInfoAMDX,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchGraphIndirectAMDX.html
        """
        return self._cmd_dispatch_graph_indirect(command_buffer, scratch, scratch_size, Ptr(to=count_info))

    def cmd_dispatch_graph_indirect_count(
        self,
        command_buffer: CommandBuffer,
        scratch: DeviceAddress,
        scratch_size: DeviceSize,
        count_info: DeviceAddress,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchGraphIndirectCountAMDX.html
        """
        return self._cmd_dispatch_graph_indirect_count(command_buffer, scratch, scratch_size, count_info)
