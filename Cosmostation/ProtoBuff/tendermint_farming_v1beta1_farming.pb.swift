// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tendermint/farming/v1beta1/farming.proto
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

/// PlanType enumerates the valid types of a plan.
enum Cosmos_Farming_V1beta1_PlanType: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// PLAN_TYPE_UNSPECIFIED defines the default plan type.
  case unspecified // = 0

  /// PLAN_TYPE_PUBLIC defines the public plan type.
  case `public` // = 1

  /// PLAN_TYPE_PRIVATE defines the private plan type.
  case `private` // = 2
  case UNRECOGNIZED(Int)

  init() {
    self = .unspecified
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .unspecified
    case 1: self = .public
    case 2: self = .private
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .unspecified: return 0
    case .public: return 1
    case .private: return 2
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Cosmos_Farming_V1beta1_PlanType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Cosmos_Farming_V1beta1_PlanType] = [
    .unspecified,
    .public,
    .private,
  ]
}

#endif  // swift(>=4.2)

/// AddressType enumerates the available types of a address.
enum Cosmos_Farming_V1beta1_AddressType: SwiftProtobuf.Enum {
  typealias RawValue = Int

  /// the 32 bytes length address type of ADR 028.
  case addressType32Bytes // = 0

  /// the default 20 bytes length address type.
  case addressType20Bytes // = 1
  case UNRECOGNIZED(Int)

  init() {
    self = .addressType32Bytes
  }

  init?(rawValue: Int) {
    switch rawValue {
    case 0: self = .addressType32Bytes
    case 1: self = .addressType20Bytes
    default: self = .UNRECOGNIZED(rawValue)
    }
  }

  var rawValue: Int {
    switch self {
    case .addressType32Bytes: return 0
    case .addressType20Bytes: return 1
    case .UNRECOGNIZED(let i): return i
    }
  }

}

#if swift(>=4.2)

extension Cosmos_Farming_V1beta1_AddressType: CaseIterable {
  // The compiler won't synthesize support with the UNRECOGNIZED case.
  static var allCases: [Cosmos_Farming_V1beta1_AddressType] = [
    .addressType32Bytes,
    .addressType20Bytes,
  ]
}

#endif  // swift(>=4.2)

/// Params defines the set of params for the farming module.
struct Cosmos_Farming_V1beta1_Params {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// private_plan_creation_fee specifies the fee for plan creation
  /// this fee prevents from spamming and is collected in the community pool
  var privatePlanCreationFee: [Cosmos_Base_V1beta1_Coin] = []

  /// next_epoch_days is the epoch length in number of days
  /// it updates internal state called CurrentEpochDays that is used to process
  /// staking and reward distribution in end blocker
  var nextEpochDays: UInt32 = 0

  /// farming_fee_collector is the module account address to collect fees within the farming module
  var farmingFeeCollector: String = String()

  /// delayed_staking_gas_fee is used to impose gas fee for the delayed staking
  var delayedStakingGasFee: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// BasePlan defines a base plan type and contains the required fields
/// for basic farming plan functionality. Any custom farming plan type must
/// extend this type for additional functionality (for example, fixed amount plan, ratio
/// plan).
struct Cosmos_Farming_V1beta1_BasePlan {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// id specifies index of the farming plan
  var id: UInt64 = 0

  /// name specifies the name for the plan
  var name: String = String()

  /// type specifies the plan type; type 0 is public and 1 is private
  /// public plan must be created through governance proposal and private plan is
  /// created by account
  var type: Cosmos_Farming_V1beta1_PlanType = .unspecified

  /// farming_pool_address defines the bech32-encoded address of the farming pool
  var farmingPoolAddress: String = String()

  /// termination_address defines the Bech32-encoded address that terminates the plan
  /// when the plan ends after the end time, the balance of the farming pool address
  /// is transferred to the termination address
  var terminationAddress: String = String()

  /// staking_coin_weights specifies the coin weights for the plan
  var stakingCoinWeights: [Cosmos_Base_V1beta1_DecCoin] = []

