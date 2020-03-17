;; Auto-generated. Do not edit!


(when (boundp 'robo_waiter::Obstacle)
  (if (not (find-package "ROBO_WAITER"))
    (make-package "ROBO_WAITER"))
  (shadow 'Obstacle (find-package "ROBO_WAITER")))
(unless (find-package "ROBO_WAITER::OBSTACLE")
  (make-package "ROBO_WAITER::OBSTACLE"))
(unless (find-package "ROBO_WAITER::OBSTACLEREQUEST")
  (make-package "ROBO_WAITER::OBSTACLEREQUEST"))
(unless (find-package "ROBO_WAITER::OBSTACLERESPONSE")
  (make-package "ROBO_WAITER::OBSTACLERESPONSE"))

(in-package "ROS")





(defclass robo_waiter::ObstacleRequest
  :super ros::object
  :slots (_status ))

(defmethod robo_waiter::ObstacleRequest
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

(defclass robo_waiter::ObstacleResponse
  :super ros::object
  :slots (_reply ))

(defmethod robo_waiter::ObstacleResponse
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

(defclass robo_waiter::Obstacle
  :super ros::object
  :slots ())

(setf (get robo_waiter::Obstacle :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get robo_waiter::Obstacle :datatype-) "robo_waiter/Obstacle")
(setf (get robo_waiter::Obstacle :request) robo_waiter::ObstacleRequest)
(setf (get robo_waiter::Obstacle :response) robo_waiter::ObstacleResponse)

(defmethod robo_waiter::ObstacleRequest
  (:response () (instance robo_waiter::ObstacleResponse :init)))

(setf (get robo_waiter::ObstacleRequest :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get robo_waiter::ObstacleRequest :datatype-) "robo_waiter/ObstacleRequest")
(setf (get robo_waiter::ObstacleRequest :definition-)
      "bool status
---
string reply

")

(setf (get robo_waiter::ObstacleResponse :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get robo_waiter::ObstacleResponse :datatype-) "robo_waiter/ObstacleResponse")
(setf (get robo_waiter::ObstacleResponse :definition-)
      "bool status
---
string reply

")



(provide :robo_waiter/Obstacle "4a4b2bdf33b9dce4f3e033bed4cd41b8")


