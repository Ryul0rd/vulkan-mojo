from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions
from vk.structs import *


struct ExternalMemoryCapabilities(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_external_image_format_properties: def(
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        external_handle_type: ExternalMemoryHandleTypeFlagsNV,
        p_external_image_format_properties: Ptr[ExternalImageFormatPropertiesNV, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_external_image_format_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalImageFormatPropertiesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_external_image_format_properties)]()[]

    def get_physical_device_external_image_format_properties(
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
            Ptr(to=external_image_format_properties).bitcast[ExternalImageFormatPropertiesNV]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct ExternalMemoryWin32(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_win_32_handle: def(
        device: Device,
        memory: DeviceMemory,
        handle_type: ExternalMemoryHandleTypeFlagsNV,
        p_handle: Ptr[HANDLE, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_win_32_handle = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryWin32HandleNV".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_win_32_handle)]()[]

    def get_memory_win_32_handle(
        self,
        device: Device,
        memory: DeviceMemory,
        handle_type: ExternalMemoryHandleTypeFlagsNV,
        mut handle: HANDLE,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryWin32HandleNV.html
        """
        return self._get_memory_win_32_handle(
            device,
            memory,
            handle_type,
            Ptr(to=handle).bitcast[HANDLE]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct ClipSpaceWScaling(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_viewport_w_scaling: def(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewport_w_scalings: Ptr[ViewportWScalingNV, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_viewport_w_scaling = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWScalingNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_viewport_w_scaling)]()[]

    def cmd_set_viewport_w_scaling[
        p_viewport_w_scalings_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
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
            Ptr(to=p_viewport_w_scalings).bitcast[Ptr[ViewportWScalingNV, ImmutUntrackedOrigin]]()[],
        )


struct ShadingRateImage(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_bind_shading_rate_image: def(
        command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    ) thin abi("C")
    var _cmd_set_viewport_shading_rate_palette: def(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_shading_rate_palettes: Ptr[ShadingRatePaletteNV, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_coarse_sample_order: def(
        command_buffer: CommandBuffer,
        sample_order_type: CoarseSampleOrderTypeNV,
        custom_sample_order_count: UInt32,
        p_custom_sample_orders: Ptr[CoarseSampleOrderCustomNV, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
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

    def cmd_bind_shading_rate_image(
        self, command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindShadingRateImageNV.html
        """
        return self._cmd_bind_shading_rate_image(command_buffer, image_view, image_layout)

    def cmd_set_viewport_shading_rate_palette[
        p_shading_rate_palettes_origin: ImmutOrigin = ImmutUntrackedOrigin
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
            Ptr(to=p_shading_rate_palettes).bitcast[Ptr[ShadingRatePaletteNV, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_coarse_sample_order[
        p_custom_sample_orders_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
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
            Ptr(to=p_custom_sample_orders).bitcast[Ptr[CoarseSampleOrderCustomNV, ImmutUntrackedOrigin]]()[],
        )


struct RayTracing(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_acceleration_structure: def(
        device: Device,
        p_create_info: Ptr[AccelerationStructureCreateInfoNV, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_acceleration_structure: Ptr[AccelerationStructureNV, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_acceleration_structure: def(
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _get_acceleration_structure_memory_requirements: def(
        device: Device,
        p_info: Ptr[AccelerationStructureMemoryRequirementsInfoNV, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2KHR, MutUntrackedOrigin],
    ) thin abi("C")
    var _bind_acceleration_structure_memory: def(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindAccelerationStructureMemoryInfoNV, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _cmd_build_acceleration_structure: def(
        command_buffer: CommandBuffer,
        p_info: Ptr[AccelerationStructureInfoNV, ImmutUntrackedOrigin],
        instance_data: Buffer,
        instance_offset: DeviceSize,
        update: Bool32,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        scratch: Buffer,
        scratch_offset: DeviceSize,
    ) thin abi("C")
    var _cmd_copy_acceleration_structure: def(
        command_buffer: CommandBuffer,
        dst: AccelerationStructureNV,
        src: AccelerationStructureNV,
        mode: CopyAccelerationStructureModeKHR,
    ) thin abi("C")
    var _cmd_trace_rays: def(
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
    ) thin abi("C")
    var _create_ray_tracing_pipelines: def(
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoNV, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_pipelines: Ptr[Pipeline, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_ray_tracing_shader_group_handles: def(
        device: Device,
        pipeline: Pipeline,
        first_group: UInt32,
        group_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_acceleration_structure_handle: def(
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        data_size: UInt,
        p_data: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _cmd_write_acceleration_structures_properties: def(
        command_buffer: CommandBuffer,
        acceleration_structure_count: UInt32,
        p_acceleration_structures: Ptr[AccelerationStructureNV, ImmutUntrackedOrigin],
        query_type: QueryType,
        query_pool: QueryPool,
        first_query: UInt32,
    ) thin abi("C")
    var _compile_deferred: def(
        device: Device, pipeline: Pipeline, shader: UInt32
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
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

    def create_acceleration_structure[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: AccelerationStructureCreateInfoNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut acceleration_structure: AccelerationStructureNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateAccelerationStructureNV.html
        """
        return self._create_acceleration_structure(
            device,
            Ptr(to=create_info).bitcast[AccelerationStructureCreateInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=acceleration_structure).bitcast[AccelerationStructureNV]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_acceleration_structure[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        acceleration_structure: AccelerationStructureNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyAccelerationStructureNV.html
        """
        return self._destroy_acceleration_structure(
            device,
            acceleration_structure,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_acceleration_structure_memory_requirements(
        self,
        device: Device,
        info: AccelerationStructureMemoryRequirementsInfoNV,
        mut memory_requirements: MemoryRequirements2KHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetAccelerationStructureMemoryRequirementsNV.html
        """
        return self._get_acceleration_structure_memory_requirements(
            device,
            Ptr(to=info).bitcast[AccelerationStructureMemoryRequirementsInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2KHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def bind_acceleration_structure_memory[p_bind_infos_origin: ImmutOrigin = ImmutUntrackedOrigin](
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
            Ptr(to=p_bind_infos).bitcast[Ptr[BindAccelerationStructureMemoryInfoNV, ImmutUntrackedOrigin]]()[],
        )

    def cmd_build_acceleration_structure(
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
            Ptr(to=info).bitcast[AccelerationStructureInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            instance_data,
            instance_offset,
            update,
            dst,
            src,
            scratch,
            scratch_offset,
        )

    def cmd_copy_acceleration_structure(
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

    def cmd_trace_rays(
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

    def create_ray_tracing_pipelines[
        p_create_infos_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin,
        p_pipelines_origin: MutOrigin = MutUntrackedOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[RayTracingPipelineCreateInfoNV, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRayTracingPipelinesNV.html
        """
        return self._create_ray_tracing_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[RayTracingPipelineCreateInfoNV, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def get_ray_tracing_shader_group_handles[p_data_origin: MutOrigin = MutUntrackedOrigin](
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
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )

    def get_acceleration_structure_handle[p_data_origin: MutOrigin = MutUntrackedOrigin](
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
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )

    def cmd_write_acceleration_structures_properties[
        p_acceleration_structures_origin: ImmutOrigin = ImmutUntrackedOrigin
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
            Ptr(to=p_acceleration_structures).bitcast[Ptr[AccelerationStructureNV, ImmutUntrackedOrigin]]()[],
            query_type,
            query_pool,
            first_query,
        )

    def compile_deferred(self, device: Device, pipeline: Pipeline, shader: UInt32) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCompileDeferredNV.html
        """
        return self._compile_deferred(device, pipeline, shader)


struct MeshShader(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_mesh_tasks: def(
        command_buffer: CommandBuffer, task_count: UInt32, first_task: UInt32
    ) thin abi("C")
    var _cmd_draw_mesh_tasks_indirect: def(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ) thin abi("C")
    var _cmd_draw_mesh_tasks_indirect_count: def(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
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

    def cmd_draw_mesh_tasks(
        self, command_buffer: CommandBuffer, task_count: UInt32, first_task: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawMeshTasksNV.html
        """
        return self._cmd_draw_mesh_tasks(command_buffer, task_count, first_task)

    def cmd_draw_mesh_tasks_indirect(
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

    def cmd_draw_mesh_tasks_indirect_count(
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
    var _cmd_set_exclusive_scissor_enable: def(
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissor_enables: Ptr[Bool32, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_set_exclusive_scissor: def(
        command_buffer: CommandBuffer,
        first_exclusive_scissor: UInt32,
        exclusive_scissor_count: UInt32,
        p_exclusive_scissors: Ptr[Rect2D, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_exclusive_scissor_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExclusiveScissorEnableNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_exclusive_scissor_enable)]()[]
        self._cmd_set_exclusive_scissor = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetExclusiveScissorNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_exclusive_scissor)]()[]

    def cmd_set_exclusive_scissor_enable[
        p_exclusive_scissor_enables_origin: ImmutOrigin = ImmutUntrackedOrigin
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
            Ptr(to=p_exclusive_scissor_enables).bitcast[Ptr[Bool32, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_exclusive_scissor[p_exclusive_scissors_origin: ImmutOrigin = ImmutUntrackedOrigin](
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
            Ptr(to=p_exclusive_scissors).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[],
        )


struct DeviceDiagnosticCheckpoints(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_checkpoint: def(
        command_buffer: CommandBuffer, p_checkpoint_marker: Ptr[NoneType, ImmutUntrackedOrigin]
    ) thin abi("C")
    var _get_queue_checkpoint_data: def(
        queue: Queue,
        p_checkpoint_data_count: Ptr[UInt32, MutUntrackedOrigin],
        p_checkpoint_data: Optional[Ptr[CheckpointDataNV, MutUntrackedOrigin]],
    ) thin abi("C")
    var _get_queue_checkpoint_data_2: def(
        queue: Queue,
        p_checkpoint_data_count: Ptr[UInt32, MutUntrackedOrigin],
        p_checkpoint_data: Optional[Ptr[CheckpointData2NV, MutUntrackedOrigin]],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
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

    def cmd_set_checkpoint[p_checkpoint_marker_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        command_buffer: CommandBuffer,
        p_checkpoint_marker: Ptr[NoneType, p_checkpoint_marker_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCheckpointNV.html
        """
        return self._cmd_set_checkpoint(
            command_buffer, Ptr(to=p_checkpoint_marker).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[]
        )

    def get_queue_checkpoint_data[p_checkpoint_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        queue: Queue,
        mut checkpoint_data_count: UInt32,
        p_checkpoint_data: Optional[Ptr[CheckpointDataNV, p_checkpoint_data_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointDataNV.html
        """
        return self._get_queue_checkpoint_data(
            queue,
            Ptr(to=checkpoint_data_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_checkpoint_data).bitcast[Optional[Ptr[CheckpointDataNV, MutUntrackedOrigin]]]()[],
        )

    def get_queue_checkpoint_data[p_checkpoint_data_origin: MutOrigin = MutUntrackedOrigin](
        self, queue: Queue
    ) -> List[CheckpointDataNV]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointDataNV.html
        """
        var list = List[CheckpointDataNV]()
        var count: UInt32 = 0
        self._get_queue_checkpoint_data(
            queue,
            Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Optional[Ptr[CheckpointDataNV, MutUntrackedOrigin]](),
        )
        list.reserve(Int(count))
        self._get_queue_checkpoint_data(
                queue,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return list^

    def get_queue_checkpoint_data_2[p_checkpoint_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        queue: Queue,
        mut checkpoint_data_count: UInt32,
        p_checkpoint_data: Optional[Ptr[CheckpointData2NV, p_checkpoint_data_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointData2NV.html
        """
        return self._get_queue_checkpoint_data_2(
            queue,
            Ptr(to=checkpoint_data_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_checkpoint_data).bitcast[Optional[Ptr[CheckpointData2NV, MutUntrackedOrigin]]]()[],
        )

    def get_queue_checkpoint_data_2[p_checkpoint_data_origin: MutOrigin = MutUntrackedOrigin](
        self, queue: Queue
    ) -> List[CheckpointData2NV]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueueCheckpointData2NV.html
        """
        var list = List[CheckpointData2NV]()
        var count: UInt32 = 0
        self._get_queue_checkpoint_data_2(
            queue,
            Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Optional[Ptr[CheckpointData2NV, MutUntrackedOrigin]](),
        )
        list.reserve(Int(count))
        self._get_queue_checkpoint_data_2(
                queue,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return list^


struct CooperativeMatrix(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_matrix_properties: def(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_properties: Optional[Ptr[CooperativeMatrixPropertiesNV, MutUntrackedOrigin]],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_cooperative_matrix_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceCooperativeMatrixPropertiesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_cooperative_matrix_properties)]()[]

    def get_physical_device_cooperative_matrix_properties[
        p_properties_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[CooperativeMatrixPropertiesNV, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixPropertiesNV.html
        """
        return self._get_physical_device_cooperative_matrix_properties(
            physical_device,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[CooperativeMatrixPropertiesNV, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_cooperative_matrix_properties[
        p_properties_origin: MutOrigin = MutUntrackedOrigin
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
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[CooperativeMatrixPropertiesNV, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_cooperative_matrix_properties(
                    physical_device,
                    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)


struct CoverageReductionMode(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_supported_framebuffer_mixed_samples_combinations: def(
        physical_device: PhysicalDevice,
        p_combination_count: Ptr[UInt32, MutUntrackedOrigin],
        p_combinations: Optional[Ptr[FramebufferMixedSamplesCombinationNV, MutUntrackedOrigin]],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_supported_framebuffer_mixed_samples_combinations = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_supported_framebuffer_mixed_samples_combinations)]()[]

    def get_physical_device_supported_framebuffer_mixed_samples_combinations[
        p_combinations_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut combination_count: UInt32,
        p_combinations: Optional[Ptr[FramebufferMixedSamplesCombinationNV, p_combinations_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSupportedFramebufferMixedSamplesCombinationsNV.html
        """
        return self._get_physical_device_supported_framebuffer_mixed_samples_combinations(
            physical_device,
            Ptr(to=combination_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_combinations).bitcast[Optional[Ptr[FramebufferMixedSamplesCombinationNV, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_supported_framebuffer_mixed_samples_combinations[
        p_combinations_origin: MutOrigin = MutUntrackedOrigin
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
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[FramebufferMixedSamplesCombinationNV, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_supported_framebuffer_mixed_samples_combinations(
                    physical_device,
                    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)


struct DeviceGeneratedCommands(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_generated_commands_memory_requirements: def(
        device: Device,
        p_info: Ptr[GeneratedCommandsMemoryRequirementsInfoNV, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_preprocess_generated_commands: def(
        command_buffer: CommandBuffer,
        p_generated_commands_info: Ptr[GeneratedCommandsInfoNV, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_execute_generated_commands: def(
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        p_generated_commands_info: Ptr[GeneratedCommandsInfoNV, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_bind_pipeline_shader_group: def(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
        group_index: UInt32,
    ) thin abi("C")
    var _create_indirect_commands_layout: def(
        device: Device,
        p_create_info: Ptr[IndirectCommandsLayoutCreateInfoNV, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_indirect_commands_layout: Ptr[IndirectCommandsLayoutNV, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_indirect_commands_layout: def(
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
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

    def get_generated_commands_memory_requirements(
        self,
        device: Device,
        info: GeneratedCommandsMemoryRequirementsInfoNV,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetGeneratedCommandsMemoryRequirementsNV.html
        """
        return self._get_generated_commands_memory_requirements(
            device,
            Ptr(to=info).bitcast[GeneratedCommandsMemoryRequirementsInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_preprocess_generated_commands(
        self, command_buffer: CommandBuffer, generated_commands_info: GeneratedCommandsInfoNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPreprocessGeneratedCommandsNV.html
        """
        return self._cmd_preprocess_generated_commands(
            command_buffer,
            Ptr(to=generated_commands_info).bitcast[GeneratedCommandsInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_execute_generated_commands(
        self,
        command_buffer: CommandBuffer,
        is_preprocessed: Bool32,
        generated_commands_info: GeneratedCommandsInfoNV,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteGeneratedCommandsNV.html
        """
        return self._cmd_execute_generated_commands(
            command_buffer,
            is_preprocessed,
            Ptr(to=generated_commands_info).bitcast[GeneratedCommandsInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_bind_pipeline_shader_group(
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

    def create_indirect_commands_layout[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: IndirectCommandsLayoutCreateInfoNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut indirect_commands_layout: IndirectCommandsLayoutNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateIndirectCommandsLayoutNV.html
        """
        return self._create_indirect_commands_layout(
            device,
            Ptr(to=create_info).bitcast[IndirectCommandsLayoutCreateInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=indirect_commands_layout).bitcast[IndirectCommandsLayoutNV]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_indirect_commands_layout[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        indirect_commands_layout: IndirectCommandsLayoutNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyIndirectCommandsLayoutNV.html
        """
        return self._destroy_indirect_commands_layout(
            device,
            indirect_commands_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )


struct CudaKernelLaunch(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_cuda_module: def(
        device: Device,
        p_create_info: Ptr[CudaModuleCreateInfoNV, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_module: Ptr[CudaModuleNV, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _get_cuda_module_cache: def(
        device: Device,
        module: CudaModuleNV,
        p_cache_size: Ptr[UInt, MutUntrackedOrigin],
        p_cache_data: Optional[Ptr[NoneType, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _create_cuda_function: def(
        device: Device,
        p_create_info: Ptr[CudaFunctionCreateInfoNV, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_function: Ptr[CudaFunctionNV, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_cuda_module: def(
        device: Device,
        module: CudaModuleNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _destroy_cuda_function: def(
        device: Device,
        function: CudaFunctionNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _cmd_cuda_launch_kernel: def(
        command_buffer: CommandBuffer, p_launch_info: Ptr[CudaLaunchInfoNV, ImmutUntrackedOrigin]
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
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

    def create_cuda_module[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: CudaModuleCreateInfoNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut module: CudaModuleNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCudaModuleNV.html
        """
        return self._create_cuda_module(
            device,
            Ptr(to=create_info).bitcast[CudaModuleCreateInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=module).bitcast[CudaModuleNV]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_cuda_module_cache[p_cache_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        module: CudaModuleNV,
        mut cache_size: UInt,
        p_cache_data: Optional[Ptr[NoneType, p_cache_data_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetCudaModuleCacheNV.html
        """
        return self._get_cuda_module_cache(
            device,
            module,
            Ptr(to=cache_size).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_cache_data).bitcast[Optional[Ptr[NoneType, MutUntrackedOrigin]]]()[],
        )

    def get_cuda_module_cache[p_cache_data_origin: MutOrigin = MutUntrackedOrigin](
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
                device,
                module,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[NoneType, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_cuda_module_cache(
                    device,
                    module,
                    Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().bitcast[NoneType]().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)

    def create_cuda_function[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: CudaFunctionCreateInfoNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut function: CudaFunctionNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCudaFunctionNV.html
        """
        return self._create_cuda_function(
            device,
            Ptr(to=create_info).bitcast[CudaFunctionCreateInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=function).bitcast[CudaFunctionNV]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_cuda_module[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        module: CudaModuleNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCudaModuleNV.html
        """
        return self._destroy_cuda_module(
            device,
            module,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def destroy_cuda_function[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        function: CudaFunctionNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCudaFunctionNV.html
        """
        return self._destroy_cuda_function(
            device,
            function,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_cuda_launch_kernel(self, command_buffer: CommandBuffer, launch_info: CudaLaunchInfoNV):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCudaLaunchKernelNV.html
        """
        return self._cmd_cuda_launch_kernel(
            command_buffer,
            Ptr(to=launch_info).bitcast[CudaLaunchInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct FragmentShadingRateEnums(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_fragment_shading_rate_enum: def(
        command_buffer: CommandBuffer,
        shading_rate: FragmentShadingRateNV,
        combiner_ops: InlineArray[FragmentShadingRateCombinerOpKHR, Int(2)],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_fragment_shading_rate_enum = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFragmentShadingRateEnumNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_fragment_shading_rate_enum)]()[]

    def cmd_set_fragment_shading_rate_enum(
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
    var _acquire_winrt_display: def(
        physical_device: PhysicalDevice, display: DisplayKHR
    ) thin abi("C") -> Result
    var _get_winrt_display: def(
        physical_device: PhysicalDevice,
        device_relative_id: UInt32,
        p_display: Ptr[DisplayKHR, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._acquire_winrt_display = Ptr(to=get_instance_proc_addr(
            instance, "vkAcquireWinrtDisplayNV".as_c_string_slice()
        )).bitcast[type_of(self._acquire_winrt_display)]()[]
        self._get_winrt_display = Ptr(to=get_instance_proc_addr(
            instance, "vkGetWinrtDisplayNV".as_c_string_slice()
        )).bitcast[type_of(self._get_winrt_display)]()[]

    def acquire_winrt_display(
        self, physical_device: PhysicalDevice, display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAcquireWinrtDisplayNV.html
        """
        return self._acquire_winrt_display(physical_device, display)

    def get_winrt_display(
        self, physical_device: PhysicalDevice, device_relative_id: UInt32, mut display: DisplayKHR
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetWinrtDisplayNV.html
        """
        return self._get_winrt_display(
            physical_device,
            device_relative_id,
            Ptr(to=display).bitcast[DisplayKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct ExternalMemoryRdma(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_memory_remote_address: def(
        device: Device,
        p_memory_get_remote_address_info: Ptr[MemoryGetRemoteAddressInfoNV, ImmutUntrackedOrigin],
        p_address: Ptr[RemoteAddressNV, MutUntrackedOrigin],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_memory_remote_address = Ptr(to=get_device_proc_addr(
            device, "vkGetMemoryRemoteAddressNV".as_c_string_slice()
        )).bitcast[type_of(self._get_memory_remote_address)]()[]

    def get_memory_remote_address(
        self,
        device: Device,
        memory_get_remote_address_info: MemoryGetRemoteAddressInfoNV,
        mut address: RemoteAddressNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetMemoryRemoteAddressNV.html
        """
        return self._get_memory_remote_address(
            device,
            Ptr(to=memory_get_remote_address_info).bitcast[MemoryGetRemoteAddressInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=address).bitcast[RemoteAddressNV]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct CopyMemoryIndirect(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_copy_memory_indirect: def(
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
    ) thin abi("C")
    var _cmd_copy_memory_to_image_indirect: def(
        command_buffer: CommandBuffer,
        copy_buffer_address: DeviceAddress,
        copy_count: UInt32,
        stride: UInt32,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        p_image_subresources: Ptr[ImageSubresourceLayers, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_copy_memory_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryIndirectNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_memory_indirect)]()[]
        self._cmd_copy_memory_to_image_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyMemoryToImageIndirectNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_copy_memory_to_image_indirect)]()[]

    def cmd_copy_memory_indirect(
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

    def cmd_copy_memory_to_image_indirect[
        p_image_subresources_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
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
            Ptr(to=p_image_subresources).bitcast[Ptr[ImageSubresourceLayers, ImmutUntrackedOrigin]]()[],
        )


struct MemoryDecompression(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_decompress_memory: def(
        command_buffer: CommandBuffer,
        decompress_region_count: UInt32,
        p_decompress_memory_regions: Ptr[DecompressMemoryRegionNV, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_decompress_memory_indirect_count: def(
        command_buffer: CommandBuffer,
        indirect_commands_address: DeviceAddress,
        indirect_commands_count_address: DeviceAddress,
        stride: UInt32,
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_decompress_memory = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_decompress_memory)]()[]
        self._cmd_decompress_memory_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDecompressMemoryIndirectCountNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_decompress_memory_indirect_count)]()[]

    def cmd_decompress_memory[
        p_decompress_memory_regions_origin: ImmutOrigin = ImmutUntrackedOrigin
    ](
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
            Ptr(to=p_decompress_memory_regions).bitcast[Ptr[DecompressMemoryRegionNV, ImmutUntrackedOrigin]]()[],
        )

    def cmd_decompress_memory_indirect_count(
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
    var _get_pipeline_indirect_memory_requirements: def(
        device: Device,
        p_create_info: Ptr[ComputePipelineCreateInfo, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_update_pipeline_indirect_buffer: def(
        command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline
    ) thin abi("C")
    var _get_pipeline_indirect_device_address: def(
        device: Device, p_info: Ptr[PipelineIndirectDeviceAddressInfoNV, ImmutUntrackedOrigin]
    ) thin abi("C") -> DeviceAddress

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
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

    def get_pipeline_indirect_memory_requirements(
        self,
        device: Device,
        create_info: ComputePipelineCreateInfo,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineIndirectMemoryRequirementsNV.html
        """
        return self._get_pipeline_indirect_memory_requirements(
            device,
            Ptr(to=create_info).bitcast[ComputePipelineCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_update_pipeline_indirect_buffer(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdatePipelineIndirectBufferNV.html
        """
        return self._cmd_update_pipeline_indirect_buffer(command_buffer, pipeline_bind_point, pipeline)

    def get_pipeline_indirect_device_address(
        self, device: Device, info: PipelineIndirectDeviceAddressInfoNV
    ) -> DeviceAddress:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineIndirectDeviceAddressNV.html
        """
        return self._get_pipeline_indirect_device_address(
            device,
            Ptr(to=info).bitcast[PipelineIndirectDeviceAddressInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct OpticalFlow(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_optical_flow_image_formats: def(
        physical_device: PhysicalDevice,
        p_optical_flow_image_format_info: Ptr[OpticalFlowImageFormatInfoNV, ImmutUntrackedOrigin],
        p_format_count: Ptr[UInt32, MutUntrackedOrigin],
        p_image_format_properties: Optional[Ptr[OpticalFlowImageFormatPropertiesNV, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _create_optical_flow_session: def(
        device: Device,
        p_create_info: Ptr[OpticalFlowSessionCreateInfoNV, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_session: Ptr[OpticalFlowSessionNV, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_optical_flow_session: def(
        device: Device,
        session: OpticalFlowSessionNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _bind_optical_flow_session_image: def(
        device: Device,
        session: OpticalFlowSessionNV,
        binding_point: OpticalFlowSessionBindingPointNV,
        view: ImageView,
        layout: ImageLayout,
    ) thin abi("C") -> Result
    var _cmd_optical_flow_execute: def(
        command_buffer: CommandBuffer,
        session: OpticalFlowSessionNV,
        p_execute_info: Ptr[OpticalFlowExecuteInfoNV, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](
        out self, global_functions: T, instance: Instance, device: Device
    ):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_optical_flow_image_formats = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceOpticalFlowImageFormatsNV".as_c_string_slice()
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

    def get_physical_device_optical_flow_image_formats[
        p_image_format_properties_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        optical_flow_image_format_info: OpticalFlowImageFormatInfoNV,
        mut format_count: UInt32,
        p_image_format_properties: Optional[Ptr[OpticalFlowImageFormatPropertiesNV, p_image_format_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceOpticalFlowImageFormatsNV.html
        """
        return self._get_physical_device_optical_flow_image_formats(
            physical_device,
            Ptr(to=optical_flow_image_format_info).bitcast[OpticalFlowImageFormatInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=format_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_image_format_properties).bitcast[Optional[Ptr[OpticalFlowImageFormatPropertiesNV, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_optical_flow_image_formats[
        p_image_format_properties_origin: MutOrigin = MutUntrackedOrigin
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
                Ptr(to=optical_flow_image_format_info).bitcast[OpticalFlowImageFormatInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[OpticalFlowImageFormatPropertiesNV, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_optical_flow_image_formats(
                    physical_device,
                    Ptr(to=optical_flow_image_format_info).bitcast[OpticalFlowImageFormatInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
                    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)

    def create_optical_flow_session[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: OpticalFlowSessionCreateInfoNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut session: OpticalFlowSessionNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateOpticalFlowSessionNV.html
        """
        return self._create_optical_flow_session(
            device,
            Ptr(to=create_info).bitcast[OpticalFlowSessionCreateInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=session).bitcast[OpticalFlowSessionNV]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_optical_flow_session[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        session: OpticalFlowSessionNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyOpticalFlowSessionNV.html
        """
        return self._destroy_optical_flow_session(
            device,
            session,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def bind_optical_flow_session_image(
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

    def cmd_optical_flow_execute(
        self,
        command_buffer: CommandBuffer,
        session: OpticalFlowSessionNV,
        execute_info: OpticalFlowExecuteInfoNV,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdOpticalFlowExecuteNV.html
        """
        return self._cmd_optical_flow_execute(
            command_buffer,
            session,
            Ptr(to=execute_info).bitcast[OpticalFlowExecuteInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct CooperativeVector(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_vector_properties: def(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_properties: Optional[Ptr[CooperativeVectorPropertiesNV, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var _convert_cooperative_vector_matrix: def(
        device: Device, p_info: Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var _cmd_convert_cooperative_vector_matrix: def(
        command_buffer: CommandBuffer,
        info_count: UInt32,
        p_infos: Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](
        out self, global_functions: T, instance: Instance, device: Device
    ):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_physical_device_cooperative_vector_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceCooperativeVectorPropertiesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_cooperative_vector_properties)]()[]
        self._convert_cooperative_vector_matrix = Ptr(to=get_device_proc_addr(
            device, "vkConvertCooperativeVectorMatrixNV".as_c_string_slice()
        )).bitcast[type_of(self._convert_cooperative_vector_matrix)]()[]
        self._cmd_convert_cooperative_vector_matrix = Ptr(to=get_device_proc_addr(
            device, "vkCmdConvertCooperativeVectorMatrixNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_convert_cooperative_vector_matrix)]()[]

    def get_physical_device_cooperative_vector_properties[
        p_properties_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[CooperativeVectorPropertiesNV, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeVectorPropertiesNV.html
        """
        return self._get_physical_device_cooperative_vector_properties(
            physical_device,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[CooperativeVectorPropertiesNV, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_cooperative_vector_properties[
        p_properties_origin: MutOrigin = MutUntrackedOrigin
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
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[CooperativeVectorPropertiesNV, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_cooperative_vector_properties(
                    physical_device,
                    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)

    def convert_cooperative_vector_matrix(
        self, device: Device, info: ConvertCooperativeVectorMatrixInfoNV
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkConvertCooperativeVectorMatrixNV.html
        """
        return self._convert_cooperative_vector_matrix(
            device,
            Ptr(to=info).bitcast[ConvertCooperativeVectorMatrixInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_convert_cooperative_vector_matrix[p_infos_origin: ImmutOrigin = ImmutUntrackedOrigin](
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
            Ptr(to=p_infos).bitcast[Ptr[ConvertCooperativeVectorMatrixInfoNV, ImmutUntrackedOrigin]]()[],
        )


struct LowLatency2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_latency_sleep_mode: def(
        device: Device,
        swapchain: SwapchainKHR,
        p_sleep_mode_info: Ptr[LatencySleepModeInfoNV, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _latency_sleep: def(
        device: Device,
        swapchain: SwapchainKHR,
        p_sleep_info: Ptr[LatencySleepInfoNV, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _set_latency_marker: def(
        device: Device,
        swapchain: SwapchainKHR,
        p_latency_marker_info: Ptr[SetLatencyMarkerInfoNV, ImmutUntrackedOrigin],
    ) thin abi("C")
    var _get_latency_timings: def(
        device: Device,
        swapchain: SwapchainKHR,
        p_latency_marker_info: Ptr[GetLatencyMarkerInfoNV, MutUntrackedOrigin],
    ) thin abi("C")
    var _queue_notify_out_of_band: def(
        queue: Queue, p_queue_type_info: Ptr[OutOfBandQueueTypeInfoNV, ImmutUntrackedOrigin]
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
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

    def set_latency_sleep_mode(
        self, device: Device, swapchain: SwapchainKHR, sleep_mode_info: LatencySleepModeInfoNV
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLatencySleepModeNV.html
        """
        return self._set_latency_sleep_mode(
            device,
            swapchain,
            Ptr(to=sleep_mode_info).bitcast[LatencySleepModeInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def latency_sleep(
        self, device: Device, swapchain: SwapchainKHR, sleep_info: LatencySleepInfoNV
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkLatencySleepNV.html
        """
        return self._latency_sleep(
            device,
            swapchain,
            Ptr(to=sleep_info).bitcast[LatencySleepInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def set_latency_marker(
        self, device: Device, swapchain: SwapchainKHR, latency_marker_info: SetLatencyMarkerInfoNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLatencyMarkerNV.html
        """
        return self._set_latency_marker(
            device,
            swapchain,
            Ptr(to=latency_marker_info).bitcast[SetLatencyMarkerInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_latency_timings(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut latency_marker_info: GetLatencyMarkerInfoNV,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetLatencyTimingsNV.html
        """
        return self._get_latency_timings(
            device,
            swapchain,
            Ptr(to=latency_marker_info).bitcast[GetLatencyMarkerInfoNV]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def queue_notify_out_of_band(self, queue: Queue, queue_type_info: OutOfBandQueueTypeInfoNV):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueNotifyOutOfBandNV.html
        """
        return self._queue_notify_out_of_band(
            queue,
            Ptr(to=queue_type_info).bitcast[OutOfBandQueueTypeInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct ExternalComputeQueue(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _create_external_compute_queue: def(
        device: Device,
        p_create_info: Ptr[ExternalComputeQueueCreateInfoNV, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_external_queue: Ptr[ExternalComputeQueueNV, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var _destroy_external_compute_queue: def(
        device: Device,
        external_queue: ExternalComputeQueueNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var _get_external_compute_queue_data: def(
        external_queue: ExternalComputeQueueNV,
        params: Ptr[ExternalComputeQueueDataParamsNV, MutUntrackedOrigin],
        p_data: Ptr[NoneType, MutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](
        out self, global_functions: T, instance: Instance, device: Device
    ):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._create_external_compute_queue = Ptr(to=get_device_proc_addr(
            device, "vkCreateExternalComputeQueueNV".as_c_string_slice()
        )).bitcast[type_of(self._create_external_compute_queue)]()[]
        self._destroy_external_compute_queue = Ptr(to=get_device_proc_addr(
            device, "vkDestroyExternalComputeQueueNV".as_c_string_slice()
        )).bitcast[type_of(self._destroy_external_compute_queue)]()[]
        self._get_external_compute_queue_data = Ptr(to=get_instance_proc_addr(
            instance, "vkGetExternalComputeQueueDataNV".as_c_string_slice()
        )).bitcast[type_of(self._get_external_compute_queue_data)]()[]

    def create_external_compute_queue[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        create_info: ExternalComputeQueueCreateInfoNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut external_queue: ExternalComputeQueueNV,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateExternalComputeQueueNV.html
        """
        return self._create_external_compute_queue(
            device,
            Ptr(to=create_info).bitcast[ExternalComputeQueueCreateInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=external_queue).bitcast[ExternalComputeQueueNV]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_external_compute_queue[p_allocator_origin: ImmutOrigin = ImmutUntrackedOrigin](
        self,
        device: Device,
        external_queue: ExternalComputeQueueNV,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyExternalComputeQueueNV.html
        """
        return self._destroy_external_compute_queue(
            device,
            external_queue,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_external_compute_queue_data[p_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        external_queue: ExternalComputeQueueNV,
        mut params: ExternalComputeQueueDataParamsNV,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetExternalComputeQueueDataNV.html
        """
        return self._get_external_compute_queue_data(
            external_queue,
            Ptr(to=params).bitcast[ExternalComputeQueueDataParamsNV]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
        )


struct ClusterAccelerationStructure(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_cluster_acceleration_structure_build_sizes: def(
        device: Device,
        p_info: Ptr[ClusterAccelerationStructureInputInfoNV, ImmutUntrackedOrigin],
        p_size_info: Ptr[AccelerationStructureBuildSizesInfoKHR, MutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_build_cluster_acceleration_structure_indirect: def(
        command_buffer: CommandBuffer,
        p_command_infos: Ptr[ClusterAccelerationStructureCommandsInfoNV, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_cluster_acceleration_structure_build_sizes = Ptr(to=get_device_proc_addr(
            device, "vkGetClusterAccelerationStructureBuildSizesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_cluster_acceleration_structure_build_sizes)]()[]
        self._cmd_build_cluster_acceleration_structure_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildClusterAccelerationStructureIndirectNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_cluster_acceleration_structure_indirect)]()[]

    def get_cluster_acceleration_structure_build_sizes(
        self,
        device: Device,
        info: ClusterAccelerationStructureInputInfoNV,
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetClusterAccelerationStructureBuildSizesNV.html
        """
        return self._get_cluster_acceleration_structure_build_sizes(
            device,
            Ptr(to=info).bitcast[ClusterAccelerationStructureInputInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=size_info).bitcast[AccelerationStructureBuildSizesInfoKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_build_cluster_acceleration_structure_indirect(
        self,
        command_buffer: CommandBuffer,
        command_infos: ClusterAccelerationStructureCommandsInfoNV,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildClusterAccelerationStructureIndirectNV.html
        """
        return self._cmd_build_cluster_acceleration_structure_indirect(
            command_buffer,
            Ptr(to=command_infos).bitcast[ClusterAccelerationStructureCommandsInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct PartitionedAccelerationStructure(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_partitioned_acceleration_structures_build_sizes: def(
        device: Device,
        p_info: Ptr[PartitionedAccelerationStructureInstancesInputNV, ImmutUntrackedOrigin],
        p_size_info: Ptr[AccelerationStructureBuildSizesInfoKHR, MutUntrackedOrigin],
    ) thin abi("C")
    var _cmd_build_partitioned_acceleration_structures: def(
        command_buffer: CommandBuffer,
        p_build_info: Ptr[BuildPartitionedAccelerationStructureInfoNV, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_partitioned_acceleration_structures_build_sizes = Ptr(to=get_device_proc_addr(
            device, "vkGetPartitionedAccelerationStructuresBuildSizesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_partitioned_acceleration_structures_build_sizes)]()[]
        self._cmd_build_partitioned_acceleration_structures = Ptr(to=get_device_proc_addr(
            device, "vkCmdBuildPartitionedAccelerationStructuresNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_build_partitioned_acceleration_structures)]()[]

    def get_partitioned_acceleration_structures_build_sizes(
        self,
        device: Device,
        info: PartitionedAccelerationStructureInstancesInputNV,
        mut size_info: AccelerationStructureBuildSizesInfoKHR,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPartitionedAccelerationStructuresBuildSizesNV.html
        """
        return self._get_partitioned_acceleration_structures_build_sizes(
            device,
            Ptr(to=info).bitcast[PartitionedAccelerationStructureInstancesInputNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=size_info).bitcast[AccelerationStructureBuildSizesInfoKHR]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_build_partitioned_acceleration_structures(
        self, command_buffer: CommandBuffer, build_info: BuildPartitionedAccelerationStructureInfoNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBuildPartitionedAccelerationStructuresNV.html
        """
        return self._cmd_build_partitioned_acceleration_structures(
            command_buffer,
            Ptr(to=build_info).bitcast[BuildPartitionedAccelerationStructureInfoNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct CooperativeMatrix2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_physical_device_cooperative_matrix_flexible_dimensions_properties: def(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_properties: Optional[Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutUntrackedOrigin]],
    ) thin abi("C") -> Result

    def __init__[T: GlobalFunctions](out self, global_functions: T, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        var get_instance_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self._get_physical_device_cooperative_matrix_flexible_dimensions_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV".as_c_string_slice()
        )).bitcast[type_of(self._get_physical_device_cooperative_matrix_flexible_dimensions_properties)]()[]

    def get_physical_device_cooperative_matrix_flexible_dimensions_properties[
        p_properties_origin: MutOrigin = MutUntrackedOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceCooperativeMatrixFlexibleDimensionsPropertiesNV.html
        """
        return self._get_physical_device_cooperative_matrix_flexible_dimensions_properties(
            physical_device,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_cooperative_matrix_flexible_dimensions_properties[
        p_properties_origin: MutOrigin = MutUntrackedOrigin
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
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Optional[Ptr[CooperativeMatrixFlexibleDimensionsPropertiesNV, MutUntrackedOrigin]](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_physical_device_cooperative_matrix_flexible_dimensions_properties(
                    physical_device,
                    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
                )
                list._len = Int(count)
        return ListResult(list^, result)


struct ComputeOccupancyPriority(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_set_compute_occupancy_priority: def(
        command_buffer: CommandBuffer,
        p_parameters: Ptr[ComputeOccupancyPriorityParametersNV, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_set_compute_occupancy_priority = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetComputeOccupancyPriorityNV".as_c_string_slice()
        )).bitcast[type_of(self._cmd_set_compute_occupancy_priority)]()[]

    def cmd_set_compute_occupancy_priority(
        self, command_buffer: CommandBuffer, parameters: ComputeOccupancyPriorityParametersNV
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetComputeOccupancyPriorityNV.html
        """
        return self._cmd_set_compute_occupancy_priority(
            command_buffer,
            Ptr(to=parameters).bitcast[ComputeOccupancyPriorityParametersNV]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )
