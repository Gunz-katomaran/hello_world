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

class WebFeedbackRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.robot_request = null;
    }
    else {
      if (initObj.hasOwnProperty('robot_request')) {
        this.robot_request = initObj.robot_request
      }
      else {
        this.robot_request = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WebFeedbackRequest
    // Serialize message field [robot_request]
    bufferOffset = _serializer.string(obj.robot_request, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WebFeedbackRequest
    let len;
    let data = new WebFeedbackRequest(null);
    // Deserialize message field [robot_request]
    data.robot_request = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.robot_request.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'web_robo/WebFeedbackRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '59e9fa9a8b4041ed2c7b625faa2265d4';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string robot_request
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WebFeedbackRequest(null);
    if (msg.robot_request !== undefined) {
      resolved.robot_request = msg.robot_request;
    }
    else {
      resolved.robot_request = ''
    }

    return resolved;
    }
};

class WebFeedbackResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.user_response = null;
    }
    else {
      if (initObj.hasOwnProperty('user_response')) {
        this.user_response = initObj.user_response
      }
      else {
        this.user_response = false;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type WebFeedbackResponse
    // Serialize message field [user_response]
    bufferOffset = _serializer.bool(obj.user_response, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type WebFeedbackResponse
    let len;
    let data = new WebFeedbackResponse(null);
    // Deserialize message field [user_response]
    data.user_response = _deserializer.bool(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 1;
  }

  static datatype() {
    // Returns string type for a service object
    return 'web_robo/WebFeedbackResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3d0bfd0e81623242bce54b48cf8a4541';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    bool user_response
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new WebFeedbackResponse(null);
    if (msg.user_response !== undefined) {
      resolved.user_response = msg.user_response;
    }
    else {
      resolved.user_response = false
    }

    return resolved;
    }
};

module.exports = {
  Request: WebFeedbackRequest,
  Response: WebFeedbackResponse,
  md5sum() { return '46e643224170bf540f5f708583c1f716'; },
  datatype() { return 'web_robo/WebFeedback'; }
};
