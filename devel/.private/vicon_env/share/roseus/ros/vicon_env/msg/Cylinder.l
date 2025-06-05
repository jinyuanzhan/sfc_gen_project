;; Auto-generated. Do not edit!


(when (boundp 'vicon_env::Cylinder)
  (if (not (find-package "VICON_ENV"))
    (make-package "VICON_ENV"))
  (shadow 'Cylinder (find-package "VICON_ENV")))
(unless (find-package "VICON_ENV::CYLINDER")
  (make-package "VICON_ENV::CYLINDER"))

(in-package "ROS")
;;//! \htmlinclude Cylinder.msg.html


(defclass vicon_env::Cylinder
  :super ros::object
  :slots (_id _pos _noise _r _h ))

(defmethod vicon_env::Cylinder
  (:init
   (&key
    ((:id __id) 0)
    ((:pos __pos) (instance vicon_env::Point2d :init))
    ((:noise __noise) (instance vicon_env::Point3d :init))
    ((:r __r) 0.0)
    ((:h __h) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _pos __pos)
   (setq _noise __noise)
   (setq _r (float __r))
   (setq _h (float __h))
   self)
  (:id
   (&optional __id)
   (if __id (setq _id __id)) _id)
  (:pos
   (&rest __pos)
   (if (keywordp (car __pos))
       (send* _pos __pos)
     (progn
       (if __pos (setq _pos (car __pos)))
       _pos)))
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
  (:h
   (&optional __h)
   (if __h (setq _h __h)) _h)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; vicon_env/Point2d _pos
    (send _pos :serialization-length)
    ;; vicon_env/Point3d _noise
    (send _noise :serialization-length)
    ;; float64 _r
    8
    ;; float64 _h
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _id
       (write-long _id s)
     ;; vicon_env/Point2d _pos
       (send _pos :serialize s)
     ;; vicon_env/Point3d _noise
       (send _noise :serialize s)
     ;; float64 _r
       (sys::poke _r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _h
       (sys::poke _h (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; vicon_env/Point2d _pos
     (send _pos :deserialize buf ptr-) (incf ptr- (send _pos :serialization-length))
   ;; vicon_env/Point3d _noise
     (send _noise :deserialize buf ptr-) (incf ptr- (send _noise :serialization-length))
   ;; float64 _r
     (setq _r (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _h
     (setq _h (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get vicon_env::Cylinder :md5sum-) "a61dd680941510aadadfbb73b1ffec95")
(setf (get vicon_env::Cylinder :datatype-) "vicon_env/Cylinder")
(setf (get vicon_env::Cylinder :definition-)
      "int32 id
Point2d pos
Point3d noise
float64 r
float64 h

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



(provide :vicon_env/Cylinder "a61dd680941510aadadfbb73b1ffec95")


