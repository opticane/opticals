#!/usr/bin/env python
from time import time
from time import sleep
import numpy as np
import servoMotorUtils as sM
import lidarHardwareUtils as lHU
import lidarDataUtils as lDU
import feedbackMotorUtils as fMU

class Demo3:
    def __init__(self):

        #for testing how long do we keep the script running, in secs
        duration = 300
        startTime = time()

        #set up LiDAR utils
        lHardware = lHU.lidarHardwareUtils()
        lidarDist = [0.0]*180


        while time()<startTime+duration:
            #move the servo motor, get the readings
            lHardware.get_lidar_data_buffer()

            #pad data to 360 to work with older functions which used 360 degree data input
            lidarDist = lHardware.distances
            lidarDataPadded = lidarDist
            lidarDataPadded.append(lidarDist.reverse())

            #get the lidar data into paritions
            pMin = lDU.findPartitionMinima(lidarDataPadded, 5, 180)
            print("PMin:",pMin)
            minD = 0.5
            maxD = 4

            #get the feedback levels and vibration levels
            fbLevels = lDU.getFeedbackLevels(pMin, minD, maxD)
            vLevels = lDU.mapFeedbackLevelsToVib(fbLevels)
            #remove last element until it works 
            vLevels = vLevels[0:4]
            levelCount = 6
            print(fbLevels)
            lDU.printFeedbackLevels(fbLevels,levelCount)

            #ouput the vibration levels to the motors
            fMU.multi_vib(vLevels)



if __name__ == '__main__':

    demo3 = Demo3()
