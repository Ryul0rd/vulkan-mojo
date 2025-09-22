

# remove Copyable and Movable traits once Collections no longer require it
struct Display(Copyable, Movable):
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


# remove Copyable and Movable traits once Collections no longer require it
struct wl_display(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct wl_surface(Copyable, Movable):
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


# remove Copyable and Movable traits once Collections no longer require it
struct SECURITY_ATTRIBUTES(Copyable, Movable):
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


# remove Copyable and Movable traits once Collections no longer require it
struct xcb_connection_t(Copyable, Movable):
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


# remove Copyable and Movable traits once Collections no longer require it
struct IDirectFB(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct IDirectFBSurface(Copyable, Movable):
    pass


@register_passable("trivial")
struct zx_handle_t:
    var _raw: UInt32

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


# remove Copyable and Movable traits once Collections no longer require it
struct OHNativeWindow(Copyable, Movable):
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


# remove Copyable and Movable traits once Collections no longer require it
struct NvSciSyncFence(Copyable, Movable):
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


# remove Copyable and Movable traits once Collections no longer require it
struct ANativeWindow(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct AHardwareBuffer(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct CAMetalLayer(Copyable, Movable):
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
struct StdVideoH264ProfileIdc:
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:

        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    alias BASELINE = StdVideoH264ProfileIdc(raw = 66)
    alias MAIN = StdVideoH264ProfileIdc(raw = 77)
    alias HIGH = StdVideoH264ProfileIdc(raw = 100)
    alias HIGH_444_PREDICTIVE = StdVideoH264ProfileIdc(raw = 244)
    alias INVALID = StdVideoH264ProfileIdc(raw = 2147483647)


@register_passable("trivial")
struct StdVideoH264LevelIdc:
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:

        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    alias LEVEL_1_0 = StdVideoH264LevelIdc(raw = 0)
    alias LEVEL_1_1 = StdVideoH264LevelIdc(raw = 1)
    alias LEVEL_1_2 = StdVideoH264LevelIdc(raw = 2)
    alias LEVEL_1_3 = StdVideoH264LevelIdc(raw = 3)
    alias LEVEL_2_0 = StdVideoH264LevelIdc(raw = 4)
    alias LEVEL_2_1 = StdVideoH264LevelIdc(raw = 5)
    alias LEVEL_2_2 = StdVideoH264LevelIdc(raw = 6)
    alias LEVEL_3_0 = StdVideoH264LevelIdc(raw = 7)
    alias LEVEL_3_1 = StdVideoH264LevelIdc(raw = 8)
    alias LEVEL_3_2 = StdVideoH264LevelIdc(raw = 9)
    alias LEVEL_4_0 = StdVideoH264LevelIdc(raw = 10)
    alias LEVEL_4_1 = StdVideoH264LevelIdc(raw = 11)
    alias LEVEL_4_2 = StdVideoH264LevelIdc(raw = 12)
    alias LEVEL_5_0 = StdVideoH264LevelIdc(raw = 13)
    alias LEVEL_5_1 = StdVideoH264LevelIdc(raw = 14)
    alias LEVEL_5_2 = StdVideoH264LevelIdc(raw = 15)
    alias LEVEL_6_0 = StdVideoH264LevelIdc(raw = 16)
    alias LEVEL_6_1 = StdVideoH264LevelIdc(raw = 17)
    alias LEVEL_6_2 = StdVideoH264LevelIdc(raw = 18)
    alias INVALID = StdVideoH264LevelIdc(raw = 2147483647)


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoH264SequenceParameterSet(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoH264PictureParameterSet(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeH264SliceHeader(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeH264PictureInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoDecodeH264PictureInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeH264ReferenceInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoDecodeH264ReferenceInfo(Copyable, Movable):
    pass


@register_passable("trivial")
struct StdVideoH265ProfileIdc:
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:

        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    alias MAIN = StdVideoH265ProfileIdc(raw = 1)
    alias MAIN_10 = StdVideoH265ProfileIdc(raw = 2)
    alias MAIN_STILL_PICTURE = StdVideoH265ProfileIdc(raw = 3)
    alias FORMAT_RANGE_EXTENSIONS = StdVideoH265ProfileIdc(raw = 4)
    alias SCC_EXTENSIONS = StdVideoH265ProfileIdc(raw = 9)
    alias INVALID = StdVideoH265ProfileIdc(raw = 2147483647)


@register_passable("trivial")
struct StdVideoH265LevelIdc:
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:

        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    alias LEVEL_1_0 = StdVideoH265LevelIdc(raw = 0)
    alias LEVEL_2_0 = StdVideoH265LevelIdc(raw = 1)
    alias LEVEL_2_1 = StdVideoH265LevelIdc(raw = 2)
    alias LEVEL_3_0 = StdVideoH265LevelIdc(raw = 3)
    alias LEVEL_3_1 = StdVideoH265LevelIdc(raw = 4)
    alias LEVEL_4_0 = StdVideoH265LevelIdc(raw = 5)
    alias LEVEL_4_1 = StdVideoH265LevelIdc(raw = 6)
    alias LEVEL_5_0 = StdVideoH265LevelIdc(raw = 7)
    alias LEVEL_5_1 = StdVideoH265LevelIdc(raw = 8)
    alias LEVEL_5_2 = StdVideoH265LevelIdc(raw = 9)
    alias LEVEL_6_0 = StdVideoH265LevelIdc(raw = 10)
    alias LEVEL_6_1 = StdVideoH265LevelIdc(raw = 11)
    alias LEVEL_6_2 = StdVideoH265LevelIdc(raw = 12)
    alias INVALID = StdVideoH265LevelIdc(raw = 2147483647)


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoH265VideoParameterSet(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoH265SequenceParameterSet(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoH265PictureParameterSet(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeH265SliceSegmentHeader(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeH265PictureInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoDecodeH265PictureInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeH265ReferenceInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoDecodeH265ReferenceInfo(Copyable, Movable):
    pass


@register_passable("trivial")
struct StdVideoAV1Profile:
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:

        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    alias MAIN = StdVideoAV1Profile(raw = 0)
    alias HIGH = StdVideoAV1Profile(raw = 1)
    alias PROFESSIONAL = StdVideoAV1Profile(raw = 2)
    alias INVALID = StdVideoAV1Profile(raw = 2147483647)


@register_passable("trivial")
struct StdVideoAV1Level:
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:

        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    alias LEVEL_2_0 = StdVideoAV1Level(raw = 0)
    alias LEVEL_2_1 = StdVideoAV1Level(raw = 1)
    alias LEVEL_2_2 = StdVideoAV1Level(raw = 2)
    alias LEVEL_2_3 = StdVideoAV1Level(raw = 3)
    alias LEVEL_3_0 = StdVideoAV1Level(raw = 4)
    alias LEVEL_3_1 = StdVideoAV1Level(raw = 5)
    alias LEVEL_3_2 = StdVideoAV1Level(raw = 6)
    alias LEVEL_3_3 = StdVideoAV1Level(raw = 7)
    alias LEVEL_4_0 = StdVideoAV1Level(raw = 8)
    alias LEVEL_4_1 = StdVideoAV1Level(raw = 9)
    alias LEVEL_4_2 = StdVideoAV1Level(raw = 10)
    alias LEVEL_4_3 = StdVideoAV1Level(raw = 11)
    alias LEVEL_5_0 = StdVideoAV1Level(raw = 12)
    alias LEVEL_5_1 = StdVideoAV1Level(raw = 13)
    alias LEVEL_5_2 = StdVideoAV1Level(raw = 14)
    alias LEVEL_5_3 = StdVideoAV1Level(raw = 15)
    alias LEVEL_6_0 = StdVideoAV1Level(raw = 16)
    alias LEVEL_6_1 = StdVideoAV1Level(raw = 17)
    alias LEVEL_6_2 = StdVideoAV1Level(raw = 18)
    alias LEVEL_6_3 = StdVideoAV1Level(raw = 19)
    alias LEVEL_7_0 = StdVideoAV1Level(raw = 20)
    alias LEVEL_7_1 = StdVideoAV1Level(raw = 21)
    alias LEVEL_7_2 = StdVideoAV1Level(raw = 22)
    alias LEVEL_7_3 = StdVideoAV1Level(raw = 23)
    alias INVALID = StdVideoAV1Level(raw = 2147483647)


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoAV1SequenceHeader(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoAV1TimingInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoAV1ColorConfig(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoAV1TileInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoAV1Quantization(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoAV1Segmentation(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoAV1LoopFilter(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoAV1CDEF(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoAV1LoopRestoration(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoAV1FilmGrain(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeAV1PictureInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoDecodeAV1PictureInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeAV1ExtensionHeader(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeAV1DecoderModelInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeAV1OperatingPointInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoEncodeAV1ReferenceInfo(Copyable, Movable):
    pass


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoDecodeAV1ReferenceInfo(Copyable, Movable):
    pass


@register_passable("trivial")
struct StdVideoVP9Profile:
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:

        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    alias PROFILE_0 = StdVideoVP9Profile(raw = 0)
    alias PROFILE_1 = StdVideoVP9Profile(raw = 1)
    alias PROFILE_2 = StdVideoVP9Profile(raw = 2)
    alias PROFILE_3 = StdVideoVP9Profile(raw = 3)
    alias INVALID = StdVideoVP9Profile(raw = 2147483647)


@register_passable("trivial")
struct StdVideoVP9Level:
    var _raw: Int32

    fn __init__(out self, *, raw: Int32):
        self._raw = raw

    fn raw(self) -> Int32:
        return self._raw

    fn __eq__(self, other: Self) -> Bool:

        return self._raw == other._raw

    fn __ne__(self, other: Self) -> Bool:
        return self._raw != other._raw

    alias LEVEL_1_0 = StdVideoVP9Level(raw = 0)
    alias LEVEL_1_1 = StdVideoVP9Level(raw = 1)
    alias LEVEL_2_0 = StdVideoVP9Level(raw = 2)
    alias LEVEL_2_1 = StdVideoVP9Level(raw = 3)
    alias LEVEL_3_0 = StdVideoVP9Level(raw = 4)
    alias LEVEL_3_1 = StdVideoVP9Level(raw = 5)
    alias LEVEL_4_0 = StdVideoVP9Level(raw = 6)
    alias LEVEL_4_1 = StdVideoVP9Level(raw = 7)
    alias LEVEL_5_0 = StdVideoVP9Level(raw = 8)
    alias LEVEL_5_1 = StdVideoVP9Level(raw = 9)
    alias LEVEL_5_2 = StdVideoVP9Level(raw = 10)
    alias LEVEL_6_0 = StdVideoVP9Level(raw = 11)
    alias LEVEL_6_1 = StdVideoVP9Level(raw = 12)
    alias LEVEL_6_2 = StdVideoVP9Level(raw = 13)
    alias INVALID = StdVideoVP9Level(raw = 2147483647)


# remove Copyable and Movable traits once Collections no longer require it
struct StdVideoDecodeVP9PictureInfo(Copyable, Movable):
    pass
