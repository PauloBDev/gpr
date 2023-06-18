#!/usr/bin/env python
import cv2
import time
import argparse
from time import gmtime, strftime
from picamera.array import PiRGBArray
from picamera import PiCamera
from hough_transforms import h_transforms

min_angle = input('min_angle: ')
max_angle = input('max_angle: ')
min_value = input('min_val: ')
max_value = input('max_val: ')
units = input('units: ')

try:
#	camera = PiCamera();camera.resolution = (HEIGHT, WIDTH);camera.framerate = FRAMERATE;raw_capture = PiRGBArray(camera, size=(HEIGHT, WIDTH));time.sleep(0.1)
	camera = PiCamera();camera.resolution = (640, 480);camera.framerate = 32;raw_capture = PiRGBArray(camera, size=(640, 480));time.sleep(0.1)

	for frame in camera.capture_continuous(raw_capture, format="bgr", use_video_port=True):
				img = frame.array
				cv2.imshow('Analog Gauge Reader', img)

				try:
					t = strftime("%d-%m-%Y | %H:%M:%S", gmtime())
					val, units = h_transforms(img, min_angle, max_angle, min_value, max_value, units)
					print("[%s] Current reading: %s %s" % (t, ("%.2f" % val), units))
					
				except:
					print("[{timestamp}] No valve detected.".format(timestamp=t))
			
				if(cv2.waitKey(30) & 0xff == ord('q')):
					print('\n >>> Exiting...\n')
					break

				raw_capture.truncate(0)
#		raw_capture.seek(0)
			
except:
	print("CAMERA_ERROR\n")
