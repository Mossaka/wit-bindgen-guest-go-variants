from host import Ar, Descriptor, VariantsImports, WasiStream, imports, wasi_filesystem, wasi_logging, wasi_poll, Variants
from typing import Optional, Tuple
import sys
import wasmtime
from host.imports.wasi_filesystem import Errno, Filesize, Size

from host.imports.wasi_logging import Level
from host.imports.wasi_poll import StreamError
from host.types import Err, Ok, Result


class MyImports(imports.Imports):
    def option_roundtrip1(self, a: Optional[Optional[Ar]]) -> Optional[Optional[Ar]]:
        return a
    def option_roundtrip2(self, a: Optional[Optional[int]]) -> Optional[Optional[int]]:
        return a
    def option_roundtrip3(self, a: Optional[int]) -> Optional[int]:
        return a
    def option_roundtrip4(self, a: Optional[Ar]) -> Optional[Ar]:
        return a
    def result_roundtrip(self, a: Result[int, int]) -> Result[int, int]:
        print(a)
        return a
    def roundtrip_option_result(self, a: Optional[Result[int, None]]) -> Optional[Result[int, None]]:
        return a
    def roundtrip_result_option(self, a: Result[Optional[int], None]) -> Result[Optional[int], None]:
        return a


class Logging(wasi_logging.WasiLogging):
    def log(self, level: Level, context: str, message: str) -> None:
        print(f"{message}")

class Filesystem(wasi_filesystem.WasiFilesystem):
    def write_via_stream(self, fd: Descriptor, offset: Filesize) -> Result[WasiStream, Errno]:
        raise NotImplementedError

class Poll(wasi_poll.WasiPoll):
    def write_stream(self, stream: WasiStream, buf: bytes) -> Result[Size, StreamError]:
        raise NotImplementedError

def run() -> None:
    store = wasmtime.Store()
    wasm = Variants(store, VariantsImports(MyImports(), Logging(), Filesystem(), Poll()))
    
    wasm.test_imports(store)
    assert(wasm.roundtrip_option3(store, None) == None)
    print(wasm.roundtrip_option3(store, 1))

    assert(wasm.roundtrip_result(store, Ok(Ar(1))) == Ok(Ar(1)))
    assert(wasm.roundtrip_result(store, Err(None)) == Err(None))

    assert(wasm.roundtrip_option_result(store, None) == None)
    assert(wasm.roundtrip_option_result(store, Ok(1)) == Ok(1))
    assert(wasm.roundtrip_option_result(store, Err(None)) == Err(None))
    
    assert(wasm.roundtrip_result_option(store, Ok(None)) == Ok(None))
    assert(wasm.roundtrip_result_option(store, Ok(1)) == Ok(1))

if __name__ == '__main__':
    run()
