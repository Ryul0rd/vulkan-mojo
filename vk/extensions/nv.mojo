from vk.core_functions import GlobalFunctions


struct ExternalMemoryCapabilities(Copyable, Movable):
    var _get_physical_device_external_image_format_properties_nv: fn(
        physicalDevice: PhysicalDevice, format: Format, type: ImageType, tiling: ImageTiling, usage: ImageUsageFlags, flags: ImageCreateFlags, externalHandleType: ExternalMemoryHandleTypeFlagsNV, pExternalImageFormatProperties: Ptr[ExternalImageFormatPropertiesNV]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, instance: Instance):
        var get_instance_proc_addr = global_fns.handle().get_function[
            fn(instance: Instance, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_external_image_format_properties_nv = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalImageFormatPropertiesNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_external_image_format_properties_nv)]()[]

    fn get_physical_device_external_image_format_properties_nv(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        external_handle_type: ExternalMemoryHandleTypeFlagsNV,
        mut external_image_format_properties: ExternalImageFormatPropertiesNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_external_image_format_properties_nv(
            physical_device,
            format,
            type,
            tiling,
            usage,
            flags,
            external_handle_type,
            Ptr(to=external_image_format_properties),
        )


struct ExternalMemoryWin32(Copyable, Movable):
    var _get_memory_win_32_handle_nv: fn(
        device: Device, memory: DeviceMemory, handleType: ExternalMemoryHandleTypeFlagsNV, pHandle: Ptr[HANDLE]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_win_32_handle_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryWin32HandleNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_win_32_handle_nv)]()[]

    fn get_memory_win_32_handle_nv(
        self,
        device: Device,
        memory: DeviceMemory,
        handle_type: ExternalMemoryHandleTypeFlagsNV,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_win_32_handle_nv(device, memory, handle_type, Ptr(to=handle))


struct ClipSpaceWScaling(Copyable, Movable):
    var _cmd_set_viewport_w_scaling_nv: fn(
        commandBuffer: CommandBuffer, firstViewport: UInt32, viewportCount: UInt32, pViewportWScalings: Ptr[ViewportWScalingNV]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_viewport_w_scaling_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWScalingNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_viewport_w_scaling_nv)]()[]

    fn cmd_set_viewport_w_scaling_nv(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_w_scalings: Ptr[ViewportWScalingNV],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_viewport_w_scaling_nv(
            command_buffer, first_viewport, viewport_count, p_viewport_w_scalings
        )


struct ShadingRateImage(Copyable, Movable):
    var _cmd_bind_shading_rate_image_nv: fn(
        commandBuffer: CommandBuffer, imageView: ImageView, imageLayout: ImageLayout
    )
    var _cmd_set_viewport_shading_rate_palette_nv: fn(
        commandBuffer: CommandBuffer, firstViewport: UInt32, viewportCount: UInt32, pShadingRatePalettes: Ptr[ShadingRatePaletteNV]
    )
    var _cmd_set_coarse_sample_order_nv: fn(
        commandBuffer: CommandBuffer, sampleOrderType: CoarseSampleOrderTypeNV, customSampleOrderCount: UInt32, pCustomSampleOrders: Ptr[CoarseSampleOrderCustomNV]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_shading_rate_image_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindShadingRateImageNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_shading_rate_image_nv)]()[]
        self._cmd_set_viewport_shading_rate_palette_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportShadingRatePaletteNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_viewport_shading_rate_palette_nv)]()[]
        self._cmd_set_coarse_sample_order_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoarseSampleOrderNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_coarse_sample_order_nv)]()[]

    fn cmd_bind_shading_rate_image_nv(
        self, command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_shading_rate_image_nv(command_buffer, image_view, image_layout)

    fn cmd_set_viewport_shading_rate_palette_nv(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_shading_rate_palettes: Ptr[ShadingRatePaletteNV],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_viewport_shading_rate_palette_nv(
            command_buffer, first_viewport, viewport_count, p_shading_rate_palettes
        )

    fn cmd_set_coarse_sample_order_nv(
        self,
        command_buffer: CommandBuffer,
        sample_order_type: CoarseSampleOrderTypeNV,
        custom_sample_order_count: UInt32,
        p_custom_sample_orders: Ptr[CoarseSampleOrderCustomNV],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_coarse_sample_order_nv(
            command_buffer, sample_order_type, custom_sample_order_count, p_custom_sample_orders
        )


struct RayTracing(Copyable, Movable):
    var _create_acceleration_structure_nv: fn(
        device: Device, pCreateInfo: Ptr[AccelerationStructureCreateInfoNV], pAllocator: Ptr[AllocationCallbacks], pAccelerationStructure: Ptr[AccelerationStructureNV]
    ) -> Result
    var _destroy_acceleration_structure_nv: fn(
        device: Device, accelerationStructure: AccelerationStructureNV, pAllocator: Ptr[AllocationCallbacks]
    )
    var _get_acceleration_structure_memory_requirements_nv: fn(
        device: Device, pInfo: Ptr[AccelerationStructureMemoryRequirementsInfoNV], pMemoryRequirements: Ptr[MemoryRequirements2KHR]
    )
    var _bind_acceleration_structure_memory_nv: fn(
        device: Device, bindInfoCount: UInt32, pBindInfos: Ptr[BindAccelerationStructureMemoryInfoNV]
    ) -> Result
    var _cmd_build_acceleration_structure_nv: fn(
        commandBuffer: CommandBuffer, pInfo: Ptr[AccelerationStructureInfoNV], instanceData: Buffer, instanceOffset: DeviceSize, update: Bool32, dst: AccelerationStructureNV, src: AccelerationStructureNV, scratch: Buffer, scratchOffset: DeviceSize
    )
    var _cmd_copy_acceleration_structure_nv: fn(
        commandBuffer: CommandBuffer, dst: AccelerationStructureNV, src: AccelerationStructureNV, mode: CopyAccelerationStructureModeKHR
    )
    var _cmd_trace_rays_nv: fn(
        commandBuffer: CommandBuffer, raygenShaderBindingTableBuffer: Buffer, raygenShaderBindingOffset: DeviceSize, missShaderBindingTableBuffer: Buffer, missShaderBindingOffset: DeviceSize, missShaderBindingStride: DeviceSize, hitShaderBindingTableBuffer: Buffer, hitShaderBindingOffset: DeviceSize, hitShaderBindingStride: DeviceSize, callableShaderBindingTableBuffer: Buffer, callableShaderBindingOffset: DeviceSize, callableShaderBindingStride: DeviceSize, width: UInt32, height: UInt32, depth: UInt32
    )
    var _create_ray_tracing_pipelines_nv: fn(
        device: Device, pipelineCache: PipelineCache, createInfoCount: UInt32, pCreateInfos: Ptr[RayTracingPipelineCreateInfoNV], pAllocator: Ptr[AllocationCallbacks], pPipelines: Ptr[Pipeline]
    ) -> Result
    var _get_ray_tracing_shader_group_handles_khr: fn(
        device: Device, pipeline: Pipeline, firstGroup: UInt32, groupCount: UInt32, dataSize: UInt, pData: Ptr[NoneType]
    ) -> Result
    var _get_acceleration_structure_handle_nv: fn(
        device: Device, accelerationStructure: AccelerationStructureNV, dataSize: UInt, pData: Ptr[NoneType]
    ) -> Result
    var _cmd_write_acceleration_structures_properties_nv: fn(
        commandBuffer: CommandBuffer, accelerationStructureCount: UInt32, pAccelerationStructures: Ptr[AccelerationStructureNV], queryType: QueryType, queryPool: QueryPool, firstQuery: UInt32
    )
    var _compile_deferred_nv: fn(
        device: Device, pipeline: Pipeline, shader: UInt32
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateAccelerationStructureNV".unsafe_ptr()
        )).bitcast[__type_of(self._create_acceleration_structure_nv)]()[]
        self._destroy_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyAccelerationStructureNV".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_acceleration_structure_nv)]()[]
        self._get_acceleration_structure_memory_requirements_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureMemoryRequirementsNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_acceleration_structure_memory_requirements_nv)]()[]
        self._bind_acceleration_structure_memory_nv = Ptr(to=get_device_proc_addr(
            device, "vkBindAccelerationStructureMemoryNV".unsafe_ptr()
        )).bitcast[__type_of(self._bind_acceleration_structure_memory_nv)]()[]
        self._cmd_build_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildAccelerationStructureNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_build_acceleration_structure_nv)]()[]
        self._cmd_copy_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyAccelerationStructureNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_acceleration_structure_nv)]()[]
        self._cmd_trace_rays_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_trace_rays_nv)]()[]
        self._create_ray_tracing_pipelines_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateRayTracingPipelinesNV".unsafe_ptr()
        )).bitcast[__type_of(self._create_ray_tracing_pipelines_nv)]()[]
        self._get_ray_tracing_shader_group_handles_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingShaderGroupHandlesKHR".unsafe_ptr()
        )).bitcast[__type_of(self._get_ray_tracing_shader_group_handles_khr)]()[]
        self._get_acceleration_structure_handle_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureHandleNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_acceleration_structure_handle_nv)]()[]
        self._cmd_write_acceleration_structures_properties_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteAccelerationStructuresPropertiesNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_write_acceleration_structures_properties_nv)]()[]
        self._compile_deferred_nv = Ptr(to=get_device_proc_addr(
            device, "vkCompileDeferredNV".unsafe_ptr()
        )).bitcast[__type_of(self._compile_deferred_nv)]()[]

    fn create_acceleration_structure_nv(
        self,
        device: Device,
        create_info: AccelerationStructureCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks],
        mut acceleration_structure: AccelerationStructureNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_acceleration_structure_nv(
            device, Ptr(to=create_info), p_allocator, Ptr(to=acceleration_structure)
        )

    fn destroy_acceleration_structure_nv(
        self,
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_acceleration_structure_nv(device, acceleration_structure, p_allocator)

    fn get_acceleration_structure_memory_requirements_nv(
        self,
        device: Device,
        info: AccelerationStructureMemoryRequirementsInfoNV,
        mut memory_requirements: MemoryRequirements2KHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_acceleration_structure_memory_requirements_nv(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn bind_acceleration_structure_memory_nv(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindAccelerationStructureMemoryInfoNV],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._bind_acceleration_structure_memory_nv(device, bind_info_count, p_bind_infos)

    fn cmd_build_acceleration_structure_nv(
        self,
        command_buffer: CommandBuffer,
        info: AccelerationStructureInfoNV,
        instance_data: Buffer,
        instance_offset: DeviceSize,
        update: Bool32,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        scratch: Buffer,
        scratch_offset: DeviceSize,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_build_acceleration_structure_nv(
            command_buffer,
            Ptr(to=info),
            instance_data,
            instance_offset,
            update,
            dst,
            src,
            scratch,
            scratch_offset,
        )

    fn cmd_copy_acceleration_structure_nv(
        self,
        command_buffer: CommandBuffer,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        mode: CopyAccelerationStructureModeKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_acceleration_structure_nv(command_buffer, dst, src, mode)

    fn cmd_trace_rays_nv(
        self,
        command_buffer: CommandBuffer,
        raygen_shader_binding_table_buffer: Buffer,
        raygen_shader_binding_offset: DeviceSize,
        miss_shader_binding_table_buffer: Buffer,
        miss_shader_binding_offset: DeviceSize,
        miss_shader_binding_stride: DeviceSize,
        hit_shader_binding_table_buffer: Buffer,
        hit_shader_binding_offset: DeviceSize,
        hit_shader_binding_stride: DeviceSize,
        callable_shader_binding_table_buffer: Buffer,
        callable_shader_binding_offset: DeviceSize,
        callable_shader_binding_stride: DeviceSize,
        width: UInt32,
        height: UInt32,
        depth: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_trace_rays_nv(
            command_buffer,
            raygen_shader_binding_table_buffer,
            raygen_shader_binding_offset,
            miss_shader_binding_table_buffer,
            miss_shader_binding_offset,
            miss_shader_binding_stride,
            hit_shader_binding_table_buffer,
            hit_shader_binding_offset,
            hit_shader_binding_stride,
            callable_shader_binding_table_buffer,
            callable_shader_binding_offset,
            callable_shader_binding_stride,
            width,
            height,
            depth,
        )

    fn create_ray_tracing_pipelines_nv(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoNV],
        p_allocator: Ptr[AllocationCallbacks],
        p_pipelines: Ptr[Pipeline],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_ray_tracing_pipelines_nv(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn get_ray_tracing_shader_group_handles_khr(
        self,
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_ray_tracing_shader_group_handles_khr(
            device, pipeline, first_group, group_count, data_size, p_data
        )

    fn get_acceleration_structure_handle_nv(
        self,
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        data_size: UInt,
        p_data: Ptr[NoneType],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_acceleration_structure_handle_nv(
            device, acceleration_structure, data_size, p_data
        )

    fn cmd_write_acceleration_structures_properties_nv(
        self,
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureNV],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_write_acceleration_structures_properties_nv(
            command_buffer,
            acceleration_structure_count,
            p_acceleration_structures,
            query_type,
            query_pool,
            first_query,
        )

    fn compile_deferred_nv(self, device: Device, pipeline: Pipeline, shader: UInt32) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._compile_deferred_nv(device, pipeline, shader)


struct MeshShader(Copyable, Movable):
    var _cmd_draw_mesh_tasks_nv: fn(
        commandBuffer: CommandBuffer, taskCount: UInt32, firstTask: UInt32
    )
    var _cmd_draw_mesh_tasks_indirect_nv: fn(
        commandBuffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, drawCount: UInt32, stride: UInt32
    )
    var _cmd_draw_mesh_tasks_indirect_count_nv: fn(
        commandBuffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, countBuffer: Buffer, countBufferOffset: DeviceSize, maxDrawCount: UInt32, stride: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_mesh_tasks_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_mesh_tasks_nv)]()[]
        self._cmd_draw_mesh_tasks_indirect_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_mesh_tasks_indirect_nv)]()[]
        self._cmd_draw_mesh_tasks_indirect_count_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectCountNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_mesh_tasks_indirect_count_nv)]()[]

    fn cmd_draw_mesh_tasks_nv(
        self, command_buffer: CommandBuffer, task_count: UInt32, first_task: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_mesh_tasks_nv(command_buffer, task_count, first_task)

    fn cmd_draw_mesh_tasks_indirect_nv(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_mesh_tasks_indirect_nv(
            command_buffer, buffer, offset, draw_count, stride
        )

    fn cmd_draw_mesh_tasks_indirect_count_nv(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_mesh_tasks_indirect_count_nv(
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )


struct ScissorExclusive(Copyable, Movable):
    var _cmd_set_exclusive_scissor_enable_nv: fn(
        commandBuffer: CommandBuffer, firstExclusiveScissor: UInt32, exclusiveScissorCount: UInt32, pExclusiveScissorEnables: Ptr[Bool32]
    )
    var _cmd_set_exclusive_scissor_nv: fn(
        commandBuffer: CommandBuffer, firstExclusiveScissor: UInt32, exclusiveScissorCount: UInt32, pExclusiveScissors: Ptr[Rect2D]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_exclusive_scissor_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExclusiveScissorEnableNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_exclusive_scissor_enable_nv)]()[]
        self._cmd_set_exclusive_scissor_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExclusiveScissorNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_exclusive_scissor_nv)]()[]

    fn cmd_set_exclusive_scissor_enable_nv(
        self,
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissor_enables: Ptr[Bool32],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_exclusive_scissor_enable_nv(
            command_buffer,
            first_exclusive_scissor,
            exclusive_scissor_count,
            p_exclusive_scissor_enables,
        )

    fn cmd_set_exclusive_scissor_nv(
        self,
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissors: Ptr[Rect2D],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_exclusive_scissor_nv(
            command_buffer, first_exclusive_scissor, exclusive_scissor_count, p_exclusive_scissors
        )


struct DeviceDiagnosticCheckpoints(Copyable, Movable):
    var _cmd_set_checkpoint_nv: fn(
        commandBuffer: CommandBuffer, pCheckpointMarker: Ptr[NoneType]
    )
    var _get_queue_checkpoint_data_nv: fn(
        queue: Queue, pCheckpointDataCount: Ptr[UInt32], pCheckpointData: Ptr[CheckpointDataNV]
    )
    var _get_queue_checkpoint_data_2_nv: fn(
        queue: Queue, pCheckpointDataCount: Ptr[UInt32], pCheckpointData: Ptr[CheckpointData2NV]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_checkpoint_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCheckpointNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_checkpoint_nv)]()[]
        self._get_queue_checkpoint_data_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetQueueCheckpointDataNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_queue_checkpoint_data_nv)]()[]
        self._get_queue_checkpoint_data_2_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetQueueCheckpointData2NV".unsafe_ptr()
        )).bitcast[__type_of(self._get_queue_checkpoint_data_2_nv)]()[]

    fn cmd_set_checkpoint_nv(self, command_buffer: CommandBuffer, checkpoint_marker: NoneType):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_checkpoint_nv(command_buffer, Ptr(to=checkpoint_marker))

    fn get_queue_checkpoint_data_nv(
        self,
        queue: Queue,
        mut checkpoint_data_count: UInt32,
        p_checkpoint_data: Ptr[CheckpointDataNV],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_queue_checkpoint_data_nv(
            queue, Ptr(to=checkpoint_data_count), p_checkpoint_data
        )

    fn get_queue_checkpoint_data_nv(self, queue: Queue) -> List[CheckpointDataNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[CheckpointDataNV]()
        var count: UInt32 = 0
        self.get_queue_checkpoint_data_nv(queue, count, Ptr[CheckpointDataNV]())
        if count > 0:
            list.reserve(Int(count))
            self.get_queue_checkpoint_data_nv(queue, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn get_queue_checkpoint_data_2_nv(
        self,
        queue: Queue,
        mut checkpoint_data_count: UInt32,
        p_checkpoint_data: Ptr[CheckpointData2NV],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_queue_checkpoint_data_2_nv(
            queue, Ptr(to=checkpoint_data_count), p_checkpoint_data
        )

    fn get_queue_checkpoint_data_2_nv(self, queue: Queue) -> List[CheckpointData2NV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[CheckpointData2NV]()
        var count: UInt32 = 0
        self.get_queue_checkpoint_data_2_nv(queue, count, Ptr[CheckpointData2NV]())
        if count > 0:
            list.reserve(Int(count))
            self.get_queue_checkpoint_data_2_nv(queue, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^


struct CooperativeMatrix(Copyable, Movable):
    var _get_physical_device_cooperative_matrix_properties_nv: fn(
        physicalDevice: PhysicalDevice, pPropertyCount: Ptr[UInt32], pProperties: Ptr[CooperativeMatrixPropertiesNV]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_matrix_properties_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_cooperative_matrix_properties_nv)]()[]

    fn get_physical_device_cooperative_matrix_properties_nv(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixPropertiesNV],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_cooperative_matrix_properties_nv(
            physical_device, Ptr(to=property_count), p_properties
        )

    fn get_physical_device_cooperative_matrix_properties_nv(
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeMatrixPropertiesNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[CooperativeMatrixPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_cooperative_matrix_properties_nv(
                physical_device, count, Ptr[CooperativeMatrixPropertiesNV]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_cooperative_matrix_properties_nv(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)


struct CoverageReductionMode(Copyable, Movable):
    var _get_physical_device_supported_framebuffer_mixed_samples_combinations_nv: fn(
        physicalDevice: PhysicalDevice, pCombinationCount: Ptr[UInt32], pCombinations: Ptr[FramebufferMixedSamplesCombinationNV]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_supported_framebuffer_mixed_samples_combinations_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_supported_framebuffer_mixed_samples_combinations_nv)]()[]

    fn get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
        self,
        physical_device: PhysicalDevice,
        mut combination_count: UInt32,
        p_combinations: Ptr[FramebufferMixedSamplesCombinationNV],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
            physical_device, Ptr(to=combination_count), p_combinations
        )

    fn get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
        self, physical_device: PhysicalDevice
    ) -> ListResult[FramebufferMixedSamplesCombinationNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[FramebufferMixedSamplesCombinationNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
                physical_device, count, Ptr[FramebufferMixedSamplesCombinationNV]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
                    physical_device,
                    count,
                    list.unsafe_ptr(),
                )
        list._len = Int(count)
        return ListResult(list^, result)


struct DeviceGeneratedCommands(Copyable, Movable):
    var _get_generated_commands_memory_requirements_nv: fn(
        device: Device, pInfo: Ptr[GeneratedCommandsMemoryRequirementsInfoNV], pMemoryRequirements: Ptr[MemoryRequirements2]
    )
    var _cmd_preprocess_generated_commands_nv: fn(
        commandBuffer: CommandBuffer, pGeneratedCommandsInfo: Ptr[GeneratedCommandsInfoNV]
    )
    var _cmd_execute_generated_commands_nv: fn(
        commandBuffer: CommandBuffer, isPreprocessed: Bool32, pGeneratedCommandsInfo: Ptr[GeneratedCommandsInfoNV]
    )
    var _cmd_bind_pipeline_shader_group_nv: fn(
        commandBuffer: CommandBuffer, pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline, groupIndex: UInt32
    )
    var _create_indirect_commands_layout_nv: fn(
        device: Device, pCreateInfo: Ptr[IndirectCommandsLayoutCreateInfoNV], pAllocator: Ptr[AllocationCallbacks], pIndirectCommandsLayout: Ptr[IndirectCommandsLayoutNV]
    ) -> Result
    var _destroy_indirect_commands_layout_nv: fn(
        device: Device, indirectCommandsLayout: IndirectCommandsLayoutNV, pAllocator: Ptr[AllocationCallbacks]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_generated_commands_memory_requirements_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetGeneratedCommandsMemoryRequirementsNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_generated_commands_memory_requirements_nv)]()[]
        self._cmd_preprocess_generated_commands_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdPreprocessGeneratedCommandsNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_preprocess_generated_commands_nv)]()[]
        self._cmd_execute_generated_commands_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdExecuteGeneratedCommandsNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_execute_generated_commands_nv)]()[]
        self._cmd_bind_pipeline_shader_group_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindPipelineShaderGroupNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_pipeline_shader_group_nv)]()[]
        self._create_indirect_commands_layout_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateIndirectCommandsLayoutNV".unsafe_ptr()
        )).bitcast[__type_of(self._create_indirect_commands_layout_nv)]()[]
        self._destroy_indirect_commands_layout_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyIndirectCommandsLayoutNV".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_indirect_commands_layout_nv)]()[]

    fn get_generated_commands_memory_requirements_nv(
        self,
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoNV,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_generated_commands_memory_requirements_nv(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn cmd_preprocess_generated_commands_nv(
        self, command_buffer: CommandBuffer, generated_commands_info: GeneratedCommandsInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_preprocess_generated_commands_nv(
            command_buffer, Ptr(to=generated_commands_info)
        )

    fn cmd_execute_generated_commands_nv(
        self,
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        generated_commands_info: GeneratedCommandsInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_execute_generated_commands_nv(
            command_buffer, is_preprocessed, Ptr(to=generated_commands_info)
        )

    fn cmd_bind_pipeline_shader_group_nv(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
        group_index: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_pipeline_shader_group_nv(
            command_buffer, pipeline_bind_point, pipeline, group_index
        )

    fn create_indirect_commands_layout_nv(
        self,
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks],
        mut indirect_commands_layout: IndirectCommandsLayoutNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_indirect_commands_layout_nv(
            device, Ptr(to=create_info), p_allocator, Ptr(to=indirect_commands_layout)
        )

    fn destroy_indirect_commands_layout_nv(
        self,
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutNV,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_indirect_commands_layout_nv(
            device, indirect_commands_layout, p_allocator
        )


struct CudaKernelLaunch(Copyable, Movable):
    var _create_cuda_module_nv: fn(
        device: Device, pCreateInfo: Ptr[CudaModuleCreateInfoNV], pAllocator: Ptr[AllocationCallbacks], pModule: Ptr[CudaModuleNV]
    ) -> Result
    var _get_cuda_module_cache_nv: fn(
        device: Device, module: CudaModuleNV, pCacheSize: Ptr[UInt], pCacheData: Ptr[NoneType]
    ) -> Result
    var _create_cuda_function_nv: fn(
        device: Device, pCreateInfo: Ptr[CudaFunctionCreateInfoNV], pAllocator: Ptr[AllocationCallbacks], pFunction: Ptr[CudaFunctionNV]
    ) -> Result
    var _destroy_cuda_module_nv: fn(
        device: Device, module: CudaModuleNV, pAllocator: Ptr[AllocationCallbacks]
    )
    var _destroy_cuda_function_nv: fn(
        device: Device, function: CudaFunctionNV, pAllocator: Ptr[AllocationCallbacks]
    )
    var _cmd_cuda_launch_kernel_nv: fn(
        commandBuffer: CommandBuffer, pLaunchInfo: Ptr[CudaLaunchInfoNV]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_cuda_module_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateCudaModuleNV".unsafe_ptr()
        )).bitcast[__type_of(self._create_cuda_module_nv)]()[]
        self._get_cuda_module_cache_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetCudaModuleCacheNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_cuda_module_cache_nv)]()[]
        self._create_cuda_function_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateCudaFunctionNV".unsafe_ptr()
        )).bitcast[__type_of(self._create_cuda_function_nv)]()[]
        self._destroy_cuda_module_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCudaModuleNV".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_cuda_module_nv)]()[]
        self._destroy_cuda_function_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCudaFunctionNV".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_cuda_function_nv)]()[]
        self._cmd_cuda_launch_kernel_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdCudaLaunchKernelNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_cuda_launch_kernel_nv)]()[]

    fn create_cuda_module_nv(
        self,
        device: Device,
        create_info: CudaModuleCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks],
        mut module: CudaModuleNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_cuda_module_nv(device, Ptr(to=create_info), p_allocator, Ptr(to=module))

    fn get_cuda_module_cache_nv(
        self,
        device: Device,
        module: CudaModuleNV,
        mut cache_size: UInt,
        p_cache_data: Ptr[NoneType],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_cuda_module_cache_nv(device, module, Ptr(to=cache_size), p_cache_data)

    fn get_cuda_module_cache_nv(self, device: Device, module: CudaModuleNV) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_cuda_module_cache_nv(device, module, count, Ptr[NoneType]())
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_cuda_module_cache_nv(
                    device, module, count, list.unsafe_ptr().bitcast[NoneType]()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn create_cuda_function_nv(
        self,
        device: Device,
        create_info: CudaFunctionCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks],
        mut function: CudaFunctionNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_cuda_function_nv(
            device, Ptr(to=create_info), p_allocator, Ptr(to=function)
        )

    fn destroy_cuda_module_nv(
        self, device: Device, module: CudaModuleNV, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_cuda_module_nv(device, module, p_allocator)

    fn destroy_cuda_function_nv(
        self, device: Device, function: CudaFunctionNV, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_cuda_function_nv(device, function, p_allocator)

    fn cmd_cuda_launch_kernel_nv(
        self, command_buffer: CommandBuffer, launch_info: CudaLaunchInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_cuda_launch_kernel_nv(command_buffer, Ptr(to=launch_info))


struct FragmentShadingRateEnums(Copyable, Movable):
    var _cmd_set_fragment_shading_rate_enum_nv: fn(
        commandBuffer: CommandBuffer, shadingRate: FragmentShadingRateNV, combinerOps: FragmentShadingRateCombinerOpKHR
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_fragment_shading_rate_enum_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFragmentShadingRateEnumNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_set_fragment_shading_rate_enum_nv)]()[]

    fn cmd_set_fragment_shading_rate_enum_nv(
        self,
        command_buffer: CommandBuffer,
        shading_rate: FragmentShadingRateNV,
        combiner_ops: FragmentShadingRateCombinerOpKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_set_fragment_shading_rate_enum_nv(
            command_buffer, shading_rate, combiner_ops
        )


struct AcquireWinrtDisplay(Copyable, Movable):
    var _acquire_winrt_display_nv: fn(
        physicalDevice: PhysicalDevice, display: DisplayKHR
    ) -> Result
    var _get_winrt_display_nv: fn(
        physicalDevice: PhysicalDevice, deviceRelativeId: UInt32, pDisplay: Ptr[DisplayKHR]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._acquire_winrt_display_nv = Ptr(to=get_device_proc_addr(
            device, "vkAcquireWinrtDisplayNV".unsafe_ptr()
        )).bitcast[__type_of(self._acquire_winrt_display_nv)]()[]
        self._get_winrt_display_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetWinrtDisplayNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_winrt_display_nv)]()[]

    fn acquire_winrt_display_nv(
        self, physical_device: PhysicalDevice, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._acquire_winrt_display_nv(physical_device, display)

    fn get_winrt_display_nv(
        self, physical_device: PhysicalDevice, device_relative_id: UInt32, mut display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_winrt_display_nv(physical_device, device_relative_id, Ptr(to=display))


struct ExternalMemoryRdma(Copyable, Movable):
    var _get_memory_remote_address_nv: fn(
        device: Device, pMemoryGetRemoteAddressInfo: Ptr[MemoryGetRemoteAddressInfoNV], pAddress: Ptr[RemoteAddressNV]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_remote_address_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryRemoteAddressNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_memory_remote_address_nv)]()[]

    fn get_memory_remote_address_nv(
        self,
        device: Device,
        memory_get_remote_address_info: MemoryGetRemoteAddressInfoNV,
        mut address: RemoteAddressNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_memory_remote_address_nv(
            device, Ptr(to=memory_get_remote_address_info), Ptr(to=address)
        )


struct CopyMemoryIndirect(Copyable, Movable):
    var _cmd_copy_memory_indirect_nv: fn(
        commandBuffer: CommandBuffer, copyBufferAddress: DeviceAddress, copyCount: UInt32, stride: UInt32
    )
    var _cmd_copy_memory_to_image_indirect_nv: fn(
        commandBuffer: CommandBuffer, copyBufferAddress: DeviceAddress, copyCount: UInt32, stride: UInt32, dstImage: Image, dstImageLayout: ImageLayout, pImageSubresources: Ptr[ImageSubresourceLayers]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_copy_memory_indirect_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryIndirectNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_memory_indirect_nv)]()[]
        self._cmd_copy_memory_to_image_indirect_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToImageIndirectNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_copy_memory_to_image_indirect_nv)]()[]

    fn cmd_copy_memory_indirect_nv(
        self,
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_memory_indirect_nv(
            command_buffer, copy_buffer_address, copy_count, stride
        )

    fn cmd_copy_memory_to_image_indirect_nv(
        self,
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        p_image_subresources: Ptr[ImageSubresourceLayers],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_copy_memory_to_image_indirect_nv(
            command_buffer,
            copy_buffer_address,
            copy_count,
            stride,
            dst_image,
            dst_image_layout,
            p_image_subresources,
        )


struct MemoryDecompression(Copyable, Movable):
    var _cmd_decompress_memory_nv: fn(
        commandBuffer: CommandBuffer, decompressRegionCount: UInt32, pDecompressMemoryRegions: Ptr[DecompressMemoryRegionNV]
    )
    var _cmd_decompress_memory_indirect_count_nv: fn(
        commandBuffer: CommandBuffer, indirectCommandsAddress: DeviceAddress, indirectCommandsCountAddress: DeviceAddress, stride: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_decompress_memory_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_decompress_memory_nv)]()[]
        self._cmd_decompress_memory_indirect_count_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryIndirectCountNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_decompress_memory_indirect_count_nv)]()[]

    fn cmd_decompress_memory_nv(
        self,
        command_buffer: CommandBuffer,
        decompress_region_count: UInt32,
        p_decompress_memory_regions: Ptr[DecompressMemoryRegionNV],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_decompress_memory_nv(
            command_buffer, decompress_region_count, p_decompress_memory_regions
        )

    fn cmd_decompress_memory_indirect_count_nv(
        self,
        command_buffer: CommandBuffer,
        indirect_commands_address: DeviceAddress,
        indirect_commands_count_address: DeviceAddress,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_decompress_memory_indirect_count_nv(
            command_buffer, indirect_commands_address, indirect_commands_count_address, stride
        )


struct DeviceGeneratedCommandsCompute(Copyable, Movable):
    var _get_pipeline_indirect_memory_requirements_nv: fn(
        device: Device, pCreateInfo: Ptr[ComputePipelineCreateInfo], pMemoryRequirements: Ptr[MemoryRequirements2]
    )
    var _cmd_update_pipeline_indirect_buffer_nv: fn(
        commandBuffer: CommandBuffer, pipelineBindPoint: PipelineBindPoint, pipeline: Pipeline
    )
    var _get_pipeline_indirect_device_address_nv: fn(
        device: Device, pInfo: Ptr[PipelineIndirectDeviceAddressInfoNV]
    ) -> DeviceAddress

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_pipeline_indirect_memory_requirements_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineIndirectMemoryRequirementsNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_pipeline_indirect_memory_requirements_nv)]()[]
        self._cmd_update_pipeline_indirect_buffer_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdUpdatePipelineIndirectBufferNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_update_pipeline_indirect_buffer_nv)]()[]
        self._get_pipeline_indirect_device_address_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineIndirectDeviceAddressNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_pipeline_indirect_device_address_nv)]()[]

    fn get_pipeline_indirect_memory_requirements_nv(
        self,
        device: Device,
        create_info: ComputePipelineCreateInfo,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_pipeline_indirect_memory_requirements_nv(
            device, Ptr(to=create_info), Ptr(to=memory_requirements)
        )

    fn cmd_update_pipeline_indirect_buffer_nv(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_update_pipeline_indirect_buffer_nv(
            command_buffer, pipeline_bind_point, pipeline
        )

    fn get_pipeline_indirect_device_address_nv(
        self, device: Device, info: PipelineIndirectDeviceAddressInfoNV
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_pipeline_indirect_device_address_nv(device, Ptr(to=info))


struct OpticalFlow(Copyable, Movable):
    var _get_physical_device_optical_flow_image_formats_nv: fn(
        physicalDevice: PhysicalDevice, pOpticalFlowImageFormatInfo: Ptr[OpticalFlowImageFormatInfoNV], pFormatCount: Ptr[UInt32], pImageFormatProperties: Ptr[OpticalFlowImageFormatPropertiesNV]
    ) -> Result
    var _create_optical_flow_session_nv: fn(
        device: Device, pCreateInfo: Ptr[OpticalFlowSessionCreateInfoNV], pAllocator: Ptr[AllocationCallbacks], pSession: Ptr[OpticalFlowSessionNV]
    ) -> Result
    var _destroy_optical_flow_session_nv: fn(
        device: Device, session: OpticalFlowSessionNV, pAllocator: Ptr[AllocationCallbacks]
    )
    var _bind_optical_flow_session_image_nv: fn(
        device: Device, session: OpticalFlowSessionNV, bindingPoint: OpticalFlowSessionBindingPointNV, view: ImageView, layout: ImageLayout
    ) -> Result
    var _cmd_optical_flow_execute_nv: fn(
        commandBuffer: CommandBuffer, session: OpticalFlowSessionNV, pExecuteInfo: Ptr[OpticalFlowExecuteInfoNV]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_optical_flow_image_formats_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceOpticalFlowImageFormatsNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_optical_flow_image_formats_nv)]()[]
        self._create_optical_flow_session_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateOpticalFlowSessionNV".unsafe_ptr()
        )).bitcast[__type_of(self._create_optical_flow_session_nv)]()[]
        self._destroy_optical_flow_session_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyOpticalFlowSessionNV".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_optical_flow_session_nv)]()[]
        self._bind_optical_flow_session_image_nv = Ptr(to=get_device_proc_addr(
            device, "vkBindOpticalFlowSessionImageNV".unsafe_ptr()
        )).bitcast[__type_of(self._bind_optical_flow_session_image_nv)]()[]
        self._cmd_optical_flow_execute_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdOpticalFlowExecuteNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_optical_flow_execute_nv)]()[]

    fn get_physical_device_optical_flow_image_formats_nv(
        self,
        physical_device: PhysicalDevice,
        optical_flow_image_format_info: OpticalFlowImageFormatInfoNV,
        mut format_count: UInt32,
        p_image_format_properties: Ptr[OpticalFlowImageFormatPropertiesNV],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_optical_flow_image_formats_nv(
            physical_device,
            Ptr(to=optical_flow_image_format_info),
            Ptr(to=format_count),
            p_image_format_properties,
        )

    fn get_physical_device_optical_flow_image_formats_nv(
        self,
        physical_device: PhysicalDevice,
        optical_flow_image_format_info: OpticalFlowImageFormatInfoNV,
    ) -> ListResult[OpticalFlowImageFormatPropertiesNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[OpticalFlowImageFormatPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_optical_flow_image_formats_nv(
                physical_device,
                optical_flow_image_format_info,
                count,
                Ptr[OpticalFlowImageFormatPropertiesNV](),
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_optical_flow_image_formats_nv(
                    physical_device, optical_flow_image_format_info, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn create_optical_flow_session_nv(
        self,
        device: Device,
        create_info: OpticalFlowSessionCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks],
        mut session: OpticalFlowSessionNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_optical_flow_session_nv(
            device, Ptr(to=create_info), p_allocator, Ptr(to=session)
        )

    fn destroy_optical_flow_session_nv(
        self, device: Device, session: OpticalFlowSessionNV, p_allocator: Ptr[AllocationCallbacks]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_optical_flow_session_nv(device, session, p_allocator)

    fn bind_optical_flow_session_image_nv(
        self,
        device: Device,
        session: OpticalFlowSessionNV,
        binding_point: OpticalFlowSessionBindingPointNV,
        view: ImageView,
        layout: ImageLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._bind_optical_flow_session_image_nv(
            device, session, binding_point, view, layout
        )

    fn cmd_optical_flow_execute_nv(
        self,
        command_buffer: CommandBuffer,
        session: OpticalFlowSessionNV,
        execute_info: OpticalFlowExecuteInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_optical_flow_execute_nv(command_buffer, session, Ptr(to=execute_info))


struct CooperativeVector(Copyable, Movable):
    var _get_physical_device_cooperative_vector_properties_nv: fn(
        physicalDevice: PhysicalDevice, pPropertyCount: Ptr[UInt32], pProperties: Ptr[CooperativeVectorPropertiesNV]
    ) -> Result
    var _convert_cooperative_vector_matrix_nv: fn(
        device: Device, pInfo: Ptr[ConvertCooperativeVectorMatrixInfoNV]
    ) -> Result
    var _cmd_convert_cooperative_vector_matrix_nv: fn(
        commandBuffer: CommandBuffer, infoCount: UInt32, pInfos: Ptr[ConvertCooperativeVectorMatrixInfoNV]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_vector_properties_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeVectorPropertiesNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_cooperative_vector_properties_nv)]()[]
        self._convert_cooperative_vector_matrix_nv = Ptr(to=get_device_proc_addr(
            device, "vkConvertCooperativeVectorMatrixNV".unsafe_ptr()
        )).bitcast[__type_of(self._convert_cooperative_vector_matrix_nv)]()[]
        self._cmd_convert_cooperative_vector_matrix_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdConvertCooperativeVectorMatrixNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_convert_cooperative_vector_matrix_nv)]()[]

    fn get_physical_device_cooperative_vector_properties_nv(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeVectorPropertiesNV],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_cooperative_vector_properties_nv(
            physical_device, Ptr(to=property_count), p_properties
        )

    fn get_physical_device_cooperative_vector_properties_nv(
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeVectorPropertiesNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[CooperativeVectorPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_cooperative_vector_properties_nv(
                physical_device, count, Ptr[CooperativeVectorPropertiesNV]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_cooperative_vector_properties_nv(
                    physical_device, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn convert_cooperative_vector_matrix_nv(
        self, device: Device, info: ConvertCooperativeVectorMatrixInfoNV
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._convert_cooperative_vector_matrix_nv(device, Ptr(to=info))

    fn cmd_convert_cooperative_vector_matrix_nv(
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[ConvertCooperativeVectorMatrixInfoNV],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_convert_cooperative_vector_matrix_nv(command_buffer, info_count, p_infos)


struct LowLatency2(Copyable, Movable):
    var _set_latency_sleep_mode_nv: fn(
        device: Device, swapchain: SwapchainKHR, pSleepModeInfo: Ptr[LatencySleepModeInfoNV]
    ) -> Result
    var _latency_sleep_nv: fn(
        device: Device, swapchain: SwapchainKHR, pSleepInfo: Ptr[LatencySleepInfoNV]
    ) -> Result
    var _set_latency_marker_nv: fn(
        device: Device, swapchain: SwapchainKHR, pLatencyMarkerInfo: Ptr[SetLatencyMarkerInfoNV]
    )
    var _get_latency_timings_nv: fn(
        device: Device, swapchain: SwapchainKHR, pLatencyMarkerInfo: Ptr[GetLatencyMarkerInfoNV]
    )
    var _queue_notify_out_of_band_nv: fn(
        queue: Queue, pQueueTypeInfo: Ptr[OutOfBandQueueTypeInfoNV]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_latency_sleep_mode_nv = Ptr(to=get_device_proc_addr(
            device, "vkSetLatencySleepModeNV".unsafe_ptr()
        )).bitcast[__type_of(self._set_latency_sleep_mode_nv)]()[]
        self._latency_sleep_nv = Ptr(to=get_device_proc_addr(
            device, "vkLatencySleepNV".unsafe_ptr()
        )).bitcast[__type_of(self._latency_sleep_nv)]()[]
        self._set_latency_marker_nv = Ptr(to=get_device_proc_addr(
            device, "vkSetLatencyMarkerNV".unsafe_ptr()
        )).bitcast[__type_of(self._set_latency_marker_nv)]()[]
        self._get_latency_timings_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetLatencyTimingsNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_latency_timings_nv)]()[]
        self._queue_notify_out_of_band_nv = Ptr(to=get_device_proc_addr(
            device, "vkQueueNotifyOutOfBandNV".unsafe_ptr()
        )).bitcast[__type_of(self._queue_notify_out_of_band_nv)]()[]

    fn set_latency_sleep_mode_nv(
        self, device: Device, swapchain: SwapchainKHR, sleep_mode_info: LatencySleepModeInfoNV
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._set_latency_sleep_mode_nv(device, swapchain, Ptr(to=sleep_mode_info))

    fn latency_sleep_nv(
        self, device: Device, swapchain: SwapchainKHR, sleep_info: LatencySleepInfoNV
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._latency_sleep_nv(device, swapchain, Ptr(to=sleep_info))

    fn set_latency_marker_nv(
        self, device: Device, swapchain: SwapchainKHR, latency_marker_info: SetLatencyMarkerInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._set_latency_marker_nv(device, swapchain, Ptr(to=latency_marker_info))

    fn get_latency_timings_nv(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut latency_marker_info: GetLatencyMarkerInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_latency_timings_nv(device, swapchain, Ptr(to=latency_marker_info))

    fn queue_notify_out_of_band_nv(self, queue: Queue, queue_type_info: OutOfBandQueueTypeInfoNV):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._queue_notify_out_of_band_nv(queue, Ptr(to=queue_type_info))


struct ExternalComputeQueue(Copyable, Movable):
    var _create_external_compute_queue_nv: fn(
        device: Device, pCreateInfo: Ptr[ExternalComputeQueueCreateInfoNV], pAllocator: Ptr[AllocationCallbacks], pExternalQueue: Ptr[ExternalComputeQueueNV]
    ) -> Result
    var _destroy_external_compute_queue_nv: fn(
        device: Device, externalQueue: ExternalComputeQueueNV, pAllocator: Ptr[AllocationCallbacks]
    )
    var _get_external_compute_queue_data_nv: fn(
        externalQueue: ExternalComputeQueueNV, params: Ptr[ExternalComputeQueueDataParamsNV], pData: Ptr[NoneType]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_external_compute_queue_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateExternalComputeQueueNV".unsafe_ptr()
        )).bitcast[__type_of(self._create_external_compute_queue_nv)]()[]
        self._destroy_external_compute_queue_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyExternalComputeQueueNV".unsafe_ptr()
        )).bitcast[__type_of(self._destroy_external_compute_queue_nv)]()[]
        self._get_external_compute_queue_data_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetExternalComputeQueueDataNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_external_compute_queue_data_nv)]()[]

    fn create_external_compute_queue_nv(
        self,
        device: Device,
        create_info: ExternalComputeQueueCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks],
        mut external_queue: ExternalComputeQueueNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._create_external_compute_queue_nv(
            device, Ptr(to=create_info), p_allocator, Ptr(to=external_queue)
        )

    fn destroy_external_compute_queue_nv(
        self,
        device: Device,
        external_queue: ExternalComputeQueueNV,
        p_allocator: Ptr[AllocationCallbacks],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._destroy_external_compute_queue_nv(device, external_queue, p_allocator)

    fn get_external_compute_queue_data_nv(
        self,
        external_queue: ExternalComputeQueueNV,
        mut params: ExternalComputeQueueDataParamsNV,
        mut data: NoneType,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_external_compute_queue_data_nv(
            external_queue, Ptr(to=params), Ptr(to=data)
        )


struct ClusterAccelerationStructure(Copyable, Movable):
    var _get_cluster_acceleration_structure_build_sizes_nv: fn(
        device: Device, pInfo: Ptr[ClusterAccelerationStructureInputInfoNV], pSizeInfo: Ptr[AccelerationStructureBuildSizesInfoKHR]
    )
    var _cmd_build_cluster_acceleration_structure_indirect_nv: fn(
        commandBuffer: CommandBuffer, pCommandInfos: Ptr[ClusterAccelerationStructureCommandsInfoNV]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_cluster_acceleration_structure_build_sizes_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetClusterAccelerationStructureBuildSizesNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_cluster_acceleration_structure_build_sizes_nv)]()[]
        self._cmd_build_cluster_acceleration_structure_indirect_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildClusterAccelerationStructureIndirectNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_build_cluster_acceleration_structure_indirect_nv)]()[]

    fn get_cluster_acceleration_structure_build_sizes_nv(
        self,
        device: Device,
        info: ClusterAccelerationStructureInputInfoNV,
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_cluster_acceleration_structure_build_sizes_nv(
            device, Ptr(to=info), Ptr(to=size_info)
        )

    fn cmd_build_cluster_acceleration_structure_indirect_nv(
        self,
        command_buffer: CommandBuffer,
        command_infos: ClusterAccelerationStructureCommandsInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_build_cluster_acceleration_structure_indirect_nv(
            command_buffer, Ptr(to=command_infos)
        )


struct PartitionedAccelerationStructure(Copyable, Movable):
    var _get_partitioned_acceleration_structures_build_sizes_nv: fn(
        device: Device, pInfo: Ptr[PartitionedAccelerationStructureInstancesInputNV], pSizeInfo: Ptr[AccelerationStructureBuildSizesInfoKHR]
    )
    var _cmd_build_partitioned_acceleration_structures_nv: fn(
        commandBuffer: CommandBuffer, pBuildInfo: Ptr[BuildPartitionedAccelerationStructureInfoNV]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_partitioned_acceleration_structures_build_sizes_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPartitionedAccelerationStructuresBuildSizesNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_partitioned_acceleration_structures_build_sizes_nv)]()[]
        self._cmd_build_partitioned_acceleration_structures_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildPartitionedAccelerationStructuresNV".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_build_partitioned_acceleration_structures_nv)]()[]

    fn get_partitioned_acceleration_structures_build_sizes_nv(
        self,
        device: Device,
        info: PartitionedAccelerationStructureInstancesInputNV,
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_partitioned_acceleration_structures_build_sizes_nv(
            device, Ptr(to=info), Ptr(to=size_info)
        )

    fn cmd_build_partitioned_acceleration_structures_nv(
        self, command_buffer: CommandBuffer, build_info: BuildPartitionedAccelerationStructureInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_build_partitioned_acceleration_structures_nv(
            command_buffer, Ptr(to=build_info)
        )


struct CooperativeMatrix2(Copyable, Movable):
    var _get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv: fn(
        physicalDevice: PhysicalDevice, pPropertyCount: Ptr[UInt32], pProperties: Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV".unsafe_ptr()
        )).bitcast[__type_of(self._get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv)]()[]

    fn get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
            physical_device, Ptr(to=property_count), p_properties
        )

    fn get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeMatrixFlexibleDimensionsPropertiesNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[CooperativeMatrixFlexibleDimensionsPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
                physical_device, count, Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
                    physical_device,
                    count,
                    list.unsafe_ptr(),
                )
        list._len = Int(count)
        return ListResult(list^, result)
