; Auto-generated. Do not edit!


(cl:in-package patrol_planner-srv)


;//! \htmlinclude Save-request.msg.html

(cl:defclass <Save-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass Save-request (<Save-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Save-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Save-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_planner-srv:<Save-request> is deprecated: use patrol_planner-srv:Save-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Save-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:name-val is deprecated.  Use patrol_planner-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Save-request>) ostream)
  "Serializes a message object of type '<Save-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Save-request>) istream)
  "Deserializes a message object of type '<Save-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Save-request>)))
  "Returns string type for a service object of type '<Save-request>"
  "patrol_planner/SaveRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Save-request)))
  "Returns string type for a service object of type 'Save-request"
  "patrol_planner/SaveRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Save-request>)))
  "Returns md5sum for a message object of type '<Save-request>"
  "e39df53132eef39cca149f18cce9cea9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Save-request)))
  "Returns md5sum for a message object of type 'Save-request"
  "e39df53132eef39cca149f18cce9cea9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Save-request>)))
  "Returns full string definition for message of type '<Save-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Save-request)))
  "Returns full string definition for message of type 'Save-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Save-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Save-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Save-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude Save-response.msg.html

(cl:defclass <Save-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass Save-response (<Save-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Save-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Save-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_planner-srv:<Save-response> is deprecated: use patrol_planner-srv:Save-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <Save-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:status-val is deprecated.  Use patrol_planner-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Save-response>) ostream)
  "Serializes a message object of type '<Save-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Save-response>) istream)
  "Deserializes a message object of type '<Save-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'status) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'status) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Save-response>)))
  "Returns string type for a service object of type '<Save-response>"
  "patrol_planner/SaveResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Save-response)))
  "Returns string type for a service object of type 'Save-response"
  "patrol_planner/SaveResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Save-response>)))
  "Returns md5sum for a message object of type '<Save-response>"
  "e39df53132eef39cca149f18cce9cea9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Save-response)))
  "Returns md5sum for a message object of type 'Save-response"
  "e39df53132eef39cca149f18cce9cea9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Save-response>)))
  "Returns full string definition for message of type '<Save-response>"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Save-response)))
  "Returns full string definition for message of type 'Save-response"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Save-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Save-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Save-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Save)))
  'Save-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Save)))
  'Save-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Save)))
  "Returns string type for a service object of type '<Save>"
  "patrol_planner/Save")