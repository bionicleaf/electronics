EESchema Schematic File Version 2
LIBS:gas-sensor-simple-rescue
LIBS:power
LIBS:device
LIBS:switches
LIBS:relays
LIBS:motors
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:bionicleaf
LIBS:gas-sensor-simple-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L MQxModule U1
U 1 1 5A0049B1
P 9250 1450
F 0 "U1" H 9250 1800 60  0000 C CNN
F 1 "MQ-8" H 9250 1100 60  0000 C CNN
F 2 "" H 9250 1100 60  0001 C CNN
F 3 "" H 9250 1100 60  0001 C CNN
	1    9250 1450
	-1   0    0    -1  
$EndComp
$Comp
L MQxModule U2
U 1 1 5A004B8B
P 9250 2600
F 0 "U2" H 9250 2950 60  0000 C CNN
F 1 "MQ-4" H 9250 2250 60  0000 C CNN
F 2 "" H 9250 2250 60  0001 C CNN
F 3 "" H 9250 2250 60  0001 C CNN
	1    9250 2600
	-1   0    0    -1  
$EndComp
$Comp
L Conn_01x08_Male J3
U 1 1 5A005D0F
P 850 2200
F 0 "J3" H 850 2600 50  0000 C CNN
F 1 "8-pin male" H 850 1700 50  0000 C CNN
F 2 "" H 850 2200 50  0001 C CNN
F 3 "" H 850 2200 50  0001 C CNN
	1    850  2200
	1    0    0    -1  
$EndComp
$Comp
L MV5x3x U8
U 1 1 5A00653A
P 6500 1500
F 0 "U8" H 6500 1800 60  0000 C CNN
F 1 "MV5x3x" H 6500 1200 60  0000 C CNN
F 2 "" H 6500 1200 60  0001 C CNN
F 3 "" H 6500 1200 60  0001 C CNN
	1    6500 1500
	-1   0    0    -1  
$EndComp
$Comp
L 7407 U5
U 1 1 5A006969
P 7900 1400
F 0 "U5" H 8050 1500 50  0000 C CNN
F 1 "7407" H 8100 1300 50  0000 C CNN
F 2 "" H 7900 1400 50  0001 C CNN
F 3 "" H 7900 1400 50  0001 C CNN
	1    7900 1400
	-1   0    0    -1  
$EndComp
$Comp
L 7407 U5
U 2 1 5A006F6D
P 7900 1950
F 0 "U5" H 8050 2050 50  0000 C CNN
F 1 "7407" H 8100 1850 50  0000 C CNN
F 2 "" H 7900 1950 50  0001 C CNN
F 3 "" H 7900 1950 50  0001 C CNN
	2    7900 1950
	-1   0    0    -1  
$EndComp
$Comp
L R R1
U 1 1 5A0071A3
P 7050 1400
F 0 "R1" V 7130 1400 50  0000 C CNN
F 1 "140" V 7050 1400 50  0000 C CNN
F 2 "" V 6980 1400 50  0001 C CNN
F 3 "" H 7050 1400 50  0001 C CNN
	1    7050 1400
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 5A00737C
P 7050 1600
F 0 "R2" V 7130 1600 50  0000 C CNN
F 1 "160" V 7050 1600 50  0000 C CNN
F 2 "" V 6980 1600 50  0001 C CNN
F 3 "" H 7050 1600 50  0001 C CNN
	1    7050 1600
	0    1    1    0   
$EndComp
$Comp
L MV5x3x U9
U 1 1 5A00847F
P 6500 2650
F 0 "U9" H 6500 2950 60  0000 C CNN
F 1 "MV5x3x" H 6500 2350 60  0000 C CNN
F 2 "" H 6500 2350 60  0001 C CNN
F 3 "" H 6500 2350 60  0001 C CNN
	1    6500 2650
	-1   0    0    -1  
$EndComp
$Comp
L 7407 U5
U 3 1 5A008485
P 7900 2550
F 0 "U5" H 8050 2650 50  0000 C CNN
F 1 "7407" H 8100 2450 50  0000 C CNN
F 2 "" H 7900 2550 50  0001 C CNN
F 3 "" H 7900 2550 50  0001 C CNN
	3    7900 2550
	-1   0    0    -1  
