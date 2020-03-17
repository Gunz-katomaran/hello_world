
(cl:in-package :asdf)

(defsystem "robo_waiter-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Obstacle" :depends-on ("_package_Obstacle"))
    (:file "_package_Obstacle" :depends-on ("_package"))
    (:file "Park" :depends-on ("_package_Park"))
    (:file "_package_Park" :depends-on ("_package"))
    (:file "Pause" :depends-on ("_package_Pause"))
    (:file "_package_Pause" :depends-on ("_package"))
    (:file "Table" :depends-on ("_package_Table"))
    (:file "_package_Table" :depends-on ("_package"))
    (:file "Tl_gl" :depends-on ("_package_Tl_gl"))
    (:file "_package_Tl_gl" :depends-on ("_package"))
  ))