; Auto-generated. Do not edit!


(cl:in-package robo_waiter-srv)


;//! \htmlinclude Pause-request.msg.html

(cl:defclass <Pause-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass Pause-request (<Pause-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Pause-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Pause-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robo_waiter-srv:<Pause-request> is deprecated: use robo_waiter-srv:Pause-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Pause-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-srv:name-val is deprecated.  Use robo_waiter-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Pause-request>) ostream)
  "Serializes a message object of type '<Pause-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Pause-request>) istream)
  "Deserializes a message object of type '<Pause-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Pause-request>)))
  "Returns string type for a service object of type '<Pause-request>"
  "robo_waiter/PauseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pause-request)))
  "Returns string type for a service object of type 'Pause-request"
  "robo_waiter/PauseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Pause-request>)))
  "Returns md5sum for a message object of type '<Pause-request>"
  "3dfb9d0014ecbba1e3c8cb189553972f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Pause-request)))
  "Returns md5sum for a message object of type 'Pause-request"
  "3dfb9d0014ecbba1e3c8cb189553972f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Pause-request>)))
  "Returns full string definition for message of type '<Pause-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Pause-request)))
  "Returns full string definition for message of type 'Pause-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Pause-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Pause-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Pause-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude Pause-response.msg.html

(cl:defclass <Pause-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:string
    :initform ""))
)

(cl:defclass Pause-response (<Pause-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Pause-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Pause-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robo_waiter-srv:<Pause-response> is deprecated: use robo_waiter-srv:Pause-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <Pause-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-srv:reply-val is deprecated.  Use robo_waiter-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Pause-response>) ostream)
  "Serializes a message object of type '<Pause-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reply))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reply))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Pause-response>) istream)
  "Deserializes a message object of type '<Pause-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Pause-response>)))
  "Returns string type for a service object of type '<Pause-response>"
  "robo_waiter/PauseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pause-response)))
  "Returns string type for a service object of type 'Pause-response"
  "robo_waiter/PauseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Pause-response>)))
  "Returns md5sum for a message object of type '<Pause-response>"
  "3dfb9d0014ecbba1e3c8cb189553972f")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Pause-response)))
  "Returns md5sum for a message object of type 'Pause-response"
  "3dfb9d0014ecbba1e3c8cb189553972f")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Pause-response>)))
  "Returns full string definition for message of type '<Pause-response>"
  (cl:format cl:nil "string reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Pause-response)))
  "Returns full string definition for message of type 'Pause-response"
  (cl:format cl:nil "string reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Pause-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'reply))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Pause-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Pause-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Pause)))
  'Pause-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Pause)))
  'Pause-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Pause)))
  "Returns string type for a service object of type '<Pause>"
  "robo_waiter/Pause")