$EndComp
$Comp
L R R3
U 1 1 5A008496
P 7050 2550
F 0 "R3" V 7130 2550 50  0000 C CNN
F 1 "140" V 7050 2550 50  0000 C CNN
F 2 "" V 6980 2550 50  0001 C CNN
F 3 "" H 7050 2550 50  0001 C CNN
	1    7050 2550
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 5A00849C
P 7050 2750
F 0 "R4" V 7130 2750 50  0000 C CNN
F 1 "160" V 7050 2750 50  0000 C CNN
F 2 "" V 6980 2750 50  0001 C CNN
F 3 "" H 7050 2750 50  0001 C CNN
	1    7050 2750
	0    1    1    0   
$EndComp
$Comp
L MV5x3x U10
U 1 1 5A00AAA2
P 6500 3800
F 0 "U10" H 6500 4100 60  0000 C CNN
F 1 "MV5x3x" H 6500 3500 60  0000 C CNN
F 2 "" H 6500 3500 60  0001 C CNN
F 3 "" H 6500 3500 60  0001 C CNN
	1    6500 3800
	-1   0    0    -1  
$EndComp
$Comp
L 7407 U6
U 1 1 5A00AAA8
P 7900 3700
F 0 "U6" H 8050 3800 50  0000 C CNN
F 1 "7407" H 8100 3600 50  0000 C CNN
F 2 "" H 7900 3700 50  0001 C CNN
F 3 "" H 7900 3700 50  0001 C CNN
	1    7900 3700
	-1   0    0    -1  
$EndComp
$Comp
L R R5
U 1 1 5A00AAB9
P 7050 3700
F 0 "R5" V 7130 3700 50  0000 C CNN
F 1 "140" V 7050 3700 50  0000 C CNN
F 2 "" V 6980 3700 50  0001 C CNN
F 3 "" H 7050 3700 50  0001 C CNN
	1    7050 3700
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 5A00AABF
P 7050 3900
F 0 "R6" V 7130 3900 50  0000 C CNN
F 1 "160" V 7050 3900 50  0000 C CNN
F 2 "" V 6980 3900 50  0001 C CNN
F 3 "" H 7050 3900 50  0001 C CNN
	1    7050 3900
	0    1    1    0   
$EndComp
$Comp
L MV5x3x U11
U 1 1 5A00AAD1
P 6500 4950
F 0 "U11" H 6500 5250 60  0000 C CNN
F 1 "MV5x3x" H 6500 4650 60  0000 C CNN
F 2 "" H 6500 4650 60  0001 C CNN
F 3 "" H 6500 4650 60  0001 C CNN
	1    6500 4950
	-1   0    0    -1  
$EndComp
$Comp
L 7407 U6
U 3 1 5A00AAD7
P 7900 4850
F 0 "U6" H 8050 4950 50  0000 C CNN
F 1 "7407" H 8100 4750 50  0000 C CNN
F 2 "" H 7900 4850 50  0001 C CNN
F 3 "" H 7900 4850 50  0001 C CNN
	3    7900 4850
	-1   0    0    -1  
$EndComp
$Comp
L R R7
U 1 1 5A00AAE8
P 7050 4850
F 0 "R7" V 7130 4850 50  0000 C CNN
F 1 "140" V 7050 4850 50  0000 C CNN
F 2 "" V 6980 4850 50  0001 C CNN
F 3 "" H 7050 4850 50  0001 C CNN
	1    7050 4850
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 5A00AAEE
P 7050 5050
F 0 "R8" V 7130 5050 50  0000 C CNN
F 1 "160" V 7050 5050 50  0000 C CNN
F 2 "" V 6980 5050 50  0001 C CNN
F 3 "" H 7050 5050 50  0001 C CNN
	1    7050 5050
	0    1    1    0   
$EndComp
$Comp
L Conn_01x06_Male J1
U 1 1 5A0112A3
P 4450 2300
F 0 "J1" H 4550 2650 50  0000 C CNN
F 1 "6-pin male" H 4700 1900 50  0000 C CNN
F 2 "" H 4450 2300 50  0001 C CNN
F 3 "" H 4450 2300 50  0001 C CNN
	1    4450 2300
	1    0    0    -1  
$EndComp
$Comp
L Conn_01x06_Female J2
U 1 1 5A011344
P 4350 2300
F 0 "J2" H 4250 2650 50  0000 C CNN
F 1 "6-pin female" H 4050 1900 50  0000 C CNN
F 2 "" H 4350 2300 50  0001 C CNN
F 3 "" H 4350 2300 50  0001 C CNN
	1    4350 2300
	1    0    0    -1  
