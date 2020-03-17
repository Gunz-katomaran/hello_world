;; Auto-generated. Do not edit!


(when (boundp 'path_follower::PointList)
  (if (not (find-package "PATH_FOLLOWER"))
    (make-package "PATH_FOLLOWER"))
  (shadow 'PointList (find-package "PATH_FOLLOWER")))
(unless (find-package "PATH_FOLLOWER::POINTLIST")
  (make-package "PATH_FOLLOWER::POINTLIST"))

(in-package "ROS")
;;//! \htmlinclude PointList.msg.html


(defclass path_follower::PointList
  :super ros::object
  :slots (_pose_list ))

(defmethod path_follower::PointList
  (:init
   (&key
    ((:pose_list __pose_list) (let (r) (dotimes (i 0) (push (instance path_follower::PoseList :init) r)) r))
    )
   (send-super :init)
   (setq _pose_list __pose_list)
   self)
  (:pose_list
   (&rest __pose_list)
   (if (keywordp (car __pose_list))
       (send* _pose_list __pose_list)
     (progn
       (if __pose_list (setq _pose_list (car __pose_list)))
       _pose_list)))
  (:serialization-length
   ()
   (+
    ;; path_follower/PoseList[] _pose_list
    (apply #'+ (send-all _pose_list :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; path_follower/PoseList[] _pose_list
     (write-long (length _pose_list) s)
     (dolist (elem _pose_list)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; path_follower/PoseList[] _pose_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _pose_list (let (r) (dotimes (i n) (push (instance path_follower::PoseList :init) r)) r))
     (dolist (elem- _pose_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get path_follower::PointList :md5sum-) "f639923d0e4b33008c322b16a61c2555")
(setf (get path_follower::PointList :datatype-) "path_follower/PointList")
(setf (get path_follower::PointList :definition-)
      "path_follower/PoseList[] pose_list

================================================================================
MSG: path_follower/PoseList
float32[] list

")



(provide :path_follower/PointList "f639923d0e4b33008c322b16a61c2555")


