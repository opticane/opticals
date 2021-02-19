; Auto-generated. Do not edit!


(cl:in-package ivr_assignment-msg)


;//! \htmlinclude State.msg.html

(cl:defclass <State> (roslisp-msg-protocol:ros-message)
  ((red
    :reader red
    :initarg :red
    :type ivr_assignment-msg:Point
    :initform (cl:make-instance 'ivr_assignment-msg:Point))
   (green
    :reader green
    :initarg :green
    :type ivr_assignment-msg:Point
    :initform (cl:make-instance 'ivr_assignment-msg:Point))
   (blue
    :reader blue
    :initarg :blue
    :type ivr_assignment-msg:Point
    :initform (cl:make-instance 'ivr_assignment-msg:Point))
   (sphere
    :reader sphere
    :initarg :sphere
    :type ivr_assignment-msg:Point
    :initform (cl:make-instance 'ivr_assignment-msg:Point))
   (box
    :reader box
    :initarg :box
    :type ivr_assignment-msg:Point
    :initform (cl:make-instance 'ivr_assignment-msg:Point)))
)

(cl:defclass State (<State>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <State>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'State)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ivr_assignment-msg:<State> is deprecated: use ivr_assignment-msg:State instead.")))

(cl:ensure-generic-function 'red-val :lambda-list '(m))
(cl:defmethod red-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:red-val is deprecated.  Use ivr_assignment-msg:red instead.")
  (red m))

(cl:ensure-generic-function 'green-val :lambda-list '(m))
(cl:defmethod green-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:green-val is deprecated.  Use ivr_assignment-msg:green instead.")
  (green m))

(cl:ensure-generic-function 'blue-val :lambda-list '(m))
(cl:defmethod blue-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:blue-val is deprecated.  Use ivr_assignment-msg:blue instead.")
  (blue m))

(cl:ensure-generic-function 'sphere-val :lambda-list '(m))
(cl:defmethod sphere-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:sphere-val is deprecated.  Use ivr_assignment-msg:sphere instead.")
  (sphere m))

(cl:ensure-generic-function 'box-val :lambda-list '(m))
(cl:defmethod box-val ((m <State>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:box-val is deprecated.  Use ivr_assignment-msg:box instead.")
  (box m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <State>) ostream)
  "Serializes a message object of type '<State>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'red) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'green) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'blue) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'sphere) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'box) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <State>) istream)
  "Deserializes a message object of type '<State>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'red) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'green) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'blue) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'sphere) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'box) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<State>)))
  "Returns string type for a message object of type '<State>"
  "ivr_assignment/State")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'State)))
  "Returns string type for a message object of type 'State"
  "ivr_assignment/State")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<State>)))
  "Returns md5sum for a message object of type '<State>"
  "55bfea8321e47e17ccacb3d3544eea41")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'State)))
  "Returns md5sum for a message object of type 'State"
  "55bfea8321e47e17ccacb3d3544eea41")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<State>)))
  "Returns full string definition for message of type '<State>"
  (cl:format cl:nil "~%# Joint positions~%Point red~%Point green~%Point blue~%~%# Target positions~%Point sphere~%Point box~%================================================================================~%MSG: ivr_assignment/Point~%# Position of object in 3D space~%~%float64 x~%float64 y~%float64 z~%~%bool hidden~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'State)))
  "Returns full string definition for message of type 'State"
  (cl:format cl:nil "~%# Joint positions~%Point red~%Point green~%Point blue~%~%# Target positions~%Point sphere~%Point box~%================================================================================~%MSG: ivr_assignment/Point~%# Position of object in 3D space~%~%float64 x~%float64 y~%float64 z~%~%bool hidden~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <State>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'red))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'green))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'blue))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'sphere))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'box))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <State>))
  "Converts a ROS message object to a list"
  (cl:list 'State
    (cl:cons ':red (red msg))
    (cl:cons ':green (green msg))
    (cl:cons ':blue (blue msg))
    (cl:cons ':sphere (sphere msg))
    (cl:cons ':box (box msg))
))
