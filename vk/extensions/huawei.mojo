from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct SubpassShading(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_device_subpass_shading_max_workgroup_size_huawei: fn(
        device: Device, renderpass: RenderPass, p_max_workgroup_size: Ptr[Extent2D, MutAnyOrigin]
    ) -> Result
    var _cmd_subpass_shading_huawei: fn(command_buffer: CommandBuffer)

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_device_subpass_shading_max_workgroup_size_huawei = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI".unsafe_ptr()
        )).bitcast[type_of(self._get_device_subpass_shading_max_workgroup_size_huawei)]()[]
        self._cmd_subpass_shading_huawei = Ptr(to=get_device_proc_addr(
            device, "vkCmdSubpassShadingHUAWEI".unsafe_ptr()
        )).bitcast[type_of(self._cmd_subpass_shading_huawei)]()[]

    fn get_device_subpass_shading_max_workgroup_size_huawei(
        self,
        device: Device,
        renderpass: RenderPass,
        p_max_workgroup_size: Ptr[Extent2D, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceSubpassShadingMaxWorkgroupSizeHUAWEI.html
        """
        return self._get_device_subpass_shading_max_workgroup_size_huawei(
            device, renderpass, p_max_workgroup_size
        )

    fn cmd_subpass_shading_huawei(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSubpassShadingHUAWEI.html
        """
        return self._cmd_subpass_shading_huawei(command_buffer)


struct InvocationMask(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_bind_invocation_mask_huawei: fn(
        command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_bind_invocation_mask_huawei = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindInvocationMaskHUAWEI".unsafe_ptr()
        )).bitcast[type_of(self._cmd_bind_invocation_mask_huawei)]()[]

    fn cmd_bind_invocation_mask_huawei(
        self, command_buffer: CommandBuffer, image_view: ImageView, image_layout: ImageLayout
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindInvocationMaskHUAWEI.html
        """
        return self._cmd_bind_invocation_mask_huawei(command_buffer, image_view, image_layout)


struct ClusterCullingShader(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _cmd_draw_cluster_huawei: fn(
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    )
    var _cmd_draw_cluster_indirect_huawei: fn(
        command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device) raises:
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._cmd_draw_cluster_huawei = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawClusterHUAWEI".unsafe_ptr()
        )).bitcast[type_of(self._cmd_draw_cluster_huawei)]()[]
        self._cmd_draw_cluster_indirect_huawei = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawClusterIndirectHUAWEI".unsafe_ptr()
        )).bitcast[type_of(self._cmd_draw_cluster_indirect_huawei)]()[]

    fn cmd_draw_cluster_huawei(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawClusterHUAWEI.html
        """
        return self._cmd_draw_cluster_huawei(
            command_buffer, group_count_x, group_count_y, group_count_z
        )

    fn cmd_draw_cluster_indirect_huawei(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawClusterIndirectHUAWEI.html
        """
        return self._cmd_draw_cluster_indirect_huawei(command_buffer, buffer, offset)
