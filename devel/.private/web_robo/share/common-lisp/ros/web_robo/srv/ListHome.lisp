; Auto-generated. Do not edit!


(cl:in-package web_robo-srv)


;//! \htmlinclude ListHome-request.msg.html

(cl:defclass <ListHome-request> (roslisp-msg-protocol:ros-message)
  ((web_request
    :reader web_request
    :initarg :web_request
    :type cl:string
    :initform ""))
)

(cl:defclass ListHome-request (<ListHome-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ListHome-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ListHome-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_robo-srv:<ListHome-request> is deprecated: use web_robo-srv:ListHome-request instead.")))

(cl:ensure-generic-function 'web_request-val :lambda-list '(m))
(cl:defmethod web_request-val ((m <ListHome-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_robo-srv:web_request-val is deprecated.  Use web_robo-srv:web_request instead.")
  (web_request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ListHome-request>) ostream)
  "Serializes a message object of type '<ListHome-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'web_request))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'web_request))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ListHome-request>) istream)
  "Deserializes a message object of type '<ListHome-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'web_request) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'web_request) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ListHome-request>)))
  "Returns string type for a service object of type '<ListHome-request>"
  "web_robo/ListHomeRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListHome-request)))
  "Returns string type for a service object of type 'ListHome-request"
  "web_robo/ListHomeRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ListHome-request>)))
  "Returns md5sum for a message object of type '<ListHome-request>"
  "264ac43195b2a02803670c84d5678c9a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ListHome-request)))
  "Returns md5sum for a message object of type 'ListHome-request"
  "264ac43195b2a02803670c84d5678c9a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ListHome-request>)))
  "Returns full string definition for message of type '<ListHome-request>"
  (cl:format cl:nil "string web_request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ListHome-request)))
  "Returns full string definition for message of type 'ListHome-request"
  (cl:format cl:nil "string web_request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ListHome-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'web_request))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ListHome-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ListHome-request
    (cl:cons ':web_request (web_request msg))
))
;//! \htmlinclude ListHome-response.msg.html

(cl:defclass <ListHome-response> (roslisp-msg-protocol:ros-message)
  ((home_points
    :reader home_points
    :initarg :home_points
    :type cl:string
    :initform ""))
)

(cl:defclass ListHome-response (<ListHome-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ListHome-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ListHome-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_robo-srv:<ListHome-response> is deprecated: use web_robo-srv:ListHome-response instead.")))

(cl:ensure-generic-function 'home_points-val :lambda-list '(m))
(cl:defmethod home_points-val ((m <ListHome-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_robo-srv:home_points-val is deprecated.  Use web_robo-srv:home_points instead.")
  (home_points m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ListHome-response>) ostream)
  "Serializes a message object of type '<ListHome-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'home_points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'home_points))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ListHome-response>) istream)
  "Deserializes a message object of type '<ListHome-response>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'home_points) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'home_points) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ListHome-response>)))
  "Returns string type for a service object of type '<ListHome-response>"
  "web_robo/ListHomeResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListHome-response)))
  "Returns string type for a service object of type 'ListHome-response"
  "web_robo/ListHomeResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ListHome-response>)))
  "Returns md5sum for a message object of type '<ListHome-response>"
  "264ac43195b2a02803670c84d5678c9a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ListHome-response)))
  "Returns md5sum for a message object of type 'ListHome-response"
  "264ac43195b2a02803670c84d5678c9a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ListHome-response>)))
  "Returns full string definition for message of type '<ListHome-response>"
  (cl:format cl:nil "string home_points~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ListHome-response)))
  "Returns full string definition for message of type 'ListHome-response"
  (cl:format cl:nil "string home_points~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ListHome-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'home_points))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ListHome-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ListHome-response
    (cl:cons ':home_points (home_points msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ListHome)))
  'ListHome-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ListHome)))
  'ListHome-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListHome)))
  "Returns string type for a service object of type '<ListHome>"
  "web_robo/ListHome")