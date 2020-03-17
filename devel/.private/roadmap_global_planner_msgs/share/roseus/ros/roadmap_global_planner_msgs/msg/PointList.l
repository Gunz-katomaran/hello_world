;; Auto-generated. Do not edit!


(when (boundp 'roadmap_global_planner_msgs::PointList)
  (if (not (find-package "ROADMAP_GLOBAL_PLANNER_MSGS"))
    (make-package "ROADMAP_GLOBAL_PLANNER_MSGS"))
  (shadow 'PointList (find-package "ROADMAP_GLOBAL_PLANNER_MSGS")))
(unless (find-package "ROADMAP_GLOBAL_PLANNER_MSGS::POINTLIST")
  (make-package "ROADMAP_GLOBAL_PLANNER_MSGS::POINTLIST"))

(in-package "ROS")
;;//! \htmlinclude PointList.msg.html


(defclass roadmap_global_planner_msgs::PointList
  :super ros::object
  :slots (_list ))

(defmethod roadmap_global_planner_msgs::PointList
  (:init
   (&key
    ((:list __list) (make-array 0 :initial-element 0 :element-type :integer))
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
    ;; int32[] _list
    (* 4    (length _list)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _list
     (write-long (length _list) s)
     (dotimes (i (length _list))
       (write-long (elt _list i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _list
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _list (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _list i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(setf (get roadmap_global_planner_msgs::PointList :md5sum-) "33cd48253e96459f6910f32d963eda83")
(setf (get roadmap_global_planner_msgs::PointList :datatype-) "roadmap_global_planner_msgs/PointList")
(setf (get roadmap_global_planner_msgs::PointList :definition-)
      "int32[] list

")



(provide :roadmap_global_planner_msgs/PointList "33cd48253e96459f6910f32d963eda83")


