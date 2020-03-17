;; Auto-generated. Do not edit!


(when (boundp 'robo_waiter::Tabled)
  (if (not (find-package "ROBO_WAITER"))
    (make-package "ROBO_WAITER"))
  (shadow 'Tabled (find-package "ROBO_WAITER")))
(unless (find-package "ROBO_WAITER::TABLED")
  (make-package "ROBO_WAITER::TABLED"))

(in-package "ROS")
;;//! \htmlinclude Tabled.msg.html


(defclass robo_waiter::Tabled
  :super ros::object
  :slots (_name _x _y _z _w ))

(defmethod robo_waiter::Tabled
  (:init
   (&key
    ((:name __name) "")
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:w __w) 0.0)
    )
   (send-super :init)
   (setq _name (string __name))
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _w (float __w))
   self)
  (:name
   (&optional __name)
   (if __name (setq _name __name)) _name)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:w
   (&optional __w)
   (if __w (setq _w __w)) _w)
  (:serialization-length
   ()
   (+
    ;; string _name
    4 (length _name)
    ;; float32 _x
    4
    ;; float32 _y
    4
    ;; float32 _z
    4
    ;; float32 _w
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _name
       (write-long (length _name) s) (princ _name s)
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _y
       (sys::poke _y (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _z
       (sys::poke _z (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32 _w
       (sys::poke _w (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _y
     (setq _y (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _z
     (setq _z (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32 _w
     (setq _w (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robo_waiter::Tabled :md5sum-) "96c018b19c8655a16f8ae708e0a815d4")
(setf (get robo_waiter::Tabled :datatype-) "robo_waiter/Tabled")
(setf (get robo_waiter::Tabled :definition-)
      "string name
float32 x
float32 y
float32 z
float32 w

")



(provide :robo_waiter/Tabled "96c018b19c8655a16f8ae708e0a815d4")


