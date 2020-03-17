import paho.mqtt.client as mqtt
import os
import time
from myname import getClientId

class Client():
    instance = None

    @staticmethod
    def getInstance():
        run = True
        while run:
            try:
                if Client.instance == None:
                    Client.instance = mqtt.Client(client_id=getClientId())
                    Client.instance.connect("192.168.3.119", 1883, 60)
                    try:
                        from logger import logger
                        logger.info("Created new instance for MQTT")
                    except:
                        pass
                    run = False
                else:
                    run = False
            except Exception as e:
                try:
                    from logger import logger
                    logger.error(
                        "Error (201) : Error establishing connnection to MQTT Broker.\n"+str(e))
                except:
                    pass
                time.sleep(8)

        return Client.instance

    def __init__(self):
        if self.instance != None:
            raise Exception("This class is a singleton!")
        else:
            self.instance = self.getInstance()
