
(cl:in-package :asdf)

(defsystem "detect-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "EntityInformation" :depends-on ("_package_EntityInformation"))
    (:file "_package_EntityInformation" :depends-on ("_package"))
    (:file "MovementInformation" :depends-on ("_package_MovementInformation"))
    (:file "_package_MovementInformation" :depends-on ("_package"))
  ))