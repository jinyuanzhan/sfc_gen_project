// Auto-generated. Do not edit!

// (in-package vicon_env.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Point2d = require('./Point2d.js');
let Point3d = require('./Point3d.js');

//-----------------------------------------------------------

class Cylinder {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.pos = null;
      this.noise = null;
      this.r = null;
      this.h = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('pos')) {
        this.pos = initObj.pos
      }
      else {
        this.pos = new Point2d();
      }
      if (initObj.hasOwnProperty('noise')) {
        this.noise = initObj.noise
      }
      else {
        this.noise = new Point3d();
      }
      if (initObj.hasOwnProperty('r')) {
        this.r = initObj.r
      }
      else {
        this.r = 0.0;
      }
      if (initObj.hasOwnProperty('h')) {
        this.h = initObj.h
      }
      else {
        this.h = 0.0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Cylinder
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [pos]
    bufferOffset = Point2d.serialize(obj.pos, buffer, bufferOffset);
    // Serialize message field [noise]
    bufferOffset = Point3d.serialize(obj.noise, buffer, bufferOffset);
    // Serialize message field [r]
    bufferOffset = _serializer.float64(obj.r, buffer, bufferOffset);
    // Serialize message field [h]
    bufferOffset = _serializer.float64(obj.h, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Cylinder
    let len;
    let data = new Cylinder(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [pos]
    data.pos = Point2d.deserialize(buffer, bufferOffset);
    // Deserialize message field [noise]
    data.noise = Point3d.deserialize(buffer, bufferOffset);
    // Deserialize message field [r]
    data.r = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [h]
    data.h = _deserializer.float64(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 60;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vicon_env/Cylinder';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a61dd680941510aadadfbb73b1ffec95';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    Point2d pos
    Point3d noise
    float64 r
    float64 h
    
    ================================================================================
    MSG: vicon_env/Point2d
    float64 x
    float64 y
    
    ================================================================================
    MSG: vicon_env/Point3d
    float64 x
    float64 y
    float64 z
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new Cylinder(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.pos !== undefined) {
      resolved.pos = Point2d.Resolve(msg.pos)
    }
    else {
      resolved.pos = new Point2d()
    }

    if (msg.noise !== undefined) {
      resolved.noise = Point3d.Resolve(msg.noise)
    }
    else {
      resolved.noise = new Point3d()
    }

    if (msg.r !== undefined) {
      resolved.r = msg.r;
    }
    else {
      resolved.r = 0.0
    }

    if (msg.h !== undefined) {
      resolved.h = msg.h;
    }
    else {
      resolved.h = 0.0
    }

    return resolved;
    }
};

module.exports = Cylinder;
