// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the Swift generator plugin for the protocol buffer compiler.
// Source: pstake/lscosmos/v1beta1/packet.proto
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

struct Pstake_Lscosmos_V1beta1_LscosmosPacketData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var packet: Pstake_Lscosmos_V1beta1_LscosmosPacketData.OneOf_Packet? = nil

  /// this line is used by starport scaffolding # ibc/packet/proto/field
  var noData: Pstake_Lscosmos_V1beta1_NoData {
    get {
      if case .noData(let v)? = packet {return v}
      return Pstake_Lscosmos_V1beta1_NoData()
    }
    set {packet = .noData(newValue)}
  }

  var unknownFields = SwiftProtobuf.UnknownStorage()

  enum OneOf_Packet: Equatable {
    /// this line is used by starport scaffolding # ibc/packet/proto/field
    case noData(Pstake_Lscosmos_V1beta1_NoData)

  #if !swift(>=4.1)
    static func ==(lhs: Pstake_Lscosmos_V1beta1_LscosmosPacketData.OneOf_Packet, rhs: Pstake_Lscosmos_V1beta1_LscosmosPacketData.OneOf_Packet) -> Bool {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch (lhs, rhs) {
      case (.noData, .noData): return {
        guard case .noData(let l) = lhs, case .noData(let r) = rhs else { preconditionFailure() }
        return l == r
      }()
      }
    }
  #endif
  }

  init() {}
}

struct Pstake_Lscosmos_V1beta1_NoData {
  // SwiftProtobuf.Message conformance is added in an extension below. See the
  // `Message` and `Message+*Additions` files in the SwiftProtobuf library for
  // methods supported on all messages.

  var unknownFields = SwiftProtobuf.UnknownStorage()

  init() {}
}

// MARK: - Code below here is support for the SwiftProtobuf runtime.

fileprivate let _protobuf_package = "pstake.lscosmos.v1beta1"

extension Pstake_Lscosmos_V1beta1_LscosmosPacketData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".LscosmosPacketData"
  static let _protobuf_nameMap: SwiftProtobuf._NameMap = [
    1: .same(proto: "noData"),
  ]

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let fieldNumber = try decoder.nextFieldNumber() {
      // The use of inline closures is to circumvent an issue where the compiler
      // allocates stack space for every case branch when no optimizations are
      // enabled. https://github.com/apple/swift-protobuf/issues/1034
      switch fieldNumber {
      case 1: try {
        var v: Pstake_Lscosmos_V1beta1_NoData?
        var hadOneofValue = false
        if let current = self.packet {
          hadOneofValue = true
          if case .noData(let m) = current {v = m}
        }
        try decoder.decodeSingularMessageField(value: &v)
        if let v = v {
          if hadOneofValue {try decoder.handleConflictingOneOf()}
          self.packet = .noData(v)
        }
      }()
      default: break
      }
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    if case .noData(let v)? = self.packet {
      try visitor.visitSingularMessageField(value: v, fieldNumber: 1)
    }
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pstake_Lscosmos_V1beta1_LscosmosPacketData, rhs: Pstake_Lscosmos_V1beta1_LscosmosPacketData) -> Bool {
    if lhs.packet != rhs.packet {return false}
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}

extension Pstake_Lscosmos_V1beta1_NoData: SwiftProtobuf.Message, SwiftProtobuf._MessageImplementationBase, SwiftProtobuf._ProtoNameProviding {
  static let protoMessageName: String = _protobuf_package + ".NoData"
  static let _protobuf_nameMap = SwiftProtobuf._NameMap()

  mutating func decodeMessage<D: SwiftProtobuf.Decoder>(decoder: inout D) throws {
    while let _ = try decoder.nextFieldNumber() {
    }
  }

  func traverse<V: SwiftProtobuf.Visitor>(visitor: inout V) throws {
    try unknownFields.traverse(visitor: &visitor)
  }

  static func ==(lhs: Pstake_Lscosmos_V1beta1_NoData, rhs: Pstake_Lscosmos_V1beta1_NoData) -> Bool {
    if lhs.unknownFields != rhs.unknownFields {return false}
    return true
  }
}
