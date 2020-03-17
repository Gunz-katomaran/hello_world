#!/usr/bin/env python
import rospy
from tf import TransformBroadcaster, TransformListener
from nav_msgs.msg import Odometry
from sensor_msgs.msg import Imu

z = 0.00
w = 1.00
odo_x = 1.00
odo_y = 1.00

def pose(data):
	global rs, gh,z, w, odo_x, odo_y
	x = data.pose.pose.position.x
	y = data.pose.pose.position.y
	gh.sendTransform((x,y,0.351),(0,0,z,w),rospy.Time.now(),'/new_h','/map')
	gh.sendTransform((0.2077,0.05,-0.351),(0,0,0,1),rospy.Time.now(),'base','/new_h')
	(trans, rot) = rs.lookupTransform('/map', '/base', rospy.Time(0))
	odo_x = trans[0]
	odo_y = trans[1]


def gain(data):
	global z,w
	z = data.orientation.z
	w = data.orientation.w


def base_odom(event):
	global base_pub, rs, odo_x, odo_y
	#(trans1, rot2) = rs.lookupTransform('/map', '/base_link', rospy.Time(0))
	odom = Odometry()
	odom.header.stamp = rospy.Time.now ()
	odom.header.frame_id = "map"
	odom.child_frame_id = "base_link"
	odom.pose.pose.position.x = odo_x
	odom.pose.pose.position.y = odo_y
	odom.pose.covariance[0] = 0.01
	odom.pose.covariance[7] = 0.01
	odom.pose.covariance[14] = 0.01
	odom.pose.covariance[21] = 0.0004
	odom.pose.covariance[28] = 0.0004
	odom.pose.covariance[35] = 0.0004
	base_pub.publish (odom)





if __name__ == '__main__':
	rospy.init_node("new_node")
	rs = TransformListener()
	gh = TransformBroadcaster()
	rospy.Subscriber ('/odom_marvel', Odometry, pose)
	rospy.Subscriber ('/sensors/imu', Imu, gain)
	base_pub = rospy.Publisher("/base_marvel", Odometry,queue_size=10)
	rospy.Timer (rospy.Duration(0.05), base_odom)
	rospy.spin()