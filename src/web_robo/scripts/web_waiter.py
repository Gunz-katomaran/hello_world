#!/usr/bin/env python
import roslaunch, rospy, rosnode, json, time, actionlib, tf, tf2_ros, yaml, rosparam
from threading import Thread
from move_base_msgs.msg import MoveBaseAction
from std_msgs.msg import String, Empty, Bool
from geometry_msgs.msg import PoseWithCovarianceStamped
from os import listdir, mkdir, path
from datetime import datetime
from web_robo.srv import ListDirectory, ListDirectoryResponse, WebCommand, WebCommandRequest, WebCommandResponse
from rospkg import RosPack
rospack = RosPack ()


client = actionlib.SimpleActionClient('/move_base',MoveBaseAction)
home_point_node = None
new_planner = None
launch_gmapping_node = None
prev_method = None
map_saver = False
launch_map_server_node = None
map_server_name = None
start_no_goal_navg = False
launch_no_goal_nvg_node = None
tag_node = None
save_map_as = None
auth_id = ""
initialpose = False
april = None
current_milestone_list = []
uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
roslaunch.configure_logging(uuid)
launch_nodes = roslaunch.scriptapi.ROSLaunch()
launch_nodes.start()

tag_node_path = rospack.get_path('tag_robo') + "/launch/global_tag_saver.launch"
no_goal_nav = rospack.get_path('robot_base_navigation') + "/launch/robo_waiter_web.launch"
gmapping = rospack.get_path('robot_base_navigation') + "/launch/gmapping_slam.launch"
file_saver = rospack.get_path('robo_waiter') + "/scripts/tab/config/"
map_dir = rospack.get_path('robot_base_navigation') + "/maps/"

def april_launch():
	global tag_node
	tag_node = roslaunch.parent.ROSLaunchParent(uuid, [tag_node_path])
	tag_node.start()

def launch_no_goal_navigation():
	global launch_no_goal_nvg_node
	launch_no_goal_nvg_node = roslaunch.parent.ROSLaunchParent(uuid, [no_goal_nav])
	launch_no_goal_nvg_node.start()

def launch_gmapping():
	global launch_gmapping_node	
	launch_gmapping_node = roslaunch.parent.ROSLaunchParent(uuid, [gmapping])
	launch_gmapping_node.start()

def launch_map_saver(map_name):
	node = roslaunch.core.Node("map_server", "map_saver", name = "map_saver", args = "-f " + file_saver + str(map_name), output = "screen")
	process = launch_nodes.launch(node)

def launch_home_point():
	node = roslaunch.core.Node("web_robo", "home_point_saver.py", name = "home_point", output = "screen")
	process = launch_nodes.launch(node)


def launch_pose_publisher():
	node2 = roslaunch.core.Node("robot_pose_publisher", "robot_pose_publisher", name = "robot_pose_publisher", output = "screen")
	robot_pose_publisher = launch_nodes.launch(node2)


def launch_map_server(map_name, ns):
	global launch_map_server_node
	node = roslaunch.core.Node("map_server", "map_server", name = "map_server", namespace = ns, args = file_saver + map_name + ".yaml")
	launch_map_server_node = launch_nodes.launch(node)

	

def node_is_launched (node_name):
	try:
		reload(rosnode)
		return rosnode.rosnode_ping(node_name, max_count=2, verbose=False)
	except:
		return False

def shutdown_prev_planner (old_method):

	if node_is_launched("home_point"):
		rosnode.kill_nodes (tuple(["home_point"]))

	if node_is_launched ("map_server"):
		#launch_map_server_node.stop()
		rosnode.kill_nodes (tuple(["map_server"]))
		
	if old_method == "gmapping":
		launch_gmapping_node.shutdown ()
		clear_tf ()
		publish_status("Shutdown","Gmapping")

	elif old_method == "normal":
		launch_no_goal_nvg_node.shutdown ()
		clear_tf ()
		publish_status("Shutdown","Normal_Navigation")



def home_point(data):
	rospy.wait_for_service('/home_point', timeout=3)
	try:
		client = rospy.ServiceProxy ("/home_point", WebCommand)
		response = client(command = data)
		if not response.received_status:
			publish_error("SaveError home_point")
			rospy.logfatal ("home_point Not Saved")
		else:
			rospy.loginfo ("Saved home_point")
			publish_saved_status("home_point", data)
	except rospy.ServiceException as e:
		rospy.logwarn ("Service call failed: %s", e)

def file_check(name):
	check_dir = listdir(file_saver)
	if name in check_dir:
		return True
	else:
		return False


