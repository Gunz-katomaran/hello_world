#!/usr/bin/env python
'''
Searches for port names of each motor and published it to the same for the motor driver to set up.
'''
import rospy
import math
import time
import sys
from std_msgs.msg import String
import minimalmodbus as mod
mod.BAUDRATE=115200
mod.TIMEOUT=1

FRONT_RIGHT_MOTOR = 3
FRONT_LEFT_MOTOR = 4
BACK_LEFT_MOTOR = 1
BACK_RIGHT_MOTOR = 2

port1=''
port2=''
port3=''
port4=''


def readTicks(motor):
    low = motor.read_register(8198,0,3,False)
    high = motor.read_register(8199,0,3,True)
    ticks = (high<<16)|low
    return ticks

def do():

    for i in range(0,6):
        try:
	    time.sleep(0.1)
            global port1
            front_right_motor = mod.Instrument('/dev/ttyUSB' + str(i), FRONT_RIGHT_MOTOR)
            readTicks(front_right_motor)
            print 'front_right_motor: ', 'dev/ttyUSB' + str(i)
            port1 = '/dev/ttyUSB' + str(i)
            #port1_pub.publish('dev/ttyUSB' + str(i))
            break
        except Exception as e:
            #print(e)
            pass
    time.sleep(2)

    for i in range(0,6):
        try:
	    time.sleep(0.1)
            global port2
            front_left_motor = mod.Instrument('/dev/ttyUSB' + str(i), FRONT_LEFT_MOTOR)
            readTicks(front_left_motor)
            print 'front_left_motor: ', 'dev/ttyUSB' + str(i)
            port2 = '/dev/ttyUSB' + str(i)
            #port2_pub.publish('dev/ttyUSB' + str(i))
            break
        except Exception as e:
            #print(e)
            pass
    time.sleep(2)

    for i in range(0,6):
        try:
	    time.sleep(0.1)
            global port3
            back_left_motor = mod.Instrument('/dev/ttyUSB' + str(i), BACK_LEFT_MOTOR)
            readTicks(back_left_motor)
            print 'back_left_motor: ', 'dev/ttyUSB' + str(i)
            port3 = '/dev/ttyUSB' + str(i)
            #port3_pub.publish('dev/ttyUSB' + str(i))
            break
        except Exception as e:
            #print(e)
            pass
    time.sleep(2)

    for i in range(0,6):
        try:
	    time.sleep(0.1)
            global port4
            back_right_motor = mod.Instrument('/dev/ttyUSB' + str(i), BACK_RIGHT_MOTOR)
            readTicks(back_right_motor)
            print 'back_right_motor: ', 'dev/ttyUSB' + str(i)
            port4 = '/dev/ttyUSB' + str(i)
            #port4_pub.publish('dev/ttyUSB' + str(i))
            break
        except Exception as e:
            #print(e)
            pass

def pub():
    try:
        while True:
            port1_pub.publish(port1)
            port2_pub.publish(port2)
            port3_pub.publish(port3)
            port4_pub.publish(port4)
            time.sleep(2)
    except KeyboardInterrupt:
        sys.exit()





rospy.init_node("port_finder_node",  anonymous=True)

port1_pub = rospy.Publisher('FR_port', String, queue_size=10)
port2_pub = rospy.Publisher('FL_port', String,queue_size=10)
port3_pub = rospy.Publisher('BL_port', String, queue_size=10)
port4_pub = rospy.Publisher('BR_port', String, queue_size=10)

do()
pub()
