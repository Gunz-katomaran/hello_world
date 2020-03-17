;; Auto-generated. Do not edit!


(when (boundp 'patrol_planner::Pause)
  (if (not (find-package "PATROL_PLANNER"))
    (make-package "PATROL_PLANNER"))
  (shadow 'Pause (find-package "PATROL_PLANNER")))
(unless (find-package "PATROL_PLANNER::PAUSE")
  (make-package "PATROL_PLANNER::PAUSE"))
(unless (find-package "PATROL_PLANNER::PAUSEREQUEST")
  (make-package "PATROL_PLANNER::PAUSEREQUEST"))
(unless (find-package "PATROL_PLANNER::PAUSERESPONSE")
  (make-package "PATROL_PLANNER::PAUSERESPONSE"))

(in-package "ROS")





(defclass patrol_planner::PauseRequest
  :super ros::object
  :slots (_name ))

(defmethod patrol_planner::PauseRequest
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

(defclass patrol_planner::PauseResponse
  :super ros::object
  :slots (_reply ))

(defmethod patrol_planner::PauseResponse
  (:init
   (&key
    ((:reply __reply) "")
    )
   (send-super :init)
   (setq _reply (string __reply))
   self)
  (:reply
   (&optional __reply)
   (if __reply (setq _reply __reply)) _reply)
  (:serialization-length
   ()
   (+
    ;; string _reply
    4 (length _reply)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _reply
       (write-long (length _reply) s) (princ _reply s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _reply
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _reply (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass patrol_planner::Pause
  :super ros::object
  :slots ())

(setf (get patrol_planner::Pause :md5sum-) "3dfb9d0014ecbba1e3c8cb189553972f")
(setf (get patrol_planner::Pause :datatype-) "patrol_planner/Pause")
(setf (get patrol_planner::Pause :request) patrol_planner::PauseRequest)
(setf (get patrol_planner::Pause :response) patrol_planner::PauseResponse)

(defmethod patrol_planner::PauseRequest
  (:response () (instance patrol_planner::PauseResponse :init)))

(setf (get patrol_planner::PauseRequest :md5sum-) "3dfb9d0014ecbba1e3c8cb189553972f")
(setf (get patrol_planner::PauseRequest :datatype-) "patrol_planner/PauseRequest")
(setf (get patrol_planner::PauseRequest :definition-)
      "string name
---
string reply

")

(setf (get patrol_planner::PauseResponse :md5sum-) "3dfb9d0014ecbba1e3c8cb189553972f")
(setf (get patrol_planner::PauseResponse :datatype-) "patrol_planner/PauseResponse")
(setf (get patrol_planner::PauseResponse :definition-)
      "string name
---
string reply

")



(provide :patrol_planner/Pause "3dfb9d0014ecbba1e3c8cb189553972f")


