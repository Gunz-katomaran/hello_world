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


//-----------------------------------------------------------

class GPSGoalRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.milestone_name = null;
    }
    else {
      if (initObj.hasOwnProperty('milestone_name')) {
        this.milestone_name = initObj.milestone_name
      }
      else {
        this.milestone_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GPSGoalRequest
    // Serialize message field [milestone_name]
    bufferOffset = _serializer.string(obj.milestone_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GPSGoalRequest
    let len;
    let data = new GPSGoalRequest(null);
    // Deserialize message field [milestone_name]
    data.milestone_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.milestone_name.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'patrol_planner/GPSGoalRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'c975b221d4c40c2d99ef7f3657eaa591';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string milestone_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GPSGoalRequest(null);
    if (msg.milestone_name !== undefined) {
      resolved.milestone_name = msg.milestone_name;
    }
    else {
      resolved.milestone_name = ''
    }

    return resolved;
    }
};

class GPSGoalResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.goal_sent_status = null;
    }
    else {
      if (initObj.hasOwnProperty('goal_sent_status')) {
        this.goal_sent_status = initObj.goal_sent_status
      }
      else {
        this.goal_sent_status = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GPSGoalResponse
    // Serialize message field [goal_sent_status]
    bufferOffset = _serializer.bool(obj.goal_sent_status, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GPSGoalResponse
    let len;
    let data = new GPSGoalResponse(null);
    // Deserialize message field [goal_sent_status]
    data.goal_sent_status = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'patrol_planner/GPSGoalResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a3379bd2e62a0c32a1f5bf665955c53e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool goal_sent_status
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new GPSGoalResponse(null);
    if (msg.goal_sent_status !== undefined) {
      resolved.goal_sent_status = msg.goal_sent_status;
    }
    else {
      resolved.goal_sent_status = false
    }

    return resolved;
    }
};

module.exports = {
  Request: GPSGoalRequest,
  Response: GPSGoalResponse,
  md5sum() { return '069b6c0906fcffac7ddcf59faaf4b55a'; },
  datatype() { return 'patrol_planner/GPSGoal'; }
};
