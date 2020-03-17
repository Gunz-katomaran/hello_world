#!/usr/bin/env python
import math
import minimalmodbus as mod
import time
mod.BAUDRATE=115200
mod.TIMEOUT=1
#mod.CLOSE_PORT_AFTER_EACH_CALL = True

port = '/dev/ttyUSB0'

#Slave IDs
FRONT_RIGHT_MOTOR = 1
FRONT_LEFT_MOTOR = 2
BACK_LEFT_MOTOR = 3
BACK_RIGHT_MOTOR = 4

front_right_motor = mod.Instrument(port, FRONT_RIGHT_MOTOR)
front_left_motor = mod.Instrument(port, FRONT_LEFT_MOTOR)
back_left_motor = mod.Instrument(port, BACK_LEFT_MOTOR)
back_right_motor = mod.Instrument(port, BACK_RIGHT_MOTOR)

#front_right_motor.debug = True
#front_left_motor.debug = True
#back_left_motor.debug = True
#back_right_motor.debug = True

def readTicks(motor):
    low = motor.read_register(8198,0,3,False)
    high = motor.read_register(8199,0,3,True)
    ticks = (high<<16)|low
    return ticks

def publishTicks():
    
    time.sleep(0.2)
    try:
        ticks_front_right_motor = readTicks(front_right_motor)
        print "ticks_front_right_motor(1): ", ticks_front_right_motor
        #time.sleep(0.02)
    except Exception as e:
        print(str(e) + ' :1')

    time.sleep(0.2)
    try: 
        ticks_front_left_motor = readTicks(front_left_motor)
        print "ticks_front_left_motor(2): ",ticks_front_left_motor
        #time.sleep(3)
    except Exception as e:
        print(str(e) + ' :2')

    time.sleep(0.2)
    try:
        ticks_back_left_motor = readTicks(back_left_motor)
        print 'ticks_back_left_motor(3): ', ticks_back_left_motor
        #time.sleep(3)
    except Exception as e:
        print(str(e) + ' :3')

    time.sleep(0.2)
    try:
        ticks_back_right_motor = readTicks(back_right_motor)
        print 'ticks_back_right_motor(4): ', ticks_back_right_motor
        #time.sleep(3)
    except Exception as e:
        print(str(e) + ' :4') 
 
if __name__ == '__main__':
    while True:
        publishTicks()
        time.sleep(1)


