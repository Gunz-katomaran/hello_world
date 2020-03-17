;; Auto-generated. Do not edit!


(when (boundp 'robo_waiter::Table)
  (if (not (find-package "ROBO_WAITER"))
    (make-package "ROBO_WAITER"))
  (shadow 'Table (find-package "ROBO_WAITER")))
(unless (find-package "ROBO_WAITER::TABLE")
  (make-package "ROBO_WAITER::TABLE"))
(unless (find-package "ROBO_WAITER::TABLEREQUEST")
  (make-package "ROBO_WAITER::TABLEREQUEST"))
(unless (find-package "ROBO_WAITER::TABLERESPONSE")
  (make-package "ROBO_WAITER::TABLERESPONSE"))

(in-package "ROS")





(defclass robo_waiter::TableRequest
  :super ros::object
  :slots (_table_name ))

(defmethod robo_waiter::TableRequest
  (:init
   (&key
    ((:table_name __table_name) "")
    )
   (send-super :init)
   (setq _table_name (string __table_name))
   self)
  (:table_name
   (&optional __table_name)
   (if __table_name (setq _table_name __table_name)) _table_name)
  (:serialization-length
   ()
   (+
    ;; string _table_name
    4 (length _table_name)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _table_name
       (write-long (length _table_name) s) (princ _table_name s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _table_name
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _table_name (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass robo_waiter::TableResponse
  :super ros::object
  :slots (_reply ))

(defmethod robo_waiter::TableResponse
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

(defclass robo_waiter::Table
  :super ros::object
  :slots ())

(setf (get robo_waiter::Table :md5sum-) "d9bc86335236069bddf3bda6b288eda2")
(setf (get robo_waiter::Table :datatype-) "robo_waiter/Table")
(setf (get robo_waiter::Table :request) robo_waiter::TableRequest)
(setf (get robo_waiter::Table :response) robo_waiter::TableResponse)

(defmethod robo_waiter::TableRequest
  (:response () (instance robo_waiter::TableResponse :init)))

(setf (get robo_waiter::TableRequest :md5sum-) "d9bc86335236069bddf3bda6b288eda2")
(setf (get robo_waiter::TableRequest :datatype-) "robo_waiter/TableRequest")
(setf (get robo_waiter::TableRequest :definition-)
      "string table_name
---
string reply

")

(setf (get robo_waiter::TableResponse :md5sum-) "d9bc86335236069bddf3bda6b288eda2")
(setf (get robo_waiter::TableResponse :datatype-) "robo_waiter/TableResponse")
(setf (get robo_waiter::TableResponse :definition-)
      "string table_name
---
string reply

")



(provide :robo_waiter/Table "d9bc86335236069bddf3bda6b288eda2")


