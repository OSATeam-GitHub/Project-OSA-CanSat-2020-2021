EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "OSACan PCB"
Date "2021"
Rev ""
Comp "OSATeam"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Notes 6750 1700 0    79   ~ 0
Primary mission additional\n\n
Text Notes 5150 1550 0    79   ~ 0
Primary Mission sensor\n
$Comp
L Transistor_BJT:S8050 Q1
U 1 1 6130685C
P 6050 5950
F 0 "Q1" H 6240 5996 50  0000 L CNN
F 1 "S8050" H 6240 5905 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 6250 5875 50  0001 L CIN
F 3 "http://www.unisonic.com.tw/datasheet/S8050.pdf" H 6050 5950 50  0001 L CNN
	1    6050 5950
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:S8050 Q2
U 1 1 613049CC
P 7750 5750
F 0 "Q2" H 7940 5796 50  0000 L CNN
F 1 "S8050" H 7940 5705 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 7950 5675 50  0001 L CIN
F 3 "http://www.unisonic.com.tw/datasheet/S8050.pdf" H 7750 5750 50  0001 L CNN
	1    7750 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	6000 4100 6100 4100
Wire Wire Line
	6000 4000 6100 4000
$Comp
L power:GND #PWR014
U 1 1 61340BA1
P 6000 4100
F 0 "#PWR014" H 6000 3850 50  0001 C CNN
F 1 "GND" H 6005 3927 50  0000 C CNN
F 2 "" H 6000 4100 50  0001 C CNN
F 3 "" H 6000 4100 50  0001 C CNN
	1    6000 4100
	1    0    0    -1  
$EndComp
$Comp
L power:+6V #PWR013
U 1 1 6133E0C4
P 6000 4000
F 0 "#PWR013" H 6000 3850 50  0001 C CNN
F 1 "+6V" H 6015 4173 50  0000 C CNN
F 2 "" H 6000 4000 50  0001 C CNN
F 3 "" H 6000 4000 50  0001 C CNN
	1    6000 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4250 7650 4250
Wire Wire Line
	7500 4150 7650 4150
Wire Wire Line
	7500 4050 7650 4050
Wire Wire Line
	7500 3950 7650 3950
$Comp
L power:+3.3V #PWR019
U 1 1 6131AEFD
P 7500 3950
F 0 "#PWR019" H 7500 3800 50  0001 C CNN
F 1 "+3.3V" V 7515 4078 50  0000 L CNN
F 2 "" H 7500 3950 50  0001 C CNN
F 3 "" H 7500 3950 50  0001 C CNN
	1    7500 3950
	0    -1   -1   0   
$EndComp
$Comp
L power:GND #PWR020
U 1 1 61318A1C
P 7500 4050
F 0 "#PWR020" H 7500 3800 50  0001 C CNN
F 1 "GND" H 7505 3877 50  0000 C CNN
F 2 "" H 7500 4050 50  0001 C CNN
F 3 "" H 7500 4050 50  0001 C CNN
	1    7500 4050
	0    1    1    0   
$EndComp
Text GLabel 7500 4250 0    60   Input ~ 0
SDA
Text GLabel 5750 2300 0    60   Input ~ 0
SDA
Text GLabel 5750 2200 0    60   Input ~ 0
SCL
Text GLabel 7500 4150 0    60   Input ~ 0
SCL
$Comp
L Connector_Generic:Conn_01x04 J8
U 1 1 612FD75F
P 7850 4050
F 0 "J8" H 7930 4042 50  0000 L CNN
F 1 "ssc" H 7930 3951 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x04_P2.54mm_Vertical" H 7850 4050 50  0001 C CNN
F 3 "~" H 7850 4050 50  0001 C CNN
	1    7850 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 1850 7550 1850
Wire Wire Line
	7450 2550 7550 2550
Connection ~ 7450 2550
Wire Wire Line
	7450 2650 7450 2550
Wire Wire Line
	7300 2550 7450 2550
