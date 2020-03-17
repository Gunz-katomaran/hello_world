#!/usr/bin/env python
import rospy
from tf.transformations import *
from tf import TransformBroadcaster
br = TransformBroadcaster()

def publish(event):
  global br
  br.sendTransform((1, 0, 0), quaternion_from_euler(0,0,1.24),rospy.Time.now(), 'rest', '/world')
  br.sendTransform((1, 0, 0), quaternion_from_euler(0,0,1.24),rospy.Time.now(), '/cam', '/tag')
if __name__ == "__main__":
  rospy.init_node("tf_publisher_node")
  rospy.Timer(rospy.Duration(0.1), publish)
  rospy.spin()
