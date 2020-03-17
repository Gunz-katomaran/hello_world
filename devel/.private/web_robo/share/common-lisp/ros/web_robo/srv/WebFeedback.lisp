; Auto-generated. Do not edit!


(cl:in-package web_robo-srv)


;//! \htmlinclude WebFeedback-request.msg.html

(cl:defclass <WebFeedback-request> (roslisp-msg-protocol:ros-message)
  ((robot_request
    :reader robot_request
    :initarg :robot_request
    :type cl:string
    :initform ""))
)

(cl:defclass WebFeedback-request (<WebFeedback-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WebFeedback-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WebFeedback-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_robo-srv:<WebFeedback-request> is deprecated: use web_robo-srv:WebFeedback-request instead.")))

(cl:ensure-generic-function 'robot_request-val :lambda-list '(m))
(cl:defmethod robot_request-val ((m <WebFeedback-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_robo-srv:robot_request-val is deprecated.  Use web_robo-srv:robot_request instead.")
  (robot_request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WebFeedback-request>) ostream)
  "Serializes a message object of type '<WebFeedback-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'robot_request))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'robot_request))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WebFeedback-request>) istream)
  "Deserializes a message object of type '<WebFeedback-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'robot_request) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'robot_request) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WebFeedback-request>)))
  "Returns string type for a service object of type '<WebFeedback-request>"
  "web_robo/WebFeedbackRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WebFeedback-request)))
  "Returns string type for a service object of type 'WebFeedback-request"
  "web_robo/WebFeedbackRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WebFeedback-request>)))
  "Returns md5sum for a message object of type '<WebFeedback-request>"
  "46e643224170bf540f5f708583c1f716")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WebFeedback-request)))
  "Returns md5sum for a message object of type 'WebFeedback-request"
  "46e643224170bf540f5f708583c1f716")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WebFeedback-request>)))
  "Returns full string definition for message of type '<WebFeedback-request>"
  (cl:format cl:nil "string robot_request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WebFeedback-request)))
  "Returns full string definition for message of type 'WebFeedback-request"
  (cl:format cl:nil "string robot_request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WebFeedback-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'robot_request))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WebFeedback-request>))
  "Converts a ROS message object to a list"
  (cl:list 'WebFeedback-request
    (cl:cons ':robot_request (robot_request msg))
))
;//! \htmlinclude WebFeedback-response.msg.html

(cl:defclass <WebFeedback-response> (roslisp-msg-protocol:ros-message)
  ((user_response
    :reader user_response
    :initarg :user_response
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass WebFeedback-response (<WebFeedback-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <WebFeedback-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'WebFeedback-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_robo-srv:<WebFeedback-response> is deprecated: use web_robo-srv:WebFeedback-response instead.")))

(cl:ensure-generic-function 'user_response-val :lambda-list '(m))
(cl:defmethod user_response-val ((m <WebFeedback-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_robo-srv:user_response-val is deprecated.  Use web_robo-srv:user_response instead.")
  (user_response m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <WebFeedback-response>) ostream)
  "Serializes a message object of type '<WebFeedback-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'user_response) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <WebFeedback-response>) istream)
  "Deserializes a message object of type '<WebFeedback-response>"
    (cl:setf (cl:slot-value msg 'user_response) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<WebFeedback-response>)))
  "Returns string type for a service object of type '<WebFeedback-response>"
  "web_robo/WebFeedbackResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WebFeedback-response)))
  "Returns string type for a service object of type 'WebFeedback-response"
  "web_robo/WebFeedbackResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<WebFeedback-response>)))
  "Returns md5sum for a message object of type '<WebFeedback-response>"
  "46e643224170bf540f5f708583c1f716")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'WebFeedback-response)))
  "Returns md5sum for a message object of type 'WebFeedback-response"
  "46e643224170bf540f5f708583c1f716")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<WebFeedback-response>)))
  "Returns full string definition for message of type '<WebFeedback-response>"
  (cl:format cl:nil "bool user_response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'WebFeedback-response)))
  "Returns full string definition for message of type 'WebFeedback-response"
  (cl:format cl:nil "bool user_response~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <WebFeedback-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <WebFeedback-response>))
  "Converts a ROS message object to a list"
  (cl:list 'WebFeedback-response
    (cl:cons ':user_response (user_response msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'WebFeedback)))
  'WebFeedback-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'WebFeedback)))
  'WebFeedback-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'WebFeedback)))
  "Returns string type for a service object of type '<WebFeedback>"
  "web_robo/WebFeedback")