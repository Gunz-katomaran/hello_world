#!/usr/bin/env python
import rospy
import swri_rospy
from std_msgs.msg import  Int32MultiArray
from numpy import median

global tick_list
tick_list = []

global dataTicks
dataTicks = Int32MultiArray()

pub = rospy.Publisher('encoderTicks', Int32MultiArray, queue_size=10)

def cb(msg):
    '''
    with open('encoder.txt', 'a') as file:
        file.write('FR: ' + str(msg.data[0]) + ' FL: ' + str(msg.data[1]) + ' BL: ' + str(msg.data[2]) + ' BR: ' + str(msg.data[3]))
        file.write("\n")
    '''
    global tick_list
    global dataTicks
    tick_list.append(msg.data)
    
    if len(tick_list) == 3:
        m1 = median([tick_list[0][0], tick_list[1][0], tick_list[2][0]])
        m2 = median([tick_list[0][1], tick_list[1][1], tick_list[2][1]])
        m3 = median([tick_list[0][2], tick_list[1][2], tick_list[2][2]])
        m4 = median([tick_list[0][3], tick_list[1][3], tick_list[2][3]])
        tick_list = []
        dataTicks.data = [m1, m2, m3, m4]
        pub.publish(dataTicks)




if __name__ == '__main__':
    rospy.init_node('encoder_filter_node', anonymous=True)
    swri_rospy.Subscriber("/encoderTicksRaw", Int32MultiArray, cb)
    swri_rospy.spin()
