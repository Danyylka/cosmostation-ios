//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: iris_mod/random/tx.proto
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


/// Msg defines the oracle Msg service
///
/// Usage: instantiate `Irismod_Random_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Irismod_Random_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol? { get }

  func requestRandom(
    _ request: Irismod_Random_MsgRequestRandom,
    callOptions: CallOptions?
  ) -> UnaryCall<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse>
}

extension Irismod_Random_MsgClientProtocol {
  internal var serviceName: String {
    return "irismod.random.Msg"
  }

  /// RequestRandom defines a method for requesting a new random number
  ///
  /// - Parameters:
  ///   - request: Request to send to RequestRandom.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func requestRandom(
    _ request: Irismod_Random_MsgRequestRandom,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse> {
    return self.makeUnaryCall(
      path: "/irismod.random.Msg/RequestRandom",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeRequestRandomInterceptors() ?? []
    )
  }
}

internal protocol Irismod_Random_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'requestRandom'.
  func makeRequestRandomInterceptors() -> [ClientInterceptor<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse>]
}

internal final class Irismod_Random_MsgClient: Irismod_Random_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the irismod.random.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Irismod_Random_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the oracle Msg service
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Irismod_Random_MsgProvider: CallHandlerProvider {
  var interceptors: Irismod_Random_MsgServerInterceptorFactoryProtocol? { get }

  /// RequestRandom defines a method for requesting a new random number
  func requestRandom(request: Irismod_Random_MsgRequestRandom, context: StatusOnlyCallContext) -> EventLoopFuture<Irismod_Random_MsgRequestRandomResponse>
}

extension Irismod_Random_MsgProvider {
  internal var serviceName: Substring { return "irismod.random.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "RequestRandom":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Irismod_Random_MsgRequestRandom>(),
        responseSerializer: ProtobufSerializer<Irismod_Random_MsgRequestRandomResponse>(),
        interceptors: self.interceptors?.makeRequestRandomInterceptors() ?? [],
        userFunction: self.requestRandom(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Irismod_Random_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'requestRandom'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeRequestRandomInterceptors() -> [ServerInterceptor<Irismod_Random_MsgRequestRandom, Irismod_Random_MsgRequestRandomResponse>]
}
