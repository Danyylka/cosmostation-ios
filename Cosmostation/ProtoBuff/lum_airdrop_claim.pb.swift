// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: lum/airdrop/claim.proto
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

enum Lum_Network_Airdrop_Action: SwiftProtobuf.Enum {
  typealias RawValue = Int
  case vote // = 0
  case delegateStake // = 1
  case UNRECOGNIZED(Int)

  init() {
    self = .vote
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .vote
    case 1: self = .delegateStake
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .vote: return 0
    case .delegateStake: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Lum_Network_Airdrop_Action: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Lum_Network_Airdrop_Action] = [
    .vote,
    .delegateStake,
  ]
}

#endif  // swift(>=4.2)

struct Lum_Network_Airdrop_ClaimRecord {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var address: String = String()

  var initialClaimableAmount: [Cosmos_Base_V1beta1_Coin] = []

  var actionCompleted: [Bool] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "lum.network.airdrop"

extension Lum_Network_Airdrop_Action: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ActionVote"),
    1: .same(proto: "ActionDelegateStake"),
  ]
}

extension Lum_Network_Airdrop_ClaimRecord: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ClaimRecord"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "address"),
    2: .standard(proto: "initial_claimable_amount"),
    3: .standard(proto: "action_completed"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.address) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.initialClaimableAmount) }()
      case 3: try { try decoder.decodeRepeatedBoolField(value: &self.actionCompleted) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.address.isEmpty {
      try visitor.visitSingularStringField(value: self.address, fieldNumber: 1)
    }
    if !self.initialClaimableAmount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.initialClaimableAmount, fieldNumber: 2)
    }
    if !self.actionCompleted.isEmpty {
      try visitor.visitPackedBoolField(value: self.actionCompleted, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Lum_Network_Airdrop_ClaimRecord, rhs: Lum_Network_Airdrop_ClaimRecord) -> Bool {
    if lhs.address != rhs.address {return false}
    if lhs.initialClaimableAmount != rhs.initialClaimableAmount {return false}
    if lhs.actionCompleted != rhs.actionCompleted {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
