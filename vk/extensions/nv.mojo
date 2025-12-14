from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct ExternalMemoryCapabilities(Copyable):    var _vk_get_physical_device_external_image_format_properties_nv: fn(
        physicalDevice: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        externalHandleType: ExternalMemoryHandleTypeFlagsNV,
        pExternalImageFormatProperties: Ptr[ExternalImageFormatPropertiesNV, MutAnyOrigin],
    ) -> Result


struct ExternalMemoryWin32(Copyable):    var _vk_get_memory_win_32_handle_nv: fn(
        device: Device,
        memory: DeviceMemory,
        handleType: ExternalMemoryHandleTypeFlagsNV,
        pHandle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result


struct ClipSpaceWScaling(Copyable):    var _vk_cmd_set_viewport_w_scaling_nv: fn(
        commandBuffer: CommandBuffer,
        firstViewport: UInt32,
        viewportCount: UInt32,
        pViewportWScalings: Ptr[ViewportWScalingNV, ImmutAnyOrigin],
    )


struct ShadingRateImage(Copyable):    var _vk_cmd_bind_shading_rate_image_nv: fn(
        commandBuffer: CommandBuffer, imageView: ImageView, imageLayout: ImageLayout
    )
    var _vk_cmd_set_viewport_shading_rate_palette_nv: fn(
        commandBuffer: CommandBuffer,
        firstViewport: UInt32,
        viewportCount: UInt32,
        pShadingRatePalettes: Ptr[ShadingRatePaletteNV, ImmutAnyOrigin],
    )
    var _vk_cmd_set_coarse_sample_order_nv: fn(
        commandBuffer: CommandBuffer,
        sampleOrderType: CoarseSampleOrderTypeNV,
        customSampleOrderCount: UInt32,
        pCustomSampleOrders: Ptr[CoarseSampleOrderCustomNV, ImmutAnyOrigin],
    )


struct RayTracing(Copyable):    var _vk_create_acceleration_structure_nv: fn(
        device: Device,
        pCreateInfo: Ptr[AccelerationStructureCreateInfoNV, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pAccelerationStructure: Ptr[AccelerationStructureNV, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_acceleration_structure_nv: fn(
        device: Device,
        accelerationStructure: AccelerationStructureNV,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_get_acceleration_structure_memory_requirements_nv: fn(
        device: Device,
        pInfo: Ptr[AccelerationStructureMemoryRequirementsInfoNV, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2KHR, MutAnyOrigin],
    )
    var _vk_bind_acceleration_structure_memory_nv: fn(
        device: Device,
        bindInfoCount: UInt32,
        pBindInfos: Ptr[BindAccelerationStructureMemoryInfoNV, ImmutAnyOrigin],
    ) -> Result
    var _vk_cmd_build_acceleration_structure_nv: fn(
        commandBuffer: CommandBuffer,
        pInfo: Ptr[AccelerationStructureInfoNV, ImmutAnyOrigin],
        instanceData: Buffer,
        instanceOffset: DeviceSize,
        update: Bool32,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        scratch: Buffer,
        scratchOffset: DeviceSize,
    )
    var _vk_cmd_copy_acceleration_structure_nv: fn(
        commandBuffer: CommandBuffer,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        mode: CopyAccelerationStructureModeKHR,
    )
    var _vk_cmd_trace_rays_nv: fn(
        commandBuffer: CommandBuffer,
        raygenShaderBindingTableBuffer: Buffer,
        raygenShaderBindingOffset: DeviceSize,
        missShaderBindingTableBuffer: Buffer,
        missShaderBindingOffset: DeviceSize,
        missShaderBindingStride: DeviceSize,
        hitShaderBindingTableBuffer: Buffer,
        hitShaderBindingOffset: DeviceSize,
        hitShaderBindingStride: DeviceSize,
        callableShaderBindingTableBuffer: Buffer,
        callableShaderBindingOffset: DeviceSize,
        callableShaderBindingStride: DeviceSize,
        width: UInt32,
        height: UInt32,
        depth: UInt32,
    )
    var _vk_create_ray_tracing_pipelines_nv: fn(
        device: Device,
        pipelineCache: PipelineCache,
        createInfoCount: UInt32,
        pCreateInfos: Ptr[RayTracingPipelineCreateInfoNV, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pPipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _vk_get_ray_tracing_shader_group_handles_khr: fn(
        device: Device,
        pipeline: Pipeline,
        firstGroup: UInt32,
        groupCount: UInt32,
        dataSize: UInt,
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_get_acceleration_structure_handle_nv: fn(
        device: Device,
        accelerationStructure: AccelerationStructureNV,
        dataSize: UInt,
        pData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_cmd_write_acceleration_structures_properties_nv: fn(
        commandBuffer: CommandBuffer,
        accelerationStructureCount: UInt32,
        pAccelerationStructures: Ptr[AccelerationStructureNV, ImmutAnyOrigin],
        queryType: QueryType,
        queryPool: QueryPool,
        firstQuery: UInt32,
    )
    var _vk_compile_deferred_nv: fn(device: Device, pipeline: Pipeline, shader: UInt32) -> Result


struct MeshShader(Copyable):    var _vk_cmd_draw_mesh_tasks_nv: fn(
        commandBuffer: CommandBuffer, taskCount: UInt32, firstTask: UInt32
    )
    var _vk_cmd_draw_mesh_tasks_indirect_nv: fn(
        commandBuffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        drawCount: UInt32,
        stride: UInt32,
    )
    var _vk_cmd_draw_mesh_tasks_indirect_count_nv: fn(
        commandBuffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        countBuffer: Buffer,
        countBufferOffset: DeviceSize,
        maxDrawCount: UInt32,
        stride: UInt32,
    )


struct ScissorExclusive(Copyable):    var _vk_cmd_set_exclusive_scissor_enable_nv: fn(
        commandBuffer: CommandBuffer,
        firstExclusiveScissor: UInt32,
        exclusiveScissorCount: UInt32,
        pExclusiveScissorEnables: Ptr[Bool32, ImmutAnyOrigin],
    )
    var _vk_cmd_set_exclusive_scissor_nv: fn(
        commandBuffer: CommandBuffer,
        firstExclusiveScissor: UInt32,
        exclusiveScissorCount: UInt32,
        pExclusiveScissors: Ptr[Rect2D, ImmutAnyOrigin],
    )


struct DeviceDiagnosticCheckpoints(Copyable):    var _vk_cmd_set_checkpoint_nv: fn(
        commandBuffer: CommandBuffer, pCheckpointMarker: Ptr[NoneType, ImmutAnyOrigin]
    )
    var _vk_get_queue_checkpoint_data_nv: fn(
        queue: Queue,
        pCheckpointDataCount: Ptr[UInt32, MutAnyOrigin],
        pCheckpointData: Ptr[CheckpointDataNV, MutAnyOrigin],
    )
    var _vk_get_queue_checkpoint_data_2_nv: fn(
        queue: Queue,
        pCheckpointDataCount: Ptr[UInt32, MutAnyOrigin],
        pCheckpointData: Ptr[CheckpointData2NV, MutAnyOrigin],
    )


struct CooperativeMatrix(Copyable):    var _vk_get_physical_device_cooperative_matrix_properties_nv: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[CooperativeMatrixPropertiesNV, MutAnyOrigin],
    ) -> Result


struct CoverageReductionMode(Copyable):    var _vk_get_physical_device_supported_framebuffer_mixed_samples_combinations_nv: fn(
        physicalDevice: PhysicalDevice,
        pCombinationCount: Ptr[UInt32, MutAnyOrigin],
        pCombinations: Ptr[FramebufferMixedSamplesCombinationNV, MutAnyOrigin],
    ) -> Result


struct DeviceGeneratedCommands(Copyable):    var _vk_get_generated_commands_memory_requirements_nv: fn(
        device: Device,
        pInfo: Ptr[GeneratedCommandsMemoryRequirementsInfoNV, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _vk_cmd_preprocess_generated_commands_nv: fn(
        commandBuffer: CommandBuffer,
        pGeneratedCommandsInfo: Ptr[GeneratedCommandsInfoNV, ImmutAnyOrigin],
    )
    var _vk_cmd_execute_generated_commands_nv: fn(
        commandBuffer: CommandBuffer,
        isPreprocessed: Bool32,
        pGeneratedCommandsInfo: Ptr[GeneratedCommandsInfoNV, ImmutAnyOrigin],
    )
    var _vk_cmd_bind_pipeline_shader_group_nv: fn(
        commandBuffer: CommandBuffer,
        pipelineBindPoint: PipelineBindPoint,
        pipeline: Pipeline,
        groupIndex: UInt32,
    )
    var _vk_create_indirect_commands_layout_nv: fn(
        device: Device,
        pCreateInfo: Ptr[IndirectCommandsLayoutCreateInfoNV, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pIndirectCommandsLayout: Ptr[IndirectCommandsLayoutNV, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_indirect_commands_layout_nv: fn(
        device: Device,
        indirectCommandsLayout: IndirectCommandsLayoutNV,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )


struct CudaKernelLaunch(Copyable):    var _vk_create_cuda_module_nv: fn(
        device: Device,
        pCreateInfo: Ptr[CudaModuleCreateInfoNV, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pModule: Ptr[CudaModuleNV, MutAnyOrigin],
    ) -> Result
    var _vk_get_cuda_module_cache_nv: fn(
        device: Device,
        module: CudaModuleNV,
        pCacheSize: Ptr[UInt, MutAnyOrigin],
        pCacheData: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _vk_create_cuda_function_nv: fn(
        device: Device,
        pCreateInfo: Ptr[CudaFunctionCreateInfoNV, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pFunction: Ptr[CudaFunctionNV, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_cuda_module_nv: fn(
        device: Device, module: CudaModuleNV, pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _vk_destroy_cuda_function_nv: fn(
        device: Device,
        function: CudaFunctionNV,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_cmd_cuda_launch_kernel_nv: fn(
        commandBuffer: CommandBuffer, pLaunchInfo: Ptr[CudaLaunchInfoNV, ImmutAnyOrigin]
    )


struct FragmentShadingRateEnums(Copyable):    var _vk_cmd_set_fragment_shading_rate_enum_nv: fn(
        commandBuffer: CommandBuffer,
        shadingRate: FragmentShadingRateNV,
        combinerOps: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    )


struct AcquireWinrtDisplay(Copyable):    var _vk_acquire_winrt_display_nv: fn(
        physicalDevice: PhysicalDevice, display: DisplayKHR
    ) -> Result
    var _vk_get_winrt_display_nv: fn(
        physicalDevice: PhysicalDevice,
        deviceRelativeId: UInt32,
        pDisplay: Ptr[DisplayKHR, MutAnyOrigin],
    ) -> Result


struct ExternalMemoryRdma(Copyable):    var _vk_get_memory_remote_address_nv: fn(
        device: Device,
        pMemoryGetRemoteAddressInfo: Ptr[MemoryGetRemoteAddressInfoNV, ImmutAnyOrigin],
        pAddress: Ptr[RemoteAddressNV, MutAnyOrigin],
    ) -> Result


struct CopyMemoryIndirect(Copyable):    var _vk_cmd_copy_memory_indirect_nv: fn(
        commandBuffer: CommandBuffer,
        copyBufferAddress: DeviceAddress,
        copyCount: UInt32,
        stride: UInt32,
    )
    var _vk_cmd_copy_memory_to_image_indirect_nv: fn(
        commandBuffer: CommandBuffer,
        copyBufferAddress: DeviceAddress,
        copyCount: UInt32,
        stride: UInt32,
        dstImage: Image,
        dstImageLayout: ImageLayout,
        pImageSubresources: Ptr[ImageSubresourceLayers, ImmutAnyOrigin],
    )


struct MemoryDecompression(Copyable):    var _vk_cmd_decompress_memory_nv: fn(
        commandBuffer: CommandBuffer,
        decompressRegionCount: UInt32,
        pDecompressMemoryRegions: Ptr[DecompressMemoryRegionNV, ImmutAnyOrigin],
    )
    var _vk_cmd_decompress_memory_indirect_count_nv: fn(
        commandBuffer: CommandBuffer,
        indirectCommandsAddress: DeviceAddress,
        indirectCommandsCountAddress: DeviceAddress,
        stride: UInt32,
    )


struct DeviceGeneratedCommandsCompute(Copyable):    var _vk_get_pipeline_indirect_memory_requirements_nv: fn(
        device: Device,
        pCreateInfo: Ptr[ComputePipelineCreateInfo, ImmutAnyOrigin],
        pMemoryRequirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _vk_cmd_update_pipeline_indirect_buffer_nv: fn(
        commandBuffer: CommandBuffer, pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline
    )
    var _vk_get_pipeline_indirect_device_address_nv: fn(
        device: Device, pInfo: Ptr[PipelineIndirectDeviceAddressInfoNV, ImmutAnyOrigin]
    ) -> DeviceAddress


struct OpticalFlow(Copyable):    var _vk_get_physical_device_optical_flow_image_formats_nv: fn(
        physicalDevice: PhysicalDevice,
        pOpticalFlowImageFormatInfo: Ptr[OpticalFlowImageFormatInfoNV, ImmutAnyOrigin],
        pFormatCount: Ptr[UInt32, MutAnyOrigin],
        pImageFormatProperties: Ptr[OpticalFlowImageFormatPropertiesNV, MutAnyOrigin],
    ) -> Result
    var _vk_create_optical_flow_session_nv: fn(
        device: Device,
        pCreateInfo: Ptr[OpticalFlowSessionCreateInfoNV, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pSession: Ptr[OpticalFlowSessionNV, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_optical_flow_session_nv: fn(
        device: Device,
        session: OpticalFlowSessionNV,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_bind_optical_flow_session_image_nv: fn(
        device: Device,
        session: OpticalFlowSessionNV,
        bindingPoint: OpticalFlowSessionBindingPointNV,
        view: ImageView,
        layout: ImageLayout,
    ) -> Result
    var _vk_cmd_optical_flow_execute_nv: fn(
        commandBuffer: CommandBuffer,
        session: OpticalFlowSessionNV,
        pExecuteInfo: Ptr[OpticalFlowExecuteInfoNV, ImmutAnyOrigin],
    )


struct CooperativeVector(Copyable):    var _vk_get_physical_device_cooperative_vector_properties_nv: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[CooperativeVectorPropertiesNV, MutAnyOrigin],
    ) -> Result
    var _vk_convert_cooperative_vector_matrix_nv: fn(
        device: Device, pInfo: Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutAnyOrigin]
    ) -> Result
    var _vk_cmd_convert_cooperative_vector_matrix_nv: fn(
        commandBuffer: CommandBuffer,
        infoCount: UInt32,
        pInfos: Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutAnyOrigin],
    )


struct LowLatency2(Copyable):    var _vk_set_latency_sleep_mode_nv: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pSleepModeInfo: Ptr[LatencySleepModeInfoNV, ImmutAnyOrigin],
    ) -> Result
    var _vk_latency_sleep_nv: fn(
        device: Device, swapchain: SwapchainKHR, pSleepInfo: Ptr[LatencySleepInfoNV, ImmutAnyOrigin]
    ) -> Result
    var _vk_set_latency_marker_nv: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pLatencyMarkerInfo: Ptr[SetLatencyMarkerInfoNV, ImmutAnyOrigin],
    )
    var _vk_get_latency_timings_nv: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pLatencyMarkerInfo: Ptr[GetLatencyMarkerInfoNV, MutAnyOrigin],
    )
    var _vk_queue_notify_out_of_band_nv: fn(
        queue: Queue, pQueueTypeInfo: Ptr[OutOfBandQueueTypeInfoNV, ImmutAnyOrigin]
    )


struct ExternalComputeQueue(Copyable):    var _vk_create_external_compute_queue_nv: fn(
        device: Device,
        pCreateInfo: Ptr[ExternalComputeQueueCreateInfoNV, ImmutAnyOrigin],
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pExternalQueue: Ptr[ExternalComputeQueueNV, MutAnyOrigin],
    ) -> Result
    var _vk_destroy_external_compute_queue_nv: fn(
        device: Device,
        externalQueue: ExternalComputeQueueNV,
        pAllocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _vk_get_external_compute_queue_data_nv: fn(
        externalQueue: ExternalComputeQueueNV,
        params: Ptr[ExternalComputeQueueDataParamsNV, MutAnyOrigin],
        pData: Ptr[NoneType, MutAnyOrigin],
    )


struct ClusterAccelerationStructure(Copyable):    var _vk_get_cluster_acceleration_structure_build_sizes_nv: fn(
        device: Device,
        pInfo: Ptr[ClusterAccelerationStructureInputInfoNV, ImmutAnyOrigin],
        pSizeInfo: Ptr[AccelerationStructureBuildSizesInfoKHR, MutAnyOrigin],
    )
    var _vk_cmd_build_cluster_acceleration_structure_indirect_nv: fn(
        commandBuffer: CommandBuffer,
        pCommandInfos: Ptr[ClusterAccelerationStructureCommandsInfoNV, ImmutAnyOrigin],
    )


struct PartitionedAccelerationStructure(Copyable):    var _vk_get_partitioned_acceleration_structures_build_sizes_nv: fn(
        device: Device,
        pInfo: Ptr[PartitionedAccelerationStructureInstancesInputNV, ImmutAnyOrigin],
        pSizeInfo: Ptr[AccelerationStructureBuildSizesInfoKHR, MutAnyOrigin],
    )
    var _vk_cmd_build_partitioned_acceleration_structures_nv: fn(
        commandBuffer: CommandBuffer,
        pBuildInfo: Ptr[BuildPartitionedAccelerationStructureInfoNV, ImmutAnyOrigin],
    )


struct CooperativeMatrix2(Copyable):    var _vk_get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv: fn(
        physicalDevice: PhysicalDevice,
        pPropertyCount: Ptr[UInt32, MutAnyOrigin],
        pProperties: Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutAnyOrigin],
    ) -> Result
