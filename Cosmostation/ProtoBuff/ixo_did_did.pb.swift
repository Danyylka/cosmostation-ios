// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: ixo/did/did.proto
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

/// Digital identity credential issued to an ixo DID
struct Did_DidCredential {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var credType: [String] = []

  var issuer: String = String()

  var issued: String = String()

  var claim: Did_Claim {
    get {return _claim ?? Did_Claim()}
    set {_claim = newValue}
  }
  /// Returns true if `claim` has been explicitly set.
  var hasClaim: Bool {return self._claim != nil}
  /// Clears the value of `claim`. Subsequent reads from it will return its default value.
  mutating func clearClaim() {self._claim = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _claim: Did_Claim? = nil
}

/// The claim section of a credential, indicating if the DID is KYC validated
struct Did_Claim {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: String = String()

  var kycValidated: Bool = false

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// An ixo DID with public and private keys, based on the Sovrin DID spec
struct Did_IxoDid {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var did: String = String()

  var verifyKey: String = String()

  var encryptionPublicKey: String = String()

  var secret: Did_Secret {
    get {return _secret ?? Did_Secret()}
    set {_secret = newValue}
  }
  /// Returns true if `secret` has been explicitly set.
  var hasSecret: Bool {return self._secret != nil}
  /// Clears the value of `secret`. Subsequent reads from it will return its default value.
  mutating func clearSecret() {self._secret = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _secret: Did_Secret? = nil
}

/// The private section of an ixo DID, based on the Sovrin DID spec
struct Did_Secret {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var seed: String = String()

  var signKey: String = String()

  var encryptionPrivateKey: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "did"

extension Did_DidCredential: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".DidCredential"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "cred_type"),
    2: .same(proto: "issuer"),
    3: .same(proto: "issued"),
    4: .same(proto: "claim"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedStringField(value: &self.credType) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.issuer) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.issued) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._claim) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.credType.isEmpty {
      try visitor.visitRepeatedStringField(value: self.credType, fieldNumber: 1)
    }
    if !self.issuer.isEmpty {
      try visitor.visitSingularStringField(value: self.issuer, fieldNumber: 2)
    }
    if !self.issued.isEmpty {
      try visitor.visitSingularStringField(value: self.issued, fieldNumber: 3)
    }
    if let v = self._claim {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Did_DidCredential, rhs: Did_DidCredential) -> Bool {
    if lhs.credType != rhs.credType {return false}
    if lhs.issuer != rhs.issuer {return false}
    if lhs.issued != rhs.issued {return false}
    if lhs._claim != rhs._claim {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Did_Claim: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Claim"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .standard(proto: "KYC_validated"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeSingularBoolField(value: &self.kycValidated) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if self.kycValidated != false {
      try visitor.visitSingularBoolField(value: self.kycValidated, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Did_Claim, rhs: Did_Claim) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.kycValidated != rhs.kycValidated {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Did_IxoDid: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".IxoDid"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "did"),
    2: .standard(proto: "verify_key"),
    3: .standard(proto: "encryption_public_key"),
    4: .same(proto: "secret"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.did) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.verifyKey) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.encryptionPublicKey) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._secret) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.did.isEmpty {
      try visitor.visitSingularStringField(value: self.did, fieldNumber: 1)
    }
    if !self.verifyKey.isEmpty {
      try visitor.visitSingularStringField(value: self.verifyKey, fieldNumber: 2)
    }
    if !self.encryptionPublicKey.isEmpty {
      try visitor.visitSingularStringField(value: self.encryptionPublicKey, fieldNumber: 3)
    }
    if let v = self._secret {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Did_IxoDid, rhs: Did_IxoDid) -> Bool {
    if lhs.did != rhs.did {return false}
    if lhs.verifyKey != rhs.verifyKey {return false}
    if lhs.encryptionPublicKey != rhs.encryptionPublicKey {return false}
    if lhs._secret != rhs._secret {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Did_Secret: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Secret"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "seed"),
    2: .standard(proto: "sign_key"),
    3: .standard(proto: "encryption_private_key"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.seed) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.signKey) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.encryptionPrivateKey) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.seed.isEmpty {
      try visitor.visitSingularStringField(value: self.seed, fieldNumber: 1)
    }
    if !self.signKey.isEmpty {
      try visitor.visitSingularStringField(value: self.signKey, fieldNumber: 2)
    }
    if !self.encryptionPrivateKey.isEmpty {
      try visitor.visitSingularStringField(value: self.encryptionPrivateKey, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Did_Secret, rhs: Did_Secret) -> Bool {
    if lhs.seed != rhs.seed {return false}
    if lhs.signKey != rhs.signKey {return false}
    if lhs.encryptionPrivateKey != rhs.encryptionPrivateKey {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
