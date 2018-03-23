import time
import OS_RS232


class ZE03_H2(object):
    """serial interface to ZE03-H2 sensor"""
    # -----------------------------
    # construction / destruction
    # defaults set for dev machine
    # -----------------------------
    def __init__(self, port=52, baud=9600):
        # get the serial port
        try:
            self._tty = OS_RS232.OS_RS232(port, baud).TTY
            if self._tty.closed:
                self._tty.open()
        except Exception, ex0:
            raise IOError('Failed to open serial port (' + str(port) + ') with Exception: ' + repr(ex0))

    def __del__(self):
        if hasattr(self, '_tty') and self._tty is not None and not self._tty.closed:
            self._tty.close()
        print '~ZE03_H2() called'

    class Modes:
        Active, QA = range(2)

    class Commands:
        SetAuto, SetQA = range(2)

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

    def ParseResponse(self, data):
        # check for valid data
        if (len(data) != 9):
            return ''
        if (data[0] != '\xff' or not (data[1] == '\x86' or data[1] == '\x78') ): 
            return ''
        # convert hex encoded values of chars 2 & 3 to reading
        return ord(data[2]) * 256 + ord(data[3])

    @staticmethod
    def BytearrayChecksum(data, length):
        jdx = 0
        tmp = 0

        for jdx in range(0, length-1):
            tmp = (tmp + data[jdx]) & 0xff

        return 0xff + (~tmp) + 1

    @staticmethod
    def ChecksumTest():
        cmd = bytearray([0xFF, 0x01, 0x78, 0x03, 0x00, 0x00, 0x00, 0x00, 0x84])
        chksum = ZE03_H2.BytearrayChecksum(cmd, len(cmd)-1)
        if (chksum != 0x84):
            return 'Fail'
        cmd = bytearray([0xFF, 0x01, 0x78, 0x04, 0x00, 0x00, 0x00, 0x00, 0x83])
        chksum = ZE03_H2.BytearrayChecksum(cmd, len(cmd)-1)
        if (chksum != 0x83):
            return 'Fail'
        cmd = bytearray([0xFF, 0x01, 0x86, 0x00, 0x00, 0x00, 0x00, 0x00, 0x79])
        chksum = ZE03_H2.BytearrayChecksum(cmd, len(cmd)-1)
        if (chksum != 0x79):
            return 'Fail'
        
        return 'Pass'



    