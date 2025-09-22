from vk.core_functions import GlobalFunctions


struct DrawIndirectCount(Copyable, Movable):
    var _cmd_draw_indirect_count: fn(
        commandBuffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, countBuffer: Buffer, countBufferOffset: DeviceSize, maxDrawCount: UInt32, stride: UInt32
    )
    var _cmd_draw_indexed_indirect_count: fn(
        commandBuffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, countBuffer: Buffer, countBufferOffset: DeviceSize, maxDrawCount: UInt32, stride: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirectCount".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_indirect_count)]()[]
        self._cmd_draw_indexed_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndexedIndirectCount".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_draw_indexed_indirect_count)]()[]

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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_indirect_count(
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_draw_indexed_indirect_count(
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )


struct ShaderInfo(Copyable, Movable):
    var _get_shader_info_amd: fn(
        device: Device, pipeline: Pipeline, shaderStage: ShaderStageFlagBits, infoType: ShaderInfoTypeAMD, pInfoSize: Ptr[UInt], pInfo: Ptr[NoneType]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_shader_info_amd = Ptr(to=get_device_proc_addr(
            device, "vkGetShaderInfoAMD".unsafe_ptr()
        )).bitcast[__type_of(self._get_shader_info_amd)]()[]

    fn get_shader_info_amd(
        self,
        device: Device,
        pipeline: Pipeline,
        shader_stage: ShaderStageFlagBits,
        info_type: ShaderInfoTypeAMD,
        mut info_size: UInt,
        p_info: Ptr[NoneType],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_shader_info_amd(
                device, pipeline, shader_stage, info_type, count, Ptr[NoneType]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_shader_info_amd(
                    device,
                    pipeline,
                    shader_stage,
                    info_type,
                    count,
                    list.unsafe_ptr().bitcast[NoneType](),
                )
        list._len = Int(count)
        return ListResult(list^, result)


struct BufferMarker(Copyable, Movable):
    var _cmd_write_buffer_marker_amd: fn(
        commandBuffer: CommandBuffer, pipelineStage: PipelineStageFlagBits, dstBuffer: Buffer, dstOffset: DeviceSize, marker: UInt32
    )
    var _cmd_write_buffer_marker_2_amd: fn(
        commandBuffer: CommandBuffer, stage: PipelineStageFlags2, dstBuffer: Buffer, dstOffset: DeviceSize, marker: UInt32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_write_buffer_marker_amd = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteBufferMarkerAMD".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_write_buffer_marker_amd)]()[]
        self._cmd_write_buffer_marker_2_amd = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteBufferMarker2AMD".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_write_buffer_marker_2_amd)]()[]

    fn cmd_write_buffer_marker_amd(
        self,
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        marker: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
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

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_write_buffer_marker_2_amd(
            command_buffer, stage, dst_buffer, dst_offset, marker
        )


struct DisplayNativeHdr(Copyable, Movable):
    var _set_local_dimming_amd: fn(
        device: Device, swapChain: SwapchainKHR, localDimmingEnable: Bool32
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._set_local_dimming_amd = Ptr(to=get_device_proc_addr(
            device, "vkSetLocalDimmingAMD".unsafe_ptr()
        )).bitcast[__type_of(self._set_local_dimming_amd)]()[]

    fn set_local_dimming_amd(
        self, device: Device, swap_chain: SwapchainKHR, local_dimming_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._set_local_dimming_amd(device, swap_chain, local_dimming_enable)


struct AntiLag(Copyable, Movable):
    var _anti_lag_update_amd: fn(
        device: Device, pData: Ptr[AntiLagDataAMD]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._anti_lag_update_amd = Ptr(to=get_device_proc_addr(
            device, "vkAntiLagUpdateAMD".unsafe_ptr()
        )).bitcast[__type_of(self._anti_lag_update_amd)]()[]

    fn anti_lag_update_amd(self, device: Device, data: AntiLagDataAMD):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._anti_lag_update_amd(device, Ptr(to=data))
