#!/usr/bin/env python
'''
This node is used to switch lauch files between main mqtt app and web app
'''
import roslaunch, rospy, rosnode, json, time, actionlib, tf, tf2_ros, yaml, rosparam
from threading import Thread
from move_base_msgs.msg import MoveBaseAction
from std_msgs.msg import String, Empty, Bool
from geometry_msgs.msg import PoseWithCovarianceStamped
from rospkg import RosPack
rospack = RosPack ()
import time


client = actionlib.SimpleActionClient('/move_base',MoveBaseAction)
uuid = roslaunch.rlutil.get_or_generate_uuid(None, False)
roslaunch.configure_logging(uuid)
launch_nodes = roslaunch.scriptapi.ROSLaunch()
launch_nodes.start()

planner = None
map_name = None
prev_planner = None
april_node = None
launch_map_server_node = None
orginal_nav_node = None
web_control_node = None
sender = True

map_path = rospack.get_path('robo_waiter') + "/scripts/tab/config/"
april_path = rospack.get_path('tag_robo') + "/launch/robot_pub.launch"
orginal_nav = rospack.get_path('robo_waiter') + "/launch/main.launch"
web_control = rospack.get_path('robo_waiter') + "/launch/web_control.launch"

def launch_map_server(name):
	global launch_map_server_node
	node = roslaunch.core.Node("map_server", "map_server", name = "map_server", args = map_path + name + ".yaml")
	launch_map_server_node = launch_nodes.launch(node)

def launch():
	global orginal_nav_node
	orginal_nav_node = roslaunch.parent.ROSLaunchParent(uuid, [orginal_nav])
	orginal_nav_node.start()

def april_launch():
	global april_node
	april_node = roslaunch.parent.ROSLaunchParent(uuid, [april_path])
	april_node.start()

def launch_web_control():
	global web_control_node
	web_control_node = roslaunch.parent.ROSLaunchParent(uuid, [web_control])
	web_control_node.start()

def node_is_launched (node_name):
	reload(rosnode)
	return rosnode.rosnode_ping(node_name, max_count=2, verbose=False)


def shutdown_prev_planner (old_method):

	if node_is_launched ("map_server"):
		launch_map_server_node.stop()
		
	elif old_method == "orginal":
		april_node.shutdown()
		orginal_nav_node.shutdown ()
		clear_tf ()
		log.publish("mqtt_launch_stopped")

	elif old_method == "web_control":
		web_control_node.shutdown ()
		clear_tf ()
		log.publish("web_launch_stopped")


def clear_tf ():
	rospy.loginfo ("Waiting to clear tf old data")
	tf.Transformer().clear ()
	tf2_ros.Buffer().clear()
	tf.TransformListener().clear()
	tf2_ros.BufferCore().clear()
	tf.TransformerROS().clear()
	rospy.loginfo("cleared")


def call(msg):
	global planner, prev_planner, sender, april
	data = msg.data

	if data == "orginal":
		shutdown_prev_planner(prev_planner)
		planner = "orginal"
		prev_planner = "orginal"

	elif data == "web_control":
		shutdown_prev_planner(prev_planner)
		planner = "web_control"
		prev_planner = "web_control"

	elif data == "shutdown":
		log.publish ("shutdown_called")
		rospy.signal_shutdown("shutdown_called")

	sender = False



def shutdown():
	shutdown_prev_planner(prev_planner)
	april_node.shutdown()
	log.publish ("launch node stopped")

	

if __name__ == "__main__":
	rospy.init_node("launch_node")
	rospy.loginfo("launch node started")
	#rospy.sleep(1.0)
	log = rospy.Publisher ("/logger/info",String,queue_size = 1)
	node = rospy.Publisher ("/node/check",String,queue_size = 1)
	rospy.Subscriber("/launch/call",String,call)
	try:
		with open(map_path + "map_name.json") as file:
			data = json.load(file)
			map_name = str(data['name'])
	except:
		rospy.logwarn("map file error")
	rospy.on_shutdown(shutdown)
	time.sleep(1)
	while not rospy.is_shutdown():
		if sender:
			node.publish("ready")
		if planner != None:
			if planner == "orginal":
				rospy.loginfo("org")
				launch_map_server(map_name)
				launch()
				client.wait_for_server()
				april_launch()
				log.publish("mqtt_launch_started")
			elif planner == "web_control":
				launch_web_control()
				log.publish("web_launch_started")
			planner = None





	rospy.spin()