// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ibc/applications/interchain_accounts/v1/account.proto
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

/// An InterchainAccount is defined as a BaseAccount & the address of the account owner on the controller chain
struct Ibc_Applications_InterchainAccounts_V1_InterchainAccount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var baseAccount: Cosmos_Auth_V1beta1_BaseAccount {
    get {return _baseAccount ?? Cosmos_Auth_V1beta1_BaseAccount()}
    set {_baseAccount = newValue}
  }
  /// Returns true if `baseAccount` has been explicitly set.
  var hasBaseAccount: Bool {return self._baseAccount != nil}
  /// Clears the value of `baseAccount`. Subsequent reads from it will return its default value.
  mutating func clearBaseAccount() {self._baseAccount = nil}

  var accountOwner: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _baseAccount: Cosmos_Auth_V1beta1_BaseAccount? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Ibc_Applications_InterchainAccounts_V1_InterchainAccount: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "ibc.applications.interchain_accounts.v1"

extension Ibc_Applications_InterchainAccounts_V1_InterchainAccount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".InterchainAccount"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "base_account"),
    2: .standard(proto: "account_owner"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._baseAccount) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.accountOwner) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._baseAccount {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    if !self.accountOwner.isEmpty {
      try visitor.visitSingularStringField(value: self.accountOwner, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Ibc_Applications_InterchainAccounts_V1_InterchainAccount, rhs: Ibc_Applications_InterchainAccounts_V1_InterchainAccount) -> Bool {
    if lhs._baseAccount != rhs._baseAccount {return false}
    if lhs.accountOwner != rhs.accountOwner {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
