#!/usr/bin/env python
import rospy
import swri_rospy
from std_msgs.msg import  Int32
from numpy import median




def cb(msg):
    
    with open('Fl.txt', 'a') as file:
        file.write(str(msg.data))
        file.write("\n")
    





if __name__ == '__main__':
    rospy.init_node('encoder_filter_node', anonymous=True)
    rospy.Subscriber("/encoderTicksFL", Int32, cb)
    rospy.spin()