  /// start_time specifies the start time of the plan
  var startTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _startTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_startTime = newValue}
  }
  /// Returns true if `startTime` has been explicitly set.
  var hasStartTime: Bool {return self._startTime != nil}
  /// Clears the value of `startTime`. Subsequent reads from it will return its default value.
  mutating func clearStartTime() {self._startTime = nil}

  /// end_time specifies the end time of the plan
  var endTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _endTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_endTime = newValue}
  }
  /// Returns true if `endTime` has been explicitly set.
  var hasEndTime: Bool {return self._endTime != nil}
  /// Clears the value of `endTime`. Subsequent reads from it will return its default value.
  mutating func clearEndTime() {self._endTime = nil}

  /// terminated indicates whether the plan has been terminated or not
  var terminated: Bool = false

  /// last_distribution_time specifies the last time a distribution occurred
  var lastDistributionTime: SwiftProtobuf.Google_Protobuf_Timestamp {
    get {return _lastDistributionTime ?? SwiftProtobuf.Google_Protobuf_Timestamp()}
    set {_lastDistributionTime = newValue}
  }
  /// Returns true if `lastDistributionTime` has been explicitly set.
  var hasLastDistributionTime: Bool {return self._lastDistributionTime != nil}
  /// Clears the value of `lastDistributionTime`. Subsequent reads from it will return its default value.
  mutating func clearLastDistributionTime() {self._lastDistributionTime = nil}

  /// distributed_coins specifies the total coins distributed by this plan
  var distributedCoins: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _startTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
  fileprivate var _endTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
  fileprivate var _lastDistributionTime: SwiftProtobuf.Google_Protobuf_Timestamp? = nil
}

/// FixedAmountPlan defines a fixed amount plan that distributes a fixed amount
/// of coins for every epoch.
struct Cosmos_Farming_V1beta1_FixedAmountPlan {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var basePlan: Cosmos_Farming_V1beta1_BasePlan {
    get {return _basePlan ?? Cosmos_Farming_V1beta1_BasePlan()}
    set {_basePlan = newValue}
  }
  /// Returns true if `basePlan` has been explicitly set.
  var hasBasePlan: Bool {return self._basePlan != nil}
  /// Clears the value of `basePlan`. Subsequent reads from it will return its default value.
  mutating func clearBasePlan() {self._basePlan = nil}

  /// epoch_amount specifies the distributing amount for each epoch
  var epochAmount: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _basePlan: Cosmos_Farming_V1beta1_BasePlan? = nil
}

/// RatioPlan defines a plan that distributes to farmers by ratio
/// distribution for every epoch day.
struct Cosmos_Farming_V1beta1_RatioPlan {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var basePlan: Cosmos_Farming_V1beta1_BasePlan {
    get {return _basePlan ?? Cosmos_Farming_V1beta1_BasePlan()}
    set {_basePlan = newValue}
  }
  /// Returns true if `basePlan` has been explicitly set.
  var hasBasePlan: Bool {return self._basePlan != nil}
  /// Clears the value of `basePlan`. Subsequent reads from it will return its default value.
  mutating func clearBasePlan() {self._basePlan = nil}

  /// epoch_ratio specifies the distributing amount by ratio
  var epochRatio: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _basePlan: Cosmos_Farming_V1beta1_BasePlan? = nil
}

/// Staking defines a farmer's staking information.
struct Cosmos_Farming_V1beta1_Staking {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var amount: String = String()

