#!/usr/bin/env python
'''
This program is used to control Leadshine Servo driver , Get encoder data and Alarm status and publishes it.

'''
#Subscribed Topics: /cmd_vel, /emergency
#Published Topics: /encoderTicks_FL, /encoderTicks_FR, /encoderTicks_BR, /encoderTicks_BL, /lampState
#service Topics: /speed ,/drive_voltage
import swri_rospy
import rospy
import math
import time
import serial
import numpy as np
import atexit
#import graypy
import logging as log
from geometry_msgs.msg import  Twist
from std_msgs.msg import Int64 ,Int32,String,Bool
from std_srvs.srv import Trigger, TriggerResponse
from robot_base_servo.srv import speed,speedResponse,voltage,voltageResponse

a = [0] *8
b = 0
pos_d = [0] * 9
alrm_d = [0] * 7
alrm_clr_d = [0] * 8
status_d = [0] * 8
status_rd = [0] * 9
e_stop_d = [0] * 8
robot_width = 0.4
com_delay = 0.01
stat_1 = False
stat_2 = False
stat_3 = False
stat_4 = False
last_x = 0
last_z = 0
E_stop = False
last_e_stop = False
alarm_status = False
RED = 'R'
GREEN = 'G'
YELLOW = 'Y'


logging = log.getLogger("Robo-Base")
logging.setLevel(log.DEBUG)

#handler = graypy.GELFUDPHandler("139.59.3.87", 12201, localname="servo_drive_node")
#logging.addHandler(handler)

try:
        ser = serial.Serial(port='/dev/DRIVER',baudrate=115200, timeout=1, parity=serial.PARITY_EVEN, bytesize=serial.EIGHTBITS,stopbits=serial.STOPBITS_ONE)
        port_status = True
	logging.info("INFO:   Port  is Available")
        rospy.loginfo("INFO:   Port  is Available")
except:
        port_status = False
	logging.warning("WARNING:Port is Not Available")
        rospy.loginfo("WARNING:Port is Not Available")
        time.sleep(2)

FL = '\x01'
FR = '\x02'
BL = '\x03'
BR = '\x04'

m_read = '\x03'
s_write = '\x06'
m_write = '\x10'

add_spd = '\x62\x00'
add_pos = '\x60\x2C'
add_alrm = '\x01\xF2'
add_alrm_clr = '\x01\x9A'
add_e_stop = '\x60\x02'

add_stat_1 = '\x01\x91'
add_stat_2 = '\x01\x92'



rospy.init_node("servo_driver",  anonymous=True)
nodename = rospy.get_name()
logging.info("INFO:   %s started" % nodename)
rospy.loginfo("INFO:   %s started" % nodename)
lamp_pub = rospy.Publisher('lampState', String, queue_size=10)
acceleration = rospy.get_param(rospy.get_namespace() + 'acceleration', 500)
deceleration = rospy.get_param(rospy.get_namespace() + 'deceleration', 500)
wheel_radius_FL = rospy.get_param(rospy.get_namespace() + 'wheel_radius_FL',0.1273)
wheel_radius_FR = rospy.get_param(rospy.get_namespace() + 'wheel_radius_FR',0.1273)
wheel_radius_BL = rospy.get_param(rospy.get_namespace() + 'wheel_radius_BL',0.1273)
wheel_radius_BR = rospy.get_param(rospy.get_namespace() + 'wheel_radius_BR',0.1273)
gear_ratio = rospy.get_param(rospy.get_namespace() + 'gear_ratio',20)
max_speed_p = rospy.get_param(rospy.get_namespace() + 'max_speed_p',1800)
max_speed_n = rospy.get_param(rospy.get_namespace() + 'max_speed_n',-1800)
logging.info("INFO:   Acceleration: %s",acceleration)
rospy.loginfo("INFO:   Acceleration: %s",acceleration)
logging.info("INFO:   Deceleration: %s",deceleration)
rospy.loginfo("INFO:   Deceleration: %s",deceleration)

##__convert integer to HEX__##
def tohex(val,shift):
  return hex((val + (1 << shift)) % (1 << shift))

##__calculate crc value__##
def crc16(data):
    '''
    CRC-16-ModBus Algorithm
    '''
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
    crc = tohex(crc,16)
    byte = '0xff'
    d1= int(tohex((int(crc,16) & int(byte,16)),16),16)
    d2= int(tohex((int(crc,16) >> 8),16),16)
    data = chr(d1) + chr(d2)
    return data

