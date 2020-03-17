; Auto-generated. Do not edit!


(cl:in-package web_robo-srv)


;//! \htmlinclude ListDirectory-request.msg.html

(cl:defclass <ListDirectory-request> (roslisp-msg-protocol:ros-message)
  ((request
    :reader request
    :initarg :request
    :type cl:string
    :initform ""))
)

(cl:defclass ListDirectory-request (<ListDirectory-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ListDirectory-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ListDirectory-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_robo-srv:<ListDirectory-request> is deprecated: use web_robo-srv:ListDirectory-request instead.")))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <ListDirectory-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_robo-srv:request-val is deprecated.  Use web_robo-srv:request instead.")
  (request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ListDirectory-request>) ostream)
  "Serializes a message object of type '<ListDirectory-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'request))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'request))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ListDirectory-request>) istream)
  "Deserializes a message object of type '<ListDirectory-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'request) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'request) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ListDirectory-request>)))
  "Returns string type for a service object of type '<ListDirectory-request>"
  "web_robo/ListDirectoryRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListDirectory-request)))
  "Returns string type for a service object of type 'ListDirectory-request"
  "web_robo/ListDirectoryRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ListDirectory-request>)))
  "Returns md5sum for a message object of type '<ListDirectory-request>"
  "a8e8a0ad7d18ff7b91f5d9d166c371c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ListDirectory-request)))
  "Returns md5sum for a message object of type 'ListDirectory-request"
  "a8e8a0ad7d18ff7b91f5d9d166c371c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ListDirectory-request>)))
  "Returns full string definition for message of type '<ListDirectory-request>"
  (cl:format cl:nil "string request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ListDirectory-request)))
  "Returns full string definition for message of type 'ListDirectory-request"
  (cl:format cl:nil "string request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ListDirectory-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'request))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ListDirectory-request>))
  "Converts a ROS message object to a list"
  (cl:list 'ListDirectory-request
    (cl:cons ':request (request msg))
))
;//! \htmlinclude ListDirectory-response.msg.html

(cl:defclass <ListDirectory-response> (roslisp-msg-protocol:ros-message)
  ((list_of_files
    :reader list_of_files
    :initarg :list_of_files
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element "")))
)

(cl:defclass ListDirectory-response (<ListDirectory-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <ListDirectory-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'ListDirectory-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name web_robo-srv:<ListDirectory-response> is deprecated: use web_robo-srv:ListDirectory-response instead.")))

(cl:ensure-generic-function 'list_of_files-val :lambda-list '(m))
(cl:defmethod list_of_files-val ((m <ListDirectory-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader web_robo-srv:list_of_files-val is deprecated.  Use web_robo-srv:list_of_files instead.")
  (list_of_files m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <ListDirectory-response>) ostream)
  "Serializes a message object of type '<ListDirectory-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'list_of_files))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'list_of_files))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <ListDirectory-response>) istream)
  "Deserializes a message object of type '<ListDirectory-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list_of_files) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'list_of_files)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<ListDirectory-response>)))
  "Returns string type for a service object of type '<ListDirectory-response>"
  "web_robo/ListDirectoryResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListDirectory-response)))
  "Returns string type for a service object of type 'ListDirectory-response"
  "web_robo/ListDirectoryResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<ListDirectory-response>)))
  "Returns md5sum for a message object of type '<ListDirectory-response>"
  "a8e8a0ad7d18ff7b91f5d9d166c371c1")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'ListDirectory-response)))
  "Returns md5sum for a message object of type 'ListDirectory-response"
  "a8e8a0ad7d18ff7b91f5d9d166c371c1")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<ListDirectory-response>)))
  "Returns full string definition for message of type '<ListDirectory-response>"
  (cl:format cl:nil "string[] list_of_files~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'ListDirectory-response)))
  "Returns full string definition for message of type 'ListDirectory-response"
  (cl:format cl:nil "string[] list_of_files~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <ListDirectory-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list_of_files) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <ListDirectory-response>))
  "Converts a ROS message object to a list"
  (cl:list 'ListDirectory-response
    (cl:cons ':list_of_files (list_of_files msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'ListDirectory)))
  'ListDirectory-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'ListDirectory)))
  'ListDirectory-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'ListDirectory)))
  "Returns string type for a service object of type '<ListDirectory>"
  "web_robo/ListDirectory")