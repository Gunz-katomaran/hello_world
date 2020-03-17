; Auto-generated. Do not edit!


(cl:in-package path_planner-srv)


;//! \htmlinclude Goal-request.msg.html

(cl:defclass <Goal-request> (roslisp-msg-protocol:ros-message)
  ((location
    :reader location
    :initarg :location
    :type cl:string
    :initform ""))
)

(cl:defclass Goal-request (<Goal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Goal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Goal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<Goal-request> is deprecated: use path_planner-srv:Goal-request instead.")))

(cl:ensure-generic-function 'location-val :lambda-list '(m))
(cl:defmethod location-val ((m <Goal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:location-val is deprecated.  Use path_planner-srv:location instead.")
  (location m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Goal-request>) ostream)
  "Serializes a message object of type '<Goal-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'location))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'location))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Goal-request>) istream)
  "Deserializes a message object of type '<Goal-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'location) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'location) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Goal-request>)))
  "Returns string type for a service object of type '<Goal-request>"
  "path_planner/GoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Goal-request)))
  "Returns string type for a service object of type 'Goal-request"
  "path_planner/GoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Goal-request>)))
  "Returns md5sum for a message object of type '<Goal-request>"
  "257e57560eaef13378eb07b58da2c735")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Goal-request)))
  "Returns md5sum for a message object of type 'Goal-request"
  "257e57560eaef13378eb07b58da2c735")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Goal-request>)))
  "Returns full string definition for message of type '<Goal-request>"
  (cl:format cl:nil "string location~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Goal-request)))
  "Returns full string definition for message of type 'Goal-request"
  (cl:format cl:nil "string location~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Goal-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'location))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Goal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Goal-request
    (cl:cons ':location (location msg))
))
;//! \htmlinclude Goal-response.msg.html

(cl:defclass <Goal-response> (roslisp-msg-protocol:ros-message)
  ((goal
    :reader goal
    :initarg :goal
    :type cl:integer
    :initform 0))
)

(cl:defclass Goal-response (<Goal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Goal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Goal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<Goal-response> is deprecated: use path_planner-srv:Goal-response instead.")))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <Goal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:goal-val is deprecated.  Use path_planner-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Goal-response>) ostream)
  "Serializes a message object of type '<Goal-response>"
  (cl:let* ((signed (cl:slot-value msg 'goal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Goal-response>) istream)
  "Deserializes a message object of type '<Goal-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Goal-response>)))
  "Returns string type for a service object of type '<Goal-response>"
  "path_planner/GoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Goal-response)))
  "Returns string type for a service object of type 'Goal-response"
  "path_planner/GoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Goal-response>)))
  "Returns md5sum for a message object of type '<Goal-response>"
  "257e57560eaef13378eb07b58da2c735")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Goal-response)))
  "Returns md5sum for a message object of type 'Goal-response"
  "257e57560eaef13378eb07b58da2c735")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Goal-response>)))
  "Returns full string definition for message of type '<Goal-response>"
  (cl:format cl:nil "int32 goal~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Goal-response)))
  "Returns full string definition for message of type 'Goal-response"
  (cl:format cl:nil "int32 goal~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Goal-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Goal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Goal-response
    (cl:cons ':goal (goal msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Goal)))
  'Goal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Goal)))
  'Goal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Goal)))
  "Returns string type for a service object of type '<Goal>"
  "path_planner/Goal")