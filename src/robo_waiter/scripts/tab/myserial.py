import serial
import time

from logger import logger

class Serial():
    instance = None

    @staticmethod
    def getInstance():
        if Serial.instance != None and Serial.instance.is_open is True:
            return Serial.instance

        run = True
        while run:
            try:
                if Serial.instance == None:
                    Serial.instance = serial.Serial()
                    Serial.instance.baudrate = 57600
                    Serial.instance.port = '/dev/ttyACM0'
                    Serial.instance.timeout = 1
                    logger.info("Trying to establish serial communication")
                    Serial.instance.open()
                    if Serial.instance.is_open:
                        run = False
                elif Serial.instance != None and Serial.instance.is_open is False:
                    Serial.instance.open()
                    time.sleep(1)
            except Exception as e:
                logger.error("Error code(101): Error opening serial.")
                time.sleep(10)
        return Serial.instance

    def __init__(self):
        if self.instance != None:
            raise Exception("This class is a singleton!")
        else:
            self.instance = self.getInstance()

    @staticmethod
    def close():
        if Serial.instance != None:
            Serial.instance.close()
