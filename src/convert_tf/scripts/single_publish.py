#!/usr/bin/env python


import rospy
import copy
from tf2_msgs.msg import TFMessage 
from geometry_msgs.msg import Quaternion, PoseStamped, Twist, Pose
from tf import TransformBroadcaster, TransformListener
from tf.transformations import *
import math

gh = TransformBroadcaster()


tf_det = []
robot_euler = []
camera = {'p.x': 0.2525,'p.y': 0.0,'p.z': 0.34013,'o.x': 0.0,'o.y': 0.0,'o.z': 0.0,'o.w': 1.0}
map1 = {'p.x': 0.0,'p.y': 0.0,'p.z': 0.0,'o.x': 0.0,'o.y': 0.0,'o.z': 0.0}
camera_euler = [camera['o.x'],camera['o.y'],camera['o.z'],camera['o.w']]
camera_euler = euler_from_quaternion(camera_euler)
robot = {}
result = {}
final = []
pose = PoseStamped()


def callback(data):
	global gh
	global ls,pose
	cv = math.pi
	c = data.transforms
	d = c[0]
	tag = 'tag_4'
	tag1 = d.child_frame_id
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

	gh.sendTransform((z, -x, -y), hj,rospy.Time.now(),'camera' , '/'+tag1)
	ls.waitForTransform('/camera', '/'+tag1, rospy.Time(0), rospy.Duration(1.0))
	(trans, rot1) = ls.lookupTransform('/camera', '/'+tag1, rospy.Time(0))
	gh.sendTransform((trans[0], trans[1], trans[2]), (rot1[0],rot1[1],rot1[2],rot1[3]),rospy.Time.now(), 'rest', '/'+tag1)


def closed():
	print "node end"


if __name__ == '__main__':
	rospy.init_node('global_tag_tf', anonymous=True)
	ls = TransformListener()
	rospy.Subscriber('/tags/tf', TFMessage, callback)
	pose_pub = rospy.Publisher("tag_pose",PoseStamped,queue_size=10)
	rospy.on_shutdown(closed)
	rospy.spin()

 	
