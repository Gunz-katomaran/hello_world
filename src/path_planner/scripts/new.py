#!/usr/bin/env python
import rospy
import actionlib
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
no_of_points = int(rospy.get_param(rospy.get_namespace() + 'no_of_points', 2))
pose = [0] * (no_of_points + 1)
for i in range(0, no_of_points):
  pose[i] = rospy.get_param(rospy.get_namespace() + ('pose'+ str(i)),1)
  print pose[i]
def movebase_client(x,y,z,w):
    print "position",x,y,z,w
    client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
    client.wait_for_server()
    goal = MoveBaseGoal()
    goal.target_pose.header.frame_id = "map"
    goal.target_pose.header.stamp = rospy.Time.now()
    goal.target_pose.pose.position.x = x
    goal.target_pose.pose.position.y = y
    goal.target_pose.pose.orientation.z = z
    goal.target_pose.pose.orientation.w = w
    client.send_goal(goal)
    wait = client.wait_for_result()
    if not wait:
        rospy.logerr("Action server not available!")
        rospy.signal_shutdown("Action server not available!")
    else:
    	return client.get_result()

if __name__ == '__main__':
    rospy.init_node('movebase_client_py')
    while True:
      for i in range(0,no_of_points):
	print i
	crnt_pose = pose[i]
        result = movebase_client(crnt_pose[0],crnt_pose[1],crnt_pose[2],crnt_pose[3])
    '''while True:'
      result = movebase_client(2.54527,-2.21355,0.645528,0.76373)
      if result:
	print "goal 1 reached"
        result2 = movebase_client(-0.92554,-3.29504,-0.72389,0.68990)
        if result2:
          print "goal 2 reached"
          result3 = movebase_client(-0.813628,-7.51078,-0.01447,0.99989)
          if result3:
            print "goal 3 reached"
            result4 = movebase_client(3.75299,-5.44551,0.781255,0.624211)
            if result4:
              print "goal 4 reached" '''
