;; Auto-generated. Do not edit!


(when (boundp 'path_follower::PointLoad)
  (if (not (find-package "PATH_FOLLOWER"))
    (make-package "PATH_FOLLOWER"))
  (shadow 'PointLoad (find-package "PATH_FOLLOWER")))
(unless (find-package "PATH_FOLLOWER::POINTLOAD")
  (make-package "PATH_FOLLOWER::POINTLOAD"))
(unless (find-package "PATH_FOLLOWER::POINTLOADREQUEST")
  (make-package "PATH_FOLLOWER::POINTLOADREQUEST"))
(unless (find-package "PATH_FOLLOWER::POINTLOADRESPONSE")
  (make-package "PATH_FOLLOWER::POINTLOADRESPONSE"))

(in-package "ROS")





(defclass path_follower::PointLoadRequest
  :super ros::object
  :slots (_point_list ))

(defmethod path_follower::PointLoadRequest
  (:init
   (&key
    ((:point_list __point_list) (instance path_follower::PointList :init))
    )
   (send-super :init)
   (setq _point_list __point_list)
   self)
  (:point_list
   (&rest __point_list)
   (if (keywordp (car __point_list))
       (send* _point_list __point_list)
     (progn
       (if __point_list (setq _point_list (car __point_list)))
       _point_list)))
  (:serialization-length
   ()
   (+
    ;; path_follower/PointList _point_list
    (send _point_list :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; path_follower/PointList _point_list
       (send _point_list :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; path_follower/PointList _point_list
     (send _point_list :deserialize buf ptr-) (incf ptr- (send _point_list :serialization-length))
   ;;
   self)
  )

(defclass path_follower::PointLoadResponse
  :super ros::object
  :slots (_result ))

(defmethod path_follower::PointLoadResponse
  (:init
   (&key
    ((:result __result) nil)
    )
   (send-super :init)
   (setq _result __result)
   self)
  (:result
   (&optional __result)
   (if __result (setq _result __result)) _result)
  (:serialization-length
   ()
   (+
    ;; bool _result
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _result
       (if _result (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _result
     (setq _result (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass path_follower::PointLoad
  :super ros::object
  :slots ())

(setf (get path_follower::PointLoad :md5sum-) "ff86ebb20f757b817971f1cfe32bdb6b")
(setf (get path_follower::PointLoad :datatype-) "path_follower/PointLoad")
(setf (get path_follower::PointLoad :request) path_follower::PointLoadRequest)
(setf (get path_follower::PointLoad :response) path_follower::PointLoadResponse)

(defmethod path_follower::PointLoadRequest
  (:response () (instance path_follower::PointLoadResponse :init)))

(setf (get path_follower::PointLoadRequest :md5sum-) "ff86ebb20f757b817971f1cfe32bdb6b")
(setf (get path_follower::PointLoadRequest :datatype-) "path_follower/PointLoadRequest")
(setf (get path_follower::PointLoadRequest :definition-)
      "path_follower/PointList point_list

================================================================================
MSG: path_follower/PointList
path_follower/PoseList[] pose_list

================================================================================
MSG: path_follower/PoseList
float32[] list
---
bool result

")

(setf (get path_follower::PointLoadResponse :md5sum-) "ff86ebb20f757b817971f1cfe32bdb6b")
(setf (get path_follower::PointLoadResponse :datatype-) "path_follower/PointLoadResponse")
(setf (get path_follower::PointLoadResponse :definition-)
      "path_follower/PointList point_list

================================================================================
MSG: path_follower/PointList
path_follower/PoseList[] pose_list

================================================================================
MSG: path_follower/PoseList
float32[] list
---
bool result

")



(provide :path_follower/PointLoad "ff86ebb20f757b817971f1cfe32bdb6b")


