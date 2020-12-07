#!/usr/bin/env python
import numpy as np 
import cv2

import rospy
from detect.msg import EntityInformation

faceCascade = cv2.CascadeClassifier('/home/jbl/projects/arm/src/detect/src/classification-data/haarcascade_frontalface_default.xml')
bodyCascade = cv2.CascadeClassifier('/home/jbl/projects/arm/src/detect/src/classification-data/haarcascade_upperbody.xml')
profileCascade = cv2.CascadeClassifier('/home/jbl/projects/arm/src/detect/src/classification-data/haarcascade_profileface.xml')
capture = cv2.VideoCapture(0)
capture.set(3, 640)
capture.set(4, 480)

# debug output for more info
debug = False

# create ROS node and publisher
rospy.init_node('sense')
pub = rospy.Publisher('entities', EntityInformation, queue_size = 10)

while not rospy.is_shutdown():
    ret, image = capture.read()
    if ret:
        gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)

        # maintain general midpoint of all detected faces in frame
        sum_midpoint_x = 0
        sum_midpoint_y = 0
        faces_detected = 0

        # face classification
        faces = faceCascade.detectMultiScale(
            gray,
            scaleFactor=1.5,
            minNeighbors=5,
            minSize = (20, 20)
        )
        for x,y,w,h in faces:
            midpoint_x = x + int(w/2)
            midpoint_y = y + int(h/2)
            if debug:
                cv2.rectangle(image,(midpoint_x - 2, midpoint_y - 2),(midpoint_x + 2, midpoint_y + 2),(255,0,0),2)
                cv2.rectangle(image,(x,y),(x+w,y+h),(255,0,0),2)
            roi_gray = gray[y:y+h, x:x+w]
            roi_color = image[y:y+h, x:x+w]

            # update general midpoint
            sum_midpoint_x += midpoint_x
            sum_midpoint_y += midpoint_y
            faces_detected += 1
              
    
        # profile face classification
        profiles = profileCascade.detectMultiScale(
            gray,
            scaleFactor=1.2,
            minNeighbors=8,
            minSize = (20, 20)
        )
        for x,y,w,h in profiles:
            midpoint_x = x + int(w/2)
            midpoint_y = y + int(h/2)
            if debug:
                cv2.rectangle(image,(midpoint_x - 2, midpoint_y - 2),(midpoint_x + 2, midpoint_y + 2),(0,0,255),2)
                cv2.rectangle(image,(x,y),(x+w,y+h),(0,0,255),2)
            roi_gray = gray[y:y+h, x:x+w]
            roi_color = image[y:y+h, x:x+w]  

            # update general midpoint
            sum_midpoint_x += midpoint_x
            sum_midpoint_y += midpoint_y
            faces_detected += 1
        
        if faces_detected != 0:
            average_midpoint_x = int(sum_midpoint_x/faces_detected)
            average_midpoint_y = int(sum_midpoint_y/faces_detected)

            # center point
            center_x = int(image.shape[1] / 2)
            center_y = int(image.shape[0] / 2)
            cv2.rectangle(image,(average_midpoint_x - 2, average_midpoint_y - 2),(average_midpoint_x + 2, average_midpoint_y + 2),(0,255,0),2)
            cv2.arrowedLine(image, (average_midpoint_x, average_midpoint_y), (center_x, center_y), (0, 255, 0))

            # publish information to ROS topic /entities
            packet = EntityInformation([center_x, center_y], [average_midpoint_x, average_midpoint_y])
            pub.publish(packet)
            if debug:
                print(packet)
        cv2.imshow('Video output - end effector frame', image)
    else:
        print("Capture is not available.")

    # Adds a KeyboardInterrupt
    interrupt = cv2.waitKey(30) * 0xff
    if interrupt == 27:
        break

capture.release()
cv2.destroyAllWindows()