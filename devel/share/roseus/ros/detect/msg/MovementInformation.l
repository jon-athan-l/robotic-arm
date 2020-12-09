;; Auto-generated. Do not edit!


(when (boundp 'detect::MovementInformation)
  (if (not (find-package "DETECT"))
    (make-package "DETECT"))
  (shadow 'MovementInformation (find-package "DETECT")))
(unless (find-package "DETECT::MOVEMENTINFORMATION")
  (make-package "DETECT::MOVEMENTINFORMATION"))

(in-package "ROS")
;;//! \htmlinclude MovementInformation.msg.html


(defclass detect::MovementInformation
  :super ros::object
  :slots (_instructions ))

(defmethod detect::MovementInformation
  (:init
   (&key
    ((:instructions __instructions) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _instructions __instructions)
   self)
  (:instructions
   (&optional __instructions)
   (if __instructions (setq _instructions __instructions)) _instructions)
  (:serialization-length
   ()
   (+
    ;; int16[] _instructions
    (* 2    (length _instructions)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int16[] _instructions
     (write-long (length _instructions) s)
     (dotimes (i (length _instructions))
       (write-word (elt _instructions i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int16[] _instructions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _instructions (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _instructions i) (sys::peek buf ptr- :short)) (incf ptr- 2)
     ))
   ;;
   self)
  )

(setf (get detect::MovementInformation :md5sum-) "1a0b30a1eb7df94a9b605a7470fc6ff9")
(setf (get detect::MovementInformation :datatype-) "detect/MovementInformation")
(setf (get detect::MovementInformation :definition-)
      "int16[] instructions
")



(provide :detect/MovementInformation "1a0b30a1eb7df94a9b605a7470fc6ff9")


