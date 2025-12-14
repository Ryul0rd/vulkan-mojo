from sys.ffi import CStringSlice
from vk.core_functions import GlobalFunctions


struct DescriptorSetHostMapping(Copyable):
    var _get_descriptor_set_layout_host_mapping_info_valve: fn(
        device: Device,
        pBindingReference: Ptr[DescriptorSetBindingReferenceVALVE, ImmutAnyOrigin],
        pHostMapping: Ptr[DescriptorSetLayoutHostMappingInfoVALVE, MutAnyOrigin],
    )
    var _get_descriptor_set_host_mapping_valve: fn(
        device: Device,
        descriptorSet: DescriptorSet,
        ppData: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.borrow_handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_descriptor_set_layout_host_mapping_info_valve = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutHostMappingInfoVALVE".unsafe_ptr()
        )).bitcast[type_of(self._get_descriptor_set_layout_host_mapping_info_valve)]()[]
        self._get_descriptor_set_host_mapping_valve = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetHostMappingVALVE".unsafe_ptr()
        )).bitcast[type_of(self._get_descriptor_set_host_mapping_valve)]()[]

    fn get_descriptor_set_layout_host_mapping_info_valve(
        self,
        device: Device,
        binding_reference: DescriptorSetBindingReferenceVALVE,
        mut host_mapping: DescriptorSetLayoutHostMappingInfoVALVE,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutHostMappingInfoVALVE.html
        """
        return self._get_descriptor_set_layout_host_mapping_info_valve(
            device,
            Ptr(to=binding_reference).bitcast[DescriptorSetBindingReferenceVALVE](),
            Ptr(to=host_mapping).bitcast[DescriptorSetLayoutHostMappingInfoVALVE](),
        )

    fn get_descriptor_set_host_mapping_valve(
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        pp_data: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetHostMappingVALVE.html
        """
        return self._get_descriptor_set_host_mapping_valve(device, descriptor_set, pp_data)
