;; Auto-generated. Do not edit!


(when (boundp 'my_change::Sonic)
  (if (not (find-package "MY_CHANGE"))
    (make-package "MY_CHANGE"))
  (shadow 'Sonic (find-package "MY_CHANGE")))
(unless (find-package "MY_CHANGE::SONIC")
  (make-package "MY_CHANGE::SONIC"))

(in-package "ROS")
;;//! \htmlinclude Sonic.msg.html


(defclass my_change::Sonic
  :super ros::object
  :slots (_no _distance1 _distance2 _distance3 _distance4 _distance5 ))

(defmethod my_change::Sonic
  (:init
   (&key
    ((:no __no) 0)
    ((:distance1 __distance1) 0.0)
    ((:distance2 __distance2) 0.0)
    ((:distance3 __distance3) 0.0)
    ((:distance4 __distance4) 0.0)
    ((:distance5 __distance5) 0.0)
    )
   (send-super :init)
   (setq _no (round __no))
   (setq _distance1 (float __distance1))
   (setq _distance2 (float __distance2))
   (setq _distance3 (float __distance3))
   (setq _distance4 (float __distance4))
   (setq _distance5 (float __distance5))
   self)
  (:no
   (&optional __no)
   (if __no (setq _no __no)) _no)
  (:distance1
   (&optional __distance1)
   (if __distance1 (setq _distance1 __distance1)) _distance1)
  (:distance2
   (&optional __distance2)
   (if __distance2 (setq _distance2 __distance2)) _distance2)
  (:distance3
   (&optional __distance3)
   (if __distance3 (setq _distance3 __distance3)) _distance3)
  (:distance4
   (&optional __distance4)
   (if __distance4 (setq _distance4 __distance4)) _distance4)
  (:distance5
   (&optional __distance5)
   (if __distance5 (setq _distance5 __distance5)) _distance5)
  (:serialization-length
   ()
   (+
    ;; int32 _no
    4
    ;; float32 _distance1
    4
    ;; float32 _distance2
    4
    ;; float32 _distance3
    4
    ;; float32 _distance4
    4
    ;; float32 _distance5
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _no
       (write-long _no s)
     ;; float32 _distance1
       (sys::poke _distance1 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _distance2
       (sys::poke _distance2 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _distance3
       (sys::poke _distance3 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _distance4
       (sys::poke _distance4 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _distance5
       (sys::poke _distance5 (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _no
     (setq _no (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _distance1
     (setq _distance1 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _distance2
     (setq _distance2 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _distance3
     (setq _distance3 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _distance4
     (setq _distance4 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _distance5
     (setq _distance5 (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get my_change::Sonic :md5sum-) "28ade20c4ac74f4cfe91fd6effaf9b2e")
(setf (get my_change::Sonic :datatype-) "my_change/Sonic")
(setf (get my_change::Sonic :definition-)
      "int32 no
float32 distance1
float32 distance2
float32 distance3
float32 distance4
float32 distance5

")



(provide :my_change/Sonic "28ade20c4ac74f4cfe91fd6effaf9b2e")


