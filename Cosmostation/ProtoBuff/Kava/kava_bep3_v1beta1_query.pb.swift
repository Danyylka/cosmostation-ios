// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: kava/bep3/v1beta1/query.proto
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

/// QueryParamsRequest defines the request type for querying x/bep3 parameters.
struct Kava_Bep3_V1beta1_QueryParamsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryParamsResponse defines the response type for querying x/bep3 parameters.
struct Kava_Bep3_V1beta1_QueryParamsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// params represents the parameters of the module
  var params: Kava_Bep3_V1beta1_Params {
    get {return _params ?? Kava_Bep3_V1beta1_Params()}
    set {_params = newValue}
  }
  /// Returns true if `params` has been explicitly set.
  var hasParams: Bool {return self._params != nil}
  /// Clears the value of `params`. Subsequent reads from it will return its default value.
  mutating func clearParams() {self._params = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _params: Kava_Bep3_V1beta1_Params? = nil
}

/// QueryAssetSupplyRequest is the request type for the Query/AssetSupply RPC method.
struct Kava_Bep3_V1beta1_QueryAssetSupplyRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// denom filters the asset response for the specified denom
  var denom: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// AssetSupplyResponse defines information about an asset's supply.
struct Kava_Bep3_V1beta1_AssetSupplyResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// incoming_supply represents the incoming supply of an asset
  var incomingSupply: Cosmos_Base_V1beta1_Coin {
    get {return _incomingSupply ?? Cosmos_Base_V1beta1_Coin()}
    set {_incomingSupply = newValue}
  }
  /// Returns true if `incomingSupply` has been explicitly set.
  var hasIncomingSupply: Bool {return self._incomingSupply != nil}
  /// Clears the value of `incomingSupply`. Subsequent reads from it will return its default value.
  mutating func clearIncomingSupply() {self._incomingSupply = nil}

  /// outgoing_supply represents the outgoing supply of an asset
  var outgoingSupply: Cosmos_Base_V1beta1_Coin {
    get {return _outgoingSupply ?? Cosmos_Base_V1beta1_Coin()}
    set {_outgoingSupply = newValue}
  }
  /// Returns true if `outgoingSupply` has been explicitly set.
  var hasOutgoingSupply: Bool {return self._outgoingSupply != nil}
  /// Clears the value of `outgoingSupply`. Subsequent reads from it will return its default value.
  mutating func clearOutgoingSupply() {self._outgoingSupply = nil}

  /// current_supply represents the current on-chain supply of an asset
  var currentSupply: Cosmos_Base_V1beta1_Coin {
    get {return _currentSupply ?? Cosmos_Base_V1beta1_Coin()}
    set {_currentSupply = newValue}
  }
  /// Returns true if `currentSupply` has been explicitly set.
  var hasCurrentSupply: Bool {return self._currentSupply != nil}
  /// Clears the value of `currentSupply`. Subsequent reads from it will return its default value.
  mutating func clearCurrentSupply() {self._currentSupply = nil}

  /// time_limited_current_supply represents the time limited current supply of an asset
  var timeLimitedCurrentSupply: Cosmos_Base_V1beta1_Coin {
    get {return _timeLimitedCurrentSupply ?? Cosmos_Base_V1beta1_Coin()}
    set {_timeLimitedCurrentSupply = newValue}
  }
  /// Returns true if `timeLimitedCurrentSupply` has been explicitly set.
  var hasTimeLimitedCurrentSupply: Bool {return self._timeLimitedCurrentSupply != nil}
  /// Clears the value of `timeLimitedCurrentSupply`. Subsequent reads from it will return its default value.
  mutating func clearTimeLimitedCurrentSupply() {self._timeLimitedCurrentSupply = nil}

  /// time_elapsed represents the time elapsed
  var timeElapsed: SwiftProtobuf.Google_Protobuf_Duration {
    get {return _timeElapsed ?? SwiftProtobuf.Google_Protobuf_Duration()}
    set {_timeElapsed = newValue}
  }
  /// Returns true if `timeElapsed` has been explicitly set.
  var hasTimeElapsed: Bool {return self._timeElapsed != nil}
  /// Clears the value of `timeElapsed`. Subsequent reads from it will return its default value.
  mutating func clearTimeElapsed() {self._timeElapsed = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _incomingSupply: Cosmos_Base_V1beta1_Coin? = nil
  fileprivate var _outgoingSupply: Cosmos_Base_V1beta1_Coin? = nil
  fileprivate var _currentSupply: Cosmos_Base_V1beta1_Coin? = nil
  fileprivate var _timeLimitedCurrentSupply: Cosmos_Base_V1beta1_Coin? = nil
  fileprivate var _timeElapsed: SwiftProtobuf.Google_Protobuf_Duration? = nil
}

