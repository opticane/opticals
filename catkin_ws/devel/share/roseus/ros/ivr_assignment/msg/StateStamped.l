;; Auto-generated. Do not edit!


(when (boundp 'ivr_assignment::StateStamped)
  (if (not (find-package "IVR_ASSIGNMENT"))
    (make-package "IVR_ASSIGNMENT"))
  (shadow 'StateStamped (find-package "IVR_ASSIGNMENT")))
(unless (find-package "IVR_ASSIGNMENT::STATESTAMPED")
  (make-package "IVR_ASSIGNMENT::STATESTAMPED"))

(in-package "ROS")
;;//! \htmlinclude StateStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ivr_assignment::StateStamped
  :super ros::object
  :slots (_header _state ))

(defmethod ivr_assignment::StateStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:state __state) (instance ivr_assignment::State :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _state __state)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:state
   (&rest __state)
   (if (keywordp (car __state))
       (send* _state __state)
     (progn
       (if __state (setq _state (car __state)))
       _state)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ivr_assignment/State _state
    (send _state :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ivr_assignment/State _state
       (send _state :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ivr_assignment/State _state
     (send _state :deserialize buf ptr-) (incf ptr- (send _state :serialization-length))
   ;;
   self)
  )

(setf (get ivr_assignment::StateStamped :md5sum-) "112a55435ddc6b46fc7af2d82b7cb445")
(setf (get ivr_assignment::StateStamped :datatype-) "ivr_assignment/StateStamped")
(setf (get ivr_assignment::StateStamped :definition-)
      "
Header header

State state
================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: ivr_assignment/State

# Joint positions
Point red
Point green
Point blue

# Target positions
Point sphere
Point box
================================================================================
MSG: ivr_assignment/Point
# Position of object in 3D space

float64 x
float64 y
float64 z

bool hidden
")



(provide :ivr_assignment/StateStamped "112a55435ddc6b46fc7af2d82b7cb445")