$EndComp
Text Notes 4850 1850 0    60   ~ 0
(5V)
$Comp
L DFRobotCO2 U3
U 1 1 5A01CDA7
P 9250 3900
F 0 "U3" H 9250 4200 60  0000 C CNN
F 1 "CO2" H 9250 3600 60  0000 C CNN
F 2 "" H 9250 3600 60  0001 C CNN
F 3 "" H 9250 3600 60  0001 C CNN
	1    9250 3900
	1    0    0    -1  
$EndComp
$Comp
L LinkSpriteO2 U4
U 1 1 5A01D7BF
P 9200 5850
F 0 "U4" H 9200 6100 60  0000 C CNN
F 1 "O2" H 9200 5600 60  0000 C CNN
F 2 "" H 9200 5550 60  0001 C CNN
F 3 "" H 9200 5550 60  0001 C CNN
	1    9200 5850
	-1   0    0    -1  
$EndComp
$Comp
L LM393 U12
U 1 1 5A01F586
P 8900 4850
F 0 "U12" H 9050 5000 50  0000 C CNN
F 1 "LM393" H 9150 4700 50  0000 C CNN
F 2 "" H 8900 4850 50  0001 C CNN
F 3 "" H 8900 4850 50  0001 C CNN
	1    8900 4850
	-1   0    0    -1  
$EndComp
$Comp
L POT_TRIM RV1
U 1 1 5A01F74C
P 9550 4750
F 0 "RV1" V 9375 4750 50  0000 C CNN
F 1 "10K" V 9450 4750 50  0000 C CNN
F 2 "" H 9550 4750 50  0001 C CNN
F 3 "" H 9550 4750 50  0001 C CNN
	1    9550 4750
	-1   0    0    -1  
$EndComp
$Comp
L BME280 U15
U 1 1 5A0285D9
P 1950 6700
F 0 "U15" H 1950 7100 60  0000 C CNN
F 1 "BME280" H 1950 6200 60  0000 C CNN
F 2 "" H 1950 7100 60  0001 C CNN
F 3 "" H 1950 7100 60  0001 C CNN
	1    1950 6700
	1    0    0    -1  
$EndComp
$Comp
L R_Pack04_SIP RN1
U 1 1 5A043F09
P 3750 3900
F 0 "RN1" H 3450 4150 50  0000 C CNN
F 1 "4 x 100K" H 4050 4150 50  0000 C CNN
F 2 "Resistors_THT:R_Array_SIP8" V 4425 3900 50  0001 C CNN
F 3 "" H 3750 3900 50  0001 C CNN
	1    3750 3900
	1    0    0    -1  
$EndComp
$Comp
L Thermistor TH1
U 1 1 5A04448A
P 3250 4850
F 0 "TH1" V 3150 4750 50  0000 C CNN
F 1 "100K" V 3150 4950 50  0000 C BNN
F 2 "" H 3250 4850 50  0001 C CNN
F 3 "" H 3250 4850 50  0001 C CNN
	1    3250 4850
	1    0    0    -1  
$EndComp
$Comp
L Thermistor TH2
U 1 1 5A0444F5
P 3550 4850
F 0 "TH2" V 3450 4750 50  0000 C CNN
F 1 "100K" V 3450 4950 50  0000 C BNN
F 2 "" H 3550 4850 50  0001 C CNN
F 3 "" H 3550 4850 50  0001 C CNN
	1    3550 4850
	1    0    0    -1  
$EndComp
$Comp
L Thermistor TH3
U 1 1 5A044596
P 3850 4850
F 0 "TH3" V 3750 4750 50  0000 C CNN
F 1 "100K" V 3750 4950 50  0000 C BNN
F 2 "" H 3850 4850 50  0001 C CNN
F 3 "" H 3850 4850 50  0001 C CNN
	1    3850 4850
	1    0    0    -1  
$EndComp
$Comp
L Thermistor TH4
U 1 1 5A0448C3
P 4150 4850
F 0 "TH4" V 4050 4750 50  0000 C CNN
F 1 "100K" V 4050 4950 50  0000 C BNN
F 2 "" H 4150 4850 50  0001 C CNN
F 3 "" H 4150 4850 50  0001 C CNN
	1    4150 4850
	1    0    0    -1  
