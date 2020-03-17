;; Auto-generated. Do not edit!


(when (boundp 'patrol_planner::Obstacle)
  (if (not (find-package "PATROL_PLANNER"))
    (make-package "PATROL_PLANNER"))
  (shadow 'Obstacle (find-package "PATROL_PLANNER")))
(unless (find-package "PATROL_PLANNER::OBSTACLE")
  (make-package "PATROL_PLANNER::OBSTACLE"))
(unless (find-package "PATROL_PLANNER::OBSTACLEREQUEST")
  (make-package "PATROL_PLANNER::OBSTACLEREQUEST"))
(unless (find-package "PATROL_PLANNER::OBSTACLERESPONSE")
  (make-package "PATROL_PLANNER::OBSTACLERESPONSE"))

(in-package "ROS")





(defclass patrol_planner::ObstacleRequest
  :super ros::object
  :slots (_status ))

(defmethod patrol_planner::ObstacleRequest
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

(defclass patrol_planner::ObstacleResponse
  :super ros::object
  :slots (_reply ))

(defmethod patrol_planner::ObstacleResponse
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

(defclass patrol_planner::Obstacle
  :super ros::object
  :slots ())

(setf (get patrol_planner::Obstacle :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get patrol_planner::Obstacle :datatype-) "patrol_planner/Obstacle")
(setf (get patrol_planner::Obstacle :request) patrol_planner::ObstacleRequest)
(setf (get patrol_planner::Obstacle :response) patrol_planner::ObstacleResponse)

(defmethod patrol_planner::ObstacleRequest
  (:response () (instance patrol_planner::ObstacleResponse :init)))

(setf (get patrol_planner::ObstacleRequest :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get patrol_planner::ObstacleRequest :datatype-) "patrol_planner/ObstacleRequest")
(setf (get patrol_planner::ObstacleRequest :definition-)
      "bool status
---
string reply

")

(setf (get patrol_planner::ObstacleResponse :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get patrol_planner::ObstacleResponse :datatype-) "patrol_planner/ObstacleResponse")
(setf (get patrol_planner::ObstacleResponse :definition-)
      "bool status
---
string reply

")



(provide :patrol_planner/Obstacle "4a4b2bdf33b9dce4f3e033bed4cd41b8")


