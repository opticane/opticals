#!/usr/bin/env python
import board
import busio
import adafruit_tca9548a
import adafruit_drv2605

i2c = busio.I2C(board.SCL, board.SDA)

tca = adafruit_tca9548a.TCA9548A(i2c)
drvs = [adafruit_drv2605.DRV2605(tca[i]) for i in range(5)]

def multi_vib(levels):
    """
    given [Int], vibrate each motor based on input
    """
    for level,drv in zip(levels,drvs):
        vibrate(level,drv)
        print("vibrate at:",level)


def vibrate(level,drv):
    # control vibration level at 20 60 and 100
    if level <= 100 and level > 60:
        drv.sequence[0] = adafruit_drv2605.Effect(47)
    elif level >= 60:
        drv.sequence[0] = adafruit_drv2605.Effect(49)
    else:
        drv.sequence[0] = adafruit_drv2605.Effect(51)

    drv.play()
