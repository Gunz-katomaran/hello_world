;; Auto-generated. Do not edit!


(when (boundp 'robo_waiter::Park)
  (if (not (find-package "ROBO_WAITER"))
    (make-package "ROBO_WAITER"))
  (shadow 'Park (find-package "ROBO_WAITER")))
(unless (find-package "ROBO_WAITER::PARK")
  (make-package "ROBO_WAITER::PARK"))
(unless (find-package "ROBO_WAITER::PARKREQUEST")
  (make-package "ROBO_WAITER::PARKREQUEST"))
(unless (find-package "ROBO_WAITER::PARKRESPONSE")
  (make-package "ROBO_WAITER::PARKRESPONSE"))

(in-package "ROS")





(defclass robo_waiter::ParkRequest
  :super ros::object
  :slots (_status ))

(defmethod robo_waiter::ParkRequest
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

(defclass robo_waiter::ParkResponse
  :super ros::object
  :slots (_reply ))

(defmethod robo_waiter::ParkResponse
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

(defclass robo_waiter::Park
  :super ros::object
  :slots ())

(setf (get robo_waiter::Park :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get robo_waiter::Park :datatype-) "robo_waiter/Park")
(setf (get robo_waiter::Park :request) robo_waiter::ParkRequest)
(setf (get robo_waiter::Park :response) robo_waiter::ParkResponse)

(defmethod robo_waiter::ParkRequest
  (:response () (instance robo_waiter::ParkResponse :init)))

(setf (get robo_waiter::ParkRequest :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get robo_waiter::ParkRequest :datatype-) "robo_waiter/ParkRequest")
(setf (get robo_waiter::ParkRequest :definition-)
      "bool status
---
string reply

")

(setf (get robo_waiter::ParkResponse :md5sum-) "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(setf (get robo_waiter::ParkResponse :datatype-) "robo_waiter/ParkResponse")
(setf (get robo_waiter::ParkResponse :definition-)
      "bool status
---
string reply

")



(provide :robo_waiter/Park "4a4b2bdf33b9dce4f3e033bed4cd41b8")


