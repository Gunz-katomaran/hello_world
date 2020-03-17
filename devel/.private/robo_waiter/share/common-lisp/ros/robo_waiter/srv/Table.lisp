; Auto-generated. Do not edit!


(cl:in-package robo_waiter-srv)


;//! \htmlinclude Table-request.msg.html

(cl:defclass <Table-request> (roslisp-msg-protocol:ros-message)
  ((table_name
    :reader table_name
    :initarg :table_name
    :type cl:string
    :initform ""))
)

(cl:defclass Table-request (<Table-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Table-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Table-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robo_waiter-srv:<Table-request> is deprecated: use robo_waiter-srv:Table-request instead.")))

(cl:ensure-generic-function 'table_name-val :lambda-list '(m))
(cl:defmethod table_name-val ((m <Table-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-srv:table_name-val is deprecated.  Use robo_waiter-srv:table_name instead.")
  (table_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Table-request>) ostream)
  "Serializes a message object of type '<Table-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'table_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'table_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Table-request>) istream)
  "Deserializes a message object of type '<Table-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Table-request>)))
  "Returns string type for a service object of type '<Table-request>"
  "robo_waiter/TableRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Table-request)))
  "Returns string type for a service object of type 'Table-request"
  "robo_waiter/TableRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Table-request>)))
  "Returns md5sum for a message object of type '<Table-request>"
  "d9bc86335236069bddf3bda6b288eda2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Table-request)))
  "Returns md5sum for a message object of type 'Table-request"
  "d9bc86335236069bddf3bda6b288eda2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Table-request>)))
  "Returns full string definition for message of type '<Table-request>"
  (cl:format cl:nil "string table_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Table-request)))
  "Returns full string definition for message of type 'Table-request"
  (cl:format cl:nil "string table_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Table-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'table_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Table-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Table-request
    (cl:cons ':table_name (table_name msg))
))
;//! \htmlinclude Table-response.msg.html

(cl:defclass <Table-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:string
    :initform ""))
)

(cl:defclass Table-response (<Table-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Table-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Table-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robo_waiter-srv:<Table-response> is deprecated: use robo_waiter-srv:Table-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <Table-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-srv:reply-val is deprecated.  Use robo_waiter-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Table-response>) ostream)
  "Serializes a message object of type '<Table-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reply))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reply))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Table-response>) istream)
  "Deserializes a message object of type '<Table-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Table-response>)))
  "Returns string type for a service object of type '<Table-response>"
  "robo_waiter/TableResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Table-response)))
  "Returns string type for a service object of type 'Table-response"
  "robo_waiter/TableResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Table-response>)))
  "Returns md5sum for a message object of type '<Table-response>"
  "d9bc86335236069bddf3bda6b288eda2")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Table-response)))
  "Returns md5sum for a message object of type 'Table-response"
  "d9bc86335236069bddf3bda6b288eda2")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Table-response>)))
  "Returns full string definition for message of type '<Table-response>"
  (cl:format cl:nil "string reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Table-response)))
  "Returns full string definition for message of type 'Table-response"
  (cl:format cl:nil "string reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Table-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'reply))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Table-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Table-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Table)))
  'Table-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Table)))
  'Table-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Table)))
  "Returns string type for a service object of type '<Table>"
  "robo_waiter/Table")