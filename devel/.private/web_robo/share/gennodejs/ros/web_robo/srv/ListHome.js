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

class ListHomeRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.web_request = null;
    }
    else {
      if (initObj.hasOwnProperty('web_request')) {
        this.web_request = initObj.web_request
      }
      else {
        this.web_request = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ListHomeRequest
    // Serialize message field [web_request]
    bufferOffset = _serializer.string(obj.web_request, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ListHomeRequest
    let len;
    let data = new ListHomeRequest(null);
    // Deserialize message field [web_request]
    data.web_request = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.web_request.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'web_robo/ListHomeRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'bffa79c1952358a343390760df0febf2';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string web_request
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ListHomeRequest(null);
    if (msg.web_request !== undefined) {
      resolved.web_request = msg.web_request;
    }
    else {
      resolved.web_request = ''
    }

    return resolved;
    }
};

class ListHomeResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.home_points = null;
    }
    else {
      if (initObj.hasOwnProperty('home_points')) {
        this.home_points = initObj.home_points
      }
      else {
        this.home_points = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type ListHomeResponse
    // Serialize message field [home_points]
    bufferOffset = _serializer.string(obj.home_points, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type ListHomeResponse
    let len;
    let data = new ListHomeResponse(null);
    // Deserialize message field [home_points]
    data.home_points = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.home_points.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'web_robo/ListHomeResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '8b0cc83ba06258a6e5a136609493daa0';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string home_points
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new ListHomeResponse(null);
    if (msg.home_points !== undefined) {
      resolved.home_points = msg.home_points;
    }
    else {
      resolved.home_points = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: ListHomeRequest,
  Response: ListHomeResponse,
  md5sum() { return '264ac43195b2a02803670c84d5678c9a'; },
  datatype() { return 'web_robo/ListHome'; }
};
