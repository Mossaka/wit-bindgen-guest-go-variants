from ..types import Result
from abc import abstractmethod
from dataclasses import dataclass
from typing import Protocol

WasiFuture = int
WasiStream = int
WallClock = int
MonotonicClock = int
@dataclass
class Datetime:
    seconds: int
    nanoseconds: int

Instant = int
Size = int
@dataclass
class StreamError:
    pass

class WasiPoll(Protocol):
    @abstractmethod
    def write_stream(self, stream: WasiStream, buf: bytes) -> Result[Size, StreamError]:
        raise NotImplementedError

