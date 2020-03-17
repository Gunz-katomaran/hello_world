; Auto-generated. Do not edit!


(cl:in-package robo_waiter-srv)


;//! \htmlinclude Tl_gl-request.msg.html

(cl:defclass <Tl_gl-request> (roslisp-msg-protocol:ros-message)
  ((table_name
    :reader table_name
    :initarg :table_name
    :type cl:string
    :initform "")
   (direction
    :reader direction
    :initarg :direction
    :type cl:string
    :initform "")
   (duration
    :reader duration
    :initarg :duration
    :type cl:integer
    :initform 0))
)

(cl:defclass Tl_gl-request (<Tl_gl-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Tl_gl-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Tl_gl-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robo_waiter-srv:<Tl_gl-request> is deprecated: use robo_waiter-srv:Tl_gl-request instead.")))

(cl:ensure-generic-function 'table_name-val :lambda-list '(m))
(cl:defmethod table_name-val ((m <Tl_gl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-srv:table_name-val is deprecated.  Use robo_waiter-srv:table_name instead.")
  (table_name m))

(cl:ensure-generic-function 'direction-val :lambda-list '(m))
(cl:defmethod direction-val ((m <Tl_gl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-srv:direction-val is deprecated.  Use robo_waiter-srv:direction instead.")
  (direction m))

(cl:ensure-generic-function 'duration-val :lambda-list '(m))
(cl:defmethod duration-val ((m <Tl_gl-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-srv:duration-val is deprecated.  Use robo_waiter-srv:duration instead.")
  (duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Tl_gl-request>) ostream)
  "Serializes a message object of type '<Tl_gl-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'table_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'table_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'direction))
  (cl:let* ((signed (cl:slot-value msg 'duration)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
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
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'duration) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Tl_gl-request>)))
  "Returns string type for a service object of type '<Tl_gl-request>"
  "robo_waiter/Tl_glRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tl_gl-request)))
  "Returns string type for a service object of type 'Tl_gl-request"
  "robo_waiter/Tl_glRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tl_gl-request>)))
  "Returns md5sum for a message object of type '<Tl_gl-request>"
  "845a03915f6be3b247beed805d731b4d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tl_gl-request)))
  "Returns md5sum for a message object of type 'Tl_gl-request"
  "845a03915f6be3b247beed805d731b4d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Tl_gl-request>)))
  "Returns full string definition for message of type '<Tl_gl-request>"
  (cl:format cl:nil "string table_name~%string direction~%int32 duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Tl_gl-request)))
  "Returns full string definition for message of type 'Tl_gl-request"
  (cl:format cl:nil "string table_name~%string direction~%int32 duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Tl_gl-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'table_name))
     4 (cl:length (cl:slot-value msg 'direction))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Tl_gl-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Tl_gl-request
    (cl:cons ':table_name (table_name msg))
    (cl:cons ':direction (direction msg))
    (cl:cons ':duration (duration msg))
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
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robo_waiter-srv:<Tl_gl-response> is deprecated: use robo_waiter-srv:Tl_gl-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <Tl_gl-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-srv:reply-val is deprecated.  Use robo_waiter-srv:reply instead.")
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
  "robo_waiter/Tl_glResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Tl_gl-response)))
  "Returns string type for a service object of type 'Tl_gl-response"
  "robo_waiter/Tl_glResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Tl_gl-response>)))
  "Returns md5sum for a message object of type '<Tl_gl-response>"
  "845a03915f6be3b247beed805d731b4d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Tl_gl-response)))
  "Returns md5sum for a message object of type 'Tl_gl-response"
  "845a03915f6be3b247beed805d731b4d")
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
  "robo_waiter/Tl_gl")