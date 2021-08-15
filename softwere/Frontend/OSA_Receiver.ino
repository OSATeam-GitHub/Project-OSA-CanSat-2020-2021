/* -----------------------------------------------------------------------
    CANSAT RECEIVER
   ---------------------------------------------------------------------*/

#include <CanSatKit.h>
using namespace CanSatKit;

// ---------------------- SD Card definitions -----------------------------
#include <SD.h>
File dataFile;
String dataFileName = "Rec_7.txt";
int sdCardPin = 11;
// ------------------------------------------------------------------------

// ---------------------- LoRa Radio definitions --------------------------
Radio radio(Pins::Radio::ChipSelect,
            Pins::Radio::DIO0,
            433.300, // frequency in MHz
            Bandwidth_125000_Hz,
            SpreadingFactor_9, //Optimal 9
            CodingRate_4_8);   //Optimal 4_8
// ------------------------------------------------------------------------
//-----------------------------Decoder-------------------------------------
#include "stdio.h"
#include "stdint.h"
#include "string.h"
uint8_t bytes[256];
uint8_t *ptr = bytes;

float res_calcCurrentAltitude;
float res_finalAltitude;
uint8_t res_probesDone[5];
float res_samplesAltuides[5][2];
float res_measurmentCurrentMillis;
uint32_t res_pipePressure;
uint32_t res_ambientPressure;
float res_ambientTemp;
float res_ambientHumidity;
uint8_t res_gpsHours;
uint8_t res_gpsMinutes;
uint8_t res_gpsSeconds;
uint8_t res_gpsDay;
uint8_t res_gpsMonth;
uint16_t res_gpsYear;
uint8_t res_gpsFix;
uint8_t res_gpsFixQuality;
uint8_t res_isParaschuteOpened;
float res_gpsLongitude;
char res_gpsLon;
float res_gpsLatitude;
char res_gpsLat;
float res_gpsAltitude;
uint8_t res_gpsSat;
uint8_t res_programFaze;


// ------------------------------ Other -----------------------------------
bool ledState = false;
const int ledPin = 13;
// ------------------------------------------------------------------------

void setup()
{
    delay(5000);
    SerialUSB.begin(115200);
    SerialUSB.println("CanSat initialization starting...");

    while (!Serial)
        ; // time to get serial running

    if (!SD.begin(sdCardPin))
    {
        SerialUSB.println("the SD Card failed or not present");
        while (1)
        {
        }
    }
    SerialUSB.println("the SD card is started...");

    radio.begin();
    SerialUSB.println("the LoRa radio is started...");

    pinMode(ledPin, OUTPUT);
}

