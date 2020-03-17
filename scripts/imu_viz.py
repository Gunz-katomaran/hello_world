#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Imu
from tf import TransformBroadcaster

def imu_cb(data):
	x = data.orientation.x
	y = data.orientation.y
	z = data.orientation.z
	w = data.orientation.w
	quat = (x,y,z,w)
	print (x,y,z,w)
	b = TransformBroadcaster()
	b.sendTransform((0.0, 0.0, 0.0), quat, rospy.Time.now(), "imu_bno055", "/map")
	#b.sendTransform((0.0,0.0,0.0),quat, rospy.Time.now(), "imu", '/world')
	
if __name__ == '__main__':
	rospy.init_node ('imu_visual')
	rospy.Subscriber ('/sensors/imu', Imu, imu_cb)
	rospy.spin()
