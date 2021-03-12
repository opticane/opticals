#!/usr/bin/env python
from time import time
from time import sleep
import numpy as np
import servoMotorUtils as sM
import lidarIO as lIO
import lidarDataUtils as lDU

class demo3:
    def __init__(self):

        #for testing how long do we keep the script running, in secs
        duration = 300
        startTime = time()

        #set up LiDAR utils
        lHardware = lidarHardwareUtils()
        self.lidarDataBuffer = [0.0]*180


        while time()<startTime+duration:
            try:
                #move the servo motor, get the readings
                lHardware.get_lidar_data_buffer()

                #pad data to 360 to work with older functions which used 360 degree data input
                lidarDist = lHardware.distances
                lidarDataPadded = lidarDist
                lidarDataPadded.append(lidarDist.reverse())

                #get the lidar data into paritions
                pMin = lData.findPartitionMinima(lidarDataPadded, 5, 180)
                minD = 0.5
                maxD = 3

                #get the feedback levels
                fbLevels = lData.getFeedbackLevels(pMin, minD, maxD)
                levelCount = 6

                lDU.printFeedbackLevels(fbLevels, levelCount)


            except:
                raise Exception("** Error: something went wrong with the LiDAR **")
            else:
                pass
