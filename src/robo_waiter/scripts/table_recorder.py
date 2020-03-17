#!/usr/bin/env python

import rospy
import rospkg
import atexit
import sys
import json
from geometry_msgs.msg import Pose
from math import sqrt
from patrol_planner.srv import Save,SaveResponse
from robo_waiter import Table, TableResponse
from tf.transformations import euler_from_quaternion as euler

rospy.init_node("table_recorder", anonymous=True)

class PathRecorder():
  def __init__(self):
    rospack = rospkg.RosPack()
    self.path = rospack.get_path("robo_waiter") + "/config/"
    print (self.path)
    self.x1 = self.y1 = None
    self.init()
    self.coord_list = list()
    self.ms_list = list()
    self.finished = False

  def pos_cb(self,msg):
      self.x1 = msg.position.x
      self.y1 = msg.position.y
      self.z =  msg.orientation.z
      self.w = msg.orientation.w
    

  def save(self,):
    #self.file = open(self.path + "autosave_coord.txt","w+")
    self.ms_file = open(self.path + "autosave_ts.txt","w+")
    #self.file.write(str(self.coord_list))
    self.ms_file.write(str(self.coord_list))
    #self.file.close()
    self.ms_file.close()
  

  def path_cb(self,req):
    #self.file = open(self.path + req.name + "_coord.txt","w+")
    self.ms_file = open(self.path + req.name + "_ts.txt","w+")
    #self.file.write(json.dumps(self.coord_list))
    self.ms_file.write(json.dumps(self.coord_list))
    #self.file.close()
    self.ms_file.close()
    self.finished = True
    return SaveResponse(status= "Path Saved!")

  def table_ts(self,req):
    self.name = req.table_name
    cop = str(self.x1) + "," + str(self.y1) + "," + str(self.z) + "," + str(self.w) + "," + str(self.name)
    self.coord_list.append(cop)
    return TableResponse(reply="table_saved")
    
  def init(self):
    rospy.Subscriber("/robot_pose", Pose, self.pos_cb)
    rospy.Service("/table_ms",Table,self.table_ts)
    rospy.Service("/save_table",Save,self.path_cb)

if __name__ == "__main__":
  pr = PathRecorder()
  atexit.register(pr.save)
  while not rospy.is_shutdown():
    if pr.finished:
      rospy.signal_shutdown("Filed Saved Exiting!")
  rospy.spin()
