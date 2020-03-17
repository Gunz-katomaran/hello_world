#!/usr/bin/env python
import rospy
import math
import time
from geometry_msgs.msg import  Twist
from std_msgs.msg import Int32MultiArray
import minimalmodbus as mod
import swri_rospy
mod.BAUDRATE=115200
mod.TIMEOUT=1
#mod.CLOSE_PORT_AFTER_EACH_CALL = True

port = rospy.get_param(rospy.get_namespace() + 'port', '/dev/ttyUSB0')
wheel_radius = rospy.get_param(rospy.get_namespace() + 'wheel_radius', 0.125)
robot_width = rospy.get_param(rospy.get_namespace() + 'robot_width', 0.300)
port1 = '/dev/ttyUSB1'
port2 = '/dev/ttyUSB2'
port3 = '/dev/ttyUSB3'

FRONT_RIGHT_MOTOR = 1
FRONT_LEFT_MOTOR = 2
BACK_LEFT_MOTOR = 3
BACK_RIGHT_MOTOR = 4

'''
dataTicks.layout.dim[0].label = 'front_right_motor'
dataTicks.layout.dim[1].label = 'front_left_motor'
dataTicks.layout.dim[2].label = 'back_left_motor'
dataTicks.layout.dim[3].label = 'back_left_motor'
'''

def readTicks(motor):
    low = motor.read_register(8198,0,3,False)
    high = motor.read_register(8199,0,3,True)
    ticks = (high<<16)|low
    return ticks

for i in range(0,9):
    try:
        global front_right_motor
        front_right_motor = mod.Instrument('/dev/ttyUSB' + str(i), FRONT_RIGHT_MOTOR)
        readTicks(front_right_motor)
        print 'front_right_motor: ', 'dev/ttyUSB' + str(i)
        break
    except Exception as e:
        pass
time.sleep(2)
for i in range(0,9):
    try:
        global front_left_motor
        front_left_motor = mod.Instrument('/dev/ttyUSB' + str(i), FRONT_LEFT_MOTOR)
        readTicks(front_left_motor)
        print 'front_left_motor: ', 'dev/ttyUSB' + str(i)
        break
    except:
        pass
time.sleep(2)
for i in range(0,9):
    try:
        global back_left_motor
        back_left_motor = mod.Instrument('/dev/ttyUSB' + str(i), BACK_LEFT_MOTOR)
        readTicks(back_left_motor)
        print 'back_left_motor: ', 'dev/ttyUSB' + str(i)
        break
    except:
        pass
time.sleep(2)
for i in range(0,9):
    try:
        global back_right_motor
        back_right_motor = mod.Instrument('/dev/ttyUSB' + str(i), BACK_RIGHT_MOTOR)
        readTicks(back_right_motor)
        print 'back_right_motor: ', 'dev/ttyUSB' + str(i)
        break
    except:
        pass
time.sleep(2)
'''
front_right_motor = mod.Instrument(port, FRONT_RIGHT_MOTOR)
front_left_motor = mod.Instrument(port1, FRONT_LEFT_MOTOR)
back_left_motor = mod.Instrument(port2, BACK_LEFT_MOTOR)
back_right_motor = mod.Instrument(port3, BACK_RIGHT_MOTOR)
'''
#front_right_motor.debug = True
#front_left_motor.debug = True
#back_left_motor.debug = True
#back_right_motor.debug = True

'''
front_right_motor = 0
front_left_motor = 0
back_left_motor = 0
back_right_motor = 0
'''
dataTicks = Int32MultiArray()
ticks_front_right_motor = 0
ticks_front_left_motor = 0
ticks_back_left_motor = 0
ticks_back_right_motor = 0

status = {
    FRONT_RIGHT_MOTOR: 'stop',
    FRONT_LEFT_MOTOR: 'stop',
    BACK_LEFT_MOTOR: 'stop',
    BACK_RIGHT_MOTOR: 'stop'
}



