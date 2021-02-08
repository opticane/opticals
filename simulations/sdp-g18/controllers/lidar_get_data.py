"""lidar_get_data controller."""

# You may need to import some classes of the controller module. Ex:
#  from controller import Robot, Motor, DistanceSensor
from controller import Robot, Lidar 

# create the Robot and Lidar instances.
# wbt file should contain a TurtleBot3Burger as the robot 
robot = Robot()
turtleLidar = robot.getDevice('LDS-01')

# get the time step of the current world as well as set up maximum speed for motors
timeStep = 64
maxSpeed = 6.28

# setting up robot to move 
leftMotor = robot.getDevice('left wheel motor')
rightMotor = robot.getDevice('right wheel motor')
leftMotor.setPosition(float('inf'))
rightMotor.setPosition(float('inf'))
leftMotor.setVelocity(0.0)
rightMotor.setVelocity(0.0)



# enable lidar and lidar pointcloud
turtleLidar.enable(timestep)



lidarWidth = turtleLidar.getHorizontalResolution()


# Main loop:
# - perform simulation steps until Webots is stopping the controller
#   or after a set time elapses 
while robot.step(timeStep) != -1 or robot.step(timeStep) > 64:
    
    #initialise velocity 
    leftSpeed = 0.5*maxSpeed
    rightSpeed = 0.5*maxSpeed
    
    
    #  inf if nothing, outputs a float if theres a solid object in way 
    imageData = turtleLidar.getRangeImage()
    print(imageData)
    
    
     # removes all values of inf from left/right since no obstacles there
    obstacleLeft = filter(lambda v: v!= float('inf'), obstacleLeft)
    obstacleRight = filter(lambda v: v!= float('inf'), obstacleRight)
    
    # sums all the depth values in left/right sides of list
    obstacleLeftVal = sum(obstacleLeft)
    obstacleRightVal = sum(obstacleRight)
    
    #check for no division by 0 errors
    if obstacleLeftVal == 0 :
        leftSpeed = 0.0
        
    elif obstacleRightVal == 0 :
        rightSpeed = 0.0 
    
    # takes the left/right speed as a proportion of the inverse of the total depths 
    # of objects in the right/left field of view with corresponds to the right or left
    # sides of the list 
    
    else :
        # caps proportion of the speeds at the maxspeed 
        if 1/obstacleLeftVal*maxSpeed > maxSpeed and leftSpeed != 0.0 :
            leftSpeed = 0.5*maxSpeed 
            
        elif 1/obstacleRightVal*maxSpeed > maxSpeed and rightSpeed != 0.0 :
            rightSpeed = 0.5*maxSpeed 
            
        else :
            leftSpeed = 1/obstacleLeftVal*maxSpeed
            rightSpeed = 1/obstacleRightVal*maxSpeed
    
    # robot is stuck in front of object if speeds are close to but not 0      
    if obstacleLeftVal+obstacleRightVal < 0.3 and obstacleLeftVal+obstacleRightVal != 0 : 
        leftSpeed = -0.5*maxSpeed
        rightSpeed = 0.5*maxSpeed 
        
    # update velocities
    leftMotor.setVelocity(leftSpeed)
    rightMotor.setVelocity(rightSpeed) 
    

# disables Lidar 
turtle_lidar.disable()
