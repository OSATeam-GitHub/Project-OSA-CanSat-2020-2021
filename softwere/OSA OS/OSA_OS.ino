#include <CanSatKit.h>
/* -----------------------------------------------------------------------
 *  CANSAT TRANSMITTER
 * ---------------------------------------------------------------------*/
#include <OsaCarusele.h>
#include <Adafruit_GPS.h>

using namespace CanSatKit;
//unsigned long symulacjaCurrentMillis, symulacjaPreviousMillis;
unsigned long sampleCurrentMillis =0 , samplePreviousMillis = 0, sampleTimeInterval;
//int symulacjaAltitude;

OsaCarusele cansat;
void setup()
{
  cansat.begin();
  //symulacjaCurrentMillis = 0;
  //symulacjaPreviousMillis = 0;
  //symulacjaAltitude = 0;

  cansat.autohome();  cansat.programFaze = 1;
  delay(1000); //dojeżdża do krańcówki
  cansat.rest();  cansat.programFaze = 2;
  delay(500);
  cansat.backlashCorrection(0);

  //cansat.initialAltitude = symulacjaAltitude;
  cansat.initialAltitude = cansat.altiduteCalc();
  cansat.finalAltitude = cansat.initialAltitude;
  cansat.currentAltitude = cansat.initialAltitude;
}

void loop()
{
  SerialUSB.println("Gotowy do lotu "); cansat.programFaze = 3;
  while (!cansat.isParachuteOpened()) // -> sprawdza kiedy mniej więcej otworzy się spadochron i po 30 m spadaku wychodzi z pętli
  {
   // cansat.gpsCheck();
    cansat.ifIntervalSendMeasurments();
  }
  cansat.currentMillis = millis();
  cansat.previousMillis = cansat.currentMillis;
  while (cansat.currentMillis - cansat.previousMillis < 200)
  {
    cansat.ifIntervalSendMeasurments();
    cansat.currentMillis = millis();
  }
  cansat.programFaze = 4;
  cansat.finalAltitude = cansat.altiduteCalc();
  if((cansat.finalAltitude<0)||(cansat.finalAltitude>600))
    {
      cansat.finalAltitude = 150;
      cansat.programFaze = 5;
    }

 // cansat.finalAltitude = 150; //symulacja

  SerialUSB.println("zaczynam spaaaaadać!!!");
 // SerialUSB.print("Maksymalna wysokość: ");
  //SerialUSB.println(finalAltitude);
  cansat.leaveRest();cansat.programFaze = 6;

  SerialUSB.println("wykonałem leaveRest, zaczynam misje, pozycja silnika: ");
  //SerialUSB.println(cansat.stepper_position); //igła przygotowana do pobierania próbek
  nmea_float_t probesAltitudeInterval = ((cansat.finalAltitude - 2) - cansat.initialAltitude) / 5;
  cansat.previousAltitude = (cansat.finalAltitude - 2) + probesAltitudeInterval;
  int probesIndex = 0;
  sampleTimeInterval = probesAltitudeInterval/10;  

  while (probesIndex < 5)
  {
    //symulacjaCurrentMillis = millis();

    cansat.ifIntervalSendMeasurments();
    //cansat.currentAltitude = symulacjaAltitude;
    cansat.currentAltitude = cansat.altiduteCalc();
    sampleCurrentMillis = millis();
    if ((cansat.currentAltitude <= cansat.previousAltitude - probesAltitudeInterval)&&(sampleCurrentMillis >= samplePreviousMillis + sampleTimeInterval))
    {
      cansat.programFaze = probesIndex;
      cansat.previousAltitude = cansat.currentAltitude;
      samplePreviousMillis = sampleCurrentMillis;
      cansat.takeSample(probesIndex);
      probesIndex++;
    }

    /*if (symulacjaCurrentMillis > symulacjaPreviousMillis + 1000)
    {
      symulacjaPreviousMillis = symulacjaCurrentMillis;
      symulacjaAltitude -= 7;
    }*/
  }
  cansat.programFaze =7;
  cansat.repidProbes();
  cansat.programFaze = 8;
  SerialUSB.println("Pobrałem ostatnia probowke, wykonuje rest");

  cansat.rest();
  cansat.programFaze = 9;
  digitalWrite(cansat.STEPUPPOWER, LOW);
  while (1)
  {
    cansat.ifIntervalSendMeasurments();
  }
}