void loop()
{

    // prepare empty space for received frame
    // maximum length is maximum frame length + null termination
    // 255 + 1 byte = 256 bytes
    char dataFrame[256];
    Frame decodedDataFrame;

    digitalWrite(ledPin, ledState);
    ledState = !ledState;

    // receive data and save it to string
    radio.receive(dataFrame);
    for (int i = 0; i < 256; i++)
    {
        bytes[i] = dataFrame[i];
    }

    // get and print signal level (rssi)
    SerialUSB.print("RSSI ;");
    SerialUSB.print(radio.get_rssi_last());
    SerialUSB.print("; DATA ;");

    // print received message
    ptr = bytes;

    ptr = decode_f32(ptr, &res_calcCurrentAltitude);
    ptr = decode_f32(ptr, &res_finalAltitude);
    ptr = decode_uint8(ptr, &res_programFaze);
    for (int i = 0; i < 5; i++)
    {
        ptr = decode_uint8(ptr, &res_probesDone[i]);
    }
    for (int i = 0; i < 5; i++)
    {
        ptr = decode_f32(ptr, &res_samplesAltuides[i][0]);
        ptr = decode_f32(ptr, &res_samplesAltuides[i][1]);
    }
    ptr = decode_f32(ptr, &res_measurmentCurrentMillis);
    ptr = decode_uint32(ptr, &res_pipePressure);
    ptr = decode_uint32(ptr, &res_ambientPressure);
    ptr = decode_f32(ptr, &res_ambientTemp);
    ptr = decode_f32(ptr, &res_ambientHumidity);

    ptr = decode_uint8(ptr, &res_gpsHours);
    ptr = decode_uint8(ptr, &res_gpsMinutes);
    ptr = decode_uint8(ptr, &res_gpsSeconds);

    ptr = decode_uint8(ptr, &res_gpsDay);
    ptr = decode_uint8(ptr, &res_gpsMonth);
    ptr = decode_uint16(ptr, &res_gpsYear);

    ptr = decode_uint8(ptr, &res_gpsFix);
    ptr = decode_uint8(ptr, &res_gpsFixQuality);

    ptr = decode_uint8(ptr, &res_isParaschuteOpened);

    if(res_gpsFix)
    {
        ptr = decode_f32(ptr, &res_gpsLatitude);
    ptr = decode_char(ptr, &res_gpsLat);
    ptr = decode_f32(ptr, &res_gpsLongitude);
    ptr = decode_char(ptr, &res_gpsLon);
    ptr = decode_f32(ptr, &res_gpsAltitude);
    ptr = decode_uint8(ptr, &res_gpsSat);
    }
    
    SerialUSB.print(res_calcCurrentAltitude);    SerialUSB.print(";");
    SerialUSB.print(res_finalAltitude);    SerialUSB.print(";");
    SerialUSB.print(res_programFaze);    SerialUSB.print(";");
    for (int i = 0; i < 5; i++)
    {
    SerialUSB.print(res_probesDone[i]);    SerialUSB.print(";");
    }
    for (int i = 0; i < 5; i++)
    {
    SerialUSB.print(res_samplesAltuides[i][0]);    SerialUSB.print(";");
    SerialUSB.print(res_samplesAltuides[i][1]);    SerialUSB.print(";");
    }
    SerialUSB.print(res_measurmentCurrentMillis);    SerialUSB.print(";");
    SerialUSB.print(res_pipePressure);    SerialUSB.print(";");
    SerialUSB.print(res_ambientPressure);    SerialUSB.print(";");
    SerialUSB.print(res_ambientTemp);    SerialUSB.print(";");
    SerialUSB.print(res_ambientHumidity);    SerialUSB.print(";");
    SerialUSB.print((res_gpsHours, DEC)+2);    SerialUSB.print(":");
    SerialUSB.print(res_gpsMinutes, DEC);    SerialUSB.print(":");
    SerialUSB.print(res_gpsSeconds, DEC);    SerialUSB.print(";");
    SerialUSB.print(res_gpsDay, DEC);    SerialUSB.print("/");
    SerialUSB.print(res_gpsMonth, DEC);    SerialUSB.print("/");
    SerialUSB.print(res_gpsYear, DEC);    SerialUSB.print(";");
    SerialUSB.print(res_gpsFix);    SerialUSB.print(";");
    SerialUSB.print(res_gpsFixQuality);    SerialUSB.print(";");
    SerialUSB.print(res_isParaschuteOpened);    SerialUSB.print(";");
    if(res_gpsFix>0)
    {
    SerialUSB.print(res_gpsLatitude);//    SerialUSB.print(";");
    SerialUSB.print(res_gpsLat);    SerialUSB.print(";");
    SerialUSB.print(res_gpsLongitude);//    SerialUSB.print(";");
    SerialUSB.print(res_gpsLon);    SerialUSB.print(";");
    SerialUSB.print(res_gpsAltitude);    SerialUSB.print(";");
    SerialUSB.print(res_gpsSat);
    SerialUSB.println();
    }
    else
    {
        SerialUSB.println();
    }
     decodedDataFrame.print(res_calcCurrentAltitude);    decodedDataFrame.print(";");
     decodedDataFrame.print(res_finalAltitude);    decodedDataFrame.print(";");
     decodedDataFrame.print(res_programFaze);    decodedDataFrame.print(";");

    for(int i = 0; i<5;i++)
    {
        decodedDataFrame.print(res_probesDone[i]);    decodedDataFrame.print(";");
    }
    for(int i = 0; i<5;i++)
    {
        decodedDataFrame.print(res_samplesAltuides[i][0]);    decodedDataFrame.print(";");
        decodedDataFrame.print(res_samplesAltuides[i][1]);    decodedDataFrame.print(";");

    }
    decodedDataFrame.print(res_measurmentCurrentMillis);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_pipePressure);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_ambientPressure);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_ambientTemp);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_ambientHumidity);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsHours);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsMinutes);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsSeconds);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsDay);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsMonth);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsYear);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsFix);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsFixQuality);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_isParaschuteOpened);    decodedDataFrame.print(";");
    if(res_gpsFix>0)
    {
    decodedDataFrame.print(res_gpsLatitude);
    decodedDataFrame.print(res_gpsLat);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsLongitude);
    decodedDataFrame.print(res_gpsLon);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsAltitude);    decodedDataFrame.print(";");
    decodedDataFrame.print(res_gpsSat);
    decodedDataFrame.println();
    }

    //SerialUSB.print(dataFrame);
    // open the file. note that only one file can be open at a time,
    // so you have to close this one before opening another.
   dataFile = SD.open(dataFileName, FILE_WRITE);

    // if the file is available, write to it:
    if (dataFile)
    {
        dataFile.print(decodedDataFrame);
        dataFile.close();
    }
    // if the file isn't open, pop up an error:
    else
    {
        SerialUSB.println("error opening datalog.txt");
    }
}

uint8_t *encode_bytes(uint8_t *ptr, void *bytes, uint16_t size)
{
    memcpy(ptr, bytes, size);
    return ptr + size;
}

uint8_t *decode_bytes(uint8_t *ptr, void *bytes, uint16_t size)
{
    memcpy(bytes, ptr, size);
    return ptr + size;
}

uint8_t *encode_uint8(uint8_t *ptr, uint8_t value)
{
    return encode_bytes(ptr, &value, sizeof(uint8_t));
}

uint8_t *encode_uint16(uint8_t *ptr, uint16_t value)
{
    return encode_bytes(ptr, &value, sizeof(uint16_t));
}

uint8_t *encode_uint32(uint8_t *ptr, uint32_t value)
{
    return encode_bytes(ptr, &value, sizeof(uint32_t));
}

uint8_t *encode_f32(uint8_t *ptr, float value)
{
    return encode_bytes(ptr, &value, sizeof(float));
}

uint8_t *decode_uint8(uint8_t *ptr, uint8_t *value)
{
    return decode_bytes(ptr, value, sizeof(uint8_t));
}

uint8_t *decode_uint16(uint8_t *ptr, uint16_t *value)
{
    return decode_bytes(ptr, value, sizeof(uint16_t));
}

uint8_t *decode_uint32(uint8_t *ptr, uint32_t *value)
{
    return decode_bytes(ptr, value, sizeof(uint32_t));
}

uint8_t *decode_f32(uint8_t *ptr, float *value)
{
    return decode_bytes(ptr, value, sizeof(float));
}
uint8_t *decode_char(uint8_t *ptr, char *value)
{
    return decode_bytes(ptr, value, sizeof(char));
}
uint8_t *encode_char(uint8_t *ptr, char value)
{
    return encode_bytes(ptr, &value, sizeof(char));
}
