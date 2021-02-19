;; Auto-generated. Do not edit!


(when (boundp 'ivr_assignment::Point)
  (if (not (find-package "IVR_ASSIGNMENT"))
    (make-package "IVR_ASSIGNMENT"))
  (shadow 'Point (find-package "IVR_ASSIGNMENT")))
(unless (find-package "IVR_ASSIGNMENT::POINT")
  (make-package "IVR_ASSIGNMENT::POINT"))

(in-package "ROS")
;;//! \htmlinclude Point.msg.html


(defclass ivr_assignment::Point
  :super ros::object
  :slots (_x _y _z _hidden ))

(defmethod ivr_assignment::Point
  (:init
   (&key
    ((:x __x) 0.0)
    ((:y __y) 0.0)
    ((:z __z) 0.0)
    ((:hidden __hidden) nil)
    )
   (send-super :init)
   (setq _x (float __x))
   (setq _y (float __y))
   (setq _z (float __z))
   (setq _hidden __hidden)
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:y
   (&optional __y)
   (if __y (setq _y __y)) _y)
  (:z
   (&optional __z)
   (if __z (setq _z __z)) _z)
  (:hidden
   (&optional (__hidden :null))
   (if (not (eq __hidden :null)) (setq _hidden __hidden)) _hidden)
  (:serialization-length
   ()
   (+
    ;; float64 _x
    8
    ;; float64 _y
    8
    ;; float64 _z
    8
    ;; bool _hidden
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float64 _x
       (sys::poke _x (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _y
       (sys::poke _y (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _z
       (sys::poke _z (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; bool _hidden
       (if _hidden (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float64 _x
     (setq _x (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _y
     (setq _y (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _z
     (setq _z (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; bool _hidden
     (setq _hidden (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(setf (get ivr_assignment::Point :md5sum-) "fe9f8ba3be526e87aa974f27398bb504")
(setf (get ivr_assignment::Point :datatype-) "ivr_assignment/Point")
(setf (get ivr_assignment::Point :definition-)
      "# Position of object in 3D space

float64 x
float64 y
float64 z

bool hidden
")



(provide :ivr_assignment/Point "fe9f8ba3be526e87aa974f27398bb504")


