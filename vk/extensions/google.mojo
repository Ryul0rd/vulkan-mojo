from vk.core_functions import GlobalFunctions


struct DisplayTiming(Copyable):    var _vk_get_refresh_cycle_duration_google: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pDisplayTimingProperties: Ptr[RefreshCycleDurationGOOGLE, MutOrigin.external],
    ) -> Result
    var _vk_get_past_presentation_timing_google: fn(
        device: Device,
        swapchain: SwapchainKHR,
        pPresentationTimingCount: Ptr[UInt32, MutOrigin.external],
        pPresentationTimings: Ptr[PastPresentationTimingGOOGLE, MutOrigin.external],
    ) -> Result
