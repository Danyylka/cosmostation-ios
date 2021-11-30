//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: comdex/asset/v1beta1/querier.proto
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


/// Usage: instantiate `Comdex_Asset_V1beta1_QueryServiceClient`, then call methods of this protocol to make API calls.
internal protocol Comdex_Asset_V1beta1_QueryServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Comdex_Asset_V1beta1_QueryServiceClientInterceptorFactoryProtocol? { get }

  func queryAssets(
    _ request: Comdex_Asset_V1beta1_QueryAssetsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Comdex_Asset_V1beta1_QueryAssetsRequest, Comdex_Asset_V1beta1_QueryAssetsResponse>

  func queryAsset(
    _ request: Comdex_Asset_V1beta1_QueryAssetRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Comdex_Asset_V1beta1_QueryAssetRequest, Comdex_Asset_V1beta1_QueryAssetResponse>

  func queryPairs(
    _ request: Comdex_Asset_V1beta1_QueryPairsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Comdex_Asset_V1beta1_QueryPairsRequest, Comdex_Asset_V1beta1_QueryPairsResponse>

  func queryPair(
    _ request: Comdex_Asset_V1beta1_QueryPairRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Comdex_Asset_V1beta1_QueryPairRequest, Comdex_Asset_V1beta1_QueryPairResponse>

  func queryParams(
    _ request: Comdex_Asset_V1beta1_QueryParamsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Comdex_Asset_V1beta1_QueryParamsRequest, Comdex_Asset_V1beta1_QueryParamsResponse>
}

extension Comdex_Asset_V1beta1_QueryServiceClientProtocol {
  internal var serviceName: String {
    return "comdex.asset.v1beta1.QueryService"
  }

  /// Unary call to QueryAssets
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryAssets.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryAssets(
    _ request: Comdex_Asset_V1beta1_QueryAssetsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Comdex_Asset_V1beta1_QueryAssetsRequest, Comdex_Asset_V1beta1_QueryAssetsResponse> {
    return self.makeUnaryCall(
      path: "/comdex.asset.v1beta1.QueryService/QueryAssets",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryAssetsInterceptors() ?? []
    )
  }

  /// Unary call to QueryAsset
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryAsset.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryAsset(
    _ request: Comdex_Asset_V1beta1_QueryAssetRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Comdex_Asset_V1beta1_QueryAssetRequest, Comdex_Asset_V1beta1_QueryAssetResponse> {
    return self.makeUnaryCall(
      path: "/comdex.asset.v1beta1.QueryService/QueryAsset",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryAssetInterceptors() ?? []
    )
  }

  /// Unary call to QueryPairs
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryPairs.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryPairs(
    _ request: Comdex_Asset_V1beta1_QueryPairsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Comdex_Asset_V1beta1_QueryPairsRequest, Comdex_Asset_V1beta1_QueryPairsResponse> {
    return self.makeUnaryCall(
      path: "/comdex.asset.v1beta1.QueryService/QueryPairs",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryPairsInterceptors() ?? []
    )
  }

  /// Unary call to QueryPair
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryPair.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryPair(
    _ request: Comdex_Asset_V1beta1_QueryPairRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Comdex_Asset_V1beta1_QueryPairRequest, Comdex_Asset_V1beta1_QueryPairResponse> {
    return self.makeUnaryCall(
      path: "/comdex.asset.v1beta1.QueryService/QueryPair",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryPairInterceptors() ?? []
    )
  }

  /// Unary call to QueryParams
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryParams.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryParams(
    _ request: Comdex_Asset_V1beta1_QueryParamsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Comdex_Asset_V1beta1_QueryParamsRequest, Comdex_Asset_V1beta1_QueryParamsResponse> {
    return self.makeUnaryCall(
      path: "/comdex.asset.v1beta1.QueryService/QueryParams",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryParamsInterceptors() ?? []
    )
  }
}

internal protocol Comdex_Asset_V1beta1_QueryServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'queryAssets'.
  func makeQueryAssetsInterceptors() -> [ClientInterceptor<Comdex_Asset_V1beta1_QueryAssetsRequest, Comdex_Asset_V1beta1_QueryAssetsResponse>]

  /// - Returns: Interceptors to use when invoking 'queryAsset'.
  func makeQueryAssetInterceptors() -> [ClientInterceptor<Comdex_Asset_V1beta1_QueryAssetRequest, Comdex_Asset_V1beta1_QueryAssetResponse>]

  /// - Returns: Interceptors to use when invoking 'queryPairs'.
  func makeQueryPairsInterceptors() -> [ClientInterceptor<Comdex_Asset_V1beta1_QueryPairsRequest, Comdex_Asset_V1beta1_QueryPairsResponse>]

  /// - Returns: Interceptors to use when invoking 'queryPair'.
  func makeQueryPairInterceptors() -> [ClientInterceptor<Comdex_Asset_V1beta1_QueryPairRequest, Comdex_Asset_V1beta1_QueryPairResponse>]

  /// - Returns: Interceptors to use when invoking 'queryParams'.
  func makeQueryParamsInterceptors() -> [ClientInterceptor<Comdex_Asset_V1beta1_QueryParamsRequest, Comdex_Asset_V1beta1_QueryParamsResponse>]
}

internal final class Comdex_Asset_V1beta1_QueryServiceClient: Comdex_Asset_V1beta1_QueryServiceClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Comdex_Asset_V1beta1_QueryServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the comdex.asset.v1beta1.QueryService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Comdex_Asset_V1beta1_QueryServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Comdex_Asset_V1beta1_QueryServiceProvider: CallHandlerProvider {
  var interceptors: Comdex_Asset_V1beta1_QueryServiceServerInterceptorFactoryProtocol? { get }

  func queryAssets(request: Comdex_Asset_V1beta1_QueryAssetsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Comdex_Asset_V1beta1_QueryAssetsResponse>

  func queryAsset(request: Comdex_Asset_V1beta1_QueryAssetRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Comdex_Asset_V1beta1_QueryAssetResponse>

  func queryPairs(request: Comdex_Asset_V1beta1_QueryPairsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Comdex_Asset_V1beta1_QueryPairsResponse>

  func queryPair(request: Comdex_Asset_V1beta1_QueryPairRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Comdex_Asset_V1beta1_QueryPairResponse>

  func queryParams(request: Comdex_Asset_V1beta1_QueryParamsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Comdex_Asset_V1beta1_QueryParamsResponse>
}

extension Comdex_Asset_V1beta1_QueryServiceProvider {
  internal var serviceName: Substring { return "comdex.asset.v1beta1.QueryService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "QueryAssets":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Comdex_Asset_V1beta1_QueryAssetsRequest>(),
        responseSerializer: ProtobufSerializer<Comdex_Asset_V1beta1_QueryAssetsResponse>(),
        interceptors: self.interceptors?.makeQueryAssetsInterceptors() ?? [],
        userFunction: self.queryAssets(request:context:)
      )

    case "QueryAsset":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Comdex_Asset_V1beta1_QueryAssetRequest>(),
        responseSerializer: ProtobufSerializer<Comdex_Asset_V1beta1_QueryAssetResponse>(),
        interceptors: self.interceptors?.makeQueryAssetInterceptors() ?? [],
        userFunction: self.queryAsset(request:context:)
      )

    case "QueryPairs":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Comdex_Asset_V1beta1_QueryPairsRequest>(),
        responseSerializer: ProtobufSerializer<Comdex_Asset_V1beta1_QueryPairsResponse>(),
        interceptors: self.interceptors?.makeQueryPairsInterceptors() ?? [],
        userFunction: self.queryPairs(request:context:)
      )

    case "QueryPair":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Comdex_Asset_V1beta1_QueryPairRequest>(),
        responseSerializer: ProtobufSerializer<Comdex_Asset_V1beta1_QueryPairResponse>(),
        interceptors: self.interceptors?.makeQueryPairInterceptors() ?? [],
        userFunction: self.queryPair(request:context:)
      )

    case "QueryParams":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Comdex_Asset_V1beta1_QueryParamsRequest>(),
        responseSerializer: ProtobufSerializer<Comdex_Asset_V1beta1_QueryParamsResponse>(),
        interceptors: self.interceptors?.makeQueryParamsInterceptors() ?? [],
        userFunction: self.queryParams(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Comdex_Asset_V1beta1_QueryServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'queryAssets'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryAssetsInterceptors() -> [ServerInterceptor<Comdex_Asset_V1beta1_QueryAssetsRequest, Comdex_Asset_V1beta1_QueryAssetsResponse>]

  /// - Returns: Interceptors to use when handling 'queryAsset'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryAssetInterceptors() -> [ServerInterceptor<Comdex_Asset_V1beta1_QueryAssetRequest, Comdex_Asset_V1beta1_QueryAssetResponse>]

  /// - Returns: Interceptors to use when handling 'queryPairs'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryPairsInterceptors() -> [ServerInterceptor<Comdex_Asset_V1beta1_QueryPairsRequest, Comdex_Asset_V1beta1_QueryPairsResponse>]

  /// - Returns: Interceptors to use when handling 'queryPair'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryPairInterceptors() -> [ServerInterceptor<Comdex_Asset_V1beta1_QueryPairRequest, Comdex_Asset_V1beta1_QueryPairResponse>]

  /// - Returns: Interceptors to use when handling 'queryParams'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryParamsInterceptors() -> [ServerInterceptor<Comdex_Asset_V1beta1_QueryParamsRequest, Comdex_Asset_V1beta1_QueryParamsResponse>]
}
