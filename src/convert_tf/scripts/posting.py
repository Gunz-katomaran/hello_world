#!/usr/bin/env python


import rospy
import copy
from tf2_msgs.msg import TFMessage 
from geometry_msgs.msg import TransformStamped
from tf import TransformBroadcaster
from tf.transformations import *
import math

f = TransformStamped()
gh = TransformBroadcaster()

def callback(data):
	global f
	global gh
	cv = math.pi
	c = data.transforms
	d = c[0]
	tag = d.child_frame_id
	x = d.transform.translation.x
	y = d.transform.translation.y
	z = d.transform.translation.z
	x1 = d.transform.rotation.x
	y1 = d.transform.rotation.y
	z1 = d.transform.rotation.z
	w1 = d.transform.rotation.w
	q_orig2 = quaternion_from_euler(z1, x1, y1)
	q_rot2 = quaternion_from_euler(0, 0, cv/2)
	q_new2 = quaternion_multiply(q_rot2, q_orig2)
	#cb = q_new2.normalize() 
	gh.sendTransform((z,-x,-y), q_new2, rospy.Time.now(), 'tag', '/camera')



if __name__ == '__main__':
	rospy.init_node('global_tf', anonymous=True)
	rospy.Subscriber('/guna/tf', TFMessage, callback)
	pub = rospy.Publisher('/ackermann_cmd', TransformStamped, queue_size=10)
	rospy.spin()
 	