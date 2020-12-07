; Auto-generated. Do not edit!


(cl:in-package detect-msg)


;//! \htmlinclude EntityInformation.msg.html

(cl:defclass <EntityInformation> (roslisp-msg-protocol:ros-message)
  ((centerPoint
    :reader centerPoint
    :initarg :centerPoint
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0))
   (generalizedEntityPoint
    :reader generalizedEntityPoint
    :initarg :generalizedEntityPoint
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 2 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass EntityInformation (<EntityInformation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <EntityInformation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'EntityInformation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name detect-msg:<EntityInformation> is deprecated: use detect-msg:EntityInformation instead.")))

(cl:ensure-generic-function 'centerPoint-val :lambda-list '(m))
(cl:defmethod centerPoint-val ((m <EntityInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader detect-msg:centerPoint-val is deprecated.  Use detect-msg:centerPoint instead.")
  (centerPoint m))

(cl:ensure-generic-function 'generalizedEntityPoint-val :lambda-list '(m))
(cl:defmethod generalizedEntityPoint-val ((m <EntityInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader detect-msg:generalizedEntityPoint-val is deprecated.  Use detect-msg:generalizedEntityPoint instead.")
  (generalizedEntityPoint m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <EntityInformation>) ostream)
  "Serializes a message object of type '<EntityInformation>"
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'centerPoint))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'generalizedEntityPoint))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <EntityInformation>) istream)
  "Deserializes a message object of type '<EntityInformation>"
  (cl:setf (cl:slot-value msg 'centerPoint) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'centerPoint)))
    (cl:dotimes (i 2)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))))
  (cl:setf (cl:slot-value msg 'generalizedEntityPoint) (cl:make-array 2))
  (cl:let ((vals (cl:slot-value msg 'generalizedEntityPoint)))
    (cl:dotimes (i 2)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<EntityInformation>)))
  "Returns string type for a message object of type '<EntityInformation>"
  "detect/EntityInformation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'EntityInformation)))
  "Returns string type for a message object of type 'EntityInformation"
  "detect/EntityInformation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<EntityInformation>)))
  "Returns md5sum for a message object of type '<EntityInformation>"
  "4d47ff85ed47785b133aaf336fe6729d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'EntityInformation)))
  "Returns md5sum for a message object of type 'EntityInformation"
  "4d47ff85ed47785b133aaf336fe6729d")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<EntityInformation>)))
  "Returns full string definition for message of type '<EntityInformation>"
  (cl:format cl:nil "int16[2] centerPoint~%int16[2] generalizedEntityPoint~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'EntityInformation)))
  "Returns full string definition for message of type 'EntityInformation"
  (cl:format cl:nil "int16[2] centerPoint~%int16[2] generalizedEntityPoint~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <EntityInformation>))
  (cl:+ 0
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'centerPoint) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
     0 (cl:reduce #'cl:+ (cl:slot-value msg 'generalizedEntityPoint) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <EntityInformation>))
  "Converts a ROS message object to a list"
  (cl:list 'EntityInformation
    (cl:cons ':centerPoint (centerPoint msg))
    (cl:cons ':generalizedEntityPoint (generalizedEntityPoint msg))
))
