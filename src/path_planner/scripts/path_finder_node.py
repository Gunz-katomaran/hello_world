#!/usr/bin/env python
import rospy
import copy
import sys
import rospkg
import swri_rospy
import actionlib
from geometry_msgs.msg import Pose
from std_msgs.msg import String
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from roadmap_global_planner_msgs.msg import AdjacencyList,MapPair,PointList
from path_planner.srv import Graph,GraphRequest
from path_planner.srv import PathFinder,PathFinderRequest,PathFinderResponse
from path_planner.srv import Goal,GoalRequest,GoalResponse
name_space = sys.argv[1] + "/"

no_of_points = int(rospy.get_param(rospy.get_namespace() + name_space + 'no_of_points', 2))

name_dict = None
position = [0] * (no_of_points + 1)
orientation = [0] * (no_of_points + 1)
name = [[0 for i in range(2)] for j in range(no_of_points)]
node = [0] * (no_of_points + 1)
pose = [0] * (no_of_points + 1)
pList = [0] * (no_of_points + 1)
adj_point = [0] * (no_of_points + 1)
connections = [[0 for i in range(2)] for j in range(no_of_points + 1)]


def main():
    global graph,name_dict,position, orientation
    mapPair = list()
    service = rospy.ServiceProxy('/move_base/PathPlanner/getPath', Graph)
    srv = GraphRequest()
    pair = MapPair()
	
    for i in range(0, no_of_points):
        connections[i][0] = str(i)
        connections[i][1] = str(rospy.get_param(rospy.get_namespace() + name_space + ('point_'+ str(i)+"/connected_points"))).split(",")
        name[i][0] = str(rospy.get_param(rospy.get_namespace() + name_space + ('point_'+ str(i)+"/name"),1))
        name[i][1] = str(i)
        position[i] = rospy.get_param(rospy.get_namespace() + name_space + ('point_'+ str(i)+"/pose"),1)
        orientation[i] = rospy.get_param(rospy.get_namespace() + name_space + ('point_'+ str(i)+"/orientation"),1)
        adj_point[i] = rospy.get_param(rospy.get_namespace() + name_space + ('point_'+ str(i)+"/adj_point"),[0])
    graph = dict(connections)
    name_dict = dict(name)
    for j in range(0, no_of_points):
		pose[j] = Pose()
		pair.node= j
		print 'type',type(pose)
		pos = position[j]
		print 'pos',pos
		pose[j].position.x = pos[0]
		pose[j].position.y = pos[1]
		pose[j].position.z = 0
		pose[j].orientation.x = 0
		pose[j].orientation.y = 0
		pose[j].orientation.z = 0
		pose[j].orientation.w = 1
		pair.pose = pose[j]
		mapPair.append(copy.copy(pair))

	
    srv.adjacency_list.map= mapPair
    for k in range(0, no_of_points):
		pList[k] = PointList()
		adj = adj_point[k]
		for l in range(0,len(adj)):
			pList[k].list.append(adj[l])
		#pList[k].list.append(adj[1])
		#pList[k].list.append(adj[2])
		srv.adjacency_list.adj_list.append(copy.copy(pList[k]))
    if service.call(srv):
    		print 'service called'

    else:
		print "Failed to call service "


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
    	reached_pub.publish (value.data)
    

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
    return client.get_result()

if __name__ == '__main__':
    rospy.init_node('line_follower',anonymous=True)
    main()
    swri_rospy.Subscriber('/name_goal', String, goal_cb)
    path_find = rospy.Service("/path_finder_service",PathFinder,path_finder)
    name_srv = rospy.Service("/goal_location",Goal,goal_location)
    reached_pub = rospy.Publisher ("/reached_point",  String,  queue_size = 10)
    rospy.spin()
