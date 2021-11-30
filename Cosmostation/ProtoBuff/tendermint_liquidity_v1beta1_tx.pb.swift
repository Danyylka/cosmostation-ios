// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: tendermint/liquidity/v1beta1/tx.proto
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

/// MsgCreatePool defines an sdk.Msg type that supports submitting a create liquidity pool tx.
///
/// See: https://github.com/gravity-devs/liquidity/blob/develop/x/liquidity/spec/04_messages.md
struct Tendermint_Liquidity_V1beta1_MsgCreatePool {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var poolCreatorAddress: String = String()

  /// id of the target pool type, must match the value in the pool. Only pool-type-id 1 is supported.
  var poolTypeID: UInt32 = 0

  /// reserve coin pair of the pool to deposit.
  var depositCoins: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCreatePoolResponse defines the Msg/CreatePool response type.
struct Tendermint_Liquidity_V1beta1_MsgCreatePoolResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// `MsgDepositWithinBatch defines` an `sdk.Msg` type that supports submitting 
/// a deposit request to the batch of the liquidity pool.
/// Deposit is submitted to the batch of the Liquidity pool with the specified 
/// `pool_id`, `deposit_coins` for reserve.
/// This request is stacked in the batch of the liquidity pool, is not processed 
/// immediately, and is processed in the `endblock` at the same time as other requests.
///
/// See: https://github.com/gravity-devs/liquidity/blob/develop/x/liquidity/spec/04_messages.md
struct Tendermint_Liquidity_V1beta1_MsgDepositWithinBatch {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var depositorAddress: String = String()

  /// id of the target pool
  var poolID: UInt64 = 0

  /// reserve coin pair of the pool to deposit
  var depositCoins: [Cosmos_Base_V1beta1_Coin] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgDepositWithinBatchResponse defines the Msg/DepositWithinBatch response type.
struct Tendermint_Liquidity_V1beta1_MsgDepositWithinBatchResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// `MsgWithdrawWithinBatch` defines an `sdk.Msg` type that supports submitting 
/// a withdraw request to the batch of the liquidity pool.
/// Withdraw is submitted to the batch from the Liquidity pool with the 
/// specified `pool_id`, `pool_coin` of the pool.
/// This request is stacked in the batch of the liquidity pool, is not processed 
/// immediately, and is processed in the `endblock` at the same time as other requests.
///
/// See: https://github.com/gravity-devs/liquidity/blob/develop/x/liquidity/spec/04_messages.md
struct Tendermint_Liquidity_V1beta1_MsgWithdrawWithinBatch {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var withdrawerAddress: String = String()

  /// id of the target pool
  var poolID: UInt64 = 0

  var poolCoin: Cosmos_Base_V1beta1_Coin {
    get {return _poolCoin ?? Cosmos_Base_V1beta1_Coin()}
    set {_poolCoin = newValue}
  }
  /// Returns true if `poolCoin` has been explicitly set.
  var hasPoolCoin: Bool {return self._poolCoin != nil}
  /// Clears the value of `poolCoin`. Subsequent reads from it will return its default value.
  mutating func clearPoolCoin() {self._poolCoin = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _poolCoin: Cosmos_Base_V1beta1_Coin? = nil
}

/// MsgWithdrawWithinBatchResponse defines the Msg/WithdrawWithinBatch response type.
struct Tendermint_Liquidity_V1beta1_MsgWithdrawWithinBatchResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// `MsgSwapWithinBatch` defines an sdk.Msg type that supports submitting a swap offer request to the batch of the liquidity pool.
/// Submit swap offer to the liquidity pool batch with the specified the `pool_id`, `swap_type_id`,
/// `demand_coin_denom` with the coin and the price you're offering
/// and `offer_coin_fee` must be half of offer coin amount * current `params.swap_fee_rate` for reservation to pay fees.
/// This request is stacked in the batch of the liquidity pool, is not processed 
/// immediately, and is processed in the `endblock` at the same time as other requests.
/// You must request the same fields as the pool.
/// Only the default `swap_type_id` 1 is supported.
///
/// See: https://github.com/gravity-devs/liquidity/tree/develop/doc
/// https://github.com/gravity-devs/liquidity/blob/develop/x/liquidity/spec/04_messages.md
struct Tendermint_Liquidity_V1beta1_MsgSwapWithinBatch {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// address of swap requester
  var swapRequesterAddress: String = String()

