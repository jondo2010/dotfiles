# .gdbinit

python
import sys;
#sys.path.insert(0, '/usr/share/gcc-8/python');
#from libstdcxx.v6.printers import register_libstdcxx_printers;
#register_libstdcxx_printers(None)

sys.path.insert(0, "/home/jhughes/.gdb")
from qt import register_qt_printers
register_qt_printers (None)
end

set print pretty on

#source ~/.tools/gef/gef.py
