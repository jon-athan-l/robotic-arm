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

class EntityInformation {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.centerPoint = null;
      this.generalizedEntityPoint = null;
    }
    else {
      if (initObj.hasOwnProperty('centerPoint')) {
        this.centerPoint = initObj.centerPoint
      }
      else {
        this.centerPoint = new Array(2).fill(0);
      }
      if (initObj.hasOwnProperty('generalizedEntityPoint')) {
        this.generalizedEntityPoint = initObj.generalizedEntityPoint
      }
      else {
        this.generalizedEntityPoint = new Array(2).fill(0);
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type EntityInformation
    // Check that the constant length array field [centerPoint] has the right length
    if (obj.centerPoint.length !== 2) {
      throw new Error('Unable to serialize array field centerPoint - length must be 2')
    }
    // Serialize message field [centerPoint]
    bufferOffset = _arraySerializer.int16(obj.centerPoint, buffer, bufferOffset, 2);
    // Check that the constant length array field [generalizedEntityPoint] has the right length
    if (obj.generalizedEntityPoint.length !== 2) {
      throw new Error('Unable to serialize array field generalizedEntityPoint - length must be 2')
    }
    // Serialize message field [generalizedEntityPoint]
    bufferOffset = _arraySerializer.int16(obj.generalizedEntityPoint, buffer, bufferOffset, 2);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type EntityInformation
    let len;
    let data = new EntityInformation(null);
    // Deserialize message field [centerPoint]
    data.centerPoint = _arrayDeserializer.int16(buffer, bufferOffset, 2)
    // Deserialize message field [generalizedEntityPoint]
    data.generalizedEntityPoint = _arrayDeserializer.int16(buffer, bufferOffset, 2)
    return data;
  }

  static getMessageSize(object) {
    return 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'detect/EntityInformation';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4d47ff85ed47785b133aaf336fe6729d';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int16[2] centerPoint
    int16[2] generalizedEntityPoint
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new EntityInformation(null);
    if (msg.centerPoint !== undefined) {
      resolved.centerPoint = msg.centerPoint;
    }
    else {
      resolved.centerPoint = new Array(2).fill(0)
    }

    if (msg.generalizedEntityPoint !== undefined) {
      resolved.generalizedEntityPoint = msg.generalizedEntityPoint;
    }
    else {
      resolved.generalizedEntityPoint = new Array(2).fill(0)
    }

    return resolved;
    }
};

module.exports = EntityInformation;
