#!/usr/bin/env python

import rospy
from detect.msg import MovementInformation

# if no faces detected in ~3 seconds, start scanning
# movement should focus on rectifying left-right deltas first, and then up-down deltas
import serial
import time

port = serial.Serial('/dev/ttyACM0', 9600, timeout=1)
print("-----------------------------------------------------")
print("Communications online on " + port.name)


def callback(message):

    lateral = message.instructions[0]
    vertical = message.instructions[1]

    if lateral != 0:
        packet = "0 " + str(lateral) + "!"
        port.write(packet.encode())
    elif vertical != 0:
        packet = "1 " + str(vertical) + "!"
        port.write(packet.encode())
    
    print("-----------------")
    rospy.sleep(0.5)



def listener():
    rospy.Subscriber('movement', MovementInformation, callback, queue_size=1)

    # exits with ctrl-c
    rospy.spin()

rospy.init_node('actuate')
listener()