#!/usr/bin/env python

import rospy
from geometry_msgs.msg import Pose
from geometry_msgs.msg import PointStamped
from visualization_msgs.msg import Marker


pre_x = 0
pre_y = 0

def pose_cb(data):
	global pub, pre_x, pre_y
	x = data.position.x
	y = data.position.y
	z = data.orientation.z
	w = data.orientation.w
	new = PointStamped()
	if(pre_x != x and pre_y != y):
		new.header.frame_id = "map"
		new.point.x = x
		new.point.y = y
		pre_x = x
		pre_y = y
		pub.publish(new)




if __name__ == "__main__":
	rospy.init_node("path_recorder",anonymous=True)
	rospy.Subscriber('/robot_pose', Pose, pose_cb)
	pub = rospy.Publisher ("/pose_marker",  PointStamped,  queue_size = 1)
	rospy.spin()