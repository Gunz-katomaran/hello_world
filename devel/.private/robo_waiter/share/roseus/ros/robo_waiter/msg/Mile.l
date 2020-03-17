;; Auto-generated. Do not edit!


(when (boundp 'robo_waiter::Mile)
  (if (not (find-package "ROBO_WAITER"))
    (make-package "ROBO_WAITER"))
  (shadow 'Mile (find-package "ROBO_WAITER")))
(unless (find-package "ROBO_WAITER::MILE")
  (make-package "ROBO_WAITER::MILE"))

(in-package "ROS")
;;//! \htmlinclude Mile.msg.html


(defclass robo_waiter::Mile
  :super ros::object
  :slots (_table_name _table_direction _table_duration ))

(defmethod robo_waiter::Mile
  (:init
   (&key
    ((:table_name __table_name) "")
    ((:table_direction __table_direction) "")
    ((:table_duration __table_duration) 0)
    )
   (send-super :init)
   (setq _table_name (string __table_name))
   (setq _table_direction (string __table_direction))
   (setq _table_duration (round __table_duration))
   self)
  (:table_name
   (&optional __table_name)
   (if __table_name (setq _table_name __table_name)) _table_name)
  (:table_direction
   (&optional __table_direction)
   (if __table_direction (setq _table_direction __table_direction)) _table_direction)
  (:table_duration
   (&optional __table_duration)
   (if __table_duration (setq _table_duration __table_duration)) _table_duration)
  (:serialization-length
   ()
   (+
    ;; string _table_name
    4 (length _table_name)
    ;; string _table_direction
    4 (length _table_direction)
    ;; int32 _table_duration
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _table_name
       (write-long (length _table_name) s) (princ _table_name s)
     ;; string _table_direction
       (write-long (length _table_direction) s) (princ _table_direction s)
     ;; int32 _table_duration
       (write-long _table_duration s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _table_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _table_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _table_direction
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _table_direction (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; int32 _table_duration
     (setq _table_duration (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get robo_waiter::Mile :md5sum-) "a034aa34a43b47ed728f083557e2842d")
(setf (get robo_waiter::Mile :datatype-) "robo_waiter/Mile")
(setf (get robo_waiter::Mile :definition-)
      "string table_name
string table_direction
int32 table_duration

")



(provide :robo_waiter/Mile "a034aa34a43b47ed728f083557e2842d")


