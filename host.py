from host import VariantsImports, imports, wasi_filesystem, wasi_logging, wasi_poll
from typing import Tuple
import sys
import wasmtime
from host.imports.wasi_filesystem import Errno, Filesize, Size

from host.imports.wasi_logging import Level
from host.imports.wasi_poll import StreamError
from host.types import Result


class MyImports(imports.imports):
    def roundtrip_option(self, a: F1) -> F1:
        return a

    def roundtrip_result(self, a: R1) -> R1:
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

def run(wasm_file: str) -> None:
    store = wasmtime.Store()
    wasm = Records(store, RecordsImports(MyImports(), Logging(), Filesystem(), Poll()))
    
    wasm.test_imports(store)

if __name__ == '__main__':
    run(sys.argv[1])