$Comp
L Device:R R4
U 1 1 612E9865
P 7450 2800
F 0 "R4" V 7243 2800 50  0000 C CNN
F 1 "R" V 7334 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7380 2800 50  0001 C CNN
F 3 "~" H 7450 2800 50  0001 C CNN
	1    7450 2800
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR018
U 1 1 612E985F
P 7450 3050
F 0 "#PWR018" H 7450 2900 50  0001 C CNN
F 1 "+5V" H 7465 3223 50  0000 C CNN
F 2 "" H 7450 3050 50  0001 C CNN
F 3 "" H 7450 3050 50  0001 C CNN
	1    7450 3050
	-1   0    0    1   
$EndComp
Wire Wire Line
	7450 2950 7450 3050
$Comp
L Device:R R5
U 1 1 612CD5E6
P 9100 4350
F 0 "R5" V 8893 4350 50  0000 C CNN
F 1 "R" V 8984 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 9030 4350 50  0001 C CNN
F 3 "~" H 9100 4350 50  0001 C CNN
	1    9100 4350
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 612DBC34
P 9100 4600
F 0 "#PWR023" H 9100 4450 50  0001 C CNN
F 1 "+5V" H 9115 4773 50  0000 C CNN
F 2 "" H 9100 4600 50  0001 C CNN
F 3 "" H 9100 4600 50  0001 C CNN
	1    9100 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	9100 4500 9100 4600
Wire Wire Line
	8900 4200 9100 4200
Wire Wire Line
	9100 4200 9300 4200
Connection ~ 9100 4200
Wire Wire Line
	9150 4100 9300 4100
$Comp
L power:GND #PWR025
U 1 1 612C7089
P 9150 4100
F 0 "#PWR025" H 9150 3850 50  0001 C CNN
F 1 "GND" H 9155 3927 50  0000 C CNN
F 2 "" H 9150 4100 50  0001 C CNN
F 3 "" H 9150 4100 50  0001 C CNN
	1    9150 4100
	-1   0    0    1   
$EndComp
Text GLabel 8900 4200 0    60   Input ~ 0
D1
Wire Wire Line
	7400 2450 7550 2450
$Comp
L power:GND #PWR016
U 1 1 612B8CCF
P 7400 2450
F 0 "#PWR016" H 7400 2200 50  0001 C CNN
F 1 "GND" H 7405 2277 50  0000 C CNN
F 2 "" H 7400 2450 50  0001 C CNN
F 3 "" H 7400 2450 50  0001 C CNN
	1    7400 2450
	-1   0    0    1   
$EndComp
Text GLabel 7300 2550 0    60   Input ~ 0
A0
Wire Wire Line
	9200 5350 9300 5350
Wire Wire Line
	9100 5250 9300 5250
Wire Wire Line
	9200 5150 9300 5150
Wire Wire Line
	9200 5050 9300 5050
Text GLabel 9200 5350 0    60   Input ~ 0
D0
$Comp
L power:+6V #PWR026
U 1 1 612AB842
P 9200 5050
F 0 "#PWR026" H 9200 4900 50  0001 C CNN
F 1 "+6V" H 9215 5223 50  0000 C CNN
F 2 "" H 9200 5050 50  0001 C CNN
F 3 "" H 9200 5050 50  0001 C CNN
	1    9200 5050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR027
U 1 1 612A7F75
P 9200 5150
F 0 "#PWR027" H 9200 4900 50  0001 C CNN
F 1 "GND" H 9205 4977 50  0000 C CNN
F 2 "" H 9200 5150 50  0001 C CNN
F 3 "" H 9200 5150 50  0001 C CNN
	1    9200 5150
	0    1    1    0   
$EndComp
$Comp
L power:+4V #PWR024
U 1 1 612A621A
P 9100 5250
F 0 "#PWR024" H 9100 5100 50  0001 C CNN
F 1 "+4V" H 9115 5423 50  0000 C CNN
F 2 "" H 9100 5250 50  0001 C CNN
F 3 "" H 9100 5250 50  0001 C CNN
	1    9100 5250
	0    -1   -1   0   
$EndComp
$Comp
L power:+4V #PWR03
U 1 1 612841BE
P 3300 1950
F 0 "#PWR03" H 3300 1800 50  0001 C CNN
F 1 "+4V" H 3315 2123 50  0000 C CNN
F 2 "" H 3300 1950 50  0001 C CNN
F 3 "" H 3300 1950 50  0001 C CNN
	1    3300 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1950 3400 1950
