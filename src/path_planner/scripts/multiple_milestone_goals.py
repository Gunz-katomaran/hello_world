#!/usr/bin/env python
import rospy
from std_msgs.msg import String
import actionlib
from move_base_msgs.msg import MoveBaseAction
point_reached = None
client = actionlib.SimpleActionClient('/move_base',MoveBaseAction)
def path_cb (message):
    print message
    #while (not goal_pub.get_num_connections() > 0):# or (not rospy.is_shutdown ()):
    #    pass
    goals = message.data
    goals = goals.split(" ")
    rospy.loginfo ("Starting to move to %s", goals)
    for i in range (0, len(goals)):
        goal_pub.publish (goals[i])
        while point_reached != goals [i] and not rospy.is_shutdown():
            if not client.wait_for_server(rospy.Duration(4)):
		rospy.signal_shutdown ("Lost connection with move base, multiple goal node shutting down")
	    
    rospy.signal_shutdown("All Multiple milestone goals reached in order. So shutting down the node")
def reached_cb(msg):
    global point_reached
    point_reached = msg.data

if __name__ == "__main__":
    rospy.init_node('multiple_milestone_goals_node', anonymous=True)
    goal_pub = rospy.Publisher ("/name_goal", String, queue_size = 10)
    rospy.Subscriber ("/path_shuttle", String, path_cb)
    rospy.Subscriber ("/reached_point", String, reached_cb)
    rospy.spin()
