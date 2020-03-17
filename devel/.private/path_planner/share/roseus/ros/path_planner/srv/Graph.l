;; Auto-generated. Do not edit!


(when (boundp 'path_planner::Graph)
  (if (not (find-package "PATH_PLANNER"))
    (make-package "PATH_PLANNER"))
  (shadow 'Graph (find-package "PATH_PLANNER")))
(unless (find-package "PATH_PLANNER::GRAPH")
  (make-package "PATH_PLANNER::GRAPH"))
(unless (find-package "PATH_PLANNER::GRAPHREQUEST")
  (make-package "PATH_PLANNER::GRAPHREQUEST"))
(unless (find-package "PATH_PLANNER::GRAPHRESPONSE")
  (make-package "PATH_PLANNER::GRAPHRESPONSE"))

(in-package "ROS")

(if (not (find-package "ROADMAP_GLOBAL_PLANNER_MSGS"))
  (ros::roseus-add-msgs "roadmap_global_planner_msgs"))




(defclass path_planner::GraphRequest
  :super ros::object
  :slots (_adjacency_list ))

(defmethod path_planner::GraphRequest
  (:init
   (&key
    ((:adjacency_list __adjacency_list) (instance roadmap_global_planner_msgs::AdjacencyList :init))
    )
   (send-super :init)
   (setq _adjacency_list __adjacency_list)
   self)
  (:adjacency_list
   (&rest __adjacency_list)
   (if (keywordp (car __adjacency_list))
       (send* _adjacency_list __adjacency_list)
     (progn
       (if __adjacency_list (setq _adjacency_list (car __adjacency_list)))
       _adjacency_list)))
  (:serialization-length
   ()
   (+
    ;; roadmap_global_planner_msgs/AdjacencyList _adjacency_list
    (send _adjacency_list :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; roadmap_global_planner_msgs/AdjacencyList _adjacency_list
       (send _adjacency_list :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; roadmap_global_planner_msgs/AdjacencyList _adjacency_list
     (send _adjacency_list :deserialize buf ptr-) (incf ptr- (send _adjacency_list :serialization-length))
   ;;
   self)
  )

(defclass path_planner::GraphResponse
  :super ros::object
  :slots (_result ))

(defmethod path_planner::GraphResponse
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

(defclass path_planner::Graph
  :super ros::object
  :slots ())

(setf (get path_planner::Graph :md5sum-) "27d2326ebcb7de158de4e69732269ca9")
(setf (get path_planner::Graph :datatype-) "path_planner/Graph")
(setf (get path_planner::Graph :request) path_planner::GraphRequest)
(setf (get path_planner::Graph :response) path_planner::GraphResponse)

(defmethod path_planner::GraphRequest
  (:response () (instance path_planner::GraphResponse :init)))

(setf (get path_planner::GraphRequest :md5sum-) "27d2326ebcb7de158de4e69732269ca9")
(setf (get path_planner::GraphRequest :datatype-) "path_planner/GraphRequest")
(setf (get path_planner::GraphRequest :definition-)
      "roadmap_global_planner_msgs/AdjacencyList adjacency_list

================================================================================
MSG: roadmap_global_planner_msgs/AdjacencyList
roadmap_global_planner_msgs/PointList[] adj_list
roadmap_global_planner_msgs/MapPair[] map
================================================================================
MSG: roadmap_global_planner_msgs/PointList
int32[] list

================================================================================
MSG: roadmap_global_planner_msgs/MapPair
int32 node
geometry_msgs/Pose pose
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool result

")

(setf (get path_planner::GraphResponse :md5sum-) "27d2326ebcb7de158de4e69732269ca9")
(setf (get path_planner::GraphResponse :datatype-) "path_planner/GraphResponse")
(setf (get path_planner::GraphResponse :definition-)
      "roadmap_global_planner_msgs/AdjacencyList adjacency_list

================================================================================
MSG: roadmap_global_planner_msgs/AdjacencyList
roadmap_global_planner_msgs/PointList[] adj_list
roadmap_global_planner_msgs/MapPair[] map
================================================================================
MSG: roadmap_global_planner_msgs/PointList
int32[] list

================================================================================
MSG: roadmap_global_planner_msgs/MapPair
int32 node
geometry_msgs/Pose pose
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w
---
bool result

")



(provide :path_planner/Graph "27d2326ebcb7de158de4e69732269ca9")


