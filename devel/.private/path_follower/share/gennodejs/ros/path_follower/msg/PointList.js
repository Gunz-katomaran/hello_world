// Auto-generated. Do not edit!

// (in-package path_follower.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PoseList = require('./PoseList.js');

//-----------------------------------------------------------

class PointList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.pose_list = null;
    }
    else {
      if (initObj.hasOwnProperty('pose_list')) {
        this.pose_list = initObj.pose_list
      }
      else {
        this.pose_list = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type PointList
    // Serialize message field [pose_list]
    // Serialize the length for message field [pose_list]
    bufferOffset = _serializer.uint32(obj.pose_list.length, buffer, bufferOffset);
    obj.pose_list.forEach((val) => {
      bufferOffset = PoseList.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type PointList
    let len;
    let data = new PointList(null);
    // Deserialize message field [pose_list]
    // Deserialize array length for message field [pose_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.pose_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.pose_list[i] = PoseList.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.pose_list.forEach((val) => {
      length += PoseList.getMessageSize(val);
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'path_follower/PointList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f639923d0e4b33008c322b16a61c2555';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
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
    const resolved = new PointList(null);
    if (msg.pose_list !== undefined) {
      resolved.pose_list = new Array(msg.pose_list.length);
      for (let i = 0; i < resolved.pose_list.length; ++i) {
        resolved.pose_list[i] = PoseList.Resolve(msg.pose_list[i]);
      }
    }
    else {
      resolved.pose_list = []
    }

    return resolved;
    }
};

module.exports = PointList;
