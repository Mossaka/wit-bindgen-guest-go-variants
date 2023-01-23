from ..types import Result
from abc import abstractmethod
from dataclasses import dataclass
from enum import Enum, Flag, auto
from typing import Optional, Protocol, Union

Descriptor = int
DirEntryStream = int
WasiStream = int
Size = int
Filesize = int
Filedelta = int
Timestamp = int
class DescriptorType(Enum):
    UNKNOWN = 0
    BLOCK_DEVICE = 1
    CHARACTER_DEVICE = 2
    DIRECTORY = 3
    FIFO = 4
    SYMBOLIC_LINK = 5
    REGULAR_FILE = 6
    SOCKET = 7

class DescriptorFlags(Flag):
    READ = auto()
    WRITE = auto()
    DSYNC = auto()
    NONBLOCK = auto()
    RSYNC = auto()
    SYNC = auto()

Device = int
Inode = int
Linkcount = int
@dataclass
class DescriptorStat:
    dev: Device
    ino: Inode
    type: DescriptorType
    nlink: Linkcount
    size: Filesize
    atim: Timestamp
    mtim: Timestamp
    ctim: Timestamp

class AtFlags(Flag):
    SYMLINK_FOLLOW = auto()

class OFlags(Flag):
    CREATE = auto()
    DIRECTORY = auto()
    EXCL = auto()
    TRUNC = auto()

class Mode(Flag):
    READABLE = auto()
    WRITEABLE = auto()
    EXECUTABLE = auto()

@dataclass
class NewTimestampNoChange:
    pass

@dataclass
class NewTimestampNow:
    pass

@dataclass
class NewTimestampTimestamp:
    value: Timestamp

NewTimestamp = Union[NewTimestampNoChange, NewTimestampNow, NewTimestampTimestamp]

@dataclass
class DirEntry:
    ino: Optional[Inode]
    type: DescriptorType
    name: str

class Errno(Enum):
    TOOBIG = 0
    ACCESS = 1
    ADDRINUSE = 2
    ADDRNOTAVAIL = 3
    AFNOSUPPORT = 4
    AGAIN = 5
    ALREADY = 6
    BADMSG = 7
    BADF = 8
    BUSY = 9
    CANCELED = 10
    CHILD = 11
    CONNABORTED = 12
    CONNREFUSED = 13
    CONNRESET = 14
    DEADLK = 15
    DESTADDRREQ = 16
    DQUOT = 17
    EXIST = 18
    FAULT = 19
    FBIG = 20
    HOSTUNREACH = 21
    IDRM = 22
    ILSEQ = 23
    INPROGRESS = 24
    INTR = 25
    INVAL = 26
    IO = 27
    ISCONN = 28
    ISDIR = 29
    LOOP = 30
    MFILE = 31
    MLINK = 32
    MSGSIZE = 33
    MULTIHOP = 34
    NAMETOOLONG = 35
    NETDOWN = 36
    NETRESET = 37
    NETUNREACH = 38
    NFILE = 39
    NOBUFS = 40
    NODEV = 41
    NOENT = 42
    NOEXEC = 43
    NOLCK = 44
    NOLINK = 45
    NOMEM = 46
    NOMSG = 47
    NOPROTOOPT = 48
    NOSPC = 49
    NOSYS = 50
    NOTDIR = 51
    NOTEMPTY = 52
    NOTRECOVERABLE = 53
    NOTSUP = 54
    NOTTY = 55
    NXIO = 56
    OVERFLOW = 57
    OWNERDEAD = 58
    PERM = 59
    PIPE = 60
    RANGE = 61
    ROFS = 62
    SPIPE = 63
    SRCH = 64
    STALE = 65
    TIMEDOUT = 66
    TXTBSY = 67
    XDEV = 68

class Advice(Enum):
    NORMAL = 0
    SEQUENTIAL = 1
    RANDOM = 2
    WILL_NEED = 3
    DONT_NEED = 4
    NO_REUSE = 5

class WasiFilesystem(Protocol):
    @abstractmethod
    def write_via_stream(self, fd: Descriptor, offset: Filesize) -> Result[WasiStream, Errno]:
        raise NotImplementedError

