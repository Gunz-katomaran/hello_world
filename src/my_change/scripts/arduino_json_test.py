#!/usr/bin/env python
import swri_rospy

import rospy
import time
import json
from std_msgs.msg import String




def my_callback(event):
    rospy.loginfo("dsf")




if __name__ == "__main__":
    try:

        rospy.init_node ("json_tester")
        swri_rospy.Timer (rospy.Duration(0.2), my_callback)
        swri_rospy.spin()
    except Exception as e:
        print e