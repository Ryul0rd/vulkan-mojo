

struct Display:
    pass


@register_passable("trivial")
struct VisualID:
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value


@register_passable("trivial")
struct Window:
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value


@register_passable("trivial")
struct RROutput:
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value


struct wl_display:
    pass


struct wl_surface:
    pass


@register_passable("trivial")
struct HINSTANCE:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct HWND:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct HMONITOR:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct HANDLE:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


struct SECURITY_ATTRIBUTES:
    pass


@register_passable("trivial")
struct DWORD:
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value


@register_passable("trivial")
struct LPCWSTR:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


struct xcb_connection_t:
    pass


@register_passable("trivial")
struct xcb_visualid_t:
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value


@register_passable("trivial")
struct xcb_window_t:
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value


struct IDirectFB:
    pass


struct IDirectFBSurface:
    pass


@register_passable("trivial")
struct zx_handle_t:
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value


struct OHNativeWindow:
    pass


struct OH_NativeBuffer:
    pass


@register_passable("trivial")
struct GgpStreamDescriptor:
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value


@register_passable("trivial")
struct GgpFrameToken:
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn value(self) -> UInt32:
        return self._value


@register_passable("trivial")
struct screen_context_t:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct screen_window_t:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct screen_buffer_t:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct NvSciSyncAttrList:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct NvSciSyncObj:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


struct NvSciSyncFence:
    pass


@register_passable("trivial")
struct NvSciBufAttrList:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct NvSciBufObj:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


struct ANativeWindow:
    pass


struct AHardwareBuffer:
    pass


struct CAMetalLayer:
    pass


@register_passable("trivial")
struct MTLDevice_id:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct MTLCommandQueue_id:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct MTLBuffer_id:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct MTLTexture_id:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct MTLSharedEvent_id:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct IOSurfaceRef:
    var _value: UInt

    fn __init__(out self, *, value: UInt):
        self._value = value

    fn value(self) -> UInt:
        return self._value


@register_passable("trivial")
struct StdVideoH264ProfileIdc(Equatable):
    var _value: Int32

    fn __init__(out self, *, value: Int32):
        self._value = value

    fn value(self) -> Int32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    comptime BASELINE = StdVideoH264ProfileIdc(value = 66)
    comptime MAIN = StdVideoH264ProfileIdc(value = 77)
    comptime HIGH = StdVideoH264ProfileIdc(value = 100)
    comptime HIGH_444_PREDICTIVE = StdVideoH264ProfileIdc(value = 244)
    comptime INVALID = StdVideoH264ProfileIdc(value = 2147483647)


@register_passable("trivial")
struct StdVideoH264LevelIdc(Equatable):
    var _value: Int32

    fn __init__(out self, *, value: Int32):
        self._value = value

    fn value(self) -> Int32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    comptime LEVEL_1_0 = StdVideoH264LevelIdc(value = 0)
    comptime LEVEL_1_1 = StdVideoH264LevelIdc(value = 1)
    comptime LEVEL_1_2 = StdVideoH264LevelIdc(value = 2)
    comptime LEVEL_1_3 = StdVideoH264LevelIdc(value = 3)
    comptime LEVEL_2_0 = StdVideoH264LevelIdc(value = 4)
    comptime LEVEL_2_1 = StdVideoH264LevelIdc(value = 5)
    comptime LEVEL_2_2 = StdVideoH264LevelIdc(value = 6)
    comptime LEVEL_3_0 = StdVideoH264LevelIdc(value = 7)
    comptime LEVEL_3_1 = StdVideoH264LevelIdc(value = 8)
    comptime LEVEL_3_2 = StdVideoH264LevelIdc(value = 9)
    comptime LEVEL_4_0 = StdVideoH264LevelIdc(value = 10)
    comptime LEVEL_4_1 = StdVideoH264LevelIdc(value = 11)
    comptime LEVEL_4_2 = StdVideoH264LevelIdc(value = 12)
    comptime LEVEL_5_0 = StdVideoH264LevelIdc(value = 13)
    comptime LEVEL_5_1 = StdVideoH264LevelIdc(value = 14)
    comptime LEVEL_5_2 = StdVideoH264LevelIdc(value = 15)
    comptime LEVEL_6_0 = StdVideoH264LevelIdc(value = 16)
    comptime LEVEL_6_1 = StdVideoH264LevelIdc(value = 17)
    comptime LEVEL_6_2 = StdVideoH264LevelIdc(value = 18)
    comptime INVALID = StdVideoH264LevelIdc(value = 2147483647)


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
    var _value: Int32

    fn __init__(out self, *, value: Int32):
        self._value = value

    fn value(self) -> Int32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    comptime MAIN = StdVideoH265ProfileIdc(value = 1)
    comptime MAIN_10 = StdVideoH265ProfileIdc(value = 2)
    comptime MAIN_STILL_PICTURE = StdVideoH265ProfileIdc(value = 3)
    comptime FORMAT_RANGE_EXTENSIONS = StdVideoH265ProfileIdc(value = 4)
    comptime SCC_EXTENSIONS = StdVideoH265ProfileIdc(value = 9)
    comptime INVALID = StdVideoH265ProfileIdc(value = 2147483647)


