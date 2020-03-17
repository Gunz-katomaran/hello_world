#!/usr/bin/env python
from geometry_msgs.msg import PoseWithCovarianceStamped, Quaternion
import rospy
from numpy import median
from marvelmind_nav.msg import beacon_pos_a
from tf import TransformBroadcaster
from sensor_msgs.msg import Imu


rospy.init_node ('pose_publish')
pose_marvel = PoseWithCovarianceStamped ()
number_of_beacons = 4
initiator_address = None
x_curr = 0
y_curr = 0
new_linear_position = False
new_imu_data = True
x_init = None
y_init = None
x_list = []
y_list = []
x_raw = 0
y_raw = 0

def linear_pos_cb (linear_pos):
	print "Publishing Odom, Twist"
	global pose_marvel
	print linear_pos
	pose_marvel.header.stamp = rospy.Time.now ()
	pose_marvel.header.frame_id = "map"
	pose_marvel.pose = linear_pos.pose
	initial_pose_pub.publish (pose_marvel)



if __name__ == '__main__':
	
	rospy.Subscriber ('/pose_marvel', PoseWithCovarianceStamped, linear_pos_cb)
	initial_pose_pub = rospy.Publisher("/initialpose", PoseWithCovarianceStamped ,queue_size=10)
	rospy.spin ()



