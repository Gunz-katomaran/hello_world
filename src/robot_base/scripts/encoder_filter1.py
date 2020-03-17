#!/usr/bin/env python
'''
A simple median filter for encoderdata from FR motor
'''
import rospy
import swri_rospy
from std_msgs.msg import  Int32MultiArray, Int32
from numpy import median

global tick_list
tick_list = []



pub = rospy.Publisher('encoderTicksFR', Int32, queue_size=10)

def cb(msg):
    '''
    with open('encoder.txt', 'a') as file:
        file.write('FR: ' + str(msg.data[0]) + ' FL: ' + str(msg.data[1]) + ' BL: ' + str(msg.data[2]) + ' BR: ' + str(msg.data[3]))
        file.write("\n")
    '''
    global tick_list
    tick_list.append(msg.data)
    
    if len(tick_list) == 3:
        m1 = median([tick_list[0], tick_list[1], tick_list[2]])
        tick_list = tick_list[1:]
        
        pub.publish(Int32(m1))




if __name__ == '__main__':
    rospy.init_node('encoder_filter_node1', anonymous=True)
    swri_rospy.Subscriber("/encoderTicksFRRaw", Int32, cb)

    swri_rospy.spin()
