;; Auto-generated. Do not edit!


(when (boundp 'path_follower::Nearest)
  (if (not (find-package "PATH_FOLLOWER"))
    (make-package "PATH_FOLLOWER"))
  (shadow 'Nearest (find-package "PATH_FOLLOWER")))
(unless (find-package "PATH_FOLLOWER::NEAREST")
  (make-package "PATH_FOLLOWER::NEAREST"))
(unless (find-package "PATH_FOLLOWER::NEARESTREQUEST")
  (make-package "PATH_FOLLOWER::NEARESTREQUEST"))
(unless (find-package "PATH_FOLLOWER::NEARESTRESPONSE")
  (make-package "PATH_FOLLOWER::NEARESTRESPONSE"))

(in-package "ROS")





(defclass path_follower::NearestRequest
  :super ros::object
  :slots (_near ))

(defmethod path_follower::NearestRequest
  (:init
   (&key
    ((:near __near) 0)
    )
   (send-super :init)
   (setq _near (round __near))
   self)
  (:near
   (&optional __near)
   (if __near (setq _near __near)) _near)
  (:serialization-length
   ()
   (+
    ;; int32 _near
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _near
       (write-long _near s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _near
     (setq _near (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass path_follower::NearestResponse
  :super ros::object
  :slots (_result ))

(defmethod path_follower::NearestResponse
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

(defclass path_follower::Nearest
  :super ros::object
  :slots ())

(setf (get path_follower::Nearest :md5sum-) "971c336fc98e1a1ea33980f32a28c2d9")
(setf (get path_follower::Nearest :datatype-) "path_follower/Nearest")
(setf (get path_follower::Nearest :request) path_follower::NearestRequest)
(setf (get path_follower::Nearest :response) path_follower::NearestResponse)

(defmethod path_follower::NearestRequest
  (:response () (instance path_follower::NearestResponse :init)))

(setf (get path_follower::NearestRequest :md5sum-) "971c336fc98e1a1ea33980f32a28c2d9")
(setf (get path_follower::NearestRequest :datatype-) "path_follower/NearestRequest")
(setf (get path_follower::NearestRequest :definition-)
      "int32 near
---
bool result

")

(setf (get path_follower::NearestResponse :md5sum-) "971c336fc98e1a1ea33980f32a28c2d9")
(setf (get path_follower::NearestResponse :datatype-) "path_follower/NearestResponse")
(setf (get path_follower::NearestResponse :definition-)
      "int32 near
---
bool result

")



(provide :path_follower/Nearest "971c336fc98e1a1ea33980f32a28c2d9")


