; Auto-generated. Do not edit!


(cl:in-package patrol_planner-srv)


;//! \htmlinclude Park-request.msg.html

(cl:defclass <Park-request> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Park-request (<Park-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Park-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Park-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_planner-srv:<Park-request> is deprecated: use patrol_planner-srv:Park-request instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <Park-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:status-val is deprecated.  Use patrol_planner-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Park-request>) ostream)
  "Serializes a message object of type '<Park-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Park-request>) istream)
  "Deserializes a message object of type '<Park-request>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Park-request>)))
  "Returns string type for a service object of type '<Park-request>"
  "patrol_planner/ParkRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Park-request)))
  "Returns string type for a service object of type 'Park-request"
  "patrol_planner/ParkRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Park-request>)))
  "Returns md5sum for a message object of type '<Park-request>"
  "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Park-request)))
  "Returns md5sum for a message object of type 'Park-request"
  "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Park-request>)))
  "Returns full string definition for message of type '<Park-request>"
  (cl:format cl:nil "bool status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Park-request)))
  "Returns full string definition for message of type 'Park-request"
  (cl:format cl:nil "bool status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Park-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Park-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Park-request
    (cl:cons ':status (status msg))
))
;//! \htmlinclude Park-response.msg.html

(cl:defclass <Park-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:string
    :initform ""))
)

(cl:defclass Park-response (<Park-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Park-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Park-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_planner-srv:<Park-response> is deprecated: use patrol_planner-srv:Park-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <Park-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:reply-val is deprecated.  Use patrol_planner-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Park-response>) ostream)
  "Serializes a message object of type '<Park-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reply))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reply))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Park-response>) istream)
  "Deserializes a message object of type '<Park-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Park-response>)))
  "Returns string type for a service object of type '<Park-response>"
  "patrol_planner/ParkResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Park-response)))
  "Returns string type for a service object of type 'Park-response"
  "patrol_planner/ParkResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Park-response>)))
  "Returns md5sum for a message object of type '<Park-response>"
  "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Park-response)))
  "Returns md5sum for a message object of type 'Park-response"
  "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Park-response>)))
  "Returns full string definition for message of type '<Park-response>"
  (cl:format cl:nil "string reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Park-response)))
  "Returns full string definition for message of type 'Park-response"
  (cl:format cl:nil "string reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Park-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'reply))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Park-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Park-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Park)))
  'Park-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Park)))
  'Park-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Park)))
  "Returns string type for a service object of type '<Park>"
  "patrol_planner/Park")