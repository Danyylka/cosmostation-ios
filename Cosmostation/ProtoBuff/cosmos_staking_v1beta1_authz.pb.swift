// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: cosmos/staking/v1beta1/authz.proto
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

/// AuthorizationType defines the type of staking module authorization type
///
/// Since: cosmos-sdk 0.43
enum Cosmos_Staking_V1beta1_AuthorizationType: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// AUTHORIZATION_TYPE_UNSPECIFIED specifies an unknown authorization type
  case unspecified // = 0

  /// AUTHORIZATION_TYPE_DELEGATE defines an authorization type for Msg/Delegate
  case delegate // = 1

  /// AUTHORIZATION_TYPE_UNDELEGATE defines an authorization type for Msg/Undelegate
  case undelegate // = 2

  /// AUTHORIZATION_TYPE_REDELEGATE defines an authorization type for Msg/BeginRedelegate
  case redelegate // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .delegate
    case 2: self = .undelegate
    case 3: self = .redelegate
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .delegate: return 1
    case .undelegate: return 2
    case .redelegate: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Cosmos_Staking_V1beta1_AuthorizationType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Cosmos_Staking_V1beta1_AuthorizationType] = [
    .unspecified,
    .delegate,
    .undelegate,
    .redelegate,
  ]
}

#endif  // swift(>=4.2)

/// StakeAuthorization defines authorization for delegate/undelegate/redelegate.
///
/// Since: cosmos-sdk 0.43
struct Cosmos_Staking_V1beta1_StakeAuthorization {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// max_tokens specifies the maximum amount of tokens can be delegate to a validator. If it is
  /// empty, there is no spend limit and any amount of coins can be delegated.
  var maxTokens: Cosmos_Base_V1beta1_Coin {
    get {return _maxTokens ?? Cosmos_Base_V1beta1_Coin()}
    set {_maxTokens = newValue}
  }
  /// Returns true if `maxTokens` has been explicitly set.
  var hasMaxTokens: Bool {return self._maxTokens != nil}
  /// Clears the value of `maxTokens`. Subsequent reads from it will return its default value.
  mutating func clearMaxTokens() {self._maxTokens = nil}

  /// validators is the oneof that represents either allow_list or deny_list
  var validators: Cosmos_Staking_V1beta1_StakeAuthorization.OneOf_Validators? = nil

  /// allow_list specifies list of validator addresses to whom grantee can delegate tokens on behalf of granter's
  /// account.
  var allowList: Cosmos_Staking_V1beta1_StakeAuthorization.Validators {
    get {
      if case .allowList(let v)? = validators {return v}
      return Cosmos_Staking_V1beta1_StakeAuthorization.Validators()
    }
    set {validators = .allowList(newValue)}
  }

  /// deny_list specifies list of validator addresses to whom grantee can not delegate tokens.
  var denyList: Cosmos_Staking_V1beta1_StakeAuthorization.Validators {
    get {
      if case .denyList(let v)? = validators {return v}
      return Cosmos_Staking_V1beta1_StakeAuthorization.Validators()
    }
    set {validators = .denyList(newValue)}
  }

  /// authorization_type defines one of AuthorizationType.
  var authorizationType: Cosmos_Staking_V1beta1_AuthorizationType = .unspecified

  var unknownFields = SwiftProtobuf.UnknownStorage()

  /// validators is the oneof that represents either allow_list or deny_list
  enum OneOf_Validators: Equatable {
    /// allow_list specifies list of validator addresses to whom grantee can delegate tokens on behalf of granter's
    /// account.
    case allowList(Cosmos_Staking_V1beta1_StakeAuthorization.Validators)
    /// deny_list specifies list of validator addresses to whom grantee can not delegate tokens.
    case denyList(Cosmos_Staking_V1beta1_StakeAuthorization.Validators)

  #if !swift(>=4.1)
    static func ==(lhs: Cosmos_Staking_V1beta1_StakeAuthorization.OneOf_Validators, rhs: Cosmos_Staking_V1beta1_StakeAuthorization.OneOf_Validators) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.allowList, .allowList): return {
        guard case .allowList(let l) = lhs, case .allowList(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      case (.denyList, .denyList): return {
        guard case .denyList(let l) = lhs, case .denyList(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      default: return false
      }
    }
  #endif
  }

  /// Validators defines list of validator addresses.
  struct Validators {
    // SwiftProtobuf.Message conformance is added in an extension below. See the
    // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
    // methods supported on all messages.

    var address: [String] = []

    var unknownFields = SwiftProtobuf.UnknownStorage()

    init() {}
  }

  init() {}

  fileprivate var _maxTokens: Cosmos_Base_V1beta1_Coin? = nil
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.staking.v1beta1"

extension Cosmos_Staking_V1beta1_AuthorizationType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "AUTHORIZATION_TYPE_UNSPECIFIED"),
    1: .same(proto: "AUTHORIZATION_TYPE_DELEGATE"),
    2: .same(proto: "AUTHORIZATION_TYPE_UNDELEGATE"),
    3: .same(proto: "AUTHORIZATION_TYPE_REDELEGATE"),
  ]
}

extension Cosmos_Staking_V1beta1_StakeAuthorization: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".StakeAuthorization"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "max_tokens"),
    2: .standard(proto: "allow_list"),
    3: .standard(proto: "deny_list"),
    4: .standard(proto: "authorization_type"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._maxTokens) }()
      case 2: try {
        var v: Cosmos_Staking_V1beta1_StakeAuthorization.Validators?
        var hadOneofValue = false
        if let current = self.validators {
          hadOneofValue = true
          if case .allowList(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.validators = .allowList(v)
        }
      }()
      case 3: try {
        var v: Cosmos_Staking_V1beta1_StakeAuthorization.Validators?
        var hadOneofValue = false
        if let current = self.validators {
          hadOneofValue = true
          if case .denyList(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.validators = .denyList(v)
        }
      }()
      case 4: try { try decoder.decodeSingularEnumField(value: &self.authorizationType) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._maxTokens {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every case branch when no optimizations are
    // enabled. https://github.com/apple/swift-protobuf/issues/1034
    switch self.validators {
    case .allowList?: try {
      guard case .allowList(let v)? = self.validators else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }()
    case .denyList?: try {
      guard case .denyList(let v)? = self.validators else { preconditionFailure() }
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }()
    case nil: break
    }
    if self.authorizationType != .unspecified {
      try visitor.visitSingularEnumField(value: self.authorizationType, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Staking_V1beta1_StakeAuthorization, rhs: Cosmos_Staking_V1beta1_StakeAuthorization) -> Bool {
    if lhs._maxTokens != rhs._maxTokens {return false}
    if lhs.validators != rhs.validators {return false}
    if lhs.authorizationType != rhs.authorizationType {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Staking_V1beta1_StakeAuthorization.Validators: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = Cosmos_Staking_V1beta1_StakeAuthorization.protoMessageName + ".Validators"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedStringField(value: &self.address) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.address.isEmpty {
      try visitor.visitRepeatedStringField(value: self.address, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Staking_V1beta1_StakeAuthorization.Validators, rhs: Cosmos_Staking_V1beta1_StakeAuthorization.Validators) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}