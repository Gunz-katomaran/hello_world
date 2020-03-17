; Auto-generated. Do not edit!


(cl:in-package patrol_planner-srv)


;//! \htmlinclude PathLoad-request.msg.html

(cl:defclass <PathLoad-request> (roslisp-msg-protocol:ros-message)
  ((path_name
    :reader path_name
    :initarg :path_name
    :type cl:string
    :initform "")
   (table_path_name
    :reader table_path_name
    :initarg :table_path_name
    :type cl:string
    :initform ""))
)

(cl:defclass PathLoad-request (<PathLoad-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PathLoad-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PathLoad-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_planner-srv:<PathLoad-request> is deprecated: use patrol_planner-srv:PathLoad-request instead.")))

(cl:ensure-generic-function 'path_name-val :lambda-list '(m))
(cl:defmethod path_name-val ((m <PathLoad-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:path_name-val is deprecated.  Use patrol_planner-srv:path_name instead.")
  (path_name m))

(cl:ensure-generic-function 'table_path_name-val :lambda-list '(m))
(cl:defmethod table_path_name-val ((m <PathLoad-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:table_path_name-val is deprecated.  Use patrol_planner-srv:table_path_name instead.")
  (table_path_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PathLoad-request>) ostream)
  "Serializes a message object of type '<PathLoad-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'path_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'path_name))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'table_path_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'table_path_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PathLoad-request>) istream)
  "Deserializes a message object of type '<PathLoad-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'path_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'path_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'table_path_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'table_path_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PathLoad-request>)))
  "Returns string type for a service object of type '<PathLoad-request>"
  "patrol_planner/PathLoadRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PathLoad-request)))
  "Returns string type for a service object of type 'PathLoad-request"
  "patrol_planner/PathLoadRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PathLoad-request>)))
  "Returns md5sum for a message object of type '<PathLoad-request>"
  "813591a0b724e5a0e599fdf9d754d157")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PathLoad-request)))
  "Returns md5sum for a message object of type 'PathLoad-request"
  "813591a0b724e5a0e599fdf9d754d157")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PathLoad-request>)))
  "Returns full string definition for message of type '<PathLoad-request>"
  (cl:format cl:nil "string path_name~%string table_path_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PathLoad-request)))
  "Returns full string definition for message of type 'PathLoad-request"
  (cl:format cl:nil "string path_name~%string table_path_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PathLoad-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'path_name))
     4 (cl:length (cl:slot-value msg 'table_path_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PathLoad-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PathLoad-request
    (cl:cons ':path_name (path_name msg))
    (cl:cons ':table_path_name (table_path_name msg))
))
;//! \htmlinclude PathLoad-response.msg.html

(cl:defclass <PathLoad-response> (roslisp-msg-protocol:ros-message)
  ((milestone_list
    :reader milestone_list
    :initarg :milestone_list
    :type (cl:vector patrol_planner-msg:Milestone)
   :initform (cl:make-array 0 :element-type 'patrol_planner-msg:Milestone :initial-element (cl:make-instance 'patrol_planner-msg:Milestone))))
)

(cl:defclass PathLoad-response (<PathLoad-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PathLoad-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PathLoad-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_planner-srv:<PathLoad-response> is deprecated: use patrol_planner-srv:PathLoad-response instead.")))

(cl:ensure-generic-function 'milestone_list-val :lambda-list '(m))
(cl:defmethod milestone_list-val ((m <PathLoad-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:milestone_list-val is deprecated.  Use patrol_planner-srv:milestone_list instead.")
  (milestone_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PathLoad-response>) ostream)
  "Serializes a message object of type '<PathLoad-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'milestone_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'milestone_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PathLoad-response>) istream)
  "Deserializes a message object of type '<PathLoad-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'milestone_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'milestone_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'patrol_planner-msg:Milestone))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PathLoad-response>)))
  "Returns string type for a service object of type '<PathLoad-response>"
  "patrol_planner/PathLoadResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PathLoad-response)))
  "Returns string type for a service object of type 'PathLoad-response"
  "patrol_planner/PathLoadResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PathLoad-response>)))
  "Returns md5sum for a message object of type '<PathLoad-response>"
  "813591a0b724e5a0e599fdf9d754d157")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PathLoad-response)))
  "Returns md5sum for a message object of type 'PathLoad-response"
  "813591a0b724e5a0e599fdf9d754d157")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PathLoad-response>)))
  "Returns full string definition for message of type '<PathLoad-response>"
  (cl:format cl:nil "Milestone[] milestone_list~%~%~%================================================================================~%MSG: patrol_planner/Milestone~%string name~%float32 x~%float32 y~%float32 z~%float32 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PathLoad-response)))
  "Returns full string definition for message of type 'PathLoad-response"
  (cl:format cl:nil "Milestone[] milestone_list~%~%~%================================================================================~%MSG: patrol_planner/Milestone~%string name~%float32 x~%float32 y~%float32 z~%float32 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PathLoad-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'milestone_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PathLoad-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PathLoad-response
    (cl:cons ':milestone_list (milestone_list msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PathLoad)))
  'PathLoad-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PathLoad)))
  'PathLoad-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PathLoad)))
  "Returns string type for a service object of type '<PathLoad>"
  "patrol_planner/PathLoad")