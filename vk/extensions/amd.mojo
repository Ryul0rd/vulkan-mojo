from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct DrawIndirectCount(Copyable):    var _vk_cmd_draw_indirect_count: fn(
        commandBuffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        countBuffer: Buffer,
        countBufferOffset: DeviceSize,
        maxDrawCount: UInt32,
        stride: UInt32,
    )
    var _vk_cmd_draw_indexed_indirect_count: fn(
        commandBuffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        countBuffer: Buffer,
        countBufferOffset: DeviceSize,
        maxDrawCount: UInt32,
        stride: UInt32,
    )


struct ShaderInfo(Copyable):    var _vk_get_shader_info_amd: fn(
        device: Device,
        pipeline: Pipeline,
        shaderStage: ShaderStageFlagBits,
        infoType: ShaderInfoTypeAMD,
        pInfoSize: Ptr[UInt, MutAnyOrigin],
        pInfo: Ptr[NoneType, MutAnyOrigin],
    ) -> Result


struct BufferMarker(Copyable):    var _vk_cmd_write_buffer_marker_amd: fn(
        commandBuffer: CommandBuffer,
        pipelineStage: PipelineStageFlagBits,
        dstBuffer: Buffer,
        dstOffset: DeviceSize,
        marker: UInt32,
    )
    var _vk_cmd_write_buffer_marker_2_amd: fn(
        commandBuffer: CommandBuffer,
        stage: PipelineStageFlags2,
        dstBuffer: Buffer,
        dstOffset: DeviceSize,
        marker: UInt32,
    )


struct DisplayNativeHdr(Copyable):    var _vk_set_local_dimming_amd: fn(
        device: Device, swapChain: SwapchainKHR, localDimmingEnable: Bool32
    )


struct AntiLag(Copyable):    var _vk_anti_lag_update_amd: fn(device: Device, pData: Ptr[AntiLagDataAMD, ImmutAnyOrigin])
