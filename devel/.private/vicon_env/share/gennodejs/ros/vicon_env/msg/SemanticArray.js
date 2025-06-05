// Auto-generated. Do not edit!

// (in-package vicon_env.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;
let Point3d = require('./Point3d.js');
let Ellipse = require('./Ellipse.js');
let Circle = require('./Circle.js');
let Polygon = require('./Polygon.js');
let Cylinder = require('./Cylinder.js');
let Polyhedron = require('./Polyhedron.js');
let std_msgs = _finder('std_msgs');

//-----------------------------------------------------------

class SemanticArray {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.header = null;
      this.mav_id = null;
      this.mav_pos = null;
      this.ellipses = null;
      this.circles = null;
      this.polygons = null;
      this.cylinders = null;
      this.polyhedrons = null;
    }
    else {
      if (initObj.hasOwnProperty('header')) {
        this.header = initObj.header
      }
      else {
        this.header = new std_msgs.msg.Header();
      }
      if (initObj.hasOwnProperty('mav_id')) {
        this.mav_id = initObj.mav_id
      }
      else {
        this.mav_id = 0;
      }
      if (initObj.hasOwnProperty('mav_pos')) {
        this.mav_pos = initObj.mav_pos
      }
      else {
        this.mav_pos = new Point3d();
      }
      if (initObj.hasOwnProperty('ellipses')) {
        this.ellipses = initObj.ellipses
      }
      else {
        this.ellipses = [];
      }
      if (initObj.hasOwnProperty('circles')) {
        this.circles = initObj.circles
      }
      else {
        this.circles = [];
      }
      if (initObj.hasOwnProperty('polygons')) {
        this.polygons = initObj.polygons
      }
      else {
        this.polygons = [];
      }
      if (initObj.hasOwnProperty('cylinders')) {
        this.cylinders = initObj.cylinders
      }
      else {
        this.cylinders = [];
      }
      if (initObj.hasOwnProperty('polyhedrons')) {
        this.polyhedrons = initObj.polyhedrons
      }
      else {
        this.polyhedrons = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type SemanticArray
    // Serialize message field [header]
    bufferOffset = std_msgs.msg.Header.serialize(obj.header, buffer, bufferOffset);
    // Serialize message field [mav_id]
    bufferOffset = _serializer.int32(obj.mav_id, buffer, bufferOffset);
    // Serialize message field [mav_pos]
    bufferOffset = Point3d.serialize(obj.mav_pos, buffer, bufferOffset);
    // Serialize message field [ellipses]
    // Serialize the length for message field [ellipses]
    bufferOffset = _serializer.uint32(obj.ellipses.length, buffer, bufferOffset);
    obj.ellipses.forEach((val) => {
      bufferOffset = Ellipse.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [circles]
    // Serialize the length for message field [circles]
    bufferOffset = _serializer.uint32(obj.circles.length, buffer, bufferOffset);
    obj.circles.forEach((val) => {
      bufferOffset = Circle.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [polygons]
    // Serialize the length for message field [polygons]
    bufferOffset = _serializer.uint32(obj.polygons.length, buffer, bufferOffset);
    obj.polygons.forEach((val) => {
      bufferOffset = Polygon.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [cylinders]
    // Serialize the length for message field [cylinders]
    bufferOffset = _serializer.uint32(obj.cylinders.length, buffer, bufferOffset);
    obj.cylinders.forEach((val) => {
      bufferOffset = Cylinder.serialize(val, buffer, bufferOffset);
    });
    // Serialize message field [polyhedrons]
    // Serialize the length for message field [polyhedrons]
    bufferOffset = _serializer.uint32(obj.polyhedrons.length, buffer, bufferOffset);
    obj.polyhedrons.forEach((val) => {
      bufferOffset = Polyhedron.serialize(val, buffer, bufferOffset);
    });
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type SemanticArray
    let len;
    let data = new SemanticArray(null);
    // Deserialize message field [header]
    data.header = std_msgs.msg.Header.deserialize(buffer, bufferOffset);
    // Deserialize message field [mav_id]
    data.mav_id = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [mav_pos]
    data.mav_pos = Point3d.deserialize(buffer, bufferOffset);
    // Deserialize message field [ellipses]
    // Deserialize array length for message field [ellipses]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.ellipses = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.ellipses[i] = Ellipse.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [circles]
    // Deserialize array length for message field [circles]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.circles = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.circles[i] = Circle.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [polygons]
    // Deserialize array length for message field [polygons]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.polygons = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.polygons[i] = Polygon.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [cylinders]
    // Deserialize array length for message field [cylinders]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.cylinders = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.cylinders[i] = Cylinder.deserialize(buffer, bufferOffset)
    }
    // Deserialize message field [polyhedrons]
    // Deserialize array length for message field [polyhedrons]
    len = _deserializer.uint32(buffer, bufferOffset);
    data.polyhedrons = new Array(len);
    for (let i = 0; i < len; ++i) {
      data.polyhedrons[i] = Polyhedron.deserialize(buffer, bufferOffset)
    }
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += std_msgs.msg.Header.getMessageSize(object.header);
    length += 68 * object.ellipses.length;
    length += 44 * object.circles.length;
    object.polygons.forEach((val) => {
      length += Polygon.getMessageSize(val);
    });
    length += 60 * object.cylinders.length;
    object.polyhedrons.forEach((val) => {
      length += Polyhedron.getMessageSize(val);
    });
    return length + 48;
  }

  static datatype() {
    // Returns string type for a message object
    return 'vicon_env/SemanticArray';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'f11c93d4fb77d44a8c5e24f11f9114d5';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    std_msgs/Header header
    int32 mav_id #-1 for global map, 0 + for the mav_id
    Point3d mav_pos
    
    #2d semantics
    Ellipse[] ellipses
    Circle[]  circles
    Polygon[] polygons
    
    #3d semantics
    Cylinder[] cylinders
    Polyhedron[] polyhedrons
    
    ================================================================================
    MSG: std_msgs/Header
    # Standard metadata for higher-level stamped data types.
    # This is generally used to communicate timestamped data 
    # in a particular coordinate frame.
    # 
    # sequence ID: consecutively increasing ID 
    uint32 seq
    #Two-integer timestamp that is expressed as:
    # * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
    # * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
    # time-handling sugar is provided by the client library
    time stamp
    #Frame this data is associated with
    string frame_id
    
    ================================================================================
    MSG: vicon_env/Point3d
    float64 x
    float64 y
    float64 z
    
    ================================================================================
    MSG: vicon_env/Ellipse
    int32 id
    Point2d pos
    Point2d noise
    float64 r #clearance range
    float64 a
    float64 b
    float64 alpha # rotation
    
    ================================================================================
    MSG: vicon_env/Point2d
    float64 x
    float64 y
    
    ================================================================================
    MSG: vicon_env/Circle
    int32 id
    Point2d pos
    Point2d noise
    float64 r
    
    
    ================================================================================
    MSG: vicon_env/Polygon
    int32 id
    Point2d pos
    Point2d noise
    float64 r #clearance range
    Point2d[] points
    Point2d[] normals #norm is an outer vector
    
    ================================================================================
    MSG: vicon_env/Cylinder
    int32 id
    Point2d pos
    Point3d noise
    float64 r
    float64 h
    
    ================================================================================
    MSG: vicon_env/Polyhedron
    int32 id
    Point2d[] rps
    Point3d noise
    float64 r #clearance range
    Point3d[] points
    Point3d[] normals #norm is an outer vector
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new SemanticArray(null);
    if (msg.header !== undefined) {
      resolved.header = std_msgs.msg.Header.Resolve(msg.header)
    }
    else {
      resolved.header = new std_msgs.msg.Header()
    }

    if (msg.mav_id !== undefined) {
      resolved.mav_id = msg.mav_id;
    }
    else {
      resolved.mav_id = 0
    }

    if (msg.mav_pos !== undefined) {
      resolved.mav_pos = Point3d.Resolve(msg.mav_pos)
    }
    else {
      resolved.mav_pos = new Point3d()
    }

    if (msg.ellipses !== undefined) {
      resolved.ellipses = new Array(msg.ellipses.length);
      for (let i = 0; i < resolved.ellipses.length; ++i) {
        resolved.ellipses[i] = Ellipse.Resolve(msg.ellipses[i]);
      }
    }
    else {
      resolved.ellipses = []
    }

    if (msg.circles !== undefined) {
      resolved.circles = new Array(msg.circles.length);
      for (let i = 0; i < resolved.circles.length; ++i) {
        resolved.circles[i] = Circle.Resolve(msg.circles[i]);
      }
    }
    else {
      resolved.circles = []
    }

    if (msg.polygons !== undefined) {
      resolved.polygons = new Array(msg.polygons.length);
      for (let i = 0; i < resolved.polygons.length; ++i) {
        resolved.polygons[i] = Polygon.Resolve(msg.polygons[i]);
      }
    }
    else {
      resolved.polygons = []
    }

    if (msg.cylinders !== undefined) {
      resolved.cylinders = new Array(msg.cylinders.length);
      for (let i = 0; i < resolved.cylinders.length; ++i) {
        resolved.cylinders[i] = Cylinder.Resolve(msg.cylinders[i]);
      }
    }
    else {
      resolved.cylinders = []
    }

    if (msg.polyhedrons !== undefined) {
      resolved.polyhedrons = new Array(msg.polyhedrons.length);
      for (let i = 0; i < resolved.polyhedrons.length; ++i) {
        resolved.polyhedrons[i] = Polyhedron.Resolve(msg.polyhedrons[i]);
      }
    }
    else {
      resolved.polyhedrons = []
    }

    return resolved;
    }
};

module.exports = SemanticArray;
