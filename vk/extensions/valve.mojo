from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct DescriptorSetHostMapping(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_descriptor_set_layout_host_mapping_info: fn(
        device: Device,
        p_binding_reference: Ptr[DescriptorSetBindingReferenceVALVE, ImmutAnyOrigin],
        p_host_mapping: Ptr[DescriptorSetLayoutHostMappingInfoVALVE, MutAnyOrigin],
    )
    var _get_descriptor_set_host_mapping: fn(
        device: Device,
        descriptor_set: DescriptorSet,
        pp_data: Ptr[Ptr[Byte, MutAnyOrigin], MutAnyOrigin],
    )

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_descriptor_set_layout_host_mapping_info = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutHostMappingInfoVALVE".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_set_layout_host_mapping_info)]()[]
        self._get_descriptor_set_host_mapping = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetHostMappingVALVE".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_set_host_mapping)]()[]

    fn get_descriptor_set_layout_host_mapping_info(
        self,
        device: Device,
        binding_reference: DescriptorSetBindingReferenceVALVE,
        mut host_mapping: DescriptorSetLayoutHostMappingInfoVALVE,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutHostMappingInfoVALVE.html
        """
        return self._get_descriptor_set_layout_host_mapping_info(
            device, Ptr(to=binding_reference), Ptr(to=host_mapping)
        )

    fn get_descriptor_set_host_mapping[p_data_origin: MutOrigin = MutAnyOrigin](
        self, device: Device, descriptor_set: DescriptorSet, mut p_data: Ptr[Byte, p_data_origin]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetHostMappingVALVE.html
        """
        return self._get_descriptor_set_host_mapping(
            device,
            descriptor_set,
            Ptr(to=Ptr(to=p_data)).bitcast[Ptr[Ptr[Byte, MutAnyOrigin], MutAnyOrigin]]()[],
        )
