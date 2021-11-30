// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: regen/data/v1alpha2/genesis.proto
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

/// GenesisState is the genesis state
struct Regen_Data_V1alpha2_GenesisState {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// entries are the content entries
  var entries: [Regen_Data_V1alpha2_GenesisContentEntry] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// GenesisContentEntry is a genesis content entry
struct Regen_Data_V1alpha2_GenesisContentEntry {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// hash is the ContentHash
  var hash: Regen_Data_V1alpha2_ContentHash {
    get {return _hash ?? Regen_Data_V1alpha2_ContentHash()}
    set {_hash = newValue}
  }
  /// Returns true if `hash` has been explicitly set.
  var hasHash: Bool {return self._hash != nil}
  /// Clears the value of `hash`. Subsequent reads from it will return its default value.
  mutating func clearHash() {self._hash = nil}

  /// timestamp is the anchor Timestamp
  var timestamp: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _timestamp ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_timestamp = newValue}
  }
  /// Returns true if `timestamp` has been explicitly set.
  var hasTimestamp: Bool {return self._timestamp != nil}
  /// Clears the value of `timestamp`. Subsequent reads from it will return its default value.
  mutating func clearTimestamp() {self._timestamp = nil}

  /// signers are the signers, if any
  var signers: [Regen_Data_V1alpha2_SignerEntry] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _hash: Regen_Data_V1alpha2_ContentHash? = nil
  fileprivate var _timestamp: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "regen.data.v1alpha2"

extension Regen_Data_V1alpha2_GenesisState: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisState"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "entries"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.entries) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.entries.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.entries, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Regen_Data_V1alpha2_GenesisState, rhs: Regen_Data_V1alpha2_GenesisState) -> Bool {
    if lhs.entries != rhs.entries {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Regen_Data_V1alpha2_GenesisContentEntry: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GenesisContentEntry"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "hash"),
    2: .same(proto: "timestamp"),
    3: .same(proto: "signers"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._hash) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._timestamp) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.signers) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._hash {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if let v = self._timestamp {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    if !self.signers.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.signers, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Regen_Data_V1alpha2_GenesisContentEntry, rhs: Regen_Data_V1alpha2_GenesisContentEntry) -> Bool {
    if lhs._hash != rhs._hash {return false}
    if lhs._timestamp != rhs._timestamp {return false}
    if lhs.signers != rhs.signers {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
