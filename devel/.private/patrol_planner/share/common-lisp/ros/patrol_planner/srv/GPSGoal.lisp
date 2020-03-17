; Auto-generated. Do not edit!


(cl:in-package patrol_planner-srv)


;//! \htmlinclude GPSGoal-request.msg.html

(cl:defclass <GPSGoal-request> (roslisp-msg-protocol:ros-message)
  ((milestone_name
    :reader milestone_name
    :initarg :milestone_name
    :type cl:string
    :initform ""))
)

(cl:defclass GPSGoal-request (<GPSGoal-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GPSGoal-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GPSGoal-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_planner-srv:<GPSGoal-request> is deprecated: use patrol_planner-srv:GPSGoal-request instead.")))

(cl:ensure-generic-function 'milestone_name-val :lambda-list '(m))
(cl:defmethod milestone_name-val ((m <GPSGoal-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:milestone_name-val is deprecated.  Use patrol_planner-srv:milestone_name instead.")
  (milestone_name m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GPSGoal-request>) ostream)
  "Serializes a message object of type '<GPSGoal-request>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'milestone_name))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'milestone_name))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GPSGoal-request>) istream)
  "Deserializes a message object of type '<GPSGoal-request>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'milestone_name) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'milestone_name) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GPSGoal-request>)))
  "Returns string type for a service object of type '<GPSGoal-request>"
  "patrol_planner/GPSGoalRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GPSGoal-request)))
  "Returns string type for a service object of type 'GPSGoal-request"
  "patrol_planner/GPSGoalRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GPSGoal-request>)))
  "Returns md5sum for a message object of type '<GPSGoal-request>"
  "069b6c0906fcffac7ddcf59faaf4b55a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GPSGoal-request)))
  "Returns md5sum for a message object of type 'GPSGoal-request"
  "069b6c0906fcffac7ddcf59faaf4b55a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GPSGoal-request>)))
  "Returns full string definition for message of type '<GPSGoal-request>"
  (cl:format cl:nil "string milestone_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GPSGoal-request)))
  "Returns full string definition for message of type 'GPSGoal-request"
  (cl:format cl:nil "string milestone_name~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GPSGoal-request>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'milestone_name))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GPSGoal-request>))
  "Converts a ROS message object to a list"
  (cl:list 'GPSGoal-request
    (cl:cons ':milestone_name (milestone_name msg))
))
;//! \htmlinclude GPSGoal-response.msg.html

(cl:defclass <GPSGoal-response> (roslisp-msg-protocol:ros-message)
  ((goal_sent_status
    :reader goal_sent_status
    :initarg :goal_sent_status
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass GPSGoal-response (<GPSGoal-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <GPSGoal-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'GPSGoal-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name patrol_planner-srv:<GPSGoal-response> is deprecated: use patrol_planner-srv:GPSGoal-response instead.")))

(cl:ensure-generic-function 'goal_sent_status-val :lambda-list '(m))
(cl:defmethod goal_sent_status-val ((m <GPSGoal-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader patrol_planner-srv:goal_sent_status-val is deprecated.  Use patrol_planner-srv:goal_sent_status instead.")
  (goal_sent_status m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <GPSGoal-response>) ostream)
  "Serializes a message object of type '<GPSGoal-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'goal_sent_status) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <GPSGoal-response>) istream)
  "Deserializes a message object of type '<GPSGoal-response>"
    (cl:setf (cl:slot-value msg 'goal_sent_status) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<GPSGoal-response>)))
  "Returns string type for a service object of type '<GPSGoal-response>"
  "patrol_planner/GPSGoalResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GPSGoal-response)))
  "Returns string type for a service object of type 'GPSGoal-response"
  "patrol_planner/GPSGoalResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<GPSGoal-response>)))
  "Returns md5sum for a message object of type '<GPSGoal-response>"
  "069b6c0906fcffac7ddcf59faaf4b55a")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'GPSGoal-response)))
  "Returns md5sum for a message object of type 'GPSGoal-response"
  "069b6c0906fcffac7ddcf59faaf4b55a")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<GPSGoal-response>)))
  "Returns full string definition for message of type '<GPSGoal-response>"
  (cl:format cl:nil "bool goal_sent_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'GPSGoal-response)))
  "Returns full string definition for message of type 'GPSGoal-response"
  (cl:format cl:nil "bool goal_sent_status~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <GPSGoal-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <GPSGoal-response>))
  "Converts a ROS message object to a list"
  (cl:list 'GPSGoal-response
    (cl:cons ':goal_sent_status (goal_sent_status msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'GPSGoal)))
  'GPSGoal-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'GPSGoal)))
  'GPSGoal-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'GPSGoal)))
  "Returns string type for a service object of type '<GPSGoal>"
  "patrol_planner/GPSGoal")