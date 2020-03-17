#!/usr/bin/env python
import rospy, rospkg
import shutil
import urllib3.request as request
from contextlib import closing
from logger import logger

rospack = rospkg.RosPack()

class File:
    path = rospack.get_path('robo_waiter') + "/scripts/tab/config/"
    map_path = rospack.get_path('robo_waiter') + "/maps/"

    @staticmethod
    def downloadFile(payload):
        try:
            logger.info("Received file change request")
            option = payload['filename']
            url = payload['message']
            ext = payload['ext']

            tmpFileName = str(option)

            if tmpFileName == ("restaurant.pgm" or "restaurant.yaml"):
                with closing(request.urlopen(url)) as r:
                    with open(File.map_path + tmpFileName, 'wb') as f:
                        logger.info("Trying to save file as"+str(f))
                        shutil.copyfileobj(r, f)
                        logger.info("Saved" + tmpFileName + "file to directory")

            else:                

                """ Create the file and copy to audio folder """
                with closing(request.urlopen(url)) as r:
                    with open(File.path + tmpFileName, 'wb') as f:
                        logger.info("Trying to save file as"+str(f))
                        shutil.copyfileobj(r, f)
                        logger.info("Saved" + tmpFileName + "file to directory")
                        """ Save the config in audio config file """
        except Exception as e:
            logger.error("Error saving file. "+str(e))
