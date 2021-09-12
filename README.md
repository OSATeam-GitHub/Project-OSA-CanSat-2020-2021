#  Project OSA

OSA a is minisatellite/ space probe the size of a can designed to participate in the ESA CanSat 2021 competition 🛰️📡. Our project is called OSA (in Polish “Opadający Satelita Atmosferyczny” is loosely translated into “Falling Atmospheric Satellite”) and team - [OSATeam](https://www.osacan.eu/)

OSA is desgined to carry out reasearches while falling in the atmospehere. Space probe can be deployed from drone, rocket or droped from certain altitude. Parachute guarantees safe landing. Primarily device measures air temperature, pressure, humidity and send it via LoRa radio to the ground station. This data is used onboard sattelite to calculate live altitude. 

The main aim for OSA is to collect five air samples🧪 for later analysis. It is done by custom-designed mechanism, that injects needle to autosealing sterile containers and pump air sample into it. 

Among other OSA has built-in GPS so after lunch it can be found easily.

![CS_OSATeam2](https://user-images.githubusercontent.com/88943059/129559207-78a6c8ad-a901-497b-be1c-e3f4120bfaae.jpg)

## Tabele of contents
* [Mechanical design](#mechanical-design)
* [Electronic design](#electronic-design)
* [OSA software](#osa-software)
* [Contact](#contact)
* [Licence](#licence)
## Mechanical design
Mechanical was designed in fusion 360. The full project is available to watch with this link:
https://a360.co/3AG3GMY. 
All parts which should be 3D printed are also available above. You should use precise printer. To print them we used high-quality PLA. Inaacuracy will yield in device inoperatavity. 

### Sting System
System injects needle into container using gear and slider powered by servomechanism. Then pump inflates atmosphere into the container. In fact there is to need to use pump due to fact containers are underpressure, although puting pump into system will increase concentartion of gases. Then upper part of sting system is rotated by carousele. 

![image](https://user-images.githubusercontent.com/88943059/129552778-5c882dc0-a8d4-47ff-b7a5-c0f45c2d3af1.png)

### Carousele
The carousel is designed to turn the servo and sting. It uses a stepper motor and three gears (ratio 1:1:1). The
motor does not have a centered shaft, therefore a gear system consisting of three gears has been printed on a 3D
printer. Servo gear is located in the middle and it holds the servo. On one side there is motor gear that is attached
to the [28BYJ-48 stepper motor](https://botland.com.pl/silniki-krokowe/12807-silnik-krokowy-z-przekladnia-28byj-48-5v-01a-003nm-ze-sterownikiem-uln2003.html). On the opposite side, there is support gear that makes the mechanism work with lower
backlash. Carusele is part of main-base body. It might be challenging to print therefor we additionaly added splited main-base part. Printing spearetly should be easier, after printing that way the prats should be glued togather.
Servo gear is printed in place with the base of the case as one part. It is mounted on the round body, so
it holds together. Support gear is printed as a separate part. While the base is printing the printer should be stoped at the right
height so the support gear could be manually added ( the stoping point can be set in slicer ).

![karuzela napisy](https://user-images.githubusercontent.com/88943059/129555536-9d3b9d2f-ef83-45b0-bf1a-a581033ca1a1.gif)

### Servo mechanism
The servo mechanism converts the rotation of the motor into linear movement of the needle therefore it can be injected into the test tube.
The blocker part is additionally added to help the needle stay in place.

![image](https://user-images.githubusercontent.com/88943059/129556586-d9015ed0-de87-4853-9600-7148d6157114.png)

### Main casing body and electronic case
Both the main casing body ( main-mid ) and the electronic case are designed to be printed without any supports. They don't require as high precision as the carousel does.

## Electronic design
OSA is powered by the CanSat kit, therefore it’s fully compatible with Arduino m0. Full CanSat kit documentation can be found on the ESERO Polska page in the statute, or right [here](https://github.com/CanSatKit/Documentation). On to the mainboard, you should sold GPS module as well as the  1/2 wave long antenna. [This](https://www.changpuak.ch/electronics/yagi_uda_antenna_DL6WU.php?fbclid=IwAR0hKYk1dh2FgNYhQmpAeVwOAlgjz0rPHka-r6Hd5ZqAI7iYF1GUxPW0EE0) calculator may be useful. 

Currently, we are working on a new PCB board for OSA. We will upload the design with the scheme soon.

![OsaCan-1](https://user-images.githubusercontent.com/88943059/132985075-b992912d-4d2b-4c65-b10b-7d3d00f4c0b6.jpg)

### Ground station hardware
OSA ground station is simply the CanSat kit board connected with a yagi directional antenna. The mainboard should be connected by USB with PC or laptop.
It will work with any antenna which fulfils requirments (the closer to requitments the better signal:

- Frequency     :  433  MHz
- Wavelength    :  693  mm
- Rod Diameter  :  10  mm
- Boom Diameter :  20  mm
- Boom Length   :  238  mm
- d/lambda      :  0.014    ( min.: 0.002 , max.: 0.01 )
- D/lambda      :  0.029    ( min.: 0.01 , max.: 0.05 )
- Elements      :  3
- Gain          :  5.23 dBd (approx.)
- Reflector Length   : 334 mm
- Reflector Position :  0 mm
- Dipole Position    : 166 mm
- Director #1 Position : 218 mm ,  Length : 315 mm
- Distance Dipole - Dir. #1 : 52 mm 

[yagi antenna calculator](https://www.changpuak.ch/electronics/yagi_uda_antenna_DL6WU.php)

## OSA software
OSA OS is Arduino based. To make the code clean we wrote a library for controlling all OSA systems. 

Before launch, when OSA is turned on it will take measurements and calculation to establish ground altituted. Until detecting the opening of the parachute OSA will stay in the rest position. It means that the needle will be hidden between two probes so it takes less space. After detecting the opening of the parachute OSA waits about a second to stabilize and then sets current altitude as final altitude. Then it calculates five intervals on which it’s supposed to take the samples. 

Independently OSA takes measurements from all sensors every second, send it via radio and save it on SD card. Excluding pressure, temperature, humidity OSA equipped with a sensor that measures the pressure inside the pipe connected with the needle. According to that pressure we know whether the probe was taken or not. If for some reason any of the samples wasn’t taken, after taking all others OSA will come back and repeat taking those samples. OSA sends various data about the so not only do we know whether the sample was taken or not, but also exactly the altitude it started and finished taking. Also, the altitude at which the parachute was opened is saved.

OSA encodes data which is send via radio, otherwise buffor would have stucked. 

## Ground station software

## Contact
📫 We are opened to suggestions and collaboration. Contact us!
- https://www.facebook.com/osacan.eu/
- https://www.instagram.com/osateam_cansat/
- osacansat@gmail.com
- @OSATeam_CanSat

## Licence
Copyright (C)  2020 Project OSA.

This project is free software and hardware: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
   any later version.

   This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.
    
<!---
OSATeam-GitHub/OSATeam-GitHub is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
