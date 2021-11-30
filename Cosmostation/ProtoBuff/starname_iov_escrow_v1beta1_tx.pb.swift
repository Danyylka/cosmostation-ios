// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: starname/iov/escrow/v1beta1/tx.proto
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

/// MsgCreateEscrow defines a message to create an escrow
struct Starnamed_X_Escrow_V1beta1_MsgCreateEscrow {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var seller: String = String()

  var feePayer: String = String()

  var object: Google_Protobuf_Any {
    get {return _object ?? Google_Protobuf_Any()}
    set {_object = newValue}
  }
  /// Returns true if `object` has been explicitly set.
  var hasObject: Bool {return self._object != nil}
  /// Clears the value of `object`. Subsequent reads from it will return its default value.
  mutating func clearObject() {self._object = nil}

  var price: [Cosmos_Base_V1beta1_Coin] = []

  var deadline: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _object: Google_Protobuf_Any? = nil
}

/// MsgCreateEscrowResponse defines the Msg/CreateEscrow response type
struct Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgUpdateEscrow defines a message to update an escrow
struct Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var updater: String = String()

  var feePayer: String = String()

  var seller: String = String()

  var price: [Cosmos_Base_V1beta1_Coin] = []

  var deadline: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgUpdateEscrowResponse defines the Msg/UpdateEscrow response type
struct Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var sender: String = String()

  var feePayer: String = String()

  var amount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Starnamed_X_Escrow_V1beta1_MsgRefundEscrow {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var sender: String = String()

  var feePayer: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

struct Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "starnamed.x.escrow.v1beta1"

extension Starnamed_X_Escrow_V1beta1_MsgCreateEscrow: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateEscrow"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "seller"),
    2: .standard(proto: "fee_payer"),
    3: .same(proto: "object"),
    4: .same(proto: "price"),
    5: .same(proto: "deadline"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.seller) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.feePayer) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._object) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.price) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.deadline) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.seller.isEmpty {
      try visitor.visitSingularStringField(value: self.seller, fieldNumber: 1)
    }
    if !self.feePayer.isEmpty {
      try visitor.visitSingularStringField(value: self.feePayer, fieldNumber: 2)
    }
    if let v = self._object {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    if !self.price.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.price, fieldNumber: 4)
    }
    if self.deadline != 0 {
      try visitor.visitSingularUInt64Field(value: self.deadline, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_MsgCreateEscrow, rhs: Starnamed_X_Escrow_V1beta1_MsgCreateEscrow) -> Bool {
    if lhs.seller != rhs.seller {return false}
    if lhs.feePayer != rhs.feePayer {return false}
    if lhs._object != rhs._object {return false}
    if lhs.price != rhs.price {return false}
    if lhs.deadline != rhs.deadline {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateEscrowResponse"
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

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse, rhs: Starnamed_X_Escrow_V1beta1_MsgCreateEscrowResponse) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateEscrow"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "updater"),
    3: .standard(proto: "fee_payer"),
    4: .same(proto: "seller"),
    5: .same(proto: "price"),
    6: .same(proto: "deadline"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.updater) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.feePayer) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.seller) }()
      case 5: try { try decoder.decodeRepeatedMessageField(value: &self.price) }()
      case 6: try { try decoder.decodeSingularUInt64Field(value: &self.deadline) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.updater.isEmpty {
      try visitor.visitSingularStringField(value: self.updater, fieldNumber: 2)
    }
    if !self.feePayer.isEmpty {
      try visitor.visitSingularStringField(value: self.feePayer, fieldNumber: 3)
    }
    if !self.seller.isEmpty {
      try visitor.visitSingularStringField(value: self.seller, fieldNumber: 4)
    }
    if !self.price.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.price, fieldNumber: 5)
    }
    if self.deadline != 0 {
      try visitor.visitSingularUInt64Field(value: self.deadline, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow, rhs: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrow) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.updater != rhs.updater {return false}
    if lhs.feePayer != rhs.feePayer {return false}
    if lhs.seller != rhs.seller {return false}
    if lhs.price != rhs.price {return false}
    if lhs.deadline != rhs.deadline {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateEscrowResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse, rhs: Starnamed_X_Escrow_V1beta1_MsgUpdateEscrowResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgTransferToEscrow"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "sender"),
    3: .standard(proto: "fee_payer"),
    4: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.feePayer) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 2)
    }
    if !self.feePayer.isEmpty {
      try visitor.visitSingularStringField(value: self.feePayer, fieldNumber: 3)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow, rhs: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrow) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.sender != rhs.sender {return false}
    if lhs.feePayer != rhs.feePayer {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgTransferToEscrowResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse, rhs: Starnamed_X_Escrow_V1beta1_MsgTransferToEscrowResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Escrow_V1beta1_MsgRefundEscrow: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgRefundEscrow"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "sender"),
    3: .standard(proto: "fee_payer"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.feePayer) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 2)
    }
    if !self.feePayer.isEmpty {
      try visitor.visitSingularStringField(value: self.feePayer, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_MsgRefundEscrow, rhs: Starnamed_X_Escrow_V1beta1_MsgRefundEscrow) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.sender != rhs.sender {return false}
    if lhs.feePayer != rhs.feePayer {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgRefundEscrowResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse, rhs: Starnamed_X_Escrow_V1beta1_MsgRefundEscrowResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
