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

class Polyhedron {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.id = null;
      this.rps = null;
      this.noise = null;
      this.r = null;
      this.points = null;
      this.normals = null;
    }
    else {
      if (initObj.hasOwnProperty('id')) {
        this.id = initObj.id
      }
      else {
        this.id = 0;
      }
      if (initObj.hasOwnProperty('rps')) {
        this.rps = initObj.rps
      }
      else {
        this.rps = [];
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
      if (initObj.hasOwnProperty('points')) {
        this.points = initObj.points
      }
      else {
        this.points = [];
      }
      if (initObj.hasOwnProperty('normals')) {
        this.normals = initObj.normals
      }
      else {
        this.normals = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type Polyhedron
    // Serialize message field [id]
    bufferOffset = _serializer.int32(obj.id, buffer, bufferOffset);
    // Serialize message field [rps]
    // Serialize the length for message field [rps]
    bufferOffset = _serializer.uint32(obj.rps.length, buffer, bufferOffset);
    obj.rps.forEach((val) => {
      bufferOffset = Point2d.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [noise]
    bufferOffset = Point3d.serialize(obj.noise, buffer, bufferOffset);
    // Serialize message field [r]
    bufferOffset = _serializer.float64(obj.r, buffer, bufferOffset);
    // Serialize message field [points]
    // Serialize the length for message field [points]
    bufferOffset = _serializer.uint32(obj.points.length, buffer, bufferOffset);
    obj.points.forEach((val) => {
      bufferOffset = Point3d.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [normals]
    // Serialize the length for message field [normals]
    bufferOffset = _serializer.uint32(obj.normals.length, buffer, bufferOffset);
    obj.normals.forEach((val) => {
      bufferOffset = Point3d.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type Polyhedron
    let len;
    let data = new Polyhedron(null);
    // Deserialize message field [id]
    data.id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [rps]
    // Deserialize array length for message field [rps]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.rps = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.rps[i] = Point2d.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [noise]
    data.noise = Point3d.deserialize(buffer, bufferOffset);
    // Deserialize message field [r]
    data.r = _deserializer.float64(buffer, bufferOffset);
    // Deserialize message field [points]
    // Deserialize array length for message field [points]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.points = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.points[i] = Point3d.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [normals]
    // Deserialize array length for message field [normals]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.normals = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.normals[i] = Point3d.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 16 * object.rps.length;
    length += 24 * object.points.length;
    length += 24 * object.normals.length;
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vicon_env/Polyhedron';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '4e4035e4e6d87b6937718889da241e8b';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 id
    Point2d[] rps
    Point3d noise
    float64 r #clearance range
    Point3d[] points
    Point3d[] normals #norm is an outer vector
    
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
    const resolved = new Polyhedron(null);
    if (msg.id !== undefined) {
      resolved.id = msg.id;
    }
    else {
      resolved.id = 0
    }

    if (msg.rps !== undefined) {
      resolved.rps = new Array(msg.rps.length);
      for (let i = 0; i < resolved.rps.length; ++i) {
        resolved.rps[i] = Point2d.Resolve(msg.rps[i]);
      }
    }
    else {
      resolved.rps = []
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

    if (msg.points !== undefined) {
      resolved.points = new Array(msg.points.length);
      for (let i = 0; i < resolved.points.length; ++i) {
        resolved.points[i] = Point3d.Resolve(msg.points[i]);
      }
    }
    else {
      resolved.points = []
    }

    if (msg.normals !== undefined) {
      resolved.normals = new Array(msg.normals.length);
      for (let i = 0; i < resolved.normals.length; ++i) {
        resolved.normals[i] = Point3d.Resolve(msg.normals[i]);
      }
    }
    else {
      resolved.normals = []
    }

    return resolved;
    }
};

module.exports = Polyhedron;
