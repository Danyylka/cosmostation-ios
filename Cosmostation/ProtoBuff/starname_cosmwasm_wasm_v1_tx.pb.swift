// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: starname/cosmwasm/wasm/v1/tx.proto
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

/// MsgStoreCode submit Wasm code to the system
struct Starnamed_X_Wasm_V1beta1_MsgStoreCode {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Sender is the that actor that signed the messages
  var sender: String = String()

  /// WASMByteCode can be raw or gzip compressed
  var wasmByteCode: Data = Data()

  /// InstantiatePermission access control to apply on contract creation,
  /// optional
  var instantiatePermission: Starnamed_X_Wasm_V1beta1_AccessConfig {
    get {return _instantiatePermission ?? Starnamed_X_Wasm_V1beta1_AccessConfig()}
    set {_instantiatePermission = newValue}
  }
  /// Returns true if `instantiatePermission` has been explicitly set.
  var hasInstantiatePermission: Bool {return self._instantiatePermission != nil}
  /// Clears the value of `instantiatePermission`. Subsequent reads from it will return its default value.
  mutating func clearInstantiatePermission() {self._instantiatePermission = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _instantiatePermission: Starnamed_X_Wasm_V1beta1_AccessConfig? = nil
}

/// MsgStoreCodeResponse returns store result data.
struct Starnamed_X_Wasm_V1beta1_MsgStoreCodeResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// CodeID is the reference to the stored WASM code
  var codeID: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgInstantiateContract create a new smart contract instance for the given
/// code id.
struct Starnamed_X_Wasm_V1beta1_MsgInstantiateContract {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Sender is the that actor that signed the messages
  var sender: String = String()

  /// Admin is an optional address that can execute migrations
  var admin: String = String()

  /// CodeID is the reference to the stored WASM code
  var codeID: UInt64 = 0

  /// Label is optional metadata to be stored with a contract instance.
  var label: String = String()

  /// Msg json encoded message to be passed to the contract on instantiation
  var msg: Data = Data()

  /// Funds coins that are transferred to the contract on instantiation
  var funds: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgInstantiateContractResponse return instantiation result data
struct Starnamed_X_Wasm_V1beta1_MsgInstantiateContractResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Address is the bech32 address of the new contract instance.
  var address: String = String()

  /// Data contains base64-encoded bytes to returned from the contract
  var data: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgExecuteContract submits the given message data to a smart contract
struct Starnamed_X_Wasm_V1beta1_MsgExecuteContract {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Sender is the that actor that signed the messages
  var sender: String = String()

  /// Contract is the address of the smart contract
  var contract: String = String()

  /// Msg json encoded message to be passed to the contract
  var msg: Data = Data()

  /// Funds coins that are transferred to the contract on execution
  var funds: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgExecuteContractResponse returns execution result data.
struct Starnamed_X_Wasm_V1beta1_MsgExecuteContractResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Data contains base64-encoded bytes to returned from the contract
  var data: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgMigrateContract runs a code upgrade/ downgrade for a smart contract
struct Starnamed_X_Wasm_V1beta1_MsgMigrateContract {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Sender is the that actor that signed the messages
  var sender: String = String()

  /// Contract is the address of the smart contract
  var contract: String = String()

  /// CodeID references the new WASM code
  var codeID: UInt64 = 0

  /// Msg json encoded message to be passed to the contract on migration
  var msg: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgMigrateContractResponse returns contract migration result data.
struct Starnamed_X_Wasm_V1beta1_MsgMigrateContractResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Data contains same raw bytes returned as data from the wasm contract.
  /// (May be empty)
  var data: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgUpdateAdmin sets a new admin for a smart contract
struct Starnamed_X_Wasm_V1beta1_MsgUpdateAdmin {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Sender is the that actor that signed the messages
  var sender: String = String()

  /// NewAdmin address to be set
  var newAdmin: String = String()

  /// Contract is the address of the smart contract
  var contract: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgUpdateAdminResponse returns empty data
struct Starnamed_X_Wasm_V1beta1_MsgUpdateAdminResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgClearAdmin removes any admin stored for a smart contract
struct Starnamed_X_Wasm_V1beta1_MsgClearAdmin {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Sender is the that actor that signed the messages
  var sender: String = String()