##__convert motor number into appropriate name__##
def name(motor):
	no = ord(motor)
	if no == 1:
		motor_name = 'FL'
	elif no == 2:
		motor_name = 'FR'
	elif no == 3:
		motor_name = 'BR'
	elif no == 4:
		motor_name = 'BL'
	return motor_name

##__check if the speed write is done sussessfully__##
def write_chk(motor,val):
    global status
    if motor == 1:
        if val == '\x01\x10\x62\x00\x00\x08\xde\x77':
            stat_1 = 1
        else:
            stat_1 = 0
	    logging.error("ERROR:  %s Motor: Write Failed!", name(motor))
	    rospy.loginfo("ERROR:  %s Motor: Write Failed!", name(motor))
    elif motor == 2:
        if val == '\x02\x10\x62\x00\x00\x08\xde\x44':
            stat_2 = 1
        else:
            stat_2 = 0
	    logging.error("ERROR:  %s Motor: Write Failed!", name(motor))
            rospy.loginfo("ERROR:  %s Motor: Write Failed!", name(motor))
    elif motor == 3:
        if val == '\x03\x10\x62\x00\x00\x08\xdf\x95':
            stat_3 = 1
        else:
            stat_3 = 0
	    logging.error("ERROR:  %s Motor: Write Failed!", name(motor))
            rospy.loginfo("ERROR:  %s Motor: Write Failed!", name(motor))
    elif motor == 4:
        if val == '\x04\x10\x62\x00\x00\x08\xde\x22':
            stat_4 = 1
        else:
            stat_4 = 0
	    logging.error("ERROR:  %s Motor: Write Failed!", name(motor))
            rospy.loginfo("ERROR:  %s Motor: Write Failed!", name(motor))

##__convert input integer data to a 16 BIT ASCII HEX format__##
def todata(val):
    val = tohex(val,16)
    byte = '0xff'
    d2= int(tohex((int(val,16) & int(byte,16)),16),16)
    d1= int(tohex((int(val,16) >> 8),16),16)
    data = chr(d1) + chr(d2)
    return data

##__calculate the final HEX data of speed to be written to the driver__##
def calc(motor,speed):
    data = motor + m_write + add_spd + '\x00\x08\x10\x00\x02\x00\x00\x00\x00' + speed + acc + dcc + '\x00\x00\x00\x10'
    crc = crc16(data)
    data = data + crc
    return data

##__writes the speed data to the driver and reads the accknowledgement__##
def motor_control(motor,val):
    global acc,dcc,a,b
    speed = todata(val)
    acc = todata(acceleration)
    dcc = todata(deceleration)
    data = calc(motor,speed)
    ser.write(bytes(data))
    time.sleep(com_delay)
    out = ''
    try:
        for i in range(0,8):
            a[i] = ser.read()
            out += a[i]
        write_chk(a[0],out)
        return data
    except:
        pass

##__reads the encoder value__##
def pos_read(motor):
    get_pos = motor + m_read + add_pos + '\x00\x02'
    crc = crc16(get_pos)
    get_pos = get_pos + crc
    ser.write(bytes(get_pos))
    time.sleep(com_delay)
    out = ''
    try:
	    for i in range(0,9):
	        pos_d[i] = ser.read()
	        out += pos_d[i]
            position = ord(pos_d[3])*16**6+ ord(pos_d[4])*16**4 + ord(pos_d[5])*16**2 + ord(pos_d[6])
	    return position
    except:
	    pass

##__reads the alarm__##
def alarm_read(motor):
    global alarm
    get_alrm = motor + m_read + add_alrm + '\x00\x01'
    crc = crc16(get_alrm)
    get_alrm = get_alrm + crc
    ser.write(bytes(get_alrm))
    time.sleep(com_delay)
    try:
        for i in range(0,7):
            alrm_d[i] = ser.read()
        data1 = tohex(ord(alrm_d[3]),16)
        data2 = tohex(ord(alrm_d[4]),16)
        data = data1[2:] + data2[2:]
        data = data[-3:]
        alarm = alarm_chk(alrm_d[0],data)
        if alarm:
            alarm_stop(True)
            lamp_pub.publish(RED)
	    logging.info("INFO:   Lamp State: RED")
            alarm = alarm_clear(motor)
    except:
        pass

