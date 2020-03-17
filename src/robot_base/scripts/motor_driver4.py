#!/usr/bin/env python
'''
Motor driver for BR motor. Subscibed /cmd_vel (command velocity) and drives the motor. Publishes encoder data.
'''
import rospy
import math
import time
from geometry_msgs.msg import  Twist
from std_msgs.msg import Int32MultiArray, Int32, Int16, String, Int8, Bool
import minimalmodbus as mod
import swri_rospy
mod.BAUDRATE=115200
mod.TIMEOUT=1
#mod.CLOSE_PORT_AFTER_EACH_CALL = True

wheel_radius = rospy.get_param(rospy.get_namespace() + 'wheel_radius', 0.135)
robot_width = rospy.get_param(rospy.get_namespace() + 'robot_width', 0.300)
global port
port = ''

BACK_RIGHT_MOTOR = 4

ACC = rospy.get_param(rospy.get_namespace() + 'ACC', 100)
PP_GAIN = rospy.get_param(rospy.get_namespace() + 'BR/PP_GAIN', 256)
PFF_GAIN = rospy.get_param(rospy.get_namespace() + 'BR/PFF_GAIN', 50)
PD_GAIN = rospy.get_param(rospy.get_namespace() + 'BR/PD_GAIN', 32)
PV_GAIN = rospy.get_param(rospy.get_namespace() + 'BR/PV_GAIN', 600)
IV_GAIN = rospy.get_param(rospy.get_namespace() + 'BR/IV_GAIN', 80)
DV_GAIN = rospy.get_param(rospy.get_namespace() + 'BR/DV_GAIN', 300)
C_LIMIT = rospy.get_param(rospy.get_namespace() + 'BR/C_LIMIT', 4000)
CP_GAIN = rospy.get_param(rospy.get_namespace() + 'BR/CP_GAIN', 188)
CI_GAIN = rospy.get_param(rospy.get_namespace() + 'BR/CI_GAIN', 94)
C_TRIGGER = rospy.get_param(rospy.get_namespace() + 'BR/C_TRIGGER', 800)
FLT_TIME_CNST = rospy.get_param(rospy.get_namespace() + 'BR/FLT_TIME_CNST', 31200)


global estop
estop = False
RED = 'R'
GREEN = 'G'
global pre_speed
pre_speed = 0

def readTicks(motor):
    low = motor.read_register(8198,0,3,False)
    high = motor.read_register(8199,0,3,True)
    ticks = (high<<16)|low
    return ticks



def setup():
    rospy.loginfo('setting BR/ACC: %s'%ACC)
    back_right_motor.write_register(8193,ACC,0,6,True)

    rospy.loginfo('setting BR/PP_GAIN: %s'%PP_GAIN)
    back_right_motor.write_register(0,PP_GAIN,0,6,True)

    rospy.loginfo('setting BR/PFF_GAIN: %s'%PFF_GAIN)
    back_right_motor.write_register(1,PFF_GAIN,0,6,True)

    rospy.loginfo('setting BR/PD_GAIN: %s'%PD_GAIN)
    back_right_motor.write_register(2,PD_GAIN,0,6,True)

    rospy.loginfo('setting BR/PV_GAIN: %s'%PV_GAIN)
    back_right_motor.write_register(3,PV_GAIN,0,6,True)

    rospy.loginfo('setting BR/IV_GAIN: %s'%IV_GAIN)
    back_right_motor.write_register(4,IV_GAIN,0,6,True)

    rospy.loginfo('setting BR/DV_GAIN: %s'%DV_GAIN)
    back_right_motor.write_register(5,DV_GAIN,0,6,True)

    rospy.loginfo('setting BR/C_LIMIT: %s'%C_LIMIT)
    back_right_motor.write_register(6,C_LIMIT,0,6,True)

    rospy.loginfo('setting BR/CP_GAIN: %s'%CP_GAIN)
    back_right_motor.write_register(7,CP_GAIN,0,6,True)

    rospy.loginfo('setting BR/CI_GAIN: %s'%CI_GAIN)
    back_right_motor.write_register(8,CI_GAIN,0,6,True)

    rospy.loginfo('setting BR/C_TRIGGER: %s'%C_TRIGGER)
    back_right_motor.write_register(9,C_TRIGGER,0,6,True)

    rospy.loginfo('setting BR/FLT_TIME_CNST: %s'%FLT_TIME_CNST)
    back_right_motor.write_register(10,FLT_TIME_CNST,0,6,True)

rospy.init_node("robot_base_motor_node4",  anonymous=True)
global back_right_motor
#print 'Waiting for port BR motor'
#port = rospy.wait_for_message('/BR_port', String)
port = '/dev/BRM'
print 'BR motor on ', port
back_right_motor = mod.Instrument(port , BACK_RIGHT_MOTOR)
setup()
ticks_back_right_motor = 0

status = 'stop'



def publishTicks(event):
    global estop
    if not estop:
        global ticks_back_right_motor
        
        try:
            ticks_back_right_motor = readTicks(back_right_motor)
            ticks_pub.publish(ticks_back_right_motor)
        except:
            pass
        #publishRPM(back_right_motor)
    
   

