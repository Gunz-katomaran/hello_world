#!/usr/bin/env python

import os
import math
import copy
import json
import rospy
from threading import Thread
from rospkg import RosPack
from std_msgs.msg import String
from tf2_msgs.msg import TFMessage 
from geometry_msgs.msg import Quaternion, PoseStamped, Twist, Pose
from tf import TransformBroadcaster, TransformListener
from tf.transformations import *


rospack = RosPack ()
path = rospack.get_path('robo_waiter') + "/scripts/tab/config/"
cam = rospy.get_param('Camera', 51654)
sender = TransformBroadcaster()
tag_info = {'id':'df','p.x': 0.0,'p.y': 0.0,'p.z': 0.0,'o.x': 0.0,'o.y': 0.0,'o.z': 0.0,'o.w':0.0}
result = {}


def publisher():
	global sender
	while not rospy.is_shutdown():
		sender.sendTransform((cam['p.x'], cam['p.y'], cam['p.z']), (cam['o.x'],cam['o.y'],cam['o.z'],cam['o.w']),rospy.Time.now(), '/camera', '/base_link')



def callback(data):
	try:

		global sender, listener, result, tag_info, cam
		tag = data.transforms[0]
		tag_id = tag.child_frame_id
		x = tag.transform.translation.x
		y = tag.transform.translation.y
		z = tag.transform.translation.z
		x1 = tag.transform.rotation.x
		y1 = tag.transform.rotation.y
		z1 = tag.transform.rotation.z
		w1 = tag.transform.rotation.w 
		rotation = [x1,y1,z1,w1]
		df = euler_from_quaternion(rotation)
		q_orig2 = quaternion_from_euler(df[0],df[1],df[2])
		q_rot2 = quaternion_from_euler(math.pi, 0, 0)
		q_new2 = quaternion_multiply(q_rot2, q_orig2)
		fg = euler_from_quaternion(q_new2)
		hj = quaternion_from_euler(fg[2],fg[0],fg[1])
		sender.sendTransform((z, -x, -y), hj,rospy.Time.now(), tag_id, '/camera')
		listener.waitForTransform("/map", "/"+tag_id, rospy.Time(0), rospy.Duration(1.0))
		(trans, rot1) = listener.lookupTransform('/map', '/'+tag_id, rospy.Time(0))
		tag_info['p.x'] = trans[0]
		tag_info['p.y'] = trans[1]
		tag_info['p.z'] = trans[2]
		tag_info['o.x'] = rot1[0]
		tag_info['o.y'] = rot1[1]
		tag_info['o.z'] = rot1[2]
		tag_info['o.w'] = rot1[3]
		tag_info['id'] = tag_id
		if tag_id not in result:
			tag_pub.publish(str(tag_id))
		result[tag_id] = copy.copy(tag_info)
	except Exception as e:
		print e

def closed():
	try:
		data = {}
		data["tags_info"] = result
		with open(path + 'apriltag_info.json', 'w+') as file:
			file.write(json.dumps(data,indent=4))
	except Exception as e:
		print e



if __name__ == '__main__':
	rospy.init_node('global_tag_finder', anonymous=True)
	listener = TransformListener()
	tag_pub = rospy.Publisher("/tag_info", String, queue_size=1)
	rospy.Subscriber('/tags/tf', TFMessage, callback)
	process = Thread( target = publisher)
	process.start()
	rospy.on_shutdown(closed)
	rospy.spin()

 	