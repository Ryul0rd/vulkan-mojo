

struct Display:
    pass


@register_passable("trivial")
struct VisualID:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


@register_passable("trivial")
struct Window:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


@register_passable("trivial")
struct RROutput:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


struct wl_display:
    pass


struct wl_surface:
    pass


@register_passable("trivial")
struct HINSTANCE:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct HWND:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct HMONITOR:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct HANDLE:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


struct SECURITY_ATTRIBUTES:
    pass


@register_passable("trivial")
struct DWORD:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


@register_passable("trivial")
struct LPCWSTR:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


struct xcb_connection_t:
    pass


@register_passable("trivial")
struct xcb_visualid_t:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


@register_passable("trivial")
struct xcb_window_t:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


struct IDirectFB:
    pass


struct IDirectFBSurface:
    pass


@register_passable("trivial")
struct zx_handle_t:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


struct OHNativeWindow:
    pass


@register_passable("trivial")
struct GgpStreamDescriptor:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


@register_passable("trivial")
struct GgpFrameToken:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


@register_passable("trivial")
struct screen_context_t:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct screen_window_t:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct screen_buffer_t:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct NvSciSyncAttrList:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct NvSciSyncObj:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


struct NvSciSyncFence:
    pass


@register_passable("trivial")
struct NvSciBufAttrList:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct NvSciBufObj:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


struct ANativeWindow:
    pass


struct AHardwareBuffer:
    pass


struct CAMetalLayer:
    pass


@register_passable("trivial")
struct MTLDevice_id:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct MTLCommandQueue_id:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct MTLBuffer_id:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct MTLTexture_id:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct MTLSharedEvent_id:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct IOSurfaceRef:
    var _raw: UInt

    fn __init__(out self, *, raw: UInt):
        self._raw = raw

    fn raw(self) -> UInt:
        return self._raw


