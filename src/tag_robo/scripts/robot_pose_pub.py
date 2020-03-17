#!/usr/bin/env python

import math
import time
import os
import rospy
import copy
from tf2_msgs.msg import TFMessage 
from geometry_msgs.msg import Quaternion, PoseWithCovarianceStamped, Pose
from tf import TransformBroadcaster, TransformListener
from tf.transformations import *

cam = rospy.get_param('Camera', 51654)
publisher = TransformBroadcaster()
p_x = p_y = p_z = p_w = None
tag_x = tag_y = tag_z = tag_w = None
prev_tag = None


def position(data):
	global p_x, p_y, p_z, p_w
	p_x = data.position.x
	p_y = data.position.y
	p_z = data.orientation.z
	p_w = data.orientation.w



def callback(data):
	global publisher, cam, listener, tag_x ,tag_y ,tag_z ,tag_w, prev_tag
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
	try:
		publisher.sendTransform((z, -x, -y), hj,rospy.Time.now(), '/camera', '/'+tag_id)
		listener.waitForTransform('/camera', '/'+tag_id, rospy.Time(0), rospy.Duration(1.0))
		(trans, rot1) = listener.lookupTransform('/camera', '/'+tag_id, rospy.Time(0))
		publisher.sendTransform((trans[0], trans[1], trans[2]), (rot1[0],rot1[1],rot1[2],rot1[3]),rospy.Time.now(), 'rest', '/'+tag_id)
		publisher.sendTransform((-cam['p.x'], cam['p.y'], -cam['p.z']), (cam['o.x'],cam['o.y'],cam['o.z'],cam['o.w']),rospy.Time.now(), 'robo', '/rest')
		listener.waitForTransform('/map', '/robo', rospy.Time(0), rospy.Duration(1.0))
		(trans1, rot2) = listener.lookupTransform('/map', '/robo', rospy.Time(0))
		tag_x = trans1[0]
		tag_y = trans1[0]
		tag_z = rot2[2]
		tag_w = rot2[3]
		if (abs(tag_x - p_x) < 0.20) and (abs(tag_y - p_y) < 0.20):
			if prev_tag != None and prev_tag != str(tag_id):
				prev_tag = str(tag_id)
				pose = PoseWithCovarianceStamped()
				pose.header.frame_id = 'map'
				pose.header.stamp = rospy.Time.now()
				pose.pose.pose.position.x = trans1[0]
				pose.pose.pose.position.y = trans1[1]
				pose.pose.pose.orientation.z = rot2[2]
				pose.pose.pose.orientation.w = rot2[3]
				rospy.loginfo("initial_pose poselished")
				robo_pose.poselish(pose)
				time.sleep(3)


	except Exception as e:
		print e


def closed():
	rospy.loginfo("initial_pose node closed")


if __name__ == '__main__':
	rospy.init_node('global_robot_tf', anonymous=True)
	listener = TransformListener()
	rospy.Subscriber('/tags/tf', TFMessage, callback)
	rospy.Subscriber('/robot_pose', Pose, position)
	robo_pose = rospy.Publisher('initialpose', PoseWithCovarianceStamped, queue_size=10)
	time.sleep(1)
	rospy.on_shutdown(closed)
	rospy.spin()


 	