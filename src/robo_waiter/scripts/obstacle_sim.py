#!/usr/bin/env python
import time
import rospy,actionlib,threading
from move_base_msgs.msg import MoveBaseAction,MoveBaseGoal,MoveBaseActionGoal
from sensor_msgs.msg import LaserScan
from std_msgs.msg import Bool, String

cancelled = False
moving = False
succeeded = None
x = y = z = w = None
obs_string = String()
isObstacle = False
inParking = True
inManual = False
check = True

def move_base_cb(msg):
  global x,y,z,w,moving,succeeded
  x = msg.goal.target_pose.pose.position.x
  y = msg.goal.target_pose.pose.position.y
  z = msg.goal.target_pose.pose.orientation.z
  w = msg.goal.target_pose.pose.orientation.w
  print ("succeeded is false")
  moving = True
  succeeded = False


def obstacle(msg):
  global isObstacle, inParking, inManual, client, check

  if msg.data == "obstacle":
    isObstacle = True

  elif msg.data == "nothing":
    isObstacle = False

  elif msg.data == "table":
    check = True

  elif msg.data == "manual":
    client.cancel_all_goals()
    inManual = True

  elif msg.data == "parking":
    inParking = True

  elif msg.data == "pickup":
    inParking = False
    check = False

  elif msg.data == "nomanual":
    inManual == False


def laser_data(msg):
  global x,y,z,w,cancelled,moving, obs, obs_string, isObstacle, inParking, inManual

  if inParking:
    obs_value = 0.3 #in meter
  else:
    obs_value = 0.5

  new = msg.ranges
  first = new[280:340]
  second = new[380:440]
  sc = first + second
  st = min(sc)

  if check:

  
    #if (st <= obs_value or isObstacle) and cancelled == False:
    if isObstacle and cancelled == False and not inManual:
      cancelled = True
      obs_string.data = "obstacle"
      obs.publish(obs_string)
      client.cancel_all_goals()
      print ("goals cancelled")
    if (not isObstacle) and cancelled and not inManual:
      time.sleep(1)
      cancelled = False
      obs_string.data = "nothing"
      obs.publish(obs_string)
      print ("goals resumed")
      if succeeded:
        print ("not goal given")
      else:
        x = threading.Thread(target=send_goal, args=(x,y,z,w,))
        x.start()
  else:
    pass


def send_goal (x, y, z, w):
    global succeeded, moving, park, action
    action_goal = MoveBaseGoal ()
    action_goal.target_pose.header.frame_id = "map"
    action_goal.target_pose.header.stamp = rospy.Time.now ()
    action_goal.target_pose.pose.position.x = x
    action_goal.target_pose.pose.position.y = y
    action_goal.target_pose.pose.orientation.z = z
    action_goal.target_pose.pose.orientation.w = w
    goal_handle = client.send_goal (action_goal)
    wait = client.wait_for_result()
    print (client.get_state())
    if client.get_state() == 3:
      succeeded = True
      a = Bool()
      a.data = True
      action.publish(a)
      print ("succeeded is true")
    moving = False

if __name__ == "__main__":
  rospy.init_node("ultrasonic_obstacle_detection")
  rospy.sleep(1.0)
  obs = rospy.Publisher ("/obstacle/det", String, queue_size = 1)
  action = rospy.Publisher ("/table_action", Bool, queue_size = 1)
  rospy.Subscriber("/arduino/obstacle",String,obstacle)
  rospy.Subscriber("/robot_base/scan",LaserScan,laser_data)
  rospy.Subscriber("/move_base/goal",MoveBaseActionGoal,move_base_cb)
  client = actionlib.SimpleActionClient('/move_base',MoveBaseAction)
  rospy.spin()
