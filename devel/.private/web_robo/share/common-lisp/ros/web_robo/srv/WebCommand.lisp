; Auto-generated. Do not edit!


(cl:in-package web_robo-srv)


;//! \htmlinclude WebCommand-request.msg.html

(cl:defclass <WebCommand-request> (roslisp-msg-protocol:ros-message)
  ((command
    :reader command
    :initarg :command
    :type cl:string
    :initform ""))
)

(cl:defclass WebCommand-request (<WebCommand-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WebCommand-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WebCommand-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_robo-srv:<WebCommand-request> is deprecated: use web_robo-srv:WebCommand-request instead.")))

(cl:ensure-generic-function 'command-val :lambda-list '(m))
(cl:defmethod command-val ((m <WebCommand-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_robo-srv:command-val is deprecated.  Use web_robo-srv:command instead.")
  (command m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WebCommand-request>) ostream)
  "Serializes a message object of type '<WebCommand-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'command))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'command))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WebCommand-request>) istream)
  "Deserializes a message object of type '<WebCommand-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'command) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'command) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WebCommand-request>)))
  "Returns string type for a service object of type '<WebCommand-request>"
  "web_robo/WebCommandRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WebCommand-request)))
  "Returns string type for a service object of type 'WebCommand-request"
  "web_robo/WebCommandRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WebCommand-request>)))
  "Returns md5sum for a message object of type '<WebCommand-request>"
  "44d2b40d74222232b1f3ee0bac50b6e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WebCommand-request)))
  "Returns md5sum for a message object of type 'WebCommand-request"
  "44d2b40d74222232b1f3ee0bac50b6e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WebCommand-request>)))
  "Returns full string definition for message of type '<WebCommand-request>"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WebCommand-request)))
  "Returns full string definition for message of type 'WebCommand-request"
  (cl:format cl:nil "string command~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WebCommand-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'command))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WebCommand-request>))
  "Converts a ROS message object to a list"
  (cl:list 'WebCommand-request
    (cl:cons ':command (command msg))
))
;//! \htmlinclude WebCommand-response.msg.html

(cl:defclass <WebCommand-response> (roslisp-msg-protocol:ros-message)
  ((received_status
    :reader received_status
    :initarg :received_status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass WebCommand-response (<WebCommand-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WebCommand-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WebCommand-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_robo-srv:<WebCommand-response> is deprecated: use web_robo-srv:WebCommand-response instead.")))

(cl:ensure-generic-function 'received_status-val :lambda-list '(m))
(cl:defmethod received_status-val ((m <WebCommand-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_robo-srv:received_status-val is deprecated.  Use web_robo-srv:received_status instead.")
  (received_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WebCommand-response>) ostream)
  "Serializes a message object of type '<WebCommand-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'received_status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WebCommand-response>) istream)
  "Deserializes a message object of type '<WebCommand-response>"
    (cl:setf (cl:slot-value msg 'received_status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WebCommand-response>)))
  "Returns string type for a service object of type '<WebCommand-response>"
  "web_robo/WebCommandResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WebCommand-response)))
  "Returns string type for a service object of type 'WebCommand-response"
  "web_robo/WebCommandResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WebCommand-response>)))
  "Returns md5sum for a message object of type '<WebCommand-response>"
  "44d2b40d74222232b1f3ee0bac50b6e7")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WebCommand-response)))
  "Returns md5sum for a message object of type 'WebCommand-response"
  "44d2b40d74222232b1f3ee0bac50b6e7")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WebCommand-response>)))
  "Returns full string definition for message of type '<WebCommand-response>"
  (cl:format cl:nil "bool received_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WebCommand-response)))
  "Returns full string definition for message of type 'WebCommand-response"
  (cl:format cl:nil "bool received_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WebCommand-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WebCommand-response>))
  "Converts a ROS message object to a list"
  (cl:list 'WebCommand-response
    (cl:cons ':received_status (received_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'WebCommand)))
  'WebCommand-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'WebCommand)))
  'WebCommand-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WebCommand)))
  "Returns string type for a service object of type '<WebCommand>"
  "web_robo/WebCommand")