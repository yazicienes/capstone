EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr USLetter 11000 8500
encoding utf-8
Sheet 7 17
Title "CANnect Reader | Power Switch"
Date "2020-10-20"
Rev "0.0.1"
Comp "CANtech"
Comment1 "Created by Choong Jin Ng | jin8383@gmail.com"
Comment2 "Taken from STN21xx's datasheet for recommended configuration"
Comment3 ""
Comment4 "Component Identifier: PSW"
$EndDescr
Text HLabel 1550 3000 0    50   Input ~ 0
~PWR_CTRL~
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF MOSFET?
U 1 1 5FA57921
P 5900 2450
AR Path="/5F8ADA45/5FA57921" Ref="MOSFET?"  Part="1" 
AR Path="/5FA56A4E/5FA57921" Ref="Q_PSW_3"  Part="1" 
F 0 "Q_PSW_3" V 6489 2450 60  0000 C CNN
F 1 "IRLML5103TRPBF" V 6383 2450 60  0000 C CNN
F 2 "footprints:IRLML5103TRPBF" H 6350 2190 60  0001 C CNN
F 3 "" H 5900 2450 60  0000 C CNN
	1    5900 2450
	0    1    -1   0   
$EndComp
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF MOSFET?
U 1 1 5FA57927
P 7250 2450
AR Path="/5F8ADA45/5FA57927" Ref="MOSFET?"  Part="1" 
AR Path="/5FA56A4E/5FA57927" Ref="Q_PSW_4"  Part="1" 
F 0 "Q_PSW_4" V 7839 2450 60  0000 C CNN
F 1 "IRLML5103TRPBF" V 7733 2450 60  0000 C CNN
F 2 "footprints:IRLML5103TRPBF" H 7700 2190 60  0001 C CNN
F 3 "" H 7250 2450 60  0000 C CNN
	1    7250 2450
	0    1    -1   0   
$EndComp
$Comp
L NX7002AK_215:NX7002AK,215 Q_PSW_1
U 1 1 5FA59B13
P 3350 2900
F 0 "Q_PSW_1" H 3548 2896 50  0000 L CNN
F 1 "NX7002AK,215" H 3548 2805 50  0000 L CNN
F 2 "footprints:SOT95P230X110-3N" H 3350 2900 50  0001 L BNN
F 3 "1.1mm" H 3350 2900 50  0001 L BNN
F 4 "Nexperia" H 3350 2900 50  0001 L BNN "Field4"
F 5 "7" H 3350 2900 50  0001 L BNN "Field5"
F 6 "IPC-7351B" H 3350 2900 50  0001 L BNN "Field6"
	1    3350 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_PSW_2
U 1 1 5FA5B8B4
P 3450 2200
F 0 "R_PSW_2" H 3509 2246 50  0000 L CNN
F 1 "100k" H 3509 2155 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 3450 2200 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 3450 2200 50  0001 C CNN
F 4 "RT0603DRE07100KL" H 3450 2200 50  0001 C CNN "Part Name"
	1    3450 2200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R_PSW_1
U 1 1 5FA5BF09
P 2350 2500
F 0 "R_PSW_1" H 2409 2546 50  0000 L CNN
F 1 "100k" H 2409 2455 50  0000 L CNN
F 2 "footprints:RESC1608X55N" H 2350 2500 50  0001 C CNN
F 3 "https://www.yageo.com/upload/media/product/productsearch/datasheet/rchip/PYu-RT_1-to-0.01_RoHS_L_12.pdf" H 2350 2500 50  0001 C CNN
F 4 "RT0603DRE07100KL" H 2350 2500 50  0001 C CNN "Part Name"
	1    2350 2500
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0134
U 1 1 5FA5C2C6
P 2350 1850
F 0 "#PWR0134" H 2350 1700 50  0001 C CNN
F 1 "+3.3V" H 2365 2023 50  0000 C CNN
F 2 "" H 2350 1850 50  0001 C CNN
F 3 "" H 2350 1850 50  0001 C CNN
	1    2350 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0135
U 1 1 5FA5C48B
P 6850 1850
F 0 "#PWR0135" H 6850 1700 50  0001 C CNN
F 1 "+3.3V" H 6865 2023 50  0000 C CNN
F 2 "" H 6850 1850 50  0001 C CNN
F 3 "" H 6850 1850 50  0001 C CNN
	1    6850 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 3000 2350 2600
