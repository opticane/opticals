from time import time
from time import sleep
import numpy as np
import lidarHardwareUtils as lHU
import lidarDataUtils as lDU
import feedbackMotorsUtils as fMU

class Demo3:
    def __init__(self):

        #set up LiDAR utils
        lHardware = lHU.lidarHardwareUtils()
        lidarDist = [0.0]*180

        #loop infinitely 
        while True:
            #move the servo motor, get the readings
            lHardware.get_lidar_data_buffer()

            #pad data to 360 to work with older functions which used 360 degree data input
            lidarDist = lHardware.distances
            lidarDataPadded = lidarDist
            lidarDataPadded.append(lidarDist.reverse())

            #get the lidar data into paritions
            pMin = lDU.findPartitionMinima(lidarDataPadded, 5, 180)
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
