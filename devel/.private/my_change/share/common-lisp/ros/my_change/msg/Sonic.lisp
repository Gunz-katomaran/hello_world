; Auto-generated. Do not edit!


(cl:in-package my_change-msg)


;//! \htmlinclude Sonic.msg.html

(cl:defclass <Sonic> (roslisp-msg-protocol:ros-message)
  ((no
    :reader no
    :initarg :no
    :type cl:integer
    :initform 0)
   (distance1
    :reader distance1
    :initarg :distance1
    :type cl:float
    :initform 0.0)
   (distance2
    :reader distance2
    :initarg :distance2
    :type cl:float
    :initform 0.0)
   (distance3
    :reader distance3
    :initarg :distance3
    :type cl:float
    :initform 0.0)
   (distance4
    :reader distance4
    :initarg :distance4
    :type cl:float
    :initform 0.0)
   (distance5
    :reader distance5
    :initarg :distance5
    :type cl:float
    :initform 0.0))
)

(cl:defclass Sonic (<Sonic>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Sonic>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Sonic)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name my_change-msg:<Sonic> is deprecated: use my_change-msg:Sonic instead.")))

(cl:ensure-generic-function 'no-val :lambda-list '(m))
(cl:defmethod no-val ((m <Sonic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_change-msg:no-val is deprecated.  Use my_change-msg:no instead.")
  (no m))

(cl:ensure-generic-function 'distance1-val :lambda-list '(m))
(cl:defmethod distance1-val ((m <Sonic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_change-msg:distance1-val is deprecated.  Use my_change-msg:distance1 instead.")
  (distance1 m))

(cl:ensure-generic-function 'distance2-val :lambda-list '(m))
(cl:defmethod distance2-val ((m <Sonic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_change-msg:distance2-val is deprecated.  Use my_change-msg:distance2 instead.")
  (distance2 m))

(cl:ensure-generic-function 'distance3-val :lambda-list '(m))
(cl:defmethod distance3-val ((m <Sonic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_change-msg:distance3-val is deprecated.  Use my_change-msg:distance3 instead.")
  (distance3 m))

(cl:ensure-generic-function 'distance4-val :lambda-list '(m))
(cl:defmethod distance4-val ((m <Sonic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_change-msg:distance4-val is deprecated.  Use my_change-msg:distance4 instead.")
  (distance4 m))

(cl:ensure-generic-function 'distance5-val :lambda-list '(m))
(cl:defmethod distance5-val ((m <Sonic>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader my_change-msg:distance5-val is deprecated.  Use my_change-msg:distance5 instead.")
  (distance5 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Sonic>) ostream)
  "Serializes a message object of type '<Sonic>"
  (cl:let* ((signed (cl:slot-value msg 'no)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'distance5))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Sonic>) istream)
  "Deserializes a message object of type '<Sonic>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'no) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance4) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'distance5) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Sonic>)))
  "Returns string type for a message object of type '<Sonic>"
  "my_change/Sonic")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Sonic)))
  "Returns string type for a message object of type 'Sonic"
  "my_change/Sonic")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Sonic>)))
  "Returns md5sum for a message object of type '<Sonic>"
  "28ade20c4ac74f4cfe91fd6effaf9b2e")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Sonic)))
  "Returns md5sum for a message object of type 'Sonic"
  "28ade20c4ac74f4cfe91fd6effaf9b2e")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Sonic>)))
  "Returns full string definition for message of type '<Sonic>"
  (cl:format cl:nil "int32 no~%float32 distance1~%float32 distance2~%float32 distance3~%float32 distance4~%float32 distance5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Sonic)))
  "Returns full string definition for message of type 'Sonic"
  (cl:format cl:nil "int32 no~%float32 distance1~%float32 distance2~%float32 distance3~%float32 distance4~%float32 distance5~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Sonic>))
  (cl:+ 0
     4
     4
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Sonic>))
  "Converts a ROS message object to a list"
  (cl:list 'Sonic
    (cl:cons ':no (no msg))
    (cl:cons ':distance1 (distance1 msg))
    (cl:cons ':distance2 (distance2 msg))
    (cl:cons ':distance3 (distance3 msg))
    (cl:cons ':distance4 (distance4 msg))
    (cl:cons ':distance5 (distance5 msg))
))
