
(cl:in-package :asdf)

(defsystem "my_change-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "Sonic" :depends-on ("_package_Sonic"))
    (:file "_package_Sonic" :depends-on ("_package"))
    (:file "Sonic" :depends-on ("_package_Sonic"))
    (:file "_package_Sonic" :depends-on ("_package"))
  ))