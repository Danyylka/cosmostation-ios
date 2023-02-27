// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: persistence/interchainquery/v1beta1/query.proto
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

/// QueryParamsRequest is the request type for the Query/Params RPC method.
struct Persistence_Interchainquery_V1beta1_QueryRequestsRequest {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var pagination: Cosmos_Base_Query_V1beta1_PageRequest {
    get {return _pagination ?? Cosmos_Base_Query_V1beta1_PageRequest()}
    set {_pagination = newValue}
  }
  /// Returns true if `pagination` has been explicitly set.
  var hasPagination: Bool {return self._pagination != nil}
  /// Clears the value of `pagination`. Subsequent reads from it will return its default value.
  mutating func clearPagination() {self._pagination = nil}

  var chainID: String = String()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _pagination: Cosmos_Base_Query_V1beta1_PageRequest? = nil
}

/// QueryParamsResponse is the response type for the Query/Params RPC method.
struct Persistence_Interchainquery_V1beta1_QueryRequestsResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// params defines the parameters of the module.
  var queries: [Persistence_Interchainquery_V1beta1_Query] = []

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

/// GetTxResponse is the response type for the Service.GetTx method.
struct Persistence_Interchainquery_V1beta1_GetTxWithProofResponse {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// tx is the queried transaction.
  var tx: Cosmos_Tx_V1beta1_Tx {
    get {return _storage._tx ?? Cosmos_Tx_V1beta1_Tx()}
    set {_uniqueStorage()._tx = newValue}
  }
  /// Returns true if `tx` has been explicitly set.
  var hasTx: Bool {return _storage._tx != nil}
  /// Clears the value of `tx`. Subsequent reads from it will return its default value.
  mutating func clearTx() {_uniqueStorage()._tx = nil}

  /// tx_response is the queried TxResponses.
  var txResponse: Cosmos_Base_Abci_V1beta1_TxResponse {
    get {return _storage._txResponse ?? Cosmos_Base_Abci_V1beta1_TxResponse()}
    set {_uniqueStorage()._txResponse = newValue}
  }
  /// Returns true if `txResponse` has been explicitly set.
  var hasTxResponse: Bool {return _storage._txResponse != nil}
  /// Clears the value of `txResponse`. Subsequent reads from it will return its default value.
  mutating func clearTxResponse() {_uniqueStorage()._txResponse = nil}

  /// proof is the tmproto.TxProof for the queried tx
  var proof: Tendermint_Types_TxProof {
    get {return _storage._proof ?? Tendermint_Types_TxProof()}
    set {_uniqueStorage()._proof = newValue}
  }
  /// Returns true if `proof` has been explicitly set.
  var hasProof: Bool {return _storage._proof != nil}
  /// Clears the value of `proof`. Subsequent reads from it will return its default value.
  mutating func clearProof() {_uniqueStorage()._proof = nil}

  /// ibc-go header to validate txs
  var header: Ibc_Lightclients_Tendermint_V1_Header {
    get {return _storage._header ?? Ibc_Lightclients_Tendermint_V1_Header()}
    set {_uniqueStorage()._header = newValue}
  }
  /// Returns true if `header` has been explicitly set.
  var hasHeader: Bool {return _storage._header != nil}
  /// Clears the value of `header`. Subsequent reads from it will return its default value.
  mutating func clearHeader() {_uniqueStorage()._header = nil}

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}

  fileprivate var _storage = _StorageClass.defaultInstance
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "persistence.interchainquery.v1beta1"

extension Persistence_Interchainquery_V1beta1_QueryRequestsRequest: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryRequestsRequest"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "pagination"),
    2: .standard(proto: "chain_id"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularMessageField(value: &self._pagination) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.chainID) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if let v = self._pagination {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    if !self.chainID.isEmpty {
      try visitor.visitSingularStringField(value: self.chainID, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Persistence_Interchainquery_V1beta1_QueryRequestsRequest, rhs: Persistence_Interchainquery_V1beta1_QueryRequestsRequest) -> Bool {
    if lhs._pagination != rhs._pagination {return false}
    if lhs.chainID != rhs.chainID {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Persistence_Interchainquery_V1beta1_QueryRequestsResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".QueryRequestsResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "queries"),
    2: .same(proto: "pagination"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeRepeatedMessageField(value: &self.queries) }()
      case 2: try { try decoder.decodeSingularMessageField(value: &self._pagination) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if !self.queries.isEmpty {
      try visitor.visitRepeatedMessageField(value: self.queries, fieldNumber: 1)
    }
    if let v = self._pagination {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Persistence_Interchainquery_V1beta1_QueryRequestsResponse, rhs: Persistence_Interchainquery_V1beta1_QueryRequestsResponse) -> Bool {
    if lhs.queries != rhs.queries {return false}
    if lhs._pagination != rhs._pagination {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Persistence_Interchainquery_V1beta1_GetTxWithProofResponse: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".GetTxWithProofResponse"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "tx"),
    2: .standard(proto: "tx_response"),
    3: .same(proto: "proof"),
    4: .same(proto: "header"),
  ]

  fileprivate class _StorageClass {
    var _tx: Cosmos_Tx_V1beta1_Tx? = nil
    var _txResponse: Cosmos_Base_Abci_V1beta1_TxResponse? = nil
    var _proof: Tendermint_Types_TxProof? = nil
    var _header: Ibc_Lightclients_Tendermint_V1_Header? = nil

    static let defaultInstance = _StorageClass()

    private init() {}

    init(copying source: _StorageClass) {
      _tx = source._tx
      _txResponse = source._txResponse
      _proof = source._proof
      _header = source._header
    }
  }

  fileprivate mutating func _uniqueStorage() -> _StorageClass {
    if !isKnownUniquelyReferenced(&_storage) {
      _storage = _StorageClass(copying: _storage)
    }
    return _storage
  }

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    _ = _uniqueStorage()
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      while let fieldNumber = try decoder.nextFieldNumber() {
        // The use of inline closures is to circumvent an issue where the compiler
        // allocates stack space for every case branch when no optimizations are
        // enabled. https://github.com/apple/swift-protobuf/issues/1034
        switch fieldNumber {
        case 1: try { try decoder.decodeSingularMessageField(value: &_storage._tx) }()
        case 2: try { try decoder.decodeSingularMessageField(value: &_storage._txResponse) }()
        case 3: try { try decoder.decodeSingularMessageField(value: &_storage._proof) }()
        case 4: try { try decoder.decodeSingularMessageField(value: &_storage._header) }()
        default: break
        }
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try withExtendedLifetime(_storage) { (_storage: _StorageClass) in
      if let v = _storage._tx {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
      }
      if let v = _storage._txResponse {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 2)
      }
      if let v = _storage._proof {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 3)
      }
      if let v = _storage._header {
        try visitor.visitSingularMessageField(value: v, fieldNumber: 4)
      }
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Persistence_Interchainquery_V1beta1_GetTxWithProofResponse, rhs: Persistence_Interchainquery_V1beta1_GetTxWithProofResponse) -> Bool {
    if lhs._storage !== rhs._storage {
      let storagesAreEqual: Bool = withExtendedLifetime((lhs._storage, rhs._storage)) { (_args: (_StorageClass, _StorageClass)) in
        let _storage = _args.0
        let rhs_storage = _args.1
        if _storage._tx != rhs_storage._tx {return false}
        if _storage._txResponse != rhs_storage._txResponse {return false}
        if _storage._proof != rhs_storage._proof {return false}
        if _storage._header != rhs_storage._header {return false}
        return true
      }
      if !storagesAreEqual {return false}
    }
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
