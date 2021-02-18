#!/usr/bin/env python
import rospy
from geometry_msgs.msg import Twist
from sensor_msgs.msg import LaserScan
from time import time
from std_msgs.msg import String
from std_msgs.msg import Float64MultiArray, Float64
import numpy as np
import random


class dummy_lidar:

    def __init__(self):
        #initialize the node named dummy_lidar
        rospy.init_node('dummy_lidar', anonymous=True)
        #initialize a publisher to send an array of floats (lidar data) to a topic named dummy_lidar_data
        self.lidar_pub = rospy.Publisher("dummy_lidar_data",Float64MultiArray, queue_size = 10)
        #this subscriber takes in a float 1, from the lidar_scan which tells this file to keep publishing dummy lidar data
        self.lidar_sub  = rospy.Subscriber("connect_ok", connect_msg, self.callback)
        

    def callback(self):
        dummy_l_data = self.create_lidar_data()

        #converts dummy data to Float64MultiArray
        fl64_l_data = Float64MultiArray(data= dumm_l_data)
        #publishes it
        self.lidar_pub.publish(fl64_l_data)


    def create_lidar_data(self):
        dl_data = [float("inf")]*360

        #creates a random index no between 179 and 360 where dummy data will be placed between +2 -2 indices
        movingIndex =  random.randint
        rand_values = [random.uniform(0.12,2.5) for _ in range(5)]

        #adds float values to dummy data list
        dl_data[(movingIndex -2):(movingIndex +2)] = rand_values
        return dl_data














# call the class
def main(args):
  dl = dummy_lidar()
  try:
    rospy.spin()
  except KeyboardInterrupt:
    print("Shutting down")
  cv2.destroyAllWindows()


# run the code if the node is called
if __name__ == '__main__':
    main(sys.argv)
