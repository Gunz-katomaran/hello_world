
(cl:in-package :asdf)

(defsystem "robo_waiter-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Mile" :depends-on ("_package_Mile"))
    (:file "_package_Mile" :depends-on ("_package"))
    (:file "Mile" :depends-on ("_package_Mile"))
    (:file "_package_Mile" :depends-on ("_package"))
    (:file "Tabled" :depends-on ("_package_Tabled"))
    (:file "_package_Tabled" :depends-on ("_package"))
    (:file "Tabled" :depends-on ("_package_Tabled"))
    (:file "_package_Tabled" :depends-on ("_package"))
  ))