
(cl:in-package :asdf)

(defsystem "roadmap_global_planner_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "AdjacencyList" :depends-on ("_package_AdjacencyList"))
    (:file "_package_AdjacencyList" :depends-on ("_package"))
    (:file "MapPair" :depends-on ("_package_MapPair"))
    (:file "_package_MapPair" :depends-on ("_package"))
    (:file "PointList" :depends-on ("_package_PointList"))
    (:file "_package_PointList" :depends-on ("_package"))
  ))