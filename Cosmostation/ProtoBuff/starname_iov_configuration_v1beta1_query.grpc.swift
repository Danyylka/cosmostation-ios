//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: starname/iov/configuration/v1beta1/query.proto
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


/// Query provides defines the gRPC querier service.
///
/// Usage: instantiate `Starnamed_X_Configuration_V1beta1_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Starnamed_X_Configuration_V1beta1_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol? { get }

  func config(
    _ request: Starnamed_X_Configuration_V1beta1_QueryConfigRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Starnamed_X_Configuration_V1beta1_QueryConfigRequest, Starnamed_X_Configuration_V1beta1_QueryConfigResponse>

  func fees(
    _ request: Starnamed_X_Configuration_V1beta1_QueryFeesRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Starnamed_X_Configuration_V1beta1_QueryFeesRequest, Starnamed_X_Configuration_V1beta1_QueryFeesResponse>
}

extension Starnamed_X_Configuration_V1beta1_QueryClientProtocol {
  internal var serviceName: String {
    return "starnamed.x.configuration.v1beta1.Query"
  }

  /// Config gets starname configuration.
  ///
  /// - Parameters:
  ///   - request: Request to send to Config.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func config(
    _ request: Starnamed_X_Configuration_V1beta1_QueryConfigRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Starnamed_X_Configuration_V1beta1_QueryConfigRequest, Starnamed_X_Configuration_V1beta1_QueryConfigResponse> {
    return self.makeUnaryCall(
      path: "/starnamed.x.configuration.v1beta1.Query/Config",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConfigInterceptors() ?? []
    )
  }

  /// Fees gets starname product fees.
  ///
  /// - Parameters:
  ///   - request: Request to send to Fees.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func fees(
    _ request: Starnamed_X_Configuration_V1beta1_QueryFeesRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Starnamed_X_Configuration_V1beta1_QueryFeesRequest, Starnamed_X_Configuration_V1beta1_QueryFeesResponse> {
    return self.makeUnaryCall(
      path: "/starnamed.x.configuration.v1beta1.Query/Fees",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeFeesInterceptors() ?? []
    )
  }
}

internal protocol Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'config'.
  func makeConfigInterceptors() -> [ClientInterceptor<Starnamed_X_Configuration_V1beta1_QueryConfigRequest, Starnamed_X_Configuration_V1beta1_QueryConfigResponse>]

  /// - Returns: Interceptors to use when invoking 'fees'.
  func makeFeesInterceptors() -> [ClientInterceptor<Starnamed_X_Configuration_V1beta1_QueryFeesRequest, Starnamed_X_Configuration_V1beta1_QueryFeesResponse>]
}

internal final class Starnamed_X_Configuration_V1beta1_QueryClient: Starnamed_X_Configuration_V1beta1_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the starnamed.x.configuration.v1beta1.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Starnamed_X_Configuration_V1beta1_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query provides defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Starnamed_X_Configuration_V1beta1_QueryProvider: CallHandlerProvider {
  var interceptors: Starnamed_X_Configuration_V1beta1_QueryServerInterceptorFactoryProtocol? { get }

  /// Config gets starname configuration.
  func config(request: Starnamed_X_Configuration_V1beta1_QueryConfigRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Starnamed_X_Configuration_V1beta1_QueryConfigResponse>

  /// Fees gets starname product fees.
  func fees(request: Starnamed_X_Configuration_V1beta1_QueryFeesRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Starnamed_X_Configuration_V1beta1_QueryFeesResponse>
}

extension Starnamed_X_Configuration_V1beta1_QueryProvider {
  internal var serviceName: Substring { return "starnamed.x.configuration.v1beta1.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Config":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Configuration_V1beta1_QueryConfigRequest>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Configuration_V1beta1_QueryConfigResponse>(),
        interceptors: self.interceptors?.makeConfigInterceptors() ?? [],
        userFunction: self.config(request:context:)
      )

    case "Fees":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Starnamed_X_Configuration_V1beta1_QueryFeesRequest>(),
        responseSerializer: ProtobufSerializer<Starnamed_X_Configuration_V1beta1_QueryFeesResponse>(),
        interceptors: self.interceptors?.makeFeesInterceptors() ?? [],
        userFunction: self.fees(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Starnamed_X_Configuration_V1beta1_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'config'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeConfigInterceptors() -> [ServerInterceptor<Starnamed_X_Configuration_V1beta1_QueryConfigRequest, Starnamed_X_Configuration_V1beta1_QueryConfigResponse>]

  /// - Returns: Interceptors to use when handling 'fees'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeFeesInterceptors() -> [ServerInterceptor<Starnamed_X_Configuration_V1beta1_QueryFeesRequest, Starnamed_X_Configuration_V1beta1_QueryFeesResponse>]
}
