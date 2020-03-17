#!/usr/bin/env python
import rospy
import copy
from path_planner.srv import Graph,GraphRequest
from geometry_msgs.msg import Pose
from roadmap_global_planner_msgs.msg import AdjacencyList,MapPair,PointList

no_of_points = rospy.get_param(rospy.get_namespace() + 'no_of_points', 2)

position = [0] * (no_of_points + 1)
name = [0] * (no_of_points + 1)
node = [0] * (no_of_points + 1)
pose = [0] * (no_of_points + 1)
pList = [0] * (no_of_points + 1)
adj_point = [0] * (no_of_points + 1)
def main():
	mapPair = list()
	service = rospy.ServiceProxy('/move_base/PathPlanner/getPath', Graph)
	srv = GraphRequest()
	pair = MapPair()
	
	for i in range(0, no_of_points):
		position[i] = rospy.get_param(rospy.get_namespace() + ('point_'+ str(i)+"/pose"),1)
		name[i] = rospy.get_param(rospy.get_namespace() + ('point_'+ str(i)+"/name"),"point")
		adj_point[i] = rospy.get_param(rospy.get_namespace() + ('point_'+ str(i)+"/adj_point"),1)
	print 'position',position
	print 'name',name
	print 'adj_point',adj_point
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

	
	print "mapPair",mapPair,len(mapPair)
	srv.adjacency_list.map= mapPair
	print 'src.adjlist',srv.adjacency_list.map
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
if __name__ == '__main__':
	rospy.init_node('line_follower',anonymous=True)
	main()
