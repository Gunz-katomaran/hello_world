# This Python file uses the following encoding: utf-8
"""autogenerated by genpy from husky_msgs/HuskyStatus.msg. Do not edit."""
import sys
python3 = True if sys.hexversion > 0x03000000 else False
import genpy
import struct

import std_msgs.msg

class HuskyStatus(genpy.Message):
  _md5sum = "fd724379c53d89ec4629be3b235dc10d"
  _type = "husky_msgs/HuskyStatus"
  _has_header = True #flag to mark the presence of a Header object
  _full_text = """Header header

# MCU Uptime, in ms
uint32 uptime

# ROS Control loop frequency (PC-side)
float64 ros_control_loop_freq

# Current draw of platform components, in amps
float64 mcu_and_user_port_current
float64 left_driver_current
float64 right_driver_current

# Voltage of platform components, in volts
float64 battery_voltage
float64 left_driver_voltage
float64 right_driver_voltage

# Component temperatures, in C
float64 left_driver_temp
float64 right_driver_temp
float64 left_motor_temp
float64 right_motor_temp

# Battery capacity (Wh) and charge (%) estimate
uint16 capacity_estimate
float64 charge_estimate

# Husky error/stop conditions
bool timeout
bool lockout
bool e_stop
bool ros_pause
bool no_battery
bool current_limit

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
# 0: no frame
# 1: global frame
string frame_id

"""
  __slots__ = ['header','uptime','ros_control_loop_freq','mcu_and_user_port_current','left_driver_current','right_driver_current','battery_voltage','left_driver_voltage','right_driver_voltage','left_driver_temp','right_driver_temp','left_motor_temp','right_motor_temp','capacity_estimate','charge_estimate','timeout','lockout','e_stop','ros_pause','no_battery','current_limit']
  _slot_types = ['std_msgs/Header','uint32','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','float64','uint16','float64','bool','bool','bool','bool','bool','bool']

  def __init__(self, *args, **kwds):
    """
    Constructor. Any message fields that are implicitly/explicitly
    set to None will be assigned a default value. The recommend
    use is keyword arguments as this is more robust to future message
    changes.  You cannot mix in-order arguments and keyword arguments.

    The available fields are:
       header,uptime,ros_control_loop_freq,mcu_and_user_port_current,left_driver_current,right_driver_current,battery_voltage,left_driver_voltage,right_driver_voltage,left_driver_temp,right_driver_temp,left_motor_temp,right_motor_temp,capacity_estimate,charge_estimate,timeout,lockout,e_stop,ros_pause,no_battery,current_limit

    :param args: complete set of field values, in .msg order
    :param kwds: use keyword arguments corresponding to message field names
    to set specific fields.
    """
    if args or kwds:
      super(HuskyStatus, self).__init__(*args, **kwds)
      #message fields cannot be None, assign default values for those that are
      if self.header is None:
        self.header = std_msgs.msg.Header()
      if self.uptime is None:
        self.uptime = 0
      if self.ros_control_loop_freq is None:
        self.ros_control_loop_freq = 0.
      if self.mcu_and_user_port_current is None:
        self.mcu_and_user_port_current = 0.
      if self.left_driver_current is None:
        self.left_driver_current = 0.
      if self.right_driver_current is None:
        self.right_driver_current = 0.
      if self.battery_voltage is None:
        self.battery_voltage = 0.
      if self.left_driver_voltage is None:
        self.left_driver_voltage = 0.
      if self.right_driver_voltage is None:
        self.right_driver_voltage = 0.
      if self.left_driver_temp is None:
        self.left_driver_temp = 0.
      if self.right_driver_temp is None:
        self.right_driver_temp = 0.
      if self.left_motor_temp is None:
        self.left_motor_temp = 0.
      if self.right_motor_temp is None:
        self.right_motor_temp = 0.
      if self.capacity_estimate is None:
        self.capacity_estimate = 0
      if self.charge_estimate is None:
        self.charge_estimate = 0.
      if self.timeout is None:
        self.timeout = False
      if self.lockout is None:
        self.lockout = False
      if self.e_stop is None:
        self.e_stop = False
      if self.ros_pause is None:
        self.ros_pause = False
      if self.no_battery is None:
        self.no_battery = False
      if self.current_limit is None:
        self.current_limit = False
    else:
      self.header = std_msgs.msg.Header()
      self.uptime = 0
      self.ros_control_loop_freq = 0.
      self.mcu_and_user_port_current = 0.
      self.left_driver_current = 0.
      self.right_driver_current = 0.
      self.battery_voltage = 0.
      self.left_driver_voltage = 0.
      self.right_driver_voltage = 0.
      self.left_driver_temp = 0.
      self.right_driver_temp = 0.
      self.left_motor_temp = 0.
      self.right_motor_temp = 0.
      self.capacity_estimate = 0
      self.charge_estimate = 0.
      self.timeout = False
      self.lockout = False
      self.e_stop = False
      self.ros_pause = False
      self.no_battery = False
      self.current_limit = False

  def _get_types(self):
    """
    internal API method
    """
    return self._slot_types

  def serialize(self, buff):
    """
    serialize message into buffer
    :param buff: buffer, ``StringIO``
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_I11dHd6B.pack(_x.uptime, _x.ros_control_loop_freq, _x.mcu_and_user_port_current, _x.left_driver_current, _x.right_driver_current, _x.battery_voltage, _x.left_driver_voltage, _x.right_driver_voltage, _x.left_driver_temp, _x.right_driver_temp, _x.left_motor_temp, _x.right_motor_temp, _x.capacity_estimate, _x.charge_estimate, _x.timeout, _x.lockout, _x.e_stop, _x.ros_pause, _x.no_battery, _x.current_limit))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize(self, str):
    """
    unpack serialized message in str into this message instance
    :param str: byte array of serialized message, ``str``
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 108
      (_x.uptime, _x.ros_control_loop_freq, _x.mcu_and_user_port_current, _x.left_driver_current, _x.right_driver_current, _x.battery_voltage, _x.left_driver_voltage, _x.right_driver_voltage, _x.left_driver_temp, _x.right_driver_temp, _x.left_motor_temp, _x.right_motor_temp, _x.capacity_estimate, _x.charge_estimate, _x.timeout, _x.lockout, _x.e_stop, _x.ros_pause, _x.no_battery, _x.current_limit,) = _struct_I11dHd6B.unpack(str[start:end])
      self.timeout = bool(self.timeout)
      self.lockout = bool(self.lockout)
      self.e_stop = bool(self.e_stop)
      self.ros_pause = bool(self.ros_pause)
      self.no_battery = bool(self.no_battery)
      self.current_limit = bool(self.current_limit)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill


  def serialize_numpy(self, buff, numpy):
    """
    serialize message with numpy array types into buffer
    :param buff: buffer, ``StringIO``
    :param numpy: numpy python module
    """
    try:
      _x = self
      buff.write(_struct_3I.pack(_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs))
      _x = self.header.frame_id
      length = len(_x)
      if python3 or type(_x) == unicode:
        _x = _x.encode('utf-8')
        length = len(_x)
      if python3:
        buff.write(struct.pack('<I%sB'%length, length, *_x))
      else:
        buff.write(struct.pack('<I%ss'%length, length, _x))
      _x = self
      buff.write(_struct_I11dHd6B.pack(_x.uptime, _x.ros_control_loop_freq, _x.mcu_and_user_port_current, _x.left_driver_current, _x.right_driver_current, _x.battery_voltage, _x.left_driver_voltage, _x.right_driver_voltage, _x.left_driver_temp, _x.right_driver_temp, _x.left_motor_temp, _x.right_motor_temp, _x.capacity_estimate, _x.charge_estimate, _x.timeout, _x.lockout, _x.e_stop, _x.ros_pause, _x.no_battery, _x.current_limit))
    except struct.error as se: self._check_types(struct.error("%s: '%s' when writing '%s'" % (type(se), str(se), str(_x))))
    except TypeError as te: self._check_types(ValueError("%s: '%s' when writing '%s'" % (type(te), str(te), str(_x))))

  def deserialize_numpy(self, str, numpy):
    """
    unpack serialized message in str into this message instance using numpy for array types
    :param str: byte array of serialized message, ``str``
    :param numpy: numpy python module
    """
    try:
      if self.header is None:
        self.header = std_msgs.msg.Header()
      end = 0
      _x = self
      start = end
      end += 12
      (_x.header.seq, _x.header.stamp.secs, _x.header.stamp.nsecs,) = _struct_3I.unpack(str[start:end])
      start = end
      end += 4
      (length,) = _struct_I.unpack(str[start:end])
      start = end
      end += length
      if python3:
        self.header.frame_id = str[start:end].decode('utf-8')
      else:
        self.header.frame_id = str[start:end]
      _x = self
      start = end
      end += 108
      (_x.uptime, _x.ros_control_loop_freq, _x.mcu_and_user_port_current, _x.left_driver_current, _x.right_driver_current, _x.battery_voltage, _x.left_driver_voltage, _x.right_driver_voltage, _x.left_driver_temp, _x.right_driver_temp, _x.left_motor_temp, _x.right_motor_temp, _x.capacity_estimate, _x.charge_estimate, _x.timeout, _x.lockout, _x.e_stop, _x.ros_pause, _x.no_battery, _x.current_limit,) = _struct_I11dHd6B.unpack(str[start:end])
      self.timeout = bool(self.timeout)
      self.lockout = bool(self.lockout)
      self.e_stop = bool(self.e_stop)
      self.ros_pause = bool(self.ros_pause)
      self.no_battery = bool(self.no_battery)
      self.current_limit = bool(self.current_limit)
      return self
    except struct.error as e:
      raise genpy.DeserializationError(e) #most likely buffer underfill

_struct_I = genpy.struct_I
_struct_I11dHd6B = struct.Struct("<I11dHd6B")
_struct_3I = struct.Struct("<3I")