$EndComp
NoConn ~ 2400 6700
NoConn ~ 2400 6800
NoConn ~ 2400 6900
$Comp
L 7407 U5
U 4 1 5A05B074
P 7900 3050
F 0 "U5" H 8050 3150 50  0000 C CNN
F 1 "7407" H 8100 2950 50  0000 C CNN
F 2 "" H 7900 3050 50  0001 C CNN
F 3 "" H 7900 3050 50  0001 C CNN
	4    7900 3050
	-1   0    0    -1  
$EndComp
$Comp
L +3.3V #PWR01
U 1 1 5A05DD73
P 2900 5650
F 0 "#PWR01" H 2900 5500 50  0001 C CNN
F 1 "+3.3V" H 2900 5790 50  0000 C CNN
F 2 "" H 2900 5650 50  0001 C CNN
F 3 "" H 2900 5650 50  0001 C CNN
	1    2900 5650
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR02
U 1 1 5A05DFE2
P 2600 6400
F 0 "#PWR02" H 2600 6150 50  0001 C CNN
F 1 "GNDD" H 2600 6275 50  0000 C CNN
F 2 "" H 2600 6400 50  0001 C CNN
F 3 "" H 2600 6400 50  0001 C CNN
	1    2600 6400
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR03
U 1 1 5A0610CC
P 1450 5400
F 0 "#PWR03" H 1450 5150 50  0001 C CNN
F 1 "GNDD" H 1450 5275 50  0000 C CNN
F 2 "" H 1450 5400 50  0001 C CNN
F 3 "" H 1450 5400 50  0001 C CNN
	1    1450 5400
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR04
U 1 1 5A061146
P 1450 2950
F 0 "#PWR04" H 1450 2700 50  0001 C CNN
F 1 "GNDD" H 1450 2825 50  0000 C CNN
F 2 "" H 1450 2950 50  0001 C CNN
F 3 "" H 1450 2950 50  0001 C CNN
	1    1450 2950
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR05
U 1 1 5A06C3EF
P 1750 1550
F 0 "#PWR05" H 1750 1300 50  0001 C CNN
F 1 "GNDD" H 1750 1425 50  0000 C CNN
F 2 "" H 1750 1550 50  0001 C CNN
F 3 "" H 1750 1550 50  0001 C CNN
	1    1750 1550
	1    0    0    -1  
$EndComp
$Comp
L +3.3V #PWR06
U 1 1 5A06C6E6
P 1150 1250
F 0 "#PWR06" H 1150 1100 50  0001 C CNN
F 1 "+3.3V" H 1150 1390 50  0000 C CNN
F 2 "" H 1150 1250 50  0001 C CNN
F 3 "" H 1150 1250 50  0001 C CNN
	1    1150 1250
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR07
U 1 1 5A06C835
P 1450 1850
F 0 "#PWR07" H 1450 1700 50  0001 C CNN
F 1 "VCC" H 1450 2000 50  0000 C CNN
F 2 "" H 1450 1850 50  0001 C CNN
F 3 "" H 1450 1850 50  0001 C CNN
	1    1450 1850
	1    0    0    -1  
$EndComp
$Comp
L GNDD #PWR08
U 1 1 5A07278E
P 2800 7100
F 0 "#PWR08" H 2800 6850 50  0001 C CNN
F 1 "GNDD" H 2800 6975 50  0000 C CNN
F 2 "" H 2800 7100 50  0001 C CNN
F 3 "" H 2800 7100 50  0001 C CNN
	1    2800 7100
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR09
U 1 1 5A00F97A
P 1450 3800
F 0 "#PWR09" H 1450 3650 50  0001 C CNN
F 1 "VCC" H 1450 3950 50  0000 C CNN
F 2 "" H 1450 3800 50  0001 C CNN
F 3 "" H 1450 3800 50  0001 C CNN
	1    1450 3800
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR010
U 1 1 5A0239FA
P 4750 1950
F 0 "#PWR010" H 4750 1800 50  0001 C CNN
F 1 "VCC" H 4750 2100 50  0000 C CNN
F 2 "" H 4750 1950 50  0001 C CNN
F 3 "" H 4750 1950 50  0001 C CNN
	1    4750 1950
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR011
U 1 1 5A0241B5
P 10600 1050
F 0 "#PWR011" H 10600 900 50  0001 C CNN
F 1 "VCC" H 10600 1200 50  0000 C CNN
F 2 "" H 10600 1050 50  0001 C CNN
F 3 "" H 10600 1050 50  0001 C CNN
	1    10600 1050
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR012
U 1 1 5A024ADB
P 4650 3850
F 0 "#PWR012" H 4650 3700 50  0001 C CNN
F 1 "VCC" H 4650 4000 50  0000 C CNN
F 2 "" H 4650 3850 50  0001 C CNN
F 3 "" H 4650 3850 50  0001 C CNN
	1    4650 3850
	1    0    0    -1  
