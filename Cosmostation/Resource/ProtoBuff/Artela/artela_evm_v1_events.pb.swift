// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: artela/evm/v1/events.proto
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

/// EventEthereumTx defines the event for an Ethereum transaction
struct Artela_Evm_V1_EventEthereumTx {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// amount
  var amount: String = String()

  /// eth_hash is the Ethereum hash of the transaction
  var ethHash: String = String()

  /// index of the transaction in the block
  var index: String = String()

  /// gas_used is the amount of gas used by the transaction
  var gasUsed: String = String()

  /// hash is the Tendermint hash of the transaction
  var hash: String = String()

  /// recipient of the transaction
  var recipient: String = String()

  /// eth_tx_failed contains a VM error should it occur
  var ethTxFailed: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// EventTxLog defines the event for an Ethereum transaction log
struct Artela_Evm_V1_EventTxLog {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// tx_logs is an array of transaction logs
  var txLogs: [String] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// EventMessage
struct Artela_Evm_V1_EventMessage {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// module which emits the event
  var module: String = String()

  /// sender of the message
  var sender: String = String()

  /// tx_type is the type of the message
  var txType: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// EventBlockBloom defines an Ethereum block bloom filter event
struct Artela_Evm_V1_EventBlockBloom {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// bloom is the bloom filter of the block
  var bloom: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Artela_Evm_V1_EventEthereumTx: @unchecked Sendable {}
extension Artela_Evm_V1_EventTxLog: @unchecked Sendable {}
extension Artela_Evm_V1_EventMessage: @unchecked Sendable {}
extension Artela_Evm_V1_EventBlockBloom: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "artela.evm.v1"

extension Artela_Evm_V1_EventEthereumTx: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".EventEthereumTx"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
    2: .standard(proto: "eth_hash"),
    3: .same(proto: "index"),
    4: .standard(proto: "gas_used"),
    5: .same(proto: "hash"),
    6: .same(proto: "recipient"),
    7: .standard(proto: "eth_tx_failed"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.amount) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.ethHash) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.index) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.gasUsed) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.hash) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.recipient) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.ethTxFailed) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.amount.isEmpty {
      try visitor.visitSingularStringField(value: self.amount, fieldNumber: 1)
    }
    if !self.ethHash.isEmpty {
      try visitor.visitSingularStringField(value: self.ethHash, fieldNumber: 2)
    }
    if !self.index.isEmpty {
      try visitor.visitSingularStringField(value: self.index, fieldNumber: 3)
    }
    if !self.gasUsed.isEmpty {
      try visitor.visitSingularStringField(value: self.gasUsed, fieldNumber: 4)
    }
    if !self.hash.isEmpty {
      try visitor.visitSingularStringField(value: self.hash, fieldNumber: 5)
    }
    if !self.recipient.isEmpty {
      try visitor.visitSingularStringField(value: self.recipient, fieldNumber: 6)
    }
    if !self.ethTxFailed.isEmpty {
      try visitor.visitSingularStringField(value: self.ethTxFailed, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Artela_Evm_V1_EventEthereumTx, rhs: Artela_Evm_V1_EventEthereumTx) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.ethHash != rhs.ethHash {return false}
    if lhs.index != rhs.index {return false}
    if lhs.gasUsed != rhs.gasUsed {return false}
    if lhs.hash != rhs.hash {return false}
    if lhs.recipient != rhs.recipient {return false}
    if lhs.ethTxFailed != rhs.ethTxFailed {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Artela_Evm_V1_EventTxLog: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".EventTxLog"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "tx_logs"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedStringField(value: &self.txLogs) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.txLogs.isEmpty {
      try visitor.visitRepeatedStringField(value: self.txLogs, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Artela_Evm_V1_EventTxLog, rhs: Artela_Evm_V1_EventTxLog) -> Bool {
    if lhs.txLogs != rhs.txLogs {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Artela_Evm_V1_EventMessage: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".EventMessage"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "module"),
    2: .same(proto: "sender"),
    3: .standard(proto: "tx_type"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.module) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.txType) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.module.isEmpty {
      try visitor.visitSingularStringField(value: self.module, fieldNumber: 1)
    }
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 2)
    }
    if !self.txType.isEmpty {
      try visitor.visitSingularStringField(value: self.txType, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Artela_Evm_V1_EventMessage, rhs: Artela_Evm_V1_EventMessage) -> Bool {
    if lhs.module != rhs.module {return false}
    if lhs.sender != rhs.sender {return false}
    if lhs.txType != rhs.txType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Artela_Evm_V1_EventBlockBloom: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".EventBlockBloom"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "bloom"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.bloom) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.bloom.isEmpty {
      try visitor.visitSingularStringField(value: self.bloom, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Artela_Evm_V1_EventBlockBloom, rhs: Artela_Evm_V1_EventBlockBloom) -> Bool {
    if lhs.bloom != rhs.bloom {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