##__clears the alarm__##
def alarm_clear(motor):
    global alarm_status,alrm_clr_d
    logging.info("INFO:   clearing Alarm in %s Motor",name(motor))
    rospy.loginfo("INFO:   clearing Alarm in %s Motor",name(motor))
    alrm_clr = motor + s_write + add_alrm_clr + '\x77\x77'
    crc = crc16(alrm_clr)
    alrm_clr = alrm_clr + crc
    ser.write(bytes(alrm_clr))
    time.sleep(com_delay)
    #rospy.loginfo(('alarm',alrm_clr)
    out = ''
    try:
        for i in range(0,8):
            alrm_clr_d[i] = ser.read()
            out += alrm_clr_d[i]
        #rospy.loginfo(('alarm out',out)
        if out == alrm_clr:
	    logging.info("INFO:   Alarm Cleared in %s Motor",name(motor))
            rospy.loginfo("INFO:   Alarm Cleared in %s Motor",name(motor))
            lamp_pub.publish(GREEN)
	    logging.info("INFO:   Lamp State: GREEN")
            alarm_status = False
        return alarm_status
    except:
        pass

##__check the type of alarm__##
def alarm_chk(motor,data):
        global alarm_status
	
        if data == '00':
            alarm_status = False
	    #rospy.loginfo("%s Motor: No Alarm",name(motor))
        elif data == '0e1' or data == '0e0':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: Over Current!", name(motor))
            rospy.loginfo("ERROR:  %s Motor: Over Current!", name(motor))
        elif data == '100':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: Over Load!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Over Load!",name(motor))
        elif data == '180':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: Position Error Over-Large!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Position Error Over-Large!",name(motor))
        elif data == '0a0':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: Over Speed!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Over Speed!",name(motor))
        elif data == '0a1':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: Speed Out of Control!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Speed Out of Control!",name(motor))
        elif data == '0d0':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: DC Bus Under Voltage!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: DC Bus Under Voltage!",name(motor))
        elif data == '0c0':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: DC Bus Over Voltage!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: DC Bus Over Voltage!",name(motor))
        elif data == '171' or data == '172':
            alarm_status = True
	    logging.info("ERROR:  %s Motor: Encoder Parameters Read Error!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Encoder Parameters Read Error!",name(motor))
        elif data == '190':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: Excessive Vibration!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Excessive Vibration!",name(motor))
        elif data == '150':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: Encoder Line Breaked!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Encoder Line Breaked!",name(motor))
        elif data == '151' or data == '170':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: Encoder Data Error!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Encoder Data Error!",name(motor))
        elif data == '152':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: Initilized Position of Encoder Error!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Initilized Position of Encoder Error!",name(motor))
        elif data == '240':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: CRC Verification Error When EEPROM Parameter is Saved!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: CRC Verification Error When EEPROM Parameter is Saved!",name(motor))
        elif data == '570':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: This Error has no Documentation!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: This Error has no Documentation!",name(motor))
        elif data == '120':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: Resistance Dischage Circuit Over-Load!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Resistance Dischage Circuit Over-Load!",name(motor))
        elif data == '153':
            alarm_status = True
	    logging.info("ERROR:  %s Motor: Encoder Battery Error!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: Encoder Battery Error!",name(motor))
        elif data == '210' or data == '211' or data == '212':
            alarm_status = True
	    logging.error("ERROR:  %s Motor: I/F Input Interface Allocation Error!",name(motor))
            rospy.loginfo("ERROR:  %s Motor: I/F Input Interface Allocation Error!",name(motor))
        else:
            alarm_status = True
	    
	    logging.error("ERROR: %s in %s Motor: Unknown Error!!!",data,name(motor))
            rospy.loginfo("ERROR: %s in %s Motor: Unknown Error!!!",data,name(motor))
        return alarm_status

##__write which data to be stored on which register to read the status__##
def status_write(motor):
    global status_d,motor_status
    status = motor + m_write + '\x01\x91\x00\x02\x04\x01\x40\x00\x41'
    crc = crc16(status)
    status = status + crc
    ser.write(bytes(status))
    time.sleep(com_delay)
    out = ''
    try:
    	for i in range(0,8):
            status_d[i] = ser.read()
	    out += status_d[i]
	output = status_d[0] + status_d[1] + status_d[2] + status_d[3] + status_d[4] + status_d[5]
	crc = crc16(output)
	calc = output + crc
	if calc == out:
    		motor_status = True
	else:
		motor_status = False
        return motor_status
    except:
	pass

##__reads the statuses DC Bus Voltage and speed of motor__## 
def status_read(motor,no):
    ser.flush()
    status = motor + m_read + '\x01\xF3\x00\x02'
    crc = crc16(status)
    status = status + crc
    ser.write(bytes(status))
    time.sleep(com_delay)
    try:
    	for i in range(0,9):
            status_rd[i] = ser.read()
        voltage = (ord(status_rd[3])*16**2 + ord(status_rd[4]))/10.0
        speed = ord(status_rd[5])*16**2 + ord(status_rd[6])
	if speed >= 32767:
		speed = speed - 65535
        if no == 1:
            return voltage
        elif no == 2:
            return speed
    except:
        pass