def save_map_with_origin (map_path):
	rospy.wait_for_service('/map_saver', timeout=3)
	try:
		client = rospy.ServiceProxy("/map_saver", MapSaver)
		response = client (map_name = map_path)
		if not response.success:
			publish_error("SaveError Map")
			rospy.logfatal ("Map Not saved")
		#else:
		#	publish_saved_status("Map",map_path)
	except rospy.ServiceException as e:
		rospy.logwarn ("Service call failed: %s", e)


def check_auth (auth):
	"""md5_decoded =  (hashlib.md5 (str(auth).encode())).hexdigest()
	current_auth_value = auth_id + (time.strftime("%H")) + auth_id
	if md5_decoded == current_auth_value:
		return True
	else:
		return False"""
	return True



def clear_tf ():
	rospy.loginfo ("Waiting to clear tf old data")
	reset_time.publish()
	tf.Transformer().clear ()
	tf2_ros.Buffer().clear()
	tf.TransformListener().clear()
	tf2_ros.BufferCore().clear()
	tf.TransformerROS().clear()
	rospy.loginfo("cleared")

def map_exists (map_name):
	if map_name + ".yaml" in listdir (map_dir):
		return True
	else:
		publish_name_error("site", site_name)
		return False


def publish_name_error (cause, value):
	fb_json = {}
	fb_json ["data"] = ["No " + cause + " called " + value + " exists." ]
	fb_json ["status"] = "false"
	web_feedback.publish (json.dumps (fb_json))

def publish_error(data):
	fb_json = {}
	fb_json ["data"] = [data]
	fb_json ["status"] = "false"
	web_feedback.publish (json.dumps (fb_json))

def publish_saved_status (saved, value):
	fb_json = {}
	fb_json ["data"] = ["Saved " + saved + " " + value]
	fb_json ["status"] = "true"
	web_feedback.publish (json.dumps (fb_json))

def publish_status (action, value):
	fb_json = {}
	if value.startswith("Map_Server") or value.startswith("Goal") or (value.startswith("Path ") and action == "Loaded"):
		value, name = value.split(" ")
		fb_json ["data"] = [action + " " + value + " " + name]	
	else:
		fb_json ["data"] = [ action + " " + value]
	fb_json ["status"] = "true"
	web_feedback.publish (json.dumps (fb_json))



def web_command_cb (req):
	global map_saver, prev_method, save_map_as, new_planner, map_server_name, home_point_node, april
	web_command_dict = json.loads (req.command)
	if not check_auth (web_command_dict ["authorization"] ):
		rospy.logfatal ("Invalid Authorization")
	else:
		if web_command_dict ["mode"] == "path_recording":
			if web_command_dict ["type"] == "request":
				if web_command_dict ["command"]["command"] == "navigation":
					if web_command_dict ["command"]["process"] == "start":
						map_nm = web_command_dict ["command"]["map_name"]
						#start the navigation launch file
						print map_nm
						new_planner = "normal"
						map_server_name = str(map_nm)
						client.wait_for_server()
						prev_method = "normal"
					elif web_command_dict ["command"]["process"] == "exit":
						# end the navigation launch file
						shutdown_prev_planner (prev_method)
						prev_method = None
					else:
						publish_error("process_json failed")
				elif web_command_dict ["command"]["command"] == "april_tag":
					if web_command_dict ["command"]["process"] == "start":
						april = "start"
					elif web_command_dict ["command"]["process"] == "exit":
						april = "end"
						# to end the apriltag
					else:
						publish_error("process_json failed")
				else:
					publish_error("command_json failed")
			elif web_command_dict ["type"] == "save":
				if web_command_dict ["command"]["command"] == "milestone":
					data = web_command_dict ["command"]["data"]
					d = {}
					d['milestone'] = data
					with open (file_saver + "milestone.json",'w+') as f:
						f.write(json.dumps(d,indent=4))
						if file_check("milestone.json"):
							publish_status ("Saved", "milestone")
						else:
							publish_error("milestone failed")

				elif web_command_dict ["command"]["command"] == "waypoint":
					data = web_command_dict ["command"]["data"]
					d = {}
					d['waypoint'] = data
					with open (file_saver + "waypoint.json",'w+') as f:
						f.write(json.dumps(d,indent=4))
						if file_check("waypoint.json"):
							publish_status ("Saved", "waypoint")
						else:
							publish_error("waypoint failed")							

				elif web_command_dict ["command"]["command"] == "table":
					data = web_command_dict ["command"]["data"]
					d = {}
					d['table_points'] = data
					with open (file_saver + "table_points.json",'w+') as f:
						f.write(json.dumps(d,indent=4))
						if file_check("table_points.json"):
							publish_status ("Saved", "table_point")
						else:
							publish_error("table_point failed")
				elif web_command_dict ["command"]["command"] == "pickup_point":
					data = web_command_dict ["command"]["data"]
					d = {}
					d['pickup_point'] = data
					with open (file_saver + "pickup_point.json",'w+') as f:
						f.write(json.dumps(d,indent=4))
						if file_check("pickup_point.json"):
							publish_status ("Saved", "pickup_point")
						else:
							publish_error("pickup_point failed")
				elif web_command_dict ["command"]["command"] == "parking_point":
					data = web_command_dict ["command"]["data"]
					d = {}
					d['parking_points'] = data
					with open (file_saver + "parking_point.json",'w+') as f:
						f.write(json.dumps(d,indent=4))
						if file_check("parking_point.json"):
							publish_status ("Saved", "parking_point")
						else:
							publish_error("parking_point failed")
				elif web_command_dict ["command"]["command"] == "home_point":
					data = web_command_dict ["command"]["data"]
					print "home_point"
					home_point(str(data))
					# to save the home_point of every robot
				else:
					publish_error("command_json failed")
			else:
				publish_error("type_json failed")

		elif web_command_dict ["mode"] == "gmapping":
			if (web_command_dict ["command"]["gmapping_command"] == "start") or (web_command_dict ["command"]["gmapping_command"] == "reset"):
				shutdown_prev_planner (prev_method)		
				new_planner = "gmapping"
				map_saver = True
				client.wait_for_server()
				prev_method = "gmapping"
			elif web_command_dict ["command"]["gmapping_command"] == "exit":
				shutdown_prev_planner (prev_method)
				prev_method = None
			elif web_command_dict ["command"]["gmapping_command"] == "save":
				map_name = web_command_dict ["command"]["map_name"]
				save_map_as = map_name
			else:
				publish_error("command_json failed")

		elif web_command_dict ["mode"] == "node_exit":
			shutdown_prev_planner (prev_method)
			publish_status("Exit",  "Overallnode")
			rospy.signal_shutdown("user_exit")

		else:
			publish_error("mode_json failed")


