; Auto-generated. Do not edit!


(cl:in-package path_planner-srv)


;//! \htmlinclude PathFinder-request.msg.html

(cl:defclass <PathFinder-request> (roslisp-msg-protocol:ros-message)
  ((start
    :reader start
    :initarg :start
    :type cl:integer
    :initform 0)
   (goal
    :reader goal
    :initarg :goal
    :type cl:integer
    :initform 0))
)

(cl:defclass PathFinder-request (<PathFinder-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PathFinder-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PathFinder-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<PathFinder-request> is deprecated: use path_planner-srv:PathFinder-request instead.")))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <PathFinder-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:start-val is deprecated.  Use path_planner-srv:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <PathFinder-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:goal-val is deprecated.  Use path_planner-srv:goal instead.")
  (goal m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PathFinder-request>) ostream)
  "Serializes a message object of type '<PathFinder-request>"
  (cl:let* ((signed (cl:slot-value msg 'start)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'goal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PathFinder-request>) istream)
  "Deserializes a message object of type '<PathFinder-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PathFinder-request>)))
  "Returns string type for a service object of type '<PathFinder-request>"
  "path_planner/PathFinderRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PathFinder-request)))
  "Returns string type for a service object of type 'PathFinder-request"
  "path_planner/PathFinderRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PathFinder-request>)))
  "Returns md5sum for a message object of type '<PathFinder-request>"
  "e90150a274192f3b93435f5aadb8f247")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PathFinder-request)))
  "Returns md5sum for a message object of type 'PathFinder-request"
  "e90150a274192f3b93435f5aadb8f247")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PathFinder-request>)))
  "Returns full string definition for message of type '<PathFinder-request>"
  (cl:format cl:nil "int32 start~%int32 goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PathFinder-request)))
  "Returns full string definition for message of type 'PathFinder-request"
  (cl:format cl:nil "int32 start~%int32 goal~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PathFinder-request>))
  (cl:+ 0
     4
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PathFinder-request>))
  "Converts a ROS message object to a list"
  (cl:list 'PathFinder-request
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
))
;//! \htmlinclude PathFinder-response.msg.html

(cl:defclass <PathFinder-response> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass PathFinder-response (<PathFinder-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PathFinder-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PathFinder-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_planner-srv:<PathFinder-response> is deprecated: use path_planner-srv:PathFinder-response instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <PathFinder-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_planner-srv:path-val is deprecated.  Use path_planner-srv:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PathFinder-response>) ostream)
  "Serializes a message object of type '<PathFinder-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PathFinder-response>) istream)
  "Deserializes a message object of type '<PathFinder-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PathFinder-response>)))
  "Returns string type for a service object of type '<PathFinder-response>"
  "path_planner/PathFinderResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PathFinder-response)))
  "Returns string type for a service object of type 'PathFinder-response"
  "path_planner/PathFinderResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PathFinder-response>)))
  "Returns md5sum for a message object of type '<PathFinder-response>"
  "e90150a274192f3b93435f5aadb8f247")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PathFinder-response)))
  "Returns md5sum for a message object of type 'PathFinder-response"
  "e90150a274192f3b93435f5aadb8f247")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PathFinder-response>)))
  "Returns full string definition for message of type '<PathFinder-response>"
  (cl:format cl:nil "int32[] path~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PathFinder-response)))
  "Returns full string definition for message of type 'PathFinder-response"
  (cl:format cl:nil "int32[] path~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PathFinder-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PathFinder-response>))
  "Converts a ROS message object to a list"
  (cl:list 'PathFinder-response
    (cl:cons ':path (path msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'PathFinder)))
  'PathFinder-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'PathFinder)))
  'PathFinder-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PathFinder)))
  "Returns string type for a service object of type '<PathFinder>"
  "path_planner/PathFinder")