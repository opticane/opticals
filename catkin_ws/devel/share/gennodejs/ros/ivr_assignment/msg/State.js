// Auto-generated. Do not edit!

// (in-package ivr_assignment.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Point = require('./Point.js');

//-----------------------------------------------------------

class State {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.red = null;
      this.green = null;
      this.blue = null;
      this.sphere = null;
      this.box = null;
    }
    else {
      if (initObj.hasOwnProperty('red')) {
        this.red = initObj.red
      }
      else {
        this.red = new Point();
      }
      if (initObj.hasOwnProperty('green')) {
        this.green = initObj.green
      }
      else {
        this.green = new Point();
      }
      if (initObj.hasOwnProperty('blue')) {
        this.blue = initObj.blue
      }
      else {
        this.blue = new Point();
      }
      if (initObj.hasOwnProperty('sphere')) {
        this.sphere = initObj.sphere
      }
      else {
        this.sphere = new Point();
      }
      if (initObj.hasOwnProperty('box')) {
        this.box = initObj.box
      }
      else {
        this.box = new Point();
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type State
    // Serialize message field [red]
    bufferOffset = Point.serialize(obj.red, buffer, bufferOffset);
    // Serialize message field [green]
    bufferOffset = Point.serialize(obj.green, buffer, bufferOffset);
    // Serialize message field [blue]
    bufferOffset = Point.serialize(obj.blue, buffer, bufferOffset);
    // Serialize message field [sphere]
    bufferOffset = Point.serialize(obj.sphere, buffer, bufferOffset);
    // Serialize message field [box]
    bufferOffset = Point.serialize(obj.box, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type State
    let len;
    let data = new State(null);
    // Deserialize message field [red]
    data.red = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [green]
    data.green = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [blue]
    data.blue = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [sphere]
    data.sphere = Point.deserialize(buffer, bufferOffset);
    // Deserialize message field [box]
    data.box = Point.deserialize(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 125;
  }

  static datatype() {
    // Returns string type for a message object
    return 'ivr_assignment/State';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '55bfea8321e47e17ccacb3d3544eea41';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    
    # Joint positions
    Point red
    Point green
    Point blue
    
    # Target positions
    Point sphere
    Point box
    ================================================================================
    MSG: ivr_assignment/Point
    # Position of object in 3D space
    
    float64 x
    float64 y
    float64 z
    
    bool hidden
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new State(null);
    if (msg.red !== undefined) {
      resolved.red = Point.Resolve(msg.red)
    }
    else {
      resolved.red = new Point()
    }

    if (msg.green !== undefined) {
      resolved.green = Point.Resolve(msg.green)
    }
    else {
      resolved.green = new Point()
    }

    if (msg.blue !== undefined) {
      resolved.blue = Point.Resolve(msg.blue)
    }
    else {
      resolved.blue = new Point()
    }

    if (msg.sphere !== undefined) {
      resolved.sphere = Point.Resolve(msg.sphere)
    }
    else {
      resolved.sphere = new Point()
    }

    if (msg.box !== undefined) {
      resolved.box = Point.Resolve(msg.box)
    }
    else {
      resolved.box = new Point()
    }

    return resolved;
    }
};

module.exports = State;