Wire Wire Line
	2350 2400 2350 1850
$Comp
L power:+12V #PWR0136
U 1 1 5FA5EBBC
P 3450 1850
F 0 "#PWR0136" H 3450 1700 50  0001 C CNN
F 1 "+12V" H 3465 2023 50  0000 C CNN
F 2 "" H 3450 1850 50  0001 C CNN
F 3 "" H 3450 1850 50  0001 C CNN
	1    3450 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 2100 3450 1850
Wire Wire Line
	3450 2700 3450 2600
Wire Wire Line
	2350 3000 3150 3000
$Comp
L power:GND #PWR0137
U 1 1 5FA5FCA0
P 3450 3450
F 0 "#PWR0137" H 3450 3200 50  0001 C CNN
F 1 "GND" H 3455 3277 50  0000 C CNN
F 2 "" H 3450 3450 50  0001 C CNN
F 3 "" H 3450 3450 50  0001 C CNN
	1    3450 3450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3450 3200 3450 3450
Connection ~ 3450 2600
Wire Wire Line
	3450 2600 3450 2300
$Comp
L IRLML5103TRPBF:IRLML5103TRPBF MOSFET?
U 1 1 5FA5791B
P 4650 2450
AR Path="/5F8ADA45/5FA5791B" Ref="MOSFET?"  Part="1" 
AR Path="/5FA56A4E/5FA5791B" Ref="Q_PSW_2"  Part="1" 
F 0 "Q_PSW_2" V 5239 2450 60  0000 C CNN
F 1 "IRLML5103TRPBF" V 5133 2450 60  0000 C CNN
F 2 "footprints:IRLML5103TRPBF" H 5100 2190 60  0001 C CNN
F 3 "" H 4650 2450 60  0000 C CNN
	1    4650 2450
	0    1    -1   0   
$EndComp
Wire Wire Line
	3450 2600 4650 2600
Wire Wire Line
	4650 2600 4650 2450
Connection ~ 4650 2600
Wire Wire Line
	7250 2600 7250 2450
$Comp
L CANtech:+3.3V_SW #PWR0139
U 1 1 5FA68E31
P 7650 1850
F 0 "#PWR0139" H 7650 2100 50  0001 C CNN
F 1 "+3.3V_SW" H 7450 2000 50  0000 L CNN
F 2 "" H 6900 2650 50  0001 C CNN
F 3 "" H 6900 2650 50  0001 C CNN
	1    7650 1850
	1    0    0    -1  
$EndComp
$Comp
L CANtech:+5V_SW #PWR0140
U 1 1 5FA69F1C
P 6300 1850
F 0 "#PWR0140" H 6300 2100 50  0001 C CNN
F 1 "+5V_SW" H 6150 2000 50  0000 L CNN
F 2 "" H 5550 2650 50  0001 C CNN
F 3 "" H 5550 2650 50  0001 C CNN
	1    6300 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 2150 7650 2150
Wire Wire Line
	7650 2150 7650 1850
Wire Wire Line
	7050 2150 6850 2150
Wire Wire Line
	6850 2150 6850 1850
$Comp
L power:+5V #PWR0141
U 1 1 5FA6E79E
P 5500 1850
F 0 "#PWR0141" H 5500 1700 50  0001 C CNN
F 1 "+5V" H 5515 2023 50  0000 C CNN
F 2 "" H 5500 1850 50  0001 C CNN
F 3 "" H 5500 1850 50  0001 C CNN
	1    5500 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR0142
U 1 1 5FA6E93A
P 4250 1850
F 0 "#PWR0142" H 4250 1700 50  0001 C CNN
F 1 "+12V" H 4265 2023 50  0000 C CNN
F 2 "" H 4250 1850 50  0001 C CNN
F 3 "" H 4250 1850 50  0001 C CNN
	1    4250 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 2150 4250 2150
Wire Wire Line
	4250 2150 4250 1850
Wire Wire Line
	4850 2150 5050 2150
Wire Wire Line
	5050 2150 5050 1850
Wire Wire Line
	5700 2150 5500 2150
Wire Wire Line
	6100 2150 6300 2150
Wire Wire Line
	6300 2150 6300 1850
Wire Wire Line
	4650 2600 5900 2600
Wire Wire Line
	5900 2450 5900 2600
