; Auto-generated. Do not edit!


(cl:in-package roadmap_global_planner_msgs-msg)


;//! \htmlinclude MapPair.msg.html

(cl:defclass <MapPair> (roslisp-msg-protocol:ros-message)
  ((node
    :reader node
    :initarg :node
    :type cl:integer
    :initform 0)
   (pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose)))
)

(cl:defclass MapPair (<MapPair>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MapPair>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MapPair)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roadmap_global_planner_msgs-msg:<MapPair> is deprecated: use roadmap_global_planner_msgs-msg:MapPair instead.")))

(cl:ensure-generic-function 'node-val :lambda-list '(m))
(cl:defmethod node-val ((m <MapPair>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roadmap_global_planner_msgs-msg:node-val is deprecated.  Use roadmap_global_planner_msgs-msg:node instead.")
  (node m))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <MapPair>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roadmap_global_planner_msgs-msg:pose-val is deprecated.  Use roadmap_global_planner_msgs-msg:pose instead.")
  (pose m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MapPair>) ostream)
  "Serializes a message object of type '<MapPair>"
  (cl:let* ((signed (cl:slot-value msg 'node)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MapPair>) istream)
  "Deserializes a message object of type '<MapPair>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'node) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MapPair>)))
  "Returns string type for a message object of type '<MapPair>"
  "roadmap_global_planner_msgs/MapPair")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MapPair)))
  "Returns string type for a message object of type 'MapPair"
  "roadmap_global_planner_msgs/MapPair")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MapPair>)))
  "Returns md5sum for a message object of type '<MapPair>"
  "70da0c8f55f16c16e0cd2b1120c67a6b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MapPair)))
  "Returns md5sum for a message object of type 'MapPair"
  "70da0c8f55f16c16e0cd2b1120c67a6b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MapPair>)))
  "Returns full string definition for message of type '<MapPair>"
  (cl:format cl:nil "int32 node~%geometry_msgs/Pose pose~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MapPair)))
  "Returns full string definition for message of type 'MapPair"
  (cl:format cl:nil "int32 node~%geometry_msgs/Pose pose~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MapPair>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MapPair>))
  "Converts a ROS message object to a list"
  (cl:list 'MapPair
    (cl:cons ':node (node msg))
    (cl:cons ':pose (pose msg))
))
