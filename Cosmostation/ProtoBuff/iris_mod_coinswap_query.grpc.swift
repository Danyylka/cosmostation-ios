//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: iris_mod/coinswap/query.proto
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


/// Query creates service with coinswap as rpc
///
/// Usage: instantiate `Irismod_Coinswap_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Irismod_Coinswap_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Irismod_Coinswap_QueryClientInterceptorFactoryProtocol? { get }

  func liquidityPool(
    _ request: Irismod_Coinswap_QueryLiquidityPoolRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Coinswap_QueryLiquidityPoolRequest, Irismod_Coinswap_QueryLiquidityPoolResponse>

  func liquidityPools(
    _ request: Irismod_Coinswap_QueryLiquidityPoolsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Coinswap_QueryLiquidityPoolsRequest, Irismod_Coinswap_QueryLiquidityPoolsResponse>
}

extension Irismod_Coinswap_QueryClientProtocol {
  internal var serviceName: String {
    return "irismod.coinswap.Query"
  }

  /// LiquidityPool returns the liquidity pool for the provided
  /// lpt_denom
  ///
  /// - Parameters:
  ///   - request: Request to send to LiquidityPool.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func liquidityPool(
    _ request: Irismod_Coinswap_QueryLiquidityPoolRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Coinswap_QueryLiquidityPoolRequest, Irismod_Coinswap_QueryLiquidityPoolResponse> {
    return self.makeUnaryCall(
      path: "/irismod.coinswap.Query/LiquidityPool",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidityPoolInterceptors() ?? []
    )
  }

  /// LiquidityPools returns all the liquidity pools available
  ///
  /// - Parameters:
  ///   - request: Request to send to LiquidityPools.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func liquidityPools(
    _ request: Irismod_Coinswap_QueryLiquidityPoolsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Coinswap_QueryLiquidityPoolsRequest, Irismod_Coinswap_QueryLiquidityPoolsResponse> {
    return self.makeUnaryCall(
      path: "/irismod.coinswap.Query/LiquidityPools",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeLiquidityPoolsInterceptors() ?? []
    )
  }
}

internal protocol Irismod_Coinswap_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'liquidityPool'.
  func makeLiquidityPoolInterceptors() -> [ClientInterceptor<Irismod_Coinswap_QueryLiquidityPoolRequest, Irismod_Coinswap_QueryLiquidityPoolResponse>]

  /// - Returns: Interceptors to use when invoking 'liquidityPools'.
  func makeLiquidityPoolsInterceptors() -> [ClientInterceptor<Irismod_Coinswap_QueryLiquidityPoolsRequest, Irismod_Coinswap_QueryLiquidityPoolsResponse>]
}

internal final class Irismod_Coinswap_QueryClient: Irismod_Coinswap_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Irismod_Coinswap_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the irismod.coinswap.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Irismod_Coinswap_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query creates service with coinswap as rpc
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Irismod_Coinswap_QueryProvider: CallHandlerProvider {
  var interceptors: Irismod_Coinswap_QueryServerInterceptorFactoryProtocol? { get }

  /// LiquidityPool returns the liquidity pool for the provided
  /// lpt_denom
  func liquidityPool(request: Irismod_Coinswap_QueryLiquidityPoolRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Coinswap_QueryLiquidityPoolResponse>

  /// LiquidityPools returns all the liquidity pools available
  func liquidityPools(request: Irismod_Coinswap_QueryLiquidityPoolsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Coinswap_QueryLiquidityPoolsResponse>
}

extension Irismod_Coinswap_QueryProvider {
  internal var serviceName: Substring { return "irismod.coinswap.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "LiquidityPool":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Coinswap_QueryLiquidityPoolRequest>(),
        responseSerializer: ProtobufSerializer<Irismod_Coinswap_QueryLiquidityPoolResponse>(),
        interceptors: self.interceptors?.makeLiquidityPoolInterceptors() ?? [],
        userFunction: self.liquidityPool(request:context:)
      )

    case "LiquidityPools":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Coinswap_QueryLiquidityPoolsRequest>(),
        responseSerializer: ProtobufSerializer<Irismod_Coinswap_QueryLiquidityPoolsResponse>(),
        interceptors: self.interceptors?.makeLiquidityPoolsInterceptors() ?? [],
        userFunction: self.liquidityPools(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Irismod_Coinswap_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'liquidityPool'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLiquidityPoolInterceptors() -> [ServerInterceptor<Irismod_Coinswap_QueryLiquidityPoolRequest, Irismod_Coinswap_QueryLiquidityPoolResponse>]

  /// - Returns: Interceptors to use when handling 'liquidityPools'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeLiquidityPoolsInterceptors() -> [ServerInterceptor<Irismod_Coinswap_QueryLiquidityPoolsRequest, Irismod_Coinswap_QueryLiquidityPoolsResponse>]
}
