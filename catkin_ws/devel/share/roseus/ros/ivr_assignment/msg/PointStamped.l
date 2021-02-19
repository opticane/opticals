;; Auto-generated. Do not edit!


(when (boundp 'ivr_assignment::PointStamped)
  (if (not (find-package "IVR_ASSIGNMENT"))
    (make-package "IVR_ASSIGNMENT"))
  (shadow 'PointStamped (find-package "IVR_ASSIGNMENT")))
(unless (find-package "IVR_ASSIGNMENT::POINTSTAMPED")
  (make-package "IVR_ASSIGNMENT::POINTSTAMPED"))

(in-package "ROS")
;;//! \htmlinclude PointStamped.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass ivr_assignment::PointStamped
  :super ros::object
  :slots (_header _point ))

(defmethod ivr_assignment::PointStamped
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:point __point) (instance ivr_assignment::Point :init))
    )
   (send-super :init)
   (setq _header __header)
   (setq _point __point)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:point
   (&rest __point)
   (if (keywordp (car __point))
       (send* _point __point)
     (progn
       (if __point (setq _point (car __point)))
       _point)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; ivr_assignment/Point _point
    (send _point :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; ivr_assignment/Point _point
       (send _point :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; ivr_assignment/Point _point
     (send _point :deserialize buf ptr-) (incf ptr- (send _point :serialization-length))
   ;;
   self)
  )

(setf (get ivr_assignment::PointStamped :md5sum-) "b9a3858b0041bee9fb5e8842c393e941")
(setf (get ivr_assignment::PointStamped :datatype-) "ivr_assignment/PointStamped")
(setf (get ivr_assignment::PointStamped :definition-)
      "# Position of object in 3D space

Header header

Point point
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
MSG: ivr_assignment/Point
# Position of object in 3D space

float64 x
float64 y
float64 z

bool hidden
")



(provide :ivr_assignment/PointStamped "b9a3858b0041bee9fb5e8842c393e941")


