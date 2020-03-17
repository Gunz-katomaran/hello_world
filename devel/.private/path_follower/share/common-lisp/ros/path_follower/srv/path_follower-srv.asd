
(cl:in-package :asdf)

(defsystem "path_follower-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :path_follower-msg
)
  :components ((:file "_package")
    (:file "GoalLoad" :depends-on ("_package_GoalLoad"))
    (:file "_package_GoalLoad" :depends-on ("_package"))
    (:file "Nearest" :depends-on ("_package_Nearest"))
    (:file "_package_Nearest" :depends-on ("_package"))
    (:file "PointLoad" :depends-on ("_package_PointLoad"))
    (:file "_package_PointLoad" :depends-on ("_package"))
  ))