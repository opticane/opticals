; Auto-generated. Do not edit!


(cl:in-package ivr_assignment-msg)


;//! \htmlinclude StateStamped.msg.html

(cl:defclass <StateStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (state
    :reader state
    :initarg :state
    :type ivr_assignment-msg:State
    :initform (cl:make-instance 'ivr_assignment-msg:State)))
)

(cl:defclass StateStamped (<StateStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StateStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StateStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ivr_assignment-msg:<StateStamped> is deprecated: use ivr_assignment-msg:StateStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <StateStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:header-val is deprecated.  Use ivr_assignment-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'state-val :lambda-list '(m))
(cl:defmethod state-val ((m <StateStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:state-val is deprecated.  Use ivr_assignment-msg:state instead.")
  (state m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StateStamped>) ostream)
  "Serializes a message object of type '<StateStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'state) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StateStamped>) istream)
  "Deserializes a message object of type '<StateStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'state) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StateStamped>)))
  "Returns string type for a message object of type '<StateStamped>"
  "ivr_assignment/StateStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StateStamped)))
  "Returns string type for a message object of type 'StateStamped"
  "ivr_assignment/StateStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StateStamped>)))
  "Returns md5sum for a message object of type '<StateStamped>"
  "112a55435ddc6b46fc7af2d82b7cb445")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StateStamped)))
  "Returns md5sum for a message object of type 'StateStamped"
  "112a55435ddc6b46fc7af2d82b7cb445")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StateStamped>)))
  "Returns full string definition for message of type '<StateStamped>"
  (cl:format cl:nil "~%Header header~%~%State state~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ivr_assignment/State~%~%# Joint positions~%Point red~%Point green~%Point blue~%~%# Target positions~%Point sphere~%Point box~%================================================================================~%MSG: ivr_assignment/Point~%# Position of object in 3D space~%~%float64 x~%float64 y~%float64 z~%~%bool hidden~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StateStamped)))
  "Returns full string definition for message of type 'StateStamped"
  (cl:format cl:nil "~%Header header~%~%State state~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ivr_assignment/State~%~%# Joint positions~%Point red~%Point green~%Point blue~%~%# Target positions~%Point sphere~%Point box~%================================================================================~%MSG: ivr_assignment/Point~%# Position of object in 3D space~%~%float64 x~%float64 y~%float64 z~%~%bool hidden~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StateStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'state))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StateStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'StateStamped
    (cl:cons ':header (header msg))
    (cl:cons ':state (state msg))
))
