
(cl:in-package :asdf)

(defsystem "web_robo-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "ListDirectory" :depends-on ("_package_ListDirectory"))
    (:file "_package_ListDirectory" :depends-on ("_package"))
    (:file "ListHome" :depends-on ("_package_ListHome"))
    (:file "_package_ListHome" :depends-on ("_package"))
    (:file "WebCommand" :depends-on ("_package_WebCommand"))
    (:file "_package_WebCommand" :depends-on ("_package"))
    (:file "WebFeedback" :depends-on ("_package_WebFeedback"))
    (:file "_package_WebFeedback" :depends-on ("_package"))
  ))