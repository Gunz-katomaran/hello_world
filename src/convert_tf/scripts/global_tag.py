#!/usr/bin/env python


import rospy
from tf2_msgs.msg import TFMessage 
from geometry_msgs.msg import Quaternion, PoseStamped, Twist, Pose
from tf import TransformBroadcaster, TransformListener
from tf.transformations import *
import math
import copy
import json
import os

V = rospy.get_param('Camera', 51654)
print V
print type(V)

gh = TransformBroadcaster()
map1 = {'id':'df','p.x': 0.0,'p.y': 0.0,'p.z': 0.0,'o.x': 0.0,'o.y': 0.0,'o.z': 0.0,'o.w':0.0}
result = {}



def callback(data):
	try:

		global gh, ls, result, map1, V
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
		gh.sendTransform((V['p.x'], V['p.y'], V['p.z']), (V['o.x'],V['o.y'],V['o.z'],V['o.w']),rospy.Time.now(), '/camera', '/base_link')
		gh.sendTransform((z, -x, -y), hj,rospy.Time.now(), tag, '/camera')
		ls.waitForTransform("/map", "/"+tag, rospy.Time(0), rospy.Duration(1.0))
		(trans, rot1) = ls.lookupTransform('/map', '/'+tag, rospy.Time(0))
		map1['p.x'] = trans[0]
		map1['p.y'] = trans[1]
		map1['p.z'] = trans[2]
		map1['o.x'] = rot1[0]
		map1['o.y'] = rot1[1]
		map1['o.z'] = rot1[2]
		map1['o.w'] = rot1[3]
		map1['id'] = tag
		print map1
		result[tag] = copy.copy(map1)
	except Exception as e:
		print e

def closed():
	global result, dir_path
	try:
		with open(dir_path+'/global_tags_pose.txt', 'w') as file:
			documents = file.write(json.dumps(result))
	except Exception as e:
		print e
	print "file created"


if __name__ == '__main__':
	rospy.init_node('global_tag_tf', anonymous=True)
	ls = TransformListener()
	rospy.Subscriber('/tags/tf', TFMessage, callback)
	dir_path = os.path.dirname(os.path.realpath(__file__))
	rospy.on_shutdown(closed)
	rospy.spin()

 	