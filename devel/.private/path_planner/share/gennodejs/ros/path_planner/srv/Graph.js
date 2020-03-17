// Auto-generated. Do not edit!

// (in-package path_planner.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let roadmap_global_planner_msgs = _finder('roadmap_global_planner_msgs');

//-----------------------------------------------------------


//-----------------------------------------------------------

class GraphRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.adjacency_list = null;
    }
    else {
      if (initObj.hasOwnProperty('adjacency_list')) {
        this.adjacency_list = initObj.adjacency_list
      }
      else {
        this.adjacency_list = new roadmap_global_planner_msgs.msg.AdjacencyList();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type GraphRequest
    // Serialize message field [adjacency_list]
    bufferOffset = roadmap_global_planner_msgs.msg.AdjacencyList.serialize(obj.adjacency_list, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraphRequest
    let len;
    let data = new GraphRequest(null);
    // Deserialize message field [adjacency_list]
    data.adjacency_list = roadmap_global_planner_msgs.msg.AdjacencyList.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += roadmap_global_planner_msgs.msg.AdjacencyList.getMessageSize(object.adjacency_list);
    return length;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_planner/GraphRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ed35136309136913daebcb0878df90c7';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    roadmap_global_planner_msgs/AdjacencyList adjacency_list
    
    ================================================================================
    MSG: roadmap_global_planner_msgs/AdjacencyList
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
    const resolved = new GraphRequest(null);
    if (msg.adjacency_list !== undefined) {
      resolved.adjacency_list = roadmap_global_planner_msgs.msg.AdjacencyList.Resolve(msg.adjacency_list)
    }
    else {
      resolved.adjacency_list = new roadmap_global_planner_msgs.msg.AdjacencyList()
    }

    return resolved;
    }
};

class GraphResponse {
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
    // Serializes a message object of type GraphResponse
    // Serialize message field [result]
    bufferOffset = _serializer.bool(obj.result, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type GraphResponse
    let len;
    let data = new GraphResponse(null);
    // Deserialize message field [result]
    data.result = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'path_planner/GraphResponse';
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
    const resolved = new GraphResponse(null);
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
  Request: GraphRequest,
  Response: GraphResponse,
  md5sum() { return '27d2326ebcb7de158de4e69732269ca9'; },
  datatype() { return 'path_planner/Graph'; }
};
