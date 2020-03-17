#!/usr/bin/env python

import rospy
import swri_rospy
import actionlib
from path_planner.srv import PathFinder,PathFinderRequest,PathFinderResponse
from path_planner.srv import Goal,GoalRequest,GoalResponse
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from std_msgs.msg import String


no_of_points = rospy.get_param(rospy.get_namespace() + 'no_of_points', 2)
connections = [[0 for i in range(2)] for j in range(no_of_points + 1)]
position = [0] * (no_of_points + 1)
orientation = [0] * (no_of_points + 1)
name = [[0 for i in range(2)] for j in range(no_of_points)]

def main():
    global graph,name_dict,position
    for i in range(0, no_of_points):
        connections[i][0] = str(i)
        connections[i][1] = str(rospy.get_param(rospy.get_namespace() + ('point_'+ str(i)+"/connected_points"))).split(",")
        name[i][0] = str(rospy.get_param(rospy.get_namespace() + ('point_'+ str(i)+"/name"),1))
        name[i][1] = str(i)
        position[i] = rospy.get_param(rospy.get_namespace() + ('point_'+ str(i)+"/pose"),1)
        orientation[i] = rospy.get_param(rospy.get_namespace() + ('point_'+ str(i)+"/orientation"),1)
    print 'connected_points',connections
    graph = dict(connections)
    name_dict = dict(name)
    print 'graph',graph

def path_finder(request):
    start = request.start
    goal = request.goal
    if not start == goal:
        path = find_shortest_path(graph,start,goal)
        print "path___",path,type(path)
        return PathFinderResponse(path)
    else:
        no_path = list()
        no_path[0] = goal
        return PathFinderResponse(no_path)

def find_shortest_path(graph, start, end, path=[]):
    start = str(start)
    end = str (end)
    path = path + [start]
    if start == end:
        return path
    if not graph.has_key(start):
        return None
    shortest = None
    for node in graph[start]:
        if node not in path:
            newpath = find_shortest_path(graph, node, end, path)
            if newpath:
                if not shortest or len(newpath) < len(shortest):
                    shortest = newpath
    if shortest != None:
        for i in range (0, len(shortest)):
            shortest[i] = int (shortest[i])
  
    return shortest


def goal_location(request):
    name = request.location
    try:
        goal_point = name_dict[name]
        print "name______",name
        print "goal____",goal_point
        goal_point = int(goal_point)
        pos = position[goal_point]
        ori = orientation[goal_point]
        print "goal_position",pos,ori
        result = movebase_client(pos[0],pos[1],ori[0],ori[1])
        return GoalResponse(goal = int(goal_point))
        if result:
			print 'Goal Reached'
    except:
        return None
        print "No such name"

def goal_cb(value):
    location = value.data
    goal_point = name_dict[location]
    goal_point = int(goal_point)
    pos = position[goal_point]
    ori = orientation[goal_point]
    print "goal_position",pos,ori
    result = movebase_client(pos[0],pos[1],ori[0],ori[1])
    if result:
			print 'Goal Reached'
    

def movebase_client(x,y,z,w):
    print "position",x,y,z,w

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

if __name__ == "__main__":
    main()
    rospy.init_node("path_finder_service_node",anonymous=True)
    swri_rospy.Subscriber('/name_goal', String, goal_cb)
    path_find = rospy.Service("/path_finder_service",PathFinder,path_finder)
    name_srv = rospy.Service("/goal_location",Goal,goal_location)
    rospy.spin()