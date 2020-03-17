#!/usr/bin/env python
'''
This program is used to control the lamp states. Gets serial data on voltage, emergency button state and docking state and publishes them.
Subscribes lamstate topic to switch the lamp.

'''
import rospy
import swri_rospy
import serial
from std_msgs.msg import Bool, Int8, String, Float32

port = '/dev/ttyUSB0'
ser = serial.Serial(port, 115200, timeout=1)
ePub = rospy.Publisher("emergency", Bool, queue_size=1)
sPub = rospy.Publisher("dock_state", Int8, queue_size=1)
vPub = rospy.Publisher("voltage", Float32, queue_size=1)

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
    v = float(split[0][2:])
    s = int(split[1][2:])
    e = bool(int(split[2][2:3]))
    return v, s, e

def update(event):
    global n
    global v 
    global s
    global e
    global pre_s
    try:
        ser.flushInput()
        data = ser.readline()
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
    ser.flushOutput()
    ser.write(OFF)
    #s = str(state.data)
    ser.write(state.data)    

def frCB(data):
    if data.data == '':
        lampStateCB(String(OFF))
        lampStateCB(String(RED))
        rospy.logerr('FR port not found')
    else:
        global n
        n = n + 1
        #print 'FR: ', n
        if n == 4:
            lampStateCB(String(OFF))
            lampStateCB(String(GREEN))
            rospy.loginfo('Robot Ready!')
        s1.unregister()

def brCB(data):
    if data.data == '':
        lampStateCB(String(OFF))
        lampStateCB(String(RED))
        rospy.logerr('BR port not found')
    else:
        global n
        n = n + 1
        #print 'BR: ', n
        if n == 4:
            lampStateCB(String(OFF))
            lampStateCB(String(GREEN))
            rospy.loginfo('Robot Ready!')
        s2.unregister()

def flCB(data):
    if data.data == '':
        lampStateCB(String(OFF))
        lampStateCB(String(RED))
        rospy.logerr('FL port not found')
    else:
        global n
        n = n + 1
        #print 'FL: ', n
        if n == 4:
            lampStateCB(String(OFF))
            lampStateCB(String(GREEN))
            rospy.loginfo('Robot Ready!')
        s3.unregister()

def blCB(data):
    if data.data == '':
        lampStateCB(String(OFF))
        lampStateCB(String(RED))
        rospy.logerr('BL port not found')
    else:
        global n
        n = n + 1
        #print 'BL: ', n
        if n == 4:
            lampStateCB(String(OFF))
            lampStateCB(String(GREEN))
            rospy.loginfo('Robot Ready!')
        s4.unregister()


s1 = swri_rospy.Subscriber('/FR_port', String, frCB)
s2 = swri_rospy.Subscriber('/BR_port', String, brCB)
s3 = swri_rospy.Subscriber('/FL_port', String, flCB)
s4 = swri_rospy.Subscriber('/BL_port', String, blCB)

if __name__ == '__main__':
    rospy.init_node("controller_node")
    nodename = rospy.get_name()
    rospy.loginfo(" %s started" % nodename)
    swri_rospy.Timer(rospy.Duration(1), update)
    swri_rospy.Subscriber("/lampState", String, lampStateCB)
    lampStateCB(String(OFF))
    lampStateCB(String(YELLOW))
    swri_rospy.spin()
    