def writeSpeed(motor, speed):
    global status
    global pre_speed

    speed = speed * 10 * 60 / (2*math.pi) #rpm, 10->gear ratio
    speed = speed / 15 # 1 unit = 15 rpm
    speed = int(round(speed)) 

    if speed != pre_speed:
        if speed > 200:
            speed = 200
        #print "Writing speed(rpm/15): ", speed , " to ", motor.address
        if speed == 0:
            #set v=0 and stop motor(2)
            status = "stop"
             ###########################################################################################
            while abs(pre_speed) > 5:
                pre_speed = pre_speed * 0.8
                motor.write_register(8192, abs(pre_speed), 0, 6, True) # V
                time.sleep(0.1)
            ################################################################################################
            #motor.write_register(8192, 0, 0, 6, True) # V
            motor.write_register(8196, 2, 0, 6, True) # M_STATE 2->stop

        elif speed > 0:
            if status == "stop":
                #set M+, V and start motor(0) 
                status = "run"
                
                motor.write_register(8194, 0, 0, 6, False) # M lower (0 = 2147418112 & 0xFFFF)
                motor.write_register(8195, 32767, 0, 6, True) # M upper (32767 = 2147418112>>16)
                '''

                motor.write_register(8194, 40000, 0, 6, False) # M lower (40000 ticks)
                motor.write_register(8195, 0, 0, 6, True) # M upper
                '''
                motor.write_register(8192, speed, 0, 6, True) # V
                motor.write_register(8196, 0, 0, 6, True) # M_STATE 0->run
            else:
                #set v, M+
                
                motor.write_register(8194, 0, 0, 6, False) # M lower (0 = 2147418112 & 0xFFFF)
                motor.write_register(8195, 32767, 0, 6, True) # M 2147418112
                '''

                motor.write_register(8194, 40000, 0, 6, False) # M lower (40000 ticks)
                motor.write_register(8195, 0, 0, 6, True) # M upper
                '''
                motor.write_register(8192, speed, 0, 6, True) # V
                #motor.write_register(8196, 0, 0, 6, True) # M_STATE 0->run  #################

        elif speed < 0:
            if status == 'stop':
                #set M-, abs(V) and start motor(0) 
                status = 'run'
                
                motor.write_register(8194, 0, 0, 6, False) # M lower (0 = -2147483648 & 0xFFFF)
                motor.write_register(8195, -32768, 0, 6, True) # M upper(-32768 = -2147483648>>16)
                '''
                motor.write_register(8194, 25536, 0, 6, False) # M lower (40000 ticks)
                motor.write_register(8195, 65535, 0, 6, False) # M uppe
                '''
                motor.write_register(8192, abs(speed), 0, 6, True) # V
                motor.write_register(8196, 0, 0, 6, True) # M_STATE 0->run
            else:
                #set abs(v), M-
                
                motor.write_register(8194, 0, 0, 6, False) # M lower (0 = -2147483648 & 0xFFFF)
                motor.write_register(8195, -32768, 0, 6, True) # M upper(-32768 = -2147483648>>16)
                '''
                motor.write_register(8194, 25536, 0, 6, False) # M lower (40000 ticks)
                motor.write_register(8195, 65535, 0, 6, False) # M uppe
                '''
                motor.write_register(8192, abs(speed), 0, 6, True) # V
                #motor.write_register(8196, 0, 0, 6, True) # M_STATE 0->run  #################
        pre_speed = speed
                   



def cb(twist):
    global estop
    if not estop:
        #TODO: periodically write M values
        #write to motor
        right_speed = ((2*twist.linear.x) + (twist.angular.z*robot_width)) / (2*wheel_radius)
        try:
            writeSpeed(back_right_motor, right_speed)
        except:
            pass
    
def errorCheck(event):
    global pre_speed
    global estop
    if not estop:
        a = back_right_motor.read_register(8204,0,3,True)
        if not a == 0:
            lamp_pub.publish(RED)
            rospy.logerr("ERROR in back_right_motor:  %s", str(a))
            rospy.loginfo("Resetting.............................")
            while True:
                back_right_motor.write_register(8196, 4, 0, 6, True)
                if back_right_motor.read_register(8196, 0, 3, True) == 4:
                    rospy.loginfo('Motor set to IDLE')
                    status = 'stop'
                    lamp_pub.publish(GREEN)
                    break
            back_right_motor.write_register(8204, 0, 0, 6, True)
            pre_speed = 0

def ecb(e):
    global pre_speed
    global estop
    global status	
    estop = e.data
    if estop:
        rospy.loginfo('BR motor: E-stop pressed') #later change to named
        status= 'stop'
        while abs(pre_speed) > 5:
                pre_speed = pre_speed * 0.8
                back_right_motor.write_register(8192, abs(pre_speed), 0, 6, True) # V
                time.sleep(0.1)
        #back_right_motor.write_register(8192, 0, 0, 6, True) # V
        back_right_motor.write_register(8196, 2, 0, 6, True) # M_STATE 2->stop
        pre_speed = 0
 
if __name__ == '__main__':

    ticks_pub = rospy.Publisher('encoderTicksBRRaw', Int32, queue_size=10)
    #rpm_pub = rospy.Publisher('rpmBR', Int16, queue_size=10)
    lamp_pub = rospy.Publisher('lampState', String, queue_size=10)
    swri_rospy.Timer(rospy.Duration(0.04), publishTicks) #TODO: Use rate parameter
    swri_rospy.Timer(rospy.Duration(5), errorCheck)
    swri_rospy.Subscriber('/cmd_vel', Twist, cb)
    rospy.Subscriber('/emergency', Bool, ecb)
    swri_rospy.spin()

