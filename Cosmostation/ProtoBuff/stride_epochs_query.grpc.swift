//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: stride/epochs/query.proto
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


/// Query defines the gRPC querier service.
///
/// Usage: instantiate `Stride_Epochs_QueryClient`, then call methods of this protocol to make API calls.
internal protocol Stride_Epochs_QueryClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Stride_Epochs_QueryClientInterceptorFactoryProtocol? { get }

  func epochInfos(
    _ request: Stride_Epochs_QueryEpochsInfoRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Stride_Epochs_QueryEpochsInfoRequest, Stride_Epochs_QueryEpochsInfoResponse>

  func currentEpoch(
    _ request: Stride_Epochs_QueryCurrentEpochRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Stride_Epochs_QueryCurrentEpochRequest, Stride_Epochs_QueryCurrentEpochResponse>

  func epochInfo(
    _ request: Stride_Epochs_QueryEpochInfoRequest,
    callOptions: CallOptions?
  ) -> UnaryCall<Stride_Epochs_QueryEpochInfoRequest, Stride_Epochs_QueryEpochInfoResponse>
}

extension Stride_Epochs_QueryClientProtocol {
  internal var serviceName: String {
    return "stride.epochs.Query"
  }

  /// EpochInfos provide running epochInfos
  ///
  /// - Parameters:
  ///   - request: Request to send to EpochInfos.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func epochInfos(
    _ request: Stride_Epochs_QueryEpochsInfoRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Stride_Epochs_QueryEpochsInfoRequest, Stride_Epochs_QueryEpochsInfoResponse> {
    return self.makeUnaryCall(
      path: "/stride.epochs.Query/EpochInfos",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEpochInfosInterceptors() ?? []
    )
  }

  /// CurrentEpoch provide current epoch of specified identifier
  ///
  /// - Parameters:
  ///   - request: Request to send to CurrentEpoch.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func currentEpoch(
    _ request: Stride_Epochs_QueryCurrentEpochRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Stride_Epochs_QueryCurrentEpochRequest, Stride_Epochs_QueryCurrentEpochResponse> {
    return self.makeUnaryCall(
      path: "/stride.epochs.Query/CurrentEpoch",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCurrentEpochInterceptors() ?? []
    )
  }

  /// CurrentEpoch provide current epoch of specified identifier
  ///
  /// - Parameters:
  ///   - request: Request to send to EpochInfo.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func epochInfo(
    _ request: Stride_Epochs_QueryEpochInfoRequest,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Stride_Epochs_QueryEpochInfoRequest, Stride_Epochs_QueryEpochInfoResponse> {
    return self.makeUnaryCall(
      path: "/stride.epochs.Query/EpochInfo",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeEpochInfoInterceptors() ?? []
    )
  }
}

internal protocol Stride_Epochs_QueryClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'epochInfos'.
  func makeEpochInfosInterceptors() -> [ClientInterceptor<Stride_Epochs_QueryEpochsInfoRequest, Stride_Epochs_QueryEpochsInfoResponse>]

  /// - Returns: Interceptors to use when invoking 'currentEpoch'.
  func makeCurrentEpochInterceptors() -> [ClientInterceptor<Stride_Epochs_QueryCurrentEpochRequest, Stride_Epochs_QueryCurrentEpochResponse>]

  /// - Returns: Interceptors to use when invoking 'epochInfo'.
  func makeEpochInfoInterceptors() -> [ClientInterceptor<Stride_Epochs_QueryEpochInfoRequest, Stride_Epochs_QueryEpochInfoResponse>]
}

internal final class Stride_Epochs_QueryClient: Stride_Epochs_QueryClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Stride_Epochs_QueryClientInterceptorFactoryProtocol?

  /// Creates a client for the stride.epochs.Query service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Stride_Epochs_QueryClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Query defines the gRPC querier service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Stride_Epochs_QueryProvider: CallHandlerProvider {
  var interceptors: Stride_Epochs_QueryServerInterceptorFactoryProtocol? { get }

  /// EpochInfos provide running epochInfos
  func epochInfos(request: Stride_Epochs_QueryEpochsInfoRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Stride_Epochs_QueryEpochsInfoResponse>

  /// CurrentEpoch provide current epoch of specified identifier
  func currentEpoch(request: Stride_Epochs_QueryCurrentEpochRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Stride_Epochs_QueryCurrentEpochResponse>

  /// CurrentEpoch provide current epoch of specified identifier
  func epochInfo(request: Stride_Epochs_QueryEpochInfoRequest, context: StatusOnlyCallContext) -> EventLoopFuture<Stride_Epochs_QueryEpochInfoResponse>
}

extension Stride_Epochs_QueryProvider {
  internal var serviceName: Substring { return "stride.epochs.Query" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "EpochInfos":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Stride_Epochs_QueryEpochsInfoRequest>(),
        responseSerializer: ProtobufSerializer<Stride_Epochs_QueryEpochsInfoResponse>(),
        interceptors: self.interceptors?.makeEpochInfosInterceptors() ?? [],
        userFunction: self.epochInfos(request:context:)
      )

    case "CurrentEpoch":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Stride_Epochs_QueryCurrentEpochRequest>(),
        responseSerializer: ProtobufSerializer<Stride_Epochs_QueryCurrentEpochResponse>(),
        interceptors: self.interceptors?.makeCurrentEpochInterceptors() ?? [],
        userFunction: self.currentEpoch(request:context:)
      )

    case "EpochInfo":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Stride_Epochs_QueryEpochInfoRequest>(),
        responseSerializer: ProtobufSerializer<Stride_Epochs_QueryEpochInfoResponse>(),
        interceptors: self.interceptors?.makeEpochInfoInterceptors() ?? [],
        userFunction: self.epochInfo(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Stride_Epochs_QueryServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'epochInfos'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeEpochInfosInterceptors() -> [ServerInterceptor<Stride_Epochs_QueryEpochsInfoRequest, Stride_Epochs_QueryEpochsInfoResponse>]

  /// - Returns: Interceptors to use when handling 'currentEpoch'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCurrentEpochInterceptors() -> [ServerInterceptor<Stride_Epochs_QueryCurrentEpochRequest, Stride_Epochs_QueryCurrentEpochResponse>]

  /// - Returns: Interceptors to use when handling 'epochInfo'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeEpochInfoInterceptors() -> [ServerInterceptor<Stride_Epochs_QueryEpochInfoRequest, Stride_Epochs_QueryEpochInfoResponse>]
}
