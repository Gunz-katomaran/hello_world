#!/usr/bin/env python


import rospy
from tf import TransformBroadcaster
from tf.transformations import *


Tags = rospy.get_param('Tags', 51654)

tag = Tags.keys()
gh = TransformBroadcaster()


def closed():
	rospy.loginfo("publish node closed")
	print "Node Quit"

if __name__ == '__main__':
	rospy.init_node('global_tf', anonymous=True)
	rospy.on_shutdown(closed)
	while not rospy.is_shutdown():
		try:
			for i in range(len(tag)):
				gh.sendTransform((Tags[tag[i]]['p.x'], Tags[tag[i]]['p.y'], Tags[tag[i]]['p.z']),(Tags[tag[i]]['o.x'], 
					Tags[tag[i]]['o.y'], Tags[tag[i]]['o.z'],Tags[tag[i]]['o.w']), rospy.Time.now(), tag[i], '/map')
		except KeyboardInterrupt:
			print "Node exit"
			break