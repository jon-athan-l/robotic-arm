// Auto-generated. Do not edit!

// (in-package detect.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class MovementInformation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.instructions = null;
    }
    else {
      if (initObj.hasOwnProperty('instructions')) {
        this.instructions = initObj.instructions
      }
      else {
        this.instructions = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MovementInformation
    // Serialize message field [instructions]
    bufferOffset = _arraySerializer.string(obj.instructions, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MovementInformation
    let len;
    let data = new MovementInformation(null);
    // Deserialize message field [instructions]
    data.instructions = _arrayDeserializer.string(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    object.instructions.forEach((val) => {
      length += 4 + val.length;
    });
    return length + 4;
  }

  static datatype() {
    // Returns string type for a message object
    return 'detect/MovementInformation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '3443f8de2c3446cc5ba0afaf4348ee72';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string[] instructions
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MovementInformation(null);
    if (msg.instructions !== undefined) {
      resolved.instructions = msg.instructions;
    }
    else {
      resolved.instructions = []
    }

    return resolved;
    }
};

module.exports = MovementInformation;