##__Emergency stops all the motors__##
def e_stop(val):
    global E_stop,last_e_stop
    E_stop = val.data
    if E_stop == True and last_e_stop == False:
	logging.warning("WARNING:Emergency Stop Pressed")
        rospy.loginfo("WARNING:Emergency Stop Pressed")
	lamp_pub.publish(YELLOW)
	logging.info("INFO: Lamp State: YELLOW")
        count = 0
        for i in range(0,4):
            count += 1
            motor = chr(count)
            e_stop = motor + s_write + add_e_stop + '\x00\x40'
            crc = crc16(e_stop)
            e_stop = e_stop + crc
            ser.write(bytes(e_stop))
	    time.sleep(com_delay)
            try:
                for i in range(0,8):
                    e_stop_d[i] = ser.read()
		logging.info("INFO:   %s Motor: Emergency Stop Success",name(motor))
		rospy.loginfo("INFO:   %s Motor: Emergency Stop Success",name(motor))
		last_e_stop = E_stop
            except:
		logging.error("ERROR:  Unable to Emergency Stop! Try Again!")
		rospy.loginfo("ERROR:  Unable to Emergency Stop! Try Again!")
		last_e_stop = False
    elif E_stop == False and last_e_stop == True and run == True and alarm == False:
	lamp_pub.publish(GREEN)
	logging.info("INFO: Lamp State: GREEN")
	last_e_stop = E_stop

def alarm_stop(val):
    global alarm_stop_d
    alarm_stop_d = val
    if alarm_stop_d == True:
	logging.warning("WARNING:Alarm Emergency Stop")
        rospy.loginfo("WARNING:Alarm Emergency Stop")
        count = 0
        for i in range(0,4):
            count += 1
            motor = chr(count)
            e_stop = motor + s_write + add_e_stop + '\x00\x40'
            crc = crc16(e_stop)
            e_stop = e_stop + crc
            ser.write(bytes(e_stop))
	    time.sleep(com_delay)
            try:
                for i in range(0,8):
                    e_stop_d[i] = ser.read()
		logging.info("INFO:   %s Motor: Alarm Emergency Stop Success",name(motor))
		rospy.loginfo("INFO:   %s Motor: Alarm Emergency Stop Success",name(motor))
            except:
		logging.error("ERROR:  %s Unable to Alarm Emergency Stop! Try Again!",name(motor))
		rospy.loginfo("ERROR:  %s Unable to Alarm Emergency Stop! Try Again!",name(motor))
    elif alarm_stop_d == False:
	pass

def speed_lim(data):
	global max_speed_p,max_speed_n
	if data >= max_speed_p:
                speed = max_speed_p
        elif data <= max_speed_n:
                speed = max_speed_n
	else:
		speed = data
	return speed

def cb(twist):
    global last_x,last_z,gear_ratio
    #only enable speed write if all the motors are connected and there is no alarm and no emergerncy stop
    if run == True and alarm_status == False and E_stop == False:
        x = twist.linear.x
        z = twist.angular.z
	if x >= 1.5:
                x = 1.5
        elif x <= -1.5:
                x = -1.5
	if z >= 2.0:
                z = 2.0
        elif z <= -2.0:
                z = -2.0
        if last_x != x or last_z != z:
            rpm_FR = -1 * (x + z*robot_width/2) / wheel_radius_FR
            rpm_FR =rpm_FR *9.54929659642538
            speed_FR = int(rpm_FR * gear_ratio)
	    speed_FR = speed_lim(speed_FR)

	    rpm_BR = -1 * (x + z*robot_width/2) / wheel_radius_BR
            rpm_BR =rpm_BR *9.54929659642538
            speed_BR = int(rpm_BR * gear_ratio)
	    speed_BR = speed_lim(speed_BR)

            rpm_FL = (x - z*robot_width/2) / wheel_radius_FL
            rpm_FL =rpm_FL *9.54929659642538
            speed_FL = int(rpm_FL * gear_ratio)
	    speed_FL = speed_lim(speed_FL)

	    rpm_BL = (x - z*robot_width/2) / wheel_radius_BL
            rpm_BL =rpm_BL *9.54929659642538
            speed_BL = int(rpm_BL * gear_ratio)
	    speed_BL = speed_lim(speed_BL)

	    logging.info("FR: %s FL: %s BR: %s BL: %s",speed_FR,speed_FL,speed_BR,speed_BL)
	    rospy.loginfo("FR: %s FL: %s BR: %s BL: %s",speed_FR,speed_FL,speed_BR,speed_BL)
            motor_1= motor_control(FL,speed_FL)
       	    motor_2= motor_control(FR,speed_FR)

            motor_3= motor_control(BL,speed_BL)
            motor_4= motor_control(BR,speed_BR)
            last_x = x
            last_z = z
    else:
	logging.info("The motors are not ready to run")
        rospy.loginfo("The motors are not ready to run")

