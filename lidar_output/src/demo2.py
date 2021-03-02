#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from time import time
import numpy as np
from motors import Motors

class Demo2:
    def __init__(self):
        self.mc = Motors()
        self.ports = list(range(1, 6))

        while time()<startTime+duration:
                try:
                    #set up motors for raspberry pi
                    self.mc = Motors()
                    self.ports = list(range(1,6))

                    self.read_laser_scan_data()
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
        pMin = self.findPartitionMinima(shiftedImageData, 5, 180)
        minD = 0.5
        maxD = 3
        fbLevels = self.getFeedbackLevels(pMin, minD, maxD)
        levelCount = 6
        tcp_reply = fbLevels
        self.printFeedbackLevels(fbLevels, levelCount)
        print(fbLevels)
        #given the feedback levels, buzzes based on those levels
        self.buzz(fbLevels)


    def read_laser_scan_data(self):

        rospy.Subscriber('scan',LaserScan,self.laser_scan_callback)


    #lidarData is the modified ranges data, partitionCount is the number of partitions,
    #fieldOfView is the horizontal angle range limit
    def findPartitionMinima(self,lidarData, partitionCount, fieldOfView):
        partitionRange = fieldOfView // partitionCount
        partitionBorders = []
        # assumes the front direction is the angle 0
        currentAngle = - (fieldOfView // 2)

        # find partition border angles
        for i in range(partitionCount + 1):
            partitionBorders.append(currentAngle)
            currentAngle += partitionRange

        print("Border angles of partitions: " + str(partitionBorders))

        partitionMinima = []
        for i in range(partitionCount):

            partitionStart = partitionBorders[i]
            partitionEnd = partitionBorders[i + 1]
            partitionData = [0]

            # slice the original data to get current partition, then find the minimum.
            # handles cases when slicedArray[x:y] x is negative and y positive
            if partitionStart < 0 and partitionEnd >= -1:
                if partitionEnd == -1:
                    partitionData = lidarData[partitionStart:]
                else:
                    partitionData = lidarData[partitionStart:] + lidarData[0 : partitionEnd + 1]
            else:
                partitionData = lidarData[partitionStart : partitionEnd + 1]

            partitionMinima.append(min(partitionData))

        return partitionMinima


    def printFeedbackLevels(self,feedbackLevels, levelCount):
        print("----"),
        for fbLevel in range(len(feedbackLevels) - 2):
            print("---"),
        print("----")
        for levelIndex in range(levelCount, 0, -1):
            print("|"),
            for feedbackLevel in feedbackLevels:
                if feedbackLevel > (levelIndex - 1.0) / levelCount:
                    print("X |"),
                else:
                    print("  |"),
            print("")
        print("----"),
        for fbLevel in range(len(feedbackLevels) - 2):
            print("---"),
        print("----")

    def getFeedbackLevels(self,distances, minDistance, maxDistance):
        feedbackLevels = []

        for distance in distances:
            if distance != float("inf") and distance <= maxDistance and distance >= minDistance:
                feedbackLevels.append(1 - ((distance - minDistance) / (maxDistance - minDistance)))
            else:
                # out of range
                feedbackLevels.append(0)

        return feedbackLevels


    def buzz(self,intensities, scheme=None):
        """
    example input:
    intensities is a list of 5 percentage number [0.1,0.7,0.8,1,0.9]
    scheme is a function of [Num] -> [Num] to process intensities
    """
        if scheme:
            # process intensities
            intensities = scheme(intensities)

        #self.mc.stop_motors()
        for port, intensity in zip(self.ports, intensities):
            self.mc.move_motor(port, intensity*100)
            print("Moving motor on port",port)

    def stop(self,mc):
        self.mc.stop_motors()


if __name__ == '__main__':
    rospy.init_node('lidar_scan',anonymous=True)

    #robot currently doesn't move, but code is kept in case we need to test
    #on the move lidar values
    startTime = time()
    duration = 500 #in seconds
    forwardSpeed = 1
    turnSpeed = 1

    demo2 = Demo2()
