;; Auto-generated. Do not edit!


(when (boundp 'patrol_planner::GetPlan)
  (if (not (find-package "PATROL_PLANNER"))
    (make-package "PATROL_PLANNER"))
  (shadow 'GetPlan (find-package "PATROL_PLANNER")))
(unless (find-package "PATROL_PLANNER::GETPLAN")
  (make-package "PATROL_PLANNER::GETPLAN"))
(unless (find-package "PATROL_PLANNER::GETPLANREQUEST")
  (make-package "PATROL_PLANNER::GETPLANREQUEST"))
(unless (find-package "PATROL_PLANNER::GETPLANRESPONSE")
  (make-package "PATROL_PLANNER::GETPLANRESPONSE"))

(in-package "ROS")

(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass patrol_planner::GetPlanRequest
  :super ros::object
  :slots (_start _goal ))

(defmethod patrol_planner::GetPlanRequest
  (:init
   (&key
    ((:start __start) (instance geometry_msgs::PoseStamped :init))
    ((:goal __goal) (instance geometry_msgs::PoseStamped :init))
    )
   (send-super :init)
   (setq _start __start)
   (setq _goal __goal)
   self)
  (:start
   (&rest __start)
   (if (keywordp (car __start))
       (send* _start __start)
     (progn
       (if __start (setq _start (car __start)))
       _start)))
  (:goal
   (&rest __goal)
   (if (keywordp (car __goal))
       (send* _goal __goal)
     (progn
       (if __goal (setq _goal (car __goal)))
       _goal)))
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/PoseStamped _start
    (send _start :serialization-length)
    ;; geometry_msgs/PoseStamped _goal
    (send _goal :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/PoseStamped _start
       (send _start :serialize s)
     ;; geometry_msgs/PoseStamped _goal
       (send _goal :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/PoseStamped _start
     (send _start :deserialize buf ptr-) (incf ptr- (send _start :serialization-length))
   ;; geometry_msgs/PoseStamped _goal
     (send _goal :deserialize buf ptr-) (incf ptr- (send _goal :serialization-length))
   ;;
   self)
  )

(defclass patrol_planner::GetPlanResponse
  :super ros::object
  :slots (_pose_list _normal_goal ))

(defmethod patrol_planner::GetPlanResponse
  (:init
   (&key
    ((:pose_list __pose_list) (let (r) (dotimes (i 0) (push (instance geometry_msgs::Pose :init) r)) r))
    ((:normal_goal __normal_goal) nil)
    )
   (send-super :init)
   (setq _pose_list __pose_list)
   (setq _normal_goal __normal_goal)
   self)
  (:pose_list
   (&rest __pose_list)
   (if (keywordp (car __pose_list))
       (send* _pose_list __pose_list)
     (progn
       (if __pose_list (setq _pose_list (car __pose_list)))
       _pose_list)))
  (:normal_goal
   (&optional __normal_goal)
   (if __normal_goal (setq _normal_goal __normal_goal)) _normal_goal)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose[] _pose_list
    (apply #'+ (send-all _pose_list :serialization-length)) 4
    ;; bool _normal_goal
    1
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
     ;; bool _normal_goal
       (if _normal_goal (write-byte -1 s) (write-byte 0 s))
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
   ;; bool _normal_goal
     (setq _normal_goal (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass patrol_planner::GetPlan
  :super ros::object
  :slots ())

(setf (get patrol_planner::GetPlan :md5sum-) "9d6b4f0ff14cc81eb21e6cb1c02a5f48")
(setf (get patrol_planner::GetPlan :datatype-) "patrol_planner/GetPlan")
(setf (get patrol_planner::GetPlan :request) patrol_planner::GetPlanRequest)
(setf (get patrol_planner::GetPlan :response) patrol_planner::GetPlanResponse)

(defmethod patrol_planner::GetPlanRequest
  (:response () (instance patrol_planner::GetPlanResponse :init)))

(setf (get patrol_planner::GetPlanRequest :md5sum-) "9d6b4f0ff14cc81eb21e6cb1c02a5f48")
(setf (get patrol_planner::GetPlanRequest :datatype-) "patrol_planner/GetPlanRequest")
(setf (get patrol_planner::GetPlanRequest :definition-)
      "geometry_msgs/PoseStamped start
geometry_msgs/PoseStamped goal

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

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
---
geometry_msgs/Pose[] pose_list
bool normal_goal


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

(setf (get patrol_planner::GetPlanResponse :md5sum-) "9d6b4f0ff14cc81eb21e6cb1c02a5f48")
(setf (get patrol_planner::GetPlanResponse :datatype-) "patrol_planner/GetPlanResponse")
(setf (get patrol_planner::GetPlanResponse :definition-)
      "geometry_msgs/PoseStamped start
geometry_msgs/PoseStamped goal

================================================================================
MSG: geometry_msgs/PoseStamped
# A Pose with reference coordinate frame and timestamp
Header header
Pose pose

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

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
---
geometry_msgs/Pose[] pose_list
bool normal_goal


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



(provide :patrol_planner/GetPlan "9d6b4f0ff14cc81eb21e6cb1c02a5f48")