$EndComp
$Comp
L VCC #PWR013
U 1 1 5A026D99
P 4100 1950
F 0 "#PWR013" H 4100 1800 50  0001 C CNN
F 1 "VCC" H 4100 2100 50  0000 C CNN
F 2 "" H 4100 1950 50  0001 C CNN
F 3 "" H 4100 1950 50  0001 C CNN
	1    4100 1950
	1    0    0    -1  
$EndComp
$Comp
L 7407 U6
U 4 1 5A029F56
P 7900 5350
F 0 "U6" H 8050 5450 50  0000 C CNN
F 1 "7407" H 8100 5250 50  0000 C CNN
F 2 "" H 7900 5350 50  0001 C CNN
F 3 "" H 7900 5350 50  0001 C CNN
	4    7900 5350
	-1   0    0    -1  
$EndComp
$Comp
L 7407 U6
U 2 1 5A02A967
P 7900 4250
F 0 "U6" H 8050 4350 50  0000 C CNN
F 1 "7407" H 8100 4150 50  0000 C CNN
F 2 "" H 7900 4250 50  0001 C CNN
F 3 "" H 7900 4250 50  0001 C CNN
	2    7900 4250
	-1   0    0    -1  
$EndComp
$Comp
L GND #PWR014
U 1 1 5A02C178
P 5000 2050
F 0 "#PWR014" H 5000 1800 50  0001 C CNN
F 1 "GND" H 5000 1900 50  0000 C CNN
F 2 "" H 5000 2050 50  0001 C CNN
F 3 "" H 5000 2050 50  0001 C CNN
	1    5000 2050
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 5A02C1D6
P 6000 1650
F 0 "#PWR015" H 6000 1400 50  0001 C CNN
F 1 "GND" H 6000 1500 50  0000 C CNN
F 2 "" H 6000 1650 50  0001 C CNN
F 3 "" H 6000 1650 50  0001 C CNN
	1    6000 1650
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR016
U 1 1 5A02C234
P 6000 2800
F 0 "#PWR016" H 6000 2550 50  0001 C CNN
F 1 "GND" H 6000 2650 50  0000 C CNN
F 2 "" H 6000 2800 50  0001 C CNN
F 3 "" H 6000 2800 50  0001 C CNN
	1    6000 2800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR017
U 1 1 5A02C292
P 6000 3950
F 0 "#PWR017" H 6000 3700 50  0001 C CNN
F 1 "GND" H 6000 3800 50  0000 C CNN
F 2 "" H 6000 3950 50  0001 C CNN
F 3 "" H 6000 3950 50  0001 C CNN
	1    6000 3950
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR018
U 1 1 5A02C2F0
P 6000 5100
F 0 "#PWR018" H 6000 4850 50  0001 C CNN
F 1 "GND" H 6000 4950 50  0000 C CNN
F 2 "" H 6000 5100 50  0001 C CNN
F 3 "" H 6000 5100 50  0001 C CNN
	1    6000 5100
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 5A02C77F
P 9850 6050
F 0 "#PWR019" H 9850 5800 50  0001 C CNN
F 1 "GND" H 9850 5900 50  0000 C CNN
F 2 "" H 9850 6050 50  0001 C CNN
F 3 "" H 9850 6050 50  0001 C CNN
	1    9850 6050
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG020
U 1 1 5A02CE98
P 900 1400
F 0 "#FLG020" H 900 1475 50  0001 C CNN
F 1 "PWR_FLAG" H 900 1550 50  0000 C CNN
F 2 "" H 900 1400 50  0001 C CNN
F 3 "" H 900 1400 50  0001 C CNN
	1    900  1400
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG021
U 1 1 5A02CFEB
P 10600 5800
F 0 "#FLG021" H 10600 5875 50  0001 C CNN
F 1 "PWR_FLAG" H 10600 5950 50  0000 C CNN
F 2 "" H 10600 5800 50  0001 C CNN
F 3 "" H 10600 5800 50  0001 C CNN
	1    10600 5800
	-1   0    0    1   
