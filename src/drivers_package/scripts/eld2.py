#!/usr/bin/env python
import rospy
import swri_rospy
import time
from geometry_msgs.msg import  Twist
from std_msgs.msg import Int16, Int32, Bool, Float64,Int64
import numpy as np
import serial

rospy.init_node("LeadShine",  anonymous=True)
rospy.loginfo(" %s started" % rospy.get_name())


class DifferentialDrive():
	def __init__(self):
		try:
			self.ser = serial.Serial('/dev/DRIVER', 9600, timeout = 0.3, parity=serial.PARITY_EVEN, bytesize=serial.EIGHTBITS,stopbits=serial.STOPBITS_ONE)
			rospy.loginfo("Drive connected")
		except:
			rospy.logfatal('Cannot open the port %s', '/dev/dd')
			rospy.signal_shutdown("Cannot open the port. Node shutting down.")
		self.speed_limit = 452 #813 for 24 V supply, 1206 for 48 V supply
		self.x_limit = 0.19 #useless
		self.z_limit = 1 #useless
		self.rate = rospy.get_param('rate',20.0)
		self.rate = rospy.Rate(self.rate)
		self.talker()
		self.listener()

		

		self.front_left_motor = '\x03'
		self.front_right_motor = '\x04'
		self.back_left_motor = '\x02'
		self.back_right_motor = '\x01'
		self.wheel_radius = 0.107
		self.robot_width = 0.44
		self.last_x = 0.0
		self.last_z = 0.0


		self.ticks_final = 0
		self.alarm = False
		self.estop = False
		self.drive_ready = False
		self.read_delay = 0.025


		self.read_running_state (self.front_left_motor)
		self.read_running_state (self.front_right_motor)
		self.read_running_state (self.back_left_motor)
		self.read_running_state (self.back_right_motor)


	def crc16(self, data):
		data = bytearray(data)
		poly = 0xA001
		crc = 0xFFFF
		for b in data:
			crc ^= (0xFF & b)
			for _ in range(0, 8):
				if (crc & 0x0001):
					crc = ((crc >> 1) & 0xFFFF) ^ poly
				else:
					crc = ((crc >> 1) & 0xFFFF)
		crc = hex(crc)
		byte = '0xff'
		d1= int(hex((int(crc,16) & int(byte,16))),16)
		d2= int(hex((int(crc,16) >> 8)),16)
		data = chr(d1) + chr(d2)
		return data

	def read_running_state (self,motor):
		data = motor + "\x03\x10\x03\x00\x01"
		crc = self.crc16(data)
		final  = data + crc
		self.ser.write (bytes (final))
		time.sleep (self.read_delay)
		running_state = ""
		for i in range (0,7):
			running_state = running_state + self.ser.read().encode ('hex')
		if running_state [2:4] == "03":
			status = running_state [ 6:10 ]
			binary_status = bin ( int ("12", 16)) [2:]
			if binary_status [-2] == "1":
				self.drive_ready = True
				print 'motor', ord(motor),'enabled'
			else:
				print 'Please enable motor ', ord(motor) 
		else:
			rospy.logfatal("Unable to communicate with the drive %s", ord(motor))
		

	def cmd_cb (self, twist):
		'''if twist.linear.x >= self.x_limit:
			twist.linear.x = self.x_limit
		elif twist.linear.x <= (-1*self.x_limit):
			twist.linear.x = (-1*self.x_limit)
		if twist.angular.z >= self.z_limit:
			twist.angular.z = self.z_limit
		elif twist.angular.z <= (-1*self.z_limit):
			twist.angular.z = (-1*self.z_limit)'''
		if self.drive_ready:# and (not self.alarm):
			print "Received x: ", twist.linear.x, " z: ", twist.angular.z
			if twist.linear.x != self.last_x or twist.angular.z != self.last_z:
				rads_l = ((2*twist.linear.x) - (twist.angular.z*self.robot_width)) / (2*self.wheel_radius)
				rpm_l = rads_l * 9.54929659642538
				rpm_l = rpm_l * 10 #Rhino Gear ratio
				if abs (rpm_l) > self.speed_limit:
					rpm_l = self.speed_limit * int(np.sign (rads_l))
				rads_r = -1*((2*twist.linear.x) + (twist.angular.z*self.robot_width)) / (2*self.wheel_radius)
				rpm_r = rads_r * 9.54929659642538
				rpm_r = rpm_r * 10 #Rhino Gear ratio
				if abs (rpm_r) > self.speed_limit:
					rpm_r = self.speed_limit * int(np.sign (rads_r))
				print "rpm_l ", rpm_l, "rpm_r ", rpm_r
				self.write_speed(self.front_left_motor, rpm_l)
				self.write_speed(self.back_left_motor, rpm_l)
				self.write_speed(self.front_right_motor, rpm_r)
				self.write_speed(self.back_right_motor, rpm_r)
			self.last_x = twist.linear.x
			self.last_z = twist.angular.z
	def tohex(self, val, nbits):
  		return hex((val + (1 << nbits)) % (1 << nbits))

	def write_speed (self,motor,rpm):
		rpm = int (rpm)
		rpm_hex = self.tohex (rpm, 16) [2:]
		if len (rpm_hex) != 4:
			rpm_hex = ("0000" + rpm_hex) [-4:]
		rpm_hex = chr (int(rpm_hex [:2], 16)) + chr (int(rpm_hex [2:], 16))
		rpm_command = motor + "\x10\x62\x00\x00\x08\x10\x00\x02\x00\x00\x00\x00"+ rpm_hex  +"\x03\xe8\x03\xe8\x00\x00\x00\x10"
		rpm_command = (rpm_command + self.crc16 (rpm_command))
		speed_write_ack = ""
		self.ser.write (bytes (rpm_command))
		time.sleep (self.read_delay)
		while (self.ser.inWaiting ()):
			speed_write_ack = speed_write_ack + (self.ser.read ().encode('hex'))
		if (speed_write_ack != "011062000008de77") and (speed_write_ack != "021062000008de44" )  and (speed_write_ack != "041062000008de22" )  and (speed_write_ack != "031062000008df95" ):
			if (speed_write_ack [:4] == "0190") and (speed_write_ack [:4] == "0290"):
				print "Speed write CRC error in motor ", ord(motor)
			elif (speed_write_ack [:4] == "0103") and (speed_write_ack [:4] == "0203"):
				pass
				#print "Speed write error  in motor ", ord(motor), ": Serial Read in some parallel thread"
			else:
				print "Speed Write error in motor", ord(motor), "given rpm = ", rpm, "acknowledgement: ", speed_write_ack
		else: 
			print "Wrote speed in motor ", ord(motor), "rpm ", rpm

	def fb_read(self,motor):
		if self.drive_ready and (not (self.alarm or self.estop)):
			fb_encoder_command = motor + "\x03\x10\x14\x00\x02"
			crc = self.crc16(fb_encoder_command)
			final = fb_encoder_command + crc
			enc_str = ""
			self.ser.write (bytes (final))
			time.sleep (self.read_delay)
			while self.ser.inWaiting ():
				enc_str = enc_str + (self.ser.read().encode('hex'))
			#print enc_str
			ticks = self.encoder_parse (enc_str, motor)
			#print ticks, "ticks"
			return ticks

	def encoder_parse (self, enc, motor):
		motor_str = "0" + str(ord(motor))
		#if self.drive_ready:
		if enc [:6] != motor_str + "0304":
			if enc[:4] == motor_str + "83":
				print "Chesksum error in motor ", ord(motor), "  while sending command for encoder f/b"
			else:
				rospy.logwarn( "error while receiving command for encoder f/b %s", enc)
		else:
			ticks_str = enc [6:14]
			#print ticks_str,
			ticks = int (ticks_str, 16)
			ticks_final = -(ticks & 0x80000000) | (ticks & 0x7fffffff)
			#print ticks_final, ord(motor)
			return ticks_final

	def alarm_read(self, motor):
		fb_alarm_command = motor + "\x03\x22\x03\x00\x01"
		crc = self.crc16(fb_alarm_command)
		final = fb_alarm_command + crc
		self.ser.write (bytes (final))
		time.sleep (self.read_delay)
		alarm_read = ""
		while self.ser.inWaiting ():
			alarm_read = alarm_read + (self.ser.read().encode('hex'))
		motor_str = "0" + str(ord(motor))
		#print alarm_read
		if alarm_read [:4] == motor_str + "83":
			print "Chesksum error in motor ", ord(motor), " while sending command reading alarm" 
		else:
			alarm_code = alarm_read [6:10]
			if alarm_code != "0000":
				self.alarm = True
				if alarm_code == "0001":
					rospy.logwarn ("Over Current Error in motor %s", motor_str)
				elif alarm_code == "0002":
					rospy.logwarn ("Over Voltage Error in motor %s", motor_str)
				elif alarm_code == "0040":
					rospy.logwarn ("Current sampling circuit Error in motor %s", motor_str)
				elif alarm_code == "0080":
					rospy.logwarn ("Shaft locking Error in motor %s", motor_str)
				elif alarm_code == "0200":
					rospy.logwarn ("EPROM Error in motor %s", motor_str)
				elif alarm_code == "0100":
					rospy.logwarn ("Parameter Autotuning Error in motor %s", motor_str)
				elif alarm_code == "0020":
					rospy.logwarn ("Unknown error 0020 in motor %s, Possible reasons: PR Mode not enabled", motor_str)
				else:
					pass
					self.alarm = False
					rospy.logwarn ("Unknown error %s in motor %s", alarm_code, motor_str)
			else:
				self.alarm = False


	def estop_cb (self, msg):
		if msg.data:
			self.estop = True
			self.ser.reset_input_buffer()
			self.write_speed(self.front_left_motor, 0)
			self.write_speed(self.back_left_motor, 0)
			self.write_speed(self.front_right_motor, 0)
			self.write_speed(self.back_right_motor, 0)
		else:
			self.estop = False

	def read_cb(self,event):
		if self.drive_ready:

			enc_back_left = self.fb_read (self.back_left_motor)
			self.ticks_BL.publish(Int64(enc_back_left))
			self.alarm_read(self.back_left_motor)


			enc_back_right = self.fb_read (self.back_right_motor)
			self.ticks_BR.publish(Int64(enc_back_right))
			self.alarm_read(self.back_right_motor)


			enc_front_left = self.fb_read(self.front_left_motor)
			self.ticks_FL.publish(Int64(enc_front_left))
			self.alarm_read(self.front_left_motor)


			enc_front_right = self.fb_read(self.front_right_motor)
			self.ticks_FR.publish(Int64(enc_front_right))
			self.alarm_read(self.front_right_motor)


###############################################################################
	def listener(self):
		swri_rospy.Subscriber('/cmd_vel', Twist, self.cmd_cb)
		rospy.Subscriber('/estop', Bool, self.estop_cb)
		swri_rospy.Timer (rospy.Duration(0.5), self.read_cb)


###########################################################################################
	def talker (self):
		self.ticks_FL = rospy.Publisher("/encoderTicks_FL", Int64, queue_size=10)
		self.ticks_BL = rospy.Publisher("/encoderTicks_BL", Int64, queue_size=10)
		self.ticks_FR = rospy.Publisher("/encoderTicks_FR", Int64, queue_size=10)
		self.ticks_BR = rospy.Publisher("/encoderTicks_BR", Int64, queue_size=10)
		


###############################################################################




if __name__ == '__main__':

	diffTf = DifferentialDrive()
	swri_rospy.spin()

	

