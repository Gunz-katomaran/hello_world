;; Auto-generated. Do not edit!


(when (boundp 'patrol_planner::Tl_gl)
  (if (not (find-package "PATROL_PLANNER"))
    (make-package "PATROL_PLANNER"))
  (shadow 'Tl_gl (find-package "PATROL_PLANNER")))
(unless (find-package "PATROL_PLANNER::TL_GL")
  (make-package "PATROL_PLANNER::TL_GL"))
(unless (find-package "PATROL_PLANNER::TL_GLREQUEST")
  (make-package "PATROL_PLANNER::TL_GLREQUEST"))
(unless (find-package "PATROL_PLANNER::TL_GLRESPONSE")
  (make-package "PATROL_PLANNER::TL_GLRESPONSE"))

(in-package "ROS")





(defclass patrol_planner::Tl_glRequest
  :super ros::object
  :slots (_table_name ))

(defmethod patrol_planner::Tl_glRequest
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

(defclass patrol_planner::Tl_glResponse
  :super ros::object
  :slots (_reply ))

(defmethod patrol_planner::Tl_glResponse
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

(defclass patrol_planner::Tl_gl
  :super ros::object
  :slots ())

(setf (get patrol_planner::Tl_gl :md5sum-) "d9bc86335236069bddf3bda6b288eda2")
(setf (get patrol_planner::Tl_gl :datatype-) "patrol_planner/Tl_gl")
(setf (get patrol_planner::Tl_gl :request) patrol_planner::Tl_glRequest)
(setf (get patrol_planner::Tl_gl :response) patrol_planner::Tl_glResponse)

(defmethod patrol_planner::Tl_glRequest
  (:response () (instance patrol_planner::Tl_glResponse :init)))

(setf (get patrol_planner::Tl_glRequest :md5sum-) "d9bc86335236069bddf3bda6b288eda2")
(setf (get patrol_planner::Tl_glRequest :datatype-) "patrol_planner/Tl_glRequest")
(setf (get patrol_planner::Tl_glRequest :definition-)
      "string table_name
---
string reply

")

(setf (get patrol_planner::Tl_glResponse :md5sum-) "d9bc86335236069bddf3bda6b288eda2")
(setf (get patrol_planner::Tl_glResponse :datatype-) "patrol_planner/Tl_glResponse")
(setf (get patrol_planner::Tl_glResponse :definition-)
      "string table_name
---
string reply

")



(provide :patrol_planner/Tl_gl "d9bc86335236069bddf3bda6b288eda2")


