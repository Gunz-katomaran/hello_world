
(cl:in-package :asdf)

(defsystem "patrol_planner-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :patrol_planner-msg
)
  :components ((:file "_package")
    (:file "GPSGoal" :depends-on ("_package_GPSGoal"))
    (:file "_package_GPSGoal" :depends-on ("_package"))
    (:file "GetPlan" :depends-on ("_package_GetPlan"))
    (:file "_package_GetPlan" :depends-on ("_package"))
    (:file "Obstacle" :depends-on ("_package_Obstacle"))
    (:file "_package_Obstacle" :depends-on ("_package"))
    (:file "Park" :depends-on ("_package_Park"))
    (:file "_package_Park" :depends-on ("_package"))
    (:file "PathLoad" :depends-on ("_package_PathLoad"))
    (:file "_package_PathLoad" :depends-on ("_package"))
    (:file "Pause" :depends-on ("_package_Pause"))
    (:file "_package_Pause" :depends-on ("_package"))
    (:file "Save" :depends-on ("_package_Save"))
    (:file "_package_Save" :depends-on ("_package"))
    (:file "Table" :depends-on ("_package_Table"))
    (:file "_package_Table" :depends-on ("_package"))
    (:file "Tl_gl" :depends-on ("_package_Tl_gl"))
    (:file "_package_Tl_gl" :depends-on ("_package"))
  ))