  /// id of swap type, must match the value in the pool. Only `swap_type_id` 1 is supported.
  var poolID: UInt64 = 0

  /// id of swap type. Must match the value in the pool.
  var swapTypeID: UInt32 = 0

  /// offer sdk.coin for the swap request, must match the denom in the pool.
  var offerCoin: Cosmos_Base_V1beta1_Coin {
    get {return _offerCoin ?? Cosmos_Base_V1beta1_Coin()}
    set {_offerCoin = newValue}
  }
  /// Returns true if `offerCoin` has been explicitly set.
  var hasOfferCoin: Bool {return self._offerCoin != nil}
  /// Clears the value of `offerCoin`. Subsequent reads from it will return its default value.
  mutating func clearOfferCoin() {self._offerCoin = nil}

  /// denom of demand coin to be exchanged on the swap request, must match the denom in the pool.
  var demandCoinDenom: String = String()

  /// half of offer coin amount * params.swap_fee_rate for reservation to pay fees.
  var offerCoinFee: Cosmos_Base_V1beta1_Coin {
    get {return _offerCoinFee ?? Cosmos_Base_V1beta1_Coin()}
    set {_offerCoinFee = newValue}
  }
  /// Returns true if `offerCoinFee` has been explicitly set.
  var hasOfferCoinFee: Bool {return self._offerCoinFee != nil}
  /// Clears the value of `offerCoinFee`. Subsequent reads from it will return its default value.
  mutating func clearOfferCoinFee() {self._offerCoinFee = nil}

