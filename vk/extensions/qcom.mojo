from ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct TileShading(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_dispatch_tile: fn(
        command_buffer: CommandBuffer, p_dispatch_tile_info: Ptr[DispatchTileInfoQCOM, ImmutAnyOrigin]
    )
    var _cmd_begin_per_tile_execution: fn(
        command_buffer: CommandBuffer, p_per_tile_begin_info: Ptr[PerTileBeginInfoQCOM, ImmutAnyOrigin]
    )
    var _cmd_end_per_tile_execution: fn(
        command_buffer: CommandBuffer, p_per_tile_end_info: Ptr[PerTileEndInfoQCOM, ImmutAnyOrigin]
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_dispatch_tile = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchTileQCOM".as_c_string_slice()
        )).bitcast[type_of(self._cmd_dispatch_tile)]()[]
        self._cmd_begin_per_tile_execution = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginPerTileExecutionQCOM".as_c_string_slice()
        )).bitcast[type_of(self._cmd_begin_per_tile_execution)]()[]
        self._cmd_end_per_tile_execution = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndPerTileExecutionQCOM".as_c_string_slice()
        )).bitcast[type_of(self._cmd_end_per_tile_execution)]()[]

    fn cmd_dispatch_tile(
        self, command_buffer: CommandBuffer, dispatch_tile_info: DispatchTileInfoQCOM
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchTileQCOM.html
        """
        return self._cmd_dispatch_tile(command_buffer, Ptr(to=dispatch_tile_info))

    fn cmd_begin_per_tile_execution(
        self, command_buffer: CommandBuffer, per_tile_begin_info: PerTileBeginInfoQCOM
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginPerTileExecutionQCOM.html
        """
        return self._cmd_begin_per_tile_execution(command_buffer, Ptr(to=per_tile_begin_info))

    fn cmd_end_per_tile_execution(
        self, command_buffer: CommandBuffer, per_tile_end_info: PerTileEndInfoQCOM
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndPerTileExecutionQCOM.html
        """
        return self._cmd_end_per_tile_execution(command_buffer, Ptr(to=per_tile_end_info))


struct TileProperties(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_framebuffer_tile_properties: fn(
        device: Device,
        framebuffer: Framebuffer,
        p_properties_count: Ptr[UInt32, MutAnyOrigin],
        p_properties: Ptr[TilePropertiesQCOM, MutAnyOrigin],
    ) -> Result
    var _get_dynamic_rendering_tile_properties: fn(
        device: Device,
        p_rendering_info: Ptr[RenderingInfo, ImmutAnyOrigin],
        p_properties: Ptr[TilePropertiesQCOM, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_framebuffer_tile_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetFramebufferTilePropertiesQCOM".as_c_string_slice()
        )).bitcast[type_of(self._get_framebuffer_tile_properties)]()[]
        self._get_dynamic_rendering_tile_properties = Ptr(to=get_device_proc_addr(
            device, "vkGetDynamicRenderingTilePropertiesQCOM".as_c_string_slice()
        )).bitcast[type_of(self._get_dynamic_rendering_tile_properties)]()[]

    fn get_framebuffer_tile_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        framebuffer: Framebuffer,
        mut properties_count: UInt32,
        p_properties: Ptr[TilePropertiesQCOM, p_properties_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFramebufferTilePropertiesQCOM.html
        """
        return self._get_framebuffer_tile_properties(
            device,
            framebuffer,
            Ptr(to=properties_count),
            Ptr(to=p_properties).bitcast[Ptr[TilePropertiesQCOM, MutAnyOrigin]]()[],
        )

    fn get_framebuffer_tile_properties[p_properties_origin: MutOrigin = MutAnyOrigin](
        self, device: Device, framebuffer: Framebuffer
    ) -> ListResult[TilePropertiesQCOM]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFramebufferTilePropertiesQCOM.html
        """
        var list = List[TilePropertiesQCOM]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_framebuffer_tile_properties(
        device, framebuffer, Ptr(to=count), Ptr[TilePropertiesQCOM, MutExternalOrigin]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_framebuffer_tile_properties(
        device, framebuffer, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_dynamic_rendering_tile_properties(
        self, device: Device, rendering_info: RenderingInfo, mut properties: TilePropertiesQCOM
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDynamicRenderingTilePropertiesQCOM.html
        """
        return self._get_dynamic_rendering_tile_properties(
            device, Ptr(to=rendering_info), Ptr(to=properties)
        )


struct TileMemoryHeap(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_bind_tile_memory: fn(
        command_buffer: CommandBuffer,
        p_tile_memory_bind_info: Ptr[TileMemoryBindInfoQCOM, ImmutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_tile_memory = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindTileMemoryQCOM".as_c_string_slice()
        )).bitcast[type_of(self._cmd_bind_tile_memory)]()[]

    fn cmd_bind_tile_memory[p_tile_memory_bind_info_origin: ImmutOrigin = ImmutAnyOrigin](
        self,
        command_buffer: CommandBuffer,
        p_tile_memory_bind_info: Ptr[TileMemoryBindInfoQCOM, p_tile_memory_bind_info_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindTileMemoryQCOM.html
        """
        return self._cmd_bind_tile_memory(
            command_buffer,
            Ptr(to=p_tile_memory_bind_info).bitcast[Ptr[TileMemoryBindInfoQCOM, ImmutAnyOrigin]]()[],
        )