@register_passable("trivial")
struct StdVideoH265LevelIdc(Equatable):
    var _value: Int32

    fn __init__(out self, *, value: Int32):
        self._value = value

    fn value(self) -> Int32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    comptime LEVEL_1_0 = StdVideoH265LevelIdc(value = 0)
    comptime LEVEL_2_0 = StdVideoH265LevelIdc(value = 1)
    comptime LEVEL_2_1 = StdVideoH265LevelIdc(value = 2)
    comptime LEVEL_3_0 = StdVideoH265LevelIdc(value = 3)
    comptime LEVEL_3_1 = StdVideoH265LevelIdc(value = 4)
    comptime LEVEL_4_0 = StdVideoH265LevelIdc(value = 5)
    comptime LEVEL_4_1 = StdVideoH265LevelIdc(value = 6)
    comptime LEVEL_5_0 = StdVideoH265LevelIdc(value = 7)
    comptime LEVEL_5_1 = StdVideoH265LevelIdc(value = 8)
    comptime LEVEL_5_2 = StdVideoH265LevelIdc(value = 9)
    comptime LEVEL_6_0 = StdVideoH265LevelIdc(value = 10)
    comptime LEVEL_6_1 = StdVideoH265LevelIdc(value = 11)
    comptime LEVEL_6_2 = StdVideoH265LevelIdc(value = 12)
    comptime INVALID = StdVideoH265LevelIdc(value = 2147483647)


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
    var _value: Int32

    fn __init__(out self, *, value: Int32):
        self._value = value

    fn value(self) -> Int32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    comptime MAIN = StdVideoAV1Profile(value = 0)
    comptime HIGH = StdVideoAV1Profile(value = 1)
    comptime PROFESSIONAL = StdVideoAV1Profile(value = 2)
    comptime INVALID = StdVideoAV1Profile(value = 2147483647)


@register_passable("trivial")
struct StdVideoAV1Level(Equatable):
    var _value: Int32

    fn __init__(out self, *, value: Int32):
        self._value = value

    fn value(self) -> Int32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    comptime LEVEL_2_0 = StdVideoAV1Level(value = 0)
    comptime LEVEL_2_1 = StdVideoAV1Level(value = 1)
    comptime LEVEL_2_2 = StdVideoAV1Level(value = 2)
    comptime LEVEL_2_3 = StdVideoAV1Level(value = 3)
    comptime LEVEL_3_0 = StdVideoAV1Level(value = 4)
    comptime LEVEL_3_1 = StdVideoAV1Level(value = 5)
    comptime LEVEL_3_2 = StdVideoAV1Level(value = 6)
    comptime LEVEL_3_3 = StdVideoAV1Level(value = 7)
    comptime LEVEL_4_0 = StdVideoAV1Level(value = 8)
    comptime LEVEL_4_1 = StdVideoAV1Level(value = 9)
    comptime LEVEL_4_2 = StdVideoAV1Level(value = 10)
    comptime LEVEL_4_3 = StdVideoAV1Level(value = 11)
    comptime LEVEL_5_0 = StdVideoAV1Level(value = 12)
    comptime LEVEL_5_1 = StdVideoAV1Level(value = 13)
    comptime LEVEL_5_2 = StdVideoAV1Level(value = 14)
    comptime LEVEL_5_3 = StdVideoAV1Level(value = 15)
    comptime LEVEL_6_0 = StdVideoAV1Level(value = 16)
    comptime LEVEL_6_1 = StdVideoAV1Level(value = 17)
    comptime LEVEL_6_2 = StdVideoAV1Level(value = 18)
    comptime LEVEL_6_3 = StdVideoAV1Level(value = 19)
    comptime LEVEL_7_0 = StdVideoAV1Level(value = 20)
    comptime LEVEL_7_1 = StdVideoAV1Level(value = 21)
    comptime LEVEL_7_2 = StdVideoAV1Level(value = 22)
    comptime LEVEL_7_3 = StdVideoAV1Level(value = 23)
    comptime INVALID = StdVideoAV1Level(value = 2147483647)


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
    var _value: Int32

    fn __init__(out self, *, value: Int32):
        self._value = value

    fn value(self) -> Int32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    comptime PROFILE_0 = StdVideoVP9Profile(value = 0)
    comptime PROFILE_1 = StdVideoVP9Profile(value = 1)
    comptime PROFILE_2 = StdVideoVP9Profile(value = 2)
    comptime PROFILE_3 = StdVideoVP9Profile(value = 3)
    comptime INVALID = StdVideoVP9Profile(value = 2147483647)


@register_passable("trivial")
struct StdVideoVP9Level(Equatable):
    var _value: Int32

    fn __init__(out self, *, value: Int32):
        self._value = value

    fn value(self) -> Int32:
        return self._value

    fn __eq__(self, other: Self) -> Bool:
        return self._value == other._value

    comptime LEVEL_1_0 = StdVideoVP9Level(value = 0)
    comptime LEVEL_1_1 = StdVideoVP9Level(value = 1)
    comptime LEVEL_2_0 = StdVideoVP9Level(value = 2)
    comptime LEVEL_2_1 = StdVideoVP9Level(value = 3)
    comptime LEVEL_3_0 = StdVideoVP9Level(value = 4)
    comptime LEVEL_3_1 = StdVideoVP9Level(value = 5)
    comptime LEVEL_4_0 = StdVideoVP9Level(value = 6)
    comptime LEVEL_4_1 = StdVideoVP9Level(value = 7)
    comptime LEVEL_5_0 = StdVideoVP9Level(value = 8)
    comptime LEVEL_5_1 = StdVideoVP9Level(value = 9)
    comptime LEVEL_5_2 = StdVideoVP9Level(value = 10)
    comptime LEVEL_6_0 = StdVideoVP9Level(value = 11)
    comptime LEVEL_6_1 = StdVideoVP9Level(value = 12)
    comptime LEVEL_6_2 = StdVideoVP9Level(value = 13)
    comptime INVALID = StdVideoVP9Level(value = 2147483647)


struct StdVideoDecodeVP9PictureInfo:
    pass
