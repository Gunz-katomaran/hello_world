; Auto-generated. Do not edit!


(cl:in-package robot_base_servo-srv)


;//! \htmlinclude voltage-request.msg.html

(cl:defclass <voltage-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass voltage-request (<voltage-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <voltage-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'voltage-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_base_servo-srv:<voltage-request> is deprecated: use robot_base_servo-srv:voltage-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <voltage-request>) ostream)
  "Serializes a message object of type '<voltage-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <voltage-request>) istream)
  "Deserializes a message object of type '<voltage-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<voltage-request>)))
  "Returns string type for a service object of type '<voltage-request>"
  "robot_base_servo/voltageRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'voltage-request)))
  "Returns string type for a service object of type 'voltage-request"
  "robot_base_servo/voltageRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<voltage-request>)))
  "Returns md5sum for a message object of type '<voltage-request>"
  "00886afbc7627a03f5753fba171f3ab9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'voltage-request)))
  "Returns md5sum for a message object of type 'voltage-request"
  "00886afbc7627a03f5753fba171f3ab9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<voltage-request>)))
  "Returns full string definition for message of type '<voltage-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'voltage-request)))
  "Returns full string definition for message of type 'voltage-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <voltage-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <voltage-request>))
  "Converts a ROS message object to a list"
  (cl:list 'voltage-request
))
;//! \htmlinclude voltage-response.msg.html

(cl:defclass <voltage-response> (roslisp-msg-protocol:ros-message)
  ((volt_1
    :reader volt_1
    :initarg :volt_1
    :type cl:float
    :initform 0.0)
   (volt_2
    :reader volt_2
    :initarg :volt_2
    :type cl:float
    :initform 0.0)
   (volt_3
    :reader volt_3
    :initarg :volt_3
    :type cl:float
    :initform 0.0)
   (volt_4
    :reader volt_4
    :initarg :volt_4
    :type cl:float
    :initform 0.0))
)

(cl:defclass voltage-response (<voltage-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <voltage-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'voltage-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_base_servo-srv:<voltage-response> is deprecated: use robot_base_servo-srv:voltage-response instead.")))

(cl:ensure-generic-function 'volt_1-val :lambda-list '(m))
(cl:defmethod volt_1-val ((m <voltage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_base_servo-srv:volt_1-val is deprecated.  Use robot_base_servo-srv:volt_1 instead.")
  (volt_1 m))

(cl:ensure-generic-function 'volt_2-val :lambda-list '(m))
(cl:defmethod volt_2-val ((m <voltage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_base_servo-srv:volt_2-val is deprecated.  Use robot_base_servo-srv:volt_2 instead.")
  (volt_2 m))

(cl:ensure-generic-function 'volt_3-val :lambda-list '(m))
(cl:defmethod volt_3-val ((m <voltage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_base_servo-srv:volt_3-val is deprecated.  Use robot_base_servo-srv:volt_3 instead.")
  (volt_3 m))

(cl:ensure-generic-function 'volt_4-val :lambda-list '(m))
(cl:defmethod volt_4-val ((m <voltage-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_base_servo-srv:volt_4-val is deprecated.  Use robot_base_servo-srv:volt_4 instead.")
  (volt_4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <voltage-response>) ostream)
  "Serializes a message object of type '<voltage-response>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'volt_1))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'volt_2))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'volt_3))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'volt_4))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <voltage-response>) istream)
  "Deserializes a message object of type '<voltage-response>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'volt_1) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'volt_2) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'volt_3) (roslisp-utils:decode-single-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'volt_4) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<voltage-response>)))
  "Returns string type for a service object of type '<voltage-response>"
  "robot_base_servo/voltageResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'voltage-response)))
  "Returns string type for a service object of type 'voltage-response"
  "robot_base_servo/voltageResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<voltage-response>)))
  "Returns md5sum for a message object of type '<voltage-response>"
  "00886afbc7627a03f5753fba171f3ab9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'voltage-response)))
  "Returns md5sum for a message object of type 'voltage-response"
  "00886afbc7627a03f5753fba171f3ab9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<voltage-response>)))
  "Returns full string definition for message of type '<voltage-response>"
  (cl:format cl:nil "float32 volt_1~%float32 volt_2~%float32 volt_3~%float32 volt_4~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'voltage-response)))
  "Returns full string definition for message of type 'voltage-response"
  (cl:format cl:nil "float32 volt_1~%float32 volt_2~%float32 volt_3~%float32 volt_4~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <voltage-response>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <voltage-response>))
  "Converts a ROS message object to a list"
  (cl:list 'voltage-response
    (cl:cons ':volt_1 (volt_1 msg))
    (cl:cons ':volt_2 (volt_2 msg))
    (cl:cons ':volt_3 (volt_3 msg))
    (cl:cons ':volt_4 (volt_4 msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'voltage)))
  'voltage-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'voltage)))
  'voltage-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'voltage)))
  "Returns string type for a service object of type '<voltage>"
  "robot_base_servo/voltage")