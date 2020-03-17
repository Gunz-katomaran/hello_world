// Auto-generated. Do not edit!

// (in-package my_change.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Sonic {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.no = null;
      this.distance1 = null;
      this.distance2 = null;
      this.distance3 = null;
      this.distance4 = null;
      this.distance5 = null;
    }
    else {
      if (initObj.hasOwnProperty('no')) {
        this.no = initObj.no
      }
      else {
        this.no = 0;
      }
      if (initObj.hasOwnProperty('distance1')) {
        this.distance1 = initObj.distance1
      }
      else {
        this.distance1 = 0.0;
      }
      if (initObj.hasOwnProperty('distance2')) {
        this.distance2 = initObj.distance2
      }
      else {
        this.distance2 = 0.0;
      }
      if (initObj.hasOwnProperty('distance3')) {
        this.distance3 = initObj.distance3
      }
      else {
        this.distance3 = 0.0;
      }
      if (initObj.hasOwnProperty('distance4')) {
        this.distance4 = initObj.distance4
      }
      else {
        this.distance4 = 0.0;
      }
      if (initObj.hasOwnProperty('distance5')) {
        this.distance5 = initObj.distance5
      }
      else {
        this.distance5 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Sonic
    // Serialize message field [no]
    bufferOffset = _serializer.int32(obj.no, buffer, bufferOffset);
    // Serialize message field [distance1]
    bufferOffset = _serializer.float32(obj.distance1, buffer, bufferOffset);
    // Serialize message field [distance2]
    bufferOffset = _serializer.float32(obj.distance2, buffer, bufferOffset);
    // Serialize message field [distance3]
    bufferOffset = _serializer.float32(obj.distance3, buffer, bufferOffset);
    // Serialize message field [distance4]
    bufferOffset = _serializer.float32(obj.distance4, buffer, bufferOffset);
    // Serialize message field [distance5]
    bufferOffset = _serializer.float32(obj.distance5, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Sonic
    let len;
    let data = new Sonic(null);
    // Deserialize message field [no]
    data.no = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [distance1]
    data.distance1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [distance2]
    data.distance2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [distance3]
    data.distance3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [distance4]
    data.distance4 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [distance5]
    data.distance5 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 24;
  }

  static datatype() {
    // Returns string type for a message object
    return 'my_change/Sonic';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '28ade20c4ac74f4cfe91fd6effaf9b2e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 no
    float32 distance1
    float32 distance2
    float32 distance3
    float32 distance4
    float32 distance5
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Sonic(null);
    if (msg.no !== undefined) {
      resolved.no = msg.no;
    }
    else {
      resolved.no = 0
    }

    if (msg.distance1 !== undefined) {
      resolved.distance1 = msg.distance1;
    }
    else {
      resolved.distance1 = 0.0
    }

    if (msg.distance2 !== undefined) {
      resolved.distance2 = msg.distance2;
    }
    else {
      resolved.distance2 = 0.0
    }

    if (msg.distance3 !== undefined) {
      resolved.distance3 = msg.distance3;
    }
    else {
      resolved.distance3 = 0.0
    }

    if (msg.distance4 !== undefined) {
      resolved.distance4 = msg.distance4;
    }
    else {
      resolved.distance4 = 0.0
    }

    if (msg.distance5 !== undefined) {
      resolved.distance5 = msg.distance5;
    }
    else {
      resolved.distance5 = 0.0
    }

    return resolved;
    }
};

module.exports = Sonic;
