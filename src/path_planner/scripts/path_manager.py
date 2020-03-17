#!/usr/bin/env python
#****please make a config folder in your rospackage before running this script****
import rospy
import atexit
import sys
import rospkg
from geometry_msgs.msg import Pose
from path_planner.srv import Manager,ManagerRequest,ManagerResponse
pose = [0] * 2
orientation = [0] * 2
i = 0
rospack = rospkg.RosPack()
n = dir_path = rospack.get_path('path_planner')
file_name = n + "/config/" + sys.argv[1] + ".yaml"
def main():
    global f
    f= open(file_name,"w+")
def pose_cb(val):
    global x,y,z,w,pose,orientation
    x = val.position.x
    y = val.position.y
    z = val.orientation.z
    w = val.orientation.w
    pose[0] = x
    pose[1] = y
    orientation[0] = z
    orientation[1] = w
    #print pose
def manager_cb(req):
    global f,i
    name = req.name
    data = "point_" + str(i) + ":" + "\r\n"
    f.write(data)
    data1 = "  name:  " + name + "\r\n"
    f.write(data1)
    data2 = "  pose:  " + str(pose) + "\r\n"
    f.write(data2)
    data3 = "  orientation:  " + str(orientation) + "\r\n"
    f.write(data3)
    data4 = "  adj_points:  " + "[" + str(i) + "]" + "  #fill with point numbers that  are connected to this point separated by comma ','" + "\r\n"
    f.write(data4)
    data5 = "  connected_points:  " + "  #fill with points are connected to this point separated by comma ','" + "\r\n"
    f.write(data5)
    data6 = "\r\n"
    f.write(data6)
    i += 1
    print "Location Saved!!!!!"
    return ManagerResponse(status = "Location Saved!!!!!")
def save():
    data = "no_of_points: " + str((i))
    f.write(data)
    f.close()
    print 'File saved Successfully!!!'

if (len(file_name) >=1):
	print file_name
	main()
else:
	print "Please Enter File Name"

if __name__ == "__main__":
    rospy.init_node("path_manager",anonymous=True)
    rospy.Subscriber('/robot_pose', Pose, pose_cb)
    rospy.Service("/set_point",Manager,manager_cb)
    rospy.spin()
    atexit.register(save)
