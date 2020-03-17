#!/usr/bin/env python


import argparse
import rospy
from tf2_msgs.msg import TFMessage
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from tf import TransformBroadcaster, TransformListener
from geometry_msgs.msg import Quaternion, PoseStamped, Twist, Pose
from tf.transformations import *
import sys
import threading

go = Twist()
act = False


def docker(tag):
  global ls, go, esc, gh, pub, act

  go.linear.x = 0.05

  ls.waitForTransform("/map", "/new1", rospy.Time(), rospy.Duration(1.0))
  (trans,rot) = ls.lookupTransform("/map","/new1", rospy.Time())

  x = trans[0]
  y = trans[1]
  z = rot[2]
  w = rot[3]
  print x, y, '0','0','0',z,w

  try:
    esc = False
    res = movebase_client(x,y,z,w)
    pub.publish(go)
    act = True


  except Exception as e:
    print e

  #rospy.signal_shutdown("dfsd")

def callback(data):
  global gh, ls, i , pub, act, go
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

  if act:
    print z,x
    if z < 0.1:
      if x > 0.05:
        rospy.loginfo("left offset")
        go.angular.z = 0.05
        pub.publish(go)
      elif -0.04 >= x <= 0.04:
        rospy.loginfo("ofset ok")
        go.angular.x = 0.0
        pub.publish(go)
      elif x > -0.05:
        rospy.loginfo("right offset")
        go.angular.z = 0.05
        pub.publish(go)
    else:
      go.linear.x = 0.0
      go.angular.z = 0.0
      pub.publish(go)







def movebase_client(x,y,z,w):

 # Create an action client called "move_base" with action definition file "MoveBaseAction"
  client = actionlib.SimpleActionClient('move_base',MoveBaseAction)

 # Waits until the action server has started up and started listening for goals.
  client.wait_for_server()


 # Creates a new goal with the MoveBaseGoal constructor
  goal = MoveBaseGoal()
  goal.target_pose.header.frame_id = "map"
  goal.target_pose.header.stamp = rospy.Time.now()
 # Move 0.5 meters forward along the x axis of the "map" coordinate frame 
  goal.target_pose.pose.position.x = x
  goal.target_pose.pose.position.y = y  
 # No rotation of the mobile base frame w.r.t. map frame
  goal.target_pose.pose.orientation.z = z 
  goal.target_pose.pose.orientation.w = w

 # Sends the goal to the action server.
  client.send_goal(goal)
 # Waits for the server to finish performing the action.
  wait = client.wait_for_result()
 # If the result doesn't arrive, assume the Server is not available
  if not wait:
      rospy.logerr("Action server not available!")
      rospy.signal_shutdown("Action server not available!")
  else:
    pass

  return client.get_result()

def transform(tag):
  global gh
  global esc
  while esc:
    gh.sendTransform((-1.5, 0, 0), (0,0,0,1),rospy.Time.now(),'new1' , '/'+tag)

def closed():
  rospy.loginfo("node closed")

if __name__ == '__main__':
  esc = True
  if len(sys.argv) >= 2:
    tag = sys.argv[1]
    rospy.init_node('docker', anonymous=True)
    ls = TransformListener()
    gh = TransformBroadcaster()
    T1 = threading.Thread(target=transform,args=[tag])
    rospy.Subscriber('/tags/tf', TFMessage, callback)
    pub = rospy.Publisher('cmd_vel', Twist, queue_size=10)
    rospy.on_shutdown(closed)
    T1.start()
    docker(tag)
    rospy.spin()
  else:
    print "please enter the tag_id"
    rospy.signal_shutdown("dfsd")


