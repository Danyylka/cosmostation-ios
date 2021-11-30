// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: osmosis/pool-incentives/v1beta1/gov.proto
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

/// ReplacePoolIncentivesProposal is a gov Content type for updating the pool
/// incentives. If a ReplacePoolIncentivesProposal passes, the proposal’s records
/// override the existing DistrRecords set in the module. Each record has a
/// specified gauge id and weight, and the incentives are distributed to each
/// gauge according to weight/total_weight. The incentives are put in the fee
/// pool and it is allocated to gauges and community pool by the DistrRecords
/// configuration. Note that gaugeId=0 represents the community pool.
struct Osmosis_Poolincentives_V1beta1_ReplacePoolIncentivesProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var title: String = String()

  var description_p: String = String()

  var records: [Osmosis_Poolincentives_V1beta1_DistrRecord] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// For example: if the existing DistrRecords were:
/// [(Gauge 0, 5), (Gauge 1, 6), (Gauge 2, 6)]
/// An UpdatePoolIncentivesProposal includes
/// [(Gauge 1, 0), (Gauge 2, 4), (Gauge 3, 10)]
/// This would delete Gauge 1, Edit Gauge 2, and Add Gauge 3
/// The result DistrRecords in state would be:
/// [(Gauge 0, 5), (Gauge 2, 4), (Gauge 3, 10)]
struct Osmosis_Poolincentives_V1beta1_UpdatePoolIncentivesProposal {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var title: String = String()

  var description_p: String = String()

  var records: [Osmosis_Poolincentives_V1beta1_DistrRecord] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "osmosis.poolincentives.v1beta1"

extension Osmosis_Poolincentives_V1beta1_ReplacePoolIncentivesProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ReplacePoolIncentivesProposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "description"),
    3: .same(proto: "records"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.records) }()
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
    if !self.records.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.records, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Osmosis_Poolincentives_V1beta1_ReplacePoolIncentivesProposal, rhs: Osmosis_Poolincentives_V1beta1_ReplacePoolIncentivesProposal) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.records != rhs.records {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Osmosis_Poolincentives_V1beta1_UpdatePoolIncentivesProposal: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".UpdatePoolIncentivesProposal"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "title"),
    2: .same(proto: "description"),
    3: .same(proto: "records"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.title) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.description_p) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.records) }()
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
    if !self.records.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.records, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Osmosis_Poolincentives_V1beta1_UpdatePoolIncentivesProposal, rhs: Osmosis_Poolincentives_V1beta1_UpdatePoolIncentivesProposal) -> Bool {
    if lhs.title != rhs.title {return false}
    if lhs.description_p != rhs.description_p {return false}
    if lhs.records != rhs.records {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
