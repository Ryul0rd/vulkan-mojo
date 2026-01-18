from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct DrawIndirectCount(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_indirect_count: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    )
    var _cmd_draw_indexed_indirect_count: fn(
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
        self._cmd_draw_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirectCount".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_indirect_count)]()[]
        self._cmd_draw_indexed_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndexedIndirectCount".as_c_string_slice()
        )).bitcast[type_of(self._cmd_draw_indexed_indirect_count)]()[]

    fn cmd_draw_indirect_count(
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirectCount.html
        """
        return self._cmd_draw_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )

    fn cmd_draw_indexed_indirect_count(
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
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirectCount.html
        """
        return self._cmd_draw_indexed_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )


struct ShaderInfo(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_shader_info_amd: fn(
        device: Device,
        pipeline: Pipeline,
        shader_stage: ShaderStageFlagBits,
        info_type: ShaderInfoTypeAMD,
        p_info_size: Ptr[UInt, MutAnyOrigin],
        p_info: Ptr[NoneType, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_shader_info_amd = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderInfoAMD".as_c_string_slice()
        )).bitcast[type_of(self._get_shader_info_amd)]()[]

    fn get_shader_info_amd(
        self,
        device: Device,
        pipeline: Pipeline,
        shader_stage: ShaderStageFlagBits,
        info_type: ShaderInfoTypeAMD,
        mut info_size: UInt,
        p_info: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderInfoAMD.html
        """
        return self._get_shader_info_amd(
            device, pipeline, shader_stage, info_type, Ptr(to=info_size), p_info
        )

    fn get_shader_info_amd(
        self,
        device: Device,
        pipeline: Pipeline,
        shader_stage: ShaderStageFlagBits,
        info_type: ShaderInfoTypeAMD,
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderInfoAMD.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_shader_info_amd(
                device,
                pipeline,
                shader_stage,
                info_type,
                Ptr(to=count),
                Ptr[NoneType, MutOrigin.external](),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self._get_shader_info_amd(
                device,
                pipeline,
                shader_stage,
                info_type,
                Ptr(to=count),
                list.unsafe_ptr().bitcast[NoneType](),
            )
        list._len = Int(count)
        return ListResult(list^, result)


struct BufferMarker(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_write_buffer_marker_amd: fn(
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    )
    var _cmd_write_buffer_marker_2_amd: fn(
        command_buffer: CommandBuffer,
        stage: PipelineStageFlags2,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_write_buffer_marker_amd = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteBufferMarkerAMD".as_c_string_slice()
        )).bitcast[type_of(self._cmd_write_buffer_marker_amd)]()[]
        self._cmd_write_buffer_marker_2_amd = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteBufferMarker2AMD".as_c_string_slice()
        )).bitcast[type_of(self._cmd_write_buffer_marker_2_amd)]()[]

    fn cmd_write_buffer_marker_amd(
        self,
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteBufferMarkerAMD.html
        """
        return self._cmd_write_buffer_marker_amd(
            command_buffer, pipeline_stage, dst_buffer, dst_offset, marker
        )

    fn cmd_write_buffer_marker_2_amd(
        self,
        command_buffer: CommandBuffer,
        stage: PipelineStageFlags2,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteBufferMarker2AMD.html
        """
        return self._cmd_write_buffer_marker_2_amd(command_buffer, stage, dst_buffer, dst_offset, marker)


struct DisplayNativeHdr(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_local_dimming_amd: fn(
        device: Device, swap_chain: SwapchainKHR, local_dimming_enable: Bool32
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_local_dimming_amd = Ptr(to=get_device_proc_addr(
            device, "vkSetLocalDimmingAMD".as_c_string_slice()
        )).bitcast[type_of(self._set_local_dimming_amd)]()[]

    fn set_local_dimming_amd(
        self, device: Device, swap_chain: SwapchainKHR, local_dimming_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLocalDimmingAMD.html
        """
        return self._set_local_dimming_amd(device, swap_chain, local_dimming_enable)


struct AntiLag(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _anti_lag_update_amd: fn(device: Device, p_data: Ptr[AntiLagDataAMD, ImmutAnyOrigin])

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._anti_lag_update_amd = Ptr(to=get_device_proc_addr(
            device, "vkAntiLagUpdateAMD".as_c_string_slice()
        )).bitcast[type_of(self._anti_lag_update_amd)]()[]

    fn anti_lag_update_amd(self, device: Device, data: AntiLagDataAMD):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAntiLagUpdateAMD.html
        """
        return self._anti_lag_update_amd(device, Ptr(to=data))
