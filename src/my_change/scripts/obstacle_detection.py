#!/usr/bin/env python3
import rospy,actionlib,threading
from move_base_msgs.msg import MoveBaseAction,MoveBaseGoal,MoveBaseActionGoal
from my_change.msg import Sonic

cancelled = False
moving = False
succeeded = None
def move_base_cb(msg):
  global x,y,z,w,moving,succeeded
  x = msg.goal.target_pose.pose.position.x
  y = msg.goal.target_pose.pose.position.y
  z = msg.goal.target_pose.pose.orientation.z
  w = msg.goal.target_pose.pose.orientation.w
  print ("succeeded is false")
  moving = True
  succeeded = False

def sonic_cb(msg):
  global x,y,z,w,cancelled,moving
  d1 = msg.distance1
  d2 = msg.distance2
  d3 = msg.distance3
  d4 = msg.distance4
  d5 = msg.distance5
  
  if ((d1 <= 0.40 and d1 > 0.0) or (d2 <= 0.40 and d2 > 0.0) or (d3 <= 0.40 and d3 > 0.0) or (d4 <= 0.30 and d4 > 0.0) or (d5 <= 0.30 and d5 > 0.0)) and cancelled == False:
    cancelled = True
    client.cancel_all_goals()
    print ("goals cancelled")
  elif (d1 > 0.40 or d1 == 0.0) and (d2 > 0.40 or d2 == 0.0) and (d3 > 0.40 or d3 == 0.0) and (d4 > 0.30 or d4 == 0.0) and (d5 > 0.30 or d5 == 0.0) and cancelled:
    cancelled = False
    print ("goals resumed")
    if succeeded:
      print ("not goal given")
    else:
      x = threading.Thread(target=send_goal, args=(x,y,z,w,))
      x.start()


def send_goal (x, y, z, w):
    global succeeded, moving
    action_goal = MoveBaseGoal ()
    action_goal.target_pose.header.frame_id = "map"
    action_goal.target_pose.header.stamp = rospy.Time.now ()
    action_goal.target_pose.pose.position.x = x
    action_goal.target_pose.pose.position.y = y
    action_goal.target_pose.pose.orientation.z = z
    action_goal.target_pose.pose.orientation.w = w
    goal_handle = client.send_goal (action_goal)
    wait = client.wait_for_result()
    if client.get_state() == 3:
      succeeded = True
      print ("scceeded is true")
    moving = False

if __name__ == "__main__":
  rospy.init_node("ultrasonic_obstacle_detection")
  rospy.sleep(1.0)
  rospy.Subscriber("/ultrasonic",Sonic,sonic_cb)
  rospy.Subscriber("/move_base/goal",MoveBaseActionGoal,move_base_cb)
  client = actionlib.SimpleActionClient('/move_base',MoveBaseAction)
  rospy.spin()
