#!/usr/bin/env python
'''docker ROS Node
gets the pose of tag from the april tag detection node, converts it into move base goals and sends them to navigate the robot to the docking station
'''
# license removed for brevity
import rospy
import tf
import math
import actionlib
from tf.transformations import *
from std_msgs.msg import String, Bool, Int8
from geometry_msgs.msg import Quaternion, PoseStamped, Twist
from move_base_msgs.msg import MoveBaseAction, MoveBaseGoal
import time

global s
s = 1

RED = 'R'
GREEN = 'G'
YELLOW = 'Y'
OFF = 'O'

def qv_mult(q1, v1):
    v1 = unit_vector(v1)
    q2 = list(v1)
    q2.append(0.0)
    return quaternion_multiply(
        quaternion_multiply(q1, q2), 
        quaternion_conjugate(q1)
    )[:3]

def do():
    pub = rospy.Publisher('move_base_simple/goal', PoseStamped, queue_size=10)
    velpub = rospy.Publisher('cmd_vel', Twist, queue_size=10)
    lamppub = rospy.Publisher('lampState', String, queue_size=10)
    reset_pub = rospy.Publisher('/reset_odom', Bool, queue_size=10)
    reset_pub.publish(True)
    reset_pub.publish(True)
    rate = rospy.Rate(10) # 10hz
    client = actionlib.SimpleActionClient("move_base", MoveBaseAction)
    
    try:
        client.wait_for_server(rospy.Duration(10))
        rospy.loginfo('1')
        
        '''
        yes = False
        vel = Twist()
        vel.angular.z = 0.1
        velstop = Twist()
        velstop.angular.z = 0.0
        trans = []
        rot = []
        while not yes:
            try:
                listener.waitForTransform("/map", "/tag_0", rospy.Time(0), rospy.Duration(1.0))
                (trans,rot) = listener.lookupTransform("/map","/tag_0", rospy.Time(0))
                velpub.publish(velstop)
                yes = True
                time.sleep(1)
            except:
                velpub.publish(vel)
        '''

        listener.waitForTransform("/map", "/tag_0", rospy.Time(0), rospy.Duration(1.0))
        (trans,rot) = listener.lookupTransform("/map","/tag_0", rospy.Time(0))        
        orientation = Quaternion(rot[0], rot[1], rot[2], rot[3])
        (roll, pitch, yaw) = euler_from_quaternion(rot)
        rospy.loginfo('Tag Found.............................')
        #print math.degrees(roll) , math.degrees(pitch), math.degrees(yaw)
        ideal_orient =  [0.5, -0.5, -0.5, 0.5]
        diff_orient = quaternion_multiply(rot, quaternion_inverse(ideal_orient))
        offset_orient = [ 0, 0, 1, 0 ]
        goal_orient = quaternion_multiply(diff_orient, offset_orient)

        (roll, pitch, yaw) = euler_from_quaternion(goal_orient)
        g_orient = quaternion_from_euler(0, 0, yaw)

    
        #print "Trans: ", trans
        #print "Orient: ", yaw
        
        
        goal_vec = [trans[0], trans[1], 0]
        offset_vec = [0,0]
        dir_vec = qv_mult(g_orient, [1,0,0])
        offset_vec[0] = goal_vec[0] + 2*dir_vec[0] 
        offset_vec[1] = goal_vec[1] + 2*dir_vec[1]

        #print "Offset Trans: ", offset_vec
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose.position.x = offset_vec[0]
        goal.target_pose.pose.position.y = offset_vec[1]
        goal.target_pose.pose.position.z = 0
        goal.target_pose.pose.orientation.x = g_orient[0]
        goal.target_pose.pose.orientation.y = g_orient[1]
        goal.target_pose.pose.orientation.z = g_orient[2]
        goal.target_pose.pose.orientation.w = g_orient[3]
        client.send_goal(goal)
        wait = client.wait_for_result(rospy.Duration(60))
        rospy.loginfo(wait) 
        
        #############2222222222222222############################################################################
        time.sleep(3)
        rospy.loginfo('2')
        '''
        yes = False
        vel = Twist()
        vel.angular.z = 0.1
        velstop = Twist()
        velstop.angular.z = 0.0
        trans = []
        rot = []
        while not yes:
            try:
                listener.waitForTransform("/map", "/tag_0", rospy.Time(0), rospy.Duration(1.0))
                (trans,rot) = listener.lookupTransform("/map","/tag_0", rospy.Time(0))
                velpub.publish(velstop)
                yes = True
                time.sleep(1)
            except:
                velpub.publish(vel)
        '''

        listener.waitForTransform("/map", "/tag_0", rospy.Time(0), rospy.Duration(1.0))
        (trans,rot) = listener.lookupTransform("/map","/tag_0", rospy.Time(0))
        orientation = Quaternion(rot[0], rot[1], rot[2], rot[3])
        (roll, pitch, yaw) = euler_from_quaternion(rot)
        rospy.loginfo('Tag Found.............................')
        #print math.degrees(roll) , math.degrees(pitch), math.degrees(yaw)
        ideal_orient =  [0.5, -0.5, -0.5, 0.5]
        diff_orient = quaternion_multiply(rot, quaternion_inverse(ideal_orient))
        offset_orient = [ 0, 0, 1, 0 ]
        goal_orient = quaternion_multiply(diff_orient, offset_orient)

        (roll, pitch, yaw) = euler_from_quaternion(goal_orient)
        g_orient = quaternion_from_euler(0, 0, yaw)


        #print "Transss: ", trans
        #print "Orienttt: ", yaw
        
        
        goal_vec = [trans[0], trans[1], 0]
        dir_vec = qv_mult(g_orient, [1,0,0])
        offset_vec[0] = goal_vec[0] + 1*dir_vec[0] 
        offset_vec[1] = goal_vec[1] + 1*dir_vec[1]

        #print "Offset Trans: ", offset_vec
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose.position.x = offset_vec[0]
        goal.target_pose.pose.position.y = offset_vec[1]
        goal.target_pose.pose.position.z = 0
        goal.target_pose.pose.orientation.x = g_orient[0]
        goal.target_pose.pose.orientation.y = g_orient[1]
        goal.target_pose.pose.orientation.z = g_orient[2]
        goal.target_pose.pose.orientation.w = g_orient[3]
        client.send_goal(goal)
        wait = client.wait_for_result(rospy.Duration(60))
        rospy.loginfo(wait) 

        #############33333333333333333333333############################################################################
        time.sleep(3)
        rospy.loginfo('3')

        '''
        yes = False
        vel = Twist()
        vel.angular.z = 0.1
        velstop = Twist()
        velstop.angular.z = 0.0
        trans = []
        rot = []
        while not yes:
            try:
                listener.waitForTransform("/map", "/tag_0", rospy.Time(0), rospy.Duration(1.0))
                (trans,rot) = listener.lookupTransform("/map","/tag_0", rospy.Time(0))
                velpub.publish(velstop)
                yes = True
                time.sleep(1)
            except:
                velpub.publish(vel)

        '''

        listener.waitForTransform("/map", "/tag_0", rospy.Time(0), rospy.Duration(1.0))
        (trans,rot) = listener.lookupTransform("/map","/tag_0", rospy.Time(0))
        orientation = Quaternion(rot[0], rot[1], rot[2], rot[3])
        (roll, pitch, yaw) = euler_from_quaternion(rot)
        rospy.loginfo('Tag Found.............................')
        #print math.degrees(roll) , math.degrees(pitch), math.degrees(yaw)
        ideal_orient =  [0.5, -0.5, -0.5, 0.5]
        diff_orient = quaternion_multiply(rot, quaternion_inverse(ideal_orient))
        offset_orient = [ 0, 0, 1, 0 ]
        goal_orient = quaternion_multiply(diff_orient, offset_orient)

        (roll, pitch, yaw) = euler_from_quaternion(goal_orient)
        g_orient = quaternion_from_euler(0, 0, yaw)


        #print "Transss: ", trans
        #print "Orienttt: ", yaw
        
        
        goal_vec = [trans[0], trans[1], 0]
        dir_vec = qv_mult(g_orient, [1,0,0])
        offset_vec[0] = goal_vec[0] + 0.75*dir_vec[0] 
        offset_vec[1] = goal_vec[1] + 0.75*dir_vec[1]

        #print "Offset Trans: ", offset_vec
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose.position.x = offset_vec[0]
        goal.target_pose.pose.position.y = offset_vec[1]
        goal.target_pose.pose.position.z = 0
        goal.target_pose.pose.orientation.x = g_orient[0]
        goal.target_pose.pose.orientation.y = g_orient[1]
        goal.target_pose.pose.orientation.z = g_orient[2]
        goal.target_pose.pose.orientation.w = g_orient[3]
        client.send_goal(goal)
        wait = client.wait_for_result(rospy.Duration(60))
        rospy.loginfo(wait) 



         #############44444444444444############################################################################
        time.sleep(3)
        rospy.loginfo('4')


        '''
        yes = False
        vel = Twist()
        vel.angular.z = 0.1
        velstop = Twist()
        velstop.angular.z = 0.0
        trans = []
        rot = []
        while not yes:
            try:
                listener.waitForTransform("/map", "/tag_0", rospy.Time(0), rospy.Duration(1.0))
                (trans,rot) = listener.lookupTransform("/map","/tag_0", rospy.Time(0))
                velpub.publish(velstop)
                yes = True
                time.sleep(1)
            except:
                velpub.publish(vel)
        '''

        listener.waitForTransform("/map", "/tag_0", rospy.Time(0), rospy.Duration(1.0))
        (trans,rot) = listener.lookupTransform("/map","/tag_0", rospy.Time(0))
        orientation = Quaternion(rot[0], rot[1], rot[2], rot[3])
        (roll, pitch, yaw) = euler_from_quaternion(rot)
        rospy.loginfo('Tag Found.............................')
        #print math.degrees(roll) , math.degrees(pitch), math.degrees(yaw)
        ideal_orient =  [0.5, -0.5, -0.5, 0.5]
        diff_orient = quaternion_multiply(rot, quaternion_inverse(ideal_orient))
        offset_orient = [ 0, 0, 1, 0 ]
        goal_orient = quaternion_multiply(diff_orient, offset_orient)

        (roll, pitch, yaw) = euler_from_quaternion(goal_orient)
        g_orient = quaternion_from_euler(0, 0, yaw)


        #print "Transss: ", trans
        #print "Orienttt: ", yaw
        
        
        goal_vec = [trans[0], trans[1], 0]
        dir_vec = qv_mult(g_orient, unit_vector([1,-0.04,0]))
        offset_vec[0] = goal_vec[0] + 0.5*dir_vec[0] 
        offset_vec[1] = goal_vec[1] + 0.5*dir_vec[1]

        #print "Offset Trans: ", offset_vec
        goal = MoveBaseGoal()
        goal.target_pose.header.frame_id = "map"
        goal.target_pose.header.stamp = rospy.Time.now()
        goal.target_pose.pose.position.x = offset_vec[0]
        goal.target_pose.pose.position.y = offset_vec[1]
        goal.target_pose.pose.position.z = 0
        goal.target_pose.pose.orientation.x = g_orient[0]
        goal.target_pose.pose.orientation.y = g_orient[1]
        goal.target_pose.pose.orientation.z = g_orient[2]
        goal.target_pose.pose.orientation.w = g_orient[3]
        client.send_goal(goal)
        wait = client.wait_for_result(rospy.Duration(60))
        rospy.loginfo(wait) 


        ###################################END##############################################
        time.sleep(3)
        vel = Twist()
        vel.linear.x = -0.1
        velpub.publish(vel)
        global s
        start = rospy.Time.now()
        while True:
            if (rospy.Time.now() - start) > rospy.Duration(10):
                vel.linear.x = 0.0
                velpub.publish(vel)
                rospy.logerr('Docking Failed')
                lamppub.publish(RED)
                break
            if s == 3:
                lamppub.publish(YELLOW)
                vel.linear.x = 0.0
                velpub.publish(vel)
                rospy.loginfo('Robot Docked Successfully')
                break


        rate.sleep()
    except Exception as e:
        print(e)
        rospy.logerr('Please restart when the dock is under camera view')
        rospy.logerr('Docking Failed')
        lamppub.publish(RED)
        pass

def dockStateCB(state):
    global s
    s = state.data 
    #rospy.loginfo('Robot Docked State Received')



if __name__ == '__main__':
    rospy.init_node('docker', anonymous=True)
    listener = tf.TransformListener()
    br = tf.TransformBroadcaster()
    rospy.Subscriber('/dock_state', Int8, dockStateCB)
    rospy.loginfo('Please for docker to get ready.')
    time.sleep(15)
    rospy.loginfo('Docker Ready')
    do()
    
