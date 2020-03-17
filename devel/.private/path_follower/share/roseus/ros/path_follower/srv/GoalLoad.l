;; Auto-generated. Do not edit!


(when (boundp 'path_follower::GoalLoad)
  (if (not (find-package "PATH_FOLLOWER"))
    (make-package "PATH_FOLLOWER"))
  (shadow 'GoalLoad (find-package "PATH_FOLLOWER")))
(unless (find-package "PATH_FOLLOWER::GOALLOAD")
  (make-package "PATH_FOLLOWER::GOALLOAD"))
(unless (find-package "PATH_FOLLOWER::GOALLOADREQUEST")
  (make-package "PATH_FOLLOWER::GOALLOADREQUEST"))
(unless (find-package "PATH_FOLLOWER::GOALLOADRESPONSE")
  (make-package "PATH_FOLLOWER::GOALLOADRESPONSE"))

(in-package "ROS")





(defclass path_follower::GoalLoadRequest
  :super ros::object
  :slots (_goal ))

(defmethod path_follower::GoalLoadRequest
  (:init
   (&key
    ((:goal __goal) 0)
    )
   (send-super :init)
   (setq _goal (round __goal))
   self)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:serialization-length
   ()
   (+
    ;; int32 _goal
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _goal
       (write-long _goal s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _goal
     (setq _goal (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass path_follower::GoalLoadResponse
  :super ros::object
  :slots (_result ))

(defmethod path_follower::GoalLoadResponse
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

(defclass path_follower::GoalLoad
  :super ros::object
  :slots ())

(setf (get path_follower::GoalLoad :md5sum-) "56720ff27a89ff4af57b4a5f223bac21")
(setf (get path_follower::GoalLoad :datatype-) "path_follower/GoalLoad")
(setf (get path_follower::GoalLoad :request) path_follower::GoalLoadRequest)
(setf (get path_follower::GoalLoad :response) path_follower::GoalLoadResponse)

(defmethod path_follower::GoalLoadRequest
  (:response () (instance path_follower::GoalLoadResponse :init)))

(setf (get path_follower::GoalLoadRequest :md5sum-) "56720ff27a89ff4af57b4a5f223bac21")
(setf (get path_follower::GoalLoadRequest :datatype-) "path_follower/GoalLoadRequest")
(setf (get path_follower::GoalLoadRequest :definition-)
      "int32 goal
---
bool result

")

(setf (get path_follower::GoalLoadResponse :md5sum-) "56720ff27a89ff4af57b4a5f223bac21")
(setf (get path_follower::GoalLoadResponse :datatype-) "path_follower/GoalLoadResponse")
(setf (get path_follower::GoalLoadResponse :definition-)
      "int32 goal
---
bool result

")



(provide :path_follower/GoalLoad "56720ff27a89ff4af57b4a5f223bac21")


