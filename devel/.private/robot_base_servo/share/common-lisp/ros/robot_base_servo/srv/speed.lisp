; Auto-generated. Do not edit!


(cl:in-package robot_base_servo-srv)


;//! \htmlinclude speed-request.msg.html

(cl:defclass <speed-request> (roslisp-msg-protocol:ros-message)
  ()
)

(cl:defclass speed-request (<speed-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <speed-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'speed-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_base_servo-srv:<speed-request> is deprecated: use robot_base_servo-srv:speed-request instead.")))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <speed-request>) ostream)
  "Serializes a message object of type '<speed-request>"
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <speed-request>) istream)
  "Deserializes a message object of type '<speed-request>"
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<speed-request>)))
  "Returns string type for a service object of type '<speed-request>"
  "robot_base_servo/speedRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'speed-request)))
  "Returns string type for a service object of type 'speed-request"
  "robot_base_servo/speedRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<speed-request>)))
  "Returns md5sum for a message object of type '<speed-request>"
  "f4e6290d51987b0b075a95509c473580")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'speed-request)))
  "Returns md5sum for a message object of type 'speed-request"
  "f4e6290d51987b0b075a95509c473580")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<speed-request>)))
  "Returns full string definition for message of type '<speed-request>"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'speed-request)))
  "Returns full string definition for message of type 'speed-request"
  (cl:format cl:nil "~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <speed-request>))
  (cl:+ 0
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <speed-request>))
  "Converts a ROS message object to a list"
  (cl:list 'speed-request
))
;//! \htmlinclude speed-response.msg.html

(cl:defclass <speed-response> (roslisp-msg-protocol:ros-message)
  ((speed_1
    :reader speed_1
    :initarg :speed_1
    :type cl:integer
    :initform 0)
   (speed_2
    :reader speed_2
    :initarg :speed_2
    :type cl:integer
    :initform 0)
   (speed_3
    :reader speed_3
    :initarg :speed_3
    :type cl:integer
    :initform 0)
   (speed_4
    :reader speed_4
    :initarg :speed_4
    :type cl:integer
    :initform 0))
)

(cl:defclass speed-response (<speed-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <speed-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'speed-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robot_base_servo-srv:<speed-response> is deprecated: use robot_base_servo-srv:speed-response instead.")))

(cl:ensure-generic-function 'speed_1-val :lambda-list '(m))
(cl:defmethod speed_1-val ((m <speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_base_servo-srv:speed_1-val is deprecated.  Use robot_base_servo-srv:speed_1 instead.")
  (speed_1 m))

(cl:ensure-generic-function 'speed_2-val :lambda-list '(m))
(cl:defmethod speed_2-val ((m <speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_base_servo-srv:speed_2-val is deprecated.  Use robot_base_servo-srv:speed_2 instead.")
  (speed_2 m))

(cl:ensure-generic-function 'speed_3-val :lambda-list '(m))
(cl:defmethod speed_3-val ((m <speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_base_servo-srv:speed_3-val is deprecated.  Use robot_base_servo-srv:speed_3 instead.")
  (speed_3 m))

(cl:ensure-generic-function 'speed_4-val :lambda-list '(m))
(cl:defmethod speed_4-val ((m <speed-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robot_base_servo-srv:speed_4-val is deprecated.  Use robot_base_servo-srv:speed_4 instead.")
  (speed_4 m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <speed-response>) ostream)
  "Serializes a message object of type '<speed-response>"
  (cl:let* ((signed (cl:slot-value msg 'speed_1)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'speed_2)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'speed_3)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'speed_4)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <speed-response>) istream)
  "Deserializes a message object of type '<speed-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed_1) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed_2) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed_3) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'speed_4) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<speed-response>)))
  "Returns string type for a service object of type '<speed-response>"
  "robot_base_servo/speedResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'speed-response)))
  "Returns string type for a service object of type 'speed-response"
  "robot_base_servo/speedResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<speed-response>)))
  "Returns md5sum for a message object of type '<speed-response>"
  "f4e6290d51987b0b075a95509c473580")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'speed-response)))
  "Returns md5sum for a message object of type 'speed-response"
  "f4e6290d51987b0b075a95509c473580")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<speed-response>)))
  "Returns full string definition for message of type '<speed-response>"
  (cl:format cl:nil "int32 speed_1~%int32 speed_2~%int32 speed_3~%int32 speed_4~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'speed-response)))
  "Returns full string definition for message of type 'speed-response"
  (cl:format cl:nil "int32 speed_1~%int32 speed_2~%int32 speed_3~%int32 speed_4~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <speed-response>))
  (cl:+ 0
     4
     4
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <speed-response>))
  "Converts a ROS message object to a list"
  (cl:list 'speed-response
    (cl:cons ':speed_1 (speed_1 msg))
    (cl:cons ':speed_2 (speed_2 msg))
    (cl:cons ':speed_3 (speed_3 msg))
    (cl:cons ':speed_4 (speed_4 msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'speed)))
  'speed-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'speed)))
  'speed-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'speed)))
  "Returns string type for a service object of type '<speed>"
  "robot_base_servo/speed")