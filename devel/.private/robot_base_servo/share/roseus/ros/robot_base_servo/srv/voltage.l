;; Auto-generated. Do not edit!


(when (boundp 'robot_base_servo::voltage)
  (if (not (find-package "ROBOT_BASE_SERVO"))
    (make-package "ROBOT_BASE_SERVO"))
  (shadow 'voltage (find-package "ROBOT_BASE_SERVO")))
(unless (find-package "ROBOT_BASE_SERVO::VOLTAGE")
  (make-package "ROBOT_BASE_SERVO::VOLTAGE"))
(unless (find-package "ROBOT_BASE_SERVO::VOLTAGEREQUEST")
  (make-package "ROBOT_BASE_SERVO::VOLTAGEREQUEST"))
(unless (find-package "ROBOT_BASE_SERVO::VOLTAGERESPONSE")
  (make-package "ROBOT_BASE_SERVO::VOLTAGERESPONSE"))

(in-package "ROS")





(defclass robot_base_servo::voltageRequest
  :super ros::object
  :slots ())

(defmethod robot_base_servo::voltageRequest
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

(defclass robot_base_servo::voltageResponse
  :super ros::object
  :slots (_volt_1 _volt_2 _volt_3 _volt_4 ))

(defmethod robot_base_servo::voltageResponse
  (:init
   (&key
    ((:volt_1 __volt_1) 0.0)
    ((:volt_2 __volt_2) 0.0)
    ((:volt_3 __volt_3) 0.0)
    ((:volt_4 __volt_4) 0.0)
    )
   (send-super :init)
   (setq _volt_1 (float __volt_1))
   (setq _volt_2 (float __volt_2))
   (setq _volt_3 (float __volt_3))
   (setq _volt_4 (float __volt_4))
   self)
  (:volt_1
   (&optional __volt_1)
   (if __volt_1 (setq _volt_1 __volt_1)) _volt_1)
  (:volt_2
   (&optional __volt_2)
   (if __volt_2 (setq _volt_2 __volt_2)) _volt_2)
  (:volt_3
   (&optional __volt_3)
   (if __volt_3 (setq _volt_3 __volt_3)) _volt_3)
  (:volt_4
   (&optional __volt_4)
   (if __volt_4 (setq _volt_4 __volt_4)) _volt_4)
  (:serialization-length
   ()
   (+
    ;; float32 _volt_1
    4
    ;; float32 _volt_2
    4
    ;; float32 _volt_3
    4
    ;; float32 _volt_4
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _volt_1
       (sys::poke _volt_1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _volt_2
       (sys::poke _volt_2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _volt_3
       (sys::poke _volt_3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _volt_4
       (sys::poke _volt_4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _volt_1
     (setq _volt_1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _volt_2
     (setq _volt_2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _volt_3
     (setq _volt_3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _volt_4
     (setq _volt_4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(defclass robot_base_servo::voltage
  :super ros::object
  :slots ())

(setf (get robot_base_servo::voltage :md5sum-) "00886afbc7627a03f5753fba171f3ab9")
(setf (get robot_base_servo::voltage :datatype-) "robot_base_servo/voltage")
(setf (get robot_base_servo::voltage :request) robot_base_servo::voltageRequest)
(setf (get robot_base_servo::voltage :response) robot_base_servo::voltageResponse)

(defmethod robot_base_servo::voltageRequest
  (:response () (instance robot_base_servo::voltageResponse :init)))

(setf (get robot_base_servo::voltageRequest :md5sum-) "00886afbc7627a03f5753fba171f3ab9")
(setf (get robot_base_servo::voltageRequest :datatype-) "robot_base_servo/voltageRequest")
(setf (get robot_base_servo::voltageRequest :definition-)
      "---
float32 volt_1
float32 volt_2
float32 volt_3
float32 volt_4

")

(setf (get robot_base_servo::voltageResponse :md5sum-) "00886afbc7627a03f5753fba171f3ab9")
(setf (get robot_base_servo::voltageResponse :datatype-) "robot_base_servo/voltageResponse")
(setf (get robot_base_servo::voltageResponse :definition-)
      "---
float32 volt_1
float32 volt_2
float32 volt_3
float32 volt_4

")



(provide :robot_base_servo/voltage "00886afbc7627a03f5753fba171f3ab9")


