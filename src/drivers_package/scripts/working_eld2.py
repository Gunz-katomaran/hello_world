import serial
import time
ser = serial.Serial(port='/dev/ttyUSB0',baudrate=57600, timeout=1, parity=serial.PARITY_NONE, bytesize=serial.EIGHTBITS,stopbits=serial.STOPBITS_ONE)

motor = '\x11'
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
acceleration = 500
deceleration = 500

##__convert integer to HEX__##
def tohex(val,shift):
return hex((val + (1 << shift)) % (1 << shift))
##__calculate crc value__##
def crc16(data):
'''
CRC-16-ModBus Algorithm
'''
#data = bytearray(data,"utf-8")
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
#print ("crc",hex(d1),hex(d2))
data = chr(d1) + chr(d2)
return data

##__convert input integer data to a 16 BIT ASCII HEX format__##
def todata(val):
val = tohex(val,16)
byte = '0xff'
d2= int(tohex((int(val,16) & int(byte,16)),16),16)
d1= int(tohex((int(val,16) >> 8),16),16)

data = chr(d1) + chr(d2)
#print ("to data",hex(d1),hex(d2))
return data

##__calculate the final HEX data of speed to be written to the driver__##
def calc(motor,speed):
data = motor + m_write + add_spd + '\x00\x08\x10\x00\x02\x00\x00\x00\x00' + speed + acc + dcc + '\x00\x00\x00\x10'
crc = crc16(data)
#print ("data",type(data))
data = data + crc
return data

def write_chk(motor,val):
global status
if motor == 1:
if val == '\x01\x10\x62\x00\x00\x08\xde\x77':
print ("write success")
stat_1 = 1
else:
stat_1 = 0
print ("write failed")
rospy.loginfo("ERROR: %s Motor: Write Failed!", name(motor))
elif motor == 2:
if val == '\x02\x10\x62\x00\x00\x08\xde\x44':
stat_2 = 1
else:
stat_2 = 0
rospy.loginfo("ERROR: %s Motor: Write Failed!", name(motor))
elif motor == 3:
if val == '\x03\x10\x62\x00\x00\x08\xdf\x95':
stat_3 = 1
else:
stat_3 = 0
rospy.loginfo("ERROR: %s Motor: Write Failed!", name(motor))
elif motor == 4:
if val == '\x04\x10\x62\x00\x00\x08\xde\x22':
stat_4 = 1
else:
stat_4 = 0
rospy.loginfo("ERROR: %s Motor: Write Failed!", name(motor))

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
for i in range(0,8):
a[i] = str(ser.read())
out += a[i]
print ((out,'utf-8'))
return data


##__reads the encoder value__##
def pos_read(motor):
get_pos = motor + m_read + add_pos + '\x00\x02'
crc = crc16(get_pos)
get_pos = get_pos + crc
#print (get_pos,'utf-8')
ser.write(bytes(get_pos))
time.sleep(com_delay)
out = ''
for i in range(0,9):
pos_d[i] = ser.read()
out += pos_d[i]
#ticks = ord(pos_d[3])*16**6+ ord(pos_d[4])*16**4 + ord(pos_d[5])*16**2 + ord(pos_d[6])
print ("outfb",(out,'utf-8'))
#position = ticks -(ticks & 0x80000000) | (ticks & 0x7fffffff)
#print ("fb",position)
#return position


##__reads the alarm__##
def alarm_read(motor):
global alarm
get_alrm = motor + m_read + add_alrm + '\x00\x01'
crc = crc16(get_alrm)
get_alrm = get_alrm + crc
ser.write(bytes(get_alrm,"utf-8"))
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
ser.write(bytes(alrm_clr,"utf-8"))
time.sleep(com_delay)
#rospy.loginfo(('alarm',alrm_clr)
out = ''
try:
for i in range(0,8):
alrm_clr_d[i] = ser.read()
out += alrm_clr_d[i]
#rospy.loginfo(('alarm out',out)
if out == alrm_clr:
rospy.loginfo("INFO:   Alarm Cleared in %s Motor",name(motor))
lamp_pub.publish(GREEN)
alarm_status = False
return alarm_status
except:
pass

while(True):
rpm = input("rpm:")
motor_control(motor,int(rpm))
pos_read(motor)
#print ("alarm",alarm_read(motor))