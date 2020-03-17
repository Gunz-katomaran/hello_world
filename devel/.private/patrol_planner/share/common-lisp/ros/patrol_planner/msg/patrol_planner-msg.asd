
(cl:in-package :asdf)

(defsystem "patrol_planner-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "Milestone" :depends-on ("_package_Milestone"))
    (:file "_package_Milestone" :depends-on ("_package"))
    (:file "Milestone" :depends-on ("_package_Milestone"))
    (:file "_package_Milestone" :depends-on ("_package"))
    (:file "PoseList" :depends-on ("_package_PoseList"))
    (:file "_package_PoseList" :depends-on ("_package"))
    (:file "PoseList" :depends-on ("_package_PoseList"))
    (:file "_package_PoseList" :depends-on ("_package"))
    (:file "Tabled" :depends-on ("_package_Tabled"))
    (:file "_package_Tabled" :depends-on ("_package"))
    (:file "Tabled" :depends-on ("_package_Tabled"))
    (:file "_package_Tabled" :depends-on ("_package"))
  ))