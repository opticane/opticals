#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from time import time
import numpy as np
from motors import Motors
import lidarOutputUtils as lOU
from hapticFeedbackUtils import Handle

class Demo2:
    def __init__(self):

        h = Handle()

        while time()<startTime+duration:
            try:
                self.read_laser_scan_data()

                #kept for testing possible moving lidar
                #move_motor(forwardSpeed,turnSpeed)
            except rospy.ROSInterruptException:
                pass
            else:
                #kept for testing possible moving lidar
                #self.move_motor(0,0)
                pass

    def laser_scan_callback(self,data):

        imageData = data.ranges

        #index 0 is the behind whereas front is 179 so needs to shift 179 to be index 0
        shiftedImageData = imageData[179:] + imageData[:179]
        pMin = lOU.findPartitionMinima(shiftedImageData, 5, 180)
        minD = 0.5
        maxD = 3
        fbLevels = lOU.getFeedbackLevels(pMin, minD, maxD)
        levelCount = 6
        tcp_reply = fbLevels

        lOU.printFeedbackLevels(fbLevels, levelCount)
        print(fbLevels)

        #given the feedback levels, buzzes based on those levels
        h.buzz(fbLevels)


    def read_laser_scan_data(self):

        rospy.Subscriber('scan',LaserScan,self.laser_scan_callback)



if __name__ == '__main__':
    rospy.init_node('lidar_scan',anonymous=True)

    #robot currently doesn't move, but code is kept in case we need to test
    #on the move lidar values
    startTime = time()
    duration = 500 #in seconds
    forwardSpeed = 1
    turnSpeed = 1

    demo2 = Demo2()
