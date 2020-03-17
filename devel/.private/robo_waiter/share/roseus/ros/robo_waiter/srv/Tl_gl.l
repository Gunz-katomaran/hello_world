;; Auto-generated. Do not edit!


(when (boundp 'robo_waiter::Tl_gl)
  (if (not (find-package "ROBO_WAITER"))
    (make-package "ROBO_WAITER"))
  (shadow 'Tl_gl (find-package "ROBO_WAITER")))
(unless (find-package "ROBO_WAITER::TL_GL")
  (make-package "ROBO_WAITER::TL_GL"))
(unless (find-package "ROBO_WAITER::TL_GLREQUEST")
  (make-package "ROBO_WAITER::TL_GLREQUEST"))
(unless (find-package "ROBO_WAITER::TL_GLRESPONSE")
  (make-package "ROBO_WAITER::TL_GLRESPONSE"))

(in-package "ROS")





(defclass robo_waiter::Tl_glRequest
  :super ros::object
  :slots (_table_name _direction _duration ))

(defmethod robo_waiter::Tl_glRequest
  (:init
   (&key
    ((:table_name __table_name) "")
    ((:direction __direction) "")
    ((:duration __duration) 0)
    )
   (send-super :init)
   (setq _table_name (string __table_name))
   (setq _direction (string __direction))
   (setq _duration (round __duration))
   self)
  (:table_name
   (&optional __table_name)
   (if __table_name (setq _table_name __table_name)) _table_name)
  (:direction
   (&optional __direction)
   (if __direction (setq _direction __direction)) _direction)
  (:duration
   (&optional __duration)
   (if __duration (setq _duration __duration)) _duration)
  (:serialization-length
   ()
   (+
    ;; string _table_name
    4 (length _table_name)
    ;; string _direction
    4 (length _direction)
    ;; int32 _duration
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _table_name
       (write-long (length _table_name) s) (princ _table_name s)
     ;; string _direction
       (write-long (length _direction) s) (princ _direction s)
     ;; int32 _duration
       (write-long _duration s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _table_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _table_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _duration
     (setq _duration (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass robo_waiter::Tl_glResponse
  :super ros::object
  :slots (_reply ))

(defmethod robo_waiter::Tl_glResponse
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

(defclass robo_waiter::Tl_gl
  :super ros::object
  :slots ())

(setf (get robo_waiter::Tl_gl :md5sum-) "845a03915f6be3b247beed805d731b4d")
(setf (get robo_waiter::Tl_gl :datatype-) "robo_waiter/Tl_gl")
(setf (get robo_waiter::Tl_gl :request) robo_waiter::Tl_glRequest)
(setf (get robo_waiter::Tl_gl :response) robo_waiter::Tl_glResponse)

(defmethod robo_waiter::Tl_glRequest
  (:response () (instance robo_waiter::Tl_glResponse :init)))

(setf (get robo_waiter::Tl_glRequest :md5sum-) "845a03915f6be3b247beed805d731b4d")
(setf (get robo_waiter::Tl_glRequest :datatype-) "robo_waiter/Tl_glRequest")
(setf (get robo_waiter::Tl_glRequest :definition-)
      "string table_name
string direction
int32 duration
---
string reply

")

(setf (get robo_waiter::Tl_glResponse :md5sum-) "845a03915f6be3b247beed805d731b4d")
(setf (get robo_waiter::Tl_glResponse :datatype-) "robo_waiter/Tl_glResponse")
(setf (get robo_waiter::Tl_glResponse :definition-)
      "string table_name
string direction
int32 duration
---
string reply

")



(provide :robo_waiter/Tl_gl "845a03915f6be3b247beed805d731b4d")


