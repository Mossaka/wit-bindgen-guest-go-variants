from .imports import VariantsImports, wasi_filesystem, wasi_logging, wasi_poll
from .intrinsics import _clamp, _decode_utf8, _encode_utf8, _list_canon_lift, _store
from .types import Err, Ok, Result
import ctypes
import os
from typing import List, Tuple, cast
import wasmtime

WasiStream = int
Descriptor = int
class Variants:
    
    def __init__(self, store: wasmtime.Store, import_object: VariantsImports) -> None:
        path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'variants.core2.wasm')
        module = wasmtime.Module.from_file(store.engine, path)
        instance0 = wasmtime.Instance(store, module, []).exports(store)
        path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'variants.core1.wasm')
        module = wasmtime.Module.from_file(store.engine, path)
        instance1 = wasmtime.Instance(store, module, [
            instance0["3"],
        ]).exports(store)
        path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'variants.core0.wasm')
        module = wasmtime.Module.from_file(store.engine, path)
        instance2 = wasmtime.Instance(store, module, [
            instance1["memory"],
            instance0["0"],
            instance0["1"],
            instance0["2"],
        ]).exports(store)
        core_memory0 = instance1["memory"]
        assert(isinstance(core_memory0, wasmtime.Memory))
        self._core_memory0 = core_memory0
        def lowering0_callee(caller: wasmtime.Caller, arg0: int, arg1: int, arg2: int, arg3: int, arg4: int) -> None:
            ptr = arg1
            len0 = arg2
            list = _decode_utf8(self._core_memory0, caller, ptr, len0)
            ptr1 = arg3
            len2 = arg4
            list3 = _decode_utf8(self._core_memory0, caller, ptr1, len2)
            import_object.wasi_logging.log(wasi_logging.Level(arg0), list, list3)
        lowering0_ty = wasmtime.FuncType([wasmtime.ValType.i32(), wasmtime.ValType.i32(), wasmtime.ValType.i32(), wasmtime.ValType.i32(), wasmtime.ValType.i32(), ], [])
        lowering0 = wasmtime.Func(store, lowering0_ty, lowering0_callee, access_caller = True)
        def lowering1_callee(caller: wasmtime.Caller, arg0: int, arg1: int, arg2: int) -> None:
            ret = import_object.wasi_filesystem.write_via_stream(arg0 & 0xffffffff, arg1 & 0xffffffffffffffff)
            if isinstance(ret, Ok):
                payload = ret.value
                _store(ctypes.c_uint8, self._core_memory0, caller, arg2, 0, 0)
                _store(ctypes.c_uint32, self._core_memory0, caller, arg2, 4, _clamp(payload, 0, 4294967295))
            elif isinstance(ret, Err):
                payload0 = ret.value
                _store(ctypes.c_uint8, self._core_memory0, caller, arg2, 0, 1)
                _store(ctypes.c_uint8, self._core_memory0, caller, arg2, 4, (payload0).value)
            else:
                raise TypeError("invalid variant specified for expected")
        lowering1_ty = wasmtime.FuncType([wasmtime.ValType.i32(), wasmtime.ValType.i64(), wasmtime.ValType.i32(), ], [])
        lowering1 = wasmtime.Func(store, lowering1_ty, lowering1_callee, access_caller = True)
        def lowering2_callee(caller: wasmtime.Caller, arg0: int, arg1: int, arg2: int, arg3: int) -> None:
            ptr = arg1
            len0 = arg2
            list = cast(bytes, _list_canon_lift(ptr, len0, 1, ctypes.c_uint8, self._core_memory0, caller))
            ret = import_object.wasi_poll.write_stream(arg0 & 0xffffffff, list)
            if isinstance(ret, Ok):
                payload = ret.value
                _store(ctypes.c_uint8, self._core_memory0, caller, arg3, 0, 0)
                _store(ctypes.c_uint32, self._core_memory0, caller, arg3, 4, _clamp(payload, 0, 4294967295))
            elif isinstance(ret, Err):
                payload1 = ret.value
                _store(ctypes.c_uint8, self._core_memory0, caller, arg3, 0, 1)
            else:
                raise TypeError("invalid variant specified for expected")
        lowering2_ty = wasmtime.FuncType([wasmtime.ValType.i32(), wasmtime.ValType.i32(), wasmtime.ValType.i32(), wasmtime.ValType.i32(), ], [])
        lowering2 = wasmtime.Func(store, lowering2_ty, lowering2_callee, access_caller = True)
        path = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'variants.core3.wasm')
        module = wasmtime.Module.from_file(store.engine, path)
        instance3 = wasmtime.Instance(store, module, [
            lowering0,
            lowering1,
            lowering2,
            instance2["fd_write"],
            instance0["$imports"],
        ]).exports(store)
        realloc0 = instance2["cabi_export_realloc"]
        assert(isinstance(realloc0, wasmtime.Func))
        self._realloc0 = realloc0
        lift_callee0 = instance1["test-imports"]
        assert(isinstance(lift_callee0, wasmtime.Func))
        self.lift_callee0 = lift_callee0
        lift_callee1 = instance2["command"]
        assert(isinstance(lift_callee1, wasmtime.Func))
        self.lift_callee1 = lift_callee1
    def test_imports(self, caller: wasmtime.Store) -> None:
        self.lift_callee0(caller)
    def command(self, caller: wasmtime.Store, stdin: WasiStream, stdout: WasiStream, args: List[str], env_vars: List[Tuple[str, str]], preopens: List[Tuple[Descriptor, str]]) -> Result[None, None]:
        vec = args
        len2 = len(vec)
        result = self._realloc0(caller, 0, 0, 4, len2 * 8)
        assert(isinstance(result, int))
        for i3 in range(0, len2):
            e = vec[i3]
            base0 = result + i3 * 8
            ptr, len1 = _encode_utf8(e, self._realloc0, self._core_memory0, caller)
            _store(ctypes.c_uint32, self._core_memory0, caller, base0, 4, len1)
            _store(ctypes.c_uint32, self._core_memory0, caller, base0, 0, ptr)
        vec11 = env_vars
        len13 = len(vec11)
        result12 = self._realloc0(caller, 0, 0, 4, len13 * 16)
        assert(isinstance(result12, int))
        for i14 in range(0, len13):
            e4 = vec11[i14]
            base5 = result12 + i14 * 16
            (tuplei,tuplei6,) = e4
            ptr7, len8 = _encode_utf8(tuplei, self._realloc0, self._core_memory0, caller)
            _store(ctypes.c_uint32, self._core_memory0, caller, base5, 4, len8)
            _store(ctypes.c_uint32, self._core_memory0, caller, base5, 0, ptr7)
            ptr9, len10 = _encode_utf8(tuplei6, self._realloc0, self._core_memory0, caller)
            _store(ctypes.c_uint32, self._core_memory0, caller, base5, 12, len10)
            _store(ctypes.c_uint32, self._core_memory0, caller, base5, 8, ptr9)
        vec21 = preopens
        len23 = len(vec21)
        result22 = self._realloc0(caller, 0, 0, 4, len23 * 12)
        assert(isinstance(result22, int))
        for i24 in range(0, len23):
            e15 = vec21[i24]
            base16 = result22 + i24 * 12
            (tuplei17,tuplei18,) = e15
            _store(ctypes.c_uint32, self._core_memory0, caller, base16, 0, _clamp(tuplei17, 0, 4294967295))
            ptr19, len20 = _encode_utf8(tuplei18, self._realloc0, self._core_memory0, caller)
            _store(ctypes.c_uint32, self._core_memory0, caller, base16, 8, len20)
            _store(ctypes.c_uint32, self._core_memory0, caller, base16, 4, ptr19)
        ret = self.lift_callee1(caller, _clamp(stdin, 0, 4294967295), _clamp(stdout, 0, 4294967295), result, len2, result12, len13, result22, len23)
        assert(isinstance(ret, int))
        expected: Result[None, None]
        if ret == 0:
            expected = Ok(None)
        elif ret == 1:
            expected = Err(None)
        else:
            raise TypeError("invalid variant discriminant for expected")
        return expected
