// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: starname/cosmwasm/wasm/v1/proposal.proto
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

/// StoreCodeProposal gov proposal content type to submit WASM code to the system
struct Starnamed_X_Wasm_V1beta1_StoreCodeProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Title is a short summary
  var title: String = String()

  /// Description is a human readable text
  var description_p: String = String()

  /// RunAs is the address that is passed to the contract's environment as sender
  var runAs: String = String()

  /// WASMByteCode can be raw or gzip compressed
  var wasmByteCode: Data = Data()

  /// InstantiatePermission to apply on contract creation, optional
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

/// InstantiateContractProposal gov proposal content type to instantiate a
/// contract.
struct Starnamed_X_Wasm_V1beta1_InstantiateContractProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Title is a short summary
  var title: String = String()

  /// Description is a human readable text
  var description_p: String = String()

  /// RunAs is the address that is passed to the contract's environment as sender
  var runAs: String = String()

  /// Admin is an optional address that can execute migrations
  var admin: String = String()

  /// CodeID is the reference to the stored WASM code
  var codeID: UInt64 = 0

  /// Label is optional metadata to be stored with a constract instance.
  var label: String = String()

  /// Msg json encoded message to be passed to the contract on instantiation
  var msg: Data = Data()

  /// Funds coins that are transferred to the contract on instantiation
  var funds: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MigrateContractProposal gov proposal content type to migrate a contract.
struct Starnamed_X_Wasm_V1beta1_MigrateContractProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Title is a short summary
  var title: String = String()

  /// Description is a human readable text
  var description_p: String = String()

  /// RunAs is the address that is passed to the contract's environment as sender
  var runAs: String = String()

  /// Contract is the address of the smart contract
  var contract: String = String()

  /// CodeID references the new WASM code
  var codeID: UInt64 = 0

  /// Msg json encoded message to be passed to the contract on migration
  var msg: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// UpdateAdminProposal gov proposal content type to set an admin for a contract.
struct Starnamed_X_Wasm_V1beta1_UpdateAdminProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Title is a short summary
  var title: String = String()

  /// Description is a human readable text
  var description_p: String = String()

  /// NewAdmin address to be set
  var newAdmin: String = String()

  /// Contract is the address of the smart contract
  var contract: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// ClearAdminProposal gov proposal content type to clear the admin of a
/// contract.
struct Starnamed_X_Wasm_V1beta1_ClearAdminProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Title is a short summary
  var title: String = String()

  /// Description is a human readable text
  var description_p: String = String()

  /// Contract is the address of the smart contract
  var contract: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// PinCodesProposal gov proposal content type to pin a set of code ids in the
/// wasmvm cache.
struct Starnamed_X_Wasm_V1beta1_PinCodesProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Title is a short summary
  var title: String = String()

  /// Description is a human readable text
  var description_p: String = String()

  /// CodeIDs references the new WASM codes
  var codeIds: [UInt64] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// UnpinCodesProposal gov proposal content type to unpin a set of code ids in
/// the wasmvm cache.
struct Starnamed_X_Wasm_V1beta1_UnpinCodesProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// Title is a short summary
  var title: String = String()

  /// Description is a human readable text
  var description_p: String = String()

  /// CodeIDs references the WASM codes
  var codeIds: [UInt64] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "starnamed.x.wasm.v1beta1"

