#!/usr/bin/env python
import rospy
import atexit
from geometry_msgs.msg import Pose
from path_planner.srv import Manager,ManagerRequest,ManagerResponse
pose = [None] * 2
orientation = [None] * 2
if rospy.has_param(rospy.get_namespace() + 'no_of_points'):
    i = int(rospy.get_param((rospy.get_namespace() + 'no_of_points')))
else:
    i = 0
name = [[0 for k in range(2)] for m in range(i)]
finished_saving = False
data = None
for point_id in range (0, i):
    name[point_id][0] = str(rospy.get_param(rospy.get_namespace() + ('point_'+ str(point_id)+"/name"),1))
    name[point_id][1] = str(point_id)
name_dict = dict(name)
file_pwd = "/home/nvidia/ws/src/path_planner/config/real_time_param.yaml"
def main():
    global f
    f= open(file_pwd,"a+")
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
def rewrite_no_of_points():
    global data
    with open(file_pwd, 'r') as file:
       data = file.readlines()
    #print data[0]
    if len (data) != 0:
        data[0] = 'no_of_points: ' + str (i+1) + "\n"
        with open(file_pwd, 'w') as file:
            file.writelines( data )
    else:
        with open(file_pwd, 'w') as file:
            file.write ("no_of_points: " + str (i+1) + "\n")

def manager_cb(req):
    global f,i, finished_saving
    #print req
    name = req.name
    if req.connected_points != "Nil":
        connected_points_names = (req.connected_points).split(" ")
        connected_points = []
        for point in connected_points_names:
            connected_points.append(int(name_dict[point]))
        connected_points = str (connected_points)
        connected_points = connected_points.replace(" ", "")
        adj_points = connected_points.replace("[", ("["+str(i)+","))
    else:
        connected_points = "Nil"
        adj_points = "["+str(i)+"]"
    while pose[0] == None:
	pass
    rewrite_no_of_points() 
    f= open(file_pwd,"a+")
    data = "point_" + str(i) + ":" + "\r\n"
    f.write(data)
    data1 = "  name:  " + name + "\r\n"
    f.write(data1)
    data2 = "  pose:  " + str(pose) + "\r\n"
    f.write(data2)
    data3 = "  orientation:  " + str(orientation) + "\r\n"
    f.write(data3)
    data4 = "  adj_points:  " +  adj_points + "  #fill with point numbers that  are connected to this point separated by comma ','" + "\r\n"
    f.write(data4)
    data5 = "  connected_points:  " + connected_points + "  #fill with points are connected to this point separated by comma ','" + "\r\n"
    f.write(data5)
    data6 = "\r\n"
    f.write(data6)
    i += 1
    rospy.set_param ( (rospy.get_namespace() + 'no_of_points') , (i+1) )
    rospy.set_param ( (rospy.get_namespace() + 'point_' + str (i) + '/name') , str(name) )
    rospy.set_param ( (rospy.get_namespace() + 'point_' + str (i) + '/pose') , str(pose) )
    rospy.set_param ( (rospy.get_namespace() + 'point_' + str (i) + '/orientation') , str(orientation) )
    rospy.set_param ( (rospy.get_namespace() + 'point_' + str (i) + '/adj_points') , adj_points )
    rospy.set_param ( (rospy.get_namespace() + 'point_' + str (i) + '/connected_points') , connected_points )

    print "Location Saved!!!!!"
    finished_saving = True
    return ManagerResponse(status = "Location Saved!!!!!")
    
def save():
    f.close()
    print 'File saved Suceesully!!!'
if __name__ == "__main__":
    main()
    rospy.init_node("path_manager",anonymous=True)
    rospy.Subscriber('/robot_pose', Pose, pose_cb)
    rospy.Service("/set_point",Manager,manager_cb)
    while not rospy.is_shutdown():
	if finished_saving:
	    rospy.signal_shutdown ("Finished saving, shutting down path manager")
    rospy.spin()
    atexit.register(save)
