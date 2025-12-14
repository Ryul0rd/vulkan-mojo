from memory import memset_zero, memcpy


comptime Ptr = UnsafePointer


fn uninitialized[T: AnyType](out value: T):
    __mlir_op.`lit.ownership.mark_initialized`(__get_mvalue_as_litref(value))


fn zero_init[T: AnyType](out value: T):
    value = uninitialized[T]()
    memset_zero(Ptr(to=value), 1)


@register_passable("trivial")
struct Bool32(Boolable, Equatable):
    var _val: UInt32

    fn __init__(out self):
        self._val = 0

    @implicit
    fn __init__(out self, value: Bool):
        self._val = 1 if value else 0

    fn __bool__(self) -> Bool:
        return Bool(self._val)

    fn __eq__(self, other: Self) -> Bool:
        return self._val == other._val


@register_passable("trivial")
struct Version(Writable):
    var _data: UInt32

    fn __init__(out self, major: UInt32, minor: UInt32, patch: UInt32):
        self._data = (major << 22) | (minor << 12) | (patch)

    fn __init__(out self, variant: UInt32, major: UInt32, minor: UInt32, patch: UInt32):
        self._data = (variant << 29) | (major << 22) | (minor << 12) | (patch)

    fn variant(self) -> UInt32:
        return (self._data >> 29) & 0x7

    fn major(self) -> UInt32:
        return (self._data >> 22) & 0x7F

    fn minor(self) -> UInt32:
        return (self._data >> 12) & 0x3FF

    fn patch(self) -> UInt32:
        return self._data & 0xFFF

    fn data(self) -> UInt32:
        return self._data

    fn write_to[W: Writer](self, mut writer: W):
        writer.write(
            self.major(),
            ".", self.minor(),
            ".", self.patch(),
        )


@fieldwise_init
struct ListResult[T: Copyable & Movable](Copyable, Movable):
    var list: List[Self.T]
    var result: Result

    fn steal_list(mut self) -> List[Self.T]:
        var out = self.list^
        self.list = List[Self.T]()
        return out^