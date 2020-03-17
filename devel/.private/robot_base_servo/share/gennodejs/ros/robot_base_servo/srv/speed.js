// Auto-generated. Do not edit!

// (in-package robot_base_servo.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class speedRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type speedRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type speedRequest
    let len;
    let data = new speedRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_base_servo/speedRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd41d8cd98f00b204e9800998ecf8427e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new speedRequest(null);
    return resolved;
    }
};

class speedResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.speed_1 = null;
      this.speed_2 = null;
      this.speed_3 = null;
      this.speed_4 = null;
    }
    else {
      if (initObj.hasOwnProperty('speed_1')) {
        this.speed_1 = initObj.speed_1
      }
      else {
        this.speed_1 = 0;
      }
      if (initObj.hasOwnProperty('speed_2')) {
        this.speed_2 = initObj.speed_2
      }
      else {
        this.speed_2 = 0;
      }
      if (initObj.hasOwnProperty('speed_3')) {
        this.speed_3 = initObj.speed_3
      }
      else {
        this.speed_3 = 0;
      }
      if (initObj.hasOwnProperty('speed_4')) {
        this.speed_4 = initObj.speed_4
      }
      else {
        this.speed_4 = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type speedResponse
    // Serialize message field [speed_1]
    bufferOffset = _serializer.int32(obj.speed_1, buffer, bufferOffset);
    // Serialize message field [speed_2]
    bufferOffset = _serializer.int32(obj.speed_2, buffer, bufferOffset);
    // Serialize message field [speed_3]
    bufferOffset = _serializer.int32(obj.speed_3, buffer, bufferOffset);
    // Serialize message field [speed_4]
    bufferOffset = _serializer.int32(obj.speed_4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type speedResponse
    let len;
    let data = new speedResponse(null);
    // Deserialize message field [speed_1]
    data.speed_1 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [speed_2]
    data.speed_2 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [speed_3]
    data.speed_3 = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [speed_4]
    data.speed_4 = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_base_servo/speedResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f4e6290d51987b0b075a95509c473580';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 speed_1
    int32 speed_2
    int32 speed_3
    int32 speed_4
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new speedResponse(null);
    if (msg.speed_1 !== undefined) {
      resolved.speed_1 = msg.speed_1;
    }
    else {
      resolved.speed_1 = 0
    }

    if (msg.speed_2 !== undefined) {
      resolved.speed_2 = msg.speed_2;
    }
    else {
      resolved.speed_2 = 0
    }

    if (msg.speed_3 !== undefined) {
      resolved.speed_3 = msg.speed_3;
    }
    else {
      resolved.speed_3 = 0
    }

    if (msg.speed_4 !== undefined) {
      resolved.speed_4 = msg.speed_4;
    }
    else {
      resolved.speed_4 = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: speedRequest,
  Response: speedResponse,
  md5sum() { return 'f4e6290d51987b0b075a95509c473580'; },
  datatype() { return 'robot_base_servo/speed'; }
};
