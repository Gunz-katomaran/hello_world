; Auto-generated. Do not edit!


(cl:in-package path_follower-msg)


;//! \htmlinclude PointList.msg.html

(cl:defclass <PointList> (roslisp-msg-protocol:ros-message)
  ((pose_list
    :reader pose_list
    :initarg :pose_list
    :type (cl:vector path_follower-msg:PoseList)
   :initform (cl:make-array 0 :element-type 'path_follower-msg:PoseList :initial-element (cl:make-instance 'path_follower-msg:PoseList))))
)

(cl:defclass PointList (<PointList>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PointList>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PointList)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name path_follower-msg:<PointList> is deprecated: use path_follower-msg:PointList instead.")))

(cl:ensure-generic-function 'pose_list-val :lambda-list '(m))
(cl:defmethod pose_list-val ((m <PointList>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader path_follower-msg:pose_list-val is deprecated.  Use path_follower-msg:pose_list instead.")
  (pose_list m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PointList>) ostream)
  "Serializes a message object of type '<PointList>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'pose_list))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'pose_list))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PointList>) istream)
  "Deserializes a message object of type '<PointList>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'pose_list) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'pose_list)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'path_follower-msg:PoseList))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PointList>)))
  "Returns string type for a message object of type '<PointList>"
  "path_follower/PointList")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PointList)))
  "Returns string type for a message object of type 'PointList"
  "path_follower/PointList")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PointList>)))
  "Returns md5sum for a message object of type '<PointList>"
  "f639923d0e4b33008c322b16a61c2555")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PointList)))
  "Returns md5sum for a message object of type 'PointList"
  "f639923d0e4b33008c322b16a61c2555")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PointList>)))
  "Returns full string definition for message of type '<PointList>"
  (cl:format cl:nil "path_follower/PoseList[] pose_list~%~%================================================================================~%MSG: path_follower/PoseList~%float32[] list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PointList)))
  "Returns full string definition for message of type 'PointList"
  (cl:format cl:nil "path_follower/PoseList[] pose_list~%~%================================================================================~%MSG: path_follower/PoseList~%float32[] list~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PointList>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'pose_list) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PointList>))
  "Converts a ROS message object to a list"
  (cl:list 'PointList
    (cl:cons ':pose_list (pose_list msg))
))
