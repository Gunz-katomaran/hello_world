;; Auto-generated. Do not edit!


(when (boundp 'patrol_planner::PathLoad)
  (if (not (find-package "PATROL_PLANNER"))
    (make-package "PATROL_PLANNER"))
  (shadow 'PathLoad (find-package "PATROL_PLANNER")))
(unless (find-package "PATROL_PLANNER::PATHLOAD")
  (make-package "PATROL_PLANNER::PATHLOAD"))
(unless (find-package "PATROL_PLANNER::PATHLOADREQUEST")
  (make-package "PATROL_PLANNER::PATHLOADREQUEST"))
(unless (find-package "PATROL_PLANNER::PATHLOADRESPONSE")
  (make-package "PATROL_PLANNER::PATHLOADRESPONSE"))

(in-package "ROS")





(defclass patrol_planner::PathLoadRequest
  :super ros::object
  :slots (_path_name _table_path_name ))

(defmethod patrol_planner::PathLoadRequest
  (:init
   (&key
    ((:path_name __path_name) "")
    ((:table_path_name __table_path_name) "")
    )
   (send-super :init)
   (setq _path_name (string __path_name))
   (setq _table_path_name (string __table_path_name))
   self)
  (:path_name
   (&optional __path_name)
   (if __path_name (setq _path_name __path_name)) _path_name)
  (:table_path_name
   (&optional __table_path_name)
   (if __table_path_name (setq _table_path_name __table_path_name)) _table_path_name)
  (:serialization-length
   ()
   (+
    ;; string _path_name
    4 (length _path_name)
    ;; string _table_path_name
    4 (length _table_path_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _path_name
       (write-long (length _path_name) s) (princ _path_name s)
     ;; string _table_path_name
       (write-long (length _table_path_name) s) (princ _table_path_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _path_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _path_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _table_path_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _table_path_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass patrol_planner::PathLoadResponse
  :super ros::object
  :slots (_milestone_list ))

(defmethod patrol_planner::PathLoadResponse
  (:init
   (&key
    ((:milestone_list __milestone_list) (let (r) (dotimes (i 0) (push (instance patrol_planner::Milestone :init) r)) r))
    )
   (send-super :init)
   (setq _milestone_list __milestone_list)
   self)
  (:milestone_list
   (&rest __milestone_list)
   (if (keywordp (car __milestone_list))
       (send* _milestone_list __milestone_list)
     (progn
       (if __milestone_list (setq _milestone_list (car __milestone_list)))
       _milestone_list)))
  (:serialization-length
   ()
   (+
    ;; patrol_planner/Milestone[] _milestone_list
    (apply #'+ (send-all _milestone_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; patrol_planner/Milestone[] _milestone_list
     (write-long (length _milestone_list) s)
     (dolist (elem _milestone_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; patrol_planner/Milestone[] _milestone_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _milestone_list (let (r) (dotimes (i n) (push (instance patrol_planner::Milestone :init) r)) r))
     (dolist (elem- _milestone_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(defclass patrol_planner::PathLoad
  :super ros::object
  :slots ())

(setf (get patrol_planner::PathLoad :md5sum-) "813591a0b724e5a0e599fdf9d754d157")
(setf (get patrol_planner::PathLoad :datatype-) "patrol_planner/PathLoad")
(setf (get patrol_planner::PathLoad :request) patrol_planner::PathLoadRequest)
(setf (get patrol_planner::PathLoad :response) patrol_planner::PathLoadResponse)

(defmethod patrol_planner::PathLoadRequest
  (:response () (instance patrol_planner::PathLoadResponse :init)))

(setf (get patrol_planner::PathLoadRequest :md5sum-) "813591a0b724e5a0e599fdf9d754d157")
(setf (get patrol_planner::PathLoadRequest :datatype-) "patrol_planner/PathLoadRequest")
(setf (get patrol_planner::PathLoadRequest :definition-)
      "string path_name
string table_path_name
---
Milestone[] milestone_list


================================================================================
MSG: patrol_planner/Milestone
string name
float32 x
float32 y
float32 z
float32 w
")

(setf (get patrol_planner::PathLoadResponse :md5sum-) "813591a0b724e5a0e599fdf9d754d157")
(setf (get patrol_planner::PathLoadResponse :datatype-) "patrol_planner/PathLoadResponse")
(setf (get patrol_planner::PathLoadResponse :definition-)
      "string path_name
string table_path_name
---
Milestone[] milestone_list


================================================================================
MSG: patrol_planner/Milestone
string name
float32 x
float32 y
float32 z
float32 w
")



(provide :patrol_planner/PathLoad "813591a0b724e5a0e599fdf9d754d157")


