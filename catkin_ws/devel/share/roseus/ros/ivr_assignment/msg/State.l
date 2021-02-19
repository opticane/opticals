;; Auto-generated. Do not edit!


(when (boundp 'ivr_assignment::State)
  (if (not (find-package "IVR_ASSIGNMENT"))
    (make-package "IVR_ASSIGNMENT"))
  (shadow 'State (find-package "IVR_ASSIGNMENT")))
(unless (find-package "IVR_ASSIGNMENT::STATE")
  (make-package "IVR_ASSIGNMENT::STATE"))

(in-package "ROS")
;;//! \htmlinclude State.msg.html


(defclass ivr_assignment::State
  :super ros::object
  :slots (_red _green _blue _sphere _box ))

(defmethod ivr_assignment::State
  (:init
   (&key
    ((:red __red) (instance ivr_assignment::Point :init))
    ((:green __green) (instance ivr_assignment::Point :init))
    ((:blue __blue) (instance ivr_assignment::Point :init))
    ((:sphere __sphere) (instance ivr_assignment::Point :init))
    ((:box __box) (instance ivr_assignment::Point :init))
    )
   (send-super :init)
   (setq _red __red)
   (setq _green __green)
   (setq _blue __blue)
   (setq _sphere __sphere)
   (setq _box __box)
   self)
  (:red
   (&rest __red)
   (if (keywordp (car __red))
       (send* _red __red)
     (progn
       (if __red (setq _red (car __red)))
       _red)))
  (:green
   (&rest __green)
   (if (keywordp (car __green))
       (send* _green __green)
     (progn
       (if __green (setq _green (car __green)))
       _green)))
  (:blue
   (&rest __blue)
   (if (keywordp (car __blue))
       (send* _blue __blue)
     (progn
       (if __blue (setq _blue (car __blue)))
       _blue)))
  (:sphere
   (&rest __sphere)
   (if (keywordp (car __sphere))
       (send* _sphere __sphere)
     (progn
       (if __sphere (setq _sphere (car __sphere)))
       _sphere)))
  (:box
   (&rest __box)
   (if (keywordp (car __box))
       (send* _box __box)
     (progn
       (if __box (setq _box (car __box)))
       _box)))
  (:serialization-length
   ()
   (+
    ;; ivr_assignment/Point _red
    (send _red :serialization-length)
    ;; ivr_assignment/Point _green
    (send _green :serialization-length)
    ;; ivr_assignment/Point _blue
    (send _blue :serialization-length)
    ;; ivr_assignment/Point _sphere
    (send _sphere :serialization-length)
    ;; ivr_assignment/Point _box
    (send _box :serialization-length)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; ivr_assignment/Point _red
       (send _red :serialize s)
     ;; ivr_assignment/Point _green
       (send _green :serialize s)
     ;; ivr_assignment/Point _blue
       (send _blue :serialize s)
     ;; ivr_assignment/Point _sphere
       (send _sphere :serialize s)
     ;; ivr_assignment/Point _box
       (send _box :serialize s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; ivr_assignment/Point _red
     (send _red :deserialize buf ptr-) (incf ptr- (send _red :serialization-length))
   ;; ivr_assignment/Point _green
     (send _green :deserialize buf ptr-) (incf ptr- (send _green :serialization-length))
   ;; ivr_assignment/Point _blue
     (send _blue :deserialize buf ptr-) (incf ptr- (send _blue :serialization-length))
   ;; ivr_assignment/Point _sphere
     (send _sphere :deserialize buf ptr-) (incf ptr- (send _sphere :serialization-length))
   ;; ivr_assignment/Point _box
     (send _box :deserialize buf ptr-) (incf ptr- (send _box :serialization-length))
   ;;
   self)
  )

(setf (get ivr_assignment::State :md5sum-) "55bfea8321e47e17ccacb3d3544eea41")
(setf (get ivr_assignment::State :datatype-) "ivr_assignment/State")
(setf (get ivr_assignment::State :definition-)
      "
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



(provide :ivr_assignment/State "55bfea8321e47e17ccacb3d3544eea41")


