from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct SubpassShading(Copyable):    var _vk_get_device_subpass_shading_max_workgroup_size_huawei: fn(
        device: Device, renderpass: RenderPass, pMaxWorkgroupSize: Ptr[Extent2D, MutAnyOrigin]
    ) -> Result
    var _vk_cmd_subpass_shading_huawei: fn(commandBuffer: CommandBuffer)


struct InvocationMask(Copyable):    var _vk_cmd_bind_invocation_mask_huawei: fn(
        commandBuffer: CommandBuffer, imageView: ImageView, imageLayout: ImageLayout
    )


struct ClusterCullingShader(Copyable):    var _vk_cmd_draw_cluster_huawei: fn(
        commandBuffer: CommandBuffer, groupCountX: UInt32, groupCountY: UInt32, groupCountZ: UInt32
    )
    var _vk_cmd_draw_cluster_indirect_huawei: fn(
        commandBuffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    )
