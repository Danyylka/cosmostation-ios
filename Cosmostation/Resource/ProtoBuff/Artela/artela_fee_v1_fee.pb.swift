// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: artela/fee/v1/fee.proto
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

/// Params defines the Fee module parameters
struct Artela_Fee_V1_Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// no_base_fee forces the EIP-1559 base fee to 0 (needed for 0 price calls)
  var noBaseFee: Bool = false

  /// base_fee_change_denominator bounds the amount the base fee can change
  /// between blocks.
  var baseFeeChangeDenominator: UInt32 = 0

  /// elasticity_multiplier bounds the maximum gas limit an EIP-1559 block may
  /// have.
  var elasticityMultiplier: UInt32 = 0

  /// enable_height defines at which block height the base fee calculation is enabled.
  var enableHeight: Int64 = 0

  /// base_fee for EIP-1559 blocks.
  var baseFee: String = String()

  /// min_gas_price defines the minimum gas price value for cosmos and eth transactions
  var minGasPrice: String = String()

  /// min_gas_multiplier bounds the minimum gas used to be charged
  /// to senders based on gas limit
  var minGasMultiplier: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Artela_Fee_V1_Params: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "artela.fee.v1"

extension Artela_Fee_V1_Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Params"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "no_base_fee"),
    2: .standard(proto: "base_fee_change_denominator"),
    3: .standard(proto: "elasticity_multiplier"),
    5: .standard(proto: "enable_height"),
    6: .standard(proto: "base_fee"),
    7: .standard(proto: "min_gas_price"),
    8: .standard(proto: "min_gas_multiplier"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularBoolField(value: &self.noBaseFee) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.baseFeeChangeDenominator) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.elasticityMultiplier) }()
      case 5: try { try decoder.decodeSingularInt64Field(value: &self.enableHeight) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.baseFee) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.minGasPrice) }()
      case 8: try { try decoder.decodeSingularStringField(value: &self.minGasMultiplier) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.noBaseFee != false {
      try visitor.visitSingularBoolField(value: self.noBaseFee, fieldNumber: 1)
    }
    if self.baseFeeChangeDenominator != 0 {
      try visitor.visitSingularUInt32Field(value: self.baseFeeChangeDenominator, fieldNumber: 2)
    }
    if self.elasticityMultiplier != 0 {
      try visitor.visitSingularUInt32Field(value: self.elasticityMultiplier, fieldNumber: 3)
    }
    if self.enableHeight != 0 {
      try visitor.visitSingularInt64Field(value: self.enableHeight, fieldNumber: 5)
    }
    if !self.baseFee.isEmpty {
      try visitor.visitSingularStringField(value: self.baseFee, fieldNumber: 6)
    }
    if !self.minGasPrice.isEmpty {
      try visitor.visitSingularStringField(value: self.minGasPrice, fieldNumber: 7)
    }
    if !self.minGasMultiplier.isEmpty {
      try visitor.visitSingularStringField(value: self.minGasMultiplier, fieldNumber: 8)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Artela_Fee_V1_Params, rhs: Artela_Fee_V1_Params) -> Bool {
    if lhs.noBaseFee != rhs.noBaseFee {return false}
    if lhs.baseFeeChangeDenominator != rhs.baseFeeChangeDenominator {return false}
    if lhs.elasticityMultiplier != rhs.elasticityMultiplier {return false}
    if lhs.enableHeight != rhs.enableHeight {return false}
    if lhs.baseFee != rhs.baseFee {return false}
    if lhs.minGasPrice != rhs.minGasPrice {return false}
    if lhs.minGasMultiplier != rhs.minGasMultiplier {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
