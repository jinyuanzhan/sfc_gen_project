; Auto-generated. Do not edit!


(cl:in-package vicon_env-msg)


;//! \htmlinclude Cylinder.msg.html

(cl:defclass <Cylinder> (roslisp-msg-protocol:ros-message)
  ((id
    :reader id
    :initarg :id
    :type cl:integer
    :initform 0)
   (pos
    :reader pos
    :initarg :pos
    :type vicon_env-msg:Point2d
    :initform (cl:make-instance 'vicon_env-msg:Point2d))
   (noise
    :reader noise
    :initarg :noise
    :type vicon_env-msg:Point3d
    :initform (cl:make-instance 'vicon_env-msg:Point3d))
   (r
    :reader r
    :initarg :r
    :type cl:float
    :initform 0.0)
   (h
    :reader h
    :initarg :h
    :type cl:float
    :initform 0.0))
)

(cl:defclass Cylinder (<Cylinder>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Cylinder>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Cylinder)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vicon_env-msg:<Cylinder> is deprecated: use vicon_env-msg:Cylinder instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Cylinder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:id-val is deprecated.  Use vicon_env-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <Cylinder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:pos-val is deprecated.  Use vicon_env-msg:pos instead.")
  (pos m))

(cl:ensure-generic-function 'noise-val :lambda-list '(m))
(cl:defmethod noise-val ((m <Cylinder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:noise-val is deprecated.  Use vicon_env-msg:noise instead.")
  (noise m))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <Cylinder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:r-val is deprecated.  Use vicon_env-msg:r instead.")
  (r m))

(cl:ensure-generic-function 'h-val :lambda-list '(m))
(cl:defmethod h-val ((m <Cylinder>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:h-val is deprecated.  Use vicon_env-msg:h instead.")
  (h m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Cylinder>) ostream)
  "Serializes a message object of type '<Cylinder>"
  (cl:let* ((signed (cl:slot-value msg 'id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pos) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'noise) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'r))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'h))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Cylinder>) istream)
  "Deserializes a message object of type '<Cylinder>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pos) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'noise) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'r) (roslisp-utils:decode-double-float-bits bits)))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'h) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Cylinder>)))
  "Returns string type for a message object of type '<Cylinder>"
  "vicon_env/Cylinder")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Cylinder)))
  "Returns string type for a message object of type 'Cylinder"
  "vicon_env/Cylinder")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Cylinder>)))
  "Returns md5sum for a message object of type '<Cylinder>"
  "a61dd680941510aadadfbb73b1ffec95")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Cylinder)))
  "Returns md5sum for a message object of type 'Cylinder"
  "a61dd680941510aadadfbb73b1ffec95")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Cylinder>)))
  "Returns full string definition for message of type '<Cylinder>"
  (cl:format cl:nil "int32 id~%Point2d pos~%Point3d noise~%float64 r~%float64 h~%~%================================================================================~%MSG: vicon_env/Point2d~%float64 x~%float64 y~%~%================================================================================~%MSG: vicon_env/Point3d~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Cylinder)))
  "Returns full string definition for message of type 'Cylinder"
  (cl:format cl:nil "int32 id~%Point2d pos~%Point3d noise~%float64 r~%float64 h~%~%================================================================================~%MSG: vicon_env/Point2d~%float64 x~%float64 y~%~%================================================================================~%MSG: vicon_env/Point3d~%float64 x~%float64 y~%float64 z~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Cylinder>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pos))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'noise))
     8
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Cylinder>))
  "Converts a ROS message object to a list"
  (cl:list 'Cylinder
    (cl:cons ':id (id msg))
    (cl:cons ':pos (pos msg))
    (cl:cons ':noise (noise msg))
    (cl:cons ':r (r msg))
    (cl:cons ':h (h msg))
))
