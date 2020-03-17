#!/usr/bin/env python
import rospy, rospkg
import os
import shutil
import json
import glob
from datetime import datetime
import urllib3.request as request
from contextlib import closing
from logger import logger

rospack = rospkg.RosPack()

class Audio:
    path = rospack.get_path('robo_waiter') + "/scripts/" + "tab/"
    default = path+"audio/delivery_voice.wav"
    configFile = path+"/config/audio.json"
    defaultAudioConfig = {
        'audio': default,
        'option': 2,
        'valid': 0
    }
    valid = datetime.today().strftime('%d/%m/%Y')

    @staticmethod
    def downloadAudio(payload):
        try:
            logger.info("Received audio change request")
            option = payload['option']
            url = payload['message']
            ext = payload['ext']
            
            """ Check the option in payload and create a filename based on the option """
            tmpFileName = Audio.default
            if option == 0:
                tmpFileName = "onetime.{}".format(ext)
            elif option == 1:
                tmpFileName = "today.{}".format(ext)
                Audio.valid = datetime.today().strftime('%d/%m/%Y')
            else:
                tmpFileName = "default.{}".format(ext)

            logger.info("Saving file under name "+str(tmpFileName))

            """ Create the file and copy to audio folder """
            with closing(request.urlopen(url)) as r:
                with open(Audio.path+"/audio/"+tmpFileName, 'wb') as f:
                    logger.info("Trying to save file as"+str(f))
                    shutil.copyfileobj(r, f)
                    logger.info("Saved audio to directory")
                    """ Save the config in audio config file """
                    with open(Audio.configFile, "w") as config:
                        try:
                            tmp = {
                                'audio': Audio.path+"/audio/"+tmpFileName,
                                'option': option,
                                'valid': option == 1 and Audio.valid or 0
                            }
                            json.dump(tmp, config)
                            logger.info("Setting Audio configuration" + str(tmp))
                        except Exception as ex:
                            logger.error("Error writing audio config file."+str(ex))
        except Exception as e:
            logger.error("Error saving audio. "+str(e))

    @staticmethod
    def getOptions():
        try:
            with open(Audio.configFile, 'r') as config_json:
                config = json.load(config_json)
            return config
        except Exception as e:
            logger.error("Exception while reading audio config."+str(e))

    @staticmethod
    def checkAndReset(config):
        try:
            if config['option'] == 0:
                Audio.resetDefault()
            elif config['option'] == 1:
                Audio.resetToday()

        except Exception as e:
            logger.error("Exception while reading audio config."+str(e))

    @staticmethod
    def resetToday():
        try:
            config = Audio.getOptions()
            if config != None:
                option = config['option']
                validity = config['valid']
                if option == 1:
                    logger.info("Option is 1 (today). Validating validity.")

                    dt = datetime.strptime(validity, '%d/%m/%Y')
                    today = datetime.today()

                    if dt.date() == today.date():
                        logger.info(
                            "Audio is valid for today. Not reseting to default")
                        return
                    else:
                        Audio.resetDefault()
                        logger.info("Today is "+str(today.date()) +
                                    ". But validity is "+str(dt.date()))

                else:
                    logger.info("Option is not 1 (today)")
            else:
                logger.warning("Audio config is None")
        except Exception as e:
            logger.error("Exception while reading audio config."+str(e))

    @staticmethod
    def resetDefault():
        try:
            defaultFileName = Audio.default
            dFile = glob.glob(Audio.path+'/audio/default.*')
            if len(dFile) >= 1:
                defaultFileName = dFile[0]

            with open(Audio.configFile, 'w') as file:
                tmp = {
                    'audio': defaultFileName,
                    'option': 2,
                    'valid': 0
                }
                json.dump(tmp, file)
        except Exception as e:
            logger.error("Unable to set default audio in config")
