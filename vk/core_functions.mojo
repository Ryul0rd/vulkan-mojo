from sys.ffi import OwnedDLHandle, RTLD, CStringSlice, c_char
from memory import ArcPointer
from .fn_types import *
from .handles import *
from .structs import *
from .misc import *


comptime Ptr = UnsafePointer


trait GlobalFunctions:
    fn get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        ...


struct GlobalFunctionsV1_0(GlobalFunctions, Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: GlobalFunctionAdditionsV1_0

    fn __init__(out self) raises:
        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))
        self._v1_0 = GlobalFunctionAdditionsV1_0(self._dlhandle[])

    fn get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        return self._dlhandle

    fn create_instance(
        self,
        create_info: InstanceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut instance: Instance,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateInstance.html
        """
        return self._v1_0.create_instance(
            Ptr(to=create_info).bitcast[InstanceCreateInfo]()[],
            p_allocator,
            Ptr(to=instance).bitcast[Instance]()[],
        )

    fn get_instance_proc_addr(
        self, instance: Instance, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetInstanceProcAddr.html
        """
        return self._v1_0.get_instance_proc_addr(instance, p_name)

    fn enumerate_instance_extension_properties(
        self,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        mut property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        return self._v1_0.enumerate_instance_extension_properties(
            p_layer_name, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_instance_extension_properties(
        self, p_layer_name: CStringSlice[ImmutAnyOrigin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_instance_extension_properties(
                p_layer_name, count, Ptr[ExtensionProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_instance_extension_properties(
                p_layer_name, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_instance_layer_properties(
        self, mut property_count: UInt32, p_properties: Ptr[LayerProperties, MutAnyOrigin]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        return self._v1_0.enumerate_instance_layer_properties(
            Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_instance_layer_properties(self) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_instance_layer_properties(
                count, Ptr[LayerProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_instance_layer_properties(count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)


struct GlobalFunctionsV1_1(GlobalFunctions, Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: GlobalFunctionAdditionsV1_0
    var _v1_1: GlobalFunctionAdditionsV1_1

    fn __init__(out self) raises:
        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))
        self._v1_0 = GlobalFunctionAdditionsV1_0(self._dlhandle[])
        self._v1_1 = GlobalFunctionAdditionsV1_1(self._dlhandle[])

    fn get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        return self._dlhandle

    fn create_instance(
        self,
        create_info: InstanceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut instance: Instance,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateInstance.html
        """
        return self._v1_0.create_instance(
            Ptr(to=create_info).bitcast[InstanceCreateInfo]()[],
            p_allocator,
            Ptr(to=instance).bitcast[Instance]()[],
        )

    fn get_instance_proc_addr(
        self, instance: Instance, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetInstanceProcAddr.html
        """
        return self._v1_0.get_instance_proc_addr(instance, p_name)

    fn enumerate_instance_extension_properties(
        self,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        mut property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        return self._v1_0.enumerate_instance_extension_properties(
            p_layer_name, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_instance_extension_properties(
        self, p_layer_name: CStringSlice[ImmutAnyOrigin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_instance_extension_properties(
                p_layer_name, count, Ptr[ExtensionProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_instance_extension_properties(
                p_layer_name, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_instance_layer_properties(
        self, mut property_count: UInt32, p_properties: Ptr[LayerProperties, MutAnyOrigin]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        return self._v1_0.enumerate_instance_layer_properties(
            Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_instance_layer_properties(self) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_instance_layer_properties(
                count, Ptr[LayerProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_instance_layer_properties(count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_instance_version(self, mut api_version: Version) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._v1_1.enumerate_instance_version(Ptr(to=api_version).bitcast[Version]()[])


struct GlobalFunctionsV1_2(GlobalFunctions, Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: GlobalFunctionAdditionsV1_0
    var _v1_1: GlobalFunctionAdditionsV1_1

    fn __init__(out self) raises:
        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))
        self._v1_0 = GlobalFunctionAdditionsV1_0(self._dlhandle[])
        self._v1_1 = GlobalFunctionAdditionsV1_1(self._dlhandle[])

    fn get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        return self._dlhandle

    fn create_instance(
        self,
        create_info: InstanceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut instance: Instance,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateInstance.html
        """
        return self._v1_0.create_instance(
            Ptr(to=create_info).bitcast[InstanceCreateInfo]()[],
            p_allocator,
            Ptr(to=instance).bitcast[Instance]()[],
        )

    fn get_instance_proc_addr(
        self, instance: Instance, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetInstanceProcAddr.html
        """
        return self._v1_0.get_instance_proc_addr(instance, p_name)

    fn enumerate_instance_extension_properties(
        self,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        mut property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        return self._v1_0.enumerate_instance_extension_properties(
            p_layer_name, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_instance_extension_properties(
        self, p_layer_name: CStringSlice[ImmutAnyOrigin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_instance_extension_properties(
                p_layer_name, count, Ptr[ExtensionProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_instance_extension_properties(
                p_layer_name, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_instance_layer_properties(
        self, mut property_count: UInt32, p_properties: Ptr[LayerProperties, MutAnyOrigin]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        return self._v1_0.enumerate_instance_layer_properties(
            Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_instance_layer_properties(self) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_instance_layer_properties(
                count, Ptr[LayerProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_instance_layer_properties(count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_instance_version(self, mut api_version: Version) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._v1_1.enumerate_instance_version(Ptr(to=api_version).bitcast[Version]()[])


struct GlobalFunctionsV1_3(GlobalFunctions, Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: GlobalFunctionAdditionsV1_0
    var _v1_1: GlobalFunctionAdditionsV1_1

    fn __init__(out self) raises:
        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))
        self._v1_0 = GlobalFunctionAdditionsV1_0(self._dlhandle[])
        self._v1_1 = GlobalFunctionAdditionsV1_1(self._dlhandle[])

    fn get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        return self._dlhandle

    fn create_instance(
        self,
        create_info: InstanceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut instance: Instance,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateInstance.html
        """
        return self._v1_0.create_instance(
            Ptr(to=create_info).bitcast[InstanceCreateInfo]()[],
            p_allocator,
            Ptr(to=instance).bitcast[Instance]()[],
        )

    fn get_instance_proc_addr(
        self, instance: Instance, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetInstanceProcAddr.html
        """
        return self._v1_0.get_instance_proc_addr(instance, p_name)

    fn enumerate_instance_extension_properties(
        self,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        mut property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        return self._v1_0.enumerate_instance_extension_properties(
            p_layer_name, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_instance_extension_properties(
        self, p_layer_name: CStringSlice[ImmutAnyOrigin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_instance_extension_properties(
                p_layer_name, count, Ptr[ExtensionProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_instance_extension_properties(
                p_layer_name, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_instance_layer_properties(
        self, mut property_count: UInt32, p_properties: Ptr[LayerProperties, MutAnyOrigin]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        return self._v1_0.enumerate_instance_layer_properties(
            Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_instance_layer_properties(self) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_instance_layer_properties(
                count, Ptr[LayerProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_instance_layer_properties(count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_instance_version(self, mut api_version: Version) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._v1_1.enumerate_instance_version(Ptr(to=api_version).bitcast[Version]()[])


struct GlobalFunctionsV1_4(GlobalFunctions, Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: GlobalFunctionAdditionsV1_0
    var _v1_1: GlobalFunctionAdditionsV1_1

    fn __init__(out self) raises:
        self._dlhandle = ArcPointer(OwnedDLHandle("libvulkan.so.1", RTLD.NOW | RTLD.GLOBAL))
        self._v1_0 = GlobalFunctionAdditionsV1_0(self._dlhandle[])
        self._v1_1 = GlobalFunctionAdditionsV1_1(self._dlhandle[])

    fn get_dlhandle(self) -> ArcPointer[OwnedDLHandle]:
        return self._dlhandle

    fn create_instance(
        self,
        create_info: InstanceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut instance: Instance,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateInstance.html
        """
        return self._v1_0.create_instance(
            Ptr(to=create_info).bitcast[InstanceCreateInfo]()[],
            p_allocator,
            Ptr(to=instance).bitcast[Instance]()[],
        )

    fn get_instance_proc_addr(
        self, instance: Instance, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetInstanceProcAddr.html
        """
        return self._v1_0.get_instance_proc_addr(instance, p_name)

    fn enumerate_instance_extension_properties(
        self,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        mut property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        return self._v1_0.enumerate_instance_extension_properties(
            p_layer_name, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_instance_extension_properties(
        self, p_layer_name: CStringSlice[ImmutAnyOrigin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_instance_extension_properties(
                p_layer_name, count, Ptr[ExtensionProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_instance_extension_properties(
                p_layer_name, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_instance_layer_properties(
        self, mut property_count: UInt32, p_properties: Ptr[LayerProperties, MutAnyOrigin]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        return self._v1_0.enumerate_instance_layer_properties(
            Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_instance_layer_properties(self) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_instance_layer_properties(
                count, Ptr[LayerProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_instance_layer_properties(count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_instance_version(self, mut api_version: Version) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._v1_1.enumerate_instance_version(Ptr(to=api_version).bitcast[Version]()[])


struct InstanceFunctionsV1_0(Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: InstanceFunctionAdditionsV1_0

    fn __init__(out self, global_functions: GlobalFunctionsV1_0, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = InstanceFunctionAdditionsV1_0(instance, global_functions.get_dlhandle()[])

    fn destroy_instance(
        self, instance: Instance, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyInstance.html
        """
        return self._v1_0.destroy_instance(instance, p_allocator)

    fn enumerate_physical_devices(
        self,
        instance: Instance,
        mut physical_device_count: UInt32,
        p_physical_devices: Ptr[PhysicalDevice, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        return self._v1_0.enumerate_physical_devices(
            instance, Ptr(to=physical_device_count).bitcast[UInt32]()[], p_physical_devices
        )

    fn enumerate_physical_devices(self, instance: Instance) -> ListResult[PhysicalDevice]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        var list = List[PhysicalDevice]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_physical_devices(
                instance, count, Ptr[PhysicalDevice, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_physical_devices(instance, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_features(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures.html
        """
        return self._v1_0.get_physical_device_features(
            physical_device, Ptr(to=features).bitcast[PhysicalDeviceFeatures]()[]
        )

    fn get_physical_device_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties.html
        """
        return self._v1_0.get_physical_device_format_properties(
            physical_device, format, Ptr(to=format_properties).bitcast[FormatProperties]()[]
        )

    fn get_physical_device_image_format_properties(
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
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties]()[],
        )

    fn get_physical_device_properties(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties.html
        """
        return self._v1_0.get_physical_device_properties(
            physical_device, Ptr(to=properties).bitcast[PhysicalDeviceProperties]()[]
        )

    fn get_physical_device_queue_family_properties(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        return self._v1_0.get_physical_device_queue_family_properties(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]()[],
            p_queue_family_properties,
        )

    fn get_physical_device_queue_family_properties(
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        var list = List[QueueFamilyProperties]()
        var count: UInt32 = 0
        self.get_physical_device_queue_family_properties(
            physical_device, count, Ptr[QueueFamilyProperties, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_queue_family_properties(physical_device, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties(
        self, physical_device: PhysicalDevice, mut memory_properties: PhysicalDeviceMemoryProperties
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties.html
        """
        return self._v1_0.get_physical_device_memory_properties(
            physical_device, Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties]()[]
        )

    fn get_device_proc_addr(
        self, device: Device, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceProcAddr.html
        """
        return self._v1_0.get_device_proc_addr(device, p_name)

    fn create_device(
        self,
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut device: Device,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDevice.html
        """
        return self._v1_0.create_device(
            physical_device,
            Ptr(to=create_info).bitcast[DeviceCreateInfo]()[],
            p_allocator,
            Ptr(to=device).bitcast[Device]()[],
        )

    fn enumerate_device_extension_properties(
        self,
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        mut property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        return self._v1_0.enumerate_device_extension_properties(
            physical_device, p_layer_name, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_device_extension_properties(
        self, physical_device: PhysicalDevice, p_layer_name: CStringSlice[ImmutAnyOrigin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_device_extension_properties(
                physical_device, p_layer_name, count, Ptr[ExtensionProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_device_extension_properties(
                physical_device, p_layer_name, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_device_layer_properties(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[LayerProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        return self._v1_0.enumerate_device_layer_properties(
            physical_device, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_device_layer_properties(
        self, physical_device: PhysicalDevice
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_device_layer_properties(
                physical_device, count, Ptr[LayerProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_device_layer_properties(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_sparse_image_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties, MutAnyOrigin],
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
            Ptr(to=property_count).bitcast[UInt32]()[],
            p_properties,
        )

    fn get_physical_device_sparse_image_format_properties(
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
        self.get_physical_device_sparse_image_format_properties(
            physical_device,
            format,
            type,
            samples,
            usage,
            tiling,
            count,
            Ptr[SparseImageFormatProperties, MutAnyOrigin](),
        )
        list.reserve(Int(count))
        self.get_physical_device_sparse_image_format_properties(
            physical_device, format, type, samples, usage, tiling, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^


struct InstanceFunctionsV1_1(Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: InstanceFunctionAdditionsV1_0
    var _v1_1: InstanceFunctionAdditionsV1_1

    fn __init__(out self, global_functions: GlobalFunctionsV1_1, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = InstanceFunctionAdditionsV1_0(instance, global_functions.get_dlhandle()[])
        self._v1_1 = InstanceFunctionAdditionsV1_1(instance, global_functions.get_dlhandle()[])

    fn destroy_instance(
        self, instance: Instance, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyInstance.html
        """
        return self._v1_0.destroy_instance(instance, p_allocator)

    fn enumerate_physical_devices(
        self,
        instance: Instance,
        mut physical_device_count: UInt32,
        p_physical_devices: Ptr[PhysicalDevice, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        return self._v1_0.enumerate_physical_devices(
            instance, Ptr(to=physical_device_count).bitcast[UInt32]()[], p_physical_devices
        )

    fn enumerate_physical_devices(self, instance: Instance) -> ListResult[PhysicalDevice]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        var list = List[PhysicalDevice]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_physical_devices(
                instance, count, Ptr[PhysicalDevice, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_physical_devices(instance, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_features(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures.html
        """
        return self._v1_0.get_physical_device_features(
            physical_device, Ptr(to=features).bitcast[PhysicalDeviceFeatures]()[]
        )

    fn get_physical_device_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties.html
        """
        return self._v1_0.get_physical_device_format_properties(
            physical_device, format, Ptr(to=format_properties).bitcast[FormatProperties]()[]
        )

    fn get_physical_device_image_format_properties(
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
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties]()[],
        )

    fn get_physical_device_properties(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties.html
        """
        return self._v1_0.get_physical_device_properties(
            physical_device, Ptr(to=properties).bitcast[PhysicalDeviceProperties]()[]
        )

    fn get_physical_device_queue_family_properties(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        return self._v1_0.get_physical_device_queue_family_properties(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]()[],
            p_queue_family_properties,
        )

    fn get_physical_device_queue_family_properties(
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        var list = List[QueueFamilyProperties]()
        var count: UInt32 = 0
        self.get_physical_device_queue_family_properties(
            physical_device, count, Ptr[QueueFamilyProperties, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_queue_family_properties(physical_device, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties(
        self, physical_device: PhysicalDevice, mut memory_properties: PhysicalDeviceMemoryProperties
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties.html
        """
        return self._v1_0.get_physical_device_memory_properties(
            physical_device, Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties]()[]
        )

    fn get_device_proc_addr(
        self, device: Device, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceProcAddr.html
        """
        return self._v1_0.get_device_proc_addr(device, p_name)

    fn create_device(
        self,
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut device: Device,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDevice.html
        """
        return self._v1_0.create_device(
            physical_device,
            Ptr(to=create_info).bitcast[DeviceCreateInfo]()[],
            p_allocator,
            Ptr(to=device).bitcast[Device]()[],
        )

    fn enumerate_device_extension_properties(
        self,
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        mut property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        return self._v1_0.enumerate_device_extension_properties(
            physical_device, p_layer_name, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_device_extension_properties(
        self, physical_device: PhysicalDevice, p_layer_name: CStringSlice[ImmutAnyOrigin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_device_extension_properties(
                physical_device, p_layer_name, count, Ptr[ExtensionProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_device_extension_properties(
                physical_device, p_layer_name, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_device_layer_properties(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[LayerProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        return self._v1_0.enumerate_device_layer_properties(
            physical_device, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_device_layer_properties(
        self, physical_device: PhysicalDevice
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_device_layer_properties(
                physical_device, count, Ptr[LayerProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_device_layer_properties(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_sparse_image_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties, MutAnyOrigin],
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
            Ptr(to=property_count).bitcast[UInt32]()[],
            p_properties,
        )

    fn get_physical_device_sparse_image_format_properties(
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
        self.get_physical_device_sparse_image_format_properties(
            physical_device,
            format,
            type,
            samples,
            usage,
            tiling,
            count,
            Ptr[SparseImageFormatProperties, MutAnyOrigin](),
        )
        list.reserve(Int(count))
        self.get_physical_device_sparse_image_format_properties(
            physical_device, format, type, samples, usage, tiling, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn enumerate_physical_device_groups(
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        return self._v1_1.enumerate_physical_device_groups(
            instance,
            Ptr(to=physical_device_group_count).bitcast[UInt32]()[],
            p_physical_device_group_properties,
        )

    fn enumerate_physical_device_groups(
        self, instance: Instance
    ) -> ListResult[PhysicalDeviceGroupProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        var list = List[PhysicalDeviceGroupProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_physical_device_groups(
                instance, count, Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_physical_device_groups(instance, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_features_2(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures2.html
        """
        return self._v1_1.get_physical_device_features_2(
            physical_device, Ptr(to=features).bitcast[PhysicalDeviceFeatures2]()[]
        )

    fn get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties2.html
        """
        return self._v1_1.get_physical_device_properties_2(
            physical_device, Ptr(to=properties).bitcast[PhysicalDeviceProperties2]()[]
        )

    fn get_physical_device_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties2.html
        """
        return self._v1_1.get_physical_device_format_properties_2(
            physical_device, format, Ptr(to=format_properties).bitcast[FormatProperties2]()[]
        )

    fn get_physical_device_image_format_properties_2(
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
            Ptr(to=image_format_info).bitcast[PhysicalDeviceImageFormatInfo2]()[],
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties2]()[],
        )

    fn get_physical_device_queue_family_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        return self._v1_1.get_physical_device_queue_family_properties_2(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]()[],
            p_queue_family_properties,
        )

    fn get_physical_device_queue_family_properties_2(
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        var list = List[QueueFamilyProperties2]()
        var count: UInt32 = 0
        self.get_physical_device_queue_family_properties_2(
            physical_device, count, Ptr[QueueFamilyProperties2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_queue_family_properties_2(
            physical_device, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties2.html
        """
        return self._v1_1.get_physical_device_memory_properties_2(
            physical_device, Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties2]()[]
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_sparse_image_format_properties_2(
            physical_device,
            Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]()[],
            Ptr(to=property_count).bitcast[UInt32]()[],
            p_properties,
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self, physical_device: PhysicalDevice, format_info: PhysicalDeviceSparseImageFormatInfo2
    ) -> List[SparseImageFormatProperties2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        var list = List[SparseImageFormatProperties2]()
        var count: UInt32 = 0
        self.get_physical_device_sparse_image_format_properties_2(
            physical_device, format_info, count, Ptr[SparseImageFormatProperties2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_sparse_image_format_properties_2(
            physical_device, format_info, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn get_physical_device_external_buffer_properties(
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
            Ptr(to=external_buffer_info).bitcast[PhysicalDeviceExternalBufferInfo]()[],
            Ptr(to=external_buffer_properties).bitcast[ExternalBufferProperties]()[],
        )

    fn get_physical_device_external_fence_properties(
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
            Ptr(to=external_fence_info).bitcast[PhysicalDeviceExternalFenceInfo]()[],
            Ptr(to=external_fence_properties).bitcast[ExternalFenceProperties]()[],
        )

    fn get_physical_device_external_semaphore_properties(
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
            Ptr(to=external_semaphore_info).bitcast[PhysicalDeviceExternalSemaphoreInfo]()[],
            Ptr(to=external_semaphore_properties).bitcast[ExternalSemaphoreProperties]()[],
        )


struct InstanceFunctionsV1_2(Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: InstanceFunctionAdditionsV1_0
    var _v1_1: InstanceFunctionAdditionsV1_1

    fn __init__(out self, global_functions: GlobalFunctionsV1_2, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = InstanceFunctionAdditionsV1_0(instance, global_functions.get_dlhandle()[])
        self._v1_1 = InstanceFunctionAdditionsV1_1(instance, global_functions.get_dlhandle()[])

    fn destroy_instance(
        self, instance: Instance, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyInstance.html
        """
        return self._v1_0.destroy_instance(instance, p_allocator)

    fn enumerate_physical_devices(
        self,
        instance: Instance,
        mut physical_device_count: UInt32,
        p_physical_devices: Ptr[PhysicalDevice, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        return self._v1_0.enumerate_physical_devices(
            instance, Ptr(to=physical_device_count).bitcast[UInt32]()[], p_physical_devices
        )

    fn enumerate_physical_devices(self, instance: Instance) -> ListResult[PhysicalDevice]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        var list = List[PhysicalDevice]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_physical_devices(
                instance, count, Ptr[PhysicalDevice, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_physical_devices(instance, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_features(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures.html
        """
        return self._v1_0.get_physical_device_features(
            physical_device, Ptr(to=features).bitcast[PhysicalDeviceFeatures]()[]
        )

    fn get_physical_device_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties.html
        """
        return self._v1_0.get_physical_device_format_properties(
            physical_device, format, Ptr(to=format_properties).bitcast[FormatProperties]()[]
        )

    fn get_physical_device_image_format_properties(
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
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties]()[],
        )

    fn get_physical_device_properties(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties.html
        """
        return self._v1_0.get_physical_device_properties(
            physical_device, Ptr(to=properties).bitcast[PhysicalDeviceProperties]()[]
        )

    fn get_physical_device_queue_family_properties(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        return self._v1_0.get_physical_device_queue_family_properties(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]()[],
            p_queue_family_properties,
        )

    fn get_physical_device_queue_family_properties(
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        var list = List[QueueFamilyProperties]()
        var count: UInt32 = 0
        self.get_physical_device_queue_family_properties(
            physical_device, count, Ptr[QueueFamilyProperties, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_queue_family_properties(physical_device, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties(
        self, physical_device: PhysicalDevice, mut memory_properties: PhysicalDeviceMemoryProperties
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties.html
        """
        return self._v1_0.get_physical_device_memory_properties(
            physical_device, Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties]()[]
        )

    fn get_device_proc_addr(
        self, device: Device, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceProcAddr.html
        """
        return self._v1_0.get_device_proc_addr(device, p_name)

    fn create_device(
        self,
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut device: Device,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDevice.html
        """
        return self._v1_0.create_device(
            physical_device,
            Ptr(to=create_info).bitcast[DeviceCreateInfo]()[],
            p_allocator,
            Ptr(to=device).bitcast[Device]()[],
        )

    fn enumerate_device_extension_properties(
        self,
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        mut property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        return self._v1_0.enumerate_device_extension_properties(
            physical_device, p_layer_name, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_device_extension_properties(
        self, physical_device: PhysicalDevice, p_layer_name: CStringSlice[ImmutAnyOrigin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_device_extension_properties(
                physical_device, p_layer_name, count, Ptr[ExtensionProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_device_extension_properties(
                physical_device, p_layer_name, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_device_layer_properties(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[LayerProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        return self._v1_0.enumerate_device_layer_properties(
            physical_device, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_device_layer_properties(
        self, physical_device: PhysicalDevice
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_device_layer_properties(
                physical_device, count, Ptr[LayerProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_device_layer_properties(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_sparse_image_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties, MutAnyOrigin],
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
            Ptr(to=property_count).bitcast[UInt32]()[],
            p_properties,
        )

    fn get_physical_device_sparse_image_format_properties(
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
        self.get_physical_device_sparse_image_format_properties(
            physical_device,
            format,
            type,
            samples,
            usage,
            tiling,
            count,
            Ptr[SparseImageFormatProperties, MutAnyOrigin](),
        )
        list.reserve(Int(count))
        self.get_physical_device_sparse_image_format_properties(
            physical_device, format, type, samples, usage, tiling, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn enumerate_physical_device_groups(
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        return self._v1_1.enumerate_physical_device_groups(
            instance,
            Ptr(to=physical_device_group_count).bitcast[UInt32]()[],
            p_physical_device_group_properties,
        )

    fn enumerate_physical_device_groups(
        self, instance: Instance
    ) -> ListResult[PhysicalDeviceGroupProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        var list = List[PhysicalDeviceGroupProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_physical_device_groups(
                instance, count, Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_physical_device_groups(instance, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_features_2(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures2.html
        """
        return self._v1_1.get_physical_device_features_2(
            physical_device, Ptr(to=features).bitcast[PhysicalDeviceFeatures2]()[]
        )

    fn get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties2.html
        """
        return self._v1_1.get_physical_device_properties_2(
            physical_device, Ptr(to=properties).bitcast[PhysicalDeviceProperties2]()[]
        )

    fn get_physical_device_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties2.html
        """
        return self._v1_1.get_physical_device_format_properties_2(
            physical_device, format, Ptr(to=format_properties).bitcast[FormatProperties2]()[]
        )

    fn get_physical_device_image_format_properties_2(
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
            Ptr(to=image_format_info).bitcast[PhysicalDeviceImageFormatInfo2]()[],
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties2]()[],
        )

    fn get_physical_device_queue_family_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        return self._v1_1.get_physical_device_queue_family_properties_2(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]()[],
            p_queue_family_properties,
        )

    fn get_physical_device_queue_family_properties_2(
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        var list = List[QueueFamilyProperties2]()
        var count: UInt32 = 0
        self.get_physical_device_queue_family_properties_2(
            physical_device, count, Ptr[QueueFamilyProperties2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_queue_family_properties_2(
            physical_device, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties2.html
        """
        return self._v1_1.get_physical_device_memory_properties_2(
            physical_device, Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties2]()[]
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_sparse_image_format_properties_2(
            physical_device,
            Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]()[],
            Ptr(to=property_count).bitcast[UInt32]()[],
            p_properties,
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self, physical_device: PhysicalDevice, format_info: PhysicalDeviceSparseImageFormatInfo2
    ) -> List[SparseImageFormatProperties2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        var list = List[SparseImageFormatProperties2]()
        var count: UInt32 = 0
        self.get_physical_device_sparse_image_format_properties_2(
            physical_device, format_info, count, Ptr[SparseImageFormatProperties2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_sparse_image_format_properties_2(
            physical_device, format_info, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn get_physical_device_external_buffer_properties(
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
            Ptr(to=external_buffer_info).bitcast[PhysicalDeviceExternalBufferInfo]()[],
            Ptr(to=external_buffer_properties).bitcast[ExternalBufferProperties]()[],
        )

    fn get_physical_device_external_fence_properties(
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
            Ptr(to=external_fence_info).bitcast[PhysicalDeviceExternalFenceInfo]()[],
            Ptr(to=external_fence_properties).bitcast[ExternalFenceProperties]()[],
        )

    fn get_physical_device_external_semaphore_properties(
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
            Ptr(to=external_semaphore_info).bitcast[PhysicalDeviceExternalSemaphoreInfo]()[],
            Ptr(to=external_semaphore_properties).bitcast[ExternalSemaphoreProperties]()[],
        )


struct InstanceFunctionsV1_3(Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: InstanceFunctionAdditionsV1_0
    var _v1_1: InstanceFunctionAdditionsV1_1
    var _v1_3: InstanceFunctionAdditionsV1_3

    fn __init__(out self, global_functions: GlobalFunctionsV1_3, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = InstanceFunctionAdditionsV1_0(instance, global_functions.get_dlhandle()[])
        self._v1_1 = InstanceFunctionAdditionsV1_1(instance, global_functions.get_dlhandle()[])
        self._v1_3 = InstanceFunctionAdditionsV1_3(instance, global_functions.get_dlhandle()[])

    fn destroy_instance(
        self, instance: Instance, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyInstance.html
        """
        return self._v1_0.destroy_instance(instance, p_allocator)

    fn enumerate_physical_devices(
        self,
        instance: Instance,
        mut physical_device_count: UInt32,
        p_physical_devices: Ptr[PhysicalDevice, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        return self._v1_0.enumerate_physical_devices(
            instance, Ptr(to=physical_device_count).bitcast[UInt32]()[], p_physical_devices
        )

    fn enumerate_physical_devices(self, instance: Instance) -> ListResult[PhysicalDevice]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        var list = List[PhysicalDevice]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_physical_devices(
                instance, count, Ptr[PhysicalDevice, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_physical_devices(instance, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_features(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures.html
        """
        return self._v1_0.get_physical_device_features(
            physical_device, Ptr(to=features).bitcast[PhysicalDeviceFeatures]()[]
        )

    fn get_physical_device_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties.html
        """
        return self._v1_0.get_physical_device_format_properties(
            physical_device, format, Ptr(to=format_properties).bitcast[FormatProperties]()[]
        )

    fn get_physical_device_image_format_properties(
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
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties]()[],
        )

    fn get_physical_device_properties(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties.html
        """
        return self._v1_0.get_physical_device_properties(
            physical_device, Ptr(to=properties).bitcast[PhysicalDeviceProperties]()[]
        )

    fn get_physical_device_queue_family_properties(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        return self._v1_0.get_physical_device_queue_family_properties(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]()[],
            p_queue_family_properties,
        )

    fn get_physical_device_queue_family_properties(
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        var list = List[QueueFamilyProperties]()
        var count: UInt32 = 0
        self.get_physical_device_queue_family_properties(
            physical_device, count, Ptr[QueueFamilyProperties, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_queue_family_properties(physical_device, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties(
        self, physical_device: PhysicalDevice, mut memory_properties: PhysicalDeviceMemoryProperties
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties.html
        """
        return self._v1_0.get_physical_device_memory_properties(
            physical_device, Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties]()[]
        )

    fn get_device_proc_addr(
        self, device: Device, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceProcAddr.html
        """
        return self._v1_0.get_device_proc_addr(device, p_name)

    fn create_device(
        self,
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut device: Device,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDevice.html
        """
        return self._v1_0.create_device(
            physical_device,
            Ptr(to=create_info).bitcast[DeviceCreateInfo]()[],
            p_allocator,
            Ptr(to=device).bitcast[Device]()[],
        )

    fn enumerate_device_extension_properties(
        self,
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        mut property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        return self._v1_0.enumerate_device_extension_properties(
            physical_device, p_layer_name, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_device_extension_properties(
        self, physical_device: PhysicalDevice, p_layer_name: CStringSlice[ImmutAnyOrigin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_device_extension_properties(
                physical_device, p_layer_name, count, Ptr[ExtensionProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_device_extension_properties(
                physical_device, p_layer_name, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_device_layer_properties(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[LayerProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        return self._v1_0.enumerate_device_layer_properties(
            physical_device, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_device_layer_properties(
        self, physical_device: PhysicalDevice
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_device_layer_properties(
                physical_device, count, Ptr[LayerProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_device_layer_properties(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_sparse_image_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties, MutAnyOrigin],
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
            Ptr(to=property_count).bitcast[UInt32]()[],
            p_properties,
        )

    fn get_physical_device_sparse_image_format_properties(
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
        self.get_physical_device_sparse_image_format_properties(
            physical_device,
            format,
            type,
            samples,
            usage,
            tiling,
            count,
            Ptr[SparseImageFormatProperties, MutAnyOrigin](),
        )
        list.reserve(Int(count))
        self.get_physical_device_sparse_image_format_properties(
            physical_device, format, type, samples, usage, tiling, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn enumerate_physical_device_groups(
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        return self._v1_1.enumerate_physical_device_groups(
            instance,
            Ptr(to=physical_device_group_count).bitcast[UInt32]()[],
            p_physical_device_group_properties,
        )

    fn enumerate_physical_device_groups(
        self, instance: Instance
    ) -> ListResult[PhysicalDeviceGroupProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        var list = List[PhysicalDeviceGroupProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_physical_device_groups(
                instance, count, Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_physical_device_groups(instance, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_features_2(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures2.html
        """
        return self._v1_1.get_physical_device_features_2(
            physical_device, Ptr(to=features).bitcast[PhysicalDeviceFeatures2]()[]
        )

    fn get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties2.html
        """
        return self._v1_1.get_physical_device_properties_2(
            physical_device, Ptr(to=properties).bitcast[PhysicalDeviceProperties2]()[]
        )

    fn get_physical_device_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties2.html
        """
        return self._v1_1.get_physical_device_format_properties_2(
            physical_device, format, Ptr(to=format_properties).bitcast[FormatProperties2]()[]
        )

    fn get_physical_device_image_format_properties_2(
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
            Ptr(to=image_format_info).bitcast[PhysicalDeviceImageFormatInfo2]()[],
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties2]()[],
        )

    fn get_physical_device_queue_family_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        return self._v1_1.get_physical_device_queue_family_properties_2(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]()[],
            p_queue_family_properties,
        )

    fn get_physical_device_queue_family_properties_2(
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        var list = List[QueueFamilyProperties2]()
        var count: UInt32 = 0
        self.get_physical_device_queue_family_properties_2(
            physical_device, count, Ptr[QueueFamilyProperties2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_queue_family_properties_2(
            physical_device, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties2.html
        """
        return self._v1_1.get_physical_device_memory_properties_2(
            physical_device, Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties2]()[]
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_sparse_image_format_properties_2(
            physical_device,
            Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]()[],
            Ptr(to=property_count).bitcast[UInt32]()[],
            p_properties,
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self, physical_device: PhysicalDevice, format_info: PhysicalDeviceSparseImageFormatInfo2
    ) -> List[SparseImageFormatProperties2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        var list = List[SparseImageFormatProperties2]()
        var count: UInt32 = 0
        self.get_physical_device_sparse_image_format_properties_2(
            physical_device, format_info, count, Ptr[SparseImageFormatProperties2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_sparse_image_format_properties_2(
            physical_device, format_info, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn get_physical_device_external_buffer_properties(
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
            Ptr(to=external_buffer_info).bitcast[PhysicalDeviceExternalBufferInfo]()[],
            Ptr(to=external_buffer_properties).bitcast[ExternalBufferProperties]()[],
        )

    fn get_physical_device_external_fence_properties(
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
            Ptr(to=external_fence_info).bitcast[PhysicalDeviceExternalFenceInfo]()[],
            Ptr(to=external_fence_properties).bitcast[ExternalFenceProperties]()[],
        )

    fn get_physical_device_external_semaphore_properties(
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
            Ptr(to=external_semaphore_info).bitcast[PhysicalDeviceExternalSemaphoreInfo]()[],
            Ptr(to=external_semaphore_properties).bitcast[ExternalSemaphoreProperties]()[],
        )

    fn get_physical_device_tool_properties(
        self,
        physical_device: PhysicalDevice,
        mut tool_count: UInt32,
        p_tool_properties: Ptr[PhysicalDeviceToolProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        return self._v1_3.get_physical_device_tool_properties(
            physical_device, Ptr(to=tool_count).bitcast[UInt32]()[], p_tool_properties
        )

    fn get_physical_device_tool_properties(
        self, physical_device: PhysicalDevice
    ) -> ListResult[PhysicalDeviceToolProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        var list = List[PhysicalDeviceToolProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_tool_properties(
                physical_device, count, Ptr[PhysicalDeviceToolProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.get_physical_device_tool_properties(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)


struct InstanceFunctionsV1_4(Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: InstanceFunctionAdditionsV1_0
    var _v1_1: InstanceFunctionAdditionsV1_1
    var _v1_3: InstanceFunctionAdditionsV1_3

    fn __init__(out self, global_functions: GlobalFunctionsV1_4, instance: Instance):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = InstanceFunctionAdditionsV1_0(instance, global_functions.get_dlhandle()[])
        self._v1_1 = InstanceFunctionAdditionsV1_1(instance, global_functions.get_dlhandle()[])
        self._v1_3 = InstanceFunctionAdditionsV1_3(instance, global_functions.get_dlhandle()[])

    fn destroy_instance(
        self, instance: Instance, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyInstance.html
        """
        return self._v1_0.destroy_instance(instance, p_allocator)

    fn enumerate_physical_devices(
        self,
        instance: Instance,
        mut physical_device_count: UInt32,
        p_physical_devices: Ptr[PhysicalDevice, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        return self._v1_0.enumerate_physical_devices(
            instance, Ptr(to=physical_device_count).bitcast[UInt32]()[], p_physical_devices
        )

    fn enumerate_physical_devices(self, instance: Instance) -> ListResult[PhysicalDevice]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDevices.html
        """
        var list = List[PhysicalDevice]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_physical_devices(
                instance, count, Ptr[PhysicalDevice, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_physical_devices(instance, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_features(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures.html
        """
        return self._v1_0.get_physical_device_features(
            physical_device, Ptr(to=features).bitcast[PhysicalDeviceFeatures]()[]
        )

    fn get_physical_device_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties.html
        """
        return self._v1_0.get_physical_device_format_properties(
            physical_device, format, Ptr(to=format_properties).bitcast[FormatProperties]()[]
        )

    fn get_physical_device_image_format_properties(
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
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties]()[],
        )

    fn get_physical_device_properties(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties.html
        """
        return self._v1_0.get_physical_device_properties(
            physical_device, Ptr(to=properties).bitcast[PhysicalDeviceProperties]()[]
        )

    fn get_physical_device_queue_family_properties(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        return self._v1_0.get_physical_device_queue_family_properties(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]()[],
            p_queue_family_properties,
        )

    fn get_physical_device_queue_family_properties(
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties.html
        """
        var list = List[QueueFamilyProperties]()
        var count: UInt32 = 0
        self.get_physical_device_queue_family_properties(
            physical_device, count, Ptr[QueueFamilyProperties, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_queue_family_properties(physical_device, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties(
        self, physical_device: PhysicalDevice, mut memory_properties: PhysicalDeviceMemoryProperties
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties.html
        """
        return self._v1_0.get_physical_device_memory_properties(
            physical_device, Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties]()[]
        )

    fn get_device_proc_addr(
        self, device: Device, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceProcAddr.html
        """
        return self._v1_0.get_device_proc_addr(device, p_name)

    fn create_device(
        self,
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut device: Device,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDevice.html
        """
        return self._v1_0.create_device(
            physical_device,
            Ptr(to=create_info).bitcast[DeviceCreateInfo]()[],
            p_allocator,
            Ptr(to=device).bitcast[Device]()[],
        )

    fn enumerate_device_extension_properties(
        self,
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        mut property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        return self._v1_0.enumerate_device_extension_properties(
            physical_device, p_layer_name, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_device_extension_properties(
        self, physical_device: PhysicalDevice, p_layer_name: CStringSlice[ImmutAnyOrigin]
    ) -> ListResult[ExtensionProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceExtensionProperties.html
        """
        var list = List[ExtensionProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_device_extension_properties(
                physical_device, p_layer_name, count, Ptr[ExtensionProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_device_extension_properties(
                physical_device, p_layer_name, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn enumerate_device_layer_properties(
        self,
        physical_device: PhysicalDevice,
        mut property_count: UInt32,
        p_properties: Ptr[LayerProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        return self._v1_0.enumerate_device_layer_properties(
            physical_device, Ptr(to=property_count).bitcast[UInt32]()[], p_properties
        )

    fn enumerate_device_layer_properties(
        self, physical_device: PhysicalDevice
    ) -> ListResult[LayerProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateDeviceLayerProperties.html
        """
        var list = List[LayerProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_device_layer_properties(
                physical_device, count, Ptr[LayerProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_device_layer_properties(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_sparse_image_format_properties(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties, MutAnyOrigin],
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
            Ptr(to=property_count).bitcast[UInt32]()[],
            p_properties,
        )

    fn get_physical_device_sparse_image_format_properties(
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
        self.get_physical_device_sparse_image_format_properties(
            physical_device,
            format,
            type,
            samples,
            usage,
            tiling,
            count,
            Ptr[SparseImageFormatProperties, MutAnyOrigin](),
        )
        list.reserve(Int(count))
        self.get_physical_device_sparse_image_format_properties(
            physical_device, format, type, samples, usage, tiling, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn enumerate_physical_device_groups(
        self,
        instance: Instance,
        mut physical_device_group_count: UInt32,
        p_physical_device_group_properties: Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        return self._v1_1.enumerate_physical_device_groups(
            instance,
            Ptr(to=physical_device_group_count).bitcast[UInt32]()[],
            p_physical_device_group_properties,
        )

    fn enumerate_physical_device_groups(
        self, instance: Instance
    ) -> ListResult[PhysicalDeviceGroupProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumeratePhysicalDeviceGroups.html
        """
        var list = List[PhysicalDeviceGroupProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.enumerate_physical_device_groups(
                instance, count, Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.enumerate_physical_device_groups(instance, count, list.unsafe_ptr())
        list._len = Int(count)
        return ListResult(list^, result)

    fn get_physical_device_features_2(
        self, physical_device: PhysicalDevice, mut features: PhysicalDeviceFeatures2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFeatures2.html
        """
        return self._v1_1.get_physical_device_features_2(
            physical_device, Ptr(to=features).bitcast[PhysicalDeviceFeatures2]()[]
        )

    fn get_physical_device_properties_2(
        self, physical_device: PhysicalDevice, mut properties: PhysicalDeviceProperties2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceProperties2.html
        """
        return self._v1_1.get_physical_device_properties_2(
            physical_device, Ptr(to=properties).bitcast[PhysicalDeviceProperties2]()[]
        )

    fn get_physical_device_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format: Format,
        mut format_properties: FormatProperties2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceFormatProperties2.html
        """
        return self._v1_1.get_physical_device_format_properties_2(
            physical_device, format, Ptr(to=format_properties).bitcast[FormatProperties2]()[]
        )

    fn get_physical_device_image_format_properties_2(
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
            Ptr(to=image_format_info).bitcast[PhysicalDeviceImageFormatInfo2]()[],
            Ptr(to=image_format_properties).bitcast[ImageFormatProperties2]()[],
        )

    fn get_physical_device_queue_family_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        return self._v1_1.get_physical_device_queue_family_properties_2(
            physical_device,
            Ptr(to=queue_family_property_count).bitcast[UInt32]()[],
            p_queue_family_properties,
        )

    fn get_physical_device_queue_family_properties_2(
        self, physical_device: PhysicalDevice
    ) -> List[QueueFamilyProperties2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceQueueFamilyProperties2.html
        """
        var list = List[QueueFamilyProperties2]()
        var count: UInt32 = 0
        self.get_physical_device_queue_family_properties_2(
            physical_device, count, Ptr[QueueFamilyProperties2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_queue_family_properties_2(
            physical_device, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn get_physical_device_memory_properties_2(
        self,
        physical_device: PhysicalDevice,
        mut memory_properties: PhysicalDeviceMemoryProperties2,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceMemoryProperties2.html
        """
        return self._v1_1.get_physical_device_memory_properties_2(
            physical_device, Ptr(to=memory_properties).bitcast[PhysicalDeviceMemoryProperties2]()[]
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self,
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        mut property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        return self._v1_1.get_physical_device_sparse_image_format_properties_2(
            physical_device,
            Ptr(to=format_info).bitcast[PhysicalDeviceSparseImageFormatInfo2]()[],
            Ptr(to=property_count).bitcast[UInt32]()[],
            p_properties,
        )

    fn get_physical_device_sparse_image_format_properties_2(
        self, physical_device: PhysicalDevice, format_info: PhysicalDeviceSparseImageFormatInfo2
    ) -> List[SparseImageFormatProperties2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceSparseImageFormatProperties2.html
        """
        var list = List[SparseImageFormatProperties2]()
        var count: UInt32 = 0
        self.get_physical_device_sparse_image_format_properties_2(
            physical_device, format_info, count, Ptr[SparseImageFormatProperties2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_physical_device_sparse_image_format_properties_2(
            physical_device, format_info, count, list.unsafe_ptr()
        )
        list._len = Int(count)
        return list^

    fn get_physical_device_external_buffer_properties(
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
            Ptr(to=external_buffer_info).bitcast[PhysicalDeviceExternalBufferInfo]()[],
            Ptr(to=external_buffer_properties).bitcast[ExternalBufferProperties]()[],
        )

    fn get_physical_device_external_fence_properties(
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
            Ptr(to=external_fence_info).bitcast[PhysicalDeviceExternalFenceInfo]()[],
            Ptr(to=external_fence_properties).bitcast[ExternalFenceProperties]()[],
        )

    fn get_physical_device_external_semaphore_properties(
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
            Ptr(to=external_semaphore_info).bitcast[PhysicalDeviceExternalSemaphoreInfo]()[],
            Ptr(to=external_semaphore_properties).bitcast[ExternalSemaphoreProperties]()[],
        )

    fn get_physical_device_tool_properties(
        self,
        physical_device: PhysicalDevice,
        mut tool_count: UInt32,
        p_tool_properties: Ptr[PhysicalDeviceToolProperties, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        return self._v1_3.get_physical_device_tool_properties(
            physical_device, Ptr(to=tool_count).bitcast[UInt32]()[], p_tool_properties
        )

    fn get_physical_device_tool_properties(
        self, physical_device: PhysicalDevice
    ) -> ListResult[PhysicalDeviceToolProperties]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPhysicalDeviceToolProperties.html
        """
        var list = List[PhysicalDeviceToolProperties]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_physical_device_tool_properties(
                physical_device, count, Ptr[PhysicalDeviceToolProperties, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.get_physical_device_tool_properties(
                physical_device, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)


struct DeviceFunctionsV1_0(Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: DeviceFunctionAdditionsV1_0

    fn __init__(out self, global_functions: GlobalFunctionsV1_0, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = DeviceFunctionAdditionsV1_0(device, global_functions.get_dlhandle()[])

    fn destroy_device(self, device: Device, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDevice.html
        """
        return self._v1_0.destroy_device(device, p_allocator)

    fn get_device_queue(
        self, device: Device, queue_family_index: UInt32, queue_index: UInt32, mut queue: Queue
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue.html
        """
        return self._v1_0.get_device_queue(
            device, queue_family_index, queue_index, Ptr(to=queue).bitcast[Queue]()[]
        )

    fn queue_submit(
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit.html
        """
        return self._v1_0.queue_submit(queue, submit_count, p_submits, fence)

    fn queue_wait_idle(self, queue: Queue) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueWaitIdle.html
        """
        return self._v1_0.queue_wait_idle(queue)

    fn device_wait_idle(self, device: Device) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeviceWaitIdle.html
        """
        return self._v1_0.device_wait_idle(device)

    fn allocate_memory(
        self,
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut memory: DeviceMemory,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateMemory.html
        """
        return self._v1_0.allocate_memory(
            device,
            Ptr(to=allocate_info).bitcast[MemoryAllocateInfo]()[],
            p_allocator,
            Ptr(to=memory).bitcast[DeviceMemory]()[],
        )

    fn free_memory(
        self,
        device: Device,
        memory: DeviceMemory,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeMemory.html
        """
        return self._v1_0.free_memory(device, memory, p_allocator)

    fn map_memory(
        self,
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        mut p_data: Ptr[NoneType, MutAnyOrigin],
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
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn unmap_memory(self, device: Device, memory: DeviceMemory):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory.html
        """
        return self._v1_0.unmap_memory(device, memory)

    fn flush_mapped_memory_ranges(
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFlushMappedMemoryRanges.html
        """
        return self._v1_0.flush_mapped_memory_ranges(device, memory_range_count, p_memory_ranges)

    fn invalidate_mapped_memory_ranges(
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInvalidateMappedMemoryRanges.html
        """
        return self._v1_0.invalidate_mapped_memory_ranges(
            device, memory_range_count, p_memory_ranges
        )

    fn get_device_memory_commitment(
        self, device: Device, memory: DeviceMemory, mut committed_memory_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryCommitment.html
        """
        return self._v1_0.get_device_memory_commitment(
            device, memory, Ptr(to=committed_memory_in_bytes).bitcast[DeviceSize]()[]
        )

    fn bind_buffer_memory(
        self, device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory.html
        """
        return self._v1_0.bind_buffer_memory(device, buffer, memory, memory_offset)

    fn bind_image_memory(
        self, device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory.html
        """
        return self._v1_0.bind_image_memory(device, image, memory, memory_offset)

    fn get_buffer_memory_requirements(
        self, device: Device, buffer: Buffer, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements.html
        """
        return self._v1_0.get_buffer_memory_requirements(
            device, buffer, Ptr(to=memory_requirements).bitcast[MemoryRequirements]()[]
        )

    fn get_image_memory_requirements(
        self, device: Device, image: Image, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements.html
        """
        return self._v1_0.get_image_memory_requirements(
            device, image, Ptr(to=memory_requirements).bitcast[MemoryRequirements]()[]
        )

    fn get_image_sparse_memory_requirements(
        self,
        device: Device,
        image: Image,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        return self._v1_0.get_image_sparse_memory_requirements(
            device,
            image,
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_image_sparse_memory_requirements(
        self, device: Device, image: Image
    ) -> List[SparseImageMemoryRequirements]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements]()
        var count: UInt32 = 0
        self.get_image_sparse_memory_requirements(
            device, image, count, Ptr[SparseImageMemoryRequirements, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_image_sparse_memory_requirements(device, image, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn queue_bind_sparse(
        self,
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBindSparse.html
        """
        return self._v1_0.queue_bind_sparse(queue, bind_info_count, p_bind_info, fence)

    fn create_fence(
        self,
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFence.html
        """
        return self._v1_0.create_fence(
            device,
            Ptr(to=create_info).bitcast[FenceCreateInfo]()[],
            p_allocator,
            Ptr(to=fence).bitcast[Fence]()[],
        )

    fn destroy_fence(
        self, device: Device, fence: Fence, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFence.html
        """
        return self._v1_0.destroy_fence(device, fence, p_allocator)

    fn reset_fences(
        self, device: Device, fence_count: UInt32, p_fences: Ptr[Fence, ImmutAnyOrigin]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetFences.html
        """
        return self._v1_0.reset_fences(device, fence_count, p_fences)

    fn get_fence_status(self, device: Device, fence: Fence) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceStatus.html
        """
        return self._v1_0.get_fence_status(device, fence)

    fn wait_for_fences(
        self,
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, ImmutAnyOrigin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForFences.html
        """
        return self._v1_0.wait_for_fences(device, fence_count, p_fences, wait_all, timeout)

    fn create_semaphore(
        self,
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut semaphore: Semaphore,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSemaphore.html
        """
        return self._v1_0.create_semaphore(
            device,
            Ptr(to=create_info).bitcast[SemaphoreCreateInfo]()[],
            p_allocator,
            Ptr(to=semaphore).bitcast[Semaphore]()[],
        )

    fn destroy_semaphore(
        self,
        device: Device,
        semaphore: Semaphore,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySemaphore.html
        """
        return self._v1_0.destroy_semaphore(device, semaphore, p_allocator)

    fn create_event(
        self,
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut event: Event,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateEvent.html
        """
        return self._v1_0.create_event(
            device,
            Ptr(to=create_info).bitcast[EventCreateInfo]()[],
            p_allocator,
            Ptr(to=event).bitcast[Event]()[],
        )

    fn destroy_event(
        self, device: Device, event: Event, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyEvent.html
        """
        return self._v1_0.destroy_event(device, event, p_allocator)

    fn get_event_status(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEventStatus.html
        """
        return self._v1_0.get_event_status(device, event)

    fn set_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetEvent.html
        """
        return self._v1_0.set_event(device, event)

    fn reset_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetEvent.html
        """
        return self._v1_0.reset_event(device, event)

    fn create_query_pool(
        self,
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut query_pool: QueryPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateQueryPool.html
        """
        return self._v1_0.create_query_pool(
            device,
            Ptr(to=create_info).bitcast[QueryPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=query_pool).bitcast[QueryPool]()[],
        )

    fn destroy_query_pool(
        self,
        device: Device,
        query_pool: QueryPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyQueryPool.html
        """
        return self._v1_0.destroy_query_pool(device, query_pool, p_allocator)

    fn get_query_pool_results(
        self,
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueryPoolResults.html
        """
        return self._v1_0.get_query_pool_results(
            device, query_pool, first_query, query_count, data_size, p_data, stride, flags
        )

    fn create_buffer(
        self,
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut buffer: Buffer,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBuffer.html
        """
        return self._v1_0.create_buffer(
            device,
            Ptr(to=create_info).bitcast[BufferCreateInfo]()[],
            p_allocator,
            Ptr(to=buffer).bitcast[Buffer]()[],
        )

    fn destroy_buffer(
        self, device: Device, buffer: Buffer, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBuffer.html
        """
        return self._v1_0.destroy_buffer(device, buffer, p_allocator)

    fn create_buffer_view(
        self,
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: BufferView,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferView.html
        """
        return self._v1_0.create_buffer_view(
            device,
            Ptr(to=create_info).bitcast[BufferViewCreateInfo]()[],
            p_allocator,
            Ptr(to=view).bitcast[BufferView]()[],
        )

    fn destroy_buffer_view(
        self,
        device: Device,
        buffer_view: BufferView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferView.html
        """
        return self._v1_0.destroy_buffer_view(device, buffer_view, p_allocator)

    fn create_image(
        self,
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut image: Image,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImage.html
        """
        return self._v1_0.create_image(
            device,
            Ptr(to=create_info).bitcast[ImageCreateInfo]()[],
            p_allocator,
            Ptr(to=image).bitcast[Image]()[],
        )

    fn destroy_image(
        self, device: Device, image: Image, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImage.html
        """
        return self._v1_0.destroy_image(device, image, p_allocator)

    fn get_image_subresource_layout(
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
            Ptr(to=subresource).bitcast[ImageSubresource]()[],
            Ptr(to=layout).bitcast[SubresourceLayout]()[],
        )

    fn create_image_view(
        self,
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: ImageView,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImageView.html
        """
        return self._v1_0.create_image_view(
            device,
            Ptr(to=create_info).bitcast[ImageViewCreateInfo]()[],
            p_allocator,
            Ptr(to=view).bitcast[ImageView]()[],
        )

    fn destroy_image_view(
        self,
        device: Device,
        image_view: ImageView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImageView.html
        """
        return self._v1_0.destroy_image_view(device, image_view, p_allocator)

    fn create_shader_module(
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut shader_module: ShaderModule,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShaderModule.html
        """
        return self._v1_0.create_shader_module(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]()[],
            p_allocator,
            Ptr(to=shader_module).bitcast[ShaderModule]()[],
        )

    fn destroy_shader_module(
        self,
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderModule.html
        """
        return self._v1_0.destroy_shader_module(device, shader_module, p_allocator)

    fn create_pipeline_cache(
        self,
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut pipeline_cache: PipelineCache,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineCache.html
        """
        return self._v1_0.create_pipeline_cache(
            device,
            Ptr(to=create_info).bitcast[PipelineCacheCreateInfo]()[],
            p_allocator,
            Ptr(to=pipeline_cache).bitcast[PipelineCache]()[],
        )

    fn destroy_pipeline_cache(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineCache.html
        """
        return self._v1_0.destroy_pipeline_cache(device, pipeline_cache, p_allocator)

    fn get_pipeline_cache_data(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        mut data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        return self._v1_0.get_pipeline_cache_data(
            device, pipeline_cache, Ptr(to=data_size).bitcast[UInt]()[], p_data
        )

    fn get_pipeline_cache_data(
        self, device: Device, pipeline_cache: PipelineCache
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_pipeline_cache_data(
                device, pipeline_cache, count, Ptr[NoneType, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.get_pipeline_cache_data(
                device, pipeline_cache, count, list.unsafe_ptr().bitcast[NoneType]()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn merge_pipeline_caches(
        self,
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergePipelineCaches.html
        """
        return self._v1_0.merge_pipeline_caches(device, dst_cache, src_cache_count, p_src_caches)

    fn create_graphics_pipelines(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateGraphicsPipelines.html
        """
        return self._v1_0.create_graphics_pipelines(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn create_compute_pipelines(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateComputePipelines.html
        """
        return self._v1_0.create_compute_pipelines(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn destroy_pipeline(
        self,
        device: Device,
        pipeline: Pipeline,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipeline.html
        """
        return self._v1_0.destroy_pipeline(device, pipeline, p_allocator)

    fn create_pipeline_layout(
        self,
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut pipeline_layout: PipelineLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineLayout.html
        """
        return self._v1_0.create_pipeline_layout(
            device,
            Ptr(to=create_info).bitcast[PipelineLayoutCreateInfo]()[],
            p_allocator,
            Ptr(to=pipeline_layout).bitcast[PipelineLayout]()[],
        )

    fn destroy_pipeline_layout(
        self,
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineLayout.html
        """
        return self._v1_0.destroy_pipeline_layout(device, pipeline_layout, p_allocator)

    fn create_sampler(
        self,
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut sampler: Sampler,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSampler.html
        """
        return self._v1_0.create_sampler(
            device,
            Ptr(to=create_info).bitcast[SamplerCreateInfo]()[],
            p_allocator,
            Ptr(to=sampler).bitcast[Sampler]()[],
        )

    fn destroy_sampler(
        self,
        device: Device,
        sampler: Sampler,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySampler.html
        """
        return self._v1_0.destroy_sampler(device, sampler, p_allocator)

    fn create_descriptor_set_layout(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut set_layout: DescriptorSetLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorSetLayout.html
        """
        return self._v1_0.create_descriptor_set_layout(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]()[],
            p_allocator,
            Ptr(to=set_layout).bitcast[DescriptorSetLayout]()[],
        )

    fn destroy_descriptor_set_layout(
        self,
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorSetLayout.html
        """
        return self._v1_0.destroy_descriptor_set_layout(device, descriptor_set_layout, p_allocator)

    fn create_descriptor_pool(
        self,
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut descriptor_pool: DescriptorPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorPool.html
        """
        return self._v1_0.create_descriptor_pool(
            device,
            Ptr(to=create_info).bitcast[DescriptorPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=descriptor_pool).bitcast[DescriptorPool]()[],
        )

    fn destroy_descriptor_pool(
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorPool.html
        """
        return self._v1_0.destroy_descriptor_pool(device, descriptor_pool, p_allocator)

    fn reset_descriptor_pool(
        self, device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetDescriptorPool.html
        """
        return self._v1_0.reset_descriptor_pool(device, descriptor_pool, flags)

    fn allocate_descriptor_sets(
        self,
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateDescriptorSets.html
        """
        return self._v1_0.allocate_descriptor_sets(
            device, Ptr(to=allocate_info).bitcast[DescriptorSetAllocateInfo]()[], p_descriptor_sets
        )

    fn free_descriptor_sets(
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeDescriptorSets.html
        """
        return self._v1_0.free_descriptor_sets(
            device, descriptor_pool, descriptor_set_count, p_descriptor_sets
        )

    fn update_descriptor_sets(
        self,
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSets.html
        """
        return self._v1_0.update_descriptor_sets(
            device,
            descriptor_write_count,
            p_descriptor_writes,
            descriptor_copy_count,
            p_descriptor_copies,
        )

    fn create_framebuffer(
        self,
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut framebuffer: Framebuffer,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFramebuffer.html
        """
        return self._v1_0.create_framebuffer(
            device,
            Ptr(to=create_info).bitcast[FramebufferCreateInfo]()[],
            p_allocator,
            Ptr(to=framebuffer).bitcast[Framebuffer]()[],
        )

    fn destroy_framebuffer(
        self,
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFramebuffer.html
        """
        return self._v1_0.destroy_framebuffer(device, framebuffer, p_allocator)

    fn create_render_pass(
        self,
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass.html
        """
        return self._v1_0.create_render_pass(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo]()[],
            p_allocator,
            Ptr(to=render_pass).bitcast[RenderPass]()[],
        )

    fn destroy_render_pass(
        self,
        device: Device,
        render_pass: RenderPass,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyRenderPass.html
        """
        return self._v1_0.destroy_render_pass(device, render_pass, p_allocator)

    fn get_render_area_granularity(
        self, device: Device, render_pass: RenderPass, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderAreaGranularity.html
        """
        return self._v1_0.get_render_area_granularity(
            device, render_pass, Ptr(to=granularity).bitcast[Extent2D]()[]
        )

    fn create_command_pool(
        self,
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut command_pool: CommandPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCommandPool.html
        """
        return self._v1_0.create_command_pool(
            device,
            Ptr(to=create_info).bitcast[CommandPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=command_pool).bitcast[CommandPool]()[],
        )

    fn destroy_command_pool(
        self,
        device: Device,
        command_pool: CommandPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCommandPool.html
        """
        return self._v1_0.destroy_command_pool(device, command_pool, p_allocator)

    fn reset_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandPool.html
        """
        return self._v1_0.reset_command_pool(device, command_pool, flags)

    fn allocate_command_buffers(
        self,
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateCommandBuffers.html
        """
        return self._v1_0.allocate_command_buffers(
            device, Ptr(to=allocate_info).bitcast[CommandBufferAllocateInfo]()[], p_command_buffers
        )

    fn free_command_buffers(
        self,
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeCommandBuffers.html
        """
        return self._v1_0.free_command_buffers(
            device, command_pool, command_buffer_count, p_command_buffers
        )

    fn begin_command_buffer(
        self, command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBeginCommandBuffer.html
        """
        return self._v1_0.begin_command_buffer(
            command_buffer, Ptr(to=begin_info).bitcast[CommandBufferBeginInfo]()[]
        )

    fn end_command_buffer(self, command_buffer: CommandBuffer) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEndCommandBuffer.html
        """
        return self._v1_0.end_command_buffer(command_buffer)

    fn reset_command_buffer(
        self, command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandBuffer.html
        """
        return self._v1_0.reset_command_buffer(command_buffer, flags)

    fn cmd_bind_pipeline(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipeline.html
        """
        return self._v1_0.cmd_bind_pipeline(command_buffer, pipeline_bind_point, pipeline)

    fn cmd_set_viewport(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewport.html
        """
        return self._v1_0.cmd_set_viewport(
            command_buffer, first_viewport, viewport_count, p_viewports
        )

    fn cmd_set_scissor(
        self,
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissor.html
        """
        return self._v1_0.cmd_set_scissor(command_buffer, first_scissor, scissor_count, p_scissors)

    fn cmd_set_line_width(self, command_buffer: CommandBuffer, line_width: Float32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineWidth.html
        """
        return self._v1_0.cmd_set_line_width(command_buffer, line_width)

    fn cmd_set_depth_bias(
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

    fn cmd_set_blend_constants(
        self, command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetBlendConstants.html
        """
        return self._v1_0.cmd_set_blend_constants(command_buffer, blend_constants)

    fn cmd_set_depth_bounds(
        self, command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBounds.html
        """
        return self._v1_0.cmd_set_depth_bounds(command_buffer, min_depth_bounds, max_depth_bounds)

    fn cmd_set_stencil_compare_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilCompareMask.html
        """
        return self._v1_0.cmd_set_stencil_compare_mask(command_buffer, face_mask, compare_mask)

    fn cmd_set_stencil_write_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilWriteMask.html
        """
        return self._v1_0.cmd_set_stencil_write_mask(command_buffer, face_mask, write_mask)

    fn cmd_set_stencil_reference(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilReference.html
        """
        return self._v1_0.cmd_set_stencil_reference(command_buffer, face_mask, reference)

    fn cmd_bind_descriptor_sets(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, ImmutAnyOrigin],
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
            p_descriptor_sets,
            dynamic_offset_count,
            p_dynamic_offsets,
        )

    fn cmd_bind_index_buffer(
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

    fn cmd_bind_vertex_buffers(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers.html
        """
        return self._v1_0.cmd_bind_vertex_buffers(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets
        )

    fn cmd_draw(
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

    fn cmd_draw_indexed(
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

    fn cmd_draw_indirect(
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

    fn cmd_draw_indexed_indirect(
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
        return self._v1_0.cmd_draw_indexed_indirect(
            command_buffer, buffer, offset, draw_count, stride
        )

    fn cmd_dispatch(
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

    fn cmd_dispatch_indirect(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchIndirect.html
        """
        return self._v1_0.cmd_dispatch_indirect(command_buffer, buffer, offset)

    fn cmd_copy_buffer(
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer.html
        """
        return self._v1_0.cmd_copy_buffer(
            command_buffer, src_buffer, dst_buffer, region_count, p_regions
        )

    fn cmd_copy_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, ImmutAnyOrigin],
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
            p_regions,
        )

    fn cmd_blit_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, ImmutAnyOrigin],
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
            p_regions,
            filter,
        )

    fn cmd_copy_buffer_to_image(
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html
        """
        return self._v1_0.cmd_copy_buffer_to_image(
            command_buffer, src_buffer, dst_image, dst_image_layout, region_count, p_regions
        )

    fn cmd_copy_image_to_buffer(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer.html
        """
        return self._v1_0.cmd_copy_image_to_buffer(
            command_buffer, src_image, src_image_layout, dst_buffer, region_count, p_regions
        )

    fn cmd_update_buffer(
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdateBuffer.html
        """
        return self._v1_0.cmd_update_buffer(
            command_buffer, dst_buffer, dst_offset, data_size, p_data
        )

    fn cmd_fill_buffer(
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

    fn cmd_clear_color_image(
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html
        """
        return self._v1_0.cmd_clear_color_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=color).bitcast[ClearColorValue]()[],
            range_count,
            p_ranges,
        )

    fn cmd_clear_depth_stencil_image(
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearDepthStencilImage.html
        """
        return self._v1_0.cmd_clear_depth_stencil_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=depth_stencil).bitcast[ClearDepthStencilValue]()[],
            range_count,
            p_ranges,
        )

    fn cmd_clear_attachments(
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, ImmutAnyOrigin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearAttachments.html
        """
        return self._v1_0.cmd_clear_attachments(
            command_buffer, attachment_count, p_attachments, rect_count, p_rects
        )

    fn cmd_resolve_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, ImmutAnyOrigin],
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
            p_regions,
        )

    fn cmd_set_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent.html
        """
        return self._v1_0.cmd_set_event(command_buffer, event, stage_mask)

    fn cmd_reset_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent.html
        """
        return self._v1_0.cmd_reset_event(command_buffer, event, stage_mask)

    fn cmd_wait_events(
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents.html
        """
        return self._v1_0.cmd_wait_events(
            command_buffer,
            event_count,
            p_events,
            src_stage_mask,
            dst_stage_mask,
            memory_barrier_count,
            p_memory_barriers,
            buffer_memory_barrier_count,
            p_buffer_memory_barriers,
            image_memory_barrier_count,
            p_image_memory_barriers,
        )

    fn cmd_pipeline_barrier(
        self,
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
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
            p_memory_barriers,
            buffer_memory_barrier_count,
            p_buffer_memory_barriers,
            image_memory_barrier_count,
            p_image_memory_barriers,
        )

    fn cmd_begin_query(
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

    fn cmd_end_query(self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQuery.html
        """
        return self._v1_0.cmd_end_query(command_buffer, query_pool, query)

    fn cmd_reset_query_pool(
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

    fn cmd_write_timestamp(
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

    fn cmd_copy_query_pool_results(
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
            command_buffer,
            query_pool,
            first_query,
            query_count,
            dst_buffer,
            dst_offset,
            stride,
            flags,
        )

    fn cmd_push_constants(
        self,
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants.html
        """
        return self._v1_0.cmd_push_constants(
            command_buffer, layout, stage_flags, offset, size, p_values
        )

    fn cmd_begin_render_pass(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass.html
        """
        return self._v1_0.cmd_begin_render_pass(
            command_buffer, Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]()[], contents
        )

    fn cmd_next_subpass(self, command_buffer: CommandBuffer, contents: SubpassContents):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass.html
        """
        return self._v1_0.cmd_next_subpass(command_buffer, contents)

    fn cmd_end_render_pass(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass.html
        """
        return self._v1_0.cmd_end_render_pass(command_buffer)

    fn cmd_execute_commands(
        self,
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteCommands.html
        """
        return self._v1_0.cmd_execute_commands(
            command_buffer, command_buffer_count, p_command_buffers
        )


struct DeviceFunctionsV1_1(Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: DeviceFunctionAdditionsV1_0
    var _v1_1: DeviceFunctionAdditionsV1_1

    fn __init__(out self, global_functions: GlobalFunctionsV1_1, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = DeviceFunctionAdditionsV1_0(device, global_functions.get_dlhandle()[])
        self._v1_1 = DeviceFunctionAdditionsV1_1(device, global_functions.get_dlhandle()[])

    fn destroy_device(self, device: Device, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDevice.html
        """
        return self._v1_0.destroy_device(device, p_allocator)

    fn get_device_queue(
        self, device: Device, queue_family_index: UInt32, queue_index: UInt32, mut queue: Queue
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue.html
        """
        return self._v1_0.get_device_queue(
            device, queue_family_index, queue_index, Ptr(to=queue).bitcast[Queue]()[]
        )

    fn queue_submit(
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit.html
        """
        return self._v1_0.queue_submit(queue, submit_count, p_submits, fence)

    fn queue_wait_idle(self, queue: Queue) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueWaitIdle.html
        """
        return self._v1_0.queue_wait_idle(queue)

    fn device_wait_idle(self, device: Device) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeviceWaitIdle.html
        """
        return self._v1_0.device_wait_idle(device)

    fn allocate_memory(
        self,
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut memory: DeviceMemory,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateMemory.html
        """
        return self._v1_0.allocate_memory(
            device,
            Ptr(to=allocate_info).bitcast[MemoryAllocateInfo]()[],
            p_allocator,
            Ptr(to=memory).bitcast[DeviceMemory]()[],
        )

    fn free_memory(
        self,
        device: Device,
        memory: DeviceMemory,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeMemory.html
        """
        return self._v1_0.free_memory(device, memory, p_allocator)

    fn map_memory(
        self,
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        mut p_data: Ptr[NoneType, MutAnyOrigin],
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
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn unmap_memory(self, device: Device, memory: DeviceMemory):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory.html
        """
        return self._v1_0.unmap_memory(device, memory)

    fn flush_mapped_memory_ranges(
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFlushMappedMemoryRanges.html
        """
        return self._v1_0.flush_mapped_memory_ranges(device, memory_range_count, p_memory_ranges)

    fn invalidate_mapped_memory_ranges(
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInvalidateMappedMemoryRanges.html
        """
        return self._v1_0.invalidate_mapped_memory_ranges(
            device, memory_range_count, p_memory_ranges
        )

    fn get_device_memory_commitment(
        self, device: Device, memory: DeviceMemory, mut committed_memory_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryCommitment.html
        """
        return self._v1_0.get_device_memory_commitment(
            device, memory, Ptr(to=committed_memory_in_bytes).bitcast[DeviceSize]()[]
        )

    fn bind_buffer_memory(
        self, device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory.html
        """
        return self._v1_0.bind_buffer_memory(device, buffer, memory, memory_offset)

    fn bind_image_memory(
        self, device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory.html
        """
        return self._v1_0.bind_image_memory(device, image, memory, memory_offset)

    fn get_buffer_memory_requirements(
        self, device: Device, buffer: Buffer, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements.html
        """
        return self._v1_0.get_buffer_memory_requirements(
            device, buffer, Ptr(to=memory_requirements).bitcast[MemoryRequirements]()[]
        )

    fn get_image_memory_requirements(
        self, device: Device, image: Image, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements.html
        """
        return self._v1_0.get_image_memory_requirements(
            device, image, Ptr(to=memory_requirements).bitcast[MemoryRequirements]()[]
        )

    fn get_image_sparse_memory_requirements(
        self,
        device: Device,
        image: Image,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        return self._v1_0.get_image_sparse_memory_requirements(
            device,
            image,
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_image_sparse_memory_requirements(
        self, device: Device, image: Image
    ) -> List[SparseImageMemoryRequirements]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements]()
        var count: UInt32 = 0
        self.get_image_sparse_memory_requirements(
            device, image, count, Ptr[SparseImageMemoryRequirements, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_image_sparse_memory_requirements(device, image, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn queue_bind_sparse(
        self,
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBindSparse.html
        """
        return self._v1_0.queue_bind_sparse(queue, bind_info_count, p_bind_info, fence)

    fn create_fence(
        self,
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFence.html
        """
        return self._v1_0.create_fence(
            device,
            Ptr(to=create_info).bitcast[FenceCreateInfo]()[],
            p_allocator,
            Ptr(to=fence).bitcast[Fence]()[],
        )

    fn destroy_fence(
        self, device: Device, fence: Fence, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFence.html
        """
        return self._v1_0.destroy_fence(device, fence, p_allocator)

    fn reset_fences(
        self, device: Device, fence_count: UInt32, p_fences: Ptr[Fence, ImmutAnyOrigin]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetFences.html
        """
        return self._v1_0.reset_fences(device, fence_count, p_fences)

    fn get_fence_status(self, device: Device, fence: Fence) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceStatus.html
        """
        return self._v1_0.get_fence_status(device, fence)

    fn wait_for_fences(
        self,
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, ImmutAnyOrigin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForFences.html
        """
        return self._v1_0.wait_for_fences(device, fence_count, p_fences, wait_all, timeout)

    fn create_semaphore(
        self,
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut semaphore: Semaphore,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSemaphore.html
        """
        return self._v1_0.create_semaphore(
            device,
            Ptr(to=create_info).bitcast[SemaphoreCreateInfo]()[],
            p_allocator,
            Ptr(to=semaphore).bitcast[Semaphore]()[],
        )

    fn destroy_semaphore(
        self,
        device: Device,
        semaphore: Semaphore,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySemaphore.html
        """
        return self._v1_0.destroy_semaphore(device, semaphore, p_allocator)

    fn create_event(
        self,
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut event: Event,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateEvent.html
        """
        return self._v1_0.create_event(
            device,
            Ptr(to=create_info).bitcast[EventCreateInfo]()[],
            p_allocator,
            Ptr(to=event).bitcast[Event]()[],
        )

    fn destroy_event(
        self, device: Device, event: Event, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyEvent.html
        """
        return self._v1_0.destroy_event(device, event, p_allocator)

    fn get_event_status(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEventStatus.html
        """
        return self._v1_0.get_event_status(device, event)

    fn set_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetEvent.html
        """
        return self._v1_0.set_event(device, event)

    fn reset_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetEvent.html
        """
        return self._v1_0.reset_event(device, event)

    fn create_query_pool(
        self,
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut query_pool: QueryPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateQueryPool.html
        """
        return self._v1_0.create_query_pool(
            device,
            Ptr(to=create_info).bitcast[QueryPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=query_pool).bitcast[QueryPool]()[],
        )

    fn destroy_query_pool(
        self,
        device: Device,
        query_pool: QueryPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyQueryPool.html
        """
        return self._v1_0.destroy_query_pool(device, query_pool, p_allocator)

    fn get_query_pool_results(
        self,
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueryPoolResults.html
        """
        return self._v1_0.get_query_pool_results(
            device, query_pool, first_query, query_count, data_size, p_data, stride, flags
        )

    fn create_buffer(
        self,
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut buffer: Buffer,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBuffer.html
        """
        return self._v1_0.create_buffer(
            device,
            Ptr(to=create_info).bitcast[BufferCreateInfo]()[],
            p_allocator,
            Ptr(to=buffer).bitcast[Buffer]()[],
        )

    fn destroy_buffer(
        self, device: Device, buffer: Buffer, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBuffer.html
        """
        return self._v1_0.destroy_buffer(device, buffer, p_allocator)

    fn create_buffer_view(
        self,
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: BufferView,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferView.html
        """
        return self._v1_0.create_buffer_view(
            device,
            Ptr(to=create_info).bitcast[BufferViewCreateInfo]()[],
            p_allocator,
            Ptr(to=view).bitcast[BufferView]()[],
        )

    fn destroy_buffer_view(
        self,
        device: Device,
        buffer_view: BufferView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferView.html
        """
        return self._v1_0.destroy_buffer_view(device, buffer_view, p_allocator)

    fn create_image(
        self,
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut image: Image,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImage.html
        """
        return self._v1_0.create_image(
            device,
            Ptr(to=create_info).bitcast[ImageCreateInfo]()[],
            p_allocator,
            Ptr(to=image).bitcast[Image]()[],
        )

    fn destroy_image(
        self, device: Device, image: Image, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImage.html
        """
        return self._v1_0.destroy_image(device, image, p_allocator)

    fn get_image_subresource_layout(
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
            Ptr(to=subresource).bitcast[ImageSubresource]()[],
            Ptr(to=layout).bitcast[SubresourceLayout]()[],
        )

    fn create_image_view(
        self,
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: ImageView,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImageView.html
        """
        return self._v1_0.create_image_view(
            device,
            Ptr(to=create_info).bitcast[ImageViewCreateInfo]()[],
            p_allocator,
            Ptr(to=view).bitcast[ImageView]()[],
        )

    fn destroy_image_view(
        self,
        device: Device,
        image_view: ImageView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImageView.html
        """
        return self._v1_0.destroy_image_view(device, image_view, p_allocator)

    fn create_shader_module(
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut shader_module: ShaderModule,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShaderModule.html
        """
        return self._v1_0.create_shader_module(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]()[],
            p_allocator,
            Ptr(to=shader_module).bitcast[ShaderModule]()[],
        )

    fn destroy_shader_module(
        self,
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderModule.html
        """
        return self._v1_0.destroy_shader_module(device, shader_module, p_allocator)

    fn create_pipeline_cache(
        self,
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut pipeline_cache: PipelineCache,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineCache.html
        """
        return self._v1_0.create_pipeline_cache(
            device,
            Ptr(to=create_info).bitcast[PipelineCacheCreateInfo]()[],
            p_allocator,
            Ptr(to=pipeline_cache).bitcast[PipelineCache]()[],
        )

    fn destroy_pipeline_cache(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineCache.html
        """
        return self._v1_0.destroy_pipeline_cache(device, pipeline_cache, p_allocator)

    fn get_pipeline_cache_data(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        mut data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        return self._v1_0.get_pipeline_cache_data(
            device, pipeline_cache, Ptr(to=data_size).bitcast[UInt]()[], p_data
        )

    fn get_pipeline_cache_data(
        self, device: Device, pipeline_cache: PipelineCache
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_pipeline_cache_data(
                device, pipeline_cache, count, Ptr[NoneType, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.get_pipeline_cache_data(
                device, pipeline_cache, count, list.unsafe_ptr().bitcast[NoneType]()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn merge_pipeline_caches(
        self,
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergePipelineCaches.html
        """
        return self._v1_0.merge_pipeline_caches(device, dst_cache, src_cache_count, p_src_caches)

    fn create_graphics_pipelines(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateGraphicsPipelines.html
        """
        return self._v1_0.create_graphics_pipelines(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn create_compute_pipelines(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateComputePipelines.html
        """
        return self._v1_0.create_compute_pipelines(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn destroy_pipeline(
        self,
        device: Device,
        pipeline: Pipeline,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipeline.html
        """
        return self._v1_0.destroy_pipeline(device, pipeline, p_allocator)

    fn create_pipeline_layout(
        self,
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut pipeline_layout: PipelineLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineLayout.html
        """
        return self._v1_0.create_pipeline_layout(
            device,
            Ptr(to=create_info).bitcast[PipelineLayoutCreateInfo]()[],
            p_allocator,
            Ptr(to=pipeline_layout).bitcast[PipelineLayout]()[],
        )

    fn destroy_pipeline_layout(
        self,
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineLayout.html
        """
        return self._v1_0.destroy_pipeline_layout(device, pipeline_layout, p_allocator)

    fn create_sampler(
        self,
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut sampler: Sampler,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSampler.html
        """
        return self._v1_0.create_sampler(
            device,
            Ptr(to=create_info).bitcast[SamplerCreateInfo]()[],
            p_allocator,
            Ptr(to=sampler).bitcast[Sampler]()[],
        )

    fn destroy_sampler(
        self,
        device: Device,
        sampler: Sampler,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySampler.html
        """
        return self._v1_0.destroy_sampler(device, sampler, p_allocator)

    fn create_descriptor_set_layout(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut set_layout: DescriptorSetLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorSetLayout.html
        """
        return self._v1_0.create_descriptor_set_layout(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]()[],
            p_allocator,
            Ptr(to=set_layout).bitcast[DescriptorSetLayout]()[],
        )

    fn destroy_descriptor_set_layout(
        self,
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorSetLayout.html
        """
        return self._v1_0.destroy_descriptor_set_layout(device, descriptor_set_layout, p_allocator)

    fn create_descriptor_pool(
        self,
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut descriptor_pool: DescriptorPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorPool.html
        """
        return self._v1_0.create_descriptor_pool(
            device,
            Ptr(to=create_info).bitcast[DescriptorPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=descriptor_pool).bitcast[DescriptorPool]()[],
        )

    fn destroy_descriptor_pool(
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorPool.html
        """
        return self._v1_0.destroy_descriptor_pool(device, descriptor_pool, p_allocator)

    fn reset_descriptor_pool(
        self, device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetDescriptorPool.html
        """
        return self._v1_0.reset_descriptor_pool(device, descriptor_pool, flags)

    fn allocate_descriptor_sets(
        self,
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateDescriptorSets.html
        """
        return self._v1_0.allocate_descriptor_sets(
            device, Ptr(to=allocate_info).bitcast[DescriptorSetAllocateInfo]()[], p_descriptor_sets
        )

    fn free_descriptor_sets(
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeDescriptorSets.html
        """
        return self._v1_0.free_descriptor_sets(
            device, descriptor_pool, descriptor_set_count, p_descriptor_sets
        )

    fn update_descriptor_sets(
        self,
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSets.html
        """
        return self._v1_0.update_descriptor_sets(
            device,
            descriptor_write_count,
            p_descriptor_writes,
            descriptor_copy_count,
            p_descriptor_copies,
        )

    fn create_framebuffer(
        self,
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut framebuffer: Framebuffer,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFramebuffer.html
        """
        return self._v1_0.create_framebuffer(
            device,
            Ptr(to=create_info).bitcast[FramebufferCreateInfo]()[],
            p_allocator,
            Ptr(to=framebuffer).bitcast[Framebuffer]()[],
        )

    fn destroy_framebuffer(
        self,
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFramebuffer.html
        """
        return self._v1_0.destroy_framebuffer(device, framebuffer, p_allocator)

    fn create_render_pass(
        self,
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass.html
        """
        return self._v1_0.create_render_pass(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo]()[],
            p_allocator,
            Ptr(to=render_pass).bitcast[RenderPass]()[],
        )

    fn destroy_render_pass(
        self,
        device: Device,
        render_pass: RenderPass,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyRenderPass.html
        """
        return self._v1_0.destroy_render_pass(device, render_pass, p_allocator)

    fn get_render_area_granularity(
        self, device: Device, render_pass: RenderPass, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderAreaGranularity.html
        """
        return self._v1_0.get_render_area_granularity(
            device, render_pass, Ptr(to=granularity).bitcast[Extent2D]()[]
        )

    fn create_command_pool(
        self,
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut command_pool: CommandPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCommandPool.html
        """
        return self._v1_0.create_command_pool(
            device,
            Ptr(to=create_info).bitcast[CommandPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=command_pool).bitcast[CommandPool]()[],
        )

    fn destroy_command_pool(
        self,
        device: Device,
        command_pool: CommandPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCommandPool.html
        """
        return self._v1_0.destroy_command_pool(device, command_pool, p_allocator)

    fn reset_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandPool.html
        """
        return self._v1_0.reset_command_pool(device, command_pool, flags)

    fn allocate_command_buffers(
        self,
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateCommandBuffers.html
        """
        return self._v1_0.allocate_command_buffers(
            device, Ptr(to=allocate_info).bitcast[CommandBufferAllocateInfo]()[], p_command_buffers
        )

    fn free_command_buffers(
        self,
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeCommandBuffers.html
        """
        return self._v1_0.free_command_buffers(
            device, command_pool, command_buffer_count, p_command_buffers
        )

    fn begin_command_buffer(
        self, command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBeginCommandBuffer.html
        """
        return self._v1_0.begin_command_buffer(
            command_buffer, Ptr(to=begin_info).bitcast[CommandBufferBeginInfo]()[]
        )

    fn end_command_buffer(self, command_buffer: CommandBuffer) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEndCommandBuffer.html
        """
        return self._v1_0.end_command_buffer(command_buffer)

    fn reset_command_buffer(
        self, command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandBuffer.html
        """
        return self._v1_0.reset_command_buffer(command_buffer, flags)

    fn cmd_bind_pipeline(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipeline.html
        """
        return self._v1_0.cmd_bind_pipeline(command_buffer, pipeline_bind_point, pipeline)

    fn cmd_set_viewport(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewport.html
        """
        return self._v1_0.cmd_set_viewport(
            command_buffer, first_viewport, viewport_count, p_viewports
        )

    fn cmd_set_scissor(
        self,
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissor.html
        """
        return self._v1_0.cmd_set_scissor(command_buffer, first_scissor, scissor_count, p_scissors)

    fn cmd_set_line_width(self, command_buffer: CommandBuffer, line_width: Float32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineWidth.html
        """
        return self._v1_0.cmd_set_line_width(command_buffer, line_width)

    fn cmd_set_depth_bias(
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

    fn cmd_set_blend_constants(
        self, command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetBlendConstants.html
        """
        return self._v1_0.cmd_set_blend_constants(command_buffer, blend_constants)

    fn cmd_set_depth_bounds(
        self, command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBounds.html
        """
        return self._v1_0.cmd_set_depth_bounds(command_buffer, min_depth_bounds, max_depth_bounds)

    fn cmd_set_stencil_compare_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilCompareMask.html
        """
        return self._v1_0.cmd_set_stencil_compare_mask(command_buffer, face_mask, compare_mask)

    fn cmd_set_stencil_write_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilWriteMask.html
        """
        return self._v1_0.cmd_set_stencil_write_mask(command_buffer, face_mask, write_mask)

    fn cmd_set_stencil_reference(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilReference.html
        """
        return self._v1_0.cmd_set_stencil_reference(command_buffer, face_mask, reference)

    fn cmd_bind_descriptor_sets(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, ImmutAnyOrigin],
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
            p_descriptor_sets,
            dynamic_offset_count,
            p_dynamic_offsets,
        )

    fn cmd_bind_index_buffer(
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

    fn cmd_bind_vertex_buffers(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers.html
        """
        return self._v1_0.cmd_bind_vertex_buffers(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets
        )

    fn cmd_draw(
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

    fn cmd_draw_indexed(
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

    fn cmd_draw_indirect(
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

    fn cmd_draw_indexed_indirect(
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
        return self._v1_0.cmd_draw_indexed_indirect(
            command_buffer, buffer, offset, draw_count, stride
        )

    fn cmd_dispatch(
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

    fn cmd_dispatch_indirect(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchIndirect.html
        """
        return self._v1_0.cmd_dispatch_indirect(command_buffer, buffer, offset)

    fn cmd_copy_buffer(
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer.html
        """
        return self._v1_0.cmd_copy_buffer(
            command_buffer, src_buffer, dst_buffer, region_count, p_regions
        )

    fn cmd_copy_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, ImmutAnyOrigin],
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
            p_regions,
        )

    fn cmd_blit_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, ImmutAnyOrigin],
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
            p_regions,
            filter,
        )

    fn cmd_copy_buffer_to_image(
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html
        """
        return self._v1_0.cmd_copy_buffer_to_image(
            command_buffer, src_buffer, dst_image, dst_image_layout, region_count, p_regions
        )

    fn cmd_copy_image_to_buffer(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer.html
        """
        return self._v1_0.cmd_copy_image_to_buffer(
            command_buffer, src_image, src_image_layout, dst_buffer, region_count, p_regions
        )

    fn cmd_update_buffer(
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdateBuffer.html
        """
        return self._v1_0.cmd_update_buffer(
            command_buffer, dst_buffer, dst_offset, data_size, p_data
        )

    fn cmd_fill_buffer(
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

    fn cmd_clear_color_image(
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html
        """
        return self._v1_0.cmd_clear_color_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=color).bitcast[ClearColorValue]()[],
            range_count,
            p_ranges,
        )

    fn cmd_clear_depth_stencil_image(
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearDepthStencilImage.html
        """
        return self._v1_0.cmd_clear_depth_stencil_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=depth_stencil).bitcast[ClearDepthStencilValue]()[],
            range_count,
            p_ranges,
        )

    fn cmd_clear_attachments(
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, ImmutAnyOrigin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearAttachments.html
        """
        return self._v1_0.cmd_clear_attachments(
            command_buffer, attachment_count, p_attachments, rect_count, p_rects
        )

    fn cmd_resolve_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, ImmutAnyOrigin],
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
            p_regions,
        )

    fn cmd_set_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent.html
        """
        return self._v1_0.cmd_set_event(command_buffer, event, stage_mask)

    fn cmd_reset_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent.html
        """
        return self._v1_0.cmd_reset_event(command_buffer, event, stage_mask)

    fn cmd_wait_events(
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents.html
        """
        return self._v1_0.cmd_wait_events(
            command_buffer,
            event_count,
            p_events,
            src_stage_mask,
            dst_stage_mask,
            memory_barrier_count,
            p_memory_barriers,
            buffer_memory_barrier_count,
            p_buffer_memory_barriers,
            image_memory_barrier_count,
            p_image_memory_barriers,
        )

    fn cmd_pipeline_barrier(
        self,
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
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
            p_memory_barriers,
            buffer_memory_barrier_count,
            p_buffer_memory_barriers,
            image_memory_barrier_count,
            p_image_memory_barriers,
        )

    fn cmd_begin_query(
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

    fn cmd_end_query(self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQuery.html
        """
        return self._v1_0.cmd_end_query(command_buffer, query_pool, query)

    fn cmd_reset_query_pool(
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

    fn cmd_write_timestamp(
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

    fn cmd_copy_query_pool_results(
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
            command_buffer,
            query_pool,
            first_query,
            query_count,
            dst_buffer,
            dst_offset,
            stride,
            flags,
        )

    fn cmd_push_constants(
        self,
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants.html
        """
        return self._v1_0.cmd_push_constants(
            command_buffer, layout, stage_flags, offset, size, p_values
        )

    fn cmd_begin_render_pass(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass.html
        """
        return self._v1_0.cmd_begin_render_pass(
            command_buffer, Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]()[], contents
        )

    fn cmd_next_subpass(self, command_buffer: CommandBuffer, contents: SubpassContents):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass.html
        """
        return self._v1_0.cmd_next_subpass(command_buffer, contents)

    fn cmd_end_render_pass(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass.html
        """
        return self._v1_0.cmd_end_render_pass(command_buffer)

    fn cmd_execute_commands(
        self,
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteCommands.html
        """
        return self._v1_0.cmd_execute_commands(
            command_buffer, command_buffer_count, p_command_buffers
        )

    fn bind_buffer_memory_2(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory2.html
        """
        return self._v1_1.bind_buffer_memory_2(device, bind_info_count, p_bind_infos)

    fn bind_image_memory_2(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory2.html
        """
        return self._v1_1.bind_image_memory_2(device, bind_info_count, p_bind_infos)

    fn get_device_group_peer_memory_features(
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
            Ptr(to=peer_memory_features).bitcast[PeerMemoryFeatureFlags]()[],
        )

    fn cmd_set_device_mask(self, command_buffer: CommandBuffer, device_mask: UInt32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDeviceMask.html
        """
        return self._v1_1.cmd_set_device_mask(command_buffer, device_mask)

    fn cmd_dispatch_base(
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

    fn get_image_memory_requirements_2(
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
            Ptr(to=info).bitcast[ImageMemoryRequirementsInfo2]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_buffer_memory_requirements_2(
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
            Ptr(to=info).bitcast[BufferMemoryRequirementsInfo2]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_image_sparse_memory_requirements_2(
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        return self._v1_1.get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]()[],
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_image_sparse_memory_requirements_2(
        self, device: Device, info: ImageSparseMemoryRequirementsInfo2
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self.get_image_sparse_memory_requirements_2(
            device, info, count, Ptr[SparseImageMemoryRequirements2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_image_sparse_memory_requirements_2(device, info, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTrimCommandPool.html
        """
        return self._v1_1.trim_command_pool(device, command_pool, flags)

    fn get_device_queue_2(self, device: Device, queue_info: DeviceQueueInfo2, mut queue: Queue):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue2.html
        """
        return self._v1_1.get_device_queue_2(
            device,
            Ptr(to=queue_info).bitcast[DeviceQueueInfo2]()[],
            Ptr(to=queue).bitcast[Queue]()[],
        )

    fn create_sampler_ycbcr_conversion(
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSamplerYcbcrConversion.html
        """
        return self._v1_1.create_sampler_ycbcr_conversion(
            device,
            Ptr(to=create_info).bitcast[SamplerYcbcrConversionCreateInfo]()[],
            p_allocator,
            Ptr(to=ycbcr_conversion).bitcast[SamplerYcbcrConversion]()[],
        )

    fn destroy_sampler_ycbcr_conversion(
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySamplerYcbcrConversion.html
        """
        return self._v1_1.destroy_sampler_ycbcr_conversion(device, ycbcr_conversion, p_allocator)

    fn create_descriptor_update_template(
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorUpdateTemplate.html
        """
        return self._v1_1.create_descriptor_update_template(
            device,
            Ptr(to=create_info).bitcast[DescriptorUpdateTemplateCreateInfo]()[],
            p_allocator,
            Ptr(to=descriptor_update_template).bitcast[DescriptorUpdateTemplate]()[],
        )

    fn destroy_descriptor_update_template(
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorUpdateTemplate.html
        """
        return self._v1_1.destroy_descriptor_update_template(
            device, descriptor_update_template, p_allocator
        )

    fn update_descriptor_set_with_template(
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._v1_1.update_descriptor_set_with_template(
            device, descriptor_set, descriptor_update_template, p_data
        )

    fn get_descriptor_set_layout_support(
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
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]()[],
            Ptr(to=support).bitcast[DescriptorSetLayoutSupport]()[],
        )


struct DeviceFunctionsV1_2(Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: DeviceFunctionAdditionsV1_0
    var _v1_1: DeviceFunctionAdditionsV1_1
    var _v1_2: DeviceFunctionAdditionsV1_2

    fn __init__(out self, global_functions: GlobalFunctionsV1_2, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = DeviceFunctionAdditionsV1_0(device, global_functions.get_dlhandle()[])
        self._v1_1 = DeviceFunctionAdditionsV1_1(device, global_functions.get_dlhandle()[])
        self._v1_2 = DeviceFunctionAdditionsV1_2(device, global_functions.get_dlhandle()[])

    fn destroy_device(self, device: Device, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDevice.html
        """
        return self._v1_0.destroy_device(device, p_allocator)

    fn get_device_queue(
        self, device: Device, queue_family_index: UInt32, queue_index: UInt32, mut queue: Queue
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue.html
        """
        return self._v1_0.get_device_queue(
            device, queue_family_index, queue_index, Ptr(to=queue).bitcast[Queue]()[]
        )

    fn queue_submit(
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit.html
        """
        return self._v1_0.queue_submit(queue, submit_count, p_submits, fence)

    fn queue_wait_idle(self, queue: Queue) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueWaitIdle.html
        """
        return self._v1_0.queue_wait_idle(queue)

    fn device_wait_idle(self, device: Device) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeviceWaitIdle.html
        """
        return self._v1_0.device_wait_idle(device)

    fn allocate_memory(
        self,
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut memory: DeviceMemory,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateMemory.html
        """
        return self._v1_0.allocate_memory(
            device,
            Ptr(to=allocate_info).bitcast[MemoryAllocateInfo]()[],
            p_allocator,
            Ptr(to=memory).bitcast[DeviceMemory]()[],
        )

    fn free_memory(
        self,
        device: Device,
        memory: DeviceMemory,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeMemory.html
        """
        return self._v1_0.free_memory(device, memory, p_allocator)

    fn map_memory(
        self,
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        mut p_data: Ptr[NoneType, MutAnyOrigin],
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
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn unmap_memory(self, device: Device, memory: DeviceMemory):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory.html
        """
        return self._v1_0.unmap_memory(device, memory)

    fn flush_mapped_memory_ranges(
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFlushMappedMemoryRanges.html
        """
        return self._v1_0.flush_mapped_memory_ranges(device, memory_range_count, p_memory_ranges)

    fn invalidate_mapped_memory_ranges(
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInvalidateMappedMemoryRanges.html
        """
        return self._v1_0.invalidate_mapped_memory_ranges(
            device, memory_range_count, p_memory_ranges
        )

    fn get_device_memory_commitment(
        self, device: Device, memory: DeviceMemory, mut committed_memory_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryCommitment.html
        """
        return self._v1_0.get_device_memory_commitment(
            device, memory, Ptr(to=committed_memory_in_bytes).bitcast[DeviceSize]()[]
        )

    fn bind_buffer_memory(
        self, device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory.html
        """
        return self._v1_0.bind_buffer_memory(device, buffer, memory, memory_offset)

    fn bind_image_memory(
        self, device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory.html
        """
        return self._v1_0.bind_image_memory(device, image, memory, memory_offset)

    fn get_buffer_memory_requirements(
        self, device: Device, buffer: Buffer, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements.html
        """
        return self._v1_0.get_buffer_memory_requirements(
            device, buffer, Ptr(to=memory_requirements).bitcast[MemoryRequirements]()[]
        )

    fn get_image_memory_requirements(
        self, device: Device, image: Image, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements.html
        """
        return self._v1_0.get_image_memory_requirements(
            device, image, Ptr(to=memory_requirements).bitcast[MemoryRequirements]()[]
        )

    fn get_image_sparse_memory_requirements(
        self,
        device: Device,
        image: Image,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        return self._v1_0.get_image_sparse_memory_requirements(
            device,
            image,
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_image_sparse_memory_requirements(
        self, device: Device, image: Image
    ) -> List[SparseImageMemoryRequirements]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements]()
        var count: UInt32 = 0
        self.get_image_sparse_memory_requirements(
            device, image, count, Ptr[SparseImageMemoryRequirements, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_image_sparse_memory_requirements(device, image, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn queue_bind_sparse(
        self,
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBindSparse.html
        """
        return self._v1_0.queue_bind_sparse(queue, bind_info_count, p_bind_info, fence)

    fn create_fence(
        self,
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFence.html
        """
        return self._v1_0.create_fence(
            device,
            Ptr(to=create_info).bitcast[FenceCreateInfo]()[],
            p_allocator,
            Ptr(to=fence).bitcast[Fence]()[],
        )

    fn destroy_fence(
        self, device: Device, fence: Fence, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFence.html
        """
        return self._v1_0.destroy_fence(device, fence, p_allocator)

    fn reset_fences(
        self, device: Device, fence_count: UInt32, p_fences: Ptr[Fence, ImmutAnyOrigin]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetFences.html
        """
        return self._v1_0.reset_fences(device, fence_count, p_fences)

    fn get_fence_status(self, device: Device, fence: Fence) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceStatus.html
        """
        return self._v1_0.get_fence_status(device, fence)

    fn wait_for_fences(
        self,
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, ImmutAnyOrigin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForFences.html
        """
        return self._v1_0.wait_for_fences(device, fence_count, p_fences, wait_all, timeout)

    fn create_semaphore(
        self,
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut semaphore: Semaphore,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSemaphore.html
        """
        return self._v1_0.create_semaphore(
            device,
            Ptr(to=create_info).bitcast[SemaphoreCreateInfo]()[],
            p_allocator,
            Ptr(to=semaphore).bitcast[Semaphore]()[],
        )

    fn destroy_semaphore(
        self,
        device: Device,
        semaphore: Semaphore,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySemaphore.html
        """
        return self._v1_0.destroy_semaphore(device, semaphore, p_allocator)

    fn create_event(
        self,
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut event: Event,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateEvent.html
        """
        return self._v1_0.create_event(
            device,
            Ptr(to=create_info).bitcast[EventCreateInfo]()[],
            p_allocator,
            Ptr(to=event).bitcast[Event]()[],
        )

    fn destroy_event(
        self, device: Device, event: Event, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyEvent.html
        """
        return self._v1_0.destroy_event(device, event, p_allocator)

    fn get_event_status(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEventStatus.html
        """
        return self._v1_0.get_event_status(device, event)

    fn set_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetEvent.html
        """
        return self._v1_0.set_event(device, event)

    fn reset_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetEvent.html
        """
        return self._v1_0.reset_event(device, event)

    fn create_query_pool(
        self,
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut query_pool: QueryPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateQueryPool.html
        """
        return self._v1_0.create_query_pool(
            device,
            Ptr(to=create_info).bitcast[QueryPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=query_pool).bitcast[QueryPool]()[],
        )

    fn destroy_query_pool(
        self,
        device: Device,
        query_pool: QueryPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyQueryPool.html
        """
        return self._v1_0.destroy_query_pool(device, query_pool, p_allocator)

    fn get_query_pool_results(
        self,
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueryPoolResults.html
        """
        return self._v1_0.get_query_pool_results(
            device, query_pool, first_query, query_count, data_size, p_data, stride, flags
        )

    fn create_buffer(
        self,
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut buffer: Buffer,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBuffer.html
        """
        return self._v1_0.create_buffer(
            device,
            Ptr(to=create_info).bitcast[BufferCreateInfo]()[],
            p_allocator,
            Ptr(to=buffer).bitcast[Buffer]()[],
        )

    fn destroy_buffer(
        self, device: Device, buffer: Buffer, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBuffer.html
        """
        return self._v1_0.destroy_buffer(device, buffer, p_allocator)

    fn create_buffer_view(
        self,
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: BufferView,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferView.html
        """
        return self._v1_0.create_buffer_view(
            device,
            Ptr(to=create_info).bitcast[BufferViewCreateInfo]()[],
            p_allocator,
            Ptr(to=view).bitcast[BufferView]()[],
        )

    fn destroy_buffer_view(
        self,
        device: Device,
        buffer_view: BufferView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferView.html
        """
        return self._v1_0.destroy_buffer_view(device, buffer_view, p_allocator)

    fn create_image(
        self,
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut image: Image,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImage.html
        """
        return self._v1_0.create_image(
            device,
            Ptr(to=create_info).bitcast[ImageCreateInfo]()[],
            p_allocator,
            Ptr(to=image).bitcast[Image]()[],
        )

    fn destroy_image(
        self, device: Device, image: Image, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImage.html
        """
        return self._v1_0.destroy_image(device, image, p_allocator)

    fn get_image_subresource_layout(
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
            Ptr(to=subresource).bitcast[ImageSubresource]()[],
            Ptr(to=layout).bitcast[SubresourceLayout]()[],
        )

    fn create_image_view(
        self,
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: ImageView,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImageView.html
        """
        return self._v1_0.create_image_view(
            device,
            Ptr(to=create_info).bitcast[ImageViewCreateInfo]()[],
            p_allocator,
            Ptr(to=view).bitcast[ImageView]()[],
        )

    fn destroy_image_view(
        self,
        device: Device,
        image_view: ImageView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImageView.html
        """
        return self._v1_0.destroy_image_view(device, image_view, p_allocator)

    fn create_shader_module(
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut shader_module: ShaderModule,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShaderModule.html
        """
        return self._v1_0.create_shader_module(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]()[],
            p_allocator,
            Ptr(to=shader_module).bitcast[ShaderModule]()[],
        )

    fn destroy_shader_module(
        self,
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderModule.html
        """
        return self._v1_0.destroy_shader_module(device, shader_module, p_allocator)

    fn create_pipeline_cache(
        self,
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut pipeline_cache: PipelineCache,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineCache.html
        """
        return self._v1_0.create_pipeline_cache(
            device,
            Ptr(to=create_info).bitcast[PipelineCacheCreateInfo]()[],
            p_allocator,
            Ptr(to=pipeline_cache).bitcast[PipelineCache]()[],
        )

    fn destroy_pipeline_cache(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineCache.html
        """
        return self._v1_0.destroy_pipeline_cache(device, pipeline_cache, p_allocator)

    fn get_pipeline_cache_data(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        mut data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        return self._v1_0.get_pipeline_cache_data(
            device, pipeline_cache, Ptr(to=data_size).bitcast[UInt]()[], p_data
        )

    fn get_pipeline_cache_data(
        self, device: Device, pipeline_cache: PipelineCache
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_pipeline_cache_data(
                device, pipeline_cache, count, Ptr[NoneType, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.get_pipeline_cache_data(
                device, pipeline_cache, count, list.unsafe_ptr().bitcast[NoneType]()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn merge_pipeline_caches(
        self,
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergePipelineCaches.html
        """
        return self._v1_0.merge_pipeline_caches(device, dst_cache, src_cache_count, p_src_caches)

    fn create_graphics_pipelines(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateGraphicsPipelines.html
        """
        return self._v1_0.create_graphics_pipelines(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn create_compute_pipelines(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateComputePipelines.html
        """
        return self._v1_0.create_compute_pipelines(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn destroy_pipeline(
        self,
        device: Device,
        pipeline: Pipeline,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipeline.html
        """
        return self._v1_0.destroy_pipeline(device, pipeline, p_allocator)

    fn create_pipeline_layout(
        self,
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut pipeline_layout: PipelineLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineLayout.html
        """
        return self._v1_0.create_pipeline_layout(
            device,
            Ptr(to=create_info).bitcast[PipelineLayoutCreateInfo]()[],
            p_allocator,
            Ptr(to=pipeline_layout).bitcast[PipelineLayout]()[],
        )

    fn destroy_pipeline_layout(
        self,
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineLayout.html
        """
        return self._v1_0.destroy_pipeline_layout(device, pipeline_layout, p_allocator)

    fn create_sampler(
        self,
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut sampler: Sampler,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSampler.html
        """
        return self._v1_0.create_sampler(
            device,
            Ptr(to=create_info).bitcast[SamplerCreateInfo]()[],
            p_allocator,
            Ptr(to=sampler).bitcast[Sampler]()[],
        )

    fn destroy_sampler(
        self,
        device: Device,
        sampler: Sampler,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySampler.html
        """
        return self._v1_0.destroy_sampler(device, sampler, p_allocator)

    fn create_descriptor_set_layout(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut set_layout: DescriptorSetLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorSetLayout.html
        """
        return self._v1_0.create_descriptor_set_layout(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]()[],
            p_allocator,
            Ptr(to=set_layout).bitcast[DescriptorSetLayout]()[],
        )

    fn destroy_descriptor_set_layout(
        self,
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorSetLayout.html
        """
        return self._v1_0.destroy_descriptor_set_layout(device, descriptor_set_layout, p_allocator)

    fn create_descriptor_pool(
        self,
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut descriptor_pool: DescriptorPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorPool.html
        """
        return self._v1_0.create_descriptor_pool(
            device,
            Ptr(to=create_info).bitcast[DescriptorPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=descriptor_pool).bitcast[DescriptorPool]()[],
        )

    fn destroy_descriptor_pool(
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorPool.html
        """
        return self._v1_0.destroy_descriptor_pool(device, descriptor_pool, p_allocator)

    fn reset_descriptor_pool(
        self, device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetDescriptorPool.html
        """
        return self._v1_0.reset_descriptor_pool(device, descriptor_pool, flags)

    fn allocate_descriptor_sets(
        self,
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateDescriptorSets.html
        """
        return self._v1_0.allocate_descriptor_sets(
            device, Ptr(to=allocate_info).bitcast[DescriptorSetAllocateInfo]()[], p_descriptor_sets
        )

    fn free_descriptor_sets(
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeDescriptorSets.html
        """
        return self._v1_0.free_descriptor_sets(
            device, descriptor_pool, descriptor_set_count, p_descriptor_sets
        )

    fn update_descriptor_sets(
        self,
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSets.html
        """
        return self._v1_0.update_descriptor_sets(
            device,
            descriptor_write_count,
            p_descriptor_writes,
            descriptor_copy_count,
            p_descriptor_copies,
        )

    fn create_framebuffer(
        self,
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut framebuffer: Framebuffer,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFramebuffer.html
        """
        return self._v1_0.create_framebuffer(
            device,
            Ptr(to=create_info).bitcast[FramebufferCreateInfo]()[],
            p_allocator,
            Ptr(to=framebuffer).bitcast[Framebuffer]()[],
        )

    fn destroy_framebuffer(
        self,
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFramebuffer.html
        """
        return self._v1_0.destroy_framebuffer(device, framebuffer, p_allocator)

    fn create_render_pass(
        self,
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass.html
        """
        return self._v1_0.create_render_pass(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo]()[],
            p_allocator,
            Ptr(to=render_pass).bitcast[RenderPass]()[],
        )

    fn destroy_render_pass(
        self,
        device: Device,
        render_pass: RenderPass,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyRenderPass.html
        """
        return self._v1_0.destroy_render_pass(device, render_pass, p_allocator)

    fn get_render_area_granularity(
        self, device: Device, render_pass: RenderPass, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderAreaGranularity.html
        """
        return self._v1_0.get_render_area_granularity(
            device, render_pass, Ptr(to=granularity).bitcast[Extent2D]()[]
        )

    fn create_command_pool(
        self,
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut command_pool: CommandPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCommandPool.html
        """
        return self._v1_0.create_command_pool(
            device,
            Ptr(to=create_info).bitcast[CommandPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=command_pool).bitcast[CommandPool]()[],
        )

    fn destroy_command_pool(
        self,
        device: Device,
        command_pool: CommandPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCommandPool.html
        """
        return self._v1_0.destroy_command_pool(device, command_pool, p_allocator)

    fn reset_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandPool.html
        """
        return self._v1_0.reset_command_pool(device, command_pool, flags)

    fn allocate_command_buffers(
        self,
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateCommandBuffers.html
        """
        return self._v1_0.allocate_command_buffers(
            device, Ptr(to=allocate_info).bitcast[CommandBufferAllocateInfo]()[], p_command_buffers
        )

    fn free_command_buffers(
        self,
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeCommandBuffers.html
        """
        return self._v1_0.free_command_buffers(
            device, command_pool, command_buffer_count, p_command_buffers
        )

    fn begin_command_buffer(
        self, command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBeginCommandBuffer.html
        """
        return self._v1_0.begin_command_buffer(
            command_buffer, Ptr(to=begin_info).bitcast[CommandBufferBeginInfo]()[]
        )

    fn end_command_buffer(self, command_buffer: CommandBuffer) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEndCommandBuffer.html
        """
        return self._v1_0.end_command_buffer(command_buffer)

    fn reset_command_buffer(
        self, command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandBuffer.html
        """
        return self._v1_0.reset_command_buffer(command_buffer, flags)

    fn cmd_bind_pipeline(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipeline.html
        """
        return self._v1_0.cmd_bind_pipeline(command_buffer, pipeline_bind_point, pipeline)

    fn cmd_set_viewport(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewport.html
        """
        return self._v1_0.cmd_set_viewport(
            command_buffer, first_viewport, viewport_count, p_viewports
        )

    fn cmd_set_scissor(
        self,
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissor.html
        """
        return self._v1_0.cmd_set_scissor(command_buffer, first_scissor, scissor_count, p_scissors)

    fn cmd_set_line_width(self, command_buffer: CommandBuffer, line_width: Float32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineWidth.html
        """
        return self._v1_0.cmd_set_line_width(command_buffer, line_width)

    fn cmd_set_depth_bias(
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

    fn cmd_set_blend_constants(
        self, command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetBlendConstants.html
        """
        return self._v1_0.cmd_set_blend_constants(command_buffer, blend_constants)

    fn cmd_set_depth_bounds(
        self, command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBounds.html
        """
        return self._v1_0.cmd_set_depth_bounds(command_buffer, min_depth_bounds, max_depth_bounds)

    fn cmd_set_stencil_compare_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilCompareMask.html
        """
        return self._v1_0.cmd_set_stencil_compare_mask(command_buffer, face_mask, compare_mask)

    fn cmd_set_stencil_write_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilWriteMask.html
        """
        return self._v1_0.cmd_set_stencil_write_mask(command_buffer, face_mask, write_mask)

    fn cmd_set_stencil_reference(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilReference.html
        """
        return self._v1_0.cmd_set_stencil_reference(command_buffer, face_mask, reference)

    fn cmd_bind_descriptor_sets(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, ImmutAnyOrigin],
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
            p_descriptor_sets,
            dynamic_offset_count,
            p_dynamic_offsets,
        )

    fn cmd_bind_index_buffer(
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

    fn cmd_bind_vertex_buffers(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers.html
        """
        return self._v1_0.cmd_bind_vertex_buffers(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets
        )

    fn cmd_draw(
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

    fn cmd_draw_indexed(
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

    fn cmd_draw_indirect(
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

    fn cmd_draw_indexed_indirect(
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
        return self._v1_0.cmd_draw_indexed_indirect(
            command_buffer, buffer, offset, draw_count, stride
        )

    fn cmd_dispatch(
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

    fn cmd_dispatch_indirect(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchIndirect.html
        """
        return self._v1_0.cmd_dispatch_indirect(command_buffer, buffer, offset)

    fn cmd_copy_buffer(
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer.html
        """
        return self._v1_0.cmd_copy_buffer(
            command_buffer, src_buffer, dst_buffer, region_count, p_regions
        )

    fn cmd_copy_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, ImmutAnyOrigin],
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
            p_regions,
        )

    fn cmd_blit_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, ImmutAnyOrigin],
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
            p_regions,
            filter,
        )

    fn cmd_copy_buffer_to_image(
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html
        """
        return self._v1_0.cmd_copy_buffer_to_image(
            command_buffer, src_buffer, dst_image, dst_image_layout, region_count, p_regions
        )

    fn cmd_copy_image_to_buffer(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer.html
        """
        return self._v1_0.cmd_copy_image_to_buffer(
            command_buffer, src_image, src_image_layout, dst_buffer, region_count, p_regions
        )

    fn cmd_update_buffer(
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdateBuffer.html
        """
        return self._v1_0.cmd_update_buffer(
            command_buffer, dst_buffer, dst_offset, data_size, p_data
        )

    fn cmd_fill_buffer(
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

    fn cmd_clear_color_image(
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html
        """
        return self._v1_0.cmd_clear_color_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=color).bitcast[ClearColorValue]()[],
            range_count,
            p_ranges,
        )

    fn cmd_clear_depth_stencil_image(
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearDepthStencilImage.html
        """
        return self._v1_0.cmd_clear_depth_stencil_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=depth_stencil).bitcast[ClearDepthStencilValue]()[],
            range_count,
            p_ranges,
        )

    fn cmd_clear_attachments(
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, ImmutAnyOrigin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearAttachments.html
        """
        return self._v1_0.cmd_clear_attachments(
            command_buffer, attachment_count, p_attachments, rect_count, p_rects
        )

    fn cmd_resolve_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, ImmutAnyOrigin],
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
            p_regions,
        )

    fn cmd_set_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent.html
        """
        return self._v1_0.cmd_set_event(command_buffer, event, stage_mask)

    fn cmd_reset_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent.html
        """
        return self._v1_0.cmd_reset_event(command_buffer, event, stage_mask)

    fn cmd_wait_events(
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents.html
        """
        return self._v1_0.cmd_wait_events(
            command_buffer,
            event_count,
            p_events,
            src_stage_mask,
            dst_stage_mask,
            memory_barrier_count,
            p_memory_barriers,
            buffer_memory_barrier_count,
            p_buffer_memory_barriers,
            image_memory_barrier_count,
            p_image_memory_barriers,
        )

    fn cmd_pipeline_barrier(
        self,
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
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
            p_memory_barriers,
            buffer_memory_barrier_count,
            p_buffer_memory_barriers,
            image_memory_barrier_count,
            p_image_memory_barriers,
        )

    fn cmd_begin_query(
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

    fn cmd_end_query(self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQuery.html
        """
        return self._v1_0.cmd_end_query(command_buffer, query_pool, query)

    fn cmd_reset_query_pool(
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

    fn cmd_write_timestamp(
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

    fn cmd_copy_query_pool_results(
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
            command_buffer,
            query_pool,
            first_query,
            query_count,
            dst_buffer,
            dst_offset,
            stride,
            flags,
        )

    fn cmd_push_constants(
        self,
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants.html
        """
        return self._v1_0.cmd_push_constants(
            command_buffer, layout, stage_flags, offset, size, p_values
        )

    fn cmd_begin_render_pass(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass.html
        """
        return self._v1_0.cmd_begin_render_pass(
            command_buffer, Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]()[], contents
        )

    fn cmd_next_subpass(self, command_buffer: CommandBuffer, contents: SubpassContents):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass.html
        """
        return self._v1_0.cmd_next_subpass(command_buffer, contents)

    fn cmd_end_render_pass(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass.html
        """
        return self._v1_0.cmd_end_render_pass(command_buffer)

    fn cmd_execute_commands(
        self,
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteCommands.html
        """
        return self._v1_0.cmd_execute_commands(
            command_buffer, command_buffer_count, p_command_buffers
        )

    fn bind_buffer_memory_2(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory2.html
        """
        return self._v1_1.bind_buffer_memory_2(device, bind_info_count, p_bind_infos)

    fn bind_image_memory_2(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory2.html
        """
        return self._v1_1.bind_image_memory_2(device, bind_info_count, p_bind_infos)

    fn get_device_group_peer_memory_features(
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
            Ptr(to=peer_memory_features).bitcast[PeerMemoryFeatureFlags]()[],
        )

    fn cmd_set_device_mask(self, command_buffer: CommandBuffer, device_mask: UInt32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDeviceMask.html
        """
        return self._v1_1.cmd_set_device_mask(command_buffer, device_mask)

    fn cmd_dispatch_base(
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

    fn get_image_memory_requirements_2(
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
            Ptr(to=info).bitcast[ImageMemoryRequirementsInfo2]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_buffer_memory_requirements_2(
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
            Ptr(to=info).bitcast[BufferMemoryRequirementsInfo2]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_image_sparse_memory_requirements_2(
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        return self._v1_1.get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]()[],
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_image_sparse_memory_requirements_2(
        self, device: Device, info: ImageSparseMemoryRequirementsInfo2
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self.get_image_sparse_memory_requirements_2(
            device, info, count, Ptr[SparseImageMemoryRequirements2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_image_sparse_memory_requirements_2(device, info, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTrimCommandPool.html
        """
        return self._v1_1.trim_command_pool(device, command_pool, flags)

    fn get_device_queue_2(self, device: Device, queue_info: DeviceQueueInfo2, mut queue: Queue):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue2.html
        """
        return self._v1_1.get_device_queue_2(
            device,
            Ptr(to=queue_info).bitcast[DeviceQueueInfo2]()[],
            Ptr(to=queue).bitcast[Queue]()[],
        )

    fn create_sampler_ycbcr_conversion(
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSamplerYcbcrConversion.html
        """
        return self._v1_1.create_sampler_ycbcr_conversion(
            device,
            Ptr(to=create_info).bitcast[SamplerYcbcrConversionCreateInfo]()[],
            p_allocator,
            Ptr(to=ycbcr_conversion).bitcast[SamplerYcbcrConversion]()[],
        )

    fn destroy_sampler_ycbcr_conversion(
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySamplerYcbcrConversion.html
        """
        return self._v1_1.destroy_sampler_ycbcr_conversion(device, ycbcr_conversion, p_allocator)

    fn create_descriptor_update_template(
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorUpdateTemplate.html
        """
        return self._v1_1.create_descriptor_update_template(
            device,
            Ptr(to=create_info).bitcast[DescriptorUpdateTemplateCreateInfo]()[],
            p_allocator,
            Ptr(to=descriptor_update_template).bitcast[DescriptorUpdateTemplate]()[],
        )

    fn destroy_descriptor_update_template(
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorUpdateTemplate.html
        """
        return self._v1_1.destroy_descriptor_update_template(
            device, descriptor_update_template, p_allocator
        )

    fn update_descriptor_set_with_template(
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._v1_1.update_descriptor_set_with_template(
            device, descriptor_set, descriptor_update_template, p_data
        )

    fn get_descriptor_set_layout_support(
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
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]()[],
            Ptr(to=support).bitcast[DescriptorSetLayoutSupport]()[],
        )

    fn cmd_draw_indirect_count(
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
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )

    fn cmd_draw_indexed_indirect_count(
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
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )

    fn create_render_pass_2(
        self,
        device: Device,
        create_info: RenderPassCreateInfo2,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass2.html
        """
        return self._v1_2.create_render_pass_2(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo2]()[],
            p_allocator,
            Ptr(to=render_pass).bitcast[RenderPass]()[],
        )

    fn cmd_begin_render_pass_2(
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
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]()[],
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]()[],
        )

    fn cmd_next_subpass_2(
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
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]()[],
            Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]()[],
        )

    fn cmd_end_render_pass_2(self, command_buffer: CommandBuffer, subpass_end_info: SubpassEndInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass2.html
        """
        return self._v1_2.cmd_end_render_pass_2(
            command_buffer, Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]()[]
        )

    fn reset_query_pool(
        self, device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetQueryPool.html
        """
        return self._v1_2.reset_query_pool(device, query_pool, first_query, query_count)

    fn get_semaphore_counter_value(
        self, device: Device, semaphore: Semaphore, mut value: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreCounterValue.html
        """
        return self._v1_2.get_semaphore_counter_value(
            device, semaphore, Ptr(to=value).bitcast[UInt64]()[]
        )

    fn wait_semaphores(
        self, device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitSemaphores.html
        """
        return self._v1_2.wait_semaphores(
            device, Ptr(to=wait_info).bitcast[SemaphoreWaitInfo]()[], timeout
        )

    fn signal_semaphore(self, device: Device, signal_info: SemaphoreSignalInfo) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSignalSemaphore.html
        """
        return self._v1_2.signal_semaphore(
            device, Ptr(to=signal_info).bitcast[SemaphoreSignalInfo]()[]
        )

    fn get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._v1_2.get_buffer_device_address(
            device, Ptr(to=info).bitcast[BufferDeviceAddressInfo]()[]
        )

    fn get_buffer_opaque_capture_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureAddress.html
        """
        return self._v1_2.get_buffer_opaque_capture_address(
            device, Ptr(to=info).bitcast[BufferDeviceAddressInfo]()[]
        )

    fn get_device_memory_opaque_capture_address(
        self, device: Device, info: DeviceMemoryOpaqueCaptureAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryOpaqueCaptureAddress.html
        """
        return self._v1_2.get_device_memory_opaque_capture_address(
            device, Ptr(to=info).bitcast[DeviceMemoryOpaqueCaptureAddressInfo]()[]
        )


struct DeviceFunctionsV1_3(Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: DeviceFunctionAdditionsV1_0
    var _v1_1: DeviceFunctionAdditionsV1_1
    var _v1_2: DeviceFunctionAdditionsV1_2
    var _v1_3: DeviceFunctionAdditionsV1_3

    fn __init__(out self, global_functions: GlobalFunctionsV1_3, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = DeviceFunctionAdditionsV1_0(device, global_functions.get_dlhandle()[])
        self._v1_1 = DeviceFunctionAdditionsV1_1(device, global_functions.get_dlhandle()[])
        self._v1_2 = DeviceFunctionAdditionsV1_2(device, global_functions.get_dlhandle()[])
        self._v1_3 = DeviceFunctionAdditionsV1_3(device, global_functions.get_dlhandle()[])

    fn destroy_device(self, device: Device, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDevice.html
        """
        return self._v1_0.destroy_device(device, p_allocator)

    fn get_device_queue(
        self, device: Device, queue_family_index: UInt32, queue_index: UInt32, mut queue: Queue
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue.html
        """
        return self._v1_0.get_device_queue(
            device, queue_family_index, queue_index, Ptr(to=queue).bitcast[Queue]()[]
        )

    fn queue_submit(
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit.html
        """
        return self._v1_0.queue_submit(queue, submit_count, p_submits, fence)

    fn queue_wait_idle(self, queue: Queue) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueWaitIdle.html
        """
        return self._v1_0.queue_wait_idle(queue)

    fn device_wait_idle(self, device: Device) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeviceWaitIdle.html
        """
        return self._v1_0.device_wait_idle(device)

    fn allocate_memory(
        self,
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut memory: DeviceMemory,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateMemory.html
        """
        return self._v1_0.allocate_memory(
            device,
            Ptr(to=allocate_info).bitcast[MemoryAllocateInfo]()[],
            p_allocator,
            Ptr(to=memory).bitcast[DeviceMemory]()[],
        )

    fn free_memory(
        self,
        device: Device,
        memory: DeviceMemory,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeMemory.html
        """
        return self._v1_0.free_memory(device, memory, p_allocator)

    fn map_memory(
        self,
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        mut p_data: Ptr[NoneType, MutAnyOrigin],
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
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn unmap_memory(self, device: Device, memory: DeviceMemory):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory.html
        """
        return self._v1_0.unmap_memory(device, memory)

    fn flush_mapped_memory_ranges(
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFlushMappedMemoryRanges.html
        """
        return self._v1_0.flush_mapped_memory_ranges(device, memory_range_count, p_memory_ranges)

    fn invalidate_mapped_memory_ranges(
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInvalidateMappedMemoryRanges.html
        """
        return self._v1_0.invalidate_mapped_memory_ranges(
            device, memory_range_count, p_memory_ranges
        )

    fn get_device_memory_commitment(
        self, device: Device, memory: DeviceMemory, mut committed_memory_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryCommitment.html
        """
        return self._v1_0.get_device_memory_commitment(
            device, memory, Ptr(to=committed_memory_in_bytes).bitcast[DeviceSize]()[]
        )

    fn bind_buffer_memory(
        self, device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory.html
        """
        return self._v1_0.bind_buffer_memory(device, buffer, memory, memory_offset)

    fn bind_image_memory(
        self, device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory.html
        """
        return self._v1_0.bind_image_memory(device, image, memory, memory_offset)

    fn get_buffer_memory_requirements(
        self, device: Device, buffer: Buffer, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements.html
        """
        return self._v1_0.get_buffer_memory_requirements(
            device, buffer, Ptr(to=memory_requirements).bitcast[MemoryRequirements]()[]
        )

    fn get_image_memory_requirements(
        self, device: Device, image: Image, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements.html
        """
        return self._v1_0.get_image_memory_requirements(
            device, image, Ptr(to=memory_requirements).bitcast[MemoryRequirements]()[]
        )

    fn get_image_sparse_memory_requirements(
        self,
        device: Device,
        image: Image,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        return self._v1_0.get_image_sparse_memory_requirements(
            device,
            image,
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_image_sparse_memory_requirements(
        self, device: Device, image: Image
    ) -> List[SparseImageMemoryRequirements]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements]()
        var count: UInt32 = 0
        self.get_image_sparse_memory_requirements(
            device, image, count, Ptr[SparseImageMemoryRequirements, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_image_sparse_memory_requirements(device, image, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn queue_bind_sparse(
        self,
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBindSparse.html
        """
        return self._v1_0.queue_bind_sparse(queue, bind_info_count, p_bind_info, fence)

    fn create_fence(
        self,
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFence.html
        """
        return self._v1_0.create_fence(
            device,
            Ptr(to=create_info).bitcast[FenceCreateInfo]()[],
            p_allocator,
            Ptr(to=fence).bitcast[Fence]()[],
        )

    fn destroy_fence(
        self, device: Device, fence: Fence, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFence.html
        """
        return self._v1_0.destroy_fence(device, fence, p_allocator)

    fn reset_fences(
        self, device: Device, fence_count: UInt32, p_fences: Ptr[Fence, ImmutAnyOrigin]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetFences.html
        """
        return self._v1_0.reset_fences(device, fence_count, p_fences)

    fn get_fence_status(self, device: Device, fence: Fence) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceStatus.html
        """
        return self._v1_0.get_fence_status(device, fence)

    fn wait_for_fences(
        self,
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, ImmutAnyOrigin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForFences.html
        """
        return self._v1_0.wait_for_fences(device, fence_count, p_fences, wait_all, timeout)

    fn create_semaphore(
        self,
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut semaphore: Semaphore,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSemaphore.html
        """
        return self._v1_0.create_semaphore(
            device,
            Ptr(to=create_info).bitcast[SemaphoreCreateInfo]()[],
            p_allocator,
            Ptr(to=semaphore).bitcast[Semaphore]()[],
        )

    fn destroy_semaphore(
        self,
        device: Device,
        semaphore: Semaphore,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySemaphore.html
        """
        return self._v1_0.destroy_semaphore(device, semaphore, p_allocator)

    fn create_event(
        self,
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut event: Event,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateEvent.html
        """
        return self._v1_0.create_event(
            device,
            Ptr(to=create_info).bitcast[EventCreateInfo]()[],
            p_allocator,
            Ptr(to=event).bitcast[Event]()[],
        )

    fn destroy_event(
        self, device: Device, event: Event, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyEvent.html
        """
        return self._v1_0.destroy_event(device, event, p_allocator)

    fn get_event_status(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEventStatus.html
        """
        return self._v1_0.get_event_status(device, event)

    fn set_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetEvent.html
        """
        return self._v1_0.set_event(device, event)

    fn reset_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetEvent.html
        """
        return self._v1_0.reset_event(device, event)

    fn create_query_pool(
        self,
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut query_pool: QueryPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateQueryPool.html
        """
        return self._v1_0.create_query_pool(
            device,
            Ptr(to=create_info).bitcast[QueryPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=query_pool).bitcast[QueryPool]()[],
        )

    fn destroy_query_pool(
        self,
        device: Device,
        query_pool: QueryPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyQueryPool.html
        """
        return self._v1_0.destroy_query_pool(device, query_pool, p_allocator)

    fn get_query_pool_results(
        self,
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueryPoolResults.html
        """
        return self._v1_0.get_query_pool_results(
            device, query_pool, first_query, query_count, data_size, p_data, stride, flags
        )

    fn create_buffer(
        self,
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut buffer: Buffer,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBuffer.html
        """
        return self._v1_0.create_buffer(
            device,
            Ptr(to=create_info).bitcast[BufferCreateInfo]()[],
            p_allocator,
            Ptr(to=buffer).bitcast[Buffer]()[],
        )

    fn destroy_buffer(
        self, device: Device, buffer: Buffer, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBuffer.html
        """
        return self._v1_0.destroy_buffer(device, buffer, p_allocator)

    fn create_buffer_view(
        self,
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: BufferView,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferView.html
        """
        return self._v1_0.create_buffer_view(
            device,
            Ptr(to=create_info).bitcast[BufferViewCreateInfo]()[],
            p_allocator,
            Ptr(to=view).bitcast[BufferView]()[],
        )

    fn destroy_buffer_view(
        self,
        device: Device,
        buffer_view: BufferView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferView.html
        """
        return self._v1_0.destroy_buffer_view(device, buffer_view, p_allocator)

    fn create_image(
        self,
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut image: Image,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImage.html
        """
        return self._v1_0.create_image(
            device,
            Ptr(to=create_info).bitcast[ImageCreateInfo]()[],
            p_allocator,
            Ptr(to=image).bitcast[Image]()[],
        )

    fn destroy_image(
        self, device: Device, image: Image, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImage.html
        """
        return self._v1_0.destroy_image(device, image, p_allocator)

    fn get_image_subresource_layout(
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
            Ptr(to=subresource).bitcast[ImageSubresource]()[],
            Ptr(to=layout).bitcast[SubresourceLayout]()[],
        )

    fn create_image_view(
        self,
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: ImageView,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImageView.html
        """
        return self._v1_0.create_image_view(
            device,
            Ptr(to=create_info).bitcast[ImageViewCreateInfo]()[],
            p_allocator,
            Ptr(to=view).bitcast[ImageView]()[],
        )

    fn destroy_image_view(
        self,
        device: Device,
        image_view: ImageView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImageView.html
        """
        return self._v1_0.destroy_image_view(device, image_view, p_allocator)

    fn create_shader_module(
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut shader_module: ShaderModule,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShaderModule.html
        """
        return self._v1_0.create_shader_module(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]()[],
            p_allocator,
            Ptr(to=shader_module).bitcast[ShaderModule]()[],
        )

    fn destroy_shader_module(
        self,
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderModule.html
        """
        return self._v1_0.destroy_shader_module(device, shader_module, p_allocator)

    fn create_pipeline_cache(
        self,
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut pipeline_cache: PipelineCache,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineCache.html
        """
        return self._v1_0.create_pipeline_cache(
            device,
            Ptr(to=create_info).bitcast[PipelineCacheCreateInfo]()[],
            p_allocator,
            Ptr(to=pipeline_cache).bitcast[PipelineCache]()[],
        )

    fn destroy_pipeline_cache(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineCache.html
        """
        return self._v1_0.destroy_pipeline_cache(device, pipeline_cache, p_allocator)

    fn get_pipeline_cache_data(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        mut data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        return self._v1_0.get_pipeline_cache_data(
            device, pipeline_cache, Ptr(to=data_size).bitcast[UInt]()[], p_data
        )

    fn get_pipeline_cache_data(
        self, device: Device, pipeline_cache: PipelineCache
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_pipeline_cache_data(
                device, pipeline_cache, count, Ptr[NoneType, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.get_pipeline_cache_data(
                device, pipeline_cache, count, list.unsafe_ptr().bitcast[NoneType]()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn merge_pipeline_caches(
        self,
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergePipelineCaches.html
        """
        return self._v1_0.merge_pipeline_caches(device, dst_cache, src_cache_count, p_src_caches)

    fn create_graphics_pipelines(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateGraphicsPipelines.html
        """
        return self._v1_0.create_graphics_pipelines(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn create_compute_pipelines(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateComputePipelines.html
        """
        return self._v1_0.create_compute_pipelines(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn destroy_pipeline(
        self,
        device: Device,
        pipeline: Pipeline,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipeline.html
        """
        return self._v1_0.destroy_pipeline(device, pipeline, p_allocator)

    fn create_pipeline_layout(
        self,
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut pipeline_layout: PipelineLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineLayout.html
        """
        return self._v1_0.create_pipeline_layout(
            device,
            Ptr(to=create_info).bitcast[PipelineLayoutCreateInfo]()[],
            p_allocator,
            Ptr(to=pipeline_layout).bitcast[PipelineLayout]()[],
        )

    fn destroy_pipeline_layout(
        self,
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineLayout.html
        """
        return self._v1_0.destroy_pipeline_layout(device, pipeline_layout, p_allocator)

    fn create_sampler(
        self,
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut sampler: Sampler,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSampler.html
        """
        return self._v1_0.create_sampler(
            device,
            Ptr(to=create_info).bitcast[SamplerCreateInfo]()[],
            p_allocator,
            Ptr(to=sampler).bitcast[Sampler]()[],
        )

    fn destroy_sampler(
        self,
        device: Device,
        sampler: Sampler,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySampler.html
        """
        return self._v1_0.destroy_sampler(device, sampler, p_allocator)

    fn create_descriptor_set_layout(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut set_layout: DescriptorSetLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorSetLayout.html
        """
        return self._v1_0.create_descriptor_set_layout(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]()[],
            p_allocator,
            Ptr(to=set_layout).bitcast[DescriptorSetLayout]()[],
        )

    fn destroy_descriptor_set_layout(
        self,
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorSetLayout.html
        """
        return self._v1_0.destroy_descriptor_set_layout(device, descriptor_set_layout, p_allocator)

    fn create_descriptor_pool(
        self,
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut descriptor_pool: DescriptorPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorPool.html
        """
        return self._v1_0.create_descriptor_pool(
            device,
            Ptr(to=create_info).bitcast[DescriptorPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=descriptor_pool).bitcast[DescriptorPool]()[],
        )

    fn destroy_descriptor_pool(
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorPool.html
        """
        return self._v1_0.destroy_descriptor_pool(device, descriptor_pool, p_allocator)

    fn reset_descriptor_pool(
        self, device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetDescriptorPool.html
        """
        return self._v1_0.reset_descriptor_pool(device, descriptor_pool, flags)

    fn allocate_descriptor_sets(
        self,
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateDescriptorSets.html
        """
        return self._v1_0.allocate_descriptor_sets(
            device, Ptr(to=allocate_info).bitcast[DescriptorSetAllocateInfo]()[], p_descriptor_sets
        )

    fn free_descriptor_sets(
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeDescriptorSets.html
        """
        return self._v1_0.free_descriptor_sets(
            device, descriptor_pool, descriptor_set_count, p_descriptor_sets
        )

    fn update_descriptor_sets(
        self,
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSets.html
        """
        return self._v1_0.update_descriptor_sets(
            device,
            descriptor_write_count,
            p_descriptor_writes,
            descriptor_copy_count,
            p_descriptor_copies,
        )

    fn create_framebuffer(
        self,
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut framebuffer: Framebuffer,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFramebuffer.html
        """
        return self._v1_0.create_framebuffer(
            device,
            Ptr(to=create_info).bitcast[FramebufferCreateInfo]()[],
            p_allocator,
            Ptr(to=framebuffer).bitcast[Framebuffer]()[],
        )

    fn destroy_framebuffer(
        self,
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFramebuffer.html
        """
        return self._v1_0.destroy_framebuffer(device, framebuffer, p_allocator)

    fn create_render_pass(
        self,
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass.html
        """
        return self._v1_0.create_render_pass(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo]()[],
            p_allocator,
            Ptr(to=render_pass).bitcast[RenderPass]()[],
        )

    fn destroy_render_pass(
        self,
        device: Device,
        render_pass: RenderPass,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyRenderPass.html
        """
        return self._v1_0.destroy_render_pass(device, render_pass, p_allocator)

    fn get_render_area_granularity(
        self, device: Device, render_pass: RenderPass, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderAreaGranularity.html
        """
        return self._v1_0.get_render_area_granularity(
            device, render_pass, Ptr(to=granularity).bitcast[Extent2D]()[]
        )

    fn create_command_pool(
        self,
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut command_pool: CommandPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCommandPool.html
        """
        return self._v1_0.create_command_pool(
            device,
            Ptr(to=create_info).bitcast[CommandPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=command_pool).bitcast[CommandPool]()[],
        )

    fn destroy_command_pool(
        self,
        device: Device,
        command_pool: CommandPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCommandPool.html
        """
        return self._v1_0.destroy_command_pool(device, command_pool, p_allocator)

    fn reset_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandPool.html
        """
        return self._v1_0.reset_command_pool(device, command_pool, flags)

    fn allocate_command_buffers(
        self,
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateCommandBuffers.html
        """
        return self._v1_0.allocate_command_buffers(
            device, Ptr(to=allocate_info).bitcast[CommandBufferAllocateInfo]()[], p_command_buffers
        )

    fn free_command_buffers(
        self,
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeCommandBuffers.html
        """
        return self._v1_0.free_command_buffers(
            device, command_pool, command_buffer_count, p_command_buffers
        )

    fn begin_command_buffer(
        self, command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBeginCommandBuffer.html
        """
        return self._v1_0.begin_command_buffer(
            command_buffer, Ptr(to=begin_info).bitcast[CommandBufferBeginInfo]()[]
        )

    fn end_command_buffer(self, command_buffer: CommandBuffer) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEndCommandBuffer.html
        """
        return self._v1_0.end_command_buffer(command_buffer)

    fn reset_command_buffer(
        self, command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandBuffer.html
        """
        return self._v1_0.reset_command_buffer(command_buffer, flags)

    fn cmd_bind_pipeline(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipeline.html
        """
        return self._v1_0.cmd_bind_pipeline(command_buffer, pipeline_bind_point, pipeline)

    fn cmd_set_viewport(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewport.html
        """
        return self._v1_0.cmd_set_viewport(
            command_buffer, first_viewport, viewport_count, p_viewports
        )

    fn cmd_set_scissor(
        self,
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissor.html
        """
        return self._v1_0.cmd_set_scissor(command_buffer, first_scissor, scissor_count, p_scissors)

    fn cmd_set_line_width(self, command_buffer: CommandBuffer, line_width: Float32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineWidth.html
        """
        return self._v1_0.cmd_set_line_width(command_buffer, line_width)

    fn cmd_set_depth_bias(
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

    fn cmd_set_blend_constants(
        self, command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetBlendConstants.html
        """
        return self._v1_0.cmd_set_blend_constants(command_buffer, blend_constants)

    fn cmd_set_depth_bounds(
        self, command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBounds.html
        """
        return self._v1_0.cmd_set_depth_bounds(command_buffer, min_depth_bounds, max_depth_bounds)

    fn cmd_set_stencil_compare_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilCompareMask.html
        """
        return self._v1_0.cmd_set_stencil_compare_mask(command_buffer, face_mask, compare_mask)

    fn cmd_set_stencil_write_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilWriteMask.html
        """
        return self._v1_0.cmd_set_stencil_write_mask(command_buffer, face_mask, write_mask)

    fn cmd_set_stencil_reference(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilReference.html
        """
        return self._v1_0.cmd_set_stencil_reference(command_buffer, face_mask, reference)

    fn cmd_bind_descriptor_sets(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, ImmutAnyOrigin],
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
            p_descriptor_sets,
            dynamic_offset_count,
            p_dynamic_offsets,
        )

    fn cmd_bind_index_buffer(
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

    fn cmd_bind_vertex_buffers(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers.html
        """
        return self._v1_0.cmd_bind_vertex_buffers(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets
        )

    fn cmd_draw(
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

    fn cmd_draw_indexed(
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

    fn cmd_draw_indirect(
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

    fn cmd_draw_indexed_indirect(
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
        return self._v1_0.cmd_draw_indexed_indirect(
            command_buffer, buffer, offset, draw_count, stride
        )

    fn cmd_dispatch(
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

    fn cmd_dispatch_indirect(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchIndirect.html
        """
        return self._v1_0.cmd_dispatch_indirect(command_buffer, buffer, offset)

    fn cmd_copy_buffer(
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer.html
        """
        return self._v1_0.cmd_copy_buffer(
            command_buffer, src_buffer, dst_buffer, region_count, p_regions
        )

    fn cmd_copy_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, ImmutAnyOrigin],
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
            p_regions,
        )

    fn cmd_blit_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, ImmutAnyOrigin],
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
            p_regions,
            filter,
        )

    fn cmd_copy_buffer_to_image(
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html
        """
        return self._v1_0.cmd_copy_buffer_to_image(
            command_buffer, src_buffer, dst_image, dst_image_layout, region_count, p_regions
        )

    fn cmd_copy_image_to_buffer(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer.html
        """
        return self._v1_0.cmd_copy_image_to_buffer(
            command_buffer, src_image, src_image_layout, dst_buffer, region_count, p_regions
        )

    fn cmd_update_buffer(
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdateBuffer.html
        """
        return self._v1_0.cmd_update_buffer(
            command_buffer, dst_buffer, dst_offset, data_size, p_data
        )

    fn cmd_fill_buffer(
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

    fn cmd_clear_color_image(
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html
        """
        return self._v1_0.cmd_clear_color_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=color).bitcast[ClearColorValue]()[],
            range_count,
            p_ranges,
        )

    fn cmd_clear_depth_stencil_image(
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearDepthStencilImage.html
        """
        return self._v1_0.cmd_clear_depth_stencil_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=depth_stencil).bitcast[ClearDepthStencilValue]()[],
            range_count,
            p_ranges,
        )

    fn cmd_clear_attachments(
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, ImmutAnyOrigin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearAttachments.html
        """
        return self._v1_0.cmd_clear_attachments(
            command_buffer, attachment_count, p_attachments, rect_count, p_rects
        )

    fn cmd_resolve_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, ImmutAnyOrigin],
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
            p_regions,
        )

    fn cmd_set_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent.html
        """
        return self._v1_0.cmd_set_event(command_buffer, event, stage_mask)

    fn cmd_reset_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent.html
        """
        return self._v1_0.cmd_reset_event(command_buffer, event, stage_mask)

    fn cmd_wait_events(
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents.html
        """
        return self._v1_0.cmd_wait_events(
            command_buffer,
            event_count,
            p_events,
            src_stage_mask,
            dst_stage_mask,
            memory_barrier_count,
            p_memory_barriers,
            buffer_memory_barrier_count,
            p_buffer_memory_barriers,
            image_memory_barrier_count,
            p_image_memory_barriers,
        )

    fn cmd_pipeline_barrier(
        self,
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
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
            p_memory_barriers,
            buffer_memory_barrier_count,
            p_buffer_memory_barriers,
            image_memory_barrier_count,
            p_image_memory_barriers,
        )

    fn cmd_begin_query(
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

    fn cmd_end_query(self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQuery.html
        """
        return self._v1_0.cmd_end_query(command_buffer, query_pool, query)

    fn cmd_reset_query_pool(
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

    fn cmd_write_timestamp(
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

    fn cmd_copy_query_pool_results(
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
            command_buffer,
            query_pool,
            first_query,
            query_count,
            dst_buffer,
            dst_offset,
            stride,
            flags,
        )

    fn cmd_push_constants(
        self,
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants.html
        """
        return self._v1_0.cmd_push_constants(
            command_buffer, layout, stage_flags, offset, size, p_values
        )

    fn cmd_begin_render_pass(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass.html
        """
        return self._v1_0.cmd_begin_render_pass(
            command_buffer, Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]()[], contents
        )

    fn cmd_next_subpass(self, command_buffer: CommandBuffer, contents: SubpassContents):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass.html
        """
        return self._v1_0.cmd_next_subpass(command_buffer, contents)

    fn cmd_end_render_pass(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass.html
        """
        return self._v1_0.cmd_end_render_pass(command_buffer)

    fn cmd_execute_commands(
        self,
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteCommands.html
        """
        return self._v1_0.cmd_execute_commands(
            command_buffer, command_buffer_count, p_command_buffers
        )

    fn bind_buffer_memory_2(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory2.html
        """
        return self._v1_1.bind_buffer_memory_2(device, bind_info_count, p_bind_infos)

    fn bind_image_memory_2(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory2.html
        """
        return self._v1_1.bind_image_memory_2(device, bind_info_count, p_bind_infos)

    fn get_device_group_peer_memory_features(
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
            Ptr(to=peer_memory_features).bitcast[PeerMemoryFeatureFlags]()[],
        )

    fn cmd_set_device_mask(self, command_buffer: CommandBuffer, device_mask: UInt32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDeviceMask.html
        """
        return self._v1_1.cmd_set_device_mask(command_buffer, device_mask)

    fn cmd_dispatch_base(
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

    fn get_image_memory_requirements_2(
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
            Ptr(to=info).bitcast[ImageMemoryRequirementsInfo2]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_buffer_memory_requirements_2(
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
            Ptr(to=info).bitcast[BufferMemoryRequirementsInfo2]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_image_sparse_memory_requirements_2(
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        return self._v1_1.get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]()[],
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_image_sparse_memory_requirements_2(
        self, device: Device, info: ImageSparseMemoryRequirementsInfo2
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self.get_image_sparse_memory_requirements_2(
            device, info, count, Ptr[SparseImageMemoryRequirements2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_image_sparse_memory_requirements_2(device, info, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTrimCommandPool.html
        """
        return self._v1_1.trim_command_pool(device, command_pool, flags)

    fn get_device_queue_2(self, device: Device, queue_info: DeviceQueueInfo2, mut queue: Queue):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue2.html
        """
        return self._v1_1.get_device_queue_2(
            device,
            Ptr(to=queue_info).bitcast[DeviceQueueInfo2]()[],
            Ptr(to=queue).bitcast[Queue]()[],
        )

    fn create_sampler_ycbcr_conversion(
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSamplerYcbcrConversion.html
        """
        return self._v1_1.create_sampler_ycbcr_conversion(
            device,
            Ptr(to=create_info).bitcast[SamplerYcbcrConversionCreateInfo]()[],
            p_allocator,
            Ptr(to=ycbcr_conversion).bitcast[SamplerYcbcrConversion]()[],
        )

    fn destroy_sampler_ycbcr_conversion(
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySamplerYcbcrConversion.html
        """
        return self._v1_1.destroy_sampler_ycbcr_conversion(device, ycbcr_conversion, p_allocator)

    fn create_descriptor_update_template(
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorUpdateTemplate.html
        """
        return self._v1_1.create_descriptor_update_template(
            device,
            Ptr(to=create_info).bitcast[DescriptorUpdateTemplateCreateInfo]()[],
            p_allocator,
            Ptr(to=descriptor_update_template).bitcast[DescriptorUpdateTemplate]()[],
        )

    fn destroy_descriptor_update_template(
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorUpdateTemplate.html
        """
        return self._v1_1.destroy_descriptor_update_template(
            device, descriptor_update_template, p_allocator
        )

    fn update_descriptor_set_with_template(
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._v1_1.update_descriptor_set_with_template(
            device, descriptor_set, descriptor_update_template, p_data
        )

    fn get_descriptor_set_layout_support(
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
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]()[],
            Ptr(to=support).bitcast[DescriptorSetLayoutSupport]()[],
        )

    fn cmd_draw_indirect_count(
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
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )

    fn cmd_draw_indexed_indirect_count(
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
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )

    fn create_render_pass_2(
        self,
        device: Device,
        create_info: RenderPassCreateInfo2,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass2.html
        """
        return self._v1_2.create_render_pass_2(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo2]()[],
            p_allocator,
            Ptr(to=render_pass).bitcast[RenderPass]()[],
        )

    fn cmd_begin_render_pass_2(
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
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]()[],
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]()[],
        )

    fn cmd_next_subpass_2(
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
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]()[],
            Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]()[],
        )

    fn cmd_end_render_pass_2(self, command_buffer: CommandBuffer, subpass_end_info: SubpassEndInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass2.html
        """
        return self._v1_2.cmd_end_render_pass_2(
            command_buffer, Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]()[]
        )

    fn reset_query_pool(
        self, device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetQueryPool.html
        """
        return self._v1_2.reset_query_pool(device, query_pool, first_query, query_count)

    fn get_semaphore_counter_value(
        self, device: Device, semaphore: Semaphore, mut value: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreCounterValue.html
        """
        return self._v1_2.get_semaphore_counter_value(
            device, semaphore, Ptr(to=value).bitcast[UInt64]()[]
        )

    fn wait_semaphores(
        self, device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitSemaphores.html
        """
        return self._v1_2.wait_semaphores(
            device, Ptr(to=wait_info).bitcast[SemaphoreWaitInfo]()[], timeout
        )

    fn signal_semaphore(self, device: Device, signal_info: SemaphoreSignalInfo) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSignalSemaphore.html
        """
        return self._v1_2.signal_semaphore(
            device, Ptr(to=signal_info).bitcast[SemaphoreSignalInfo]()[]
        )

    fn get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._v1_2.get_buffer_device_address(
            device, Ptr(to=info).bitcast[BufferDeviceAddressInfo]()[]
        )

    fn get_buffer_opaque_capture_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureAddress.html
        """
        return self._v1_2.get_buffer_opaque_capture_address(
            device, Ptr(to=info).bitcast[BufferDeviceAddressInfo]()[]
        )

    fn get_device_memory_opaque_capture_address(
        self, device: Device, info: DeviceMemoryOpaqueCaptureAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryOpaqueCaptureAddress.html
        """
        return self._v1_2.get_device_memory_opaque_capture_address(
            device, Ptr(to=info).bitcast[DeviceMemoryOpaqueCaptureAddressInfo]()[]
        )

    fn create_private_data_slot(
        self,
        device: Device,
        create_info: PrivateDataSlotCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut private_data_slot: PrivateDataSlot,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePrivateDataSlot.html
        """
        return self._v1_3.create_private_data_slot(
            device,
            Ptr(to=create_info).bitcast[PrivateDataSlotCreateInfo]()[],
            p_allocator,
            Ptr(to=private_data_slot).bitcast[PrivateDataSlot]()[],
        )

    fn destroy_private_data_slot(
        self,
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPrivateDataSlot.html
        """
        return self._v1_3.destroy_private_data_slot(device, private_data_slot, p_allocator)

    fn set_private_data(
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
        return self._v1_3.set_private_data(
            device, object_type, object_handle, private_data_slot, data
        )

    fn get_private_data(
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
            device, object_type, object_handle, private_data_slot, Ptr(to=data).bitcast[UInt64]()[]
        )

    fn cmd_set_event_2(
        self, command_buffer: CommandBuffer, event: Event, dependency_info: DependencyInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent2.html
        """
        return self._v1_3.cmd_set_event_2(
            command_buffer, event, Ptr(to=dependency_info).bitcast[DependencyInfo]()[]
        )

    fn cmd_reset_event_2(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent2.html
        """
        return self._v1_3.cmd_reset_event_2(command_buffer, event, stage_mask)

    fn cmd_wait_events_2(
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        p_dependency_infos: Ptr[DependencyInfo, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents2.html
        """
        return self._v1_3.cmd_wait_events_2(
            command_buffer, event_count, p_events, p_dependency_infos
        )

    fn cmd_pipeline_barrier_2(self, command_buffer: CommandBuffer, dependency_info: DependencyInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier2.html
        """
        return self._v1_3.cmd_pipeline_barrier_2(
            command_buffer, Ptr(to=dependency_info).bitcast[DependencyInfo]()[]
        )

    fn cmd_write_timestamp_2(
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

    fn queue_submit_2(
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo2, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit2.html
        """
        return self._v1_3.queue_submit_2(queue, submit_count, p_submits, fence)

    fn cmd_copy_buffer_2(self, command_buffer: CommandBuffer, copy_buffer_info: CopyBufferInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer2.html
        """
        return self._v1_3.cmd_copy_buffer_2(
            command_buffer, Ptr(to=copy_buffer_info).bitcast[CopyBufferInfo2]()[]
        )

    fn cmd_copy_image_2(self, command_buffer: CommandBuffer, copy_image_info: CopyImageInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage2.html
        """
        return self._v1_3.cmd_copy_image_2(
            command_buffer, Ptr(to=copy_image_info).bitcast[CopyImageInfo2]()[]
        )

    fn cmd_copy_buffer_to_image_2(
        self, command_buffer: CommandBuffer, copy_buffer_to_image_info: CopyBufferToImageInfo2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage2.html
        """
        return self._v1_3.cmd_copy_buffer_to_image_2(
            command_buffer, Ptr(to=copy_buffer_to_image_info).bitcast[CopyBufferToImageInfo2]()[]
        )

    fn cmd_copy_image_to_buffer_2(
        self, command_buffer: CommandBuffer, copy_image_to_buffer_info: CopyImageToBufferInfo2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer2.html
        """
        return self._v1_3.cmd_copy_image_to_buffer_2(
            command_buffer, Ptr(to=copy_image_to_buffer_info).bitcast[CopyImageToBufferInfo2]()[]
        )

    fn cmd_blit_image_2(self, command_buffer: CommandBuffer, blit_image_info: BlitImageInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage2.html
        """
        return self._v1_3.cmd_blit_image_2(
            command_buffer, Ptr(to=blit_image_info).bitcast[BlitImageInfo2]()[]
        )

    fn cmd_resolve_image_2(
        self, command_buffer: CommandBuffer, resolve_image_info: ResolveImageInfo2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage2.html
        """
        return self._v1_3.cmd_resolve_image_2(
            command_buffer, Ptr(to=resolve_image_info).bitcast[ResolveImageInfo2]()[]
        )

    fn cmd_begin_rendering(self, command_buffer: CommandBuffer, rendering_info: RenderingInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRendering.html
        """
        return self._v1_3.cmd_begin_rendering(
            command_buffer, Ptr(to=rendering_info).bitcast[RenderingInfo]()[]
        )

    fn cmd_end_rendering(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering.html
        """
        return self._v1_3.cmd_end_rendering(command_buffer)

    fn cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCullMode.html
        """
        return self._v1_3.cmd_set_cull_mode(command_buffer, cull_mode)

    fn cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFrontFace.html
        """
        return self._v1_3.cmd_set_front_face(command_buffer, front_face)

    fn cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveTopology.html
        """
        return self._v1_3.cmd_set_primitive_topology(command_buffer, primitive_topology)

    fn cmd_set_viewport_with_count(
        self,
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWithCount.html
        """
        return self._v1_3.cmd_set_viewport_with_count(command_buffer, viewport_count, p_viewports)

    fn cmd_set_scissor_with_count(
        self,
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissorWithCount.html
        """
        return self._v1_3.cmd_set_scissor_with_count(command_buffer, scissor_count, p_scissors)

    fn cmd_bind_vertex_buffers_2(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
        p_sizes: Ptr[DeviceSize, ImmutAnyOrigin],
        p_strides: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers2.html
        """
        return self._v1_3.cmd_bind_vertex_buffers_2(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets, p_sizes, p_strides
        )

    fn cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthTestEnable.html
        """
        return self._v1_3.cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    fn cmd_set_depth_write_enable(self, command_buffer: CommandBuffer, depth_write_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthWriteEnable.html
        """
        return self._v1_3.cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    fn cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthCompareOp.html
        """
        return self._v1_3.cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    fn cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBoundsTestEnable.html
        """
        return self._v1_3.cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    fn cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilTestEnable.html
        """
        return self._v1_3.cmd_set_stencil_test_enable(command_buffer, stencil_test_enable)

    fn cmd_set_stencil_op(
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

    fn cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizerDiscardEnable.html
        """
        return self._v1_3.cmd_set_rasterizer_discard_enable(
            command_buffer, rasterizer_discard_enable
        )

    fn cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBiasEnable.html
        """
        return self._v1_3.cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    fn cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._v1_3.cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)

    fn get_device_buffer_memory_requirements(
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
            Ptr(to=info).bitcast[DeviceBufferMemoryRequirements]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_device_image_memory_requirements(
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
            Ptr(to=info).bitcast[DeviceImageMemoryRequirements]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_device_image_sparse_memory_requirements(
        self,
        device: Device,
        info: DeviceImageMemoryRequirements,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        return self._v1_3.get_device_image_sparse_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceImageMemoryRequirements]()[],
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_device_image_sparse_memory_requirements(
        self, device: Device, info: DeviceImageMemoryRequirements
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self.get_device_image_sparse_memory_requirements(
            device, info, count, Ptr[SparseImageMemoryRequirements2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_device_image_sparse_memory_requirements(device, info, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^


struct DeviceFunctionsV1_4(Movable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _v1_0: DeviceFunctionAdditionsV1_0
    var _v1_1: DeviceFunctionAdditionsV1_1
    var _v1_2: DeviceFunctionAdditionsV1_2
    var _v1_3: DeviceFunctionAdditionsV1_3
    var _v1_4: DeviceFunctionAdditionsV1_4

    fn __init__(out self, global_functions: GlobalFunctionsV1_4, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        self._v1_0 = DeviceFunctionAdditionsV1_0(device, global_functions.get_dlhandle()[])
        self._v1_1 = DeviceFunctionAdditionsV1_1(device, global_functions.get_dlhandle()[])
        self._v1_2 = DeviceFunctionAdditionsV1_2(device, global_functions.get_dlhandle()[])
        self._v1_3 = DeviceFunctionAdditionsV1_3(device, global_functions.get_dlhandle()[])
        self._v1_4 = DeviceFunctionAdditionsV1_4(device, global_functions.get_dlhandle()[])

    fn destroy_device(self, device: Device, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDevice.html
        """
        return self._v1_0.destroy_device(device, p_allocator)

    fn get_device_queue(
        self, device: Device, queue_family_index: UInt32, queue_index: UInt32, mut queue: Queue
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue.html
        """
        return self._v1_0.get_device_queue(
            device, queue_family_index, queue_index, Ptr(to=queue).bitcast[Queue]()[]
        )

    fn queue_submit(
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit.html
        """
        return self._v1_0.queue_submit(queue, submit_count, p_submits, fence)

    fn queue_wait_idle(self, queue: Queue) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueWaitIdle.html
        """
        return self._v1_0.queue_wait_idle(queue)

    fn device_wait_idle(self, device: Device) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDeviceWaitIdle.html
        """
        return self._v1_0.device_wait_idle(device)

    fn allocate_memory(
        self,
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut memory: DeviceMemory,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateMemory.html
        """
        return self._v1_0.allocate_memory(
            device,
            Ptr(to=allocate_info).bitcast[MemoryAllocateInfo]()[],
            p_allocator,
            Ptr(to=memory).bitcast[DeviceMemory]()[],
        )

    fn free_memory(
        self,
        device: Device,
        memory: DeviceMemory,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeMemory.html
        """
        return self._v1_0.free_memory(device, memory, p_allocator)

    fn map_memory(
        self,
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        mut p_data: Ptr[NoneType, MutAnyOrigin],
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
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn unmap_memory(self, device: Device, memory: DeviceMemory):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory.html
        """
        return self._v1_0.unmap_memory(device, memory)

    fn flush_mapped_memory_ranges(
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFlushMappedMemoryRanges.html
        """
        return self._v1_0.flush_mapped_memory_ranges(device, memory_range_count, p_memory_ranges)

    fn invalidate_mapped_memory_ranges(
        self,
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkInvalidateMappedMemoryRanges.html
        """
        return self._v1_0.invalidate_mapped_memory_ranges(
            device, memory_range_count, p_memory_ranges
        )

    fn get_device_memory_commitment(
        self, device: Device, memory: DeviceMemory, mut committed_memory_in_bytes: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryCommitment.html
        """
        return self._v1_0.get_device_memory_commitment(
            device, memory, Ptr(to=committed_memory_in_bytes).bitcast[DeviceSize]()[]
        )

    fn bind_buffer_memory(
        self, device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory.html
        """
        return self._v1_0.bind_buffer_memory(device, buffer, memory, memory_offset)

    fn bind_image_memory(
        self, device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory.html
        """
        return self._v1_0.bind_image_memory(device, image, memory, memory_offset)

    fn get_buffer_memory_requirements(
        self, device: Device, buffer: Buffer, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferMemoryRequirements.html
        """
        return self._v1_0.get_buffer_memory_requirements(
            device, buffer, Ptr(to=memory_requirements).bitcast[MemoryRequirements]()[]
        )

    fn get_image_memory_requirements(
        self, device: Device, image: Image, mut memory_requirements: MemoryRequirements
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageMemoryRequirements.html
        """
        return self._v1_0.get_image_memory_requirements(
            device, image, Ptr(to=memory_requirements).bitcast[MemoryRequirements]()[]
        )

    fn get_image_sparse_memory_requirements(
        self,
        device: Device,
        image: Image,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        return self._v1_0.get_image_sparse_memory_requirements(
            device,
            image,
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_image_sparse_memory_requirements(
        self, device: Device, image: Image
    ) -> List[SparseImageMemoryRequirements]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements]()
        var count: UInt32 = 0
        self.get_image_sparse_memory_requirements(
            device, image, count, Ptr[SparseImageMemoryRequirements, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_image_sparse_memory_requirements(device, image, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn queue_bind_sparse(
        self,
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueBindSparse.html
        """
        return self._v1_0.queue_bind_sparse(queue, bind_info_count, p_bind_info, fence)

    fn create_fence(
        self,
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFence.html
        """
        return self._v1_0.create_fence(
            device,
            Ptr(to=create_info).bitcast[FenceCreateInfo]()[],
            p_allocator,
            Ptr(to=fence).bitcast[Fence]()[],
        )

    fn destroy_fence(
        self, device: Device, fence: Fence, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFence.html
        """
        return self._v1_0.destroy_fence(device, fence, p_allocator)

    fn reset_fences(
        self, device: Device, fence_count: UInt32, p_fences: Ptr[Fence, ImmutAnyOrigin]
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetFences.html
        """
        return self._v1_0.reset_fences(device, fence_count, p_fences)

    fn get_fence_status(self, device: Device, fence: Fence) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetFenceStatus.html
        """
        return self._v1_0.get_fence_status(device, fence)

    fn wait_for_fences(
        self,
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, ImmutAnyOrigin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitForFences.html
        """
        return self._v1_0.wait_for_fences(device, fence_count, p_fences, wait_all, timeout)

    fn create_semaphore(
        self,
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut semaphore: Semaphore,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSemaphore.html
        """
        return self._v1_0.create_semaphore(
            device,
            Ptr(to=create_info).bitcast[SemaphoreCreateInfo]()[],
            p_allocator,
            Ptr(to=semaphore).bitcast[Semaphore]()[],
        )

    fn destroy_semaphore(
        self,
        device: Device,
        semaphore: Semaphore,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySemaphore.html
        """
        return self._v1_0.destroy_semaphore(device, semaphore, p_allocator)

    fn create_event(
        self,
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut event: Event,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateEvent.html
        """
        return self._v1_0.create_event(
            device,
            Ptr(to=create_info).bitcast[EventCreateInfo]()[],
            p_allocator,
            Ptr(to=event).bitcast[Event]()[],
        )

    fn destroy_event(
        self, device: Device, event: Event, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyEvent.html
        """
        return self._v1_0.destroy_event(device, event, p_allocator)

    fn get_event_status(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetEventStatus.html
        """
        return self._v1_0.get_event_status(device, event)

    fn set_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSetEvent.html
        """
        return self._v1_0.set_event(device, event)

    fn reset_event(self, device: Device, event: Event) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetEvent.html
        """
        return self._v1_0.reset_event(device, event)

    fn create_query_pool(
        self,
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut query_pool: QueryPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateQueryPool.html
        """
        return self._v1_0.create_query_pool(
            device,
            Ptr(to=create_info).bitcast[QueryPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=query_pool).bitcast[QueryPool]()[],
        )

    fn destroy_query_pool(
        self,
        device: Device,
        query_pool: QueryPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyQueryPool.html
        """
        return self._v1_0.destroy_query_pool(device, query_pool, p_allocator)

    fn get_query_pool_results(
        self,
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetQueryPoolResults.html
        """
        return self._v1_0.get_query_pool_results(
            device, query_pool, first_query, query_count, data_size, p_data, stride, flags
        )

    fn create_buffer(
        self,
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut buffer: Buffer,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBuffer.html
        """
        return self._v1_0.create_buffer(
            device,
            Ptr(to=create_info).bitcast[BufferCreateInfo]()[],
            p_allocator,
            Ptr(to=buffer).bitcast[Buffer]()[],
        )

    fn destroy_buffer(
        self, device: Device, buffer: Buffer, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBuffer.html
        """
        return self._v1_0.destroy_buffer(device, buffer, p_allocator)

    fn create_buffer_view(
        self,
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: BufferView,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateBufferView.html
        """
        return self._v1_0.create_buffer_view(
            device,
            Ptr(to=create_info).bitcast[BufferViewCreateInfo]()[],
            p_allocator,
            Ptr(to=view).bitcast[BufferView]()[],
        )

    fn destroy_buffer_view(
        self,
        device: Device,
        buffer_view: BufferView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyBufferView.html
        """
        return self._v1_0.destroy_buffer_view(device, buffer_view, p_allocator)

    fn create_image(
        self,
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut image: Image,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImage.html
        """
        return self._v1_0.create_image(
            device,
            Ptr(to=create_info).bitcast[ImageCreateInfo]()[],
            p_allocator,
            Ptr(to=image).bitcast[Image]()[],
        )

    fn destroy_image(
        self, device: Device, image: Image, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImage.html
        """
        return self._v1_0.destroy_image(device, image, p_allocator)

    fn get_image_subresource_layout(
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
            Ptr(to=subresource).bitcast[ImageSubresource]()[],
            Ptr(to=layout).bitcast[SubresourceLayout]()[],
        )

    fn create_image_view(
        self,
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut view: ImageView,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateImageView.html
        """
        return self._v1_0.create_image_view(
            device,
            Ptr(to=create_info).bitcast[ImageViewCreateInfo]()[],
            p_allocator,
            Ptr(to=view).bitcast[ImageView]()[],
        )

    fn destroy_image_view(
        self,
        device: Device,
        image_view: ImageView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyImageView.html
        """
        return self._v1_0.destroy_image_view(device, image_view, p_allocator)

    fn create_shader_module(
        self,
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut shader_module: ShaderModule,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateShaderModule.html
        """
        return self._v1_0.create_shader_module(
            device,
            Ptr(to=create_info).bitcast[ShaderModuleCreateInfo]()[],
            p_allocator,
            Ptr(to=shader_module).bitcast[ShaderModule]()[],
        )

    fn destroy_shader_module(
        self,
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyShaderModule.html
        """
        return self._v1_0.destroy_shader_module(device, shader_module, p_allocator)

    fn create_pipeline_cache(
        self,
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut pipeline_cache: PipelineCache,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineCache.html
        """
        return self._v1_0.create_pipeline_cache(
            device,
            Ptr(to=create_info).bitcast[PipelineCacheCreateInfo]()[],
            p_allocator,
            Ptr(to=pipeline_cache).bitcast[PipelineCache]()[],
        )

    fn destroy_pipeline_cache(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineCache.html
        """
        return self._v1_0.destroy_pipeline_cache(device, pipeline_cache, p_allocator)

    fn get_pipeline_cache_data(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        mut data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        return self._v1_0.get_pipeline_cache_data(
            device, pipeline_cache, Ptr(to=data_size).bitcast[UInt]()[], p_data
        )

    fn get_pipeline_cache_data(
        self, device: Device, pipeline_cache: PipelineCache
    ) -> ListResult[UInt8]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPipelineCacheData.html
        """
        var list = List[UInt8]()
        var count: UInt = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_pipeline_cache_data(
                device, pipeline_cache, count, Ptr[NoneType, MutAnyOrigin]()
            )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
            result = self.get_pipeline_cache_data(
                device, pipeline_cache, count, list.unsafe_ptr().bitcast[NoneType]()
            )
        list._len = Int(count)
        return ListResult(list^, result)

    fn merge_pipeline_caches(
        self,
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMergePipelineCaches.html
        """
        return self._v1_0.merge_pipeline_caches(device, dst_cache, src_cache_count, p_src_caches)

    fn create_graphics_pipelines(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateGraphicsPipelines.html
        """
        return self._v1_0.create_graphics_pipelines(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn create_compute_pipelines(
        self,
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateComputePipelines.html
        """
        return self._v1_0.create_compute_pipelines(
            device, pipeline_cache, create_info_count, p_create_infos, p_allocator, p_pipelines
        )

    fn destroy_pipeline(
        self,
        device: Device,
        pipeline: Pipeline,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipeline.html
        """
        return self._v1_0.destroy_pipeline(device, pipeline, p_allocator)

    fn create_pipeline_layout(
        self,
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut pipeline_layout: PipelineLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePipelineLayout.html
        """
        return self._v1_0.create_pipeline_layout(
            device,
            Ptr(to=create_info).bitcast[PipelineLayoutCreateInfo]()[],
            p_allocator,
            Ptr(to=pipeline_layout).bitcast[PipelineLayout]()[],
        )

    fn destroy_pipeline_layout(
        self,
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPipelineLayout.html
        """
        return self._v1_0.destroy_pipeline_layout(device, pipeline_layout, p_allocator)

    fn create_sampler(
        self,
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut sampler: Sampler,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSampler.html
        """
        return self._v1_0.create_sampler(
            device,
            Ptr(to=create_info).bitcast[SamplerCreateInfo]()[],
            p_allocator,
            Ptr(to=sampler).bitcast[Sampler]()[],
        )

    fn destroy_sampler(
        self,
        device: Device,
        sampler: Sampler,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySampler.html
        """
        return self._v1_0.destroy_sampler(device, sampler, p_allocator)

    fn create_descriptor_set_layout(
        self,
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut set_layout: DescriptorSetLayout,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorSetLayout.html
        """
        return self._v1_0.create_descriptor_set_layout(
            device,
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]()[],
            p_allocator,
            Ptr(to=set_layout).bitcast[DescriptorSetLayout]()[],
        )

    fn destroy_descriptor_set_layout(
        self,
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorSetLayout.html
        """
        return self._v1_0.destroy_descriptor_set_layout(device, descriptor_set_layout, p_allocator)

    fn create_descriptor_pool(
        self,
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut descriptor_pool: DescriptorPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorPool.html
        """
        return self._v1_0.create_descriptor_pool(
            device,
            Ptr(to=create_info).bitcast[DescriptorPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=descriptor_pool).bitcast[DescriptorPool]()[],
        )

    fn destroy_descriptor_pool(
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorPool.html
        """
        return self._v1_0.destroy_descriptor_pool(device, descriptor_pool, p_allocator)

    fn reset_descriptor_pool(
        self, device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetDescriptorPool.html
        """
        return self._v1_0.reset_descriptor_pool(device, descriptor_pool, flags)

    fn allocate_descriptor_sets(
        self,
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateDescriptorSets.html
        """
        return self._v1_0.allocate_descriptor_sets(
            device, Ptr(to=allocate_info).bitcast[DescriptorSetAllocateInfo]()[], p_descriptor_sets
        )

    fn free_descriptor_sets(
        self,
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeDescriptorSets.html
        """
        return self._v1_0.free_descriptor_sets(
            device, descriptor_pool, descriptor_set_count, p_descriptor_sets
        )

    fn update_descriptor_sets(
        self,
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSets.html
        """
        return self._v1_0.update_descriptor_sets(
            device,
            descriptor_write_count,
            p_descriptor_writes,
            descriptor_copy_count,
            p_descriptor_copies,
        )

    fn create_framebuffer(
        self,
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut framebuffer: Framebuffer,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateFramebuffer.html
        """
        return self._v1_0.create_framebuffer(
            device,
            Ptr(to=create_info).bitcast[FramebufferCreateInfo]()[],
            p_allocator,
            Ptr(to=framebuffer).bitcast[Framebuffer]()[],
        )

    fn destroy_framebuffer(
        self,
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyFramebuffer.html
        """
        return self._v1_0.destroy_framebuffer(device, framebuffer, p_allocator)

    fn create_render_pass(
        self,
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass.html
        """
        return self._v1_0.create_render_pass(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo]()[],
            p_allocator,
            Ptr(to=render_pass).bitcast[RenderPass]()[],
        )

    fn destroy_render_pass(
        self,
        device: Device,
        render_pass: RenderPass,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyRenderPass.html
        """
        return self._v1_0.destroy_render_pass(device, render_pass, p_allocator)

    fn get_render_area_granularity(
        self, device: Device, render_pass: RenderPass, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderAreaGranularity.html
        """
        return self._v1_0.get_render_area_granularity(
            device, render_pass, Ptr(to=granularity).bitcast[Extent2D]()[]
        )

    fn create_command_pool(
        self,
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut command_pool: CommandPool,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateCommandPool.html
        """
        return self._v1_0.create_command_pool(
            device,
            Ptr(to=create_info).bitcast[CommandPoolCreateInfo]()[],
            p_allocator,
            Ptr(to=command_pool).bitcast[CommandPool]()[],
        )

    fn destroy_command_pool(
        self,
        device: Device,
        command_pool: CommandPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyCommandPool.html
        """
        return self._v1_0.destroy_command_pool(device, command_pool, p_allocator)

    fn reset_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandPool.html
        """
        return self._v1_0.reset_command_pool(device, command_pool, flags)

    fn allocate_command_buffers(
        self,
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkAllocateCommandBuffers.html
        """
        return self._v1_0.allocate_command_buffers(
            device, Ptr(to=allocate_info).bitcast[CommandBufferAllocateInfo]()[], p_command_buffers
        )

    fn free_command_buffers(
        self,
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkFreeCommandBuffers.html
        """
        return self._v1_0.free_command_buffers(
            device, command_pool, command_buffer_count, p_command_buffers
        )

    fn begin_command_buffer(
        self, command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBeginCommandBuffer.html
        """
        return self._v1_0.begin_command_buffer(
            command_buffer, Ptr(to=begin_info).bitcast[CommandBufferBeginInfo]()[]
        )

    fn end_command_buffer(self, command_buffer: CommandBuffer) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEndCommandBuffer.html
        """
        return self._v1_0.end_command_buffer(command_buffer)

    fn reset_command_buffer(
        self, command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetCommandBuffer.html
        """
        return self._v1_0.reset_command_buffer(command_buffer, flags)

    fn cmd_bind_pipeline(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        pipeline: Pipeline,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindPipeline.html
        """
        return self._v1_0.cmd_bind_pipeline(command_buffer, pipeline_bind_point, pipeline)

    fn cmd_set_viewport(
        self,
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewport.html
        """
        return self._v1_0.cmd_set_viewport(
            command_buffer, first_viewport, viewport_count, p_viewports
        )

    fn cmd_set_scissor(
        self,
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissor.html
        """
        return self._v1_0.cmd_set_scissor(command_buffer, first_scissor, scissor_count, p_scissors)

    fn cmd_set_line_width(self, command_buffer: CommandBuffer, line_width: Float32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineWidth.html
        """
        return self._v1_0.cmd_set_line_width(command_buffer, line_width)

    fn cmd_set_depth_bias(
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

    fn cmd_set_blend_constants(
        self, command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetBlendConstants.html
        """
        return self._v1_0.cmd_set_blend_constants(command_buffer, blend_constants)

    fn cmd_set_depth_bounds(
        self, command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBounds.html
        """
        return self._v1_0.cmd_set_depth_bounds(command_buffer, min_depth_bounds, max_depth_bounds)

    fn cmd_set_stencil_compare_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilCompareMask.html
        """
        return self._v1_0.cmd_set_stencil_compare_mask(command_buffer, face_mask, compare_mask)

    fn cmd_set_stencil_write_mask(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilWriteMask.html
        """
        return self._v1_0.cmd_set_stencil_write_mask(command_buffer, face_mask, write_mask)

    fn cmd_set_stencil_reference(
        self, command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilReference.html
        """
        return self._v1_0.cmd_set_stencil_reference(command_buffer, face_mask, reference)

    fn cmd_bind_descriptor_sets(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, ImmutAnyOrigin],
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
            p_descriptor_sets,
            dynamic_offset_count,
            p_dynamic_offsets,
        )

    fn cmd_bind_index_buffer(
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

    fn cmd_bind_vertex_buffers(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers.html
        """
        return self._v1_0.cmd_bind_vertex_buffers(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets
        )

    fn cmd_draw(
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

    fn cmd_draw_indexed(
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

    fn cmd_draw_indirect(
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

    fn cmd_draw_indexed_indirect(
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
        return self._v1_0.cmd_draw_indexed_indirect(
            command_buffer, buffer, offset, draw_count, stride
        )

    fn cmd_dispatch(
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

    fn cmd_dispatch_indirect(
        self, command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdDispatchIndirect.html
        """
        return self._v1_0.cmd_dispatch_indirect(command_buffer, buffer, offset)

    fn cmd_copy_buffer(
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer.html
        """
        return self._v1_0.cmd_copy_buffer(
            command_buffer, src_buffer, dst_buffer, region_count, p_regions
        )

    fn cmd_copy_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, ImmutAnyOrigin],
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
            p_regions,
        )

    fn cmd_blit_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, ImmutAnyOrigin],
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
            p_regions,
            filter,
        )

    fn cmd_copy_buffer_to_image(
        self,
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage.html
        """
        return self._v1_0.cmd_copy_buffer_to_image(
            command_buffer, src_buffer, dst_image, dst_image_layout, region_count, p_regions
        )

    fn cmd_copy_image_to_buffer(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer.html
        """
        return self._v1_0.cmd_copy_image_to_buffer(
            command_buffer, src_image, src_image_layout, dst_buffer, region_count, p_regions
        )

    fn cmd_update_buffer(
        self,
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdUpdateBuffer.html
        """
        return self._v1_0.cmd_update_buffer(
            command_buffer, dst_buffer, dst_offset, data_size, p_data
        )

    fn cmd_fill_buffer(
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

    fn cmd_clear_color_image(
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearColorImage.html
        """
        return self._v1_0.cmd_clear_color_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=color).bitcast[ClearColorValue]()[],
            range_count,
            p_ranges,
        )

    fn cmd_clear_depth_stencil_image(
        self,
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearDepthStencilImage.html
        """
        return self._v1_0.cmd_clear_depth_stencil_image(
            command_buffer,
            image,
            image_layout,
            Ptr(to=depth_stencil).bitcast[ClearDepthStencilValue]()[],
            range_count,
            p_ranges,
        )

    fn cmd_clear_attachments(
        self,
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, ImmutAnyOrigin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdClearAttachments.html
        """
        return self._v1_0.cmd_clear_attachments(
            command_buffer, attachment_count, p_attachments, rect_count, p_rects
        )

    fn cmd_resolve_image(
        self,
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, ImmutAnyOrigin],
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
            p_regions,
        )

    fn cmd_set_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent.html
        """
        return self._v1_0.cmd_set_event(command_buffer, event, stage_mask)

    fn cmd_reset_event(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent.html
        """
        return self._v1_0.cmd_reset_event(command_buffer, event, stage_mask)

    fn cmd_wait_events(
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents.html
        """
        return self._v1_0.cmd_wait_events(
            command_buffer,
            event_count,
            p_events,
            src_stage_mask,
            dst_stage_mask,
            memory_barrier_count,
            p_memory_barriers,
            buffer_memory_barrier_count,
            p_buffer_memory_barriers,
            image_memory_barrier_count,
            p_image_memory_barriers,
        )

    fn cmd_pipeline_barrier(
        self,
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
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
            p_memory_barriers,
            buffer_memory_barrier_count,
            p_buffer_memory_barriers,
            image_memory_barrier_count,
            p_image_memory_barriers,
        )

    fn cmd_begin_query(
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

    fn cmd_end_query(self, command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndQuery.html
        """
        return self._v1_0.cmd_end_query(command_buffer, query_pool, query)

    fn cmd_reset_query_pool(
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

    fn cmd_write_timestamp(
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

    fn cmd_copy_query_pool_results(
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
            command_buffer,
            query_pool,
            first_query,
            query_count,
            dst_buffer,
            dst_offset,
            stride,
            flags,
        )

    fn cmd_push_constants(
        self,
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants.html
        """
        return self._v1_0.cmd_push_constants(
            command_buffer, layout, stage_flags, offset, size, p_values
        )

    fn cmd_begin_render_pass(
        self,
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRenderPass.html
        """
        return self._v1_0.cmd_begin_render_pass(
            command_buffer, Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]()[], contents
        )

    fn cmd_next_subpass(self, command_buffer: CommandBuffer, contents: SubpassContents):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdNextSubpass.html
        """
        return self._v1_0.cmd_next_subpass(command_buffer, contents)

    fn cmd_end_render_pass(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass.html
        """
        return self._v1_0.cmd_end_render_pass(command_buffer)

    fn cmd_execute_commands(
        self,
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdExecuteCommands.html
        """
        return self._v1_0.cmd_execute_commands(
            command_buffer, command_buffer_count, p_command_buffers
        )

    fn bind_buffer_memory_2(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindBufferMemory2.html
        """
        return self._v1_1.bind_buffer_memory_2(device, bind_info_count, p_bind_infos)

    fn bind_image_memory_2(
        self,
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkBindImageMemory2.html
        """
        return self._v1_1.bind_image_memory_2(device, bind_info_count, p_bind_infos)

    fn get_device_group_peer_memory_features(
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
            Ptr(to=peer_memory_features).bitcast[PeerMemoryFeatureFlags]()[],
        )

    fn cmd_set_device_mask(self, command_buffer: CommandBuffer, device_mask: UInt32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDeviceMask.html
        """
        return self._v1_1.cmd_set_device_mask(command_buffer, device_mask)

    fn cmd_dispatch_base(
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

    fn get_image_memory_requirements_2(
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
            Ptr(to=info).bitcast[ImageMemoryRequirementsInfo2]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_buffer_memory_requirements_2(
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
            Ptr(to=info).bitcast[BufferMemoryRequirementsInfo2]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_image_sparse_memory_requirements_2(
        self,
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        return self._v1_1.get_image_sparse_memory_requirements_2(
            device,
            Ptr(to=info).bitcast[ImageSparseMemoryRequirementsInfo2]()[],
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_image_sparse_memory_requirements_2(
        self, device: Device, info: ImageSparseMemoryRequirementsInfo2
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetImageSparseMemoryRequirements2.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self.get_image_sparse_memory_requirements_2(
            device, info, count, Ptr[SparseImageMemoryRequirements2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_image_sparse_memory_requirements_2(device, info, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn trim_command_pool(
        self, device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTrimCommandPool.html
        """
        return self._v1_1.trim_command_pool(device, command_pool, flags)

    fn get_device_queue_2(self, device: Device, queue_info: DeviceQueueInfo2, mut queue: Queue):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceQueue2.html
        """
        return self._v1_1.get_device_queue_2(
            device,
            Ptr(to=queue_info).bitcast[DeviceQueueInfo2]()[],
            Ptr(to=queue).bitcast[Queue]()[],
        )

    fn create_sampler_ycbcr_conversion(
        self,
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateSamplerYcbcrConversion.html
        """
        return self._v1_1.create_sampler_ycbcr_conversion(
            device,
            Ptr(to=create_info).bitcast[SamplerYcbcrConversionCreateInfo]()[],
            p_allocator,
            Ptr(to=ycbcr_conversion).bitcast[SamplerYcbcrConversion]()[],
        )

    fn destroy_sampler_ycbcr_conversion(
        self,
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroySamplerYcbcrConversion.html
        """
        return self._v1_1.destroy_sampler_ycbcr_conversion(device, ycbcr_conversion, p_allocator)

    fn create_descriptor_update_template(
        self,
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateDescriptorUpdateTemplate.html
        """
        return self._v1_1.create_descriptor_update_template(
            device,
            Ptr(to=create_info).bitcast[DescriptorUpdateTemplateCreateInfo]()[],
            p_allocator,
            Ptr(to=descriptor_update_template).bitcast[DescriptorUpdateTemplate]()[],
        )

    fn destroy_descriptor_update_template(
        self,
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyDescriptorUpdateTemplate.html
        """
        return self._v1_1.destroy_descriptor_update_template(
            device, descriptor_update_template, p_allocator
        )

    fn update_descriptor_set_with_template(
        self,
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUpdateDescriptorSetWithTemplate.html
        """
        return self._v1_1.update_descriptor_set_with_template(
            device, descriptor_set, descriptor_update_template, p_data
        )

    fn get_descriptor_set_layout_support(
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
            Ptr(to=create_info).bitcast[DescriptorSetLayoutCreateInfo]()[],
            Ptr(to=support).bitcast[DescriptorSetLayoutSupport]()[],
        )

    fn cmd_draw_indirect_count(
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
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )

    fn cmd_draw_indexed_indirect_count(
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
            command_buffer,
            buffer,
            offset,
            count_buffer,
            count_buffer_offset,
            max_draw_count,
            stride,
        )

    fn create_render_pass_2(
        self,
        device: Device,
        create_info: RenderPassCreateInfo2,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut render_pass: RenderPass,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreateRenderPass2.html
        """
        return self._v1_2.create_render_pass_2(
            device,
            Ptr(to=create_info).bitcast[RenderPassCreateInfo2]()[],
            p_allocator,
            Ptr(to=render_pass).bitcast[RenderPass]()[],
        )

    fn cmd_begin_render_pass_2(
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
            Ptr(to=render_pass_begin).bitcast[RenderPassBeginInfo]()[],
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]()[],
        )

    fn cmd_next_subpass_2(
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
            Ptr(to=subpass_begin_info).bitcast[SubpassBeginInfo]()[],
            Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]()[],
        )

    fn cmd_end_render_pass_2(self, command_buffer: CommandBuffer, subpass_end_info: SubpassEndInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRenderPass2.html
        """
        return self._v1_2.cmd_end_render_pass_2(
            command_buffer, Ptr(to=subpass_end_info).bitcast[SubpassEndInfo]()[]
        )

    fn reset_query_pool(
        self, device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkResetQueryPool.html
        """
        return self._v1_2.reset_query_pool(device, query_pool, first_query, query_count)

    fn get_semaphore_counter_value(
        self, device: Device, semaphore: Semaphore, mut value: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetSemaphoreCounterValue.html
        """
        return self._v1_2.get_semaphore_counter_value(
            device, semaphore, Ptr(to=value).bitcast[UInt64]()[]
        )

    fn wait_semaphores(
        self, device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkWaitSemaphores.html
        """
        return self._v1_2.wait_semaphores(
            device, Ptr(to=wait_info).bitcast[SemaphoreWaitInfo]()[], timeout
        )

    fn signal_semaphore(self, device: Device, signal_info: SemaphoreSignalInfo) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkSignalSemaphore.html
        """
        return self._v1_2.signal_semaphore(
            device, Ptr(to=signal_info).bitcast[SemaphoreSignalInfo]()[]
        )

    fn get_buffer_device_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferDeviceAddress.html
        """
        return self._v1_2.get_buffer_device_address(
            device, Ptr(to=info).bitcast[BufferDeviceAddressInfo]()[]
        )

    fn get_buffer_opaque_capture_address(
        self, device: Device, info: BufferDeviceAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetBufferOpaqueCaptureAddress.html
        """
        return self._v1_2.get_buffer_opaque_capture_address(
            device, Ptr(to=info).bitcast[BufferDeviceAddressInfo]()[]
        )

    fn get_device_memory_opaque_capture_address(
        self, device: Device, info: DeviceMemoryOpaqueCaptureAddressInfo
    ) -> UInt64:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceMemoryOpaqueCaptureAddress.html
        """
        return self._v1_2.get_device_memory_opaque_capture_address(
            device, Ptr(to=info).bitcast[DeviceMemoryOpaqueCaptureAddressInfo]()[]
        )

    fn create_private_data_slot(
        self,
        device: Device,
        create_info: PrivateDataSlotCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        mut private_data_slot: PrivateDataSlot,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCreatePrivateDataSlot.html
        """
        return self._v1_3.create_private_data_slot(
            device,
            Ptr(to=create_info).bitcast[PrivateDataSlotCreateInfo]()[],
            p_allocator,
            Ptr(to=private_data_slot).bitcast[PrivateDataSlot]()[],
        )

    fn destroy_private_data_slot(
        self,
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkDestroyPrivateDataSlot.html
        """
        return self._v1_3.destroy_private_data_slot(device, private_data_slot, p_allocator)

    fn set_private_data(
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
        return self._v1_3.set_private_data(
            device, object_type, object_handle, private_data_slot, data
        )

    fn get_private_data(
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
            device, object_type, object_handle, private_data_slot, Ptr(to=data).bitcast[UInt64]()[]
        )

    fn cmd_set_event_2(
        self, command_buffer: CommandBuffer, event: Event, dependency_info: DependencyInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetEvent2.html
        """
        return self._v1_3.cmd_set_event_2(
            command_buffer, event, Ptr(to=dependency_info).bitcast[DependencyInfo]()[]
        )

    fn cmd_reset_event_2(
        self, command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResetEvent2.html
        """
        return self._v1_3.cmd_reset_event_2(command_buffer, event, stage_mask)

    fn cmd_wait_events_2(
        self,
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        p_dependency_infos: Ptr[DependencyInfo, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdWaitEvents2.html
        """
        return self._v1_3.cmd_wait_events_2(
            command_buffer, event_count, p_events, p_dependency_infos
        )

    fn cmd_pipeline_barrier_2(self, command_buffer: CommandBuffer, dependency_info: DependencyInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPipelineBarrier2.html
        """
        return self._v1_3.cmd_pipeline_barrier_2(
            command_buffer, Ptr(to=dependency_info).bitcast[DependencyInfo]()[]
        )

    fn cmd_write_timestamp_2(
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

    fn queue_submit_2(
        self,
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo2, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkQueueSubmit2.html
        """
        return self._v1_3.queue_submit_2(queue, submit_count, p_submits, fence)

    fn cmd_copy_buffer_2(self, command_buffer: CommandBuffer, copy_buffer_info: CopyBufferInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBuffer2.html
        """
        return self._v1_3.cmd_copy_buffer_2(
            command_buffer, Ptr(to=copy_buffer_info).bitcast[CopyBufferInfo2]()[]
        )

    fn cmd_copy_image_2(self, command_buffer: CommandBuffer, copy_image_info: CopyImageInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImage2.html
        """
        return self._v1_3.cmd_copy_image_2(
            command_buffer, Ptr(to=copy_image_info).bitcast[CopyImageInfo2]()[]
        )

    fn cmd_copy_buffer_to_image_2(
        self, command_buffer: CommandBuffer, copy_buffer_to_image_info: CopyBufferToImageInfo2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyBufferToImage2.html
        """
        return self._v1_3.cmd_copy_buffer_to_image_2(
            command_buffer, Ptr(to=copy_buffer_to_image_info).bitcast[CopyBufferToImageInfo2]()[]
        )

    fn cmd_copy_image_to_buffer_2(
        self, command_buffer: CommandBuffer, copy_image_to_buffer_info: CopyImageToBufferInfo2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdCopyImageToBuffer2.html
        """
        return self._v1_3.cmd_copy_image_to_buffer_2(
            command_buffer, Ptr(to=copy_image_to_buffer_info).bitcast[CopyImageToBufferInfo2]()[]
        )

    fn cmd_blit_image_2(self, command_buffer: CommandBuffer, blit_image_info: BlitImageInfo2):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBlitImage2.html
        """
        return self._v1_3.cmd_blit_image_2(
            command_buffer, Ptr(to=blit_image_info).bitcast[BlitImageInfo2]()[]
        )

    fn cmd_resolve_image_2(
        self, command_buffer: CommandBuffer, resolve_image_info: ResolveImageInfo2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdResolveImage2.html
        """
        return self._v1_3.cmd_resolve_image_2(
            command_buffer, Ptr(to=resolve_image_info).bitcast[ResolveImageInfo2]()[]
        )

    fn cmd_begin_rendering(self, command_buffer: CommandBuffer, rendering_info: RenderingInfo):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBeginRendering.html
        """
        return self._v1_3.cmd_begin_rendering(
            command_buffer, Ptr(to=rendering_info).bitcast[RenderingInfo]()[]
        )

    fn cmd_end_rendering(self, command_buffer: CommandBuffer):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdEndRendering.html
        """
        return self._v1_3.cmd_end_rendering(command_buffer)

    fn cmd_set_cull_mode(self, command_buffer: CommandBuffer, cull_mode: CullModeFlags):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetCullMode.html
        """
        return self._v1_3.cmd_set_cull_mode(command_buffer, cull_mode)

    fn cmd_set_front_face(self, command_buffer: CommandBuffer, front_face: FrontFace):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetFrontFace.html
        """
        return self._v1_3.cmd_set_front_face(command_buffer, front_face)

    fn cmd_set_primitive_topology(
        self, command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveTopology.html
        """
        return self._v1_3.cmd_set_primitive_topology(command_buffer, primitive_topology)

    fn cmd_set_viewport_with_count(
        self,
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetViewportWithCount.html
        """
        return self._v1_3.cmd_set_viewport_with_count(command_buffer, viewport_count, p_viewports)

    fn cmd_set_scissor_with_count(
        self,
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetScissorWithCount.html
        """
        return self._v1_3.cmd_set_scissor_with_count(command_buffer, scissor_count, p_scissors)

    fn cmd_bind_vertex_buffers_2(
        self,
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
        p_sizes: Ptr[DeviceSize, ImmutAnyOrigin],
        p_strides: Ptr[DeviceSize, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindVertexBuffers2.html
        """
        return self._v1_3.cmd_bind_vertex_buffers_2(
            command_buffer, first_binding, binding_count, p_buffers, p_offsets, p_sizes, p_strides
        )

    fn cmd_set_depth_test_enable(self, command_buffer: CommandBuffer, depth_test_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthTestEnable.html
        """
        return self._v1_3.cmd_set_depth_test_enable(command_buffer, depth_test_enable)

    fn cmd_set_depth_write_enable(self, command_buffer: CommandBuffer, depth_write_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthWriteEnable.html
        """
        return self._v1_3.cmd_set_depth_write_enable(command_buffer, depth_write_enable)

    fn cmd_set_depth_compare_op(self, command_buffer: CommandBuffer, depth_compare_op: CompareOp):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthCompareOp.html
        """
        return self._v1_3.cmd_set_depth_compare_op(command_buffer, depth_compare_op)

    fn cmd_set_depth_bounds_test_enable(
        self, command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBoundsTestEnable.html
        """
        return self._v1_3.cmd_set_depth_bounds_test_enable(command_buffer, depth_bounds_test_enable)

    fn cmd_set_stencil_test_enable(
        self, command_buffer: CommandBuffer, stencil_test_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetStencilTestEnable.html
        """
        return self._v1_3.cmd_set_stencil_test_enable(command_buffer, stencil_test_enable)

    fn cmd_set_stencil_op(
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

    fn cmd_set_rasterizer_discard_enable(
        self, command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRasterizerDiscardEnable.html
        """
        return self._v1_3.cmd_set_rasterizer_discard_enable(
            command_buffer, rasterizer_discard_enable
        )

    fn cmd_set_depth_bias_enable(self, command_buffer: CommandBuffer, depth_bias_enable: Bool32):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetDepthBiasEnable.html
        """
        return self._v1_3.cmd_set_depth_bias_enable(command_buffer, depth_bias_enable)

    fn cmd_set_primitive_restart_enable(
        self, command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetPrimitiveRestartEnable.html
        """
        return self._v1_3.cmd_set_primitive_restart_enable(command_buffer, primitive_restart_enable)

    fn get_device_buffer_memory_requirements(
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
            Ptr(to=info).bitcast[DeviceBufferMemoryRequirements]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_device_image_memory_requirements(
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
            Ptr(to=info).bitcast[DeviceImageMemoryRequirements]()[],
            Ptr(to=memory_requirements).bitcast[MemoryRequirements2]()[],
        )

    fn get_device_image_sparse_memory_requirements(
        self,
        device: Device,
        info: DeviceImageMemoryRequirements,
        mut sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        return self._v1_3.get_device_image_sparse_memory_requirements(
            device,
            Ptr(to=info).bitcast[DeviceImageMemoryRequirements]()[],
            Ptr(to=sparse_memory_requirement_count).bitcast[UInt32]()[],
            p_sparse_memory_requirements,
        )

    fn get_device_image_sparse_memory_requirements(
        self, device: Device, info: DeviceImageMemoryRequirements
    ) -> List[SparseImageMemoryRequirements2]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSparseMemoryRequirements.html
        """
        var list = List[SparseImageMemoryRequirements2]()
        var count: UInt32 = 0
        self.get_device_image_sparse_memory_requirements(
            device, info, count, Ptr[SparseImageMemoryRequirements2, MutAnyOrigin]()
        )
        list.reserve(Int(count))
        self.get_device_image_sparse_memory_requirements(device, info, count, list.unsafe_ptr())
        list._len = Int(count)
        return list^

    fn cmd_set_line_stipple(
        self,
        command_buffer: CommandBuffer,
        line_stipple_factor: UInt32,
        line_stipple_pattern: UInt16,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetLineStipple.html
        """
        return self._v1_4.cmd_set_line_stipple(
            command_buffer, line_stipple_factor, line_stipple_pattern
        )

    fn map_memory_2(
        self,
        device: Device,
        memory_map_info: MemoryMapInfo,
        mut p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkMapMemory2.html
        """
        return self._v1_4.map_memory_2(
            device,
            Ptr(to=memory_map_info).bitcast[MemoryMapInfo]()[],
            Ptr(to=p_data).bitcast[Ptr[NoneType, MutAnyOrigin]]()[],
        )

    fn unmap_memory_2(self, device: Device, memory_unmap_info: MemoryUnmapInfo) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkUnmapMemory2.html
        """
        return self._v1_4.unmap_memory_2(
            device, Ptr(to=memory_unmap_info).bitcast[MemoryUnmapInfo]()[]
        )

    fn cmd_bind_index_buffer_2(
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

    fn get_rendering_area_granularity(
        self, device: Device, rendering_area_info: RenderingAreaInfo, mut granularity: Extent2D
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRenderingAreaGranularity.html
        """
        return self._v1_4.get_rendering_area_granularity(
            device,
            Ptr(to=rendering_area_info).bitcast[RenderingAreaInfo]()[],
            Ptr(to=granularity).bitcast[Extent2D]()[],
        )

    fn get_device_image_subresource_layout(
        self, device: Device, info: DeviceImageSubresourceInfo, mut layout: SubresourceLayout2
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetDeviceImageSubresourceLayout.html
        """
        return self._v1_4.get_device_image_subresource_layout(
            device,
            Ptr(to=info).bitcast[DeviceImageSubresourceInfo]()[],
            Ptr(to=layout).bitcast[SubresourceLayout2]()[],
        )

    fn get_image_subresource_layout_2(
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
            Ptr(to=subresource).bitcast[ImageSubresource2]()[],
            Ptr(to=layout).bitcast[SubresourceLayout2]()[],
        )

    fn cmd_push_descriptor_set(
        self,
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
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
            p_descriptor_writes,
        )

    fn cmd_push_descriptor_set_with_template(
        self,
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate.html
        """
        return self._v1_4.cmd_push_descriptor_set_with_template(
            command_buffer, descriptor_update_template, layout, set, p_data
        )

    fn cmd_set_rendering_attachment_locations(
        self, command_buffer: CommandBuffer, location_info: RenderingAttachmentLocationInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRenderingAttachmentLocations.html
        """
        return self._v1_4.cmd_set_rendering_attachment_locations(
            command_buffer, Ptr(to=location_info).bitcast[RenderingAttachmentLocationInfo]()[]
        )

    fn cmd_set_rendering_input_attachment_indices(
        self,
        command_buffer: CommandBuffer,
        input_attachment_index_info: RenderingInputAttachmentIndexInfo,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdSetRenderingInputAttachmentIndices.html
        """
        return self._v1_4.cmd_set_rendering_input_attachment_indices(
            command_buffer,
            Ptr(to=input_attachment_index_info).bitcast[RenderingInputAttachmentIndexInfo]()[],
        )

    fn cmd_bind_descriptor_sets_2(
        self, command_buffer: CommandBuffer, bind_descriptor_sets_info: BindDescriptorSetsInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdBindDescriptorSets2.html
        """
        return self._v1_4.cmd_bind_descriptor_sets_2(
            command_buffer, Ptr(to=bind_descriptor_sets_info).bitcast[BindDescriptorSetsInfo]()[]
        )

    fn cmd_push_constants_2(
        self, command_buffer: CommandBuffer, push_constants_info: PushConstantsInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushConstants2.html
        """
        return self._v1_4.cmd_push_constants_2(
            command_buffer, Ptr(to=push_constants_info).bitcast[PushConstantsInfo]()[]
        )

    fn cmd_push_descriptor_set_2(
        self, command_buffer: CommandBuffer, push_descriptor_set_info: PushDescriptorSetInfo
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSet2.html
        """
        return self._v1_4.cmd_push_descriptor_set_2(
            command_buffer, Ptr(to=push_descriptor_set_info).bitcast[PushDescriptorSetInfo]()[]
        )

    fn cmd_push_descriptor_set_with_template_2(
        self,
        command_buffer: CommandBuffer,
        push_descriptor_set_with_template_info: PushDescriptorSetWithTemplateInfo,
    ):
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCmdPushDescriptorSetWithTemplate2.html
        """
        return self._v1_4.cmd_push_descriptor_set_with_template_2(
            command_buffer,
            Ptr(to=push_descriptor_set_with_template_info).bitcast[PushDescriptorSetWithTemplateInfo]()[],
        )

    fn copy_memory_to_image(
        self, device: Device, copy_memory_to_image_info: CopyMemoryToImageInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyMemoryToImage.html
        """
        return self._v1_4.copy_memory_to_image(
            device, Ptr(to=copy_memory_to_image_info).bitcast[CopyMemoryToImageInfo]()[]
        )

    fn copy_image_to_memory(
        self, device: Device, copy_image_to_memory_info: CopyImageToMemoryInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyImageToMemory.html
        """
        return self._v1_4.copy_image_to_memory(
            device, Ptr(to=copy_image_to_memory_info).bitcast[CopyImageToMemoryInfo]()[]
        )

    fn copy_image_to_image(
        self, device: Device, copy_image_to_image_info: CopyImageToImageInfo
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkCopyImageToImage.html
        """
        return self._v1_4.copy_image_to_image(
            device, Ptr(to=copy_image_to_image_info).bitcast[CopyImageToImageInfo]()[]
        )

    fn transition_image_layout(
        self,
        device: Device,
        transition_count: UInt32,
        p_transitions: Ptr[HostImageLayoutTransitionInfo, ImmutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkTransitionImageLayout.html
        """
        return self._v1_4.transition_image_layout(device, transition_count, p_transitions)


struct GlobalFunctionAdditionsV1_0(Movable):
    var create_instance: fn(
        create_info: InstanceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        instance: Instance,
    ) -> Result
    var get_instance_proc_addr: fn(
        instance: Instance, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction
    var enumerate_instance_extension_properties: fn(
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result
    var enumerate_instance_layer_properties: fn(
        property_count: UInt32, p_properties: Ptr[LayerProperties, MutAnyOrigin]
    ) -> Result

    fn __init__(out self, dlhandle: OwnedDLHandle):
        get_instance_proc_addr = dlhandle.get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self.create_instance = Ptr(to=get_instance_proc_addr(
            Instance.NULL, "vkCreateInstance".unsafe_ptr()
        )).bitcast[type_of(self.create_instance)]()[]
        self.get_instance_proc_addr = Ptr(to=get_instance_proc_addr(
            Instance.NULL, "vkGetInstanceProcAddr".unsafe_ptr()
        )).bitcast[type_of(self.get_instance_proc_addr)]()[]
        self.enumerate_instance_extension_properties = Ptr(to=get_instance_proc_addr(
            Instance.NULL, "vkEnumerateInstanceExtensionProperties".unsafe_ptr()
        )).bitcast[type_of(self.enumerate_instance_extension_properties)]()[]
        self.enumerate_instance_layer_properties = Ptr(to=get_instance_proc_addr(
            Instance.NULL, "vkEnumerateInstanceLayerProperties".unsafe_ptr()
        )).bitcast[type_of(self.enumerate_instance_layer_properties)]()[]


struct GlobalFunctionAdditionsV1_1(Movable):
    var enumerate_instance_version: fn(api_version: Version) -> Result

    fn __init__(out self, dlhandle: OwnedDLHandle):
        get_instance_proc_addr = dlhandle.get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self.enumerate_instance_version = Ptr(to=get_instance_proc_addr(
            Instance.NULL, "vkEnumerateInstanceVersion".unsafe_ptr()
        )).bitcast[type_of(self.enumerate_instance_version)]()[]


struct InstanceFunctionAdditionsV1_0(Movable):
    var destroy_instance: fn(
        instance: Instance, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var enumerate_physical_devices: fn(
        instance: Instance,
        physical_device_count: UInt32,
        p_physical_devices: Ptr[PhysicalDevice, MutAnyOrigin],
    ) -> Result
    var get_physical_device_features: fn(
        physical_device: PhysicalDevice, features: PhysicalDeviceFeatures
    )
    var get_physical_device_format_properties: fn(
        physical_device: PhysicalDevice, format: Format, format_properties: FormatProperties
    )
    var get_physical_device_image_format_properties: fn(
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        tiling: ImageTiling,
        usage: ImageUsageFlags,
        flags: ImageCreateFlags,
        image_format_properties: ImageFormatProperties,
    ) -> Result
    var get_physical_device_properties: fn(
        physical_device: PhysicalDevice, properties: PhysicalDeviceProperties
    )
    var get_physical_device_queue_family_properties: fn(
        physical_device: PhysicalDevice,
        queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties, MutAnyOrigin],
    )
    var get_physical_device_memory_properties: fn(
        physical_device: PhysicalDevice, memory_properties: PhysicalDeviceMemoryProperties
    )
    var get_device_proc_addr: fn(
        device: Device, p_name: CStringSlice[ImmutAnyOrigin]
    ) -> PFN_vkVoidFunction
    var create_device: fn(
        physical_device: PhysicalDevice,
        create_info: DeviceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        device: Device,
    ) -> Result
    var enumerate_device_extension_properties: fn(
        physical_device: PhysicalDevice,
        p_layer_name: CStringSlice[ImmutAnyOrigin],
        property_count: UInt32,
        p_properties: Ptr[ExtensionProperties, MutAnyOrigin],
    ) -> Result
    var enumerate_device_layer_properties: fn(
        physical_device: PhysicalDevice,
        property_count: UInt32,
        p_properties: Ptr[LayerProperties, MutAnyOrigin],
    ) -> Result
    var get_physical_device_sparse_image_format_properties: fn(
        physical_device: PhysicalDevice,
        format: Format,
        type: ImageType,
        samples: SampleCountFlagBits,
        usage: ImageUsageFlags,
        tiling: ImageTiling,
        property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties, MutAnyOrigin],
    )

    fn __init__(out self, instance: Instance, dlhandle: OwnedDLHandle):
        get_instance_proc_addr = dlhandle.get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self.destroy_instance = Ptr(to=get_instance_proc_addr(
            instance, "vkDestroyInstance".unsafe_ptr()
        )).bitcast[type_of(self.destroy_instance)]()[]
        self.enumerate_physical_devices = Ptr(to=get_instance_proc_addr(
            instance, "vkEnumeratePhysicalDevices".unsafe_ptr()
        )).bitcast[type_of(self.enumerate_physical_devices)]()[]
        self.get_physical_device_features = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFeatures".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_features)]()[]
        self.get_physical_device_format_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFormatProperties".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_format_properties)]()[]
        self.get_physical_device_image_format_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceImageFormatProperties".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_image_format_properties)]()[]
        self.get_physical_device_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceProperties".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_properties)]()[]
        self.get_physical_device_queue_family_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceQueueFamilyProperties".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_queue_family_properties)]()[]
        self.get_physical_device_memory_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceMemoryProperties".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_memory_properties)]()[]
        self.get_device_proc_addr = Ptr(to=get_instance_proc_addr(
            instance, "vkGetDeviceProcAddr".unsafe_ptr()
        )).bitcast[type_of(self.get_device_proc_addr)]()[]
        self.create_device = Ptr(to=get_instance_proc_addr(
            instance, "vkCreateDevice".unsafe_ptr()
        )).bitcast[type_of(self.create_device)]()[]
        self.enumerate_device_extension_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkEnumerateDeviceExtensionProperties".unsafe_ptr()
        )).bitcast[type_of(self.enumerate_device_extension_properties)]()[]
        self.enumerate_device_layer_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkEnumerateDeviceLayerProperties".unsafe_ptr()
        )).bitcast[type_of(self.enumerate_device_layer_properties)]()[]
        self.get_physical_device_sparse_image_format_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSparseImageFormatProperties".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_sparse_image_format_properties)]()[]


struct InstanceFunctionAdditionsV1_1(Movable):
    var enumerate_physical_device_groups: fn(
        instance: Instance,
        physical_device_group_count: UInt32,
        p_physical_device_group_properties: Ptr[PhysicalDeviceGroupProperties, MutAnyOrigin],
    ) -> Result
    var get_physical_device_features_2: fn(
        physical_device: PhysicalDevice, features: PhysicalDeviceFeatures2
    )
    var get_physical_device_properties_2: fn(
        physical_device: PhysicalDevice, properties: PhysicalDeviceProperties2
    )
    var get_physical_device_format_properties_2: fn(
        physical_device: PhysicalDevice, format: Format, format_properties: FormatProperties2
    )
    var get_physical_device_image_format_properties_2: fn(
        physical_device: PhysicalDevice,
        image_format_info: PhysicalDeviceImageFormatInfo2,
        image_format_properties: ImageFormatProperties2,
    ) -> Result
    var get_physical_device_queue_family_properties_2: fn(
        physical_device: PhysicalDevice,
        queue_family_property_count: UInt32,
        p_queue_family_properties: Ptr[QueueFamilyProperties2, MutAnyOrigin],
    )
    var get_physical_device_memory_properties_2: fn(
        physical_device: PhysicalDevice, memory_properties: PhysicalDeviceMemoryProperties2
    )
    var get_physical_device_sparse_image_format_properties_2: fn(
        physical_device: PhysicalDevice,
        format_info: PhysicalDeviceSparseImageFormatInfo2,
        property_count: UInt32,
        p_properties: Ptr[SparseImageFormatProperties2, MutAnyOrigin],
    )
    var get_physical_device_external_buffer_properties: fn(
        physical_device: PhysicalDevice,
        external_buffer_info: PhysicalDeviceExternalBufferInfo,
        external_buffer_properties: ExternalBufferProperties,
    )
    var get_physical_device_external_fence_properties: fn(
        physical_device: PhysicalDevice,
        external_fence_info: PhysicalDeviceExternalFenceInfo,
        external_fence_properties: ExternalFenceProperties,
    )
    var get_physical_device_external_semaphore_properties: fn(
        physical_device: PhysicalDevice,
        external_semaphore_info: PhysicalDeviceExternalSemaphoreInfo,
        external_semaphore_properties: ExternalSemaphoreProperties,
    )

    fn __init__(out self, instance: Instance, dlhandle: OwnedDLHandle):
        get_instance_proc_addr = dlhandle.get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self.enumerate_physical_device_groups = Ptr(to=get_instance_proc_addr(
            instance, "vkEnumeratePhysicalDeviceGroups".unsafe_ptr()
        )).bitcast[type_of(self.enumerate_physical_device_groups)]()[]
        self.get_physical_device_features_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFeatures2".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_features_2)]()[]
        self.get_physical_device_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceProperties2".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_properties_2)]()[]
        self.get_physical_device_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceFormatProperties2".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_format_properties_2)]()[]
        self.get_physical_device_image_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceImageFormatProperties2".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_image_format_properties_2)]()[]
        self.get_physical_device_queue_family_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceQueueFamilyProperties2".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_queue_family_properties_2)]()[]
        self.get_physical_device_memory_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceMemoryProperties2".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_memory_properties_2)]()[]
        self.get_physical_device_sparse_image_format_properties_2 = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceSparseImageFormatProperties2".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_sparse_image_format_properties_2)]()[]
        self.get_physical_device_external_buffer_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalBufferProperties".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_external_buffer_properties)]()[]
        self.get_physical_device_external_fence_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalFenceProperties".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_external_fence_properties)]()[]
        self.get_physical_device_external_semaphore_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceExternalSemaphoreProperties".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_external_semaphore_properties)]()[]


struct InstanceFunctionAdditionsV1_3(Movable):
    var get_physical_device_tool_properties: fn(
        physical_device: PhysicalDevice,
        tool_count: UInt32,
        p_tool_properties: Ptr[PhysicalDeviceToolProperties, MutAnyOrigin],
    ) -> Result

    fn __init__(out self, instance: Instance, dlhandle: OwnedDLHandle):
        get_instance_proc_addr = dlhandle.get_function[
            fn(instance: Instance, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetInstanceProcAddr")
        self.get_physical_device_tool_properties = Ptr(to=get_instance_proc_addr(
            instance, "vkGetPhysicalDeviceToolProperties".unsafe_ptr()
        )).bitcast[type_of(self.get_physical_device_tool_properties)]()[]


struct DeviceFunctionAdditionsV1_0(Movable):
    var destroy_device: fn(device: Device, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin])
    var get_device_queue: fn(
        device: Device, queue_family_index: UInt32, queue_index: UInt32, queue: Queue
    )
    var queue_submit: fn(
        queue: Queue, submit_count: UInt32, p_submits: Ptr[SubmitInfo, ImmutAnyOrigin], fence: Fence
    ) -> Result
    var queue_wait_idle: fn(queue: Queue) -> Result
    var device_wait_idle: fn(device: Device) -> Result
    var allocate_memory: fn(
        device: Device,
        allocate_info: MemoryAllocateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        memory: DeviceMemory,
    ) -> Result
    var free_memory: fn(
        device: Device, memory: DeviceMemory, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var map_memory: fn(
        device: Device,
        memory: DeviceMemory,
        offset: DeviceSize,
        size: DeviceSize,
        flags: MemoryMapFlags,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var unmap_memory: fn(device: Device, memory: DeviceMemory)
    var flush_mapped_memory_ranges: fn(
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result
    var invalidate_mapped_memory_ranges: fn(
        device: Device,
        memory_range_count: UInt32,
        p_memory_ranges: Ptr[MappedMemoryRange, ImmutAnyOrigin],
    ) -> Result
    var get_device_memory_commitment: fn(
        device: Device, memory: DeviceMemory, committed_memory_in_bytes: DeviceSize
    )
    var bind_buffer_memory: fn(
        device: Device, buffer: Buffer, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result
    var bind_image_memory: fn(
        device: Device, image: Image, memory: DeviceMemory, memory_offset: DeviceSize
    ) -> Result
    var get_buffer_memory_requirements: fn(
        device: Device, buffer: Buffer, memory_requirements: MemoryRequirements
    )
    var get_image_memory_requirements: fn(
        device: Device, image: Image, memory_requirements: MemoryRequirements
    )
    var get_image_sparse_memory_requirements: fn(
        device: Device,
        image: Image,
        sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements, MutAnyOrigin],
    )
    var queue_bind_sparse: fn(
        queue: Queue,
        bind_info_count: UInt32,
        p_bind_info: Ptr[BindSparseInfo, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result
    var create_fence: fn(
        device: Device,
        create_info: FenceCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result
    var destroy_fence: fn(
        device: Device, fence: Fence, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var reset_fences: fn(
        device: Device, fence_count: UInt32, p_fences: Ptr[Fence, ImmutAnyOrigin]
    ) -> Result
    var get_fence_status: fn(device: Device, fence: Fence) -> Result
    var wait_for_fences: fn(
        device: Device,
        fence_count: UInt32,
        p_fences: Ptr[Fence, ImmutAnyOrigin],
        wait_all: Bool32,
        timeout: UInt64,
    ) -> Result
    var create_semaphore: fn(
        device: Device,
        create_info: SemaphoreCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        semaphore: Semaphore,
    ) -> Result
    var destroy_semaphore: fn(
        device: Device, semaphore: Semaphore, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var create_event: fn(
        device: Device,
        create_info: EventCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        event: Event,
    ) -> Result
    var destroy_event: fn(
        device: Device, event: Event, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var get_event_status: fn(device: Device, event: Event) -> Result
    var set_event: fn(device: Device, event: Event) -> Result
    var reset_event: fn(device: Device, event: Event) -> Result
    var create_query_pool: fn(
        device: Device,
        create_info: QueryPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        query_pool: QueryPool,
    ) -> Result
    var destroy_query_pool: fn(
        device: Device, query_pool: QueryPool, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var get_query_pool_results: fn(
        device: Device,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
        stride: DeviceSize,
        flags: QueryResultFlags,
    ) -> Result
    var create_buffer: fn(
        device: Device,
        create_info: BufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        buffer: Buffer,
    ) -> Result
    var destroy_buffer: fn(
        device: Device, buffer: Buffer, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var create_buffer_view: fn(
        device: Device,
        create_info: BufferViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        view: BufferView,
    ) -> Result
    var destroy_buffer_view: fn(
        device: Device,
        buffer_view: BufferView,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var create_image: fn(
        device: Device,
        create_info: ImageCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        image: Image,
    ) -> Result
    var destroy_image: fn(
        device: Device, image: Image, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var get_image_subresource_layout: fn(
        device: Device, image: Image, subresource: ImageSubresource, layout: SubresourceLayout
    )
    var create_image_view: fn(
        device: Device,
        create_info: ImageViewCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        view: ImageView,
    ) -> Result
    var destroy_image_view: fn(
        device: Device, image_view: ImageView, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var create_shader_module: fn(
        device: Device,
        create_info: ShaderModuleCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        shader_module: ShaderModule,
    ) -> Result
    var destroy_shader_module: fn(
        device: Device,
        shader_module: ShaderModule,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var create_pipeline_cache: fn(
        device: Device,
        create_info: PipelineCacheCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pipeline_cache: PipelineCache,
    ) -> Result
    var destroy_pipeline_cache: fn(
        device: Device,
        pipeline_cache: PipelineCache,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var get_pipeline_cache_data: fn(
        device: Device,
        pipeline_cache: PipelineCache,
        data_size: UInt,
        p_data: Ptr[NoneType, MutAnyOrigin],
    ) -> Result
    var merge_pipeline_caches: fn(
        device: Device,
        dst_cache: PipelineCache,
        src_cache_count: UInt32,
        p_src_caches: Ptr[PipelineCache, ImmutAnyOrigin],
    ) -> Result
    var create_graphics_pipelines: fn(
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[GraphicsPipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var create_compute_pipelines: fn(
        device: Device,
        pipeline_cache: PipelineCache,
        create_info_count: UInt32,
        p_create_infos: Ptr[ComputePipelineCreateInfo, ImmutAnyOrigin],
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        p_pipelines: Ptr[Pipeline, MutAnyOrigin],
    ) -> Result
    var destroy_pipeline: fn(
        device: Device, pipeline: Pipeline, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var create_pipeline_layout: fn(
        device: Device,
        create_info: PipelineLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        pipeline_layout: PipelineLayout,
    ) -> Result
    var destroy_pipeline_layout: fn(
        device: Device,
        pipeline_layout: PipelineLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var create_sampler: fn(
        device: Device,
        create_info: SamplerCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        sampler: Sampler,
    ) -> Result
    var destroy_sampler: fn(
        device: Device, sampler: Sampler, p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin]
    )
    var create_descriptor_set_layout: fn(
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        set_layout: DescriptorSetLayout,
    ) -> Result
    var destroy_descriptor_set_layout: fn(
        device: Device,
        descriptor_set_layout: DescriptorSetLayout,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var create_descriptor_pool: fn(
        device: Device,
        create_info: DescriptorPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        descriptor_pool: DescriptorPool,
    ) -> Result
    var destroy_descriptor_pool: fn(
        device: Device,
        descriptor_pool: DescriptorPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var reset_descriptor_pool: fn(
        device: Device, descriptor_pool: DescriptorPool, flags: DescriptorPoolResetFlags
    ) -> Result
    var allocate_descriptor_sets: fn(
        device: Device,
        allocate_info: DescriptorSetAllocateInfo,
        p_descriptor_sets: Ptr[DescriptorSet, MutAnyOrigin],
    ) -> Result
    var free_descriptor_sets: fn(
        device: Device,
        descriptor_pool: DescriptorPool,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
    ) -> Result
    var update_descriptor_sets: fn(
        device: Device,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
        descriptor_copy_count: UInt32,
        p_descriptor_copies: Ptr[CopyDescriptorSet, ImmutAnyOrigin],
    )
    var create_framebuffer: fn(
        device: Device,
        create_info: FramebufferCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        framebuffer: Framebuffer,
    ) -> Result
    var destroy_framebuffer: fn(
        device: Device,
        framebuffer: Framebuffer,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var create_render_pass: fn(
        device: Device,
        create_info: RenderPassCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        render_pass: RenderPass,
    ) -> Result
    var destroy_render_pass: fn(
        device: Device,
        render_pass: RenderPass,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var get_render_area_granularity: fn(
        device: Device, render_pass: RenderPass, granularity: Extent2D
    )
    var create_command_pool: fn(
        device: Device,
        create_info: CommandPoolCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        command_pool: CommandPool,
    ) -> Result
    var destroy_command_pool: fn(
        device: Device,
        command_pool: CommandPool,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var reset_command_pool: fn(
        device: Device, command_pool: CommandPool, flags: CommandPoolResetFlags
    ) -> Result
    var allocate_command_buffers: fn(
        device: Device,
        allocate_info: CommandBufferAllocateInfo,
        p_command_buffers: Ptr[CommandBuffer, MutAnyOrigin],
    ) -> Result
    var free_command_buffers: fn(
        device: Device,
        command_pool: CommandPool,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    )
    var begin_command_buffer: fn(
        command_buffer: CommandBuffer, begin_info: CommandBufferBeginInfo
    ) -> Result
    var end_command_buffer: fn(command_buffer: CommandBuffer) -> Result
    var reset_command_buffer: fn(
        command_buffer: CommandBuffer, flags: CommandBufferResetFlags
    ) -> Result
    var cmd_bind_pipeline: fn(
        command_buffer: CommandBuffer, pipeline_bind_point: PipelineBindPoint, pipeline: Pipeline
    )
    var cmd_set_viewport: fn(
        command_buffer: CommandBuffer,
        first_viewport: UInt32,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    )
    var cmd_set_scissor: fn(
        command_buffer: CommandBuffer,
        first_scissor: UInt32,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    )
    var cmd_set_line_width: fn(command_buffer: CommandBuffer, line_width: Float32)
    var cmd_set_depth_bias: fn(
        command_buffer: CommandBuffer,
        depth_bias_constant_factor: Float32,
        depth_bias_clamp: Float32,
        depth_bias_slope_factor: Float32,
    )
    var cmd_set_blend_constants: fn(
        command_buffer: CommandBuffer, blend_constants: InlineArray[Float32, Int(4)]
    )
    var cmd_set_depth_bounds: fn(
        command_buffer: CommandBuffer, min_depth_bounds: Float32, max_depth_bounds: Float32
    )
    var cmd_set_stencil_compare_mask: fn(
        command_buffer: CommandBuffer, face_mask: StencilFaceFlags, compare_mask: UInt32
    )
    var cmd_set_stencil_write_mask: fn(
        command_buffer: CommandBuffer, face_mask: StencilFaceFlags, write_mask: UInt32
    )
    var cmd_set_stencil_reference: fn(
        command_buffer: CommandBuffer, face_mask: StencilFaceFlags, reference: UInt32
    )
    var cmd_bind_descriptor_sets: fn(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        first_set: UInt32,
        descriptor_set_count: UInt32,
        p_descriptor_sets: Ptr[DescriptorSet, ImmutAnyOrigin],
        dynamic_offset_count: UInt32,
        p_dynamic_offsets: Ptr[UInt32, ImmutAnyOrigin],
    )
    var cmd_bind_index_buffer: fn(
        command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize, index_type: IndexType
    )
    var cmd_bind_vertex_buffers: fn(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var cmd_draw: fn(
        command_buffer: CommandBuffer,
        vertex_count: UInt32,
        instance_count: UInt32,
        first_vertex: UInt32,
        first_instance: UInt32,
    )
    var cmd_draw_indexed: fn(
        command_buffer: CommandBuffer,
        index_count: UInt32,
        instance_count: UInt32,
        first_index: UInt32,
        vertex_offset: Int32,
        first_instance: UInt32,
    )
    var cmd_draw_indirect: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    )
    var cmd_draw_indexed_indirect: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        draw_count: UInt32,
        stride: UInt32,
    )
    var cmd_dispatch: fn(
        command_buffer: CommandBuffer,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    )
    var cmd_dispatch_indirect: fn(command_buffer: CommandBuffer, buffer: Buffer, offset: DeviceSize)
    var cmd_copy_buffer: fn(
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferCopy, ImmutAnyOrigin],
    )
    var cmd_copy_image: fn(
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageCopy, ImmutAnyOrigin],
    )
    var cmd_blit_image: fn(
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageBlit, ImmutAnyOrigin],
        filter: Filter,
    )
    var cmd_copy_buffer_to_image: fn(
        command_buffer: CommandBuffer,
        src_buffer: Buffer,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    )
    var cmd_copy_image_to_buffer: fn(
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_buffer: Buffer,
        region_count: UInt32,
        p_regions: Ptr[BufferImageCopy, ImmutAnyOrigin],
    )
    var cmd_update_buffer: fn(
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        data_size: DeviceSize,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    )
    var cmd_fill_buffer: fn(
        command_buffer: CommandBuffer,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        size: DeviceSize,
        data: UInt32,
    )
    var cmd_clear_color_image: fn(
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        color: ClearColorValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    )
    var cmd_clear_depth_stencil_image: fn(
        command_buffer: CommandBuffer,
        image: Image,
        image_layout: ImageLayout,
        depth_stencil: ClearDepthStencilValue,
        range_count: UInt32,
        p_ranges: Ptr[ImageSubresourceRange, ImmutAnyOrigin],
    )
    var cmd_clear_attachments: fn(
        command_buffer: CommandBuffer,
        attachment_count: UInt32,
        p_attachments: Ptr[ClearAttachment, ImmutAnyOrigin],
        rect_count: UInt32,
        p_rects: Ptr[ClearRect, ImmutAnyOrigin],
    )
    var cmd_resolve_image: fn(
        command_buffer: CommandBuffer,
        src_image: Image,
        src_image_layout: ImageLayout,
        dst_image: Image,
        dst_image_layout: ImageLayout,
        region_count: UInt32,
        p_regions: Ptr[ImageResolve, ImmutAnyOrigin],
    )
    var cmd_set_event: fn(
        command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    )
    var cmd_reset_event: fn(
        command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags
    )
    var cmd_wait_events: fn(
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
    )
    var cmd_pipeline_barrier: fn(
        command_buffer: CommandBuffer,
        src_stage_mask: PipelineStageFlags,
        dst_stage_mask: PipelineStageFlags,
        dependency_flags: DependencyFlags,
        memory_barrier_count: UInt32,
        p_memory_barriers: Ptr[MemoryBarrier, ImmutAnyOrigin],
        buffer_memory_barrier_count: UInt32,
        p_buffer_memory_barriers: Ptr[BufferMemoryBarrier, ImmutAnyOrigin],
        image_memory_barrier_count: UInt32,
        p_image_memory_barriers: Ptr[ImageMemoryBarrier, ImmutAnyOrigin],
    )
    var cmd_begin_query: fn(
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        query: UInt32,
        flags: QueryControlFlags,
    )
    var cmd_end_query: fn(command_buffer: CommandBuffer, query_pool: QueryPool, query: UInt32)
    var cmd_reset_query_pool: fn(
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
    )
    var cmd_write_timestamp: fn(
        command_buffer: CommandBuffer,
        pipeline_stage: PipelineStageFlagBits,
        query_pool: QueryPool,
        query: UInt32,
    )
    var cmd_copy_query_pool_results: fn(
        command_buffer: CommandBuffer,
        query_pool: QueryPool,
        first_query: UInt32,
        query_count: UInt32,
        dst_buffer: Buffer,
        dst_offset: DeviceSize,
        stride: DeviceSize,
        flags: QueryResultFlags,
    )
    var cmd_push_constants: fn(
        command_buffer: CommandBuffer,
        layout: PipelineLayout,
        stage_flags: ShaderStageFlags,
        offset: UInt32,
        size: UInt32,
        p_values: Ptr[NoneType, ImmutAnyOrigin],
    )
    var cmd_begin_render_pass: fn(
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        contents: SubpassContents,
    )
    var cmd_next_subpass: fn(command_buffer: CommandBuffer, contents: SubpassContents)
    var cmd_end_render_pass: fn(command_buffer: CommandBuffer)
    var cmd_execute_commands: fn(
        command_buffer: CommandBuffer,
        command_buffer_count: UInt32,
        p_command_buffers: Ptr[CommandBuffer, ImmutAnyOrigin],
    )

    fn __init__(out self, device: Device, dlhandle: OwnedDLHandle):
        get_device_proc_addr = dlhandle.get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self.destroy_device = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDevice".unsafe_ptr()
        )).bitcast[type_of(self.destroy_device)]()[]
        self.get_device_queue = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceQueue".unsafe_ptr()
        )).bitcast[type_of(self.get_device_queue)]()[]
        self.queue_submit = Ptr(to=get_device_proc_addr(
            device, "vkQueueSubmit".unsafe_ptr()
        )).bitcast[type_of(self.queue_submit)]()[]
        self.queue_wait_idle = Ptr(to=get_device_proc_addr(
            device, "vkQueueWaitIdle".unsafe_ptr()
        )).bitcast[type_of(self.queue_wait_idle)]()[]
        self.device_wait_idle = Ptr(to=get_device_proc_addr(
            device, "vkDeviceWaitIdle".unsafe_ptr()
        )).bitcast[type_of(self.device_wait_idle)]()[]
        self.allocate_memory = Ptr(to=get_device_proc_addr(
            device, "vkAllocateMemory".unsafe_ptr()
        )).bitcast[type_of(self.allocate_memory)]()[]
        self.free_memory = Ptr(to=get_device_proc_addr(
            device, "vkFreeMemory".unsafe_ptr()
        )).bitcast[type_of(self.free_memory)]()[]
        self.map_memory = Ptr(to=get_device_proc_addr(
            device, "vkMapMemory".unsafe_ptr()
        )).bitcast[type_of(self.map_memory)]()[]
        self.unmap_memory = Ptr(to=get_device_proc_addr(
            device, "vkUnmapMemory".unsafe_ptr()
        )).bitcast[type_of(self.unmap_memory)]()[]
        self.flush_mapped_memory_ranges = Ptr(to=get_device_proc_addr(
            device, "vkFlushMappedMemoryRanges".unsafe_ptr()
        )).bitcast[type_of(self.flush_mapped_memory_ranges)]()[]
        self.invalidate_mapped_memory_ranges = Ptr(to=get_device_proc_addr(
            device, "vkInvalidateMappedMemoryRanges".unsafe_ptr()
        )).bitcast[type_of(self.invalidate_mapped_memory_ranges)]()[]
        self.get_device_memory_commitment = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceMemoryCommitment".unsafe_ptr()
        )).bitcast[type_of(self.get_device_memory_commitment)]()[]
        self.bind_buffer_memory = Ptr(to=get_device_proc_addr(
            device, "vkBindBufferMemory".unsafe_ptr()
        )).bitcast[type_of(self.bind_buffer_memory)]()[]
        self.bind_image_memory = Ptr(to=get_device_proc_addr(
            device, "vkBindImageMemory".unsafe_ptr()
        )).bitcast[type_of(self.bind_image_memory)]()[]
        self.get_buffer_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferMemoryRequirements".unsafe_ptr()
        )).bitcast[type_of(self.get_buffer_memory_requirements)]()[]
        self.get_image_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetImageMemoryRequirements".unsafe_ptr()
        )).bitcast[type_of(self.get_image_memory_requirements)]()[]
        self.get_image_sparse_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSparseMemoryRequirements".unsafe_ptr()
        )).bitcast[type_of(self.get_image_sparse_memory_requirements)]()[]
        self.queue_bind_sparse = Ptr(to=get_device_proc_addr(
            device, "vkQueueBindSparse".unsafe_ptr()
        )).bitcast[type_of(self.queue_bind_sparse)]()[]
        self.create_fence = Ptr(to=get_device_proc_addr(
            device, "vkCreateFence".unsafe_ptr()
        )).bitcast[type_of(self.create_fence)]()[]
        self.destroy_fence = Ptr(to=get_device_proc_addr(
            device, "vkDestroyFence".unsafe_ptr()
        )).bitcast[type_of(self.destroy_fence)]()[]
        self.reset_fences = Ptr(to=get_device_proc_addr(
            device, "vkResetFences".unsafe_ptr()
        )).bitcast[type_of(self.reset_fences)]()[]
        self.get_fence_status = Ptr(to=get_device_proc_addr(
            device, "vkGetFenceStatus".unsafe_ptr()
        )).bitcast[type_of(self.get_fence_status)]()[]
        self.wait_for_fences = Ptr(to=get_device_proc_addr(
            device, "vkWaitForFences".unsafe_ptr()
        )).bitcast[type_of(self.wait_for_fences)]()[]
        self.create_semaphore = Ptr(to=get_device_proc_addr(
            device, "vkCreateSemaphore".unsafe_ptr()
        )).bitcast[type_of(self.create_semaphore)]()[]
        self.destroy_semaphore = Ptr(to=get_device_proc_addr(
            device, "vkDestroySemaphore".unsafe_ptr()
        )).bitcast[type_of(self.destroy_semaphore)]()[]
        self.create_event = Ptr(to=get_device_proc_addr(
            device, "vkCreateEvent".unsafe_ptr()
        )).bitcast[type_of(self.create_event)]()[]
        self.destroy_event = Ptr(to=get_device_proc_addr(
            device, "vkDestroyEvent".unsafe_ptr()
        )).bitcast[type_of(self.destroy_event)]()[]
        self.get_event_status = Ptr(to=get_device_proc_addr(
            device, "vkGetEventStatus".unsafe_ptr()
        )).bitcast[type_of(self.get_event_status)]()[]
        self.set_event = Ptr(to=get_device_proc_addr(
            device, "vkSetEvent".unsafe_ptr()
        )).bitcast[type_of(self.set_event)]()[]
        self.reset_event = Ptr(to=get_device_proc_addr(
            device, "vkResetEvent".unsafe_ptr()
        )).bitcast[type_of(self.reset_event)]()[]
        self.create_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkCreateQueryPool".unsafe_ptr()
        )).bitcast[type_of(self.create_query_pool)]()[]
        self.destroy_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkDestroyQueryPool".unsafe_ptr()
        )).bitcast[type_of(self.destroy_query_pool)]()[]
        self.get_query_pool_results = Ptr(to=get_device_proc_addr(
            device, "vkGetQueryPoolResults".unsafe_ptr()
        )).bitcast[type_of(self.get_query_pool_results)]()[]
        self.create_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCreateBuffer".unsafe_ptr()
        )).bitcast[type_of(self.create_buffer)]()[]
        self.destroy_buffer = Ptr(to=get_device_proc_addr(
            device, "vkDestroyBuffer".unsafe_ptr()
        )).bitcast[type_of(self.destroy_buffer)]()[]
        self.create_buffer_view = Ptr(to=get_device_proc_addr(
            device, "vkCreateBufferView".unsafe_ptr()
        )).bitcast[type_of(self.create_buffer_view)]()[]
        self.destroy_buffer_view = Ptr(to=get_device_proc_addr(
            device, "vkDestroyBufferView".unsafe_ptr()
        )).bitcast[type_of(self.destroy_buffer_view)]()[]
        self.create_image = Ptr(to=get_device_proc_addr(
            device, "vkCreateImage".unsafe_ptr()
        )).bitcast[type_of(self.create_image)]()[]
        self.destroy_image = Ptr(to=get_device_proc_addr(
            device, "vkDestroyImage".unsafe_ptr()
        )).bitcast[type_of(self.destroy_image)]()[]
        self.get_image_subresource_layout = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout".unsafe_ptr()
        )).bitcast[type_of(self.get_image_subresource_layout)]()[]
        self.create_image_view = Ptr(to=get_device_proc_addr(
            device, "vkCreateImageView".unsafe_ptr()
        )).bitcast[type_of(self.create_image_view)]()[]
        self.destroy_image_view = Ptr(to=get_device_proc_addr(
            device, "vkDestroyImageView".unsafe_ptr()
        )).bitcast[type_of(self.destroy_image_view)]()[]
        self.create_shader_module = Ptr(to=get_device_proc_addr(
            device, "vkCreateShaderModule".unsafe_ptr()
        )).bitcast[type_of(self.create_shader_module)]()[]
        self.destroy_shader_module = Ptr(to=get_device_proc_addr(
            device, "vkDestroyShaderModule".unsafe_ptr()
        )).bitcast[type_of(self.destroy_shader_module)]()[]
        self.create_pipeline_cache = Ptr(to=get_device_proc_addr(
            device, "vkCreatePipelineCache".unsafe_ptr()
        )).bitcast[type_of(self.create_pipeline_cache)]()[]
        self.destroy_pipeline_cache = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPipelineCache".unsafe_ptr()
        )).bitcast[type_of(self.destroy_pipeline_cache)]()[]
        self.get_pipeline_cache_data = Ptr(to=get_device_proc_addr(
            device, "vkGetPipelineCacheData".unsafe_ptr()
        )).bitcast[type_of(self.get_pipeline_cache_data)]()[]
        self.merge_pipeline_caches = Ptr(to=get_device_proc_addr(
            device, "vkMergePipelineCaches".unsafe_ptr()
        )).bitcast[type_of(self.merge_pipeline_caches)]()[]
        self.create_graphics_pipelines = Ptr(to=get_device_proc_addr(
            device, "vkCreateGraphicsPipelines".unsafe_ptr()
        )).bitcast[type_of(self.create_graphics_pipelines)]()[]
        self.create_compute_pipelines = Ptr(to=get_device_proc_addr(
            device, "vkCreateComputePipelines".unsafe_ptr()
        )).bitcast[type_of(self.create_compute_pipelines)]()[]
        self.destroy_pipeline = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPipeline".unsafe_ptr()
        )).bitcast[type_of(self.destroy_pipeline)]()[]
        self.create_pipeline_layout = Ptr(to=get_device_proc_addr(
            device, "vkCreatePipelineLayout".unsafe_ptr()
        )).bitcast[type_of(self.create_pipeline_layout)]()[]
        self.destroy_pipeline_layout = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPipelineLayout".unsafe_ptr()
        )).bitcast[type_of(self.destroy_pipeline_layout)]()[]
        self.create_sampler = Ptr(to=get_device_proc_addr(
            device, "vkCreateSampler".unsafe_ptr()
        )).bitcast[type_of(self.create_sampler)]()[]
        self.destroy_sampler = Ptr(to=get_device_proc_addr(
            device, "vkDestroySampler".unsafe_ptr()
        )).bitcast[type_of(self.destroy_sampler)]()[]
        self.create_descriptor_set_layout = Ptr(to=get_device_proc_addr(
            device, "vkCreateDescriptorSetLayout".unsafe_ptr()
        )).bitcast[type_of(self.create_descriptor_set_layout)]()[]
        self.destroy_descriptor_set_layout = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDescriptorSetLayout".unsafe_ptr()
        )).bitcast[type_of(self.destroy_descriptor_set_layout)]()[]
        self.create_descriptor_pool = Ptr(to=get_device_proc_addr(
            device, "vkCreateDescriptorPool".unsafe_ptr()
        )).bitcast[type_of(self.create_descriptor_pool)]()[]
        self.destroy_descriptor_pool = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDescriptorPool".unsafe_ptr()
        )).bitcast[type_of(self.destroy_descriptor_pool)]()[]
        self.reset_descriptor_pool = Ptr(to=get_device_proc_addr(
            device, "vkResetDescriptorPool".unsafe_ptr()
        )).bitcast[type_of(self.reset_descriptor_pool)]()[]
        self.allocate_descriptor_sets = Ptr(to=get_device_proc_addr(
            device, "vkAllocateDescriptorSets".unsafe_ptr()
        )).bitcast[type_of(self.allocate_descriptor_sets)]()[]
        self.free_descriptor_sets = Ptr(to=get_device_proc_addr(
            device, "vkFreeDescriptorSets".unsafe_ptr()
        )).bitcast[type_of(self.free_descriptor_sets)]()[]
        self.update_descriptor_sets = Ptr(to=get_device_proc_addr(
            device, "vkUpdateDescriptorSets".unsafe_ptr()
        )).bitcast[type_of(self.update_descriptor_sets)]()[]
        self.create_framebuffer = Ptr(to=get_device_proc_addr(
            device, "vkCreateFramebuffer".unsafe_ptr()
        )).bitcast[type_of(self.create_framebuffer)]()[]
        self.destroy_framebuffer = Ptr(to=get_device_proc_addr(
            device, "vkDestroyFramebuffer".unsafe_ptr()
        )).bitcast[type_of(self.destroy_framebuffer)]()[]
        self.create_render_pass = Ptr(to=get_device_proc_addr(
            device, "vkCreateRenderPass".unsafe_ptr()
        )).bitcast[type_of(self.create_render_pass)]()[]
        self.destroy_render_pass = Ptr(to=get_device_proc_addr(
            device, "vkDestroyRenderPass".unsafe_ptr()
        )).bitcast[type_of(self.destroy_render_pass)]()[]
        self.get_render_area_granularity = Ptr(to=get_device_proc_addr(
            device, "vkGetRenderAreaGranularity".unsafe_ptr()
        )).bitcast[type_of(self.get_render_area_granularity)]()[]
        self.create_command_pool = Ptr(to=get_device_proc_addr(
            device, "vkCreateCommandPool".unsafe_ptr()
        )).bitcast[type_of(self.create_command_pool)]()[]
        self.destroy_command_pool = Ptr(to=get_device_proc_addr(
            device, "vkDestroyCommandPool".unsafe_ptr()
        )).bitcast[type_of(self.destroy_command_pool)]()[]
        self.reset_command_pool = Ptr(to=get_device_proc_addr(
            device, "vkResetCommandPool".unsafe_ptr()
        )).bitcast[type_of(self.reset_command_pool)]()[]
        self.allocate_command_buffers = Ptr(to=get_device_proc_addr(
            device, "vkAllocateCommandBuffers".unsafe_ptr()
        )).bitcast[type_of(self.allocate_command_buffers)]()[]
        self.free_command_buffers = Ptr(to=get_device_proc_addr(
            device, "vkFreeCommandBuffers".unsafe_ptr()
        )).bitcast[type_of(self.free_command_buffers)]()[]
        self.begin_command_buffer = Ptr(to=get_device_proc_addr(
            device, "vkBeginCommandBuffer".unsafe_ptr()
        )).bitcast[type_of(self.begin_command_buffer)]()[]
        self.end_command_buffer = Ptr(to=get_device_proc_addr(
            device, "vkEndCommandBuffer".unsafe_ptr()
        )).bitcast[type_of(self.end_command_buffer)]()[]
        self.reset_command_buffer = Ptr(to=get_device_proc_addr(
            device, "vkResetCommandBuffer".unsafe_ptr()
        )).bitcast[type_of(self.reset_command_buffer)]()[]
        self.cmd_bind_pipeline = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindPipeline".unsafe_ptr()
        )).bitcast[type_of(self.cmd_bind_pipeline)]()[]
        self.cmd_set_viewport = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewport".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_viewport)]()[]
        self.cmd_set_scissor = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetScissor".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_scissor)]()[]
        self.cmd_set_line_width = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineWidth".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_line_width)]()[]
        self.cmd_set_depth_bias = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBias".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_depth_bias)]()[]
        self.cmd_set_blend_constants = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetBlendConstants".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_blend_constants)]()[]
        self.cmd_set_depth_bounds = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBounds".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_depth_bounds)]()[]
        self.cmd_set_stencil_compare_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilCompareMask".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_stencil_compare_mask)]()[]
        self.cmd_set_stencil_write_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilWriteMask".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_stencil_write_mask)]()[]
        self.cmd_set_stencil_reference = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilReference".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_stencil_reference)]()[]
        self.cmd_bind_descriptor_sets = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorSets".unsafe_ptr()
        )).bitcast[type_of(self.cmd_bind_descriptor_sets)]()[]
        self.cmd_bind_index_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindIndexBuffer".unsafe_ptr()
        )).bitcast[type_of(self.cmd_bind_index_buffer)]()[]
        self.cmd_bind_vertex_buffers = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindVertexBuffers".unsafe_ptr()
        )).bitcast[type_of(self.cmd_bind_vertex_buffers)]()[]
        self.cmd_draw = Ptr(to=get_device_proc_addr(
            device, "vkCmdDraw".unsafe_ptr()
        )).bitcast[type_of(self.cmd_draw)]()[]
        self.cmd_draw_indexed = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndexed".unsafe_ptr()
        )).bitcast[type_of(self.cmd_draw_indexed)]()[]
        self.cmd_draw_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirect".unsafe_ptr()
        )).bitcast[type_of(self.cmd_draw_indirect)]()[]
        self.cmd_draw_indexed_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndexedIndirect".unsafe_ptr()
        )).bitcast[type_of(self.cmd_draw_indexed_indirect)]()[]
        self.cmd_dispatch = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatch".unsafe_ptr()
        )).bitcast[type_of(self.cmd_dispatch)]()[]
        self.cmd_dispatch_indirect = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchIndirect".unsafe_ptr()
        )).bitcast[type_of(self.cmd_dispatch_indirect)]()[]
        self.cmd_copy_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBuffer".unsafe_ptr()
        )).bitcast[type_of(self.cmd_copy_buffer)]()[]
        self.cmd_copy_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImage".unsafe_ptr()
        )).bitcast[type_of(self.cmd_copy_image)]()[]
        self.cmd_blit_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdBlitImage".unsafe_ptr()
        )).bitcast[type_of(self.cmd_blit_image)]()[]
        self.cmd_copy_buffer_to_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBufferToImage".unsafe_ptr()
        )).bitcast[type_of(self.cmd_copy_buffer_to_image)]()[]
        self.cmd_copy_image_to_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImageToBuffer".unsafe_ptr()
        )).bitcast[type_of(self.cmd_copy_image_to_buffer)]()[]
        self.cmd_update_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdUpdateBuffer".unsafe_ptr()
        )).bitcast[type_of(self.cmd_update_buffer)]()[]
        self.cmd_fill_buffer = Ptr(to=get_device_proc_addr(
            device, "vkCmdFillBuffer".unsafe_ptr()
        )).bitcast[type_of(self.cmd_fill_buffer)]()[]
        self.cmd_clear_color_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdClearColorImage".unsafe_ptr()
        )).bitcast[type_of(self.cmd_clear_color_image)]()[]
        self.cmd_clear_depth_stencil_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdClearDepthStencilImage".unsafe_ptr()
        )).bitcast[type_of(self.cmd_clear_depth_stencil_image)]()[]
        self.cmd_clear_attachments = Ptr(to=get_device_proc_addr(
            device, "vkCmdClearAttachments".unsafe_ptr()
        )).bitcast[type_of(self.cmd_clear_attachments)]()[]
        self.cmd_resolve_image = Ptr(to=get_device_proc_addr(
            device, "vkCmdResolveImage".unsafe_ptr()
        )).bitcast[type_of(self.cmd_resolve_image)]()[]
        self.cmd_set_event = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetEvent".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_event)]()[]
        self.cmd_reset_event = Ptr(to=get_device_proc_addr(
            device, "vkCmdResetEvent".unsafe_ptr()
        )).bitcast[type_of(self.cmd_reset_event)]()[]
        self.cmd_wait_events = Ptr(to=get_device_proc_addr(
            device, "vkCmdWaitEvents".unsafe_ptr()
        )).bitcast[type_of(self.cmd_wait_events)]()[]
        self.cmd_pipeline_barrier = Ptr(to=get_device_proc_addr(
            device, "vkCmdPipelineBarrier".unsafe_ptr()
        )).bitcast[type_of(self.cmd_pipeline_barrier)]()[]
        self.cmd_begin_query = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginQuery".unsafe_ptr()
        )).bitcast[type_of(self.cmd_begin_query)]()[]
        self.cmd_end_query = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndQuery".unsafe_ptr()
        )).bitcast[type_of(self.cmd_end_query)]()[]
        self.cmd_reset_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkCmdResetQueryPool".unsafe_ptr()
        )).bitcast[type_of(self.cmd_reset_query_pool)]()[]
        self.cmd_write_timestamp = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteTimestamp".unsafe_ptr()
        )).bitcast[type_of(self.cmd_write_timestamp)]()[]
        self.cmd_copy_query_pool_results = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyQueryPoolResults".unsafe_ptr()
        )).bitcast[type_of(self.cmd_copy_query_pool_results)]()[]
        self.cmd_push_constants = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushConstants".unsafe_ptr()
        )).bitcast[type_of(self.cmd_push_constants)]()[]
        self.cmd_begin_render_pass = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginRenderPass".unsafe_ptr()
        )).bitcast[type_of(self.cmd_begin_render_pass)]()[]
        self.cmd_next_subpass = Ptr(to=get_device_proc_addr(
            device, "vkCmdNextSubpass".unsafe_ptr()
        )).bitcast[type_of(self.cmd_next_subpass)]()[]
        self.cmd_end_render_pass = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRenderPass".unsafe_ptr()
        )).bitcast[type_of(self.cmd_end_render_pass)]()[]
        self.cmd_execute_commands = Ptr(to=get_device_proc_addr(
            device, "vkCmdExecuteCommands".unsafe_ptr()
        )).bitcast[type_of(self.cmd_execute_commands)]()[]


struct DeviceFunctionAdditionsV1_1(Movable):
    var bind_buffer_memory_2: fn(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindBufferMemoryInfo, ImmutAnyOrigin],
    ) -> Result
    var bind_image_memory_2: fn(
        device: Device,
        bind_info_count: UInt32,
        p_bind_infos: Ptr[BindImageMemoryInfo, ImmutAnyOrigin],
    ) -> Result
    var get_device_group_peer_memory_features: fn(
        device: Device,
        heap_index: UInt32,
        local_device_index: UInt32,
        remote_device_index: UInt32,
        peer_memory_features: PeerMemoryFeatureFlags,
    )
    var cmd_set_device_mask: fn(command_buffer: CommandBuffer, device_mask: UInt32)
    var cmd_dispatch_base: fn(
        command_buffer: CommandBuffer,
        base_group_x: UInt32,
        base_group_y: UInt32,
        base_group_z: UInt32,
        group_count_x: UInt32,
        group_count_y: UInt32,
        group_count_z: UInt32,
    )
    var get_image_memory_requirements_2: fn(
        device: Device, info: ImageMemoryRequirementsInfo2, memory_requirements: MemoryRequirements2
    )
    var get_buffer_memory_requirements_2: fn(
        device: Device,
        info: BufferMemoryRequirementsInfo2,
        memory_requirements: MemoryRequirements2,
    )
    var get_image_sparse_memory_requirements_2: fn(
        device: Device,
        info: ImageSparseMemoryRequirementsInfo2,
        sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    )
    var trim_command_pool: fn(
        device: Device, command_pool: CommandPool, flags: CommandPoolTrimFlags
    )
    var get_device_queue_2: fn(device: Device, queue_info: DeviceQueueInfo2, queue: Queue)
    var create_sampler_ycbcr_conversion: fn(
        device: Device,
        create_info: SamplerYcbcrConversionCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        ycbcr_conversion: SamplerYcbcrConversion,
    ) -> Result
    var destroy_sampler_ycbcr_conversion: fn(
        device: Device,
        ycbcr_conversion: SamplerYcbcrConversion,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var create_descriptor_update_template: fn(
        device: Device,
        create_info: DescriptorUpdateTemplateCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        descriptor_update_template: DescriptorUpdateTemplate,
    ) -> Result
    var destroy_descriptor_update_template: fn(
        device: Device,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var update_descriptor_set_with_template: fn(
        device: Device,
        descriptor_set: DescriptorSet,
        descriptor_update_template: DescriptorUpdateTemplate,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    )
    var get_descriptor_set_layout_support: fn(
        device: Device,
        create_info: DescriptorSetLayoutCreateInfo,
        support: DescriptorSetLayoutSupport,
    )

    fn __init__(out self, device: Device, dlhandle: OwnedDLHandle):
        get_device_proc_addr = dlhandle.get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self.bind_buffer_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkBindBufferMemory2".unsafe_ptr()
        )).bitcast[type_of(self.bind_buffer_memory_2)]()[]
        self.bind_image_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkBindImageMemory2".unsafe_ptr()
        )).bitcast[type_of(self.bind_image_memory_2)]()[]
        self.get_device_group_peer_memory_features = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceGroupPeerMemoryFeatures".unsafe_ptr()
        )).bitcast[type_of(self.get_device_group_peer_memory_features)]()[]
        self.cmd_set_device_mask = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDeviceMask".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_device_mask)]()[]
        self.cmd_dispatch_base = Ptr(to=get_device_proc_addr(
            device, "vkCmdDispatchBase".unsafe_ptr()
        )).bitcast[type_of(self.cmd_dispatch_base)]()[]
        self.get_image_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageMemoryRequirements2".unsafe_ptr()
        )).bitcast[type_of(self.get_image_memory_requirements_2)]()[]
        self.get_buffer_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferMemoryRequirements2".unsafe_ptr()
        )).bitcast[type_of(self.get_buffer_memory_requirements_2)]()[]
        self.get_image_sparse_memory_requirements_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSparseMemoryRequirements2".unsafe_ptr()
        )).bitcast[type_of(self.get_image_sparse_memory_requirements_2)]()[]
        self.trim_command_pool = Ptr(to=get_device_proc_addr(
            device, "vkTrimCommandPool".unsafe_ptr()
        )).bitcast[type_of(self.trim_command_pool)]()[]
        self.get_device_queue_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceQueue2".unsafe_ptr()
        )).bitcast[type_of(self.get_device_queue_2)]()[]
        self.create_sampler_ycbcr_conversion = Ptr(to=get_device_proc_addr(
            device, "vkCreateSamplerYcbcrConversion".unsafe_ptr()
        )).bitcast[type_of(self.create_sampler_ycbcr_conversion)]()[]
        self.destroy_sampler_ycbcr_conversion = Ptr(to=get_device_proc_addr(
            device, "vkDestroySamplerYcbcrConversion".unsafe_ptr()
        )).bitcast[type_of(self.destroy_sampler_ycbcr_conversion)]()[]
        self.create_descriptor_update_template = Ptr(to=get_device_proc_addr(
            device, "vkCreateDescriptorUpdateTemplate".unsafe_ptr()
        )).bitcast[type_of(self.create_descriptor_update_template)]()[]
        self.destroy_descriptor_update_template = Ptr(to=get_device_proc_addr(
            device, "vkDestroyDescriptorUpdateTemplate".unsafe_ptr()
        )).bitcast[type_of(self.destroy_descriptor_update_template)]()[]
        self.update_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
            device, "vkUpdateDescriptorSetWithTemplate".unsafe_ptr()
        )).bitcast[type_of(self.update_descriptor_set_with_template)]()[]
        self.get_descriptor_set_layout_support = Ptr(to=get_device_proc_addr(
            device, "vkGetDescriptorSetLayoutSupport".unsafe_ptr()
        )).bitcast[type_of(self.get_descriptor_set_layout_support)]()[]


struct DeviceFunctionAdditionsV1_2(Movable):
    var cmd_draw_indirect_count: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    )
    var cmd_draw_indexed_indirect_count: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        count_buffer: Buffer,
        count_buffer_offset: DeviceSize,
        max_draw_count: UInt32,
        stride: UInt32,
    )
    var create_render_pass_2: fn(
        device: Device,
        create_info: RenderPassCreateInfo2,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        render_pass: RenderPass,
    ) -> Result
    var cmd_begin_render_pass_2: fn(
        command_buffer: CommandBuffer,
        render_pass_begin: RenderPassBeginInfo,
        subpass_begin_info: SubpassBeginInfo,
    )
    var cmd_next_subpass_2: fn(
        command_buffer: CommandBuffer,
        subpass_begin_info: SubpassBeginInfo,
        subpass_end_info: SubpassEndInfo,
    )
    var cmd_end_render_pass_2: fn(command_buffer: CommandBuffer, subpass_end_info: SubpassEndInfo)
    var reset_query_pool: fn(
        device: Device, query_pool: QueryPool, first_query: UInt32, query_count: UInt32
    )
    var get_semaphore_counter_value: fn(
        device: Device, semaphore: Semaphore, value: UInt64
    ) -> Result
    var wait_semaphores: fn(device: Device, wait_info: SemaphoreWaitInfo, timeout: UInt64) -> Result
    var signal_semaphore: fn(device: Device, signal_info: SemaphoreSignalInfo) -> Result
    var get_buffer_device_address: fn(
        device: Device, info: BufferDeviceAddressInfo
    ) -> DeviceAddress
    var get_buffer_opaque_capture_address: fn(
        device: Device, info: BufferDeviceAddressInfo
    ) -> UInt64
    var get_device_memory_opaque_capture_address: fn(
        device: Device, info: DeviceMemoryOpaqueCaptureAddressInfo
    ) -> UInt64

    fn __init__(out self, device: Device, dlhandle: OwnedDLHandle):
        get_device_proc_addr = dlhandle.get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self.cmd_draw_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndirectCount".unsafe_ptr()
        )).bitcast[type_of(self.cmd_draw_indirect_count)]()[]
        self.cmd_draw_indexed_indirect_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdDrawIndexedIndirectCount".unsafe_ptr()
        )).bitcast[type_of(self.cmd_draw_indexed_indirect_count)]()[]
        self.create_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCreateRenderPass2".unsafe_ptr()
        )).bitcast[type_of(self.create_render_pass_2)]()[]
        self.cmd_begin_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginRenderPass2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_begin_render_pass_2)]()[]
        self.cmd_next_subpass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdNextSubpass2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_next_subpass_2)]()[]
        self.cmd_end_render_pass_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRenderPass2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_end_render_pass_2)]()[]
        self.reset_query_pool = Ptr(to=get_device_proc_addr(
            device, "vkResetQueryPool".unsafe_ptr()
        )).bitcast[type_of(self.reset_query_pool)]()[]
        self.get_semaphore_counter_value = Ptr(to=get_device_proc_addr(
            device, "vkGetSemaphoreCounterValue".unsafe_ptr()
        )).bitcast[type_of(self.get_semaphore_counter_value)]()[]
        self.wait_semaphores = Ptr(to=get_device_proc_addr(
            device, "vkWaitSemaphores".unsafe_ptr()
        )).bitcast[type_of(self.wait_semaphores)]()[]
        self.signal_semaphore = Ptr(to=get_device_proc_addr(
            device, "vkSignalSemaphore".unsafe_ptr()
        )).bitcast[type_of(self.signal_semaphore)]()[]
        self.get_buffer_device_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferDeviceAddress".unsafe_ptr()
        )).bitcast[type_of(self.get_buffer_device_address)]()[]
        self.get_buffer_opaque_capture_address = Ptr(to=get_device_proc_addr(
            device, "vkGetBufferOpaqueCaptureAddress".unsafe_ptr()
        )).bitcast[type_of(self.get_buffer_opaque_capture_address)]()[]
        self.get_device_memory_opaque_capture_address = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceMemoryOpaqueCaptureAddress".unsafe_ptr()
        )).bitcast[type_of(self.get_device_memory_opaque_capture_address)]()[]


struct DeviceFunctionAdditionsV1_3(Movable):
    var create_private_data_slot: fn(
        device: Device,
        create_info: PrivateDataSlotCreateInfo,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
        private_data_slot: PrivateDataSlot,
    ) -> Result
    var destroy_private_data_slot: fn(
        device: Device,
        private_data_slot: PrivateDataSlot,
        p_allocator: Ptr[AllocationCallbacks, ImmutAnyOrigin],
    )
    var set_private_data: fn(
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        data: UInt64,
    ) -> Result
    var get_private_data: fn(
        device: Device,
        object_type: ObjectType,
        object_handle: UInt64,
        private_data_slot: PrivateDataSlot,
        data: UInt64,
    )
    var cmd_set_event_2: fn(
        command_buffer: CommandBuffer, event: Event, dependency_info: DependencyInfo
    )
    var cmd_reset_event_2: fn(
        command_buffer: CommandBuffer, event: Event, stage_mask: PipelineStageFlags2
    )
    var cmd_wait_events_2: fn(
        command_buffer: CommandBuffer,
        event_count: UInt32,
        p_events: Ptr[Event, ImmutAnyOrigin],
        p_dependency_infos: Ptr[DependencyInfo, ImmutAnyOrigin],
    )
    var cmd_pipeline_barrier_2: fn(command_buffer: CommandBuffer, dependency_info: DependencyInfo)
    var cmd_write_timestamp_2: fn(
        command_buffer: CommandBuffer,
        stage: PipelineStageFlags2,
        query_pool: QueryPool,
        query: UInt32,
    )
    var queue_submit_2: fn(
        queue: Queue,
        submit_count: UInt32,
        p_submits: Ptr[SubmitInfo2, ImmutAnyOrigin],
        fence: Fence,
    ) -> Result
    var cmd_copy_buffer_2: fn(command_buffer: CommandBuffer, copy_buffer_info: CopyBufferInfo2)
    var cmd_copy_image_2: fn(command_buffer: CommandBuffer, copy_image_info: CopyImageInfo2)
    var cmd_copy_buffer_to_image_2: fn(
        command_buffer: CommandBuffer, copy_buffer_to_image_info: CopyBufferToImageInfo2
    )
    var cmd_copy_image_to_buffer_2: fn(
        command_buffer: CommandBuffer, copy_image_to_buffer_info: CopyImageToBufferInfo2
    )
    var cmd_blit_image_2: fn(command_buffer: CommandBuffer, blit_image_info: BlitImageInfo2)
    var cmd_resolve_image_2: fn(
        command_buffer: CommandBuffer, resolve_image_info: ResolveImageInfo2
    )
    var cmd_begin_rendering: fn(command_buffer: CommandBuffer, rendering_info: RenderingInfo)
    var cmd_end_rendering: fn(command_buffer: CommandBuffer)
    var cmd_set_cull_mode: fn(command_buffer: CommandBuffer, cull_mode: CullModeFlags)
    var cmd_set_front_face: fn(command_buffer: CommandBuffer, front_face: FrontFace)
    var cmd_set_primitive_topology: fn(
        command_buffer: CommandBuffer, primitive_topology: PrimitiveTopology
    )
    var cmd_set_viewport_with_count: fn(
        command_buffer: CommandBuffer,
        viewport_count: UInt32,
        p_viewports: Ptr[Viewport, ImmutAnyOrigin],
    )
    var cmd_set_scissor_with_count: fn(
        command_buffer: CommandBuffer,
        scissor_count: UInt32,
        p_scissors: Ptr[Rect2D, ImmutAnyOrigin],
    )
    var cmd_bind_vertex_buffers_2: fn(
        command_buffer: CommandBuffer,
        first_binding: UInt32,
        binding_count: UInt32,
        p_buffers: Ptr[Buffer, ImmutAnyOrigin],
        p_offsets: Ptr[DeviceSize, ImmutAnyOrigin],
        p_sizes: Ptr[DeviceSize, ImmutAnyOrigin],
        p_strides: Ptr[DeviceSize, ImmutAnyOrigin],
    )
    var cmd_set_depth_test_enable: fn(command_buffer: CommandBuffer, depth_test_enable: Bool32)
    var cmd_set_depth_write_enable: fn(command_buffer: CommandBuffer, depth_write_enable: Bool32)
    var cmd_set_depth_compare_op: fn(command_buffer: CommandBuffer, depth_compare_op: CompareOp)
    var cmd_set_depth_bounds_test_enable: fn(
        command_buffer: CommandBuffer, depth_bounds_test_enable: Bool32
    )
    var cmd_set_stencil_test_enable: fn(command_buffer: CommandBuffer, stencil_test_enable: Bool32)
    var cmd_set_stencil_op: fn(
        command_buffer: CommandBuffer,
        face_mask: StencilFaceFlags,
        fail_op: StencilOp,
        pass_op: StencilOp,
        depth_fail_op: StencilOp,
        compare_op: CompareOp,
    )
    var cmd_set_rasterizer_discard_enable: fn(
        command_buffer: CommandBuffer, rasterizer_discard_enable: Bool32
    )
    var cmd_set_depth_bias_enable: fn(command_buffer: CommandBuffer, depth_bias_enable: Bool32)
    var cmd_set_primitive_restart_enable: fn(
        command_buffer: CommandBuffer, primitive_restart_enable: Bool32
    )
    var get_device_buffer_memory_requirements: fn(
        device: Device,
        info: DeviceBufferMemoryRequirements,
        memory_requirements: MemoryRequirements2,
    )
    var get_device_image_memory_requirements: fn(
        device: Device,
        info: DeviceImageMemoryRequirements,
        memory_requirements: MemoryRequirements2,
    )
    var get_device_image_sparse_memory_requirements: fn(
        device: Device,
        info: DeviceImageMemoryRequirements,
        sparse_memory_requirement_count: UInt32,
        p_sparse_memory_requirements: Ptr[SparseImageMemoryRequirements2, MutAnyOrigin],
    )

    fn __init__(out self, device: Device, dlhandle: OwnedDLHandle):
        get_device_proc_addr = dlhandle.get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self.create_private_data_slot = Ptr(to=get_device_proc_addr(
            device, "vkCreatePrivateDataSlot".unsafe_ptr()
        )).bitcast[type_of(self.create_private_data_slot)]()[]
        self.destroy_private_data_slot = Ptr(to=get_device_proc_addr(
            device, "vkDestroyPrivateDataSlot".unsafe_ptr()
        )).bitcast[type_of(self.destroy_private_data_slot)]()[]
        self.set_private_data = Ptr(to=get_device_proc_addr(
            device, "vkSetPrivateData".unsafe_ptr()
        )).bitcast[type_of(self.set_private_data)]()[]
        self.get_private_data = Ptr(to=get_device_proc_addr(
            device, "vkGetPrivateData".unsafe_ptr()
        )).bitcast[type_of(self.get_private_data)]()[]
        self.cmd_set_event_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetEvent2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_event_2)]()[]
        self.cmd_reset_event_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdResetEvent2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_reset_event_2)]()[]
        self.cmd_wait_events_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdWaitEvents2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_wait_events_2)]()[]
        self.cmd_pipeline_barrier_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPipelineBarrier2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_pipeline_barrier_2)]()[]
        self.cmd_write_timestamp_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdWriteTimestamp2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_write_timestamp_2)]()[]
        self.queue_submit_2 = Ptr(to=get_device_proc_addr(
            device, "vkQueueSubmit2".unsafe_ptr()
        )).bitcast[type_of(self.queue_submit_2)]()[]
        self.cmd_copy_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBuffer2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_copy_buffer_2)]()[]
        self.cmd_copy_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImage2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_copy_image_2)]()[]
        self.cmd_copy_buffer_to_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyBufferToImage2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_copy_buffer_to_image_2)]()[]
        self.cmd_copy_image_to_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdCopyImageToBuffer2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_copy_image_to_buffer_2)]()[]
        self.cmd_blit_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBlitImage2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_blit_image_2)]()[]
        self.cmd_resolve_image_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdResolveImage2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_resolve_image_2)]()[]
        self.cmd_begin_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdBeginRendering".unsafe_ptr()
        )).bitcast[type_of(self.cmd_begin_rendering)]()[]
        self.cmd_end_rendering = Ptr(to=get_device_proc_addr(
            device, "vkCmdEndRendering".unsafe_ptr()
        )).bitcast[type_of(self.cmd_end_rendering)]()[]
        self.cmd_set_cull_mode = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetCullMode".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_cull_mode)]()[]
        self.cmd_set_front_face = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetFrontFace".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_front_face)]()[]
        self.cmd_set_primitive_topology = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveTopology".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_primitive_topology)]()[]
        self.cmd_set_viewport_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetViewportWithCount".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_viewport_with_count)]()[]
        self.cmd_set_scissor_with_count = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetScissorWithCount".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_scissor_with_count)]()[]
        self.cmd_bind_vertex_buffers_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindVertexBuffers2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_bind_vertex_buffers_2)]()[]
        self.cmd_set_depth_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthTestEnable".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_depth_test_enable)]()[]
        self.cmd_set_depth_write_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthWriteEnable".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_depth_write_enable)]()[]
        self.cmd_set_depth_compare_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthCompareOp".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_depth_compare_op)]()[]
        self.cmd_set_depth_bounds_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBoundsTestEnable".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_depth_bounds_test_enable)]()[]
        self.cmd_set_stencil_test_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilTestEnable".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_stencil_test_enable)]()[]
        self.cmd_set_stencil_op = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetStencilOp".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_stencil_op)]()[]
        self.cmd_set_rasterizer_discard_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRasterizerDiscardEnable".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_rasterizer_discard_enable)]()[]
        self.cmd_set_depth_bias_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetDepthBiasEnable".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_depth_bias_enable)]()[]
        self.cmd_set_primitive_restart_enable = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetPrimitiveRestartEnable".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_primitive_restart_enable)]()[]
        self.get_device_buffer_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceBufferMemoryRequirements".unsafe_ptr()
        )).bitcast[type_of(self.get_device_buffer_memory_requirements)]()[]
        self.get_device_image_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageMemoryRequirements".unsafe_ptr()
        )).bitcast[type_of(self.get_device_image_memory_requirements)]()[]
        self.get_device_image_sparse_memory_requirements = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageSparseMemoryRequirements".unsafe_ptr()
        )).bitcast[type_of(self.get_device_image_sparse_memory_requirements)]()[]


struct DeviceFunctionAdditionsV1_4(Movable):
    var cmd_set_line_stipple: fn(
        command_buffer: CommandBuffer, line_stipple_factor: UInt32, line_stipple_pattern: UInt16
    )
    var map_memory_2: fn(
        device: Device, memory_map_info: MemoryMapInfo, p_data: Ptr[NoneType, MutAnyOrigin]
    ) -> Result
    var unmap_memory_2: fn(device: Device, memory_unmap_info: MemoryUnmapInfo) -> Result
    var cmd_bind_index_buffer_2: fn(
        command_buffer: CommandBuffer,
        buffer: Buffer,
        offset: DeviceSize,
        size: DeviceSize,
        index_type: IndexType,
    )
    var get_rendering_area_granularity: fn(
        device: Device, rendering_area_info: RenderingAreaInfo, granularity: Extent2D
    )
    var get_device_image_subresource_layout: fn(
        device: Device, info: DeviceImageSubresourceInfo, layout: SubresourceLayout2
    )
    var get_image_subresource_layout_2: fn(
        device: Device, image: Image, subresource: ImageSubresource2, layout: SubresourceLayout2
    )
    var cmd_push_descriptor_set: fn(
        command_buffer: CommandBuffer,
        pipeline_bind_point: PipelineBindPoint,
        layout: PipelineLayout,
        set: UInt32,
        descriptor_write_count: UInt32,
        p_descriptor_writes: Ptr[WriteDescriptorSet, ImmutAnyOrigin],
    )
    var cmd_push_descriptor_set_with_template: fn(
        command_buffer: CommandBuffer,
        descriptor_update_template: DescriptorUpdateTemplate,
        layout: PipelineLayout,
        set: UInt32,
        p_data: Ptr[NoneType, ImmutAnyOrigin],
    )
    var cmd_set_rendering_attachment_locations: fn(
        command_buffer: CommandBuffer, location_info: RenderingAttachmentLocationInfo
    )
    var cmd_set_rendering_input_attachment_indices: fn(
        command_buffer: CommandBuffer,
        input_attachment_index_info: RenderingInputAttachmentIndexInfo,
    )
    var cmd_bind_descriptor_sets_2: fn(
        command_buffer: CommandBuffer, bind_descriptor_sets_info: BindDescriptorSetsInfo
    )
    var cmd_push_constants_2: fn(
        command_buffer: CommandBuffer, push_constants_info: PushConstantsInfo
    )
    var cmd_push_descriptor_set_2: fn(
        command_buffer: CommandBuffer, push_descriptor_set_info: PushDescriptorSetInfo
    )
    var cmd_push_descriptor_set_with_template_2: fn(
        command_buffer: CommandBuffer,
        push_descriptor_set_with_template_info: PushDescriptorSetWithTemplateInfo,
    )
    var copy_memory_to_image: fn(
        device: Device, copy_memory_to_image_info: CopyMemoryToImageInfo
    ) -> Result
    var copy_image_to_memory: fn(
        device: Device, copy_image_to_memory_info: CopyImageToMemoryInfo
    ) -> Result
    var copy_image_to_image: fn(
        device: Device, copy_image_to_image_info: CopyImageToImageInfo
    ) -> Result
    var transition_image_layout: fn(
        device: Device,
        transition_count: UInt32,
        p_transitions: Ptr[HostImageLayoutTransitionInfo, ImmutAnyOrigin],
    ) -> Result

    fn __init__(out self, device: Device, dlhandle: OwnedDLHandle):
        get_device_proc_addr = dlhandle.get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self.cmd_set_line_stipple = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetLineStipple".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_line_stipple)]()[]
        self.map_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkMapMemory2".unsafe_ptr()
        )).bitcast[type_of(self.map_memory_2)]()[]
        self.unmap_memory_2 = Ptr(to=get_device_proc_addr(
            device, "vkUnmapMemory2".unsafe_ptr()
        )).bitcast[type_of(self.unmap_memory_2)]()[]
        self.cmd_bind_index_buffer_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindIndexBuffer2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_bind_index_buffer_2)]()[]
        self.get_rendering_area_granularity = Ptr(to=get_device_proc_addr(
            device, "vkGetRenderingAreaGranularity".unsafe_ptr()
        )).bitcast[type_of(self.get_rendering_area_granularity)]()[]
        self.get_device_image_subresource_layout = Ptr(to=get_device_proc_addr(
            device, "vkGetDeviceImageSubresourceLayout".unsafe_ptr()
        )).bitcast[type_of(self.get_device_image_subresource_layout)]()[]
        self.get_image_subresource_layout_2 = Ptr(to=get_device_proc_addr(
            device, "vkGetImageSubresourceLayout2".unsafe_ptr()
        )).bitcast[type_of(self.get_image_subresource_layout_2)]()[]
        self.cmd_push_descriptor_set = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSet".unsafe_ptr()
        )).bitcast[type_of(self.cmd_push_descriptor_set)]()[]
        self.cmd_push_descriptor_set_with_template = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSetWithTemplate".unsafe_ptr()
        )).bitcast[type_of(self.cmd_push_descriptor_set_with_template)]()[]
        self.cmd_set_rendering_attachment_locations = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRenderingAttachmentLocations".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_rendering_attachment_locations)]()[]
        self.cmd_set_rendering_input_attachment_indices = Ptr(to=get_device_proc_addr(
            device, "vkCmdSetRenderingInputAttachmentIndices".unsafe_ptr()
        )).bitcast[type_of(self.cmd_set_rendering_input_attachment_indices)]()[]
        self.cmd_bind_descriptor_sets_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdBindDescriptorSets2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_bind_descriptor_sets_2)]()[]
        self.cmd_push_constants_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushConstants2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_push_constants_2)]()[]
        self.cmd_push_descriptor_set_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSet2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_push_descriptor_set_2)]()[]
        self.cmd_push_descriptor_set_with_template_2 = Ptr(to=get_device_proc_addr(
            device, "vkCmdPushDescriptorSetWithTemplate2".unsafe_ptr()
        )).bitcast[type_of(self.cmd_push_descriptor_set_with_template_2)]()[]
        self.copy_memory_to_image = Ptr(to=get_device_proc_addr(
            device, "vkCopyMemoryToImage".unsafe_ptr()
        )).bitcast[type_of(self.copy_memory_to_image)]()[]
        self.copy_image_to_memory = Ptr(to=get_device_proc_addr(
            device, "vkCopyImageToMemory".unsafe_ptr()
        )).bitcast[type_of(self.copy_image_to_memory)]()[]
        self.copy_image_to_image = Ptr(to=get_device_proc_addr(
            device, "vkCopyImageToImage".unsafe_ptr()
        )).bitcast[type_of(self.copy_image_to_image)]()[]
        self.transition_image_layout = Ptr(to=get_device_proc_addr(
            device, "vkTransitionImageLayout".unsafe_ptr()
        )).bitcast[type_of(self.transition_image_layout)]()[]
