from vk.core_functions import GlobalFunctions


struct DescriptorSetHostMapping(Copyable, Movable):
    var _get_descriptor_set_layout_host_mapping_info_valve: fn(
        device: Device, pBindingReference: Ptr[DescriptorSetBindingReferenceVALVE], pHostMapping: Ptr[DescriptorSetLayoutHostMappingInfoVALVE]
    )
    var _get_descriptor_set_host_mapping_valve: fn(
        device: Device, descriptorSet: DescriptorSet, ppData: Ptr[Ptr[NoneType]]
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_descriptor_set_layout_host_mapping_info_valve = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutHostMappingInfoVALVE".unsafe_ptr()
        )).bitcast[__type_of(self._get_descriptor_set_layout_host_mapping_info_valve)]()[]
        self._get_descriptor_set_host_mapping_valve = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetHostMappingVALVE".unsafe_ptr()
        )).bitcast[__type_of(self._get_descriptor_set_host_mapping_valve)]()[]

    fn get_descriptor_set_layout_host_mapping_info_valve(
        self,
        device: Device,
        binding_reference: DescriptorSetBindingReferenceVALVE,
        mut host_mapping: DescriptorSetLayoutHostMappingInfoVALVE,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_descriptor_set_layout_host_mapping_info_valve(
            device, Ptr(to=binding_reference), Ptr(to=host_mapping)
        )

    fn get_descriptor_set_host_mapping_valve(
        self, device: Device, descriptor_set: DescriptorSet, pp_data: Ptr[Ptr[NoneType]]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_descriptor_set_host_mapping_valve(device, descriptor_set, pp_data)
