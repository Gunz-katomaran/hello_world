;; Auto-generated. Do not edit!


(when (boundp 'path_follower::PoseList)
  (if (not (find-package "PATH_FOLLOWER"))
    (make-package "PATH_FOLLOWER"))
  (shadow 'PoseList (find-package "PATH_FOLLOWER")))
(unless (find-package "PATH_FOLLOWER::POSELIST")
  (make-package "PATH_FOLLOWER::POSELIST"))

(in-package "ROS")
;;//! \htmlinclude PoseList.msg.html


(defclass path_follower::PoseList
  :super ros::object
  :slots (_list ))

(defmethod path_follower::PoseList
  (:init
   (&key
    ((:list __list) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _list __list)
   self)
  (:list
   (&optional __list)
   (if __list (setq _list __list)) _list)
  (:serialization-length
   ()
   (+
    ;; float32[] _list
    (* 4    (length _list)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32[] _list
     (write-long (length _list) s)
     (dotimes (i (length _list))
       (sys::poke (elt _list i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32[] _list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _list (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _list i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get path_follower::PoseList :md5sum-) "f899bbf34605ab8c1065aaee8c9708ca")
(setf (get path_follower::PoseList :datatype-) "path_follower/PoseList")
(setf (get path_follower::PoseList :definition-)
      "float32[] list

")



(provide :path_follower/PoseList "f899bbf34605ab8c1065aaee8c9708ca")


