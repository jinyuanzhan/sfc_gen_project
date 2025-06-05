;; Auto-generated. Do not edit!


(when (boundp 'vicon_env::SemanticArray)
  (if (not (find-package "VICON_ENV"))
    (make-package "VICON_ENV"))
  (shadow 'SemanticArray (find-package "VICON_ENV")))
(unless (find-package "VICON_ENV::SEMANTICARRAY")
  (make-package "VICON_ENV::SEMANTICARRAY"))

(in-package "ROS")
;;//! \htmlinclude SemanticArray.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass vicon_env::SemanticArray
  :super ros::object
  :slots (_header _mav_id _mav_pos _ellipses _circles _polygons _cylinders _polyhedrons ))

(defmethod vicon_env::SemanticArray
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:mav_id __mav_id) 0)
    ((:mav_pos __mav_pos) (instance vicon_env::Point3d :init))
    ((:ellipses __ellipses) ())
    ((:circles __circles) ())
    ((:polygons __polygons) ())
    ((:cylinders __cylinders) ())
    ((:polyhedrons __polyhedrons) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _mav_id (round __mav_id))
   (setq _mav_pos __mav_pos)
   (setq _ellipses __ellipses)
   (setq _circles __circles)
   (setq _polygons __polygons)
   (setq _cylinders __cylinders)
   (setq _polyhedrons __polyhedrons)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:mav_id
   (&optional __mav_id)
   (if __mav_id (setq _mav_id __mav_id)) _mav_id)
  (:mav_pos
   (&rest __mav_pos)
   (if (keywordp (car __mav_pos))
       (send* _mav_pos __mav_pos)
     (progn
       (if __mav_pos (setq _mav_pos (car __mav_pos)))
       _mav_pos)))
  (:ellipses
   (&rest __ellipses)
   (if (keywordp (car __ellipses))
       (send* _ellipses __ellipses)
     (progn
       (if __ellipses (setq _ellipses (car __ellipses)))
       _ellipses)))
  (:circles
   (&rest __circles)
   (if (keywordp (car __circles))
       (send* _circles __circles)
     (progn
       (if __circles (setq _circles (car __circles)))
       _circles)))
  (:polygons
   (&rest __polygons)
   (if (keywordp (car __polygons))
       (send* _polygons __polygons)
     (progn
       (if __polygons (setq _polygons (car __polygons)))
       _polygons)))
  (:cylinders
   (&rest __cylinders)
   (if (keywordp (car __cylinders))
       (send* _cylinders __cylinders)
     (progn
       (if __cylinders (setq _cylinders (car __cylinders)))
       _cylinders)))
  (:polyhedrons
   (&rest __polyhedrons)
   (if (keywordp (car __polyhedrons))
       (send* _polyhedrons __polyhedrons)
     (progn
       (if __polyhedrons (setq _polyhedrons (car __polyhedrons)))
       _polyhedrons)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; int32 _mav_id
    4
    ;; vicon_env/Point3d _mav_pos
    (send _mav_pos :serialization-length)
    ;; vicon_env/Ellipse[] _ellipses
    (apply #'+ (send-all _ellipses :serialization-length)) 4
    ;; vicon_env/Circle[] _circles
    (apply #'+ (send-all _circles :serialization-length)) 4
    ;; vicon_env/Polygon[] _polygons
    (apply #'+ (send-all _polygons :serialization-length)) 4
    ;; vicon_env/Cylinder[] _cylinders
    (apply #'+ (send-all _cylinders :serialization-length)) 4
    ;; vicon_env/Polyhedron[] _polyhedrons
    (apply #'+ (send-all _polyhedrons :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; int32 _mav_id
       (write-long _mav_id s)
     ;; vicon_env/Point3d _mav_pos
       (send _mav_pos :serialize s)
     ;; vicon_env/Ellipse[] _ellipses
     (write-long (length _ellipses) s)
     (dolist (elem _ellipses)
       (send elem :serialize s)
       )
     ;; vicon_env/Circle[] _circles
     (write-long (length _circles) s)
     (dolist (elem _circles)
       (send elem :serialize s)
       )
     ;; vicon_env/Polygon[] _polygons
     (write-long (length _polygons) s)
     (dolist (elem _polygons)
       (send elem :serialize s)
       )
     ;; vicon_env/Cylinder[] _cylinders
     (write-long (length _cylinders) s)
     (dolist (elem _cylinders)
       (send elem :serialize s)
       )
     ;; vicon_env/Polyhedron[] _polyhedrons
     (write-long (length _polyhedrons) s)
     (dolist (elem _polyhedrons)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; int32 _mav_id
     (setq _mav_id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; vicon_env/Point3d _mav_pos
     (send _mav_pos :deserialize buf ptr-) (incf ptr- (send _mav_pos :serialization-length))
   ;; vicon_env/Ellipse[] _ellipses
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ellipses (let (r) (dotimes (i n) (push (instance vicon_env::Ellipse :init) r)) r))
     (dolist (elem- _ellipses)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; vicon_env/Circle[] _circles
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _circles (let (r) (dotimes (i n) (push (instance vicon_env::Circle :init) r)) r))
     (dolist (elem- _circles)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; vicon_env/Polygon[] _polygons
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _polygons (let (r) (dotimes (i n) (push (instance vicon_env::Polygon :init) r)) r))
     (dolist (elem- _polygons)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; vicon_env/Cylinder[] _cylinders
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _cylinders (let (r) (dotimes (i n) (push (instance vicon_env::Cylinder :init) r)) r))
     (dolist (elem- _cylinders)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; vicon_env/Polyhedron[] _polyhedrons
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _polyhedrons (let (r) (dotimes (i n) (push (instance vicon_env::Polyhedron :init) r)) r))
     (dolist (elem- _polyhedrons)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get vicon_env::SemanticArray :md5sum-) "f11c93d4fb77d44a8c5e24f11f9114d5")
(setf (get vicon_env::SemanticArray :datatype-) "vicon_env/SemanticArray")
(setf (get vicon_env::SemanticArray :definition-)
      "std_msgs/Header header
int32 mav_id #-1 for global map, 0 + for the mav_id
Point3d mav_pos

#2d semantics
Ellipse[] ellipses
Circle[]  circles
Polygon[] polygons

#3d semantics
Cylinder[] cylinders
Polyhedron[] polyhedrons

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
MSG: vicon_env/Point3d
float64 x
float64 y
float64 z

================================================================================
MSG: vicon_env/Ellipse
int32 id
Point2d pos
Point2d noise
float64 r #clearance range
float64 a
float64 b
float64 alpha # rotation

================================================================================
MSG: vicon_env/Point2d
float64 x
float64 y

================================================================================
MSG: vicon_env/Circle
int32 id
Point2d pos
Point2d noise
float64 r


================================================================================
MSG: vicon_env/Polygon
int32 id
Point2d pos
Point2d noise
float64 r #clearance range
Point2d[] points
Point2d[] normals #norm is an outer vector

================================================================================
MSG: vicon_env/Cylinder
int32 id
Point2d pos
Point3d noise
float64 r
float64 h

================================================================================
MSG: vicon_env/Polyhedron
int32 id
Point2d[] rps
Point3d noise
float64 r #clearance range
Point3d[] points
Point3d[] normals #norm is an outer vector

")



(provide :vicon_env/SemanticArray "f11c93d4fb77d44a8c5e24f11f9114d5")


