;; Auto-generated. Do not edit!


(when (boundp 'vicon_env::Polyhedron)
  (if (not (find-package "VICON_ENV"))
    (make-package "VICON_ENV"))
  (shadow 'Polyhedron (find-package "VICON_ENV")))
(unless (find-package "VICON_ENV::POLYHEDRON")
  (make-package "VICON_ENV::POLYHEDRON"))

(in-package "ROS")
;;//! \htmlinclude Polyhedron.msg.html


(defclass vicon_env::Polyhedron
  :super ros::object
  :slots (_id _rps _noise _r _points _normals ))

(defmethod vicon_env::Polyhedron
  (:init
   (&key
    ((:id __id) 0)
    ((:rps __rps) ())
    ((:noise __noise) (instance vicon_env::Point3d :init))
    ((:r __r) 0.0)
    ((:points __points) ())
    ((:normals __normals) ())
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _rps __rps)
   (setq _noise __noise)
   (setq _r (float __r))
   (setq _points __points)
   (setq _normals __normals)
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:rps
   (&rest __rps)
   (if (keywordp (car __rps))
       (send* _rps __rps)
     (progn
       (if __rps (setq _rps (car __rps)))
       _rps)))
  (:noise
   (&rest __noise)
   (if (keywordp (car __noise))
       (send* _noise __noise)
     (progn
       (if __noise (setq _noise (car __noise)))
       _noise)))
  (:r
   (&optional __r)
   (if __r (setq _r __r)) _r)
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:normals
   (&rest __normals)
   (if (keywordp (car __normals))
       (send* _normals __normals)
     (progn
       (if __normals (setq _normals (car __normals)))
       _normals)))
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; vicon_env/Point2d[] _rps
    (apply #'+ (send-all _rps :serialization-length)) 4
    ;; vicon_env/Point3d _noise
    (send _noise :serialization-length)
    ;; float64 _r
    8
    ;; vicon_env/Point3d[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ;; vicon_env/Point3d[] _normals
    (apply #'+ (send-all _normals :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; vicon_env/Point2d[] _rps
     (write-long (length _rps) s)
     (dolist (elem _rps)
       (send elem :serialize s)
       )
     ;; vicon_env/Point3d _noise
       (send _noise :serialize s)
     ;; float64 _r
       (sys::poke _r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; vicon_env/Point3d[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;; vicon_env/Point3d[] _normals
     (write-long (length _normals) s)
     (dolist (elem _normals)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; vicon_env/Point2d[] _rps
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _rps (let (r) (dotimes (i n) (push (instance vicon_env::Point2d :init) r)) r))
     (dolist (elem- _rps)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; vicon_env/Point3d _noise
     (send _noise :deserialize buf ptr-) (incf ptr- (send _noise :serialization-length))
   ;; float64 _r
     (setq _r (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; vicon_env/Point3d[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance vicon_env::Point3d :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; vicon_env/Point3d[] _normals
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _normals (let (r) (dotimes (i n) (push (instance vicon_env::Point3d :init) r)) r))
     (dolist (elem- _normals)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get vicon_env::Polyhedron :md5sum-) "4e4035e4e6d87b6937718889da241e8b")
(setf (get vicon_env::Polyhedron :datatype-) "vicon_env/Polyhedron")
(setf (get vicon_env::Polyhedron :definition-)
      "int32 id
Point2d[] rps
Point3d noise
float64 r #clearance range
Point3d[] points
Point3d[] normals #norm is an outer vector

================================================================================
MSG: vicon_env/Point2d
float64 x
float64 y

================================================================================
MSG: vicon_env/Point3d
float64 x
float64 y
float64 z

")



(provide :vicon_env/Polyhedron "4e4035e4e6d87b6937718889da241e8b")


