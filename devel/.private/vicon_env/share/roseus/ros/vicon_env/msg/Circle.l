;; Auto-generated. Do not edit!


(when (boundp 'vicon_env::Circle)
  (if (not (find-package "VICON_ENV"))
    (make-package "VICON_ENV"))
  (shadow 'Circle (find-package "VICON_ENV")))
(unless (find-package "VICON_ENV::CIRCLE")
  (make-package "VICON_ENV::CIRCLE"))

(in-package "ROS")
;;//! \htmlinclude Circle.msg.html


(defclass vicon_env::Circle
  :super ros::object
  :slots (_id _pos _noise _r ))

(defmethod vicon_env::Circle
  (:init
   (&key
    ((:id __id) 0)
    ((:pos __pos) (instance vicon_env::Point2d :init))
    ((:noise __noise) (instance vicon_env::Point2d :init))
    ((:r __r) 0.0)
    )
   (send-super :init)
   (setq _id (round __id))
   (setq _pos __pos)
   (setq _noise __noise)
   (setq _r (float __r))
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
   ;;
   self)
  )

(setf (get vicon_env::Circle :md5sum-) "f30dbb5c40b813ebac6bbcc3f2845923")
(setf (get vicon_env::Circle :datatype-) "vicon_env/Circle")
(setf (get vicon_env::Circle :definition-)
      "int32 id
Point2d pos
Point2d noise
float64 r


================================================================================
MSG: vicon_env/Point2d
float64 x
float64 y

")



(provide :vicon_env/Circle "f30dbb5c40b813ebac6bbcc3f2845923")