def publishTicks(event):
    global dataTicks
    '''
    global ticks_front_right_motor
    global ticks_front_left_motor 
    global ticks_back_left_motor 
    global ticks_back_right_motor
    '''
    #print 'Expected Timer call ' + str(event.current_expected.to_sec())
    #print 'Timer called at ' + str(event.current_real.to_sec())
    
        #read ticks and publish
    ticks_front_right_motor = readTicks(front_right_motor)
    #print "ticks_front_right_motor: ", ticks_front_right_motor
    #time.sleep(3)

    ticks_front_left_motor = readTicks(front_left_motor)
    #print "ticks_front_left_motor: ",ticks_front_left_motor
    #time.sleep(3)

    ticks_back_left_motor = readTicks(back_left_motor)
    #print 'ticks_back_left_motor: ', ticks_back_left_motor
    #time.sleep(3)

    ticks_back_right_motor = readTicks(back_right_motor)
    #print 'ticks_back_right_motor: ', ticks_back_right_motor
    #time.sleep(3) 
    
    
    dataTicks.data = [ticks_front_right_motor, ticks_front_left_motor, ticks_back_left_motor, ticks_back_right_motor]
    #dataTicks.data = [ticks_front_left_motor]
    ticks_pub.publish(dataTicks)
    
   

def writeSpeed(motor, speed):
    global status
    speed = speed * 10 * 60 / (2*math.pi) #rpm, 10->gear ratio
    speed = speed / 15 # 1 unit = 15 rpm
    speed = int(round(speed)) 
    print "Writing speed(rpm/15): ", speed , " to ", motor.address
    if speed == 0:
        #set v=0 and stop motor(2)
        status[motor.address] = "stop"
        #motor.write_register(8192, 0, 0, 6, True) # V
        motor.write_register(8196, 2, 0, 6, True) # M_STATE 2->stop

    elif speed > 0:
        if status[motor.address] == "stop":
            #set M+, V and start motor(0) 
            status[motor.address] = "run"
            motor.write_register(8194, 0, 0, 6, False) # M lower (0 = 2147418112 & 0xFFFF)
            motor.write_register(8195, 32767, 0, 6, True) # M upper (32767 = 2147418112>>16)
            motor.write_register(8192, speed, 0, 6, True) # V
            motor.write_register(8196, 0, 0, 6, True) # M_STATE 0->run
        else:
            #set v, M+
            motor.write_register(8194, 0, 0, 6, False) # M lower (0 = 2147418112 & 0xFFFF)
            motor.write_register(8195, 32767, 0, 6, True) # M 2147418112
            motor.write_register(8192, speed, 0, 6, True) # V

    elif speed < 0:
        if status[motor.address] == 'stop':
            #set M-, abs(V) and start motor(0) 
            status[motor.address] = 'run'
            motor.write_register(8194, 0, 0, 6, False) # M lower (0 = -2147483648 & 0xFFFF)
            motor.write_register(8195, -32768, 0, 6, True) # M upper(-32768 = -2147483648>>16)
            motor.write_register(8192, abs(speed), 0, 6, True) # V
            motor.write_register(8196, 0, 0, 6, True) # M_STATE 0->run
        else:
            #set abs(v), M-
            motor.write_register(8194, 0, 0, 6, False) # M lower (0 = -2147483648 & 0xFFFF)
            motor.write_register(8195, -32768, 0, 6, True) # M upper(-32768 = -2147483648>>16)
            motor.write_register(8192, abs(speed), 0, 6, True) # V
                   



def cb(twist):
    #TODO: periodically write M values
    #write to motor
    left_speed = -1 * (twist.linear.x - twist.angular.z*robot_width/2) / wheel_radius #rad/s
    right_speed = (twist.linear.x + twist.angular.z*robot_width/2) / wheel_radius
  
    writeSpeed(front_right_motor, right_speed)
    writeSpeed(front_left_motor, left_speed)

    writeSpeed(back_right_motor, right_speed)
    writeSpeed(back_left_motor, left_speed)
    
 
if __name__ == '__main__':
    rospy.init_node("robot_base_motor_node",  anonymous=True)

    ticks_pub = rospy.Publisher('encoderTicksRaw', Int32MultiArray, queue_size=10)

    swri_rospy.Timer(rospy.Duration(0.04), publishTicks) #TODO: Use rate parameter

    swri_rospy.Subscriber('/cmd_vel', Twist, cb)
 
    swri_rospy.spin()

