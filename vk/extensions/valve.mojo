from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct DescriptorSetHostMapping(Copyable):    var _vk_get_descriptor_set_layout_host_mapping_info_valve: fn(
        device: Device,
        pBindingReference: Ptr[DescriptorSetBindingReferenceVALVE, ImmutAnyOrigin],
        pHostMapping: Ptr[DescriptorSetLayoutHostMappingInfoVALVE, MutAnyOrigin],
    )
    var _vk_get_descriptor_set_host_mapping_valve: fn(
        device: Device,
        descriptorSet: DescriptorSet,
        ppData: Ptr[Ptr[NoneType, MutAnyOrigin], MutAnyOrigin],
    )
