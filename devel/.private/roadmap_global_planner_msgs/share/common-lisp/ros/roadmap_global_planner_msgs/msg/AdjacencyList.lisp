; Auto-generated. Do not edit!


(cl:in-package roadmap_global_planner_msgs-msg)


;//! \htmlinclude AdjacencyList.msg.html

(cl:defclass <AdjacencyList> (roslisp-msg-protocol:ros-message)
  ((adj_list
    :reader adj_list
    :initarg :adj_list
    :type (cl:vector roadmap_global_planner_msgs-msg:PointList)
   :initform (cl:make-array 0 :element-type 'roadmap_global_planner_msgs-msg:PointList :initial-element (cl:make-instance 'roadmap_global_planner_msgs-msg:PointList)))
   (map
    :reader map
    :initarg :map
    :type (cl:vector roadmap_global_planner_msgs-msg:MapPair)
   :initform (cl:make-array 0 :element-type 'roadmap_global_planner_msgs-msg:MapPair :initial-element (cl:make-instance 'roadmap_global_planner_msgs-msg:MapPair))))
)

(cl:defclass AdjacencyList (<AdjacencyList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AdjacencyList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AdjacencyList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roadmap_global_planner_msgs-msg:<AdjacencyList> is deprecated: use roadmap_global_planner_msgs-msg:AdjacencyList instead.")))

(cl:ensure-generic-function 'adj_list-val :lambda-list '(m))
(cl:defmethod adj_list-val ((m <AdjacencyList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roadmap_global_planner_msgs-msg:adj_list-val is deprecated.  Use roadmap_global_planner_msgs-msg:adj_list instead.")
  (adj_list m))

(cl:ensure-generic-function 'map-val :lambda-list '(m))
(cl:defmethod map-val ((m <AdjacencyList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roadmap_global_planner_msgs-msg:map-val is deprecated.  Use roadmap_global_planner_msgs-msg:map instead.")
  (map m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AdjacencyList>) ostream)
  "Serializes a message object of type '<AdjacencyList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'adj_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'adj_list))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'map))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'map))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AdjacencyList>) istream)
  "Deserializes a message object of type '<AdjacencyList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'adj_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'adj_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'roadmap_global_planner_msgs-msg:PointList))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'map) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'map)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'roadmap_global_planner_msgs-msg:MapPair))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AdjacencyList>)))
  "Returns string type for a message object of type '<AdjacencyList>"
  "roadmap_global_planner_msgs/AdjacencyList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AdjacencyList)))
  "Returns string type for a message object of type 'AdjacencyList"
  "roadmap_global_planner_msgs/AdjacencyList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AdjacencyList>)))
  "Returns md5sum for a message object of type '<AdjacencyList>"
  "d2f6aa9b2ba6558c5394addb6c9bfc26")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AdjacencyList)))
  "Returns md5sum for a message object of type 'AdjacencyList"
  "d2f6aa9b2ba6558c5394addb6c9bfc26")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AdjacencyList>)))
  "Returns full string definition for message of type '<AdjacencyList>"
  (cl:format cl:nil "roadmap_global_planner_msgs/PointList[] adj_list~%roadmap_global_planner_msgs/MapPair[] map~%================================================================================~%MSG: roadmap_global_planner_msgs/PointList~%int32[] list~%~%================================================================================~%MSG: roadmap_global_planner_msgs/MapPair~%int32 node~%geometry_msgs/Pose pose~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AdjacencyList)))
  "Returns full string definition for message of type 'AdjacencyList"
  (cl:format cl:nil "roadmap_global_planner_msgs/PointList[] adj_list~%roadmap_global_planner_msgs/MapPair[] map~%================================================================================~%MSG: roadmap_global_planner_msgs/PointList~%int32[] list~%~%================================================================================~%MSG: roadmap_global_planner_msgs/MapPair~%int32 node~%geometry_msgs/Pose pose~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AdjacencyList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'adj_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'map) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AdjacencyList>))
  "Converts a ROS message object to a list"
  (cl:list 'AdjacencyList
    (cl:cons ':adj_list (adj_list msg))
    (cl:cons ':map (map msg))
))
