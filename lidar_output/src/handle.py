from motors import Motors
from time import time, sleep
from tcpcom import TCPServer

# connection configuration settings
tcp_ip = "192.168.105.156"
tcp_port = 5005
tcp_reply = [1.0,1.0,1.0,1.0,1.0]


class Handle:
    def __init__(self):
        self.mc = Motors()
        self.ports = list(range(1, 6))

    def buzz(self, intensities, scheme=None):
        """
    example input:
    intensities is a list of 5 percentage number [0.1,0.7,0.8,1,0.9]
    scheme is a function of [Num] -> [Num] to process intensities
    """
        if scheme:
            # process intensities
            intensities = scheme(intensities)

        #self.mc.stop_motors()
        for port, intensity in zip(self.ports, intensities):
            self.mc.move_motor(port, intensity*100)
            print("Moving motor on port",port)

    def stop(self):
        self.mc.stop_motors()

    def onStateChanged(state, msg):
    global isConnected

    if state == "LISTENING":

        print("Server:-- Listening...")
    elif state == "CONNECTED":

        isConnected = True
        print("Server:-- Connected to" + msg)

    elif state == "MESSAGE":
        print("Server:-- Message received:", msg)
        h.buzz(msg)

if __name__ == "__main__":

    h = Handle()

    global server
    server = TCPServer(tcp_port, stateChanged=onStateChanged)
    sleep(10)
