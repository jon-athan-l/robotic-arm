; Auto-generated. Do not edit!


(cl:in-package detect-msg)


;//! \htmlinclude MovementInformation.msg.html

(cl:defclass <MovementInformation> (roslisp-msg-protocol:ros-message)
  ((instructions
    :reader instructions
    :initarg :instructions
    :type (cl:vector cl:fixnum)
   :initform (cl:make-array 0 :element-type 'cl:fixnum :initial-element 0)))
)

(cl:defclass MovementInformation (<MovementInformation>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MovementInformation>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MovementInformation)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name detect-msg:<MovementInformation> is deprecated: use detect-msg:MovementInformation instead.")))

(cl:ensure-generic-function 'instructions-val :lambda-list '(m))
(cl:defmethod instructions-val ((m <MovementInformation>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader detect-msg:instructions-val is deprecated.  Use detect-msg:instructions instead.")
  (instructions m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MovementInformation>) ostream)
  "Serializes a message object of type '<MovementInformation>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'instructions))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 65536) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    ))
   (cl:slot-value msg 'instructions))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MovementInformation>) istream)
  "Deserializes a message object of type '<MovementInformation>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'instructions) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'instructions)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 32768) unsigned (cl:- unsigned 65536)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MovementInformation>)))
  "Returns string type for a message object of type '<MovementInformation>"
  "detect/MovementInformation")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MovementInformation)))
  "Returns string type for a message object of type 'MovementInformation"
  "detect/MovementInformation")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MovementInformation>)))
  "Returns md5sum for a message object of type '<MovementInformation>"
  "1a0b30a1eb7df94a9b605a7470fc6ff9")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MovementInformation)))
  "Returns md5sum for a message object of type 'MovementInformation"
  "1a0b30a1eb7df94a9b605a7470fc6ff9")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MovementInformation>)))
  "Returns full string definition for message of type '<MovementInformation>"
  (cl:format cl:nil "int16[] instructions~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MovementInformation)))
  "Returns full string definition for message of type 'MovementInformation"
  (cl:format cl:nil "int16[] instructions~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MovementInformation>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'instructions) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 2)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MovementInformation>))
  "Converts a ROS message object to a list"
  (cl:list 'MovementInformation
    (cl:cons ':instructions (instructions msg))
))
