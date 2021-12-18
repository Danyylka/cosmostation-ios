// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: bitsong/auction/v1beta1/tx.proto
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

/// MsgOpenAuction defines an SDK message for creating a new Auction.
struct Bitsong_Auction_V1beta1_MsgOpenAuction {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var auctionType: UInt32 = 0

  var nftID: String = String()

  var duration: UInt64 = 0

  var minAmount: Cosmos_Base_V1beta1_Coin {
    get {return _minAmount ?? Cosmos_Base_V1beta1_Coin()}
    set {_minAmount = newValue}
  }
  /// Returns true if `minAmount` has been explicitly set.
  var hasMinAmount: Bool {return self._minAmount != nil}
  /// Clears the value of `minAmount`. Subsequent reads from it will return its default value.
  mutating func clearMinAmount() {self._minAmount = nil}

  var owner: String = String()

  var limit: UInt32 = 0

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _minAmount: Cosmos_Base_V1beta1_Coin? = nil
}

/// MsgOpenAuctionResponse defines the Msg/OpenAuction response type.
struct Bitsong_Auction_V1beta1_MsgOpenAuctionResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgEditAuction defines an SDK message for editing an Auction.
struct Bitsong_Auction_V1beta1_MsgEditAuction {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: UInt64 = 0

  var duration: UInt64 = 0

  var owner: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgEditAuctionResponse defines the Msg/EditAuction response type.
struct Bitsong_Auction_V1beta1_MsgEditAuctionResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCancelAuction defines an SDK message for cancelling an Auction.
struct Bitsong_Auction_V1beta1_MsgCancelAuction {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var id: UInt64 = 0

  var owner: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCancelAuctionResponse defines the Msg/CancelAuction response type.
struct Bitsong_Auction_V1beta1_MsgCancelAuctionResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgOpenBid defines an SDK message for creating a new bid.
struct Bitsong_Auction_V1beta1_MsgOpenBid {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var auctionID: UInt64 = 0

  var bidder: String = String()

  var bidAmount: Cosmos_Base_V1beta1_Coin {
    get {return _bidAmount ?? Cosmos_Base_V1beta1_Coin()}
    set {_bidAmount = newValue}
  }
  /// Returns true if `bidAmount` has been explicitly set.
  var hasBidAmount: Bool {return self._bidAmount != nil}
  /// Clears the value of `bidAmount`. Subsequent reads from it will return its default value.
  mutating func clearBidAmount() {self._bidAmount = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _bidAmount: Cosmos_Base_V1beta1_Coin? = nil
}

/// MsgOpenBidResponse defines the Msg/OpenBid response type.
struct Bitsong_Auction_V1beta1_MsgOpenBidResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCancelBid defines an SDK message for cancelling a bid.
struct Bitsong_Auction_V1beta1_MsgCancelBid {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var auctionID: UInt64 = 0

  var bidder: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgCancelBidResponse defines the Msg/CancelBid response type.
struct Bitsong_Auction_V1beta1_MsgCancelBidResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgWithdraw defines an SDK message for withdraw.
struct Bitsong_Auction_V1beta1_MsgWithdraw {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var auctionID: UInt64 = 0

