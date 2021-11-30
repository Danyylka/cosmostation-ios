// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: akash/cert/v1beta2/cert.proto
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

/// CertificateID stores owner and sequence number
struct Akash_Cert_V1beta2_CertificateID {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var owner: String = String()

  var serial: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// Certificate stores state, certificate and it's public key
struct Akash_Cert_V1beta2_Certificate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var state: Akash_Cert_V1beta2_Certificate.State = .invalid

  var cert: Data = Data()

  var pubkey: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// State is an enum which refers to state of deployment
  enum State: SwiftProtobuf.Enum {
    typealias RawValue = Int

    /// Prefix should start with 0 in enum. So declaring dummy state
    case invalid // = 0

    /// CertificateValid denotes state for deployment active
    case valid // = 1

    /// CertificateRevoked denotes state for deployment closed
    case revoked // = 2
    case UNRECOGNIZED(Int)

    init() {
      self = .invalid
    }

    init?(rawValue: Int) {
      switch rawValue {
      case 0: self = .invalid
      case 1: self = .valid
      case 2: self = .revoked
      default: self = .UNRECOGNIZED(rawValue)
      }
    }

    var rawValue: Int {
      switch self {
      case .invalid: return 0
      case .valid: return 1
      case .revoked: return 2
      case .UNRECOGNIZED(let i): return i
      }
    }

  }

  init() {}
}

#if swift(>=4.2)

extension Akash_Cert_V1beta2_Certificate.State: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Akash_Cert_V1beta2_Certificate.State] = [
    .invalid,
    .valid,
    .revoked,
  ]
}

#endif  // swift(>=4.2)

/// CertificateFilter defines filters used to filter certificates
struct Akash_Cert_V1beta2_CertificateFilter {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var owner: String = String()

  var serial: String = String()

  var state: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreateCertificate defines an SDK message for creating certificate
struct Akash_Cert_V1beta2_MsgCreateCertificate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var owner: String = String()

  var cert: Data = Data()

  var pubkey: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreateCertificateResponse defines the Msg/CreateCertificate response type.
struct Akash_Cert_V1beta2_MsgCreateCertificateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgRevokeCertificate defines an SDK message for revoking certificate
struct Akash_Cert_V1beta2_MsgRevokeCertificate {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: Akash_Cert_V1beta2_CertificateID {
    get {return _id ?? Akash_Cert_V1beta2_CertificateID()}
    set {_id = newValue}
  }
  /// Returns true if `id` has been explicitly set.
  var hasID: Bool {return self._id != nil}
  /// Clears the value of `id`. Subsequent reads from it will return its default value.
  mutating func clearID() {self._id = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _id: Akash_Cert_V1beta2_CertificateID? = nil
}

/// MsgRevokeCertificateResponse defines the Msg/RevokeCertificate response type.
struct Akash_Cert_V1beta2_MsgRevokeCertificateResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "akash.cert.v1beta2"

extension Akash_Cert_V1beta2_CertificateID: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CertificateID"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "owner"),
    2: .same(proto: "serial"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.serial) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 1)
    }
    if !self.serial.isEmpty {
      try visitor.visitSingularStringField(value: self.serial, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Akash_Cert_V1beta2_CertificateID, rhs: Akash_Cert_V1beta2_CertificateID) -> Bool {
    if lhs.owner != rhs.owner {return false}
    if lhs.serial != rhs.serial {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Akash_Cert_V1beta2_Certificate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Certificate"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    2: .same(proto: "state"),
    3: .same(proto: "cert"),
    4: .same(proto: "pubkey"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 2: try { try decoder.decodeSingularEnumField(value: &self.state) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.cert) }()
      case 4: try { try decoder.decodeSingularBytesField(value: &self.pubkey) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.state != .invalid {
      try visitor.visitSingularEnumField(value: self.state, fieldNumber: 2)
    }
    if !self.cert.isEmpty {
      try visitor.visitSingularBytesField(value: self.cert, fieldNumber: 3)
    }
    if !self.pubkey.isEmpty {
      try visitor.visitSingularBytesField(value: self.pubkey, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Akash_Cert_V1beta2_Certificate, rhs: Akash_Cert_V1beta2_Certificate) -> Bool {
    if lhs.state != rhs.state {return false}
    if lhs.cert != rhs.cert {return false}
    if lhs.pubkey != rhs.pubkey {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Akash_Cert_V1beta2_Certificate.State: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "invalid"),
    1: .same(proto: "valid"),
    2: .same(proto: "revoked"),
  ]
}

extension Akash_Cert_V1beta2_CertificateFilter: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".CertificateFilter"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "owner"),
    2: .same(proto: "serial"),
    3: .same(proto: "state"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.serial) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.state) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 1)
    }
    if !self.serial.isEmpty {
      try visitor.visitSingularStringField(value: self.serial, fieldNumber: 2)
    }
    if !self.state.isEmpty {
      try visitor.visitSingularStringField(value: self.state, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Akash_Cert_V1beta2_CertificateFilter, rhs: Akash_Cert_V1beta2_CertificateFilter) -> Bool {
    if lhs.owner != rhs.owner {return false}
    if lhs.serial != rhs.serial {return false}
    if lhs.state != rhs.state {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Akash_Cert_V1beta2_MsgCreateCertificate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateCertificate"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "owner"),
    2: .same(proto: "cert"),
    3: .same(proto: "pubkey"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      case 2: try { try decoder.decodeSingularBytesField(value: &self.cert) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.pubkey) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 1)
    }
    if !self.cert.isEmpty {
      try visitor.visitSingularBytesField(value: self.cert, fieldNumber: 2)
    }
    if !self.pubkey.isEmpty {
      try visitor.visitSingularBytesField(value: self.pubkey, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Akash_Cert_V1beta2_MsgCreateCertificate, rhs: Akash_Cert_V1beta2_MsgCreateCertificate) -> Bool {
    if lhs.owner != rhs.owner {return false}
    if lhs.cert != rhs.cert {return false}
    if lhs.pubkey != rhs.pubkey {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Akash_Cert_V1beta2_MsgCreateCertificateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreateCertificateResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Akash_Cert_V1beta2_MsgCreateCertificateResponse, rhs: Akash_Cert_V1beta2_MsgCreateCertificateResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Akash_Cert_V1beta2_MsgRevokeCertificate: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgRevokeCertificate"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._id) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._id {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Akash_Cert_V1beta2_MsgRevokeCertificate, rhs: Akash_Cert_V1beta2_MsgRevokeCertificate) -> Bool {
    if lhs._id != rhs._id {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Akash_Cert_V1beta2_MsgRevokeCertificateResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgRevokeCertificateResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Akash_Cert_V1beta2_MsgRevokeCertificateResponse, rhs: Akash_Cert_V1beta2_MsgRevokeCertificateResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