$EndComp
$Comp
L GND #PWR022
U 1 1 5A01034C
P 4650 5350
F 0 "#PWR022" H 4650 5100 50  0001 C CNN
F 1 "GND" H 4650 5200 50  0000 C CNN
F 2 "" H 4650 5350 50  0001 C CNN
F 3 "" H 4650 5350 50  0001 C CNN
	1    4650 5350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR023
U 1 1 5A010411
P 3800 2050
F 0 "#PWR023" H 3800 1800 50  0001 C CNN
F 1 "GND" H 3800 1900 50  0000 C CNN
F 2 "" H 3800 2050 50  0001 C CNN
F 3 "" H 3800 2050 50  0001 C CNN
	1    3800 2050
	1    0    0    -1  
$EndComp
$Comp
L PWR_FLAG #FLG024
U 1 1 5A011D92
P 2800 7000
F 0 "#FLG024" H 2800 7075 50  0001 C CNN
F 1 "PWR_FLAG" H 2800 7150 50  0000 C CNN
F 2 "" H 2800 7000 50  0001 C CNN
F 3 "" H 2800 7000 50  0001 C CNN
	1    2800 7000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1400 7450 1700
Wire Wire Line
	7450 1700 8350 1700
Wire Wire Line
	8350 1700 8350 1950
Wire Wire Line
	7450 1950 7300 1950
Wire Wire Line
	7300 1950 7300 1600
Wire Wire Line
	7200 1400 7450 1400
Wire Wire Line
	6850 1400 6900 1400
Wire Wire Line
	6850 1600 6900 1600
Wire Wire Line
	7300 1600 7200 1600
Wire Wire Line
	6150 1500 6000 1500
Wire Wire Line
	6000 1500 6000 1650
Wire Wire Line
	7450 2550 7450 2800
Wire Wire Line
	7450 2800 8350 2800
Wire Wire Line
	8350 2800 8350 3050
Wire Wire Line
	7450 3050 7300 3050
Wire Wire Line
	7300 3050 7300 2750
Wire Wire Line
	7200 2550 7450 2550
Wire Wire Line
	6850 2550 6900 2550
Wire Wire Line
	6850 2750 6900 2750
Wire Wire Line
	7300 2750 7200 2750
Wire Wire Line
	6150 2650 6000 2650
Wire Wire Line
	6000 2650 6000 2800
Wire Wire Line
	7450 3700 7450 4000
Wire Wire Line
	7450 4000 8350 4000
Wire Wire Line
	8350 3700 8350 4250
Wire Wire Line
	7450 4250 7300 4250
Wire Wire Line
	7300 4250 7300 3900
Wire Wire Line
	7200 3700 7450 3700
Wire Wire Line
	6850 3700 6900 3700
Wire Wire Line
	6850 3900 6900 3900
Wire Wire Line
	7300 3900 7200 3900
Wire Wire Line
	6150 3800 6000 3800
Wire Wire Line
	6000 3800 6000 3950
Wire Wire Line
	7450 4850 7450 5100
Wire Wire Line
	7450 5100 8350 5100
Wire Wire Line
	8350 5100 8350 5350
Wire Wire Line
	7300 5350 7450 5350
Wire Wire Line
	7300 5050 7300 5350
Wire Wire Line
	7200 4850 7450 4850
Wire Wire Line
	6850 4850 6900 4850
Wire Wire Line
	6850 5050 6900 5050
Wire Wire Line
	7300 5050 7200 5050
Wire Wire Line
	6150 4950 6000 4950
Wire Wire Line
	6000 4950 6000 5100
Wire Wire Line
	8350 1400 8850 1400
Wire Wire Line
	8850 2550 8350 2550
Wire Wire Line
	9650 2750 9850 2750
Wire Wire Line
	9650 1600 9850 1600
Wire Wire Line
	9850 1600 9850 6050
Wire Wire Line
	2400 2300 4150 2300
Wire Wire Line
	4150 2400 2400 2400
Wire Wire Line
	2400 2500 4150 2500
Wire Wire Line
	4150 2600 2400 2600
Wire Wire Line
	5450 2200 8550 2200
