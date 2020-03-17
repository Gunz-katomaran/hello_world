; Auto-generated. Do not edit!


(cl:in-package path_follower-srv)


;//! \htmlinclude Nearest-request.msg.html

(cl:defclass <Nearest-request> (roslisp-msg-protocol:ros-message)
  ((near
    :reader near
    :initarg :near
    :type cl:integer
    :initform 0))
)

(cl:defclass Nearest-request (<Nearest-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nearest-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nearest-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_follower-srv:<Nearest-request> is deprecated: use path_follower-srv:Nearest-request instead.")))

(cl:ensure-generic-function 'near-val :lambda-list '(m))
(cl:defmethod near-val ((m <Nearest-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_follower-srv:near-val is deprecated.  Use path_follower-srv:near instead.")
  (near m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nearest-request>) ostream)
  "Serializes a message object of type '<Nearest-request>"
  (cl:let* ((signed (cl:slot-value msg 'near)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nearest-request>) istream)
  "Deserializes a message object of type '<Nearest-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'near) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Nearest-request>)))
  "Returns string type for a service object of type '<Nearest-request>"
  "path_follower/NearestRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nearest-request)))
  "Returns string type for a service object of type 'Nearest-request"
  "path_follower/NearestRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Nearest-request>)))
  "Returns md5sum for a message object of type '<Nearest-request>"
  "971c336fc98e1a1ea33980f32a28c2d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nearest-request)))
  "Returns md5sum for a message object of type 'Nearest-request"
  "971c336fc98e1a1ea33980f32a28c2d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nearest-request>)))
  "Returns full string definition for message of type '<Nearest-request>"
  (cl:format cl:nil "int32 near~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nearest-request)))
  "Returns full string definition for message of type 'Nearest-request"
  (cl:format cl:nil "int32 near~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nearest-request>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nearest-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Nearest-request
    (cl:cons ':near (near msg))
))
;//! \htmlinclude Nearest-response.msg.html

(cl:defclass <Nearest-response> (roslisp-msg-protocol:ros-message)
  ((result
    :reader result
    :initarg :result
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Nearest-response (<Nearest-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Nearest-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Nearest-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_follower-srv:<Nearest-response> is deprecated: use path_follower-srv:Nearest-response instead.")))

(cl:ensure-generic-function 'result-val :lambda-list '(m))
(cl:defmethod result-val ((m <Nearest-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_follower-srv:result-val is deprecated.  Use path_follower-srv:result instead.")
  (result m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Nearest-response>) ostream)
  "Serializes a message object of type '<Nearest-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'result) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Nearest-response>) istream)
  "Deserializes a message object of type '<Nearest-response>"
    (cl:setf (cl:slot-value msg 'result) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Nearest-response>)))
  "Returns string type for a service object of type '<Nearest-response>"
  "path_follower/NearestResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nearest-response)))
  "Returns string type for a service object of type 'Nearest-response"
  "path_follower/NearestResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Nearest-response>)))
  "Returns md5sum for a message object of type '<Nearest-response>"
  "971c336fc98e1a1ea33980f32a28c2d9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Nearest-response)))
  "Returns md5sum for a message object of type 'Nearest-response"
  "971c336fc98e1a1ea33980f32a28c2d9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Nearest-response>)))
  "Returns full string definition for message of type '<Nearest-response>"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Nearest-response)))
  "Returns full string definition for message of type 'Nearest-response"
  (cl:format cl:nil "bool result~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Nearest-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Nearest-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Nearest-response
    (cl:cons ':result (result msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Nearest)))
  'Nearest-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Nearest)))
  'Nearest-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Nearest)))
  "Returns string type for a service object of type '<Nearest>"
  "path_follower/Nearest")