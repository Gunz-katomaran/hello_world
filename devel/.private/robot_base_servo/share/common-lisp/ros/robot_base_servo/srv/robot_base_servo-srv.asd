
(cl:in-package :asdf)

(defsystem "robot_base_servo-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "speed" :depends-on ("_package_speed"))
    (:file "_package_speed" :depends-on ("_package"))
    (:file "voltage" :depends-on ("_package_voltage"))
    (:file "_package_voltage" :depends-on ("_package"))
  ))