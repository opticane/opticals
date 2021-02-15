"""blindMan controller."""

# Copyright 1996-2020 Cyberbotics Ltd.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Pedestrian class container."""
from controller import Supervisor

import optparse
import math

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

class Pedestrian (Supervisor):
    """Control a Pedestrian PROTO."""

    def __init__(self):
        """Constructor: initialize constants."""
        self.BODY_PARTS_NUMBER = 13
        self.WALK_SEQUENCES_NUMBER = 8
        self.ROOT_HEIGHT = 1.27
        self.CYCLE_TO_DISTANCE_RATIO = 0.22
        self.speed = 1.15
        self.current_height_offset = 0
        self.joints_position_field = []
        self.joint_names = [
            "leftArmAngle", "leftLowerArmAngle", "leftHandAngle",
            "rightArmAngle", "rightLowerArmAngle", "rightHandAngle",
            "leftLegAngle", "leftLowerLegAngle", "leftFootAngle",
            "rightLegAngle", "rightLowerLegAngle", "rightFootAngle",
            "headAngle"
        ]
        self.height_offsets = [  # those coefficients are empirical coefficients which result in a realistic walking gait
            -0.02, 0.04, 0.08, -0.03, -0.02, 0.04, 0.08, -0.03
        ]
        
        self.angles = [  # those coefficients are empirical coefficients which result in a realistic walking gait
            [-0.52, -0.15, 0.58, 0.7, 0.52, 0.17, -0.36, -0.74],  # left arm
            [0.0, -0.16, -0.7, -0.38, -0.47, -0.3, -0.58, -0.21],  # left lower arm
            [0.12, 0.0, 0.12, 0.2, 0.0, -0.17, -0.25, 0.0],  # left hand
            #[0.52, 0.17, -0.36, -0.74, -0.52, -0.15, 0.58, 0.7],  # right arm
            #[-0.47, -0.3, -0.58, -0.21, 0.0, -0.16, -0.7, -0.38],  # right lower arm
            #[0.0, -0.17, -0.25, 0.0, 0.12, 0.0, 0.12, 0.2],  # right hand
            [-0.4], # right arm
            [-0.3], # right lower arm
            [0.55], # right hand
            [-0.55, -0.85, -1.14, -0.7, -0.56, 0.12, 0.24, 0.4],  # left leg
            [1.4, 1.58, 1.71, 0.49, 0.84, 0.0, 0.14, 0.26],  # left lower leg
            [0.07, 0.07, -0.07, -0.36, 0.0, 0.0, 0.32, -0.07],  # left foot
            [-0.56, 0.12, 0.24, 0.4, -0.55, -0.85, -1.14, -0.7],  # right leg
            [0.84, 0.0, 0.14, 0.26, 1.4, 1.58, 1.71, 0.49],  # right lower leg
            [0.0, 0.0, 0.42, -0.07, 0.07, 0.07, -0.07, -0.36],  # right foot
            [0.18, 0.09, 0.0, 0.09, 0.18, 0.09, 0.0, 0.09]  # head
        ]
        Supervisor.__init__(self)

    def run(self):
        
        # initate lidar
        timestep = 64
        lidar = self.getDevice('LDS-01')
        lidar.enable(timestep)
        lidarWidth = lidar.getHorizontalResolution()
        
        """Set the Pedestrian pose and position."""
        opt_parser = optparse.OptionParser()
        opt_parser.add_option("--trajectory", default="", help="Specify the trajectory in the format [x1 y1, x2 y2, ...]")
        opt_parser.add_option("--speed", type=float, default=0.5, help="Specify walking speed in [m/s]")
        opt_parser.add_option("--step", type=int, help="Specify time step (otherwise world time step is used)")
        options, args = opt_parser.parse_args()
        if not options.trajectory or len(options.trajectory.split(',')) < 2:
            print("You should specify the trajectory using the '--trajectory' option.")
            print("The trajectory shoulld have at least 2 points.")
            return
        if options.speed and options.speed > 0:
            self.speed = options.speed
        if options.step and options.step > 0:
            self.time_step = options.step
        else:
            self.time_step = int(self.getBasicTimeStep())
        point_list = options.trajectory.split(',')
        self.number_of_waypoints = len(point_list)
        self.waypoints = []
        for i in range(0, self.number_of_waypoints):
            self.waypoints.append([])
            self.waypoints[i].append(float(point_list[i].split()[0]))
            self.waypoints[i].append(float(point_list[i].split()[1]))
        self.root_node_ref = self.getSelf()
        self.root_translation_field = self.root_node_ref.getField("translation")
        self.root_rotation_field = self.root_node_ref.getField("rotation")
        for i in range(0, self.BODY_PARTS_NUMBER):
            self.joints_position_field.append(self.root_node_ref.getField(self.joint_names[i]))

        # compute waypoints distance
        self.waypoints_distance = []
        for i in range(0, self.number_of_waypoints):
            x = self.waypoints[i][0] - self.waypoints[(i + 1) % self.number_of_waypoints][0]
            z = self.waypoints[i][1] - self.waypoints[(i + 1) % self.number_of_waypoints][1]
            if i == 0:
                self.waypoints_distance.append(math.sqrt(x * x + z * z))
            else:
                self.waypoints_distance.append(self.waypoints_distance[i - 1] + math.sqrt(x * x + z * z))
        while not self.step(self.time_step) == -1:
        
            # lidar
            # inf if nothing, outputs a float if theres a solid object in way 
            imageData = lidar.getRangeImage()
            # choose number of partitions and fiel of view
            partitionMinima = findPartitionMinima(imageData, 5, 180)
            print("Closest distance for each partition: " + str(["%.2f"%x for x in partitionMinima]))
            # choose min and max values for distance to be detected and converted to feedback
            # LDS-01 range on manufacturer website: 0.12m ~ 3.5m
            feedbackLevels = getFeedbackLevels(partitionMinima, 0.5, 3)
            print("Feedback levels for each partition: " + str(["%.2f"%x for x in feedbackLevels]))
            # print table
            showFeedbackLevels(feedbackLevels, 6)
        
            time = self.getTime()

            current_sequence = int(((time * self.speed) / self.CYCLE_TO_DISTANCE_RATIO) % self.WALK_SEQUENCES_NUMBER)
            # compute the ratio 'distance already covered between way-point(X) and way-point(X+1)'
            # / 'total distance between way-point(X) and way-point(X+1)'
            ratio = (time * self.speed) / self.CYCLE_TO_DISTANCE_RATIO - \
                int(((time * self.speed) / self.CYCLE_TO_DISTANCE_RATIO))

            """for i in range(0, self.BODY_PARTS_NUMBER):
                current_angle = self.angles[i][current_sequence] * (1 - ratio) + \
                        self.angles[i][(current_sequence + 1) % self.WALK_SEQUENCES_NUMBER] * ratio
                self.joints_position_field[i].setSFFloat(current_angle)"""
                
            # dont move the right hand
            for i in range(0, self.BODY_PARTS_NUMBER):
                if (i >= 3 and i <= 5):
                    current_angle = self.angles[i][0]
                    self.joints_position_field[i].setSFFloat(current_angle)
                else:
                    current_angle = self.angles[i][current_sequence] * (1 - ratio) + \
                        self.angles[i][(current_sequence + 1) % self.WALK_SEQUENCES_NUMBER] * ratio
                    self.joints_position_field[i].setSFFloat(current_angle)
            

            # adjust height
            self.current_height_offset = self.height_offsets[current_sequence] * (1 - ratio) + \
                self.height_offsets[(current_sequence + 1) % self.WALK_SEQUENCES_NUMBER] * ratio

            # move everything
            distance = time * self.speed
            relative_distance = distance - int(distance / self.waypoints_distance[self.number_of_waypoints - 1]) * \
                self.waypoints_distance[self.number_of_waypoints - 1]

            for i in range(0, self.number_of_waypoints):
                if self.waypoints_distance[i] > relative_distance:
                    break

            distance_ratio = 0
            if i == 0:
                distance_ratio = relative_distance / self.waypoints_distance[0]
            else:
                distance_ratio = (relative_distance - self.waypoints_distance[i - 1]) / \
                    (self.waypoints_distance[i] - self.waypoints_distance[i - 1])
            x = distance_ratio * self.waypoints[(i + 1) % self.number_of_waypoints][0] + \
                (1 - distance_ratio) * self.waypoints[i][0]
            z = distance_ratio * self.waypoints[(i + 1) % self.number_of_waypoints][1] + \
                (1 - distance_ratio) * self.waypoints[i][1]
            root_translation = [x, self.ROOT_HEIGHT + self.current_height_offset, z]
            angle = math.atan2(self.waypoints[(i + 1) % self.number_of_waypoints][0] - self.waypoints[i][0],
                               self.waypoints[(i + 1) % self.number_of_waypoints][1] - self.waypoints[i][1])
            rotation = [0, 1, 0, angle]

            self.root_translation_field.setSFVec3f(root_translation)
            self.root_rotation_field.setSFRotation(rotation)


controller = Pedestrian()
controller.run()
