from abc import abstractmethod
import ctypes
from dataclasses import dataclass
from enum import Enum
from typing import Any, Generic, Optional, TypeVar, Union
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

def _load(ty: Any, mem: wasmtime.Memory, store: wasmtime.Storelike, base: int, offset: int) -> Any:
    ptr = (base & 0xffffffff) + offset
    if ptr + ctypes.sizeof(ty) > mem.data_len(store):
        raise IndexError('out-of-bounds store')
    raw_base = mem.data_ptr(store)
    c_ptr = ctypes.POINTER(ty)(
        ty.from_address(ctypes.addressof(raw_base.contents) + ptr)
    )
    return c_ptr[0]

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

def _f32_to_i32(i: float) -> int:
    _i32_to_f32_f32[0] = i    # type: ignore
    return _i32_to_f32_i32[0] # type: ignore
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

class Exports:
    instance: wasmtime.Instance
    _memory: wasmtime.Memory
    _roundtrip_enum: wasmtime.Func
    _roundtrip_option: wasmtime.Func
    _roundtrip_result: wasmtime.Func
    _test_imports: wasmtime.Func
    _variant_c1: wasmtime.Func
    def __init__(self, store: wasmtime.Store, linker: wasmtime.Linker, module: wasmtime.Module):
        self.instance = linker.instantiate(store, module)
        exports = self.instance.exports(store)
        
        memory = exports['memory']
        assert(isinstance(memory, wasmtime.Memory))
        self._memory = memory
        
        roundtrip_enum = exports['roundtrip-enum: func(a: enum { a, b }) -> enum { a, b }']
        assert(isinstance(roundtrip_enum, wasmtime.Func))
        self._roundtrip_enum = roundtrip_enum
        
        roundtrip_option = exports['roundtrip-option: func(a: option<float32>) -> option<u8>']
        assert(isinstance(roundtrip_option, wasmtime.Func))
        self._roundtrip_option = roundtrip_option
        
        roundtrip_result = exports['roundtrip-result: func(a: result<u32, float32>) -> result<float64, u8>']
        assert(isinstance(roundtrip_result, wasmtime.Func))
        self._roundtrip_result = roundtrip_result
        
        test_imports = exports['test-imports: func() -> ()']
        assert(isinstance(test_imports, wasmtime.Func))
        self._test_imports = test_imports
        
        variant_c1 = exports['variant-c1: func(a: variant { a(s32), b(s64) }) -> variant { a(s32), b(s64) }']
        assert(isinstance(variant_c1, wasmtime.Func))
        self._variant_c1 = variant_c1
    def test_imports(self, caller: wasmtime.Store) -> None:
        self._test_imports(caller)
    def roundtrip_option(self, caller: wasmtime.Store, a: Optional[float]) -> Optional[int]:
        memory = self._memory;
        if a is None:
            variant = 0
            variant1 = 0.0
        else:
            payload0 = a
            variant = 1
            variant1 = payload0
        ret = self._roundtrip_option(caller, variant, variant1)
        assert(isinstance(ret, int))
        load = _load(ctypes.c_uint8, memory, caller, ret, 0)
        option: Optional[int]
        if load == 0:
            option = None
        elif load == 1:
            load2 = _load(ctypes.c_uint8, memory, caller, ret, 1)
            option = _clamp(load2, 0, 255)
        else:
            raise TypeError("invalid variant discriminant for option")
        return option
    def roundtrip_result(self, caller: wasmtime.Store, a: Result[int, float]) -> Result[float, int]:
        memory = self._memory;
        if isinstance(a, Ok):
            payload = a.value
            variant = 0
            variant1 = _clamp(payload, 0, 4294967295)
        elif isinstance(a, Err):
            payload0 = a.value
            variant = 1
            variant1 = _f32_to_i32(payload0)
        else:
            raise TypeError("invalid variant specified for expected")
        ret = self._roundtrip_result(caller, variant, variant1)
        assert(isinstance(ret, int))
        load = _load(ctypes.c_uint8, memory, caller, ret, 0)
        expected: Result[float, int]
        if load == 0:
            load2 = _load(ctypes.c_double, memory, caller, ret, 8)
            expected = Ok(load2)
        elif load == 1:
            load3 = _load(ctypes.c_uint8, memory, caller, ret, 8)
            expected = Err(_clamp(load3, 0, 255))
        else:
            raise TypeError("invalid variant discriminant for expected")
        return expected
    def roundtrip_enum(self, caller: wasmtime.Store, a: E1) -> E1:
        ret = self._roundtrip_enum(caller, (a).value)
        assert(isinstance(ret, int))
        return E1(ret)
    def variant_c1(self, caller: wasmtime.Store, a: C1) -> C1:
        memory = self._memory;
        if isinstance(a, C1A):
            payload = a.value
            variant = 0
            variant1 = _clamp(payload, -2147483648, 2147483647)
        elif isinstance(a, C1B):
            payload0 = a.value
            variant = 1
            variant1 = _clamp(payload0, -9223372036854775808, 9223372036854775807)
        else:
            raise TypeError("invalid variant specified for C1")
        ret = self._variant_c1(caller, variant, variant1)
        assert(isinstance(ret, int))
        load = _load(ctypes.c_uint8, memory, caller, ret, 0)
        variant4: C1
        if load == 0:
            load2 = _load(ctypes.c_int32, memory, caller, ret, 8)
            variant4 = C1A(load2)
        elif load == 1:
            load3 = _load(ctypes.c_int64, memory, caller, ret, 8)
            variant4 = C1B(load3)
        else:
            raise TypeError("invalid variant discriminant for C1")
        return variant4
