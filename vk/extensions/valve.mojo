from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct DescriptorSetHostMapping(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_descriptor_set_layout_host_mapping_info_valve: fn(
        device: Device,
        p_binding_reference: Ptr[DescriptorSetBindingReferenceVALVE, ImmutAnyOrigin],
        p_host_mapping: Ptr[DescriptorSetLayoutHostMappingInfoVALVE, MutAnyOrigin],
    )
    var _get_descriptor_set_host_mapping_valve: fn(
        device: Device,
        descriptor_set: DescriptorSet,
        pp_data: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_descriptor_set_layout_host_mapping_info_valve = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutHostMappingInfoVALVE".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_set_layout_host_mapping_info_valve)]()[]
        self._get_descriptor_set_host_mapping_valve = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetHostMappingVALVE".as_c_string_slice()
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
        self, device: Device, descriptor_set: DescriptorSet, mut p_data: Ptr[NoneType, MutAnyOrigin]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetHostMappingVALVE.html
        """
        return self._get_descriptor_set_host_mapping_valve(
            device, descriptor_set, Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()
        )
