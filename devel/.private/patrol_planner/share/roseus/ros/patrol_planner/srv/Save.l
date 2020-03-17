;; Auto-generated. Do not edit!


(when (boundp 'patrol_planner::Save)
  (if (not (find-package "PATROL_PLANNER"))
    (make-package "PATROL_PLANNER"))
  (shadow 'Save (find-package "PATROL_PLANNER")))
(unless (find-package "PATROL_PLANNER::SAVE")
  (make-package "PATROL_PLANNER::SAVE"))
(unless (find-package "PATROL_PLANNER::SAVEREQUEST")
  (make-package "PATROL_PLANNER::SAVEREQUEST"))
(unless (find-package "PATROL_PLANNER::SAVERESPONSE")
  (make-package "PATROL_PLANNER::SAVERESPONSE"))

(in-package "ROS")





(defclass patrol_planner::SaveRequest
  :super ros::object
  :slots (_name ))

(defmethod patrol_planner::SaveRequest
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

(defclass patrol_planner::SaveResponse
  :super ros::object
  :slots (_status ))

(defmethod patrol_planner::SaveResponse
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

(defclass patrol_planner::Save
  :super ros::object
  :slots ())

(setf (get patrol_planner::Save :md5sum-) "e39df53132eef39cca149f18cce9cea9")
(setf (get patrol_planner::Save :datatype-) "patrol_planner/Save")
(setf (get patrol_planner::Save :request) patrol_planner::SaveRequest)
(setf (get patrol_planner::Save :response) patrol_planner::SaveResponse)

(defmethod patrol_planner::SaveRequest
  (:response () (instance patrol_planner::SaveResponse :init)))

(setf (get patrol_planner::SaveRequest :md5sum-) "e39df53132eef39cca149f18cce9cea9")
(setf (get patrol_planner::SaveRequest :datatype-) "patrol_planner/SaveRequest")
(setf (get patrol_planner::SaveRequest :definition-)
      "string name
---
string status

")

(setf (get patrol_planner::SaveResponse :md5sum-) "e39df53132eef39cca149f18cce9cea9")
(setf (get patrol_planner::SaveResponse :datatype-) "patrol_planner/SaveResponse")
(setf (get patrol_planner::SaveResponse :definition-)
      "string name
---
string status

")



(provide :patrol_planner/Save "e39df53132eef39cca149f18cce9cea9")


