import traceback 
import argparse
import signal
import string
import keyboard
import sys

import logging
import datetime
from IInir_CH4 import InirCH4
from IInir_CH4 import EngrData
from ZE03 import ZE03
from T6615 import T6615

setup = 'lab'

if setup == 'lab':
    T6615_port=9
    ZE03_O2_port=6
    ZE03_H2_port=10
    InirCH4_port=7
elif setup == 'adidev':
    T6615_port=9
    ZE03_O2_port=6
    ZE03_H2_port=10
    InirCH4_port=7
elif setup == 'pauldev':
    T6615_port=9
    ZE03_O2_port=6
    ZE03_H2_port=10
    InirCH4_port=7


ch4 = None
commport = 'COM7'   #default is COM7 on Paul's laptop
log = None

def timestamp():
    return str(datetime.datetime.now())


# wrap print for debug echo
def echo(cmd):
    print (cmd)

def connect(cmd, params):
    global ch4, EscPressed
    echo (cmd + ': ' + params)

    # create the sensor object
    ch4 = InirCH4(commport, 38400)
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
        values = EngrData(data)
        values.out()

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
            traceback.print_exc(ex)
            #echo (repr(ex))

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
if __name__ == '__main__':
    try:
        # commport = args.port[0]

        # hook control-C
        signal.signal(signal.SIGINT, signal_handler)

        sensor = '' # 'T6615'

        # run the program
        if sensor == 'IInir_CH4':
            commport = 50
            cmdLoop()

        elif sensor == 'ZE03':
            # ZE03-xx sensor
            h2 = ZE03.ZE03()
            StartEscListener()
            while not EscPressed:
                data = h2.Readtty()
                val = h2.ParseResponse(data)
                datastr = ' '.join(hex(ord(x))[2:] for x in data)
                print datastr + '\t' + str(val)

        elif sensor == 'T6615':
            # T6615-CO2 sensor
            co2 = T6615()
            StartEscListener()
            while not EscPressed:
                co2.SendReadCommand()
                data = co2.Readtty()
                datastr = ' '.join(hex(ord(x))[2:] for x in data)
                val = co2.ParseRead(data)
                print datastr + '\t' + str(val)

        else:
            # global T6615_port, ZE03_O2_port, ZE03_H2_port, InirCH4_port

            try:
                parser = argparse.ArgumentParser(description='control CH4 sensor connected to port')
                parser.add_argument('--logfile', help='log file name')
                args = parser.parse_args()

                logFile = args.logfile
                if logFile == None:
                    logFile = 'log'
                
                # logging.basicConfig(filename=logFile + '_' + timestamp() +'.log', level=logging.DEBUG)

                logFile = timestamp() + '.log'
                logFile = logFile.replace(':', '.')
                print logFile
                logging.basicConfig(filename=logFile, level=logging.DEBUG)
                logging.info('\r\n' + timestamp() + 'program start')

                co2 = T6615(port=T6615_port, baud=19200)
                o2 = ZE03(port=ZE03_O2_port, baud=9600)
                h2 = ZE03(port=ZE03_H2_port, baud=9600)
                ch4 = InirCH4(port=InirCH4_port, baud=38400)

                ch4.DoInitSequence()

                StartEscListener()
                while not EscPressed:
                    co2val = co2.Read()
                    o2val = o2.Read()
                    h2val = h2.Read()
                    ch4vals = EngrData(ch4.Readtty())
                    if hasattr(ch4vals, 'PPM'):
                        ch4vals = ch4vals.PPM
                    else:
                        ch4vals = 0

                    msg = timestamp() + '\t' + str(co2val) + '\t' + str(o2val) + '\t' + str(h2val) + '\t' + str(ch4vals)
                    logging.debug(msg)

                    print msg+'\r\n'

            except Exception, ex1:
                print ('Exception thrown: ' + repr(ex1))

    except Exception, ex0:
        print ('Exception thrown: ' + repr(ex0))
        