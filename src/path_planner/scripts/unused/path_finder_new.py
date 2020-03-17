#!/usr/bin/env python

import rospy
from path_planner.srv import PathFinder,PathFinderRequest,PathFinderResponse
no_of_points = rospy.get_param(rospy.get_namespace() + 'no_of_points', 2)
connections = [[0 for i in range(2)] for j in range(no_of_points + 1)]
def main():
    global graph
    for i in range(0, no_of_points):
        connections[i][0] = str(i)
        connections[i][1] = str(rospy.get_param(rospy.get_namespace() + ('point_'+ str(i)+"/connected_points"))).split(",")
    print 'connected_points',connections
    graph = dict(connections)
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

if __name__ == "__main__":
    main()
    rospy.init_node("path_finder_service_node",anonymous=True)
    path_find = rospy.Service("/path_finder_service",PathFinder,path_finder)
    rospy.spin()