#!/usr/bin/env python

import rospy
import swri_rospy
from math import sin, cos, pi

from geometry_msgs.msg import Quaternion
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from tf.broadcaster import TransformBroadcaster
from std_msgs.msg import  Int32MultiArray ,Int32, Int16
from dynamic_reconfigure.server import Server
from robot_base.cfg import RobotBaseConfig

#############################################################################
class DiffTf:
#############################################################################

    #############################################################################
    def __init__(self):
    #############################################################################
        rospy.init_node("odometry_node_new")
        self.nodename = rospy.get_name()
        rospy.loginfo("-I- %s started" % self.nodename)

        #dynamic reconfigure server
        self.srv = Server(RobotBaseConfig, self.reconfigure)

        #### parameters #######
        self.rate = rospy.get_param('rate',10.0)  # the rate at which to publish the transform
        self.ticks_meter = float(rospy.get_param('ticks_meter', 50929.5817894))  # The number of wheel encoder ticks per meter of travel, ticks per rotation / (2*pi*r)
        self.base_width = float(rospy.get_param('robot_width', 0.350)) # The wheel base width in meters
        self.wheel_radius = 0.125
        self.base_frame_id = rospy.get_param('~base_frame_id','base_link_new') # the name of the base frame of the robot
        self.odom_frame_id = rospy.get_param('~odom_frame_id', 'odom') # the name of the odometry reference frame

        self.encoder_min = rospy.get_param('encoder_min', -2147483648)
        self.encoder_max = rospy.get_param('encoder_max', 2147483647)
        self.encoder_low_wrap = rospy.get_param('wheel_low_wrap', (self.encoder_max - self.encoder_min) * 0.3 + self.encoder_min )
        self.encoder_high_wrap = rospy.get_param('wheel_high_wrap', (self.encoder_max - self.encoder_min) * 0.7 + self.encoder_min )

        self.t_delta = rospy.Duration(1.0/self.rate)
        self.t_next = rospy.Time.now() + self.t_delta
        self.new_data = False

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

        # subscriptions
        swri_rospy.Subscriber("/rpmFR", Int16, self.wheelCallbackFR)
        swri_rospy.Subscriber("/rpmFL", Int16, self.wheelCallbackFL)
        swri_rospy.Subscriber("/rpmBL", Int16, self.wheelCallbackBL)
        swri_rospy.Subscriber("/rpmBR", Int16, self.wheelCallbackBR)
        self.odomPub = rospy.Publisher("odom_new", Odometry,queue_size=10)
        self.odomBroadcaster = TransformBroadcaster()

        self.new_dataBL = False
        self.new_dataFL = False
        self.new_dataFR = False
        self.new_dataBR = False

        swri_rospy.Timer(rospy.Duration(0.05), self.update) #TODO: Use rate parameter


    ##########################################################################
    def reconfigure(self, config, level):
    ##########################################################################
        self.publish_tf = config.publish_tf        
        return config

    #############################################################################
    def spin(self):
    #############################################################################
        swri_rospy.spin()


    #############################################################################
    def wheelCallbackFR(self, msg):
    #############################################################################
        self.new_dataFR = True
        self.dataFR = msg.data

    #############################################################################
    def wheelCallbackFL(self, msg):
    #############################################################################
        self.new_dataFL = True
        self.dataFL = msg.data

    #############################################################################
    def wheelCallbackBL(self, msg):
    #############################################################################
        self.new_dataBL = True
        self.dataBL = msg.data

    #############################################################################
    def wheelCallbackBR(self, msg):
    #############################################################################
        self.new_dataBR = True
        self.dataBR = msg.data


    #############################################################################
    def update(self, event):
    #############################################################################
        if self.new_dataFR and self.new_dataFL and self.new_dataBL and self.new_dataBR:

            now = rospy.Time.now()
            elapsed = now - self.then
            self.then = now
            elapsed = elapsed.to_sec()
            #print 'Elapsed: ', elapsed

            left_rpm = -1 * (self.dataBL + self.dataFL) / 2 
            right_rpm = (self.dataBR + self.dataFR) / 2

            left_mps = (left_rpm * 2 * self.wheel_radius * pi) / 60
            right_mps = (right_rpm * 2 * self.wheel_radius * pi) / 60

            left_m = left_mps * elapsed
            right_m = right_mps * elapsed
            d_left = left_m
            d_right = right_m

            # distance traveled is the average of the two wheels
            d = ( d_left + d_right ) / 2
            # this approximation works (in radians) for small angles
            th = ( d_right - d_left ) / self.base_width
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
            odom.twist.twist.linear.x = self.dx
            odom.twist.twist.linear.y = 0
            odom.twist.twist.angular.z = self.dr
            self.odomPub.publish(odom)
            self.new_dataBL = False
            self.new_dataFL = False
            self.new_dataFR = False
            self.new_dataBR = False







#############################################################################
#############################################################################
if __name__ == '__main__':

    diffTf = DiffTf()
    diffTf.spin()