Wire Wire Line
	5450 2200 5450 2300
Wire Wire Line
	5450 2300 4650 2300
Wire Wire Line
	5450 3350 8550 3350
Wire Wire Line
	5450 3350 5450 2400
Wire Wire Line
	5450 2400 4650 2400
Wire Wire Line
	5350 4500 5350 2500
Wire Wire Line
	5350 2500 4650 2500
Wire Wire Line
	5250 2600 5250 5800
Wire Wire Line
	5250 2600 4650 2600
Connection ~ 7450 2550
Connection ~ 7450 3700
Connection ~ 7450 4850
Connection ~ 7450 1400
Wire Wire Line
	10600 1050 10600 5800
Wire Wire Line
	9650 1300 10600 1300
Connection ~ 10600 1300
Wire Wire Line
	10600 2450 9650 2450
Wire Wire Line
	4750 1950 4750 2100
Wire Wire Line
	4750 2100 4650 2100
Wire Wire Line
	4150 2200 3950 2200
Wire Wire Line
	3950 2200 3950 2000
Wire Wire Line
	3950 2000 3800 2000
Wire Wire Line
	3800 2000 3800 2050
Wire Wire Line
	4100 1950 4100 2100
Wire Wire Line
	4100 2100 4150 2100
Wire Wire Line
	4650 2200 4850 2200
Wire Wire Line
	4850 2200 4850 2000
Wire Wire Line
	4850 2000 5000 2000
Wire Wire Line
	5000 2000 5000 2050
Wire Wire Line
	9700 3800 9700 3450
Wire Wire Line
	9700 3450 8750 3450
Wire Wire Line
	8750 3450 8750 3700
Wire Wire Line
	8750 3700 8350 3700
Wire Wire Line
	8800 3800 8450 3800
Wire Wire Line
	8450 3800 8450 4500
Wire Wire Line
	8450 4500 5350 4500
Wire Wire Line
	8650 5450 9300 5450
Wire Wire Line
	9300 5450 9300 4950
Wire Wire Line
	9300 4950 9200 4950
Wire Wire Line
	8350 4850 8600 4850
Wire Wire Line
	5250 5800 8800 5800
Wire Wire Line
	8650 5450 8650 5800
Connection ~ 8650 5800
Wire Wire Line
	9200 4750 9400 4750
Connection ~ 9850 2750
Wire Wire Line
	9700 4000 9850 4000
Connection ~ 9850 4000
Wire Wire Line
	9550 4900 9550 5000
Wire Wire Line
	9550 5000 9850 5000
Connection ~ 9850 5000
Wire Wire Line
	9650 5900 9850 5900
Connection ~ 9850 5900
Wire Wire Line
	10600 5800 9650 5800
Connection ~ 10600 2450
Wire Wire Line
	9700 3900 10600 3900
Connection ~ 10600 3900
Wire Wire Line
	9550 4600 9550 4500
Wire Wire Line
	9000 4500 10600 4500
Connection ~ 10600 4500
Wire Wire Line
	8800 4000 8750 4000
Wire Wire Line
	8750 4000 8750 4300
Wire Wire Line
	8750 4300 9850 4300
Connection ~ 9850 4300
Wire Wire Line
	8800 3900 8650 3900
Wire Wire Line
	8650 3900 8650 4400
Wire Wire Line
	8650 4400 10600 4400
Connection ~ 10600 4400
Wire Wire Line
	1050 2600 1500 2600
Wire Wire Line
	1500 2500 1050 2500
Wire Wire Line
	9000 4550 9000 4500
Connection ~ 9550 4500
Wire Wire Line
	9000 5150 9000 5200
Wire Wire Line
	9000 5200 9850 5200
Connection ~ 9850 5200
Wire Wire Line
	3250 4100 3250 4650
Wire Wire Line
	3550 4100 3550 4650
Wire Wire Line
	3850 4100 3850 4650
Wire Wire Line
	4150 4100 4150 4650
Wire Wire Line
	2400 4200 3250 4200
Connection ~ 3250 4200
Wire Wire Line
	2400 4300 3550 4300
Connection ~ 3550 4300
Wire Wire Line
	2400 4400 3850 4400
Connection ~ 3850 4400
Wire Wire Line
	2400 4500 4150 4500
Connection ~ 4150 4500
Wire Wire Line
	4150 5200 4150 5050