/// QueryAssetSupplyResponse is the response type for the Query/AssetSupply RPC method.
struct Kava_Bep3_V1beta1_QueryAssetSupplyResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// asset_supply represents the supply of the asset
  var assetSupply: Kava_Bep3_V1beta1_AssetSupplyResponse {
    get {return _assetSupply ?? Kava_Bep3_V1beta1_AssetSupplyResponse()}
    set {_assetSupply = newValue}
  }
  /// Returns true if `assetSupply` has been explicitly set.
  var hasAssetSupply: Bool {return self._assetSupply != nil}
  /// Clears the value of `assetSupply`. Subsequent reads from it will return its default value.
  mutating func clearAssetSupply() {self._assetSupply = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _assetSupply: Kava_Bep3_V1beta1_AssetSupplyResponse? = nil
}

/// QueryAssetSuppliesRequest is the request type for the Query/AssetSupplies RPC method.
struct Kava_Bep3_V1beta1_QueryAssetSuppliesRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryAssetSuppliesResponse is the response type for the Query/AssetSupplies RPC method.
struct Kava_Bep3_V1beta1_QueryAssetSuppliesResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// asset_supplies represents the supplies of returned assets
  var assetSupplies: [Kava_Bep3_V1beta1_AssetSupplyResponse] = []

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryAtomicSwapRequest is the request type for the Query/AtomicSwap RPC method.
struct Kava_Bep3_V1beta1_QueryAtomicSwapRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// swap_id represents the id of the swap to query
  var swapID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryAtomicSwapResponse is the response type for the Query/AtomicSwap RPC method.
struct Kava_Bep3_V1beta1_QueryAtomicSwapResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var atomicSwap: Kava_Bep3_V1beta1_AtomicSwapResponse {
    get {return _atomicSwap ?? Kava_Bep3_V1beta1_AtomicSwapResponse()}
    set {_atomicSwap = newValue}
  }
  /// Returns true if `atomicSwap` has been explicitly set.
  var hasAtomicSwap: Bool {return self._atomicSwap != nil}
  /// Clears the value of `atomicSwap`. Subsequent reads from it will return its default value.
  mutating func clearAtomicSwap() {self._atomicSwap = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _atomicSwap: Kava_Bep3_V1beta1_AtomicSwapResponse? = nil
}

/// AtomicSwapResponse represents the returned atomic swap properties
struct Kava_Bep3_V1beta1_AtomicSwapResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// id represents the id of the atomic swap
  var id: String = String()

  /// amount represents the amount being swapped
  var amount: [Cosmos_Base_V1beta1_Coin] = []

  /// random_number_hash represents the hash of the random number
  var randomNumberHash: String = String()

  /// expire_height represents the height when the swap expires
  var expireHeight: UInt64 = 0

  /// timestamp represents the timestamp of the swap
  var timestamp: Int64 = 0

  /// sender is the kava chain sender of the swap
  var sender: String = String()

  /// recipient is the kava chain recipient of the swap
  var recipient: String = String()

  /// sender_other_chain is the sender on the other chain
  var senderOtherChain: String = String()

  /// recipient_other_chain is the recipient on the other chain
  var recipientOtherChain: String = String()

  /// closed_block is the block when the swap is closed
  var closedBlock: Int64 = 0

  /// status represents the current status of the swap
  var status: Kava_Bep3_V1beta1_SwapStatus = .unspecified

  /// cross_chain identifies whether the atomic swap is cross chain
  var crossChain: Bool = false

  /// direction identifies if the swap is incoming or outgoing
  var direction: Kava_Bep3_V1beta1_SwapDirection = .unspecified

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// QueryAtomicSwapsRequest is the request type for the Query/AtomicSwaps RPC method.
struct Kava_Bep3_V1beta1_QueryAtomicSwapsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// involve filters by address
  var involve: String = String()

  /// expiration filters by expiration block height
  var expiration: UInt64 = 0

  /// status filters by swap status
  var status: Kava_Bep3_V1beta1_SwapStatus = .unspecified

  /// direction fitlers by swap direction
  var direction: Kava_Bep3_V1beta1_SwapDirection = .unspecified

  var pagination: Cosmos_Base_Query_V1beta1_PageRequest {
    get {return _pagination ?? Cosmos_Base_Query_V1beta1_PageRequest()}
    set {_pagination = newValue}
  }
  /// Returns true if `pagination` has been explicitly set.
  var hasPagination: Bool {return self._pagination != nil}
  /// Clears the value of `pagination`. Subsequent reads from it will return its default value.
  mutating func clearPagination() {self._pagination = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _pagination: Cosmos_Base_Query_V1beta1_PageRequest? = nil
}

