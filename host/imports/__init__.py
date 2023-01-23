from .wasi_filesystem import WasiFilesystem
from .wasi_logging import WasiLogging
from .wasi_poll import WasiPoll
from dataclasses import dataclass

@dataclass
class VariantsImports:
    wasi_logging: WasiLogging
    wasi_filesystem: WasiFilesystem
    wasi_poll: WasiPoll
