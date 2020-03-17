; Auto-generated. Do not edit!


(cl:in-package patrol_planner-srv)


;//! \htmlinclude Tl_gl-request.msg.html

(cl:defclass <Tl_gl-request> (roslisp-msg-protocol:ros-message)
  ((table_name
    :reader table_name
    :initarg :table_name
    :type cl:string
    :initform ""))
)

(cl:defclass Tl_gl-request (<Tl_gl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Tl_gl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Tl_gl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_planner-srv:<Tl_gl-request> is deprecated: use patrol_planner-srv:Tl_gl-request instead.")))

(cl:ensure-generic-function 'table_name-val :lambda-list '(m))
(cl:defmethod table_name-val ((m <Tl_gl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:table_name-val is deprecated.  Use patrol_planner-srv:table_name instead.")
  (table_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Tl_gl-request>) ostream)
  "Serializes a message object of type '<Tl_gl-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'table_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'table_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Tl_gl-request>) istream)
  "Deserializes a message object of type '<Tl_gl-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'table_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'table_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Tl_gl-request>)))
  "Returns string type for a service object of type '<Tl_gl-request>"
  "patrol_planner/Tl_glRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tl_gl-request)))
  "Returns string type for a service object of type 'Tl_gl-request"
  "patrol_planner/Tl_glRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tl_gl-request>)))
  "Returns md5sum for a message object of type '<Tl_gl-request>"
  "d9bc86335236069bddf3bda6b288eda2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tl_gl-request)))
  "Returns md5sum for a message object of type 'Tl_gl-request"
  "d9bc86335236069bddf3bda6b288eda2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Tl_gl-request>)))
  "Returns full string definition for message of type '<Tl_gl-request>"
  (cl:format cl:nil "string table_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Tl_gl-request)))
  "Returns full string definition for message of type 'Tl_gl-request"
  (cl:format cl:nil "string table_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Tl_gl-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'table_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Tl_gl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Tl_gl-request
    (cl:cons ':table_name (table_name msg))
))
;//! \htmlinclude Tl_gl-response.msg.html

(cl:defclass <Tl_gl-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:string
    :initform ""))
)

(cl:defclass Tl_gl-response (<Tl_gl-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Tl_gl-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Tl_gl-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_planner-srv:<Tl_gl-response> is deprecated: use patrol_planner-srv:Tl_gl-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <Tl_gl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:reply-val is deprecated.  Use patrol_planner-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Tl_gl-response>) ostream)
  "Serializes a message object of type '<Tl_gl-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reply))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reply))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Tl_gl-response>) istream)
  "Deserializes a message object of type '<Tl_gl-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'reply) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'reply) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Tl_gl-response>)))
  "Returns string type for a service object of type '<Tl_gl-response>"
  "patrol_planner/Tl_glResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tl_gl-response)))
  "Returns string type for a service object of type 'Tl_gl-response"
  "patrol_planner/Tl_glResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tl_gl-response>)))
  "Returns md5sum for a message object of type '<Tl_gl-response>"
  "d9bc86335236069bddf3bda6b288eda2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tl_gl-response)))
  "Returns md5sum for a message object of type 'Tl_gl-response"
  "d9bc86335236069bddf3bda6b288eda2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Tl_gl-response>)))
  "Returns full string definition for message of type '<Tl_gl-response>"
  (cl:format cl:nil "string reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Tl_gl-response)))
  "Returns full string definition for message of type 'Tl_gl-response"
  (cl:format cl:nil "string reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Tl_gl-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'reply))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Tl_gl-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Tl_gl-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Tl_gl)))
  'Tl_gl-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Tl_gl)))
  'Tl_gl-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tl_gl)))
  "Returns string type for a service object of type '<Tl_gl>"
  "patrol_planner/Tl_gl")