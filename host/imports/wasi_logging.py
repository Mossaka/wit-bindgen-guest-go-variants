from abc import abstractmethod
from enum import Enum
from typing import Protocol

class Level(Enum):
    TRACE = 0
    DEBUG = 1
    INFO = 2
    WARN = 3
    ERROR = 4

class WasiLogging(Protocol):
    @abstractmethod
    def log(self, level: Level, context: str, message: str) -> None:
        raise NotImplementedError

