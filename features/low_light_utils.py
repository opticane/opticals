def is_low_light(lux):
    '''
    Returns whether or not the sensed light level
    in lux is considered low light conditions.
    According to https://learn.adafruit.com/photocells/measuring-light,
    a lux level of 5 is about the threshold for low light.
    '''
    
    return lux < 5
