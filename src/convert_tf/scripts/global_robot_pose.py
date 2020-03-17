#!/usr/bin/env python


import rospy
import copy
from tf2_msgs.msg import TFMessage 
from geometry_msgs.msg import Quaternion, PoseWithCovarianceStamped
from tf import TransformBroadcaster, TransformListener
from tf.transformations import *
import math
import time
import os

V = rospy.get_param('Camera', 51654)
print V

gh = TransformBroadcaster()


result = {}
i = 1



def callback(data):
	global gh, V, result, ls, i, pub
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
	rot = [x1,y1,z1,w1]
	df = euler_from_quaternion(rot)
	q_orig2 = quaternion_from_euler(df[0],df[1],df[2])
	q_rot2 = quaternion_from_euler(cv, 0, 0)
	q_new2 = quaternion_multiply(q_rot2, q_orig2)
	fg = euler_from_quaternion(q_new2)
	hj = quaternion_from_euler(fg[2],fg[0],fg[1])
	try:
		gh.sendTransform((z, -x, -y), hj,rospy.Time.now(), '/camera', '/'+tag)
		ls.waitForTransform('/camera', '/'+tag, rospy.Time(0), rospy.Duration(1.0))
		(trans, rot1) = ls.lookupTransform('/camera', '/'+tag, rospy.Time(0))
		gh.sendTransform((trans[0], trans[1], trans[2]), (rot1[0],rot1[1],rot1[2],rot1[3]),rospy.Time.now(), 'rest', '/'+tag)
		gh.sendTransform((-V['p.x'], V['p.y'], -V['p.z']), (V['o.x'],V['o.y'],V['o.z'],V['o.w']),rospy.Time.now(), 'robo', '/rest')
		ls.waitForTransform('/map', '/robo', rospy.Time(0), rospy.Duration(1.0))
		(trans1, rot2) = ls.lookupTransform('/map', '/robo', rospy.Time(0))
		try:
			if i <= 4:
				m = PoseWithCovarianceStamped()
				m.header.frame_id = 'map'
				m.header.stamp = rospy.Time.now()
				m.pose.pose.position.x = trans1[0]
				m.pose.pose.position.y = trans1[1]
				m.pose.pose.orientation.z = rot2[2]
				m.pose.pose.orientation.w = rot2[3]
				rospy.loginfo("initial_pose published")
				pub.publish(m)
				time.sleep(3)
				i = i+1
			else:
				#pass
				rospy.signal_shutdown("closed")
		except Exception as e:
			print e
	except Exception as e:
		print e


def closed():
	rospy.loginfo("initial_pose node closed")
	print "done"


if __name__ == '__main__':
	rospy.init_node('global_robot_tf', anonymous=True)
	ls = TransformListener()
	rospy.Subscriber('/tags/tf', TFMessage, callback)
	pub = rospy.Publisher('initialpose', PoseWithCovarianceStamped, queue_size=10)
	time.sleep(1)
	rospy.on_shutdown(closed)
	rospy.spin()


 	