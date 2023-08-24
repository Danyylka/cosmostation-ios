//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: cosmos/base/node/v1beta1/query.proto
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
import NIOConcurrencyHelpers
import SwiftProtobuf


/// Service defines the gRPC querier service for node related queries.
///
/// Usage: instantiate `Cosmos_Base_Node_V1beta1_ServiceClient`, then call methods of this protocol to make API calls.
internal protocol Cosmos_Base_Node_V1beta1_ServiceClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol? { get }

  func config(
    _ request: Cosmos_Base_Node_V1beta1_ConfigRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Base_Node_V1beta1_ConfigRequest, Cosmos_Base_Node_V1beta1_ConfigResponse>

  func status(
    _ request: Cosmos_Base_Node_V1beta1_StatusRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Cosmos_Base_Node_V1beta1_StatusRequest, Cosmos_Base_Node_V1beta1_StatusResponse>
}

extension Cosmos_Base_Node_V1beta1_ServiceClientProtocol {
  internal var serviceName: String {
    return "cosmos.base.node.v1beta1.Service"
  }

  /// Config queries for the operator configuration.
  ///
  /// - Parameters:
  ///   - request: Request to send to Config.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func config(
    _ request: Cosmos_Base_Node_V1beta1_ConfigRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Base_Node_V1beta1_ConfigRequest, Cosmos_Base_Node_V1beta1_ConfigResponse> {
    return self.makeUnaryCall(
      path: Cosmos_Base_Node_V1beta1_ServiceClientMetadata.Methods.config.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConfigInterceptors() ?? []
    )
  }

  /// Status queries for the node status.
  ///
  /// - Parameters:
  ///   - request: Request to send to Status.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func status(
    _ request: Cosmos_Base_Node_V1beta1_StatusRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Cosmos_Base_Node_V1beta1_StatusRequest, Cosmos_Base_Node_V1beta1_StatusResponse> {
    return self.makeUnaryCall(
      path: Cosmos_Base_Node_V1beta1_ServiceClientMetadata.Methods.status.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeStatusInterceptors() ?? []
    )
  }
}

@available(*, deprecated)
extension Cosmos_Base_Node_V1beta1_ServiceClient: @unchecked Sendable {}

@available(*, deprecated, renamed: "Cosmos_Base_Node_V1beta1_ServiceNIOClient")
internal final class Cosmos_Base_Node_V1beta1_ServiceClient: Cosmos_Base_Node_V1beta1_ServiceClientProtocol {
  private let lock = Lock()
  private var _defaultCallOptions: CallOptions
  private var _interceptors: Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol?
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions {
    get { self.lock.withLock { return self._defaultCallOptions } }
    set { self.lock.withLockVoid { self._defaultCallOptions = newValue } }
  }
  internal var interceptors: Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol? {
    get { self.lock.withLock { return self._interceptors } }
    set { self.lock.withLockVoid { self._interceptors = newValue } }
  }

  /// Creates a client for the cosmos.base.node.v1beta1.Service service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self._defaultCallOptions = defaultCallOptions
    self._interceptors = interceptors
  }
}

