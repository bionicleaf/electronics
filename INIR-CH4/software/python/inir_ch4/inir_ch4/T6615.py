import time
from OS_RS232 import OS_RS232

class T6615(object):
    """serial interface to T6615 CO2 sensor"""
    # -----------------------------
    # construction / destruction
    # defaults set for dev machine
    # -----------------------------
    def __init__(self, port=52, baud=19200):
        # get the serial port
        try:
            self._tty = OS_RS232(port, baud).TTY
            if self._tty.closed:
                self._tty.open()
        except Exception, ex0:
            raise IOError('Failed to open serial port (' + str(port) + ') with Exception: ' + repr(ex0))

    def __del__(self):
        if hasattr(self, '_tty') and self._tty is not None and not self._tty.closed:
            self._tty.close()
        print '~ZE03() called'

    def Readtty(self):
        #self._tty.flushInput()
        time.sleep(1)
        response = ''
        while True:
            size = self._tty.inWaiting()
            if size:
                data = self._tty.read(size)
                response = response + data
            else:
                break
        return response     # string returned

    def SendReadCommand(self):
        cmd = bytearray([0xff, 0xfe, 0x02, 0x02, 0x03])
        self._tty.write(cmd)

    def ParseRead(self, data):
        if len(data) < 5:
            return ''
        if data[0] != '\xff' or data[1] != '\xfa' or data[2] != '\x02':
            return ''
        return 256 * ord(data[3]) + ord(data[4])

    def Read(self):
        self.SendReadCommand()
        return self.ParseRead(self.Readtty())
