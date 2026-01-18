from sys.ffi import OwnedDLHandle, CStringSlice, c_char
from memory import ArcPointer
from vk.core_functions import GlobalFunctions


struct DisplayTiming(Copyable):
    var _dlhandle: ArcPointer[OwnedDLHandle]
    var _get_refresh_cycle_duration_google: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_display_timing_properties: Ptr[RefreshCycleDurationGOOGLE, MutAnyOrigin],
    ) -> Result
    var _get_past_presentation_timing_google: fn(
        device: Device,
        swapchain: SwapchainKHR,
        p_presentation_timing_count: Ptr[UInt32, MutAnyOrigin],
        p_presentation_timings: Ptr[PastPresentationTimingGOOGLE, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_functions: T, device: Device):
        self._dlhandle = global_functions.get_dlhandle()
        var get_device_proc_addr = global_functions.get_dlhandle()[].get_function[
            fn(device: Device, p_name: CStringSlice[StaticConstantOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_refresh_cycle_duration_google = Ptr(to=get_device_proc_addr(
            device, "vkGetRefreshCycleDurationGOOGLE".as_c_string_slice()
        )).bitcast[type_of(self._get_refresh_cycle_duration_google)]()[]
        self._get_past_presentation_timing_google = Ptr(to=get_device_proc_addr(
            device, "vkGetPastPresentationTimingGOOGLE".as_c_string_slice()
        )).bitcast[type_of(self._get_past_presentation_timing_google)]()[]

    fn get_refresh_cycle_duration_google(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut display_timing_properties: RefreshCycleDurationGOOGLE,
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetRefreshCycleDurationGOOGLE.html
        """
        return self._get_refresh_cycle_duration_google(device, swapchain, Ptr(to=display_timing_properties))

    fn get_past_presentation_timing_google[p_presentation_timings_origin: MutOrigin = MutAnyOrigin](
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut presentation_timing_count: UInt32,
        p_presentation_timings: Ptr[PastPresentationTimingGOOGLE, p_presentation_timings_origin],
    ) -> Result:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPastPresentationTimingGOOGLE.html
        """
        return self._get_past_presentation_timing_google(
            device,
            swapchain,
            Ptr(to=presentation_timing_count),
            Ptr(to=p_presentation_timings).bitcast[Ptr[PastPresentationTimingGOOGLE, MutAnyOrigin]]()[],
        )

    fn get_past_presentation_timing_google[p_presentation_timings_origin: MutOrigin = MutAnyOrigin](
        self, device: Device, swapchain: SwapchainKHR
    ) -> ListResult[PastPresentationTimingGOOGLE]:
        """See official vulkan docs for details.
        
        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPastPresentationTimingGOOGLE.html
        """
        var list = List[PastPresentationTimingGOOGLE]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self._get_past_presentation_timing_google(
        device, swapchain, Ptr(to=count), Ptr[PastPresentationTimingGOOGLE, MutOrigin.external]()
    )
            if result == Result.SUCCESS:
                list.reserve(Int(count))
                result = self._get_past_presentation_timing_google(
        device, swapchain, Ptr(to=count), list.unsafe_ptr()
    )
        list._len = Int(count)
        return ListResult(list^, result)
