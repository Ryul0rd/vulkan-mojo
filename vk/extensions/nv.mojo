from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct ExternalMemoryCapabilities(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_external_image_format_properties_nv: fn(
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        external_handle_type: ExternalMemoryHandleTypeFlagsNV,
        external_image_format_properties: ExternalImageFormatPropertiesNV,
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_external_image_format_properties_nv = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalImageFormatPropertiesNV".unsafe_ptr()
        )).bitcast[type_of(self._get_physical_device_external_image_format_properties_nv)]()[]

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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalImageFormatPropertiesNV.html
        """
        return self._get_physical_device_external_image_format_properties_nv(
            physical_device,
            format,
            type,
            tiling,
            usage,
            flags,
            external_handle_type,
            Ptr(to=external_image_format_properties).bitcast[ExternalImageFormatPropertiesNV]()[],
        )


struct ExternalMemoryWin32(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_win_32_handle_nv: fn(
        device: Device,
        memory: DeviceMemory,
        handle_type: ExternalMemoryHandleTypeFlagsNV,
        handle: HANDLE,
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_win_32_handle_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryWin32HandleNV".unsafe_ptr()
        )).bitcast[type_of(self._get_memory_win_32_handle_nv)]()[]

    fn get_memory_win_32_handle_nv(
        self,
        device: Device,
        memory: DeviceMemory,
        handle_type: ExternalMemoryHandleTypeFlagsNV,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryWin32HandleNV.html
        """
        return self._get_memory_win_32_handle_nv(
            device, memory, handle_type, Ptr(to=handle).bitcast[HANDLE]()[]
        )


