import platform
import serial
import time

import InirCH4_Errors

class OS_RS232:
    def __init__(self, port, baud):
        if platform.win32_ver()[0].isdigit():
            self.TTY = serial.Serial(port, 
                                     baud, 
                                     bytesize=serial.EIGHTBITS, 
                                     parity=serial.PARITY_NONE, 
                                     stopbits=serial.STOPBITS_ONE, 
                                     timeout=2)
        else:
            try:
               self.TTY = serial.Serial('/dev/ttyS' + str(port), baud, timeout=2)
            except:
               self.TTY = serial.Serial('/dev/USB' + str(port), baud, timeout=2)

class InirCH4:

    # -----------------------------
    # construction / destruction
    # -----------------------------
    def __init__(self, port, baud=38400):
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
        time.sleep(0.120)
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

