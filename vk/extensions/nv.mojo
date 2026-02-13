from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ExternalMemoryCapabilities(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_external_image_format_properties: fn(
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        external_handle_type: ExternalMemoryHandleTypeFlagsNV,
        p_external_image_format_properties: Ptr[ExternalImageFormatPropertiesNV, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_external_image_format_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalImageFormatPropertiesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_external_image_format_properties)]()[]

    fn get_physical_device_external_image_format_properties(
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalImageFormatPropertiesNV.html
        """
        return self._get_physical_device_external_image_format_properties(
            physical_device,
            format,
            type,
            tiling,
            usage,
            flags,
            external_handle_type,
            Ptr(to=external_image_format_properties),
        )


struct ExternalMemoryWin32(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_win_32_handle: fn(
        device: Device,
        memory: DeviceMemory,
        handle_type: ExternalMemoryHandleTypeFlagsNV,
        p_handle: Ptr[HANDLE, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_win_32_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryWin32HandleNV".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_win_32_handle)]()[]

    fn get_memory_win_32_handle(
        self,
        device: Device,
        memory: DeviceMemory,
        handle_type: ExternalMemoryHandleTypeFlagsNV,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryWin32HandleNV.html
        """
        return self._get_memory_win_32_handle(device, memory, handle_type, Ptr(to=handle))


struct ClipSpaceWScaling(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_viewport_w_scaling: fn(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_w_scalings: Ptr[ViewportWScalingNV, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_viewport_w_scaling = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWScalingNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_w_scaling)]()[]

    fn cmd_set_viewport_w_scaling[p_viewport_w_scalings_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_w_scalings: Ptr[ViewportWScalingNV, p_viewport_w_scalings_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingNV.html
        """
        return self._cmd_set_viewport_w_scaling(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_viewport_w_scalings).bitcast[Ptr[ViewportWScalingNV, ImmutAnyOrigin]]()[],
        )


struct ShadingRateImage(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_bind_shading_rate_image: fn(
        command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    )
    var _cmd_set_viewport_shading_rate_palette: fn(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_shading_rate_palettes: Ptr[ShadingRatePaletteNV, ImmutAnyOrigin],
    )
    var _cmd_set_coarse_sample_order: fn(
        command_buffer: CommandBuffer,
        sample_order_type: CoarseSampleOrderTypeNV,
        custom_sample_order_count: UInt32,
        p_custom_sample_orders: Ptr[CoarseSampleOrderCustomNV, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_shading_rate_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindShadingRateImageNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_shading_rate_image)]()[]
        self._cmd_set_viewport_shading_rate_palette = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportShadingRatePaletteNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_shading_rate_palette)]()[]
        self._cmd_set_coarse_sample_order = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoarseSampleOrderNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_coarse_sample_order)]()[]

    fn cmd_bind_shading_rate_image(
        self, command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindShadingRateImageNV.html
        """
        return self._cmd_bind_shading_rate_image(command_buffer, image_view, image_layout)

    fn cmd_set_viewport_shading_rate_palette[
        p_shading_rate_palettes_origin: ImmutOrigin = ImmutAnyOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_shading_rate_palettes: Ptr[ShadingRatePaletteNV, p_shading_rate_palettes_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportShadingRatePaletteNV.html
        """
        return self._cmd_set_viewport_shading_rate_palette(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_shading_rate_palettes).bitcast[Ptr[ShadingRatePaletteNV, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_coarse_sample_order[p_custom_sample_orders_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        sample_order_type: CoarseSampleOrderTypeNV,
        custom_sample_order_count: UInt32,
        p_custom_sample_orders: Ptr[CoarseSampleOrderCustomNV, p_custom_sample_orders_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoarseSampleOrderNV.html
        """
        return self._cmd_set_coarse_sample_order(
            command_buffer,
            sample_order_type,
            custom_sample_order_count,
            Ptr(to=p_custom_sample_orders).bitcast[Ptr[CoarseSampleOrderCustomNV, ImmutAnyOrigin]]()[],
        )


struct RayTracing(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_acceleration_structure: fn(
        device: Device,
        p_create_info: Ptr[AccelerationStructureCreateInfoNV, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_acceleration_structure: Ptr[AccelerationStructureNV, MutAnyOrigin],
    ) -> Result
    var _destroy_acceleration_structure: fn(
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_acceleration_structure_memory_requirements: fn(
        device: Device,
        p_info: Ptr[AccelerationStructureMemoryRequirementsInfoNV, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2KHR, MutAnyOrigin],
    )
    var _bind_acceleration_structure_memory: fn(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindAccelerationStructureMemoryInfoNV, ImmutAnyOrigin],
    ) -> Result
    var _cmd_build_acceleration_structure: fn(
        command_buffer: CommandBuffer,
        p_info: Ptr[AccelerationStructureInfoNV, ImmutAnyOrigin],
        instance_data: Buffer,
        instance_offset: DeviceSize,
        update: Bool32,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        scratch: Buffer,
        scratch_offset: DeviceSize,
    )
    var _cmd_copy_acceleration_structure: fn(
        command_buffer: CommandBuffer,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        mode: CopyAccelerationStructureModeKHR,
    )
    var _cmd_trace_rays: fn(
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
    )
    var _create_ray_tracing_pipelines: fn(
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoNV, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _get_ray_tracing_shader_group_handles: fn(
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_acceleration_structure_handle: fn(
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _cmd_write_acceleration_structures_properties: fn(
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureNV, ImmutAnyOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    )
    var _compile_deferred: fn(device: Device, pipeline: Pipeline, shader: UInt32) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_acceleration_structure = Ptr(to=get_device_proc_addr(
            device, "vkCreateAccelerationStructureNV".as_c_string_slice()
        )).bitcast[type_of(self._create_acceleration_structure)]()[]
        self._destroy_acceleration_structure = Ptr(to=get_device_proc_addr(
            device, "vkDestroyAccelerationStructureNV".as_c_string_slice()
        )).bitcast[type_of(self._destroy_acceleration_structure)]()[]
        self._get_acceleration_structure_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureMemoryRequirementsNV".as_c_string_slice()
        )).bitcast[type_of(self._get_acceleration_structure_memory_requirements)]()[]
        self._bind_acceleration_structure_memory = Ptr(to=get_device_proc_addr(
            device, "vkBindAccelerationStructureMemoryNV".as_c_string_slice()
        )).bitcast[type_of(self._bind_acceleration_structure_memory)]()[]
        self._cmd_build_acceleration_structure = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildAccelerationStructureNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_acceleration_structure)]()[]
        self._cmd_copy_acceleration_structure = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyAccelerationStructureNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_acceleration_structure)]()[]
        self._cmd_trace_rays = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_trace_rays)]()[]
        self._create_ray_tracing_pipelines = Ptr(to=get_device_proc_addr(
            device, "vkCreateRayTracingPipelinesNV".as_c_string_slice()
        )).bitcast[type_of(self._create_ray_tracing_pipelines)]()[]
        self._get_ray_tracing_shader_group_handles = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingShaderGroupHandlesKHR".as_c_string_slice()
        )).bitcast[type_of(self._get_ray_tracing_shader_group_handles)]()[]
        self._get_acceleration_structure_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureHandleNV".as_c_string_slice()
        )).bitcast[type_of(self._get_acceleration_structure_handle)]()[]
        self._cmd_write_acceleration_structures_properties = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteAccelerationStructuresPropertiesNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_write_acceleration_structures_properties)]()[]
        self._compile_deferred = Ptr(to=get_device_proc_addr(
            device, "vkCompileDeferredNV".as_c_string_slice()
        )).bitcast[type_of(self._compile_deferred)]()[]

    fn create_acceleration_structure[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: AccelerationStructureCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut acceleration_structure: AccelerationStructureNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateAccelerationStructureNV.html
        """
        return self._create_acceleration_structure(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=acceleration_structure),
        )

    fn destroy_acceleration_structure[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyAccelerationStructureNV.html
        """
        return self._destroy_acceleration_structure(
            device,
            acceleration_structure,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn get_acceleration_structure_memory_requirements(
        self,
        device: Device,
        info: AccelerationStructureMemoryRequirementsInfoNV,
        mut memory_requirements: MemoryRequirements2KHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureMemoryRequirementsNV.html
        """
        return self._get_acceleration_structure_memory_requirements(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn bind_acceleration_structure_memory[p_bind_infos_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindAccelerationStructureMemoryInfoNV, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindAccelerationStructureMemoryNV.html
        """
        return self._bind_acceleration_structure_memory(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindAccelerationStructureMemoryInfoNV, ImmutAnyOrigin]]()[],
        )

    fn cmd_build_acceleration_structure(
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildAccelerationStructureNV.html
        """
        return self._cmd_build_acceleration_structure(
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

    fn cmd_copy_acceleration_structure(
        self,
        command_buffer: CommandBuffer,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        mode: CopyAccelerationStructureModeKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyAccelerationStructureNV.html
        """
        return self._cmd_copy_acceleration_structure(command_buffer, dst, src, mode)

    fn cmd_trace_rays(
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdTraceRaysNV.html
        """
        return self._cmd_trace_rays(
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

    fn create_ray_tracing_pipelines[
        p_create_infos_origin: ImmutOrigin = ImmutAnyOrigin,
        p_allocator_origin: ImmutOrigin = ImmutAnyOrigin,
        p_pipelines_origin: MutOrigin = MutAnyOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoNV, p_create_infos_origin],
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRayTracingPipelinesNV.html
        """
        return self._create_ray_tracing_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[RayTracingPipelineCreateInfoNV, ImmutAnyOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutAnyOrigin]]()[],
        )

    fn get_ray_tracing_shader_group_handles[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRayTracingShaderGroupHandlesKHR.html
        """
        return self._get_ray_tracing_shader_group_handles(
            device,
            pipeline,
            first_group,
            group_count,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn get_acceleration_structure_handle[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureHandleNV.html
        """
        return self._get_acceleration_structure_handle(
            device,
            acceleration_structure,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn cmd_write_acceleration_structures_properties[
        p_acceleration_structures_origin: ImmutOrigin = ImmutAnyOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureNV, p_acceleration_structures_origin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteAccelerationStructuresPropertiesNV.html
        """
        return self._cmd_write_acceleration_structures_properties(
            command_buffer,
            acceleration_structure_count,
            Ptr(to=p_acceleration_structures).bitcast[Ptr[AccelerationStructureNV, ImmutAnyOrigin]]()[],
            query_type,
            query_pool,
            first_query,
        )

    fn compile_deferred(self, device: Device, pipeline: Pipeline, shader: UInt32) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCompileDeferredNV.html
        """
        return self._compile_deferred(device, pipeline, shader)


struct MeshShader(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_mesh_tasks: fn(command_buffer: CommandBuffer, task_count: UInt32, first_task: UInt32)
    var _cmd_draw_mesh_tasks_indirect: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    )
    var _cmd_draw_mesh_tasks_indirect_count: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_mesh_tasks = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks)]()[]
        self._cmd_draw_mesh_tasks_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_indirect)]()[]
        self._cmd_draw_mesh_tasks_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectCountNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_indirect_count)]()[]

    fn cmd_draw_mesh_tasks(
        self, command_buffer: CommandBuffer, task_count: UInt32, first_task: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksNV.html
        """
        return self._cmd_draw_mesh_tasks(command_buffer, task_count, first_task)

    fn cmd_draw_mesh_tasks_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksIndirectNV.html
        """
        return self._cmd_draw_mesh_tasks_indirect(command_buffer, buffer, offset, draw_count, stride)

    fn cmd_draw_mesh_tasks_indirect_count(
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksIndirectCountNV.html
        """
        return self._cmd_draw_mesh_tasks_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )


struct ScissorExclusive(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_exclusive_scissor_enable: fn(
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissor_enables: Ptr[Bool32, ImmutAnyOrigin],
    )
    var _cmd_set_exclusive_scissor: fn(
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_exclusive_scissor_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExclusiveScissorEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_exclusive_scissor_enable)]()[]
        self._cmd_set_exclusive_scissor = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExclusiveScissorNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_exclusive_scissor)]()[]

    fn cmd_set_exclusive_scissor_enable[
        p_exclusive_scissor_enables_origin: ImmutOrigin = ImmutAnyOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissor_enables: Ptr[Bool32, p_exclusive_scissor_enables_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExclusiveScissorEnableNV.html
        """
        return self._cmd_set_exclusive_scissor_enable(
            command_buffer,
            first_exclusive_scissor,
            exclusive_scissor_count,
            Ptr(to=p_exclusive_scissor_enables).bitcast[Ptr[Bool32, ImmutAnyOrigin]]()[],
        )

    fn cmd_set_exclusive_scissor[p_exclusive_scissors_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissors: Ptr[Rect2D, p_exclusive_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExclusiveScissorNV.html
        """
        return self._cmd_set_exclusive_scissor(
            command_buffer,
            first_exclusive_scissor,
            exclusive_scissor_count,
            Ptr(to=p_exclusive_scissors).bitcast[Ptr[Rect2D, ImmutAnyOrigin]]()[],
        )


struct DeviceDiagnosticCheckpoints(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_checkpoint: fn(
        command_buffer: CommandBuffer, p_checkpoint_marker: Ptr[NoneType, ImmutAnyOrigin]
    )
    var _get_queue_checkpoint_data: fn(
        queue: Queue,
        p_checkpoint_data_count: Ptr[UInt32, MutAnyOrigin],
        p_checkpoint_data: Ptr[CheckpointDataNV, MutAnyOrigin],
    )
    var _get_queue_checkpoint_data_2: fn(
        queue: Queue,
        p_checkpoint_data_count: Ptr[UInt32, MutAnyOrigin],
        p_checkpoint_data: Ptr[CheckpointData2NV, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_checkpoint = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCheckpointNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_checkpoint)]()[]
        self._get_queue_checkpoint_data = Ptr(to=get_device_proc_addr(
            device, "vkGetQueueCheckpointDataNV".as_c_string_slice()
        )).bitcast[type_of(self._get_queue_checkpoint_data)]()[]
        self._get_queue_checkpoint_data_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetQueueCheckpointData2NV".as_c_string_slice()
        )).bitcast[type_of(self._get_queue_checkpoint_data_2)]()[]

    fn cmd_set_checkpoint[p_checkpoint_marker_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        p_checkpoint_marker: Ptr[NoneType, p_checkpoint_marker_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCheckpointNV.html
        """
        return self._cmd_set_checkpoint(
            command_buffer, Ptr(to=p_checkpoint_marker).bitcast[Ptr[NoneType, ImmutAnyOrigin]]()[]
        )

    fn get_queue_checkpoint_data[p_checkpoint_data_origin: MutOrigin = MutAnyOrigin](
        self,
        queue: Queue,
        mut checkpoint_data_count: UInt32,
        p_checkpoint_data: Ptr[CheckpointDataNV, p_checkpoint_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointDataNV.html
        """
        return self._get_queue_checkpoint_data(
            queue,
            Ptr(to=checkpoint_data_count),
            Ptr(to=p_checkpoint_data).bitcast[Ptr[CheckpointDataNV, MutAnyOrigin]]()[],
        )

    fn get_queue_checkpoint_data[p_checkpoint_data_origin: MutOrigin = MutAnyOrigin](
        self, queue: Queue
    ) -> List[CheckpointDataNV]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointDataNV.html
        """
        var list = List[CheckpointDataNV]()
        var count: UInt32 = 0
        self._get_queue_checkpoint_data(queue, Ptr(to=count), Ptr[CheckpointDataNV, MutExternalOrigin]())
        list.reserve(Int(count))
        self._get_queue_checkpoint_data(queue, Ptr(to=count), list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn get_queue_checkpoint_data_2[p_checkpoint_data_origin: MutOrigin = MutAnyOrigin](
        self,
        queue: Queue,
        mut checkpoint_data_count: UInt32,
        p_checkpoint_data: Ptr[CheckpointData2NV, p_checkpoint_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointData2NV.html
        """
        return self._get_queue_checkpoint_data_2(
            queue,
            Ptr(to=checkpoint_data_count),
            Ptr(to=p_checkpoint_data).bitcast[Ptr[CheckpointData2NV, MutAnyOrigin]]()[],
        )

    fn get_queue_checkpoint_data_2[p_checkpoint_data_origin: MutOrigin = MutAnyOrigin](
        self, queue: Queue
    ) -> List[CheckpointData2NV]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointData2NV.html
        """
        var list = List[CheckpointData2NV]()
        var count: UInt32 = 0
        self._get_queue_checkpoint_data_2(queue, Ptr(to=count), Ptr[CheckpointData2NV, MutExternalOrigin]())
        list.reserve(Int(count))
        self._get_queue_checkpoint_data_2(queue, Ptr(to=count), list.unsafe_ptr())
        list._len = Int(count)
        return list^


struct CooperativeMatrix(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_matrix_properties: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[CooperativeMatrixPropertiesNV, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_matrix_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_cooperative_matrix_properties)]()[]

    fn get_physical_device_cooperative_matrix_properties[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixPropertiesNV, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixPropertiesNV.html
        """
        return self._get_physical_device_cooperative_matrix_properties(
            physical_device,
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[CooperativeMatrixPropertiesNV, MutAnyOrigin]]()[],
        )

    fn get_physical_device_cooperative_matrix_properties[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeMatrixPropertiesNV]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixPropertiesNV.html
        """
        var list = List[CooperativeMatrixPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_cooperative_matrix_properties(
        physical_device, Ptr(to=count), Ptr[CooperativeMatrixPropertiesNV, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_cooperative_matrix_properties(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct CoverageReductionMode(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_supported_framebuffer_mixed_samples_combinations: fn(
        physical_device: PhysicalDevice,
        p_combination_count: Ptr[UInt32, MutAnyOrigin],
        p_combinations: Ptr[FramebufferMixedSamplesCombinationNV, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_supported_framebuffer_mixed_samples_combinations = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_supported_framebuffer_mixed_samples_combinations)]()[]

    fn get_physical_device_supported_framebuffer_mixed_samples_combinations[
        p_combinations_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut combination_count: UInt32,
        p_combinations: Ptr[FramebufferMixedSamplesCombinationNV, p_combinations_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV.html
        """
        return self._get_physical_device_supported_framebuffer_mixed_samples_combinations(
            physical_device,
            Ptr(to=combination_count),
            Ptr(to=p_combinations).bitcast[Ptr[FramebufferMixedSamplesCombinationNV, MutAnyOrigin]]()[],
        )

    fn get_physical_device_supported_framebuffer_mixed_samples_combinations[
        p_combinations_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> ListResult[FramebufferMixedSamplesCombinationNV]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV.html
        """
        var list = List[FramebufferMixedSamplesCombinationNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_supported_framebuffer_mixed_samples_combinations(
        physical_device,
        Ptr(to=count),
        Ptr[FramebufferMixedSamplesCombinationNV, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_supported_framebuffer_mixed_samples_combinations(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct DeviceGeneratedCommands(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_generated_commands_memory_requirements: fn(
        device: Device,
        p_info: Ptr[GeneratedCommandsMemoryRequirementsInfoNV, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _cmd_preprocess_generated_commands: fn(
        command_buffer: CommandBuffer,
        p_generated_commands_info: Ptr[GeneratedCommandsInfoNV, ImmutAnyOrigin],
    )
    var _cmd_execute_generated_commands: fn(
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        p_generated_commands_info: Ptr[GeneratedCommandsInfoNV, ImmutAnyOrigin],
    )
    var _cmd_bind_pipeline_shader_group: fn(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
        group_index: UInt32,
    )
    var _create_indirect_commands_layout: fn(
        device: Device,
        p_create_info: Ptr[IndirectCommandsLayoutCreateInfoNV, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_indirect_commands_layout: Ptr[IndirectCommandsLayoutNV, MutAnyOrigin],
    ) -> Result
    var _destroy_indirect_commands_layout: fn(
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_generated_commands_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetGeneratedCommandsMemoryRequirementsNV".as_c_string_slice()
        )).bitcast[type_of(self._get_generated_commands_memory_requirements)]()[]
        self._cmd_preprocess_generated_commands = Ptr(to=get_device_proc_addr(
            device, "vkCmdPreprocessGeneratedCommandsNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_preprocess_generated_commands)]()[]
        self._cmd_execute_generated_commands = Ptr(to=get_device_proc_addr(
            device, "vkCmdExecuteGeneratedCommandsNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_execute_generated_commands)]()[]
        self._cmd_bind_pipeline_shader_group = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindPipelineShaderGroupNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_pipeline_shader_group)]()[]
        self._create_indirect_commands_layout = Ptr(to=get_device_proc_addr(
            device, "vkCreateIndirectCommandsLayoutNV".as_c_string_slice()
        )).bitcast[type_of(self._create_indirect_commands_layout)]()[]
        self._destroy_indirect_commands_layout = Ptr(to=get_device_proc_addr(
            device, "vkDestroyIndirectCommandsLayoutNV".as_c_string_slice()
        )).bitcast[type_of(self._destroy_indirect_commands_layout)]()[]

    fn get_generated_commands_memory_requirements(
        self,
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoNV,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetGeneratedCommandsMemoryRequirementsNV.html
        """
        return self._get_generated_commands_memory_requirements(
            device, Ptr(to=info), Ptr(to=memory_requirements)
        )

    fn cmd_preprocess_generated_commands(
        self, command_buffer: CommandBuffer, generated_commands_info: GeneratedCommandsInfoNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPreprocessGeneratedCommandsNV.html
        """
        return self._cmd_preprocess_generated_commands(command_buffer, Ptr(to=generated_commands_info))

    fn cmd_execute_generated_commands(
        self,
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        generated_commands_info: GeneratedCommandsInfoNV,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteGeneratedCommandsNV.html
        """
        return self._cmd_execute_generated_commands(
            command_buffer, is_preprocessed, Ptr(to=generated_commands_info)
        )

    fn cmd_bind_pipeline_shader_group(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
        group_index: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipelineShaderGroupNV.html
        """
        return self._cmd_bind_pipeline_shader_group(
            command_buffer, pipeline_bind_point, pipeline, group_index
        )

    fn create_indirect_commands_layout[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut indirect_commands_layout: IndirectCommandsLayoutNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectCommandsLayoutNV.html
        """
        return self._create_indirect_commands_layout(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=indirect_commands_layout),
        )

    fn destroy_indirect_commands_layout[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectCommandsLayoutNV.html
        """
        return self._destroy_indirect_commands_layout(
            device,
            indirect_commands_layout,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )


struct CudaKernelLaunch(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_cuda_module: fn(
        device: Device,
        p_create_info: Ptr[CudaModuleCreateInfoNV, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_module: Ptr[CudaModuleNV, MutAnyOrigin],
    ) -> Result
    var _get_cuda_module_cache: fn(
        device: Device,
        module: CudaModuleNV,
        p_cache_size: Ptr[UInt, MutAnyOrigin],
        p_cache_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _create_cuda_function: fn(
        device: Device,
        p_create_info: Ptr[CudaFunctionCreateInfoNV, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_function: Ptr[CudaFunctionNV, MutAnyOrigin],
    ) -> Result
    var _destroy_cuda_module: fn(
        device: Device, module: CudaModuleNV, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _destroy_cuda_function: fn(
        device: Device, function: CudaFunctionNV, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _cmd_cuda_launch_kernel: fn(
        command_buffer: CommandBuffer, p_launch_info: Ptr[CudaLaunchInfoNV, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_cuda_module = Ptr(to=get_device_proc_addr(
            device, "vkCreateCudaModuleNV".as_c_string_slice()
        )).bitcast[type_of(self._create_cuda_module)]()[]
        self._get_cuda_module_cache = Ptr(to=get_device_proc_addr(
            device, "vkGetCudaModuleCacheNV".as_c_string_slice()
        )).bitcast[type_of(self._get_cuda_module_cache)]()[]
        self._create_cuda_function = Ptr(to=get_device_proc_addr(
            device, "vkCreateCudaFunctionNV".as_c_string_slice()
        )).bitcast[type_of(self._create_cuda_function)]()[]
        self._destroy_cuda_module = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCudaModuleNV".as_c_string_slice()
        )).bitcast[type_of(self._destroy_cuda_module)]()[]
        self._destroy_cuda_function = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCudaFunctionNV".as_c_string_slice()
        )).bitcast[type_of(self._destroy_cuda_function)]()[]
        self._cmd_cuda_launch_kernel = Ptr(to=get_device_proc_addr(
            device, "vkCmdCudaLaunchKernelNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_cuda_launch_kernel)]()[]

    fn create_cuda_module[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: CudaModuleCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut module: CudaModuleNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCudaModuleNV.html
        """
        return self._create_cuda_module(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=module),
        )

    fn get_cuda_module_cache[p_cache_data_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        module: CudaModuleNV,
        mut cache_size: UInt,
        p_cache_data: Ptr[NoneType, p_cache_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetCudaModuleCacheNV.html
        """
        return self._get_cuda_module_cache(
            device,
            module,
            Ptr(to=cache_size),
            Ptr(to=p_cache_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn get_cuda_module_cache[p_cache_data_origin: MutOrigin = MutAnyOrigin](
        self, device: Device, module: CudaModuleNV
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetCudaModuleCacheNV.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_cuda_module_cache(
        device, module, Ptr(to=count), Ptr[NoneType, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_cuda_module_cache(
        device, module, Ptr(to=count), list.unsafe_ptr().bitcast[NoneType]()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn create_cuda_function[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: CudaFunctionCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut function: CudaFunctionNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCudaFunctionNV.html
        """
        return self._create_cuda_function(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=function),
        )

    fn destroy_cuda_module[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        module: CudaModuleNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCudaModuleNV.html
        """
        return self._destroy_cuda_module(
            device, module, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn destroy_cuda_function[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        function: CudaFunctionNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCudaFunctionNV.html
        """
        return self._destroy_cuda_function(
            device, function, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn cmd_cuda_launch_kernel(self, command_buffer: CommandBuffer, launch_info: CudaLaunchInfoNV):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCudaLaunchKernelNV.html
        """
        return self._cmd_cuda_launch_kernel(command_buffer, Ptr(to=launch_info))


struct FragmentShadingRateEnums(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_fragment_shading_rate_enum: fn(
        command_buffer: CommandBuffer,
        shading_rate: FragmentShadingRateNV,
        combiner_ops: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_fragment_shading_rate_enum = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFragmentShadingRateEnumNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_fragment_shading_rate_enum)]()[]

    fn cmd_set_fragment_shading_rate_enum(
        self,
        command_buffer: CommandBuffer,
        shading_rate: FragmentShadingRateNV,
        combiner_ops: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFragmentShadingRateEnumNV.html
        """
        return self._cmd_set_fragment_shading_rate_enum(command_buffer, shading_rate, combiner_ops)


struct AcquireWinrtDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _acquire_winrt_display: fn(physical_device: PhysicalDevice, display: DisplayKHR) -> Result
    var _get_winrt_display: fn(
        physical_device: PhysicalDevice,
        device_relative_id: UInt32,
        p_display: Ptr[DisplayKHR, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._acquire_winrt_display = Ptr(to=get_device_proc_addr(
            device, "vkAcquireWinrtDisplayNV".as_c_string_slice()
        )).bitcast[type_of(self._acquire_winrt_display)]()[]
        self._get_winrt_display = Ptr(to=get_device_proc_addr(
            device, "vkGetWinrtDisplayNV".as_c_string_slice()
        )).bitcast[type_of(self._get_winrt_display)]()[]

    fn acquire_winrt_display(self, physical_device: PhysicalDevice, display: DisplayKHR) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireWinrtDisplayNV.html
        """
        return self._acquire_winrt_display(physical_device, display)

    fn get_winrt_display(
        self, physical_device: PhysicalDevice, device_relative_id: UInt32, mut display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetWinrtDisplayNV.html
        """
        return self._get_winrt_display(physical_device, device_relative_id, Ptr(to=display))


struct ExternalMemoryRdma(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_remote_address: fn(
        device: Device,
        p_memory_get_remote_address_info: Ptr[MemoryGetRemoteAddressInfoNV, ImmutAnyOrigin],
        p_address: Ptr[RemoteAddressNV, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_remote_address = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryRemoteAddressNV".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_remote_address)]()[]

    fn get_memory_remote_address(
        self,
        device: Device,
        memory_get_remote_address_info: MemoryGetRemoteAddressInfoNV,
        mut address: RemoteAddressNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryRemoteAddressNV.html
        """
        return self._get_memory_remote_address(
            device, Ptr(to=memory_get_remote_address_info), Ptr(to=address)
        )


struct CopyMemoryIndirect(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_copy_memory_indirect: fn(
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
    )
    var _cmd_copy_memory_to_image_indirect: fn(
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        p_image_subresources: Ptr[ImageSubresourceLayers, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_copy_memory_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryIndirectNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_memory_indirect)]()[]
        self._cmd_copy_memory_to_image_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToImageIndirectNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_memory_to_image_indirect)]()[]

    fn cmd_copy_memory_indirect(
        self,
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryIndirectNV.html
        """
        return self._cmd_copy_memory_indirect(command_buffer, copy_buffer_address, copy_count, stride)

    fn cmd_copy_memory_to_image_indirect[p_image_subresources_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        p_image_subresources: Ptr[ImageSubresourceLayers, p_image_subresources_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryToImageIndirectNV.html
        """
        return self._cmd_copy_memory_to_image_indirect(
            command_buffer,
            copy_buffer_address,
            copy_count,
            stride,
            dst_image,
            dst_image_layout,
            Ptr(to=p_image_subresources).bitcast[Ptr[ImageSubresourceLayers, ImmutAnyOrigin]]()[],
        )


struct MemoryDecompression(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_decompress_memory: fn(
        command_buffer: CommandBuffer,
        decompress_region_count: UInt32,
        p_decompress_memory_regions: Ptr[DecompressMemoryRegionNV, ImmutAnyOrigin],
    )
    var _cmd_decompress_memory_indirect_count: fn(
        command_buffer: CommandBuffer,
        indirect_commands_address: DeviceAddress,
        indirect_commands_count_address: DeviceAddress,
        stride: UInt32,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_decompress_memory = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_decompress_memory)]()[]
        self._cmd_decompress_memory_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryIndirectCountNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_decompress_memory_indirect_count)]()[]

    fn cmd_decompress_memory[p_decompress_memory_regions_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        decompress_region_count: UInt32,
        p_decompress_memory_regions: Ptr[DecompressMemoryRegionNV, p_decompress_memory_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecompressMemoryNV.html
        """
        return self._cmd_decompress_memory(
            command_buffer,
            decompress_region_count,
            Ptr(to=p_decompress_memory_regions).bitcast[Ptr[DecompressMemoryRegionNV, ImmutAnyOrigin]]()[],
        )

    fn cmd_decompress_memory_indirect_count(
        self,
        command_buffer: CommandBuffer,
        indirect_commands_address: DeviceAddress,
        indirect_commands_count_address: DeviceAddress,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecompressMemoryIndirectCountNV.html
        """
        return self._cmd_decompress_memory_indirect_count(
            command_buffer, indirect_commands_address, indirect_commands_count_address, stride
        )


struct DeviceGeneratedCommandsCompute(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_pipeline_indirect_memory_requirements: fn(
        device: Device,
        p_create_info: Ptr[ComputePipelineCreateInfo, ImmutAnyOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutAnyOrigin],
    )
    var _cmd_update_pipeline_indirect_buffer: fn(
        command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline
    )
    var _get_pipeline_indirect_device_address: fn(
        device: Device, p_info: Ptr[PipelineIndirectDeviceAddressInfoNV, ImmutAnyOrigin]
    ) -> DeviceAddress

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_pipeline_indirect_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineIndirectMemoryRequirementsNV".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_indirect_memory_requirements)]()[]
        self._cmd_update_pipeline_indirect_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdUpdatePipelineIndirectBufferNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_update_pipeline_indirect_buffer)]()[]
        self._get_pipeline_indirect_device_address = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineIndirectDeviceAddressNV".as_c_string_slice()
        )).bitcast[type_of(self._get_pipeline_indirect_device_address)]()[]

    fn get_pipeline_indirect_memory_requirements(
        self,
        device: Device,
        create_info: ComputePipelineCreateInfo,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineIndirectMemoryRequirementsNV.html
        """
        return self._get_pipeline_indirect_memory_requirements(
            device, Ptr(to=create_info), Ptr(to=memory_requirements)
        )

    fn cmd_update_pipeline_indirect_buffer(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdatePipelineIndirectBufferNV.html
        """
        return self._cmd_update_pipeline_indirect_buffer(command_buffer, pipeline_bind_point, pipeline)

    fn get_pipeline_indirect_device_address(
        self, device: Device, info: PipelineIndirectDeviceAddressInfoNV
    ) -> DeviceAddress:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineIndirectDeviceAddressNV.html
        """
        return self._get_pipeline_indirect_device_address(device, Ptr(to=info))


struct OpticalFlow(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_optical_flow_image_formats: fn(
        physical_device: PhysicalDevice,
        p_optical_flow_image_format_info: Ptr[OpticalFlowImageFormatInfoNV, ImmutAnyOrigin],
        p_format_count: Ptr[UInt32, MutAnyOrigin],
        p_image_format_properties: Ptr[OpticalFlowImageFormatPropertiesNV, MutAnyOrigin],
    ) -> Result
    var _create_optical_flow_session: fn(
        device: Device,
        p_create_info: Ptr[OpticalFlowSessionCreateInfoNV, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_session: Ptr[OpticalFlowSessionNV, MutAnyOrigin],
    ) -> Result
    var _destroy_optical_flow_session: fn(
        device: Device,
        session: OpticalFlowSessionNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _bind_optical_flow_session_image: fn(
        device: Device,
        session: OpticalFlowSessionNV,
        binding_point: OpticalFlowSessionBindingPointNV,
        view: ImageView,
        layout: ImageLayout,
    ) -> Result
    var _cmd_optical_flow_execute: fn(
        command_buffer: CommandBuffer,
        session: OpticalFlowSessionNV,
        p_execute_info: Ptr[OpticalFlowExecuteInfoNV, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_optical_flow_image_formats = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceOpticalFlowImageFormatsNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_optical_flow_image_formats)]()[]
        self._create_optical_flow_session = Ptr(to=get_device_proc_addr(
            device, "vkCreateOpticalFlowSessionNV".as_c_string_slice()
        )).bitcast[type_of(self._create_optical_flow_session)]()[]
        self._destroy_optical_flow_session = Ptr(to=get_device_proc_addr(
            device, "vkDestroyOpticalFlowSessionNV".as_c_string_slice()
        )).bitcast[type_of(self._destroy_optical_flow_session)]()[]
        self._bind_optical_flow_session_image = Ptr(to=get_device_proc_addr(
            device, "vkBindOpticalFlowSessionImageNV".as_c_string_slice()
        )).bitcast[type_of(self._bind_optical_flow_session_image)]()[]
        self._cmd_optical_flow_execute = Ptr(to=get_device_proc_addr(
            device, "vkCmdOpticalFlowExecuteNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_optical_flow_execute)]()[]

    fn get_physical_device_optical_flow_image_formats[
        p_image_format_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        optical_flow_image_format_info: OpticalFlowImageFormatInfoNV,
        mut format_count: UInt32,
        p_image_format_properties: Ptr[OpticalFlowImageFormatPropertiesNV, p_image_format_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceOpticalFlowImageFormatsNV.html
        """
        return self._get_physical_device_optical_flow_image_formats(
            physical_device,
            Ptr(to=optical_flow_image_format_info),
            Ptr(to=format_count),
            Ptr(to=p_image_format_properties).bitcast[Ptr[OpticalFlowImageFormatPropertiesNV, MutAnyOrigin]]()[],
        )

    fn get_physical_device_optical_flow_image_formats[
        p_image_format_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        optical_flow_image_format_info: OpticalFlowImageFormatInfoNV,
    ) -> ListResult[OpticalFlowImageFormatPropertiesNV]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceOpticalFlowImageFormatsNV.html
        """
        var list = List[OpticalFlowImageFormatPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_optical_flow_image_formats(
        physical_device,
        Ptr(to=optical_flow_image_format_info),
        Ptr(to=count),
        Ptr[OpticalFlowImageFormatPropertiesNV, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_optical_flow_image_formats(
        physical_device, Ptr(to=optical_flow_image_format_info), Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn create_optical_flow_session[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: OpticalFlowSessionCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut session: OpticalFlowSessionNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateOpticalFlowSessionNV.html
        """
        return self._create_optical_flow_session(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=session),
        )

    fn destroy_optical_flow_session[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        session: OpticalFlowSessionNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyOpticalFlowSessionNV.html
        """
        return self._destroy_optical_flow_session(
            device, session, Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[]
        )

    fn bind_optical_flow_session_image(
        self,
        device: Device,
        session: OpticalFlowSessionNV,
        binding_point: OpticalFlowSessionBindingPointNV,
        view: ImageView,
        layout: ImageLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindOpticalFlowSessionImageNV.html
        """
        return self._bind_optical_flow_session_image(device, session, binding_point, view, layout)

    fn cmd_optical_flow_execute(
        self,
        command_buffer: CommandBuffer,
        session: OpticalFlowSessionNV,
        execute_info: OpticalFlowExecuteInfoNV,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdOpticalFlowExecuteNV.html
        """
        return self._cmd_optical_flow_execute(command_buffer, session, Ptr(to=execute_info))


struct CooperativeVector(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_vector_properties: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[CooperativeVectorPropertiesNV, MutAnyOrigin],
    ) -> Result
    var _convert_cooperative_vector_matrix: fn(
        device: Device, p_info: Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutAnyOrigin]
    ) -> Result
    var _cmd_convert_cooperative_vector_matrix: fn(
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_vector_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeVectorPropertiesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_cooperative_vector_properties)]()[]
        self._convert_cooperative_vector_matrix = Ptr(to=get_device_proc_addr(
            device, "vkConvertCooperativeVectorMatrixNV".as_c_string_slice()
        )).bitcast[type_of(self._convert_cooperative_vector_matrix)]()[]
        self._cmd_convert_cooperative_vector_matrix = Ptr(to=get_device_proc_addr(
            device, "vkCmdConvertCooperativeVectorMatrixNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_convert_cooperative_vector_matrix)]()[]

    fn get_physical_device_cooperative_vector_properties[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeVectorPropertiesNV, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeVectorPropertiesNV.html
        """
        return self._get_physical_device_cooperative_vector_properties(
            physical_device,
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[CooperativeVectorPropertiesNV, MutAnyOrigin]]()[],
        )

    fn get_physical_device_cooperative_vector_properties[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeVectorPropertiesNV]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeVectorPropertiesNV.html
        """
        var list = List[CooperativeVectorPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_cooperative_vector_properties(
        physical_device, Ptr(to=count), Ptr[CooperativeVectorPropertiesNV, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_cooperative_vector_properties(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn convert_cooperative_vector_matrix(
        self, device: Device, info: ConvertCooperativeVectorMatrixInfoNV
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkConvertCooperativeVectorMatrixNV.html
        """
        return self._convert_cooperative_vector_matrix(device, Ptr(to=info))

    fn cmd_convert_cooperative_vector_matrix[p_infos_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[ConvertCooperativeVectorMatrixInfoNV, p_infos_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdConvertCooperativeVectorMatrixNV.html
        """
        return self._cmd_convert_cooperative_vector_matrix(
            command_buffer,
            info_count,
            Ptr(to=p_infos).bitcast[Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutAnyOrigin]]()[],
        )


struct LowLatency2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_latency_sleep_mode: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_sleep_mode_info: Ptr[LatencySleepModeInfoNV, ImmutAnyOrigin],
    ) -> Result
    var _latency_sleep: fn(
        device: Device, swapchain: SwapchainKHR, p_sleep_info: Ptr[LatencySleepInfoNV, ImmutAnyOrigin]
    ) -> Result
    var _set_latency_marker: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_latency_marker_info: Ptr[SetLatencyMarkerInfoNV, ImmutAnyOrigin],
    )
    var _get_latency_timings: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_latency_marker_info: Ptr[GetLatencyMarkerInfoNV, MutAnyOrigin],
    )
    var _queue_notify_out_of_band: fn(
        queue: Queue, p_queue_type_info: Ptr[OutOfBandQueueTypeInfoNV, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_latency_sleep_mode = Ptr(to=get_device_proc_addr(
            device, "vkSetLatencySleepModeNV".as_c_string_slice()
        )).bitcast[type_of(self._set_latency_sleep_mode)]()[]
        self._latency_sleep = Ptr(to=get_device_proc_addr(
            device, "vkLatencySleepNV".as_c_string_slice()
        )).bitcast[type_of(self._latency_sleep)]()[]
        self._set_latency_marker = Ptr(to=get_device_proc_addr(
            device, "vkSetLatencyMarkerNV".as_c_string_slice()
        )).bitcast[type_of(self._set_latency_marker)]()[]
        self._get_latency_timings = Ptr(to=get_device_proc_addr(
            device, "vkGetLatencyTimingsNV".as_c_string_slice()
        )).bitcast[type_of(self._get_latency_timings)]()[]
        self._queue_notify_out_of_band = Ptr(to=get_device_proc_addr(
            device, "vkQueueNotifyOutOfBandNV".as_c_string_slice()
        )).bitcast[type_of(self._queue_notify_out_of_band)]()[]

    fn set_latency_sleep_mode(
        self, device: Device, swapchain: SwapchainKHR, sleep_mode_info: LatencySleepModeInfoNV
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLatencySleepModeNV.html
        """
        return self._set_latency_sleep_mode(device, swapchain, Ptr(to=sleep_mode_info))

    fn latency_sleep(
        self, device: Device, swapchain: SwapchainKHR, sleep_info: LatencySleepInfoNV
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkLatencySleepNV.html
        """
        return self._latency_sleep(device, swapchain, Ptr(to=sleep_info))

    fn set_latency_marker(
        self, device: Device, swapchain: SwapchainKHR, latency_marker_info: SetLatencyMarkerInfoNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLatencyMarkerNV.html
        """
        return self._set_latency_marker(device, swapchain, Ptr(to=latency_marker_info))

    fn get_latency_timings(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut latency_marker_info: GetLatencyMarkerInfoNV,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetLatencyTimingsNV.html
        """
        return self._get_latency_timings(device, swapchain, Ptr(to=latency_marker_info))

    fn queue_notify_out_of_band(self, queue: Queue, queue_type_info: OutOfBandQueueTypeInfoNV):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueNotifyOutOfBandNV.html
        """
        return self._queue_notify_out_of_band(queue, Ptr(to=queue_type_info))


struct ExternalComputeQueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_external_compute_queue: fn(
        device: Device,
        p_create_info: Ptr[ExternalComputeQueueCreateInfoNV, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_external_queue: Ptr[ExternalComputeQueueNV, MutAnyOrigin],
    ) -> Result
    var _destroy_external_compute_queue: fn(
        device: Device,
        external_queue: ExternalComputeQueueNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_external_compute_queue_data: fn(
        external_queue: ExternalComputeQueueNV,
        params: Ptr[ExternalComputeQueueDataParamsNV, MutAnyOrigin],
        p_data: Ptr[NoneType, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_external_compute_queue = Ptr(to=get_device_proc_addr(
            device, "vkCreateExternalComputeQueueNV".as_c_string_slice()
        )).bitcast[type_of(self._create_external_compute_queue)]()[]
        self._destroy_external_compute_queue = Ptr(to=get_device_proc_addr(
            device, "vkDestroyExternalComputeQueueNV".as_c_string_slice()
        )).bitcast[type_of(self._destroy_external_compute_queue)]()[]
        self._get_external_compute_queue_data = Ptr(to=get_device_proc_addr(
            device, "vkGetExternalComputeQueueDataNV".as_c_string_slice()
        )).bitcast[type_of(self._get_external_compute_queue_data)]()[]

    fn create_external_compute_queue[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        create_info: ExternalComputeQueueCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
        mut external_queue: ExternalComputeQueueNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateExternalComputeQueueNV.html
        """
        return self._create_external_compute_queue(
            device,
            Ptr(to=create_info),
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
            Ptr(to=external_queue),
        )

    fn destroy_external_compute_queue[p_allocator_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        device: Device,
        external_queue: ExternalComputeQueueNV,
        p_allocator: Ptr[AllocationCallbacks, p_allocator_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyExternalComputeQueueNV.html
        """
        return self._destroy_external_compute_queue(
            device,
            external_queue,
            Ptr(to=p_allocator).bitcast[Ptr[AllocationCallbacks, ImmutAnyOrigin]]()[],
        )

    fn get_external_compute_queue_data[p_data_origin: MutOrigin = MutAnyOrigin](
        self,
        external_queue: ExternalComputeQueueNV,
        mut params: ExternalComputeQueueDataParamsNV,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetExternalComputeQueueDataNV.html
        """
        return self._get_external_compute_queue_data(
            external_queue, Ptr(to=params), Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[]
        )


struct ClusterAccelerationStructure(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_cluster_acceleration_structure_build_sizes: fn(
        device: Device,
        p_info: Ptr[ClusterAccelerationStructureInputInfoNV, ImmutAnyOrigin],
        p_size_info: Ptr[AccelerationStructureBuildSizesInfoKHR, MutAnyOrigin],
    )
    var _cmd_build_cluster_acceleration_structure_indirect: fn(
        command_buffer: CommandBuffer,
        p_command_infos: Ptr[ClusterAccelerationStructureCommandsInfoNV, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_cluster_acceleration_structure_build_sizes = Ptr(to=get_device_proc_addr(
            device, "vkGetClusterAccelerationStructureBuildSizesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_cluster_acceleration_structure_build_sizes)]()[]
        self._cmd_build_cluster_acceleration_structure_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildClusterAccelerationStructureIndirectNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_cluster_acceleration_structure_indirect)]()[]

    fn get_cluster_acceleration_structure_build_sizes(
        self,
        device: Device,
        info: ClusterAccelerationStructureInputInfoNV,
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetClusterAccelerationStructureBuildSizesNV.html
        """
        return self._get_cluster_acceleration_structure_build_sizes(device, Ptr(to=info), Ptr(to=size_info))

    fn cmd_build_cluster_acceleration_structure_indirect(
        self,
        command_buffer: CommandBuffer,
        command_infos: ClusterAccelerationStructureCommandsInfoNV,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildClusterAccelerationStructureIndirectNV.html
        """
        return self._cmd_build_cluster_acceleration_structure_indirect(
            command_buffer, Ptr(to=command_infos)
        )


struct PartitionedAccelerationStructure(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_partitioned_acceleration_structures_build_sizes: fn(
        device: Device,
        p_info: Ptr[PartitionedAccelerationStructureInstancesInputNV, ImmutAnyOrigin],
        p_size_info: Ptr[AccelerationStructureBuildSizesInfoKHR, MutAnyOrigin],
    )
    var _cmd_build_partitioned_acceleration_structures: fn(
        command_buffer: CommandBuffer,
        p_build_info: Ptr[BuildPartitionedAccelerationStructureInfoNV, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_partitioned_acceleration_structures_build_sizes = Ptr(to=get_device_proc_addr(
            device, "vkGetPartitionedAccelerationStructuresBuildSizesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_partitioned_acceleration_structures_build_sizes)]()[]
        self._cmd_build_partitioned_acceleration_structures = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildPartitionedAccelerationStructuresNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_partitioned_acceleration_structures)]()[]

    fn get_partitioned_acceleration_structures_build_sizes(
        self,
        device: Device,
        info: PartitionedAccelerationStructureInstancesInputNV,
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPartitionedAccelerationStructuresBuildSizesNV.html
        """
        return self._get_partitioned_acceleration_structures_build_sizes(
            device, Ptr(to=info), Ptr(to=size_info)
        )

    fn cmd_build_partitioned_acceleration_structures(
        self, command_buffer: CommandBuffer, build_info: BuildPartitionedAccelerationStructureInfoNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildPartitionedAccelerationStructuresNV.html
        """
        return self._cmd_build_partitioned_acceleration_structures(command_buffer, Ptr(to=build_info))


struct CooperativeMatrix2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_matrix_flexible_dimensions_properties: fn(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_matrix_flexible_dimensions_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_cooperative_matrix_flexible_dimensions_properties)]()[]

    fn get_physical_device_cooperative_matrix_flexible_dimensions_properties[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV.html
        """
        return self._get_physical_device_cooperative_matrix_flexible_dimensions_properties(
            physical_device,
            Ptr(to=property_count),
            Ptr(to=p_properties).bitcast[Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutAnyOrigin]]()[],
        )

    fn get_physical_device_cooperative_matrix_flexible_dimensions_properties[
        p_properties_origin: MutOrigin = MutAnyOrigin
    ](
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeMatrixFlexibleDimensionsPropertiesNV]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV.html
        """
        var list = List[CooperativeMatrixFlexibleDimensionsPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_physical_device_cooperative_matrix_flexible_dimensions_properties(
        physical_device,
        Ptr(to=count),
        Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutExternalOrigin](),
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_cooperative_matrix_flexible_dimensions_properties(
        physical_device, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct ComputeOccupancyPriority(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_compute_occupancy_priority: fn(
        command_buffer: CommandBuffer,
        p_parameters: Ptr[ComputeOccupancyPriorityParametersNV, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_compute_occupancy_priority = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetComputeOccupancyPriorityNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_compute_occupancy_priority)]()[]

    fn cmd_set_compute_occupancy_priority(
        self, command_buffer: CommandBuffer, parameters: ComputeOccupancyPriorityParametersNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetComputeOccupancyPriorityNV.html
        """
        return self._cmd_set_compute_occupancy_priority(command_buffer, Ptr(to=parameters))
