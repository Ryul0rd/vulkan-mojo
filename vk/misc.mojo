from std.memory import memset_zero, memcpy
from std.os import abort
from .enums import Result


def uninitialized[T: AnyType](out value: T):
    __mlir_op.`lit.ownership.mark_initialized`(__get_mvalue_as_litref(value))


def zero_init[T: AnyType](out value: T):
    value = uninitialized[T]()
    memset_zero(UnsafePointer(to=value), 1)


def get_packed_value[width: UInt32, offset: UInt32](packed_values: UInt32) -> UInt32:
    comptime assert width > 0
    comptime assert width <= 32
    comptime assert offset < 32
    comptime assert width + offset <= 32
    comptime mask: UInt32 = ((1 << (width + offset)) - 1) - ((1 << offset) - 1)
    return (packed_values & mask) >> offset


def set_packed_value[width: UInt32, offset: UInt32](mut packed_values: UInt32, new_value: UInt32):
    comptime assert width > 0
    comptime assert width <= 32
    comptime assert offset < 32
    comptime assert width + offset <= 32
    comptime mask: UInt32 = ((1 << (width + offset)) - 1) - ((1 << offset) - 1)
    comptime max_value: UInt32 = (1 << width) - 1
    if new_value > max_value:
        abort("Value too large to pack. Max value is " + String(max_value) + " but got value " + String(new_value))
    packed_values = packed_values & ~mask | (new_value << offset)


struct Bool32(TrivialRegisterPassable, Boolable, Hashable):
    var _value: UInt32

    def __init__(out self):
        self._value = 0

    @implicit
    def __init__(out self, value: Bool):
        self._value = UInt32(1 if value else 0)

    def __bool__(self) -> Bool:
        return Bool(self._value)


struct Version(TrivialRegisterPassable, Hashable, Writable):
    var _value: UInt32

    def __init__(out self, major: UInt32, minor: UInt32, patch: UInt32):
        self._value = (major << 22) | (minor << 12) | (patch)

    def __init__(out self, variant: UInt32, major: UInt32, minor: UInt32, patch: UInt32):
        self._value = (variant << 29) | (major << 22) | (minor << 12) | (patch)

    def variant(self) -> UInt32:
        return (self._value >> 29) & 0x7

    def major(self) -> UInt32:
        return (self._value >> 22) & 0x7F

    def minor(self) -> UInt32:
        return (self._value >> 12) & 0x3FF

    def patch(self) -> UInt32:
        return self._value & 0xFFF

    def value(self) -> UInt32:
        return self._value

    def write_to[W: Writer](self, mut writer: W):
        writer.write(
            self.major(),
            ".", self.minor(),
            ".", self.patch(),
        )


@fieldwise_init
struct ListResult[T: Copyable & ImplicitlyDeletable](Copyable):
    var list: List[Self.T]
    var result: Result

    def steal_list(mut self) -> List[Self.T]:
        var out = self.list^
        self.list = List[Self.T]()
        return out^