#!/usr/bin/env python

import rospy
from path_planner.srv import PathFinder,PathFinderRequest,PathFinderResponse
no_of_points = rospy.get_param(rospy.get_namespace() + 'no_of_points', 2)
adj_point = [0] * (no_of_points + 1)
connections = [[0 for i in range(2)] for j in range(no_of_points + 1)]
def main():
    for i in range(0, no_of_points):
        adj_point[i] = rospy.get_param(rospy.get_namespace() + ('point_'+ str(i)+"/adj_point"),1)
        connections[i][0] = str(i)
        connections[i][1] = str(rospy.get_param(rospy.get_namespace() + ('point_'+ str(i)+"/connected_points"))).split(",")
        print 'adj_point',adj_point
        print 'connected_points',connections
        graph = dict(connections)
        print 'graph',graph
def path_finder(request):
    start = request.start
    goal = request.goal

if __name__ == "__main__":
    rospy.init_node("path_finder_service_node",anonymous=True)
    path_find = rospy.Service("/path_finder_service",PathFinder,path_finder)
    rospy.spin