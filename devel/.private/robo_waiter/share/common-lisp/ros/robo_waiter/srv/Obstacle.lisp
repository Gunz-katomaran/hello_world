; Auto-generated. Do not edit!


(cl:in-package robo_waiter-srv)


;//! \htmlinclude Obstacle-request.msg.html

(cl:defclass <Obstacle-request> (roslisp-msg-protocol:ros-message)
  ((status
    :reader status
    :initarg :status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Obstacle-request (<Obstacle-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Obstacle-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Obstacle-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robo_waiter-srv:<Obstacle-request> is deprecated: use robo_waiter-srv:Obstacle-request instead.")))

(cl:ensure-generic-function 'status-val :lambda-list '(m))
(cl:defmethod status-val ((m <Obstacle-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-srv:status-val is deprecated.  Use robo_waiter-srv:status instead.")
  (status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Obstacle-request>) ostream)
  "Serializes a message object of type '<Obstacle-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Obstacle-request>) istream)
  "Deserializes a message object of type '<Obstacle-request>"
    (cl:setf (cl:slot-value msg 'status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Obstacle-request>)))
  "Returns string type for a service object of type '<Obstacle-request>"
  "robo_waiter/ObstacleRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Obstacle-request)))
  "Returns string type for a service object of type 'Obstacle-request"
  "robo_waiter/ObstacleRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Obstacle-request>)))
  "Returns md5sum for a message object of type '<Obstacle-request>"
  "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Obstacle-request)))
  "Returns md5sum for a message object of type 'Obstacle-request"
  "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Obstacle-request>)))
  "Returns full string definition for message of type '<Obstacle-request>"
  (cl:format cl:nil "bool status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Obstacle-request)))
  "Returns full string definition for message of type 'Obstacle-request"
  (cl:format cl:nil "bool status~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Obstacle-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Obstacle-request>))
  "Converts a ROS message object to a list"
  (cl:list 'Obstacle-request
    (cl:cons ':status (status msg))
))
;//! \htmlinclude Obstacle-response.msg.html

(cl:defclass <Obstacle-response> (roslisp-msg-protocol:ros-message)
  ((reply
    :reader reply
    :initarg :reply
    :type cl:string
    :initform ""))
)

(cl:defclass Obstacle-response (<Obstacle-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Obstacle-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Obstacle-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name robo_waiter-srv:<Obstacle-response> is deprecated: use robo_waiter-srv:Obstacle-response instead.")))

(cl:ensure-generic-function 'reply-val :lambda-list '(m))
(cl:defmethod reply-val ((m <Obstacle-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader robo_waiter-srv:reply-val is deprecated.  Use robo_waiter-srv:reply instead.")
  (reply m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Obstacle-response>) ostream)
  "Serializes a message object of type '<Obstacle-response>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'reply))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'reply))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Obstacle-response>) istream)
  "Deserializes a message object of type '<Obstacle-response>"
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Obstacle-response>)))
  "Returns string type for a service object of type '<Obstacle-response>"
  "robo_waiter/ObstacleResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Obstacle-response)))
  "Returns string type for a service object of type 'Obstacle-response"
  "robo_waiter/ObstacleResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Obstacle-response>)))
  "Returns md5sum for a message object of type '<Obstacle-response>"
  "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Obstacle-response)))
  "Returns md5sum for a message object of type 'Obstacle-response"
  "4a4b2bdf33b9dce4f3e033bed4cd41b8")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Obstacle-response>)))
  "Returns full string definition for message of type '<Obstacle-response>"
  (cl:format cl:nil "string reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Obstacle-response)))
  "Returns full string definition for message of type 'Obstacle-response"
  (cl:format cl:nil "string reply~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Obstacle-response>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'reply))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Obstacle-response>))
  "Converts a ROS message object to a list"
  (cl:list 'Obstacle-response
    (cl:cons ':reply (reply msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'Obstacle)))
  'Obstacle-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'Obstacle)))
  'Obstacle-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Obstacle)))
  "Returns string type for a service object of type '<Obstacle>"
  "robo_waiter/Obstacle")