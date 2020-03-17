#!/usr/bin/env python
'''
This program is used to control the lamp states. Gets serial data on voltage, emergency button state and docking state and publishes them.
Subscribes lamstate topic to switch the lamp.

'''
#subscribed topics: /lampState
#published topics: /emergency /dock_state /voltage

import rospy
import swri_rospy
import serial
import time
#import graypy
import logging as log
from std_msgs.msg import Bool, Int8, String, Float32

port = '/dev/CONTROLLER'
ser = serial.Serial(port, 115200, timeout=1)
ePub = rospy.Publisher("emergency", Bool, queue_size=1)
sPub = rospy.Publisher("dock_state", Int8, queue_size=1)
vPub = rospy.Publisher("voltage", Float32, queue_size=1)

logging = log.getLogger("Robo-Base")
logging.setLevel(log.DEBUG)

#handler = graypy.GELFUDPHandler("139.59.3.87", 12201, localname="controller_node")
#logging.addHandler(handler)

global v 
v = None
global s
s = None
global e
e = None
global n
n = 0
global pre_s
global s1
global s2
global s3
global s4

RED = 'R'
GREEN = 'G'
YELLOW = 'Y'
OFF = 'O'

def parse(data):
    split = data.split(',')
    v = float(split[0])
    #v=0.00
    s = int(split[1])
    e = bool(int(split[2]))
    return v, s, e

def update(event):
    global n
    global v 
    global s
    global e
    global pre_s
    try:
	ser.close()
    	ser.open()
	#time.sleep(0.01)
        ser.flushInput()
	#time.sleep(0.5)
	data = ser.readline()
	#print data
        (v,s,e) = parse(data)
        #print v, s, e
        ePub.publish(e)
        sPub.publish(s)
        vPub.publish(v)
    except Exception as e:
        print(e)
    '''
    if n == 4 and s == '1' or s == '4' and pre_s == '3':
            lampStateCB(String(OFF))
            lampStateCB(String(GREEN))
    pre_s = s
    '''
def lampStateCB(state):
    ser.close()
    ser.open()
    ser.flushOutput()
    ser.write(OFF)
    #s = str(state.data)
    ser.write(state.data)
    logging.info("INFO: Lamp :%s",state.data)
    print "lamp state",state.data  

if __name__ == '__main__':
    rospy.init_node("controller_node")
    nodename = rospy.get_name()
    rospy.loginfo("INFO:   %s started" % nodename)
    logging.info("INFO:   %s started" % nodename)
    swri_rospy.Timer(rospy.Duration(1), update)
    swri_rospy.Subscriber("/lampState", String, lampStateCB)
    lampStateCB(String(OFF))
    lampStateCB(String(YELLOW))
    swri_rospy.spin()
    
