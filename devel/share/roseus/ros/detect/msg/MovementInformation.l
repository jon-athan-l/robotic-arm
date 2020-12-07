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
    ((:instructions __instructions) (let (r) (dotimes (i 0) (push "" r)) r))
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
    ;; string[] _instructions
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _instructions)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _instructions
     (write-long (length _instructions) s)
     (dolist (elem _instructions)
       (write-long (length elem) s) (princ elem s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _instructions
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _instructions (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _instructions i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;;
   self)
  )

(setf (get detect::MovementInformation :md5sum-) "3443f8de2c3446cc5ba0afaf4348ee72")
(setf (get detect::MovementInformation :datatype-) "detect/MovementInformation")
(setf (get detect::MovementInformation :definition-)
      "string[] instructions
")



(provide :detect/MovementInformation "3443f8de2c3446cc5ba0afaf4348ee72")