extension Starnamed_X_Wasm_V1beta1_StoreCodeProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".StoreCodeProposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "description"),
    3: .standard(proto: "run_as"),
    4: .standard(proto: "wasm_byte_code"),
    7: .standard(proto: "instantiate_permission"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.runAs) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.wasmByteCode) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._instantiatePermission) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.runAs.isEmpty {
      try visitor.visitSingularStringField(value: self.runAs, fieldNumber: 3)
    }
    if !self.wasmByteCode.isEmpty {
      try visitor.visitSingularBytesField(value: self.wasmByteCode, fieldNumber: 4)
    }
    if let v = self._instantiatePermission {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_StoreCodeProposal, rhs: Starnamed_X_Wasm_V1beta1_StoreCodeProposal) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.runAs != rhs.runAs {return false}
    if lhs.wasmByteCode != rhs.wasmByteCode {return false}
    if lhs._instantiatePermission != rhs._instantiatePermission {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_InstantiateContractProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".InstantiateContractProposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "description"),
    3: .standard(proto: "run_as"),
    4: .same(proto: "admin"),
    5: .standard(proto: "code_id"),
    6: .same(proto: "label"),
    7: .same(proto: "msg"),
    8: .same(proto: "funds"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.runAs) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.admin) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.codeID) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.label) }()
      case 7: try { try decoder.decodeSingularBytesField(value: &self.msg) }()
      case 8: try { try decoder.decodeRepeatedMessageField(value: &self.funds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.runAs.isEmpty {
      try visitor.visitSingularStringField(value: self.runAs, fieldNumber: 3)
    }
    if !self.admin.isEmpty {
      try visitor.visitSingularStringField(value: self.admin, fieldNumber: 4)
    }
    if self.codeID != 0 {
      try visitor.visitSingularUInt64Field(value: self.codeID, fieldNumber: 5)
    }
    if !self.label.isEmpty {
      try visitor.visitSingularStringField(value: self.label, fieldNumber: 6)
    }
    if !self.msg.isEmpty {
      try visitor.visitSingularBytesField(value: self.msg, fieldNumber: 7)
    }
    if !self.funds.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.funds, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_InstantiateContractProposal, rhs: Starnamed_X_Wasm_V1beta1_InstantiateContractProposal) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.runAs != rhs.runAs {return false}
    if lhs.admin != rhs.admin {return false}
    if lhs.codeID != rhs.codeID {return false}
    if lhs.label != rhs.label {return false}
    if lhs.msg != rhs.msg {return false}
    if lhs.funds != rhs.funds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_MigrateContractProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MigrateContractProposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "description"),
    3: .standard(proto: "run_as"),
    4: .same(proto: "contract"),
    5: .standard(proto: "code_id"),
    6: .same(proto: "msg"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.runAs) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.contract) }()
      case 5: try { try decoder.decodeSingularUInt64Field(value: &self.codeID) }()
      case 6: try { try decoder.decodeSingularBytesField(value: &self.msg) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.runAs.isEmpty {
      try visitor.visitSingularStringField(value: self.runAs, fieldNumber: 3)
    }
    if !self.contract.isEmpty {
      try visitor.visitSingularStringField(value: self.contract, fieldNumber: 4)
    }
    if self.codeID != 0 {
      try visitor.visitSingularUInt64Field(value: self.codeID, fieldNumber: 5)
    }
    if !self.msg.isEmpty {
      try visitor.visitSingularBytesField(value: self.msg, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_MigrateContractProposal, rhs: Starnamed_X_Wasm_V1beta1_MigrateContractProposal) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.runAs != rhs.runAs {return false}
    if lhs.contract != rhs.contract {return false}
    if lhs.codeID != rhs.codeID {return false}
    if lhs.msg != rhs.msg {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_UpdateAdminProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UpdateAdminProposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "description"),
    3: .standard(proto: "new_admin"),
    4: .same(proto: "contract"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.newAdmin) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.contract) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.newAdmin.isEmpty {
      try visitor.visitSingularStringField(value: self.newAdmin, fieldNumber: 3)
    }
    if !self.contract.isEmpty {
      try visitor.visitSingularStringField(value: self.contract, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_UpdateAdminProposal, rhs: Starnamed_X_Wasm_V1beta1_UpdateAdminProposal) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.newAdmin != rhs.newAdmin {return false}
    if lhs.contract != rhs.contract {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_ClearAdminProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ClearAdminProposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "description"),
    3: .same(proto: "contract"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.contract) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.contract.isEmpty {
      try visitor.visitSingularStringField(value: self.contract, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_ClearAdminProposal, rhs: Starnamed_X_Wasm_V1beta1_ClearAdminProposal) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.contract != rhs.contract {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_PinCodesProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".PinCodesProposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "description"),
    3: .standard(proto: "code_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 3: try { try decoder.decodeRepeatedUInt64Field(value: &self.codeIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.codeIds.isEmpty {
      try visitor.visitPackedUInt64Field(value: self.codeIds, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_PinCodesProposal, rhs: Starnamed_X_Wasm_V1beta1_PinCodesProposal) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.codeIds != rhs.codeIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Starnamed_X_Wasm_V1beta1_UnpinCodesProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UnpinCodesProposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "description"),
    3: .standard(proto: "code_ids"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 3: try { try decoder.decodeRepeatedUInt64Field(value: &self.codeIds) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.title.isEmpty {
      try visitor.visitSingularStringField(value: self.title, fieldNumber: 1)
    }
    if !self.description_p.isEmpty {
      try visitor.visitSingularStringField(value: self.description_p, fieldNumber: 2)
    }
    if !self.codeIds.isEmpty {
      try visitor.visitPackedUInt64Field(value: self.codeIds, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Starnamed_X_Wasm_V1beta1_UnpinCodesProposal, rhs: Starnamed_X_Wasm_V1beta1_UnpinCodesProposal) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.codeIds != rhs.codeIds {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
