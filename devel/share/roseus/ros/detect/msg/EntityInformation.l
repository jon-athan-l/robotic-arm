;; Auto-generated. Do not edit!


(when (boundp 'detect::EntityInformation)
  (if (not (find-package "DETECT"))
    (make-package "DETECT"))
  (shadow 'EntityInformation (find-package "DETECT")))
(unless (find-package "DETECT::ENTITYINFORMATION")
  (make-package "DETECT::ENTITYINFORMATION"))

(in-package "ROS")
;;//! \htmlinclude EntityInformation.msg.html


(defclass detect::EntityInformation
  :super ros::object
  :slots (_centerPoint _generalizedEntityPoint ))

(defmethod detect::EntityInformation
  (:init
   (&key
    ((:centerPoint __centerPoint) (make-array 2 :initial-element 0 :element-type :integer))
    ((:generalizedEntityPoint __generalizedEntityPoint) (make-array 2 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _centerPoint __centerPoint)
   (setq _generalizedEntityPoint __generalizedEntityPoint)
   self)
  (:centerPoint
   (&optional __centerPoint)
   (if __centerPoint (setq _centerPoint __centerPoint)) _centerPoint)
  (:generalizedEntityPoint
   (&optional __generalizedEntityPoint)
   (if __generalizedEntityPoint (setq _generalizedEntityPoint __generalizedEntityPoint)) _generalizedEntityPoint)
  (:serialization-length
   ()
   (+
    ;; int16[2] _centerPoint
    (* 2    2)
    ;; int16[2] _generalizedEntityPoint
    (* 2    2)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16[2] _centerPoint
     (dotimes (i 2)
       (write-word (elt _centerPoint i) s)
       )
     ;; int16[2] _generalizedEntityPoint
     (dotimes (i 2)
       (write-word (elt _generalizedEntityPoint i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16[2] _centerPoint
   (dotimes (i (length _centerPoint))
     (setf (elt _centerPoint i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;; int16[2] _generalizedEntityPoint
   (dotimes (i (length _generalizedEntityPoint))
     (setf (elt _generalizedEntityPoint i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     )
   ;;
   self)
  )

(setf (get detect::EntityInformation :md5sum-) "4d47ff85ed47785b133aaf336fe6729d")
(setf (get detect::EntityInformation :datatype-) "detect/EntityInformation")
(setf (get detect::EntityInformation :definition-)
      "int16[2] centerPoint
int16[2] generalizedEntityPoint


")



(provide :detect/EntityInformation "4d47ff85ed47785b133aaf336fe6729d")


