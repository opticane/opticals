#!/usr/bin/env python
from Phidget22.Phidget import *
from Phidget22.Devices.RCServo import *

class servoMotorUtils:
    def __init__(self):
        #set up servo motor
        self.ch = RCServo()
        self.ch.openWaitForAttachment(1000)

        #gives diff pulse width values for testing
        self.smallMinPW = 1000
        self.smallMaxPW = 1001
        self.wideMinPW = 550
        self.wideMaxPW = 2450


    def testRotation(self):
        try:

            self.ch.setTargetPosition(0.0)
            self.ch.setTargetPosition(180.0)
            print("** Success: correctly moved motor **")
            self.ch.setTargetPosition(0.0)
            print("** Reset motor position **")
        except Phidget22.PhidgetException:
            print("** Error: motor has not moved **")

        if self.ch.setTargetPosition == 0.0:
            print("** Sucess: motor in correct position **")
        else:
            print("** Error: motor not in correct position")


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
        if currentPosition != self.ch.getPosition():
            raise Exception("** Error: Position specified is incorrect **")
        try:
            self.ch.setTargetPosition((currentPosition + 1.0))
        except Phidget22.PhidgetException:
            print("** Error: Could not move motor **")

    def moveOneDegreeTo0(self,currentPosition):

        #check currentPosition is actually the current position
        if currentPosition != self.ch.getPosition():
            raise Exception("** Error: Position specified is incorrect **")
        try:
            #subtract from one degree
            self.ch.setTargetPosition((currentPosition - 1.0))
        except Phidget22.PhidgetException:
            print("** Error: Could not move motor **")

    def closeServoMotor(self):
        self.ch.close()



if __name__ == "__main__":

    sM = servoMotorUtils()
