; Auto-generated. Do not edit!


(cl:in-package roadmap_global_planner_msgs-msg)


;//! \htmlinclude PointList.msg.html

(cl:defclass <PointList> (roslisp-msg-protocol:ros-message)
  ((list
    :reader list
    :initarg :list
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass PointList (<PointList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name roadmap_global_planner_msgs-msg:<PointList> is deprecated: use roadmap_global_planner_msgs-msg:PointList instead.")))

(cl:ensure-generic-function 'list-val :lambda-list '(m))
(cl:defmethod list-val ((m <PointList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader roadmap_global_planner_msgs-msg:list-val is deprecated.  Use roadmap_global_planner_msgs-msg:list instead.")
  (list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointList>) ostream)
  "Serializes a message object of type '<PointList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'list))))
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
   (cl:slot-value msg 'list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointList>) istream)
  "Deserializes a message object of type '<PointList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointList>)))
  "Returns string type for a message object of type '<PointList>"
  "roadmap_global_planner_msgs/PointList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointList)))
  "Returns string type for a message object of type 'PointList"
  "roadmap_global_planner_msgs/PointList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointList>)))
  "Returns md5sum for a message object of type '<PointList>"
  "33cd48253e96459f6910f32d963eda83")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointList)))
  "Returns md5sum for a message object of type 'PointList"
  "33cd48253e96459f6910f32d963eda83")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointList>)))
  "Returns full string definition for message of type '<PointList>"
  (cl:format cl:nil "int32[] list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointList)))
  "Returns full string definition for message of type 'PointList"
  (cl:format cl:nil "int32[] list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointList>))
  "Converts a ROS message object to a list"
  (cl:list 'PointList
    (cl:cons ':list (list msg))
))
