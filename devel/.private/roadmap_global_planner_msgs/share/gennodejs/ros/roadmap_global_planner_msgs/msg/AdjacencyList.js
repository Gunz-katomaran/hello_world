// Auto-generated. Do not edit!

// (in-package roadmap_global_planner_msgs.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let PointList = require('./PointList.js');
let MapPair = require('./MapPair.js');

//-----------------------------------------------------------

class AdjacencyList {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.adj_list = null;
      this.map = null;
    }
    else {
      if (initObj.hasOwnProperty('adj_list')) {
        this.adj_list = initObj.adj_list
      }
      else {
        this.adj_list = [];
      }
      if (initObj.hasOwnProperty('map')) {
        this.map = initObj.map
      }
      else {
        this.map = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type AdjacencyList
    // Serialize message field [adj_list]
    // Serialize the length for message field [adj_list]
    bufferOffset = _serializer.uint32(obj.adj_list.length, buffer, bufferOffset);
    obj.adj_list.forEach((val) => {
      bufferOffset = PointList.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [map]
    // Serialize the length for message field [map]
    bufferOffset = _serializer.uint32(obj.map.length, buffer, bufferOffset);
    obj.map.forEach((val) => {
      bufferOffset = MapPair.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type AdjacencyList
    let len;
    let data = new AdjacencyList(null);
    // Deserialize message field [adj_list]
    // Deserialize array length for message field [adj_list]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.adj_list = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.adj_list[i] = PointList.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [map]
    // Deserialize array length for message field [map]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.map = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.map[i] = MapPair.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.adj_list.forEach((val) => {
      length += PointList.getMessageSize(val);
    });
    length += 60 * object.map.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'roadmap_global_planner_msgs/AdjacencyList';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd2f6aa9b2ba6558c5394addb6c9bfc26';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    roadmap_global_planner_msgs/PointList[] adj_list
    roadmap_global_planner_msgs/MapPair[] map
    ================================================================================
    MSG: roadmap_global_planner_msgs/PointList
    int32[] list
    
    ================================================================================
    MSG: roadmap_global_planner_msgs/MapPair
    int32 node
    geometry_msgs/Pose pose
    ================================================================================
    MSG: geometry_msgs/Pose
    # A representation of pose in free space, composed of position and orientation. 
    Point position
    Quaternion orientation
    
    ================================================================================
    MSG: geometry_msgs/Point
    # This contains the position of a point in free space
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: geometry_msgs/Quaternion
    # This represents an orientation in free space in quaternion form.
    
    float64 x
    float64 y
    float64 z
    float64 w
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new AdjacencyList(null);
    if (msg.adj_list !== undefined) {
      resolved.adj_list = new Array(msg.adj_list.length);
      for (let i = 0; i < resolved.adj_list.length; ++i) {
        resolved.adj_list[i] = PointList.Resolve(msg.adj_list[i]);
      }
    }
    else {
      resolved.adj_list = []
    }

    if (msg.map !== undefined) {
      resolved.map = new Array(msg.map.length);
      for (let i = 0; i < resolved.map.length; ++i) {
        resolved.map[i] = MapPair.Resolve(msg.map[i]);
      }
    }
    else {
      resolved.map = []
    }

    return resolved;
    }
};

module.exports = AdjacencyList;
