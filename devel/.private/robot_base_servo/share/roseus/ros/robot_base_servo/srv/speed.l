;; Auto-generated. Do not edit!


(when (boundp 'robot_base_servo::speed)
  (if (not (find-package "ROBOT_BASE_SERVO"))
    (make-package "ROBOT_BASE_SERVO"))
  (shadow 'speed (find-package "ROBOT_BASE_SERVO")))
(unless (find-package "ROBOT_BASE_SERVO::SPEED")
  (make-package "ROBOT_BASE_SERVO::SPEED"))
(unless (find-package "ROBOT_BASE_SERVO::SPEEDREQUEST")
  (make-package "ROBOT_BASE_SERVO::SPEEDREQUEST"))
(unless (find-package "ROBOT_BASE_SERVO::SPEEDRESPONSE")
  (make-package "ROBOT_BASE_SERVO::SPEEDRESPONSE"))

(in-package "ROS")





(defclass robot_base_servo::speedRequest
  :super ros::object
  :slots ())

(defmethod robot_base_servo::speedRequest
  (:init
   (&key
    )
   (send-super :init)
   self)
  (:serialization-length
   ()
   (+
    0
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;;
   self)
  )

(defclass robot_base_servo::speedResponse
  :super ros::object
  :slots (_speed_1 _speed_2 _speed_3 _speed_4 ))

(defmethod robot_base_servo::speedResponse
  (:init
   (&key
    ((:speed_1 __speed_1) 0)
    ((:speed_2 __speed_2) 0)
    ((:speed_3 __speed_3) 0)
    ((:speed_4 __speed_4) 0)
    )
   (send-super :init)
   (setq _speed_1 (round __speed_1))
   (setq _speed_2 (round __speed_2))
   (setq _speed_3 (round __speed_3))
   (setq _speed_4 (round __speed_4))
   self)
  (:speed_1
   (&optional __speed_1)
   (if __speed_1 (setq _speed_1 __speed_1)) _speed_1)
  (:speed_2
   (&optional __speed_2)
   (if __speed_2 (setq _speed_2 __speed_2)) _speed_2)
  (:speed_3
   (&optional __speed_3)
   (if __speed_3 (setq _speed_3 __speed_3)) _speed_3)
  (:speed_4
   (&optional __speed_4)
   (if __speed_4 (setq _speed_4 __speed_4)) _speed_4)
  (:serialization-length
   ()
   (+
    ;; int32 _speed_1
    4
    ;; int32 _speed_2
    4
    ;; int32 _speed_3
    4
    ;; int32 _speed_4
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _speed_1
       (write-long _speed_1 s)
     ;; int32 _speed_2
       (write-long _speed_2 s)
     ;; int32 _speed_3
       (write-long _speed_3 s)
     ;; int32 _speed_4
       (write-long _speed_4 s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _speed_1
     (setq _speed_1 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _speed_2
     (setq _speed_2 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _speed_3
     (setq _speed_3 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _speed_4
     (setq _speed_4 (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass robot_base_servo::speed
  :super ros::object
  :slots ())

(setf (get robot_base_servo::speed :md5sum-) "f4e6290d51987b0b075a95509c473580")
(setf (get robot_base_servo::speed :datatype-) "robot_base_servo/speed")
(setf (get robot_base_servo::speed :request) robot_base_servo::speedRequest)
(setf (get robot_base_servo::speed :response) robot_base_servo::speedResponse)

(defmethod robot_base_servo::speedRequest
  (:response () (instance robot_base_servo::speedResponse :init)))

(setf (get robot_base_servo::speedRequest :md5sum-) "f4e6290d51987b0b075a95509c473580")
(setf (get robot_base_servo::speedRequest :datatype-) "robot_base_servo/speedRequest")
(setf (get robot_base_servo::speedRequest :definition-)
      "---
int32 speed_1
int32 speed_2
int32 speed_3
int32 speed_4

")

(setf (get robot_base_servo::speedResponse :md5sum-) "f4e6290d51987b0b075a95509c473580")
(setf (get robot_base_servo::speedResponse :datatype-) "robot_base_servo/speedResponse")
(setf (get robot_base_servo::speedResponse :definition-)
      "---
int32 speed_1
int32 speed_2
int32 speed_3
int32 speed_4

")



(provide :robot_base_servo/speed "f4e6290d51987b0b075a95509c473580")