$Comp
L Connector_Generic:Conn_01x05 J10
U 1 1 612A0986
P 9500 5250
F 0 "J10" H 9580 5292 50  0000 L CNN
F 1 "Step-up" H 9580 5201 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 9500 5250 50  0001 C CNN
F 3 "~" H 9500 5250 50  0001 C CNN
	1    9500 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 1950 7550 1950
Wire Wire Line
	7050 1950 7200 1950
$Comp
L power:GND #PWR017
U 1 1 612903E0
P 7450 1850
F 0 "#PWR017" H 7450 1600 50  0001 C CNN
F 1 "GND" H 7455 1677 50  0000 C CNN
F 2 "" H 7450 1850 50  0001 C CNN
F 3 "" H 7450 1850 50  0001 C CNN
	1    7450 1850
	-1   0    0    1   
$EndComp
$Comp
L Device:R R3
U 1 1 6128BC14
P 7350 1950
F 0 "R3" V 7143 1950 50  0000 C CNN
F 1 "R" V 7234 1950 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7280 1950 50  0001 C CNN
F 3 "~" H 7350 1950 50  0001 C CNN
	1    7350 1950
	0    1    1    0   
$EndComp
Wire Wire Line
	3300 2050 3400 2050
$Comp
L power:GND #PWR04
U 1 1 61284E16
P 3300 2050
F 0 "#PWR04" H 3300 1800 50  0001 C CNN
F 1 "GND" H 3305 1877 50  0000 C CNN
F 2 "" H 3300 2050 50  0001 C CNN
F 3 "" H 3300 2050 50  0001 C CNN
	1    3300 2050
	0    1    1    0   
$EndComp
$Comp
L power:+3.3V #PWR010
U 1 1 61264FB6
P 5750 2000
F 0 "#PWR010" H 5750 1850 50  0001 C CNN
F 1 "+3.3V" V 5765 2128 50  0000 L CNN
F 2 "" H 5750 2000 50  0001 C CNN
F 3 "" H 5750 2000 50  0001 C CNN
	1    5750 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR011
U 1 1 612621AD
P 5750 2100
F 0 "#PWR011" H 5750 1850 50  0001 C CNN
F 1 "GND" H 5755 1927 50  0000 C CNN
F 2 "" H 5750 2100 50  0001 C CNN
F 3 "" H 5750 2100 50  0001 C CNN
	1    5750 2100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR07
U 1 1 61250D2F
P 3950 3450
F 0 "#PWR07" H 3950 3200 50  0001 C CNN
F 1 "GND" H 3955 3277 50  0000 C CNN
F 2 "" H 3950 3450 50  0001 C CNN
F 3 "" H 3950 3450 50  0001 C CNN
	1    3950 3450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R2
U 1 1 61246CB8
P 7250 5750
F 0 "R2" V 7043 5750 50  0000 C CNN
F 1 "R" V 7134 5750 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 7180 5750 50  0001 C CNN
F 3 "~" H 7250 5750 50  0001 C CNN
	1    7250 5750
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR015
U 1 1 61242271
P 6150 6250
F 0 "#PWR015" H 6150 6000 50  0001 C CNN
F 1 "GND" H 6155 6077 50  0000 C CNN
F 2 "" H 6150 6250 50  0001 C CNN
F 3 "" H 6150 6250 50  0001 C CNN
	1    6150 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR022
U 1 1 6123FDEF
P 7850 6050
F 0 "#PWR022" H 7850 5800 50  0001 C CNN
F 1 "GND" H 7855 5877 50  0000 C CNN
F 2 "" H 7850 6050 50  0001 C CNN
F 3 "" H 7850 6050 50  0001 C CNN
	1    7850 6050
	1    0    0    -1  
$EndComp
$Comp
L power:+6V #PWR021
U 1 1 6123156C
P 7800 5450
F 0 "#PWR021" H 7800 5300 50  0001 C CNN
F 1 "+6V" H 7815 5623 50  0000 C CNN
F 2 "" H 7800 5450 50  0001 C CNN
F 3 "" H 7800 5450 50  0001 C CNN
	1    7800 5450
	1    0    0    -1  
