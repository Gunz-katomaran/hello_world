#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Joy
from geometry_msgs.msg import Twist
from std_msgs.msg import Bool
import time
import numpy as np

vel = Twist()
lin = 0.3
ang = 0.5
forward = False
rev = False
right = False
left = False
u = False
m = False
sign = 0
vPub = rospy.Publisher("cmd_vel", Twist, queue_size=1)
estop_pub = rospy.Publisher("estop", Bool, queue_size=1)

def joyCB(msg):
    global vel, sign_linear, sign_angular
    global x
    global z
    global left
    global right
    global rev
    global forward
    global u
    global m
    #print "time", time.time()

    if msg.buttons[6] == 1 :
        if msg.axes[2] and msg.axes[5]:
            forward = False
            rev = False
            left = False
            right = False
            u = True
            m = False
            stop = False
            sign_linear = np.sign (msg.axes[5])
            sign_angular = np.sign (msg.axes[2])
            move_u()
        elif msg.axes[5] == 1:
            forward = True
            rev = False
            left = False
            right = False
            u = False
            m = False
            stop = False
            #print "forward"
            move_forward()
            
        elif msg.axes[5] == -1:
            forward = False
            rev = True
            left = False
            right = False
            u = False
            m = False
            #print "rev"
            move_reverse()
            stop = False
        elif msg.axes[4] == -1:
            forward = False
            rev = False
            left = False
            right = True
            u = False
            m = False
            #print "right"
            move_right()
            stop = False
        elif msg.axes[4] == 1:
            forward = False
            rev = False
            left = True
            right = False
            u = False
            m = False
            #print "left"
            move_left()
            stop = False

        elif msg.buttons[9] == 1:
            forward = False
            rev = False
            left = False
            right = False
            u = False
            m = True
            move_m()
            stop = False

        else:
            stop = True
    else:
        stop = True

    if msg.buttons[1] == 1:
        estop_pub.publish (True)
        time.sleep(1)
        estop_pub.publish (False)
        stop = False


    if msg.buttons[5] == 1:
        inc_lin ()
        inc_ang ()
        print "lin:", "{:.3f}".format(lin), "ang", "{:.3f}".format(ang)
        stop = False

    if msg.buttons[7] == 1:
        dec_lin ()
        dec_ang ()
        print "lin:", "{:.3f}".format(lin), "ang", "{:.3f}".format(ang)
        stop = False

    if msg.buttons [4] == 1:
        print "lin:", "{:.3f}".format(lin), "ang", "{:.3f}".format(ang)

    if stop: 
        #print time.time ()
        #print "stop"       
        forward = False
        rev = False
        left = False
        right = False
        u = False
        m = False
        vel.angular.z = 0
        vel.linear.x = 0
        vPub.publish (vel)


    
def move_forward():
    global vel
    global lin
    vel.linear.x=abs(lin)
    vel.angular.z=0.0
    vPub.publish(vel)

def move_reverse():
    global vel
    global lin
    vel.linear.x=-1*abs(lin)
    vel.angular.z=0.0
    vPub.publish(vel)

def move_left():
    global vel
    global ang
    vel.linear.x=0
    vel.angular.z=abs(ang)
    vPub.publish(vel)

def move_right():
    global vel
    global ang
    vel.linear.x=0
    vel.angular.z=-1*abs(ang)
    vPub.publish(vel)

def move_u():
    global vel
    global ang
    global lin, sign_linear, sign_angular
    vel.linear.x = sign_linear * abs(lin)
    vel.angular.z = sign_angular * abs(ang)
    vPub.publish(vel)

def move_m():
    global vel
    global ang
    global lin
    vel.linear.x = -1*abs(lin)
    vel.angular.z = -1*abs(ang)
    vPub.publish(vel)

def inc_lin():
    global lin
    lin=abs(lin+(0.05*abs(lin)))
    if forward==True:
        move_forward()
    if rev==True:
        move_reverse()
    if u == True:
        move_u ()
    if m == True:
        move_m ()
    else:
        pass
def inc_ang():
    global ang
    ang=abs(ang+(0.07*abs(ang)))
    if left==True:
        move_left()
    if right==True:
        move_right()
    if u == True:
        move_u ()
    if m == True:
        move_m ()
    else:
        pass
def dec_lin():
    global lin
    lin=abs(lin-(0.05*abs(lin)))
    if forward==True:
        move_forward()
    if rev==True:
        move_reverse()
    if u == True:
        move_u ()
    if m == True:
        move_m ()
    else:
        pass
def dec_ang():
    global ang
    ang=abs(ang-(0.07*abs(ang)))
    if left==True:
        move_left()
    if right==True:
        move_right()
    if u == True:
        move_u ()
    if m == True:
        move_m ()
    else:
        pass
if __name__ == '__main__':
    rospy.init_node("joystick_control_node")
    r = rospy.Rate(20)
    rospy.Subscriber("/joy", Joy, joyCB)
    rospy.spin()






