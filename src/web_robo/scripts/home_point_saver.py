#!/usr/bin/env python
import rospy
from os import listdir, mkdir, path
from geometry_msgs.msg import Pose
from web_robo.srv import WebCommand, WebCommandResponse, ListDirectory, ListDirectoryResponse, ListHome, ListHomeResponse
from rospkg import RosPack
import json
rospack = RosPack ()

x = y = z = w = None
info_list = []
file_config = rospack.get_path('robo_waiter') + "/scripts/tab/config/"

def pose_cb(msg):
	global x, y, z, w
	x = msg.position.x
	y = msg.position.y
	z = msg.orientation.z
	w = msg.orientation.w

def request(req):
	global info_list
	old = False
	name = req.command
	for i in info_list:
		if str(name) == i['name']:
			old = True
			ind = info_list.index(i)

	res = WebCommandResponse()
	rospy.loginfo("home_point_saver_called")
	try:
		data = {}
		data["x"] = x
		data["y"] = y
		data["z"] = z
		data["w"] = w
		data["name"] = str(name)
		if old:
			info_list[ind] = data
		else:
			info_list.append(data)
		json_data = {}
		json_data["robot_info"] = info_list
		with open (file_config + "robot_info.json", "w+") as f:
			f.write(json.dumps(json_data, indent=4))
		res.received_status = True
	except Exception as e:
		print (e)
		rospy.error(str(e))
		res.received_status = False

	return res

def pose_data(req):
	try:
		with open (file_config + "robot_info.json", "r") as f:
			l = json.load(f)
		res = ListHomeResponse()
		res.home_points = str.encode(json.dumps(l['robot_info']))
		return res
	except Exception as e:
		rospy.loginfo(str(e))


if __name__ == "__main__":
	rospy.init_node("home_point_saver")
	rospy.Service ("/home_point", WebCommand, request)
	rospy.Service ("/home_point/load", ListHome, pose_data)
	rospy.Subscriber("/robot_pose", Pose, pose_cb)
	rospy.loginfo("home_point_node_started")
	rospy.spin()