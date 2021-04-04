import math


def calc_vertex_angle(a, b, c):
    '''
    Find the angle of the vertex (p2) formed by
    connecting three points using atan2 in degrees.

    Calculates angle from p1 -> p3 counter-clockwise.
    '''

    angle = math.atan2(c[1] - b[1], c[0] - b[0]) - math.atan2(a[1] - b[1], a[0] - b[0])

    return math.degrees(angle) % 360


def rotate_point(point, origin, angle):
    '''
    Rotate a point about an origin by an input angle in 
    degrees counter-clockwise.
    '''
    
    rad_angle = math.radians(angle)
    ox, oy = origin
    px, py = point

    s = math.sin(rad_angle)
    c = math.cos(rad_angle)
    dx = px - ox
    dy = py - oy

    qx = ox + c * dx - s * dy
    qy = oy + s * dx + c * dy
    return qx, qy


# Testing
if __name__ == "__main__":
    p1 = [1, 0]
    p2 = [0, 0]
    p3 = [0, -1]
    p = rotate_point(p1, p2, -45)
    a = calc_vertex_angle(p1, p2, p3)
    print(p)
    print(a)