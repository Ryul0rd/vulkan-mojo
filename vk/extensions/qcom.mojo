from vk.core_functions import GlobalFunctions


struct TileShading(Copyable, Movable):
    var _cmd_dispatch_tile_qcom: fn(
        commandBuffer: CommandBuffer, pDispatchTileInfo: Ptr[DispatchTileInfoQCOM]
    )
    var _cmd_begin_per_tile_execution_qcom: fn(
        commandBuffer: CommandBuffer, pPerTileBeginInfo: Ptr[PerTileBeginInfoQCOM]
    )
    var _cmd_end_per_tile_execution_qcom: fn(
        commandBuffer: CommandBuffer, pPerTileEndInfo: Ptr[PerTileEndInfoQCOM]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_dispatch_tile_qcom = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchTileQCOM".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_dispatch_tile_qcom)]()[]
        self._cmd_begin_per_tile_execution_qcom = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginPerTileExecutionQCOM".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_begin_per_tile_execution_qcom)]()[]
        self._cmd_end_per_tile_execution_qcom = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndPerTileExecutionQCOM".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_end_per_tile_execution_qcom)]()[]

    fn cmd_dispatch_tile_qcom(
        self, command_buffer: CommandBuffer, dispatch_tile_info: DispatchTileInfoQCOM
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_dispatch_tile_qcom(command_buffer, Ptr(to=dispatch_tile_info))

    fn cmd_begin_per_tile_execution_qcom(
        self, command_buffer: CommandBuffer, per_tile_begin_info: PerTileBeginInfoQCOM
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_begin_per_tile_execution_qcom(command_buffer, Ptr(to=per_tile_begin_info))

    fn cmd_end_per_tile_execution_qcom(
        self, command_buffer: CommandBuffer, per_tile_end_info: PerTileEndInfoQCOM
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_end_per_tile_execution_qcom(command_buffer, Ptr(to=per_tile_end_info))


struct TileProperties(Copyable, Movable):
    var _get_framebuffer_tile_properties_qcom: fn(
        device: Device, framebuffer: Framebuffer, pPropertiesCount: Ptr[UInt32], pProperties: Ptr[TilePropertiesQCOM]
    ) -> Result
    var _get_dynamic_rendering_tile_properties_qcom: fn(
        device: Device, pRenderingInfo: Ptr[RenderingInfo], pProperties: Ptr[TilePropertiesQCOM]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_framebuffer_tile_properties_qcom = Ptr(to=get_device_proc_addr(
            device, "vkGetFramebufferTilePropertiesQCOM".unsafe_ptr()
        )).bitcast[__type_of(self._get_framebuffer_tile_properties_qcom)]()[]
        self._get_dynamic_rendering_tile_properties_qcom = Ptr(to=get_device_proc_addr(
            device, "vkGetDynamicRenderingTilePropertiesQCOM".unsafe_ptr()
        )).bitcast[__type_of(self._get_dynamic_rendering_tile_properties_qcom)]()[]

    fn get_framebuffer_tile_properties_qcom(
        self,
        device: Device,
        framebuffer: Framebuffer,
        mut properties_count: UInt32,
        p_properties: Ptr[TilePropertiesQCOM],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_framebuffer_tile_properties_qcom(
            device, framebuffer, Ptr(to=properties_count), p_properties
        )

    fn get_framebuffer_tile_properties_qcom(
        self, device: Device, framebuffer: Framebuffer
    ) -> ListResult[TilePropertiesQCOM]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[TilePropertiesQCOM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_framebuffer_tile_properties_qcom(
                device, framebuffer, count, Ptr[TilePropertiesQCOM]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_framebuffer_tile_properties_qcom(
                    device, framebuffer, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_dynamic_rendering_tile_properties_qcom(
        self, device: Device, rendering_info: RenderingInfo, mut properties: TilePropertiesQCOM
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_dynamic_rendering_tile_properties_qcom(
            device, Ptr(to=rendering_info), Ptr(to=properties)
        )


struct TileMemoryHeap(Copyable, Movable):
    var _cmd_bind_tile_memory_qcom: fn(
        commandBuffer: CommandBuffer, pTileMemoryBindInfo: Ptr[TileMemoryBindInfoQCOM]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_tile_memory_qcom = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindTileMemoryQCOM".unsafe_ptr()
        )).bitcast[__type_of(self._cmd_bind_tile_memory_qcom)]()[]

    fn cmd_bind_tile_memory_qcom(
        self, command_buffer: CommandBuffer, p_tile_memory_bind_info: Ptr[TileMemoryBindInfoQCOM]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._cmd_bind_tile_memory_qcom(command_buffer, p_tile_memory_bind_info)
