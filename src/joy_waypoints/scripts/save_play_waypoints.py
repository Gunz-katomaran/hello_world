#!/usr/bin/env python


import rospy
import copy
import os
import json
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
from sensor_msgs.msg import Joy
from geometry_msgs.msg import Twist, Pose
import actionlib
import threading
import vibrate


robot = {'x':0.99,'y':0.89,'z':0.98,'w':0.01}
route_no = 1
waypoints = {}
track = False
follow = False
save = {}
inc = 0
client = actionlib.SimpleActionClient('move_base',MoveBaseAction)
node = True
pre = 1
cur = 1
play = True
pause = False
pressed = False
enable8 = False
pressed1 = False
hj = True


def joyCB(data):
	global robot, route_no, track, follow, dir_path, save, inc, client, pressed, ps, enable8, pd, pressed1, hj, cur

	if data.buttons[9]: #start button
		pd = threading.Timer(1.0,start1)

		if not pressed1:
			pd.start()
			pressed1 = True
		else:
			if not enable8:
				vibrate.vibrate_as("create")
				print "s"
				pd.cancel()
				pressed1 = False
				hj = False
				track = False
				try:
					with open(dir_path+'/save_path.txt', 'r') as file:
						save = json.load(file)
						follow = True
						enable8 = True
						cur = 1
				
				except Exception as e:
					print e
			else:
				rospy.loginfo("aldready follow node on")




	if data.buttons[3]: # y button
		inc = 0
		if track:
			vibrate.vibrate_as("saved")
			waypoints[str(route_no)] = copy.copy(robot)
			print waypoints
			rospy.loginfo("waypoints saved")
			route_no = route_no+1
		else:
			rospy.loginfo("track disabled")


	if data.buttons[1]: # A button
		if track and len(waypoints) > 2:

			try:
				vibrate.vibrate_as("finish_saving")
				with open(dir_path+'/save_path.txt', 'w') as file:
					file.write(json.dumps(waypoints))
			except Exception as e:
				print e
			print "file created"
			track = False
		else:
			rospy.loginfo("enable track or save more than 2 points")


	if data.buttons[8]: #back button
		ps = threading.Timer(1.0,play1)

		if enable8:

			if pressed == False:
				ps.start()
				pressed = True
			else:
				vibrate.vibrate_as("paused")
				ps.cancel()
				follow = False
				track = False
				#pressed = False
				client.cancel_all_goals()
				enable8 = False
				pressed1 = False
				hj = True
				rospy.loginfo("exit the follow")
		else:
			rospy.loginfo("please start the follow funciton")



def start1():
	global track, pressed1, hj, waypoints, route_no, client

	if hj:
		vibrate.vibrate_as("create")
		client.cancel_all_goals()
		waypoints.clear()
		pressed1 = False
		rospy.loginfo("ready to save waypoints")
		track = True
		route_no = 1
	else:
		rospy.loginfo("aldready follow node on")
		pressed1 = False



def play1():

	global play, cur, pre, pressed, follow, pause, ps, client, enable8

	pressed = False

	if enable8:
		vibrate.vibrate_as("paused")

		if play:
			pause = True
			play = False
			rospy.loginfo("waypoints cancel")
			client.cancel_all_goals()
			follow = False	
		elif pause:
			play = True
			pause = False
			cur = pre
			follow = True
			rospy.loginfo("waypoints continued")


def movebase_client(fuz):

	global follow, save, client, node, pre, cur

	while node:


		if follow:
			if len(save) > 2:

				pose = save[str(cur)]
				print cur

				pre = cur

				client.wait_for_server()

				goal = MoveBaseGoal()
				goal.target_pose.header.frame_id = "map"
				goal.target_pose.header.stamp = rospy.Time.now()

				goal.target_pose.pose.position.x = pose['x']
				goal.target_pose.pose.position.y = pose['y']  

				goal.target_pose.pose.orientation.z = pose['z']
				goal.target_pose.pose.orientation.w = pose['w']

				client.send_goal(goal)
				wait = client.wait_for_result()

				if not wait:
				  rospy.logerr("Action server not available!")
				  rospy.signal_shutdown("Action server not available!")
				else:
					pass

				result = client.get_result()

				vibrate.vibrate_as("paused")

				if result:
					print "ok"

				cur = cur+1

				if len(save) < cur:
					print "reset"
					cur = 1

			else:
				rospy.loginfo("waypoints length below two")
				break

		else:
			pass
			#rospy.loginfo("Eject from follow")

		
def robot_pose(data):
	global robot
	global track
	if track:
		robot['x'] = data.position.x
		robot['y'] = data.position.y
		robot['z'] = data.orientation.z
		robot['w'] = data.orientation.w
	else:
		pass


def closed():
	global node, t1, client
	client.cancel_all_goals()
	node = False
	t1.join()
	rospy.loginfo("node shutdown")


if __name__ == '__main__':
    rospy.init_node("waypoint_save_node", anonymous=True)
    r = rospy.Rate(20)
    rospy.Subscriber("/joy", Joy, joyCB)
    rospy.Subscriber("/robot_pose", Pose, robot_pose)
    dir_path = os.path.dirname(os.path.realpath(__file__))
    t1 = threading.Thread(target=movebase_client, args=(save,))
    t1.start()
    rospy.on_shutdown(closed)
    rospy.spin()