##__reads and publishes encoder data__##
def enc_cb(event):
    enc1 = pos_read(FL)
    enc1_pub.publish(Int64(enc1))

    enc2 = pos_read(FR)
    enc2_pub.publish(Int64(enc2))

    enc3 = pos_read(BL)
    enc3_pub.publish(Int64(enc3))

    enc4 = pos_read(BR)
    enc4_pub.publish(Int64(enc4))

##__reads alarm data__##
def alarm_cb(event):
    alarm1 = alarm_read(FL)

    alarm2 = alarm_read(FR)

    alarm3 = alarm_read(BL)

    alarm4 = alarm_read(BR)

##__reads and publishes motor speed__##
def status_cb(request):
	    print 'speed service called'
	    speed_1 = status_read(FL,2)

	    speed_2 = status_read(FR,2)

	    speed_3 = status_read(BL,2)

	    speed_4 = status_read(BR,2)

	    logging.info("INFO:   Speed: FL: %s FR: %s BL: %s BR: %s",speed_1,speed_2,speed_3,speed_4)

	    return speedResponse(speed_1 = speed_1,speed_2 = speed_2,speed_3 = speed_3,speed_4 = speed_4)

##__reads the voltage__##
def voltage_cb(request):
	    print 'voltage service called'
	    volt_1 = status_read(FL,1)

	    volt_2 = status_read(FR,1)

	    volt_3 = status_read(BL,1)

	    volt_4 = status_read(BR,1)

	    logging.info("INFO:   Voltage: FL: %s FR: %s BL: %s BR: %s",volt_1,volt_2,volt_3,volt_4)

	    return voltageResponse(volt_1 = volt_1,volt_2 = volt_2,volt_3 = volt_3,volt_4 = volt_4)

##__check if the motors are connected or not__##
def motor_stat(motor):
    if status_write(motor):
	logging.info("INFO:   %s Motor: Connected",name(motor))
        rospy.loginfo("INFO:   %s Motor: Connected",name(motor))
        return True
    else:
	logging.warning("WARNING:%s Motor: Not Connected",name(motor))
        rospy.loginfo("WARNING:%s Motor: Not Connected",name(motor))
        return False

def motor_check():
	global run
	stat_1 = motor_stat(FL)
	stat_2 = motor_stat(FR)
	stat_3 = motor_stat(BR)
	stat_4 = motor_stat(BL)
	##__enable or disable initial speed write depending on the connection status of all motors__##
	if(stat_1 == True and stat_2 == True and stat_3 == True and stat_4 == True):
	    run = True
	    logging.info("INFO:   Ready to run")
	    rospy.loginfo("INFO:   Ready to run")
	    time.sleep(0.3)
	    lamp_pub.publish(GREEN)
	    logging.info("INFO: Lamp State: GREEN")
	else:
	    run = False
	    logging.warning("WARNING:Not Ready to run")
	    rospy.loginfo("WARNING:Not Ready to run")

def exit_stop():
	motor_control(FL,0)
	motor_control(FR,0)
	motor_control(BL,0)
	motor_control(BR,0)
	lamp_pub.publish(YELLOW)
	logging.warning("WARNING:Servo Driver Node closed! Stopped all motors!")
	rospy.loginfo("WARNING:Servo Driver Node closed! Stopped all motors!")

if __name__ == '__main__':
    motor_check()
    enc1_pub = rospy.Publisher("/encoderTicks_FL", Int64, queue_size=10)
    enc2_pub = rospy.Publisher("/encoderTicks_FR", Int64, queue_size=10)
    enc3_pub = rospy.Publisher("/encoderTicks_BL", Int64, queue_size=10)
    enc4_pub = rospy.Publisher("/encoderTicks_BR", Int64, queue_size=10)

    speed_service = rospy.Service('/speed', speed, status_cb)

    speed_service = rospy.Service('/drive_voltage', voltage, voltage_cb)

    swri_rospy.Subscriber('/cmd_vel', Twist, cb)

    swri_rospy.Subscriber('/emergency', Bool, e_stop)

    swri_rospy.Timer(rospy.Duration(0.13), enc_cb)

    swri_rospy.Timer(rospy.Duration(1.1), alarm_cb)


    swri_rospy.spin()

    atexit.register(exit_stop)