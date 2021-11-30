//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: sentinel/plan/v1/querier.proto
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


/// Usage: instantiate `Sentinel_Plan_V1_QueryServiceClient`, then call methods of this protocol to make API calls.
internal protocol Sentinel_Plan_V1_QueryServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Sentinel_Plan_V1_QueryServiceClientInterceptorFactoryProtocol? { get }

  func queryPlans(
    _ request: Sentinel_Plan_V1_QueryPlansRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Sentinel_Plan_V1_QueryPlansRequest, Sentinel_Plan_V1_QueryPlansResponse>

  func queryPlansForProvider(
    _ request: Sentinel_Plan_V1_QueryPlansForProviderRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Sentinel_Plan_V1_QueryPlansForProviderRequest, Sentinel_Plan_V1_QueryPlansForProviderResponse>

  func queryPlan(
    _ request: Sentinel_Plan_V1_QueryPlanRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Sentinel_Plan_V1_QueryPlanRequest, Sentinel_Plan_V1_QueryPlanResponse>

  func queryNodesForPlan(
    _ request: Sentinel_Plan_V1_QueryNodesForPlanRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Sentinel_Plan_V1_QueryNodesForPlanRequest, Sentinel_Plan_V1_QueryNodesForPlanResponse>
}

extension Sentinel_Plan_V1_QueryServiceClientProtocol {
  internal var serviceName: String {
    return "sentinel.plan.v1.QueryService"
  }

  /// Unary call to QueryPlans
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryPlans.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryPlans(
    _ request: Sentinel_Plan_V1_QueryPlansRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sentinel_Plan_V1_QueryPlansRequest, Sentinel_Plan_V1_QueryPlansResponse> {
    return self.makeUnaryCall(
      path: "/sentinel.plan.v1.QueryService/QueryPlans",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryPlansInterceptors() ?? []
    )
  }

  /// Unary call to QueryPlansForProvider
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryPlansForProvider.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryPlansForProvider(
    _ request: Sentinel_Plan_V1_QueryPlansForProviderRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sentinel_Plan_V1_QueryPlansForProviderRequest, Sentinel_Plan_V1_QueryPlansForProviderResponse> {
    return self.makeUnaryCall(
      path: "/sentinel.plan.v1.QueryService/QueryPlansForProvider",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryPlansForProviderInterceptors() ?? []
    )
  }

  /// Unary call to QueryPlan
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryPlan.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryPlan(
    _ request: Sentinel_Plan_V1_QueryPlanRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sentinel_Plan_V1_QueryPlanRequest, Sentinel_Plan_V1_QueryPlanResponse> {
    return self.makeUnaryCall(
      path: "/sentinel.plan.v1.QueryService/QueryPlan",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryPlanInterceptors() ?? []
    )
  }

  /// Unary call to QueryNodesForPlan
  ///
  /// - Parameters:
  ///   - request: Request to send to QueryNodesForPlan.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func queryNodesForPlan(
    _ request: Sentinel_Plan_V1_QueryNodesForPlanRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Sentinel_Plan_V1_QueryNodesForPlanRequest, Sentinel_Plan_V1_QueryNodesForPlanResponse> {
    return self.makeUnaryCall(
      path: "/sentinel.plan.v1.QueryService/QueryNodesForPlan",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeQueryNodesForPlanInterceptors() ?? []
    )
  }
}

internal protocol Sentinel_Plan_V1_QueryServiceClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'queryPlans'.
  func makeQueryPlansInterceptors() -> [ClientInterceptor<Sentinel_Plan_V1_QueryPlansRequest, Sentinel_Plan_V1_QueryPlansResponse>]

  /// - Returns: Interceptors to use when invoking 'queryPlansForProvider'.
  func makeQueryPlansForProviderInterceptors() -> [ClientInterceptor<Sentinel_Plan_V1_QueryPlansForProviderRequest, Sentinel_Plan_V1_QueryPlansForProviderResponse>]

  /// - Returns: Interceptors to use when invoking 'queryPlan'.
  func makeQueryPlanInterceptors() -> [ClientInterceptor<Sentinel_Plan_V1_QueryPlanRequest, Sentinel_Plan_V1_QueryPlanResponse>]

  /// - Returns: Interceptors to use when invoking 'queryNodesForPlan'.
  func makeQueryNodesForPlanInterceptors() -> [ClientInterceptor<Sentinel_Plan_V1_QueryNodesForPlanRequest, Sentinel_Plan_V1_QueryNodesForPlanResponse>]
}

internal final class Sentinel_Plan_V1_QueryServiceClient: Sentinel_Plan_V1_QueryServiceClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Sentinel_Plan_V1_QueryServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the sentinel.plan.v1.QueryService service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Sentinel_Plan_V1_QueryServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// To build a server, implement a class that conforms to this protocol.
internal protocol Sentinel_Plan_V1_QueryServiceProvider: CallHandlerProvider {
  var interceptors: Sentinel_Plan_V1_QueryServiceServerInterceptorFactoryProtocol? { get }

  func queryPlans(request: Sentinel_Plan_V1_QueryPlansRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Sentinel_Plan_V1_QueryPlansResponse>

  func queryPlansForProvider(request: Sentinel_Plan_V1_QueryPlansForProviderRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Sentinel_Plan_V1_QueryPlansForProviderResponse>

  func queryPlan(request: Sentinel_Plan_V1_QueryPlanRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Sentinel_Plan_V1_QueryPlanResponse>

  func queryNodesForPlan(request: Sentinel_Plan_V1_QueryNodesForPlanRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Sentinel_Plan_V1_QueryNodesForPlanResponse>
}

extension Sentinel_Plan_V1_QueryServiceProvider {
  internal var serviceName: Substring { return "sentinel.plan.v1.QueryService" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "QueryPlans":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sentinel_Plan_V1_QueryPlansRequest>(),
        responseSerializer: ProtobufSerializer<Sentinel_Plan_V1_QueryPlansResponse>(),
        interceptors: self.interceptors?.makeQueryPlansInterceptors() ?? [],
        userFunction: self.queryPlans(request:context:)
      )

    case "QueryPlansForProvider":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sentinel_Plan_V1_QueryPlansForProviderRequest>(),
        responseSerializer: ProtobufSerializer<Sentinel_Plan_V1_QueryPlansForProviderResponse>(),
        interceptors: self.interceptors?.makeQueryPlansForProviderInterceptors() ?? [],
        userFunction: self.queryPlansForProvider(request:context:)
      )

    case "QueryPlan":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sentinel_Plan_V1_QueryPlanRequest>(),
        responseSerializer: ProtobufSerializer<Sentinel_Plan_V1_QueryPlanResponse>(),
        interceptors: self.interceptors?.makeQueryPlanInterceptors() ?? [],
        userFunction: self.queryPlan(request:context:)
      )

    case "QueryNodesForPlan":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Sentinel_Plan_V1_QueryNodesForPlanRequest>(),
        responseSerializer: ProtobufSerializer<Sentinel_Plan_V1_QueryNodesForPlanResponse>(),
        interceptors: self.interceptors?.makeQueryNodesForPlanInterceptors() ?? [],
        userFunction: self.queryNodesForPlan(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Sentinel_Plan_V1_QueryServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'queryPlans'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryPlansInterceptors() -> [ServerInterceptor<Sentinel_Plan_V1_QueryPlansRequest, Sentinel_Plan_V1_QueryPlansResponse>]

  /// - Returns: Interceptors to use when handling 'queryPlansForProvider'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryPlansForProviderInterceptors() -> [ServerInterceptor<Sentinel_Plan_V1_QueryPlansForProviderRequest, Sentinel_Plan_V1_QueryPlansForProviderResponse>]

  /// - Returns: Interceptors to use when handling 'queryPlan'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryPlanInterceptors() -> [ServerInterceptor<Sentinel_Plan_V1_QueryPlanRequest, Sentinel_Plan_V1_QueryPlanResponse>]

  /// - Returns: Interceptors to use when handling 'queryNodesForPlan'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeQueryNodesForPlanInterceptors() -> [ServerInterceptor<Sentinel_Plan_V1_QueryNodesForPlanRequest, Sentinel_Plan_V1_QueryNodesForPlanResponse>]
}
