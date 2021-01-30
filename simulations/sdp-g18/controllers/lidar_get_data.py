"""lidar_get_data controller."""

# You may need to import some classes of the controller module. Ex:
#  from controller import Robot, Motor, DistanceSensor
from controller import Robot, Lidar 

# create the Robot and Lidar instances.
# wbt file should contain a TurtleBot3Burger as the robot 
robot = Robot()
turtleLidar = robot.getDevice('LDS-01')

# get the time step of the current world as well as set up maximum speed for motors
timestep = 64
maxspeed = 6.28

# setting up robot to move 
leftmotor = robot.getDevice('left wheel motor')
rightmotor = robot.getDevice('right wheel motor')
leftmotor.setPosition(float('inf'))
rightmotor.setPosition(float('inf'))
leftmotor.setVelocity(0.0)
rightmotor.setVelocity(0.0)



# enable lidar and lidar pointcloud
turtleLidar.enable(timestep)



lidarWidth = turtleLidar.getHorizontalResolution()


# Main loop:
# - perform simulation steps until Webots is stopping the controller
#   or after a set time elapses 
while robot.step(timestep) != -1 or robot.step(timestep) > 64:
    
    #initialise velocity 
    leftspeed = 0.5*maxspeed
    rightspeed = 0.5*maxspeed
    
    
    #  inf if nothing, outputs a float if theres a solid object in way 
    imageData = turtleLidar.getRangeImage()
    print(imageData)
    
    # removes all values of inf from left/right since no obstacles there      
    halfTheList = int(round(len(imageData)*0.5))
 
    # gets left/right side of the list 
    obstacleLeft = imageData[0:halfTheList]
    obstacleRight = imageData[halfTheList:len(imageData)-1]
    
     # removes all values of inf from left/right since no obstacles there
    obstacleLeft = filter(lambda v: v!= float('inf'), obstacleLeft)
    obstacleRight = filter(lambda v: v!= float('inf'), obstacleRight)
    
    # sums all the depth values in left/right sides of list
    obstacleLeftVal = sum(obstacleLeft)
    obstacleRightVal = sum(obstacleRight)
    
    #check for no division by 0 errors
    if obstacleLeftVal == 0 :
        leftspeed = 0.0
        
    elif obstacleRightVal == 0 :
        rightspeed = 0.0 
    
    # takes the left/right speed as a proportion of the inverse of the total depths 
    # of objects in the right/left field of view with corresponds to the right or left
    # sides of the list 
    
    else :
        # caps proportion of the speeds at the maxspeed 
        if 1/obstacleLeftVal*maxspeed > maxspeed and leftspeed != 0.0 :
            leftspeed = 0.5*maxspeed 
            
        elif 1/obstacleRightVal*maxspeed > maxspeed and rightspeed != 0.0 :
            rightspeed = 0.5*maxspeed 
            
        else :
            leftspeed = 1/obstacleLeftVal*maxspeed
            rightspeed = 1/obstacleRightVal*maxspeed
    
    # robot is stuck in front of object if speeds are close to but not 0      
    if obstacleLeftVal+obstacleRightVal < 0.3 and obstacleLeftVal+obstacleRightVal != 0 : 
        leftspeed = -0.5*maxspeed
        rightspeed = 0.5*maxspeed 
        
    # update velocities
    leftmotor.setVelocity(leftspeed)
    rightmotor.setVelocity(rightspeed) 
    
    pass

# disables Lidar 
turtle_lidar.disable()
