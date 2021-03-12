#!/usr/bin/env python
## servoMotorUtils handles the hardware functions to move the servoMotor with mounted LiDAR  ##
from Phidget22.Phidget import *
from Phidget22.Devices.RCServo import *
from time import time
from time import sleep

class servoMotorUtils:
    def __init__(self):
        #set up servo motor
        self.ch = RCServo()
        self.ch.openWaitForAttachment(5000)

        #gives diff pulse width values for testing
        self.smallMinPW = 1000
        self.smallMaxPW = 1001
        self.wideMinPW = 550
        self.wideMaxPW = 2450


    def testRotation(self):
        startTime = time()
        duration = 300
        self.ch.openWaitForAttachment(5000)
        while True and time()<startTime+duration:
            self.ch.setTargetPosition(0.0)
            self.ch.setEngaged(True)
            self.ch.setTargetPosition(180.0)
            self.ch.setEngaged(True)
            print("** Success: correctly moved motor **")
            self.ch.setTargetPosition(0.0)
            print("** Reset motor position **")

        if self.ch.setTargetPosition == 0.0:
            print("** Sucess: motor in correct position **")
        else:
            print("** Error: motor not in correct position")
        self.ch.close()



    def setMinMaxPos(self,minPos,maxPos):

        #first sets min/max pulse width
        self.ch.setMaxPulseWidth(self.smallMaxPW)
        self.ch.setMinPulseWidth(self.smallMinPW)

        #input validation
        if minPos < 0.0 and minPos > 180.0:
            raise Exception("** Error: Minimum should be between 0 and 180 **")
        if maxPos < 1.0 and maxPos > 360.0:
            raise Exception("** Error: Maximum should be between 1 and 360 **")
        if maxPos < minPos:
            raise Exception("** Error: Maximum should be greater than minimum **")

        self.ch.setMaxPosition(maxPos)
        self.ch.setMinPosition(minPos)

    def moveOneDegreeFrom0(self,currentPosition):
        #check currentPosition is actually the current position
        self.ch.openWaitForAttachment(5000)
        self.ch.setTargetPosition((currentPosition + 1.0))
        self.ch.setEngaged(True)
        sleep(0.01)

    def moveOneDegreeTo0(self,currentPosition):
        #check currentPosition is actually the current position
        self.ch.openWaitForAttachment(5000)
        self.ch.setTargetPosition((currentPosition - 1.0))
        self.ch.setEngaged(True)
        sleep(0.01)

    def closeServoMotor(self):
        self.ch.close()



if __name__ == "__main__":

    sM = servoMotorUtils()
    #sM.testRotation()
