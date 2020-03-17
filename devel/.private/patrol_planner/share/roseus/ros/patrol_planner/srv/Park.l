;; Auto-generated. Do not edit!


(when (boundp 'patrol_planner::Park)
  (if (not (find-package "PATROL_PLANNER"))
    (make-package "PATROL_PLANNER"))
  (shadow 'Park (find-package "PATROL_PLANNER")))
(unless (find-package "PATROL_PLANNER::PARK")
  (make-package "PATROL_PLANNER::PARK"))
(unless (find-package "PATROL_PLANNER::PARKREQUEST")
  (make-package "PATROL_PLANNER::PARKREQUEST"))
(unless (find-package "PATROL_PLANNER::PARKRESPONSE")
  (make-package "PATROL_PLANNER::PARKRESPONSE"))

(in-package "ROS")





(defclass patrol_planner::ParkRequest
  :super ros::object
  :slots (_status ))

(defmethod patrol_planner::ParkRequest
  (:init
   (&key
    ((:status __status) nil)
    )
   (send-super :init)
   (setq _status __status)
   self)
  (:status
   (&optional __status)
   (if __status (setq _status __status)) _status)
  (:serialization-length
   ()
   (+
    ;; bool _status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _status
       (if _status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _status
     (setq _status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass patrol_planner::ParkResponse
  :super ros::object
  :slots (_reply ))

(defmethod patrol_planner::ParkResponse
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

(defclass patrol_planner::Park
  :super ros::object
  :slots ())

(setf (get patrol_planner::Park :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get patrol_planner::Park :datatype-) "patrol_planner/Park")
(setf (get patrol_planner::Park :request) patrol_planner::ParkRequest)
(setf (get patrol_planner::Park :response) patrol_planner::ParkResponse)

(defmethod patrol_planner::ParkRequest
  (:response () (instance patrol_planner::ParkResponse :init)))

(setf (get patrol_planner::ParkRequest :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get patrol_planner::ParkRequest :datatype-) "patrol_planner/ParkRequest")
(setf (get patrol_planner::ParkRequest :definition-)
      "bool status
---
string reply

")

(setf (get patrol_planner::ParkResponse :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get patrol_planner::ParkResponse :datatype-) "patrol_planner/ParkResponse")
(setf (get patrol_planner::ParkResponse :definition-)
      "bool status
---
string reply

")



(provide :patrol_planner/Park "4a4b2bdf33b9dce4f3e033bed4cd41b8")