$EndComp
$Comp
L power:+6V #PWR012
U 1 1 6122E244
P 6000 5450
F 0 "#PWR012" H 6000 5300 50  0001 C CNN
F 1 "+6V" H 6015 5623 50  0000 C CNN
F 2 "" H 6000 5450 50  0001 C CNN
F 3 "" H 6000 5450 50  0001 C CNN
	1    6000 5450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 61225DC9
P 5600 5950
F 0 "R1" V 5393 5950 50  0000 C CNN
F 1 "R" V 5484 5950 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 5530 5950 50  0001 C CNN
F 3 "~" H 5600 5950 50  0001 C CNN
	1    5600 5950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR05
U 1 1 6121F915
P 3350 4550
F 0 "#PWR05" H 3350 4300 50  0001 C CNN
F 1 "GND" H 3355 4377 50  0000 C CNN
F 2 "" H 3350 4550 50  0001 C CNN
F 3 "" H 3350 4550 50  0001 C CNN
	1    3350 4550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 6121C865
P 3850 4550
F 0 "#PWR06" H 3850 4300 50  0001 C CNN
F 1 "GND" H 3855 4377 50  0000 C CNN
F 2 "" H 3850 4550 50  0001 C CNN
F 3 "" H 3850 4550 50  0001 C CNN
	1    3850 4550
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR02
U 1 1 61219C8F
P 3150 3750
F 0 "#PWR02" H 3150 3600 50  0001 C CNN
F 1 "+3.3V" V 3165 3878 50  0000 L CNN
F 2 "" H 3150 3750 50  0001 C CNN
F 3 "" H 3150 3750 50  0001 C CNN
	1    3150 3750
	0    -1   -1   0   
$EndComp
$Comp
L power:+3.3V #PWR08
U 1 1 61211B26
P 4050 3750
F 0 "#PWR08" H 4050 3600 50  0001 C CNN
F 1 "+3.3V" V 4065 3878 50  0000 L CNN
F 2 "" H 4050 3750 50  0001 C CNN
F 3 "" H 4050 3750 50  0001 C CNN
	1    4050 3750
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR01
U 1 1 61211179
P 2900 2550
F 0 "#PWR01" H 2900 2400 50  0001 C CNN
F 1 "+5V" H 2915 2723 50  0000 C CNN
F 2 "" H 2900 2550 50  0001 C CNN
F 3 "" H 2900 2550 50  0001 C CNN
	1    2900 2550
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR09
U 1 1 6120C02E
P 4800 2550
F 0 "#PWR09" H 4800 2400 50  0001 C CNN
F 1 "+5V" H 4815 2723 50  0000 C CNN
F 2 "" H 4800 2550 50  0001 C CNN
F 3 "" H 4800 2550 50  0001 C CNN
	1    4800 2550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J4
U 1 1 611E7EC7
P 6100 2100
F 0 "J4" H 6180 2092 50  0000 L CNN
F 1 "BME_280" H 6180 2001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6100 2100 50  0001 C CNN
F 3 "~" H 6100 2100 50  0001 C CNN
	1    6100 2100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 Air_pump1
U 1 1 611D3C94
P 8200 5450
F 0 "Air_pump1" H 8280 5442 50  0000 L CNN
F 1 "Conn_01x02" H 8280 5351 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 8200 5450 50  0001 C CNN
F 3 "~" H 8200 5450 50  0001 C CNN
	1    8200 5450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 611C95B7
