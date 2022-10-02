from abc import abstractmethod
import ctypes
from dataclasses import dataclass
from enum import Enum
from typing import Any, Generic, Optional, TypeVar, Union, cast
import wasmtime

try:
    from typing import Protocol
except ImportError:
    class Protocol: # type: ignore
        pass

T = TypeVar('T')

def _clamp(i: int, min: int, max: int) -> int:
    if i < min or i > max:
        raise OverflowError(f'must be between {min} and {max}')
    return i

def _store(ty: Any, mem: wasmtime.Memory, store: wasmtime.Storelike, base: int, offset: int, val: Any) -> None:
    ptr = (base & 0xffffffff) + offset
    if ptr + ctypes.sizeof(ty) > mem.data_len(store):
        raise IndexError('out-of-bounds store')
    raw_base = mem.data_ptr(store)
    c_ptr = ctypes.POINTER(ty)(
        ty.from_address(ctypes.addressof(raw_base.contents) + ptr)
    )
    c_ptr[0] = val

@dataclass
class Ok(Generic[T]):
    value: T
E = TypeVar('E')
@dataclass
class Err(Generic[E]):
    value: E

Result = Union[Ok[T], Err[E]]
_i32_to_f32_i32 = ctypes.pointer(ctypes.c_int32(0))
_i32_to_f32_f32 = ctypes.cast(_i32_to_f32_i32, ctypes.POINTER(ctypes.c_float))

def _i32_to_f32(i: int) -> float:
    _i32_to_f32_i32[0] = i     # type: ignore
    return _i32_to_f32_f32[0]  # type: ignore
class E1(Enum):
    A = 0
    B = 1

@dataclass
class C1A:
    value: int

@dataclass
class C1B:
    value: int

C1 = Union[C1A, C1B]

class Imports(Protocol):
    @abstractmethod
    def roundtrip_option(self, a: Optional[float]) -> Optional[int]:
        raise NotImplementedError
    @abstractmethod
    def roundtrip_result(self, a: Result[int, float]) -> Result[float, int]:
        raise NotImplementedError
    @abstractmethod
    def roundtrip_enum(self, a: E1) -> E1:
        raise NotImplementedError
    @abstractmethod
    def variant_c1(self, a: C1) -> C1:
        raise NotImplementedError

def add_imports_to_linker(linker: wasmtime.Linker, store: wasmtime.Store, host: Imports) -> None:
    ty = wasmtime.FuncType([wasmtime.ValType.i32(), wasmtime.ValType.f32(), wasmtime.ValType.i32()], [])
    def roundtrip_option(caller: wasmtime.Caller, arg0: int, arg1: float, arg2: int) -> None:
        m = caller["memory"]
        assert(isinstance(m, wasmtime.Memory))
        memory = cast(wasmtime.Memory, m)
        option: Optional[float]
        if arg0 == 0:
            option = None
        elif arg0 == 1:
            option = arg1
        else:
            raise TypeError("invalid variant discriminant for option")
        ret = host.roundtrip_option(option)
        if ret is None:
            _store(ctypes.c_uint8, memory, caller, arg2, 0, 0)
        else:
            payload0 = ret
            _store(ctypes.c_uint8, memory, caller, arg2, 0, 1)
            _store(ctypes.c_uint8, memory, caller, arg2, 1, _clamp(payload0, 0, 255))
    linker.define('imports', 'roundtrip-option: func(a: option<float32>) -> option<u8>', wasmtime.Func(store, ty, roundtrip_option, access_caller = True))
    ty = wasmtime.FuncType([wasmtime.ValType.i32(), wasmtime.ValType.i32(), wasmtime.ValType.i32()], [])
    def roundtrip_result(caller: wasmtime.Caller, arg0: int, arg1: int, arg2: int) -> None:
        m = caller["memory"]
        assert(isinstance(m, wasmtime.Memory))
        memory = cast(wasmtime.Memory, m)
        expected: Result[int, float]
        if arg0 == 0:
            expected = Ok(arg1 & 0xffffffff)
        elif arg0 == 1:
            expected = Err(_i32_to_f32(arg1))
        else:
            raise TypeError("invalid variant discriminant for expected")
        ret = host.roundtrip_result(expected)
        if isinstance(ret, Ok):
            payload = ret.value
            _store(ctypes.c_uint8, memory, caller, arg2, 0, 0)
            _store(ctypes.c_double, memory, caller, arg2, 8, payload)
        elif isinstance(ret, Err):
            payload0 = ret.value
            _store(ctypes.c_uint8, memory, caller, arg2, 0, 1)
            _store(ctypes.c_uint8, memory, caller, arg2, 8, _clamp(payload0, 0, 255))
        else:
            raise TypeError("invalid variant specified for expected")
    linker.define('imports', 'roundtrip-result: func(a: result<u32, float32>) -> result<float64, u8>', wasmtime.Func(store, ty, roundtrip_result, access_caller = True))
    ty = wasmtime.FuncType([wasmtime.ValType.i32()], [wasmtime.ValType.i32()])
    def roundtrip_enum(caller: wasmtime.Caller, arg0: int) -> int:
        ret = host.roundtrip_enum(E1(arg0))
        return (ret).value
    linker.define('imports', 'roundtrip-enum: func(a: enum { a, b }) -> enum { a, b }', wasmtime.Func(store, ty, roundtrip_enum, access_caller = True))
    ty = wasmtime.FuncType([wasmtime.ValType.i32(), wasmtime.ValType.i64(), wasmtime.ValType.i32()], [])
    def variant_c1(caller: wasmtime.Caller, arg0: int, arg1: int, arg2: int) -> None:
        m = caller["memory"]
        assert(isinstance(m, wasmtime.Memory))
        memory = cast(wasmtime.Memory, m)
        variant: C1
        if arg0 == 0:
            variant = C1A(arg1)
        elif arg0 == 1:
            variant = C1B(arg1)
        else:
            raise TypeError("invalid variant discriminant for C1")
        ret = host.variant_c1(variant)
        if isinstance(ret, C1A):
            payload = ret.value
            _store(ctypes.c_uint8, memory, caller, arg2, 0, 0)
            _store(ctypes.c_uint32, memory, caller, arg2, 8, _clamp(payload, -2147483648, 2147483647))
        elif isinstance(ret, C1B):
            payload0 = ret.value
            _store(ctypes.c_uint8, memory, caller, arg2, 0, 1)
            _store(ctypes.c_uint64, memory, caller, arg2, 8, _clamp(payload0, -9223372036854775808, 9223372036854775807))
        else:
            raise TypeError("invalid variant specified for C1")
    linker.define('imports', 'variant-c1: func(a: variant { a(s32), b(s64) }) -> variant { a(s32), b(s64) }', wasmtime.Func(store, ty, variant_c1, access_caller = True))
