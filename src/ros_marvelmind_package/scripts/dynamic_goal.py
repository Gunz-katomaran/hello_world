#!/usr/bin/env python
import rospy
import swri_rospy
import actionlib
from marvelmind_nav.msg import hedge_pos_a
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
rospy.init_node ('marvel_goal')
last_pos_x = 0
last_pos_y = 0
def hedge_cb(data):
	global pos_x,pos_y,ori_z,ori_w,result,last_pos_x,last_pos_y
	address = data.address
	if address == 7:
		time = data.timestamp_ms
		pos_x = data.x_m
		pos_y = data.y_m
		ori_z = 0.0
		ori_w = 1.0
		print (pos_x,pos_y,ori_z,ori_w)
		diff_x = abs(pos_x - last_pos_x)
		diff_y = abs(pos_y - last_pos_y)
		if diff_x >= 0.5 or diff_y >= 0.5:
			last_pos_x = pos_x
			last_pos_y = pos_y
			print ('goal_pos',pos_x,pos_y,ori_z,ori_w)
			result  = movebase_client(pos_x,pos_y,ori_z,ori_w)
		if result:
			print 'Goal Reached'

'''def goal_cb():
	result = movebase_client(pos_x,pos_y,ori_z,ori_w)
	print (pos_x,pos_y,ori_z,ori_w)
	if result:
		print 'Goal Reached' '''

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
    #wait = client.wait_for_result()
   # If the result doesn't arrive, assume the Server is not available
    '''if not wait:
        rospy.logerr("Action server not available!")
        rospy.signal_shutdown("Action server not available!")
    else:
    # Result of executing the action'''
    return client.get_result()

# If the python node is executed as main process (sourced directly)
if __name__ == '__main__':
	rospy.Subscriber ('/hedge_pos_a', hedge_pos_a, hedge_cb)
	#swri_rospy.Timer(rospy.Duration(5), goal_cb)
	#swri_rospy.Timer(rospy.Duration(1), result_cb)
	rospy.spin()
