#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from time import time
import numpy as np

def laser_scan_callback(data):

    imageData = data.ranges
    #index 0 is the behind whereas front is 179 so needs to shift 179 to be index 0
    shiftedImageData = imageData[179:] + imageData[:179]

    partitionMinima = find_parition_minima(shiftedImageData,10, 270)


    #print 5 feedback levels for the 5 motors on the cane
    feedbackLevels  = get_feedback_levels(partitionMinima, 0.12, 1)

    #LDS-01 of 0,12-1m
    print_feedback_levels(feedbackLevels, 5)


def dummy_data_callback(data):

    imageData = data.data
    #index 0 is the behind whereas front is 179 so needs to shift 179 to be index 0
    shiftedImageData = imageData[179:] + imageData[:179]

    partitionMinima = find_parition_minima(shiftedImageData,10, 270)


    #print 5 feedback levels for the 5 motors on the cane
    feedbackLevels  = get_feedback_levels(partitionMinima, 0.12, 1)

    #LDS-01 of 0,12-1m
    print_feedback_levels(feedbackLevels, 5)


def read_laser_scan_data():

    #rospy.Subscriber('scan',LaserScan,laser_scan_callback)

    ###comment out when not using dummy data
    ropsy.Subscriber('dummy_lidar_data',Float64MultiArray,dummy_data_callback)
    ###

def move_motor(fwd,ang):
    pub = rospy.Publisher('cmd_vel',Twist,queue_size = 10)
    mc = Twist()
    mc.linear.x = fwd
    mc.angular.z = ang
    pub.publish(mc)

#lidarData is the modified ranges data, partitionCount is the number of partitions,
#fieldOfView is the horizontal angle range limit
def find_parition_minima(lidarData, partitionCount, fieldOfView):
    partitionRange = fieldOfView // partitionCount
    partitionBorders = []

    #front direction is angle 0
    currentAngle = - (fieldOfView //2)

    for i in range(partitionCount +1):
        partitionBorders.append(currentAngle)
        currentAngle += partitionRange

    print("Border angles of partitions: " + str(partitionBorders))
    partitionMinima = []

    for i in range(partitionCount):

        partitionStart = partitionBorders[i]
        partitionEnd = partitionBorders[i + 1]
        paritionData = [0]

        if partitionStart < 0 and partitionEnd >= -1:
            if partitionEnd == -1:
                partitionData = lidarData[partitionStart:]

            else:
                partitionData = lidarData[partitionStart:] + lidarData[0 : partitionEnd + 1]
        else:
            partitionData = lidarData[partitionStart : partitionEnd + 1]

        partitionMinima.append(min(partitionData))

    return partitionMinima

def get_feedback_levels(distances, minDistance, maxDistance):
    feedbackLevels = []

    for dist in distances:
        if dist != float("inf") and dist <= maxDistance and dist >= minDistance:
            feedbackLevels = (1- (distance - minDistance) / (maxDistance - minDistance))
        else:
            #out of range
            feedbackLevels.append(0)
    return feedbackLevels

def print_feedback_levels(feedbackLevels, levelCount):

    for fbLevel in feedbackLevels:
        print("-----", end="")
    print("-")
    for levelIndex in range(levelCount, 0, -1):
        print("|", end="")
        for fdLevel in feedbackLevels:
            if feedbackLevel > (levelIndex -1)/ levelCount:
                print("X", end="|")
            else:
                print(" ", end="|")
        print()
    for fbLevel in feedbackLevels:
        print("-----", end="")
    print("-")




if __name__ == '__main__':
    rospy.init_node('example_script',anonymous=True)

    startTime = time()
    duration = 5 #in seconds
    forwardSpeed = 1
    turnSpeed = 1

    #set up ros publisher to connect to dummy_lidar_data
    connect_msg = rospy.Publisher("connection_ok",Float64, queue_size = 10)


    while time()<startTime+duration:
        try:
            ###comment out when not using dummy data
            #sends connection msg to dummy_lidar_data to tell it to start sending data
            connect_msg.publish(np.float64(1))

            ###
            read_laser_scan_data()
            move_motor(forwardSpeed,turnSpeed)
        except rospy.ROSInterruptException:
            pass
        else:
            move_motor(0,0)
