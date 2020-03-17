#!/usr/bin/env python
import os
import time
import json
import configparser
import rospy, rospkg, actionlib
from playsound import playsound as ps

from logger import logger
from client import Client
from myserial import Serial
from audio import Audio
from myname import getClientId

from std_msgs.msg import String, Bool
from move_base_msgs.msg import MoveBaseAction
from geometry_msgs.msg import Twist
from robo_waiter.msg import Mile
from robo_waiter.srv import Tl_gl, Tl_glResponse, Park, ParkResponse
from patrol_planner.srv import GPSGoal, GPSGoalResponse

rospack = rospkg.RosPack()
client = actionlib.SimpleActionClient('/move_base',MoveBaseAction)

class Robot:


	config_file_path = rospack.get_path('robo_waiter') + "/scripts/" + "tab/"

	cmd = rospy.Publisher ("/robot_base/cmd_vel", Twist, queue_size = 1)
	pub = rospy.Publisher ("/arduino/inbound", String, queue_size = 1)
	obs = rospy.Publisher ("/arduino/obstacle", String, queue_size = 1)
	home = rospy.Publisher ("/again_home", Bool, queue_size = 1)
	file = rospy.Publisher ("/file_init", Bool, queue_size = 1)
	target = rospy.Publisher ("/target_table", Mile, queue_size = 1)
	launch = rospy.Publisher ("/launch/call", String, queue_size = 1)
	

	isParkingArea = True
	isDelivered = False
	isInPickup = False
	isDelivering = False
	inObstacle = False
	isManual = False
	isManual = False
	tableDirection = ""
	tableName = ""
	tableNumber = 0
	tableDuration = 0
	min_x = 0.1
	max_x = 1.5
	min_z = 0.1
	max_z = 1.5
	ard = String()
	vel = Twist()


	@staticmethod
	def name(req):
		rep = ParkResponse()
		rep.reply = getClientId()
		return rep


	@staticmethod
	def translate(value, leftMin, leftMax, rightMin, rightMax):
	    # Figure out how 'wide' each range is
	    leftSpan = leftMax - leftMin
	    rightSpan = rightMax - rightMin

	    # Convert the left range into a 0-1 range (float)
	    valueScaled = float(value - leftMin) / float(leftSpan)

	    # Convert the 0-1 range into a value in the right range.
	    return rightMin + (valueScaled * rightSpan)


	@staticmethod
	def moveTo(payload=None):
		#global pub
		if payload:
			logger.info("Moving to table : "+str(payload['table']))
			with open(Robot.config_file_path + "config/" + "table_action.json",'r') as json_file:
				data = json.load(json_file)
				for p in data['rfids']:
					try:
						if(int(payload['table']) == int(p['tableNumber'])):
							Robot.tableNumber == p['tableNumber']
							Robot.tableDirection = str(p['direction'])
							Robot.tableName = str(p['name'])
							Robot.tableDuration = int(p['duration'])
							if (Robot.tableName != None) and Robot.isInPickup:
								Robot.isParkingArea = False
								Robot.isInPickup = False
								data = {}
								data['command'] = "START"
								Robot.ard.data = str.encode(json.dumps(data))
								Robot.pub.publish(Robot.ard)
					except Exception as e:
						print e
						logger.error(e)

		else:
			logger.error("Need payload for moving")

	@staticmethod
	def node_call():
		try:
			rospy.Subscriber("/obstacle/det", String, Robot.obstacle)
			rospy.Subscriber("/arduino/inbound", String, Robot.ard_check)
			rospy.Subscriber("/arduino/outbound", String, Robot.arduino)
			rospy.Subscriber("/table/delivery", Bool, Robot.delivery)
			rospy.Service("/robot_name",Park, Robot.name)
			rospy.Subscriber("/logger/info", String, Robot.logger_call) #other nodes communicate with app
		except Exception as e:
			print(e)
			logger.error("Unable to start_init_node")			

	@staticmethod
	def logger_call(msg):
		logger.info(msg.data)

	@staticmethod
	def goHome(payload=None):
		try:
			dt = Bool()
			dt.data=True
			Robot.home.publish(dt)
			if payload == "return":
				Robot.update_status("return to pickup_point")
			else:
				Robot.update_status("Delivered. Returning Home")
			Robot.isDelivered = True
			Robot.isDelivering = False
		except Exception as e:
			print(e)
			logger.error("Unable to set robot to go home")

	@staticmethod
	def goPickup_point():
		try:
			dt = Bool()
			dt.data=True
			Robot.home.publish(dt)
		except Exception as e:
			print(e)
			logger.error("Unable to set robot to first pickup")


	@staticmethod
	def goManual(payload=None):
		if Robot.isManual:
			if payload != None:
				angle = int(payload['angle'])
				speed = int(payload['strength'])
				if (speed == 0):
					Robot.vel.linear.x = 0
					Robot.vel.angular.z = 0
					Robot.cmd.publish(Robot.vel)
				else:
					x = Robot.translate(speed, 1, 100, Robot.min_x, Robot.max_x)
					z = Robot.translate(speed, 1, 100, Robot.min_z, Robot.max_z)

					if (80<=angle<=100):  #forward
						Robot.vel.linear.x = x
						Robot.vel.angular.z = 0
						Robot.cmd.publish(Robot.vel)
					elif (0<=angle<=10): #inplace right rotation
						Robot.vel.linear.x = 0
						Robot.vel.angular.z = -z
						Robot.cmd.publish(Robot.vel)
					elif (170<=angle<=180): #inplace left rotation
						Robot.vel.linear.x = 0
						Robot.vel.angular.z = z
						Robot.cmd.publish(Robot.vel)
					elif (101<=angle<=169): #pure left rotation
						Robot.vel.linear.x = x
						Robot.vel.angular.z = z
						Robot.cmd.publish(Robot.vel)
					elif (11<=angle<=79): #pure right rotation
						Robot.vel.linear.x = x
						Robot.vel.angular.z = -z
						Robot.cmd.publish(Robot.vel)
					elif (260<=angle<=290): #pure right rotation
						Robot.vel.linear.x = -x
						Robot.vel.angular.z = 0
						Robot.cmd.publish(Robot.vel)
			else:
				logger.error("payload error in manual mode")


	@staticmethod
	def onStart(payload=None):
		Robot.update_status("first pickup")
		data = {}
		data['command'] = "BOOTED"
		Robot.ard.data = str.encode(json.dumps(data))
		Robot.pub.publish(Robot.ard)
		rospy.wait_for_message("/node/check1",String)
		Robot.goPickup_point()

	@staticmethod
	def gmapping(data=None):
		try:
			Robot.update_status("web_control")
			logger.info("gmapping_node started")
			Robot.restart("1")
			Robot.launch.publish("web_control")
		except:
			logger.error("gmapping does not strated")


	@staticmethod
	def obstacle(msg):

		try:
			if Robot.isDelivering or Robot.isDelivered:

				if Robot.inObstacle:
					data = {}
					data['command'] = "OBSTACLE_NO"
					Robot.ard.data = str.encode(json.dumps(data))
					Robot.pub.publish(Robot.ard)
					if not Robot.isDelivered:
						Robot.update_status("Running to Table "+str(Robot.tableNumber))
					else:
						Robot.update_status("Delivered. Returning Home")
					Robot.inObstacle = False
				else:
					Robot.update_status("Obstacle detected")
					Robot.inObstacle = True
					data = {}
					data['command'] = "OBSTACLE_DET"
					Robot.ard.data = str.encode(json.dumps(data))
					Robot.pub.publish(Robot.ard)
					try:
						if not Robot.isParkingArea:
							ps(Robot.config_file_path + "/audio/obstacle_voice.wav")
					except Exception as e:
						logger.error("Unable to play audio.\n"+str(e))
		except Exception as e:
			logger.error("Unable to process obstacle message.\n"+str(e))

	@staticmethod
	def obs_call(payload=None):
		if Robot.isDelivering or Robot.isDelivered:

			if payload == "true":
				dr = String()
				dr.data="obstacle"
				Robot.obs.publish(dr)
			elif payload == "false":
				dr = String()
				dr.data="nothing"
				Robot.obs.publish(dr)


	@staticmethod
	def estop(payload=None):
		Robot.update_status("Robot stopped in parking area")

	@staticmethod
	def handle_data(data):
		try:
			fn = {
				"STARTED": Robot.started,
				"SHUTDOWN": Robot.shutdown,
				"STOPPED": Robot.stopped,
				"MANUAL": Robot.hw_manual,
				"MOTORSTOP": Robot.estop,
				"DELIVERED": Robot.goHome,
				"BATTERY": Robot.set_battery,
				"OBSTACLE": Robot.obs_call,
				"NOMANUAL": Robot.nomanual,
				"GMAP": Robot.gmapping
			}[data]
			return fn
		except Exception as e:
			logger.error("Error!!")

	@staticmethod
	def shutdown(data=None):
		Robot.update_status("Robot shutown")
		Robot.launch.publish("shutown")
		time.sleep(5)
		os.system("shutdown /s /t 1")

	@staticmethod
	def hw_manual(data):

		if not Robot.isManual:
			Robot.update_status("HW_Manual")

	@staticmethod
	def manual(data):

		if data['isManual']:
			one = True
			Robot.isManual = True
			dr = String()
			dr.data="manual"
			Robot.obs.publish(dr)
			Robot.update_status("Manual")
		else:
			if one:
				one = False
				Robot.nomanual("d")

	@staticmethod
	def nomanual(data):
		Robot.isManual = False
		dr = String()
		dr.data="nomanual"
		Robot.obs.publish(dr)
		Robot.goHome("return")

	@staticmethod
	def restart(data=None):
		logger.info("Resetting variables")
		isParkingArea = True
		isDelivered = False
		isInPickup = False
		isDelivering = False
		inObstacle = False
		isManual = False
		isManual = False

	@staticmethod
	def node_start(data=None):
		try:
			Robot.update_status("Booting..")
			logger.info("node started")
			rospy.wait_for_message ("/node/check",String)
			Robot.launch.publish("orginal")
			Robot.file_check()
		except Exception as e:
			logger.error(e)

	@staticmethod
	def file_check(payload=None):
		try:
			open (Robot.config_file_path + "config/" + "table_action.json")
			open (Robot.config_file_path + "config/" + "waypoint.json")
			open (Robot.config_file_path + "config/" + "milestone.json")
			open (Robot.config_file_path + "config/" + "table_points.json")
			open (Robot.config_file_path + "config/" + "robot_info.json")
			open (Robot.config_file_path + "config/" + "pickup_point.json")
			open (Robot.config_file_path + "config/" + "parking_point.json")
			open (Robot.config_file_path + "config/" + "apriltag_info.json")
			#client.wait_for_server()
			Robot.onStart()
		except IOError as e:
			logger.error(str(e))
			Robot.update_status("file read error")


	@staticmethod
	def started(data):
	    logger.info("Started robot")
	    if Robot.isParkingArea is False:
	    	Robot.obs.publish("table")
	    	Robot.isDelivered = False
	        Robot.isDelivering = True
	        Robot.update_status("Running to Table "+str(Robot.tableNumber))
	        table = Mile()
	        table.table_name = Robot.tableNumber
	        table.table_direction = Robot.tableDirection
	        table.table_duration = Robot.tableDuration
	        Robot.target.publish(table)
	        

	    else:
	        logger.info("CONNECTED")


	@staticmethod
	def stopped(data):
		rospy.loginfo("stopped")
		Robot.update_status("CONNECTED")


	@staticmethod
	def arduino(msg):
		try:
			j = json.loads(msg.data)
			print(j)

			fn = Robot.handle_data(j['reply'])
			print "function"
			if 'isManual' in j:
				fn(j)
			elif 'param' in j:
				print "param"
				fn(j['param'])
			else:
				print "started"
				fn("STARTED")
		except Exception as e:
			print(e)

	@staticmethod
	def ard_check(msg):
		k = json.loads(msg.data)

		if k['command'] == "PARKING":
			logger.info("Inside Parking area. Turning off sounds")
			#Robot.update_status("Inside parking area")
			print("inside parking")
			dr = String()
			dr.data="parking"
			Robot.obs.publish(dr)
			Robot.update_status("inParking")
			Robot.isParkingArea = True
			

		elif k['command'] == "STOP":
			Robot.update_status("Pickup point")
			logger.info("Reached Pickup point. Resetting defaults")
			dr = String()
			dr.data="pickup"
			Robot.obs.publish(dr)
			Robot.isParkingArea = False
			Robot.isInPickup = True
			Robot.isDelivered = False
			Robot.isDelivering = False
	@staticmethod
	def delivery(msg):

		if msg.data:
			try:
				Robot.isDelivering = False
				logger.info("Delivering")
				Robot.update_status("Delivering Food")
				data = {}
				data['command'] = "TABLE"
				Robot.ard.data = str.encode(json.dumps(data))
				Robot.pub.publish(Robot.ard)
				audioOptions = Audio.getOptions()
				fileName = Audio.default
				if audioOptions != None:
					fileName = audioOptions['audio']
					logger.info("Setting audio file to "+str(fileName))
				ps(fileName)
				Audio.checkAndReset(audioOptions)
			except Exception as e:
				logger.error("Unable to process delivery receipt."+str(e))


	@staticmethod
	def setTime(payload):
		logger.info("Received time update command")


	@staticmethod
	def set_battery(message):
		print (type(message))
		print (message)
		msg = {
			'clientId': getClientId(),
			'battery': str(message)
			}
		msg_json = json.dumps(msg)
		Robot.publish_message("notify-agent/battery", msg_json)

	@staticmethod
	def publish_message(topic, data):
	    logger.info("sending data to mqtt")
	    try:
	        Client.getInstance().publish(topic, data)
	    except Exception as e:
	        logger.error(e)

	@staticmethod
	def update_status(message):
	    msg = {
	        'clientId': getClientId(),
	        'status': message
	    }
	    msg_json = json.dumps(msg)
	    Robot.publish_message("notify-agent/status", msg_json)



