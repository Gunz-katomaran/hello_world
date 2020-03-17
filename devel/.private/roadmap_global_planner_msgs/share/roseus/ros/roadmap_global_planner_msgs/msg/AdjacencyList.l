;; Auto-generated. Do not edit!


(when (boundp 'roadmap_global_planner_msgs::AdjacencyList)
  (if (not (find-package "ROADMAP_GLOBAL_PLANNER_MSGS"))
    (make-package "ROADMAP_GLOBAL_PLANNER_MSGS"))
  (shadow 'AdjacencyList (find-package "ROADMAP_GLOBAL_PLANNER_MSGS")))
(unless (find-package "ROADMAP_GLOBAL_PLANNER_MSGS::ADJACENCYLIST")
  (make-package "ROADMAP_GLOBAL_PLANNER_MSGS::ADJACENCYLIST"))

(in-package "ROS")
;;//! \htmlinclude AdjacencyList.msg.html


(defclass roadmap_global_planner_msgs::AdjacencyList
  :super ros::object
  :slots (_adj_list _map ))

(defmethod roadmap_global_planner_msgs::AdjacencyList
  (:init
   (&key
    ((:adj_list __adj_list) (let (r) (dotimes (i 0) (push (instance roadmap_global_planner_msgs::PointList :init) r)) r))
    ((:map __map) (let (r) (dotimes (i 0) (push (instance roadmap_global_planner_msgs::MapPair :init) r)) r))
    )
   (send-super :init)
   (setq _adj_list __adj_list)
   (setq _map __map)
   self)
  (:adj_list
   (&rest __adj_list)
   (if (keywordp (car __adj_list))
       (send* _adj_list __adj_list)
     (progn
       (if __adj_list (setq _adj_list (car __adj_list)))
       _adj_list)))
  (:map
   (&rest __map)
   (if (keywordp (car __map))
       (send* _map __map)
     (progn
       (if __map (setq _map (car __map)))
       _map)))
  (:serialization-length
   ()
   (+
    ;; roadmap_global_planner_msgs/PointList[] _adj_list
    (apply #'+ (send-all _adj_list :serialization-length)) 4
    ;; roadmap_global_planner_msgs/MapPair[] _map
    (apply #'+ (send-all _map :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; roadmap_global_planner_msgs/PointList[] _adj_list
     (write-long (length _adj_list) s)
     (dolist (elem _adj_list)
       (send elem :serialize s)
       )
     ;; roadmap_global_planner_msgs/MapPair[] _map
     (write-long (length _map) s)
     (dolist (elem _map)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; roadmap_global_planner_msgs/PointList[] _adj_list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _adj_list (let (r) (dotimes (i n) (push (instance roadmap_global_planner_msgs::PointList :init) r)) r))
     (dolist (elem- _adj_list)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; roadmap_global_planner_msgs/MapPair[] _map
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _map (let (r) (dotimes (i n) (push (instance roadmap_global_planner_msgs::MapPair :init) r)) r))
     (dolist (elem- _map)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get roadmap_global_planner_msgs::AdjacencyList :md5sum-) "d2f6aa9b2ba6558c5394addb6c9bfc26")
(setf (get roadmap_global_planner_msgs::AdjacencyList :datatype-) "roadmap_global_planner_msgs/AdjacencyList")
(setf (get roadmap_global_planner_msgs::AdjacencyList :definition-)
      "roadmap_global_planner_msgs/PointList[] adj_list
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

")



(provide :roadmap_global_planner_msgs/AdjacencyList "d2f6aa9b2ba6558c5394addb6c9bfc26")


