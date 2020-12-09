#!/usr/bin/env python

import rospy
from detect.msg import EntityInformation, MovementInformation

# how lenient the locked-on range is, otherwise causes oscillations around the point due to lag
buffer = 200

def callback(message):
    # initialize packet to some arbitrary value
    packet = [0, 0]
    # if delta_x is negative, the arm needs to pan right
    delta_x = message.centerPoint[0] - message.generalizedEntityPoint[0]

    # if delta_y is negative, the arm needs to pan down
    delta_y = message.centerPoint[1] - message.generalizedEntityPoint[1]

    if abs(delta_x) > buffer:
        packet[0] = delta_x
    
    if abs(delta_y) > buffer:
        packet[1] = delta_y
    
    pub.publish(MovementInformation([packet[0], packet[1]]))



def listener():
    rospy.Subscriber('entities', EntityInformation, callback)

    # exits with ctrl-c
    rospy.spin()

rospy.init_node('plan')
pub = rospy.Publisher('movement', MovementInformation, queue_size = 1)
listener()