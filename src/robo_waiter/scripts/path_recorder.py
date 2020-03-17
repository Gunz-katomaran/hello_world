#!/usr/bin/env python

import rospy
import rospkg
import atexit
import sys
import json
from geometry_msgs.msg import Pose
from sensor_msgs.msg import NavSatFix,Imu
from math import sqrt
from patrol_planner.srv import Save,SaveResponse
from tf.transformations import euler_from_quaternion as euler

rospy.init_node("path_recorder", anonymous=True)

class PathRecorder():
  def __init__(self):
    rospack = rospkg.RosPack()
    self.path = rospack.get_path("robo_waiter") + "/config/"
    print (self.path)
    self.i = 0
    self.count = 0
    self.x1 = self.y1 = None
    self.init()
    self.coord_list = list()
    self.ms_list = list()
    self.finished = False

  def pos_cb(self,msg):
    self.i += 1
    if self.i == 1:
      self.x1 = msg.position.x
      self.y1 = msg.position.y
    else:
      x2 = msg.position.x
      y2 = msg.position.y
      distance = sqrt((x2-self.x1)**2 + (y2-self.y1)**2)
      print("dist",distance)
      if distance >= 1.0:
         print ("lat,lon,hed",self.lat,self.lon,self.hed)
         coord = str(self.lat) + "," + str(self.lon) + "," + str(self.hed)
         self.coord_list.append(coord)
         self.x1 = x2
         self.y1 = y2
    
  def fix_cb(self,msg):
    self.lat = msg.latitude
    self.lon = msg.longitude

  def heading_cb(self,msg):
    o = msg.orientation
    orient = euler((o.x,o.y,o.z,o.w))
    self.hed = orient[2]

  def mile_stone(self,name):
    self.count += 1
    coord = str(self.lat) + "," + str(self.lon) + "," + str(self.hed) + "," + str(self.count) + "," + str(name)
    self.coord_list.append(coord)
    self.ms_list.append(coord)

  def save(self,):
    self.file = open(self.path + "autosave_coord.txt","w+")
    self.ms_file = open(self.path + "autosave_ms.txt","w+")
    self.file.write(str(self.coord_list))
    self.ms_file.write(str(self.ms_list))
    self.file.close()
    self.ms_file.close()
  
  def save_cb(self,req):
    self.mile_stone(req.name)
    return SaveResponse(status = "MileStone Saved!")

  def path_cb(self,req):
    self.file = open(self.path + req.name + "_coord.txt","w+")
    self.ms_file = open(self.path + req.name + "_ms.txt","w+")
    self.file.write(json.dumps(self.coord_list))
    self.ms_file.write(json.dumps(self.ms_list))
    self.file.close()
    self.ms_file.close()
    self.finished = True
    return SaveResponse(status= "Path Saved!")
    
  def init(self):
    rospy.Subscriber("/robot_pose", Pose, self.pos_cb)
    rospy.Subscriber("/fix", NavSatFix, self.fix_cb)
    rospy.Subscriber("/imu_data",Imu,self.heading_cb)
    rospy.Service("/save_ms",Save,self.save_cb)
    rospy.Service("/save_path",Save,self.path_cb)

if __name__ == "__main__":
  pr = PathRecorder()
  atexit.register(pr.save)
  while not rospy.is_shutdown():
    if pr.finished:
      rospy.signal_shutdown("Filed Saved Exiting!")
  rospy.spin()
