#!/usr/bin/env python
import rospy
import copy
import sys
import math
import rospkg
import actionlib
import swri_rospy
from geometry_msgs.msg import Pose
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from path_follower.msg import PointList,PoseList
from path_follower.srv import PointLoad,PointLoadRequest,GoalLoad,GoalLoadRequest,Nearest,NearestRequest,NearestResponse


rospack = rospkg.RosPack()
n = rospack.get_path('path_follower') #your rospackage name
file_name = n + "/config/" + sys.argv[1] + ".txt"
no_of_loops = int(sys.argv[2]) * 2
#goal_point = int(sys.argv[2])
path_startPoint = 0
loop_startPoint = path_startPoint
ite = 0
ite1 = 0
compare = False

def main():
	global f,lastPoint,midPoint,points
	f = open(file_name, "r")
	lines = f.readlines()
	f.close()
	no_of_points = int(lines[-1])
	#print"no_of_points",no_of_points,type(no_of_points)
	points = [0] * no_of_points
	points_list = [0] * no_of_points
	service = rospy.ServiceProxy('/move_base/PathFollower/getPath', PointLoad)
	srv = PointLoadRequest()
	for i in range(0, no_of_points):
		line = lines[i].split(",")
		for l in range(0,len(line)):
			line[l] = float(line[l])
		points[i] = line
	#print points,len(points)
	lastPoint = len(points)
	midPoint = lastPoint/2
	path_endPoint = lastPoint
	print "last,mid",lastPoint,midPoint
	for j in range(0, no_of_points):
		points_list[j] = PoseList()
		pose_ = points[j]
		for k in range(0,len(pose_)):
			points_list[j].list.append(pose_[k])
		#print points_list[j] ,"-------------------"
		srv.point_list.pose_list.append(copy.copy(points_list[j]))
		#print "finall ---",srv.point_list.pose_list
	if service.call(srv):
    		print 'Path Loading Successful!!!'
	else:
		print 'Path loading Failed!!!'
def align():
	global goal_service,goal_srv,nearestPoint
	goal_service = rospy.ServiceProxy('/move_base/PathFollower/getGoal', GoalLoad)
	goal_srv = GoalLoadRequest()
	goal_srv.goal = loop_startPoint
	print "Alignment in Progress ???"
	if goal_service.call(goal_srv):
		print 'Goal service called'
	else:
		print 'Failed to call Goal Service'
	result = movebase_client(0,0,0,1,"align")
	if result:
		print "Alignment Successful !!!"
		loop()

def get_nearest(req):
	global lastPoint,nearestPoint
	nearestPoint = req.near
	print "got nearestPoint",nearestPoint
	if nearestPoint <= lastPoint:
		return NearestResponse(True)
	else:
		return NearestResponse(False)

def loop():
	global goal_service,goal_srv,midPoint,lastPoint,nearestPoint,ite,last_destPoint,destPoint,compare
	ite += 1
	if ite == 1:
		if loop_startPoint <= midPoint:
			destPoint = midPoint
		elif loop_startPoint > midPoint:
			destPoint = path_startPoint
	compare = True
	if ite > 1:
			if last_destPoint == midPoint:
				destPoint = path_startPoint
			elif last_destPoint != midPoint:
				destPoint = midPoint
	goal_srv.goal = destPoint
	print "Half of Loop ",ite,"in Progress???"
	if goal_service.call(goal_srv):
		print 'Goal service called'
	else:
		print 'Failed to call Goal Service'
	last_destPoint = destPoint
	movebase_client(0,0,0,1,"loop")
	print "last_destPoint",last_destPoint
	'''if result:
		print "Half of Loop ", ite , " completed !!!"'''

def pose_cb(val):
	print 'pose cb called'
	global last_x,last_y,last_z,last_w,pose,orientation,i,points,destPoint,compare,last_destPoint,ite1
	if compare:
		x1 = round(val.position.x,4)
		y1 = round(val.position.y,4)
		pose = points[destPoint]
		x2 = pose[0]
		y2 = pose[1]
		distance = math.sqrt(((x2 - x1)**2) + ((y2 - y1)**2))
		print "distance: ",distance

		if distance <= 1:
			if ite == no_of_loops:
				rospy.signal_shutdown(str(no_of_loops)+"loops Completed Sucessfully")
			else:
				if ite1 == 0:
					loop()
					ite1 += 1
		else:
			ite1 = 0

def movebase_client(x,y,z,w,cb_type):
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
	if cb_type == "align":
		wait = client.wait_for_result()
		if not wait:
			rospy.logerr("Action server not available!")
			rospy.signal_shutdown("Action server not available!")
		else:
			return client.get_result()
if __name__ == '__main__':
	rospy.init_node('path_loader',anonymous=True)
	swri_rospy.Subscriber('/robot_pose', Pose, pose_cb)
	nearest_srv = rospy.Service("/nearestPoint_service",Nearest,get_nearest)
	main()
	align()
	swri_rospy.spin()
