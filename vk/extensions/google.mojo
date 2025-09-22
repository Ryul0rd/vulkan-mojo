from vk.core_functions import GlobalFunctions


struct DisplayTiming(Copyable, Movable):
    var _get_refresh_cycle_duration_google: fn(
        device: Device, swapchain: SwapchainKHR, pDisplayTimingProperties: Ptr[RefreshCycleDurationGOOGLE]
    ) -> Result
    var _get_past_presentation_timing_google: fn(
        device: Device, swapchain: SwapchainKHR, pPresentationTimingCount: Ptr[UInt32], pPresentationTimings: Ptr[PastPresentationTimingGOOGLE]
    ) -> Result

    fn __init__[T: GlobalFunctions](out self, global_fns: T, device: Device):
        var get_device_proc_addr = global_fns.handle().get_function[
            fn(device: Device, p_name: Ptr[UInt8]) -> PFN_vkVoidFunction
        ]("vkGetDeviceProcAddr")
        self._get_refresh_cycle_duration_google = Ptr(to=get_device_proc_addr(
            device, "vkGetRefreshCycleDurationGOOGLE".unsafe_ptr()
        )).bitcast[__type_of(self._get_refresh_cycle_duration_google)]()[]
        self._get_past_presentation_timing_google = Ptr(to=get_device_proc_addr(
            device, "vkGetPastPresentationTimingGOOGLE".unsafe_ptr()
        )).bitcast[__type_of(self._get_past_presentation_timing_google)]()[]

    fn get_refresh_cycle_duration_google(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut display_timing_properties: RefreshCycleDurationGOOGLE,
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_refresh_cycle_duration_google(
            device, swapchain, Ptr(to=display_timing_properties)
        )

    fn get_past_presentation_timing_google(
        self,
        device: Device,
        swapchain: SwapchainKHR,
        mut presentation_timing_count: UInt32,
        p_presentation_timings: Ptr[PastPresentationTimingGOOGLE],
    ) -> Result:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        return self._get_past_presentation_timing_google(
            device, swapchain, Ptr(to=presentation_timing_count), p_presentation_timings
        )

    fn get_past_presentation_timing_google(
        self, device: Device, swapchain: SwapchainKHR
    ) -> ListResult[PastPresentationTimingGOOGLE]:
        """See official vulkan docs for details.

        https://registry.khronos.org/vulkan/specs/latest/man/html/vkEnumerateInstanceVersion.html
        """
        var list = List[PastPresentationTimingGOOGLE]()
        var count: UInt32 = 0
        var result = Result.INCOMPLETE
        while result == Result.INCOMPLETE:
            result = self.get_past_presentation_timing_google(
                device, swapchain, count, Ptr[PastPresentationTimingGOOGLE]()
            )
            if result == Result.SUCCESS and count > 0:
                list.reserve(Int(count))
                result = self.get_past_presentation_timing_google(
                    device, swapchain, count, list.unsafe_ptr()
                )
        list._len = Int(count)
        return ListResult(list^, result)
