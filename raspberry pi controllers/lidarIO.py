#!/usr/bin/env python
import serial
from time import time
import numpy as np

class lidarIO:
    def __init(self):
        #get the lidar which is connected to pi's mini uart port
        ser = serial.Serial("/dev/serial0", 115200,timeout=0)

        self.distances = [0.0]*180

    #get buffer or list of distance data for 180 degrees
    def get_lidar_data_buffer(self):

        if ser.isOpen() == False:
            #open port if not open already
            ser.open()

        for i in range(len(self.distances)):
            #move motor
            ##
            #   insert code to move motor here
            ##
            self.distances[i] = self.read_lidar_data()

        #close port once data received
        ser.close()


    def read_lidar_data(self):

        #counts the number of bytes waiting to be read
        counter = ser.in_waiting
        #need first 4 bytes as bytes 3,4 have distance info
        bytesRead = 4
        if counter > (bytesRead-1):
            #read in the data then reset the buffer
            inputBytes = ser.read(bytesRead)
            ser.reset_input_buffer()

            #check first two bytes to ensure correct data is coming in
            if inputBytes[0] == 0x59 and inputBytes[1] == 0x59:
                #distance value low in first byte, distance value high in second
                lidarDist = inputBytes[2] + 256*inputBytes[3]
                return lidarDist
            else:
                print("** Error: LiDAR data incorrect **")
                return 0.0






if __name__ == "__main__":

    l = lidarIO()