def redirect(req):
	reply = WebCommandResponse()
	reply.received_status = True
	process = Thread( target = web_command_cb, args = [req])
	process.start()
	return reply

def directory_service_cb (req):
	print 'service called'
	request = req.request
	dir_list = listdir (file_saver)
	for i in dir_list:
		if i is endswith(".pgm"):
			dir_list [i] = dir_list [i].partition(".")[0]
	ulist = []
	[ulist.append(x) for x in dir_list if x not in ulist]
	a = ListDirectoryResponse ()
	a.list_of_files = ulist
	return a

def shutdown():
	launch.publish("orginal")
	rospy.loginfo("web_waiter shutdown")


if __name__ == "__main__":
	rospy.init_node('web_waiter', anonymous=True)
	init_pub = rospy.Publisher ("/initialpose", PoseWithCovarianceStamped, queue_size=10)
	reset_time = rospy.Publisher("/reset_time", Empty, queue_size = 10)
	launch = rospy.Publisher("/launch/call", String, queue_size = 1)
	web_feedback = rospy.Publisher ("/web/robot_feedback", String, queue_size = 10)
	rospy.Service ("/web_nav", WebCommand, redirect)
	rospy.Service("/web/get_list", ListDirectory, directory_service_cb)
	rospy.on_shutdown(shutdown)
	time.sleep(1)
	launch_pose_publisher()
	publish_status ("Robot", "Started")
	rospy.loginfo("Ready to start")
	while not rospy.is_shutdown():
		try:

			if map_server_name != None:
				print "map_server started"
				launch_map_server (map_server_name, "")
				#publish_status("Launched" , "Map_Server "+ map_server_name.rsplit('/',1)[0])
				map_server_name = None


			if new_planner != None:
				if new_planner == "normal":
					print "normal"
					launch_no_goal_navigation()
					launch_home_point()
					client.wait_for_server()
					publish_status("Launched",  "path_recording")
				elif new_planner == "gmapping":
					launch_gmapping()
				client.wait_for_server()
				if new_planner == "gmapping":
					publish_status("Launched",  "Gmapping")
				new_planner = None
				continue

			

			if initialpose:
				get_init_pose ()
				initialpose = False

			if april != None:
				if april == "start":
					april_launch()
					publish_status("Launched",  "Apriltag")
				elif april == "end":
					tag_node.shutdown()
					publish_status("Shutdown",  "Apriltag")
				april = None



			if save_map_as != None:
				launch_map_saver (save_map_as)
				time.sleep (3)
				while node_is_launched ("map_saver"):
					pass
				if map_exists(save_map_as):
					publish_saved_status("Map",save_map_as)
				else:
					publish_error ("SaveError Map")
				save_map_as = None

		except Exception as e:
			print (str(e))
		
	rospy.spin()