#!/usr/bin/env python
import rospy, rospkg
import os
import json
import time
import threading
import configparser

from robot import Robot
from audio import Audio
from client import Client
from logger import logger
from file_save import File

from myname import getClientId
rospack = rospkg.RosPack()

config_file_path = rospack.get_path('robo_waiter') + "/scripts/" + "tab/"

try:
    file = open(Audio.configFile, 'r')
except IOError:
    with open(Audio.configFile, "a+") as f:
        json.dump(Audio.defaultAudioConfig, f)

print "start"



def on_connect(client, userdata, flags, rc):
    print "mqtt connected"
    Robot.update_status("Booting")
    Robot.node_call()
    Robot.node_start()
    logger.info("Connected to Mqtt broker")
    client.subscribe("dotworld/#")


def on_message(client, userdata, msg):
    global config_file_path
    logger.debug(msg.topic+" "+str(msg.payload))
    try:
        payload = json.loads(msg.payload)
        robotName = getClientId()
        if robotName == payload['recipient']:
            logger.info("OMG!!So much work")
            fn = get_fn(str(msg.topic))
            fn(payload)

        elif payload['recipient'] == "All":
            fn = get_fn(str(msg.topic))
            fn(payload)

        elif payload['recipient'] == "*":
            with open(config_file_path + "/config/" + "table_actions.json", 'w+') as outfile:
                outfile.write(json.dumps(payload, indent=4))
        else:
            logger.info("Not my work! ")

    except Exception as e:
        logger.error("Exception."+str(e))

def get_fn(topic):
    return {
        'dotworld/robot/move': Robot.moveTo,
        'dotworld/robot/home': Robot.goHome,
        'dotworld/robot/manual': Robot.goManual,
        'dotworld/robot/time': Robot.setTime,
        'dotworld/robot/initialize': Robot.onStart,
        'dotworld/robot/audio/upload': Audio.downloadAudio,
        'dotworld/robot/file/check' : Robot.file_check,
        'dotworld/robot/manual/enable': Robot.manual,
        'dotworld/robot/manual/control' : Robot.goManual,
        'dotworld/robot/gmapping/start' : Robot.gmapping,
        'dotworld/robot/restart' : Robot.restart,
        'dotworld/robot/shutdown' : Robot.shutdown
    }[topic]

def shutdown():
    logger.info ("mqtt_node stopped")

if __name__ == "__main__":
    rospy.init_node ("goal_tester")
    rospy.on_shutdown(shutdown)
    #rospy.sleep(1)
    client = None
    serial = None
    client = Client.getInstance()

    logger.info("Initializing components")

    try:
        Audio.resetToday()
    except Exception as e:
        logger.error("Error resetting today's audio."+str(e))

    try:
        logger.info("File running on "+Audio.path)
        if client != None:
            logger.info("Setting up callbacks for MQTT Client")
            client.on_connect = on_connect
            client.on_message = on_message
            logger.debug("Starting client in loop")
            client.loop_start()
    except Exception as e:
        logger.error("Unable to initialize components")

    rospy.spin()