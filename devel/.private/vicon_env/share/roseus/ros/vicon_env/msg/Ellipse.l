;; Auto-generated. Do not edit!


(when (boundp 'vicon_env::Ellipse)
  (if (not (find-package "VICON_ENV"))
    (make-package "VICON_ENV"))
  (shadow 'Ellipse (find-package "VICON_ENV")))
(unless (find-package "VICON_ENV::ELLIPSE")
  (make-package "VICON_ENV::ELLIPSE"))

(in-package "ROS")
;;//! \htmlinclude Ellipse.msg.html


(defclass vicon_env::Ellipse
  :super ros::object
  :slots (_id _pos _noise _r _a _b _alpha ))

(defmethod vicon_env::Ellipse
  (:init
   (&key
    ((:id __id) 0)
    ((:pos __pos) (instance vicon_env::Point2d :init))
    ((:noise __noise) (instance vicon_env::Point2d :init))
    ((:r __r) 0.0)
    ((:a __a) 0.0)
    ((:b __b) 0.0)
    ((:alpha __alpha) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _pos __pos)
   (setq _noise __noise)
   (setq _r (float __r))
   (setq _a (float __a))
   (setq _b (float __b))
   (setq _alpha (float __alpha))
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
  (:a
   (&optional __a)
   (if __a (setq _a __a)) _a)
  (:b
   (&optional __b)
   (if __b (setq _b __b)) _b)
  (:alpha
   (&optional __alpha)
   (if __alpha (setq _alpha __alpha)) _alpha)
  (:serialization-length
   ()
   (+
    ;; int32 _id
    4
    ;; vicon_env/Point2d _pos
    (send _pos :serialization-length)
    ;; vicon_env/Point2d _noise
    (send _noise :serialization-length)
    ;; float64 _r
    8
    ;; float64 _a
    8
    ;; float64 _b
    8
    ;; float64 _alpha
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
     ;; vicon_env/Point2d _noise
       (send _noise :serialize s)
     ;; float64 _r
       (sys::poke _r (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _a
       (sys::poke _a (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _b
       (sys::poke _b (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;; float64 _alpha
       (sys::poke _alpha (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _id
     (setq _id (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; vicon_env/Point2d _pos
     (send _pos :deserialize buf ptr-) (incf ptr- (send _pos :serialization-length))
   ;; vicon_env/Point2d _noise
     (send _noise :deserialize buf ptr-) (incf ptr- (send _noise :serialization-length))
   ;; float64 _r
     (setq _r (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _a
     (setq _a (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _b
     (setq _b (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;; float64 _alpha
     (setq _alpha (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get vicon_env::Ellipse :md5sum-) "0d9f78b0e58e82ba751d86429f04bc3c")
(setf (get vicon_env::Ellipse :datatype-) "vicon_env/Ellipse")
(setf (get vicon_env::Ellipse :definition-)
      "int32 id
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

")



(provide :vicon_env/Ellipse "0d9f78b0e58e82ba751d86429f04bc3c")