@register_passable("trivial")
struct StdVideoH264ProfileIdc(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime BASELINE = StdVideoH264ProfileIdc(raw = 66)
    comptime MAIN = StdVideoH264ProfileIdc(raw = 77)
    comptime HIGH = StdVideoH264ProfileIdc(raw = 100)
    comptime HIGH_444_PREDICTIVE = StdVideoH264ProfileIdc(raw = 244)
    comptime INVALID = StdVideoH264ProfileIdc(raw = 2147483647)


@register_passable("trivial")
struct StdVideoH264LevelIdc(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime LEVEL_1_0 = StdVideoH264LevelIdc(raw = 0)
    comptime LEVEL_1_1 = StdVideoH264LevelIdc(raw = 1)
    comptime LEVEL_1_2 = StdVideoH264LevelIdc(raw = 2)
    comptime LEVEL_1_3 = StdVideoH264LevelIdc(raw = 3)
    comptime LEVEL_2_0 = StdVideoH264LevelIdc(raw = 4)
    comptime LEVEL_2_1 = StdVideoH264LevelIdc(raw = 5)
    comptime LEVEL_2_2 = StdVideoH264LevelIdc(raw = 6)
    comptime LEVEL_3_0 = StdVideoH264LevelIdc(raw = 7)
    comptime LEVEL_3_1 = StdVideoH264LevelIdc(raw = 8)
    comptime LEVEL_3_2 = StdVideoH264LevelIdc(raw = 9)
    comptime LEVEL_4_0 = StdVideoH264LevelIdc(raw = 10)
    comptime LEVEL_4_1 = StdVideoH264LevelIdc(raw = 11)
    comptime LEVEL_4_2 = StdVideoH264LevelIdc(raw = 12)
    comptime LEVEL_5_0 = StdVideoH264LevelIdc(raw = 13)
    comptime LEVEL_5_1 = StdVideoH264LevelIdc(raw = 14)
    comptime LEVEL_5_2 = StdVideoH264LevelIdc(raw = 15)
    comptime LEVEL_6_0 = StdVideoH264LevelIdc(raw = 16)
    comptime LEVEL_6_1 = StdVideoH264LevelIdc(raw = 17)
    comptime LEVEL_6_2 = StdVideoH264LevelIdc(raw = 18)
    comptime INVALID = StdVideoH264LevelIdc(raw = 2147483647)


struct StdVideoH264SequenceParameterSet:
    pass


struct StdVideoH264PictureParameterSet:
    pass


struct StdVideoEncodeH264SliceHeader:
    pass


struct StdVideoEncodeH264PictureInfo:
    pass


struct StdVideoDecodeH264PictureInfo:
    pass


struct StdVideoEncodeH264ReferenceInfo:
    pass


struct StdVideoDecodeH264ReferenceInfo:
    pass


@register_passable("trivial")
struct StdVideoH265ProfileIdc(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime MAIN = StdVideoH265ProfileIdc(raw = 1)
    comptime MAIN_10 = StdVideoH265ProfileIdc(raw = 2)
    comptime MAIN_STILL_PICTURE = StdVideoH265ProfileIdc(raw = 3)
    comptime FORMAT_RANGE_EXTENSIONS = StdVideoH265ProfileIdc(raw = 4)
    comptime SCC_EXTENSIONS = StdVideoH265ProfileIdc(raw = 9)
    comptime INVALID = StdVideoH265ProfileIdc(raw = 2147483647)


@register_passable("trivial")
struct StdVideoH265LevelIdc(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime LEVEL_1_0 = StdVideoH265LevelIdc(raw = 0)
    comptime LEVEL_2_0 = StdVideoH265LevelIdc(raw = 1)
    comptime LEVEL_2_1 = StdVideoH265LevelIdc(raw = 2)
    comptime LEVEL_3_0 = StdVideoH265LevelIdc(raw = 3)
    comptime LEVEL_3_1 = StdVideoH265LevelIdc(raw = 4)
    comptime LEVEL_4_0 = StdVideoH265LevelIdc(raw = 5)
    comptime LEVEL_4_1 = StdVideoH265LevelIdc(raw = 6)
    comptime LEVEL_5_0 = StdVideoH265LevelIdc(raw = 7)
    comptime LEVEL_5_1 = StdVideoH265LevelIdc(raw = 8)
    comptime LEVEL_5_2 = StdVideoH265LevelIdc(raw = 9)
    comptime LEVEL_6_0 = StdVideoH265LevelIdc(raw = 10)
    comptime LEVEL_6_1 = StdVideoH265LevelIdc(raw = 11)
    comptime LEVEL_6_2 = StdVideoH265LevelIdc(raw = 12)
    comptime INVALID = StdVideoH265LevelIdc(raw = 2147483647)


struct StdVideoH265VideoParameterSet:
    pass


struct StdVideoH265SequenceParameterSet:
    pass


struct StdVideoH265PictureParameterSet:
    pass


struct StdVideoEncodeH265SliceSegmentHeader:
    pass


struct StdVideoEncodeH265PictureInfo:
    pass


struct StdVideoDecodeH265PictureInfo:
    pass


struct StdVideoEncodeH265ReferenceInfo:
    pass


struct StdVideoDecodeH265ReferenceInfo:
    pass


@register_passable("trivial")
struct StdVideoAV1Profile(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime MAIN = StdVideoAV1Profile(raw = 0)
    comptime HIGH = StdVideoAV1Profile(raw = 1)
    comptime PROFESSIONAL = StdVideoAV1Profile(raw = 2)
    comptime INVALID = StdVideoAV1Profile(raw = 2147483647)


@register_passable("trivial")
struct StdVideoAV1Level(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime LEVEL_2_0 = StdVideoAV1Level(raw = 0)
    comptime LEVEL_2_1 = StdVideoAV1Level(raw = 1)
    comptime LEVEL_2_2 = StdVideoAV1Level(raw = 2)
    comptime LEVEL_2_3 = StdVideoAV1Level(raw = 3)
    comptime LEVEL_3_0 = StdVideoAV1Level(raw = 4)
    comptime LEVEL_3_1 = StdVideoAV1Level(raw = 5)
    comptime LEVEL_3_2 = StdVideoAV1Level(raw = 6)
    comptime LEVEL_3_3 = StdVideoAV1Level(raw = 7)
    comptime LEVEL_4_0 = StdVideoAV1Level(raw = 8)
    comptime LEVEL_4_1 = StdVideoAV1Level(raw = 9)
    comptime LEVEL_4_2 = StdVideoAV1Level(raw = 10)
    comptime LEVEL_4_3 = StdVideoAV1Level(raw = 11)
    comptime LEVEL_5_0 = StdVideoAV1Level(raw = 12)
    comptime LEVEL_5_1 = StdVideoAV1Level(raw = 13)
    comptime LEVEL_5_2 = StdVideoAV1Level(raw = 14)
    comptime LEVEL_5_3 = StdVideoAV1Level(raw = 15)
    comptime LEVEL_6_0 = StdVideoAV1Level(raw = 16)
    comptime LEVEL_6_1 = StdVideoAV1Level(raw = 17)
    comptime LEVEL_6_2 = StdVideoAV1Level(raw = 18)
    comptime LEVEL_6_3 = StdVideoAV1Level(raw = 19)
    comptime LEVEL_7_0 = StdVideoAV1Level(raw = 20)
    comptime LEVEL_7_1 = StdVideoAV1Level(raw = 21)
    comptime LEVEL_7_2 = StdVideoAV1Level(raw = 22)
    comptime LEVEL_7_3 = StdVideoAV1Level(raw = 23)
    comptime INVALID = StdVideoAV1Level(raw = 2147483647)


struct StdVideoAV1SequenceHeader:
    pass


struct StdVideoAV1TimingInfo:
    pass


struct StdVideoAV1ColorConfig:
    pass


struct StdVideoAV1TileInfo:
    pass


struct StdVideoAV1Quantization:
    pass


struct StdVideoAV1Segmentation:
    pass


struct StdVideoAV1LoopFilter:
    pass


struct StdVideoAV1CDEF:
    pass


struct StdVideoAV1LoopRestoration:
    pass


struct StdVideoAV1FilmGrain:
    pass


struct StdVideoEncodeAV1PictureInfo:
    pass


struct StdVideoDecodeAV1PictureInfo:
    pass


struct StdVideoEncodeAV1ExtensionHeader:
    pass


struct StdVideoEncodeAV1DecoderModelInfo:
    pass


struct StdVideoEncodeAV1OperatingPointInfo:
    pass


struct StdVideoEncodeAV1ReferenceInfo:
    pass


struct StdVideoDecodeAV1ReferenceInfo:
    pass


@register_passable("trivial")
struct StdVideoVP9Profile(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime PROFILE_0 = StdVideoVP9Profile(raw = 0)
    comptime PROFILE_1 = StdVideoVP9Profile(raw = 1)
    comptime PROFILE_2 = StdVideoVP9Profile(raw = 2)
    comptime PROFILE_3 = StdVideoVP9Profile(raw = 3)
    comptime INVALID = StdVideoVP9Profile(raw = 2147483647)


@register_passable("trivial")
struct StdVideoVP9Level(Equatable):
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:
        return self._raw == other._raw

    comptime LEVEL_1_0 = StdVideoVP9Level(raw = 0)
    comptime LEVEL_1_1 = StdVideoVP9Level(raw = 1)
    comptime LEVEL_2_0 = StdVideoVP9Level(raw = 2)
    comptime LEVEL_2_1 = StdVideoVP9Level(raw = 3)
    comptime LEVEL_3_0 = StdVideoVP9Level(raw = 4)
    comptime LEVEL_3_1 = StdVideoVP9Level(raw = 5)
    comptime LEVEL_4_0 = StdVideoVP9Level(raw = 6)
    comptime LEVEL_4_1 = StdVideoVP9Level(raw = 7)
    comptime LEVEL_5_0 = StdVideoVP9Level(raw = 8)
    comptime LEVEL_5_1 = StdVideoVP9Level(raw = 9)
    comptime LEVEL_5_2 = StdVideoVP9Level(raw = 10)
    comptime LEVEL_6_0 = StdVideoVP9Level(raw = 11)
    comptime LEVEL_6_1 = StdVideoVP9Level(raw = 12)
    comptime LEVEL_6_2 = StdVideoVP9Level(raw = 13)
    comptime INVALID = StdVideoVP9Level(raw = 2147483647)


struct StdVideoDecodeVP9PictureInfo:
    pass
