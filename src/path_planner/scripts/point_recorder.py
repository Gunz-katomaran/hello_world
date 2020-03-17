#!/usr/bin/env python
import rospy
import atexit
import sys
from geometry_msgs.msg import Pose
from path_planner.srv import Manager,ManagerRequest,ManagerResponse
pose = [0] * 4
orientation = [0] * 2
i = 0
file_name = "/home/katomaran/ws/src/path_planner/config/" + sys.argv[1] + ".yaml"
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
    pose[2] = z
    pose[3] = w
    #print pose
def manager_cb(req):
    global f,i
    name = req.name
    data = "pose" + str(i) + ":  " + str(pose) + "\r\n"
    f.write(data)
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
