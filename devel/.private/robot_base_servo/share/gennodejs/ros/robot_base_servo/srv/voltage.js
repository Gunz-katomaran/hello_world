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

class voltageRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
    }
    else {
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type voltageRequest
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type voltageRequest
    let len;
    let data = new voltageRequest(null);
    return data;
  }

  static getMessageSize(object) {
    return 0;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_base_servo/voltageRequest';
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
    const resolved = new voltageRequest(null);
    return resolved;
    }
};

class voltageResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.volt_1 = null;
      this.volt_2 = null;
      this.volt_3 = null;
      this.volt_4 = null;
    }
    else {
      if (initObj.hasOwnProperty('volt_1')) {
        this.volt_1 = initObj.volt_1
      }
      else {
        this.volt_1 = 0.0;
      }
      if (initObj.hasOwnProperty('volt_2')) {
        this.volt_2 = initObj.volt_2
      }
      else {
        this.volt_2 = 0.0;
      }
      if (initObj.hasOwnProperty('volt_3')) {
        this.volt_3 = initObj.volt_3
      }
      else {
        this.volt_3 = 0.0;
      }
      if (initObj.hasOwnProperty('volt_4')) {
        this.volt_4 = initObj.volt_4
      }
      else {
        this.volt_4 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type voltageResponse
    // Serialize message field [volt_1]
    bufferOffset = _serializer.float32(obj.volt_1, buffer, bufferOffset);
    // Serialize message field [volt_2]
    bufferOffset = _serializer.float32(obj.volt_2, buffer, bufferOffset);
    // Serialize message field [volt_3]
    bufferOffset = _serializer.float32(obj.volt_3, buffer, bufferOffset);
    // Serialize message field [volt_4]
    bufferOffset = _serializer.float32(obj.volt_4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type voltageResponse
    let len;
    let data = new voltageResponse(null);
    // Deserialize message field [volt_1]
    data.volt_1 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [volt_2]
    data.volt_2 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [volt_3]
    data.volt_3 = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [volt_4]
    data.volt_4 = _deserializer.float32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robot_base_servo/voltageResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '00886afbc7627a03f5753fba171f3ab9';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    float32 volt_1
    float32 volt_2
    float32 volt_3
    float32 volt_4
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new voltageResponse(null);
    if (msg.volt_1 !== undefined) {
      resolved.volt_1 = msg.volt_1;
    }
    else {
      resolved.volt_1 = 0.0
    }

    if (msg.volt_2 !== undefined) {
      resolved.volt_2 = msg.volt_2;
    }
    else {
      resolved.volt_2 = 0.0
    }

    if (msg.volt_3 !== undefined) {
      resolved.volt_3 = msg.volt_3;
    }
    else {
      resolved.volt_3 = 0.0
    }

    if (msg.volt_4 !== undefined) {
      resolved.volt_4 = msg.volt_4;
    }
    else {
      resolved.volt_4 = 0.0
    }

    return resolved;
    }
};

module.exports = {
  Request: voltageRequest,
  Response: voltageResponse,
  md5sum() { return '00886afbc7627a03f5753fba171f3ab9'; },
  datatype() { return 'robot_base_servo/voltage'; }
};
