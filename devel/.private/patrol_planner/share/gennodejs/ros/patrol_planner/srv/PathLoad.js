// Auto-generated. Do not edit!

// (in-package patrol_planner.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

let Milestone = require('../msg/Milestone.js');

//-----------------------------------------------------------

class PathLoadRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.path_name = null;
      this.table_path_name = null;
    }
    else {
      if (initObj.hasOwnProperty('path_name')) {
        this.path_name = initObj.path_name
      }
      else {
        this.path_name = '';
      }
      if (initObj.hasOwnProperty('table_path_name')) {
        this.table_path_name = initObj.table_path_name
      }
      else {
        this.table_path_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PathLoadRequest
    // Serialize message field [path_name]
    bufferOffset = _serializer.string(obj.path_name, buffer, bufferOffset);
    // Serialize message field [table_path_name]
    bufferOffset = _serializer.string(obj.table_path_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PathLoadRequest
    let len;
    let data = new PathLoadRequest(null);
    // Deserialize message field [path_name]
    data.path_name = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [table_path_name]
    data.table_path_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.path_name.length;
    length += object.table_path_name.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a service object
    return 'patrol_planner/PathLoadRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '1d8ce4942f499b13891f955110a0e842';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string path_name
    string table_path_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PathLoadRequest(null);
    if (msg.path_name !== undefined) {
      resolved.path_name = msg.path_name;
    }
    else {
      resolved.path_name = ''
    }

    if (msg.table_path_name !== undefined) {
      resolved.table_path_name = msg.table_path_name;
    }
    else {
      resolved.table_path_name = ''
    }

    return resolved;
    }
};

class PathLoadResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.milestone_list = null;
    }
    else {
      if (initObj.hasOwnProperty('milestone_list')) {
        this.milestone_list = initObj.milestone_list
      }
      else {
        this.milestone_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PathLoadResponse
    // Serialize message field [milestone_list]
    // Serialize the length for message field [milestone_list]
    bufferOffset = _serializer.uint32(obj.milestone_list.length, buffer, bufferOffset);
    obj.milestone_list.forEach((val) => {
      bufferOffset = Milestone.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PathLoadResponse
    let len;
    let data = new PathLoadResponse(null);
    // Deserialize message field [milestone_list]
    // Deserialize array length for message field [milestone_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.milestone_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.milestone_list[i] = Milestone.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.milestone_list.forEach((val) => {
      length += Milestone.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'patrol_planner/PathLoadResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c0344da655de49cc9cb77b4e3877943b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    Milestone[] milestone_list
    
    
    ================================================================================
    MSG: patrol_planner/Milestone
    string name
    float32 x
    float32 y
    float32 z
    float32 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new PathLoadResponse(null);
    if (msg.milestone_list !== undefined) {
      resolved.milestone_list = new Array(msg.milestone_list.length);
      for (let i = 0; i < resolved.milestone_list.length; ++i) {
        resolved.milestone_list[i] = Milestone.Resolve(msg.milestone_list[i]);
      }
    }
    else {
      resolved.milestone_list = []
    }

    return resolved;
    }
};

module.exports = {
  Request: PathLoadRequest,
  Response: PathLoadResponse,
  md5sum() { return '813591a0b724e5a0e599fdf9d754d157'; },
  datatype() { return 'patrol_planner/PathLoad'; }
};
