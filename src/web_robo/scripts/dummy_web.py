#!/usr/bin/env python

import rospy, json, sys
from web_robo.srv import WebCommand
import rospkg
rospack = rospkg.RosPack()
rospy.init_node ("web")
a = rospack.get_path('web_robo') + "/config/dummy_web.json"
s = rospy.ServiceProxy ("/web_nav", WebCommand)
f = open (a, "r")
json_dict = json.load (f)


k = json.dumps (json_dict)
print (s(k))