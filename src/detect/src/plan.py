#!/usr/bin/env python

import rospy
from detect.msg import EntityInformation, MovementInformation

# how lenient the locked-on range is, otherwise causes oscillations around the point due to lag
buffer = 50

def callback(message):
    packet = ["stay", "stay"]
    # if delta_x is negative, the arm needs to pan right
    delta_x = message.centerPoint[0] - message.generalizedEntityPoint[0]

    # if delta_y is negative, the arm needs to pan down
    delta_y = message.centerPoint[1] - message.generalizedEntityPoint[1]

    if abs(delta_x) > buffer:
        if delta_x < 0:
            packet[0] = "right"
        else:
            packet[0] = "left"
    
    if abs(delta_y) > buffer:
        if delta_y < 0:
            packet[1] = "down"
        else:
            packet[1] = "up"
    
    pub.publish(MovementInformation([packet[0], packet[1]]))



def listener():
    rospy.Subscriber('entities', EntityInformation, callback)

    # exits with ctrl-c
    rospy.spin()

rospy.init_node('plan')
pub = rospy.Publisher('movement', MovementInformation, queue_size = 1)
listener()