  /// limit order price for the order, the price is the exchange ratio of X/Y
  /// where X is the amount of the first coin and Y is the amount 
  /// of the second coin when their denoms are sorted alphabetically. 
  var orderPrice: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _offerCoin: Cosmos_Base_V1beta1_Coin? = nil
  fileprivate var _offerCoinFee: Cosmos_Base_V1beta1_Coin? = nil
}

/// MsgSwapWithinBatchResponse defines the Msg/Swap response type.
struct Tendermint_Liquidity_V1beta1_MsgSwapWithinBatchResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "tendermint.liquidity.v1beta1"

extension Tendermint_Liquidity_V1beta1_MsgCreatePool: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreatePool"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "pool_creator_address"),
    2: .standard(proto: "pool_type_id"),
    4: .standard(proto: "deposit_coins"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.poolCreatorAddress) }()
      case 2: try { try decoder.decodeSingularUInt32Field(value: &self.poolTypeID) }()
      case 4: try { try decoder.decodeRepeatedMessageField(value: &self.depositCoins) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.poolCreatorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.poolCreatorAddress, fieldNumber: 1)
    }
    if self.poolTypeID != 0 {
      try visitor.visitSingularUInt32Field(value: self.poolTypeID, fieldNumber: 2)
    }
    if !self.depositCoins.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.depositCoins, fieldNumber: 4)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Liquidity_V1beta1_MsgCreatePool, rhs: Tendermint_Liquidity_V1beta1_MsgCreatePool) -> Bool {
    if lhs.poolCreatorAddress != rhs.poolCreatorAddress {return false}
    if lhs.poolTypeID != rhs.poolTypeID {return false}
    if lhs.depositCoins != rhs.depositCoins {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Liquidity_V1beta1_MsgCreatePoolResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCreatePoolResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Liquidity_V1beta1_MsgCreatePoolResponse, rhs: Tendermint_Liquidity_V1beta1_MsgCreatePoolResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Liquidity_V1beta1_MsgDepositWithinBatch: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgDepositWithinBatch"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "depositor_address"),
    2: .standard(proto: "pool_id"),
    3: .standard(proto: "deposit_coins"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.depositorAddress) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.poolID) }()
      case 3: try { try decoder.decodeRepeatedMessageField(value: &self.depositCoins) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.depositorAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.depositorAddress, fieldNumber: 1)
    }
    if self.poolID != 0 {
      try visitor.visitSingularUInt64Field(value: self.poolID, fieldNumber: 2)
    }
    if !self.depositCoins.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.depositCoins, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Liquidity_V1beta1_MsgDepositWithinBatch, rhs: Tendermint_Liquidity_V1beta1_MsgDepositWithinBatch) -> Bool {
    if lhs.depositorAddress != rhs.depositorAddress {return false}
    if lhs.poolID != rhs.poolID {return false}
    if lhs.depositCoins != rhs.depositCoins {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Liquidity_V1beta1_MsgDepositWithinBatchResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgDepositWithinBatchResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Liquidity_V1beta1_MsgDepositWithinBatchResponse, rhs: Tendermint_Liquidity_V1beta1_MsgDepositWithinBatchResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Liquidity_V1beta1_MsgWithdrawWithinBatch: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawWithinBatch"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "withdrawer_address"),
    2: .standard(proto: "pool_id"),
    3: .standard(proto: "pool_coin"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.withdrawerAddress) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.poolID) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._poolCoin) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.withdrawerAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.withdrawerAddress, fieldNumber: 1)
    }
    if self.poolID != 0 {
      try visitor.visitSingularUInt64Field(value: self.poolID, fieldNumber: 2)
    }
    if let v = self._poolCoin {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Liquidity_V1beta1_MsgWithdrawWithinBatch, rhs: Tendermint_Liquidity_V1beta1_MsgWithdrawWithinBatch) -> Bool {
    if lhs.withdrawerAddress != rhs.withdrawerAddress {return false}
    if lhs.poolID != rhs.poolID {return false}
    if lhs._poolCoin != rhs._poolCoin {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Liquidity_V1beta1_MsgWithdrawWithinBatchResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawWithinBatchResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Liquidity_V1beta1_MsgWithdrawWithinBatchResponse, rhs: Tendermint_Liquidity_V1beta1_MsgWithdrawWithinBatchResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Liquidity_V1beta1_MsgSwapWithinBatch: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSwapWithinBatch"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "swap_requester_address"),
    2: .standard(proto: "pool_id"),
    3: .standard(proto: "swap_type_id"),
    4: .standard(proto: "offer_coin"),
    5: .standard(proto: "demand_coin_denom"),
    6: .standard(proto: "offer_coin_fee"),
    7: .standard(proto: "order_price"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.swapRequesterAddress) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.poolID) }()
      case 3: try { try decoder.decodeSingularUInt32Field(value: &self.swapTypeID) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._offerCoin) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.demandCoinDenom) }()
      case 6: try { try decoder.decodeSingularMessageField(value: &self._offerCoinFee) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.orderPrice) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.swapRequesterAddress.isEmpty {
      try visitor.visitSingularStringField(value: self.swapRequesterAddress, fieldNumber: 1)
    }
    if self.poolID != 0 {
      try visitor.visitSingularUInt64Field(value: self.poolID, fieldNumber: 2)
    }
    if self.swapTypeID != 0 {
      try visitor.visitSingularUInt32Field(value: self.swapTypeID, fieldNumber: 3)
    }
    if let v = self._offerCoin {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    if !self.demandCoinDenom.isEmpty {
      try visitor.visitSingularStringField(value: self.demandCoinDenom, fieldNumber: 5)
    }
    if let v = self._offerCoinFee {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 6)
    }
    if !self.orderPrice.isEmpty {
      try visitor.visitSingularStringField(value: self.orderPrice, fieldNumber: 7)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Liquidity_V1beta1_MsgSwapWithinBatch, rhs: Tendermint_Liquidity_V1beta1_MsgSwapWithinBatch) -> Bool {
    if lhs.swapRequesterAddress != rhs.swapRequesterAddress {return false}
    if lhs.poolID != rhs.poolID {return false}
    if lhs.swapTypeID != rhs.swapTypeID {return false}
    if lhs._offerCoin != rhs._offerCoin {return false}
    if lhs.demandCoinDenom != rhs.demandCoinDenom {return false}
    if lhs._offerCoinFee != rhs._offerCoinFee {return false}
    if lhs.orderPrice != rhs.orderPrice {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Tendermint_Liquidity_V1beta1_MsgSwapWithinBatchResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgSwapWithinBatchResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Tendermint_Liquidity_V1beta1_MsgSwapWithinBatchResponse, rhs: Tendermint_Liquidity_V1beta1_MsgSwapWithinBatchResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
