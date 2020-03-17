;; Auto-generated. Do not edit!


(when (boundp 'web_robo::WebCommand)
  (if (not (find-package "WEB_ROBO"))
    (make-package "WEB_ROBO"))
  (shadow 'WebCommand (find-package "WEB_ROBO")))
(unless (find-package "WEB_ROBO::WEBCOMMAND")
  (make-package "WEB_ROBO::WEBCOMMAND"))
(unless (find-package "WEB_ROBO::WEBCOMMANDREQUEST")
  (make-package "WEB_ROBO::WEBCOMMANDREQUEST"))
(unless (find-package "WEB_ROBO::WEBCOMMANDRESPONSE")
  (make-package "WEB_ROBO::WEBCOMMANDRESPONSE"))

(in-package "ROS")





(defclass web_robo::WebCommandRequest
  :super ros::object
  :slots (_command ))

(defmethod web_robo::WebCommandRequest
  (:init
   (&key
    ((:command __command) "")
    )
   (send-super :init)
   (setq _command (string __command))
   self)
  (:command
   (&optional __command)
   (if __command (setq _command __command)) _command)
  (:serialization-length
   ()
   (+
    ;; string _command
    4 (length _command)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _command
       (write-long (length _command) s) (princ _command s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _command
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _command (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass web_robo::WebCommandResponse
  :super ros::object
  :slots (_received_status ))

(defmethod web_robo::WebCommandResponse
  (:init
   (&key
    ((:received_status __received_status) nil)
    )
   (send-super :init)
   (setq _received_status __received_status)
   self)
  (:received_status
   (&optional __received_status)
   (if __received_status (setq _received_status __received_status)) _received_status)
  (:serialization-length
   ()
   (+
    ;; bool _received_status
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _received_status
       (if _received_status (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _received_status
     (setq _received_status (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass web_robo::WebCommand
  :super ros::object
  :slots ())

(setf (get web_robo::WebCommand :md5sum-) "44d2b40d74222232b1f3ee0bac50b6e7")
(setf (get web_robo::WebCommand :datatype-) "web_robo/WebCommand")
(setf (get web_robo::WebCommand :request) web_robo::WebCommandRequest)
(setf (get web_robo::WebCommand :response) web_robo::WebCommandResponse)

(defmethod web_robo::WebCommandRequest
  (:response () (instance web_robo::WebCommandResponse :init)))

(setf (get web_robo::WebCommandRequest :md5sum-) "44d2b40d74222232b1f3ee0bac50b6e7")
(setf (get web_robo::WebCommandRequest :datatype-) "web_robo/WebCommandRequest")
(setf (get web_robo::WebCommandRequest :definition-)
      "string command
---
bool received_status

")

(setf (get web_robo::WebCommandResponse :md5sum-) "44d2b40d74222232b1f3ee0bac50b6e7")
(setf (get web_robo::WebCommandResponse :datatype-) "web_robo/WebCommandResponse")
(setf (get web_robo::WebCommandResponse :definition-)
      "string command
---
bool received_status

")



(provide :web_robo/WebCommand "44d2b40d74222232b1f3ee0bac50b6e7")


