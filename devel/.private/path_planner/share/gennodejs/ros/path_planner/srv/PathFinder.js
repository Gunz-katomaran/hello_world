// Auto-generated. Do not edit!

// (in-package path_planner.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class PathFinderRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.start = null;
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = 0;
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PathFinderRequest
    // Serialize message field [start]
    bufferOffset = _serializer.int32(obj.start, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = _serializer.int32(obj.goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PathFinderRequest
    let len;
    let data = new PathFinderRequest(null);
    // Deserialize message field [start]
    data.start = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_planner/PathFinderRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'cfc25244a7752ea588e96a62adce79d8';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 start
    int32 goal
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PathFinderRequest(null);
    if (msg.start !== undefined) {
      resolved.start = msg.start;
    }
    else {
      resolved.start = 0
    }

    if (msg.goal !== undefined) {
      resolved.goal = msg.goal;
    }
    else {
      resolved.goal = 0
    }

    return resolved;
    }
};

class PathFinderResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.path = null;
    }
    else {
      if (initObj.hasOwnProperty('path')) {
        this.path = initObj.path
      }
      else {
        this.path = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PathFinderResponse
    // Serialize message field [path]
    bufferOffset = _arraySerializer.int32(obj.path, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PathFinderResponse
    let len;
    let data = new PathFinderResponse(null);
    // Deserialize message field [path]
    data.path = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.path.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_planner/PathFinderResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '022981802e636d133c6ed314a501f5ae';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] path
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PathFinderResponse(null);
    if (msg.path !== undefined) {
      resolved.path = msg.path;
    }
    else {
      resolved.path = []
    }

    return resolved;
    }
};

module.exports = {
  Request: PathFinderRequest,
  Response: PathFinderResponse,
  md5sum() { return 'e90150a274192f3b93435f5aadb8f247'; },
  datatype() { return 'path_planner/PathFinder'; }
};
