
(cl:in-package :asdf)

(defsystem "ivr_assignment-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Angles" :depends-on ("_package_Angles"))
    (:file "_package_Angles" :depends-on ("_package"))
    (:file "AnglesStamped" :depends-on ("_package_AnglesStamped"))
    (:file "_package_AnglesStamped" :depends-on ("_package"))
    (:file "FloatStamped" :depends-on ("_package_FloatStamped"))
    (:file "_package_FloatStamped" :depends-on ("_package"))
    (:file "Point" :depends-on ("_package_Point"))
    (:file "_package_Point" :depends-on ("_package"))
    (:file "PointStamped" :depends-on ("_package_PointStamped"))
    (:file "_package_PointStamped" :depends-on ("_package"))
    (:file "State" :depends-on ("_package_State"))
    (:file "_package_State" :depends-on ("_package"))
    (:file "StateStamped" :depends-on ("_package_StateStamped"))
    (:file "_package_StateStamped" :depends-on ("_package"))
  ))