#!/usr/bin/env python


import rospy
import json
from rospkg import RosPack
from tf import TransformBroadcaster
from tf.transformations import *


rospack = RosPack ()
path = rospack.get_path('robo_waiter') + "scripts/tab/config/"

gh = TransformBroadcaster()


def closed():
	rospy.loginfo("publish node closed")
	print "Node Quit"

if __name__ == '__main__':
	rospy.init_node('publish_tags', anonymous=True)
	rospy.on_shutdown(closed)
	try:
		with open (path + "apriltag_info.json",'r') as file:
			data = json.load(file)
	except Exception as e:
		print e

	while not rospy.is_shutdown():
		try:
			for i in data['tag_info']:
				gh.sendTransform((data['tag_info'][i]['p.x'], data['tag_info'][i]['p.y'], data['tag_info'][i]['p.z']),(data['tag_info'][i]['o.x'], 
					data['tag_info'][i]['o.y'], data['tag_info'][i]['o.z'],data['tag_info'][i]['o.w']), rospy.Time.now(), str(i), '/map')
		except KeyboardInterrupt:
			print "Node exit"
			break