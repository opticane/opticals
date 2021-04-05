import math
from common_utils import calc_vertex_angle, rotate_point


def haptic_guide(loc, dest, heading, num_feedback=5, feedback_intensity=1.0):
    '''
    Use haptic feedback to indicate the direction of a
    destination relative to an input location and its
    heading which are provided by a Raspberry Pi's GPS unit.
    '''

    # Rotate dest by '-heading' degrees around loc
    rotation = -heading
    dest = rotate_point(dest, loc, rotation)

    # Find angle between direct right and rotated dest
    fov = [loc[0] + 1, loc[1]]
    angle = calc_vertex_angle(fov, loc, dest)

    is_behind = False
    if angle > 180:
        is_behind = True
        angle = 360 - angle

    # Find the partition for feedback
    partition_size = 180.0 / num_feedback
    mid_partition = math.floor(num_feedback / 2)
    guide_partition = math.floor(angle / partition_size)
    if guide_partition >= num_feedback:
        guide_partition = num_feedback - 1

    # Vibrate the motor that corresponds to the partition
    # that the destination falls in. If the destination is
    # behind the user, reflect the destination to be as if
    # it were in front of the user, but also vibrate the
    # middle partition. If the destination is directly
    # behind the user, vibrate the middle three partitions
    feedback = [0] * num_feedback
    feedback[guide_partition] = feedback_intensity
    if is_behind:
        feedback[mid_partition] = feedback_intensity
        if guide_partition == mid_partition:
            feedback[mid_partition - 1] = feedback_intensity
            feedback[mid_partition + 1] = feedback_intensity

    return feedback


# Testing
if __name__ == "__main__":
    user = [0, 0]
    dest = [0, 1]
    heading = 0 # 0° is north
    print("heading:", heading)
    feedback = haptic_guide(user, dest, heading)
    print("feedback:", feedback)
