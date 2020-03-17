;; Auto-generated. Do not edit!


(when (boundp 'path_planner::PathFinder)
  (if (not (find-package "PATH_PLANNER"))
    (make-package "PATH_PLANNER"))
  (shadow 'PathFinder (find-package "PATH_PLANNER")))
(unless (find-package "PATH_PLANNER::PATHFINDER")
  (make-package "PATH_PLANNER::PATHFINDER"))
(unless (find-package "PATH_PLANNER::PATHFINDERREQUEST")
  (make-package "PATH_PLANNER::PATHFINDERREQUEST"))
(unless (find-package "PATH_PLANNER::PATHFINDERRESPONSE")
  (make-package "PATH_PLANNER::PATHFINDERRESPONSE"))

(in-package "ROS")





(defclass path_planner::PathFinderRequest
  :super ros::object
  :slots (_start _goal ))

(defmethod path_planner::PathFinderRequest
  (:init
   (&key
    ((:start __start) 0)
    ((:goal __goal) 0)
    )
   (send-super :init)
   (setq _start (round __start))
   (setq _goal (round __goal))
   self)
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:serialization-length
   ()
   (+
    ;; int32 _start
    4
    ;; int32 _goal
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _start
       (write-long _start s)
     ;; int32 _goal
       (write-long _goal s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _start
     (setq _start (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _goal
     (setq _goal (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass path_planner::PathFinderResponse
  :super ros::object
  :slots (_path ))

(defmethod path_planner::PathFinderResponse
  (:init
   (&key
    ((:path __path) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _path __path)
   self)
  (:path
   (&optional __path)
   (if __path (setq _path __path)) _path)
  (:serialization-length
   ()
   (+
    ;; int32[] _path
    (* 4    (length _path)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _path
     (write-long (length _path) s)
     (dotimes (i (length _path))
       (write-long (elt _path i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _path i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass path_planner::PathFinder
  :super ros::object
  :slots ())

(setf (get path_planner::PathFinder :md5sum-) "e90150a274192f3b93435f5aadb8f247")
(setf (get path_planner::PathFinder :datatype-) "path_planner/PathFinder")
(setf (get path_planner::PathFinder :request) path_planner::PathFinderRequest)
(setf (get path_planner::PathFinder :response) path_planner::PathFinderResponse)

(defmethod path_planner::PathFinderRequest
  (:response () (instance path_planner::PathFinderResponse :init)))

(setf (get path_planner::PathFinderRequest :md5sum-) "e90150a274192f3b93435f5aadb8f247")
(setf (get path_planner::PathFinderRequest :datatype-) "path_planner/PathFinderRequest")
(setf (get path_planner::PathFinderRequest :definition-)
      "int32 start
int32 goal
---
int32[] path

")

(setf (get path_planner::PathFinderResponse :md5sum-) "e90150a274192f3b93435f5aadb8f247")
(setf (get path_planner::PathFinderResponse :datatype-) "path_planner/PathFinderResponse")
(setf (get path_planner::PathFinderResponse :definition-)
      "int32 start
int32 goal
---
int32[] path

")



(provide :path_planner/PathFinder "e90150a274192f3b93435f5aadb8f247")


