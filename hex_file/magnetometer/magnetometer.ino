#include <Wire.h>
#include <Adafruit_BNO055.h>
#include <EEPROM.h>
#include <ros.h>
#include <std_msgs/Float32.h>
#include <std_msgs/Bool.h>
#include <std_msgs/String.h>
#define BNO055_SAMPLERATE_DELAY_MS (100)
Adafruit_BNO055 bno = Adafruit_BNO055(55);
ros::NodeHandle  nh;
std_msgs::Float32 orientation;
ros::Publisher orientationPublisher("orientation_raw", &orientation);
std_msgs::String imuMsg;
ros::Publisher imuPublisher("arduino/raw_imu", &imuMsg);
bool switch_mode = false;


void messageCb( const std_msgs::Bool& toggle_msg){
  if (toggle_msg.data)
  {
    switch_mode = true;
  }
}
ros::Subscriber<std_msgs::Bool> sub("switch_mode", &messageCb );
void setup(void)
{
    nh.getHardware()->setBaud(57600);
    nh.initNode();
    nh.subscribe(sub);
    nh.advertise(orientationPublisher);
    nh.advertise(imuPublisher);
    if (!bno.begin())
    {
        while (1);
    }
    
    //bno.getSensorOffsets(calib);
    //displaySensorOffsets(calib);
    int eeAddress = 0;
    long bnoID;

    EEPROM.get(eeAddress, bnoID);

    adafruit_bno055_offsets_t calibrationData;
    sensor_t sensor;
    bno.getSensor(&sensor);
    if (bnoID == sensor.sensor_id)
    {
        eeAddress += sizeof(long);
        EEPROM.get(eeAddress, calibrationData);
        bno.setSensorOffsets(calibrationData);

        //displaySensorOffsets(calibrationData);
    }

    delay(1000);
    bno.setExtCrystalUse(true);
}

void loop() {
    String buffer_;
    if (!switch_mode)
    {
        imu::Vector<3> magnetometer = bno.getVector(Adafruit_BNO055::VECTOR_MAGNETOMETER);
        orientation.data = atan2(magnetometer.y(), magnetometer.x());
        buffer_ += "qW:";
        buffer_ += String(float(cos(orientation.data/2)));
        buffer_ += "qX:";
        buffer_ += String("0");
        buffer_ += "qY:";
        buffer_ += String("0");
        buffer_ += "qZ:";
        buffer_ += String(float(sin(orientation.data/2)));
        /*Serial.print("Before ");
        Serial.print((orientation.data*180)/3.14 );
        Serial.print("\t");
        Serial.print(" After ");
        Serial.println((orientation.data *180)/3.14);*/
        
        delay(BNO055_SAMPLERATE_DELAY_MS);
    }
    else
    {
    

        imu::Vector<3> euler = bno.getVector(Adafruit_BNO055::VECTOR_EULER);
        
        orientation.data = float(euler.x()) * float(M_PI) /180;
        imu::Quaternion quat = bno.getQuat();
        buffer_ += "qW:";
        buffer_ += String(quat.w(),6);
        buffer_ += "qX:";
        buffer_ += String(quat.x(),6);
        buffer_ += "qY:";
        buffer_ += String(quat.y(),6);
        buffer_ += "qZ:";
        buffer_ += String(quat.z(),6);
        orientationPublisher.publish( &orientation );
        delay(BNO055_SAMPLERATE_DELAY_MS);
    }
    imu::Vector<3> linearAccelData = bno.getVector(Adafruit_BNO055::VECTOR_LINEARACCEL);
    imu::Vector<3> angVelocityData = bno.getVector(Adafruit_BNO055::VECTOR_GYROSCOPE);
    buffer_ += "avX:";
    buffer_ += String(angVelocityData.x(), 4);
    buffer_ += "avY:";
    buffer_ += String(angVelocityData.y(), 4);
    buffer_ += "avZ:";
    buffer_ += String(angVelocityData.z(), 4);

    buffer_ += "laX:";
    buffer_ += String(linearAccelData.x(), 4);
    buffer_ += "laY:";
    buffer_ += String(linearAccelData.y(), 4);
    buffer_ += "laZ:";
    buffer_ += String(linearAccelData.z(), 4);
    imuMsg.data = buffer_.c_str();
    imuPublisher.publish(&imuMsg);
    if (!switch_mode)
    {
      if (orientation.data < 0)
        {
            orientation.data = 6.28 + orientation.data;
        }
      /*orientation.data = orientation.data - 4.4505895926;
      if (orientation.data < 0)
      {
          orientation.data = 6.28 + orientation.data;
      }*/
      orientationPublisher.publish( &orientation );
    }
    nh.spinOnce();
}
