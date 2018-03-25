import sys
import time
import re

import InirCH4_Errors
from OS_RS232 import OS_RS232

class InirCH4:

    # -----------------------------
    # construction / destruction
    # defaults set for dev machine
    # -----------------------------
    def __init__(self, port=49, baud=38400):
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
        print '~InirCH4() called'

    # -----------------------------
    # public interface
    # -----------------------------
    class Modes:
        Configuration, Normal, Engineering, OnDemand = range(4)

    class Commands:
        ReadConfig, LoadConfig, ResetConfig = range(3)

    def Readtty(self):
        #self._tty.flushInput()
        time.sleep(1)
        response = []
        while True:
            size = self._tty.inWaiting()
            if size:
                data = self._tty.read(size)
                response.append(data)
            else:
                break
        return response

    def SetMode(self, mode):
        # throw on error
        try:
            cmd = { 
                self.Modes.Normal : '0x005B415D'
                ,self.Modes.Engineering : '0x005B425D'
                ,self.Modes.Configuration : '0x005B435D' 
                ,self.Modes.OnDemand : '0x005B485D' 
            }[mode]

            # set the mode
            self._tty.write(bytearray(cmd))
            #self._tty.flush()

            # read the response
            response = self.Readtty()
            if len(response) > 0:
                print response
            else:
                print '.'

        except Exception, ex2:
            print ('SetMode fails with: ' + repr(ex2))

    def SendCommand(self, command):
        # throw on error
        try:
            cmd = { 
                self.Commands.ReadConfig : '0x005B495D'
                ,self.Commands.LoadConfig : '0x005B4A5D'
                ,self.Commands.ResetConfig : '0x005B4B5D'
            }[command]

            # set the comand
            self._tty.write(bytearray(cmd))
            #self._tty.flush()

            # read the response
            response = self.Readtty()
            if len(response) > 0:
                print response
            else:
                print '.'

        except Exception, ex2:
            print 'SendCommand fails with: ' + repr(ex2)


    def DoInitSequence(self):
        try:
            self.SetMode(self.Modes.Configuration)
            self.SendCommand(self.Commands.ReadConfig)
            self.SetMode(self.Modes.Engineering)

        except Exception, ex3:
            print 'DoInitSequence failed with: ' + repr(ex3)

    @property
    def Errors(self):
        # move this gore to another file
        return InirCH4_Errors.InirCH4_Errors


class EngrData:

    engrRegex = re.compile(r"(?P<lbkt>[0-9a-f]{8})\n\r(?P<ppm>[0-9a-f]{8})\n\r(?P<faults>[0-9a-f]{8})\n\r(?P<temp>[0-9a-f]{8})\n\r(?P<refavg>[0-9a-f]{8})\n\r(?P<actavg>[0-9a-f]{8})\n\r(?P<crc>[0-9a-f]{8})\n\r(?P<crc1>[0-9a-f]{8})\n\r(?P<rbkt>[0-9a-f]{8})\n\r")

    def __init__(self, data):
        # ['0000005b\n\r00000000\n\raaaaaa1a\n\r00000be6\n\r00012c07\n\r000118a3\n\r00000454\n\rfffffbab\n\r0000005d\n\r']
        self.data = data
        try:
            if not self.data is None and len(self.data) > 0:
                self.Values = EngrData.engrRegex.match(self.data[0])
                self.PPM = int(self.Values.group('ppm'), 16)
                self.Faults = self.Values.group('faults')
                self.Temperature = int(self.Values.group('temp'), 16)
        except Exception, ex:
            pass

    def out(self):
        if hasattr(self, 'Values') and not self.Values is None:
            sys.stdout.write ('\rppm=' + str(self.PPM) + '\t\tTemperature=' + str(float(self.Temperature/10)))



