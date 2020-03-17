// Auto-generated. Do not edit!

// (in-package robo_waiter.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Mile {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.table_name = null;
      this.table_direction = null;
      this.table_duration = null;
    }
    else {
      if (initObj.hasOwnProperty('table_name')) {
        this.table_name = initObj.table_name
      }
      else {
        this.table_name = '';
      }
      if (initObj.hasOwnProperty('table_direction')) {
        this.table_direction = initObj.table_direction
      }
      else {
        this.table_direction = '';
      }
      if (initObj.hasOwnProperty('table_duration')) {
        this.table_duration = initObj.table_duration
      }
      else {
        this.table_duration = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Mile
    // Serialize message field [table_name]
    bufferOffset = _serializer.string(obj.table_name, buffer, bufferOffset);
    // Serialize message field [table_direction]
    bufferOffset = _serializer.string(obj.table_direction, buffer, bufferOffset);
    // Serialize message field [table_duration]
    bufferOffset = _serializer.int32(obj.table_duration, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Mile
    let len;
    let data = new Mile(null);
    // Deserialize message field [table_name]
    data.table_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [table_direction]
    data.table_direction = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [table_duration]
    data.table_duration = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.table_name.length;
    length += object.table_direction.length;
    return length + 12;
  }

  static datatype() {
    // Returns string type for a message object
    return 'robo_waiter/Mile';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a034aa34a43b47ed728f083557e2842d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string table_name
    string table_direction
    int32 table_duration
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Mile(null);
    if (msg.table_name !== undefined) {
      resolved.table_name = msg.table_name;
    }
    else {
      resolved.table_name = ''
    }

    if (msg.table_direction !== undefined) {
      resolved.table_direction = msg.table_direction;
    }
    else {
      resolved.table_direction = ''
    }

    if (msg.table_duration !== undefined) {
      resolved.table_duration = msg.table_duration;
    }
    else {
      resolved.table_duration = 0
    }

    return resolved;
    }
};

module.exports = Mile;
