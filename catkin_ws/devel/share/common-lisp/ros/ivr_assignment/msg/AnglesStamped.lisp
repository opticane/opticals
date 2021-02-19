; Auto-generated. Do not edit!


(cl:in-package ivr_assignment-msg)


;//! \htmlinclude AnglesStamped.msg.html

(cl:defclass <AnglesStamped> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (angles
    :reader angles
    :initarg :angles
    :type ivr_assignment-msg:Angles
    :initform (cl:make-instance 'ivr_assignment-msg:Angles)))
)

(cl:defclass AnglesStamped (<AnglesStamped>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <AnglesStamped>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'AnglesStamped)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ivr_assignment-msg:<AnglesStamped> is deprecated: use ivr_assignment-msg:AnglesStamped instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <AnglesStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:header-val is deprecated.  Use ivr_assignment-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'angles-val :lambda-list '(m))
(cl:defmethod angles-val ((m <AnglesStamped>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:angles-val is deprecated.  Use ivr_assignment-msg:angles instead.")
  (angles m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <AnglesStamped>) ostream)
  "Serializes a message object of type '<AnglesStamped>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'angles) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <AnglesStamped>) istream)
  "Deserializes a message object of type '<AnglesStamped>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'angles) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<AnglesStamped>)))
  "Returns string type for a message object of type '<AnglesStamped>"
  "ivr_assignment/AnglesStamped")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'AnglesStamped)))
  "Returns string type for a message object of type 'AnglesStamped"
  "ivr_assignment/AnglesStamped")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<AnglesStamped>)))
  "Returns md5sum for a message object of type '<AnglesStamped>"
  "eb93e391760e97c458e06a2398a94b44")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'AnglesStamped)))
  "Returns md5sum for a message object of type 'AnglesStamped"
  "eb93e391760e97c458e06a2398a94b44")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<AnglesStamped>)))
  "Returns full string definition for message of type '<AnglesStamped>"
  (cl:format cl:nil "# Joint angles of the robot~%~%Header header~%~%Angles angles~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ivr_assignment/Angles~%# Joint angles of the robot~%~%float64 theta_1 # Yellow joint~%float64 theta_2 # Blue joint (#1)~%float64 theta_3 # Blue joint (#2)~%float64 theta_4 # Green joint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'AnglesStamped)))
  "Returns full string definition for message of type 'AnglesStamped"
  (cl:format cl:nil "# Joint angles of the robot~%~%Header header~%~%Angles angles~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: ivr_assignment/Angles~%# Joint angles of the robot~%~%float64 theta_1 # Yellow joint~%float64 theta_2 # Blue joint (#1)~%float64 theta_3 # Blue joint (#2)~%float64 theta_4 # Green joint~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <AnglesStamped>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'angles))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <AnglesStamped>))
  "Converts a ROS message object to a list"
  (cl:list 'AnglesStamped
    (cl:cons ':header (header msg))
    (cl:cons ':angles (angles msg))
))
