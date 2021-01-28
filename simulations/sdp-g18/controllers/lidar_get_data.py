"""lidar_get_data controller."""

# You may need to import some classes of the controller module. Ex:
#  from controller import Robot, Motor, DistanceSensor
from controller import Robot, Lidar 

# create the Robot and Lidar instances.
# wbt file should contain a TurtleBot3Burger as the robot 
robot = Robot()
turtle_lidar = robot.getDevice('LDS-01')

# get the time step of the current world.
timestep = 64

# setting up robot to move 
leftmotor = robot.getDevice('left wheel motor')
rightmotor = robot.getDevice('right wheel motor')

leftmotor.setPosition(10.0)
rightmotor.setPosition(10.0)

# enable lidar 
turtle_lidar.enable(timestep)

lidar_width = turtle_lidar.getHorizontalResolution()
lidar_max_range = turtle_lidar.getMaxRange()

# Main loop:
# - perform simulation steps until Webots is stopping the controller
#   or after a set time elapses 
while robot.step(timestep) != -1 or robot.step(timestep) > 128:
 
    # outputs a list of floats 
    #  inf if nothing, outputs a float if theres a solid object in 
    image_data = turtle_lidar.getRangeImage()
    print(image_data)
   
    pass

# Enter here exit cleanup code.
turtle_lidar.disable()
