#!/usr/bin/env python


import rospy
import copy
from tf2_msgs.msg import TFMessage 
from geometry_msgs.msg import Quaternion, PoseWithCovarianceStamped
from tf import TransformBroadcaster, TransformListener
from tf.transformations import *
import math
import time

V = rospy.get_param('Camera', 51654)
print V

gh = TransformBroadcaster()


result = {}
i = 1



def callback(data):
	global gh
	global V
	global result
	global ls
	global i
	global pub
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
	gh.sendTransform((V['p.x'], V['p.y'], V['p.z']), (V['o.x'],V['o.y'],V['o.z'],V['o.w']),rospy.Time.now(), 'camera', '/base_link')
	gh.sendTransform((z, -x, -y), hj,rospy.Time.now(), '/'+tag+'58', '/camera')
	ls.waitForTransform('/'+tag+'58', '/'+tag, rospy.Time(0), rospy.Duration(1.0))
	(trans, rot1) = ls.lookupTransform('/'+tag+'58', '/'+tag, rospy.Time(0))
	(trans1, rot2) = ls.lookupTransform('/base_link', '/map', rospy.Time(0))
	trans = (trans[0]-trans1[0],trans[1]-trans1[1],trans[2]-trans1[2])
	rot1 = (rot1[0]-rot2[0],rot1[1]-rot2[1],rot1[2]-rot2[2],rot1[3]-rot2[3])
	gh.sendTransform((trans[0], trans[1], trans[2]), (rot1[0],rot1[1],rot1[2],rot1[3]),rospy.Time.now(), 'new_robo', '/map')


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


 	