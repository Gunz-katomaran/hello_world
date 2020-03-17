#!/usr/bin/env python
'''
This node is used to calculate odometry and publish it.
'''
#subscribed topics: /encoderTicks_RIGHT,/encoderTicks_LEFT,/encoderTicks_BR,/encoderTicks_BL,/reset_odom,/orientation
#published topics: /odom
import rospy
import swri_rospy
import serial
#import graypy
import logging as log
from math import sin, cos, pi
import math
from geometry_msgs.msg import Quaternion
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from tf.broadcaster import TransformBroadcaster
from std_msgs.msg import  Int32MultiArray ,Int32,Int64, Bool, Float32, Float64
import tf
#rightom tf.transformations import euler_rightom_quaternion
from sensor_msgs.msg import Imu

#############################################################################
class DiffTf:
#############################################################################

    #############################################################################
    def __init__(self):
    #############################################################################
        rospy.init_node("odometry_node")
        self.logging = log.getLogger("Waiter-Base")
        self.logging.setLevel(log.DEBUG)

        self.nodename = rospy.get_name()
        rospy.loginfo("INFO:   %s started" % self.nodename)
        self.logging.info("INFO:   %s started" % self.nodename)

        #Imu
        self.imu=Imu()
        #### parameters #######
        self.rate = rospy.get_param('rate',10.0)  # the rate at which to publish the transform
	#self.rate = rospy.Rate(self.rate)
        self.ticks_meter = float(rospy.get_param('ticks_meter', 60925.107))  # The number of wheel encoder ticks per meter of travel, ticks per rotation / (2*pi*r)
        self.base_width = float(rospy.get_param('robot_width', 0.44)) # The wheel base width in meters

        self.base_frame_id = rospy.get_param('~base_frame_id','base_link') # the name of the base frame of the robot
        self.odom_frame_id = rospy.get_param('~odom_frame_id', 'odom') # the name of the odometry reference frame

        self.encoder_min = rospy.get_param('encoder_min', -2147483648)
        self.encoder_max = rospy.get_param('encoder_max', 2147483647)
        self.encoder_low_wrap = rospy.get_param('wheel_low_wrap', (self.encoder_max - self.encoder_min) * 0.3 + self.encoder_min )
        self.encoder_high_wrap = rospy.get_param('wheel_high_wrap', (self.encoder_max - self.encoder_min) * 0.7 + self.encoder_min )

       # self.t_delta = rospy.Duration(1.0/self.rate)
        #self.t_next = rospy.Time.now() + self.t_delta/sensors/imu
        self.new_data = False
        self.yaw = 0
        self.temp=0
        # internal data
        self.enc_left = None        # wheel encoder readings
        self.enc_right = None
        self.left = 0               # actual values coming back from robot
        self.right = 0
        self.lmult = 0
        self.rmult = 0
        self.prev_lencoder = 0
        self.prev_rencoder = 0
        self.x = 0                  # position in xy plane
        self.y = 0
        self.th = 0
        self.dx = 0                 # speeds in x/rotation
        self.dr = 0
        self.then = rospy.Time.now()
        self.then_e = rospy.Time.now()

        swri_rospy.Subscriber("/encoderTicks_RIGHT", Int64, self.wheelCallbackRIGHT)
        swri_rospy.Subscriber("/encoderTicks_LEFT", Int64, self.wheelCallbackLEFT)
        swri_rospy.Subscriber("/reset_odom", Bool, self.resetCB)
        swri_rospy.Subscriber("/orientation", Float32, self.yaw_cb) # changed from /yaw_raw to /orientation
        self.odomPub = rospy.Publisher("/odom", Odometry,queue_size=10)
        self.odomBroadcaster = TransformBroadcaster()
        self.new_dataLEFT = False
        self.new_dataRIGHT = False
        self.pre_dataAngle = 0.0
        self.dataAngle = 0.0
        swri_rospy.Timer(rospy.Duration(0.1), self.update) 

    #############################################################################
    def resetCB(self,msg):
    #############################################################################
        if msg.data:
            self.x = 0
            self.y = 0
            self.th = 0
            self.logging.info("INFO:   Odometry is resetted")
            rospy.loginfo("Odometry is resetted")


    #############################################################################
    def spin(self):
    #############################################################################
        swri_rospy.spin()
    

    #############################################################################
    def yaw_cb(self, yaw):
    #############################################################################
        #euler=euler_from_quaternion(imu.orientation.x, imu.orientation.y, imu.orientation.z, imu.orientation.w)
        self.temp=yaw.data



    #############################################################################
    def imu_cb(self, msg):
    #############################################################################
        euler = tf.transformations.euler_from_quaternion([msg.orientation.x, msg.orientation.y, msg.orientation.z, msg.orientation.w])
        self.temp = euler[2]


    #############################################################################
    def wheelCallbackRIGHT(self, msg):
    #############################################################################
        self.new_dataRIGHT = True
        self.dataRIGHT = msg.data

    #############################################################################
    def wheelCallbackLEFT(self, msg):
    #############################################################################
        self.new_dataLEFT = True
        self.dataLEFT = msg.data

	
    #############################################################################
    def update(self, event):
    ############################################################################
        if self.new_dataRIGHT and self.new_dataLEFT: 
            now = rospy.Time.now()
            elapsed = now - self.then
            self.then = now
            elapsed = elapsed.to_sec()

            enc = self.dataLEFT  #average left rightont and back ticks
            if (enc < self.encoder_low_wrap and self.prev_lencoder > self.encoder_high_wrap):
                self.lmult = self.lmult + 1

            if (enc > self.encoder_high_wrap and self.prev_lencoder < self.encoder_low_wrap):
                self.lmult = self.lmult - 1

            self.left = 1.0 * (enc + self.lmult * (self.encoder_max - self.encoder_min))

            self.prev_lencoder = enc

            enc = self.dataRIGHT  # average right rightont and back ticks
            if(enc < self.encoder_low_wrap and self.prev_rencoder > self.encoder_high_wrap):
                self.rmult = self.rmult + 1

            if(enc > self.encoder_high_wrap and self.prev_rencoder < self.encoder_low_wrap):
                self.rmult = self.rmult - 1

            self.right = 1.0 * (enc + self.rmult * (self.encoder_max - self.encoder_min))

            self.prev_rencoder = enc

            

            # calculate odometry
            if self.enc_left == None:
                d_left = 0
                d_right = 0
            else:
                d_left =  -1*(self.left - self.enc_left) / self.ticks_meter
                d_right = (self.right - self.enc_right) / self.ticks_meter
                now_e = rospy.Time.now()
                elapsed_e = now_e - self.then_e
                self.then_e = now_e
                elapsed_e = elapsed_e.to_sec()

            self.enc_left = self.left
            self.enc_right = self.right

            # distance traveled is the average of the two wheels
            d = ( d_left + d_right ) / 2

            #read IMU
            #self.ser.leftushInput()
            #self.temp = self.ser.readline()
            #print type(self.dataAngle), self.dataAngle
            try:
                self.dataAngle = -1 * (self.temp)
                # print self.dataAngle
            except Exception as e:
                print(e)
            

            # this approximation works (in radians) for small angles
            th = ( self.dataAngle - self.pre_dataAngle) 
            # calculate velocities
            self.dx = d / elapsed
            self.dr = th / elapsed

            if (d != 0):
                # calculate distance traveled in x and y
                x = cos( th ) * d
                y = -sin( th ) * d
                # calculate the final position of the robot
		self.x = self.x + ( cos( self.th ) * x - sin( self.th ) * y )
                self.y = self.y + ( sin( self.th ) * x + cos( self.th ) * y )
            if( th != 0):
                self.th = self.th + th

            # publish the odom information
            quaternion = Quaternion()
            quaternion.x = 0.0
            quaternion.y = 0.0
            quaternion.z = sin( self.th / 2 )
            quaternion.w = cos( self.th / 2 )

            if self.publish_tf:
                self.odomBroadcaster.sendTransform(
                    (self.x, self.y, 0),
                    (quaternion.x, quaternion.y, quaternion.z, quaternion.w),
                    rospy.Time.now(),
                    self.base_frame_id,
                    self.odom_frame_id
                    )

            odom = Odometry()
            odom.header.stamp = now
            odom.header.frame_id = self.odom_frame_id
            odom.pose.pose.position.x = self.x
            odom.pose.pose.position.y = self.y
            odom.pose.pose.position.z = 0
            odom.pose.pose.orientation = quaternion
            odom.child_frame_id = self.base_frame_id
            odom.twist.twist.linear.x = -self.dx
            odom.twist.twist.linear.y = 0
            odom.twist.twist.angular.z = self.dr
            self.odomPub.publish(odom)
            self.new_dataBL = False
            self.new_dataLEFT = False
            self.new_dataRIGHT = False
            self.new_dataBR = False
            self.new_dataAngle = False
            self.pre_dataAngle = self.dataAngle
            #self.rate.sleep()



#############################################################################
#############################################################################
if __name__ == '__main__':

    diffTf = DiffTf()
    diffTf.spin()
