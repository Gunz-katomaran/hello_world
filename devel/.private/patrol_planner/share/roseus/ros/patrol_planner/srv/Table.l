;; Auto-generated. Do not edit!


(when (boundp 'patrol_planner::Table)
  (if (not (find-package "PATROL_PLANNER"))
    (make-package "PATROL_PLANNER"))
  (shadow 'Table (find-package "PATROL_PLANNER")))
(unless (find-package "PATROL_PLANNER::TABLE")
  (make-package "PATROL_PLANNER::TABLE"))
(unless (find-package "PATROL_PLANNER::TABLEREQUEST")
  (make-package "PATROL_PLANNER::TABLEREQUEST"))
(unless (find-package "PATROL_PLANNER::TABLERESPONSE")
  (make-package "PATROL_PLANNER::TABLERESPONSE"))

(in-package "ROS")





(defclass patrol_planner::TableRequest
  :super ros::object
  :slots (_table_name ))

(defmethod patrol_planner::TableRequest
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

(defclass patrol_planner::TableResponse
  :super ros::object
  :slots (_reply ))

(defmethod patrol_planner::TableResponse
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

(defclass patrol_planner::Table
  :super ros::object
  :slots ())

(setf (get patrol_planner::Table :md5sum-) "d9bc86335236069bddf3bda6b288eda2")
(setf (get patrol_planner::Table :datatype-) "patrol_planner/Table")
(setf (get patrol_planner::Table :request) patrol_planner::TableRequest)
(setf (get patrol_planner::Table :response) patrol_planner::TableResponse)

(defmethod patrol_planner::TableRequest
  (:response () (instance patrol_planner::TableResponse :init)))

(setf (get patrol_planner::TableRequest :md5sum-) "d9bc86335236069bddf3bda6b288eda2")
(setf (get patrol_planner::TableRequest :datatype-) "patrol_planner/TableRequest")
(setf (get patrol_planner::TableRequest :definition-)
      "string table_name
---
string reply

")

(setf (get patrol_planner::TableResponse :md5sum-) "d9bc86335236069bddf3bda6b288eda2")
(setf (get patrol_planner::TableResponse :datatype-) "patrol_planner/TableResponse")
(setf (get patrol_planner::TableResponse :definition-)
      "string table_name
---
string reply

")



(provide :patrol_planner/Table "d9bc86335236069bddf3bda6b288eda2")


