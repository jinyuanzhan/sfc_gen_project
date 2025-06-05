; Auto-generated. Do not edit!


(cl:in-package vicon_env-msg)


;//! \htmlinclude SemanticArray.msg.html

(cl:defclass <SemanticArray> (roslisp-msg-protocol:ros-message)
  ((header
    :reader header
    :initarg :header
    :type std_msgs-msg:Header
    :initform (cl:make-instance 'std_msgs-msg:Header))
   (mav_id
    :reader mav_id
    :initarg :mav_id
    :type cl:integer
    :initform 0)
   (mav_pos
    :reader mav_pos
    :initarg :mav_pos
    :type vicon_env-msg:Point3d
    :initform (cl:make-instance 'vicon_env-msg:Point3d))
   (ellipses
    :reader ellipses
    :initarg :ellipses
    :type (cl:vector vicon_env-msg:Ellipse)
   :initform (cl:make-array 0 :element-type 'vicon_env-msg:Ellipse :initial-element (cl:make-instance 'vicon_env-msg:Ellipse)))
   (circles
    :reader circles
    :initarg :circles
    :type (cl:vector vicon_env-msg:Circle)
   :initform (cl:make-array 0 :element-type 'vicon_env-msg:Circle :initial-element (cl:make-instance 'vicon_env-msg:Circle)))
   (polygons
    :reader polygons
    :initarg :polygons
    :type (cl:vector vicon_env-msg:Polygon)
   :initform (cl:make-array 0 :element-type 'vicon_env-msg:Polygon :initial-element (cl:make-instance 'vicon_env-msg:Polygon)))
   (cylinders
    :reader cylinders
    :initarg :cylinders
    :type (cl:vector vicon_env-msg:Cylinder)
   :initform (cl:make-array 0 :element-type 'vicon_env-msg:Cylinder :initial-element (cl:make-instance 'vicon_env-msg:Cylinder)))
   (polyhedrons
    :reader polyhedrons
    :initarg :polyhedrons
    :type (cl:vector vicon_env-msg:Polyhedron)
   :initform (cl:make-array 0 :element-type 'vicon_env-msg:Polyhedron :initial-element (cl:make-instance 'vicon_env-msg:Polyhedron))))
)

