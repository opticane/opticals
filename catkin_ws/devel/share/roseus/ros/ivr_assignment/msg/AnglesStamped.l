;; Auto-generated. Do not edit!


(when (boundp 'ivr_assignment::AnglesStamped)
  (if (not (find-package "IVR_ASSIGNMENT"))
    (make-package "IVR_ASSIGNMENT"))
  (shadow 'AnglesStamped (find-package "IVR_ASSIGNMENT")))
(unless (find-package "IVR_ASSIGNMENT::ANGLESSTAMPED")
  (make-package "IVR_ASSIGNMENT::ANGLESSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude AnglesStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ivr_assignment::AnglesStamped
  :super ros::object
  :slots (_header _angles ))

(defmethod ivr_assignment::AnglesStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:angles __angles) (instance ivr_assignment::Angles :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _angles __angles)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:angles
   (&rest __angles)
   (if (keywordp (car __angles))
       (send* _angles __angles)
     (progn
       (if __angles (setq _angles (car __angles)))
       _angles)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ivr_assignment/Angles _angles
    (send _angles :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ivr_assignment/Angles _angles
       (send _angles :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ivr_assignment/Angles _angles
     (send _angles :deserialize buf ptr-) (incf ptr- (send _angles :serialization-length))
   ;;
   self)
  )

(setf (get ivr_assignment::AnglesStamped :md5sum-) "eb93e391760e97c458e06a2398a94b44")
(setf (get ivr_assignment::AnglesStamped :datatype-) "ivr_assignment/AnglesStamped")
(setf (get ivr_assignment::AnglesStamped :definition-)
      "# Joint angles of the robot

Header header

Angles angles
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
MSG: ivr_assignment/Angles
# Joint angles of the robot

float64 theta_1 # Yellow joint
float64 theta_2 # Blue joint (#1)
float64 theta_3 # Blue joint (#2)
float64 theta_4 # Green joint

")



(provide :ivr_assignment/AnglesStamped "eb93e391760e97c458e06a2398a94b44")