P 6300 4000
F 0 "J5" H 6380 3992 50  0000 L CNN
F 1 "Stepper Power" H 6380 3901 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 6300 4000 50  0001 C CNN
F 3 "~" H 6300 4000 50  0001 C CNN
	1    6300 4000
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x04 J6
U 1 1 611C74EC
P 6350 4700
F 0 "J6" H 6430 4692 50  0000 L CNN
F 1 "Stepper Motor" H 6430 4601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Vertical" H 6350 4700 50  0001 C CNN
F 3 "~" H 6350 4700 50  0001 C CNN
	1    6350 4700
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 Servo1
U 1 1 611C69F3
P 6350 5550
F 0 "Servo1" H 6430 5592 50  0000 L CNN
F 1 "Conn_01x03" H 6430 5501 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x03_P2.54mm_Vertical" H 6350 5550 50  0001 C CNN
F 3 "~" H 6350 5550 50  0001 C CNN
	1    6350 5550
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 611C30F4
P 3600 1950
F 0 "J3" H 3680 1942 50  0000 L CNN
F 1 "POWER" H 3680 1851 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 3600 1950 50  0001 C CNN
F 3 "~" H 3600 1950 50  0001 C CNN
	1    3600 1950
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J7
U 1 1 611C299A
P 7750 2450
F 0 "J7" H 7830 2442 50  0000 L CNN
F 1 "Detector" H 7830 2351 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 7750 2450 50  0001 C CNN
F 3 "~" H 7750 2450 50  0001 C CNN
	1    7750 2450
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J9
U 1 1 611C19C1
P 9500 4100
F 0 "J9" H 9580 4092 50  0000 L CNN
F 1 "EndStop" H 9580 4001 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 9500 4100 50  0001 C CNN
F 3 "~" H 9500 4100 50  0001 C CNN
	1    9500 4100
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 LED1
U 1 1 611C0914
P 7750 1850
F 0 "LED1" H 7830 1842 50  0000 L CNN
F 1 "Conn_01x02" H 7830 1751 50  0000 L CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_1x02_P2.54mm_Vertical" H 7750 1850 50  0001 C CNN
F 3 "~" H 7750 1850 50  0001 C CNN
	1    7750 1850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J2
U 1 1 611BF370
P 3550 4050
F 0 "J2" H 3600 4567 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 3600 4476 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 3550 4050 50  0001 C CNN
F 3 "~" H 3550 4050 50  0001 C CNN
	1    3550 4050
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x10_Odd_Even J1
U 1 1 611B3F45
P 3550 2950
F 0 "J1" H 3600 3567 50  0000 C CNN
F 1 "Conn_02x10_Odd_Even" H 3600 3476 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x10_P2.54mm_Vertical" H 3550 2950 50  0001 C CNN
F 3 "~" H 3550 2950 50  0001 C CNN
	1    3550 2950
	1    0    0    -1  
$EndComp
Text GLabel 7050 1950 0    60   Input ~ 0
D13
Wire Wire Line
	3850 2550 4800 2550
Wire Wire Line
	5750 5950 5850 5950
Wire Wire Line
	5250 5950 5450 5950
Text GLabel 5250 5950 0    60   Input ~ 0
D6
Wire Wire Line
	7400 5750 7550 5750
Wire Wire Line
	6150 5650 6150 5750
Wire Wire Line
	6150 6150 6150 6250
Wire Wire Line
	5900 2300 5750 2300
Wire Wire Line
	5900 2200 5750 2200
Wire Wire Line
	5900 2100 5750 2100
Wire Wire Line
	5900 2000 5750 2000
Wire Wire Line
	6950 5750 7100 5750
Wire Wire Line
	7850 5950 7850 6050
Wire Wire Line
	8000 5550 7850 5550
Wire Wire Line
	8000 5450 7800 5450
Wire Wire Line
	6150 5550 6000 5550
Wire Wire Line
	6150 5450 6000 5450
Wire Wire Line
	3850 4350 4350 4350
Wire Wire Line
	3850 4250 3950 4250
Wire Wire Line
	3850 4150 4250 4150
Wire Wire Line
	3850 4050 4000 4050
Wire Wire Line
	3850 3950 4250 3950
Wire Wire Line
	3850 3850 3950 3850
Wire Wire Line
	3850 4450 3850 4550
Wire Wire Line
	3350 4450 3350 4550
Wire Wire Line
	3350 4350 3250 4350
Wire Wire Line
	3350 4250 2750 4250
Wire Wire Line
	3350 4150 3000 4150
Wire Wire Line
	3350 4050 3250 4050
Wire Wire Line
	3350 3950 2550 3950
Wire Wire Line
	3350 3850 2950 3850
Wire Wire Line
	3850 3750 4050 3750
Wire Wire Line
	3350 3750 3150 3750
Wire Wire Line
	3350 2550 2900 2550
Wire Wire Line
	3350 3450 2650 3450
Wire Wire Line
	3350 3350 2900 3350
Wire Wire Line
	3350 3250 3200 3250