(cl:defclass SemanticArray (<SemanticArray>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <SemanticArray>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'SemanticArray)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name vicon_env-msg:<SemanticArray> is deprecated: use vicon_env-msg:SemanticArray instead.")))

(cl:ensure-generic-function 'header-val :lambda-list '(m))
(cl:defmethod header-val ((m <SemanticArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:header-val is deprecated.  Use vicon_env-msg:header instead.")
  (header m))

(cl:ensure-generic-function 'mav_id-val :lambda-list '(m))
(cl:defmethod mav_id-val ((m <SemanticArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:mav_id-val is deprecated.  Use vicon_env-msg:mav_id instead.")
  (mav_id m))

(cl:ensure-generic-function 'mav_pos-val :lambda-list '(m))
(cl:defmethod mav_pos-val ((m <SemanticArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:mav_pos-val is deprecated.  Use vicon_env-msg:mav_pos instead.")
  (mav_pos m))

(cl:ensure-generic-function 'ellipses-val :lambda-list '(m))
(cl:defmethod ellipses-val ((m <SemanticArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:ellipses-val is deprecated.  Use vicon_env-msg:ellipses instead.")
  (ellipses m))

(cl:ensure-generic-function 'circles-val :lambda-list '(m))
(cl:defmethod circles-val ((m <SemanticArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:circles-val is deprecated.  Use vicon_env-msg:circles instead.")
  (circles m))

(cl:ensure-generic-function 'polygons-val :lambda-list '(m))
(cl:defmethod polygons-val ((m <SemanticArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:polygons-val is deprecated.  Use vicon_env-msg:polygons instead.")
  (polygons m))

(cl:ensure-generic-function 'cylinders-val :lambda-list '(m))
(cl:defmethod cylinders-val ((m <SemanticArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:cylinders-val is deprecated.  Use vicon_env-msg:cylinders instead.")
  (cylinders m))

(cl:ensure-generic-function 'polyhedrons-val :lambda-list '(m))
(cl:defmethod polyhedrons-val ((m <SemanticArray>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader vicon_env-msg:polyhedrons-val is deprecated.  Use vicon_env-msg:polyhedrons instead.")
  (polyhedrons m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <SemanticArray>) ostream)
  "Serializes a message object of type '<SemanticArray>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'header) ostream)
  (cl:let* ((signed (cl:slot-value msg 'mav_id)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'mav_pos) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ellipses))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ellipses))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'circles))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'circles))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'polygons))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'polygons))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'cylinders))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'cylinders))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'polyhedrons))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'polyhedrons))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <SemanticArray>) istream)
  "Deserializes a message object of type '<SemanticArray>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'header) istream)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'mav_id) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'mav_pos) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ellipses) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ellipses)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vicon_env-msg:Ellipse))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'circles) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'circles)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vicon_env-msg:Circle))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'polygons) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'polygons)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vicon_env-msg:Polygon))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'cylinders) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'cylinders)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vicon_env-msg:Cylinder))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'polyhedrons) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'polyhedrons)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'vicon_env-msg:Polyhedron))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<SemanticArray>)))
  "Returns string type for a message object of type '<SemanticArray>"
  "vicon_env/SemanticArray")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'SemanticArray)))
  "Returns string type for a message object of type 'SemanticArray"
  "vicon_env/SemanticArray")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<SemanticArray>)))
  "Returns md5sum for a message object of type '<SemanticArray>"
  "f11c93d4fb77d44a8c5e24f11f9114d5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'SemanticArray)))
  "Returns md5sum for a message object of type 'SemanticArray"
  "f11c93d4fb77d44a8c5e24f11f9114d5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<SemanticArray>)))
  "Returns full string definition for message of type '<SemanticArray>"
  (cl:format cl:nil "std_msgs/Header header~%int32 mav_id #-1 for global map, 0 + for the mav_id~%Point3d mav_pos~%~%#2d semantics~%Ellipse[] ellipses~%Circle[]  circles~%Polygon[] polygons~%~%#3d semantics~%Cylinder[] cylinders~%Polyhedron[] polyhedrons~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: vicon_env/Point3d~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: vicon_env/Ellipse~%int32 id~%Point2d pos~%Point2d noise~%float64 r #clearance range~%float64 a~%float64 b~%float64 alpha # rotation~%~%================================================================================~%MSG: vicon_env/Point2d~%float64 x~%float64 y~%~%================================================================================~%MSG: vicon_env/Circle~%int32 id~%Point2d pos~%Point2d noise~%float64 r~%~%~%================================================================================~%MSG: vicon_env/Polygon~%int32 id~%Point2d pos~%Point2d noise~%float64 r #clearance range~%Point2d[] points~%Point2d[] normals #norm is an outer vector~%~%================================================================================~%MSG: vicon_env/Cylinder~%int32 id~%Point2d pos~%Point3d noise~%float64 r~%float64 h~%~%================================================================================~%MSG: vicon_env/Polyhedron~%int32 id~%Point2d[] rps~%Point3d noise~%float64 r #clearance range~%Point3d[] points~%Point3d[] normals #norm is an outer vector~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'SemanticArray)))
  "Returns full string definition for message of type 'SemanticArray"
  (cl:format cl:nil "std_msgs/Header header~%int32 mav_id #-1 for global map, 0 + for the mav_id~%Point3d mav_pos~%~%#2d semantics~%Ellipse[] ellipses~%Circle[]  circles~%Polygon[] polygons~%~%#3d semantics~%Cylinder[] cylinders~%Polyhedron[] polyhedrons~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%================================================================================~%MSG: vicon_env/Point3d~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: vicon_env/Ellipse~%int32 id~%Point2d pos~%Point2d noise~%float64 r #clearance range~%float64 a~%float64 b~%float64 alpha # rotation~%~%================================================================================~%MSG: vicon_env/Point2d~%float64 x~%float64 y~%~%================================================================================~%MSG: vicon_env/Circle~%int32 id~%Point2d pos~%Point2d noise~%float64 r~%~%~%================================================================================~%MSG: vicon_env/Polygon~%int32 id~%Point2d pos~%Point2d noise~%float64 r #clearance range~%Point2d[] points~%Point2d[] normals #norm is an outer vector~%~%================================================================================~%MSG: vicon_env/Cylinder~%int32 id~%Point2d pos~%Point3d noise~%float64 r~%float64 h~%~%================================================================================~%MSG: vicon_env/Polyhedron~%int32 id~%Point2d[] rps~%Point3d noise~%float64 r #clearance range~%Point3d[] points~%Point3d[] normals #norm is an outer vector~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <SemanticArray>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'header))
     4
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'mav_pos))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ellipses) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'circles) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'polygons) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'cylinders) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'polyhedrons) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <SemanticArray>))
  "Converts a ROS message object to a list"
  (cl:list 'SemanticArray
    (cl:cons ':header (header msg))
    (cl:cons ':mav_id (mav_id msg))
    (cl:cons ':mav_pos (mav_pos msg))
    (cl:cons ':ellipses (ellipses msg))
    (cl:cons ':circles (circles msg))
    (cl:cons ':polygons (polygons msg))
    (cl:cons ':cylinders (cylinders msg))
    (cl:cons ':polyhedrons (polyhedrons msg))
))
