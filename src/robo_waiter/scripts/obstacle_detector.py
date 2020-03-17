#!/usr/bin/env python

import rospy
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Bool
import time

en = False

def scan(msg):
	global obs,en
	obs_value = 0.5
	new = msg.ranges
	first = new[280:340]
	second = new[380:440]
	sc = first + second
	st = min(sc)
	#print (st)

	if st <= obs_value and en:
		print "obstacle_det"
		obs.publish(data=False)
		en = False
		time.sleep(5)

	if st >= obs_value and not en:
		print "obstacle no"
		en = True
		obs.publish(data=True)


if __name__ == "__main__":
	rospy.init_node("obstacle_detector", anonymous=True)
	rospy.Subscriber("/robot_base/scan", LaserScan, scan)
	obs = rospy.Publisher("/obstacle_det", Bool, queue_size = 1)
	rospy.spin()