#!/usr/bin/env python
from geometry_msgs.msg import Twist, PoseWithCovarianceStamped, Quaternion
import rospy
from nav_msgs.msg import Odometry
from marvelmind_nav.msg import hedge_pos_ang
from tf.transformations import euler_from_quaternion, quaternion_from_euler
from tf import TransformBroadcaster
import math
from numpy import median
from sensor_msgs.msg import Imu

rospy.init_node ('odom_from_marvel')

#Naviagtion variables

pose_marvel = PoseWithCovarianceStamped ()
starting = True

# x and y distances of the beacon near which gmapping was started- map frame will be here
x_offset = 5.050
y_offset = 0

#new_data variables
new_data = False
new_filtered_odom = False
new_all = False


x_raw = 0
y_raw = 0
filtered_x = 0
filtered_y = 0
all_x = 0
all_y = 0
all_orienation_x = 0
all_orienation_y = 0
all_orienation_z = 0 
all_orienation_w = 1


x_list = []
y_list = []

def linear_pos_cb (linear_pos):
	global x_raw ,y_raw, new_linear_position
	new_linear_position = True
	x_raw = linear_pos.pose.pose.position.x
	y_raw = linear_pos.pose.pose.position.y

def hedge_cb (hedge_pos_ang):
	global new_data, odom, pose_marvel, x_raw, y_raw
	new_data = True
	yaw = hedge_pos_ang.angle
	yaw_radians = (yaw * math.pi) / 180
	#print yaw_radians
	quat = quaternion_from_euler (0, 0, yaw_radians)
	#print quat
	pose_marvel.pose.pose.orientation.x = quat[0]
	pose_marvel.pose.pose.orientation.y = quat[1]
	pose_marvel.pose.pose.orientation.z = quat[2]
	pose_marvel.pose.pose.orientation.w = quat[3]
	if hedge_pos_ang.address == 6:
		x_raw = hedge_pos_ang.x_m
		y_raw = hedge_pos_ang.y_m

def filtered_odom_cb (filtered_odom):
	global filtered_x, filtered_y, new_filtered_odom
	filtered_x = filtered_odom.pose.pose.position.x
	filtered_y = filtered_odom.pose.pose.position.y
	new_filtered_odom =True

def all_odom_cb (all_odom):
	global all_x, all_y, new_all, all_orienation_x, all_orienation_y, all_orienation_z, all_orienation_w, x_list, y_list
	all_x_raw = all_odom.pose.pose.position.x
	all_y_raw = all_odom.pose.pose.position.y
	all_orienation_x = all_odom.pose.pose.orientation.x
	all_orienation_y = all_odom.pose.pose.orientation.y
	all_orienation_z = all_odom.pose.pose.orientation.z
	all_orienation_w = all_odom.pose.pose.orientation.w
	x_list.append (all_x_raw)
	y_list.append (all_y_raw)
	if len (x_list) == 9:
		all_x = median (x_list)
		all_y = median (y_list)
		x_list = []
		y_list = []
	
		new_all =True


def imu_cb (imu):
	imu_msg = Imu ()
	imu_msg.header.stamp = rospy.Time.now ()
	imu_msg.header.frame_id = "base_link"
	imu_msg.orientation = imu.orientation
	imu_msg.angular_velocity = imu.angular_velocity
	imu_msg.linear_acceleration = imu.linear_acceleration
	imu_pub.publish (imu_msg)
	#imu_msg.orientation = imu.orientation

def publish_odom (event):
	global pose_marvel, new_data, starting, new_filtered_odom, new_all
	br = TransformBroadcaster()
	#pose_marvel.pose.pose.orientation.w = 1
	odom = Odometry()
	if pose_marvel.pose.pose.orientation.w == 0.0:
		pose_marvel.pose.pose.orientation.w = 1.0
	if new_filtered_odom:
		br.sendTransform((filtered_x, -filtered_y, 0.0), (pose_marvel.pose.pose.orientation.x,pose_marvel.pose.pose.orientation.y,pose_marvel.pose.pose.orientation.z,pose_marvel.pose.pose.orientation.w), rospy.Time.now(), "hedge_link", "odom")
		new_filtered_odom = False

	if new_all:
		br.sendTransform((-all_x, all_y, 0.0), (all_orienation_x, all_orienation_y, all_orienation_z, all_orienation_w), rospy.Time.now(), "all_link", "odom")
		new_all = False

	if new_data:
		pose_marvel.header.stamp = rospy.Time.now ()
		pose_marvel.header.frame_id = "map"
		x = -1*( x_raw - x_offset)
		y = 1* (y_raw - y_offset)
		pose_marvel.pose.pose.position.x = y
		pose_marvel.pose.pose.position.y = x
		pose_marvel.pose.covariance [0] = 0.02
		pose_marvel.pose.covariance [7] = 0.02
		pose_marvel.pose.covariance [14] = 10000
		pose_marvel.pose.covariance [21] = 10000
		pose_marvel.pose.covariance [28] = 10000
		pose_marvel.pose.covariance [35] = 0.17
		#print pose_marvel.pose.pose.orientation.x
		#print pose_marvel
		pose_pub.publish (pose_marvel)
		if starting == True:
			#initial_pose_pub.publish (pose_marvel)
			starting = False
			print "Publishing Pose from Marvel"
		new_linear_position =  False
		new_th = False

		odom.header.stamp = rospy.Time.now ()
		odom.header.frame_id = "odom"
		odom.pose = pose_marvel.pose
		odom.twist.covariance[0] = 0.02
		odom.twist.covariance[7] = 10000
		odom.twist.covariance[14] = 10000
		odom.twist.covariance[21] = 10000
		odom.twist.covariance[28] = 10000
		odom.twist.covariance[35] = 0.02
		odom.child_frame_id =  "base_lin1"
		odom_pub.publish (odom)
		#print odom.child_frame_id 
		br.sendTransform((y, x, 0.0), (pose_marvel.pose.pose.orientation.x, pose_marvel.pose.pose.orientation.y, pose_marvel.pose.pose.orientation.z, pose_marvel.pose.pose.orientation.w), rospy.Time.now(), odom.child_frame_id, "map")


if __name__ == "__main__":
	
	rospy.Subscriber ('/hedge_pos_ang', hedge_pos_ang, hedge_cb)
	#rospy.Subscriber ('/robot_base/pose', PoseWithCovarianceStamped, linear_pos_cb)
	rospy.Subscriber ('/marvel/odometry/filtered', Odometry, filtered_odom_cb)
	rospy.Subscriber ('/all/odometry/filtered', Odometry, all_odom_cb)

	#rospy.Subscriber ('/sensors/imu', Imu, imu_cb)
	imu_pub = rospy.Publisher("/imu_new", Imu,queue_size=10)

	odom_pub = rospy.Publisher("/odom_marvel", Odometry,queue_size=10)
	pose_pub = rospy.Publisher("/pose_marvel", PoseWithCovarianceStamped ,queue_size=10)
	rospy.Timer (rospy.Duration(0.05), publish_odom)
	rospy.spin()
