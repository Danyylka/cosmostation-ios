// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: starname/iov/escrow/v1beta1/query.proto
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

/// QueryEscrowRequest is the request type for the Query/Escrow RPC method
struct Starnamed_X_Escrow_V1beta1_QueryEscrowRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryEscrowResponse is the response type for the Query/Escrow RPC method
struct Starnamed_X_Escrow_V1beta1_QueryEscrowResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var escrow: Starnamed_X_Escrow_V1beta1_Escrow {
    get {return _escrow ?? Starnamed_X_Escrow_V1beta1_Escrow()}
    set {_escrow = newValue}
  }
  /// Returns true if `escrow` has been explicitly set.
  var hasEscrow: Bool {return self._escrow != nil}
  /// Clears the value of `escrow`. Subsequent reads from it will return its default value.
  mutating func clearEscrow() {self._escrow = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _escrow: Starnamed_X_Escrow_V1beta1_Escrow? = nil
}

/// QueryEscrowsRequest is the request type for the Query/Escrows RPC method
struct Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var seller: String = String()

  var state: String = String()

  var objectKey: String = String()

  var paginationStart: UInt64 = 0

  var paginationLength: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryEscrowsResponse is the response type for the Query/Escrows RPC method
struct Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var escrows: [Starnamed_X_Escrow_V1beta1_Escrow] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "starnamed.x.escrow.v1beta1"

extension Starnamed_X_Escrow_V1beta1_QueryEscrowRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryEscrowRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_QueryEscrowRequest, rhs: Starnamed_X_Escrow_V1beta1_QueryEscrowRequest) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Escrow_V1beta1_QueryEscrowResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryEscrowResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "escrow"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._escrow) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._escrow {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_QueryEscrowResponse, rhs: Starnamed_X_Escrow_V1beta1_QueryEscrowResponse) -> Bool {
    if lhs._escrow != rhs._escrow {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryEscrowsRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "seller"),
    2: .same(proto: "state"),
    3: .standard(proto: "object_key"),
    4: .standard(proto: "pagination_start"),
    5: .standard(proto: "pagination_length"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.seller) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.state) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.objectKey) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.paginationStart) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.paginationLength) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.seller.isEmpty {
      try visitor.visitSingularStringField(value: self.seller, fieldNumber: 1)
    }
    if !self.state.isEmpty {
      try visitor.visitSingularStringField(value: self.state, fieldNumber: 2)
    }
    if !self.objectKey.isEmpty {
      try visitor.visitSingularStringField(value: self.objectKey, fieldNumber: 3)
    }
    if self.paginationStart != 0 {
      try visitor.visitSingularUInt64Field(value: self.paginationStart, fieldNumber: 4)
    }
    if self.paginationLength != 0 {
      try visitor.visitSingularUInt64Field(value: self.paginationLength, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest, rhs: Starnamed_X_Escrow_V1beta1_QueryEscrowsRequest) -> Bool {
    if lhs.seller != rhs.seller {return false}
    if lhs.state != rhs.state {return false}
    if lhs.objectKey != rhs.objectKey {return false}
    if lhs.paginationStart != rhs.paginationStart {return false}
    if lhs.paginationLength != rhs.paginationLength {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryEscrowsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "escrows"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.escrows) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.escrows.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.escrows, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse, rhs: Starnamed_X_Escrow_V1beta1_QueryEscrowsResponse) -> Bool {
    if lhs.escrows != rhs.escrows {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