  /// Contract is the address of the smart contract
  var contract: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgClearAdminResponse returns empty data
struct Starnamed_X_Wasm_V1beta1_MsgClearAdminResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "starnamed.x.wasm.v1beta1"

extension Starnamed_X_Wasm_V1beta1_MsgStoreCode: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgStoreCode"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .standard(proto: "wasm_byte_code"),
    5: .standard(proto: "instantiate_permission"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.wasmByteCode) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._instantiatePermission) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.wasmByteCode.isEmpty {
      try visitor.visitSingularBytesField(value: self.wasmByteCode, fieldNumber: 2)
    }
    if let v = self._instantiatePermission {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgStoreCode, rhs: Starnamed_X_Wasm_V1beta1_MsgStoreCode) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.wasmByteCode != rhs.wasmByteCode {return false}
    if lhs._instantiatePermission != rhs._instantiatePermission {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgStoreCodeResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgStoreCodeResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "code_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.codeID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.codeID != 0 {
      try visitor.visitSingularUInt64Field(value: self.codeID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgStoreCodeResponse, rhs: Starnamed_X_Wasm_V1beta1_MsgStoreCodeResponse) -> Bool {
    if lhs.codeID != rhs.codeID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgInstantiateContract: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgInstantiateContract"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .same(proto: "admin"),
    3: .standard(proto: "code_id"),
    4: .same(proto: "label"),
    5: .same(proto: "msg"),
    6: .same(proto: "funds"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.admin) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.codeID) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.label) }()
      case 5: try { try decoder.decodeSingularBytesField(value: &self.msg) }()
      case 6: try { try decoder.decodeRepeatedMessageField(value: &self.funds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.admin.isEmpty {
      try visitor.visitSingularStringField(value: self.admin, fieldNumber: 2)
    }
    if self.codeID != 0 {
      try visitor.visitSingularUInt64Field(value: self.codeID, fieldNumber: 3)
    }
    if !self.label.isEmpty {
      try visitor.visitSingularStringField(value: self.label, fieldNumber: 4)
    }
    if !self.msg.isEmpty {
      try visitor.visitSingularBytesField(value: self.msg, fieldNumber: 5)
    }
    if !self.funds.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.funds, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgInstantiateContract, rhs: Starnamed_X_Wasm_V1beta1_MsgInstantiateContract) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.admin != rhs.admin {return false}
    if lhs.codeID != rhs.codeID {return false}
    if lhs.label != rhs.label {return false}
    if lhs.msg != rhs.msg {return false}
    if lhs.funds != rhs.funds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgInstantiateContractResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgInstantiateContractResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
    2: .same(proto: "data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.address) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.data) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 1)
    }
    if !self.data.isEmpty {
      try visitor.visitSingularBytesField(value: self.data, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgInstantiateContractResponse, rhs: Starnamed_X_Wasm_V1beta1_MsgInstantiateContractResponse) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.data != rhs.data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgExecuteContract: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgExecuteContract"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .same(proto: "contract"),
    3: .same(proto: "msg"),
    5: .same(proto: "funds"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.contract) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.msg) }()
      case 5: try { try decoder.decodeRepeatedMessageField(value: &self.funds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.contract.isEmpty {
      try visitor.visitSingularStringField(value: self.contract, fieldNumber: 2)
    }
    if !self.msg.isEmpty {
      try visitor.visitSingularBytesField(value: self.msg, fieldNumber: 3)
    }
    if !self.funds.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.funds, fieldNumber: 5)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgExecuteContract, rhs: Starnamed_X_Wasm_V1beta1_MsgExecuteContract) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.contract != rhs.contract {return false}
    if lhs.msg != rhs.msg {return false}
    if lhs.funds != rhs.funds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgExecuteContractResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgExecuteContractResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.data) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.data.isEmpty {
      try visitor.visitSingularBytesField(value: self.data, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgExecuteContractResponse, rhs: Starnamed_X_Wasm_V1beta1_MsgExecuteContractResponse) -> Bool {
    if lhs.data != rhs.data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgMigrateContract: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgMigrateContract"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .same(proto: "contract"),
    3: .standard(proto: "code_id"),
    4: .same(proto: "msg"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.contract) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.codeID) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.msg) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.contract.isEmpty {
      try visitor.visitSingularStringField(value: self.contract, fieldNumber: 2)
    }
    if self.codeID != 0 {
      try visitor.visitSingularUInt64Field(value: self.codeID, fieldNumber: 3)
    }
    if !self.msg.isEmpty {
      try visitor.visitSingularBytesField(value: self.msg, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgMigrateContract, rhs: Starnamed_X_Wasm_V1beta1_MsgMigrateContract) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.contract != rhs.contract {return false}
    if lhs.codeID != rhs.codeID {return false}
    if lhs.msg != rhs.msg {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgMigrateContractResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgMigrateContractResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "data"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBytesField(value: &self.data) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.data.isEmpty {
      try visitor.visitSingularBytesField(value: self.data, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgMigrateContractResponse, rhs: Starnamed_X_Wasm_V1beta1_MsgMigrateContractResponse) -> Bool {
    if lhs.data != rhs.data {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgUpdateAdmin: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateAdmin"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    2: .standard(proto: "new_admin"),
    3: .same(proto: "contract"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.newAdmin) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.contract) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.newAdmin.isEmpty {
      try visitor.visitSingularStringField(value: self.newAdmin, fieldNumber: 2)
    }
    if !self.contract.isEmpty {
      try visitor.visitSingularStringField(value: self.contract, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgUpdateAdmin, rhs: Starnamed_X_Wasm_V1beta1_MsgUpdateAdmin) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.newAdmin != rhs.newAdmin {return false}
    if lhs.contract != rhs.contract {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgUpdateAdminResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgUpdateAdminResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgUpdateAdminResponse, rhs: Starnamed_X_Wasm_V1beta1_MsgUpdateAdminResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgClearAdmin: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgClearAdmin"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "sender"),
    3: .same(proto: "contract"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.contract) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 1)
    }
    if !self.contract.isEmpty {
      try visitor.visitSingularStringField(value: self.contract, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgClearAdmin, rhs: Starnamed_X_Wasm_V1beta1_MsgClearAdmin) -> Bool {
    if lhs.sender != rhs.sender {return false}
    if lhs.contract != rhs.contract {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MsgClearAdminResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgClearAdminResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MsgClearAdminResponse, rhs: Starnamed_X_Wasm_V1beta1_MsgClearAdminResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