internal struct Cosmos_Base_Node_V1beta1_ServiceNIOClient: Cosmos_Base_Node_V1beta1_ServiceClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol?

  /// Creates a client for the cosmos.base.node.v1beta1.Service service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Service defines the gRPC querier service for node related queries.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Cosmos_Base_Node_V1beta1_ServiceAsyncClientProtocol: GRPCClient {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol? { get }

  func makeConfigCall(
    _ request: Cosmos_Base_Node_V1beta1_ConfigRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Cosmos_Base_Node_V1beta1_ConfigRequest, Cosmos_Base_Node_V1beta1_ConfigResponse>

  func makeStatusCall(
    _ request: Cosmos_Base_Node_V1beta1_StatusRequest,
    callOptions: CallOptions?
  ) -> GRPCAsyncUnaryCall<Cosmos_Base_Node_V1beta1_StatusRequest, Cosmos_Base_Node_V1beta1_StatusResponse>
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Cosmos_Base_Node_V1beta1_ServiceAsyncClientProtocol {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Cosmos_Base_Node_V1beta1_ServiceClientMetadata.serviceDescriptor
  }

  internal var interceptors: Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol? {
    return nil
  }

  internal func makeConfigCall(
    _ request: Cosmos_Base_Node_V1beta1_ConfigRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Cosmos_Base_Node_V1beta1_ConfigRequest, Cosmos_Base_Node_V1beta1_ConfigResponse> {
    return self.makeAsyncUnaryCall(
      path: Cosmos_Base_Node_V1beta1_ServiceClientMetadata.Methods.config.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConfigInterceptors() ?? []
    )
  }

  internal func makeStatusCall(
    _ request: Cosmos_Base_Node_V1beta1_StatusRequest,
    callOptions: CallOptions? = nil
  ) -> GRPCAsyncUnaryCall<Cosmos_Base_Node_V1beta1_StatusRequest, Cosmos_Base_Node_V1beta1_StatusResponse> {
    return self.makeAsyncUnaryCall(
      path: Cosmos_Base_Node_V1beta1_ServiceClientMetadata.Methods.status.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeStatusInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Cosmos_Base_Node_V1beta1_ServiceAsyncClientProtocol {
  internal func config(
    _ request: Cosmos_Base_Node_V1beta1_ConfigRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Cosmos_Base_Node_V1beta1_ConfigResponse {
    return try await self.performAsyncUnaryCall(
      path: Cosmos_Base_Node_V1beta1_ServiceClientMetadata.Methods.config.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeConfigInterceptors() ?? []
    )
  }

  internal func status(
    _ request: Cosmos_Base_Node_V1beta1_StatusRequest,
    callOptions: CallOptions? = nil
  ) async throws -> Cosmos_Base_Node_V1beta1_StatusResponse {
    return try await self.performAsyncUnaryCall(
      path: Cosmos_Base_Node_V1beta1_ServiceClientMetadata.Methods.status.path,
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeStatusInterceptors() ?? []
    )
  }
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal struct Cosmos_Base_Node_V1beta1_ServiceAsyncClient: Cosmos_Base_Node_V1beta1_ServiceAsyncClientProtocol {
  internal var channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol?

  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

internal protocol Cosmos_Base_Node_V1beta1_ServiceClientInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when invoking 'config'.
  func makeConfigInterceptors() -> [ClientInterceptor<Cosmos_Base_Node_V1beta1_ConfigRequest, Cosmos_Base_Node_V1beta1_ConfigResponse>]

  /// - Returns: Interceptors to use when invoking 'status'.
  func makeStatusInterceptors() -> [ClientInterceptor<Cosmos_Base_Node_V1beta1_StatusRequest, Cosmos_Base_Node_V1beta1_StatusResponse>]
}

internal enum Cosmos_Base_Node_V1beta1_ServiceClientMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Service",
    fullName: "cosmos.base.node.v1beta1.Service",
    methods: [
      Cosmos_Base_Node_V1beta1_ServiceClientMetadata.Methods.config,
      Cosmos_Base_Node_V1beta1_ServiceClientMetadata.Methods.status,
    ]
  )

  internal enum Methods {
    internal static let config = GRPCMethodDescriptor(
      name: "Config",
      path: "/cosmos.base.node.v1beta1.Service/Config",
      type: GRPCCallType.unary
    )

    internal static let status = GRPCMethodDescriptor(
      name: "Status",
      path: "/cosmos.base.node.v1beta1.Service/Status",
      type: GRPCCallType.unary
    )
  }
}

/// Service defines the gRPC querier service for node related queries.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Cosmos_Base_Node_V1beta1_ServiceProvider: CallHandlerProvider {
  var interceptors: Cosmos_Base_Node_V1beta1_ServiceServerInterceptorFactoryProtocol? { get }

  /// Config queries for the operator configuration.
  func config(request: Cosmos_Base_Node_V1beta1_ConfigRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Base_Node_V1beta1_ConfigResponse>

  /// Status queries for the node status.
  func status(request: Cosmos_Base_Node_V1beta1_StatusRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Cosmos_Base_Node_V1beta1_StatusResponse>
}

extension Cosmos_Base_Node_V1beta1_ServiceProvider {
  internal var serviceName: Substring {
    return Cosmos_Base_Node_V1beta1_ServiceServerMetadata.serviceDescriptor.fullName[...]
  }

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
        requestDeserializer: ProtobufDeserializer<Cosmos_Base_Node_V1beta1_ConfigRequest>(),
        responseSerializer: ProtobufSerializer<Cosmos_Base_Node_V1beta1_ConfigResponse>(),
        interceptors: self.interceptors?.makeConfigInterceptors() ?? [],
        userFunction: self.config(request:context:)
      )

    case "Status":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Cosmos_Base_Node_V1beta1_StatusRequest>(),
        responseSerializer: ProtobufSerializer<Cosmos_Base_Node_V1beta1_StatusResponse>(),
        interceptors: self.interceptors?.makeStatusInterceptors() ?? [],
        userFunction: self.status(request:context:)
      )

    default:
      return nil
    }
  }
}

/// Service defines the gRPC querier service for node related queries.
///
/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Cosmos_Base_Node_V1beta1_ServiceAsyncProvider: CallHandlerProvider {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Cosmos_Base_Node_V1beta1_ServiceServerInterceptorFactoryProtocol? { get }

  /// Config queries for the operator configuration.
  @Sendable func config(
    request: Cosmos_Base_Node_V1beta1_ConfigRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Cosmos_Base_Node_V1beta1_ConfigResponse

  /// Status queries for the node status.
  @Sendable func status(
    request: Cosmos_Base_Node_V1beta1_StatusRequest,
    context: GRPCAsyncServerCallContext
  ) async throws -> Cosmos_Base_Node_V1beta1_StatusResponse
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Cosmos_Base_Node_V1beta1_ServiceAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Cosmos_Base_Node_V1beta1_ServiceServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Cosmos_Base_Node_V1beta1_ServiceServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Cosmos_Base_Node_V1beta1_ServiceServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "Config":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Cosmos_Base_Node_V1beta1_ConfigRequest>(),
        responseSerializer: ProtobufSerializer<Cosmos_Base_Node_V1beta1_ConfigResponse>(),
        interceptors: self.interceptors?.makeConfigInterceptors() ?? [],
        wrapping: self.config(request:context:)
      )

    case "Status":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Cosmos_Base_Node_V1beta1_StatusRequest>(),
        responseSerializer: ProtobufSerializer<Cosmos_Base_Node_V1beta1_StatusResponse>(),
        interceptors: self.interceptors?.makeStatusInterceptors() ?? [],
        wrapping: self.status(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Cosmos_Base_Node_V1beta1_ServiceServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'config'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeConfigInterceptors() -> [ServerInterceptor<Cosmos_Base_Node_V1beta1_ConfigRequest, Cosmos_Base_Node_V1beta1_ConfigResponse>]

  /// - Returns: Interceptors to use when handling 'status'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeStatusInterceptors() -> [ServerInterceptor<Cosmos_Base_Node_V1beta1_StatusRequest, Cosmos_Base_Node_V1beta1_StatusResponse>]
}

internal enum Cosmos_Base_Node_V1beta1_ServiceServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "Service",
    fullName: "cosmos.base.node.v1beta1.Service",
    methods: [
      Cosmos_Base_Node_V1beta1_ServiceServerMetadata.Methods.config,
      Cosmos_Base_Node_V1beta1_ServiceServerMetadata.Methods.status,
    ]
  )

  internal enum Methods {
    internal static let config = GRPCMethodDescriptor(
      name: "Config",
      path: "/cosmos.base.node.v1beta1.Service/Config",
      type: GRPCCallType.unary
    )

    internal static let status = GRPCMethodDescriptor(
      name: "Status",
      path: "/cosmos.base.node.v1beta1.Service/Status",
      type: GRPCCallType.unary
    )
  }
}