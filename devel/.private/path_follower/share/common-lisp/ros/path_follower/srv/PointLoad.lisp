; Auto-generated. Do not edit!


(cl:in-package path_follower-srv)


;//! \htmlinclude PointLoad-request.msg.html

(cl:defclass <PointLoad-request> (roslisp-msg-protocol:ros-message)
  ((point_list
    :reader point_list
    :initarg :point_list
    :type path_follower-msg:PointList
    :initform (cl:make-instance 'path_follower-msg:PointList)))
)

(cl:defclass PointLoad-request (<PointLoad-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointLoad-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointLoad-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_follower-srv:<PointLoad-request> is deprecated: use path_follower-srv:PointLoad-request instead.")))

(cl:ensure-generic-function 'point_list-val :lambda-list '(m))
(cl:defmethod point_list-val ((m <PointLoad-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_follower-srv:point_list-val is deprecated.  Use path_follower-srv:point_list instead.")
  (point_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointLoad-request>) ostream)
  "Serializes a message object of type '<PointLoad-request>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'point_list) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointLoad-request>) istream)
  "Deserializes a message object of type '<PointLoad-request>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'point_list) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointLoad-request>)))
  "Returns string type for a service object of type '<PointLoad-request>"
  "path_follower/PointLoadRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointLoad-request)))
  "Returns string type for a service object of type 'PointLoad-request"
  "path_follower/PointLoadRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointLoad-request>)))
  "Returns md5sum for a message object of type '<PointLoad-request>"
  "ff86ebb20f757b817971f1cfe32bdb6b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointLoad-request)))
  "Returns md5sum for a message object of type 'PointLoad-request"
  "ff86ebb20f757b817971f1cfe32bdb6b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointLoad-request>)))
  "Returns full string definition for message of type '<PointLoad-request>"
  (cl:format cl:nil "path_follower/PointList point_list~%~%================================================================================~%MSG: path_follower/PointList~%path_follower/PoseList[] pose_list~%~%================================================================================~%MSG: path_follower/PoseList~%float32[] list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointLoad-request)))
  "Returns full string definition for message of type 'PointLoad-request"
  (cl:format cl:nil "path_follower/PointList point_list~%~%================================================================================~%MSG: path_follower/PointList~%path_follower/PoseList[] pose_list~%~%================================================================================~%MSG: path_follower/PoseList~%float32[] list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointLoad-request>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'point_list))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointLoad-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PointLoad-request
    (cl:cons ':point_list (point_list msg))
))
;//! \htmlinclude PointLoad-response.msg.html

(cl:defclass <PointLoad-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass PointLoad-response (<PointLoad-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointLoad-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointLoad-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_follower-srv:<PointLoad-response> is deprecated: use path_follower-srv:PointLoad-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <PointLoad-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_follower-srv:result-val is deprecated.  Use path_follower-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointLoad-response>) ostream)
  "Serializes a message object of type '<PointLoad-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointLoad-response>) istream)
  "Deserializes a message object of type '<PointLoad-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointLoad-response>)))
  "Returns string type for a service object of type '<PointLoad-response>"
  "path_follower/PointLoadResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointLoad-response)))
  "Returns string type for a service object of type 'PointLoad-response"
  "path_follower/PointLoadResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointLoad-response>)))
  "Returns md5sum for a message object of type '<PointLoad-response>"
  "ff86ebb20f757b817971f1cfe32bdb6b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointLoad-response)))
  "Returns md5sum for a message object of type 'PointLoad-response"
  "ff86ebb20f757b817971f1cfe32bdb6b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointLoad-response>)))
  "Returns full string definition for message of type '<PointLoad-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointLoad-response)))
  "Returns full string definition for message of type 'PointLoad-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointLoad-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointLoad-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PointLoad-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PointLoad)))
  'PointLoad-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PointLoad)))
  'PointLoad-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointLoad)))
  "Returns string type for a service object of type '<PointLoad>"
  "path_follower/PointLoad")