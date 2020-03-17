; Auto-generated. Do not edit!


(cl:in-package path_planner-srv)


;//! \htmlinclude Graph-request.msg.html

(cl:defclass <Graph-request> (roslisp-msg-protocol:ros-message)
  ((adjacency_list
    :reader adjacency_list
    :initarg :adjacency_list
    :type roadmap_global_planner_msgs-msg:AdjacencyList
    :initform (cl:make-instance 'roadmap_global_planner_msgs-msg:AdjacencyList)))
)

(cl:defclass Graph-request (<Graph-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Graph-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Graph-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<Graph-request> is deprecated: use path_planner-srv:Graph-request instead.")))

(cl:ensure-generic-function 'adjacency_list-val :lambda-list '(m))
(cl:defmethod adjacency_list-val ((m <Graph-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:adjacency_list-val is deprecated.  Use path_planner-srv:adjacency_list instead.")
  (adjacency_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Graph-request>) ostream)
  "Serializes a message object of type '<Graph-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'adjacency_list) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Graph-request>) istream)
  "Deserializes a message object of type '<Graph-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'adjacency_list) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Graph-request>)))
  "Returns string type for a service object of type '<Graph-request>"
  "path_planner/GraphRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Graph-request)))
  "Returns string type for a service object of type 'Graph-request"
  "path_planner/GraphRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Graph-request>)))
  "Returns md5sum for a message object of type '<Graph-request>"
  "27d2326ebcb7de158de4e69732269ca9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Graph-request)))
  "Returns md5sum for a message object of type 'Graph-request"
  "27d2326ebcb7de158de4e69732269ca9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Graph-request>)))
  "Returns full string definition for message of type '<Graph-request>"
  (cl:format cl:nil "roadmap_global_planner_msgs/AdjacencyList adjacency_list~%~%================================================================================~%MSG: roadmap_global_planner_msgs/AdjacencyList~%roadmap_global_planner_msgs/PointList[] adj_list~%roadmap_global_planner_msgs/MapPair[] map~%================================================================================~%MSG: roadmap_global_planner_msgs/PointList~%int32[] list~%~%================================================================================~%MSG: roadmap_global_planner_msgs/MapPair~%int32 node~%geometry_msgs/Pose pose~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Graph-request)))
  "Returns full string definition for message of type 'Graph-request"
  (cl:format cl:nil "roadmap_global_planner_msgs/AdjacencyList adjacency_list~%~%================================================================================~%MSG: roadmap_global_planner_msgs/AdjacencyList~%roadmap_global_planner_msgs/PointList[] adj_list~%roadmap_global_planner_msgs/MapPair[] map~%================================================================================~%MSG: roadmap_global_planner_msgs/PointList~%int32[] list~%~%================================================================================~%MSG: roadmap_global_planner_msgs/MapPair~%int32 node~%geometry_msgs/Pose pose~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Graph-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'adjacency_list))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Graph-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Graph-request
    (cl:cons ':adjacency_list (adjacency_list msg))
))
;//! \htmlinclude Graph-response.msg.html

(cl:defclass <Graph-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Graph-response (<Graph-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Graph-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Graph-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<Graph-response> is deprecated: use path_planner-srv:Graph-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Graph-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:result-val is deprecated.  Use path_planner-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Graph-response>) ostream)
  "Serializes a message object of type '<Graph-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Graph-response>) istream)
  "Deserializes a message object of type '<Graph-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Graph-response>)))
  "Returns string type for a service object of type '<Graph-response>"
  "path_planner/GraphResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Graph-response)))
  "Returns string type for a service object of type 'Graph-response"
  "path_planner/GraphResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Graph-response>)))
  "Returns md5sum for a message object of type '<Graph-response>"
  "27d2326ebcb7de158de4e69732269ca9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Graph-response)))
  "Returns md5sum for a message object of type 'Graph-response"
  "27d2326ebcb7de158de4e69732269ca9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Graph-response>)))
  "Returns full string definition for message of type '<Graph-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Graph-response)))
  "Returns full string definition for message of type 'Graph-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Graph-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Graph-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Graph-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Graph)))
  'Graph-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Graph)))
  'Graph-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Graph)))
  "Returns string type for a service object of type '<Graph>"
  "path_planner/Graph")