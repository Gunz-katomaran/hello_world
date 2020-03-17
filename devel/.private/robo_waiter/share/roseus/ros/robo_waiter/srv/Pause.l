;; Auto-generated. Do not edit!


(when (boundp 'robo_waiter::Pause)
  (if (not (find-package "ROBO_WAITER"))
    (make-package "ROBO_WAITER"))
  (shadow 'Pause (find-package "ROBO_WAITER")))
(unless (find-package "ROBO_WAITER::PAUSE")
  (make-package "ROBO_WAITER::PAUSE"))
(unless (find-package "ROBO_WAITER::PAUSEREQUEST")
  (make-package "ROBO_WAITER::PAUSEREQUEST"))
(unless (find-package "ROBO_WAITER::PAUSERESPONSE")
  (make-package "ROBO_WAITER::PAUSERESPONSE"))

(in-package "ROS")





(defclass robo_waiter::PauseRequest
  :super ros::object
  :slots (_name ))

(defmethod robo_waiter::PauseRequest
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

(defclass robo_waiter::PauseResponse
  :super ros::object
  :slots (_reply ))

(defmethod robo_waiter::PauseResponse
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

(defclass robo_waiter::Pause
  :super ros::object
  :slots ())

(setf (get robo_waiter::Pause :md5sum-) "3dfb9d0014ecbba1e3c8cb189553972f")
(setf (get robo_waiter::Pause :datatype-) "robo_waiter/Pause")
(setf (get robo_waiter::Pause :request) robo_waiter::PauseRequest)
(setf (get robo_waiter::Pause :response) robo_waiter::PauseResponse)

(defmethod robo_waiter::PauseRequest
  (:response () (instance robo_waiter::PauseResponse :init)))

(setf (get robo_waiter::PauseRequest :md5sum-) "3dfb9d0014ecbba1e3c8cb189553972f")
(setf (get robo_waiter::PauseRequest :datatype-) "robo_waiter/PauseRequest")
(setf (get robo_waiter::PauseRequest :definition-)
      "string name
---
string reply

")

(setf (get robo_waiter::PauseResponse :md5sum-) "3dfb9d0014ecbba1e3c8cb189553972f")
(setf (get robo_waiter::PauseResponse :datatype-) "robo_waiter/PauseResponse")
(setf (get robo_waiter::PauseResponse :definition-)
      "string name
---
string reply

")



(provide :robo_waiter/Pause "3dfb9d0014ecbba1e3c8cb189553972f")