  var recipient: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

/// MsgWithdrawResponse defines the Msg/Withdraw response type.
struct Bitsong_Auction_V1beta1_MsgWithdrawResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "bitsong.auction.v1beta1"

extension Bitsong_Auction_V1beta1_MsgOpenAuction: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgOpenAuction"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "auction_type"),
    2: .standard(proto: "nft_id"),
    3: .same(proto: "duration"),
    4: .standard(proto: "min_amount"),
    5: .same(proto: "owner"),
    6: .same(proto: "limit"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt32Field(value: &self.auctionType) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.nftID) }()
      case 3: try { try decoder.decodeSingularUInt64Field(value: &self.duration) }()
      case 4: try { try decoder.decodeSingularMessageField(value: &self._minAmount) }()
      case 5: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      case 6: try { try decoder.decodeSingularUInt32Field(value: &self.limit) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.auctionType != 0 {
      try visitor.visitSingularUInt32Field(value: self.auctionType, fieldNumber: 1)
    }
    if !self.nftID.isEmpty {
      try visitor.visitSingularStringField(value: self.nftID, fieldNumber: 2)
    }
    if self.duration != 0 {
      try visitor.visitSingularUInt64Field(value: self.duration, fieldNumber: 3)
    }
    if let v = self._minAmount {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 5)
    }
    if self.limit != 0 {
      try visitor.visitSingularUInt32Field(value: self.limit, fieldNumber: 6)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgOpenAuction, rhs: Bitsong_Auction_V1beta1_MsgOpenAuction) -> Bool {
    if lhs.auctionType != rhs.auctionType {return false}
    if lhs.nftID != rhs.nftID {return false}
    if lhs.duration != rhs.duration {return false}
    if lhs._minAmount != rhs._minAmount {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.limit != rhs.limit {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgOpenAuctionResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgOpenAuctionResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgOpenAuctionResponse, rhs: Bitsong_Auction_V1beta1_MsgOpenAuctionResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgEditAuction: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgEditAuction"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "duration"),
    3: .same(proto: "owner"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularUInt64Field(value: &self.duration) }()
      case 3: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularUInt64Field(value: self.id, fieldNumber: 1)
    }
    if self.duration != 0 {
      try visitor.visitSingularUInt64Field(value: self.duration, fieldNumber: 2)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgEditAuction, rhs: Bitsong_Auction_V1beta1_MsgEditAuction) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.duration != rhs.duration {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgEditAuctionResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgEditAuctionResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgEditAuctionResponse, rhs: Bitsong_Auction_V1beta1_MsgEditAuctionResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgCancelAuction: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCancelAuction"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "id"),
    2: .same(proto: "owner"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.id) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.owner) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.id != 0 {
      try visitor.visitSingularUInt64Field(value: self.id, fieldNumber: 1)
    }
    if !self.owner.isEmpty {
      try visitor.visitSingularStringField(value: self.owner, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgCancelAuction, rhs: Bitsong_Auction_V1beta1_MsgCancelAuction) -> Bool {
    if lhs.id != rhs.id {return false}
    if lhs.owner != rhs.owner {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgCancelAuctionResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCancelAuctionResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgCancelAuctionResponse, rhs: Bitsong_Auction_V1beta1_MsgCancelAuctionResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgOpenBid: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgOpenBid"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "auction_id"),
    2: .same(proto: "bidder"),
    3: .standard(proto: "bid_amount"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.auctionID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.bidder) }()
      case 3: try { try decoder.decodeSingularMessageField(value: &self._bidAmount) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.auctionID != 0 {
      try visitor.visitSingularUInt64Field(value: self.auctionID, fieldNumber: 1)
    }
    if !self.bidder.isEmpty {
      try visitor.visitSingularStringField(value: self.bidder, fieldNumber: 2)
    }
    if let v = self._bidAmount {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgOpenBid, rhs: Bitsong_Auction_V1beta1_MsgOpenBid) -> Bool {
    if lhs.auctionID != rhs.auctionID {return false}
    if lhs.bidder != rhs.bidder {return false}
    if lhs._bidAmount != rhs._bidAmount {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgOpenBidResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgOpenBidResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgOpenBidResponse, rhs: Bitsong_Auction_V1beta1_MsgOpenBidResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgCancelBid: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCancelBid"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "auction_id"),
    2: .same(proto: "bidder"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.auctionID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.bidder) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.auctionID != 0 {
      try visitor.visitSingularUInt64Field(value: self.auctionID, fieldNumber: 1)
    }
    if !self.bidder.isEmpty {
      try visitor.visitSingularStringField(value: self.bidder, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgCancelBid, rhs: Bitsong_Auction_V1beta1_MsgCancelBid) -> Bool {
    if lhs.auctionID != rhs.auctionID {return false}
    if lhs.bidder != rhs.bidder {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgCancelBidResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgCancelBidResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgCancelBidResponse, rhs: Bitsong_Auction_V1beta1_MsgCancelBidResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgWithdraw: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdraw"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "auction_id"),
    2: .same(proto: "recipient"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.auctionID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.recipient) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.auctionID != 0 {
      try visitor.visitSingularUInt64Field(value: self.auctionID, fieldNumber: 1)
    }
    if !self.recipient.isEmpty {
      try visitor.visitSingularStringField(value: self.recipient, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgWithdraw, rhs: Bitsong_Auction_V1beta1_MsgWithdraw) -> Bool {
    if lhs.auctionID != rhs.auctionID {return false}
    if lhs.recipient != rhs.recipient {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Bitsong_Auction_V1beta1_MsgWithdrawResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".MsgWithdrawResponse"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Bitsong_Auction_V1beta1_MsgWithdrawResponse, rhs: Bitsong_Auction_V1beta1_MsgWithdrawResponse) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}