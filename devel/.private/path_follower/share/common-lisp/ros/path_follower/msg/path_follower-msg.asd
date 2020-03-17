
(cl:in-package :asdf)

(defsystem "path_follower-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "PointList" :depends-on ("_package_PointList"))
    (:file "_package_PointList" :depends-on ("_package"))
    (:file "PointList" :depends-on ("_package_PointList"))
    (:file "_package_PointList" :depends-on ("_package"))
    (:file "PoseList" :depends-on ("_package_PoseList"))
    (:file "_package_PoseList" :depends-on ("_package"))
    (:file "PoseList" :depends-on ("_package_PoseList"))
    (:file "_package_PoseList" :depends-on ("_package"))
  ))