#!/usr/bin/env python

import rospy
import geonav_transform.geonav_conversions as  gc
from sensor_msgs.msg import NavSatFix, Imu
from geometry_msgs.msg import Vector3, Quaternion
import tf
from tf import TransformBroadcaster
from nav_msgs.msg import Odometry
from gps_common.msg import GPSFix
b = TransformBroadcaster()
new_imu = new_gps = False
angular_vel = Vector3()
quat = Quaternion ()
xg2 = yg2 = None
#olat = 55.944904
#olon = -3.186693
olat = 52.2588504856
olon = 5.21565270496
i = 0

def convert_to_gpsfix (navsat):
	gpsfix = GPSFix ()
	gpsfix.latitude = navsat.latitude

def gps_cb(p):
	global new_gps, xg2, yg2,i,olat,olon
	convert_to_gpsfix (p)
	utmy,utmx,utmzone=gc.LLtoUTM(p.latitude,p.longitude)
	print "utmy,utmx",utmx,utmy
        i += 1
        if i == 1:
          olat = p.latitude
          olon = p.longitude
	xg2,yg2=gc.ll2xy(p.latitude,p.longitude,olat,olon)
	print "odom", yg2, -xg2
	#b.sendTransform((yg2,-xg2,0), tf.transformations.quaternion_from_euler(0, 0, 0), rospy.Time.now(), 'gps_odom', 'map')
	b.sendTransform((yg2,-xg2,0), (quat.x, quat.y, quat.z, quat.w), rospy.Time.now(), 'gps_odom', 'map')
	new_gps = True

def imu_cb (msg):
	global new_imu, angular_vel, quat
	new_imu = Imu()
	new_imu = msg
	new_imu.header.stamp = rospy.Time.now()
	new_imu.orientation_covariance = [0, 0, 0, 0, 0, 0, 0, 0, 0.0003]
	imu_pub.publish (new_imu)
	quat = msg.orientation
	angular_vel = msg.angular_velocity
	new_imu = True
	

def update (event):
	global new_gps, new_imu
	if new_gps:# and new_imu:
		odom = Odometry ()
		odom.header.stamp = rospy.Time.now()
		odom.header.frame_id = "map"
		odom.child_frame_id = "base_link"
		odom.pose.pose.position.x = yg2
		odom.pose.pose.position.y = -xg2
		odom.pose.pose.orientation = quat
		odom.twist.twist.angular = angular_vel
		odom.pose.covariance[0] = 0.007
		odom.pose.covariance[7] = 0.007
		odom.pose.covariance[14] = 0.0025
		odom.pose.covariance[21] = 0.0025
		odom.pose.covariance[28] = 0.0025
		odom.pose.covariance[35] = 0.0025
		odom_pub.publish (odom)
		new_gps = new_imu = False
		
def odom_cb (ekf_se_odom):
	b.sendTransform((ekf_se_odom.pose.pose.position.x, ekf_se_odom.pose.pose.position.y, 0), (ekf_se_odom.pose.pose.orientation.x, ekf_se_odom.pose.pose.orientation.y, ekf_se_odom.pose.pose.orientation.z, ekf_se_odom.pose.pose.orientation.w), rospy.Time.now(), 'ekf_se_odom', 'odom')

def map_cb (ekf_se_map):
	b.sendTransform((ekf_se_map.pose.pose.position.x, ekf_se_map.pose.pose.position.y, 0), (ekf_se_map.pose.pose.orientation.x, ekf_se_map.pose.pose.orientation.y, ekf_se_map.pose.pose.orientation.z, ekf_se_map.pose.pose.orientation.w), rospy.Time.now(), 'ekf_se_map', 'map')
if __name__ == "__main__":
	rospy.init_node("gps_to_odom",anonymous="true")
	rospy.Subscriber("navsat/fix",NavSatFix,gps_cb)
	rospy.Subscriber("/imu_data", Imu, imu_cb)
	rospy.Timer (rospy.Duration (0.05), update)
	odom_pub = rospy.Publisher ('/odom_gps',Odometry, queue_size = 10)
	imu_pub = rospy.Publisher ('/imu',Imu, queue_size = 10)
	rospy.Subscriber("/odometry/filtered", Odometry, odom_cb)
	rospy.Subscriber("/odometry/filtered_map", Odometry, map_cb)
	rospy.spin()
