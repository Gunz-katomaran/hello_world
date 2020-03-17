#!/usr/bin/env python

import rospy
import swri_rospy
from math import sin, cos, pi

from geometry_msgs.msg import Quaternion
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from tf.broadcaster import TransformBroadcaster
from std_msgs.msg import  Int32MultiArray ,Int32
from dynamic_reconfigure.server import Server
from robot_base.cfg import RobotBaseConfig

#############################################################################
class DiffTf:
#############################################################################

    #############################################################################
    def __init__(self):
    #############################################################################
        rospy.init_node("rpm_node")
        self.nodename = rospy.get_name()
        rospy.loginfo("-I- %s started" % self.nodename)

        #dynamic reconfigure server
        self.srv = Server(RobotBaseConfig, self.reconfigure)

        #### parameters #######
        self.rate = rospy.get_param('rate',10.0)  # the rate at which to publish the transform
        self.ticks_meter = float(rospy.get_param('ticks_meter', 50929.5817894))  # The number of wheel encoder ticks per meter of travel, ticks per rotation / (2*pi*r)
        self.base_width = float(rospy.get_param('robot_width', 0.350)) # The wheel base width in meters

        self.base_frame_id = rospy.get_param('~base_frame_id','base_link') # the name of the base frame of the robot
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
        swri_rospy.Subscriber("/encoderTicksFR", Int32, self.wheelCallbackFR)
        swri_rospy.Subscriber("/encoderTicksFL", Int32, self.wheelCallbackFL)
        swri_rospy.Subscriber("/encoderTicksBL", Int32, self.wheelCallbackBL)
        swri_rospy.Subscriber("/encoderTicksBR", Int32, self.wheelCallbackBR)
        self.odomPub = rospy.Publisher("odom", Odometry,queue_size=10)
        self.odomBroadcaster = TransformBroadcaster()

        self.new_dataBL = False
        self.new_dataFL = False
        self.new_dataFR = False
        self.new_dataBR = False
        self.pre_dataBL = 0
        self.pre_dataFL = 0
        self.pre_dataFR = 0
        self.pre_dataBR = 0


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
        if self.new_dataFR:
        #and self.new_dataFL and self.new_dataBL and self.new_dataBR:

            now = rospy.Time.now()
            elapsed = now - self.then
            self.then = now
            elapsed = elapsed.to_sec()

            diff_FR = self.dataFR - self.pre_dataFR
            '''
            diff_FL = self.dataFL - self.pre_dataFL 
            diff_BL = self.dataBL - self.pre_dataBL
            diff_BR = self.dataBR - self.pre_dataBR
            '''
            diff_FR = ((diff_FR/40000.0)/elapsed) * 60.0
            '''
            diff_FL = ((diff_FL/40000.0)/elapsed) * 60.0
            diff_BL = ((diff_BL/40000.0)/elapsed) * 60.0
            diff_BR = ((diff_BR/40000.0)/elapsed) * 60.0
            '''
            self.pre_dataFR = self.dataFR
            '''
            self.pre_dataFL = self.dataFL
            self.pre_dataBL = self.dataBL
            self.pre_dataBR = self.dataBR
            '''
            print 'FR: ' + str(diff_FR) 
            #+ ' FL: ' + str(diff_FL) + ' BL: ' + str(diff_BL) + ' BR: ' + str(diff_BR)

            
            self.new_dataFR = False
            '''
            self.new_dataBR = False
            self.new_dataBL = False
            self.new_dataFL = False
            '''




#############################################################################
#############################################################################
if __name__ == '__main__':

    diffTf = DiffTf()
    diffTf.spin()