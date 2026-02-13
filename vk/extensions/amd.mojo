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
    ) -> Byte
    var _cmd_draw_indexed_indirect_count: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ) -> Byte

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
    ) -> Byte:
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
    ) -> Byte:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirectCount.html
        """
        return self._cmd_draw_indexed_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )


struct ShaderInfo(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_shader_info: fn(
        device: Device,
        pipeline: Pipeline,
        shader_stage: ShaderStageFlagBits,
        info_type: ShaderInfoTypeAMD,
        p_info_size: Ptr[UInt, MutAnyOrigin],
        p_info: Ptr[Byte, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_shader_info = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderInfoAMD".as_c_string_slice()
        )).bitcast[type_of(self._get_shader_info)]()[]

    fn get_shader_info[p_info_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        pipeline: Pipeline,
        shader_stage: ShaderStageFlagBits,
        info_type: ShaderInfoTypeAMD,
        mut info_size: UInt,
        p_info: Ptr[Byte, p_info_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderInfoAMD.html
        """
        return self._get_shader_info(
            device,
            pipeline,
            shader_stage,
            info_type,
            Ptr(to=info_size),
            Ptr(to=p_info).bitcast[Ptr[Byte, MutAnyOrigin]]()[],
        )

    fn get_shader_info[p_info_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        pipeline: Pipeline,
        shader_stage: ShaderStageFlagBits,
        info_type: ShaderInfoTypeAMD,
    ) -> ListResult[Byte]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetShaderInfoAMD.html
        """
        var list = List[Byte]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_shader_info(
        device, pipeline, shader_stage, info_type, Ptr(to=count), Ptr[Byte, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_shader_info(
        device, pipeline, shader_stage, info_type, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)


struct BufferMarker(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_write_buffer_marker: fn(
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    ) -> Byte
    var _cmd_write_buffer_marker_2: fn(
        command_buffer: CommandBuffer,
        stage: PipelineStageFlags2,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    ) -> Byte

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_write_buffer_marker = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteBufferMarkerAMD".as_c_string_slice()
        )).bitcast[type_of(self._cmd_write_buffer_marker)]()[]
        self._cmd_write_buffer_marker_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteBufferMarker2AMD".as_c_string_slice()
        )).bitcast[type_of(self._cmd_write_buffer_marker_2)]()[]

    fn cmd_write_buffer_marker(
        self,
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    ) -> Byte:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteBufferMarkerAMD.html
        """
        return self._cmd_write_buffer_marker(command_buffer, pipeline_stage, dst_buffer, dst_offset, marker)

    fn cmd_write_buffer_marker_2(
        self,
        command_buffer: CommandBuffer,
        stage: PipelineStageFlags2,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    ) -> Byte:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteBufferMarker2AMD.html
        """
        return self._cmd_write_buffer_marker_2(command_buffer, stage, dst_buffer, dst_offset, marker)


struct DisplayNativeHdr(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _set_local_dimming: fn(
        device: Device, swap_chain: SwapchainKHR, local_dimming_enable: Bool32
    ) -> Byte

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_local_dimming = Ptr(to=get_device_proc_addr(
            device, "vkSetLocalDimmingAMD".as_c_string_slice()
        )).bitcast[type_of(self._set_local_dimming)]()[]

    fn set_local_dimming(
        self, device: Device, swap_chain: SwapchainKHR, local_dimming_enable: Bool32
    ) -> Byte:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetLocalDimmingAMD.html
        """
        return self._set_local_dimming(device, swap_chain, local_dimming_enable)


struct AntiLag(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _anti_lag_update: fn(device: Device, p_data: Ptr[AntiLagDataAMD, ImmutAnyOrigin]) -> Byte

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._anti_lag_update = Ptr(to=get_device_proc_addr(
            device, "vkAntiLagUpdateAMD".as_c_string_slice()
        )).bitcast[type_of(self._anti_lag_update)]()[]

    fn anti_lag_update(self, device: Device, data: AntiLagDataAMD) -> Byte:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAntiLagUpdateAMD.html
        """
        return self._anti_lag_update(device, Ptr(to=data))
