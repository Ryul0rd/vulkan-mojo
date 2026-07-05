from std.ffi import OwnedDLHandle, RTLD, CStringSlice, c_char
from std.memory import ArcPointer
from .fn_types import *
from .handles import *
from .structs import *
from .misc import *


comptime Ptr = UnsafePointer


trait GlobalFunctions:
    def get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        ...


struct GlobalFunctionsV1_0(GlobalFunctions, Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: GlobalFunctionsAdditionsV1_0

    def __init__(out self) raises:
        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))
        self._v1_0 = GlobalFunctionsAdditionsV1_0(self._dlhandle)

    def get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        return self._dlhandle

    def create_instance[p_allocator_origin: ImmutOrigin](
        self,
        create_info: InstanceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut instance: Instance,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateInstance.html
        """
        return self._v1_0.create_instance(
            Ptr(to=create_info).bitcast[InstanceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=instance).bitcast[Instance]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def enumerate_instance_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self,
        p_layer_name: CStringSlice[p_layer_name_origin],
        mut property_count: UInt32,
        p_properties: Optional[Ptr[ExtensionProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        return self._v1_0.enumerate_instance_extension_properties(
            Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_instance_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self, p_layer_name: CStringSlice[p_layer_name_origin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_instance_extension_properties(
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[ExtensionProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_instance_extension_properties(
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_instance_layer_properties[p_properties_origin: MutOrigin](
        self,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[LayerProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        return self._v1_0.enumerate_instance_layer_properties(
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[LayerProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_instance_layer_properties[p_properties_origin: MutOrigin](
        self
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_instance_layer_properties(
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[LayerProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_instance_layer_properties(
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)


struct GlobalFunctionsV1_1(GlobalFunctions, Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: GlobalFunctionsAdditionsV1_0
    var _v1_1: GlobalFunctionsAdditionsV1_1

    def __init__(out self) raises:
        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))
        self._v1_0 = GlobalFunctionsAdditionsV1_0(self._dlhandle)
        self._v1_1 = GlobalFunctionsAdditionsV1_1(self._dlhandle)

    def get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        return self._dlhandle

    def create_instance[p_allocator_origin: ImmutOrigin](
        self,
        create_info: InstanceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut instance: Instance,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateInstance.html
        """
        return self._v1_0.create_instance(
            Ptr(to=create_info).bitcast[InstanceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=instance).bitcast[Instance]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def enumerate_instance_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self,
        p_layer_name: CStringSlice[p_layer_name_origin],
        mut property_count: UInt32,
        p_properties: Optional[Ptr[ExtensionProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        return self._v1_0.enumerate_instance_extension_properties(
            Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_instance_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self, p_layer_name: CStringSlice[p_layer_name_origin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_instance_extension_properties(
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[ExtensionProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_instance_extension_properties(
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_instance_layer_properties[p_properties_origin: MutOrigin](
        self,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[LayerProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        return self._v1_0.enumerate_instance_layer_properties(
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[LayerProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_instance_layer_properties[p_properties_origin: MutOrigin](
        self
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_instance_layer_properties(
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[LayerProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_instance_layer_properties(
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_instance_version(self, mut api_version: UInt32) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._v1_1.enumerate_instance_version(
            Ptr(to=api_version).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin]()
        )


struct GlobalFunctionsV1_2(GlobalFunctions, Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: GlobalFunctionsAdditionsV1_0
    var _v1_1: GlobalFunctionsAdditionsV1_1

    def __init__(out self) raises:
        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))
        self._v1_0 = GlobalFunctionsAdditionsV1_0(self._dlhandle)
        self._v1_1 = GlobalFunctionsAdditionsV1_1(self._dlhandle)

    def get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        return self._dlhandle

    def create_instance[p_allocator_origin: ImmutOrigin](
        self,
        create_info: InstanceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut instance: Instance,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateInstance.html
        """
        return self._v1_0.create_instance(
            Ptr(to=create_info).bitcast[InstanceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=instance).bitcast[Instance]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def enumerate_instance_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self,
        p_layer_name: CStringSlice[p_layer_name_origin],
        mut property_count: UInt32,
        p_properties: Optional[Ptr[ExtensionProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        return self._v1_0.enumerate_instance_extension_properties(
            Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_instance_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self, p_layer_name: CStringSlice[p_layer_name_origin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_instance_extension_properties(
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[ExtensionProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_instance_extension_properties(
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_instance_layer_properties[p_properties_origin: MutOrigin](
        self,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[LayerProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        return self._v1_0.enumerate_instance_layer_properties(
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[LayerProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_instance_layer_properties[p_properties_origin: MutOrigin](
        self
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_instance_layer_properties(
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[LayerProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_instance_layer_properties(
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_instance_version(self, mut api_version: UInt32) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._v1_1.enumerate_instance_version(
            Ptr(to=api_version).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin]()
        )


struct GlobalFunctionsV1_3(GlobalFunctions, Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: GlobalFunctionsAdditionsV1_0
    var _v1_1: GlobalFunctionsAdditionsV1_1

    def __init__(out self) raises:
        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))
        self._v1_0 = GlobalFunctionsAdditionsV1_0(self._dlhandle)
        self._v1_1 = GlobalFunctionsAdditionsV1_1(self._dlhandle)

    def get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        return self._dlhandle

    def create_instance[p_allocator_origin: ImmutOrigin](
        self,
        create_info: InstanceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut instance: Instance,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateInstance.html
        """
        return self._v1_0.create_instance(
            Ptr(to=create_info).bitcast[InstanceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=instance).bitcast[Instance]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def enumerate_instance_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self,
        p_layer_name: CStringSlice[p_layer_name_origin],
        mut property_count: UInt32,
        p_properties: Optional[Ptr[ExtensionProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        return self._v1_0.enumerate_instance_extension_properties(
            Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_instance_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self, p_layer_name: CStringSlice[p_layer_name_origin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_instance_extension_properties(
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[ExtensionProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_instance_extension_properties(
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_instance_layer_properties[p_properties_origin: MutOrigin](
        self,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[LayerProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        return self._v1_0.enumerate_instance_layer_properties(
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[LayerProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_instance_layer_properties[p_properties_origin: MutOrigin](
        self
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_instance_layer_properties(
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[LayerProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_instance_layer_properties(
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_instance_version(self, mut api_version: UInt32) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._v1_1.enumerate_instance_version(
            Ptr(to=api_version).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin]()
        )


struct GlobalFunctionsV1_4(GlobalFunctions, Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: GlobalFunctionsAdditionsV1_0
    var _v1_1: GlobalFunctionsAdditionsV1_1

    def __init__(out self) raises:
        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))
        self._v1_0 = GlobalFunctionsAdditionsV1_0(self._dlhandle)
        self._v1_1 = GlobalFunctionsAdditionsV1_1(self._dlhandle)

    def get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        return self._dlhandle

    def create_instance[p_allocator_origin: ImmutOrigin](
        self,
        create_info: InstanceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut instance: Instance,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateInstance.html
        """
        return self._v1_0.create_instance(
            Ptr(to=create_info).bitcast[InstanceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=instance).bitcast[Instance]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def enumerate_instance_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self,
        p_layer_name: CStringSlice[p_layer_name_origin],
        mut property_count: UInt32,
        p_properties: Optional[Ptr[ExtensionProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        return self._v1_0.enumerate_instance_extension_properties(
            Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_instance_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self, p_layer_name: CStringSlice[p_layer_name_origin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_instance_extension_properties(
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[ExtensionProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_instance_extension_properties(
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_instance_layer_properties[p_properties_origin: MutOrigin](
        self,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[LayerProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        return self._v1_0.enumerate_instance_layer_properties(
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[LayerProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_instance_layer_properties[p_properties_origin: MutOrigin](
        self
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_instance_layer_properties(
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[LayerProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_instance_layer_properties(
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_instance_version(self, mut api_version: UInt32) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._v1_1.enumerate_instance_version(
            Ptr(to=api_version).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin]()
        )


struct InstanceFunctionsV1_0(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: InstanceFunctionsAdditionsV1_0

    def __init__(out self, global_functions: GlobalFunctionsV1_0, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = InstanceFunctionsAdditionsV1_0(self._dlhandle, instance)

    def destroy_instance[p_allocator_origin: ImmutOrigin](
        self,
        instance: Instance,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyInstance.html
        """
        return self._v1_0.destroy_instance(
            instance,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_devices[p_physical_devices_origin: MutOrigin](
        self,
        instance: Instance,
        mut physical_device_count: UInt32,
        p_physical_devices: Optional[Ptr[PhysicalDevice, p_physical_devices_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        return self._v1_0.enumerate_physical_devices(
            instance,
            Ptr(to=physical_device_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_physical_devices).bitcast[Optional[Ptr[PhysicalDevice, MutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_devices[p_physical_devices_origin: MutOrigin](
        self, instance: Instance
    ) -> ListResult[PhysicalDevice]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        var list = List[PhysicalDevice]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_physical_devices(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDevice, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_physical_devices(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_features(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures.html
        """
        return self._v1_0.get_physical_device_features(
            physical_device,
            Ptr(to=features).bitcast[PhysicalDeviceFeatures]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties.html
        """
        return self._v1_0.get_physical_device_format_properties(
            physical_device,
            format,
            Ptr(to=format_properties).bitcast[FormatProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_image_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        mut image_format_properties: ImageFormatProperties,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceImageFormatProperties.html
        """
        return self._v1_0.get_physical_device_image_format_properties(
            physical_device,
            format,
            type,
            tiling,
            usage,
            flags,
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_properties(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties.html
        """
        return self._v1_0.get_physical_device_properties(
            physical_device,
            Ptr(to=properties).bitcast[PhysicalDeviceProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_queue_family_properties[p_queue_family_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties, p_queue_family_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        return self._v1_0.get_physical_device_queue_family_properties(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_queue_family_properties).bitcast[Optional[Ptr[QueueFamilyProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_queue_family_properties[p_queue_family_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        var list = List[QueueFamilyProperties]()
        var count: UInt32 = 0
        self._v1_0.get_physical_device_queue_family_properties(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[QueueFamilyProperties, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_physical_device_queue_family_properties(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_memory_properties(
        self, physical_device: PhysicalDevice, mut memory_properties: PhysicalDeviceMemoryProperties
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties.html
        """
        return self._v1_0.get_physical_device_memory_properties(
            physical_device,
            Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_instance_proc_addr[p_name_origin: ImmutOrigin](
        self, instance: Instance, p_name: CStringSlice[p_name_origin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetInstanceProcAddr.html
        """
        return self._v1_0.get_instance_proc_addr(
            instance, Ptr(to=p_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[]
        )

    def create_device[p_allocator_origin: ImmutOrigin](
        self,
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut device: Device,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDevice.html
        """
        return self._v1_0.create_device(
            physical_device,
            Ptr(to=create_info).bitcast[DeviceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=device).bitcast[Device]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def enumerate_device_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[p_layer_name_origin],
        mut property_count: UInt32,
        p_properties: Optional[Ptr[ExtensionProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        return self._v1_0.enumerate_device_extension_properties(
            physical_device,
            Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_device_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self, physical_device: PhysicalDevice, p_layer_name: CStringSlice[p_layer_name_origin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_device_extension_properties(
                physical_device,
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[ExtensionProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_device_extension_properties(
                physical_device,
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_device_layer_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[LayerProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        return self._v1_0.enumerate_device_layer_properties(
            physical_device,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[LayerProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_device_layer_properties[p_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_device_layer_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[LayerProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_device_layer_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_sparse_image_format_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[SparseImageFormatProperties, p_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html
        """
        return self._v1_0.get_physical_device_sparse_image_format_properties(
            physical_device,
            format,
            type,
            samples,
            usage,
            tiling,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[SparseImageFormatProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_sparse_image_format_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
    ) -> List[SparseImageFormatProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html
        """
        var list = List[SparseImageFormatProperties]()
        var count: UInt32 = 0
        self._v1_0.get_physical_device_sparse_image_format_properties(
    physical_device,
    format,
    type,
    samples,
    usage,
    tiling,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageFormatProperties, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_physical_device_sparse_image_format_properties(
    physical_device,
    format,
    type,
    samples,
    usage,
    tiling,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^


struct InstanceFunctionsV1_1(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: InstanceFunctionsAdditionsV1_0
    var _v1_1: InstanceFunctionsAdditionsV1_1

    def __init__(out self, global_functions: GlobalFunctionsV1_1, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = InstanceFunctionsAdditionsV1_0(self._dlhandle, instance)
        self._v1_1 = InstanceFunctionsAdditionsV1_1(self._dlhandle, instance)

    def destroy_instance[p_allocator_origin: ImmutOrigin](
        self,
        instance: Instance,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyInstance.html
        """
        return self._v1_0.destroy_instance(
            instance,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_devices[p_physical_devices_origin: MutOrigin](
        self,
        instance: Instance,
        mut physical_device_count: UInt32,
        p_physical_devices: Optional[Ptr[PhysicalDevice, p_physical_devices_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        return self._v1_0.enumerate_physical_devices(
            instance,
            Ptr(to=physical_device_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_physical_devices).bitcast[Optional[Ptr[PhysicalDevice, MutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_devices[p_physical_devices_origin: MutOrigin](
        self, instance: Instance
    ) -> ListResult[PhysicalDevice]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        var list = List[PhysicalDevice]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_physical_devices(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDevice, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_physical_devices(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_features(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures.html
        """
        return self._v1_0.get_physical_device_features(
            physical_device,
            Ptr(to=features).bitcast[PhysicalDeviceFeatures]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties.html
        """
        return self._v1_0.get_physical_device_format_properties(
            physical_device,
            format,
            Ptr(to=format_properties).bitcast[FormatProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_image_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        mut image_format_properties: ImageFormatProperties,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceImageFormatProperties.html
        """
        return self._v1_0.get_physical_device_image_format_properties(
            physical_device,
            format,
            type,
            tiling,
            usage,
            flags,
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_properties(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties.html
        """
        return self._v1_0.get_physical_device_properties(
            physical_device,
            Ptr(to=properties).bitcast[PhysicalDeviceProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_queue_family_properties[p_queue_family_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties, p_queue_family_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        return self._v1_0.get_physical_device_queue_family_properties(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_queue_family_properties).bitcast[Optional[Ptr[QueueFamilyProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_queue_family_properties[p_queue_family_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        var list = List[QueueFamilyProperties]()
        var count: UInt32 = 0
        self._v1_0.get_physical_device_queue_family_properties(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[QueueFamilyProperties, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_physical_device_queue_family_properties(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_memory_properties(
        self, physical_device: PhysicalDevice, mut memory_properties: PhysicalDeviceMemoryProperties
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties.html
        """
        return self._v1_0.get_physical_device_memory_properties(
            physical_device,
            Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_instance_proc_addr[p_name_origin: ImmutOrigin](
        self, instance: Instance, p_name: CStringSlice[p_name_origin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetInstanceProcAddr.html
        """
        return self._v1_0.get_instance_proc_addr(
            instance, Ptr(to=p_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[]
        )

    def create_device[p_allocator_origin: ImmutOrigin](
        self,
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut device: Device,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDevice.html
        """
        return self._v1_0.create_device(
            physical_device,
            Ptr(to=create_info).bitcast[DeviceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=device).bitcast[Device]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def enumerate_device_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[p_layer_name_origin],
        mut property_count: UInt32,
        p_properties: Optional[Ptr[ExtensionProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        return self._v1_0.enumerate_device_extension_properties(
            physical_device,
            Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_device_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self, physical_device: PhysicalDevice, p_layer_name: CStringSlice[p_layer_name_origin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_device_extension_properties(
                physical_device,
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[ExtensionProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_device_extension_properties(
                physical_device,
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_device_layer_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[LayerProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        return self._v1_0.enumerate_device_layer_properties(
            physical_device,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[LayerProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_device_layer_properties[p_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_device_layer_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[LayerProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_device_layer_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_sparse_image_format_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[SparseImageFormatProperties, p_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html
        """
        return self._v1_0.get_physical_device_sparse_image_format_properties(
            physical_device,
            format,
            type,
            samples,
            usage,
            tiling,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[SparseImageFormatProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_sparse_image_format_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
    ) -> List[SparseImageFormatProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html
        """
        var list = List[SparseImageFormatProperties]()
        var count: UInt32 = 0
        self._v1_0.get_physical_device_sparse_image_format_properties(
    physical_device,
    format,
    type,
    samples,
    usage,
    tiling,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageFormatProperties, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_physical_device_sparse_image_format_properties(
    physical_device,
    format,
    type,
    samples,
    usage,
    tiling,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def enumerate_physical_device_groups[p_physical_device_group_properties_origin: MutOrigin](
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Optional[Ptr[PhysicalDeviceGroupProperties, p_physical_device_group_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        return self._v1_1.enumerate_physical_device_groups(
            instance,
            Ptr(to=physical_device_group_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_physical_device_group_properties).bitcast[Optional[Ptr[PhysicalDeviceGroupProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_device_groups[p_physical_device_group_properties_origin: MutOrigin](
        self, instance: Instance
    ) -> ListResult[PhysicalDeviceGroupProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        var list = List[PhysicalDeviceGroupProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_1.enumerate_physical_device_groups(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDeviceGroupProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_1.enumerate_physical_device_groups(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_features_2(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures2.html
        """
        return self._v1_1.get_physical_device_features_2(
            physical_device,
            Ptr(to=features).bitcast[PhysicalDeviceFeatures2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties2.html
        """
        return self._v1_1.get_physical_device_properties_2(
            physical_device,
            Ptr(to=properties).bitcast[PhysicalDeviceProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties2.html
        """
        return self._v1_1.get_physical_device_format_properties_2(
            physical_device,
            format,
            Ptr(to=format_properties).bitcast[FormatProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        image_format_info: PhysicalDeviceImageFormatInfo2,
        mut image_format_properties: ImageFormatProperties2,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_image_format_properties_2(
            physical_device,
            Ptr(to=image_format_info).bitcast[PhysicalDeviceImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_queue_family_properties_2[p_queue_family_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties2, p_queue_family_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        return self._v1_1.get_physical_device_queue_family_properties_2(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_queue_family_properties).bitcast[Optional[Ptr[QueueFamilyProperties2, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_queue_family_properties_2[p_queue_family_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        var list = List[QueueFamilyProperties2]()
        var count: UInt32 = 0
        self._v1_1.get_physical_device_queue_family_properties_2(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[QueueFamilyProperties2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_physical_device_queue_family_properties_2(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties2.html
        """
        return self._v1_1.get_physical_device_memory_properties_2(
            physical_device,
            Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_sparse_image_format_properties_2[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[SparseImageFormatProperties2, p_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_sparse_image_format_properties_2(
            physical_device,
            Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[SparseImageFormatProperties2, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_sparse_image_format_properties_2[p_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice, format_info: PhysicalDeviceSparseImageFormatInfo2
    ) -> List[SparseImageFormatProperties2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        var list = List[SparseImageFormatProperties2]()
        var count: UInt32 = 0
        self._v1_1.get_physical_device_sparse_image_format_properties_2(
    physical_device,
    Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageFormatProperties2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_physical_device_sparse_image_format_properties_2(
    physical_device,
    Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_external_buffer_properties(
        self,
        physical_device: PhysicalDevice,
        external_buffer_info: PhysicalDeviceExternalBufferInfo,
        mut external_buffer_properties: ExternalBufferProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalBufferProperties.html
        """
        return self._v1_1.get_physical_device_external_buffer_properties(
            physical_device,
            Ptr(to=external_buffer_info).bitcast[PhysicalDeviceExternalBufferInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_buffer_properties).bitcast[ExternalBufferProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_external_fence_properties(
        self,
        physical_device: PhysicalDevice,
        external_fence_info: PhysicalDeviceExternalFenceInfo,
        mut external_fence_properties: ExternalFenceProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalFenceProperties.html
        """
        return self._v1_1.get_physical_device_external_fence_properties(
            physical_device,
            Ptr(to=external_fence_info).bitcast[PhysicalDeviceExternalFenceInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_fence_properties).bitcast[ExternalFenceProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_external_semaphore_properties(
        self,
        physical_device: PhysicalDevice,
        external_semaphore_info: PhysicalDeviceExternalSemaphoreInfo,
        mut external_semaphore_properties: ExternalSemaphoreProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalSemaphoreProperties.html
        """
        return self._v1_1.get_physical_device_external_semaphore_properties(
            physical_device,
            Ptr(to=external_semaphore_info).bitcast[PhysicalDeviceExternalSemaphoreInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_semaphore_properties).bitcast[ExternalSemaphoreProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct InstanceFunctionsV1_2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: InstanceFunctionsAdditionsV1_0
    var _v1_1: InstanceFunctionsAdditionsV1_1

    def __init__(out self, global_functions: GlobalFunctionsV1_2, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = InstanceFunctionsAdditionsV1_0(self._dlhandle, instance)
        self._v1_1 = InstanceFunctionsAdditionsV1_1(self._dlhandle, instance)

    def destroy_instance[p_allocator_origin: ImmutOrigin](
        self,
        instance: Instance,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyInstance.html
        """
        return self._v1_0.destroy_instance(
            instance,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_devices[p_physical_devices_origin: MutOrigin](
        self,
        instance: Instance,
        mut physical_device_count: UInt32,
        p_physical_devices: Optional[Ptr[PhysicalDevice, p_physical_devices_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        return self._v1_0.enumerate_physical_devices(
            instance,
            Ptr(to=physical_device_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_physical_devices).bitcast[Optional[Ptr[PhysicalDevice, MutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_devices[p_physical_devices_origin: MutOrigin](
        self, instance: Instance
    ) -> ListResult[PhysicalDevice]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        var list = List[PhysicalDevice]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_physical_devices(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDevice, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_physical_devices(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_features(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures.html
        """
        return self._v1_0.get_physical_device_features(
            physical_device,
            Ptr(to=features).bitcast[PhysicalDeviceFeatures]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties.html
        """
        return self._v1_0.get_physical_device_format_properties(
            physical_device,
            format,
            Ptr(to=format_properties).bitcast[FormatProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_image_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        mut image_format_properties: ImageFormatProperties,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceImageFormatProperties.html
        """
        return self._v1_0.get_physical_device_image_format_properties(
            physical_device,
            format,
            type,
            tiling,
            usage,
            flags,
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_properties(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties.html
        """
        return self._v1_0.get_physical_device_properties(
            physical_device,
            Ptr(to=properties).bitcast[PhysicalDeviceProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_queue_family_properties[p_queue_family_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties, p_queue_family_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        return self._v1_0.get_physical_device_queue_family_properties(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_queue_family_properties).bitcast[Optional[Ptr[QueueFamilyProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_queue_family_properties[p_queue_family_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        var list = List[QueueFamilyProperties]()
        var count: UInt32 = 0
        self._v1_0.get_physical_device_queue_family_properties(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[QueueFamilyProperties, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_physical_device_queue_family_properties(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_memory_properties(
        self, physical_device: PhysicalDevice, mut memory_properties: PhysicalDeviceMemoryProperties
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties.html
        """
        return self._v1_0.get_physical_device_memory_properties(
            physical_device,
            Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_instance_proc_addr[p_name_origin: ImmutOrigin](
        self, instance: Instance, p_name: CStringSlice[p_name_origin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetInstanceProcAddr.html
        """
        return self._v1_0.get_instance_proc_addr(
            instance, Ptr(to=p_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[]
        )

    def create_device[p_allocator_origin: ImmutOrigin](
        self,
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut device: Device,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDevice.html
        """
        return self._v1_0.create_device(
            physical_device,
            Ptr(to=create_info).bitcast[DeviceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=device).bitcast[Device]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def enumerate_device_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[p_layer_name_origin],
        mut property_count: UInt32,
        p_properties: Optional[Ptr[ExtensionProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        return self._v1_0.enumerate_device_extension_properties(
            physical_device,
            Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_device_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self, physical_device: PhysicalDevice, p_layer_name: CStringSlice[p_layer_name_origin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_device_extension_properties(
                physical_device,
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[ExtensionProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_device_extension_properties(
                physical_device,
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_device_layer_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[LayerProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        return self._v1_0.enumerate_device_layer_properties(
            physical_device,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[LayerProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_device_layer_properties[p_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_device_layer_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[LayerProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_device_layer_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_sparse_image_format_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[SparseImageFormatProperties, p_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html
        """
        return self._v1_0.get_physical_device_sparse_image_format_properties(
            physical_device,
            format,
            type,
            samples,
            usage,
            tiling,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[SparseImageFormatProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_sparse_image_format_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
    ) -> List[SparseImageFormatProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html
        """
        var list = List[SparseImageFormatProperties]()
        var count: UInt32 = 0
        self._v1_0.get_physical_device_sparse_image_format_properties(
    physical_device,
    format,
    type,
    samples,
    usage,
    tiling,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageFormatProperties, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_physical_device_sparse_image_format_properties(
    physical_device,
    format,
    type,
    samples,
    usage,
    tiling,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def enumerate_physical_device_groups[p_physical_device_group_properties_origin: MutOrigin](
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Optional[Ptr[PhysicalDeviceGroupProperties, p_physical_device_group_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        return self._v1_1.enumerate_physical_device_groups(
            instance,
            Ptr(to=physical_device_group_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_physical_device_group_properties).bitcast[Optional[Ptr[PhysicalDeviceGroupProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_device_groups[p_physical_device_group_properties_origin: MutOrigin](
        self, instance: Instance
    ) -> ListResult[PhysicalDeviceGroupProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        var list = List[PhysicalDeviceGroupProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_1.enumerate_physical_device_groups(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDeviceGroupProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_1.enumerate_physical_device_groups(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_features_2(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures2.html
        """
        return self._v1_1.get_physical_device_features_2(
            physical_device,
            Ptr(to=features).bitcast[PhysicalDeviceFeatures2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties2.html
        """
        return self._v1_1.get_physical_device_properties_2(
            physical_device,
            Ptr(to=properties).bitcast[PhysicalDeviceProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties2.html
        """
        return self._v1_1.get_physical_device_format_properties_2(
            physical_device,
            format,
            Ptr(to=format_properties).bitcast[FormatProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        image_format_info: PhysicalDeviceImageFormatInfo2,
        mut image_format_properties: ImageFormatProperties2,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_image_format_properties_2(
            physical_device,
            Ptr(to=image_format_info).bitcast[PhysicalDeviceImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_queue_family_properties_2[p_queue_family_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties2, p_queue_family_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        return self._v1_1.get_physical_device_queue_family_properties_2(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_queue_family_properties).bitcast[Optional[Ptr[QueueFamilyProperties2, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_queue_family_properties_2[p_queue_family_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        var list = List[QueueFamilyProperties2]()
        var count: UInt32 = 0
        self._v1_1.get_physical_device_queue_family_properties_2(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[QueueFamilyProperties2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_physical_device_queue_family_properties_2(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties2.html
        """
        return self._v1_1.get_physical_device_memory_properties_2(
            physical_device,
            Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_sparse_image_format_properties_2[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[SparseImageFormatProperties2, p_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_sparse_image_format_properties_2(
            physical_device,
            Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[SparseImageFormatProperties2, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_sparse_image_format_properties_2[p_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice, format_info: PhysicalDeviceSparseImageFormatInfo2
    ) -> List[SparseImageFormatProperties2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        var list = List[SparseImageFormatProperties2]()
        var count: UInt32 = 0
        self._v1_1.get_physical_device_sparse_image_format_properties_2(
    physical_device,
    Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageFormatProperties2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_physical_device_sparse_image_format_properties_2(
    physical_device,
    Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_external_buffer_properties(
        self,
        physical_device: PhysicalDevice,
        external_buffer_info: PhysicalDeviceExternalBufferInfo,
        mut external_buffer_properties: ExternalBufferProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalBufferProperties.html
        """
        return self._v1_1.get_physical_device_external_buffer_properties(
            physical_device,
            Ptr(to=external_buffer_info).bitcast[PhysicalDeviceExternalBufferInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_buffer_properties).bitcast[ExternalBufferProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_external_fence_properties(
        self,
        physical_device: PhysicalDevice,
        external_fence_info: PhysicalDeviceExternalFenceInfo,
        mut external_fence_properties: ExternalFenceProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalFenceProperties.html
        """
        return self._v1_1.get_physical_device_external_fence_properties(
            physical_device,
            Ptr(to=external_fence_info).bitcast[PhysicalDeviceExternalFenceInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_fence_properties).bitcast[ExternalFenceProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_external_semaphore_properties(
        self,
        physical_device: PhysicalDevice,
        external_semaphore_info: PhysicalDeviceExternalSemaphoreInfo,
        mut external_semaphore_properties: ExternalSemaphoreProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalSemaphoreProperties.html
        """
        return self._v1_1.get_physical_device_external_semaphore_properties(
            physical_device,
            Ptr(to=external_semaphore_info).bitcast[PhysicalDeviceExternalSemaphoreInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_semaphore_properties).bitcast[ExternalSemaphoreProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )


struct InstanceFunctionsV1_3(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: InstanceFunctionsAdditionsV1_0
    var _v1_1: InstanceFunctionsAdditionsV1_1
    var _v1_3: InstanceFunctionsAdditionsV1_3

    def __init__(out self, global_functions: GlobalFunctionsV1_3, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = InstanceFunctionsAdditionsV1_0(self._dlhandle, instance)
        self._v1_1 = InstanceFunctionsAdditionsV1_1(self._dlhandle, instance)
        self._v1_3 = InstanceFunctionsAdditionsV1_3(self._dlhandle, instance)

    def destroy_instance[p_allocator_origin: ImmutOrigin](
        self,
        instance: Instance,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyInstance.html
        """
        return self._v1_0.destroy_instance(
            instance,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_devices[p_physical_devices_origin: MutOrigin](
        self,
        instance: Instance,
        mut physical_device_count: UInt32,
        p_physical_devices: Optional[Ptr[PhysicalDevice, p_physical_devices_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        return self._v1_0.enumerate_physical_devices(
            instance,
            Ptr(to=physical_device_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_physical_devices).bitcast[Optional[Ptr[PhysicalDevice, MutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_devices[p_physical_devices_origin: MutOrigin](
        self, instance: Instance
    ) -> ListResult[PhysicalDevice]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        var list = List[PhysicalDevice]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_physical_devices(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDevice, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_physical_devices(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_features(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures.html
        """
        return self._v1_0.get_physical_device_features(
            physical_device,
            Ptr(to=features).bitcast[PhysicalDeviceFeatures]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties.html
        """
        return self._v1_0.get_physical_device_format_properties(
            physical_device,
            format,
            Ptr(to=format_properties).bitcast[FormatProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_image_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        mut image_format_properties: ImageFormatProperties,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceImageFormatProperties.html
        """
        return self._v1_0.get_physical_device_image_format_properties(
            physical_device,
            format,
            type,
            tiling,
            usage,
            flags,
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_properties(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties.html
        """
        return self._v1_0.get_physical_device_properties(
            physical_device,
            Ptr(to=properties).bitcast[PhysicalDeviceProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_queue_family_properties[p_queue_family_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties, p_queue_family_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        return self._v1_0.get_physical_device_queue_family_properties(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_queue_family_properties).bitcast[Optional[Ptr[QueueFamilyProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_queue_family_properties[p_queue_family_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        var list = List[QueueFamilyProperties]()
        var count: UInt32 = 0
        self._v1_0.get_physical_device_queue_family_properties(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[QueueFamilyProperties, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_physical_device_queue_family_properties(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_memory_properties(
        self, physical_device: PhysicalDevice, mut memory_properties: PhysicalDeviceMemoryProperties
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties.html
        """
        return self._v1_0.get_physical_device_memory_properties(
            physical_device,
            Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_instance_proc_addr[p_name_origin: ImmutOrigin](
        self, instance: Instance, p_name: CStringSlice[p_name_origin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetInstanceProcAddr.html
        """
        return self._v1_0.get_instance_proc_addr(
            instance, Ptr(to=p_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[]
        )

    def create_device[p_allocator_origin: ImmutOrigin](
        self,
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut device: Device,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDevice.html
        """
        return self._v1_0.create_device(
            physical_device,
            Ptr(to=create_info).bitcast[DeviceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=device).bitcast[Device]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def enumerate_device_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[p_layer_name_origin],
        mut property_count: UInt32,
        p_properties: Optional[Ptr[ExtensionProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        return self._v1_0.enumerate_device_extension_properties(
            physical_device,
            Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_device_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self, physical_device: PhysicalDevice, p_layer_name: CStringSlice[p_layer_name_origin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_device_extension_properties(
                physical_device,
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[ExtensionProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_device_extension_properties(
                physical_device,
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_device_layer_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[LayerProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        return self._v1_0.enumerate_device_layer_properties(
            physical_device,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[LayerProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_device_layer_properties[p_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_device_layer_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[LayerProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_device_layer_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_sparse_image_format_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[SparseImageFormatProperties, p_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html
        """
        return self._v1_0.get_physical_device_sparse_image_format_properties(
            physical_device,
            format,
            type,
            samples,
            usage,
            tiling,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[SparseImageFormatProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_sparse_image_format_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
    ) -> List[SparseImageFormatProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html
        """
        var list = List[SparseImageFormatProperties]()
        var count: UInt32 = 0
        self._v1_0.get_physical_device_sparse_image_format_properties(
    physical_device,
    format,
    type,
    samples,
    usage,
    tiling,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageFormatProperties, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_physical_device_sparse_image_format_properties(
    physical_device,
    format,
    type,
    samples,
    usage,
    tiling,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def enumerate_physical_device_groups[p_physical_device_group_properties_origin: MutOrigin](
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Optional[Ptr[PhysicalDeviceGroupProperties, p_physical_device_group_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        return self._v1_1.enumerate_physical_device_groups(
            instance,
            Ptr(to=physical_device_group_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_physical_device_group_properties).bitcast[Optional[Ptr[PhysicalDeviceGroupProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_device_groups[p_physical_device_group_properties_origin: MutOrigin](
        self, instance: Instance
    ) -> ListResult[PhysicalDeviceGroupProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        var list = List[PhysicalDeviceGroupProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_1.enumerate_physical_device_groups(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDeviceGroupProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_1.enumerate_physical_device_groups(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_features_2(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures2.html
        """
        return self._v1_1.get_physical_device_features_2(
            physical_device,
            Ptr(to=features).bitcast[PhysicalDeviceFeatures2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties2.html
        """
        return self._v1_1.get_physical_device_properties_2(
            physical_device,
            Ptr(to=properties).bitcast[PhysicalDeviceProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties2.html
        """
        return self._v1_1.get_physical_device_format_properties_2(
            physical_device,
            format,
            Ptr(to=format_properties).bitcast[FormatProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        image_format_info: PhysicalDeviceImageFormatInfo2,
        mut image_format_properties: ImageFormatProperties2,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_image_format_properties_2(
            physical_device,
            Ptr(to=image_format_info).bitcast[PhysicalDeviceImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_queue_family_properties_2[p_queue_family_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties2, p_queue_family_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        return self._v1_1.get_physical_device_queue_family_properties_2(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_queue_family_properties).bitcast[Optional[Ptr[QueueFamilyProperties2, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_queue_family_properties_2[p_queue_family_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        var list = List[QueueFamilyProperties2]()
        var count: UInt32 = 0
        self._v1_1.get_physical_device_queue_family_properties_2(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[QueueFamilyProperties2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_physical_device_queue_family_properties_2(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties2.html
        """
        return self._v1_1.get_physical_device_memory_properties_2(
            physical_device,
            Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_sparse_image_format_properties_2[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[SparseImageFormatProperties2, p_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_sparse_image_format_properties_2(
            physical_device,
            Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[SparseImageFormatProperties2, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_sparse_image_format_properties_2[p_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice, format_info: PhysicalDeviceSparseImageFormatInfo2
    ) -> List[SparseImageFormatProperties2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        var list = List[SparseImageFormatProperties2]()
        var count: UInt32 = 0
        self._v1_1.get_physical_device_sparse_image_format_properties_2(
    physical_device,
    Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageFormatProperties2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_physical_device_sparse_image_format_properties_2(
    physical_device,
    Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_external_buffer_properties(
        self,
        physical_device: PhysicalDevice,
        external_buffer_info: PhysicalDeviceExternalBufferInfo,
        mut external_buffer_properties: ExternalBufferProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalBufferProperties.html
        """
        return self._v1_1.get_physical_device_external_buffer_properties(
            physical_device,
            Ptr(to=external_buffer_info).bitcast[PhysicalDeviceExternalBufferInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_buffer_properties).bitcast[ExternalBufferProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_external_fence_properties(
        self,
        physical_device: PhysicalDevice,
        external_fence_info: PhysicalDeviceExternalFenceInfo,
        mut external_fence_properties: ExternalFenceProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalFenceProperties.html
        """
        return self._v1_1.get_physical_device_external_fence_properties(
            physical_device,
            Ptr(to=external_fence_info).bitcast[PhysicalDeviceExternalFenceInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_fence_properties).bitcast[ExternalFenceProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_external_semaphore_properties(
        self,
        physical_device: PhysicalDevice,
        external_semaphore_info: PhysicalDeviceExternalSemaphoreInfo,
        mut external_semaphore_properties: ExternalSemaphoreProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalSemaphoreProperties.html
        """
        return self._v1_1.get_physical_device_external_semaphore_properties(
            physical_device,
            Ptr(to=external_semaphore_info).bitcast[PhysicalDeviceExternalSemaphoreInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_semaphore_properties).bitcast[ExternalSemaphoreProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_tool_properties[p_tool_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut tool_count: UInt32,
        p_tool_properties: Optional[Ptr[PhysicalDeviceToolProperties, p_tool_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        return self._v1_3.get_physical_device_tool_properties(
            physical_device,
            Ptr(to=tool_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_tool_properties).bitcast[Optional[Ptr[PhysicalDeviceToolProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_tool_properties[p_tool_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> ListResult[PhysicalDeviceToolProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        var list = List[PhysicalDeviceToolProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_3.get_physical_device_tool_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDeviceToolProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_3.get_physical_device_tool_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)


struct InstanceFunctionsV1_4(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: InstanceFunctionsAdditionsV1_0
    var _v1_1: InstanceFunctionsAdditionsV1_1
    var _v1_3: InstanceFunctionsAdditionsV1_3

    def __init__(out self, global_functions: GlobalFunctionsV1_4, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = InstanceFunctionsAdditionsV1_0(self._dlhandle, instance)
        self._v1_1 = InstanceFunctionsAdditionsV1_1(self._dlhandle, instance)
        self._v1_3 = InstanceFunctionsAdditionsV1_3(self._dlhandle, instance)

    def destroy_instance[p_allocator_origin: ImmutOrigin](
        self,
        instance: Instance,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyInstance.html
        """
        return self._v1_0.destroy_instance(
            instance,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_devices[p_physical_devices_origin: MutOrigin](
        self,
        instance: Instance,
        mut physical_device_count: UInt32,
        p_physical_devices: Optional[Ptr[PhysicalDevice, p_physical_devices_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        return self._v1_0.enumerate_physical_devices(
            instance,
            Ptr(to=physical_device_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_physical_devices).bitcast[Optional[Ptr[PhysicalDevice, MutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_devices[p_physical_devices_origin: MutOrigin](
        self, instance: Instance
    ) -> ListResult[PhysicalDevice]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        var list = List[PhysicalDevice]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_physical_devices(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDevice, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_physical_devices(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_features(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures.html
        """
        return self._v1_0.get_physical_device_features(
            physical_device,
            Ptr(to=features).bitcast[PhysicalDeviceFeatures]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties.html
        """
        return self._v1_0.get_physical_device_format_properties(
            physical_device,
            format,
            Ptr(to=format_properties).bitcast[FormatProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_image_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        mut image_format_properties: ImageFormatProperties,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceImageFormatProperties.html
        """
        return self._v1_0.get_physical_device_image_format_properties(
            physical_device,
            format,
            type,
            tiling,
            usage,
            flags,
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_properties(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties.html
        """
        return self._v1_0.get_physical_device_properties(
            physical_device,
            Ptr(to=properties).bitcast[PhysicalDeviceProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_queue_family_properties[p_queue_family_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties, p_queue_family_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        return self._v1_0.get_physical_device_queue_family_properties(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_queue_family_properties).bitcast[Optional[Ptr[QueueFamilyProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_queue_family_properties[p_queue_family_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        var list = List[QueueFamilyProperties]()
        var count: UInt32 = 0
        self._v1_0.get_physical_device_queue_family_properties(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[QueueFamilyProperties, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_physical_device_queue_family_properties(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_memory_properties(
        self, physical_device: PhysicalDevice, mut memory_properties: PhysicalDeviceMemoryProperties
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties.html
        """
        return self._v1_0.get_physical_device_memory_properties(
            physical_device,
            Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_instance_proc_addr[p_name_origin: ImmutOrigin](
        self, instance: Instance, p_name: CStringSlice[p_name_origin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetInstanceProcAddr.html
        """
        return self._v1_0.get_instance_proc_addr(
            instance, Ptr(to=p_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[]
        )

    def create_device[p_allocator_origin: ImmutOrigin](
        self,
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut device: Device,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDevice.html
        """
        return self._v1_0.create_device(
            physical_device,
            Ptr(to=create_info).bitcast[DeviceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=device).bitcast[Device]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def enumerate_device_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self,
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[p_layer_name_origin],
        mut property_count: UInt32,
        p_properties: Optional[Ptr[ExtensionProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        return self._v1_0.enumerate_device_extension_properties(
            physical_device,
            Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_device_extension_properties[
        p_layer_name_origin: ImmutOrigin, p_properties_origin: MutOrigin
    ](
        self, physical_device: PhysicalDevice, p_layer_name: CStringSlice[p_layer_name_origin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_device_extension_properties(
                physical_device,
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[ExtensionProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_device_extension_properties(
                physical_device,
                Ptr(to=p_layer_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[],
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def enumerate_device_layer_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[LayerProperties, p_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        return self._v1_0.enumerate_device_layer_properties(
            physical_device,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[LayerProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_device_layer_properties[p_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.enumerate_device_layer_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[LayerProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.enumerate_device_layer_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_sparse_image_format_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[SparseImageFormatProperties, p_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html
        """
        return self._v1_0.get_physical_device_sparse_image_format_properties(
            physical_device,
            format,
            type,
            samples,
            usage,
            tiling,
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[SparseImageFormatProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_sparse_image_format_properties[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
    ) -> List[SparseImageFormatProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties.html
        """
        var list = List[SparseImageFormatProperties]()
        var count: UInt32 = 0
        self._v1_0.get_physical_device_sparse_image_format_properties(
    physical_device,
    format,
    type,
    samples,
    usage,
    tiling,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageFormatProperties, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_physical_device_sparse_image_format_properties(
    physical_device,
    format,
    type,
    samples,
    usage,
    tiling,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def enumerate_physical_device_groups[p_physical_device_group_properties_origin: MutOrigin](
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Optional[Ptr[PhysicalDeviceGroupProperties, p_physical_device_group_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        return self._v1_1.enumerate_physical_device_groups(
            instance,
            Ptr(to=physical_device_group_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_physical_device_group_properties).bitcast[Optional[Ptr[PhysicalDeviceGroupProperties, MutUntrackedOrigin]]]()[],
        )

    def enumerate_physical_device_groups[p_physical_device_group_properties_origin: MutOrigin](
        self, instance: Instance
    ) -> ListResult[PhysicalDeviceGroupProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        var list = List[PhysicalDeviceGroupProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_1.enumerate_physical_device_groups(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDeviceGroupProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_1.enumerate_physical_device_groups(
                instance,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def get_physical_device_features_2(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures2.html
        """
        return self._v1_1.get_physical_device_features_2(
            physical_device,
            Ptr(to=features).bitcast[PhysicalDeviceFeatures2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties2.html
        """
        return self._v1_1.get_physical_device_properties_2(
            physical_device,
            Ptr(to=properties).bitcast[PhysicalDeviceProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties2.html
        """
        return self._v1_1.get_physical_device_format_properties_2(
            physical_device,
            format,
            Ptr(to=format_properties).bitcast[FormatProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        image_format_info: PhysicalDeviceImageFormatInfo2,
        mut image_format_properties: ImageFormatProperties2,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_image_format_properties_2(
            physical_device,
            Ptr(to=image_format_info).bitcast[PhysicalDeviceImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_queue_family_properties_2[p_queue_family_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties2, p_queue_family_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        return self._v1_1.get_physical_device_queue_family_properties_2(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_queue_family_properties).bitcast[Optional[Ptr[QueueFamilyProperties2, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_queue_family_properties_2[p_queue_family_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        var list = List[QueueFamilyProperties2]()
        var count: UInt32 = 0
        self._v1_1.get_physical_device_queue_family_properties_2(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[QueueFamilyProperties2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_physical_device_queue_family_properties_2(
    physical_device,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties2.html
        """
        return self._v1_1.get_physical_device_memory_properties_2(
            physical_device,
            Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_sparse_image_format_properties_2[p_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Optional[Ptr[SparseImageFormatProperties2, p_properties_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_sparse_image_format_properties_2(
            physical_device,
            Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=property_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_properties).bitcast[Optional[Ptr[SparseImageFormatProperties2, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_sparse_image_format_properties_2[p_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice, format_info: PhysicalDeviceSparseImageFormatInfo2
    ) -> List[SparseImageFormatProperties2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        var list = List[SparseImageFormatProperties2]()
        var count: UInt32 = 0
        self._v1_1.get_physical_device_sparse_image_format_properties_2(
    physical_device,
    Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageFormatProperties2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_physical_device_sparse_image_format_properties_2(
    physical_device,
    Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def get_physical_device_external_buffer_properties(
        self,
        physical_device: PhysicalDevice,
        external_buffer_info: PhysicalDeviceExternalBufferInfo,
        mut external_buffer_properties: ExternalBufferProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalBufferProperties.html
        """
        return self._v1_1.get_physical_device_external_buffer_properties(
            physical_device,
            Ptr(to=external_buffer_info).bitcast[PhysicalDeviceExternalBufferInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_buffer_properties).bitcast[ExternalBufferProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_external_fence_properties(
        self,
        physical_device: PhysicalDevice,
        external_fence_info: PhysicalDeviceExternalFenceInfo,
        mut external_fence_properties: ExternalFenceProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalFenceProperties.html
        """
        return self._v1_1.get_physical_device_external_fence_properties(
            physical_device,
            Ptr(to=external_fence_info).bitcast[PhysicalDeviceExternalFenceInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_fence_properties).bitcast[ExternalFenceProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_external_semaphore_properties(
        self,
        physical_device: PhysicalDevice,
        external_semaphore_info: PhysicalDeviceExternalSemaphoreInfo,
        mut external_semaphore_properties: ExternalSemaphoreProperties,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceExternalSemaphoreProperties.html
        """
        return self._v1_1.get_physical_device_external_semaphore_properties(
            physical_device,
            Ptr(to=external_semaphore_info).bitcast[PhysicalDeviceExternalSemaphoreInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=external_semaphore_properties).bitcast[ExternalSemaphoreProperties]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_physical_device_tool_properties[p_tool_properties_origin: MutOrigin](
        self,
        physical_device: PhysicalDevice,
        mut tool_count: UInt32,
        p_tool_properties: Optional[Ptr[PhysicalDeviceToolProperties, p_tool_properties_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        return self._v1_3.get_physical_device_tool_properties(
            physical_device,
            Ptr(to=tool_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_tool_properties).bitcast[Optional[Ptr[PhysicalDeviceToolProperties, MutUntrackedOrigin]]]()[],
        )

    def get_physical_device_tool_properties[p_tool_properties_origin: MutOrigin](
        self, physical_device: PhysicalDevice
    ) -> ListResult[PhysicalDeviceToolProperties]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        var list = List[PhysicalDeviceToolProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_3.get_physical_device_tool_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[PhysicalDeviceToolProperties, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_3.get_physical_device_tool_properties(
                physical_device,
                Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)


struct DeviceFunctionsV1_0(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: DeviceFunctionsAdditionsV1_0

    def __init__(out self, global_functions: GlobalFunctionsV1_0, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = DeviceFunctionsAdditionsV1_0(self._dlhandle, device)

    def get_device_proc_addr[p_name_origin: ImmutOrigin](
        self, device: Device, p_name: CStringSlice[p_name_origin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceProcAddr.html
        """
        return self._v1_0.get_device_proc_addr(
            device, Ptr(to=p_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[]
        )

    def destroy_device[p_allocator_origin: ImmutOrigin](
        self, device: Device, p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDevice.html
        """
        return self._v1_0.destroy_device(
            device,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_device_queue(
        self, device: Device, queue_family_index: UInt32, queue_index: UInt32, mut queue: Queue
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue.html
        """
        return self._v1_0.get_device_queue(
            device,
            queue_family_index,
            queue_index,
            Ptr(to=queue).bitcast[Queue]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def queue_submit[p_submits_origin: ImmutOrigin](
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, p_submits_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit.html
        """
        return self._v1_0.queue_submit(
            queue, submit_count, Ptr(to=p_submits).bitcast[Ptr[SubmitInfo, ImmutUntrackedOrigin]]()[], fence
        )

    def queue_wait_idle(self, queue: Queue) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueWaitIdle.html
        """
        return self._v1_0.queue_wait_idle(queue)

    def device_wait_idle(self, device: Device) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeviceWaitIdle.html
        """
        return self._v1_0.device_wait_idle(device)

    def allocate_memory[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut memory: DeviceMemory,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateMemory.html
        """
        return self._v1_0.allocate_memory(
            device,
            Ptr(to=allocate_info).bitcast[MemoryAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=memory).bitcast[DeviceMemory]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def free_memory[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        memory: DeviceMemory,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeMemory.html
        """
        return self._v1_0.free_memory(
            device,
            memory,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def map_memory[p_data_origin: MutOrigin](
        self,
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        mut p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMapMemory.html
        """
        return self._v1_0.map_memory(
            device,
            memory,
            offset,
            size,
            flags,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def unmap_memory(self, device: Device, memory: DeviceMemory):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory.html
        """
        return self._v1_0.unmap_memory(device, memory)

    def flush_mapped_memory_ranges[p_memory_ranges_origin: ImmutOrigin](
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, p_memory_ranges_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFlushMappedMemoryRanges.html
        """
        return self._v1_0.flush_mapped_memory_ranges(
            device,
            memory_range_count,
            Ptr(to=p_memory_ranges).bitcast[Ptr[MappedMemoryRange, ImmutUntrackedOrigin]]()[],
        )

    def invalidate_mapped_memory_ranges[p_memory_ranges_origin: ImmutOrigin](
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, p_memory_ranges_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInvalidateMappedMemoryRanges.html
        """
        return self._v1_0.invalidate_mapped_memory_ranges(
            device,
            memory_range_count,
            Ptr(to=p_memory_ranges).bitcast[Ptr[MappedMemoryRange, ImmutUntrackedOrigin]]()[],
        )

    def get_device_memory_commitment(
        self, device: Device, memory: DeviceMemory, mut committed_memory_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryCommitment.html
        """
        return self._v1_0.get_device_memory_commitment(
            device,
            memory,
            Ptr(to=committed_memory_in_bytes).bitcast[DeviceSize]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def bind_buffer_memory(
        self, device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory.html
        """
        return self._v1_0.bind_buffer_memory(device, buffer, memory, memory_offset)

    def bind_image_memory(
        self, device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory.html
        """
        return self._v1_0.bind_image_memory(device, image, memory, memory_offset)

    def get_buffer_memory_requirements(
        self, device: Device, buffer: Buffer, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements.html
        """
        return self._v1_0.get_buffer_memory_requirements(
            device,
            buffer,
            Ptr(to=memory_requirements).bitcast[MemoryRequirements]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_memory_requirements(
        self, device: Device, image: Image, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements.html
        """
        return self._v1_0.get_image_memory_requirements(
            device,
            image,
            Ptr(to=memory_requirements).bitcast[MemoryRequirements]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        image: Image,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        return self._v1_0.get_image_sparse_memory_requirements(
            device,
            image,
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin]]]()[],
        )

    def get_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, image: Image
    ) -> List[SparseImageMemoryRequirements]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements]()
        var count: UInt32 = 0
        self._v1_0.get_image_sparse_memory_requirements(
    device,
    image,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_image_sparse_memory_requirements(
    device,
    image,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def queue_bind_sparse[p_bind_info_origin: ImmutOrigin](
        self,
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, p_bind_info_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBindSparse.html
        """
        return self._v1_0.queue_bind_sparse(
            queue,
            bind_info_count,
            Ptr(to=p_bind_info).bitcast[Ptr[BindSparseInfo, ImmutUntrackedOrigin]]()[],
            fence,
        )

    def create_fence[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFence.html
        """
        return self._v1_0.create_fence(
            device,
            Ptr(to=create_info).bitcast[FenceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=fence).bitcast[Fence]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_fence[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        fence: Fence,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFence.html
        """
        return self._v1_0.destroy_fence(
            device,
            fence,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_fences[p_fences_origin: ImmutOrigin](
        self, device: Device, fence_count: UInt32, p_fences: Ptr[Fence, p_fences_origin]
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetFences.html
        """
        return self._v1_0.reset_fences(
            device, fence_count, Ptr(to=p_fences).bitcast[Ptr[Fence, ImmutUntrackedOrigin]]()[]
        )

    def get_fence_status(self, device: Device, fence: Fence) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceStatus.html
        """
        return self._v1_0.get_fence_status(device, fence)

    def wait_for_fences[p_fences_origin: ImmutOrigin](
        self,
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, p_fences_origin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForFences.html
        """
        return self._v1_0.wait_for_fences(
            device,
            fence_count,
            Ptr(to=p_fences).bitcast[Ptr[Fence, ImmutUntrackedOrigin]]()[],
            wait_all,
            timeout,
        )

    def create_semaphore[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut semaphore: Semaphore,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSemaphore.html
        """
        return self._v1_0.create_semaphore(
            device,
            Ptr(to=create_info).bitcast[SemaphoreCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=semaphore).bitcast[Semaphore]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_semaphore[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        semaphore: Semaphore,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySemaphore.html
        """
        return self._v1_0.destroy_semaphore(
            device,
            semaphore,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_query_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut query_pool: QueryPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateQueryPool.html
        """
        return self._v1_0.create_query_pool(
            device,
            Ptr(to=create_info).bitcast[QueryPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=query_pool).bitcast[QueryPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_query_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        query_pool: QueryPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyQueryPool.html
        """
        return self._v1_0.destroy_query_pool(
            device,
            query_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_query_pool_results[p_data_origin: MutOrigin](
        self,
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueryPoolResults.html
        """
        return self._v1_0.get_query_pool_results(
            device,
            query_pool,
            first_query,
            query_count,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
            stride,
            flags,
        )

    def create_buffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut buffer: Buffer,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBuffer.html
        """
        return self._v1_0.create_buffer(
            device,
            Ptr(to=create_info).bitcast[BufferCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=buffer).bitcast[Buffer]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_buffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        buffer: Buffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBuffer.html
        """
        return self._v1_0.destroy_buffer(
            device,
            buffer,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_image[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut image: Image,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImage.html
        """
        return self._v1_0.create_image(
            device,
            Ptr(to=create_info).bitcast[ImageCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=image).bitcast[Image]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_image[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        image: Image,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImage.html
        """
        return self._v1_0.destroy_image(
            device,
            image,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_image_subresource_layout(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource,
        mut layout: SubresourceLayout,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout.html
        """
        return self._v1_0.get_image_subresource_layout(
            device,
            image,
            Ptr(to=subresource).bitcast[ImageSubresource]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=layout).bitcast[SubresourceLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def create_image_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: ImageView,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImageView.html
        """
        return self._v1_0.create_image_view(
            device,
            Ptr(to=create_info).bitcast[ImageViewCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[ImageView]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_image_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        image_view: ImageView,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImageView.html
        """
        return self._v1_0.destroy_image_view(
            device,
            image_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_command_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut command_pool: CommandPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCommandPool.html
        """
        return self._v1_0.create_command_pool(
            device,
            Ptr(to=create_info).bitcast[CommandPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=command_pool).bitcast[CommandPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_command_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        command_pool: CommandPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCommandPool.html
        """
        return self._v1_0.destroy_command_pool(
            device,
            command_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandPool.html
        """
        return self._v1_0.reset_command_pool(device, command_pool, flags)

    def allocate_command_buffers[p_command_buffers_origin: MutOrigin](
        self,
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateCommandBuffers.html
        """
        return self._v1_0.allocate_command_buffers(
            device,
            Ptr(to=allocate_info).bitcast[CommandBufferAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, MutUntrackedOrigin]]()[],
        )

    def free_command_buffers[p_command_buffers_origin: ImmutOrigin](
        self,
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeCommandBuffers.html
        """
        return self._v1_0.free_command_buffers(
            device,
            command_pool,
            command_buffer_count,
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, ImmutUntrackedOrigin]]()[],
        )

    def begin_command_buffer(
        self, command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBeginCommandBuffer.html
        """
        return self._v1_0.begin_command_buffer(
            command_buffer,
            Ptr(to=begin_info).bitcast[CommandBufferBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def end_command_buffer(self, command_buffer: CommandBuffer) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEndCommandBuffer.html
        """
        return self._v1_0.end_command_buffer(command_buffer)

    def reset_command_buffer(
        self, command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandBuffer.html
        """
        return self._v1_0.reset_command_buffer(command_buffer, flags)

    def cmd_copy_buffer[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer.html
        """
        return self._v1_0.cmd_copy_buffer(
            command_buffer,
            src_buffer,
            dst_buffer,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage.html
        """
        return self._v1_0.cmd_copy_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_buffer_to_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html
        """
        return self._v1_0.cmd_copy_buffer_to_image(
            command_buffer,
            src_buffer,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_image_to_buffer[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer.html
        """
        return self._v1_0.cmd_copy_image_to_buffer(
            command_buffer,
            src_image,
            src_image_layout,
            dst_buffer,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_update_buffer[p_data_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdateBuffer.html
        """
        return self._v1_0.cmd_update_buffer(
            command_buffer,
            dst_buffer,
            dst_offset,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def cmd_fill_buffer(
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        size: DeviceSize,
        data: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdFillBuffer.html
        """
        return self._v1_0.cmd_fill_buffer(command_buffer, dst_buffer, dst_offset, size, data)

    def cmd_pipeline_barrier[
        p_memory_barriers_origin: ImmutOrigin,
        p_buffer_memory_barriers_origin: ImmutOrigin,
        p_image_memory_barriers_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, p_memory_barriers_origin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, p_buffer_memory_barriers_origin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, p_image_memory_barriers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier.html
        """
        return self._v1_0.cmd_pipeline_barrier(
            command_buffer,
            src_stage_mask,
            dst_stage_mask,
            dependency_flags,
            memory_barrier_count,
            Ptr(to=p_memory_barriers).bitcast[Ptr[MemoryBarrier, ImmutUntrackedOrigin]]()[],
            buffer_memory_barrier_count,
            Ptr(to=p_buffer_memory_barriers).bitcast[Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin]]()[],
            image_memory_barrier_count,
            Ptr(to=p_image_memory_barriers).bitcast[Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin]]()[],
        )

    def cmd_begin_query(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginQuery.html
        """
        return self._v1_0.cmd_begin_query(command_buffer, query_pool, query, flags)

    def cmd_end_query(self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQuery.html
        """
        return self._v1_0.cmd_end_query(command_buffer, query_pool, query)

    def cmd_reset_query_pool(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetQueryPool.html
        """
        return self._v1_0.cmd_reset_query_pool(command_buffer, query_pool, first_query, query_count)

    def cmd_write_timestamp(
        self,
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        query_pool: QueryPool,
        query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteTimestamp.html
        """
        return self._v1_0.cmd_write_timestamp(command_buffer, pipeline_stage, query_pool, query)

    def cmd_copy_query_pool_results(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        stride: DeviceSize,
        flags: QueryResultFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyQueryPoolResults.html
        """
        return self._v1_0.cmd_copy_query_pool_results(
            command_buffer, query_pool, first_query, query_count, dst_buffer, dst_offset, stride, flags
        )

    def cmd_execute_commands[p_command_buffers_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteCommands.html
        """
        return self._v1_0.cmd_execute_commands(
            command_buffer,
            command_buffer_count,
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, ImmutUntrackedOrigin]]()[],
        )

    def create_event[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut event: Event,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateEvent.html
        """
        return self._v1_0.create_event(
            device,
            Ptr(to=create_info).bitcast[EventCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=event).bitcast[Event]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_event[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        event: Event,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyEvent.html
        """
        return self._v1_0.destroy_event(
            device,
            event,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_event_status(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEventStatus.html
        """
        return self._v1_0.get_event_status(device, event)

    def set_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetEvent.html
        """
        return self._v1_0.set_event(device, event)

    def reset_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetEvent.html
        """
        return self._v1_0.reset_event(device, event)

    def create_buffer_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: BufferView,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferView.html
        """
        return self._v1_0.create_buffer_view(
            device,
            Ptr(to=create_info).bitcast[BufferViewCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[BufferView]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_buffer_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        buffer_view: BufferView,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferView.html
        """
        return self._v1_0.destroy_buffer_view(
            device,
            buffer_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_shader_module[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut shader_module: ShaderModule,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShaderModule.html
        """
        return self._v1_0.create_shader_module(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=shader_module).bitcast[ShaderModule]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_shader_module[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderModule.html
        """
        return self._v1_0.destroy_shader_module(
            device,
            shader_module,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_pipeline_cache[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut pipeline_cache: PipelineCache,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineCache.html
        """
        return self._v1_0.create_pipeline_cache(
            device,
            Ptr(to=create_info).bitcast[PipelineCacheCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=pipeline_cache).bitcast[PipelineCache]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_pipeline_cache[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineCache.html
        """
        return self._v1_0.destroy_pipeline_cache(
            device,
            pipeline_cache,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_pipeline_cache_data[p_data_origin: MutOrigin](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        mut data_size: UInt,
        p_data: Optional[Ptr[NoneType, p_data_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        return self._v1_0.get_pipeline_cache_data(
            device,
            pipeline_cache,
            Ptr(to=data_size).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Optional[Ptr[NoneType, MutUntrackedOrigin]]]()[],
        )

    def get_pipeline_cache_data[p_data_origin: MutOrigin](
        self, device: Device, pipeline_cache: PipelineCache
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.get_pipeline_cache_data(
                device,
                pipeline_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[NoneType, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.get_pipeline_cache_data(
                device,
                pipeline_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().bitcast[NoneType]().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def merge_pipeline_caches[p_src_caches_origin: ImmutOrigin](
        self,
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, p_src_caches_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergePipelineCaches.html
        """
        return self._v1_0.merge_pipeline_caches(
            device,
            dst_cache,
            src_cache_count,
            Ptr(to=p_src_caches).bitcast[Ptr[PipelineCache, ImmutUntrackedOrigin]]()[],
        )

    def create_compute_pipelines[
        p_create_infos_origin: ImmutOrigin,
        p_allocator_origin: ImmutOrigin,
        p_pipelines_origin: MutOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateComputePipelines.html
        """
        return self._v1_0.create_compute_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[ComputePipelineCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def destroy_pipeline[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline: Pipeline,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipeline.html
        """
        return self._v1_0.destroy_pipeline(
            device,
            pipeline,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_pipeline_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut pipeline_layout: PipelineLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineLayout.html
        """
        return self._v1_0.create_pipeline_layout(
            device,
            Ptr(to=create_info).bitcast[PipelineLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=pipeline_layout).bitcast[PipelineLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_pipeline_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineLayout.html
        """
        return self._v1_0.destroy_pipeline_layout(
            device,
            pipeline_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_sampler[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut sampler: Sampler,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSampler.html
        """
        return self._v1_0.create_sampler(
            device,
            Ptr(to=create_info).bitcast[SamplerCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=sampler).bitcast[Sampler]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_sampler[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        sampler: Sampler,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySampler.html
        """
        return self._v1_0.destroy_sampler(
            device,
            sampler,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_descriptor_set_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut set_layout: DescriptorSetLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorSetLayout.html
        """
        return self._v1_0.create_descriptor_set_layout(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=set_layout).bitcast[DescriptorSetLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_set_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorSetLayout.html
        """
        return self._v1_0.destroy_descriptor_set_layout(
            device,
            descriptor_set_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_descriptor_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut descriptor_pool: DescriptorPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorPool.html
        """
        return self._v1_0.create_descriptor_pool(
            device,
            Ptr(to=create_info).bitcast[DescriptorPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=descriptor_pool).bitcast[DescriptorPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorPool.html
        """
        return self._v1_0.destroy_descriptor_pool(
            device,
            descriptor_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_descriptor_pool(
        self, device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetDescriptorPool.html
        """
        return self._v1_0.reset_descriptor_pool(device, descriptor_pool, flags)

    def allocate_descriptor_sets[p_descriptor_sets_origin: MutOrigin](
        self,
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateDescriptorSets.html
        """
        return self._v1_0.allocate_descriptor_sets(
            device,
            Ptr(to=allocate_info).bitcast[DescriptorSetAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, MutUntrackedOrigin]]()[],
        )

    def free_descriptor_sets[p_descriptor_sets_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeDescriptorSets.html
        """
        return self._v1_0.free_descriptor_sets(
            device,
            descriptor_pool,
            descriptor_set_count,
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def update_descriptor_sets[
        p_descriptor_writes_origin: ImmutOrigin, p_descriptor_copies_origin: ImmutOrigin
    ](
        self,
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, p_descriptor_writes_origin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, p_descriptor_copies_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSets.html
        """
        return self._v1_0.update_descriptor_sets(
            device,
            descriptor_write_count,
            Ptr(to=p_descriptor_writes).bitcast[Ptr[WriteDescriptorSet, ImmutUntrackedOrigin]]()[],
            descriptor_copy_count,
            Ptr(to=p_descriptor_copies).bitcast[Ptr[CopyDescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def cmd_bind_pipeline(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipeline.html
        """
        return self._v1_0.cmd_bind_pipeline(command_buffer, pipeline_bind_point, pipeline)

    def cmd_bind_descriptor_sets[
        p_descriptor_sets_origin: ImmutOrigin, p_dynamic_offsets_origin: ImmutOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, p_dynamic_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorSets.html
        """
        return self._v1_0.cmd_bind_descriptor_sets(
            command_buffer,
            pipeline_bind_point,
            layout,
            first_set,
            descriptor_set_count,
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, ImmutUntrackedOrigin]]()[],
            dynamic_offset_count,
            Ptr(to=p_dynamic_offsets).bitcast[Ptr[UInt32, ImmutUntrackedOrigin]]()[],
        )

    def cmd_clear_color_image[p_ranges_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, p_ranges_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html
        """
        return self._v1_0.cmd_clear_color_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=color).bitcast[ClearColorValue]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            range_count,
            Ptr(to=p_ranges).bitcast[Ptr[ImageSubresourceRange, ImmutUntrackedOrigin]]()[],
        )

    def cmd_dispatch(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatch.html
        """
        return self._v1_0.cmd_dispatch(command_buffer, group_count_x, group_count_y, group_count_z)

    def cmd_dispatch_indirect(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchIndirect.html
        """
        return self._v1_0.cmd_dispatch_indirect(command_buffer, buffer, offset)

    def cmd_set_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent.html
        """
        return self._v1_0.cmd_set_event(command_buffer, event, stage_mask)

    def cmd_reset_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent.html
        """
        return self._v1_0.cmd_reset_event(command_buffer, event, stage_mask)

    def cmd_wait_events[
        p_events_origin: ImmutOrigin,
        p_memory_barriers_origin: ImmutOrigin,
        p_buffer_memory_barriers_origin: ImmutOrigin,
        p_image_memory_barriers_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, p_events_origin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, p_memory_barriers_origin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, p_buffer_memory_barriers_origin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, p_image_memory_barriers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents.html
        """
        return self._v1_0.cmd_wait_events(
            command_buffer,
            event_count,
            Ptr(to=p_events).bitcast[Ptr[Event, ImmutUntrackedOrigin]]()[],
            src_stage_mask,
            dst_stage_mask,
            memory_barrier_count,
            Ptr(to=p_memory_barriers).bitcast[Ptr[MemoryBarrier, ImmutUntrackedOrigin]]()[],
            buffer_memory_barrier_count,
            Ptr(to=p_buffer_memory_barriers).bitcast[Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin]]()[],
            image_memory_barrier_count,
            Ptr(to=p_image_memory_barriers).bitcast[Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin]]()[],
        )

    def cmd_push_constants[p_values_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, p_values_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants.html
        """
        return self._v1_0.cmd_push_constants(
            command_buffer,
            layout,
            stage_flags,
            offset,
            size,
            Ptr(to=p_values).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def create_graphics_pipelines[
        p_create_infos_origin: ImmutOrigin,
        p_allocator_origin: ImmutOrigin,
        p_pipelines_origin: MutOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateGraphicsPipelines.html
        """
        return self._v1_0.create_graphics_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[GraphicsPipelineCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def create_framebuffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut framebuffer: Framebuffer,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFramebuffer.html
        """
        return self._v1_0.create_framebuffer(
            device,
            Ptr(to=create_info).bitcast[FramebufferCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=framebuffer).bitcast[Framebuffer]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_framebuffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFramebuffer.html
        """
        return self._v1_0.destroy_framebuffer(
            device,
            framebuffer,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_render_pass[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass.html
        """
        return self._v1_0.create_render_pass(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=render_pass).bitcast[RenderPass]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_render_pass[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        render_pass: RenderPass,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyRenderPass.html
        """
        return self._v1_0.destroy_render_pass(
            device,
            render_pass,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_render_area_granularity(
        self, device: Device, render_pass: RenderPass, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderAreaGranularity.html
        """
        return self._v1_0.get_render_area_granularity(
            device,
            render_pass,
            Ptr(to=granularity).bitcast[Extent2D]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_set_viewport[p_viewports_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewport.html
        """
        return self._v1_0.cmd_set_viewport(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_scissor[p_scissors_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissor.html
        """
        return self._v1_0.cmd_set_scissor(
            command_buffer,
            first_scissor,
            scissor_count,
            Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_line_width(self, command_buffer: CommandBuffer, line_width: Float32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineWidth.html
        """
        return self._v1_0.cmd_set_line_width(command_buffer, line_width)

    def cmd_set_depth_bias(
        self,
        command_buffer: CommandBuffer,
        depth_bias_constant_factor: Float32,
        depth_bias_clamp: Float32,
        depth_bias_slope_factor: Float32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBias.html
        """
        return self._v1_0.cmd_set_depth_bias(
            command_buffer, depth_bias_constant_factor, depth_bias_clamp, depth_bias_slope_factor
        )

    def cmd_set_blend_constants(
        self, command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetBlendConstants.html
        """
        return self._v1_0.cmd_set_blend_constants(command_buffer, blend_constants)

    def cmd_set_depth_bounds(
        self, command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBounds.html
        """
        return self._v1_0.cmd_set_depth_bounds(command_buffer, min_depth_bounds, max_depth_bounds)

    def cmd_set_stencil_compare_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilCompareMask.html
        """
        return self._v1_0.cmd_set_stencil_compare_mask(command_buffer, face_mask, compare_mask)

    def cmd_set_stencil_write_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilWriteMask.html
        """
        return self._v1_0.cmd_set_stencil_write_mask(command_buffer, face_mask, write_mask)

    def cmd_set_stencil_reference(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilReference.html
        """
        return self._v1_0.cmd_set_stencil_reference(command_buffer, face_mask, reference)

    def cmd_bind_index_buffer(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        index_type: IndexType,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindIndexBuffer.html
        """
        return self._v1_0.cmd_bind_index_buffer(command_buffer, buffer, offset, index_type)

    def cmd_bind_vertex_buffers[p_buffers_origin: ImmutOrigin, p_offsets_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers.html
        """
        return self._v1_0.cmd_bind_vertex_buffers(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
        )

    def cmd_draw(
        self,
        command_buffer: CommandBuffer,
        vertex_count: UInt32,
        instance_count: UInt32,
        first_vertex: UInt32,
        first_instance: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDraw.html
        """
        return self._v1_0.cmd_draw(
            command_buffer, vertex_count, instance_count, first_vertex, first_instance
        )

    def cmd_draw_indexed(
        self,
        command_buffer: CommandBuffer,
        index_count: UInt32,
        instance_count: UInt32,
        first_index: UInt32,
        vertex_offset: Int32,
        first_instance: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexed.html
        """
        return self._v1_0.cmd_draw_indexed(
            command_buffer, index_count, instance_count, first_index, vertex_offset, first_instance
        )

    def cmd_draw_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirect.html
        """
        return self._v1_0.cmd_draw_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_draw_indexed_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirect.html
        """
        return self._v1_0.cmd_draw_indexed_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_blit_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, p_regions_origin],
        filter: Filter,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage.html
        """
        return self._v1_0.cmd_blit_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageBlit, ImmutUntrackedOrigin]]()[],
            filter,
        )

    def cmd_clear_depth_stencil_image[p_ranges_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, p_ranges_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearDepthStencilImage.html
        """
        return self._v1_0.cmd_clear_depth_stencil_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=depth_stencil).bitcast[ClearDepthStencilValue]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            range_count,
            Ptr(to=p_ranges).bitcast[Ptr[ImageSubresourceRange, ImmutUntrackedOrigin]]()[],
        )

    def cmd_clear_attachments[p_attachments_origin: ImmutOrigin, p_rects_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, p_attachments_origin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, p_rects_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearAttachments.html
        """
        return self._v1_0.cmd_clear_attachments(
            command_buffer,
            attachment_count,
            Ptr(to=p_attachments).bitcast[Ptr[ClearAttachment, ImmutUntrackedOrigin]]()[],
            rect_count,
            Ptr(to=p_rects).bitcast[Ptr[ClearRect, ImmutUntrackedOrigin]]()[],
        )

    def cmd_resolve_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage.html
        """
        return self._v1_0.cmd_resolve_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageResolve, ImmutUntrackedOrigin]]()[],
        )

    def cmd_begin_render_pass(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass.html
        """
        return self._v1_0.cmd_begin_render_pass(
            command_buffer,
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            contents,
        )

    def cmd_next_subpass(self, command_buffer: CommandBuffer, contents: SubpassContents):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass.html
        """
        return self._v1_0.cmd_next_subpass(command_buffer, contents)

    def cmd_end_render_pass(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass.html
        """
        return self._v1_0.cmd_end_render_pass(command_buffer)


struct DeviceFunctionsV1_1(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: DeviceFunctionsAdditionsV1_0
    var _v1_1: DeviceFunctionsAdditionsV1_1

    def __init__(out self, global_functions: GlobalFunctionsV1_1, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = DeviceFunctionsAdditionsV1_0(self._dlhandle, device)
        self._v1_1 = DeviceFunctionsAdditionsV1_1(self._dlhandle, device)

    def get_device_proc_addr[p_name_origin: ImmutOrigin](
        self, device: Device, p_name: CStringSlice[p_name_origin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceProcAddr.html
        """
        return self._v1_0.get_device_proc_addr(
            device, Ptr(to=p_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[]
        )

    def destroy_device[p_allocator_origin: ImmutOrigin](
        self, device: Device, p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDevice.html
        """
        return self._v1_0.destroy_device(
            device,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_device_queue(
        self, device: Device, queue_family_index: UInt32, queue_index: UInt32, mut queue: Queue
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue.html
        """
        return self._v1_0.get_device_queue(
            device,
            queue_family_index,
            queue_index,
            Ptr(to=queue).bitcast[Queue]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def queue_submit[p_submits_origin: ImmutOrigin](
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, p_submits_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit.html
        """
        return self._v1_0.queue_submit(
            queue, submit_count, Ptr(to=p_submits).bitcast[Ptr[SubmitInfo, ImmutUntrackedOrigin]]()[], fence
        )

    def queue_wait_idle(self, queue: Queue) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueWaitIdle.html
        """
        return self._v1_0.queue_wait_idle(queue)

    def device_wait_idle(self, device: Device) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeviceWaitIdle.html
        """
        return self._v1_0.device_wait_idle(device)

    def allocate_memory[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut memory: DeviceMemory,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateMemory.html
        """
        return self._v1_0.allocate_memory(
            device,
            Ptr(to=allocate_info).bitcast[MemoryAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=memory).bitcast[DeviceMemory]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def free_memory[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        memory: DeviceMemory,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeMemory.html
        """
        return self._v1_0.free_memory(
            device,
            memory,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def map_memory[p_data_origin: MutOrigin](
        self,
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        mut p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMapMemory.html
        """
        return self._v1_0.map_memory(
            device,
            memory,
            offset,
            size,
            flags,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def unmap_memory(self, device: Device, memory: DeviceMemory):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory.html
        """
        return self._v1_0.unmap_memory(device, memory)

    def flush_mapped_memory_ranges[p_memory_ranges_origin: ImmutOrigin](
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, p_memory_ranges_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFlushMappedMemoryRanges.html
        """
        return self._v1_0.flush_mapped_memory_ranges(
            device,
            memory_range_count,
            Ptr(to=p_memory_ranges).bitcast[Ptr[MappedMemoryRange, ImmutUntrackedOrigin]]()[],
        )

    def invalidate_mapped_memory_ranges[p_memory_ranges_origin: ImmutOrigin](
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, p_memory_ranges_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInvalidateMappedMemoryRanges.html
        """
        return self._v1_0.invalidate_mapped_memory_ranges(
            device,
            memory_range_count,
            Ptr(to=p_memory_ranges).bitcast[Ptr[MappedMemoryRange, ImmutUntrackedOrigin]]()[],
        )

    def get_device_memory_commitment(
        self, device: Device, memory: DeviceMemory, mut committed_memory_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryCommitment.html
        """
        return self._v1_0.get_device_memory_commitment(
            device,
            memory,
            Ptr(to=committed_memory_in_bytes).bitcast[DeviceSize]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def bind_buffer_memory(
        self, device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory.html
        """
        return self._v1_0.bind_buffer_memory(device, buffer, memory, memory_offset)

    def bind_image_memory(
        self, device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory.html
        """
        return self._v1_0.bind_image_memory(device, image, memory, memory_offset)

    def get_buffer_memory_requirements(
        self, device: Device, buffer: Buffer, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements.html
        """
        return self._v1_0.get_buffer_memory_requirements(
            device,
            buffer,
            Ptr(to=memory_requirements).bitcast[MemoryRequirements]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_memory_requirements(
        self, device: Device, image: Image, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements.html
        """
        return self._v1_0.get_image_memory_requirements(
            device,
            image,
            Ptr(to=memory_requirements).bitcast[MemoryRequirements]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        image: Image,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        return self._v1_0.get_image_sparse_memory_requirements(
            device,
            image,
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin]]]()[],
        )

    def get_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, image: Image
    ) -> List[SparseImageMemoryRequirements]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements]()
        var count: UInt32 = 0
        self._v1_0.get_image_sparse_memory_requirements(
    device,
    image,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_image_sparse_memory_requirements(
    device,
    image,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def queue_bind_sparse[p_bind_info_origin: ImmutOrigin](
        self,
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, p_bind_info_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBindSparse.html
        """
        return self._v1_0.queue_bind_sparse(
            queue,
            bind_info_count,
            Ptr(to=p_bind_info).bitcast[Ptr[BindSparseInfo, ImmutUntrackedOrigin]]()[],
            fence,
        )

    def create_fence[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFence.html
        """
        return self._v1_0.create_fence(
            device,
            Ptr(to=create_info).bitcast[FenceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=fence).bitcast[Fence]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_fence[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        fence: Fence,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFence.html
        """
        return self._v1_0.destroy_fence(
            device,
            fence,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_fences[p_fences_origin: ImmutOrigin](
        self, device: Device, fence_count: UInt32, p_fences: Ptr[Fence, p_fences_origin]
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetFences.html
        """
        return self._v1_0.reset_fences(
            device, fence_count, Ptr(to=p_fences).bitcast[Ptr[Fence, ImmutUntrackedOrigin]]()[]
        )

    def get_fence_status(self, device: Device, fence: Fence) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceStatus.html
        """
        return self._v1_0.get_fence_status(device, fence)

    def wait_for_fences[p_fences_origin: ImmutOrigin](
        self,
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, p_fences_origin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForFences.html
        """
        return self._v1_0.wait_for_fences(
            device,
            fence_count,
            Ptr(to=p_fences).bitcast[Ptr[Fence, ImmutUntrackedOrigin]]()[],
            wait_all,
            timeout,
        )

    def create_semaphore[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut semaphore: Semaphore,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSemaphore.html
        """
        return self._v1_0.create_semaphore(
            device,
            Ptr(to=create_info).bitcast[SemaphoreCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=semaphore).bitcast[Semaphore]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_semaphore[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        semaphore: Semaphore,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySemaphore.html
        """
        return self._v1_0.destroy_semaphore(
            device,
            semaphore,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_query_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut query_pool: QueryPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateQueryPool.html
        """
        return self._v1_0.create_query_pool(
            device,
            Ptr(to=create_info).bitcast[QueryPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=query_pool).bitcast[QueryPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_query_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        query_pool: QueryPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyQueryPool.html
        """
        return self._v1_0.destroy_query_pool(
            device,
            query_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_query_pool_results[p_data_origin: MutOrigin](
        self,
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueryPoolResults.html
        """
        return self._v1_0.get_query_pool_results(
            device,
            query_pool,
            first_query,
            query_count,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
            stride,
            flags,
        )

    def create_buffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut buffer: Buffer,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBuffer.html
        """
        return self._v1_0.create_buffer(
            device,
            Ptr(to=create_info).bitcast[BufferCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=buffer).bitcast[Buffer]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_buffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        buffer: Buffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBuffer.html
        """
        return self._v1_0.destroy_buffer(
            device,
            buffer,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_image[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut image: Image,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImage.html
        """
        return self._v1_0.create_image(
            device,
            Ptr(to=create_info).bitcast[ImageCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=image).bitcast[Image]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_image[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        image: Image,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImage.html
        """
        return self._v1_0.destroy_image(
            device,
            image,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_image_subresource_layout(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource,
        mut layout: SubresourceLayout,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout.html
        """
        return self._v1_0.get_image_subresource_layout(
            device,
            image,
            Ptr(to=subresource).bitcast[ImageSubresource]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=layout).bitcast[SubresourceLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def create_image_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: ImageView,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImageView.html
        """
        return self._v1_0.create_image_view(
            device,
            Ptr(to=create_info).bitcast[ImageViewCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[ImageView]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_image_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        image_view: ImageView,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImageView.html
        """
        return self._v1_0.destroy_image_view(
            device,
            image_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_command_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut command_pool: CommandPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCommandPool.html
        """
        return self._v1_0.create_command_pool(
            device,
            Ptr(to=create_info).bitcast[CommandPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=command_pool).bitcast[CommandPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_command_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        command_pool: CommandPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCommandPool.html
        """
        return self._v1_0.destroy_command_pool(
            device,
            command_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandPool.html
        """
        return self._v1_0.reset_command_pool(device, command_pool, flags)

    def allocate_command_buffers[p_command_buffers_origin: MutOrigin](
        self,
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateCommandBuffers.html
        """
        return self._v1_0.allocate_command_buffers(
            device,
            Ptr(to=allocate_info).bitcast[CommandBufferAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, MutUntrackedOrigin]]()[],
        )

    def free_command_buffers[p_command_buffers_origin: ImmutOrigin](
        self,
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeCommandBuffers.html
        """
        return self._v1_0.free_command_buffers(
            device,
            command_pool,
            command_buffer_count,
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, ImmutUntrackedOrigin]]()[],
        )

    def begin_command_buffer(
        self, command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBeginCommandBuffer.html
        """
        return self._v1_0.begin_command_buffer(
            command_buffer,
            Ptr(to=begin_info).bitcast[CommandBufferBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def end_command_buffer(self, command_buffer: CommandBuffer) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEndCommandBuffer.html
        """
        return self._v1_0.end_command_buffer(command_buffer)

    def reset_command_buffer(
        self, command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandBuffer.html
        """
        return self._v1_0.reset_command_buffer(command_buffer, flags)

    def cmd_copy_buffer[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer.html
        """
        return self._v1_0.cmd_copy_buffer(
            command_buffer,
            src_buffer,
            dst_buffer,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage.html
        """
        return self._v1_0.cmd_copy_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_buffer_to_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html
        """
        return self._v1_0.cmd_copy_buffer_to_image(
            command_buffer,
            src_buffer,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_image_to_buffer[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer.html
        """
        return self._v1_0.cmd_copy_image_to_buffer(
            command_buffer,
            src_image,
            src_image_layout,
            dst_buffer,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_update_buffer[p_data_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdateBuffer.html
        """
        return self._v1_0.cmd_update_buffer(
            command_buffer,
            dst_buffer,
            dst_offset,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def cmd_fill_buffer(
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        size: DeviceSize,
        data: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdFillBuffer.html
        """
        return self._v1_0.cmd_fill_buffer(command_buffer, dst_buffer, dst_offset, size, data)

    def cmd_pipeline_barrier[
        p_memory_barriers_origin: ImmutOrigin,
        p_buffer_memory_barriers_origin: ImmutOrigin,
        p_image_memory_barriers_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, p_memory_barriers_origin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, p_buffer_memory_barriers_origin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, p_image_memory_barriers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier.html
        """
        return self._v1_0.cmd_pipeline_barrier(
            command_buffer,
            src_stage_mask,
            dst_stage_mask,
            dependency_flags,
            memory_barrier_count,
            Ptr(to=p_memory_barriers).bitcast[Ptr[MemoryBarrier, ImmutUntrackedOrigin]]()[],
            buffer_memory_barrier_count,
            Ptr(to=p_buffer_memory_barriers).bitcast[Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin]]()[],
            image_memory_barrier_count,
            Ptr(to=p_image_memory_barriers).bitcast[Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin]]()[],
        )

    def cmd_begin_query(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginQuery.html
        """
        return self._v1_0.cmd_begin_query(command_buffer, query_pool, query, flags)

    def cmd_end_query(self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQuery.html
        """
        return self._v1_0.cmd_end_query(command_buffer, query_pool, query)

    def cmd_reset_query_pool(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetQueryPool.html
        """
        return self._v1_0.cmd_reset_query_pool(command_buffer, query_pool, first_query, query_count)

    def cmd_write_timestamp(
        self,
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        query_pool: QueryPool,
        query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteTimestamp.html
        """
        return self._v1_0.cmd_write_timestamp(command_buffer, pipeline_stage, query_pool, query)

    def cmd_copy_query_pool_results(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        stride: DeviceSize,
        flags: QueryResultFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyQueryPoolResults.html
        """
        return self._v1_0.cmd_copy_query_pool_results(
            command_buffer, query_pool, first_query, query_count, dst_buffer, dst_offset, stride, flags
        )

    def cmd_execute_commands[p_command_buffers_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteCommands.html
        """
        return self._v1_0.cmd_execute_commands(
            command_buffer,
            command_buffer_count,
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, ImmutUntrackedOrigin]]()[],
        )

    def create_event[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut event: Event,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateEvent.html
        """
        return self._v1_0.create_event(
            device,
            Ptr(to=create_info).bitcast[EventCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=event).bitcast[Event]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_event[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        event: Event,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyEvent.html
        """
        return self._v1_0.destroy_event(
            device,
            event,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_event_status(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEventStatus.html
        """
        return self._v1_0.get_event_status(device, event)

    def set_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetEvent.html
        """
        return self._v1_0.set_event(device, event)

    def reset_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetEvent.html
        """
        return self._v1_0.reset_event(device, event)

    def create_buffer_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: BufferView,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferView.html
        """
        return self._v1_0.create_buffer_view(
            device,
            Ptr(to=create_info).bitcast[BufferViewCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[BufferView]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_buffer_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        buffer_view: BufferView,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferView.html
        """
        return self._v1_0.destroy_buffer_view(
            device,
            buffer_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_shader_module[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut shader_module: ShaderModule,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShaderModule.html
        """
        return self._v1_0.create_shader_module(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=shader_module).bitcast[ShaderModule]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_shader_module[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderModule.html
        """
        return self._v1_0.destroy_shader_module(
            device,
            shader_module,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_pipeline_cache[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut pipeline_cache: PipelineCache,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineCache.html
        """
        return self._v1_0.create_pipeline_cache(
            device,
            Ptr(to=create_info).bitcast[PipelineCacheCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=pipeline_cache).bitcast[PipelineCache]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_pipeline_cache[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineCache.html
        """
        return self._v1_0.destroy_pipeline_cache(
            device,
            pipeline_cache,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_pipeline_cache_data[p_data_origin: MutOrigin](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        mut data_size: UInt,
        p_data: Optional[Ptr[NoneType, p_data_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        return self._v1_0.get_pipeline_cache_data(
            device,
            pipeline_cache,
            Ptr(to=data_size).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Optional[Ptr[NoneType, MutUntrackedOrigin]]]()[],
        )

    def get_pipeline_cache_data[p_data_origin: MutOrigin](
        self, device: Device, pipeline_cache: PipelineCache
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.get_pipeline_cache_data(
                device,
                pipeline_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[NoneType, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.get_pipeline_cache_data(
                device,
                pipeline_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().bitcast[NoneType]().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def merge_pipeline_caches[p_src_caches_origin: ImmutOrigin](
        self,
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, p_src_caches_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergePipelineCaches.html
        """
        return self._v1_0.merge_pipeline_caches(
            device,
            dst_cache,
            src_cache_count,
            Ptr(to=p_src_caches).bitcast[Ptr[PipelineCache, ImmutUntrackedOrigin]]()[],
        )

    def create_compute_pipelines[
        p_create_infos_origin: ImmutOrigin,
        p_allocator_origin: ImmutOrigin,
        p_pipelines_origin: MutOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateComputePipelines.html
        """
        return self._v1_0.create_compute_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[ComputePipelineCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def destroy_pipeline[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline: Pipeline,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipeline.html
        """
        return self._v1_0.destroy_pipeline(
            device,
            pipeline,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_pipeline_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut pipeline_layout: PipelineLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineLayout.html
        """
        return self._v1_0.create_pipeline_layout(
            device,
            Ptr(to=create_info).bitcast[PipelineLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=pipeline_layout).bitcast[PipelineLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_pipeline_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineLayout.html
        """
        return self._v1_0.destroy_pipeline_layout(
            device,
            pipeline_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_sampler[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut sampler: Sampler,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSampler.html
        """
        return self._v1_0.create_sampler(
            device,
            Ptr(to=create_info).bitcast[SamplerCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=sampler).bitcast[Sampler]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_sampler[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        sampler: Sampler,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySampler.html
        """
        return self._v1_0.destroy_sampler(
            device,
            sampler,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_descriptor_set_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut set_layout: DescriptorSetLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorSetLayout.html
        """
        return self._v1_0.create_descriptor_set_layout(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=set_layout).bitcast[DescriptorSetLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_set_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorSetLayout.html
        """
        return self._v1_0.destroy_descriptor_set_layout(
            device,
            descriptor_set_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_descriptor_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut descriptor_pool: DescriptorPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorPool.html
        """
        return self._v1_0.create_descriptor_pool(
            device,
            Ptr(to=create_info).bitcast[DescriptorPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=descriptor_pool).bitcast[DescriptorPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorPool.html
        """
        return self._v1_0.destroy_descriptor_pool(
            device,
            descriptor_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_descriptor_pool(
        self, device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetDescriptorPool.html
        """
        return self._v1_0.reset_descriptor_pool(device, descriptor_pool, flags)

    def allocate_descriptor_sets[p_descriptor_sets_origin: MutOrigin](
        self,
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateDescriptorSets.html
        """
        return self._v1_0.allocate_descriptor_sets(
            device,
            Ptr(to=allocate_info).bitcast[DescriptorSetAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, MutUntrackedOrigin]]()[],
        )

    def free_descriptor_sets[p_descriptor_sets_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeDescriptorSets.html
        """
        return self._v1_0.free_descriptor_sets(
            device,
            descriptor_pool,
            descriptor_set_count,
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def update_descriptor_sets[
        p_descriptor_writes_origin: ImmutOrigin, p_descriptor_copies_origin: ImmutOrigin
    ](
        self,
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, p_descriptor_writes_origin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, p_descriptor_copies_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSets.html
        """
        return self._v1_0.update_descriptor_sets(
            device,
            descriptor_write_count,
            Ptr(to=p_descriptor_writes).bitcast[Ptr[WriteDescriptorSet, ImmutUntrackedOrigin]]()[],
            descriptor_copy_count,
            Ptr(to=p_descriptor_copies).bitcast[Ptr[CopyDescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def cmd_bind_pipeline(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipeline.html
        """
        return self._v1_0.cmd_bind_pipeline(command_buffer, pipeline_bind_point, pipeline)

    def cmd_bind_descriptor_sets[
        p_descriptor_sets_origin: ImmutOrigin, p_dynamic_offsets_origin: ImmutOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, p_dynamic_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorSets.html
        """
        return self._v1_0.cmd_bind_descriptor_sets(
            command_buffer,
            pipeline_bind_point,
            layout,
            first_set,
            descriptor_set_count,
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, ImmutUntrackedOrigin]]()[],
            dynamic_offset_count,
            Ptr(to=p_dynamic_offsets).bitcast[Ptr[UInt32, ImmutUntrackedOrigin]]()[],
        )

    def cmd_clear_color_image[p_ranges_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, p_ranges_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html
        """
        return self._v1_0.cmd_clear_color_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=color).bitcast[ClearColorValue]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            range_count,
            Ptr(to=p_ranges).bitcast[Ptr[ImageSubresourceRange, ImmutUntrackedOrigin]]()[],
        )

    def cmd_dispatch(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatch.html
        """
        return self._v1_0.cmd_dispatch(command_buffer, group_count_x, group_count_y, group_count_z)

    def cmd_dispatch_indirect(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchIndirect.html
        """
        return self._v1_0.cmd_dispatch_indirect(command_buffer, buffer, offset)

    def cmd_set_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent.html
        """
        return self._v1_0.cmd_set_event(command_buffer, event, stage_mask)

    def cmd_reset_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent.html
        """
        return self._v1_0.cmd_reset_event(command_buffer, event, stage_mask)

    def cmd_wait_events[
        p_events_origin: ImmutOrigin,
        p_memory_barriers_origin: ImmutOrigin,
        p_buffer_memory_barriers_origin: ImmutOrigin,
        p_image_memory_barriers_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, p_events_origin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, p_memory_barriers_origin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, p_buffer_memory_barriers_origin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, p_image_memory_barriers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents.html
        """
        return self._v1_0.cmd_wait_events(
            command_buffer,
            event_count,
            Ptr(to=p_events).bitcast[Ptr[Event, ImmutUntrackedOrigin]]()[],
            src_stage_mask,
            dst_stage_mask,
            memory_barrier_count,
            Ptr(to=p_memory_barriers).bitcast[Ptr[MemoryBarrier, ImmutUntrackedOrigin]]()[],
            buffer_memory_barrier_count,
            Ptr(to=p_buffer_memory_barriers).bitcast[Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin]]()[],
            image_memory_barrier_count,
            Ptr(to=p_image_memory_barriers).bitcast[Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin]]()[],
        )

    def cmd_push_constants[p_values_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, p_values_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants.html
        """
        return self._v1_0.cmd_push_constants(
            command_buffer,
            layout,
            stage_flags,
            offset,
            size,
            Ptr(to=p_values).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def create_graphics_pipelines[
        p_create_infos_origin: ImmutOrigin,
        p_allocator_origin: ImmutOrigin,
        p_pipelines_origin: MutOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateGraphicsPipelines.html
        """
        return self._v1_0.create_graphics_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[GraphicsPipelineCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def create_framebuffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut framebuffer: Framebuffer,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFramebuffer.html
        """
        return self._v1_0.create_framebuffer(
            device,
            Ptr(to=create_info).bitcast[FramebufferCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=framebuffer).bitcast[Framebuffer]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_framebuffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFramebuffer.html
        """
        return self._v1_0.destroy_framebuffer(
            device,
            framebuffer,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_render_pass[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass.html
        """
        return self._v1_0.create_render_pass(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=render_pass).bitcast[RenderPass]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_render_pass[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        render_pass: RenderPass,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyRenderPass.html
        """
        return self._v1_0.destroy_render_pass(
            device,
            render_pass,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_render_area_granularity(
        self, device: Device, render_pass: RenderPass, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderAreaGranularity.html
        """
        return self._v1_0.get_render_area_granularity(
            device,
            render_pass,
            Ptr(to=granularity).bitcast[Extent2D]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_set_viewport[p_viewports_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewport.html
        """
        return self._v1_0.cmd_set_viewport(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_scissor[p_scissors_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissor.html
        """
        return self._v1_0.cmd_set_scissor(
            command_buffer,
            first_scissor,
            scissor_count,
            Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_line_width(self, command_buffer: CommandBuffer, line_width: Float32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineWidth.html
        """
        return self._v1_0.cmd_set_line_width(command_buffer, line_width)

    def cmd_set_depth_bias(
        self,
        command_buffer: CommandBuffer,
        depth_bias_constant_factor: Float32,
        depth_bias_clamp: Float32,
        depth_bias_slope_factor: Float32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBias.html
        """
        return self._v1_0.cmd_set_depth_bias(
            command_buffer, depth_bias_constant_factor, depth_bias_clamp, depth_bias_slope_factor
        )

    def cmd_set_blend_constants(
        self, command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetBlendConstants.html
        """
        return self._v1_0.cmd_set_blend_constants(command_buffer, blend_constants)

    def cmd_set_depth_bounds(
        self, command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBounds.html
        """
        return self._v1_0.cmd_set_depth_bounds(command_buffer, min_depth_bounds, max_depth_bounds)

    def cmd_set_stencil_compare_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilCompareMask.html
        """
        return self._v1_0.cmd_set_stencil_compare_mask(command_buffer, face_mask, compare_mask)

    def cmd_set_stencil_write_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilWriteMask.html
        """
        return self._v1_0.cmd_set_stencil_write_mask(command_buffer, face_mask, write_mask)

    def cmd_set_stencil_reference(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilReference.html
        """
        return self._v1_0.cmd_set_stencil_reference(command_buffer, face_mask, reference)

    def cmd_bind_index_buffer(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        index_type: IndexType,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindIndexBuffer.html
        """
        return self._v1_0.cmd_bind_index_buffer(command_buffer, buffer, offset, index_type)

    def cmd_bind_vertex_buffers[p_buffers_origin: ImmutOrigin, p_offsets_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers.html
        """
        return self._v1_0.cmd_bind_vertex_buffers(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
        )

    def cmd_draw(
        self,
        command_buffer: CommandBuffer,
        vertex_count: UInt32,
        instance_count: UInt32,
        first_vertex: UInt32,
        first_instance: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDraw.html
        """
        return self._v1_0.cmd_draw(
            command_buffer, vertex_count, instance_count, first_vertex, first_instance
        )

    def cmd_draw_indexed(
        self,
        command_buffer: CommandBuffer,
        index_count: UInt32,
        instance_count: UInt32,
        first_index: UInt32,
        vertex_offset: Int32,
        first_instance: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexed.html
        """
        return self._v1_0.cmd_draw_indexed(
            command_buffer, index_count, instance_count, first_index, vertex_offset, first_instance
        )

    def cmd_draw_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirect.html
        """
        return self._v1_0.cmd_draw_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_draw_indexed_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirect.html
        """
        return self._v1_0.cmd_draw_indexed_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_blit_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, p_regions_origin],
        filter: Filter,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage.html
        """
        return self._v1_0.cmd_blit_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageBlit, ImmutUntrackedOrigin]]()[],
            filter,
        )

    def cmd_clear_depth_stencil_image[p_ranges_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, p_ranges_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearDepthStencilImage.html
        """
        return self._v1_0.cmd_clear_depth_stencil_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=depth_stencil).bitcast[ClearDepthStencilValue]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            range_count,
            Ptr(to=p_ranges).bitcast[Ptr[ImageSubresourceRange, ImmutUntrackedOrigin]]()[],
        )

    def cmd_clear_attachments[p_attachments_origin: ImmutOrigin, p_rects_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, p_attachments_origin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, p_rects_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearAttachments.html
        """
        return self._v1_0.cmd_clear_attachments(
            command_buffer,
            attachment_count,
            Ptr(to=p_attachments).bitcast[Ptr[ClearAttachment, ImmutUntrackedOrigin]]()[],
            rect_count,
            Ptr(to=p_rects).bitcast[Ptr[ClearRect, ImmutUntrackedOrigin]]()[],
        )

    def cmd_resolve_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage.html
        """
        return self._v1_0.cmd_resolve_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageResolve, ImmutUntrackedOrigin]]()[],
        )

    def cmd_begin_render_pass(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass.html
        """
        return self._v1_0.cmd_begin_render_pass(
            command_buffer,
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            contents,
        )

    def cmd_next_subpass(self, command_buffer: CommandBuffer, contents: SubpassContents):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass.html
        """
        return self._v1_0.cmd_next_subpass(command_buffer, contents)

    def cmd_end_render_pass(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass.html
        """
        return self._v1_0.cmd_end_render_pass(command_buffer)

    def bind_buffer_memory_2[p_bind_infos_origin: ImmutOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory2.html
        """
        return self._v1_1.bind_buffer_memory_2(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindBufferMemoryInfo, ImmutUntrackedOrigin]]()[],
        )

    def bind_image_memory_2[p_bind_infos_origin: ImmutOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory2.html
        """
        return self._v1_1.bind_image_memory_2(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindImageMemoryInfo, ImmutUntrackedOrigin]]()[],
        )

    def get_device_group_peer_memory_features(
        self,
        device: Device,
        heap_index: UInt32,
        local_device_index: UInt32,
        remote_device_index: UInt32,
        mut peer_memory_features: PeerMemoryFeatureFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupPeerMemoryFeatures.html
        """
        return self._v1_1.get_device_group_peer_memory_features(
            device,
            heap_index,
            local_device_index,
            remote_device_index,
            Ptr(to=peer_memory_features).bitcast[PeerMemoryFeatureFlags]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_set_device_mask(self, command_buffer: CommandBuffer, device_mask: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDeviceMask.html
        """
        return self._v1_1.cmd_set_device_mask(command_buffer, device_mask)

    def get_image_memory_requirements_2(
        self,
        device: Device,
        info: ImageMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements2.html
        """
        return self._v1_1.get_image_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_buffer_memory_requirements_2(
        self,
        device: Device,
        info: BufferMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements2.html
        """
        return self._v1_1.get_buffer_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[BufferMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_sparse_memory_requirements_2[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements2, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        return self._v1_1.get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin]]]()[],
        )

    def get_image_sparse_memory_requirements_2[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, info: ImageSparseMemoryRequirementsInfo2
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self._v1_1.get_image_sparse_memory_requirements_2(
    device,
    Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_image_sparse_memory_requirements_2(
    device,
    Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTrimCommandPool.html
        """
        return self._v1_1.trim_command_pool(device, command_pool, flags)

    def get_device_queue_2(self, device: Device, queue_info: DeviceQueueInfo2, mut queue: Queue):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue2.html
        """
        return self._v1_1.get_device_queue_2(
            device,
            Ptr(to=queue_info).bitcast[DeviceQueueInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=queue).bitcast[Queue]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_dispatch_base(
        self,
        command_buffer: CommandBuffer,
        base_group_x: UInt32,
        base_group_y: UInt32,
        base_group_z: UInt32,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchBase.html
        """
        return self._v1_1.cmd_dispatch_base(
            command_buffer,
            base_group_x,
            base_group_y,
            base_group_z,
            group_count_x,
            group_count_y,
            group_count_z,
        )

    def create_descriptor_update_template[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorUpdateTemplate.html
        """
        return self._v1_1.create_descriptor_update_template(
            device,
            Ptr(to=create_info).bitcast[DescriptorUpdateTemplateCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=descriptor_update_template).bitcast[DescriptorUpdateTemplate]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_update_template[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorUpdateTemplate.html
        """
        return self._v1_1.destroy_descriptor_update_template(
            device,
            descriptor_update_template,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def update_descriptor_set_with_template[p_data_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._v1_1.update_descriptor_set_with_template(
            device,
            descriptor_set,
            descriptor_update_template,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def get_descriptor_set_layout_support(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        mut support: DescriptorSetLayoutSupport,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutSupport.html
        """
        return self._v1_1.get_descriptor_set_layout_support(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=support).bitcast[DescriptorSetLayoutSupport]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def create_sampler_ycbcr_conversion[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSamplerYcbcrConversion.html
        """
        return self._v1_1.create_sampler_ycbcr_conversion(
            device,
            Ptr(to=create_info).bitcast[SamplerYcbcrConversionCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=ycbcr_conversion).bitcast[SamplerYcbcrConversion]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_sampler_ycbcr_conversion[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySamplerYcbcrConversion.html
        """
        return self._v1_1.destroy_sampler_ycbcr_conversion(
            device,
            ycbcr_conversion,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )


struct DeviceFunctionsV1_2(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: DeviceFunctionsAdditionsV1_0
    var _v1_1: DeviceFunctionsAdditionsV1_1
    var _v1_2: DeviceFunctionsAdditionsV1_2

    def __init__(out self, global_functions: GlobalFunctionsV1_2, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = DeviceFunctionsAdditionsV1_0(self._dlhandle, device)
        self._v1_1 = DeviceFunctionsAdditionsV1_1(self._dlhandle, device)
        self._v1_2 = DeviceFunctionsAdditionsV1_2(self._dlhandle, device)

    def get_device_proc_addr[p_name_origin: ImmutOrigin](
        self, device: Device, p_name: CStringSlice[p_name_origin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceProcAddr.html
        """
        return self._v1_0.get_device_proc_addr(
            device, Ptr(to=p_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[]
        )

    def destroy_device[p_allocator_origin: ImmutOrigin](
        self, device: Device, p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDevice.html
        """
        return self._v1_0.destroy_device(
            device,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_device_queue(
        self, device: Device, queue_family_index: UInt32, queue_index: UInt32, mut queue: Queue
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue.html
        """
        return self._v1_0.get_device_queue(
            device,
            queue_family_index,
            queue_index,
            Ptr(to=queue).bitcast[Queue]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def queue_submit[p_submits_origin: ImmutOrigin](
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, p_submits_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit.html
        """
        return self._v1_0.queue_submit(
            queue, submit_count, Ptr(to=p_submits).bitcast[Ptr[SubmitInfo, ImmutUntrackedOrigin]]()[], fence
        )

    def queue_wait_idle(self, queue: Queue) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueWaitIdle.html
        """
        return self._v1_0.queue_wait_idle(queue)

    def device_wait_idle(self, device: Device) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeviceWaitIdle.html
        """
        return self._v1_0.device_wait_idle(device)

    def allocate_memory[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut memory: DeviceMemory,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateMemory.html
        """
        return self._v1_0.allocate_memory(
            device,
            Ptr(to=allocate_info).bitcast[MemoryAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=memory).bitcast[DeviceMemory]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def free_memory[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        memory: DeviceMemory,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeMemory.html
        """
        return self._v1_0.free_memory(
            device,
            memory,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def map_memory[p_data_origin: MutOrigin](
        self,
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        mut p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMapMemory.html
        """
        return self._v1_0.map_memory(
            device,
            memory,
            offset,
            size,
            flags,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def unmap_memory(self, device: Device, memory: DeviceMemory):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory.html
        """
        return self._v1_0.unmap_memory(device, memory)

    def flush_mapped_memory_ranges[p_memory_ranges_origin: ImmutOrigin](
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, p_memory_ranges_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFlushMappedMemoryRanges.html
        """
        return self._v1_0.flush_mapped_memory_ranges(
            device,
            memory_range_count,
            Ptr(to=p_memory_ranges).bitcast[Ptr[MappedMemoryRange, ImmutUntrackedOrigin]]()[],
        )

    def invalidate_mapped_memory_ranges[p_memory_ranges_origin: ImmutOrigin](
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, p_memory_ranges_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInvalidateMappedMemoryRanges.html
        """
        return self._v1_0.invalidate_mapped_memory_ranges(
            device,
            memory_range_count,
            Ptr(to=p_memory_ranges).bitcast[Ptr[MappedMemoryRange, ImmutUntrackedOrigin]]()[],
        )

    def get_device_memory_commitment(
        self, device: Device, memory: DeviceMemory, mut committed_memory_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryCommitment.html
        """
        return self._v1_0.get_device_memory_commitment(
            device,
            memory,
            Ptr(to=committed_memory_in_bytes).bitcast[DeviceSize]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def bind_buffer_memory(
        self, device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory.html
        """
        return self._v1_0.bind_buffer_memory(device, buffer, memory, memory_offset)

    def bind_image_memory(
        self, device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory.html
        """
        return self._v1_0.bind_image_memory(device, image, memory, memory_offset)

    def get_buffer_memory_requirements(
        self, device: Device, buffer: Buffer, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements.html
        """
        return self._v1_0.get_buffer_memory_requirements(
            device,
            buffer,
            Ptr(to=memory_requirements).bitcast[MemoryRequirements]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_memory_requirements(
        self, device: Device, image: Image, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements.html
        """
        return self._v1_0.get_image_memory_requirements(
            device,
            image,
            Ptr(to=memory_requirements).bitcast[MemoryRequirements]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        image: Image,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        return self._v1_0.get_image_sparse_memory_requirements(
            device,
            image,
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin]]]()[],
        )

    def get_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, image: Image
    ) -> List[SparseImageMemoryRequirements]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements]()
        var count: UInt32 = 0
        self._v1_0.get_image_sparse_memory_requirements(
    device,
    image,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_image_sparse_memory_requirements(
    device,
    image,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def queue_bind_sparse[p_bind_info_origin: ImmutOrigin](
        self,
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, p_bind_info_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBindSparse.html
        """
        return self._v1_0.queue_bind_sparse(
            queue,
            bind_info_count,
            Ptr(to=p_bind_info).bitcast[Ptr[BindSparseInfo, ImmutUntrackedOrigin]]()[],
            fence,
        )

    def create_fence[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFence.html
        """
        return self._v1_0.create_fence(
            device,
            Ptr(to=create_info).bitcast[FenceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=fence).bitcast[Fence]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_fence[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        fence: Fence,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFence.html
        """
        return self._v1_0.destroy_fence(
            device,
            fence,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_fences[p_fences_origin: ImmutOrigin](
        self, device: Device, fence_count: UInt32, p_fences: Ptr[Fence, p_fences_origin]
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetFences.html
        """
        return self._v1_0.reset_fences(
            device, fence_count, Ptr(to=p_fences).bitcast[Ptr[Fence, ImmutUntrackedOrigin]]()[]
        )

    def get_fence_status(self, device: Device, fence: Fence) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceStatus.html
        """
        return self._v1_0.get_fence_status(device, fence)

    def wait_for_fences[p_fences_origin: ImmutOrigin](
        self,
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, p_fences_origin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForFences.html
        """
        return self._v1_0.wait_for_fences(
            device,
            fence_count,
            Ptr(to=p_fences).bitcast[Ptr[Fence, ImmutUntrackedOrigin]]()[],
            wait_all,
            timeout,
        )

    def create_semaphore[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut semaphore: Semaphore,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSemaphore.html
        """
        return self._v1_0.create_semaphore(
            device,
            Ptr(to=create_info).bitcast[SemaphoreCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=semaphore).bitcast[Semaphore]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_semaphore[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        semaphore: Semaphore,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySemaphore.html
        """
        return self._v1_0.destroy_semaphore(
            device,
            semaphore,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_query_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut query_pool: QueryPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateQueryPool.html
        """
        return self._v1_0.create_query_pool(
            device,
            Ptr(to=create_info).bitcast[QueryPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=query_pool).bitcast[QueryPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_query_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        query_pool: QueryPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyQueryPool.html
        """
        return self._v1_0.destroy_query_pool(
            device,
            query_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_query_pool_results[p_data_origin: MutOrigin](
        self,
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueryPoolResults.html
        """
        return self._v1_0.get_query_pool_results(
            device,
            query_pool,
            first_query,
            query_count,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
            stride,
            flags,
        )

    def create_buffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut buffer: Buffer,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBuffer.html
        """
        return self._v1_0.create_buffer(
            device,
            Ptr(to=create_info).bitcast[BufferCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=buffer).bitcast[Buffer]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_buffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        buffer: Buffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBuffer.html
        """
        return self._v1_0.destroy_buffer(
            device,
            buffer,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_image[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut image: Image,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImage.html
        """
        return self._v1_0.create_image(
            device,
            Ptr(to=create_info).bitcast[ImageCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=image).bitcast[Image]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_image[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        image: Image,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImage.html
        """
        return self._v1_0.destroy_image(
            device,
            image,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_image_subresource_layout(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource,
        mut layout: SubresourceLayout,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout.html
        """
        return self._v1_0.get_image_subresource_layout(
            device,
            image,
            Ptr(to=subresource).bitcast[ImageSubresource]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=layout).bitcast[SubresourceLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def create_image_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: ImageView,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImageView.html
        """
        return self._v1_0.create_image_view(
            device,
            Ptr(to=create_info).bitcast[ImageViewCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[ImageView]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_image_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        image_view: ImageView,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImageView.html
        """
        return self._v1_0.destroy_image_view(
            device,
            image_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_command_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut command_pool: CommandPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCommandPool.html
        """
        return self._v1_0.create_command_pool(
            device,
            Ptr(to=create_info).bitcast[CommandPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=command_pool).bitcast[CommandPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_command_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        command_pool: CommandPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCommandPool.html
        """
        return self._v1_0.destroy_command_pool(
            device,
            command_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandPool.html
        """
        return self._v1_0.reset_command_pool(device, command_pool, flags)

    def allocate_command_buffers[p_command_buffers_origin: MutOrigin](
        self,
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateCommandBuffers.html
        """
        return self._v1_0.allocate_command_buffers(
            device,
            Ptr(to=allocate_info).bitcast[CommandBufferAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, MutUntrackedOrigin]]()[],
        )

    def free_command_buffers[p_command_buffers_origin: ImmutOrigin](
        self,
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeCommandBuffers.html
        """
        return self._v1_0.free_command_buffers(
            device,
            command_pool,
            command_buffer_count,
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, ImmutUntrackedOrigin]]()[],
        )

    def begin_command_buffer(
        self, command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBeginCommandBuffer.html
        """
        return self._v1_0.begin_command_buffer(
            command_buffer,
            Ptr(to=begin_info).bitcast[CommandBufferBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def end_command_buffer(self, command_buffer: CommandBuffer) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEndCommandBuffer.html
        """
        return self._v1_0.end_command_buffer(command_buffer)

    def reset_command_buffer(
        self, command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandBuffer.html
        """
        return self._v1_0.reset_command_buffer(command_buffer, flags)

    def cmd_copy_buffer[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer.html
        """
        return self._v1_0.cmd_copy_buffer(
            command_buffer,
            src_buffer,
            dst_buffer,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage.html
        """
        return self._v1_0.cmd_copy_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_buffer_to_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html
        """
        return self._v1_0.cmd_copy_buffer_to_image(
            command_buffer,
            src_buffer,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_image_to_buffer[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer.html
        """
        return self._v1_0.cmd_copy_image_to_buffer(
            command_buffer,
            src_image,
            src_image_layout,
            dst_buffer,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_update_buffer[p_data_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdateBuffer.html
        """
        return self._v1_0.cmd_update_buffer(
            command_buffer,
            dst_buffer,
            dst_offset,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def cmd_fill_buffer(
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        size: DeviceSize,
        data: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdFillBuffer.html
        """
        return self._v1_0.cmd_fill_buffer(command_buffer, dst_buffer, dst_offset, size, data)

    def cmd_pipeline_barrier[
        p_memory_barriers_origin: ImmutOrigin,
        p_buffer_memory_barriers_origin: ImmutOrigin,
        p_image_memory_barriers_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, p_memory_barriers_origin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, p_buffer_memory_barriers_origin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, p_image_memory_barriers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier.html
        """
        return self._v1_0.cmd_pipeline_barrier(
            command_buffer,
            src_stage_mask,
            dst_stage_mask,
            dependency_flags,
            memory_barrier_count,
            Ptr(to=p_memory_barriers).bitcast[Ptr[MemoryBarrier, ImmutUntrackedOrigin]]()[],
            buffer_memory_barrier_count,
            Ptr(to=p_buffer_memory_barriers).bitcast[Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin]]()[],
            image_memory_barrier_count,
            Ptr(to=p_image_memory_barriers).bitcast[Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin]]()[],
        )

    def cmd_begin_query(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginQuery.html
        """
        return self._v1_0.cmd_begin_query(command_buffer, query_pool, query, flags)

    def cmd_end_query(self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQuery.html
        """
        return self._v1_0.cmd_end_query(command_buffer, query_pool, query)

    def cmd_reset_query_pool(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetQueryPool.html
        """
        return self._v1_0.cmd_reset_query_pool(command_buffer, query_pool, first_query, query_count)

    def cmd_write_timestamp(
        self,
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        query_pool: QueryPool,
        query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteTimestamp.html
        """
        return self._v1_0.cmd_write_timestamp(command_buffer, pipeline_stage, query_pool, query)

    def cmd_copy_query_pool_results(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        stride: DeviceSize,
        flags: QueryResultFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyQueryPoolResults.html
        """
        return self._v1_0.cmd_copy_query_pool_results(
            command_buffer, query_pool, first_query, query_count, dst_buffer, dst_offset, stride, flags
        )

    def cmd_execute_commands[p_command_buffers_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteCommands.html
        """
        return self._v1_0.cmd_execute_commands(
            command_buffer,
            command_buffer_count,
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, ImmutUntrackedOrigin]]()[],
        )

    def create_event[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut event: Event,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateEvent.html
        """
        return self._v1_0.create_event(
            device,
            Ptr(to=create_info).bitcast[EventCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=event).bitcast[Event]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_event[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        event: Event,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyEvent.html
        """
        return self._v1_0.destroy_event(
            device,
            event,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_event_status(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEventStatus.html
        """
        return self._v1_0.get_event_status(device, event)

    def set_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetEvent.html
        """
        return self._v1_0.set_event(device, event)

    def reset_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetEvent.html
        """
        return self._v1_0.reset_event(device, event)

    def create_buffer_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: BufferView,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferView.html
        """
        return self._v1_0.create_buffer_view(
            device,
            Ptr(to=create_info).bitcast[BufferViewCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[BufferView]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_buffer_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        buffer_view: BufferView,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferView.html
        """
        return self._v1_0.destroy_buffer_view(
            device,
            buffer_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_shader_module[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut shader_module: ShaderModule,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShaderModule.html
        """
        return self._v1_0.create_shader_module(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=shader_module).bitcast[ShaderModule]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_shader_module[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderModule.html
        """
        return self._v1_0.destroy_shader_module(
            device,
            shader_module,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_pipeline_cache[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut pipeline_cache: PipelineCache,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineCache.html
        """
        return self._v1_0.create_pipeline_cache(
            device,
            Ptr(to=create_info).bitcast[PipelineCacheCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=pipeline_cache).bitcast[PipelineCache]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_pipeline_cache[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineCache.html
        """
        return self._v1_0.destroy_pipeline_cache(
            device,
            pipeline_cache,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_pipeline_cache_data[p_data_origin: MutOrigin](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        mut data_size: UInt,
        p_data: Optional[Ptr[NoneType, p_data_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        return self._v1_0.get_pipeline_cache_data(
            device,
            pipeline_cache,
            Ptr(to=data_size).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Optional[Ptr[NoneType, MutUntrackedOrigin]]]()[],
        )

    def get_pipeline_cache_data[p_data_origin: MutOrigin](
        self, device: Device, pipeline_cache: PipelineCache
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.get_pipeline_cache_data(
                device,
                pipeline_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[NoneType, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.get_pipeline_cache_data(
                device,
                pipeline_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().bitcast[NoneType]().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def merge_pipeline_caches[p_src_caches_origin: ImmutOrigin](
        self,
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, p_src_caches_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergePipelineCaches.html
        """
        return self._v1_0.merge_pipeline_caches(
            device,
            dst_cache,
            src_cache_count,
            Ptr(to=p_src_caches).bitcast[Ptr[PipelineCache, ImmutUntrackedOrigin]]()[],
        )

    def create_compute_pipelines[
        p_create_infos_origin: ImmutOrigin,
        p_allocator_origin: ImmutOrigin,
        p_pipelines_origin: MutOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateComputePipelines.html
        """
        return self._v1_0.create_compute_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[ComputePipelineCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def destroy_pipeline[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline: Pipeline,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipeline.html
        """
        return self._v1_0.destroy_pipeline(
            device,
            pipeline,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_pipeline_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut pipeline_layout: PipelineLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineLayout.html
        """
        return self._v1_0.create_pipeline_layout(
            device,
            Ptr(to=create_info).bitcast[PipelineLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=pipeline_layout).bitcast[PipelineLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_pipeline_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineLayout.html
        """
        return self._v1_0.destroy_pipeline_layout(
            device,
            pipeline_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_sampler[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut sampler: Sampler,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSampler.html
        """
        return self._v1_0.create_sampler(
            device,
            Ptr(to=create_info).bitcast[SamplerCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=sampler).bitcast[Sampler]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_sampler[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        sampler: Sampler,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySampler.html
        """
        return self._v1_0.destroy_sampler(
            device,
            sampler,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_descriptor_set_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut set_layout: DescriptorSetLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorSetLayout.html
        """
        return self._v1_0.create_descriptor_set_layout(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=set_layout).bitcast[DescriptorSetLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_set_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorSetLayout.html
        """
        return self._v1_0.destroy_descriptor_set_layout(
            device,
            descriptor_set_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_descriptor_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut descriptor_pool: DescriptorPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorPool.html
        """
        return self._v1_0.create_descriptor_pool(
            device,
            Ptr(to=create_info).bitcast[DescriptorPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=descriptor_pool).bitcast[DescriptorPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorPool.html
        """
        return self._v1_0.destroy_descriptor_pool(
            device,
            descriptor_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_descriptor_pool(
        self, device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetDescriptorPool.html
        """
        return self._v1_0.reset_descriptor_pool(device, descriptor_pool, flags)

    def allocate_descriptor_sets[p_descriptor_sets_origin: MutOrigin](
        self,
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateDescriptorSets.html
        """
        return self._v1_0.allocate_descriptor_sets(
            device,
            Ptr(to=allocate_info).bitcast[DescriptorSetAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, MutUntrackedOrigin]]()[],
        )

    def free_descriptor_sets[p_descriptor_sets_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeDescriptorSets.html
        """
        return self._v1_0.free_descriptor_sets(
            device,
            descriptor_pool,
            descriptor_set_count,
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def update_descriptor_sets[
        p_descriptor_writes_origin: ImmutOrigin, p_descriptor_copies_origin: ImmutOrigin
    ](
        self,
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, p_descriptor_writes_origin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, p_descriptor_copies_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSets.html
        """
        return self._v1_0.update_descriptor_sets(
            device,
            descriptor_write_count,
            Ptr(to=p_descriptor_writes).bitcast[Ptr[WriteDescriptorSet, ImmutUntrackedOrigin]]()[],
            descriptor_copy_count,
            Ptr(to=p_descriptor_copies).bitcast[Ptr[CopyDescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def cmd_bind_pipeline(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipeline.html
        """
        return self._v1_0.cmd_bind_pipeline(command_buffer, pipeline_bind_point, pipeline)

    def cmd_bind_descriptor_sets[
        p_descriptor_sets_origin: ImmutOrigin, p_dynamic_offsets_origin: ImmutOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, p_dynamic_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorSets.html
        """
        return self._v1_0.cmd_bind_descriptor_sets(
            command_buffer,
            pipeline_bind_point,
            layout,
            first_set,
            descriptor_set_count,
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, ImmutUntrackedOrigin]]()[],
            dynamic_offset_count,
            Ptr(to=p_dynamic_offsets).bitcast[Ptr[UInt32, ImmutUntrackedOrigin]]()[],
        )

    def cmd_clear_color_image[p_ranges_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, p_ranges_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html
        """
        return self._v1_0.cmd_clear_color_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=color).bitcast[ClearColorValue]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            range_count,
            Ptr(to=p_ranges).bitcast[Ptr[ImageSubresourceRange, ImmutUntrackedOrigin]]()[],
        )

    def cmd_dispatch(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatch.html
        """
        return self._v1_0.cmd_dispatch(command_buffer, group_count_x, group_count_y, group_count_z)

    def cmd_dispatch_indirect(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchIndirect.html
        """
        return self._v1_0.cmd_dispatch_indirect(command_buffer, buffer, offset)

    def cmd_set_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent.html
        """
        return self._v1_0.cmd_set_event(command_buffer, event, stage_mask)

    def cmd_reset_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent.html
        """
        return self._v1_0.cmd_reset_event(command_buffer, event, stage_mask)

    def cmd_wait_events[
        p_events_origin: ImmutOrigin,
        p_memory_barriers_origin: ImmutOrigin,
        p_buffer_memory_barriers_origin: ImmutOrigin,
        p_image_memory_barriers_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, p_events_origin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, p_memory_barriers_origin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, p_buffer_memory_barriers_origin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, p_image_memory_barriers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents.html
        """
        return self._v1_0.cmd_wait_events(
            command_buffer,
            event_count,
            Ptr(to=p_events).bitcast[Ptr[Event, ImmutUntrackedOrigin]]()[],
            src_stage_mask,
            dst_stage_mask,
            memory_barrier_count,
            Ptr(to=p_memory_barriers).bitcast[Ptr[MemoryBarrier, ImmutUntrackedOrigin]]()[],
            buffer_memory_barrier_count,
            Ptr(to=p_buffer_memory_barriers).bitcast[Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin]]()[],
            image_memory_barrier_count,
            Ptr(to=p_image_memory_barriers).bitcast[Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin]]()[],
        )

    def cmd_push_constants[p_values_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, p_values_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants.html
        """
        return self._v1_0.cmd_push_constants(
            command_buffer,
            layout,
            stage_flags,
            offset,
            size,
            Ptr(to=p_values).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def create_graphics_pipelines[
        p_create_infos_origin: ImmutOrigin,
        p_allocator_origin: ImmutOrigin,
        p_pipelines_origin: MutOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateGraphicsPipelines.html
        """
        return self._v1_0.create_graphics_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[GraphicsPipelineCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def create_framebuffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut framebuffer: Framebuffer,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFramebuffer.html
        """
        return self._v1_0.create_framebuffer(
            device,
            Ptr(to=create_info).bitcast[FramebufferCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=framebuffer).bitcast[Framebuffer]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_framebuffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFramebuffer.html
        """
        return self._v1_0.destroy_framebuffer(
            device,
            framebuffer,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_render_pass[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass.html
        """
        return self._v1_0.create_render_pass(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=render_pass).bitcast[RenderPass]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_render_pass[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        render_pass: RenderPass,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyRenderPass.html
        """
        return self._v1_0.destroy_render_pass(
            device,
            render_pass,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_render_area_granularity(
        self, device: Device, render_pass: RenderPass, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderAreaGranularity.html
        """
        return self._v1_0.get_render_area_granularity(
            device,
            render_pass,
            Ptr(to=granularity).bitcast[Extent2D]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_set_viewport[p_viewports_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewport.html
        """
        return self._v1_0.cmd_set_viewport(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_scissor[p_scissors_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissor.html
        """
        return self._v1_0.cmd_set_scissor(
            command_buffer,
            first_scissor,
            scissor_count,
            Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_line_width(self, command_buffer: CommandBuffer, line_width: Float32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineWidth.html
        """
        return self._v1_0.cmd_set_line_width(command_buffer, line_width)

    def cmd_set_depth_bias(
        self,
        command_buffer: CommandBuffer,
        depth_bias_constant_factor: Float32,
        depth_bias_clamp: Float32,
        depth_bias_slope_factor: Float32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBias.html
        """
        return self._v1_0.cmd_set_depth_bias(
            command_buffer, depth_bias_constant_factor, depth_bias_clamp, depth_bias_slope_factor
        )

    def cmd_set_blend_constants(
        self, command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetBlendConstants.html
        """
        return self._v1_0.cmd_set_blend_constants(command_buffer, blend_constants)

    def cmd_set_depth_bounds(
        self, command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBounds.html
        """
        return self._v1_0.cmd_set_depth_bounds(command_buffer, min_depth_bounds, max_depth_bounds)

    def cmd_set_stencil_compare_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilCompareMask.html
        """
        return self._v1_0.cmd_set_stencil_compare_mask(command_buffer, face_mask, compare_mask)

    def cmd_set_stencil_write_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilWriteMask.html
        """
        return self._v1_0.cmd_set_stencil_write_mask(command_buffer, face_mask, write_mask)

    def cmd_set_stencil_reference(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilReference.html
        """
        return self._v1_0.cmd_set_stencil_reference(command_buffer, face_mask, reference)

    def cmd_bind_index_buffer(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        index_type: IndexType,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindIndexBuffer.html
        """
        return self._v1_0.cmd_bind_index_buffer(command_buffer, buffer, offset, index_type)

    def cmd_bind_vertex_buffers[p_buffers_origin: ImmutOrigin, p_offsets_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers.html
        """
        return self._v1_0.cmd_bind_vertex_buffers(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
        )

    def cmd_draw(
        self,
        command_buffer: CommandBuffer,
        vertex_count: UInt32,
        instance_count: UInt32,
        first_vertex: UInt32,
        first_instance: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDraw.html
        """
        return self._v1_0.cmd_draw(
            command_buffer, vertex_count, instance_count, first_vertex, first_instance
        )

    def cmd_draw_indexed(
        self,
        command_buffer: CommandBuffer,
        index_count: UInt32,
        instance_count: UInt32,
        first_index: UInt32,
        vertex_offset: Int32,
        first_instance: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexed.html
        """
        return self._v1_0.cmd_draw_indexed(
            command_buffer, index_count, instance_count, first_index, vertex_offset, first_instance
        )

    def cmd_draw_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirect.html
        """
        return self._v1_0.cmd_draw_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_draw_indexed_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirect.html
        """
        return self._v1_0.cmd_draw_indexed_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_blit_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, p_regions_origin],
        filter: Filter,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage.html
        """
        return self._v1_0.cmd_blit_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageBlit, ImmutUntrackedOrigin]]()[],
            filter,
        )

    def cmd_clear_depth_stencil_image[p_ranges_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, p_ranges_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearDepthStencilImage.html
        """
        return self._v1_0.cmd_clear_depth_stencil_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=depth_stencil).bitcast[ClearDepthStencilValue]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            range_count,
            Ptr(to=p_ranges).bitcast[Ptr[ImageSubresourceRange, ImmutUntrackedOrigin]]()[],
        )

    def cmd_clear_attachments[p_attachments_origin: ImmutOrigin, p_rects_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, p_attachments_origin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, p_rects_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearAttachments.html
        """
        return self._v1_0.cmd_clear_attachments(
            command_buffer,
            attachment_count,
            Ptr(to=p_attachments).bitcast[Ptr[ClearAttachment, ImmutUntrackedOrigin]]()[],
            rect_count,
            Ptr(to=p_rects).bitcast[Ptr[ClearRect, ImmutUntrackedOrigin]]()[],
        )

    def cmd_resolve_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage.html
        """
        return self._v1_0.cmd_resolve_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageResolve, ImmutUntrackedOrigin]]()[],
        )

    def cmd_begin_render_pass(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass.html
        """
        return self._v1_0.cmd_begin_render_pass(
            command_buffer,
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            contents,
        )

    def cmd_next_subpass(self, command_buffer: CommandBuffer, contents: SubpassContents):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass.html
        """
        return self._v1_0.cmd_next_subpass(command_buffer, contents)

    def cmd_end_render_pass(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass.html
        """
        return self._v1_0.cmd_end_render_pass(command_buffer)

    def bind_buffer_memory_2[p_bind_infos_origin: ImmutOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory2.html
        """
        return self._v1_1.bind_buffer_memory_2(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindBufferMemoryInfo, ImmutUntrackedOrigin]]()[],
        )

    def bind_image_memory_2[p_bind_infos_origin: ImmutOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory2.html
        """
        return self._v1_1.bind_image_memory_2(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindImageMemoryInfo, ImmutUntrackedOrigin]]()[],
        )

    def get_device_group_peer_memory_features(
        self,
        device: Device,
        heap_index: UInt32,
        local_device_index: UInt32,
        remote_device_index: UInt32,
        mut peer_memory_features: PeerMemoryFeatureFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupPeerMemoryFeatures.html
        """
        return self._v1_1.get_device_group_peer_memory_features(
            device,
            heap_index,
            local_device_index,
            remote_device_index,
            Ptr(to=peer_memory_features).bitcast[PeerMemoryFeatureFlags]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_set_device_mask(self, command_buffer: CommandBuffer, device_mask: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDeviceMask.html
        """
        return self._v1_1.cmd_set_device_mask(command_buffer, device_mask)

    def get_image_memory_requirements_2(
        self,
        device: Device,
        info: ImageMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements2.html
        """
        return self._v1_1.get_image_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_buffer_memory_requirements_2(
        self,
        device: Device,
        info: BufferMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements2.html
        """
        return self._v1_1.get_buffer_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[BufferMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_sparse_memory_requirements_2[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements2, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        return self._v1_1.get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin]]]()[],
        )

    def get_image_sparse_memory_requirements_2[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, info: ImageSparseMemoryRequirementsInfo2
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self._v1_1.get_image_sparse_memory_requirements_2(
    device,
    Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_image_sparse_memory_requirements_2(
    device,
    Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTrimCommandPool.html
        """
        return self._v1_1.trim_command_pool(device, command_pool, flags)

    def get_device_queue_2(self, device: Device, queue_info: DeviceQueueInfo2, mut queue: Queue):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue2.html
        """
        return self._v1_1.get_device_queue_2(
            device,
            Ptr(to=queue_info).bitcast[DeviceQueueInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=queue).bitcast[Queue]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_dispatch_base(
        self,
        command_buffer: CommandBuffer,
        base_group_x: UInt32,
        base_group_y: UInt32,
        base_group_z: UInt32,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchBase.html
        """
        return self._v1_1.cmd_dispatch_base(
            command_buffer,
            base_group_x,
            base_group_y,
            base_group_z,
            group_count_x,
            group_count_y,
            group_count_z,
        )

    def create_descriptor_update_template[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorUpdateTemplate.html
        """
        return self._v1_1.create_descriptor_update_template(
            device,
            Ptr(to=create_info).bitcast[DescriptorUpdateTemplateCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=descriptor_update_template).bitcast[DescriptorUpdateTemplate]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_update_template[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorUpdateTemplate.html
        """
        return self._v1_1.destroy_descriptor_update_template(
            device,
            descriptor_update_template,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def update_descriptor_set_with_template[p_data_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._v1_1.update_descriptor_set_with_template(
            device,
            descriptor_set,
            descriptor_update_template,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def get_descriptor_set_layout_support(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        mut support: DescriptorSetLayoutSupport,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutSupport.html
        """
        return self._v1_1.get_descriptor_set_layout_support(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=support).bitcast[DescriptorSetLayoutSupport]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def create_sampler_ycbcr_conversion[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSamplerYcbcrConversion.html
        """
        return self._v1_1.create_sampler_ycbcr_conversion(
            device,
            Ptr(to=create_info).bitcast[SamplerYcbcrConversionCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=ycbcr_conversion).bitcast[SamplerYcbcrConversion]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_sampler_ycbcr_conversion[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySamplerYcbcrConversion.html
        """
        return self._v1_1.destroy_sampler_ycbcr_conversion(
            device,
            ycbcr_conversion,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_query_pool(
        self, device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetQueryPool.html
        """
        return self._v1_2.reset_query_pool(device, query_pool, first_query, query_count)

    def get_semaphore_counter_value(
        self, device: Device, semaphore: Semaphore, mut value: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreCounterValue.html
        """
        return self._v1_2.get_semaphore_counter_value(
            device, semaphore, Ptr(to=value).bitcast[UInt64]().unsafe_origin_cast[MutUntrackedOrigin]()
        )

    def wait_semaphores(
        self, device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitSemaphores.html
        """
        return self._v1_2.wait_semaphores(
            device,
            Ptr(to=wait_info).bitcast[SemaphoreWaitInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            timeout,
        )

    def signal_semaphore(self, device: Device, signal_info: SemaphoreSignalInfo) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSignalSemaphore.html
        """
        return self._v1_2.signal_semaphore(
            device,
            Ptr(to=signal_info).bitcast[SemaphoreSignalInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._v1_2.get_buffer_device_address(
            device,
            Ptr(to=info).bitcast[BufferDeviceAddressInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_buffer_opaque_capture_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureAddress.html
        """
        return self._v1_2.get_buffer_opaque_capture_address(
            device,
            Ptr(to=info).bitcast[BufferDeviceAddressInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_device_memory_opaque_capture_address(
        self, device: Device, info: DeviceMemoryOpaqueCaptureAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryOpaqueCaptureAddress.html
        """
        return self._v1_2.get_device_memory_opaque_capture_address(
            device,
            Ptr(to=info).bitcast[DeviceMemoryOpaqueCaptureAddressInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_draw_indirect_count(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirectCount.html
        """
        return self._v1_2.cmd_draw_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )

    def cmd_draw_indexed_indirect_count(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirectCount.html
        """
        return self._v1_2.cmd_draw_indexed_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )

    def create_render_pass_2[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: RenderPassCreateInfo2,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass2.html
        """
        return self._v1_2.create_render_pass_2(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=render_pass).bitcast[RenderPass]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_begin_render_pass_2(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        subpass_begin_info: SubpassBeginInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass2.html
        """
        return self._v1_2.cmd_begin_render_pass_2(
            command_buffer,
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_next_subpass_2(
        self,
        command_buffer: CommandBuffer,
        subpass_begin_info: SubpassBeginInfo,
        subpass_end_info: SubpassEndInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass2.html
        """
        return self._v1_2.cmd_next_subpass_2(
            command_buffer,
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_end_render_pass_2(
        self, command_buffer: CommandBuffer, subpass_end_info: SubpassEndInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass2.html
        """
        return self._v1_2.cmd_end_render_pass_2(
            command_buffer,
            Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct DeviceFunctionsV1_3(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: DeviceFunctionsAdditionsV1_0
    var _v1_1: DeviceFunctionsAdditionsV1_1
    var _v1_2: DeviceFunctionsAdditionsV1_2
    var _v1_3: DeviceFunctionsAdditionsV1_3

    def __init__(out self, global_functions: GlobalFunctionsV1_3, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = DeviceFunctionsAdditionsV1_0(self._dlhandle, device)
        self._v1_1 = DeviceFunctionsAdditionsV1_1(self._dlhandle, device)
        self._v1_2 = DeviceFunctionsAdditionsV1_2(self._dlhandle, device)
        self._v1_3 = DeviceFunctionsAdditionsV1_3(self._dlhandle, device)

    def get_device_proc_addr[p_name_origin: ImmutOrigin](
        self, device: Device, p_name: CStringSlice[p_name_origin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceProcAddr.html
        """
        return self._v1_0.get_device_proc_addr(
            device, Ptr(to=p_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[]
        )

    def destroy_device[p_allocator_origin: ImmutOrigin](
        self, device: Device, p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDevice.html
        """
        return self._v1_0.destroy_device(
            device,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_device_queue(
        self, device: Device, queue_family_index: UInt32, queue_index: UInt32, mut queue: Queue
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue.html
        """
        return self._v1_0.get_device_queue(
            device,
            queue_family_index,
            queue_index,
            Ptr(to=queue).bitcast[Queue]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def queue_submit[p_submits_origin: ImmutOrigin](
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, p_submits_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit.html
        """
        return self._v1_0.queue_submit(
            queue, submit_count, Ptr(to=p_submits).bitcast[Ptr[SubmitInfo, ImmutUntrackedOrigin]]()[], fence
        )

    def queue_wait_idle(self, queue: Queue) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueWaitIdle.html
        """
        return self._v1_0.queue_wait_idle(queue)

    def device_wait_idle(self, device: Device) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeviceWaitIdle.html
        """
        return self._v1_0.device_wait_idle(device)

    def allocate_memory[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut memory: DeviceMemory,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateMemory.html
        """
        return self._v1_0.allocate_memory(
            device,
            Ptr(to=allocate_info).bitcast[MemoryAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=memory).bitcast[DeviceMemory]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def free_memory[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        memory: DeviceMemory,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeMemory.html
        """
        return self._v1_0.free_memory(
            device,
            memory,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def map_memory[p_data_origin: MutOrigin](
        self,
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        mut p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMapMemory.html
        """
        return self._v1_0.map_memory(
            device,
            memory,
            offset,
            size,
            flags,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def unmap_memory(self, device: Device, memory: DeviceMemory):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory.html
        """
        return self._v1_0.unmap_memory(device, memory)

    def flush_mapped_memory_ranges[p_memory_ranges_origin: ImmutOrigin](
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, p_memory_ranges_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFlushMappedMemoryRanges.html
        """
        return self._v1_0.flush_mapped_memory_ranges(
            device,
            memory_range_count,
            Ptr(to=p_memory_ranges).bitcast[Ptr[MappedMemoryRange, ImmutUntrackedOrigin]]()[],
        )

    def invalidate_mapped_memory_ranges[p_memory_ranges_origin: ImmutOrigin](
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, p_memory_ranges_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInvalidateMappedMemoryRanges.html
        """
        return self._v1_0.invalidate_mapped_memory_ranges(
            device,
            memory_range_count,
            Ptr(to=p_memory_ranges).bitcast[Ptr[MappedMemoryRange, ImmutUntrackedOrigin]]()[],
        )

    def get_device_memory_commitment(
        self, device: Device, memory: DeviceMemory, mut committed_memory_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryCommitment.html
        """
        return self._v1_0.get_device_memory_commitment(
            device,
            memory,
            Ptr(to=committed_memory_in_bytes).bitcast[DeviceSize]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def bind_buffer_memory(
        self, device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory.html
        """
        return self._v1_0.bind_buffer_memory(device, buffer, memory, memory_offset)

    def bind_image_memory(
        self, device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory.html
        """
        return self._v1_0.bind_image_memory(device, image, memory, memory_offset)

    def get_buffer_memory_requirements(
        self, device: Device, buffer: Buffer, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements.html
        """
        return self._v1_0.get_buffer_memory_requirements(
            device,
            buffer,
            Ptr(to=memory_requirements).bitcast[MemoryRequirements]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_memory_requirements(
        self, device: Device, image: Image, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements.html
        """
        return self._v1_0.get_image_memory_requirements(
            device,
            image,
            Ptr(to=memory_requirements).bitcast[MemoryRequirements]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        image: Image,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        return self._v1_0.get_image_sparse_memory_requirements(
            device,
            image,
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin]]]()[],
        )

    def get_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, image: Image
    ) -> List[SparseImageMemoryRequirements]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements]()
        var count: UInt32 = 0
        self._v1_0.get_image_sparse_memory_requirements(
    device,
    image,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_image_sparse_memory_requirements(
    device,
    image,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def queue_bind_sparse[p_bind_info_origin: ImmutOrigin](
        self,
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, p_bind_info_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBindSparse.html
        """
        return self._v1_0.queue_bind_sparse(
            queue,
            bind_info_count,
            Ptr(to=p_bind_info).bitcast[Ptr[BindSparseInfo, ImmutUntrackedOrigin]]()[],
            fence,
        )

    def create_fence[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFence.html
        """
        return self._v1_0.create_fence(
            device,
            Ptr(to=create_info).bitcast[FenceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=fence).bitcast[Fence]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_fence[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        fence: Fence,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFence.html
        """
        return self._v1_0.destroy_fence(
            device,
            fence,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_fences[p_fences_origin: ImmutOrigin](
        self, device: Device, fence_count: UInt32, p_fences: Ptr[Fence, p_fences_origin]
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetFences.html
        """
        return self._v1_0.reset_fences(
            device, fence_count, Ptr(to=p_fences).bitcast[Ptr[Fence, ImmutUntrackedOrigin]]()[]
        )

    def get_fence_status(self, device: Device, fence: Fence) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceStatus.html
        """
        return self._v1_0.get_fence_status(device, fence)

    def wait_for_fences[p_fences_origin: ImmutOrigin](
        self,
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, p_fences_origin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForFences.html
        """
        return self._v1_0.wait_for_fences(
            device,
            fence_count,
            Ptr(to=p_fences).bitcast[Ptr[Fence, ImmutUntrackedOrigin]]()[],
            wait_all,
            timeout,
        )

    def create_semaphore[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut semaphore: Semaphore,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSemaphore.html
        """
        return self._v1_0.create_semaphore(
            device,
            Ptr(to=create_info).bitcast[SemaphoreCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=semaphore).bitcast[Semaphore]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_semaphore[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        semaphore: Semaphore,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySemaphore.html
        """
        return self._v1_0.destroy_semaphore(
            device,
            semaphore,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_query_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut query_pool: QueryPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateQueryPool.html
        """
        return self._v1_0.create_query_pool(
            device,
            Ptr(to=create_info).bitcast[QueryPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=query_pool).bitcast[QueryPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_query_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        query_pool: QueryPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyQueryPool.html
        """
        return self._v1_0.destroy_query_pool(
            device,
            query_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_query_pool_results[p_data_origin: MutOrigin](
        self,
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueryPoolResults.html
        """
        return self._v1_0.get_query_pool_results(
            device,
            query_pool,
            first_query,
            query_count,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
            stride,
            flags,
        )

    def create_buffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut buffer: Buffer,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBuffer.html
        """
        return self._v1_0.create_buffer(
            device,
            Ptr(to=create_info).bitcast[BufferCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=buffer).bitcast[Buffer]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_buffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        buffer: Buffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBuffer.html
        """
        return self._v1_0.destroy_buffer(
            device,
            buffer,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_image[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut image: Image,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImage.html
        """
        return self._v1_0.create_image(
            device,
            Ptr(to=create_info).bitcast[ImageCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=image).bitcast[Image]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_image[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        image: Image,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImage.html
        """
        return self._v1_0.destroy_image(
            device,
            image,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_image_subresource_layout(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource,
        mut layout: SubresourceLayout,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout.html
        """
        return self._v1_0.get_image_subresource_layout(
            device,
            image,
            Ptr(to=subresource).bitcast[ImageSubresource]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=layout).bitcast[SubresourceLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def create_image_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: ImageView,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImageView.html
        """
        return self._v1_0.create_image_view(
            device,
            Ptr(to=create_info).bitcast[ImageViewCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[ImageView]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_image_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        image_view: ImageView,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImageView.html
        """
        return self._v1_0.destroy_image_view(
            device,
            image_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_command_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut command_pool: CommandPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCommandPool.html
        """
        return self._v1_0.create_command_pool(
            device,
            Ptr(to=create_info).bitcast[CommandPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=command_pool).bitcast[CommandPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_command_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        command_pool: CommandPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCommandPool.html
        """
        return self._v1_0.destroy_command_pool(
            device,
            command_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandPool.html
        """
        return self._v1_0.reset_command_pool(device, command_pool, flags)

    def allocate_command_buffers[p_command_buffers_origin: MutOrigin](
        self,
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateCommandBuffers.html
        """
        return self._v1_0.allocate_command_buffers(
            device,
            Ptr(to=allocate_info).bitcast[CommandBufferAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, MutUntrackedOrigin]]()[],
        )

    def free_command_buffers[p_command_buffers_origin: ImmutOrigin](
        self,
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeCommandBuffers.html
        """
        return self._v1_0.free_command_buffers(
            device,
            command_pool,
            command_buffer_count,
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, ImmutUntrackedOrigin]]()[],
        )

    def begin_command_buffer(
        self, command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBeginCommandBuffer.html
        """
        return self._v1_0.begin_command_buffer(
            command_buffer,
            Ptr(to=begin_info).bitcast[CommandBufferBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def end_command_buffer(self, command_buffer: CommandBuffer) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEndCommandBuffer.html
        """
        return self._v1_0.end_command_buffer(command_buffer)

    def reset_command_buffer(
        self, command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandBuffer.html
        """
        return self._v1_0.reset_command_buffer(command_buffer, flags)

    def cmd_copy_buffer[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer.html
        """
        return self._v1_0.cmd_copy_buffer(
            command_buffer,
            src_buffer,
            dst_buffer,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage.html
        """
        return self._v1_0.cmd_copy_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_buffer_to_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html
        """
        return self._v1_0.cmd_copy_buffer_to_image(
            command_buffer,
            src_buffer,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_image_to_buffer[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer.html
        """
        return self._v1_0.cmd_copy_image_to_buffer(
            command_buffer,
            src_image,
            src_image_layout,
            dst_buffer,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_update_buffer[p_data_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdateBuffer.html
        """
        return self._v1_0.cmd_update_buffer(
            command_buffer,
            dst_buffer,
            dst_offset,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def cmd_fill_buffer(
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        size: DeviceSize,
        data: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdFillBuffer.html
        """
        return self._v1_0.cmd_fill_buffer(command_buffer, dst_buffer, dst_offset, size, data)

    def cmd_pipeline_barrier[
        p_memory_barriers_origin: ImmutOrigin,
        p_buffer_memory_barriers_origin: ImmutOrigin,
        p_image_memory_barriers_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, p_memory_barriers_origin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, p_buffer_memory_barriers_origin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, p_image_memory_barriers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier.html
        """
        return self._v1_0.cmd_pipeline_barrier(
            command_buffer,
            src_stage_mask,
            dst_stage_mask,
            dependency_flags,
            memory_barrier_count,
            Ptr(to=p_memory_barriers).bitcast[Ptr[MemoryBarrier, ImmutUntrackedOrigin]]()[],
            buffer_memory_barrier_count,
            Ptr(to=p_buffer_memory_barriers).bitcast[Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin]]()[],
            image_memory_barrier_count,
            Ptr(to=p_image_memory_barriers).bitcast[Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin]]()[],
        )

    def cmd_begin_query(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginQuery.html
        """
        return self._v1_0.cmd_begin_query(command_buffer, query_pool, query, flags)

    def cmd_end_query(self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQuery.html
        """
        return self._v1_0.cmd_end_query(command_buffer, query_pool, query)

    def cmd_reset_query_pool(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetQueryPool.html
        """
        return self._v1_0.cmd_reset_query_pool(command_buffer, query_pool, first_query, query_count)

    def cmd_write_timestamp(
        self,
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        query_pool: QueryPool,
        query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteTimestamp.html
        """
        return self._v1_0.cmd_write_timestamp(command_buffer, pipeline_stage, query_pool, query)

    def cmd_copy_query_pool_results(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        stride: DeviceSize,
        flags: QueryResultFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyQueryPoolResults.html
        """
        return self._v1_0.cmd_copy_query_pool_results(
            command_buffer, query_pool, first_query, query_count, dst_buffer, dst_offset, stride, flags
        )

    def cmd_execute_commands[p_command_buffers_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteCommands.html
        """
        return self._v1_0.cmd_execute_commands(
            command_buffer,
            command_buffer_count,
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, ImmutUntrackedOrigin]]()[],
        )

    def create_event[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut event: Event,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateEvent.html
        """
        return self._v1_0.create_event(
            device,
            Ptr(to=create_info).bitcast[EventCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=event).bitcast[Event]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_event[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        event: Event,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyEvent.html
        """
        return self._v1_0.destroy_event(
            device,
            event,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_event_status(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEventStatus.html
        """
        return self._v1_0.get_event_status(device, event)

    def set_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetEvent.html
        """
        return self._v1_0.set_event(device, event)

    def reset_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetEvent.html
        """
        return self._v1_0.reset_event(device, event)

    def create_buffer_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: BufferView,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferView.html
        """
        return self._v1_0.create_buffer_view(
            device,
            Ptr(to=create_info).bitcast[BufferViewCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[BufferView]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_buffer_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        buffer_view: BufferView,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferView.html
        """
        return self._v1_0.destroy_buffer_view(
            device,
            buffer_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_shader_module[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut shader_module: ShaderModule,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShaderModule.html
        """
        return self._v1_0.create_shader_module(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=shader_module).bitcast[ShaderModule]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_shader_module[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderModule.html
        """
        return self._v1_0.destroy_shader_module(
            device,
            shader_module,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_pipeline_cache[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut pipeline_cache: PipelineCache,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineCache.html
        """
        return self._v1_0.create_pipeline_cache(
            device,
            Ptr(to=create_info).bitcast[PipelineCacheCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=pipeline_cache).bitcast[PipelineCache]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_pipeline_cache[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineCache.html
        """
        return self._v1_0.destroy_pipeline_cache(
            device,
            pipeline_cache,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_pipeline_cache_data[p_data_origin: MutOrigin](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        mut data_size: UInt,
        p_data: Optional[Ptr[NoneType, p_data_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        return self._v1_0.get_pipeline_cache_data(
            device,
            pipeline_cache,
            Ptr(to=data_size).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Optional[Ptr[NoneType, MutUntrackedOrigin]]]()[],
        )

    def get_pipeline_cache_data[p_data_origin: MutOrigin](
        self, device: Device, pipeline_cache: PipelineCache
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.get_pipeline_cache_data(
                device,
                pipeline_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[NoneType, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.get_pipeline_cache_data(
                device,
                pipeline_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().bitcast[NoneType]().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def merge_pipeline_caches[p_src_caches_origin: ImmutOrigin](
        self,
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, p_src_caches_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergePipelineCaches.html
        """
        return self._v1_0.merge_pipeline_caches(
            device,
            dst_cache,
            src_cache_count,
            Ptr(to=p_src_caches).bitcast[Ptr[PipelineCache, ImmutUntrackedOrigin]]()[],
        )

    def create_compute_pipelines[
        p_create_infos_origin: ImmutOrigin,
        p_allocator_origin: ImmutOrigin,
        p_pipelines_origin: MutOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateComputePipelines.html
        """
        return self._v1_0.create_compute_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[ComputePipelineCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def destroy_pipeline[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline: Pipeline,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipeline.html
        """
        return self._v1_0.destroy_pipeline(
            device,
            pipeline,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_pipeline_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut pipeline_layout: PipelineLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineLayout.html
        """
        return self._v1_0.create_pipeline_layout(
            device,
            Ptr(to=create_info).bitcast[PipelineLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=pipeline_layout).bitcast[PipelineLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_pipeline_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineLayout.html
        """
        return self._v1_0.destroy_pipeline_layout(
            device,
            pipeline_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_sampler[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut sampler: Sampler,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSampler.html
        """
        return self._v1_0.create_sampler(
            device,
            Ptr(to=create_info).bitcast[SamplerCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=sampler).bitcast[Sampler]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_sampler[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        sampler: Sampler,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySampler.html
        """
        return self._v1_0.destroy_sampler(
            device,
            sampler,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_descriptor_set_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut set_layout: DescriptorSetLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorSetLayout.html
        """
        return self._v1_0.create_descriptor_set_layout(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=set_layout).bitcast[DescriptorSetLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_set_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorSetLayout.html
        """
        return self._v1_0.destroy_descriptor_set_layout(
            device,
            descriptor_set_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_descriptor_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut descriptor_pool: DescriptorPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorPool.html
        """
        return self._v1_0.create_descriptor_pool(
            device,
            Ptr(to=create_info).bitcast[DescriptorPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=descriptor_pool).bitcast[DescriptorPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorPool.html
        """
        return self._v1_0.destroy_descriptor_pool(
            device,
            descriptor_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_descriptor_pool(
        self, device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetDescriptorPool.html
        """
        return self._v1_0.reset_descriptor_pool(device, descriptor_pool, flags)

    def allocate_descriptor_sets[p_descriptor_sets_origin: MutOrigin](
        self,
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateDescriptorSets.html
        """
        return self._v1_0.allocate_descriptor_sets(
            device,
            Ptr(to=allocate_info).bitcast[DescriptorSetAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, MutUntrackedOrigin]]()[],
        )

    def free_descriptor_sets[p_descriptor_sets_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeDescriptorSets.html
        """
        return self._v1_0.free_descriptor_sets(
            device,
            descriptor_pool,
            descriptor_set_count,
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def update_descriptor_sets[
        p_descriptor_writes_origin: ImmutOrigin, p_descriptor_copies_origin: ImmutOrigin
    ](
        self,
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, p_descriptor_writes_origin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, p_descriptor_copies_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSets.html
        """
        return self._v1_0.update_descriptor_sets(
            device,
            descriptor_write_count,
            Ptr(to=p_descriptor_writes).bitcast[Ptr[WriteDescriptorSet, ImmutUntrackedOrigin]]()[],
            descriptor_copy_count,
            Ptr(to=p_descriptor_copies).bitcast[Ptr[CopyDescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def cmd_bind_pipeline(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipeline.html
        """
        return self._v1_0.cmd_bind_pipeline(command_buffer, pipeline_bind_point, pipeline)

    def cmd_bind_descriptor_sets[
        p_descriptor_sets_origin: ImmutOrigin, p_dynamic_offsets_origin: ImmutOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, p_dynamic_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorSets.html
        """
        return self._v1_0.cmd_bind_descriptor_sets(
            command_buffer,
            pipeline_bind_point,
            layout,
            first_set,
            descriptor_set_count,
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, ImmutUntrackedOrigin]]()[],
            dynamic_offset_count,
            Ptr(to=p_dynamic_offsets).bitcast[Ptr[UInt32, ImmutUntrackedOrigin]]()[],
        )

    def cmd_clear_color_image[p_ranges_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, p_ranges_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html
        """
        return self._v1_0.cmd_clear_color_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=color).bitcast[ClearColorValue]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            range_count,
            Ptr(to=p_ranges).bitcast[Ptr[ImageSubresourceRange, ImmutUntrackedOrigin]]()[],
        )

    def cmd_dispatch(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatch.html
        """
        return self._v1_0.cmd_dispatch(command_buffer, group_count_x, group_count_y, group_count_z)

    def cmd_dispatch_indirect(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchIndirect.html
        """
        return self._v1_0.cmd_dispatch_indirect(command_buffer, buffer, offset)

    def cmd_set_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent.html
        """
        return self._v1_0.cmd_set_event(command_buffer, event, stage_mask)

    def cmd_reset_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent.html
        """
        return self._v1_0.cmd_reset_event(command_buffer, event, stage_mask)

    def cmd_wait_events[
        p_events_origin: ImmutOrigin,
        p_memory_barriers_origin: ImmutOrigin,
        p_buffer_memory_barriers_origin: ImmutOrigin,
        p_image_memory_barriers_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, p_events_origin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, p_memory_barriers_origin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, p_buffer_memory_barriers_origin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, p_image_memory_barriers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents.html
        """
        return self._v1_0.cmd_wait_events(
            command_buffer,
            event_count,
            Ptr(to=p_events).bitcast[Ptr[Event, ImmutUntrackedOrigin]]()[],
            src_stage_mask,
            dst_stage_mask,
            memory_barrier_count,
            Ptr(to=p_memory_barriers).bitcast[Ptr[MemoryBarrier, ImmutUntrackedOrigin]]()[],
            buffer_memory_barrier_count,
            Ptr(to=p_buffer_memory_barriers).bitcast[Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin]]()[],
            image_memory_barrier_count,
            Ptr(to=p_image_memory_barriers).bitcast[Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin]]()[],
        )

    def cmd_push_constants[p_values_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, p_values_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants.html
        """
        return self._v1_0.cmd_push_constants(
            command_buffer,
            layout,
            stage_flags,
            offset,
            size,
            Ptr(to=p_values).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def create_graphics_pipelines[
        p_create_infos_origin: ImmutOrigin,
        p_allocator_origin: ImmutOrigin,
        p_pipelines_origin: MutOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateGraphicsPipelines.html
        """
        return self._v1_0.create_graphics_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[GraphicsPipelineCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def create_framebuffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut framebuffer: Framebuffer,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFramebuffer.html
        """
        return self._v1_0.create_framebuffer(
            device,
            Ptr(to=create_info).bitcast[FramebufferCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=framebuffer).bitcast[Framebuffer]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_framebuffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFramebuffer.html
        """
        return self._v1_0.destroy_framebuffer(
            device,
            framebuffer,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_render_pass[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass.html
        """
        return self._v1_0.create_render_pass(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=render_pass).bitcast[RenderPass]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_render_pass[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        render_pass: RenderPass,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyRenderPass.html
        """
        return self._v1_0.destroy_render_pass(
            device,
            render_pass,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_render_area_granularity(
        self, device: Device, render_pass: RenderPass, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderAreaGranularity.html
        """
        return self._v1_0.get_render_area_granularity(
            device,
            render_pass,
            Ptr(to=granularity).bitcast[Extent2D]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_set_viewport[p_viewports_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewport.html
        """
        return self._v1_0.cmd_set_viewport(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_scissor[p_scissors_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissor.html
        """
        return self._v1_0.cmd_set_scissor(
            command_buffer,
            first_scissor,
            scissor_count,
            Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_line_width(self, command_buffer: CommandBuffer, line_width: Float32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineWidth.html
        """
        return self._v1_0.cmd_set_line_width(command_buffer, line_width)

    def cmd_set_depth_bias(
        self,
        command_buffer: CommandBuffer,
        depth_bias_constant_factor: Float32,
        depth_bias_clamp: Float32,
        depth_bias_slope_factor: Float32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBias.html
        """
        return self._v1_0.cmd_set_depth_bias(
            command_buffer, depth_bias_constant_factor, depth_bias_clamp, depth_bias_slope_factor
        )

    def cmd_set_blend_constants(
        self, command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetBlendConstants.html
        """
        return self._v1_0.cmd_set_blend_constants(command_buffer, blend_constants)

    def cmd_set_depth_bounds(
        self, command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBounds.html
        """
        return self._v1_0.cmd_set_depth_bounds(command_buffer, min_depth_bounds, max_depth_bounds)

    def cmd_set_stencil_compare_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilCompareMask.html
        """
        return self._v1_0.cmd_set_stencil_compare_mask(command_buffer, face_mask, compare_mask)

    def cmd_set_stencil_write_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilWriteMask.html
        """
        return self._v1_0.cmd_set_stencil_write_mask(command_buffer, face_mask, write_mask)

    def cmd_set_stencil_reference(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilReference.html
        """
        return self._v1_0.cmd_set_stencil_reference(command_buffer, face_mask, reference)

    def cmd_bind_index_buffer(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        index_type: IndexType,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindIndexBuffer.html
        """
        return self._v1_0.cmd_bind_index_buffer(command_buffer, buffer, offset, index_type)

    def cmd_bind_vertex_buffers[p_buffers_origin: ImmutOrigin, p_offsets_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers.html
        """
        return self._v1_0.cmd_bind_vertex_buffers(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
        )

    def cmd_draw(
        self,
        command_buffer: CommandBuffer,
        vertex_count: UInt32,
        instance_count: UInt32,
        first_vertex: UInt32,
        first_instance: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDraw.html
        """
        return self._v1_0.cmd_draw(
            command_buffer, vertex_count, instance_count, first_vertex, first_instance
        )

    def cmd_draw_indexed(
        self,
        command_buffer: CommandBuffer,
        index_count: UInt32,
        instance_count: UInt32,
        first_index: UInt32,
        vertex_offset: Int32,
        first_instance: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexed.html
        """
        return self._v1_0.cmd_draw_indexed(
            command_buffer, index_count, instance_count, first_index, vertex_offset, first_instance
        )

    def cmd_draw_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirect.html
        """
        return self._v1_0.cmd_draw_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_draw_indexed_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirect.html
        """
        return self._v1_0.cmd_draw_indexed_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_blit_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, p_regions_origin],
        filter: Filter,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage.html
        """
        return self._v1_0.cmd_blit_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageBlit, ImmutUntrackedOrigin]]()[],
            filter,
        )

    def cmd_clear_depth_stencil_image[p_ranges_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, p_ranges_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearDepthStencilImage.html
        """
        return self._v1_0.cmd_clear_depth_stencil_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=depth_stencil).bitcast[ClearDepthStencilValue]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            range_count,
            Ptr(to=p_ranges).bitcast[Ptr[ImageSubresourceRange, ImmutUntrackedOrigin]]()[],
        )

    def cmd_clear_attachments[p_attachments_origin: ImmutOrigin, p_rects_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, p_attachments_origin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, p_rects_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearAttachments.html
        """
        return self._v1_0.cmd_clear_attachments(
            command_buffer,
            attachment_count,
            Ptr(to=p_attachments).bitcast[Ptr[ClearAttachment, ImmutUntrackedOrigin]]()[],
            rect_count,
            Ptr(to=p_rects).bitcast[Ptr[ClearRect, ImmutUntrackedOrigin]]()[],
        )

    def cmd_resolve_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage.html
        """
        return self._v1_0.cmd_resolve_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageResolve, ImmutUntrackedOrigin]]()[],
        )

    def cmd_begin_render_pass(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass.html
        """
        return self._v1_0.cmd_begin_render_pass(
            command_buffer,
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            contents,
        )

    def cmd_next_subpass(self, command_buffer: CommandBuffer, contents: SubpassContents):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass.html
        """
        return self._v1_0.cmd_next_subpass(command_buffer, contents)

    def cmd_end_render_pass(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass.html
        """
        return self._v1_0.cmd_end_render_pass(command_buffer)

    def bind_buffer_memory_2[p_bind_infos_origin: ImmutOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory2.html
        """
        return self._v1_1.bind_buffer_memory_2(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindBufferMemoryInfo, ImmutUntrackedOrigin]]()[],
        )

    def bind_image_memory_2[p_bind_infos_origin: ImmutOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory2.html
        """
        return self._v1_1.bind_image_memory_2(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindImageMemoryInfo, ImmutUntrackedOrigin]]()[],
        )

    def get_device_group_peer_memory_features(
        self,
        device: Device,
        heap_index: UInt32,
        local_device_index: UInt32,
        remote_device_index: UInt32,
        mut peer_memory_features: PeerMemoryFeatureFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupPeerMemoryFeatures.html
        """
        return self._v1_1.get_device_group_peer_memory_features(
            device,
            heap_index,
            local_device_index,
            remote_device_index,
            Ptr(to=peer_memory_features).bitcast[PeerMemoryFeatureFlags]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_set_device_mask(self, command_buffer: CommandBuffer, device_mask: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDeviceMask.html
        """
        return self._v1_1.cmd_set_device_mask(command_buffer, device_mask)

    def get_image_memory_requirements_2(
        self,
        device: Device,
        info: ImageMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements2.html
        """
        return self._v1_1.get_image_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_buffer_memory_requirements_2(
        self,
        device: Device,
        info: BufferMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements2.html
        """
        return self._v1_1.get_buffer_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[BufferMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_sparse_memory_requirements_2[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements2, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        return self._v1_1.get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin]]]()[],
        )

    def get_image_sparse_memory_requirements_2[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, info: ImageSparseMemoryRequirementsInfo2
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self._v1_1.get_image_sparse_memory_requirements_2(
    device,
    Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_image_sparse_memory_requirements_2(
    device,
    Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTrimCommandPool.html
        """
        return self._v1_1.trim_command_pool(device, command_pool, flags)

    def get_device_queue_2(self, device: Device, queue_info: DeviceQueueInfo2, mut queue: Queue):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue2.html
        """
        return self._v1_1.get_device_queue_2(
            device,
            Ptr(to=queue_info).bitcast[DeviceQueueInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=queue).bitcast[Queue]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_dispatch_base(
        self,
        command_buffer: CommandBuffer,
        base_group_x: UInt32,
        base_group_y: UInt32,
        base_group_z: UInt32,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchBase.html
        """
        return self._v1_1.cmd_dispatch_base(
            command_buffer,
            base_group_x,
            base_group_y,
            base_group_z,
            group_count_x,
            group_count_y,
            group_count_z,
        )

    def create_descriptor_update_template[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorUpdateTemplate.html
        """
        return self._v1_1.create_descriptor_update_template(
            device,
            Ptr(to=create_info).bitcast[DescriptorUpdateTemplateCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=descriptor_update_template).bitcast[DescriptorUpdateTemplate]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_update_template[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorUpdateTemplate.html
        """
        return self._v1_1.destroy_descriptor_update_template(
            device,
            descriptor_update_template,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def update_descriptor_set_with_template[p_data_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._v1_1.update_descriptor_set_with_template(
            device,
            descriptor_set,
            descriptor_update_template,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def get_descriptor_set_layout_support(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        mut support: DescriptorSetLayoutSupport,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutSupport.html
        """
        return self._v1_1.get_descriptor_set_layout_support(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=support).bitcast[DescriptorSetLayoutSupport]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def create_sampler_ycbcr_conversion[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSamplerYcbcrConversion.html
        """
        return self._v1_1.create_sampler_ycbcr_conversion(
            device,
            Ptr(to=create_info).bitcast[SamplerYcbcrConversionCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=ycbcr_conversion).bitcast[SamplerYcbcrConversion]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_sampler_ycbcr_conversion[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySamplerYcbcrConversion.html
        """
        return self._v1_1.destroy_sampler_ycbcr_conversion(
            device,
            ycbcr_conversion,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_query_pool(
        self, device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetQueryPool.html
        """
        return self._v1_2.reset_query_pool(device, query_pool, first_query, query_count)

    def get_semaphore_counter_value(
        self, device: Device, semaphore: Semaphore, mut value: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreCounterValue.html
        """
        return self._v1_2.get_semaphore_counter_value(
            device, semaphore, Ptr(to=value).bitcast[UInt64]().unsafe_origin_cast[MutUntrackedOrigin]()
        )

    def wait_semaphores(
        self, device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitSemaphores.html
        """
        return self._v1_2.wait_semaphores(
            device,
            Ptr(to=wait_info).bitcast[SemaphoreWaitInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            timeout,
        )

    def signal_semaphore(self, device: Device, signal_info: SemaphoreSignalInfo) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSignalSemaphore.html
        """
        return self._v1_2.signal_semaphore(
            device,
            Ptr(to=signal_info).bitcast[SemaphoreSignalInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._v1_2.get_buffer_device_address(
            device,
            Ptr(to=info).bitcast[BufferDeviceAddressInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_buffer_opaque_capture_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureAddress.html
        """
        return self._v1_2.get_buffer_opaque_capture_address(
            device,
            Ptr(to=info).bitcast[BufferDeviceAddressInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_device_memory_opaque_capture_address(
        self, device: Device, info: DeviceMemoryOpaqueCaptureAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryOpaqueCaptureAddress.html
        """
        return self._v1_2.get_device_memory_opaque_capture_address(
            device,
            Ptr(to=info).bitcast[DeviceMemoryOpaqueCaptureAddressInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_draw_indirect_count(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirectCount.html
        """
        return self._v1_2.cmd_draw_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )

    def cmd_draw_indexed_indirect_count(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirectCount.html
        """
        return self._v1_2.cmd_draw_indexed_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )

    def create_render_pass_2[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: RenderPassCreateInfo2,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass2.html
        """
        return self._v1_2.create_render_pass_2(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=render_pass).bitcast[RenderPass]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_begin_render_pass_2(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        subpass_begin_info: SubpassBeginInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass2.html
        """
        return self._v1_2.cmd_begin_render_pass_2(
            command_buffer,
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_next_subpass_2(
        self,
        command_buffer: CommandBuffer,
        subpass_begin_info: SubpassBeginInfo,
        subpass_end_info: SubpassEndInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass2.html
        """
        return self._v1_2.cmd_next_subpass_2(
            command_buffer,
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_end_render_pass_2(
        self, command_buffer: CommandBuffer, subpass_end_info: SubpassEndInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass2.html
        """
        return self._v1_2.cmd_end_render_pass_2(
            command_buffer,
            Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def create_private_data_slot[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PrivateDataSlotCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut private_data_slot: PrivateDataSlot,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePrivateDataSlot.html
        """
        return self._v1_3.create_private_data_slot(
            device,
            Ptr(to=create_info).bitcast[PrivateDataSlotCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=private_data_slot).bitcast[PrivateDataSlot]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_private_data_slot[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPrivateDataSlot.html
        """
        return self._v1_3.destroy_private_data_slot(
            device,
            private_data_slot,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def set_private_data(
        self,
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        data: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetPrivateData.html
        """
        return self._v1_3.set_private_data(device, object_type, object_handle, private_data_slot, data)

    def get_private_data(
        self,
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        mut data: UInt64,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPrivateData.html
        """
        return self._v1_3.get_private_data(
            device,
            object_type,
            object_handle,
            private_data_slot,
            Ptr(to=data).bitcast[UInt64]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_pipeline_barrier_2(
        self, command_buffer: CommandBuffer, dependency_info: DependencyInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier2.html
        """
        return self._v1_3.cmd_pipeline_barrier_2(
            command_buffer,
            Ptr(to=dependency_info).bitcast[DependencyInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_write_timestamp_2(
        self,
        command_buffer: CommandBuffer,
        stage: PipelineStageFlags2,
        query_pool: QueryPool,
        query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteTimestamp2.html
        """
        return self._v1_3.cmd_write_timestamp_2(command_buffer, stage, query_pool, query)

    def queue_submit_2[p_submits_origin: ImmutOrigin](
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo2, p_submits_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit2.html
        """
        return self._v1_3.queue_submit_2(
            queue,
            submit_count,
            Ptr(to=p_submits).bitcast[Ptr[SubmitInfo2, ImmutUntrackedOrigin]]()[],
            fence,
        )

    def cmd_copy_buffer_2(self, command_buffer: CommandBuffer, copy_buffer_info: CopyBufferInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer2.html
        """
        return self._v1_3.cmd_copy_buffer_2(
            command_buffer,
            Ptr(to=copy_buffer_info).bitcast[CopyBufferInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_copy_image_2(self, command_buffer: CommandBuffer, copy_image_info: CopyImageInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage2.html
        """
        return self._v1_3.cmd_copy_image_2(
            command_buffer,
            Ptr(to=copy_image_info).bitcast[CopyImageInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_copy_buffer_to_image_2(
        self, command_buffer: CommandBuffer, copy_buffer_to_image_info: CopyBufferToImageInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage2.html
        """
        return self._v1_3.cmd_copy_buffer_to_image_2(
            command_buffer,
            Ptr(to=copy_buffer_to_image_info).bitcast[CopyBufferToImageInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_copy_image_to_buffer_2(
        self, command_buffer: CommandBuffer, copy_image_to_buffer_info: CopyImageToBufferInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer2.html
        """
        return self._v1_3.cmd_copy_image_to_buffer_2(
            command_buffer,
            Ptr(to=copy_image_to_buffer_info).bitcast[CopyImageToBufferInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_device_buffer_memory_requirements(
        self,
        device: Device,
        info: DeviceBufferMemoryRequirements,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceBufferMemoryRequirements.html
        """
        return self._v1_3.get_device_buffer_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceBufferMemoryRequirements]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_device_image_memory_requirements(
        self,
        device: Device,
        info: DeviceImageMemoryRequirements,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageMemoryRequirements.html
        """
        return self._v1_3.get_device_image_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceImageMemoryRequirements]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_device_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        info: DeviceImageMemoryRequirements,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements2, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        return self._v1_3.get_device_image_sparse_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceImageMemoryRequirements]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin]]]()[],
        )

    def get_device_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, info: DeviceImageMemoryRequirements
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self._v1_3.get_device_image_sparse_memory_requirements(
    device,
    Ptr(to=info).bitcast[DeviceImageMemoryRequirements]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_3.get_device_image_sparse_memory_requirements(
    device,
    Ptr(to=info).bitcast[DeviceImageMemoryRequirements]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def cmd_set_event_2(
        self, command_buffer: CommandBuffer, event: Event, dependency_info: DependencyInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent2.html
        """
        return self._v1_3.cmd_set_event_2(
            command_buffer,
            event,
            Ptr(to=dependency_info).bitcast[DependencyInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_reset_event_2(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent2.html
        """
        return self._v1_3.cmd_reset_event_2(command_buffer, event, stage_mask)

    def cmd_wait_events_2[p_events_origin: ImmutOrigin, p_dependency_infos_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, p_events_origin],
        p_dependency_infos: Ptr[DependencyInfo, p_dependency_infos_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents2.html
        """
        return self._v1_3.cmd_wait_events_2(
            command_buffer,
            event_count,
            Ptr(to=p_events).bitcast[Ptr[Event, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_dependency_infos).bitcast[Ptr[DependencyInfo, ImmutUntrackedOrigin]]()[],
        )

    def cmd_blit_image_2(self, command_buffer: CommandBuffer, blit_image_info: BlitImageInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage2.html
        """
        return self._v1_3.cmd_blit_image_2(
            command_buffer,
            Ptr(to=blit_image_info).bitcast[BlitImageInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_resolve_image_2(
        self, command_buffer: CommandBuffer, resolve_image_info: ResolveImageInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage2.html
        """
        return self._v1_3.cmd_resolve_image_2(
            command_buffer,
            Ptr(to=resolve_image_info).bitcast[ResolveImageInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_begin_rendering(self, command_buffer: CommandBuffer, rendering_info: RenderingInfo):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRendering.html
        """
        return self._v1_3.cmd_begin_rendering(
            command_buffer,
            Ptr(to=rendering_info).bitcast[RenderingInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_end_rendering(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering.html
        """
        return self._v1_3.cmd_end_rendering(command_buffer)

    def cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCullMode.html
        """
        return self._v1_3.cmd_set_cull_mode(command_buffer, cull_mode)

    def cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFrontFace.html
        """
        return self._v1_3.cmd_set_front_face(command_buffer, front_face)

    def cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveTopology.html
        """
        return self._v1_3.cmd_set_primitive_topology(command_buffer, primitive_topology)

    def cmd_set_viewport_with_count[p_viewports_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWithCount.html
        """
        return self._v1_3.cmd_set_viewport_with_count(
            command_buffer,
            viewport_count,
            Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_scissor_with_count[p_scissors_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissorWithCount.html
        """
        return self._v1_3.cmd_set_scissor_with_count(
            command_buffer, scissor_count, Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[]
        )

    def cmd_bind_vertex_buffers_2[
        p_buffers_origin: ImmutOrigin,
        p_offsets_origin: ImmutOrigin,
        p_sizes_origin: ImmutOrigin,
        p_strides_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
        p_sizes: Optional[Ptr[DeviceSize, p_sizes_origin]],
        p_strides: Optional[Ptr[DeviceSize, p_strides_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers2.html
        """
        return self._v1_3.cmd_bind_vertex_buffers_2(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_sizes).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_strides).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthTestEnable.html
        """
        return self._v1_3.cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    def cmd_set_depth_write_enable(
        self, command_buffer: CommandBuffer, depth_write_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthWriteEnable.html
        """
        return self._v1_3.cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    def cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthCompareOp.html
        """
        return self._v1_3.cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    def cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBoundsTestEnable.html
        """
        return self._v1_3.cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    def cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilTestEnable.html
        """
        return self._v1_3.cmd_set_stencil_test_enable(command_buffer, stencil_test_enable)

    def cmd_set_stencil_op(
        self,
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilOp.html
        """
        return self._v1_3.cmd_set_stencil_op(
            command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op
        )

    def cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizerDiscardEnable.html
        """
        return self._v1_3.cmd_set_rasterizer_discard_enable(command_buffer, rasterizer_discard_enable)

    def cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBiasEnable.html
        """
        return self._v1_3.cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    def cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._v1_3.cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)


struct DeviceFunctionsV1_4(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: DeviceFunctionsAdditionsV1_0
    var _v1_1: DeviceFunctionsAdditionsV1_1
    var _v1_2: DeviceFunctionsAdditionsV1_2
    var _v1_3: DeviceFunctionsAdditionsV1_3
    var _v1_4: DeviceFunctionsAdditionsV1_4

    def __init__(out self, global_functions: GlobalFunctionsV1_4, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = DeviceFunctionsAdditionsV1_0(self._dlhandle, device)
        self._v1_1 = DeviceFunctionsAdditionsV1_1(self._dlhandle, device)
        self._v1_2 = DeviceFunctionsAdditionsV1_2(self._dlhandle, device)
        self._v1_3 = DeviceFunctionsAdditionsV1_3(self._dlhandle, device)
        self._v1_4 = DeviceFunctionsAdditionsV1_4(self._dlhandle, device)

    def get_device_proc_addr[p_name_origin: ImmutOrigin](
        self, device: Device, p_name: CStringSlice[p_name_origin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceProcAddr.html
        """
        return self._v1_0.get_device_proc_addr(
            device, Ptr(to=p_name).bitcast[CStringSlice[ImmutUntrackedOrigin]]()[]
        )

    def destroy_device[p_allocator_origin: ImmutOrigin](
        self, device: Device, p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDevice.html
        """
        return self._v1_0.destroy_device(
            device,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_device_queue(
        self, device: Device, queue_family_index: UInt32, queue_index: UInt32, mut queue: Queue
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue.html
        """
        return self._v1_0.get_device_queue(
            device,
            queue_family_index,
            queue_index,
            Ptr(to=queue).bitcast[Queue]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def queue_submit[p_submits_origin: ImmutOrigin](
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, p_submits_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit.html
        """
        return self._v1_0.queue_submit(
            queue, submit_count, Ptr(to=p_submits).bitcast[Ptr[SubmitInfo, ImmutUntrackedOrigin]]()[], fence
        )

    def queue_wait_idle(self, queue: Queue) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueWaitIdle.html
        """
        return self._v1_0.queue_wait_idle(queue)

    def device_wait_idle(self, device: Device) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeviceWaitIdle.html
        """
        return self._v1_0.device_wait_idle(device)

    def allocate_memory[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut memory: DeviceMemory,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateMemory.html
        """
        return self._v1_0.allocate_memory(
            device,
            Ptr(to=allocate_info).bitcast[MemoryAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=memory).bitcast[DeviceMemory]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def free_memory[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        memory: DeviceMemory,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeMemory.html
        """
        return self._v1_0.free_memory(
            device,
            memory,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def map_memory[p_data_origin: MutOrigin](
        self,
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        mut p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMapMemory.html
        """
        return self._v1_0.map_memory(
            device,
            memory,
            offset,
            size,
            flags,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def unmap_memory(self, device: Device, memory: DeviceMemory):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory.html
        """
        return self._v1_0.unmap_memory(device, memory)

    def flush_mapped_memory_ranges[p_memory_ranges_origin: ImmutOrigin](
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, p_memory_ranges_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFlushMappedMemoryRanges.html
        """
        return self._v1_0.flush_mapped_memory_ranges(
            device,
            memory_range_count,
            Ptr(to=p_memory_ranges).bitcast[Ptr[MappedMemoryRange, ImmutUntrackedOrigin]]()[],
        )

    def invalidate_mapped_memory_ranges[p_memory_ranges_origin: ImmutOrigin](
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, p_memory_ranges_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInvalidateMappedMemoryRanges.html
        """
        return self._v1_0.invalidate_mapped_memory_ranges(
            device,
            memory_range_count,
            Ptr(to=p_memory_ranges).bitcast[Ptr[MappedMemoryRange, ImmutUntrackedOrigin]]()[],
        )

    def get_device_memory_commitment(
        self, device: Device, memory: DeviceMemory, mut committed_memory_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryCommitment.html
        """
        return self._v1_0.get_device_memory_commitment(
            device,
            memory,
            Ptr(to=committed_memory_in_bytes).bitcast[DeviceSize]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def bind_buffer_memory(
        self, device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory.html
        """
        return self._v1_0.bind_buffer_memory(device, buffer, memory, memory_offset)

    def bind_image_memory(
        self, device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory.html
        """
        return self._v1_0.bind_image_memory(device, image, memory, memory_offset)

    def get_buffer_memory_requirements(
        self, device: Device, buffer: Buffer, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements.html
        """
        return self._v1_0.get_buffer_memory_requirements(
            device,
            buffer,
            Ptr(to=memory_requirements).bitcast[MemoryRequirements]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_memory_requirements(
        self, device: Device, image: Image, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements.html
        """
        return self._v1_0.get_image_memory_requirements(
            device,
            image,
            Ptr(to=memory_requirements).bitcast[MemoryRequirements]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        image: Image,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        return self._v1_0.get_image_sparse_memory_requirements(
            device,
            image,
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin]]]()[],
        )

    def get_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, image: Image
    ) -> List[SparseImageMemoryRequirements]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements]()
        var count: UInt32 = 0
        self._v1_0.get_image_sparse_memory_requirements(
    device,
    image,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_0.get_image_sparse_memory_requirements(
    device,
    image,
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def queue_bind_sparse[p_bind_info_origin: ImmutOrigin](
        self,
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, p_bind_info_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBindSparse.html
        """
        return self._v1_0.queue_bind_sparse(
            queue,
            bind_info_count,
            Ptr(to=p_bind_info).bitcast[Ptr[BindSparseInfo, ImmutUntrackedOrigin]]()[],
            fence,
        )

    def create_fence[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFence.html
        """
        return self._v1_0.create_fence(
            device,
            Ptr(to=create_info).bitcast[FenceCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=fence).bitcast[Fence]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_fence[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        fence: Fence,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFence.html
        """
        return self._v1_0.destroy_fence(
            device,
            fence,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_fences[p_fences_origin: ImmutOrigin](
        self, device: Device, fence_count: UInt32, p_fences: Ptr[Fence, p_fences_origin]
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetFences.html
        """
        return self._v1_0.reset_fences(
            device, fence_count, Ptr(to=p_fences).bitcast[Ptr[Fence, ImmutUntrackedOrigin]]()[]
        )

    def get_fence_status(self, device: Device, fence: Fence) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceStatus.html
        """
        return self._v1_0.get_fence_status(device, fence)

    def wait_for_fences[p_fences_origin: ImmutOrigin](
        self,
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, p_fences_origin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForFences.html
        """
        return self._v1_0.wait_for_fences(
            device,
            fence_count,
            Ptr(to=p_fences).bitcast[Ptr[Fence, ImmutUntrackedOrigin]]()[],
            wait_all,
            timeout,
        )

    def create_semaphore[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut semaphore: Semaphore,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSemaphore.html
        """
        return self._v1_0.create_semaphore(
            device,
            Ptr(to=create_info).bitcast[SemaphoreCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=semaphore).bitcast[Semaphore]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_semaphore[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        semaphore: Semaphore,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySemaphore.html
        """
        return self._v1_0.destroy_semaphore(
            device,
            semaphore,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_query_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut query_pool: QueryPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateQueryPool.html
        """
        return self._v1_0.create_query_pool(
            device,
            Ptr(to=create_info).bitcast[QueryPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=query_pool).bitcast[QueryPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_query_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        query_pool: QueryPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyQueryPool.html
        """
        return self._v1_0.destroy_query_pool(
            device,
            query_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_query_pool_results[p_data_origin: MutOrigin](
        self,
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, p_data_origin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueryPoolResults.html
        """
        return self._v1_0.get_query_pool_results(
            device,
            query_pool,
            first_query,
            query_count,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]()[],
            stride,
            flags,
        )

    def create_buffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut buffer: Buffer,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBuffer.html
        """
        return self._v1_0.create_buffer(
            device,
            Ptr(to=create_info).bitcast[BufferCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=buffer).bitcast[Buffer]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_buffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        buffer: Buffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBuffer.html
        """
        return self._v1_0.destroy_buffer(
            device,
            buffer,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_image[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut image: Image,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImage.html
        """
        return self._v1_0.create_image(
            device,
            Ptr(to=create_info).bitcast[ImageCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=image).bitcast[Image]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_image[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        image: Image,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImage.html
        """
        return self._v1_0.destroy_image(
            device,
            image,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_image_subresource_layout(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource,
        mut layout: SubresourceLayout,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout.html
        """
        return self._v1_0.get_image_subresource_layout(
            device,
            image,
            Ptr(to=subresource).bitcast[ImageSubresource]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=layout).bitcast[SubresourceLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def create_image_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: ImageView,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImageView.html
        """
        return self._v1_0.create_image_view(
            device,
            Ptr(to=create_info).bitcast[ImageViewCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[ImageView]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_image_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        image_view: ImageView,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImageView.html
        """
        return self._v1_0.destroy_image_view(
            device,
            image_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_command_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut command_pool: CommandPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCommandPool.html
        """
        return self._v1_0.create_command_pool(
            device,
            Ptr(to=create_info).bitcast[CommandPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=command_pool).bitcast[CommandPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_command_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        command_pool: CommandPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCommandPool.html
        """
        return self._v1_0.destroy_command_pool(
            device,
            command_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandPool.html
        """
        return self._v1_0.reset_command_pool(device, command_pool, flags)

    def allocate_command_buffers[p_command_buffers_origin: MutOrigin](
        self,
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateCommandBuffers.html
        """
        return self._v1_0.allocate_command_buffers(
            device,
            Ptr(to=allocate_info).bitcast[CommandBufferAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, MutUntrackedOrigin]]()[],
        )

    def free_command_buffers[p_command_buffers_origin: ImmutOrigin](
        self,
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeCommandBuffers.html
        """
        return self._v1_0.free_command_buffers(
            device,
            command_pool,
            command_buffer_count,
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, ImmutUntrackedOrigin]]()[],
        )

    def begin_command_buffer(
        self, command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBeginCommandBuffer.html
        """
        return self._v1_0.begin_command_buffer(
            command_buffer,
            Ptr(to=begin_info).bitcast[CommandBufferBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def end_command_buffer(self, command_buffer: CommandBuffer) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEndCommandBuffer.html
        """
        return self._v1_0.end_command_buffer(command_buffer)

    def reset_command_buffer(
        self, command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandBuffer.html
        """
        return self._v1_0.reset_command_buffer(command_buffer, flags)

    def cmd_copy_buffer[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer.html
        """
        return self._v1_0.cmd_copy_buffer(
            command_buffer,
            src_buffer,
            dst_buffer,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage.html
        """
        return self._v1_0.cmd_copy_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_buffer_to_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html
        """
        return self._v1_0.cmd_copy_buffer_to_image(
            command_buffer,
            src_buffer,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_copy_image_to_buffer[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer.html
        """
        return self._v1_0.cmd_copy_image_to_buffer(
            command_buffer,
            src_image,
            src_image_layout,
            dst_buffer,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[BufferImageCopy, ImmutUntrackedOrigin]]()[],
        )

    def cmd_update_buffer[p_data_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdateBuffer.html
        """
        return self._v1_0.cmd_update_buffer(
            command_buffer,
            dst_buffer,
            dst_offset,
            data_size,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def cmd_fill_buffer(
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        size: DeviceSize,
        data: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdFillBuffer.html
        """
        return self._v1_0.cmd_fill_buffer(command_buffer, dst_buffer, dst_offset, size, data)

    def cmd_pipeline_barrier[
        p_memory_barriers_origin: ImmutOrigin,
        p_buffer_memory_barriers_origin: ImmutOrigin,
        p_image_memory_barriers_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, p_memory_barriers_origin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, p_buffer_memory_barriers_origin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, p_image_memory_barriers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier.html
        """
        return self._v1_0.cmd_pipeline_barrier(
            command_buffer,
            src_stage_mask,
            dst_stage_mask,
            dependency_flags,
            memory_barrier_count,
            Ptr(to=p_memory_barriers).bitcast[Ptr[MemoryBarrier, ImmutUntrackedOrigin]]()[],
            buffer_memory_barrier_count,
            Ptr(to=p_buffer_memory_barriers).bitcast[Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin]]()[],
            image_memory_barrier_count,
            Ptr(to=p_image_memory_barriers).bitcast[Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin]]()[],
        )

    def cmd_begin_query(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginQuery.html
        """
        return self._v1_0.cmd_begin_query(command_buffer, query_pool, query, flags)

    def cmd_end_query(self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQuery.html
        """
        return self._v1_0.cmd_end_query(command_buffer, query_pool, query)

    def cmd_reset_query_pool(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetQueryPool.html
        """
        return self._v1_0.cmd_reset_query_pool(command_buffer, query_pool, first_query, query_count)

    def cmd_write_timestamp(
        self,
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        query_pool: QueryPool,
        query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteTimestamp.html
        """
        return self._v1_0.cmd_write_timestamp(command_buffer, pipeline_stage, query_pool, query)

    def cmd_copy_query_pool_results(
        self,
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        stride: DeviceSize,
        flags: QueryResultFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyQueryPoolResults.html
        """
        return self._v1_0.cmd_copy_query_pool_results(
            command_buffer, query_pool, first_query, query_count, dst_buffer, dst_offset, stride, flags
        )

    def cmd_execute_commands[p_command_buffers_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, p_command_buffers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteCommands.html
        """
        return self._v1_0.cmd_execute_commands(
            command_buffer,
            command_buffer_count,
            Ptr(to=p_command_buffers).bitcast[Ptr[CommandBuffer, ImmutUntrackedOrigin]]()[],
        )

    def create_event[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut event: Event,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateEvent.html
        """
        return self._v1_0.create_event(
            device,
            Ptr(to=create_info).bitcast[EventCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=event).bitcast[Event]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_event[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        event: Event,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyEvent.html
        """
        return self._v1_0.destroy_event(
            device,
            event,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_event_status(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEventStatus.html
        """
        return self._v1_0.get_event_status(device, event)

    def set_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetEvent.html
        """
        return self._v1_0.set_event(device, event)

    def reset_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetEvent.html
        """
        return self._v1_0.reset_event(device, event)

    def create_buffer_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut view: BufferView,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferView.html
        """
        return self._v1_0.create_buffer_view(
            device,
            Ptr(to=create_info).bitcast[BufferViewCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=view).bitcast[BufferView]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_buffer_view[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        buffer_view: BufferView,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferView.html
        """
        return self._v1_0.destroy_buffer_view(
            device,
            buffer_view,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_shader_module[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut shader_module: ShaderModule,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShaderModule.html
        """
        return self._v1_0.create_shader_module(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=shader_module).bitcast[ShaderModule]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_shader_module[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderModule.html
        """
        return self._v1_0.destroy_shader_module(
            device,
            shader_module,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_pipeline_cache[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut pipeline_cache: PipelineCache,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineCache.html
        """
        return self._v1_0.create_pipeline_cache(
            device,
            Ptr(to=create_info).bitcast[PipelineCacheCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=pipeline_cache).bitcast[PipelineCache]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_pipeline_cache[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineCache.html
        """
        return self._v1_0.destroy_pipeline_cache(
            device,
            pipeline_cache,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_pipeline_cache_data[p_data_origin: MutOrigin](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        mut data_size: UInt,
        p_data: Optional[Ptr[NoneType, p_data_origin]],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        return self._v1_0.get_pipeline_cache_data(
            device,
            pipeline_cache,
            Ptr(to=data_size).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Optional[Ptr[NoneType, MutUntrackedOrigin]]]()[],
        )

    def get_pipeline_cache_data[p_data_origin: MutOrigin](
        self, device: Device, pipeline_cache: PipelineCache
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._v1_0.get_pipeline_cache_data(
                device,
                pipeline_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                Ptr[NoneType, MutUntrackedOrigin].unsafe_dangling(),
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._v1_0.get_pipeline_cache_data(
                device,
                pipeline_cache,
                Ptr(to=count).bitcast[UInt]().unsafe_origin_cast[MutUntrackedOrigin](),
                list.unsafe_ptr().bitcast[NoneType]().unsafe_origin_cast[MutUntrackedOrigin](),
            )
        list._len = Int(count)
        return ListResult(list^, result)

    def merge_pipeline_caches[p_src_caches_origin: ImmutOrigin](
        self,
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, p_src_caches_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergePipelineCaches.html
        """
        return self._v1_0.merge_pipeline_caches(
            device,
            dst_cache,
            src_cache_count,
            Ptr(to=p_src_caches).bitcast[Ptr[PipelineCache, ImmutUntrackedOrigin]]()[],
        )

    def create_compute_pipelines[
        p_create_infos_origin: ImmutOrigin,
        p_allocator_origin: ImmutOrigin,
        p_pipelines_origin: MutOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateComputePipelines.html
        """
        return self._v1_0.create_compute_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[ComputePipelineCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def destroy_pipeline[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline: Pipeline,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipeline.html
        """
        return self._v1_0.destroy_pipeline(
            device,
            pipeline,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_pipeline_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut pipeline_layout: PipelineLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineLayout.html
        """
        return self._v1_0.create_pipeline_layout(
            device,
            Ptr(to=create_info).bitcast[PipelineLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=pipeline_layout).bitcast[PipelineLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_pipeline_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineLayout.html
        """
        return self._v1_0.destroy_pipeline_layout(
            device,
            pipeline_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_sampler[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut sampler: Sampler,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSampler.html
        """
        return self._v1_0.create_sampler(
            device,
            Ptr(to=create_info).bitcast[SamplerCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=sampler).bitcast[Sampler]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_sampler[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        sampler: Sampler,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySampler.html
        """
        return self._v1_0.destroy_sampler(
            device,
            sampler,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_descriptor_set_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut set_layout: DescriptorSetLayout,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorSetLayout.html
        """
        return self._v1_0.create_descriptor_set_layout(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=set_layout).bitcast[DescriptorSetLayout]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_set_layout[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorSetLayout.html
        """
        return self._v1_0.destroy_descriptor_set_layout(
            device,
            descriptor_set_layout,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_descriptor_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut descriptor_pool: DescriptorPool,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorPool.html
        """
        return self._v1_0.create_descriptor_pool(
            device,
            Ptr(to=create_info).bitcast[DescriptorPoolCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=descriptor_pool).bitcast[DescriptorPool]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_pool[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorPool.html
        """
        return self._v1_0.destroy_descriptor_pool(
            device,
            descriptor_pool,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_descriptor_pool(
        self, device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetDescriptorPool.html
        """
        return self._v1_0.reset_descriptor_pool(device, descriptor_pool, flags)

    def allocate_descriptor_sets[p_descriptor_sets_origin: MutOrigin](
        self,
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateDescriptorSets.html
        """
        return self._v1_0.allocate_descriptor_sets(
            device,
            Ptr(to=allocate_info).bitcast[DescriptorSetAllocateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, MutUntrackedOrigin]]()[],
        )

    def free_descriptor_sets[p_descriptor_sets_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeDescriptorSets.html
        """
        return self._v1_0.free_descriptor_sets(
            device,
            descriptor_pool,
            descriptor_set_count,
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def update_descriptor_sets[
        p_descriptor_writes_origin: ImmutOrigin, p_descriptor_copies_origin: ImmutOrigin
    ](
        self,
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, p_descriptor_writes_origin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, p_descriptor_copies_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSets.html
        """
        return self._v1_0.update_descriptor_sets(
            device,
            descriptor_write_count,
            Ptr(to=p_descriptor_writes).bitcast[Ptr[WriteDescriptorSet, ImmutUntrackedOrigin]]()[],
            descriptor_copy_count,
            Ptr(to=p_descriptor_copies).bitcast[Ptr[CopyDescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def cmd_bind_pipeline(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipeline.html
        """
        return self._v1_0.cmd_bind_pipeline(command_buffer, pipeline_bind_point, pipeline)

    def cmd_bind_descriptor_sets[
        p_descriptor_sets_origin: ImmutOrigin, p_dynamic_offsets_origin: ImmutOrigin
    ](
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, p_descriptor_sets_origin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, p_dynamic_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorSets.html
        """
        return self._v1_0.cmd_bind_descriptor_sets(
            command_buffer,
            pipeline_bind_point,
            layout,
            first_set,
            descriptor_set_count,
            Ptr(to=p_descriptor_sets).bitcast[Ptr[DescriptorSet, ImmutUntrackedOrigin]]()[],
            dynamic_offset_count,
            Ptr(to=p_dynamic_offsets).bitcast[Ptr[UInt32, ImmutUntrackedOrigin]]()[],
        )

    def cmd_clear_color_image[p_ranges_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, p_ranges_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html
        """
        return self._v1_0.cmd_clear_color_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=color).bitcast[ClearColorValue]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            range_count,
            Ptr(to=p_ranges).bitcast[Ptr[ImageSubresourceRange, ImmutUntrackedOrigin]]()[],
        )

    def cmd_dispatch(
        self,
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatch.html
        """
        return self._v1_0.cmd_dispatch(command_buffer, group_count_x, group_count_y, group_count_z)

    def cmd_dispatch_indirect(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchIndirect.html
        """
        return self._v1_0.cmd_dispatch_indirect(command_buffer, buffer, offset)

    def cmd_set_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent.html
        """
        return self._v1_0.cmd_set_event(command_buffer, event, stage_mask)

    def cmd_reset_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent.html
        """
        return self._v1_0.cmd_reset_event(command_buffer, event, stage_mask)

    def cmd_wait_events[
        p_events_origin: ImmutOrigin,
        p_memory_barriers_origin: ImmutOrigin,
        p_buffer_memory_barriers_origin: ImmutOrigin,
        p_image_memory_barriers_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, p_events_origin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, p_memory_barriers_origin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, p_buffer_memory_barriers_origin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, p_image_memory_barriers_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents.html
        """
        return self._v1_0.cmd_wait_events(
            command_buffer,
            event_count,
            Ptr(to=p_events).bitcast[Ptr[Event, ImmutUntrackedOrigin]]()[],
            src_stage_mask,
            dst_stage_mask,
            memory_barrier_count,
            Ptr(to=p_memory_barriers).bitcast[Ptr[MemoryBarrier, ImmutUntrackedOrigin]]()[],
            buffer_memory_barrier_count,
            Ptr(to=p_buffer_memory_barriers).bitcast[Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin]]()[],
            image_memory_barrier_count,
            Ptr(to=p_image_memory_barriers).bitcast[Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin]]()[],
        )

    def cmd_push_constants[p_values_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, p_values_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants.html
        """
        return self._v1_0.cmd_push_constants(
            command_buffer,
            layout,
            stage_flags,
            offset,
            size,
            Ptr(to=p_values).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def create_graphics_pipelines[
        p_create_infos_origin: ImmutOrigin,
        p_allocator_origin: ImmutOrigin,
        p_pipelines_origin: MutOrigin,
    ](
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, p_create_infos_origin],
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        p_pipelines: Ptr[Pipeline, p_pipelines_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateGraphicsPipelines.html
        """
        return self._v1_0.create_graphics_pipelines(
            device,
            pipeline_cache,
            create_info_count,
            Ptr(to=p_create_infos).bitcast[Ptr[GraphicsPipelineCreateInfo, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_pipelines).bitcast[Ptr[Pipeline, MutUntrackedOrigin]]()[],
        )

    def create_framebuffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut framebuffer: Framebuffer,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFramebuffer.html
        """
        return self._v1_0.create_framebuffer(
            device,
            Ptr(to=create_info).bitcast[FramebufferCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=framebuffer).bitcast[Framebuffer]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_framebuffer[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFramebuffer.html
        """
        return self._v1_0.destroy_framebuffer(
            device,
            framebuffer,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def create_render_pass[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass.html
        """
        return self._v1_0.create_render_pass(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=render_pass).bitcast[RenderPass]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_render_pass[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        render_pass: RenderPass,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyRenderPass.html
        """
        return self._v1_0.destroy_render_pass(
            device,
            render_pass,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def get_render_area_granularity(
        self, device: Device, render_pass: RenderPass, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderAreaGranularity.html
        """
        return self._v1_0.get_render_area_granularity(
            device,
            render_pass,
            Ptr(to=granularity).bitcast[Extent2D]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_set_viewport[p_viewports_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewport.html
        """
        return self._v1_0.cmd_set_viewport(
            command_buffer,
            first_viewport,
            viewport_count,
            Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_scissor[p_scissors_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissor.html
        """
        return self._v1_0.cmd_set_scissor(
            command_buffer,
            first_scissor,
            scissor_count,
            Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_line_width(self, command_buffer: CommandBuffer, line_width: Float32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineWidth.html
        """
        return self._v1_0.cmd_set_line_width(command_buffer, line_width)

    def cmd_set_depth_bias(
        self,
        command_buffer: CommandBuffer,
        depth_bias_constant_factor: Float32,
        depth_bias_clamp: Float32,
        depth_bias_slope_factor: Float32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBias.html
        """
        return self._v1_0.cmd_set_depth_bias(
            command_buffer, depth_bias_constant_factor, depth_bias_clamp, depth_bias_slope_factor
        )

    def cmd_set_blend_constants(
        self, command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetBlendConstants.html
        """
        return self._v1_0.cmd_set_blend_constants(command_buffer, blend_constants)

    def cmd_set_depth_bounds(
        self, command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBounds.html
        """
        return self._v1_0.cmd_set_depth_bounds(command_buffer, min_depth_bounds, max_depth_bounds)

    def cmd_set_stencil_compare_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilCompareMask.html
        """
        return self._v1_0.cmd_set_stencil_compare_mask(command_buffer, face_mask, compare_mask)

    def cmd_set_stencil_write_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilWriteMask.html
        """
        return self._v1_0.cmd_set_stencil_write_mask(command_buffer, face_mask, write_mask)

    def cmd_set_stencil_reference(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilReference.html
        """
        return self._v1_0.cmd_set_stencil_reference(command_buffer, face_mask, reference)

    def cmd_bind_index_buffer(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        index_type: IndexType,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindIndexBuffer.html
        """
        return self._v1_0.cmd_bind_index_buffer(command_buffer, buffer, offset, index_type)

    def cmd_bind_vertex_buffers[p_buffers_origin: ImmutOrigin, p_offsets_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers.html
        """
        return self._v1_0.cmd_bind_vertex_buffers(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
        )

    def cmd_draw(
        self,
        command_buffer: CommandBuffer,
        vertex_count: UInt32,
        instance_count: UInt32,
        first_vertex: UInt32,
        first_instance: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDraw.html
        """
        return self._v1_0.cmd_draw(
            command_buffer, vertex_count, instance_count, first_vertex, first_instance
        )

    def cmd_draw_indexed(
        self,
        command_buffer: CommandBuffer,
        index_count: UInt32,
        instance_count: UInt32,
        first_index: UInt32,
        vertex_offset: Int32,
        first_instance: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexed.html
        """
        return self._v1_0.cmd_draw_indexed(
            command_buffer, index_count, instance_count, first_index, vertex_offset, first_instance
        )

    def cmd_draw_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirect.html
        """
        return self._v1_0.cmd_draw_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_draw_indexed_indirect(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirect.html
        """
        return self._v1_0.cmd_draw_indexed_indirect(command_buffer, buffer, offset, draw_count, stride)

    def cmd_blit_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, p_regions_origin],
        filter: Filter,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage.html
        """
        return self._v1_0.cmd_blit_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageBlit, ImmutUntrackedOrigin]]()[],
            filter,
        )

    def cmd_clear_depth_stencil_image[p_ranges_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, p_ranges_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearDepthStencilImage.html
        """
        return self._v1_0.cmd_clear_depth_stencil_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=depth_stencil).bitcast[ClearDepthStencilValue]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            range_count,
            Ptr(to=p_ranges).bitcast[Ptr[ImageSubresourceRange, ImmutUntrackedOrigin]]()[],
        )

    def cmd_clear_attachments[p_attachments_origin: ImmutOrigin, p_rects_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, p_attachments_origin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, p_rects_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearAttachments.html
        """
        return self._v1_0.cmd_clear_attachments(
            command_buffer,
            attachment_count,
            Ptr(to=p_attachments).bitcast[Ptr[ClearAttachment, ImmutUntrackedOrigin]]()[],
            rect_count,
            Ptr(to=p_rects).bitcast[Ptr[ClearRect, ImmutUntrackedOrigin]]()[],
        )

    def cmd_resolve_image[p_regions_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, p_regions_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage.html
        """
        return self._v1_0.cmd_resolve_image(
            command_buffer,
            src_image,
            src_image_layout,
            dst_image,
            dst_image_layout,
            region_count,
            Ptr(to=p_regions).bitcast[Ptr[ImageResolve, ImmutUntrackedOrigin]]()[],
        )

    def cmd_begin_render_pass(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass.html
        """
        return self._v1_0.cmd_begin_render_pass(
            command_buffer,
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            contents,
        )

    def cmd_next_subpass(self, command_buffer: CommandBuffer, contents: SubpassContents):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass.html
        """
        return self._v1_0.cmd_next_subpass(command_buffer, contents)

    def cmd_end_render_pass(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass.html
        """
        return self._v1_0.cmd_end_render_pass(command_buffer)

    def bind_buffer_memory_2[p_bind_infos_origin: ImmutOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory2.html
        """
        return self._v1_1.bind_buffer_memory_2(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindBufferMemoryInfo, ImmutUntrackedOrigin]]()[],
        )

    def bind_image_memory_2[p_bind_infos_origin: ImmutOrigin](
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, p_bind_infos_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory2.html
        """
        return self._v1_1.bind_image_memory_2(
            device,
            bind_info_count,
            Ptr(to=p_bind_infos).bitcast[Ptr[BindImageMemoryInfo, ImmutUntrackedOrigin]]()[],
        )

    def get_device_group_peer_memory_features(
        self,
        device: Device,
        heap_index: UInt32,
        local_device_index: UInt32,
        remote_device_index: UInt32,
        mut peer_memory_features: PeerMemoryFeatureFlags,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceGroupPeerMemoryFeatures.html
        """
        return self._v1_1.get_device_group_peer_memory_features(
            device,
            heap_index,
            local_device_index,
            remote_device_index,
            Ptr(to=peer_memory_features).bitcast[PeerMemoryFeatureFlags]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_set_device_mask(self, command_buffer: CommandBuffer, device_mask: UInt32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDeviceMask.html
        """
        return self._v1_1.cmd_set_device_mask(command_buffer, device_mask)

    def get_image_memory_requirements_2(
        self,
        device: Device,
        info: ImageMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements2.html
        """
        return self._v1_1.get_image_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_buffer_memory_requirements_2(
        self,
        device: Device,
        info: BufferMemoryRequirementsInfo2,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements2.html
        """
        return self._v1_1.get_buffer_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[BufferMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_sparse_memory_requirements_2[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements2, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        return self._v1_1.get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin]]]()[],
        )

    def get_image_sparse_memory_requirements_2[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, info: ImageSparseMemoryRequirementsInfo2
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self._v1_1.get_image_sparse_memory_requirements_2(
    device,
    Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_1.get_image_sparse_memory_requirements_2(
    device,
    Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTrimCommandPool.html
        """
        return self._v1_1.trim_command_pool(device, command_pool, flags)

    def get_device_queue_2(self, device: Device, queue_info: DeviceQueueInfo2, mut queue: Queue):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue2.html
        """
        return self._v1_1.get_device_queue_2(
            device,
            Ptr(to=queue_info).bitcast[DeviceQueueInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=queue).bitcast[Queue]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_dispatch_base(
        self,
        command_buffer: CommandBuffer,
        base_group_x: UInt32,
        base_group_y: UInt32,
        base_group_z: UInt32,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchBase.html
        """
        return self._v1_1.cmd_dispatch_base(
            command_buffer,
            base_group_x,
            base_group_y,
            base_group_z,
            group_count_x,
            group_count_y,
            group_count_z,
        )

    def create_descriptor_update_template[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorUpdateTemplate.html
        """
        return self._v1_1.create_descriptor_update_template(
            device,
            Ptr(to=create_info).bitcast[DescriptorUpdateTemplateCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=descriptor_update_template).bitcast[DescriptorUpdateTemplate]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_descriptor_update_template[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorUpdateTemplate.html
        """
        return self._v1_1.destroy_descriptor_update_template(
            device,
            descriptor_update_template,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def update_descriptor_set_with_template[p_data_origin: ImmutOrigin](
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._v1_1.update_descriptor_set_with_template(
            device,
            descriptor_set,
            descriptor_update_template,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def get_descriptor_set_layout_support(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        mut support: DescriptorSetLayoutSupport,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDescriptorSetLayoutSupport.html
        """
        return self._v1_1.get_descriptor_set_layout_support(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=support).bitcast[DescriptorSetLayoutSupport]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def create_sampler_ycbcr_conversion[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSamplerYcbcrConversion.html
        """
        return self._v1_1.create_sampler_ycbcr_conversion(
            device,
            Ptr(to=create_info).bitcast[SamplerYcbcrConversionCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=ycbcr_conversion).bitcast[SamplerYcbcrConversion]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_sampler_ycbcr_conversion[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySamplerYcbcrConversion.html
        """
        return self._v1_1.destroy_sampler_ycbcr_conversion(
            device,
            ycbcr_conversion,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def reset_query_pool(
        self, device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetQueryPool.html
        """
        return self._v1_2.reset_query_pool(device, query_pool, first_query, query_count)

    def get_semaphore_counter_value(
        self, device: Device, semaphore: Semaphore, mut value: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreCounterValue.html
        """
        return self._v1_2.get_semaphore_counter_value(
            device, semaphore, Ptr(to=value).bitcast[UInt64]().unsafe_origin_cast[MutUntrackedOrigin]()
        )

    def wait_semaphores(
        self, device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitSemaphores.html
        """
        return self._v1_2.wait_semaphores(
            device,
            Ptr(to=wait_info).bitcast[SemaphoreWaitInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            timeout,
        )

    def signal_semaphore(self, device: Device, signal_info: SemaphoreSignalInfo) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSignalSemaphore.html
        """
        return self._v1_2.signal_semaphore(
            device,
            Ptr(to=signal_info).bitcast[SemaphoreSignalInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._v1_2.get_buffer_device_address(
            device,
            Ptr(to=info).bitcast[BufferDeviceAddressInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_buffer_opaque_capture_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureAddress.html
        """
        return self._v1_2.get_buffer_opaque_capture_address(
            device,
            Ptr(to=info).bitcast[BufferDeviceAddressInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_device_memory_opaque_capture_address(
        self, device: Device, info: DeviceMemoryOpaqueCaptureAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryOpaqueCaptureAddress.html
        """
        return self._v1_2.get_device_memory_opaque_capture_address(
            device,
            Ptr(to=info).bitcast[DeviceMemoryOpaqueCaptureAddressInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_draw_indirect_count(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndirectCount.html
        """
        return self._v1_2.cmd_draw_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )

    def cmd_draw_indexed_indirect_count(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDrawIndexedIndirectCount.html
        """
        return self._v1_2.cmd_draw_indexed_indirect_count(
            command_buffer, buffer, offset, count_buffer, count_buffer_offset, max_draw_count, stride
        )

    def create_render_pass_2[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: RenderPassCreateInfo2,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass2.html
        """
        return self._v1_2.create_render_pass_2(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=render_pass).bitcast[RenderPass]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_begin_render_pass_2(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        subpass_begin_info: SubpassBeginInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass2.html
        """
        return self._v1_2.cmd_begin_render_pass_2(
            command_buffer,
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_next_subpass_2(
        self,
        command_buffer: CommandBuffer,
        subpass_begin_info: SubpassBeginInfo,
        subpass_end_info: SubpassEndInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass2.html
        """
        return self._v1_2.cmd_next_subpass_2(
            command_buffer,
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_end_render_pass_2(
        self, command_buffer: CommandBuffer, subpass_end_info: SubpassEndInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass2.html
        """
        return self._v1_2.cmd_end_render_pass_2(
            command_buffer,
            Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def create_private_data_slot[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        create_info: PrivateDataSlotCreateInfo,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
        mut private_data_slot: PrivateDataSlot,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePrivateDataSlot.html
        """
        return self._v1_3.create_private_data_slot(
            device,
            Ptr(to=create_info).bitcast[PrivateDataSlotCreateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
            Ptr(to=private_data_slot).bitcast[PrivateDataSlot]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def destroy_private_data_slot[p_allocator_origin: ImmutOrigin](
        self,
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Optional[Ptr[AllocationCallbacks, p_allocator_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPrivateDataSlot.html
        """
        return self._v1_3.destroy_private_data_slot(
            device,
            private_data_slot,
            Ptr(to=p_allocator).bitcast[Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]]()[],
        )

    def set_private_data(
        self,
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        data: UInt64,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetPrivateData.html
        """
        return self._v1_3.set_private_data(device, object_type, object_handle, private_data_slot, data)

    def get_private_data(
        self,
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        mut data: UInt64,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPrivateData.html
        """
        return self._v1_3.get_private_data(
            device,
            object_type,
            object_handle,
            private_data_slot,
            Ptr(to=data).bitcast[UInt64]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_pipeline_barrier_2(
        self, command_buffer: CommandBuffer, dependency_info: DependencyInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier2.html
        """
        return self._v1_3.cmd_pipeline_barrier_2(
            command_buffer,
            Ptr(to=dependency_info).bitcast[DependencyInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_write_timestamp_2(
        self,
        command_buffer: CommandBuffer,
        stage: PipelineStageFlags2,
        query_pool: QueryPool,
        query: UInt32,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWriteTimestamp2.html
        """
        return self._v1_3.cmd_write_timestamp_2(command_buffer, stage, query_pool, query)

    def queue_submit_2[p_submits_origin: ImmutOrigin](
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo2, p_submits_origin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit2.html
        """
        return self._v1_3.queue_submit_2(
            queue,
            submit_count,
            Ptr(to=p_submits).bitcast[Ptr[SubmitInfo2, ImmutUntrackedOrigin]]()[],
            fence,
        )

    def cmd_copy_buffer_2(self, command_buffer: CommandBuffer, copy_buffer_info: CopyBufferInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer2.html
        """
        return self._v1_3.cmd_copy_buffer_2(
            command_buffer,
            Ptr(to=copy_buffer_info).bitcast[CopyBufferInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_copy_image_2(self, command_buffer: CommandBuffer, copy_image_info: CopyImageInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage2.html
        """
        return self._v1_3.cmd_copy_image_2(
            command_buffer,
            Ptr(to=copy_image_info).bitcast[CopyImageInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_copy_buffer_to_image_2(
        self, command_buffer: CommandBuffer, copy_buffer_to_image_info: CopyBufferToImageInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage2.html
        """
        return self._v1_3.cmd_copy_buffer_to_image_2(
            command_buffer,
            Ptr(to=copy_buffer_to_image_info).bitcast[CopyBufferToImageInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_copy_image_to_buffer_2(
        self, command_buffer: CommandBuffer, copy_image_to_buffer_info: CopyImageToBufferInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer2.html
        """
        return self._v1_3.cmd_copy_image_to_buffer_2(
            command_buffer,
            Ptr(to=copy_image_to_buffer_info).bitcast[CopyImageToBufferInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_device_buffer_memory_requirements(
        self,
        device: Device,
        info: DeviceBufferMemoryRequirements,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceBufferMemoryRequirements.html
        """
        return self._v1_3.get_device_buffer_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceBufferMemoryRequirements]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_device_image_memory_requirements(
        self,
        device: Device,
        info: DeviceImageMemoryRequirements,
        mut memory_requirements: MemoryRequirements2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageMemoryRequirements.html
        """
        return self._v1_3.get_device_image_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceImageMemoryRequirements]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_device_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self,
        device: Device,
        info: DeviceImageMemoryRequirements,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements2, p_sparse_memory_requirements_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        return self._v1_3.get_device_image_sparse_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceImageMemoryRequirements]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
            Ptr(to=p_sparse_memory_requirements).bitcast[Optional[Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin]]]()[],
        )

    def get_device_image_sparse_memory_requirements[p_sparse_memory_requirements_origin: MutOrigin](
        self, device: Device, info: DeviceImageMemoryRequirements
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self._v1_3.get_device_image_sparse_memory_requirements(
    device,
    Ptr(to=info).bitcast[DeviceImageMemoryRequirements]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin].unsafe_dangling(),
)
        list.reserve(Int(count))
        self._v1_3.get_device_image_sparse_memory_requirements(
    device,
    Ptr(to=info).bitcast[DeviceImageMemoryRequirements]().unsafe_origin_cast[ImmutUntrackedOrigin](),
    Ptr(to=count).bitcast[UInt32]().unsafe_origin_cast[MutUntrackedOrigin](),
    list.unsafe_ptr().unsafe_origin_cast[MutUntrackedOrigin](),
)
        list._len = Int(count)
        return list^

    def cmd_set_event_2(
        self, command_buffer: CommandBuffer, event: Event, dependency_info: DependencyInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent2.html
        """
        return self._v1_3.cmd_set_event_2(
            command_buffer,
            event,
            Ptr(to=dependency_info).bitcast[DependencyInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_reset_event_2(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent2.html
        """
        return self._v1_3.cmd_reset_event_2(command_buffer, event, stage_mask)

    def cmd_wait_events_2[p_events_origin: ImmutOrigin, p_dependency_infos_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, p_events_origin],
        p_dependency_infos: Ptr[DependencyInfo, p_dependency_infos_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents2.html
        """
        return self._v1_3.cmd_wait_events_2(
            command_buffer,
            event_count,
            Ptr(to=p_events).bitcast[Ptr[Event, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_dependency_infos).bitcast[Ptr[DependencyInfo, ImmutUntrackedOrigin]]()[],
        )

    def cmd_blit_image_2(self, command_buffer: CommandBuffer, blit_image_info: BlitImageInfo2):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage2.html
        """
        return self._v1_3.cmd_blit_image_2(
            command_buffer,
            Ptr(to=blit_image_info).bitcast[BlitImageInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_resolve_image_2(
        self, command_buffer: CommandBuffer, resolve_image_info: ResolveImageInfo2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage2.html
        """
        return self._v1_3.cmd_resolve_image_2(
            command_buffer,
            Ptr(to=resolve_image_info).bitcast[ResolveImageInfo2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_begin_rendering(self, command_buffer: CommandBuffer, rendering_info: RenderingInfo):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRendering.html
        """
        return self._v1_3.cmd_begin_rendering(
            command_buffer,
            Ptr(to=rendering_info).bitcast[RenderingInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_end_rendering(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering.html
        """
        return self._v1_3.cmd_end_rendering(command_buffer)

    def cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCullMode.html
        """
        return self._v1_3.cmd_set_cull_mode(command_buffer, cull_mode)

    def cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFrontFace.html
        """
        return self._v1_3.cmd_set_front_face(command_buffer, front_face)

    def cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveTopology.html
        """
        return self._v1_3.cmd_set_primitive_topology(command_buffer, primitive_topology)

    def cmd_set_viewport_with_count[p_viewports_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, p_viewports_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWithCount.html
        """
        return self._v1_3.cmd_set_viewport_with_count(
            command_buffer,
            viewport_count,
            Ptr(to=p_viewports).bitcast[Ptr[Viewport, ImmutUntrackedOrigin]]()[],
        )

    def cmd_set_scissor_with_count[p_scissors_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, p_scissors_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissorWithCount.html
        """
        return self._v1_3.cmd_set_scissor_with_count(
            command_buffer, scissor_count, Ptr(to=p_scissors).bitcast[Ptr[Rect2D, ImmutUntrackedOrigin]]()[]
        )

    def cmd_bind_vertex_buffers_2[
        p_buffers_origin: ImmutOrigin,
        p_offsets_origin: ImmutOrigin,
        p_sizes_origin: ImmutOrigin,
        p_strides_origin: ImmutOrigin,
    ](
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, p_buffers_origin],
        p_offsets: Ptr[DeviceSize, p_offsets_origin],
        p_sizes: Optional[Ptr[DeviceSize, p_sizes_origin]],
        p_strides: Optional[Ptr[DeviceSize, p_strides_origin]],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers2.html
        """
        return self._v1_3.cmd_bind_vertex_buffers_2(
            command_buffer,
            first_binding,
            binding_count,
            Ptr(to=p_buffers).bitcast[Ptr[Buffer, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_offsets).bitcast[Ptr[DeviceSize, ImmutUntrackedOrigin]]()[],
            Ptr(to=p_sizes).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
            Ptr(to=p_strides).bitcast[Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]]]()[],
        )

    def cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthTestEnable.html
        """
        return self._v1_3.cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    def cmd_set_depth_write_enable(
        self, command_buffer: CommandBuffer, depth_write_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthWriteEnable.html
        """
        return self._v1_3.cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    def cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthCompareOp.html
        """
        return self._v1_3.cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    def cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBoundsTestEnable.html
        """
        return self._v1_3.cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    def cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilTestEnable.html
        """
        return self._v1_3.cmd_set_stencil_test_enable(command_buffer, stencil_test_enable)

    def cmd_set_stencil_op(
        self,
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilOp.html
        """
        return self._v1_3.cmd_set_stencil_op(
            command_buffer, face_mask, fail_op, pass_op, depth_fail_op, compare_op
        )

    def cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizerDiscardEnable.html
        """
        return self._v1_3.cmd_set_rasterizer_discard_enable(command_buffer, rasterizer_discard_enable)

    def cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBiasEnable.html
        """
        return self._v1_3.cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    def cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._v1_3.cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)

    def map_memory_2[p_data_origin: MutOrigin](
        self,
        device: Device,
        memory_map_info: MemoryMapInfo,
        mut p_data: Ptr[NoneType, p_data_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMapMemory2.html
        """
        return self._v1_4.map_memory_2(
            device,
            Ptr(to=memory_map_info).bitcast[MemoryMapInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutUntrackedOrigin]]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def unmap_memory_2(self, device: Device, memory_unmap_info: MemoryUnmapInfo) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory2.html
        """
        return self._v1_4.unmap_memory_2(
            device,
            Ptr(to=memory_unmap_info).bitcast[MemoryUnmapInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def get_device_image_subresource_layout(
        self, device: Device, info: DeviceImageSubresourceInfo, mut layout: SubresourceLayout2
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSubresourceLayout.html
        """
        return self._v1_4.get_device_image_subresource_layout(
            device,
            Ptr(to=info).bitcast[DeviceImageSubresourceInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=layout).bitcast[SubresourceLayout2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def get_image_subresource_layout_2(
        self,
        device: Device,
        image: Image,
        subresource: ImageSubresource2,
        mut layout: SubresourceLayout2,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSubresourceLayout2.html
        """
        return self._v1_4.get_image_subresource_layout_2(
            device,
            image,
            Ptr(to=subresource).bitcast[ImageSubresource2]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=layout).bitcast[SubresourceLayout2]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def copy_memory_to_image(
        self, device: Device, copy_memory_to_image_info: CopyMemoryToImageInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToImage.html
        """
        return self._v1_4.copy_memory_to_image(
            device,
            Ptr(to=copy_memory_to_image_info).bitcast[CopyMemoryToImageInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def copy_image_to_memory(
        self, device: Device, copy_image_to_memory_info: CopyImageToMemoryInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyImageToMemory.html
        """
        return self._v1_4.copy_image_to_memory(
            device,
            Ptr(to=copy_image_to_memory_info).bitcast[CopyImageToMemoryInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def copy_image_to_image(
        self, device: Device, copy_image_to_image_info: CopyImageToImageInfo
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyImageToImage.html
        """
        return self._v1_4.copy_image_to_image(
            device,
            Ptr(to=copy_image_to_image_info).bitcast[CopyImageToImageInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def transition_image_layout[p_transitions_origin: ImmutOrigin](
        self,
        device: Device,
        transition_count: UInt32,
        p_transitions: Ptr[HostImageLayoutTransitionInfo, p_transitions_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTransitionImageLayout.html
        """
        return self._v1_4.transition_image_layout(
            device,
            transition_count,
            Ptr(to=p_transitions).bitcast[Ptr[HostImageLayoutTransitionInfo, ImmutUntrackedOrigin]]()[],
        )

    def cmd_push_descriptor_set[p_descriptor_writes_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, p_descriptor_writes_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSet.html
        """
        return self._v1_4.cmd_push_descriptor_set(
            command_buffer,
            pipeline_bind_point,
            layout,
            set,
            descriptor_write_count,
            Ptr(to=p_descriptor_writes).bitcast[Ptr[WriteDescriptorSet, ImmutUntrackedOrigin]]()[],
        )

    def cmd_push_descriptor_set_with_template[p_data_origin: ImmutOrigin](
        self,
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        p_data: Ptr[NoneType, p_data_origin],
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate.html
        """
        return self._v1_4.cmd_push_descriptor_set_with_template(
            command_buffer,
            descriptor_update_template,
            layout,
            set,
            Ptr(to=p_data).bitcast[Ptr[NoneType, ImmutUntrackedOrigin]]()[],
        )

    def cmd_bind_descriptor_sets_2(
        self, command_buffer: CommandBuffer, bind_descriptor_sets_info: BindDescriptorSetsInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorSets2.html
        """
        return self._v1_4.cmd_bind_descriptor_sets_2(
            command_buffer,
            Ptr(to=bind_descriptor_sets_info).bitcast[BindDescriptorSetsInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_push_constants_2(
        self, command_buffer: CommandBuffer, push_constants_info: PushConstantsInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants2.html
        """
        return self._v1_4.cmd_push_constants_2(
            command_buffer,
            Ptr(to=push_constants_info).bitcast[PushConstantsInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_push_descriptor_set_2(
        self, command_buffer: CommandBuffer, push_descriptor_set_info: PushDescriptorSetInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSet2.html
        """
        return self._v1_4.cmd_push_descriptor_set_2(
            command_buffer,
            Ptr(to=push_descriptor_set_info).bitcast[PushDescriptorSetInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_push_descriptor_set_with_template_2(
        self,
        command_buffer: CommandBuffer,
        push_descriptor_set_with_template_info: PushDescriptorSetWithTemplateInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate2.html
        """
        return self._v1_4.cmd_push_descriptor_set_with_template_2(
            command_buffer,
            Ptr(to=push_descriptor_set_with_template_info).bitcast[PushDescriptorSetWithTemplateInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_set_line_stipple(
        self,
        command_buffer: CommandBuffer,
        line_stipple_factor: UInt32,
        line_stipple_pattern: UInt16,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStipple.html
        """
        return self._v1_4.cmd_set_line_stipple(command_buffer, line_stipple_factor, line_stipple_pattern)

    def cmd_bind_index_buffer_2(
        self,
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        size: DeviceSize,
        index_type: IndexType,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindIndexBuffer2.html
        """
        return self._v1_4.cmd_bind_index_buffer_2(command_buffer, buffer, offset, size, index_type)

    def get_rendering_area_granularity(
        self, device: Device, rendering_area_info: RenderingAreaInfo, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderingAreaGranularity.html
        """
        return self._v1_4.get_rendering_area_granularity(
            device,
            Ptr(to=rendering_area_info).bitcast[RenderingAreaInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
            Ptr(to=granularity).bitcast[Extent2D]().unsafe_origin_cast[MutUntrackedOrigin](),
        )

    def cmd_set_rendering_attachment_locations(
        self, command_buffer: CommandBuffer, location_info: RenderingAttachmentLocationInfo
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRenderingAttachmentLocations.html
        """
        return self._v1_4.cmd_set_rendering_attachment_locations(
            command_buffer,
            Ptr(to=location_info).bitcast[RenderingAttachmentLocationInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )

    def cmd_set_rendering_input_attachment_indices(
        self,
        command_buffer: CommandBuffer,
        input_attachment_index_info: RenderingInputAttachmentIndexInfo,
    ):
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRenderingInputAttachmentIndices.html
        """
        return self._v1_4.cmd_set_rendering_input_attachment_indices(
            command_buffer,
            Ptr(to=input_attachment_index_info).bitcast[RenderingInputAttachmentIndexInfo]().unsafe_origin_cast[ImmutUntrackedOrigin](),
        )


struct GlobalFunctionsAdditionsV1_0(Copyable):
    var create_instance: def(
        p_create_info: Ptr[InstanceCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_instance: Ptr[Instance, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var enumerate_instance_extension_properties: def(
        p_layer_name: CStringSlice[ImmutUntrackedOrigin],
        p_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_properties: Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var enumerate_instance_layer_properties: def(
        p_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_properties: Optional[Ptr[LayerProperties, MutUntrackedOrigin]],
    ) thin abi("C") -> Result

    def __init__(out self, dlhandle: ArcPointer[OwnedDLHandle]):
        var get_instance_proc_addr = dlhandle[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self.create_instance = Ptr(to=get_instance_proc_addr(
            Instance.NULL, "vkCreateInstance".as_c_string_slice()
        )).bitcast[type_of(self.create_instance)]()[]
        self.enumerate_instance_extension_properties = Ptr(to=get_instance_proc_addr(
            Instance.NULL, "vkEnumerateInstanceExtensionProperties".as_c_string_slice()
        )).bitcast[type_of(self.enumerate_instance_extension_properties)]()[]
        self.enumerate_instance_layer_properties = Ptr(to=get_instance_proc_addr(
            Instance.NULL, "vkEnumerateInstanceLayerProperties".as_c_string_slice()
        )).bitcast[type_of(self.enumerate_instance_layer_properties)]()[]


struct GlobalFunctionsAdditionsV1_1(Copyable):
    var enumerate_instance_version: def(
        p_api_version: Ptr[UInt32, MutUntrackedOrigin]
    ) thin abi("C") -> Result

    def __init__(out self, dlhandle: ArcPointer[OwnedDLHandle]):
        var get_instance_proc_addr = dlhandle[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self.enumerate_instance_version = Ptr(to=get_instance_proc_addr(
            Instance.NULL, "vkEnumerateInstanceVersion".as_c_string_slice()
        )).bitcast[type_of(self.enumerate_instance_version)]()[]


struct InstanceFunctionsAdditionsV1_0(Copyable):
    var destroy_instance: def(
        instance: Instance, p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]
    ) thin abi("C")
    var enumerate_physical_devices: def(
        instance: Instance,
        p_physical_device_count: Ptr[UInt32, MutUntrackedOrigin],
        p_physical_devices: Optional[Ptr[PhysicalDevice, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var get_physical_device_features: def(
        physical_device: PhysicalDevice, p_features: Ptr[PhysicalDeviceFeatures, MutUntrackedOrigin]
    ) thin abi("C")
    var get_physical_device_format_properties: def(
        physical_device: PhysicalDevice,
        format: Format,
        p_format_properties: Ptr[FormatProperties, MutUntrackedOrigin],
    ) thin abi("C")
    var get_physical_device_image_format_properties: def(
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        p_image_format_properties: Ptr[ImageFormatProperties, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var get_physical_device_properties: def(
        physical_device: PhysicalDevice, p_properties: Ptr[PhysicalDeviceProperties, MutUntrackedOrigin]
    ) thin abi("C")
    var get_physical_device_queue_family_properties: def(
        physical_device: PhysicalDevice,
        p_queue_family_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties, MutUntrackedOrigin]],
    ) thin abi("C")
    var get_physical_device_memory_properties: def(
        physical_device: PhysicalDevice,
        p_memory_properties: Ptr[PhysicalDeviceMemoryProperties, MutUntrackedOrigin],
    ) thin abi("C")
    var get_instance_proc_addr: def(
        instance: Instance, p_name: CStringSlice[ImmutUntrackedOrigin]
    ) thin abi("C") -> PFN_vkVoidFunction
    var create_device: def(
        physical_device: PhysicalDevice,
        p_create_info: Ptr[DeviceCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_device: Ptr[Device, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var enumerate_device_extension_properties: def(
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[ImmutUntrackedOrigin],
        p_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_properties: Optional[Ptr[ExtensionProperties, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var enumerate_device_layer_properties: def(
        physical_device: PhysicalDevice,
        p_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_properties: Optional[Ptr[LayerProperties, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var get_physical_device_sparse_image_format_properties: def(
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        p_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_properties: Optional[Ptr[SparseImageFormatProperties, MutUntrackedOrigin]],
    ) thin abi("C")

    def __init__(out self, dlhandle: ArcPointer[OwnedDLHandle], instance: Instance):
        var get_instance_proc_addr = dlhandle[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self.destroy_instance = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroyInstance".as_c_string_slice()
        )).bitcast[type_of(self.destroy_instance)]()[]
        self.enumerate_physical_devices = Ptr(to=get_instance_proc_addr(
            instance, "vkEnumeratePhysicalDevices".as_c_string_slice()
        )).bitcast[type_of(self.enumerate_physical_devices)]()[]
        self.get_physical_device_features = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFeatures".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_features)]()[]
        self.get_physical_device_format_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFormatProperties".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_format_properties)]()[]
        self.get_physical_device_image_format_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceImageFormatProperties".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_image_format_properties)]()[]
        self.get_physical_device_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceProperties".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_properties)]()[]
        self.get_physical_device_queue_family_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceQueueFamilyProperties".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_queue_family_properties)]()[]
        self.get_physical_device_memory_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceMemoryProperties".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_memory_properties)]()[]
        self.get_instance_proc_addr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetInstanceProcAddr".as_c_string_slice()
        )).bitcast[type_of(self.get_instance_proc_addr)]()[]
        self.create_device = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDevice".as_c_string_slice()
        )).bitcast[type_of(self.create_device)]()[]
        self.enumerate_device_extension_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkEnumerateDeviceExtensionProperties".as_c_string_slice()
        )).bitcast[type_of(self.enumerate_device_extension_properties)]()[]
        self.enumerate_device_layer_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkEnumerateDeviceLayerProperties".as_c_string_slice()
        )).bitcast[type_of(self.enumerate_device_layer_properties)]()[]
        self.get_physical_device_sparse_image_format_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSparseImageFormatProperties".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_sparse_image_format_properties)]()[]


struct InstanceFunctionsAdditionsV1_1(Copyable):
    var enumerate_physical_device_groups: def(
        instance: Instance,
        p_physical_device_group_count: Ptr[UInt32, MutUntrackedOrigin],
        p_physical_device_group_properties: Optional[Ptr[PhysicalDeviceGroupProperties, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var get_physical_device_features_2: def(
        physical_device: PhysicalDevice, p_features: Ptr[PhysicalDeviceFeatures2, MutUntrackedOrigin]
    ) thin abi("C")
    var get_physical_device_properties_2: def(
        physical_device: PhysicalDevice,
        p_properties: Ptr[PhysicalDeviceProperties2, MutUntrackedOrigin],
    ) thin abi("C")
    var get_physical_device_format_properties_2: def(
        physical_device: PhysicalDevice,
        format: Format,
        p_format_properties: Ptr[FormatProperties2, MutUntrackedOrigin],
    ) thin abi("C")
    var get_physical_device_image_format_properties_2: def(
        physical_device: PhysicalDevice,
        p_image_format_info: Ptr[PhysicalDeviceImageFormatInfo2, ImmutUntrackedOrigin],
        p_image_format_properties: Ptr[ImageFormatProperties2, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var get_physical_device_queue_family_properties_2: def(
        physical_device: PhysicalDevice,
        p_queue_family_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_queue_family_properties: Optional[Ptr[QueueFamilyProperties2, MutUntrackedOrigin]],
    ) thin abi("C")
    var get_physical_device_memory_properties_2: def(
        physical_device: PhysicalDevice,
        p_memory_properties: Ptr[PhysicalDeviceMemoryProperties2, MutUntrackedOrigin],
    ) thin abi("C")
    var get_physical_device_sparse_image_format_properties_2: def(
        physical_device: PhysicalDevice,
        p_format_info: Ptr[PhysicalDeviceSparseImageFormatInfo2, ImmutUntrackedOrigin],
        p_property_count: Ptr[UInt32, MutUntrackedOrigin],
        p_properties: Optional[Ptr[SparseImageFormatProperties2, MutUntrackedOrigin]],
    ) thin abi("C")
    var get_physical_device_external_buffer_properties: def(
        physical_device: PhysicalDevice,
        p_external_buffer_info: Ptr[PhysicalDeviceExternalBufferInfo, ImmutUntrackedOrigin],
        p_external_buffer_properties: Ptr[ExternalBufferProperties, MutUntrackedOrigin],
    ) thin abi("C")
    var get_physical_device_external_fence_properties: def(
        physical_device: PhysicalDevice,
        p_external_fence_info: Ptr[PhysicalDeviceExternalFenceInfo, ImmutUntrackedOrigin],
        p_external_fence_properties: Ptr[ExternalFenceProperties, MutUntrackedOrigin],
    ) thin abi("C")
    var get_physical_device_external_semaphore_properties: def(
        physical_device: PhysicalDevice,
        p_external_semaphore_info: Ptr[PhysicalDeviceExternalSemaphoreInfo, ImmutUntrackedOrigin],
        p_external_semaphore_properties: Ptr[ExternalSemaphoreProperties, MutUntrackedOrigin],
    ) thin abi("C")

    def __init__(out self, dlhandle: ArcPointer[OwnedDLHandle], instance: Instance):
        var get_instance_proc_addr = dlhandle[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self.enumerate_physical_device_groups = Ptr(to=get_instance_proc_addr(
            instance, "vkEnumeratePhysicalDeviceGroups".as_c_string_slice()
        )).bitcast[type_of(self.enumerate_physical_device_groups)]()[]
        self.get_physical_device_features_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFeatures2".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_features_2)]()[]
        self.get_physical_device_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceProperties2".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_properties_2)]()[]
        self.get_physical_device_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFormatProperties2".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_format_properties_2)]()[]
        self.get_physical_device_image_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceImageFormatProperties2".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_image_format_properties_2)]()[]
        self.get_physical_device_queue_family_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceQueueFamilyProperties2".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_queue_family_properties_2)]()[]
        self.get_physical_device_memory_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceMemoryProperties2".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_memory_properties_2)]()[]
        self.get_physical_device_sparse_image_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSparseImageFormatProperties2".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_sparse_image_format_properties_2)]()[]
        self.get_physical_device_external_buffer_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalBufferProperties".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_external_buffer_properties)]()[]
        self.get_physical_device_external_fence_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalFenceProperties".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_external_fence_properties)]()[]
        self.get_physical_device_external_semaphore_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalSemaphoreProperties".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_external_semaphore_properties)]()[]


struct InstanceFunctionsAdditionsV1_3(Copyable):
    var get_physical_device_tool_properties: def(
        physical_device: PhysicalDevice,
        p_tool_count: Ptr[UInt32, MutUntrackedOrigin],
        p_tool_properties: Optional[Ptr[PhysicalDeviceToolProperties, MutUntrackedOrigin]],
    ) thin abi("C") -> Result

    def __init__(out self, dlhandle: ArcPointer[OwnedDLHandle], instance: Instance):
        var get_instance_proc_addr = dlhandle[].get_function[
            def(instance: Instance, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self.get_physical_device_tool_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceToolProperties".as_c_string_slice()
        )).bitcast[type_of(self.get_physical_device_tool_properties)]()[]


struct DeviceFunctionsAdditionsV1_0(Copyable):
    var get_device_proc_addr: def(
        device: Device, p_name: CStringSlice[ImmutUntrackedOrigin]
    ) thin abi("C") -> PFN_vkVoidFunction
    var destroy_device: def(
        device: Device, p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]]
    ) thin abi("C")
    var get_device_queue: def(
        device: Device,
        queue_family_index: UInt32,
        queue_index: UInt32,
        p_queue: Ptr[Queue, MutUntrackedOrigin],
    ) thin abi("C")
    var queue_submit: def(
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, ImmutUntrackedOrigin],
        fence: Fence,
    ) thin abi("C") -> Result
    var queue_wait_idle: def(queue: Queue) thin abi("C") -> Result
    var device_wait_idle: def(device: Device) thin abi("C") -> Result
    var allocate_memory: def(
        device: Device,
        p_allocate_info: Ptr[MemoryAllocateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_memory: Ptr[DeviceMemory, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var free_memory: def(
        device: Device,
        memory: DeviceMemory,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var map_memory: def(
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        pp_data: Ptr[Ptr[NoneType, MutUntrackedOrigin], MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var unmap_memory: def(device: Device, memory: DeviceMemory) thin abi("C")
    var flush_mapped_memory_ranges: def(
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var invalidate_mapped_memory_ranges: def(
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var get_device_memory_commitment: def(
        device: Device,
        memory: DeviceMemory,
        p_committed_memory_in_bytes: Ptr[DeviceSize, MutUntrackedOrigin],
    ) thin abi("C")
    var bind_buffer_memory: def(
        device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) thin abi("C") -> Result
    var bind_image_memory: def(
        device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) thin abi("C") -> Result
    var get_buffer_memory_requirements: def(
        device: Device,
        buffer: Buffer,
        p_memory_requirements: Ptr[MemoryRequirements, MutUntrackedOrigin],
    ) thin abi("C")
    var get_image_memory_requirements: def(
        device: Device, image: Image, p_memory_requirements: Ptr[MemoryRequirements, MutUntrackedOrigin]
    ) thin abi("C")
    var get_image_sparse_memory_requirements: def(
        device: Device,
        image: Image,
        p_sparse_memory_requirement_count: Ptr[UInt32, MutUntrackedOrigin],
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements, MutUntrackedOrigin]],
    ) thin abi("C")
    var queue_bind_sparse: def(
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, ImmutUntrackedOrigin],
        fence: Fence,
    ) thin abi("C") -> Result
    var create_fence: def(
        device: Device,
        p_create_info: Ptr[FenceCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_fence: Ptr[Fence, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_fence: def(
        device: Device,
        fence: Fence,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var reset_fences: def(
        device: Device, fence_count: UInt32, p_fences: Ptr[Fence, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var get_fence_status: def(device: Device, fence: Fence) thin abi("C") -> Result
    var wait_for_fences: def(
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, ImmutUntrackedOrigin],
        wait_all: Bool32,
        timeout: UInt64,
    ) thin abi("C") -> Result
    var create_semaphore: def(
        device: Device,
        p_create_info: Ptr[SemaphoreCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_semaphore: Ptr[Semaphore, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_semaphore: def(
        device: Device,
        semaphore: Semaphore,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var create_query_pool: def(
        device: Device,
        p_create_info: Ptr[QueryPoolCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_query_pool: Ptr[QueryPool, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_query_pool: def(
        device: Device,
        query_pool: QueryPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var get_query_pool_results: def(
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutUntrackedOrigin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) thin abi("C") -> Result
    var create_buffer: def(
        device: Device,
        p_create_info: Ptr[BufferCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_buffer: Ptr[Buffer, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_buffer: def(
        device: Device,
        buffer: Buffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var create_image: def(
        device: Device,
        p_create_info: Ptr[ImageCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_image: Ptr[Image, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_image: def(
        device: Device,
        image: Image,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var get_image_subresource_layout: def(
        device: Device,
        image: Image,
        p_subresource: Ptr[ImageSubresource, ImmutUntrackedOrigin],
        p_layout: Ptr[SubresourceLayout, MutUntrackedOrigin],
    ) thin abi("C")
    var create_image_view: def(
        device: Device,
        p_create_info: Ptr[ImageViewCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_view: Ptr[ImageView, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_image_view: def(
        device: Device,
        image_view: ImageView,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var create_command_pool: def(
        device: Device,
        p_create_info: Ptr[CommandPoolCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_command_pool: Ptr[CommandPool, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_command_pool: def(
        device: Device,
        command_pool: CommandPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var reset_command_pool: def(
        device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) thin abi("C") -> Result
    var allocate_command_buffers: def(
        device: Device,
        p_allocate_info: Ptr[CommandBufferAllocateInfo, ImmutUntrackedOrigin],
        p_command_buffers: Ptr[CommandBuffer, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var free_command_buffers: def(
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutUntrackedOrigin],
    ) thin abi("C")
    var begin_command_buffer: def(
        command_buffer: CommandBuffer, p_begin_info: Ptr[CommandBufferBeginInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var end_command_buffer: def(command_buffer: CommandBuffer) thin abi("C") -> Result
    var reset_command_buffer: def(
        command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) thin abi("C") -> Result
    var cmd_copy_buffer: def(
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_copy_image: def(
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_copy_buffer_to_image: def(
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_copy_image_to_buffer: def(
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_update_buffer: def(
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_fill_buffer: def(
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        size: DeviceSize,
        data: UInt32,
    ) thin abi("C")
    var cmd_pipeline_barrier: def(
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutUntrackedOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_begin_query: def(
        command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32, flags: QueryControlFlags
    ) thin abi("C")
    var cmd_end_query: def(
        command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32
    ) thin abi("C")
    var cmd_reset_query_pool: def(
        command_buffer: CommandBuffer, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ) thin abi("C")
    var cmd_write_timestamp: def(
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        query_pool: QueryPool,
        query: UInt32,
    ) thin abi("C")
    var cmd_copy_query_pool_results: def(
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) thin abi("C")
    var cmd_execute_commands: def(
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutUntrackedOrigin],
    ) thin abi("C")
    var create_event: def(
        device: Device,
        p_create_info: Ptr[EventCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_event: Ptr[Event, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_event: def(
        device: Device,
        event: Event,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var get_event_status: def(device: Device, event: Event) thin abi("C") -> Result
    var set_event: def(device: Device, event: Event) thin abi("C") -> Result
    var reset_event: def(device: Device, event: Event) thin abi("C") -> Result
    var create_buffer_view: def(
        device: Device,
        p_create_info: Ptr[BufferViewCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_view: Ptr[BufferView, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_buffer_view: def(
        device: Device,
        buffer_view: BufferView,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var create_shader_module: def(
        device: Device,
        p_create_info: Ptr[ShaderModuleCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_shader_module: Ptr[ShaderModule, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_shader_module: def(
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var create_pipeline_cache: def(
        device: Device,
        p_create_info: Ptr[PipelineCacheCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_pipeline_cache: Ptr[PipelineCache, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_pipeline_cache: def(
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var get_pipeline_cache_data: def(
        device: Device,
        pipeline_cache: PipelineCache,
        p_data_size: Ptr[UInt, MutUntrackedOrigin],
        p_data: Optional[Ptr[NoneType, MutUntrackedOrigin]],
    ) thin abi("C") -> Result
    var merge_pipeline_caches: def(
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var create_compute_pipelines: def(
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_pipelines: Ptr[Pipeline, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_pipeline: def(
        device: Device,
        pipeline: Pipeline,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var create_pipeline_layout: def(
        device: Device,
        p_create_info: Ptr[PipelineLayoutCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_pipeline_layout: Ptr[PipelineLayout, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_pipeline_layout: def(
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var create_sampler: def(
        device: Device,
        p_create_info: Ptr[SamplerCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_sampler: Ptr[Sampler, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_sampler: def(
        device: Device,
        sampler: Sampler,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var create_descriptor_set_layout: def(
        device: Device,
        p_create_info: Ptr[DescriptorSetLayoutCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_set_layout: Ptr[DescriptorSetLayout, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_descriptor_set_layout: def(
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var create_descriptor_pool: def(
        device: Device,
        p_create_info: Ptr[DescriptorPoolCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_descriptor_pool: Ptr[DescriptorPool, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_descriptor_pool: def(
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var reset_descriptor_pool: def(
        device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) thin abi("C") -> Result
    var allocate_descriptor_sets: def(
        device: Device,
        p_allocate_info: Ptr[DescriptorSetAllocateInfo, ImmutUntrackedOrigin],
        p_descriptor_sets: Ptr[DescriptorSet, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var free_descriptor_sets: def(
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var update_descriptor_sets: def(
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutUntrackedOrigin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_bind_pipeline: def(
        command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline
    ) thin abi("C")
    var cmd_bind_descriptor_sets: def(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutUntrackedOrigin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_clear_color_image: def(
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        p_color: Ptr[ClearColorValue, ImmutUntrackedOrigin],
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_dispatch: def(
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ) thin abi("C")
    var cmd_dispatch_indirect: def(
        command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ) thin abi("C")
    var cmd_set_event: def(
        command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ) thin abi("C")
    var cmd_reset_event: def(
        command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ) thin abi("C")
    var cmd_wait_events: def(
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutUntrackedOrigin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutUntrackedOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutUntrackedOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_push_constants: def(
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, ImmutUntrackedOrigin],
    ) thin abi("C")
    var create_graphics_pipelines: def(
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_pipelines: Ptr[Pipeline, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var create_framebuffer: def(
        device: Device,
        p_create_info: Ptr[FramebufferCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_framebuffer: Ptr[Framebuffer, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_framebuffer: def(
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var create_render_pass: def(
        device: Device,
        p_create_info: Ptr[RenderPassCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_render_pass: Ptr[RenderPass, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_render_pass: def(
        device: Device,
        render_pass: RenderPass,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var get_render_area_granularity: def(
        device: Device, render_pass: RenderPass, p_granularity: Ptr[Extent2D, MutUntrackedOrigin]
    ) thin abi("C")
    var cmd_set_viewport: def(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_set_scissor: def(
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_set_line_width: def(command_buffer: CommandBuffer, line_width: Float32) thin abi("C")
    var cmd_set_depth_bias: def(
        command_buffer: CommandBuffer,
        depth_bias_constant_factor: Float32,
        depth_bias_clamp: Float32,
        depth_bias_slope_factor: Float32,
    ) thin abi("C")
    var cmd_set_blend_constants: def(
        command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ) thin abi("C")
    var cmd_set_depth_bounds: def(
        command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ) thin abi("C")
    var cmd_set_stencil_compare_mask: def(
        command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ) thin abi("C")
    var cmd_set_stencil_write_mask: def(
        command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ) thin abi("C")
    var cmd_set_stencil_reference: def(
        command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ) thin abi("C")
    var cmd_bind_index_buffer: def(
        command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, index_type: IndexType
    ) thin abi("C")
    var cmd_bind_vertex_buffers: def(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutUntrackedOrigin],
        p_offsets: Ptr[DeviceSize, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_draw: def(
        command_buffer: CommandBuffer,
        vertex_count: UInt32,
        instance_count: UInt32,
        first_vertex: UInt32,
        first_instance: UInt32,
    ) thin abi("C")
    var cmd_draw_indexed: def(
        command_buffer: CommandBuffer,
        index_count: UInt32,
        instance_count: UInt32,
        first_index: UInt32,
        vertex_offset: Int32,
        first_instance: UInt32,
    ) thin abi("C")
    var cmd_draw_indirect: def(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ) thin abi("C")
    var cmd_draw_indexed_indirect: def(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    ) thin abi("C")
    var cmd_blit_image: def(
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, ImmutUntrackedOrigin],
        filter: Filter,
    ) thin abi("C")
    var cmd_clear_depth_stencil_image: def(
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        p_depth_stencil: Ptr[ClearDepthStencilValue, ImmutUntrackedOrigin],
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_clear_attachments: def(
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, ImmutUntrackedOrigin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_resolve_image: def(
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_begin_render_pass: def(
        command_buffer: CommandBuffer,
        p_render_pass_begin: Ptr[RenderPassBeginInfo, ImmutUntrackedOrigin],
        contents: SubpassContents,
    ) thin abi("C")
    var cmd_next_subpass: def(command_buffer: CommandBuffer, contents: SubpassContents) thin abi("C")
    var cmd_end_render_pass: def(command_buffer: CommandBuffer) thin abi("C")

    def __init__(out self, dlhandle: ArcPointer[OwnedDLHandle], device: Device):
        var get_device_proc_addr = dlhandle[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self.get_device_proc_addr = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceProcAddr".as_c_string_slice()
        )).bitcast[type_of(self.get_device_proc_addr)]()[]
        self.destroy_device = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDevice".as_c_string_slice()
        )).bitcast[type_of(self.destroy_device)]()[]
        self.get_device_queue = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceQueue".as_c_string_slice()
        )).bitcast[type_of(self.get_device_queue)]()[]
        self.queue_submit = Ptr(to=get_device_proc_addr(
            device, "vkQueueSubmit".as_c_string_slice()
        )).bitcast[type_of(self.queue_submit)]()[]
        self.queue_wait_idle = Ptr(to=get_device_proc_addr(
            device, "vkQueueWaitIdle".as_c_string_slice()
        )).bitcast[type_of(self.queue_wait_idle)]()[]
        self.device_wait_idle = Ptr(to=get_device_proc_addr(
            device, "vkDeviceWaitIdle".as_c_string_slice()
        )).bitcast[type_of(self.device_wait_idle)]()[]
        self.allocate_memory = Ptr(to=get_device_proc_addr(
            device, "vkAllocateMemory".as_c_string_slice()
        )).bitcast[type_of(self.allocate_memory)]()[]
        self.free_memory = Ptr(to=get_device_proc_addr(
            device, "vkFreeMemory".as_c_string_slice()
        )).bitcast[type_of(self.free_memory)]()[]
        self.map_memory = Ptr(to=get_device_proc_addr(
            device, "vkMapMemory".as_c_string_slice()
        )).bitcast[type_of(self.map_memory)]()[]
        self.unmap_memory = Ptr(to=get_device_proc_addr(
            device, "vkUnmapMemory".as_c_string_slice()
        )).bitcast[type_of(self.unmap_memory)]()[]
        self.flush_mapped_memory_ranges = Ptr(to=get_device_proc_addr(
            device, "vkFlushMappedMemoryRanges".as_c_string_slice()
        )).bitcast[type_of(self.flush_mapped_memory_ranges)]()[]
        self.invalidate_mapped_memory_ranges = Ptr(to=get_device_proc_addr(
            device, "vkInvalidateMappedMemoryRanges".as_c_string_slice()
        )).bitcast[type_of(self.invalidate_mapped_memory_ranges)]()[]
        self.get_device_memory_commitment = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceMemoryCommitment".as_c_string_slice()
        )).bitcast[type_of(self.get_device_memory_commitment)]()[]
        self.bind_buffer_memory = Ptr(to=get_device_proc_addr(
            device, "vkBindBufferMemory".as_c_string_slice()
        )).bitcast[type_of(self.bind_buffer_memory)]()[]
        self.bind_image_memory = Ptr(to=get_device_proc_addr(
            device, "vkBindImageMemory".as_c_string_slice()
        )).bitcast[type_of(self.bind_image_memory)]()[]
        self.get_buffer_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferMemoryRequirements".as_c_string_slice()
        )).bitcast[type_of(self.get_buffer_memory_requirements)]()[]
        self.get_image_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetImageMemoryRequirements".as_c_string_slice()
        )).bitcast[type_of(self.get_image_memory_requirements)]()[]
        self.get_image_sparse_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSparseMemoryRequirements".as_c_string_slice()
        )).bitcast[type_of(self.get_image_sparse_memory_requirements)]()[]
        self.queue_bind_sparse = Ptr(to=get_device_proc_addr(
            device, "vkQueueBindSparse".as_c_string_slice()
        )).bitcast[type_of(self.queue_bind_sparse)]()[]
        self.create_fence = Ptr(to=get_device_proc_addr(
            device, "vkCreateFence".as_c_string_slice()
        )).bitcast[type_of(self.create_fence)]()[]
        self.destroy_fence = Ptr(to=get_device_proc_addr(
            device, "vkDestroyFence".as_c_string_slice()
        )).bitcast[type_of(self.destroy_fence)]()[]
        self.reset_fences = Ptr(to=get_device_proc_addr(
            device, "vkResetFences".as_c_string_slice()
        )).bitcast[type_of(self.reset_fences)]()[]
        self.get_fence_status = Ptr(to=get_device_proc_addr(
            device, "vkGetFenceStatus".as_c_string_slice()
        )).bitcast[type_of(self.get_fence_status)]()[]
        self.wait_for_fences = Ptr(to=get_device_proc_addr(
            device, "vkWaitForFences".as_c_string_slice()
        )).bitcast[type_of(self.wait_for_fences)]()[]
        self.create_semaphore = Ptr(to=get_device_proc_addr(
            device, "vkCreateSemaphore".as_c_string_slice()
        )).bitcast[type_of(self.create_semaphore)]()[]
        self.destroy_semaphore = Ptr(to=get_device_proc_addr(
            device, "vkDestroySemaphore".as_c_string_slice()
        )).bitcast[type_of(self.destroy_semaphore)]()[]
        self.create_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkCreateQueryPool".as_c_string_slice()
        )).bitcast[type_of(self.create_query_pool)]()[]
        self.destroy_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkDestroyQueryPool".as_c_string_slice()
        )).bitcast[type_of(self.destroy_query_pool)]()[]
        self.get_query_pool_results = Ptr(to=get_device_proc_addr(
            device, "vkGetQueryPoolResults".as_c_string_slice()
        )).bitcast[type_of(self.get_query_pool_results)]()[]
        self.create_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCreateBuffer".as_c_string_slice()
        )).bitcast[type_of(self.create_buffer)]()[]
        self.destroy_buffer = Ptr(to=get_device_proc_addr(
            device, "vkDestroyBuffer".as_c_string_slice()
        )).bitcast[type_of(self.destroy_buffer)]()[]
        self.create_image = Ptr(to=get_device_proc_addr(
            device, "vkCreateImage".as_c_string_slice()
        )).bitcast[type_of(self.create_image)]()[]
        self.destroy_image = Ptr(to=get_device_proc_addr(
            device, "vkDestroyImage".as_c_string_slice()
        )).bitcast[type_of(self.destroy_image)]()[]
        self.get_image_subresource_layout = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout".as_c_string_slice()
        )).bitcast[type_of(self.get_image_subresource_layout)]()[]
        self.create_image_view = Ptr(to=get_device_proc_addr(
            device, "vkCreateImageView".as_c_string_slice()
        )).bitcast[type_of(self.create_image_view)]()[]
        self.destroy_image_view = Ptr(to=get_device_proc_addr(
            device, "vkDestroyImageView".as_c_string_slice()
        )).bitcast[type_of(self.destroy_image_view)]()[]
        self.create_command_pool = Ptr(to=get_device_proc_addr(
            device, "vkCreateCommandPool".as_c_string_slice()
        )).bitcast[type_of(self.create_command_pool)]()[]
        self.destroy_command_pool = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCommandPool".as_c_string_slice()
        )).bitcast[type_of(self.destroy_command_pool)]()[]
        self.reset_command_pool = Ptr(to=get_device_proc_addr(
            device, "vkResetCommandPool".as_c_string_slice()
        )).bitcast[type_of(self.reset_command_pool)]()[]
        self.allocate_command_buffers = Ptr(to=get_device_proc_addr(
            device, "vkAllocateCommandBuffers".as_c_string_slice()
        )).bitcast[type_of(self.allocate_command_buffers)]()[]
        self.free_command_buffers = Ptr(to=get_device_proc_addr(
            device, "vkFreeCommandBuffers".as_c_string_slice()
        )).bitcast[type_of(self.free_command_buffers)]()[]
        self.begin_command_buffer = Ptr(to=get_device_proc_addr(
            device, "vkBeginCommandBuffer".as_c_string_slice()
        )).bitcast[type_of(self.begin_command_buffer)]()[]
        self.end_command_buffer = Ptr(to=get_device_proc_addr(
            device, "vkEndCommandBuffer".as_c_string_slice()
        )).bitcast[type_of(self.end_command_buffer)]()[]
        self.reset_command_buffer = Ptr(to=get_device_proc_addr(
            device, "vkResetCommandBuffer".as_c_string_slice()
        )).bitcast[type_of(self.reset_command_buffer)]()[]
        self.cmd_copy_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBuffer".as_c_string_slice()
        )).bitcast[type_of(self.cmd_copy_buffer)]()[]
        self.cmd_copy_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImage".as_c_string_slice()
        )).bitcast[type_of(self.cmd_copy_image)]()[]
        self.cmd_copy_buffer_to_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBufferToImage".as_c_string_slice()
        )).bitcast[type_of(self.cmd_copy_buffer_to_image)]()[]
        self.cmd_copy_image_to_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImageToBuffer".as_c_string_slice()
        )).bitcast[type_of(self.cmd_copy_image_to_buffer)]()[]
        self.cmd_update_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdUpdateBuffer".as_c_string_slice()
        )).bitcast[type_of(self.cmd_update_buffer)]()[]
        self.cmd_fill_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdFillBuffer".as_c_string_slice()
        )).bitcast[type_of(self.cmd_fill_buffer)]()[]
        self.cmd_pipeline_barrier = Ptr(to=get_device_proc_addr(
            device, "vkCmdPipelineBarrier".as_c_string_slice()
        )).bitcast[type_of(self.cmd_pipeline_barrier)]()[]
        self.cmd_begin_query = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginQuery".as_c_string_slice()
        )).bitcast[type_of(self.cmd_begin_query)]()[]
        self.cmd_end_query = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndQuery".as_c_string_slice()
        )).bitcast[type_of(self.cmd_end_query)]()[]
        self.cmd_reset_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkCmdResetQueryPool".as_c_string_slice()
        )).bitcast[type_of(self.cmd_reset_query_pool)]()[]
        self.cmd_write_timestamp = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteTimestamp".as_c_string_slice()
        )).bitcast[type_of(self.cmd_write_timestamp)]()[]
        self.cmd_copy_query_pool_results = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyQueryPoolResults".as_c_string_slice()
        )).bitcast[type_of(self.cmd_copy_query_pool_results)]()[]
        self.cmd_execute_commands = Ptr(to=get_device_proc_addr(
            device, "vkCmdExecuteCommands".as_c_string_slice()
        )).bitcast[type_of(self.cmd_execute_commands)]()[]
        self.create_event = Ptr(to=get_device_proc_addr(
            device, "vkCreateEvent".as_c_string_slice()
        )).bitcast[type_of(self.create_event)]()[]
        self.destroy_event = Ptr(to=get_device_proc_addr(
            device, "vkDestroyEvent".as_c_string_slice()
        )).bitcast[type_of(self.destroy_event)]()[]
        self.get_event_status = Ptr(to=get_device_proc_addr(
            device, "vkGetEventStatus".as_c_string_slice()
        )).bitcast[type_of(self.get_event_status)]()[]
        self.set_event = Ptr(to=get_device_proc_addr(
            device, "vkSetEvent".as_c_string_slice()
        )).bitcast[type_of(self.set_event)]()[]
        self.reset_event = Ptr(to=get_device_proc_addr(
            device, "vkResetEvent".as_c_string_slice()
        )).bitcast[type_of(self.reset_event)]()[]
        self.create_buffer_view = Ptr(to=get_device_proc_addr(
            device, "vkCreateBufferView".as_c_string_slice()
        )).bitcast[type_of(self.create_buffer_view)]()[]
        self.destroy_buffer_view = Ptr(to=get_device_proc_addr(
            device, "vkDestroyBufferView".as_c_string_slice()
        )).bitcast[type_of(self.destroy_buffer_view)]()[]
        self.create_shader_module = Ptr(to=get_device_proc_addr(
            device, "vkCreateShaderModule".as_c_string_slice()
        )).bitcast[type_of(self.create_shader_module)]()[]
        self.destroy_shader_module = Ptr(to=get_device_proc_addr(
            device, "vkDestroyShaderModule".as_c_string_slice()
        )).bitcast[type_of(self.destroy_shader_module)]()[]
        self.create_pipeline_cache = Ptr(to=get_device_proc_addr(
            device, "vkCreatePipelineCache".as_c_string_slice()
        )).bitcast[type_of(self.create_pipeline_cache)]()[]
        self.destroy_pipeline_cache = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPipelineCache".as_c_string_slice()
        )).bitcast[type_of(self.destroy_pipeline_cache)]()[]
        self.get_pipeline_cache_data = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineCacheData".as_c_string_slice()
        )).bitcast[type_of(self.get_pipeline_cache_data)]()[]
        self.merge_pipeline_caches = Ptr(to=get_device_proc_addr(
            device, "vkMergePipelineCaches".as_c_string_slice()
        )).bitcast[type_of(self.merge_pipeline_caches)]()[]
        self.create_compute_pipelines = Ptr(to=get_device_proc_addr(
            device, "vkCreateComputePipelines".as_c_string_slice()
        )).bitcast[type_of(self.create_compute_pipelines)]()[]
        self.destroy_pipeline = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPipeline".as_c_string_slice()
        )).bitcast[type_of(self.destroy_pipeline)]()[]
        self.create_pipeline_layout = Ptr(to=get_device_proc_addr(
            device, "vkCreatePipelineLayout".as_c_string_slice()
        )).bitcast[type_of(self.create_pipeline_layout)]()[]
        self.destroy_pipeline_layout = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPipelineLayout".as_c_string_slice()
        )).bitcast[type_of(self.destroy_pipeline_layout)]()[]
        self.create_sampler = Ptr(to=get_device_proc_addr(
            device, "vkCreateSampler".as_c_string_slice()
        )).bitcast[type_of(self.create_sampler)]()[]
        self.destroy_sampler = Ptr(to=get_device_proc_addr(
            device, "vkDestroySampler".as_c_string_slice()
        )).bitcast[type_of(self.destroy_sampler)]()[]
        self.create_descriptor_set_layout = Ptr(to=get_device_proc_addr(
            device, "vkCreateDescriptorSetLayout".as_c_string_slice()
        )).bitcast[type_of(self.create_descriptor_set_layout)]()[]
        self.destroy_descriptor_set_layout = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDescriptorSetLayout".as_c_string_slice()
        )).bitcast[type_of(self.destroy_descriptor_set_layout)]()[]
        self.create_descriptor_pool = Ptr(to=get_device_proc_addr(
            device, "vkCreateDescriptorPool".as_c_string_slice()
        )).bitcast[type_of(self.create_descriptor_pool)]()[]
        self.destroy_descriptor_pool = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDescriptorPool".as_c_string_slice()
        )).bitcast[type_of(self.destroy_descriptor_pool)]()[]
        self.reset_descriptor_pool = Ptr(to=get_device_proc_addr(
            device, "vkResetDescriptorPool".as_c_string_slice()
        )).bitcast[type_of(self.reset_descriptor_pool)]()[]
        self.allocate_descriptor_sets = Ptr(to=get_device_proc_addr(
            device, "vkAllocateDescriptorSets".as_c_string_slice()
        )).bitcast[type_of(self.allocate_descriptor_sets)]()[]
        self.free_descriptor_sets = Ptr(to=get_device_proc_addr(
            device, "vkFreeDescriptorSets".as_c_string_slice()
        )).bitcast[type_of(self.free_descriptor_sets)]()[]
        self.update_descriptor_sets = Ptr(to=get_device_proc_addr(
            device, "vkUpdateDescriptorSets".as_c_string_slice()
        )).bitcast[type_of(self.update_descriptor_sets)]()[]
        self.cmd_bind_pipeline = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindPipeline".as_c_string_slice()
        )).bitcast[type_of(self.cmd_bind_pipeline)]()[]
        self.cmd_bind_descriptor_sets = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorSets".as_c_string_slice()
        )).bitcast[type_of(self.cmd_bind_descriptor_sets)]()[]
        self.cmd_clear_color_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdClearColorImage".as_c_string_slice()
        )).bitcast[type_of(self.cmd_clear_color_image)]()[]
        self.cmd_dispatch = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatch".as_c_string_slice()
        )).bitcast[type_of(self.cmd_dispatch)]()[]
        self.cmd_dispatch_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchIndirect".as_c_string_slice()
        )).bitcast[type_of(self.cmd_dispatch_indirect)]()[]
        self.cmd_set_event = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetEvent".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_event)]()[]
        self.cmd_reset_event = Ptr(to=get_device_proc_addr(
            device, "vkCmdResetEvent".as_c_string_slice()
        )).bitcast[type_of(self.cmd_reset_event)]()[]
        self.cmd_wait_events = Ptr(to=get_device_proc_addr(
            device, "vkCmdWaitEvents".as_c_string_slice()
        )).bitcast[type_of(self.cmd_wait_events)]()[]
        self.cmd_push_constants = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushConstants".as_c_string_slice()
        )).bitcast[type_of(self.cmd_push_constants)]()[]
        self.create_graphics_pipelines = Ptr(to=get_device_proc_addr(
            device, "vkCreateGraphicsPipelines".as_c_string_slice()
        )).bitcast[type_of(self.create_graphics_pipelines)]()[]
        self.create_framebuffer = Ptr(to=get_device_proc_addr(
            device, "vkCreateFramebuffer".as_c_string_slice()
        )).bitcast[type_of(self.create_framebuffer)]()[]
        self.destroy_framebuffer = Ptr(to=get_device_proc_addr(
            device, "vkDestroyFramebuffer".as_c_string_slice()
        )).bitcast[type_of(self.destroy_framebuffer)]()[]
        self.create_render_pass = Ptr(to=get_device_proc_addr(
            device, "vkCreateRenderPass".as_c_string_slice()
        )).bitcast[type_of(self.create_render_pass)]()[]
        self.destroy_render_pass = Ptr(to=get_device_proc_addr(
            device, "vkDestroyRenderPass".as_c_string_slice()
        )).bitcast[type_of(self.destroy_render_pass)]()[]
        self.get_render_area_granularity = Ptr(to=get_device_proc_addr(
            device, "vkGetRenderAreaGranularity".as_c_string_slice()
        )).bitcast[type_of(self.get_render_area_granularity)]()[]
        self.cmd_set_viewport = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewport".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_viewport)]()[]
        self.cmd_set_scissor = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetScissor".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_scissor)]()[]
        self.cmd_set_line_width = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineWidth".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_line_width)]()[]
        self.cmd_set_depth_bias = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBias".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_depth_bias)]()[]
        self.cmd_set_blend_constants = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetBlendConstants".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_blend_constants)]()[]
        self.cmd_set_depth_bounds = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBounds".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_depth_bounds)]()[]
        self.cmd_set_stencil_compare_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilCompareMask".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_stencil_compare_mask)]()[]
        self.cmd_set_stencil_write_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilWriteMask".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_stencil_write_mask)]()[]
        self.cmd_set_stencil_reference = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilReference".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_stencil_reference)]()[]
        self.cmd_bind_index_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindIndexBuffer".as_c_string_slice()
        )).bitcast[type_of(self.cmd_bind_index_buffer)]()[]
        self.cmd_bind_vertex_buffers = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindVertexBuffers".as_c_string_slice()
        )).bitcast[type_of(self.cmd_bind_vertex_buffers)]()[]
        self.cmd_draw = Ptr(to=get_device_proc_addr(
            device, "vkCmdDraw".as_c_string_slice()
        )).bitcast[type_of(self.cmd_draw)]()[]
        self.cmd_draw_indexed = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndexed".as_c_string_slice()
        )).bitcast[type_of(self.cmd_draw_indexed)]()[]
        self.cmd_draw_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirect".as_c_string_slice()
        )).bitcast[type_of(self.cmd_draw_indirect)]()[]
        self.cmd_draw_indexed_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndexedIndirect".as_c_string_slice()
        )).bitcast[type_of(self.cmd_draw_indexed_indirect)]()[]
        self.cmd_blit_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdBlitImage".as_c_string_slice()
        )).bitcast[type_of(self.cmd_blit_image)]()[]
        self.cmd_clear_depth_stencil_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdClearDepthStencilImage".as_c_string_slice()
        )).bitcast[type_of(self.cmd_clear_depth_stencil_image)]()[]
        self.cmd_clear_attachments = Ptr(to=get_device_proc_addr(
            device, "vkCmdClearAttachments".as_c_string_slice()
        )).bitcast[type_of(self.cmd_clear_attachments)]()[]
        self.cmd_resolve_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdResolveImage".as_c_string_slice()
        )).bitcast[type_of(self.cmd_resolve_image)]()[]
        self.cmd_begin_render_pass = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginRenderPass".as_c_string_slice()
        )).bitcast[type_of(self.cmd_begin_render_pass)]()[]
        self.cmd_next_subpass = Ptr(to=get_device_proc_addr(
            device, "vkCmdNextSubpass".as_c_string_slice()
        )).bitcast[type_of(self.cmd_next_subpass)]()[]
        self.cmd_end_render_pass = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRenderPass".as_c_string_slice()
        )).bitcast[type_of(self.cmd_end_render_pass)]()[]


struct DeviceFunctionsAdditionsV1_1(Copyable):
    var bind_buffer_memory_2: def(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var bind_image_memory_2: def(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var get_device_group_peer_memory_features: def(
        device: Device,
        heap_index: UInt32,
        local_device_index: UInt32,
        remote_device_index: UInt32,
        p_peer_memory_features: Ptr[PeerMemoryFeatureFlags, MutUntrackedOrigin],
    ) thin abi("C")
    var cmd_set_device_mask: def(command_buffer: CommandBuffer, device_mask: UInt32) thin abi("C")
    var get_image_memory_requirements_2: def(
        device: Device,
        p_info: Ptr[ImageMemoryRequirementsInfo2, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutUntrackedOrigin],
    ) thin abi("C")
    var get_buffer_memory_requirements_2: def(
        device: Device,
        p_info: Ptr[BufferMemoryRequirementsInfo2, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutUntrackedOrigin],
    ) thin abi("C")
    var get_image_sparse_memory_requirements_2: def(
        device: Device,
        p_info: Ptr[ImageSparseMemoryRequirementsInfo2, ImmutUntrackedOrigin],
        p_sparse_memory_requirement_count: Ptr[UInt32, MutUntrackedOrigin],
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin]],
    ) thin abi("C")
    var trim_command_pool: def(
        device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ) thin abi("C")
    var get_device_queue_2: def(
        device: Device,
        p_queue_info: Ptr[DeviceQueueInfo2, ImmutUntrackedOrigin],
        p_queue: Ptr[Queue, MutUntrackedOrigin],
    ) thin abi("C")
    var cmd_dispatch_base: def(
        command_buffer: CommandBuffer,
        base_group_x: UInt32,
        base_group_y: UInt32,
        base_group_z: UInt32,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    ) thin abi("C")
    var create_descriptor_update_template: def(
        device: Device,
        p_create_info: Ptr[DescriptorUpdateTemplateCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_descriptor_update_template: Ptr[DescriptorUpdateTemplate, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_descriptor_update_template: def(
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var update_descriptor_set_with_template: def(
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, ImmutUntrackedOrigin],
    ) thin abi("C")
    var get_descriptor_set_layout_support: def(
        device: Device,
        p_create_info: Ptr[DescriptorSetLayoutCreateInfo, ImmutUntrackedOrigin],
        p_support: Ptr[DescriptorSetLayoutSupport, MutUntrackedOrigin],
    ) thin abi("C")
    var create_sampler_ycbcr_conversion: def(
        device: Device,
        p_create_info: Ptr[SamplerYcbcrConversionCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_ycbcr_conversion: Ptr[SamplerYcbcrConversion, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_sampler_ycbcr_conversion: def(
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")

    def __init__(out self, dlhandle: ArcPointer[OwnedDLHandle], device: Device):
        var get_device_proc_addr = dlhandle[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self.bind_buffer_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkBindBufferMemory2".as_c_string_slice()
        )).bitcast[type_of(self.bind_buffer_memory_2)]()[]
        self.bind_image_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkBindImageMemory2".as_c_string_slice()
        )).bitcast[type_of(self.bind_image_memory_2)]()[]
        self.get_device_group_peer_memory_features = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupPeerMemoryFeatures".as_c_string_slice()
        )).bitcast[type_of(self.get_device_group_peer_memory_features)]()[]
        self.cmd_set_device_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDeviceMask".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_device_mask)]()[]
        self.get_image_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageMemoryRequirements2".as_c_string_slice()
        )).bitcast[type_of(self.get_image_memory_requirements_2)]()[]
        self.get_buffer_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferMemoryRequirements2".as_c_string_slice()
        )).bitcast[type_of(self.get_buffer_memory_requirements_2)]()[]
        self.get_image_sparse_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSparseMemoryRequirements2".as_c_string_slice()
        )).bitcast[type_of(self.get_image_sparse_memory_requirements_2)]()[]
        self.trim_command_pool = Ptr(to=get_device_proc_addr(
            device, "vkTrimCommandPool".as_c_string_slice()
        )).bitcast[type_of(self.trim_command_pool)]()[]
        self.get_device_queue_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceQueue2".as_c_string_slice()
        )).bitcast[type_of(self.get_device_queue_2)]()[]
        self.cmd_dispatch_base = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchBase".as_c_string_slice()
        )).bitcast[type_of(self.cmd_dispatch_base)]()[]
        self.create_descriptor_update_template = Ptr(to=get_device_proc_addr(
            device, "vkCreateDescriptorUpdateTemplate".as_c_string_slice()
        )).bitcast[type_of(self.create_descriptor_update_template)]()[]
        self.destroy_descriptor_update_template = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDescriptorUpdateTemplate".as_c_string_slice()
        )).bitcast[type_of(self.destroy_descriptor_update_template)]()[]
        self.update_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
            device, "vkUpdateDescriptorSetWithTemplate".as_c_string_slice()
        )).bitcast[type_of(self.update_descriptor_set_with_template)]()[]
        self.get_descriptor_set_layout_support = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutSupport".as_c_string_slice()
        )).bitcast[type_of(self.get_descriptor_set_layout_support)]()[]
        self.create_sampler_ycbcr_conversion = Ptr(to=get_device_proc_addr(
            device, "vkCreateSamplerYcbcrConversion".as_c_string_slice()
        )).bitcast[type_of(self.create_sampler_ycbcr_conversion)]()[]
        self.destroy_sampler_ycbcr_conversion = Ptr(to=get_device_proc_addr(
            device, "vkDestroySamplerYcbcrConversion".as_c_string_slice()
        )).bitcast[type_of(self.destroy_sampler_ycbcr_conversion)]()[]


struct DeviceFunctionsAdditionsV1_2(Copyable):
    var reset_query_pool: def(
        device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ) thin abi("C")
    var get_semaphore_counter_value: def(
        device: Device, semaphore: Semaphore, p_value: Ptr[UInt64, MutUntrackedOrigin]
    ) thin abi("C") -> Result
    var wait_semaphores: def(
        device: Device, p_wait_info: Ptr[SemaphoreWaitInfo, ImmutUntrackedOrigin], timeout: UInt64
    ) thin abi("C") -> Result
    var signal_semaphore: def(
        device: Device, p_signal_info: Ptr[SemaphoreSignalInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var get_buffer_device_address: def(
        device: Device, p_info: Ptr[BufferDeviceAddressInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> DeviceAddress
    var get_buffer_opaque_capture_address: def(
        device: Device, p_info: Ptr[BufferDeviceAddressInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> UInt64
    var get_device_memory_opaque_capture_address: def(
        device: Device, p_info: Ptr[DeviceMemoryOpaqueCaptureAddressInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> UInt64
    var cmd_draw_indirect_count: def(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ) thin abi("C")
    var cmd_draw_indexed_indirect_count: def(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    ) thin abi("C")
    var create_render_pass_2: def(
        device: Device,
        p_create_info: Ptr[RenderPassCreateInfo2, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_render_pass: Ptr[RenderPass, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var cmd_begin_render_pass_2: def(
        command_buffer: CommandBuffer,
        p_render_pass_begin: Ptr[RenderPassBeginInfo, ImmutUntrackedOrigin],
        p_subpass_begin_info: Ptr[SubpassBeginInfo, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_next_subpass_2: def(
        command_buffer: CommandBuffer,
        p_subpass_begin_info: Ptr[SubpassBeginInfo, ImmutUntrackedOrigin],
        p_subpass_end_info: Ptr[SubpassEndInfo, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_end_render_pass_2: def(
        command_buffer: CommandBuffer, p_subpass_end_info: Ptr[SubpassEndInfo, ImmutUntrackedOrigin]
    ) thin abi("C")

    def __init__(out self, dlhandle: ArcPointer[OwnedDLHandle], device: Device):
        var get_device_proc_addr = dlhandle[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self.reset_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkResetQueryPool".as_c_string_slice()
        )).bitcast[type_of(self.reset_query_pool)]()[]
        self.get_semaphore_counter_value = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreCounterValue".as_c_string_slice()
        )).bitcast[type_of(self.get_semaphore_counter_value)]()[]
        self.wait_semaphores = Ptr(to=get_device_proc_addr(
            device, "vkWaitSemaphores".as_c_string_slice()
        )).bitcast[type_of(self.wait_semaphores)]()[]
        self.signal_semaphore = Ptr(to=get_device_proc_addr(
            device, "vkSignalSemaphore".as_c_string_slice()
        )).bitcast[type_of(self.signal_semaphore)]()[]
        self.get_buffer_device_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferDeviceAddress".as_c_string_slice()
        )).bitcast[type_of(self.get_buffer_device_address)]()[]
        self.get_buffer_opaque_capture_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferOpaqueCaptureAddress".as_c_string_slice()
        )).bitcast[type_of(self.get_buffer_opaque_capture_address)]()[]
        self.get_device_memory_opaque_capture_address = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceMemoryOpaqueCaptureAddress".as_c_string_slice()
        )).bitcast[type_of(self.get_device_memory_opaque_capture_address)]()[]
        self.cmd_draw_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirectCount".as_c_string_slice()
        )).bitcast[type_of(self.cmd_draw_indirect_count)]()[]
        self.cmd_draw_indexed_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndexedIndirectCount".as_c_string_slice()
        )).bitcast[type_of(self.cmd_draw_indexed_indirect_count)]()[]
        self.create_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCreateRenderPass2".as_c_string_slice()
        )).bitcast[type_of(self.create_render_pass_2)]()[]
        self.cmd_begin_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginRenderPass2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_begin_render_pass_2)]()[]
        self.cmd_next_subpass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdNextSubpass2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_next_subpass_2)]()[]
        self.cmd_end_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRenderPass2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_end_render_pass_2)]()[]


struct DeviceFunctionsAdditionsV1_3(Copyable):
    var create_private_data_slot: def(
        device: Device,
        p_create_info: Ptr[PrivateDataSlotCreateInfo, ImmutUntrackedOrigin],
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
        p_private_data_slot: Ptr[PrivateDataSlot, MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var destroy_private_data_slot: def(
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Optional[Ptr[AllocationCallbacks, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var set_private_data: def(
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        data: UInt64,
    ) thin abi("C") -> Result
    var get_private_data: def(
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        p_data: Ptr[UInt64, MutUntrackedOrigin],
    ) thin abi("C")
    var cmd_pipeline_barrier_2: def(
        command_buffer: CommandBuffer, p_dependency_info: Ptr[DependencyInfo, ImmutUntrackedOrigin]
    ) thin abi("C")
    var cmd_write_timestamp_2: def(
        command_buffer: CommandBuffer, stage: PipelineStageFlags2, query_pool: QueryPool, query: UInt32
    ) thin abi("C")
    var queue_submit_2: def(
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo2, ImmutUntrackedOrigin],
        fence: Fence,
    ) thin abi("C") -> Result
    var cmd_copy_buffer_2: def(
        command_buffer: CommandBuffer, p_copy_buffer_info: Ptr[CopyBufferInfo2, ImmutUntrackedOrigin]
    ) thin abi("C")
    var cmd_copy_image_2: def(
        command_buffer: CommandBuffer, p_copy_image_info: Ptr[CopyImageInfo2, ImmutUntrackedOrigin]
    ) thin abi("C")
    var cmd_copy_buffer_to_image_2: def(
        command_buffer: CommandBuffer,
        p_copy_buffer_to_image_info: Ptr[CopyBufferToImageInfo2, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_copy_image_to_buffer_2: def(
        command_buffer: CommandBuffer,
        p_copy_image_to_buffer_info: Ptr[CopyImageToBufferInfo2, ImmutUntrackedOrigin],
    ) thin abi("C")
    var get_device_buffer_memory_requirements: def(
        device: Device,
        p_info: Ptr[DeviceBufferMemoryRequirements, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutUntrackedOrigin],
    ) thin abi("C")
    var get_device_image_memory_requirements: def(
        device: Device,
        p_info: Ptr[DeviceImageMemoryRequirements, ImmutUntrackedOrigin],
        p_memory_requirements: Ptr[MemoryRequirements2, MutUntrackedOrigin],
    ) thin abi("C")
    var get_device_image_sparse_memory_requirements: def(
        device: Device,
        p_info: Ptr[DeviceImageMemoryRequirements, ImmutUntrackedOrigin],
        p_sparse_memory_requirement_count: Ptr[UInt32, MutUntrackedOrigin],
        p_sparse_memory_requirements: Optional[Ptr[SparseImageMemoryRequirements2, MutUntrackedOrigin]],
    ) thin abi("C")
    var cmd_set_event_2: def(
        command_buffer: CommandBuffer,
        event: Event,
        p_dependency_info: Ptr[DependencyInfo, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_reset_event_2: def(
        command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2
    ) thin abi("C")
    var cmd_wait_events_2: def(
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutUntrackedOrigin],
        p_dependency_infos: Ptr[DependencyInfo, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_blit_image_2: def(
        command_buffer: CommandBuffer, p_blit_image_info: Ptr[BlitImageInfo2, ImmutUntrackedOrigin]
    ) thin abi("C")
    var cmd_resolve_image_2: def(
        command_buffer: CommandBuffer,
        p_resolve_image_info: Ptr[ResolveImageInfo2, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_begin_rendering: def(
        command_buffer: CommandBuffer, p_rendering_info: Ptr[RenderingInfo, ImmutUntrackedOrigin]
    ) thin abi("C")
    var cmd_end_rendering: def(command_buffer: CommandBuffer) thin abi("C")
    var cmd_set_cull_mode: def(command_buffer: CommandBuffer, cull_mode: CullModeFlags) thin abi("C")
    var cmd_set_front_face: def(command_buffer: CommandBuffer, front_face: FrontFace) thin abi("C")
    var cmd_set_primitive_topology: def(
        command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ) thin abi("C")
    var cmd_set_viewport_with_count: def(
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_set_scissor_with_count: def(
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_bind_vertex_buffers_2: def(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutUntrackedOrigin],
        p_offsets: Ptr[DeviceSize, ImmutUntrackedOrigin],
        p_sizes: Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]],
        p_strides: Optional[Ptr[DeviceSize, ImmutUntrackedOrigin]],
    ) thin abi("C")
    var cmd_set_depth_test_enable: def(
        command_buffer: CommandBuffer, depth_test_enable: Bool32
    ) thin abi("C")
    var cmd_set_depth_write_enable: def(
        command_buffer: CommandBuffer, depth_write_enable: Bool32
    ) thin abi("C")
    var cmd_set_depth_compare_op: def(
        command_buffer: CommandBuffer, depth_compare_op: CompareOp
    ) thin abi("C")
    var cmd_set_depth_bounds_test_enable: def(
        command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ) thin abi("C")
    var cmd_set_stencil_test_enable: def(
        command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ) thin abi("C")
    var cmd_set_stencil_op: def(
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    ) thin abi("C")
    var cmd_set_rasterizer_discard_enable: def(
        command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ) thin abi("C")
    var cmd_set_depth_bias_enable: def(
        command_buffer: CommandBuffer, depth_bias_enable: Bool32
    ) thin abi("C")
    var cmd_set_primitive_restart_enable: def(
        command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ) thin abi("C")

    def __init__(out self, dlhandle: ArcPointer[OwnedDLHandle], device: Device):
        var get_device_proc_addr = dlhandle[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self.create_private_data_slot = Ptr(to=get_device_proc_addr(
            device, "vkCreatePrivateDataSlot".as_c_string_slice()
        )).bitcast[type_of(self.create_private_data_slot)]()[]
        self.destroy_private_data_slot = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPrivateDataSlot".as_c_string_slice()
        )).bitcast[type_of(self.destroy_private_data_slot)]()[]
        self.set_private_data = Ptr(to=get_device_proc_addr(
            device, "vkSetPrivateData".as_c_string_slice()
        )).bitcast[type_of(self.set_private_data)]()[]
        self.get_private_data = Ptr(to=get_device_proc_addr(
            device, "vkGetPrivateData".as_c_string_slice()
        )).bitcast[type_of(self.get_private_data)]()[]
        self.cmd_pipeline_barrier_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPipelineBarrier2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_pipeline_barrier_2)]()[]
        self.cmd_write_timestamp_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteTimestamp2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_write_timestamp_2)]()[]
        self.queue_submit_2 = Ptr(to=get_device_proc_addr(
            device, "vkQueueSubmit2".as_c_string_slice()
        )).bitcast[type_of(self.queue_submit_2)]()[]
        self.cmd_copy_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBuffer2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_copy_buffer_2)]()[]
        self.cmd_copy_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImage2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_copy_image_2)]()[]
        self.cmd_copy_buffer_to_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBufferToImage2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_copy_buffer_to_image_2)]()[]
        self.cmd_copy_image_to_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImageToBuffer2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_copy_image_to_buffer_2)]()[]
        self.get_device_buffer_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceBufferMemoryRequirements".as_c_string_slice()
        )).bitcast[type_of(self.get_device_buffer_memory_requirements)]()[]
        self.get_device_image_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageMemoryRequirements".as_c_string_slice()
        )).bitcast[type_of(self.get_device_image_memory_requirements)]()[]
        self.get_device_image_sparse_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageSparseMemoryRequirements".as_c_string_slice()
        )).bitcast[type_of(self.get_device_image_sparse_memory_requirements)]()[]
        self.cmd_set_event_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetEvent2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_event_2)]()[]
        self.cmd_reset_event_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdResetEvent2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_reset_event_2)]()[]
        self.cmd_wait_events_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdWaitEvents2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_wait_events_2)]()[]
        self.cmd_blit_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBlitImage2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_blit_image_2)]()[]
        self.cmd_resolve_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdResolveImage2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_resolve_image_2)]()[]
        self.cmd_begin_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginRendering".as_c_string_slice()
        )).bitcast[type_of(self.cmd_begin_rendering)]()[]
        self.cmd_end_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRendering".as_c_string_slice()
        )).bitcast[type_of(self.cmd_end_rendering)]()[]
        self.cmd_set_cull_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCullMode".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_cull_mode)]()[]
        self.cmd_set_front_face = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFrontFace".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_front_face)]()[]
        self.cmd_set_primitive_topology = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveTopology".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_primitive_topology)]()[]
        self.cmd_set_viewport_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWithCount".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_viewport_with_count)]()[]
        self.cmd_set_scissor_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetScissorWithCount".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_scissor_with_count)]()[]
        self.cmd_bind_vertex_buffers_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindVertexBuffers2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_bind_vertex_buffers_2)]()[]
        self.cmd_set_depth_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthTestEnable".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_depth_test_enable)]()[]
        self.cmd_set_depth_write_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthWriteEnable".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_depth_write_enable)]()[]
        self.cmd_set_depth_compare_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthCompareOp".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_depth_compare_op)]()[]
        self.cmd_set_depth_bounds_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBoundsTestEnable".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_depth_bounds_test_enable)]()[]
        self.cmd_set_stencil_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilTestEnable".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_stencil_test_enable)]()[]
        self.cmd_set_stencil_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilOp".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_stencil_op)]()[]
        self.cmd_set_rasterizer_discard_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizerDiscardEnable".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_rasterizer_discard_enable)]()[]
        self.cmd_set_depth_bias_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBiasEnable".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_depth_bias_enable)]()[]
        self.cmd_set_primitive_restart_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveRestartEnable".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_primitive_restart_enable)]()[]


struct DeviceFunctionsAdditionsV1_4(Copyable):
    var map_memory_2: def(
        device: Device,
        p_memory_map_info: Ptr[MemoryMapInfo, ImmutUntrackedOrigin],
        pp_data: Ptr[Ptr[NoneType, MutUntrackedOrigin], MutUntrackedOrigin],
    ) thin abi("C") -> Result
    var unmap_memory_2: def(
        device: Device, p_memory_unmap_info: Ptr[MemoryUnmapInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var get_device_image_subresource_layout: def(
        device: Device,
        p_info: Ptr[DeviceImageSubresourceInfo, ImmutUntrackedOrigin],
        p_layout: Ptr[SubresourceLayout2, MutUntrackedOrigin],
    ) thin abi("C")
    var get_image_subresource_layout_2: def(
        device: Device,
        image: Image,
        p_subresource: Ptr[ImageSubresource2, ImmutUntrackedOrigin],
        p_layout: Ptr[SubresourceLayout2, MutUntrackedOrigin],
    ) thin abi("C")
    var copy_memory_to_image: def(
        device: Device, p_copy_memory_to_image_info: Ptr[CopyMemoryToImageInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var copy_image_to_memory: def(
        device: Device, p_copy_image_to_memory_info: Ptr[CopyImageToMemoryInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var copy_image_to_image: def(
        device: Device, p_copy_image_to_image_info: Ptr[CopyImageToImageInfo, ImmutUntrackedOrigin]
    ) thin abi("C") -> Result
    var transition_image_layout: def(
        device: Device,
        transition_count: UInt32,
        p_transitions: Ptr[HostImageLayoutTransitionInfo, ImmutUntrackedOrigin],
    ) thin abi("C") -> Result
    var cmd_push_descriptor_set: def(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_push_descriptor_set_with_template: def(
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        p_data: Ptr[NoneType, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_bind_descriptor_sets_2: def(
        command_buffer: CommandBuffer,
        p_bind_descriptor_sets_info: Ptr[BindDescriptorSetsInfo, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_push_constants_2: def(
        command_buffer: CommandBuffer,
        p_push_constants_info: Ptr[PushConstantsInfo, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_push_descriptor_set_2: def(
        command_buffer: CommandBuffer,
        p_push_descriptor_set_info: Ptr[PushDescriptorSetInfo, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_push_descriptor_set_with_template_2: def(
        command_buffer: CommandBuffer,
        p_push_descriptor_set_with_template_info: Ptr[PushDescriptorSetWithTemplateInfo, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_set_line_stipple: def(
        command_buffer: CommandBuffer, line_stipple_factor: UInt32, line_stipple_pattern: UInt16
    ) thin abi("C")
    var cmd_bind_index_buffer_2: def(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        size: DeviceSize,
        index_type: IndexType,
    ) thin abi("C")
    var get_rendering_area_granularity: def(
        device: Device,
        p_rendering_area_info: Ptr[RenderingAreaInfo, ImmutUntrackedOrigin],
        p_granularity: Ptr[Extent2D, MutUntrackedOrigin],
    ) thin abi("C")
    var cmd_set_rendering_attachment_locations: def(
        command_buffer: CommandBuffer,
        p_location_info: Ptr[RenderingAttachmentLocationInfo, ImmutUntrackedOrigin],
    ) thin abi("C")
    var cmd_set_rendering_input_attachment_indices: def(
        command_buffer: CommandBuffer,
        p_input_attachment_index_info: Ptr[RenderingInputAttachmentIndexInfo, ImmutUntrackedOrigin],
    ) thin abi("C")

    def __init__(out self, dlhandle: ArcPointer[OwnedDLHandle], device: Device):
        var get_device_proc_addr = dlhandle[].get_function[
            def(device: Device, p_name: CStringSlice[StaticConstantOrigin]) thin abi("C") -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self.map_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkMapMemory2".as_c_string_slice()
        )).bitcast[type_of(self.map_memory_2)]()[]
        self.unmap_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkUnmapMemory2".as_c_string_slice()
        )).bitcast[type_of(self.unmap_memory_2)]()[]
        self.get_device_image_subresource_layout = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageSubresourceLayout".as_c_string_slice()
        )).bitcast[type_of(self.get_device_image_subresource_layout)]()[]
        self.get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout2".as_c_string_slice()
        )).bitcast[type_of(self.get_image_subresource_layout_2)]()[]
        self.copy_memory_to_image = Ptr(to=get_device_proc_addr(
            device, "vkCopyMemoryToImage".as_c_string_slice()
        )).bitcast[type_of(self.copy_memory_to_image)]()[]
        self.copy_image_to_memory = Ptr(to=get_device_proc_addr(
            device, "vkCopyImageToMemory".as_c_string_slice()
        )).bitcast[type_of(self.copy_image_to_memory)]()[]
        self.copy_image_to_image = Ptr(to=get_device_proc_addr(
            device, "vkCopyImageToImage".as_c_string_slice()
        )).bitcast[type_of(self.copy_image_to_image)]()[]
        self.transition_image_layout = Ptr(to=get_device_proc_addr(
            device, "vkTransitionImageLayout".as_c_string_slice()
        )).bitcast[type_of(self.transition_image_layout)]()[]
        self.cmd_push_descriptor_set = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSet".as_c_string_slice()
        )).bitcast[type_of(self.cmd_push_descriptor_set)]()[]
        self.cmd_push_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSetWithTemplate".as_c_string_slice()
        )).bitcast[type_of(self.cmd_push_descriptor_set_with_template)]()[]
        self.cmd_bind_descriptor_sets_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorSets2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_bind_descriptor_sets_2)]()[]
        self.cmd_push_constants_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushConstants2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_push_constants_2)]()[]
        self.cmd_push_descriptor_set_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSet2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_push_descriptor_set_2)]()[]
        self.cmd_push_descriptor_set_with_template_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSetWithTemplate2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_push_descriptor_set_with_template_2)]()[]
        self.cmd_set_line_stipple = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStipple".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_line_stipple)]()[]
        self.cmd_bind_index_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindIndexBuffer2".as_c_string_slice()
        )).bitcast[type_of(self.cmd_bind_index_buffer_2)]()[]
        self.get_rendering_area_granularity = Ptr(to=get_device_proc_addr(
            device, "vkGetRenderingAreaGranularity".as_c_string_slice()
        )).bitcast[type_of(self.get_rendering_area_granularity)]()[]
        self.cmd_set_rendering_attachment_locations = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRenderingAttachmentLocations".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_rendering_attachment_locations)]()[]
        self.cmd_set_rendering_input_attachment_indices = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRenderingInputAttachmentIndices".as_c_string_slice()
        )).bitcast[type_of(self.cmd_set_rendering_input_attachment_indices)]()[]
