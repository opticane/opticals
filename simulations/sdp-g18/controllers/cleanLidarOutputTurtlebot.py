"""lidar_get_data controller."""

# this version of the controller uses some object avoidance tricks with LiDAR
# inpsired by those found in the turtlebot controller documentation specifically braitenburg coefficents
# please see: https://github.com/cyberbotics/webots/tree/released/projects/robots/robotis/turtlebot
from controller import Robot, Lidar
import numpy as np

# finds closest distance for each partition
# fieldOfView - the horizontal angle range limit
# partitions are in clockwise order
def findPartitionMinima(lidarData, partitionCount, fieldOfView):
    partitionRange = fieldOfView // partitionCount
    partitionBorders = []
    # assumes the front dirention is the angle 0
    currentAngle = - (fieldOfView // 2)

    # find partition border angles
    for i in range(partitionCount + 1):
        partitionBorders.append(currentAngle)
        currentAngle += partitionRange
    
    print("Border angles of partitions: " + str(partitionBorders))
    
    partitionMinima = []
    for i in range(partitionCount):
        
        partitionStart = partitionBorders[i]
        partitionEnd = partitionBorders[i + 1]
        partitionData = 0
        
        # slice the original data to get current partition, then find the minimum
        # handles cases when slicedArray[x:y] x is negative and y positive
        if partitionStart < 0 and partitionEnd >= -1:
            if partitionEnd == -1:
                partitionData = lidarData[partitionStart:]
            else:
                partitionData = lidarData[partitionStart:] + lidarData[0 : partitionEnd + 1]
        else:
            partitionData = lidarData[partitionStart : partitionEnd + 1]
        
        partitionMinima.append(min(partitionData))
       
    return partitionMinima

# gives feedback level between 0 and 1 for each partition
# minDistance - the minumum distance that is considered a valid input to produce feedback
# maxDistance - the maximum distance that is considered a valid input to produce feedback
# LDS-01 range on manufacturer website: 0.12m ~ 3.5m
def getFeedbackLevels(distances, minDistance, maxDistance):
    feedbackLevels = []

    for distance in distances:
        if distance != float("inf") and distance <= maxDistance and distance >= minDistance:
            feedbackLevels.append(1 - ((distance - minDistance) / (maxDistance - minDistance)))
        else:
            # out of range
            feedbackLevels.append(0)

    return feedbackLevels 

# prints a table with collumns corresponding to the partitions in clockwise order with their feedback level
# levelCount - number of different feedback levels
# feedbackLevels - the feedback levels for each partition
def showFeedbackLevels(feedbackLevels, levelCount):
    
    for feedbackLevel in feedbackLevels:
        print("----", end ="")
    print("-")
    for levelIndex in range(levelCount, 0, -1):
        print("|", end ="")
        for feedbackLevel in feedbackLevels:
            if feedbackLevel > (levelIndex - 1) / levelCount:
                print(" X ", end ="|")
            else:
                print("   ", end ="|")
        print()
    for feedbackLevel in feedbackLevels:
        print("----", end ="")
    print("-")

# gaussian function needed for braitenburg coefficents
def gaussian(x, mu, sigma):
    return np.exp(-np.power(x -mu, 2.)/(2 * np.power(sigma, 2.)))

# create the Robot and Lidar instances.
# wbt file should contain a TurtleBot3Burger as the robot
robot = Robot()
turtleLidar = robot.getDevice('LDS-01')

# get the time step of the current world as well as set up maximum and base speeds for motors
timeStep = 64
maxSpeed = 6.28
leftSpeed = 0.25 * maxSpeed
rightSpeed = 0.25 * maxSpeed

# setting up robot to move
leftMotor = robot.getDevice('left wheel motor')
rightMotor = robot.getDevice('right wheel motor')
leftMotor.setPosition(float('inf'))
rightMotor.setPosition(float('inf'))
leftMotor.setVelocity(0.0)
rightMotor.setVelocity(0.0)

# enable lidar and lidar pointcloud
turtleLidar.enable(timeStep)

lidarWidth = turtleLidar.getHorizontalResolution()
lidarMaxRange = turtleLidar.getMaxRange()
braitenbergCoeff = [] * lidarWidth

# calculate braitenberg coefficents using a guassian distribution
for i in range(lidarWidth - 1):
    braitenbergCoeff.append(6 * gaussian(i, lidarWidth / 4, lidarWidth / 12))

# Main loop:
# - perform simulation steps until Webots is stopping the controller
#   or after a set time elapses
while robot.step(timeStep) != -1 or robot.step(timeStep) > 64:

    # inf if nothing, outputs a float if theres a solid object in way 
    # index 0 is back for turtlebot, 179 is front
    imageData = turtleLidar.getRangeImage()
    # shift the list so that index 0 is front of turtlebot
    shiftedImageData = imageData[179:] + imageData[:179]
    # choose number of partitions and fiel of view
    partitionMinima = findPartitionMinima(shiftedImageData, 10, 270)
    print("Closest distance for each partition: " + str(["%.2f"%x for x in partitionMinima]))
    # choose min and max values for distance to be detected and converted to feedback
    # LDS-01 range on manufacturer website: 0.12m ~ 3.5m
    feedbackLevels = getFeedbackLevels(partitionMinima, 0.12, 1)
    print("Feedback levels for each partition: " + str(["%.2f"%x for x in feedbackLevels]))
    # print table
    showFeedbackLevels(feedbackLevels, 5)


    # use coeffs to calculate new left/right speed
    for i in range(int(round(0.25 * lidarWidth)),int(round(0.5 * lidarWidth))):

        j = lidarWidth - i - 1
        k = i - 0.25 * lidarWidth
        if imageData[i] == float('inf'):
            imageData[i] = 0
        leftSpeed = leftSpeed + braitenbergCoeff[i] * ((1.0 - imageData[i] / lidarMaxRange) - (1.0 - imageData[j] / lidarMaxRange))
        rightSpeed = rightSpeed + braitenbergCoeff[i] * ((1.0 - imageData[i] / lidarMaxRange) - (1.0 - imageData[j] / lidarMaxRange))

        # caps speeds
        if leftSpeed > maxSpeed:
            leftSpeed = maxSpeed
        if rightSpeed > maxSpeed:
            rightSpeed = maxSpeed
        if leftSpeed < -1 * maxSpeed:
            leftSpeed = -1 * maxSpeed
        if rightSpeed < -1 * maxSpeed:
            rightSpeed = -1 * maxSpeed

    # update velocities
    leftMotor.setVelocity(leftSpeed)
    rightMotor.setVelocity(rightSpeed)


# disables Lidar
turtle_lidar.disable()
