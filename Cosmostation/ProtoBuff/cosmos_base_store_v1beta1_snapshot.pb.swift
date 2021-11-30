// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/base/store/v1beta1/snapshot.proto
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

/// SnapshotItem is an item contained in a rootmulti.Store snapshot.
struct Cosmos_Base_Store_V1beta1_SnapshotItem {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// item is the specific type of snapshot item.
  var item: Cosmos_Base_Store_V1beta1_SnapshotItem.OneOf_Item? = nil

  var store: Cosmos_Base_Store_V1beta1_SnapshotStoreItem {
    get {
      if case .store(let v)? = item {return v}
      return Cosmos_Base_Store_V1beta1_SnapshotStoreItem()
    }
    set {item = .store(newValue)}
  }

  var iavl: Cosmos_Base_Store_V1beta1_SnapshotIAVLItem {
    get {
      if case .iavl(let v)? = item {return v}
      return Cosmos_Base_Store_V1beta1_SnapshotIAVLItem()
    }
    set {item = .iavl(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// item is the specific type of snapshot item.
  enum OneOf_Item: Equatable {
    case store(Cosmos_Base_Store_V1beta1_SnapshotStoreItem)
    case iavl(Cosmos_Base_Store_V1beta1_SnapshotIAVLItem)

  #if !swift(>=4.1)
    static func ==(lhs: Cosmos_Base_Store_V1beta1_SnapshotItem.OneOf_Item, rhs: Cosmos_Base_Store_V1beta1_SnapshotItem.OneOf_Item) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.store, .store): return {
        guard case .store(let l) = lhs, case .store(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.iavl, .iavl): return {
        guard case .iavl(let l) = lhs, case .iavl(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  init() {}
}

/// SnapshotStoreItem contains metadata about a snapshotted store.
struct Cosmos_Base_Store_V1beta1_SnapshotStoreItem {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var name: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// SnapshotIAVLItem is an exported IAVL node.
struct Cosmos_Base_Store_V1beta1_SnapshotIAVLItem {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var key: Data = Data()

  var value: Data = Data()

  var version: Int64 = 0

  var height: Int32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.base.store.v1beta1"

extension Cosmos_Base_Store_V1beta1_SnapshotItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SnapshotItem"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "store"),
    2: .same(proto: "iavl"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: Cosmos_Base_Store_V1beta1_SnapshotStoreItem?
        var hadOneofValue = false
        if let current = self.item {
          hadOneofValue = true
          if case .store(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.item = .store(v)
        }
      }()
      case 2: try {
        var v: Cosmos_Base_Store_V1beta1_SnapshotIAVLItem?
        var hadOneofValue = false
        if let current = self.item {
          hadOneofValue = true
          if case .iavl(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.item = .iavl(v)
        }
      }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every case branch when no optimizations are
    // enabled. https://github.com/apple/swift-protobuf/issues/1034
    switch self.item {
    case .store?: try {
      guard case .store(let v)? = self.item else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }()
    case .iavl?: try {
      guard case .iavl(let v)? = self.item else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    case nil: break
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Store_V1beta1_SnapshotItem, rhs: Cosmos_Base_Store_V1beta1_SnapshotItem) -> Bool {
    if lhs.item != rhs.item {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Store_V1beta1_SnapshotStoreItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SnapshotStoreItem"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "name"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.name) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Store_V1beta1_SnapshotStoreItem, rhs: Cosmos_Base_Store_V1beta1_SnapshotStoreItem) -> Bool {
    if lhs.name != rhs.name {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Base_Store_V1beta1_SnapshotIAVLItem: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".SnapshotIAVLItem"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "key"),
    2: .same(proto: "value"),
    3: .same(proto: "version"),
    4: .same(proto: "height"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.key) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.value) }()
      case 3: try { try decoder.decodeSingularInt64Field(value: &self.version) }()
      case 4: try { try decoder.decodeSingularInt32Field(value: &self.height) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.key.isEmpty {
      try visitor.visitSingularBytesField(value: self.key, fieldNumber: 1)
    }
    if !self.value.isEmpty {
      try visitor.visitSingularBytesField(value: self.value, fieldNumber: 2)
    }
    if self.version != 0 {
      try visitor.visitSingularInt64Field(value: self.version, fieldNumber: 3)
    }
    if self.height != 0 {
      try visitor.visitSingularInt32Field(value: self.height, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Base_Store_V1beta1_SnapshotIAVLItem, rhs: Cosmos_Base_Store_V1beta1_SnapshotIAVLItem) -> Bool {
    if lhs.key != rhs.key {return false}
    if lhs.value != rhs.value {return false}
    if lhs.version != rhs.version {return false}
    if lhs.height != rhs.height {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
