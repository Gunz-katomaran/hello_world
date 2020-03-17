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

class GoalRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.location = null;
    }
    else {
      if (initObj.hasOwnProperty('location')) {
        this.location = initObj.location
      }
      else {
        this.location = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoalRequest
    // Serialize message field [location]
    bufferOffset = _serializer.string(obj.location, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoalRequest
    let len;
    let data = new GoalRequest(null);
    // Deserialize message field [location]
    data.location = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.location.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_planner/GoalRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '03da474bc61cfeb81a8854b4ca05bafa';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string location
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoalRequest(null);
    if (msg.location !== undefined) {
      resolved.location = msg.location;
    }
    else {
      resolved.location = ''
    }

    return resolved;
    }
};

class GoalResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal = null;
    }
    else {
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GoalResponse
    // Serialize message field [goal]
    bufferOffset = _serializer.int32(obj.goal, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GoalResponse
    let len;
    let data = new GoalResponse(null);
    // Deserialize message field [goal]
    data.goal = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_planner/GoalResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '18df0149936b7aa95588e3862476ebde';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 goal
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GoalResponse(null);
    if (msg.goal !== undefined) {
      resolved.goal = msg.goal;
    }
    else {
      resolved.goal = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: GoalRequest,
  Response: GoalResponse,
  md5sum() { return '257e57560eaef13378eb07b58da2c735'; },
  datatype() { return 'path_planner/Goal'; }
};
