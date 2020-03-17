#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Twist
from tf2_msgs.msg import TFMessage 
import time


def april_tag(data):
	global l
	global pub
	print "tag detected"
	l.linear.x = 0.0
	l.angular.z = 0.0
	pub.publish(l)
	rospy.signal_shutdown("dfsd")




def closed():
	rospy.loginfo("find_tag_node_finshed")
	print "node shutdown"
	global l
	l.linear.x = 0.0
	l.angular.z = 0.0


if __name__ == '__main__':
	rospy.init_node('find_tag', anonymous=True,disable_signals=False)
	rospy.Subscriber('/tags/tf', TFMessage, april_tag)
	pub = rospy.Publisher('cmd_vel', Twist, queue_size=10)
	rospy.on_shutdown(closed)
	time.sleep(1)
	l = Twist()
	l.linear.x = 0.0
	l.angular.z = 0.15
	pub.publish(l)
	rospy.spin()