  var startingEpoch: UInt64 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueuedStaking defines staking that is waiting in a queue.
struct Cosmos_Farming_V1beta1_QueuedStaking {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var amount: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// TotalStakings defines the total staking amount for a staking coin denom.
struct Cosmos_Farming_V1beta1_TotalStakings {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var amount: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// HistoricalRewards defines the cumulative unit rewards for a given staking coin denom and an epoch number.
struct Cosmos_Farming_V1beta1_HistoricalRewards {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var cumulativeUnitRewards: [Cosmos_Base_V1beta1_DecCoin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// OutstandingRewards represents outstanding (un-withdrawn) rewards
/// for a staking coin denom.
struct Cosmos_Farming_V1beta1_OutstandingRewards {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var rewards: [Cosmos_Base_V1beta1_DecCoin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "cosmos.farming.v1beta1"

extension Cosmos_Farming_V1beta1_PlanType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "PLAN_TYPE_UNSPECIFIED"),
    1: .same(proto: "PLAN_TYPE_PUBLIC"),
    2: .same(proto: "PLAN_TYPE_PRIVATE"),
  ]
}

extension Cosmos_Farming_V1beta1_AddressType: SwiftProtobuf._ProtoNameProviding {
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    0: .same(proto: "ADDRESS_TYPE_32_BYTES"),
    1: .same(proto: "ADDRESS_TYPE_20_BYTES"),
  ]
}

extension Cosmos_Farming_V1beta1_Params: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Params"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "private_plan_creation_fee"),
    2: .standard(proto: "next_epoch_days"),
    3: .standard(proto: "farming_fee_collector"),
    4: .standard(proto: "delayed_staking_gas_fee"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.privatePlanCreationFee) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.nextEpochDays) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.farmingFeeCollector) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.delayedStakingGasFee) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.privatePlanCreationFee.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.privatePlanCreationFee, fieldNumber: 1)
    }
    if self.nextEpochDays != 0 {
      try visitor.visitSingularUInt32Field(value: self.nextEpochDays, fieldNumber: 2)
    }
    if !self.farmingFeeCollector.isEmpty {
      try visitor.visitSingularStringField(value: self.farmingFeeCollector, fieldNumber: 3)
    }
    if self.delayedStakingGasFee != 0 {
      try visitor.visitSingularUInt64Field(value: self.delayedStakingGasFee, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Farming_V1beta1_Params, rhs: Cosmos_Farming_V1beta1_Params) -> Bool {
    if lhs.privatePlanCreationFee != rhs.privatePlanCreationFee {return false}
    if lhs.nextEpochDays != rhs.nextEpochDays {return false}
    if lhs.farmingFeeCollector != rhs.farmingFeeCollector {return false}
    if lhs.delayedStakingGasFee != rhs.delayedStakingGasFee {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Farming_V1beta1_BasePlan: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".BasePlan"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "name"),
    3: .same(proto: "type"),
    4: .standard(proto: "farming_pool_address"),
    5: .standard(proto: "termination_address"),
    6: .standard(proto: "staking_coin_weights"),
    7: .standard(proto: "start_time"),
    8: .standard(proto: "end_time"),
    9: .same(proto: "terminated"),
    10: .standard(proto: "last_distribution_time"),
    11: .standard(proto: "distributed_coins"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.name) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.type) }()
      case 4: try { try decoder.decodeSingularStringField(value: &self.farmingPoolAddress) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.terminationAddress) }()
      case 6: try { try decoder.decodeRepeatedMessageField(value: &self.stakingCoinWeights) }()
      case 7: try { try decoder.decodeSingularMessageField(value: &self._startTime) }()
      case 8: try { try decoder.decodeSingularMessageField(value: &self._endTime) }()
      case 9: try { try decoder.decodeSingularBoolField(value: &self.terminated) }()
      case 10: try { try decoder.decodeSingularMessageField(value: &self._lastDistributionTime) }()
      case 11: try { try decoder.decodeRepeatedMessageField(value: &self.distributedCoins) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularUInt64Field(value: self.id, fieldNumber: 1)
    }
    if !self.name.isEmpty {
      try visitor.visitSingularStringField(value: self.name, fieldNumber: 2)
    }
    if self.type != .unspecified {
      try visitor.visitSingularEnumField(value: self.type, fieldNumber: 3)
    }
    if !self.farmingPoolAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.farmingPoolAddress, fieldNumber: 4)
    }
    if !self.terminationAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.terminationAddress, fieldNumber: 5)
    }
    if !self.stakingCoinWeights.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.stakingCoinWeights, fieldNumber: 6)
    }
    if let v = self._startTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 7)
    }
    if let v = self._endTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 8)
    }
    if self.terminated != false {
      try visitor.visitSingularBoolField(value: self.terminated, fieldNumber: 9)
    }
    if let v = self._lastDistributionTime {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 10)
    }
    if !self.distributedCoins.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.distributedCoins, fieldNumber: 11)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Farming_V1beta1_BasePlan, rhs: Cosmos_Farming_V1beta1_BasePlan) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.name != rhs.name {return false}
    if lhs.type != rhs.type {return false}
    if lhs.farmingPoolAddress != rhs.farmingPoolAddress {return false}
    if lhs.terminationAddress != rhs.terminationAddress {return false}
    if lhs.stakingCoinWeights != rhs.stakingCoinWeights {return false}
    if lhs._startTime != rhs._startTime {return false}
    if lhs._endTime != rhs._endTime {return false}
    if lhs.terminated != rhs.terminated {return false}
    if lhs._lastDistributionTime != rhs._lastDistributionTime {return false}
    if lhs.distributedCoins != rhs.distributedCoins {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Farming_V1beta1_FixedAmountPlan: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".FixedAmountPlan"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "base_plan"),
    2: .standard(proto: "epoch_amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._basePlan) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.epochAmount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._basePlan {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.epochAmount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.epochAmount, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Farming_V1beta1_FixedAmountPlan, rhs: Cosmos_Farming_V1beta1_FixedAmountPlan) -> Bool {
    if lhs._basePlan != rhs._basePlan {return false}
    if lhs.epochAmount != rhs.epochAmount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Farming_V1beta1_RatioPlan: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".RatioPlan"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "base_plan"),
    2: .standard(proto: "epoch_ratio"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._basePlan) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.epochRatio) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._basePlan {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.epochRatio.isEmpty {
      try visitor.visitSingularStringField(value: self.epochRatio, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Farming_V1beta1_RatioPlan, rhs: Cosmos_Farming_V1beta1_RatioPlan) -> Bool {
    if lhs._basePlan != rhs._basePlan {return false}
    if lhs.epochRatio != rhs.epochRatio {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Farming_V1beta1_Staking: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".Staking"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
    2: .standard(proto: "starting_epoch"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.amount) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.startingEpoch) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.amount.isEmpty {
      try visitor.visitSingularStringField(value: self.amount, fieldNumber: 1)
    }
    if self.startingEpoch != 0 {
      try visitor.visitSingularUInt64Field(value: self.startingEpoch, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Farming_V1beta1_Staking, rhs: Cosmos_Farming_V1beta1_Staking) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.startingEpoch != rhs.startingEpoch {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Farming_V1beta1_QueuedStaking: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueuedStaking"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.amount.isEmpty {
      try visitor.visitSingularStringField(value: self.amount, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Farming_V1beta1_QueuedStaking, rhs: Cosmos_Farming_V1beta1_QueuedStaking) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Farming_V1beta1_TotalStakings: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".TotalStakings"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.amount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.amount.isEmpty {
      try visitor.visitSingularStringField(value: self.amount, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Farming_V1beta1_TotalStakings, rhs: Cosmos_Farming_V1beta1_TotalStakings) -> Bool {
    if lhs.amount != rhs.amount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Farming_V1beta1_HistoricalRewards: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".HistoricalRewards"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "cumulative_unit_rewards"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.cumulativeUnitRewards) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.cumulativeUnitRewards.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.cumulativeUnitRewards, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Farming_V1beta1_HistoricalRewards, rhs: Cosmos_Farming_V1beta1_HistoricalRewards) -> Bool {
    if lhs.cumulativeUnitRewards != rhs.cumulativeUnitRewards {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Cosmos_Farming_V1beta1_OutstandingRewards: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".OutstandingRewards"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "rewards"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.rewards) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.rewards.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.rewards, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Cosmos_Farming_V1beta1_OutstandingRewards, rhs: Cosmos_Farming_V1beta1_OutstandingRewards) -> Bool {
    if lhs.rewards != rhs.rewards {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
