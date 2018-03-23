import platform
import serial

class OS_RS232(object):
    """open and return os independent serial object"""
    def __init__(self, port, baud):
        if platform.win32_ver()[0].isdigit():
            self.TTY = serial.Serial('COM' + str(port), 
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

