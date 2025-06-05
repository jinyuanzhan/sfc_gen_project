
(cl:in-package :asdf)

(defsystem "vicon_env-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :std_msgs-msg
)
  :components ((:file "_package")
    (:file "Circle" :depends-on ("_package_Circle"))
    (:file "_package_Circle" :depends-on ("_package"))
    (:file "Cylinder" :depends-on ("_package_Cylinder"))
    (:file "_package_Cylinder" :depends-on ("_package"))
    (:file "Ellipse" :depends-on ("_package_Ellipse"))
    (:file "_package_Ellipse" :depends-on ("_package"))
    (:file "Point2d" :depends-on ("_package_Point2d"))
    (:file "_package_Point2d" :depends-on ("_package"))
    (:file "Point3d" :depends-on ("_package_Point3d"))
    (:file "_package_Point3d" :depends-on ("_package"))
    (:file "Polygon" :depends-on ("_package_Polygon"))
    (:file "_package_Polygon" :depends-on ("_package"))
    (:file "Polyhedron" :depends-on ("_package_Polyhedron"))
    (:file "_package_Polyhedron" :depends-on ("_package"))
    (:file "SemanticArray" :depends-on ("_package_SemanticArray"))
    (:file "_package_SemanticArray" :depends-on ("_package"))
  ))