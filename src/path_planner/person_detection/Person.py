#!/usr/bin/env python
from Tracking.centroidtracker import CentroidTracker
from Tracking.trackableobject import TrackableObject
import numpy as np
import imutils
#import pyodbc
import os
import threading
import timeit
import time
import traceback
from playsound import playsound
import datetime
import dlib
import cv2
from threading import Thread

import rospy
from std_msgs.msg import String


# Global Variable
CountVar = 0
OutVar = 0


CLASSES = ["background", "aeroplane", "bicycle", "bird", "boat",
           "bottle", "bus", "car", "cat", "chair", "cow", "diningtable",
           "dog", "horse", "motorbike", "person", "pottedplant", "sheep",
           "sofa", "train", "tvmonitor"]

print("Loading ssd model")


try:
	#net = cv2.dnn.readNetFromCaffe("E:\\Temporary\\PERSON COUNT - Copy\\Model\\MobileNetSSD_deploy.prototxt", "E:\\Temporary\\PERSON COUNT - Copy\\Model\\MobileNetSSD_deploy.caffemodel")
	net = cv2.dnn.readNetFromCaffe(
		"Model/MobileNetSSD_deploy.prototxt", "Model/MobileNetSSD_deploy.caffemodel")
	print("MODEL LOADED")
except Exception as e:
	print("ERROR IN LOADING MODEL %s", s)


def reconnect_cam():
	global vs
	print("Starting video stream")
	vs = cv2.VideoCapture(0)

if __name__ == "__main__":
	reconnect_cam()
	rospy.init_node("video_analytics")
	person_pub = rospy.Publisher("/person",String,queue_size=10)
	#rospy.Subscriber("/topic_name",type_oftopic,function)

	print("%s camera started returned object", vs)

	W = None
	H = None

	ct = CentroidTracker(maxDisappeared=40, maxDistance=50)
	trackers = []
	trackableObjects = {}

	totalFrames = 0


	start = timeit.default_timer()
	while not rospy.is_shutdown():
		try:
			ret, frame = vs.read()
			frame = imutils.resize(frame, width=400)
			rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

		except Exception as ex:
			print("camera error and the error is:%s", ex)
			reconnect_cam()
			continue

		if W is None or H is None:
			(H, W) = frame.shape[:2]

		status = "Waiting"
		rects = []

		if totalFrames % 30 == 0:																		# looping for every 30th frame for detections of person from the frame
			status = "Detecting"
			trackers = []
			blob = cv2.dnn.blobFromImage(frame, 0.007843, (W, H), 127.5)
			net.setInput(blob)
			detections = net.forward()

			for i in np.arange(0, detections.shape[2]):
				confidence = detections[0, 0, i, 2]

				if confidence > 0.4:

					idx = int(detections[0, 0, i, 1])

					if CLASSES[idx] != "person":
						continue

					box = detections[0, 0, i, 3:7] * np.array([W, H, W, H])
					(startX, startY, endX, endY) = box.astype("int")
					tracker = dlib.correlation_tracker()
					#print("tracker:",tracker)												# Tracking moving object in video stream giving bounding boxes of the object on the first frame
					# returns the predicted position of the object under track
					rect = dlib.rectangle(int(startX), int(startY), int(endX), int(endY))
					# start tracking the object inside the bounding boxes in the given image
					tracker.start_track(rgb, rect)

					trackers.append(tracker)

		else:

			for tracker in trackers:
				status = "Tracking"

				# returs an uodate of the position of object
				tracker.update(rgb)
				pos = tracker.get_position()															# position of the object

				startX = int(pos.left())
				startY = int(pos.top())
				endX = int(pos.right())
				endY = int(pos.bottom())

				rects.append((startX, startY, endX, endY))
				cv2.rectangle(frame, (startX, startY), (endX, endY), (0, 0, 0), 2)
				mid_x = (startX + endX)/2
				mid_y = (startY + endY)/2
		cv2.line(frame, (184, 82), (276, 125), (0, 255, 255), 2)

		# centroid is updated fr the object
		objects = ct.update(rects)

		for (objectID, centroid) in objects.items():
			to = trackableObjects.get(objectID, None)
			if to is None:
				to = TrackableObject(objectID, centroid)
			else:
				# gives the direction of the object
				y = [c[1] for c in to.centroids]
				direction = centroid[1] - np.mean(y)
				to.centroids.append(centroid)

				if not to.counted:
					if direction > 0 and centroid[1] > 100:
						CountVar += 1
						print("object detection:%d", CountVar)
						MusicStatus = True
						to.counted = True

					if direction < 0 and centroid[1] < 100:
						OutVar += 1
						to.counted = True

			trackableObjects[objectID] = to
			text = "ID {}".format(objectID)
			cv2.putText(frame, text, (centroid[0] - 10, centroid[1] - 10),cv2.FONT_HERSHEY_SIMPLEX, 0.5, (0, 255, 0), 2)
			cv2.circle(frame, (centroid[0], centroid[1]), 4, (0, 255, 0), -1)
			data = "ID: " + str(objectID) + " X: " + str(mid_x) + " Y: " + str(mid_y)
			person_pub.publish(data)
			text = "ID {}".format(objectID)
		print("info  :", CountVar,OutVar)
		info = [
			("IN", CountVar),
			("OUT", OutVar)
		]

		for (i, (k, v)) in enumerate(info):
			text = "{}: {}".format(k, v)
			cv2.putText(frame, text, (10, H - ((i * 20) + 20)),
		            cv2.FONT_HERSHEY_SIMPLEX, 0.6, (0, 0, 255), 2)

		cv2.imshow("imag", frame)
		key = cv2.waitKey(1) & 0xFF

		if key == ord("q"):
			break

		totalFrames += 1

	rospy.spin()
vs.release()
