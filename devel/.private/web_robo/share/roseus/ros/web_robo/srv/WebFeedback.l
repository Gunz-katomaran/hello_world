;; Auto-generated. Do not edit!


(when (boundp 'web_robo::WebFeedback)
  (if (not (find-package "WEB_ROBO"))
    (make-package "WEB_ROBO"))
  (shadow 'WebFeedback (find-package "WEB_ROBO")))
(unless (find-package "WEB_ROBO::WEBFEEDBACK")
  (make-package "WEB_ROBO::WEBFEEDBACK"))
(unless (find-package "WEB_ROBO::WEBFEEDBACKREQUEST")
  (make-package "WEB_ROBO::WEBFEEDBACKREQUEST"))
(unless (find-package "WEB_ROBO::WEBFEEDBACKRESPONSE")
  (make-package "WEB_ROBO::WEBFEEDBACKRESPONSE"))

(in-package "ROS")





(defclass web_robo::WebFeedbackRequest
  :super ros::object
  :slots (_robot_request ))

(defmethod web_robo::WebFeedbackRequest
  (:init
   (&key
    ((:robot_request __robot_request) "")
    )
   (send-super :init)
   (setq _robot_request (string __robot_request))
   self)
  (:robot_request
   (&optional __robot_request)
   (if __robot_request (setq _robot_request __robot_request)) _robot_request)
  (:serialization-length
   ()
   (+
    ;; string _robot_request
    4 (length _robot_request)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _robot_request
       (write-long (length _robot_request) s) (princ _robot_request s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _robot_request
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _robot_request (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass web_robo::WebFeedbackResponse
  :super ros::object
  :slots (_user_response ))

(defmethod web_robo::WebFeedbackResponse
  (:init
   (&key
    ((:user_response __user_response) nil)
    )
   (send-super :init)
   (setq _user_response __user_response)
   self)
  (:user_response
   (&optional __user_response)
   (if __user_response (setq _user_response __user_response)) _user_response)
  (:serialization-length
   ()
   (+
    ;; bool _user_response
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _user_response
       (if _user_response (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _user_response
     (setq _user_response (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass web_robo::WebFeedback
  :super ros::object
  :slots ())

(setf (get web_robo::WebFeedback :md5sum-) "46e643224170bf540f5f708583c1f716")
(setf (get web_robo::WebFeedback :datatype-) "web_robo/WebFeedback")
(setf (get web_robo::WebFeedback :request) web_robo::WebFeedbackRequest)
(setf (get web_robo::WebFeedback :response) web_robo::WebFeedbackResponse)

(defmethod web_robo::WebFeedbackRequest
  (:response () (instance web_robo::WebFeedbackResponse :init)))

(setf (get web_robo::WebFeedbackRequest :md5sum-) "46e643224170bf540f5f708583c1f716")
(setf (get web_robo::WebFeedbackRequest :datatype-) "web_robo/WebFeedbackRequest")
(setf (get web_robo::WebFeedbackRequest :definition-)
      "string robot_request
---
bool user_response
")

(setf (get web_robo::WebFeedbackResponse :md5sum-) "46e643224170bf540f5f708583c1f716")
(setf (get web_robo::WebFeedbackResponse :datatype-) "web_robo/WebFeedbackResponse")
(setf (get web_robo::WebFeedbackResponse :definition-)
      "string robot_request
---
bool user_response
")



(provide :web_robo/WebFeedback "46e643224170bf540f5f708583c1f716")


