;; Auto-generated. Do not edit!


(when (boundp 'patrol_planner::GPSGoal)
  (if (not (find-package "PATROL_PLANNER"))
    (make-package "PATROL_PLANNER"))
  (shadow 'GPSGoal (find-package "PATROL_PLANNER")))
(unless (find-package "PATROL_PLANNER::GPSGOAL")
  (make-package "PATROL_PLANNER::GPSGOAL"))
(unless (find-package "PATROL_PLANNER::GPSGOALREQUEST")
  (make-package "PATROL_PLANNER::GPSGOALREQUEST"))
(unless (find-package "PATROL_PLANNER::GPSGOALRESPONSE")
  (make-package "PATROL_PLANNER::GPSGOALRESPONSE"))

(in-package "ROS")





(defclass patrol_planner::GPSGoalRequest
  :super ros::object
  :slots (_milestone_name ))

(defmethod patrol_planner::GPSGoalRequest
  (:init
   (&key
    ((:milestone_name __milestone_name) "")
    )
   (send-super :init)
   (setq _milestone_name (string __milestone_name))
   self)
  (:milestone_name
   (&optional __milestone_name)
   (if __milestone_name (setq _milestone_name __milestone_name)) _milestone_name)
  (:serialization-length
   ()
   (+
    ;; string _milestone_name
    4 (length _milestone_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _milestone_name
       (write-long (length _milestone_name) s) (princ _milestone_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _milestone_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _milestone_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass patrol_planner::GPSGoalResponse
  :super ros::object
  :slots (_goal_sent_status ))

(defmethod patrol_planner::GPSGoalResponse
  (:init
   (&key
    ((:goal_sent_status __goal_sent_status) nil)
    )
   (send-super :init)
   (setq _goal_sent_status __goal_sent_status)
   self)
  (:goal_sent_status
   (&optional __goal_sent_status)
   (if __goal_sent_status (setq _goal_sent_status __goal_sent_status)) _goal_sent_status)
  (:serialization-length
   ()
   (+
    ;; bool _goal_sent_status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _goal_sent_status
       (if _goal_sent_status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _goal_sent_status
     (setq _goal_sent_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass patrol_planner::GPSGoal
  :super ros::object
  :slots ())

(setf (get patrol_planner::GPSGoal :md5sum-) "069b6c0906fcffac7ddcf59faaf4b55a")
(setf (get patrol_planner::GPSGoal :datatype-) "patrol_planner/GPSGoal")
(setf (get patrol_planner::GPSGoal :request) patrol_planner::GPSGoalRequest)
(setf (get patrol_planner::GPSGoal :response) patrol_planner::GPSGoalResponse)

(defmethod patrol_planner::GPSGoalRequest
  (:response () (instance patrol_planner::GPSGoalResponse :init)))

(setf (get patrol_planner::GPSGoalRequest :md5sum-) "069b6c0906fcffac7ddcf59faaf4b55a")
(setf (get patrol_planner::GPSGoalRequest :datatype-) "patrol_planner/GPSGoalRequest")
(setf (get patrol_planner::GPSGoalRequest :definition-)
      "string milestone_name
---
bool goal_sent_status

")

(setf (get patrol_planner::GPSGoalResponse :md5sum-) "069b6c0906fcffac7ddcf59faaf4b55a")
(setf (get patrol_planner::GPSGoalResponse :datatype-) "patrol_planner/GPSGoalResponse")
(setf (get patrol_planner::GPSGoalResponse :definition-)
      "string milestone_name
---
bool goal_sent_status

")



(provide :patrol_planner/GPSGoal "069b6c0906fcffac7ddcf59faaf4b55a")


