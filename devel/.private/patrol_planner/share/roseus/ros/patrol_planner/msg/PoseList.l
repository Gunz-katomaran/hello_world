;; Auto-generated. Do not edit!


(when (boundp 'patrol_planner::PoseList)
  (if (not (find-package "PATROL_PLANNER"))
    (make-package "PATROL_PLANNER"))
  (shadow 'PoseList (find-package "PATROL_PLANNER")))
(unless (find-package "PATROL_PLANNER::POSELIST")
  (make-package "PATROL_PLANNER::POSELIST"))

(in-package "ROS")
;;//! \htmlinclude PoseList.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass patrol_planner::PoseList
  :super ros::object
  :slots (_pose_list ))

(defmethod patrol_planner::PoseList
  (:init
   (&key
    ((:pose_list __pose_list) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Pose :init) r)) r))
    )
   (send-super :init)
   (setq _pose_list __pose_list)
   self)
  (:pose_list
   (&rest __pose_list)
   (if (keywordp (car __pose_list))
       (send* _pose_list __pose_list)
     (progn
       (if __pose_list (setq _pose_list (car __pose_list)))
       _pose_list)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose[] _pose_list
    (apply #'+ (send-all _pose_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose[] _pose_list
     (write-long (length _pose_list) s)
     (dolist (elem _pose_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose[] _pose_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pose_list (let (r) (dotimes (i n) (push (instance geometry_msgs::Pose :init) r)) r))
     (dolist (elem- _pose_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get patrol_planner::PoseList :md5sum-) "5e5f9729e6eac8b890e586b463fdbada")
(setf (get patrol_planner::PoseList :datatype-) "patrol_planner/PoseList")
(setf (get patrol_planner::PoseList :definition-)
      "geometry_msgs/Pose[] pose_list

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



(provide :patrol_planner/PoseList "5e5f9729e6eac8b890e586b463fdbada")


