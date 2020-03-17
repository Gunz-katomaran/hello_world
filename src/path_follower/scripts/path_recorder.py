#!/usr/bin/env python
#****please make a config folder in your rospackage before running this script****
import rospy
import atexit
import sys
import rospkg
from geometry_msgs.msg import Pose
from path_planner.srv import Manager,ManagerRequest,ManagerResponse
pose = [0] * 4
last_x = 0.0
last_y = 0.0
last_z = 0.0
last_w = 0.0
rospack = rospkg.RosPack()
n = rospack.get_path('path_follower') #your rospackage name
file_name = n + "/config/" + sys.argv[1] + ".txt"
i = 0
def main():
    global f
    f = open(file_name,"w+")
def diff(last,val):
    value = abs(abs(val) - abs(last))
    return value
def pose_cb(val):
    global last_x,last_y,last_z,last_w,pose,orientation,i
    x = round(val.position.x,4)
    y = round(val.position.y,4)
    z = round(val.orientation.z,4)
    w = round(val.orientation.w,4)
    #if (last_x != x or last_y != y or last_z != z or last_w != w):
    if (diff(last_x,x)>= 0.01 or diff(last_y,y)>= 0.01 or diff(last_z,z)>= 0.01 or diff(last_w,w)>= 0.01):
        pose[0] = x
        pose[1] = y
        pose[2] = z
        pose[3] = w
        data = str(pose[0])+"," +str(pose[1]) + ","+str(pose[2]) + "," + str(pose[3])+ "\r\n"
        print pose
        f.write(data)
        i += 1
    last_x = x
    last_y = y
    last_z = z
    last_w = w

def save():
    global i
    data = str(i)
    f.write(data)
    f.close()
    print 'File saved Suceesully!!!'

if __name__ == "__main__":
    main()
    rospy.init_node("path_recorder",anonymous=True)
    rospy.Subscriber('/robot_pose', Pose, pose_cb)
    rospy.spin()
    atexit.register(save)
