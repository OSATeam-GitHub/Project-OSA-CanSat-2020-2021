#  Project OSA

OSA a is minisatellite the size of a can designed to participate in the ESA cansat 2021 competition 🛰️📡. Our project calls OSA (in Polish “Opadający Satelita Atmosferyczny” is loosely translated into “Falling Atmospheric Satellite”) and team - [OSATeam](https://www.osacan.eu/)

OSA can be launched from a drone or racket and while falling it has two missions. Primary is to take the measurements of air temperature, pressure, humidity and sand it via LoRa radio to the ground station. The secondary  is to take five air samples 🧪. 

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
All parts which should be 3D printed are also available above. To print them we used high-quality PLA due to the better tolerance that comes with it witch is necessary.

Here you can see the Sting System. A pump is designed to collect air samples. Its inlet leads to the outside of the CanSat and its outlet leads to the needle. The needle was designed to be inject into the test tubes by a servo with a special mechanism. To fill another tube, the servo is meant to be rotated by a stepper motor.

![image](https://user-images.githubusercontent.com/88943059/129552778-5c882dc0-a8d4-47ff-b7a5-c0f45c2d3af1.png)

### Carusele
The carousel is designed to turn the servo. It uses a stepper motor and three gears (ratio 1:1:1). The
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
OSA is powered by the CanSat kit, therefore it’s fully compatible with Arduino. Currently, we are working on a new PCB board for OSA. We will upload the design with the scheme soon.

## OSA software
Due to the OSA brain, OSA OS is an Arduino code. To make the code clean we wrote a library for controlling all OSA systems. 

While being on the ground after turning on OSA takes measurements and sets current altitude (calculated from pressure and temperature) as initial altitude. Until detecting the opening of the parachute OSA will stay in the rest position. It means that the needle will be hidden between two probes so there will be lower chances of being damaged. After detecting the opening of the parachute OSA waits about a second to stabilize and then sets current altitude as final altitude. Then it calculates five altitudes on which it’s supposed to take the samples. 

Independently OSA takes measurements from all sensors every second. OSA is equipped with a sensor that measures the pressure inside the pipe connected with the needle. According to that pressure while taking the sample we know whether the probe was taken or not. Measurements with data about the secondary mission and GPS data are saved on an SD card and after encoding they are being sent via LoRa radio to the ground station. OSA sends various data about the secondary mission so not only do we know whether the sample was taken or not, but also exactly the altitude it started and finished taking. Also, the altitude at which the parachute was opened is being saved. If it wasn’t for encoding, the RX buffer would get stacked. If for some reason any of the samples wasn’t taken, after taking all others OSA will come back and repeat taking those samples.


## Ground station software
## Contact
📫 We are opened to suggestions and collaboration. Contact us!
- https://www.facebook.com/osacan.eu/
- https://www.instagram.com/osateam_cansat/
- osacansat@gmail.com
- @OSATeam_CanSat
## Licence
<!---
OSATeam-GitHub/OSATeam-GitHub is a ✨ special ✨ repository because its `README.md` (this file) appears on your GitHub profile.
You can click the Preview link to take a look at your changes.
--->
