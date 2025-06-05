; Auto-generated. Do not edit!


(cl:in-package vicon_env-msg)


;//! \htmlinclude Polygon.msg.html

(cl:defclass <Polygon> (roslisp-msg-protocol:ros-message)
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
    :type vicon_env-msg:Point2d
    :initform (cl:make-instance 'vicon_env-msg:Point2d))
   (r
    :reader r
    :initarg :r
    :type cl:float
    :initform 0.0)
   (points
    :reader points
    :initarg :points
    :type (cl:vector vicon_env-msg:Point2d)
   :initform (cl:make-array 0 :element-type 'vicon_env-msg:Point2d :initial-element (cl:make-instance 'vicon_env-msg:Point2d)))
   (normals
    :reader normals
    :initarg :normals
    :type (cl:vector vicon_env-msg:Point2d)
   :initform (cl:make-array 0 :element-type 'vicon_env-msg:Point2d :initial-element (cl:make-instance 'vicon_env-msg:Point2d))))
)

(cl:defclass Polygon (<Polygon>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <Polygon>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'Polygon)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vicon_env-msg:<Polygon> is deprecated: use vicon_env-msg:Polygon instead.")))

(cl:ensure-generic-function 'id-val :lambda-list '(m))
(cl:defmethod id-val ((m <Polygon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:id-val is deprecated.  Use vicon_env-msg:id instead.")
  (id m))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <Polygon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:pos-val is deprecated.  Use vicon_env-msg:pos instead.")
  (pos m))

(cl:ensure-generic-function 'noise-val :lambda-list '(m))
(cl:defmethod noise-val ((m <Polygon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:noise-val is deprecated.  Use vicon_env-msg:noise instead.")
  (noise m))

(cl:ensure-generic-function 'r-val :lambda-list '(m))
(cl:defmethod r-val ((m <Polygon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:r-val is deprecated.  Use vicon_env-msg:r instead.")
  (r m))

(cl:ensure-generic-function 'points-val :lambda-list '(m))
(cl:defmethod points-val ((m <Polygon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:points-val is deprecated.  Use vicon_env-msg:points instead.")
  (points m))

(cl:ensure-generic-function 'normals-val :lambda-list '(m))
(cl:defmethod normals-val ((m <Polygon>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:normals-val is deprecated.  Use vicon_env-msg:normals instead.")
  (normals m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <Polygon>) ostream)
  "Serializes a message object of type '<Polygon>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'points))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'points))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'normals))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'normals))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <Polygon>) istream)
  "Deserializes a message object of type '<Polygon>"
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'points) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'points)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vicon_env-msg:Point2d))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'normals) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'normals)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vicon_env-msg:Point2d))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<Polygon>)))
  "Returns string type for a message object of type '<Polygon>"
  "vicon_env/Polygon")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'Polygon)))
  "Returns string type for a message object of type 'Polygon"
  "vicon_env/Polygon")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<Polygon>)))
  "Returns md5sum for a message object of type '<Polygon>"
  "bbf89956b1b32f3553e772500df6fc67")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'Polygon)))
  "Returns md5sum for a message object of type 'Polygon"
  "bbf89956b1b32f3553e772500df6fc67")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<Polygon>)))
  "Returns full string definition for message of type '<Polygon>"
  (cl:format cl:nil "int32 id~%Point2d pos~%Point2d noise~%float64 r #clearance range~%Point2d[] points~%Point2d[] normals #norm is an outer vector~%~%================================================================================~%MSG: vicon_env/Point2d~%float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'Polygon)))
  "Returns full string definition for message of type 'Polygon"
  (cl:format cl:nil "int32 id~%Point2d pos~%Point2d noise~%float64 r #clearance range~%Point2d[] points~%Point2d[] normals #norm is an outer vector~%~%================================================================================~%MSG: vicon_env/Point2d~%float64 x~%float64 y~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <Polygon>))
  (cl:+ 0
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pos))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'noise))
     8
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'points) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'normals) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <Polygon>))
  "Converts a ROS message object to a list"
  (cl:list 'Polygon
    (cl:cons ':id (id msg))
    (cl:cons ':pos (pos msg))
    (cl:cons ':noise (noise msg))
    (cl:cons ':r (r msg))
    (cl:cons ':points (points msg))
    (cl:cons ':normals (normals msg))
))
