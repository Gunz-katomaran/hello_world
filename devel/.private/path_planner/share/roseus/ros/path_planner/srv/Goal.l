;; Auto-generated. Do not edit!


(when (boundp 'path_planner::Goal)
  (if (not (find-package "PATH_PLANNER"))
    (make-package "PATH_PLANNER"))
  (shadow 'Goal (find-package "PATH_PLANNER")))
(unless (find-package "PATH_PLANNER::GOAL")
  (make-package "PATH_PLANNER::GOAL"))
(unless (find-package "PATH_PLANNER::GOALREQUEST")
  (make-package "PATH_PLANNER::GOALREQUEST"))
(unless (find-package "PATH_PLANNER::GOALRESPONSE")
  (make-package "PATH_PLANNER::GOALRESPONSE"))

(in-package "ROS")





(defclass path_planner::GoalRequest
  :super ros::object
  :slots (_location ))

(defmethod path_planner::GoalRequest
  (:init
   (&key
    ((:location __location) "")
    )
   (send-super :init)
   (setq _location (string __location))
   self)
  (:location
   (&optional __location)
   (if __location (setq _location __location)) _location)
  (:serialization-length
   ()
   (+
    ;; string _location
    4 (length _location)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _location
       (write-long (length _location) s) (princ _location s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _location
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _location (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass path_planner::GoalResponse
  :super ros::object
  :slots (_goal ))

(defmethod path_planner::GoalResponse
  (:init
   (&key
    ((:goal __goal) 0)
    )
   (send-super :init)
   (setq _goal (round __goal))
   self)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:serialization-length
   ()
   (+
    ;; int32 _goal
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _goal
       (write-long _goal s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _goal
     (setq _goal (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass path_planner::Goal
  :super ros::object
  :slots ())

(setf (get path_planner::Goal :md5sum-) "257e57560eaef13378eb07b58da2c735")
(setf (get path_planner::Goal :datatype-) "path_planner/Goal")
(setf (get path_planner::Goal :request) path_planner::GoalRequest)
(setf (get path_planner::Goal :response) path_planner::GoalResponse)

(defmethod path_planner::GoalRequest
  (:response () (instance path_planner::GoalResponse :init)))

(setf (get path_planner::GoalRequest :md5sum-) "257e57560eaef13378eb07b58da2c735")
(setf (get path_planner::GoalRequest :datatype-) "path_planner/GoalRequest")
(setf (get path_planner::GoalRequest :definition-)
      "string location
---
int32 goal

")

(setf (get path_planner::GoalResponse :md5sum-) "257e57560eaef13378eb07b58da2c735")
(setf (get path_planner::GoalResponse :datatype-) "path_planner/GoalResponse")
(setf (get path_planner::GoalResponse :definition-)
      "string location
---
int32 goal

")



(provide :path_planner/Goal "257e57560eaef13378eb07b58da2c735")


