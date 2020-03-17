// Auto-generated. Do not edit!

// (in-package web_robo.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class WebCommandRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.command = null;
    }
    else {
      if (initObj.hasOwnProperty('command')) {
        this.command = initObj.command
      }
      else {
        this.command = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WebCommandRequest
    // Serialize message field [command]
    bufferOffset = _serializer.string(obj.command, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WebCommandRequest
    let len;
    let data = new WebCommandRequest(null);
    // Deserialize message field [command]
    data.command = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.command.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'web_robo/WebCommandRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cba5e21e920a3a2b7b375cb65b64cdea';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string command
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WebCommandRequest(null);
    if (msg.command !== undefined) {
      resolved.command = msg.command;
    }
    else {
      resolved.command = ''
    }

    return resolved;
    }
};

class WebCommandResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.received_status = null;
    }
    else {
      if (initObj.hasOwnProperty('received_status')) {
        this.received_status = initObj.received_status
      }
      else {
        this.received_status = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WebCommandResponse
    // Serialize message field [received_status]
    bufferOffset = _serializer.bool(obj.received_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WebCommandResponse
    let len;
    let data = new WebCommandResponse(null);
    // Deserialize message field [received_status]
    data.received_status = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'web_robo/WebCommandResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'fadcd216e085028f01e227602e8be59b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool received_status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WebCommandResponse(null);
    if (msg.received_status !== undefined) {
      resolved.received_status = msg.received_status;
    }
    else {
      resolved.received_status = false
    }

    return resolved;
    }
};

module.exports = {
  Request: WebCommandRequest,
  Response: WebCommandResponse,
  md5sum() { return '44d2b40d74222232b1f3ee0bac50b6e7'; },
  datatype() { return 'web_robo/WebCommand'; }
};
