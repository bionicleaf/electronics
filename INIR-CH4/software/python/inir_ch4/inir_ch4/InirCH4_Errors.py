class InirCH4_Errors:
    """Error codes returned by InirCH4 device"""

    def __init__(self):
        # errors dictionary shared by all instances
        self.Errors = {
            "GasOkay" : 0x0000000A  # NO ERROR
            ,"NotPresent" : 0x00000001  # 01-Sensor not Present
            ,"TempError" : 0x00000002  # 02-Temperature sensor not working OR Device Temperature Out of the Operating Range
            ,"WeakActiveOrRef" : 0x00000003  # 03-Active or Reference are weak
            ,"NoSettings" : 0x00000004  # 04-First Time Configuration Mode, no settings present
            # Power 1 
            ,"PowerOkay" : 0x000000A0  # NO ERROR
            ,"PowerOnReset" : 0x00000010  # 01-Last Reset was because of a Power on Reset
            ,"WatchdogReset" : 0x00000020  # 02-Last Reset was because of a Watchdog Timer
            ,"SoftwareReset" : 0x00000030  # 03-Last Reset was because of a Software Reset
            ,"ExtIntReset" : 0x00000040  # 04-Last Reset was because of an External Pin Interrupt
            ,"NotAssigned0" : 0x00000050  # 05-Not assigned yet
            # ADC 2 
            ,"AdcOkay" : 0x00000A00  # NO ERROR
            ,"NotStable" : 0x00000100  # 01-Gas concentration is not stable yet.
            # DAC Related 3 
            ,"DacOkay" : 0x0000A000  # NO ERROR
            ,"DacOff" : 0x00001000  # 01-DAC is switched off
            ,"DacDisable" : 0x00002000  # 02-DAC output disable in Configuration mode
            # UART 4 
            ,"UartOkay" : 0x000A0000  # NO ERROR
            ,"UartBreak" : 0x00010000  # 01-Break Indicator P1.0 set LOW for more than the maximum word length
            ,"UartFrameError" : 0x00020000  # 02-Framing Error, stop bit was invalid
            ,"UartParityError" : 0x00030000  # 03-Parity Error, stop bit was invalid
            ,"UartOverrun" : 0x00040000  # 04-Overrun Error, data overwrite before being read
            # TIMERS 5 
            ,"TimerOkay" : 0x00A00000  # NO ERROR
            ,"Timer1Error" : 0x00100000  # 01-Timer1 Error
            ,"Timer2Error" : 0x00200000  # 02-Timer2/Watchdog Error
            ,"NotAssigned1" : 0x00300000  # 03-Not assigned yet
            # General Error 6 
            ,"GeneralOkay" : 0x0A000000  # NO ERROR
            ,"ConcOverrange" : 0x01000000  # 01-Over Range of Conc.%v.v Operation > Full Scale
            ,"ConcUnderrange" : 0x02000000  # 02-Under Range of Conc.%v.v
            # MEMORY 7 
            ,"MemoryOkay" : 0xA0000000  # NO ERROR
            ,"MemWriteError" : 0x10000000  # 01-Unable to store Data, to the INIR
            ,"MemReadError" : 0x20000000  # 02-Unable to read Data from the INIR
            ,"NotAssigned2" : 0x30000000  # 03-Not assigned yet
        }