/// QueryAtomicSwapsResponse is the response type for the Query/AtomicSwaps RPC method.
struct Kava_Bep3_V1beta1_QueryAtomicSwapsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// atomic_swap represents the returned atomic swaps for the request
  var atomicSwaps: [Kava_Bep3_V1beta1_AtomicSwapResponse] = []

  var pagination: Cosmos_Base_Query_V1beta1_PageResponse {
    get {return _pagination ?? Cosmos_Base_Query_V1beta1_PageResponse()}
    set {_pagination = newValue}
  }
  /// Returns true if `pagination` has been explicitly set.
  var hasPagination: Bool {return self._pagination != nil}
  /// Clears the value of `pagination`. Subsequent reads from it will return its default value.
  mutating func clearPagination() {self._pagination = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _pagination: Cosmos_Base_Query_V1beta1_PageResponse? = nil
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Kava_Bep3_V1beta1_QueryParamsRequest: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_QueryParamsResponse: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_QueryAssetSupplyRequest: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_AssetSupplyResponse: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_QueryAssetSupplyResponse: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_QueryAssetSuppliesRequest: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_QueryAssetSuppliesResponse: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_QueryAtomicSwapRequest: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_QueryAtomicSwapResponse: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_AtomicSwapResponse: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_QueryAtomicSwapsRequest: @unchecked Sendable {}
extension Kava_Bep3_V1beta1_QueryAtomicSwapsResponse: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "kava.bep3.v1beta1"

extension Kava_Bep3_V1beta1_QueryParamsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryParamsRequest"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_QueryParamsRequest, rhs: Kava_Bep3_V1beta1_QueryParamsRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_QueryParamsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryParamsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "params"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._params) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._params {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_QueryParamsResponse, rhs: Kava_Bep3_V1beta1_QueryParamsResponse) -> Bool {
    if lhs._params != rhs._params {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_QueryAssetSupplyRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryAssetSupplyRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "denom"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.denom) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.denom.isEmpty {
      try visitor.visitSingularStringField(value: self.denom, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_QueryAssetSupplyRequest, rhs: Kava_Bep3_V1beta1_QueryAssetSupplyRequest) -> Bool {
    if lhs.denom != rhs.denom {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_AssetSupplyResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AssetSupplyResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "incoming_supply"),
    2: .standard(proto: "outgoing_supply"),
    3: .standard(proto: "current_supply"),
    4: .standard(proto: "time_limited_current_supply"),
    5: .standard(proto: "time_elapsed"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._incomingSupply) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._outgoingSupply) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._currentSupply) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._timeLimitedCurrentSupply) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._timeElapsed) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._incomingSupply {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try { if let v = self._outgoingSupply {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try { if let v = self._currentSupply {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try { if let v = self._timeLimitedCurrentSupply {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    } }()
    try { if let v = self._timeElapsed {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_AssetSupplyResponse, rhs: Kava_Bep3_V1beta1_AssetSupplyResponse) -> Bool {
    if lhs._incomingSupply != rhs._incomingSupply {return false}
    if lhs._outgoingSupply != rhs._outgoingSupply {return false}
    if lhs._currentSupply != rhs._currentSupply {return false}
    if lhs._timeLimitedCurrentSupply != rhs._timeLimitedCurrentSupply {return false}
    if lhs._timeElapsed != rhs._timeElapsed {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_QueryAssetSupplyResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryAssetSupplyResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "asset_supply"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._assetSupply) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._assetSupply {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_QueryAssetSupplyResponse, rhs: Kava_Bep3_V1beta1_QueryAssetSupplyResponse) -> Bool {
    if lhs._assetSupply != rhs._assetSupply {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_QueryAssetSuppliesRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryAssetSuppliesRequest"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_QueryAssetSuppliesRequest, rhs: Kava_Bep3_V1beta1_QueryAssetSuppliesRequest) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_QueryAssetSuppliesResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryAssetSuppliesResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "asset_supplies"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.assetSupplies) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.assetSupplies.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.assetSupplies, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_QueryAssetSuppliesResponse, rhs: Kava_Bep3_V1beta1_QueryAssetSuppliesResponse) -> Bool {
    if lhs.assetSupplies != rhs.assetSupplies {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_QueryAtomicSwapRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryAtomicSwapRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "swap_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.swapID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.swapID.isEmpty {
      try visitor.visitSingularStringField(value: self.swapID, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_QueryAtomicSwapRequest, rhs: Kava_Bep3_V1beta1_QueryAtomicSwapRequest) -> Bool {
    if lhs.swapID != rhs.swapID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_QueryAtomicSwapResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryAtomicSwapResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    2: .standard(proto: "atomic_swap"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 2: try { try decoder.decodeSingularMessageField(value: &self._atomicSwap) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    try { if let v = self._atomicSwap {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_QueryAtomicSwapResponse, rhs: Kava_Bep3_V1beta1_QueryAtomicSwapResponse) -> Bool {
    if lhs._atomicSwap != rhs._atomicSwap {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_AtomicSwapResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".AtomicSwapResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "amount"),
    3: .standard(proto: "random_number_hash"),
    4: .standard(proto: "expire_height"),
    5: .same(proto: "timestamp"),
    6: .same(proto: "sender"),
    7: .same(proto: "recipient"),
    8: .standard(proto: "sender_other_chain"),
    9: .standard(proto: "recipient_other_chain"),
    10: .standard(proto: "closed_block"),
    11: .same(proto: "status"),
    12: .standard(proto: "cross_chain"),
    13: .same(proto: "direction"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.id) }()
      case 2: try { try decoder.decodeRepeatedMessageField(value: &self.amount) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.randomNumberHash) }()
      case 4: try { try decoder.decodeSingularUInt64Field(value: &self.expireHeight) }()
      case 5: try { try decoder.decodeSingularInt64Field(value: &self.timestamp) }()
      case 6: try { try decoder.decodeSingularStringField(value: &self.sender) }()
      case 7: try { try decoder.decodeSingularStringField(value: &self.recipient) }()
      case 8: try { try decoder.decodeSingularStringField(value: &self.senderOtherChain) }()
      case 9: try { try decoder.decodeSingularStringField(value: &self.recipientOtherChain) }()
      case 10: try { try decoder.decodeSingularInt64Field(value: &self.closedBlock) }()
      case 11: try { try decoder.decodeSingularEnumField(value: &self.status) }()
      case 12: try { try decoder.decodeSingularBoolField(value: &self.crossChain) }()
      case 13: try { try decoder.decodeSingularEnumField(value: &self.direction) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.id.isEmpty {
      try visitor.visitSingularStringField(value: self.id, fieldNumber: 1)
    }
    if !self.amount.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.amount, fieldNumber: 2)
    }
    if !self.randomNumberHash.isEmpty {
      try visitor.visitSingularStringField(value: self.randomNumberHash, fieldNumber: 3)
    }
    if self.expireHeight != 0 {
      try visitor.visitSingularUInt64Field(value: self.expireHeight, fieldNumber: 4)
    }
    if self.timestamp != 0 {
      try visitor.visitSingularInt64Field(value: self.timestamp, fieldNumber: 5)
    }
    if !self.sender.isEmpty {
      try visitor.visitSingularStringField(value: self.sender, fieldNumber: 6)
    }
    if !self.recipient.isEmpty {
      try visitor.visitSingularStringField(value: self.recipient, fieldNumber: 7)
    }
    if !self.senderOtherChain.isEmpty {
      try visitor.visitSingularStringField(value: self.senderOtherChain, fieldNumber: 8)
    }
    if !self.recipientOtherChain.isEmpty {
      try visitor.visitSingularStringField(value: self.recipientOtherChain, fieldNumber: 9)
    }
    if self.closedBlock != 0 {
      try visitor.visitSingularInt64Field(value: self.closedBlock, fieldNumber: 10)
    }
    if self.status != .unspecified {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 11)
    }
    if self.crossChain != false {
      try visitor.visitSingularBoolField(value: self.crossChain, fieldNumber: 12)
    }
    if self.direction != .unspecified {
      try visitor.visitSingularEnumField(value: self.direction, fieldNumber: 13)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_AtomicSwapResponse, rhs: Kava_Bep3_V1beta1_AtomicSwapResponse) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.amount != rhs.amount {return false}
    if lhs.randomNumberHash != rhs.randomNumberHash {return false}
    if lhs.expireHeight != rhs.expireHeight {return false}
    if lhs.timestamp != rhs.timestamp {return false}
    if lhs.sender != rhs.sender {return false}
    if lhs.recipient != rhs.recipient {return false}
    if lhs.senderOtherChain != rhs.senderOtherChain {return false}
    if lhs.recipientOtherChain != rhs.recipientOtherChain {return false}
    if lhs.closedBlock != rhs.closedBlock {return false}
    if lhs.status != rhs.status {return false}
    if lhs.crossChain != rhs.crossChain {return false}
    if lhs.direction != rhs.direction {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_QueryAtomicSwapsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryAtomicSwapsRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "involve"),
    2: .same(proto: "expiration"),
    3: .same(proto: "status"),
    4: .same(proto: "direction"),
    5: .same(proto: "pagination"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularStringField(value: &self.involve) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.expiration) }()
      case 3: try { try decoder.decodeSingularEnumField(value: &self.status) }()
      case 4: try { try decoder.decodeSingularEnumField(value: &self.direction) }()
      case 5: try { try decoder.decodeSingularMessageField(value: &self._pagination) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.involve.isEmpty {
      try visitor.visitSingularStringField(value: self.involve, fieldNumber: 1)
    }
    if self.expiration != 0 {
      try visitor.visitSingularUInt64Field(value: self.expiration, fieldNumber: 2)
    }
    if self.status != .unspecified {
      try visitor.visitSingularEnumField(value: self.status, fieldNumber: 3)
    }
    if self.direction != .unspecified {
      try visitor.visitSingularEnumField(value: self.direction, fieldNumber: 4)
    }
    try { if let v = self._pagination {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 5)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_QueryAtomicSwapsRequest, rhs: Kava_Bep3_V1beta1_QueryAtomicSwapsRequest) -> Bool {
    if lhs.involve != rhs.involve {return false}
    if lhs.expiration != rhs.expiration {return false}
    if lhs.status != rhs.status {return false}
    if lhs.direction != rhs.direction {return false}
    if lhs._pagination != rhs._pagination {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Kava_Bep3_V1beta1_QueryAtomicSwapsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryAtomicSwapsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "atomic_swaps"),
    3: .same(proto: "pagination"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.atomicSwaps) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._pagination) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    // The use of inline closures is to circumvent an issue where the compiler
    // allocates stack space for every if/case branch local when no optimizations
    // are enabled. https://github.com/apple/swift-protobuf/issues/1034 and
    // https://github.com/apple/swift-protobuf/issues/1182
    if !self.atomicSwaps.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.atomicSwaps, fieldNumber: 1)
    }
    try { if let v = self._pagination {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    } }()
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Kava_Bep3_V1beta1_QueryAtomicSwapsResponse, rhs: Kava_Bep3_V1beta1_QueryAtomicSwapsResponse) -> Bool {
    if lhs.atomicSwaps != rhs.atomicSwaps {return false}
    if lhs._pagination != rhs._pagination {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
