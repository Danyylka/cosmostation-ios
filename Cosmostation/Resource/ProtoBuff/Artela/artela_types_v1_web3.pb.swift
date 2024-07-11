// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: artela/types/v1/web3.proto
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

/// ExtensionOptionsWeb3Tx is an extension option that specifies the typed chain
/// id, the fee payer as well as its signature data.
struct Artela_Types_V1_ExtensionOptionsWeb3Tx {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  /// typed_data_chain_id is used only in EIP712 Domain and should match
  /// Ethereum network ID in a Web3 provider (e.g. Metamask).
  var typedDataChainID: UInt64 = 0

  /// fee_payer is an account address for the fee payer. It will be validated
  /// during EIP712 signature checking.
  var feePayer: String = String()

  /// fee_payer_sig is a signature data from the fee paying account,
  /// allows to perform fee delegation when using EIP712 Domain.
  var feePayerSig: Data = Data()

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

#if swift(>=5.5) && canImport(_Concurrency)
extension Artela_Types_V1_ExtensionOptionsWeb3Tx: @unchecked Sendable {}
#endif  // swift(>=5.5) && canImport(_Concurrency)

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "artela.types.v1"

extension Artela_Types_V1_ExtensionOptionsWeb3Tx: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".ExtensionOptionsWeb3Tx"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .standard(proto: "typed_data_chain_id"),
    2: .standard(proto: "fee_payer"),
    3: .standard(proto: "fee_payer_sig"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try { try decoder.decodeSingularUInt64Field(value: &self.typedDataChainID) }()
      case 2: try { try decoder.decodeSingularStringField(value: &self.feePayer) }()
      case 3: try { try decoder.decodeSingularBytesField(value: &self.feePayerSig) }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if self.typedDataChainID != 0 {
      try visitor.visitSingularUInt64Field(value: self.typedDataChainID, fieldNumber: 1)
    }
    if !self.feePayer.isEmpty {
      try visitor.visitSingularStringField(value: self.feePayer, fieldNumber: 2)
    }
    if !self.feePayerSig.isEmpty {
      try visitor.visitSingularBytesField(value: self.feePayerSig, fieldNumber: 3)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Artela_Types_V1_ExtensionOptionsWeb3Tx, rhs: Artela_Types_V1_ExtensionOptionsWeb3Tx) -> Bool {
    if lhs.typedDataChainID != rhs.typedDataChainID {return false}
    if lhs.feePayer != rhs.feePayer {return false}
    if lhs.feePayerSig != rhs.feePayerSig {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
