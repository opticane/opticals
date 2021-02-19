; Auto-generated. Do not edit!


(cl:in-package ivr_assignment-msg)


;//! \htmlinclude Point.msg.html

(cl:defclass <Point> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0)
   (y
    :reader y
    :initarg :y
    :type cl:float
    :initform 0.0)
   (z
    :reader z
    :initarg :z
    :type cl:float
    :initform 0.0)
   (hidden
    :reader hidden
    :initarg :hidden
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass Point (<Point>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Point>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Point)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name ivr_assignment-msg:<Point> is deprecated: use ivr_assignment-msg:Point instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <Point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:x-val is deprecated.  Use ivr_assignment-msg:x instead.")
  (x m))

(cl:ensure-generic-function 'y-val :lambda-list '(m))
(cl:defmethod y-val ((m <Point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:y-val is deprecated.  Use ivr_assignment-msg:y instead.")
  (y m))

(cl:ensure-generic-function 'z-val :lambda-list '(m))
(cl:defmethod z-val ((m <Point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:z-val is deprecated.  Use ivr_assignment-msg:z instead.")
  (z m))

(cl:ensure-generic-function 'hidden-val :lambda-list '(m))
(cl:defmethod hidden-val ((m <Point>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader ivr_assignment-msg:hidden-val is deprecated.  Use ivr_assignment-msg:hidden instead.")
  (hidden m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Point>) ostream)
  "Serializes a message object of type '<Point>"
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'y))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'z))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'hidden) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Point>) istream)
  "Deserializes a message object of type '<Point>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'y) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'z) (roslisp-utils:decode-double-float-bits bits)))
    (cl:setf (cl:slot-value msg 'hidden) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Point>)))
  "Returns string type for a message object of type '<Point>"
  "ivr_assignment/Point")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Point)))
  "Returns string type for a message object of type 'Point"
  "ivr_assignment/Point")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Point>)))
  "Returns md5sum for a message object of type '<Point>"
  "fe9f8ba3be526e87aa974f27398bb504")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Point)))
  "Returns md5sum for a message object of type 'Point"
  "fe9f8ba3be526e87aa974f27398bb504")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Point>)))
  "Returns full string definition for message of type '<Point>"
  (cl:format cl:nil "# Position of object in 3D space~%~%float64 x~%float64 y~%float64 z~%~%bool hidden~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Point)))
  "Returns full string definition for message of type 'Point"
  (cl:format cl:nil "# Position of object in 3D space~%~%float64 x~%float64 y~%float64 z~%~%bool hidden~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Point>))
  (cl:+ 0
     8
     8
     8
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Point>))
  "Converts a ROS message object to a list"
  (cl:list 'Point
    (cl:cons ':x (x msg))
    (cl:cons ':y (y msg))
    (cl:cons ':z (z msg))
    (cl:cons ':hidden (hidden msg))
))
