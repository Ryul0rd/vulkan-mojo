from vk.core_functions import GlobalFunctions


struct TileShading(Copyable):    var _vk_cmd_dispatch_tile_qcom: fn(
        commandBuffer: CommandBuffer,
        pDispatchTileInfo: Ptr[DispatchTileInfoQCOM, MutOrigin.external],
    )
    var _vk_cmd_begin_per_tile_execution_qcom: fn(
        commandBuffer: CommandBuffer,
        pPerTileBeginInfo: Ptr[PerTileBeginInfoQCOM, MutOrigin.external],
    )
    var _vk_cmd_end_per_tile_execution_qcom: fn(
        commandBuffer: CommandBuffer, pPerTileEndInfo: Ptr[PerTileEndInfoQCOM, MutOrigin.external]
    )


struct TileProperties(Copyable):    var _vk_get_framebuffer_tile_properties_qcom: fn(
        device: Device,
        framebuffer: Framebuffer,
        pPropertiesCount: Ptr[UInt32, MutOrigin.external],
        pProperties: Ptr[TilePropertiesQCOM, MutOrigin.external],
    ) -> Result
    var _vk_get_dynamic_rendering_tile_properties_qcom: fn(
        device: Device,
        pRenderingInfo: Ptr[RenderingInfo, MutOrigin.external],
        pProperties: Ptr[TilePropertiesQCOM, MutOrigin.external],
    ) -> Result


struct TileMemoryHeap(Copyable):    var _vk_cmd_bind_tile_memory_qcom: fn(
        commandBuffer: CommandBuffer,
        pTileMemoryBindInfo: Ptr[TileMemoryBindInfoQCOM, MutOrigin.external],
    )
