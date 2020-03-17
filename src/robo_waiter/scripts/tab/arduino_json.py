#!/usr/bin/env python

import rospy
import json
from std_msgs.msg import String


def call():
    global pub
    while not rospy.is_shutdown():
        try:
            print "enter the input"
            x = str(raw_input())
            y = str(raw_input())
            ard = String()
            data = {}
            data['reply'] = x
            data['param'] = y
            ard.data = str.encode(json.dumps(data))
            pub.publish(ard)
        except Exception as e:
            print (e)



if __name__ == "__main__":
    rospy.init_node ("json_writer")
    pub = rospy.Publisher ("/arduino/outbound", String, queue_size = 1)
    call()
    rospy.spin()