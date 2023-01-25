from abc import abstractmethod
from typing import Optional, Protocol

class Imports(Protocol):
    @abstractmethod
    def roundtrip_option(self, a: Optional[int]) -> Optional[int]:
        raise NotImplementedError

