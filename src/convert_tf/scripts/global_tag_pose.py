#!/usr/bin/env python


import rospy
import copy
from tf2_msgs.msg import TFMessage 
from geometry_msgs.msg import Quaternion, PoseStamped, Twist, Pose
from tf import TransformBroadcaster
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

def robo_pose(data):
	global robot
	global robot_euler
	robot['p.x'] = data.position.x
	robot['p.y'] = data.position.y
	robot['p.z'] = data.position.z
	robot['o.x'] = data.orientation.x
	robot['o.y'] = data.orientation.y
	robot['o.z'] = data.orientation.z
	robot['o.w'] = data.orientation.w
	robot_euler = [robot['o.x'],robot['o.y'],robot['o.z'],robot['o.w']]
	robot_euler = euler_from_quaternion(robot_euler)


def callback(data):
	global gh
	global camera
	global camera_euler
	global robot
	global robot_euler
	global result
	global final
	global map1
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
	map1['p.x'] = z+camera['p.x']+robot['p.x']
	map1['p.y'] = -x+camera['p.y']+robot['p.y']
	map1['p.z'] = -y+camera['p.z']+robot['p.z']
	map1['o.x'] = fg[2]+camera_euler[0]+robot_euler[0]
	map1['o.y'] = fg[0]+camera_euler[1]+robot_euler[1]
	map1['o.z'] = fg[1]+camera_euler[2]+robot_euler[2]
	
	print map1
	result.append(map1)
	#gh.sendTransform((z, -x, -y), hj, rospy.Time.now(), 'tag4', '/camera')

def closed():
	global result
	print result


if __name__ == '__main__':
	rospy.init_node('global_tag_tf', anonymous=True)
	rospy.Subscriber('/guna/tf', TFMessage, callback)
	rospy.Subscriber('/robot_pose', Pose, robo_pose)
	rospy.on_shutdown(closed)
	rospy.spin()

 	