struct ClipSpaceWScaling(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_viewport_w_scaling_nv: fn(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_w_scalings: Ptr[ViewportWScalingNV, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_viewport_w_scaling_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWScalingNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_set_viewport_w_scaling_nv)]()[]

    fn cmd_set_viewport_w_scaling_nv(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_w_scalings: Ptr[ViewportWScalingNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWScalingNV.html
        """
        return self._cmd_set_viewport_w_scaling_nv(
            command_buffer, first_viewport, viewport_count, p_viewport_w_scalings
        )


struct ShadingRateImage(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_bind_shading_rate_image_nv: fn(
        command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    )
    var _cmd_set_viewport_shading_rate_palette_nv: fn(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_shading_rate_palettes: Ptr[ShadingRatePaletteNV, ImmutAnyOrigin],
    )
    var _cmd_set_coarse_sample_order_nv: fn(
        command_buffer: CommandBuffer,
        sample_order_type: CoarseSampleOrderTypeNV,
        custom_sample_order_count: UInt32,
        p_custom_sample_orders: Ptr[CoarseSampleOrderCustomNV, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_shading_rate_image_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindShadingRateImageNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_bind_shading_rate_image_nv)]()[]
        self._cmd_set_viewport_shading_rate_palette_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportShadingRatePaletteNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_set_viewport_shading_rate_palette_nv)]()[]
        self._cmd_set_coarse_sample_order_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCoarseSampleOrderNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_set_coarse_sample_order_nv)]()[]

    fn cmd_bind_shading_rate_image_nv(
        self, command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindShadingRateImageNV.html
        """
        return self._cmd_bind_shading_rate_image_nv(command_buffer, image_view, image_layout)

    fn cmd_set_viewport_shading_rate_palette_nv(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_shading_rate_palettes: Ptr[ShadingRatePaletteNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportShadingRatePaletteNV.html
        """
        return self._cmd_set_viewport_shading_rate_palette_nv(
            command_buffer, first_viewport, viewport_count, p_shading_rate_palettes
        )

    fn cmd_set_coarse_sample_order_nv(
        self,
        command_buffer: CommandBuffer,
        sample_order_type: CoarseSampleOrderTypeNV,
        custom_sample_order_count: UInt32,
        p_custom_sample_orders: Ptr[CoarseSampleOrderCustomNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCoarseSampleOrderNV.html
        """
        return self._cmd_set_coarse_sample_order_nv(
            command_buffer, sample_order_type, custom_sample_order_count, p_custom_sample_orders
        )


struct RayTracing(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_acceleration_structure_nv: fn(
        device: Device,
        create_info: AccelerationStructureCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        acceleration_structure: AccelerationStructureNV,
    ) -> Result
    var _destroy_acceleration_structure_nv: fn(
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_acceleration_structure_memory_requirements_nv: fn(
        device: Device,
        info: AccelerationStructureMemoryRequirementsInfoNV,
        memory_requirements: MemoryRequirements2KHR,
    )
    var _bind_acceleration_structure_memory_nv: fn(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindAccelerationStructureMemoryInfoNV, ImmutAnyOrigin],
    ) -> Result
    var _cmd_build_acceleration_structure_nv: fn(
        command_buffer: CommandBuffer,
        info: AccelerationStructureInfoNV,
        instance_data: Buffer,
        instance_offset: DeviceSize,
        update: Bool32,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        scratch: Buffer,
        scratch_offset: DeviceSize,
    )
    var _cmd_copy_acceleration_structure_nv: fn(
        command_buffer: CommandBuffer,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        mode: CopyAccelerationStructureModeKHR,
    )
    var _cmd_trace_rays_nv: fn(
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
    var _create_ray_tracing_pipelines_nv: fn(
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoNV, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var _get_ray_tracing_shader_group_handles_khr: fn(
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _get_acceleration_structure_handle_nv: fn(
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _cmd_write_acceleration_structures_properties_nv: fn(
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureNV, ImmutAnyOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    )
    var _compile_deferred_nv: fn(device: Device, pipeline: Pipeline, shader: UInt32) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateAccelerationStructureNV".unsafe_ptr()
        )).bitcast[type_of(self._create_acceleration_structure_nv)]()[]
        self._destroy_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyAccelerationStructureNV".unsafe_ptr()
        )).bitcast[type_of(self._destroy_acceleration_structure_nv)]()[]
        self._get_acceleration_structure_memory_requirements_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureMemoryRequirementsNV".unsafe_ptr()
        )).bitcast[type_of(self._get_acceleration_structure_memory_requirements_nv)]()[]
        self._bind_acceleration_structure_memory_nv = Ptr(to=get_device_proc_addr(
            device, "vkBindAccelerationStructureMemoryNV".unsafe_ptr()
        )).bitcast[type_of(self._bind_acceleration_structure_memory_nv)]()[]
        self._cmd_build_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildAccelerationStructureNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_build_acceleration_structure_nv)]()[]
        self._cmd_copy_acceleration_structure_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyAccelerationStructureNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_copy_acceleration_structure_nv)]()[]
        self._cmd_trace_rays_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdTraceRaysNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_trace_rays_nv)]()[]
        self._create_ray_tracing_pipelines_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateRayTracingPipelinesNV".unsafe_ptr()
        )).bitcast[type_of(self._create_ray_tracing_pipelines_nv)]()[]
        self._get_ray_tracing_shader_group_handles_khr = Ptr(to=get_device_proc_addr(
            device, "vkGetRayTracingShaderGroupHandlesKHR".unsafe_ptr()
        )).bitcast[type_of(self._get_ray_tracing_shader_group_handles_khr)]()[]
        self._get_acceleration_structure_handle_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetAccelerationStructureHandleNV".unsafe_ptr()
        )).bitcast[type_of(self._get_acceleration_structure_handle_nv)]()[]
        self._cmd_write_acceleration_structures_properties_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteAccelerationStructuresPropertiesNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_write_acceleration_structures_properties_nv)]()[]
        self._compile_deferred_nv = Ptr(to=get_device_proc_addr(
            device, "vkCompileDeferredNV".unsafe_ptr()
        )).bitcast[type_of(self._compile_deferred_nv)]()[]

    fn create_acceleration_structure_nv(
        self,
        device: Device,
        create_info: AccelerationStructureCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut acceleration_structure: AccelerationStructureNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateAccelerationStructureNV.html
        """
        return self._create_acceleration_structure_nv(
            device,
            Ptr(to=create_info).bitcast[AccelerationStructureCreateInfoNV]()[],
            p_allocator,
            Ptr(to=acceleration_structure).bitcast[AccelerationStructureNV]()[],
        )

    fn destroy_acceleration_structure_nv(
        self,
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyAccelerationStructureNV.html
        """
        return self._destroy_acceleration_structure_nv(device, acceleration_structure, p_allocator)

    fn get_acceleration_structure_memory_requirements_nv(
        self,
        device: Device,
        info: AccelerationStructureMemoryRequirementsInfoNV,
        mut memory_requirements: MemoryRequirements2KHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureMemoryRequirementsNV.html
        """
        return self._get_acceleration_structure_memory_requirements_nv(
            device,
            Ptr(to=info).bitcast[AccelerationStructureMemoryRequirementsInfoNV]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2KHR]()[],
        )

    fn bind_acceleration_structure_memory_nv(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindAccelerationStructureMemoryInfoNV, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindAccelerationStructureMemoryNV.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildAccelerationStructureNV.html
        """
        return self._cmd_build_acceleration_structure_nv(
            command_buffer,
            Ptr(to=info).bitcast[AccelerationStructureInfoNV]()[],
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyAccelerationStructureNV.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdTraceRaysNV.html
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
        p_create_infos: Ptr[RayTracingPipelineCreateInfoNV, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRayTracingPipelinesNV.html
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
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRayTracingShaderGroupHandlesKHR.html
        """
        return self._get_ray_tracing_shader_group_handles_khr(
            device, pipeline, first_group, group_count, data_size, p_data
        )

    fn get_acceleration_structure_handle_nv(
        self,
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureHandleNV.html
        """
        return self._get_acceleration_structure_handle_nv(
            device, acceleration_structure, data_size, p_data
        )

    fn cmd_write_acceleration_structures_properties_nv(
        self,
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureNV, ImmutAnyOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteAccelerationStructuresPropertiesNV.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCompileDeferredNV.html
        """
        return self._compile_deferred_nv(device, pipeline, shader)


struct MeshShader(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_mesh_tasks_nv: fn(
        command_buffer: CommandBuffer, task_count: UInt32, first_task: UInt32
    )
    var _cmd_draw_mesh_tasks_indirect_nv: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    )
    var _cmd_draw_mesh_tasks_indirect_count_nv: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_mesh_tasks_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_nv)]()[]
        self._cmd_draw_mesh_tasks_indirect_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_indirect_nv)]()[]
        self._cmd_draw_mesh_tasks_indirect_count_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawMeshTasksIndirectCountNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_draw_mesh_tasks_indirect_count_nv)]()[]

    fn cmd_draw_mesh_tasks_nv(
        self, command_buffer: CommandBuffer, task_count: UInt32, first_task: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksNV.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksIndirectNV.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksIndirectCountNV.html
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


struct ScissorExclusive(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_exclusive_scissor_enable_nv: fn(
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissor_enables: Ptr[Bool32, ImmutAnyOrigin],
    )
    var _cmd_set_exclusive_scissor_nv: fn(
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_exclusive_scissor_enable_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExclusiveScissorEnableNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_set_exclusive_scissor_enable_nv)]()[]
        self._cmd_set_exclusive_scissor_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExclusiveScissorNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_set_exclusive_scissor_nv)]()[]

    fn cmd_set_exclusive_scissor_enable_nv(
        self,
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissor_enables: Ptr[Bool32, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExclusiveScissorEnableNV.html
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
        p_exclusive_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetExclusiveScissorNV.html
        """
        return self._cmd_set_exclusive_scissor_nv(
            command_buffer, first_exclusive_scissor, exclusive_scissor_count, p_exclusive_scissors
        )


struct DeviceDiagnosticCheckpoints(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_checkpoint_nv: fn(
        command_buffer: CommandBuffer, p_checkpoint_marker: Ptr[NoneType, ImmutAnyOrigin]
    )
    var _get_queue_checkpoint_data_nv: fn(
        queue: Queue,
        checkpoint_data_count: UInt32,
        p_checkpoint_data: Ptr[CheckpointDataNV, MutAnyOrigin],
    )
    var _get_queue_checkpoint_data_2_nv: fn(
        queue: Queue,
        checkpoint_data_count: UInt32,
        p_checkpoint_data: Ptr[CheckpointData2NV, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_checkpoint_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCheckpointNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_set_checkpoint_nv)]()[]
        self._get_queue_checkpoint_data_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetQueueCheckpointDataNV".unsafe_ptr()
        )).bitcast[type_of(self._get_queue_checkpoint_data_nv)]()[]
        self._get_queue_checkpoint_data_2_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetQueueCheckpointData2NV".unsafe_ptr()
        )).bitcast[type_of(self._get_queue_checkpoint_data_2_nv)]()[]

    fn cmd_set_checkpoint_nv(
        self, command_buffer: CommandBuffer, p_checkpoint_marker: Ptr[NoneType, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCheckpointNV.html
        """
        return self._cmd_set_checkpoint_nv(command_buffer, p_checkpoint_marker)

    fn get_queue_checkpoint_data_nv(
        self,
        queue: Queue,
        mut checkpoint_data_count: UInt32,
        p_checkpoint_data: Ptr[CheckpointDataNV, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointDataNV.html
        """
        return self._get_queue_checkpoint_data_nv(
            queue, Ptr(to=checkpoint_data_count).bitcast[UInt32]()[], p_checkpoint_data
        )

    fn get_queue_checkpoint_data_nv(self, queue: Queue) -> List[CheckpointDataNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointDataNV.html
        """
        var list = List[CheckpointDataNV]()
        var count: UInt32 = 0
        self.get_queue_checkpoint_data_nv(queue, count, Ptr[CheckpointDataNV, MutAnyOrigin]())
        list.reserve(Int(count))
        self.get_queue_checkpoint_data_nv(queue, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn get_queue_checkpoint_data_2_nv(
        self,
        queue: Queue,
        mut checkpoint_data_count: UInt32,
        p_checkpoint_data: Ptr[CheckpointData2NV, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointData2NV.html
        """
        return self._get_queue_checkpoint_data_2_nv(
            queue, Ptr(to=checkpoint_data_count).bitcast[UInt32]()[], p_checkpoint_data
        )

    fn get_queue_checkpoint_data_2_nv(self, queue: Queue) -> List[CheckpointData2NV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointData2NV.html
        """
        var list = List[CheckpointData2NV]()
        var count: UInt32 = 0
        self.get_queue_checkpoint_data_2_nv(queue, count, Ptr[CheckpointData2NV, MutAnyOrigin]())
        list.reserve(Int(count))
        self.get_queue_checkpoint_data_2_nv(queue, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^


struct CooperativeMatrix(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_matrix_properties_nv: fn(
        physical_device: PhysicalDevice,
        property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixPropertiesNV, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_matrix_properties_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV".unsafe_ptr()
        )).bitcast[type_of(self._get_physical_device_cooperative_matrix_properties_nv)]()[]

    fn get_physical_device_cooperative_matrix_properties_nv(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixPropertiesNV, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixPropertiesNV.html
        """
        return self._get_physical_device_cooperative_matrix_properties_nv(
            physical_device, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn get_physical_device_cooperative_matrix_properties_nv(
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeMatrixPropertiesNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixPropertiesNV.html
        """
        var list = List[CooperativeMatrixPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_cooperative_matrix_properties_nv(
                physical_device, count, Ptr[CooperativeMatrixPropertiesNV, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.get_physical_device_cooperative_matrix_properties_nv(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)


struct CoverageReductionMode(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_supported_framebuffer_mixed_samples_combinations_nv: fn(
        physical_device: PhysicalDevice,
        combination_count: UInt32,
        p_combinations: Ptr[FramebufferMixedSamplesCombinationNV, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_supported_framebuffer_mixed_samples_combinations_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV".unsafe_ptr()
        )).bitcast[type_of(self._get_physical_device_supported_framebuffer_mixed_samples_combinations_nv)]()[]

    fn get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
        self,
        physical_device: PhysicalDevice,
        mut combination_count: UInt32,
        p_combinations: Ptr[FramebufferMixedSamplesCombinationNV, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV.html
        """
        return self._get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
            physical_device, Ptr(to=combination_count).bitcast[UInt32]()[], p_combinations
        )

    fn get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
        self, physical_device: PhysicalDevice
    ) -> ListResult[FramebufferMixedSamplesCombinationNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV.html
        """
        var list = List[FramebufferMixedSamplesCombinationNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
                physical_device, count, Ptr[FramebufferMixedSamplesCombinationNV, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.get_physical_device_supported_framebuffer_mixed_samples_combinations_nv(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)


struct DeviceGeneratedCommands(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_generated_commands_memory_requirements_nv: fn(
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoNV,
        memory_requirements: MemoryRequirements2,
    )
    var _cmd_preprocess_generated_commands_nv: fn(
        command_buffer: CommandBuffer, generated_commands_info: GeneratedCommandsInfoNV
    )
    var _cmd_execute_generated_commands_nv: fn(
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        generated_commands_info: GeneratedCommandsInfoNV,
    )
    var _cmd_bind_pipeline_shader_group_nv: fn(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
        group_index: UInt32,
    )
    var _create_indirect_commands_layout_nv: fn(
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        indirect_commands_layout: IndirectCommandsLayoutNV,
    ) -> Result
    var _destroy_indirect_commands_layout_nv: fn(
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_generated_commands_memory_requirements_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetGeneratedCommandsMemoryRequirementsNV".unsafe_ptr()
        )).bitcast[type_of(self._get_generated_commands_memory_requirements_nv)]()[]
        self._cmd_preprocess_generated_commands_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdPreprocessGeneratedCommandsNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_preprocess_generated_commands_nv)]()[]
        self._cmd_execute_generated_commands_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdExecuteGeneratedCommandsNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_execute_generated_commands_nv)]()[]
        self._cmd_bind_pipeline_shader_group_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindPipelineShaderGroupNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_bind_pipeline_shader_group_nv)]()[]
        self._create_indirect_commands_layout_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateIndirectCommandsLayoutNV".unsafe_ptr()
        )).bitcast[type_of(self._create_indirect_commands_layout_nv)]()[]
        self._destroy_indirect_commands_layout_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyIndirectCommandsLayoutNV".unsafe_ptr()
        )).bitcast[type_of(self._destroy_indirect_commands_layout_nv)]()[]

    fn get_generated_commands_memory_requirements_nv(
        self,
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoNV,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetGeneratedCommandsMemoryRequirementsNV.html
        """
        return self._get_generated_commands_memory_requirements_nv(
            device,
            Ptr(to=info).bitcast[GeneratedCommandsMemoryRequirementsInfoNV]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn cmd_preprocess_generated_commands_nv(
        self, command_buffer: CommandBuffer, generated_commands_info: GeneratedCommandsInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPreprocessGeneratedCommandsNV.html
        """
        return self._cmd_preprocess_generated_commands_nv(
            command_buffer, Ptr(to=generated_commands_info).bitcast[GeneratedCommandsInfoNV]()[]
        )

    fn cmd_execute_generated_commands_nv(
        self,
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        generated_commands_info: GeneratedCommandsInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteGeneratedCommandsNV.html
        """
        return self._cmd_execute_generated_commands_nv(
            command_buffer,
            is_preprocessed,
            Ptr(to=generated_commands_info).bitcast[GeneratedCommandsInfoNV]()[],
        )

    fn cmd_bind_pipeline_shader_group_nv(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
        group_index: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipelineShaderGroupNV.html
        """
        return self._cmd_bind_pipeline_shader_group_nv(
            command_buffer, pipeline_bind_point, pipeline, group_index
        )

    fn create_indirect_commands_layout_nv(
        self,
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut indirect_commands_layout: IndirectCommandsLayoutNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectCommandsLayoutNV.html
        """
        return self._create_indirect_commands_layout_nv(
            device,
            Ptr(to=create_info).bitcast[IndirectCommandsLayoutCreateInfoNV]()[],
            p_allocator,
            Ptr(to=indirect_commands_layout).bitcast[IndirectCommandsLayoutNV]()[],
        )

    fn destroy_indirect_commands_layout_nv(
        self,
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectCommandsLayoutNV.html
        """
        return self._destroy_indirect_commands_layout_nv(
            device, indirect_commands_layout, p_allocator
        )


struct CudaKernelLaunch(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_cuda_module_nv: fn(
        device: Device,
        create_info: CudaModuleCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        module: CudaModuleNV,
    ) -> Result
    var _get_cuda_module_cache_nv: fn(
        device: Device,
        module: CudaModuleNV,
        cache_size: UInt,
        p_cache_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var _create_cuda_function_nv: fn(
        device: Device,
        create_info: CudaFunctionCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        function: CudaFunctionNV,
    ) -> Result
    var _destroy_cuda_module_nv: fn(
        device: Device, module: CudaModuleNV, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var _destroy_cuda_function_nv: fn(
        device: Device,
        function: CudaFunctionNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _cmd_cuda_launch_kernel_nv: fn(command_buffer: CommandBuffer, launch_info: CudaLaunchInfoNV)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_cuda_module_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateCudaModuleNV".unsafe_ptr()
        )).bitcast[type_of(self._create_cuda_module_nv)]()[]
        self._get_cuda_module_cache_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetCudaModuleCacheNV".unsafe_ptr()
        )).bitcast[type_of(self._get_cuda_module_cache_nv)]()[]
        self._create_cuda_function_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateCudaFunctionNV".unsafe_ptr()
        )).bitcast[type_of(self._create_cuda_function_nv)]()[]
        self._destroy_cuda_module_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCudaModuleNV".unsafe_ptr()
        )).bitcast[type_of(self._destroy_cuda_module_nv)]()[]
        self._destroy_cuda_function_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCudaFunctionNV".unsafe_ptr()
        )).bitcast[type_of(self._destroy_cuda_function_nv)]()[]
        self._cmd_cuda_launch_kernel_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdCudaLaunchKernelNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_cuda_launch_kernel_nv)]()[]

    fn create_cuda_module_nv(
        self,
        device: Device,
        create_info: CudaModuleCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut module: CudaModuleNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCudaModuleNV.html
        """
        return self._create_cuda_module_nv(
            device,
            Ptr(to=create_info).bitcast[CudaModuleCreateInfoNV]()[],
            p_allocator,
            Ptr(to=module).bitcast[CudaModuleNV]()[],
        )

    fn get_cuda_module_cache_nv(
        self,
        device: Device,
        module: CudaModuleNV,
        mut cache_size: UInt,
        p_cache_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetCudaModuleCacheNV.html
        """
        return self._get_cuda_module_cache_nv(
            device, module, Ptr(to=cache_size).bitcast[UInt]()[], p_cache_data
        )

    fn get_cuda_module_cache_nv(self, device: Device, module: CudaModuleNV) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetCudaModuleCacheNV.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_cuda_module_cache_nv(
                device, module, count, Ptr[NoneType, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
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
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut function: CudaFunctionNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCudaFunctionNV.html
        """
        return self._create_cuda_function_nv(
            device,
            Ptr(to=create_info).bitcast[CudaFunctionCreateInfoNV]()[],
            p_allocator,
            Ptr(to=function).bitcast[CudaFunctionNV]()[],
        )

    fn destroy_cuda_module_nv(
        self,
        device: Device,
        module: CudaModuleNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCudaModuleNV.html
        """
        return self._destroy_cuda_module_nv(device, module, p_allocator)

    fn destroy_cuda_function_nv(
        self,
        device: Device,
        function: CudaFunctionNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCudaFunctionNV.html
        """
        return self._destroy_cuda_function_nv(device, function, p_allocator)

    fn cmd_cuda_launch_kernel_nv(
        self, command_buffer: CommandBuffer, launch_info: CudaLaunchInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCudaLaunchKernelNV.html
        """
        return self._cmd_cuda_launch_kernel_nv(
            command_buffer, Ptr(to=launch_info).bitcast[CudaLaunchInfoNV]()[]
        )


struct FragmentShadingRateEnums(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_fragment_shading_rate_enum_nv: fn(
        command_buffer: CommandBuffer,
        shading_rate: FragmentShadingRateNV,
        combiner_ops: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_fragment_shading_rate_enum_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFragmentShadingRateEnumNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_set_fragment_shading_rate_enum_nv)]()[]

    fn cmd_set_fragment_shading_rate_enum_nv(
        self,
        command_buffer: CommandBuffer,
        shading_rate: FragmentShadingRateNV,
        combiner_ops: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFragmentShadingRateEnumNV.html
        """
        return self._cmd_set_fragment_shading_rate_enum_nv(
            command_buffer, shading_rate, combiner_ops
        )


struct AcquireWinrtDisplay(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _acquire_winrt_display_nv: fn(
        physical_device: PhysicalDevice, display: DisplayKHR
    ) -> Result
    var _get_winrt_display_nv: fn(
        physical_device: PhysicalDevice, device_relative_id: UInt32, display: DisplayKHR
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._acquire_winrt_display_nv = Ptr(to=get_device_proc_addr(
            device, "vkAcquireWinrtDisplayNV".unsafe_ptr()
        )).bitcast[type_of(self._acquire_winrt_display_nv)]()[]
        self._get_winrt_display_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetWinrtDisplayNV".unsafe_ptr()
        )).bitcast[type_of(self._get_winrt_display_nv)]()[]

    fn acquire_winrt_display_nv(
        self, physical_device: PhysicalDevice, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireWinrtDisplayNV.html
        """
        return self._acquire_winrt_display_nv(physical_device, display)

    fn get_winrt_display_nv(
        self, physical_device: PhysicalDevice, device_relative_id: UInt32, mut display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetWinrtDisplayNV.html
        """
        return self._get_winrt_display_nv(
            physical_device, device_relative_id, Ptr(to=display).bitcast[DisplayKHR]()[]
        )


struct ExternalMemoryRdma(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_remote_address_nv: fn(
        device: Device,
        memory_get_remote_address_info: MemoryGetRemoteAddressInfoNV,
        address: RemoteAddressNV,
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_remote_address_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryRemoteAddressNV".unsafe_ptr()
        )).bitcast[type_of(self._get_memory_remote_address_nv)]()[]

    fn get_memory_remote_address_nv(
        self,
        device: Device,
        memory_get_remote_address_info: MemoryGetRemoteAddressInfoNV,
        mut address: RemoteAddressNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryRemoteAddressNV.html
        """
        return self._get_memory_remote_address_nv(
            device,
            Ptr(to=memory_get_remote_address_info).bitcast[MemoryGetRemoteAddressInfoNV]()[],
            Ptr(to=address).bitcast[RemoteAddressNV]()[],
        )


struct CopyMemoryIndirect(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_copy_memory_indirect_nv: fn(
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
    )
    var _cmd_copy_memory_to_image_indirect_nv: fn(
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        p_image_subresources: Ptr[ImageSubresourceLayers, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_copy_memory_indirect_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryIndirectNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_copy_memory_indirect_nv)]()[]
        self._cmd_copy_memory_to_image_indirect_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToImageIndirectNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_copy_memory_to_image_indirect_nv)]()[]

    fn cmd_copy_memory_indirect_nv(
        self,
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryIndirectNV.html
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
        p_image_subresources: Ptr[ImageSubresourceLayers, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyMemoryToImageIndirectNV.html
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


struct MemoryDecompression(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_decompress_memory_nv: fn(
        command_buffer: CommandBuffer,
        decompress_region_count: UInt32,
        p_decompress_memory_regions: Ptr[DecompressMemoryRegionNV, ImmutAnyOrigin],
    )
    var _cmd_decompress_memory_indirect_count_nv: fn(
        command_buffer: CommandBuffer,
        indirect_commands_address: DeviceAddress,
        indirect_commands_count_address: DeviceAddress,
        stride: UInt32,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_decompress_memory_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_decompress_memory_nv)]()[]
        self._cmd_decompress_memory_indirect_count_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryIndirectCountNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_decompress_memory_indirect_count_nv)]()[]

    fn cmd_decompress_memory_nv(
        self,
        command_buffer: CommandBuffer,
        decompress_region_count: UInt32,
        p_decompress_memory_regions: Ptr[DecompressMemoryRegionNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecompressMemoryNV.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDecompressMemoryIndirectCountNV.html
        """
        return self._cmd_decompress_memory_indirect_count_nv(
            command_buffer, indirect_commands_address, indirect_commands_count_address, stride
        )


struct DeviceGeneratedCommandsCompute(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_pipeline_indirect_memory_requirements_nv: fn(
        device: Device,
        create_info: ComputePipelineCreateInfo,
        memory_requirements: MemoryRequirements2,
    )
    var _cmd_update_pipeline_indirect_buffer_nv: fn(
        command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline
    )
    var _get_pipeline_indirect_device_address_nv: fn(
        device: Device, info: PipelineIndirectDeviceAddressInfoNV
    ) -> DeviceAddress

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_pipeline_indirect_memory_requirements_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineIndirectMemoryRequirementsNV".unsafe_ptr()
        )).bitcast[type_of(self._get_pipeline_indirect_memory_requirements_nv)]()[]
        self._cmd_update_pipeline_indirect_buffer_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdUpdatePipelineIndirectBufferNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_update_pipeline_indirect_buffer_nv)]()[]
        self._get_pipeline_indirect_device_address_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineIndirectDeviceAddressNV".unsafe_ptr()
        )).bitcast[type_of(self._get_pipeline_indirect_device_address_nv)]()[]

    fn get_pipeline_indirect_memory_requirements_nv(
        self,
        device: Device,
        create_info: ComputePipelineCreateInfo,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineIndirectMemoryRequirementsNV.html
        """
        return self._get_pipeline_indirect_memory_requirements_nv(
            device,
            Ptr(to=create_info).bitcast[ComputePipelineCreateInfo]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn cmd_update_pipeline_indirect_buffer_nv(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdatePipelineIndirectBufferNV.html
        """
        return self._cmd_update_pipeline_indirect_buffer_nv(
            command_buffer, pipeline_bind_point, pipeline
        )

    fn get_pipeline_indirect_device_address_nv(
        self, device: Device, info: PipelineIndirectDeviceAddressInfoNV
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineIndirectDeviceAddressNV.html
        """
        return self._get_pipeline_indirect_device_address_nv(
            device, Ptr(to=info).bitcast[PipelineIndirectDeviceAddressInfoNV]()[]
        )


struct OpticalFlow(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_optical_flow_image_formats_nv: fn(
        physical_device: PhysicalDevice,
        optical_flow_image_format_info: OpticalFlowImageFormatInfoNV,
        format_count: UInt32,
        p_image_format_properties: Ptr[OpticalFlowImageFormatPropertiesNV, MutAnyOrigin],
    ) -> Result
    var _create_optical_flow_session_nv: fn(
        device: Device,
        create_info: OpticalFlowSessionCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        session: OpticalFlowSessionNV,
    ) -> Result
    var _destroy_optical_flow_session_nv: fn(
        device: Device,
        session: OpticalFlowSessionNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _bind_optical_flow_session_image_nv: fn(
        device: Device,
        session: OpticalFlowSessionNV,
        binding_point: OpticalFlowSessionBindingPointNV,
        view: ImageView,
        layout: ImageLayout,
    ) -> Result
    var _cmd_optical_flow_execute_nv: fn(
        command_buffer: CommandBuffer,
        session: OpticalFlowSessionNV,
        execute_info: OpticalFlowExecuteInfoNV,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_optical_flow_image_formats_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceOpticalFlowImageFormatsNV".unsafe_ptr()
        )).bitcast[type_of(self._get_physical_device_optical_flow_image_formats_nv)]()[]
        self._create_optical_flow_session_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateOpticalFlowSessionNV".unsafe_ptr()
        )).bitcast[type_of(self._create_optical_flow_session_nv)]()[]
        self._destroy_optical_flow_session_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyOpticalFlowSessionNV".unsafe_ptr()
        )).bitcast[type_of(self._destroy_optical_flow_session_nv)]()[]
        self._bind_optical_flow_session_image_nv = Ptr(to=get_device_proc_addr(
            device, "vkBindOpticalFlowSessionImageNV".unsafe_ptr()
        )).bitcast[type_of(self._bind_optical_flow_session_image_nv)]()[]
        self._cmd_optical_flow_execute_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdOpticalFlowExecuteNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_optical_flow_execute_nv)]()[]

    fn get_physical_device_optical_flow_image_formats_nv(
        self,
        physical_device: PhysicalDevice,
        optical_flow_image_format_info: OpticalFlowImageFormatInfoNV,
        mut format_count: UInt32,
        p_image_format_properties: Ptr[OpticalFlowImageFormatPropertiesNV, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceOpticalFlowImageFormatsNV.html
        """
        return self._get_physical_device_optical_flow_image_formats_nv(
            physical_device,
            Ptr(to=optical_flow_image_format_info).bitcast[OpticalFlowImageFormatInfoNV]()[],
            Ptr(to=format_count).bitcast[UInt32]()[],
            p_image_format_properties,
        )

    fn get_physical_device_optical_flow_image_formats_nv(
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
            result = self.get_physical_device_optical_flow_image_formats_nv(
                physical_device,
                optical_flow_image_format_info,
                count,
                Ptr[OpticalFlowImageFormatPropertiesNV, MutAnyOrigin](),
            )
            if result == Result.SUCCESS:
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
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut session: OpticalFlowSessionNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateOpticalFlowSessionNV.html
        """
        return self._create_optical_flow_session_nv(
            device,
            Ptr(to=create_info).bitcast[OpticalFlowSessionCreateInfoNV]()[],
            p_allocator,
            Ptr(to=session).bitcast[OpticalFlowSessionNV]()[],
        )

    fn destroy_optical_flow_session_nv(
        self,
        device: Device,
        session: OpticalFlowSessionNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyOpticalFlowSessionNV.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindOpticalFlowSessionImageNV.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdOpticalFlowExecuteNV.html
        """
        return self._cmd_optical_flow_execute_nv(
            command_buffer, session, Ptr(to=execute_info).bitcast[OpticalFlowExecuteInfoNV]()[]
        )


struct CooperativeVector(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_vector_properties_nv: fn(
        physical_device: PhysicalDevice,
        property_count: UInt32,
        p_properties: Ptr[CooperativeVectorPropertiesNV, MutAnyOrigin],
    ) -> Result
    var _convert_cooperative_vector_matrix_nv: fn(
        device: Device, info: ConvertCooperativeVectorMatrixInfoNV
    ) -> Result
    var _cmd_convert_cooperative_vector_matrix_nv: fn(
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_vector_properties_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeVectorPropertiesNV".unsafe_ptr()
        )).bitcast[type_of(self._get_physical_device_cooperative_vector_properties_nv)]()[]
        self._convert_cooperative_vector_matrix_nv = Ptr(to=get_device_proc_addr(
            device, "vkConvertCooperativeVectorMatrixNV".unsafe_ptr()
        )).bitcast[type_of(self._convert_cooperative_vector_matrix_nv)]()[]
        self._cmd_convert_cooperative_vector_matrix_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdConvertCooperativeVectorMatrixNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_convert_cooperative_vector_matrix_nv)]()[]

    fn get_physical_device_cooperative_vector_properties_nv(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeVectorPropertiesNV, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeVectorPropertiesNV.html
        """
        return self._get_physical_device_cooperative_vector_properties_nv(
            physical_device, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn get_physical_device_cooperative_vector_properties_nv(
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeVectorPropertiesNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeVectorPropertiesNV.html
        """
        var list = List[CooperativeVectorPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_cooperative_vector_properties_nv(
                physical_device, count, Ptr[CooperativeVectorPropertiesNV, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkConvertCooperativeVectorMatrixNV.html
        """
        return self._convert_cooperative_vector_matrix_nv(
            device, Ptr(to=info).bitcast[ConvertCooperativeVectorMatrixInfoNV]()[]
        )

    fn cmd_convert_cooperative_vector_matrix_nv(
        self,
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdConvertCooperativeVectorMatrixNV.html
        """
        return self._cmd_convert_cooperative_vector_matrix_nv(command_buffer, info_count, p_infos)


struct LowLatency2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_latency_sleep_mode_nv: fn(
        device: Device, swapchain: SwapchainKHR, sleep_mode_info: LatencySleepModeInfoNV
    ) -> Result
    var _latency_sleep_nv: fn(
        device: Device, swapchain: SwapchainKHR, sleep_info: LatencySleepInfoNV
    ) -> Result
    var _set_latency_marker_nv: fn(
        device: Device, swapchain: SwapchainKHR, latency_marker_info: SetLatencyMarkerInfoNV
    )
    var _get_latency_timings_nv: fn(
        device: Device, swapchain: SwapchainKHR, latency_marker_info: GetLatencyMarkerInfoNV
    )
    var _queue_notify_out_of_band_nv: fn(queue: Queue, queue_type_info: OutOfBandQueueTypeInfoNV)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_latency_sleep_mode_nv = Ptr(to=get_device_proc_addr(
            device, "vkSetLatencySleepModeNV".unsafe_ptr()
        )).bitcast[type_of(self._set_latency_sleep_mode_nv)]()[]
        self._latency_sleep_nv = Ptr(to=get_device_proc_addr(
            device, "vkLatencySleepNV".unsafe_ptr()
        )).bitcast[type_of(self._latency_sleep_nv)]()[]
        self._set_latency_marker_nv = Ptr(to=get_device_proc_addr(
            device, "vkSetLatencyMarkerNV".unsafe_ptr()
        )).bitcast[type_of(self._set_latency_marker_nv)]()[]
        self._get_latency_timings_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetLatencyTimingsNV".unsafe_ptr()
        )).bitcast[type_of(self._get_latency_timings_nv)]()[]
        self._queue_notify_out_of_band_nv = Ptr(to=get_device_proc_addr(
            device, "vkQueueNotifyOutOfBandNV".unsafe_ptr()
        )).bitcast[type_of(self._queue_notify_out_of_band_nv)]()[]

    fn set_latency_sleep_mode_nv(
        self, device: Device, swapchain: SwapchainKHR, sleep_mode_info: LatencySleepModeInfoNV
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLatencySleepModeNV.html
        """
        return self._set_latency_sleep_mode_nv(
            device, swapchain, Ptr(to=sleep_mode_info).bitcast[LatencySleepModeInfoNV]()[]
        )

    fn latency_sleep_nv(
        self, device: Device, swapchain: SwapchainKHR, sleep_info: LatencySleepInfoNV
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkLatencySleepNV.html
        """
        return self._latency_sleep_nv(
            device, swapchain, Ptr(to=sleep_info).bitcast[LatencySleepInfoNV]()[]
        )

    fn set_latency_marker_nv(
        self, device: Device, swapchain: SwapchainKHR, latency_marker_info: SetLatencyMarkerInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLatencyMarkerNV.html
        """
        return self._set_latency_marker_nv(
            device, swapchain, Ptr(to=latency_marker_info).bitcast[SetLatencyMarkerInfoNV]()[]
        )

    fn get_latency_timings_nv(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut latency_marker_info: GetLatencyMarkerInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetLatencyTimingsNV.html
        """
        return self._get_latency_timings_nv(
            device, swapchain, Ptr(to=latency_marker_info).bitcast[GetLatencyMarkerInfoNV]()[]
        )

    fn queue_notify_out_of_band_nv(self, queue: Queue, queue_type_info: OutOfBandQueueTypeInfoNV):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueNotifyOutOfBandNV.html
        """
        return self._queue_notify_out_of_band_nv(
            queue, Ptr(to=queue_type_info).bitcast[OutOfBandQueueTypeInfoNV]()[]
        )


struct ExternalComputeQueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_external_compute_queue_nv: fn(
        device: Device,
        create_info: ExternalComputeQueueCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        external_queue: ExternalComputeQueueNV,
    ) -> Result
    var _destroy_external_compute_queue_nv: fn(
        device: Device,
        external_queue: ExternalComputeQueueNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var _get_external_compute_queue_data_nv: fn(
        external_queue: ExternalComputeQueueNV,
        params: ExternalComputeQueueDataParamsNV,
        p_data: Ptr[NoneType, MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_external_compute_queue_nv = Ptr(to=get_device_proc_addr(
            device, "vkCreateExternalComputeQueueNV".unsafe_ptr()
        )).bitcast[type_of(self._create_external_compute_queue_nv)]()[]
        self._destroy_external_compute_queue_nv = Ptr(to=get_device_proc_addr(
            device, "vkDestroyExternalComputeQueueNV".unsafe_ptr()
        )).bitcast[type_of(self._destroy_external_compute_queue_nv)]()[]
        self._get_external_compute_queue_data_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetExternalComputeQueueDataNV".unsafe_ptr()
        )).bitcast[type_of(self._get_external_compute_queue_data_nv)]()[]

    fn create_external_compute_queue_nv(
        self,
        device: Device,
        create_info: ExternalComputeQueueCreateInfoNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut external_queue: ExternalComputeQueueNV,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateExternalComputeQueueNV.html
        """
        return self._create_external_compute_queue_nv(
            device,
            Ptr(to=create_info).bitcast[ExternalComputeQueueCreateInfoNV]()[],
            p_allocator,
            Ptr(to=external_queue).bitcast[ExternalComputeQueueNV]()[],
        )

    fn destroy_external_compute_queue_nv(
        self,
        device: Device,
        external_queue: ExternalComputeQueueNV,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyExternalComputeQueueNV.html
        """
        return self._destroy_external_compute_queue_nv(device, external_queue, p_allocator)

    fn get_external_compute_queue_data_nv(
        self,
        external_queue: ExternalComputeQueueNV,
        mut params: ExternalComputeQueueDataParamsNV,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetExternalComputeQueueDataNV.html
        """
        return self._get_external_compute_queue_data_nv(
            external_queue, Ptr(to=params).bitcast[ExternalComputeQueueDataParamsNV]()[], p_data
        )


struct ClusterAccelerationStructure(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_cluster_acceleration_structure_build_sizes_nv: fn(
        device: Device,
        info: ClusterAccelerationStructureInputInfoNV,
        size_info: AccelerationStructureBuildSizesInfoKHR,
    )
    var _cmd_build_cluster_acceleration_structure_indirect_nv: fn(
        command_buffer: CommandBuffer, command_infos: ClusterAccelerationStructureCommandsInfoNV
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_cluster_acceleration_structure_build_sizes_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetClusterAccelerationStructureBuildSizesNV".unsafe_ptr()
        )).bitcast[type_of(self._get_cluster_acceleration_structure_build_sizes_nv)]()[]
        self._cmd_build_cluster_acceleration_structure_indirect_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildClusterAccelerationStructureIndirectNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_build_cluster_acceleration_structure_indirect_nv)]()[]

    fn get_cluster_acceleration_structure_build_sizes_nv(
        self,
        device: Device,
        info: ClusterAccelerationStructureInputInfoNV,
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetClusterAccelerationStructureBuildSizesNV.html
        """
        return self._get_cluster_acceleration_structure_build_sizes_nv(
            device,
            Ptr(to=info).bitcast[ClusterAccelerationStructureInputInfoNV]()[],
            Ptr(to=size_info).bitcast[AccelerationStructureBuildSizesInfoKHR]()[],
        )

    fn cmd_build_cluster_acceleration_structure_indirect_nv(
        self,
        command_buffer: CommandBuffer,
        command_infos: ClusterAccelerationStructureCommandsInfoNV,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildClusterAccelerationStructureIndirectNV.html
        """
        return self._cmd_build_cluster_acceleration_structure_indirect_nv(
            command_buffer,
            Ptr(to=command_infos).bitcast[ClusterAccelerationStructureCommandsInfoNV]()[],
        )


struct PartitionedAccelerationStructure(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_partitioned_acceleration_structures_build_sizes_nv: fn(
        device: Device,
        info: PartitionedAccelerationStructureInstancesInputNV,
        size_info: AccelerationStructureBuildSizesInfoKHR,
    )
    var _cmd_build_partitioned_acceleration_structures_nv: fn(
        command_buffer: CommandBuffer, build_info: BuildPartitionedAccelerationStructureInfoNV
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_partitioned_acceleration_structures_build_sizes_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPartitionedAccelerationStructuresBuildSizesNV".unsafe_ptr()
        )).bitcast[type_of(self._get_partitioned_acceleration_structures_build_sizes_nv)]()[]
        self._cmd_build_partitioned_acceleration_structures_nv = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildPartitionedAccelerationStructuresNV".unsafe_ptr()
        )).bitcast[type_of(self._cmd_build_partitioned_acceleration_structures_nv)]()[]

    fn get_partitioned_acceleration_structures_build_sizes_nv(
        self,
        device: Device,
        info: PartitionedAccelerationStructureInstancesInputNV,
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPartitionedAccelerationStructuresBuildSizesNV.html
        """
        return self._get_partitioned_acceleration_structures_build_sizes_nv(
            device,
            Ptr(to=info).bitcast[PartitionedAccelerationStructureInstancesInputNV]()[],
            Ptr(to=size_info).bitcast[AccelerationStructureBuildSizesInfoKHR]()[],
        )

    fn cmd_build_partitioned_acceleration_structures_nv(
        self, command_buffer: CommandBuffer, build_info: BuildPartitionedAccelerationStructureInfoNV
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildPartitionedAccelerationStructuresNV.html
        """
        return self._cmd_build_partitioned_acceleration_structures_nv(
            command_buffer,
            Ptr(to=build_info).bitcast[BuildPartitionedAccelerationStructureInfoNV]()[],
        )


struct CooperativeMatrix2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv: fn(
        physical_device: PhysicalDevice,
        property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv = Ptr(to=get_device_proc_addr(
            device, "vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV".unsafe_ptr()
        )).bitcast[type_of(self._get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv)]()[]

    fn get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV.html
        """
        return self._get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
            physical_device, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
        self, physical_device: PhysicalDevice
    ) -> ListResult[CooperativeMatrixFlexibleDimensionsPropertiesNV]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV.html
        """
        var list = List[CooperativeMatrixFlexibleDimensionsPropertiesNV]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
                physical_device,
                count,
                Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutAnyOrigin](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.get_physical_device_cooperative_matrix_flexible_dimensions_properties_nv(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)
