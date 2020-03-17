; Auto-generated. Do not edit!


(cl:in-package robo_waiter-msg)


;//! \htmlinclude Mile.msg.html

(cl:defclass <Mile> (roslisp-msg-protocol:ros-message)
  ((table_name
    :reader table_name
    :initarg :table_name
    :type cl:string
    :initform "")
   (table_direction
    :reader table_direction
    :initarg :table_direction
    :type cl:string
    :initform "")
   (table_duration
    :reader table_duration
    :initarg :table_duration
    :type cl:integer
    :initform 0))
)

(cl:defclass Mile (<Mile>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Mile>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Mile)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robo_waiter-msg:<Mile> is deprecated: use robo_waiter-msg:Mile instead.")))

(cl:ensure-generic-function 'table_name-val :lambda-list '(m))
(cl:defmethod table_name-val ((m <Mile>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-msg:table_name-val is deprecated.  Use robo_waiter-msg:table_name instead.")
  (table_name m))

(cl:ensure-generic-function 'table_direction-val :lambda-list '(m))
(cl:defmethod table_direction-val ((m <Mile>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-msg:table_direction-val is deprecated.  Use robo_waiter-msg:table_direction instead.")
  (table_direction m))

(cl:ensure-generic-function 'table_duration-val :lambda-list '(m))
(cl:defmethod table_duration-val ((m <Mile>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-msg:table_duration-val is deprecated.  Use robo_waiter-msg:table_duration instead.")
  (table_duration m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Mile>) ostream)
  "Serializes a message object of type '<Mile>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'table_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'table_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'table_direction))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'table_direction))
  (cl:let* ((signed (cl:slot-value msg 'table_duration)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Mile>) istream)
  "Deserializes a message object of type '<Mile>"
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
      (cl:setf (cl:slot-value msg 'table_direction) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'table_direction) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'table_duration) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Mile>)))
  "Returns string type for a message object of type '<Mile>"
  "robo_waiter/Mile")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Mile)))
  "Returns string type for a message object of type 'Mile"
  "robo_waiter/Mile")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Mile>)))
  "Returns md5sum for a message object of type '<Mile>"
  "a034aa34a43b47ed728f083557e2842d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Mile)))
  "Returns md5sum for a message object of type 'Mile"
  "a034aa34a43b47ed728f083557e2842d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Mile>)))
  "Returns full string definition for message of type '<Mile>"
  (cl:format cl:nil "string table_name~%string table_direction~%int32 table_duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Mile)))
  "Returns full string definition for message of type 'Mile"
  (cl:format cl:nil "string table_name~%string table_direction~%int32 table_duration~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Mile>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'table_name))
     4 (cl:length (cl:slot-value msg 'table_direction))
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Mile>))
  "Converts a ROS message object to a list"
  (cl:list 'Mile
    (cl:cons ':table_name (table_name msg))
    (cl:cons ':table_direction (table_direction msg))
    (cl:cons ':table_duration (table_duration msg))
))
