// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: konstellation/oracle/exchange_rate.proto
//
// For information on using the generated types, please see the documentation:
//   https://github.com/apple/swift-protobuf/

import Foundation
import SwiftProtobuf

// If the compiler emits an error on this type, it is because this file
// was generated by a version of the `protoc` Swift plug-in that is
// incompatible with the version of SwiftProtobuf to which you are linking.
// Please ensure that you are building against the same version of the API
// that was used to generate this file.
fileprivate struct _GeneratedWithProtocGenSwiftVersion: SwiftProtobuf.ProtobufAPIVersionCheck {
  struct _2: SwiftProtobuf.ProtobufAPIVersion_2 {}
  typealias Version = _2
}

struct Konstellation_Oracle_ExchangeRate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var pair: String = String()

  var rate: String = String()

  var denoms: [String] = []

  var height: Int32 = 0

  var timestamp: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _timestamp ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_timestamp = newValue}
  }
  /// Returns true if `timestamp` has been explicitly set.
  var hasTimestamp: Bool {return self._timestamp != nil}
  /// Clears the value of `timestamp`. Subsequent reads from it will return its default value.
  mutating func clearTimestamp() {self._timestamp = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _timestamp: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "konstellation.oracle"

extension Konstellation_Oracle_ExchangeRate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ExchangeRate"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "pair"),
    2: .same(proto: "rate"),
    3: .same(proto: "Denoms"),
    4: .same(proto: "height"),
    5: .same(proto: "timestamp"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.pair) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.rate) }()
      case 3: try { try decoder.decodeRepeatedStringField(value: &self.denoms) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self.height) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._timestamp) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.pair.isEmpty {
      try visitor.visitSingularStringField(value: self.pair, fieldNumber: 1)
    }
    if !self.rate.isEmpty {
      try visitor.visitSingularStringField(value: self.rate, fieldNumber: 2)
    }
    if !self.denoms.isEmpty {
      try visitor.visitRepeatedStringField(value: self.denoms, fieldNumber: 3)
    }
    if self.height != 0 {
      try visitor.visitSingularInt32Field(value: self.height, fieldNumber: 4)
    }
    if let v = self._timestamp {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Konstellation_Oracle_ExchangeRate, rhs: Konstellation_Oracle_ExchangeRate) -> Bool {
    if lhs.pair != rhs.pair {return false}
    if lhs.rate != rhs.rate {return false}
    if lhs.denoms != rhs.denoms {return false}
    if lhs.height != rhs.height {return false}
    if lhs._timestamp != rhs._timestamp {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