Wire Wire Line
	3350 3150 2550 3150
Wire Wire Line
	3350 2850 2400 2850
Wire Wire Line
	3350 2750 2850 2750
Wire Wire Line
	3350 2650 3200 2650
Wire Wire Line
	3850 3350 4200 3350
Wire Wire Line
	3850 3450 3950 3450
Wire Wire Line
	3850 3150 4550 3150
Wire Wire Line
	3850 2850 4350 2850
Wire Wire Line
	3850 2750 4000 2750
Wire Wire Line
	3850 2650 4050 2650
Wire Wire Line
	5300 4900 6150 4900
Wire Wire Line
	5550 4800 6150 4800
Wire Wire Line
	5800 4700 6150 4700
Wire Wire Line
	3350 3050 2850 3050
Wire Wire Line
	3350 2950 3200 2950
Wire Wire Line
	3850 3050 4250 3050
Wire Wire Line
	3850 2950 3950 2950
Wire Wire Line
	6150 4600 6000 4600
Wire Wire Line
	3850 3250 3950 3250
Text Notes 6400 3550 0    79   ~ 0
Seconadary Mission Taking Samples Mechaninsm
Text Notes 2800 1650 0    79   ~ 0
Main Integrated Circuit Outputs\n
Text GLabel 6950 5750 0    60   Input ~ 0
D7
Text GLabel 6000 5550 0    60   Input ~ 0
D6
Text GLabel 4350 4350 2    60   Input ~ 0
MOSI
Text GLabel 3950 4250 2    60   Input ~ 0
MISO
Text GLabel 4250 4150 2    60   Input ~ 0
D9
Text GLabel 4000 4050 2    60   Input ~ 0
D7
Text GLabel 4250 3950 2    60   Input ~ 0
SERIAL5_TXD
Text GLabel 3950 3850 2    60   Input ~ 0
Vbat
Text GLabel 3250 4350 0    60   Input ~ 0
SCK
Text GLabel 2750 4250 0    60   Input ~ 0
D13
Text GLabel 3000 4150 0    60   Input ~ 0
D8
Text GLabel 3250 4050 0    60   Input ~ 0
D6
Text GLabel 2550 3950 0    60   Input ~ 0
SERIAL5_RDX
Text GLabel 2950 3850 0    60   Input ~ 0
nRESET
Text GLabel 2650 3450 0    60   Input ~ 0
AREFA
Text GLabel 4200 3350 2    60   Input ~ 0
A4
Text GLabel 2900 3350 0    60   Input ~ 0
A5
Text GLabel 3200 3250 0    60   Input ~ 0
A3
Text GLabel 4550 3150 2    60   Input ~ 0
A0
Text GLabel 2550 3150 0    60   Input ~ 0
A1
Text GLabel 4350 2850 2    60   Input ~ 0
D0
Text GLabel 2400 2850 0    60   Input ~ 0
D1
Text GLabel 4000 2750 2    60   Input ~ 0
SWDIO
Text GLabel 2850 2750 0    60   Input ~ 0
SWCLK
Text GLabel 4050 2650 2    60   Input ~ 0
SDA
Text GLabel 3200 2650 0    60   Input ~ 0
SCL
Text GLabel 5300 4900 0    60   Input ~ 0
D5
Text GLabel 5550 4800 0    60   Input ~ 0
D4
Text GLabel 5800 4700 0    60   Input ~ 0
D3
Text GLabel 6000 4600 0    60   Input ~ 0
D2
Text GLabel 4250 3050 2    60   Input ~ 0
D4
Text GLabel 2850 3050 0    60   Input ~ 0
D5
Text GLabel 3950 2950 2    60   Input ~ 0
D2
Text GLabel 3200 2950 0    60   Input ~ 0
D3
Text GLabel 3950 3250 2    60   Input ~ 0
A2
$Comp
L Connector_Generic:Conn_01x05 J11
U 1 1 6133CF92
P 7350 4750
F 0 "J11" H 7430 4792 50  0000 L CNN
F 1 "Stepper pin extention" H 7430 4701 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical" H 7350 4750 50  0001 C CNN
F 3 "~" H 7350 4750 50  0001 C CNN
	1    7350 4750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
