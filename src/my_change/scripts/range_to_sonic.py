#!/usr/bin/env python
import rospy
from sensor_msgs.msg import Range
from my_change.msg import Sonic

d1 = d2 = d3 = d4 = d5 = 0.0
i = 0

def sensor1(msg):
	global d1
	d1 = msg.range
def sensor2(msg):
	global d2
	d2 = msg.range
def sensor3(msg):
	global d3
	d3 = msg.range
def sensor4(msg):
	global d4
	d4 = msg.range
def sensor5(msg):
	global d5
	d5 = msg.range

def my_callback(event):
	global d1, d2, d3, d4, d5, pub, i
	mes = Sonic()
	mes.no = i  
	mes.distance1 = d1
	mes.distance2 = d2
	mes.distance3 = d3
	mes.distance4 = d4
	mes.distance5 = d5
	pub.publish(mes)
	#print "pub"
	i = i+1

if __name__ == "__main__":
  rospy.init_node("range_to_sonic")
  rospy.sleep(1.0)
  pub = rospy.Publisher ("/ultrasonic", Sonic, queue_size = 1)
  rospy.Subscriber("/patrol/ir_front1",Range,sensor1)
  rospy.Subscriber("/patrol/ir_front2",Range,sensor2)
  rospy.Subscriber("/patrol/ir_front3",Range,sensor3)
  rospy.Subscriber("/patrol/ir_front4",Range,sensor4)
  rospy.Subscriber("/patrol/ir_front5",Range,sensor5)
  rospy.sleep(1.0)
  rospy.Timer(rospy.Duration(0.1), my_callback)
  rospy.spin()