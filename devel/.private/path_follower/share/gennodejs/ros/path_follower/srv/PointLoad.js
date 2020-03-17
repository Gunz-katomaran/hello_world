// Auto-generated. Do not edit!

// (in-package path_follower.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PointList = require('../msg/PointList.js');

//-----------------------------------------------------------


//-----------------------------------------------------------

class PointLoadRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.point_list = null;
    }
    else {
      if (initObj.hasOwnProperty('point_list')) {
        this.point_list = initObj.point_list
      }
      else {
        this.point_list = new PointList();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PointLoadRequest
    // Serialize message field [point_list]
    bufferOffset = PointList.serialize(obj.point_list, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PointLoadRequest
    let len;
    let data = new PointLoadRequest(null);
    // Deserialize message field [point_list]
    data.point_list = PointList.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += PointList.getMessageSize(object.point_list);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_follower/PointLoadRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '197fec9f10f108cb96e1c9f3419973ff';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    path_follower/PointList point_list
    
    ================================================================================
    MSG: path_follower/PointList
    path_follower/PoseList[] pose_list
    
    ================================================================================
    MSG: path_follower/PoseList
    float32[] list
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PointLoadRequest(null);
    if (msg.point_list !== undefined) {
      resolved.point_list = PointList.Resolve(msg.point_list)
    }
    else {
      resolved.point_list = new PointList()
    }

    return resolved;
    }
};

class PointLoadResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.result = null;
    }
    else {
      if (initObj.hasOwnProperty('result')) {
        this.result = initObj.result
      }
      else {
        this.result = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PointLoadResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PointLoadResponse
    let len;
    let data = new PointLoadResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_follower/PointLoadResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'eb13ac1f1354ccecb7941ee8fa2192e8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool result
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PointLoadResponse(null);
    if (msg.result !== undefined) {
      resolved.result = msg.result;
    }
    else {
      resolved.result = false
    }

    return resolved;
    }
};

module.exports = {
  Request: PointLoadRequest,
  Response: PointLoadResponse,
  md5sum() { return 'ff86ebb20f757b817971f1cfe32bdb6b'; },
  datatype() { return 'path_follower/PointLoad'; }
};
