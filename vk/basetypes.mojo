alias Ptr = UnsafePointer


@register_passable("trivial")
struct SampleMask:
    var _raw: UInt32

    fn __init__(out self):
        self._raw = UInt32()

    fn __init__(out self, *, raw: UInt32):
        self._raw = raw

    fn raw(self) -> UInt32:
        return self._raw


@register_passable("trivial")
struct DeviceSize:
    var _raw: UInt64

    fn __init__(out self):
        self._raw = UInt64()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw


@register_passable("trivial")
struct DeviceAddress:
    var _raw: UInt64

    fn __init__(out self):
        self._raw = UInt64()

    fn __init__(out self, *, raw: UInt64):
        self._raw = raw

    fn raw(self) -> UInt64:
        return self._raw


@register_passable("trivial")
struct RemoteAddressNV:
    var _raw: Ptr[NoneType]

    fn __init__(out self):
        self._raw = Ptr[NoneType]()

    fn __init__(out self, *, raw: Ptr[NoneType]):
        self._raw = raw

    fn raw(self) -> Ptr[NoneType]:
        return self._raw
