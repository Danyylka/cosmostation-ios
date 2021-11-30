//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: iscn/query.proto
//

//
// Copyright 2018, gRPC Authors All rights reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
import GRPC
import NIO
import SwiftProtobuf


/// Usage:
/// /iscn/api/endpoint?param1=blablabla&param2=blablabla...
/// Example:
/// /iscn/records/id?iscn_id=iscn://likecoin-chain/btC7CJvMm4WLj9Tau9LAPTfGK7sfymTJW7ORcFdruCU&from_version=2
///
/// Usage: instantiate `Likechain_Iscn_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Likechain_Iscn_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Likechain_Iscn_QueryClientInterceptorFactoryProtocol? { get }

  func recordsById(
    _ request: Likechain_Iscn_QueryRecordsByIdRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Likechain_Iscn_QueryRecordsByIdRequest, Likechain_Iscn_QueryRecordsByIdResponse>

  func recordsByFingerprint(
    _ request: Likechain_Iscn_QueryRecordsByFingerprintRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Likechain_Iscn_QueryRecordsByFingerprintRequest, Likechain_Iscn_QueryRecordsByFingerprintResponse>

  func recordsByOwner(
    _ request: Likechain_Iscn_QueryRecordsByOwnerRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Likechain_Iscn_QueryRecordsByOwnerRequest, Likechain_Iscn_QueryRecordsByOwnerResponse>

  func params(
    _ request: Likechain_Iscn_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Likechain_Iscn_QueryParamsRequest, Likechain_Iscn_QueryParamsResponse>

  func getCid(
    _ request: Likechain_Iscn_QueryGetCidRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Likechain_Iscn_QueryGetCidRequest, Likechain_Iscn_QueryGetCidResponse>

  func hasCid(
    _ request: Likechain_Iscn_QueryHasCidRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Likechain_Iscn_QueryHasCidRequest, Likechain_Iscn_QueryHasCidResponse>

  func getCidSize(
    _ request: Likechain_Iscn_QueryGetCidSizeRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Likechain_Iscn_QueryGetCidSizeRequest, Likechain_Iscn_QueryGetCidSizeResponse>
}

extension Likechain_Iscn_QueryClientProtocol {
  internal var serviceName: String {
    return "likechain.iscn.Query"
  }

  /// Unary call to RecordsById
  ///
  /// - Parameters:
  ///   - request: Request to send to RecordsById.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func recordsById(
    _ request: Likechain_Iscn_QueryRecordsByIdRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Likechain_Iscn_QueryRecordsByIdRequest, Likechain_Iscn_QueryRecordsByIdResponse> {
    return self.makeUnaryCall(
      path: "/likechain.iscn.Query/RecordsById",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRecordsByIdInterceptors() ?? []
    )
  }

  /// Unary call to RecordsByFingerprint
  ///
  /// - Parameters:
  ///   - request: Request to send to RecordsByFingerprint.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func recordsByFingerprint(
    _ request: Likechain_Iscn_QueryRecordsByFingerprintRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Likechain_Iscn_QueryRecordsByFingerprintRequest, Likechain_Iscn_QueryRecordsByFingerprintResponse> {
    return self.makeUnaryCall(
      path: "/likechain.iscn.Query/RecordsByFingerprint",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRecordsByFingerprintInterceptors() ?? []
    )
  }

  /// Unary call to RecordsByOwner
  ///
  /// - Parameters:
  ///   - request: Request to send to RecordsByOwner.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func recordsByOwner(
    _ request: Likechain_Iscn_QueryRecordsByOwnerRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Likechain_Iscn_QueryRecordsByOwnerRequest, Likechain_Iscn_QueryRecordsByOwnerResponse> {
    return self.makeUnaryCall(
      path: "/likechain.iscn.Query/RecordsByOwner",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRecordsByOwnerInterceptors() ?? []
    )
  }

  /// Unary call to Params
  ///
  /// - Parameters:
  ///   - request: Request to send to Params.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func params(
    _ request: Likechain_Iscn_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Likechain_Iscn_QueryParamsRequest, Likechain_Iscn_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: "/likechain.iscn.Query/Params",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeParamsInterceptors() ?? []
    )
  }

  /// Unary call to GetCid
  ///
  /// - Parameters:
  ///   - request: Request to send to GetCid.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getCid(
    _ request: Likechain_Iscn_QueryGetCidRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Likechain_Iscn_QueryGetCidRequest, Likechain_Iscn_QueryGetCidResponse> {
    return self.makeUnaryCall(
      path: "/likechain.iscn.Query/GetCid",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetCidInterceptors() ?? []
    )
  }

  /// Unary call to HasCid
  ///
  /// - Parameters:
  ///   - request: Request to send to HasCid.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func hasCid(
    _ request: Likechain_Iscn_QueryHasCidRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Likechain_Iscn_QueryHasCidRequest, Likechain_Iscn_QueryHasCidResponse> {
    return self.makeUnaryCall(
      path: "/likechain.iscn.Query/HasCid",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeHasCidInterceptors() ?? []
    )
  }

  /// Unary call to GetCidSize
  ///
  /// - Parameters:
  ///   - request: Request to send to GetCidSize.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func getCidSize(
    _ request: Likechain_Iscn_QueryGetCidSizeRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Likechain_Iscn_QueryGetCidSizeRequest, Likechain_Iscn_QueryGetCidSizeResponse> {
    return self.makeUnaryCall(
      path: "/likechain.iscn.Query/GetCidSize",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeGetCidSizeInterceptors() ?? []
    )
  }
}

internal protocol Likechain_Iscn_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'recordsById'.
  func makeRecordsByIdInterceptors() -> [ClientInterceptor<Likechain_Iscn_QueryRecordsByIdRequest, Likechain_Iscn_QueryRecordsByIdResponse>]

  /// - Returns: Interceptors to use when invoking 'recordsByFingerprint'.
  func makeRecordsByFingerprintInterceptors() -> [ClientInterceptor<Likechain_Iscn_QueryRecordsByFingerprintRequest, Likechain_Iscn_QueryRecordsByFingerprintResponse>]

  /// - Returns: Interceptors to use when invoking 'recordsByOwner'.
  func makeRecordsByOwnerInterceptors() -> [ClientInterceptor<Likechain_Iscn_QueryRecordsByOwnerRequest, Likechain_Iscn_QueryRecordsByOwnerResponse>]

  /// - Returns: Interceptors to use when invoking 'params'.
  func makeParamsInterceptors() -> [ClientInterceptor<Likechain_Iscn_QueryParamsRequest, Likechain_Iscn_QueryParamsResponse>]

  /// - Returns: Interceptors to use when invoking 'getCid'.
  func makeGetCidInterceptors() -> [ClientInterceptor<Likechain_Iscn_QueryGetCidRequest, Likechain_Iscn_QueryGetCidResponse>]

  /// - Returns: Interceptors to use when invoking 'hasCid'.
  func makeHasCidInterceptors() -> [ClientInterceptor<Likechain_Iscn_QueryHasCidRequest, Likechain_Iscn_QueryHasCidResponse>]

  /// - Returns: Interceptors to use when invoking 'getCidSize'.
  func makeGetCidSizeInterceptors() -> [ClientInterceptor<Likechain_Iscn_QueryGetCidSizeRequest, Likechain_Iscn_QueryGetCidSizeResponse>]
}

internal final class Likechain_Iscn_QueryClient: Likechain_Iscn_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Likechain_Iscn_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the likechain.iscn.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Likechain_Iscn_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Usage:
/// /iscn/api/endpoint?param1=blablabla&param2=blablabla...
/// Example:
/// /iscn/records/id?iscn_id=iscn://likecoin-chain/btC7CJvMm4WLj9Tau9LAPTfGK7sfymTJW7ORcFdruCU&from_version=2
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Likechain_Iscn_QueryProvider: CallHandlerProvider {
  var interceptors: Likechain_Iscn_QueryServerInterceptorFactoryProtocol? { get }

  func recordsById(request: Likechain_Iscn_QueryRecordsByIdRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Likechain_Iscn_QueryRecordsByIdResponse>

  func recordsByFingerprint(request: Likechain_Iscn_QueryRecordsByFingerprintRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Likechain_Iscn_QueryRecordsByFingerprintResponse>

  func recordsByOwner(request: Likechain_Iscn_QueryRecordsByOwnerRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Likechain_Iscn_QueryRecordsByOwnerResponse>

  func params(request: Likechain_Iscn_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Likechain_Iscn_QueryParamsResponse>

  func getCid(request: Likechain_Iscn_QueryGetCidRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Likechain_Iscn_QueryGetCidResponse>

  func hasCid(request: Likechain_Iscn_QueryHasCidRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Likechain_Iscn_QueryHasCidResponse>

  func getCidSize(request: Likechain_Iscn_QueryGetCidSizeRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Likechain_Iscn_QueryGetCidSizeResponse>
}

extension Likechain_Iscn_QueryProvider {
  internal var serviceName: Substring { return "likechain.iscn.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "RecordsById":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Likechain_Iscn_QueryRecordsByIdRequest>(),
        responseSerializer: ProtobufSerializer<Likechain_Iscn_QueryRecordsByIdResponse>(),
        interceptors: self.interceptors?.makeRecordsByIdInterceptors() ?? [],
        userFunction: self.recordsById(request:context:)
      )

    case "RecordsByFingerprint":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Likechain_Iscn_QueryRecordsByFingerprintRequest>(),
        responseSerializer: ProtobufSerializer<Likechain_Iscn_QueryRecordsByFingerprintResponse>(),
        interceptors: self.interceptors?.makeRecordsByFingerprintInterceptors() ?? [],
        userFunction: self.recordsByFingerprint(request:context:)
      )

    case "RecordsByOwner":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Likechain_Iscn_QueryRecordsByOwnerRequest>(),
        responseSerializer: ProtobufSerializer<Likechain_Iscn_QueryRecordsByOwnerResponse>(),
        interceptors: self.interceptors?.makeRecordsByOwnerInterceptors() ?? [],
        userFunction: self.recordsByOwner(request:context:)
      )

    case "Params":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Likechain_Iscn_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Likechain_Iscn_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeParamsInterceptors() ?? [],
        userFunction: self.params(request:context:)
      )

    case "GetCid":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Likechain_Iscn_QueryGetCidRequest>(),
        responseSerializer: ProtobufSerializer<Likechain_Iscn_QueryGetCidResponse>(),
        interceptors: self.interceptors?.makeGetCidInterceptors() ?? [],
        userFunction: self.getCid(request:context:)
      )

    case "HasCid":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Likechain_Iscn_QueryHasCidRequest>(),
        responseSerializer: ProtobufSerializer<Likechain_Iscn_QueryHasCidResponse>(),
        interceptors: self.interceptors?.makeHasCidInterceptors() ?? [],
        userFunction: self.hasCid(request:context:)
      )

    case "GetCidSize":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Likechain_Iscn_QueryGetCidSizeRequest>(),
        responseSerializer: ProtobufSerializer<Likechain_Iscn_QueryGetCidSizeResponse>(),
        interceptors: self.interceptors?.makeGetCidSizeInterceptors() ?? [],
        userFunction: self.getCidSize(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Likechain_Iscn_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'recordsById'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRecordsByIdInterceptors() -> [ServerInterceptor<Likechain_Iscn_QueryRecordsByIdRequest, Likechain_Iscn_QueryRecordsByIdResponse>]

  /// - Returns: Interceptors to use when handling 'recordsByFingerprint'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRecordsByFingerprintInterceptors() -> [ServerInterceptor<Likechain_Iscn_QueryRecordsByFingerprintRequest, Likechain_Iscn_QueryRecordsByFingerprintResponse>]

  /// - Returns: Interceptors to use when handling 'recordsByOwner'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRecordsByOwnerInterceptors() -> [ServerInterceptor<Likechain_Iscn_QueryRecordsByOwnerRequest, Likechain_Iscn_QueryRecordsByOwnerResponse>]

  /// - Returns: Interceptors to use when handling 'params'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeParamsInterceptors() -> [ServerInterceptor<Likechain_Iscn_QueryParamsRequest, Likechain_Iscn_QueryParamsResponse>]

  /// - Returns: Interceptors to use when handling 'getCid'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetCidInterceptors() -> [ServerInterceptor<Likechain_Iscn_QueryGetCidRequest, Likechain_Iscn_QueryGetCidResponse>]

  /// - Returns: Interceptors to use when handling 'hasCid'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeHasCidInterceptors() -> [ServerInterceptor<Likechain_Iscn_QueryHasCidRequest, Likechain_Iscn_QueryHasCidResponse>]

  /// - Returns: Interceptors to use when handling 'getCidSize'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeGetCidSizeInterceptors() -> [ServerInterceptor<Likechain_Iscn_QueryGetCidSizeRequest, Likechain_Iscn_QueryGetCidSizeResponse>]
}
