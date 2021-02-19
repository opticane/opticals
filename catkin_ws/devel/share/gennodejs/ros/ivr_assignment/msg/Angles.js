// Auto-generated. Do not edit!

// (in-package ivr_assignment.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class Angles {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.theta_1 = null;
      this.theta_2 = null;
      this.theta_3 = null;
      this.theta_4 = null;
    }
    else {
      if (initObj.hasOwnProperty('theta_1')) {
        this.theta_1 = initObj.theta_1
      }
      else {
        this.theta_1 = 0.0;
      }
      if (initObj.hasOwnProperty('theta_2')) {
        this.theta_2 = initObj.theta_2
      }
      else {
        this.theta_2 = 0.0;
      }
      if (initObj.hasOwnProperty('theta_3')) {
        this.theta_3 = initObj.theta_3
      }
      else {
        this.theta_3 = 0.0;
      }
      if (initObj.hasOwnProperty('theta_4')) {
        this.theta_4 = initObj.theta_4
      }
      else {
        this.theta_4 = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Angles
    // Serialize message field [theta_1]
    bufferOffset = _serializer.float64(obj.theta_1, buffer, bufferOffset);
    // Serialize message field [theta_2]
    bufferOffset = _serializer.float64(obj.theta_2, buffer, bufferOffset);
    // Serialize message field [theta_3]
    bufferOffset = _serializer.float64(obj.theta_3, buffer, bufferOffset);
    // Serialize message field [theta_4]
    bufferOffset = _serializer.float64(obj.theta_4, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Angles
    let len;
    let data = new Angles(null);
    // Deserialize message field [theta_1]
    data.theta_1 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [theta_2]
    data.theta_2 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [theta_3]
    data.theta_3 = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [theta_4]
    data.theta_4 = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 32;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ivr_assignment/Angles';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '617622430535c6b3b6c6968cba8cad3e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # Joint angles of the robot
    
    float64 theta_1 # Yellow joint
    float64 theta_2 # Blue joint (#1)
    float64 theta_3 # Blue joint (#2)
    float64 theta_4 # Green joint
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Angles(null);
    if (msg.theta_1 !== undefined) {
      resolved.theta_1 = msg.theta_1;
    }
    else {
      resolved.theta_1 = 0.0
    }

    if (msg.theta_2 !== undefined) {
      resolved.theta_2 = msg.theta_2;
    }
    else {
      resolved.theta_2 = 0.0
    }

    if (msg.theta_3 !== undefined) {
      resolved.theta_3 = msg.theta_3;
    }
    else {
      resolved.theta_3 = 0.0
    }

    if (msg.theta_4 !== undefined) {
      resolved.theta_4 = msg.theta_4;
    }
    else {
      resolved.theta_4 = 0.0
    }

    return resolved;
    }
};

module.exports = Angles;
