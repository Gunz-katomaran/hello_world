// Auto-generated. Do not edit!

// (in-package robo_waiter.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class TableRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.table_name = null;
    }
    else {
      if (initObj.hasOwnProperty('table_name')) {
        this.table_name = initObj.table_name
      }
      else {
        this.table_name = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TableRequest
    // Serialize message field [table_name]
    bufferOffset = _serializer.string(obj.table_name, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TableRequest
    let len;
    let data = new TableRequest(null);
    // Deserialize message field [table_name]
    data.table_name = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.table_name.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robo_waiter/TableRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '92416677ce2a8e4f7fc15435da492a7c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string table_name
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TableRequest(null);
    if (msg.table_name !== undefined) {
      resolved.table_name = msg.table_name;
    }
    else {
      resolved.table_name = ''
    }

    return resolved;
    }
};

class TableResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.reply = null;
    }
    else {
      if (initObj.hasOwnProperty('reply')) {
        this.reply = initObj.reply
      }
      else {
        this.reply = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type TableResponse
    // Serialize message field [reply]
    bufferOffset = _serializer.string(obj.reply, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type TableResponse
    let len;
    let data = new TableResponse(null);
    // Deserialize message field [reply]
    data.reply = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.reply.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'robo_waiter/TableResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4f5cc45a827e5f04b00100078ec13f4c';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string reply
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new TableResponse(null);
    if (msg.reply !== undefined) {
      resolved.reply = msg.reply;
    }
    else {
      resolved.reply = ''
    }

    return resolved;
    }
};

module.exports = {
  Request: TableRequest,
  Response: TableResponse,
  md5sum() { return 'd9bc86335236069bddf3bda6b288eda2'; },
  datatype() { return 'robo_waiter/Table'; }
};
