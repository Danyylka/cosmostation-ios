//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: sentinel/deposit/v1/querier.proto
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


/// Usage: instantiate `Sentinel_Deposit_V1_QueryServiceClient`, then call methods of this protocol to make API calls.
internal protocol Sentinel_Deposit_V1_QueryServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Sentinel_Deposit_V1_QueryServiceClientInterceptorFactoryProtocol? { get }

  func queryDeposits(
    _ request: Sentinel_Deposit_V1_QueryDepositsRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Sentinel_Deposit_V1_QueryDepositsRequest, Sentinel_Deposit_V1_QueryDepositsResponse>

  func queryDeposit(
    _ request: Sentinel_Deposit_V1_QueryDepositRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Sentinel_Deposit_V1_QueryDepositRequest, Sentinel_Deposit_V1_QueryDepositResponse>
}

extension Sentinel_Deposit_V1_QueryServiceClientProtocol {
  internal var serviceName: String {
    return "sentinel.deposit.v1.QueryService"
  }

  /// Unary call to QueryDeposits
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryDeposits.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryDeposits(
    _ request: Sentinel_Deposit_V1_QueryDepositsRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sentinel_Deposit_V1_QueryDepositsRequest, Sentinel_Deposit_V1_QueryDepositsResponse> {
    return self.makeUnaryCall(
      path: "/sentinel.deposit.v1.QueryService/QueryDeposits",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryDepositsInterceptors() ?? []
    )
  }

  /// Unary call to QueryDeposit
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryDeposit.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryDeposit(
    _ request: Sentinel_Deposit_V1_QueryDepositRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sentinel_Deposit_V1_QueryDepositRequest, Sentinel_Deposit_V1_QueryDepositResponse> {
    return self.makeUnaryCall(
      path: "/sentinel.deposit.v1.QueryService/QueryDeposit",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryDepositInterceptors() ?? []
    )
  }
}

internal protocol Sentinel_Deposit_V1_QueryServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'queryDeposits'.
  func makeQueryDepositsInterceptors() -> [ClientInterceptor<Sentinel_Deposit_V1_QueryDepositsRequest, Sentinel_Deposit_V1_QueryDepositsResponse>]

  /// - Returns: Interceptors to use when invoking 'queryDeposit'.
  func makeQueryDepositInterceptors() -> [ClientInterceptor<Sentinel_Deposit_V1_QueryDepositRequest, Sentinel_Deposit_V1_QueryDepositResponse>]
}

internal final class Sentinel_Deposit_V1_QueryServiceClient: Sentinel_Deposit_V1_QueryServiceClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Sentinel_Deposit_V1_QueryServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the sentinel.deposit.v1.QueryService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Sentinel_Deposit_V1_QueryServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Sentinel_Deposit_V1_QueryServiceProvider: CallHandlerProvider {
  var interceptors: Sentinel_Deposit_V1_QueryServiceServerInterceptorFactoryProtocol? { get }

  func queryDeposits(request: Sentinel_Deposit_V1_QueryDepositsRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Sentinel_Deposit_V1_QueryDepositsResponse>

  func queryDeposit(request: Sentinel_Deposit_V1_QueryDepositRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Sentinel_Deposit_V1_QueryDepositResponse>
}

extension Sentinel_Deposit_V1_QueryServiceProvider {
  internal var serviceName: Substring { return "sentinel.deposit.v1.QueryService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "QueryDeposits":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sentinel_Deposit_V1_QueryDepositsRequest>(),
        responseSerializer: ProtobufSerializer<Sentinel_Deposit_V1_QueryDepositsResponse>(),
        interceptors: self.interceptors?.makeQueryDepositsInterceptors() ?? [],
        userFunction: self.queryDeposits(request:context:)
      )

    case "QueryDeposit":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sentinel_Deposit_V1_QueryDepositRequest>(),
        responseSerializer: ProtobufSerializer<Sentinel_Deposit_V1_QueryDepositResponse>(),
        interceptors: self.interceptors?.makeQueryDepositInterceptors() ?? [],
        userFunction: self.queryDeposit(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Sentinel_Deposit_V1_QueryServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'queryDeposits'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryDepositsInterceptors() -> [ServerInterceptor<Sentinel_Deposit_V1_QueryDepositsRequest, Sentinel_Deposit_V1_QueryDepositsResponse>]

  /// - Returns: Interceptors to use when handling 'queryDeposit'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryDepositInterceptors() -> [ServerInterceptor<Sentinel_Deposit_V1_QueryDepositRequest, Sentinel_Deposit_V1_QueryDepositResponse>]
}
