

@register_passable("trivial")
struct SampleMask:
    var _value: UInt32

    fn __init__(out self, *, value: UInt32):
        self._value = value

    fn raw(self) -> UInt32:
        return self._value


@register_passable("trivial")
struct DeviceSize:
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn raw(self) -> UInt64:
        return self._value


@register_passable("trivial")
struct DeviceAddress:
    var _value: UInt64

    fn __init__(out self, *, value: UInt64):
        self._value = value

    fn raw(self) -> UInt64:
        return self._value


@register_passable("trivial")
struct RemoteAddressNV:
    var _value: Ptr[NoneType, MutOrigin.external]

    fn __init__(out self, *, value: Ptr[NoneType, MutOrigin.external]):
        self._value = value

    fn raw(self) -> Ptr[NoneType, MutOrigin.external]:
        return self._value
