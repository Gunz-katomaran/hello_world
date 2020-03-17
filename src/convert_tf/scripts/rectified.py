#!/usr/bin/env python


import rospy
import copy
from tf2_msgs.msg import TFMessage 
from geometry_msgs.msg import PoseWithCovarianceStamped, PoseStamped
from tf import TransformBroadcaster, TransformListener
import time

send = TransformBroadcaster()

def callback(data):
	global pub
	global send
	pose = PoseStamped()
	c = data.transforms
	d = c[0]
	pose.header.frame_id = 'map'
	pose.header.stamp = rospy.Time.now()
	pose.pose.position.x = d.transform.translation.x
	pose.pose.position.y = d.transform.translation.y
	pose.pose.position.z = d.transform.translation.z
	pose.pose.orientation.x = d.transform.rotation.x
	pose.pose.orientation.y = d.transform.rotation.y
	pose.pose.orientation.z = d.transform.rotation.z
	pose.pose.orientation.w = d.transform.rotation.w 
	send.sendTransform((0,0,1), (0,0,0,1),rospy.Time.now(), '/camera', '/map')
	pub.publish(pose)



def closed():
	rospy.loginfo("rectifier node closed")
	print "done"


if __name__ == '__main__':
	rospy.init_node('rectifier', anonymous=True)
	rospy.Subscriber('/tags/tf', TFMessage, callback)
	pub = rospy.Publisher('april_pose', PoseStamped, queue_size=10)
	time.sleep(1)
	rospy.on_shutdown(closed)
	rospy.spin()


 	