;; Auto-generated. Do not edit!


(when (boundp 'ivr_assignment::Angles)
  (if (not (find-package "IVR_ASSIGNMENT"))
    (make-package "IVR_ASSIGNMENT"))
  (shadow 'Angles (find-package "IVR_ASSIGNMENT")))
(unless (find-package "IVR_ASSIGNMENT::ANGLES")
  (make-package "IVR_ASSIGNMENT::ANGLES"))

(in-package "ROS")
;;//! \htmlinclude Angles.msg.html


(defclass ivr_assignment::Angles
  :super ros::object
  :slots (_theta_1 _theta_2 _theta_3 _theta_4 ))

(defmethod ivr_assignment::Angles
  (:init
   (&key
    ((:theta_1 __theta_1) 0.0)
    ((:theta_2 __theta_2) 0.0)
    ((:theta_3 __theta_3) 0.0)
    ((:theta_4 __theta_4) 0.0)
    )
   (send-super :init)
   (setq _theta_1 (float __theta_1))
   (setq _theta_2 (float __theta_2))
   (setq _theta_3 (float __theta_3))
   (setq _theta_4 (float __theta_4))
   self)
  (:theta_1
   (&optional __theta_1)
   (if __theta_1 (setq _theta_1 __theta_1)) _theta_1)
  (:theta_2
   (&optional __theta_2)
   (if __theta_2 (setq _theta_2 __theta_2)) _theta_2)
  (:theta_3
   (&optional __theta_3)
   (if __theta_3 (setq _theta_3 __theta_3)) _theta_3)
  (:theta_4
   (&optional __theta_4)
   (if __theta_4 (setq _theta_4 __theta_4)) _theta_4)
  (:serialization-length
   ()
   (+
    ;; float64 _theta_1
    8
    ;; float64 _theta_2
    8
    ;; float64 _theta_3
    8
    ;; float64 _theta_4
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _theta_1
       (sys::poke _theta_1 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta_2
       (sys::poke _theta_2 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta_3
       (sys::poke _theta_3 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _theta_4
       (sys::poke _theta_4 (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _theta_1
     (setq _theta_1 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta_2
     (setq _theta_2 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta_3
     (setq _theta_3 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _theta_4
     (setq _theta_4 (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get ivr_assignment::Angles :md5sum-) "617622430535c6b3b6c6968cba8cad3e")
(setf (get ivr_assignment::Angles :datatype-) "ivr_assignment/Angles")
(setf (get ivr_assignment::Angles :definition-)
      "# Joint angles of the robot

float64 theta_1 # Yellow joint
float64 theta_2 # Blue joint (#1)
float64 theta_3 # Blue joint (#2)
float64 theta_4 # Green joint

")



(provide :ivr_assignment/Angles "617622430535c6b3b6c6968cba8cad3e")


