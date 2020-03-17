#!/usr/bin/env python


import rospy
import copy
from tf2_msgs.msg import TFMessage 
from geometry_msgs.msg import Quaternion, PoseStamped, Twist, Pose
from tf.transformations import *
import math

Tags = rospy.get_param('Tags', 51654)

camera = {'p.x': 0.2525,'p.y': 0.0,'p.z': 0.34013,'o.x': 0.0,'o.y': 0.0,'o.z': 0.0,'o.w': 1.0}
map1 = {'p.x': 0.0,'p.y': 0.0,'p.z': 0.0,'o.x': 0.0,'o.y': 0.0,'o.z': 0.0}
camera_euler = [camera['o.x'],camera['o.y'],camera['o.z'],camera['o.w']]
camera_euler = euler_from_quaternion(camera_euler)
result = {}
i = 1



def callback(data):
	global gh
	global camera
	global camera_euler
	global result
	global Tags
	global i
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
	map1['p.x'] = Tags[tag]['p.x']-(z+camera['p.x'])
	map1['p.y'] = Tags[tag]['p.y']-(-x+camera['p.y'])
	map1['p.z'] = Tags[tag]['p.z']-(-y+camera['p.z'])
	map1['o.x'] = Tags[tag]['o.x']-(fg[2]+camera_euler[0])
	map1['o.y'] = Tags[tag]['o.y']-(fg[0]+camera_euler[1])
	map1['o.z'] = Tags[tag]['o.z']-(fg[1]+camera_euler[2])
	ori = quaternion_from_euler(map1['o.z'],map1['o.x'],map1['o.y'])
	result[tag] = map1
	if i == 1:
		m = Pose()
		m.position.x = map1['p.x']
		m.position.y = map1['p.y']
		m.position.z = map1['p.z']
		m.orientation.x = ori[0]
		m.orientation.y = ori[1]
		m.orientation.z = ori[2]
		m.orientation.w = ori[3]
		pub.publish(m)
		i = i+1

def closed():
	global m
	print m


if __name__ == '__main__':
	rospy.init_node('global_tf', anonymous=True)
	rospy.Subscriber('/guna/tf', TFMessage, callback)
	pub = rospy.Publisher('/robot_pose', Pose, queue_size=10)
	rospy.on_shutdown(closed)
	rospy.spin()

 	