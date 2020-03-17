;; Auto-generated. Do not edit!


(when (boundp 'web_robo::ListHome)
  (if (not (find-package "WEB_ROBO"))
    (make-package "WEB_ROBO"))
  (shadow 'ListHome (find-package "WEB_ROBO")))
(unless (find-package "WEB_ROBO::LISTHOME")
  (make-package "WEB_ROBO::LISTHOME"))
(unless (find-package "WEB_ROBO::LISTHOMEREQUEST")
  (make-package "WEB_ROBO::LISTHOMEREQUEST"))
(unless (find-package "WEB_ROBO::LISTHOMERESPONSE")
  (make-package "WEB_ROBO::LISTHOMERESPONSE"))

(in-package "ROS")





(defclass web_robo::ListHomeRequest
  :super ros::object
  :slots (_web_request ))

(defmethod web_robo::ListHomeRequest
  (:init
   (&key
    ((:web_request __web_request) "")
    )
   (send-super :init)
   (setq _web_request (string __web_request))
   self)
  (:web_request
   (&optional __web_request)
   (if __web_request (setq _web_request __web_request)) _web_request)
  (:serialization-length
   ()
   (+
    ;; string _web_request
    4 (length _web_request)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _web_request
       (write-long (length _web_request) s) (princ _web_request s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _web_request
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _web_request (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass web_robo::ListHomeResponse
  :super ros::object
  :slots (_home_points ))

(defmethod web_robo::ListHomeResponse
  (:init
   (&key
    ((:home_points __home_points) "")
    )
   (send-super :init)
   (setq _home_points (string __home_points))
   self)
  (:home_points
   (&optional __home_points)
   (if __home_points (setq _home_points __home_points)) _home_points)
  (:serialization-length
   ()
   (+
    ;; string _home_points
    4 (length _home_points)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _home_points
       (write-long (length _home_points) s) (princ _home_points s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _home_points
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _home_points (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass web_robo::ListHome
  :super ros::object
  :slots ())

(setf (get web_robo::ListHome :md5sum-) "264ac43195b2a02803670c84d5678c9a")
(setf (get web_robo::ListHome :datatype-) "web_robo/ListHome")
(setf (get web_robo::ListHome :request) web_robo::ListHomeRequest)
(setf (get web_robo::ListHome :response) web_robo::ListHomeResponse)

(defmethod web_robo::ListHomeRequest
  (:response () (instance web_robo::ListHomeResponse :init)))

(setf (get web_robo::ListHomeRequest :md5sum-) "264ac43195b2a02803670c84d5678c9a")
(setf (get web_robo::ListHomeRequest :datatype-) "web_robo/ListHomeRequest")
(setf (get web_robo::ListHomeRequest :definition-)
      "string web_request
---
string home_points

")

(setf (get web_robo::ListHomeResponse :md5sum-) "264ac43195b2a02803670c84d5678c9a")
(setf (get web_robo::ListHomeResponse :datatype-) "web_robo/ListHomeResponse")
(setf (get web_robo::ListHomeResponse :definition-)
      "string web_request
---
string home_points

")



(provide :web_robo/ListHome "264ac43195b2a02803670c84d5678c9a")


