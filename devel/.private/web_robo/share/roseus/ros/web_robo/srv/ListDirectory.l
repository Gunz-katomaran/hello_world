;; Auto-generated. Do not edit!


(when (boundp 'web_robo::ListDirectory)
  (if (not (find-package "WEB_ROBO"))
    (make-package "WEB_ROBO"))
  (shadow 'ListDirectory (find-package "WEB_ROBO")))
(unless (find-package "WEB_ROBO::LISTDIRECTORY")
  (make-package "WEB_ROBO::LISTDIRECTORY"))
(unless (find-package "WEB_ROBO::LISTDIRECTORYREQUEST")
  (make-package "WEB_ROBO::LISTDIRECTORYREQUEST"))
(unless (find-package "WEB_ROBO::LISTDIRECTORYRESPONSE")
  (make-package "WEB_ROBO::LISTDIRECTORYRESPONSE"))

(in-package "ROS")





(defclass web_robo::ListDirectoryRequest
  :super ros::object
  :slots (_request ))

(defmethod web_robo::ListDirectoryRequest
  (:init
   (&key
    ((:request __request) "")
    )
   (send-super :init)
   (setq _request (string __request))
   self)
  (:request
   (&optional __request)
   (if __request (setq _request __request)) _request)
  (:serialization-length
   ()
   (+
    ;; string _request
    4 (length _request)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _request
       (write-long (length _request) s) (princ _request s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _request
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _request (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass web_robo::ListDirectoryResponse
  :super ros::object
  :slots (_list_of_files ))

(defmethod web_robo::ListDirectoryResponse
  (:init
   (&key
    ((:list_of_files __list_of_files) (let (r) (dotimes (i 0) (push "" r)) r))
    )
   (send-super :init)
   (setq _list_of_files __list_of_files)
   self)
  (:list_of_files
   (&optional __list_of_files)
   (if __list_of_files (setq _list_of_files __list_of_files)) _list_of_files)
  (:serialization-length
   ()
   (+
    ;; string[] _list_of_files
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _list_of_files)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _list_of_files
     (write-long (length _list_of_files) s)
     (dolist (elem _list_of_files)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _list_of_files
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _list_of_files (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _list_of_files i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(defclass web_robo::ListDirectory
  :super ros::object
  :slots ())

(setf (get web_robo::ListDirectory :md5sum-) "a8e8a0ad7d18ff7b91f5d9d166c371c1")
(setf (get web_robo::ListDirectory :datatype-) "web_robo/ListDirectory")
(setf (get web_robo::ListDirectory :request) web_robo::ListDirectoryRequest)
(setf (get web_robo::ListDirectory :response) web_robo::ListDirectoryResponse)

(defmethod web_robo::ListDirectoryRequest
  (:response () (instance web_robo::ListDirectoryResponse :init)))

(setf (get web_robo::ListDirectoryRequest :md5sum-) "a8e8a0ad7d18ff7b91f5d9d166c371c1")
(setf (get web_robo::ListDirectoryRequest :datatype-) "web_robo/ListDirectoryRequest")
(setf (get web_robo::ListDirectoryRequest :definition-)
      "string request
---
string[] list_of_files

")

(setf (get web_robo::ListDirectoryResponse :md5sum-) "a8e8a0ad7d18ff7b91f5d9d166c371c1")
(setf (get web_robo::ListDirectoryResponse :datatype-) "web_robo/ListDirectoryResponse")
(setf (get web_robo::ListDirectoryResponse :definition-)
      "string request
---
string[] list_of_files

")



(provide :web_robo/ListDirectory "a8e8a0ad7d18ff7b91f5d9d166c371c1")


