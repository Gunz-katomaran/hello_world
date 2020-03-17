;; Auto-generated. Do not edit!


(when (boundp 'path_planner::Manager)
  (if (not (find-package "PATH_PLANNER"))
    (make-package "PATH_PLANNER"))
  (shadow 'Manager (find-package "PATH_PLANNER")))
(unless (find-package "PATH_PLANNER::MANAGER")
  (make-package "PATH_PLANNER::MANAGER"))
(unless (find-package "PATH_PLANNER::MANAGERREQUEST")
  (make-package "PATH_PLANNER::MANAGERREQUEST"))
(unless (find-package "PATH_PLANNER::MANAGERRESPONSE")
  (make-package "PATH_PLANNER::MANAGERRESPONSE"))

(in-package "ROS")





(defclass path_planner::ManagerRequest
  :super ros::object
  :slots (_name ))

(defmethod path_planner::ManagerRequest
  (:init
   (&key
    ((:name __name) "")
    )
   (send-super :init)
   (setq _name (string __name))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass path_planner::ManagerResponse
  :super ros::object
  :slots (_status ))

(defmethod path_planner::ManagerResponse
  (:init
   (&key
    ((:status __status) "")
    )
   (send-super :init)
   (setq _status (string __status))
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; string _status
    4 (length _status)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _status
       (write-long (length _status) s) (princ _status s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _status
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _status (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass path_planner::Manager
  :super ros::object
  :slots ())

(setf (get path_planner::Manager :md5sum-) "e39df53132eef39cca149f18cce9cea9")
(setf (get path_planner::Manager :datatype-) "path_planner/Manager")
(setf (get path_planner::Manager :request) path_planner::ManagerRequest)
(setf (get path_planner::Manager :response) path_planner::ManagerResponse)

(defmethod path_planner::ManagerRequest
  (:response () (instance path_planner::ManagerResponse :init)))

(setf (get path_planner::ManagerRequest :md5sum-) "e39df53132eef39cca149f18cce9cea9")
(setf (get path_planner::ManagerRequest :datatype-) "path_planner/ManagerRequest")
(setf (get path_planner::ManagerRequest :definition-)
      "string name
---
string status

")

(setf (get path_planner::ManagerResponse :md5sum-) "e39df53132eef39cca149f18cce9cea9")
(setf (get path_planner::ManagerResponse :datatype-) "path_planner/ManagerResponse")
(setf (get path_planner::ManagerResponse :definition-)
      "string name
---
string status

")



(provide :path_planner/Manager "e39df53132eef39cca149f18cce9cea9")


