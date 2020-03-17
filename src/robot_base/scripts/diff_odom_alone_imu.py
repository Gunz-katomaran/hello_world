#!/usr/bin/env python
'''
This node is used to calculate odometry and publish it.
'''
import rospy
import swri_rospy
import serial
from math import sin, cos, pi

from geometry_msgs.msg import Quaternion
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from tf.broadcaster import TransformBroadcaster
from std_msgs.msg import  Int32MultiArray ,Int32, Bool
from dynamic_reconfigure.server import Server
from robot_base.cfg import RobotBaseConfig

#############################################################################
class DiffTf:
#############################################################################

    #############################################################################
    def __init__(self):
    #############################################################################
        rospy.init_node("odometry_node")
        self.nodename = rospy.get_name()
        rospy.loginfo(" %s started" % self.nodename)

        #Imu
        try:
            self.ser = serial.Serial('/dev/ttyUSB4', 115200, timeout=1)
            print "IMU connected"
        except:
            rospy.logfatal('Cannot open the port %s', '/dev/ttyACM0')
            rospy.signal_shutdown("Cannot open the port. Node shutting down.")

        #dynamic reconfigure server
        self.srv = Server(RobotBaseConfig, self.reconfigure)

        #### parameters #######
        self.rate = rospy.get_param('rate',20.0)  # the rate at which to publish the transform
        self.ticks_meter = float(rospy.get_param('ticks_meter', 47157.02017537639))  # The number of wheel encoder ticks per meter of travel, ticks per rotation / (2*pi*r)
        self.base_width = float(rospy.get_param('robot_width', 0.300)) # The wheel base width in meters

        self.base_frame_id = rospy.get_param('~base_frame_id','base_link') # the name of the base frame of the robot
        self.odom_frame_id = rospy.get_param('~odom_frame_id', 'odom') # the name of the odometry reference frame

        self.encoder_min = rospy.get_param('encoder_min', -2147483648)
        self.encoder_max = rospy.get_param('encoder_max', 2147483647)
        self.encoder_low_wrap = rospy.get_param('wheel_low_wrap', (self.encoder_max - self.encoder_min) * 0.3 + self.encoder_min )
        self.encoder_high_wrap = rospy.get_param('wheel_high_wrap', (self.encoder_max - self.encoder_min) * 0.7 + self.encoder_min )

       # self.t_delta = rospy.Duration(1.0/self.rate)
        #self.t_next = rospy.Time.now() + self.t_delta
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
        swri_rospy.Subscriber("/reset_odom", Bool, self.resetCB)
        #swri_rospy.Subscriber("/angle_imu", Int32, self.angleCallback)
        self.odomPub = rospy.Publisher("odom", Odometry,queue_size=10)
        self.odomBroadcaster = TransformBroadcaster()

        self.new_dataBL = False
        self.new_dataFL = False
        self.new_dataFR = False
        self.new_dataBR = False
       # self.new_dataAngle = False
        self.pre_dataAngle = 0.0
        self.dataAngle = 0.0
        swri_rospy.Timer(rospy.Duration(1/self.rate), self.update) 

    #############################################################################
    def resetCB(self,msg):
    #############################################################################
        if msg.data:
            self.x = 0                 
            self.y = 0
            self.th = 0
            rospy.loginfo("Odometry is resetted")

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
    def angleCallback(self,msg):
    #############################################################################
        self.new_dataAngle = True
        self.dataAngle = msg.data

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
    ############################################################################
        '''
        #read IMU
        self.ser.flushInput()
        temp = self.ser.readline()
        #print type(self.dataAngle), self.dataAngle
        try:
            self.dataAngle = float(temp)
           # print self.dataAngle
        except Exception as e:
            print(e)
        '''
        if self.new_dataFR and self.new_dataFL and self.new_dataBL and self.new_dataBR: 
        #and self.new_dataAngle:

	    now = rospy.Time.now()
            #if now > self.t_next:
            elapsed = now - self.then
            self.then = now
            elapsed = elapsed.to_sec()
            print 'Elapsed: ', elapsed

            enc = (self.dataFL + self.dataBL) / 2 #average left front and back ticks
            if (enc < self.encoder_low_wrap and self.prev_lencoder > self.encoder_high_wrap):
                self.lmult = self.lmult + 1

            if (enc > self.encoder_high_wrap and self.prev_lencoder < self.encoder_low_wrap):
                self.lmult = self.lmult - 1

            self.left = 1.0 * (enc + self.lmult * (self.encoder_max - self.encoder_min))

            self.prev_lencoder = enc

            enc = (self.dataFR + self.dataBR ) / 2 # average right front and back ticks
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
                d_left = -1 * (self.left - self.enc_left) / self.ticks_meter
                d_right = (self.right - self.enc_right) / self.ticks_meter
            self.enc_left = self.left
            self.enc_right = self.right

            # distance traveled is the average of the two wheels
            d = ( d_left + d_right ) / 2

            #read IMU
            self.ser.flushInput()
            temp = self.ser.readline()
            #print type(self.dataAngle), self.dataAngle
            try:
                self.dataAngle = -1.0 * float(temp)
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
            odom.twist.twist.linear.x = self.dx
            odom.twist.twist.linear.y = 0
            odom.twist.twist.angular.z = self.dr
            self.odomPub.publish(odom)
            self.new_dataBL = False
            self.new_dataFL = False
            self.new_dataFR = False
            self.new_dataBR = False
            self.new_dataAngle = False
            self.pre_dataAngle = self.dataAngle



#############################################################################
#############################################################################
if __name__ == '__main__':

    diffTf = DiffTf()
    diffTf.spin()
