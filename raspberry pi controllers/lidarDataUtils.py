## Lidar Data Utils handles the processing of LiDAR data in haptic feedback information ##
import numpy as np
# finds closest distance for each partition.
# fieldOfView - the horizontal angle range limit
# partitions are in clockwise order
def findPartitionMinima(lidarData, partitionCount, fieldOfView):
    partitionRange = fieldOfView // partitionCount
    partitionBorders = []
    # assumes the front direction is the angle 0
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
        partitionData = [0]

        # slice the original data to get current partition, then find the  weighted minimum of 3 smallest.
        # handles cases when slicedArray[x:y] x is negative and y positive
        if partitionStart < 0 and partitionEnd >= -1:
            if partitionEnd == -1:
                partitionData = lidarData[partitionStart:]
            else:
                partitionData = lidarData[partitionStart:] + lidarData[0 : partitionEnd + 1]
        else:
            partitionData = lidarData[partitionStart : partitionEnd + 1]
        #get weightedAverage
        wAv = weightedAverage(partitonData)
        partitionMinima.append(wAv)

    return partitionMinima

#gets weighted average of 3 smallest readings for each partition
def weightedAverage(partitionData):
    #get 3 smallest nonzero distances
    pData = partitionData
    paData = [i for i in pData if i != 0]
    #sort and take first 3 elements
    partitionData.sort()
    minima = partitionData[:3]
    print(minima)
    #get the weightings, ensuring to remove any weightings of distance less than 0.2m
    weightings = [i/sum(minima)*100 if i >= 0.2 else 100 for i in minima]
    #inverse making smallest weighting for smallest distance the largest
    weightings = [(100 - i)/100 for i in weightings]
    print(weightings)

    #calculate and return partition average
    partitionAv = sum([i*j for i,j in zip(minima,weightings)])/sum(weightings)
    return partitionAv








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

# map the feedback levels used to generate the terminal output feedback table with
# the different levels the vibration motors can take 
def mapFeedbackLevelsToVib(fbLevels):
    vibrationLevels = []
    for f in fbLevels:
        if f <= 0.2:
            vibrationLevels.append(20)
        elif f <= 0.6:
            vibrationLevels.append(60)
        else:
            vibrationLevels.append(100)
    return vibrationLevels



# prints a table with columns corresponding to the partitions in clockwise order with their feedback level
# levelCount - number of different feedback levels
# feedbackLevels - the feedback levels for each partition
def printFeedbackLevels(feedbackLevels, levelCount):

    print("----"),
    for fbLevel in range(len(feedbackLevels) - 2):
        print("---"),
    print("----")
    for levelIndex in range(levelCount, 0, -1):
        print("|"),
        for feedbackLevel in feedbackLevels:
            if feedbackLevel > (levelIndex - 1.0) / levelCount:
                print("X |"),
            else:
                print("  |"),
        print("")
    print("----"),
    for fbLevel in range(len(feedbackLevels) - 2):
        print("---"),
    print("----")
