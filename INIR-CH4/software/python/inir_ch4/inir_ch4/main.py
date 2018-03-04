import signal
import string
import keyboard
import sys

import IInir_CH4

ch4 = None
commport = 'COM7'

# wrap print for debug echo
def echo(cmd):
    print (cmd)

def connect(cmd, params):
    global ch4, EscPressed
    echo (cmd + ': ' + params)

    # create the sensor object
    ch4 = IInir_CH4.InirCH4(commport, 38400)
    # initialize it
    ch4.DoInitSequence()

def disconnect(cmd, params):
    global ch4
    echo (cmd + ': ' + params)

    # create the sensor object
    if ch4 is not None:
        del ch4

def intializeINIR (cmd, params):
    global ch4, EscPressed
    echo (cmd + ': ' + params)
    ch4.DoInitSequence()

    StartEscListener()
    while not EscPressed:
        data = ch4.Readtty()
        if len(data) > 0:
            print data

def normalMode (cmd, params):
    global ch4, EscPressed
    echo (cmd + ': ' + params)
    ch4.SetMode(ch4.Modes.Normal)

    StartEscListener()
    while not EscPressed:
        data = ch4.Readtty()
        if len(data) > 0:
            print data

def engineerMode (cmd, params):
    global ch4, EscPressed
    echo (cmd + ': ' + params)
    ch4.SetMode(ch4.Modes.Engineering)

    StartEscListener()
    while not EscPressed:
        data = ch4.Readtty()
        if len(data) > 0:
            print data

def configurationMode (cmd, params):
    global ch4, EscPressed
    echo (cmd + ': ' + params)
    ch4.SetMode(ch4.Modes.Configuration)

    StartEscListener()
    while not EscPressed:
        data = ch4.Readtty()
        if len(data) > 0:
            print data

def sendCommand(cmd, params):
    global ch4, EscPressed
    echo (cmd + ': ' + params)
    command = { 
        'read' : ch4.Commands.ReadConfig
        ,'load' : ch4.Commands.LoadConfig
        ,'reset' : ch4.Commands.ResetConfig
    }[cmd]
    ch4.SendCommand(command)

    StartEscListener()
    while not EscPressed:
        data = ch4.Readtty()
        if len(data) > 0:
            print data

def parseLine(line):
    try:
        line = line.strip()
        if len(line) < 4:
            raise SyntaxError('command too short')
        cmd = line[:4].lower()
        params = line[4:].strip()

        try:
            # execute the appropriate function
            {
                'conn' : connect
                ,'disc' : disconnect
                # ,'init' : intializeINIR deprecate?
                ,'norm' : normalMode
                ,'engr' : engineerMode
                ,'calb' : configurationMode
                ,'read' : sendCommand
                ,'load' : sendCommand
                ,'reset' : sendCommand
            }[cmd](cmd, params)

        except Exception, ex:
            echo (repr(ex))

    except Exception, ex:
        echo (ex.message)

def cmdLoop():

    _prompt = '> '
    while True:
        sys.stdout.write(_prompt);
        line = sys.stdin.readline()
        parseLine(line)

# set up control-C handler
def signal_handler(signal, frame):
    global ch4
    disconnect('disc', '')
    sys.exit(0)


# handle ESC key while reading data from sensor
EscPressed = False
keysHooked = False

# keyboard listener to detect ESC key
def onKeyPress(key):
    global EscPressed, keysHooked
    if key.name == 'esc':
        EscPressed = True
        keyboard.unhook(onKeyPress)
        keysHooked = False
        return False # stop listener

def StartEscListener():
    global EscPressed, keysHooked
    EscPressed = False
    if not keysHooked:
        keyboard.hook(onKeyPress)
        keysHooked = True

# ----------------------------------
# stop defining and start executing!
# ----------------------------------
try:
    # hook control-C
    signal.signal(signal.SIGINT, signal_handler)

    # run the program
    cmdLoop()

except Exception, ex0:
    print ('Exception thrown: ' + repr(ex0))
