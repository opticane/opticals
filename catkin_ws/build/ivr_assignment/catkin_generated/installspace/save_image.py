#!/usr/bin/env python3

import sys
import rospy
import cv2 as cv

from rospy import ROSInterruptException
from cv_bridge import CvBridge, CvBridgeError
from sensor_msgs.msg import Image


class SaveImage:

    def __init__(self, topic, file='image.png'):
        # Initialize the node
        rospy.init_node('save_image')

        # Initialize the bridge between openCV and ROS
        self.bridge = CvBridge()

        # Create get message
        self.image_msg = rospy.wait_for_message(topic, Image)

        try:
            self.image = self.bridge.imgmsg_to_cv2(self.image_msg, "bgr8")
        except CvBridgeError as e:
            print(e)

        cv.imwrite(file, self.image)


def main(args):
    print(args)
    if len(args) == 3:
        _ = SaveImage(args[1], args[2])
    elif len(args) == 2:
        _ = SaveImage(args[1])
    else:
        raise Exception("Invalid command line arguments.")


if __name__ == "__main__":
    main(sys.argv)
