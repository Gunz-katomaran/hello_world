#!/usr/bin/env python

import os
import rospy

n = dir_path = os.path.dirname(os.path.realpath(__file__))
f = os.getcwd()

import rospkg

# get an instance of RosPack with the default search paths
rospack = rospkg.RosPack()

# list all packages, equivalent to rospack list
rospack.list() 

# get the file path for rospy_tutorials
g = rospack.get_path('path_planner')


print(g)

print(n)
print(f)
print(__file__)