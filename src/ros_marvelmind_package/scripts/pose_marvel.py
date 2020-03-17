#!/usr/bin/env python
from geometry_msgs.msg import Twist, PoseWithCovarianceStamped, Quaternion
from std_msgs.msg import Float32
import rospy
from numpy import median
from marvelmind_nav.msg import beacon_pos_a
from tf import TransformBroadcaster
from sensor_msgs.msg import Imu
from math import sin, cos, pi


rospy.init_node ('pose_from_marvel')
pose_marvel = PoseWithCovarianceStamped ()
number_of_beacons = 4
initiator_address = None
x_curr = 0
y_curr = 0
new_linear_position = False
new_imu_data = False
new_th = False
x_init = None
y_init = None
x_list = []
y_list = []
x_raw = 0
y_raw = 0
temp = 0
th = 0
pre_dataAngle = 0.0
dataAngle = 0.0
def linear_pos_cb (linear_pos):
	global odom, x_curr, y_curr, new_linear_position, x_init, y_init, start, x_list, y_list ,x_raw ,y_raw
	new_linear_position = True


	#if x_init == None and y_init == None:
		#x_init = linear_pos.pose.pose.position.x
		#y_init = linear_pos.pose.pose.position.y
	x_raw = linear_pos.pose.pose.position.x# - x_init
	y_raw = linear_pos.pose.pose.position.y# - y_init

	'''x_list.append (x_raw)
	y_list.append (y_raw)
	if len (x_list) == 5 and len (y_list) == 5:
		try:
			x_curr = median (x_list)
			y_curr = median (y_list)
			print x_curr, y_curr
		except Exception,e:
			print e
		x_list = []
		y_list = []'''
	#odom.pose.pose.position.x = x_curr
	#odom.pose.pose.position.y = y_curr

def yaw_cb(yaw):
    #############################################################################
        #euler=euler_from_quaternion(imu.orientation.x, imu.orientation.y, imu.orientation.z, imu.orientation.w)
        temp=yaw.data
	update(temp)
def update(temp):
	global th, new_th 
	try:
		dataAngle = -1.0 * (temp)
		# print dataAngle
	except Exception as e:
		print(e)
            

	# this approximation works (in radians) for small angles
	th = ( dataAngle - pre_dataAngle) /2
	# calculate velocities

	if( th != 0):
		th = th + th


	new_th = True


def imu_cb (imu_msg):
	global pose_marvel, new_imu_data
	new_imu_data = True
	pose_marvel.pose.pose.orientation = imu_msg.orientation
	#odom.twist.twist.angular = imu_msg.angular_velocity


def publish_odom (event):
	global odom, new_linear_position, pose_marvel, new_imu_data
	br = TransformBroadcaster()
	if new_linear_position and new_th:
		pose_marvel.header.stamp = rospy.Time.now ()
		pose_marvel.header.frame_id = "map"
		pose_marvel.pose.pose.position.x = - x_raw + 2.98
		pose_marvel.pose.pose.position.y = -1*(- y_raw - 3.316)
		pose_marvel.pose.covariance [0] = 0.02
		pose_marvel.pose.covariance [7] = 0.05
		pose_pub.publish(pose_marvel)
		#initial_pose_pub.publish (pose_marvel)
		new_linear_position =  False
		new_th = False
	#quaternion = Quaternion()
	#quaternion = pose_marvel.pose.pose.orientation
	quaternion = Quaternion()
        quaternion.x = 0.0
        quaternion.y = 0.0
        quaternion.z = sin( th / 2 )
        quaternion.w = cos( th / 2 )
        print quaternion.z
	#br.sendTransform((2.98, -3.316, 0.0), (0.0, 0.0, 0.0, 1.0), rospy.Time.now(), "initiator", "odom")
	#br.sendTransform((-x_raw, -y_raw, 0.0), (0.0, 0.0, 0.0, 1.0), rospy.Time.now(), "hedge", "initiator")
	#br.sendTransform((1*(-x_raw + 2.98), -1*(-y_raw - 3.316), 0.0), (pose_marvel.pose.pose.orientation.x, pose_marvel.pose.pose.orientation.y, pose_marvel.pose.pose.orientation.z, pose_marvel.pose.pose.orientation.w), rospy.Time.now(), "hedge", "map")
	br.sendTransform((1*(-x_raw + 2.98), -1*(-y_raw - 3.316), 0.0), (quaternion.x, quaternion.y, quaternion.z, quaternion.w), rospy.Time.now(), "hedge", "map")
def init_pose_pub_cb(event):
	global pose_marvel
	initial_pose_pub.publish (pose_marvel)
def initiator_beacon_cb(beacons_position):
	global initiator_address
	if initiator_address == None:
		if beacons_position.x_m == 0:
			if beacons_position.y_m == 0:
				if beacons_position.z_m == 0:
					initiator_address = beacons_position.address
					print "initiator_address", initiator_address


if __name__ == '__main__':
	print "Publishing Odom, Twist"
	rospy.Timer (rospy.Duration(0.3), publish_odom)
	#rospy.Timer (rospy.Duration(1), init_pose_pub_cb)
	rospy.Subscriber ('/beacons_pos_a', beacon_pos_a, initiator_beacon_cb)
	rospy.Subscriber ('/robot_base/pose', PoseWithCovarianceStamped, linear_pos_cb)
	rospy.Subscriber ('/sensors/imu', Imu,  imu_cb)
	#rospy.Subscriber("/orientation", Float32, yaw_cb)
	pose_pub = rospy.Publisher("/pose_marvel", PoseWithCovarianceStamped ,queue_size=10)
	#initial_pose_pub = rospy.Publisher("/initialpose", PoseWithCovarianceStamped ,queue_size=10)
	rospy.spin ()



