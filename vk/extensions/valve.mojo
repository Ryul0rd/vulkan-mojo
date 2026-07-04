from std.ffi import OwnedDLHandle, CStringSlice, c_char
from std.memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct DescriptorSetHostMapping(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_descriptor_set_layout_host_mapping_info: def(
        device: Device,
        p_binding_reference: Ptr[DescriptorSetBindingReferenceVALVE, ImmutUntrackedOrigin],
        p_host_mapping: Ptr[DescriptorSetLayoutHostMappingInfoVALVE, MutUntrackedOrigin],
    ) thin abi("C")
    var _get_descriptor_set_host_mapping: def(
        device: Device,
        descriptor_set: DescriptorSet,
        pp_data: Ptr[Ptr[NoneType, MutUntrackedOrigin], MutUntrackedOrigin],
    ) thin abi("C")

    def __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_descriptor_set_layout_host_mapping_info = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutHostMappingInfoVALVE".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_set_layout_host_mapping_info)]()[]
        self._get_descriptor_set_host_mapping = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetHostMappingVALVE".as_c_string_slice()
        )).bitcast[type_of(self._get_descriptor_set_host_mapping)]()[]

    def get_descriptor_set_layout_host_mapping_info(
        self,
        device: Device,
        binding_reference: DescriptorSetBindingReferenceVALVE,
        mut host_mapping: DescriptorSetLayoutHostMappingInfoVALVE,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutHostMappingInfoVALVE.html
        """
        return self._get_descriptor_set_layout_host_mapping_info(
            device,
            Ptr(to=binding_reference).bitcast[DescriptorSetBindingReferenceVALVE]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=host_mapping).bitcast[DescriptorSetLayoutHostMappingInfoVALVE]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_descriptor_set_host_mapping[p_data_origin: MutOrigin = MutUntrackedOrigin](
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        mut p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetHostMappingVALVE.html
        """
        return self._get_descriptor_set_host_mapping(
            device,
            descriptor_set,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]().unsafe_origin_cast[MutUntrackedOrigin](),
        )