Connection ~ 5900 2600
Wire Wire Line
	5900 2600 7250 2600
Wire Wire Line
	5500 2150 5500 1850
$Comp
L CANtech:+12V_SW #PWR0145
U 1 1 5FB0601D
P 5050 1850
F 0 "#PWR0145" H 5050 2100 50  0001 C CNN
F 1 "+12V_SW" H 4850 2050 50  0000 L CNN
F 2 "" H 4300 2650 50  0001 C CNN
F 3 "" H 4300 2650 50  0001 C CNN
	1    5050 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 3000 1750 3000
Wire Wire Line
	2350 3000 2000 3000
Connection ~ 2350 3000
NoConn ~ 1750 3000
NoConn ~ 2000 3000
Wire Notes Line
	1900 1550 1900 3750
Wire Notes Line
	1900 3750 7950 3750
Wire Notes Line
	7950 3750 7950 1550
Wire Notes Line
	7950 1550 1900 1550
Text Notes 7600 3650 2    50   ~ 0
Work In Progress. Once this is done, reconnect the wires and remove the red diagram below
$Comp
L power:+12V #PWR0146
U 1 1 5FF636E9
P 3300 4300
F 0 "#PWR0146" H 3300 4150 50  0001 C CNN
F 1 "+12V" H 3315 4473 50  0000 C CNN
F 2 "" H 3300 4300 50  0001 C CNN
F 3 "" H 3300 4300 50  0001 C CNN
	1    3300 4300
	1    0    0    -1  
$EndComp
$Comp
L CANtech:+12V_SW #PWR0147
U 1 1 5FF63872
P 4000 4300
F 0 "#PWR0147" H 4000 4550 50  0001 C CNN
F 1 "+12V_SW" H 3800 4500 50  0000 L CNN
F 2 "" H 3250 5100 50  0001 C CNN
F 3 "" H 3250 5100 50  0001 C CNN
	1    4000 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0148
U 1 1 5FF63A17
P 4550 4300
F 0 "#PWR0148" H 4550 4150 50  0001 C CNN
F 1 "+5V" H 4565 4473 50  0000 C CNN
F 2 "" H 4550 4300 50  0001 C CNN
F 3 "" H 4550 4300 50  0001 C CNN
	1    4550 4300
	1    0    0    -1  
$EndComp
$Comp
L CANtech:+5V_SW #PWR0149
U 1 1 5FF63B0E
P 5300 4300
F 0 "#PWR0149" H 5300 4550 50  0001 C CNN
F 1 "+5V_SW" H 5150 4450 50  0000 L CNN
F 2 "" H 4550 5100 50  0001 C CNN
F 3 "" H 4550 5100 50  0001 C CNN
	1    5300 4300
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR0150
U 1 1 5FF63C8E
P 5850 4300
F 0 "#PWR0150" H 5850 4150 50  0001 C CNN
F 1 "+3.3V" H 5865 4473 50  0000 C CNN
F 2 "" H 5850 4300 50  0001 C CNN
F 3 "" H 5850 4300 50  0001 C CNN
	1    5850 4300
	1    0    0    -1  
$EndComp
$Comp
L CANtech:+3.3V_SW #PWR0151
U 1 1 5FF63E6A
P 6650 4300
F 0 "#PWR0151" H 6650 4550 50  0001 C CNN
F 1 "+3.3V_SW" H 6450 4450 50  0000 L CNN
F 2 "" H 5900 5100 50  0001 C CNN
F 3 "" H 5900 5100 50  0001 C CNN
	1    6650 4300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5850 4300 5850 4350
Wire Wire Line
	5850 4350 6650 4350
Wire Wire Line
	6650 4350 6650 4300
Wire Wire Line
	4550 4300 4550 4350
Wire Wire Line
	4550 4350 5300 4350
Wire Wire Line
	5300 4350 5300 4300
Wire Wire Line
	3300 4300 3300 4350
Wire Wire Line
	3300 4350 4000 4350
Wire Wire Line
	4000 4350 4000 4300
Wire Notes Line rgb(194, 0, 0)
	3100 4550 6900 4550
Wire Notes Line rgb(194, 0, 0)
	6900 4550 6900 3950
Wire Notes Line rgb(194, 0, 0)
	6900 3950 3100 3950
Wire Notes Line rgb(194, 0, 0)
	3100 3950 3100 4550
$EndSCHEMATC
