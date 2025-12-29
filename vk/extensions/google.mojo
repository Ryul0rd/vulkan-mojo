from sys.ffi import CStringSlice, c_char
from vk.core_functions import GlobalFunctions


struct DisplayTiming(Copyable):
    var _get_refresh_cycle_duration_google: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pDisplayTimingProperties: Ptr[RefreshCycleDurationGOOGLE, MutAnyOrigin],
    ) -> Result
    var _get_past_presentation_timing_google: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pPresentationTimingCount: Ptr[UInt32, MutAnyOrigin],
        pPresentationTimings: Ptr[PastPresentationTimingGOOGLE, MutAnyOrigin],
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device) raises:
        var get_device_proc_addr = global_fns.borrow_handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8, ImmutAnyOrigin]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_refresh_cycle_duration_google = Ptr(to=get_device_proc_addr(
            device, "vkGetRefreshCycleDurationGOOGLE".unsafe_ptr()
        )).bitcast[type_of(self._get_refresh_cycle_duration_google)]()[]
        self._get_past_presentation_timing_google = Ptr(to=get_device_proc_addr(
            device, "vkGetPastPresentationTimingGOOGLE".unsafe_ptr()
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
        return self._get_refresh_cycle_duration_google(
            device,
            swapchain,
            Ptr(to=display_timing_properties).bitcast[RefreshCycleDurationGOOGLE](),
        )

    fn get_past_presentation_timing_google(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut presentation_timing_count: UInt32,
        p_presentation_timings: Ptr[PastPresentationTimingGOOGLE, MutAnyOrigin],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPastPresentationTimingGOOGLE.html
        """
        return self._get_past_presentation_timing_google(
            device,
            swapchain,
            Ptr(to=presentation_timing_count).bitcast[UInt32](),
            p_presentation_timings,
        )

    fn get_past_presentation_timing_google(
        self, device: Device, swapchain: SwapchainKHR
    ) -> ListResult[PastPresentationTimingGOOGLE]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkGetPastPresentationTimingGOOGLE.html
        """
        var list = List[PastPresentationTimingGOOGLE]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_past_presentation_timing_google(
                device, swapchain, count, Ptr[PastPresentationTimingGOOGLE, MutAnyOrigin]()
            )
        if result == Result.SUCCESS and count > 0:
            list.reserve(Int(count))
            result = self.get_past_presentation_timing_google(
                device, swapchain, count, list.unsafe_ptr()
            )
        list._len = Int(count)
        return ListResult(list^, result)
