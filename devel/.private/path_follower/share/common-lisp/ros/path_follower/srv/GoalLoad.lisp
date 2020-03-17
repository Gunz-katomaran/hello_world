; Auto-generated. Do not edit!


(cl:in-package path_follower-srv)


;//! \htmlinclude GoalLoad-request.msg.html

(cl:defclass <GoalLoad-request> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type cl:integer
    :initform 0))
)

(cl:defclass GoalLoad-request (<GoalLoad-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoalLoad-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoalLoad-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_follower-srv:<GoalLoad-request> is deprecated: use path_follower-srv:GoalLoad-request instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <GoalLoad-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_follower-srv:goal-val is deprecated.  Use path_follower-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoalLoad-request>) ostream)
  "Serializes a message object of type '<GoalLoad-request>"
  (cl:let* ((signed (cl:slot-value msg 'goal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoalLoad-request>) istream)
  "Deserializes a message object of type '<GoalLoad-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoalLoad-request>)))
  "Returns string type for a service object of type '<GoalLoad-request>"
  "path_follower/GoalLoadRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoalLoad-request)))
  "Returns string type for a service object of type 'GoalLoad-request"
  "path_follower/GoalLoadRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoalLoad-request>)))
  "Returns md5sum for a message object of type '<GoalLoad-request>"
  "56720ff27a89ff4af57b4a5f223bac21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoalLoad-request)))
  "Returns md5sum for a message object of type 'GoalLoad-request"
  "56720ff27a89ff4af57b4a5f223bac21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoalLoad-request>)))
  "Returns full string definition for message of type '<GoalLoad-request>"
  (cl:format cl:nil "int32 goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoalLoad-request)))
  "Returns full string definition for message of type 'GoalLoad-request"
  (cl:format cl:nil "int32 goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoalLoad-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoalLoad-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GoalLoad-request
    (cl:cons ':goal (goal msg))
))
;//! \htmlinclude GoalLoad-response.msg.html

(cl:defclass <GoalLoad-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GoalLoad-response (<GoalLoad-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GoalLoad-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GoalLoad-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_follower-srv:<GoalLoad-response> is deprecated: use path_follower-srv:GoalLoad-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <GoalLoad-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_follower-srv:result-val is deprecated.  Use path_follower-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GoalLoad-response>) ostream)
  "Serializes a message object of type '<GoalLoad-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GoalLoad-response>) istream)
  "Deserializes a message object of type '<GoalLoad-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GoalLoad-response>)))
  "Returns string type for a service object of type '<GoalLoad-response>"
  "path_follower/GoalLoadResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoalLoad-response)))
  "Returns string type for a service object of type 'GoalLoad-response"
  "path_follower/GoalLoadResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GoalLoad-response>)))
  "Returns md5sum for a message object of type '<GoalLoad-response>"
  "56720ff27a89ff4af57b4a5f223bac21")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GoalLoad-response)))
  "Returns md5sum for a message object of type 'GoalLoad-response"
  "56720ff27a89ff4af57b4a5f223bac21")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GoalLoad-response>)))
  "Returns full string definition for message of type '<GoalLoad-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GoalLoad-response)))
  "Returns full string definition for message of type 'GoalLoad-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GoalLoad-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GoalLoad-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GoalLoad-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GoalLoad)))
  'GoalLoad-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GoalLoad)))
  'GoalLoad-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GoalLoad)))
  "Returns string type for a service object of type '<GoalLoad>"
  "path_follower/GoalLoad")