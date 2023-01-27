// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: stride/stakeibc/ica_account.proto
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

enum Stride_Stakeibc_ICAAccountType: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case delegation // = 0
  case fee // = 1
  case withdrawal // = 2
  case redemption // = 3
  case UNRECOGNIZED(Int)

  init() {
    self = .delegation
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .delegation
    case 1: self = .fee
    case 2: self = .withdrawal
    case 3: self = .redemption
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .delegation: return 0
    case .fee: return 1
    case .withdrawal: return 2
    case .redemption: return 3
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Stride_Stakeibc_ICAAccountType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Stride_Stakeibc_ICAAccountType] = [
    .delegation,
    .fee,
    .withdrawal,
    .redemption,
  ]
}

#endif  // swift(>=4.2)

struct Stride_Stakeibc_ICAAccount {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var address: String = String()

  var target: Stride_Stakeibc_ICAAccountType = .delegation

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "stride.stakeibc"

extension Stride_Stakeibc_ICAAccountType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "DELEGATION"),
    1: .same(proto: "FEE"),
    2: .same(proto: "WITHDRAWAL"),
    3: .same(proto: "REDEMPTION"),
  ]
}

extension Stride_Stakeibc_ICAAccount: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ICAAccount"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
    3: .same(proto: "target"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.address) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.target) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 1)
    }
    if self.target != .delegation {
      try visitor.visitSingularEnumField(value: self.target, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Stride_Stakeibc_ICAAccount, rhs: Stride_Stakeibc_ICAAccount) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.target != rhs.target {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
