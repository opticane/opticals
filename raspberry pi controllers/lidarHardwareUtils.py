#!/usr/bin/env python
## lidarHardwareUtils handles the hardware input of TF LiDAR extracting the byte information to get dist measurements  ##
from time import time
from time import sleep
import numpy as np
import servoMotorUtils as sM
from smbus2 import SMBus, i2c_msg

class lidarHardwareUtils:
    def __init__(self):

        #address of LiDAR attachment
        self.address = 0x10


        self.distances = [0.0]*180

        #intialise servo motor
        self.servoM = sM.servoMotorUtils()






    #get buffer or list of distance data for 180 degrees
    def get_lidar_data_buffer(self):
        #reset to 0
        self.servoM.ch.setTargetPosition(0.0)
        self.servoM.ch.setEngaged(True)
        sleep(0.01)

        currentDegree = 0.0
        expectedDegree = 1.0


        for i in range(len(self.distances)):
            #read lidar
            self.distances[i] = self.read_lidar_data()
            degree = float(i)
            self.servoM.moveOneDegreeFrom0(degree)
            #read lidar
        print(self.distances)


    def read_lidar_data(self):

        #need first 8 bytes as bytes 2,3 (from 0) have distance info
        bytesRead = 11
        #read in with smbus then close bus
        bus = SMBus(1)
        distL = bus.read_byte_data(self.address, 0x00)
        distH = bus.read_byte_data(self.address, 0x01)

        #check first two bytes to ensure correct data is coming in
        #distance value low in first byte, distance value high in second
        #divide by 100 to get into m (from cm)
        lidarDist = (distL + 256*distH)
        #close bus once all data received
        bus.close()
        #convert to m
        return float(lidarDist)/100



    def test_lidar_data(self):
        #read in with smbus then close bus
        bus = SMBus(1)
        distL = bus.read_byte_data(self.address, 0x00)
        distH = bus.read_byte_data(self.address, 0x01)
        print("First distL:", distL)
        print("First distH:", distH)
        bus.close()

        bus = SMBus(1)
        distL = bus.read_byte_data(self.address, 0x00)
        distH = bus.read_byte_data(self.address, 0x01)
        print("Second distL:", distL)
        print("Second  distH:", distH)
        bus.close()









if __name__ == "__main__":

    l = lidarHardwareUtils()
    #l.test_lidar_data()
    l.get_lidar_data_buffer()