Wire Wire Line
	1450 5200 4650 5200
Wire Wire Line
	3250 5200 3250 5050
Wire Wire Line
	3550 5050 3550 5200
Connection ~ 3550 5200
Wire Wire Line
	3850 5050 3850 5200
Connection ~ 3850 5200
Wire Wire Line
	3350 4200 4650 4200
Wire Wire Line
	3350 4200 3350 4100
Wire Wire Line
	3650 4100 3650 4200
Connection ~ 3650 4200
Wire Wire Line
	3950 4100 3950 4200
Connection ~ 3950 4200
Wire Wire Line
	4250 4100 4250 4200
Connection ~ 4250 4200
Wire Wire Line
	4650 5200 4650 5350
Connection ~ 4150 5200
Wire Wire Line
	4650 4200 4650 3850
Wire Wire Line
	1050 2400 1500 2400
Wire Wire Line
	1250 2400 1250 6700
Wire Wire Line
	1250 6700 1500 6700
Connection ~ 1250 2400
Wire Wire Line
	1050 2300 1500 2300
Wire Wire Line
	1150 2300 1150 6800
Wire Wire Line
	1150 6800 1500 6800
Wire Wire Line
	1150 4200 1500 4200
Connection ~ 1150 4200
Wire Wire Line
	1250 4300 1500 4300
Connection ~ 1250 4300
Connection ~ 1150 2300
Wire Wire Line
	1500 6500 1500 6200
Wire Wire Line
	1500 6200 2600 6200
Wire Wire Line
	2400 6200 2400 6500
Wire Wire Line
	1400 6600 1500 6600
Wire Wire Line
	1400 5700 1400 6600
Wire Wire Line
	1400 5700 2900 5700
Wire Wire Line
	2900 5650 2900 6600
Wire Wire Line
	2900 6600 2400 6600
Wire Wire Line
	2600 6200 2600 6400
Connection ~ 2400 6200
Wire Wire Line
	1450 4650 1450 5400
Connection ~ 1450 5200
Connection ~ 3250 5200
Wire Wire Line
	1450 2200 1050 2200
Wire Wire Line
	1450 1850 1450 2200
Wire Wire Line
	1450 2100 1500 2100
Wire Wire Line
	1050 2100 1300 2100
Wire Wire Line
	1300 2100 1300 1450
Wire Wire Line
	1300 1450 1750 1450
Wire Wire Line
	1750 1450 1750 1550
Wire Wire Line
	1150 2000 1050 2000
Wire Wire Line
	1150 1250 1150 2000
Connection ~ 1450 2100
Wire Wire Line
	2400 7000 2800 7000
Wire Wire Line
	2800 7000 2800 7100
Wire Wire Line
	1450 3800 1450 4000
Wire Wire Line
	1450 4000 1500 4000
Wire Wire Line
	1450 2750 1450 2950
Wire Wire Line
	900  1400 1150 1400
Connection ~ 1150 1400
Connection ~ 2800 7000
Text Notes 7050 7050 0    150  ~ 0
Bionic Leaf CO2, O2, H2 and CH4 \ngas detector with digital interface
Wire Wire Line
	8850 1500 8550 1500
Wire Wire Line
	8550 1500 8550 2200
Wire Wire Line
	8850 2650 8550 2650
Wire Wire Line
	8550 2650 8550 3350
NoConn ~ 1500 4400
NoConn ~ 1500 4500
NoConn ~ 1050 1900
$Comp
L ads1x15 U13
U 1 1 5A017B49
P 1950 2450
F 0 "U13" H 1950 3000 60  0000 C CNN
F 1 "ads1x15" H 1950 1950 60  0000 C CNN
F 2 "" H 1950 1850 60  0001 C CNN
F 3 "" H 1950 1850 60  0001 C CNN
	1    1950 2450
	1    0    0    -1  
$EndComp
$Comp
L ads1x15 U14
U 1 1 5A017C16
P 1950 4350
F 0 "U14" H 1950 4900 60  0000 C CNN
F 1 "ads1x15" H 1950 3850 60  0000 C CNN
F 2 "" H 1950 3750 60  0001 C CNN
F 3 "" H 1950 3750 60  0001 C CNN
	1    1950 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 2750 1450 2750
Wire Wire Line
	1500 4650 1450 4650
Connection ~ 2900 5700
$EndSCHEMATC
