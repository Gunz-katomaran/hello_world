; Auto-generated. Do not edit!


(cl:in-package path_planner-srv)


;//! \htmlinclude Manager-request.msg.html

(cl:defclass <Manager-request> (roslisp-msg-protocol:ros-message)
  ((name
    :reader name
    :initarg :name
    :type cl:string
    :initform ""))
)

(cl:defclass Manager-request (<Manager-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Manager-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Manager-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<Manager-request> is deprecated: use path_planner-srv:Manager-request instead.")))

(cl:ensure-generic-function 'name-val :lambda-list '(m))
(cl:defmethod name-val ((m <Manager-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:name-val is deprecated.  Use path_planner-srv:name instead.")
  (name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Manager-request>) ostream)
  "Serializes a message object of type '<Manager-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Manager-request>) istream)
  "Deserializes a message object of type '<Manager-request>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Manager-request>)))
  "Returns string type for a service object of type '<Manager-request>"
  "path_planner/ManagerRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Manager-request)))
  "Returns string type for a service object of type 'Manager-request"
  "path_planner/ManagerRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Manager-request>)))
  "Returns md5sum for a message object of type '<Manager-request>"
  "e39df53132eef39cca149f18cce9cea9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Manager-request)))
  "Returns md5sum for a message object of type 'Manager-request"
  "e39df53132eef39cca149f18cce9cea9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Manager-request>)))
  "Returns full string definition for message of type '<Manager-request>"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Manager-request)))
  "Returns full string definition for message of type 'Manager-request"
  (cl:format cl:nil "string name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Manager-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Manager-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Manager-request
    (cl:cons ':name (name msg))
))
;//! \htmlinclude Manager-response.msg.html

(cl:defclass <Manager-response> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:string
    :initform ""))
)

(cl:defclass Manager-response (<Manager-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Manager-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Manager-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<Manager-response> is deprecated: use path_planner-srv:Manager-response instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <Manager-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:status-val is deprecated.  Use path_planner-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Manager-response>) ostream)
  "Serializes a message object of type '<Manager-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'status))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'status))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Manager-response>) istream)
  "Deserializes a message object of type '<Manager-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Manager-response>)))
  "Returns string type for a service object of type '<Manager-response>"
  "path_planner/ManagerResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Manager-response)))
  "Returns string type for a service object of type 'Manager-response"
  "path_planner/ManagerResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Manager-response>)))
  "Returns md5sum for a message object of type '<Manager-response>"
  "e39df53132eef39cca149f18cce9cea9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Manager-response)))
  "Returns md5sum for a message object of type 'Manager-response"
  "e39df53132eef39cca149f18cce9cea9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Manager-response>)))
  "Returns full string definition for message of type '<Manager-response>"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Manager-response)))
  "Returns full string definition for message of type 'Manager-response"
  (cl:format cl:nil "string status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Manager-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'status))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Manager-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Manager-response
    (cl:cons ':status (status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Manager)))
  'Manager-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Manager)))
  'Manager-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Manager)))
  "Returns string type for a service object of type '<Manager>"
  "path_planner/Manager")