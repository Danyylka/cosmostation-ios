//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: em/buyback/v1/query.proto
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


/// Usage: instantiate `Em_Buyback_V1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Em_Buyback_V1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Em_Buyback_V1_QueryClientInterceptorFactoryProtocol? { get }

  func balance(
    _ request: Em_Buyback_V1_QueryBalanceRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Em_Buyback_V1_QueryBalanceRequest, Em_Buyback_V1_QueryBalanceResponse>

  func buybackTime(
    _ request: Em_Buyback_V1_QueryBuybackTimeRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Em_Buyback_V1_QueryBuybackTimeRequest, Em_Buyback_V1_QueryBuybackTimeResponse>
}

extension Em_Buyback_V1_QueryClientProtocol {
  internal var serviceName: String {
    return "em.buyback.v1.Query"
  }

  /// Query for the current buyback balance
  ///
  /// - Parameters:
  ///   - request: Request to send to Balance.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func balance(
    _ request: Em_Buyback_V1_QueryBalanceRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Em_Buyback_V1_QueryBalanceRequest, Em_Buyback_V1_QueryBalanceResponse> {
    return self.makeUnaryCall(
      path: "/em.buyback.v1.Query/Balance",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeBalanceInterceptors() ?? []
    )
  }

  /// Query for buyback time periods
  ///
  /// - Parameters:
  ///   - request: Request to send to BuybackTime.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func buybackTime(
    _ request: Em_Buyback_V1_QueryBuybackTimeRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Em_Buyback_V1_QueryBuybackTimeRequest, Em_Buyback_V1_QueryBuybackTimeResponse> {
    return self.makeUnaryCall(
      path: "/em.buyback.v1.Query/BuybackTime",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeBuybackTimeInterceptors() ?? []
    )
  }
}

internal protocol Em_Buyback_V1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'balance'.
  func makeBalanceInterceptors() -> [ClientInterceptor<Em_Buyback_V1_QueryBalanceRequest, Em_Buyback_V1_QueryBalanceResponse>]

  /// - Returns: Interceptors to use when invoking 'buybackTime'.
  func makeBuybackTimeInterceptors() -> [ClientInterceptor<Em_Buyback_V1_QueryBuybackTimeRequest, Em_Buyback_V1_QueryBuybackTimeResponse>]
}

internal final class Em_Buyback_V1_QueryClient: Em_Buyback_V1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Em_Buyback_V1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the em.buyback.v1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Em_Buyback_V1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Em_Buyback_V1_QueryProvider: CallHandlerProvider {
  var interceptors: Em_Buyback_V1_QueryServerInterceptorFactoryProtocol? { get }

  /// Query for the current buyback balance
  func balance(request: Em_Buyback_V1_QueryBalanceRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Em_Buyback_V1_QueryBalanceResponse>

  /// Query for buyback time periods
  func buybackTime(request: Em_Buyback_V1_QueryBuybackTimeRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Em_Buyback_V1_QueryBuybackTimeResponse>
}

extension Em_Buyback_V1_QueryProvider {
  internal var serviceName: Substring { return "em.buyback.v1.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Balance":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Em_Buyback_V1_QueryBalanceRequest>(),
        responseSerializer: ProtobufSerializer<Em_Buyback_V1_QueryBalanceResponse>(),
        interceptors: self.interceptors?.makeBalanceInterceptors() ?? [],
        userFunction: self.balance(request:context:)
      )

    case "BuybackTime":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Em_Buyback_V1_QueryBuybackTimeRequest>(),
        responseSerializer: ProtobufSerializer<Em_Buyback_V1_QueryBuybackTimeResponse>(),
        interceptors: self.interceptors?.makeBuybackTimeInterceptors() ?? [],
        userFunction: self.buybackTime(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Em_Buyback_V1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'balance'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeBalanceInterceptors() -> [ServerInterceptor<Em_Buyback_V1_QueryBalanceRequest, Em_Buyback_V1_QueryBalanceResponse>]

  /// - Returns: Interceptors to use when handling 'buybackTime'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeBuybackTimeInterceptors() -> [ServerInterceptor<Em_Buyback_V1_QueryBuybackTimeRequest, Em_Buyback_V1_QueryBuybackTimeResponse>]
}