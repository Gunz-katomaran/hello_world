;; Auto-generated. Do not edit!


(when (boundp 'roadmap_global_planner_msgs::MapPair)
  (if (not (find-package "ROADMAP_GLOBAL_PLANNER_MSGS"))
    (make-package "ROADMAP_GLOBAL_PLANNER_MSGS"))
  (shadow 'MapPair (find-package "ROADMAP_GLOBAL_PLANNER_MSGS")))
(unless (find-package "ROADMAP_GLOBAL_PLANNER_MSGS::MAPPAIR")
  (make-package "ROADMAP_GLOBAL_PLANNER_MSGS::MAPPAIR"))

(in-package "ROS")
;;//! \htmlinclude MapPair.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass roadmap_global_planner_msgs::MapPair
  :super ros::object
  :slots (_node _pose ))

(defmethod roadmap_global_planner_msgs::MapPair
  (:init
   (&key
    ((:node __node) 0)
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    )
   (send-super :init)
   (setq _node (round __node))
   (setq _pose __pose)
   self)
  (:node
   (&optional __node)
   (if __node (setq _node __node)) _node)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:serialization-length
   ()
   (+
    ;; int32 _node
    4
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _node
       (write-long _node s)
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _node
     (setq _node (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;;
   self)
  )

(setf (get roadmap_global_planner_msgs::MapPair :md5sum-) "70da0c8f55f16c16e0cd2b1120c67a6b")
(setf (get roadmap_global_planner_msgs::MapPair :datatype-) "roadmap_global_planner_msgs/MapPair")
(setf (get roadmap_global_planner_msgs::MapPair :definition-)
      "int32 node
geometry_msgs/Pose pose
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :roadmap_global_planner_msgs/MapPair "70da0c8f55f16c16e0cd2b1120c67a6b")


