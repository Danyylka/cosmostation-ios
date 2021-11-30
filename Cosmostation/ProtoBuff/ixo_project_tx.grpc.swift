//
// DO NOT EDIT.
//
// Generated by the protocol buffer compiler.
// Source: ixo/project/tx.proto
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


/// Msg defines the project Msg service.
///
/// Usage: instantiate `Project_MsgClient`, then call methods of this protocol to make API calls.
internal protocol Project_MsgClientProtocol: GRPCClient {
  var serviceName: String { get }
  var interceptors: Project_MsgClientInterceptorFactoryProtocol? { get }

  func createProject(
    _ request: Project_MsgCreateProject,
    callOptions: CallOptions?
  ) -> UnaryCall<Project_MsgCreateProject, Project_MsgCreateProjectResponse>

  func updateProjectStatus(
    _ request: Project_MsgUpdateProjectStatus,
    callOptions: CallOptions?
  ) -> UnaryCall<Project_MsgUpdateProjectStatus, Project_MsgUpdateProjectStatusResponse>

  func createAgent(
    _ request: Project_MsgCreateAgent,
    callOptions: CallOptions?
  ) -> UnaryCall<Project_MsgCreateAgent, Project_MsgCreateAgentResponse>

  func updateAgent(
    _ request: Project_MsgUpdateAgent,
    callOptions: CallOptions?
  ) -> UnaryCall<Project_MsgUpdateAgent, Project_MsgUpdateAgentResponse>

  func createClaim(
    _ request: Project_MsgCreateClaim,
    callOptions: CallOptions?
  ) -> UnaryCall<Project_MsgCreateClaim, Project_MsgCreateClaimResponse>

  func createEvaluation(
    _ request: Project_MsgCreateEvaluation,
    callOptions: CallOptions?
  ) -> UnaryCall<Project_MsgCreateEvaluation, Project_MsgCreateEvaluationResponse>

  func withdrawFunds(
    _ request: Project_MsgWithdrawFunds,
    callOptions: CallOptions?
  ) -> UnaryCall<Project_MsgWithdrawFunds, Project_MsgWithdrawFundsResponse>

  func updateProjectDoc(
    _ request: Project_MsgUpdateProjectDoc,
    callOptions: CallOptions?
  ) -> UnaryCall<Project_MsgUpdateProjectDoc, Project_MsgUpdateProjectDocResponse>
}

extension Project_MsgClientProtocol {
  internal var serviceName: String {
    return "project.Msg"
  }

  /// CreateProject defines a method for creating a project.
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateProject.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createProject(
    _ request: Project_MsgCreateProject,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Project_MsgCreateProject, Project_MsgCreateProjectResponse> {
    return self.makeUnaryCall(
      path: "/project.Msg/CreateProject",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateProjectInterceptors() ?? []
    )
  }

  /// UpdateProjectStatus defines a method for updating a project's current status.
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateProjectStatus.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateProjectStatus(
    _ request: Project_MsgUpdateProjectStatus,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Project_MsgUpdateProjectStatus, Project_MsgUpdateProjectStatusResponse> {
    return self.makeUnaryCall(
      path: "/project.Msg/UpdateProjectStatus",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateProjectStatusInterceptors() ?? []
    )
  }

  /// CreateAgent defines a method for creating an agent on a project.
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateAgent.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createAgent(
    _ request: Project_MsgCreateAgent,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Project_MsgCreateAgent, Project_MsgCreateAgentResponse> {
    return self.makeUnaryCall(
      path: "/project.Msg/CreateAgent",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateAgentInterceptors() ?? []
    )
  }

  /// UpdateAgent defines a method for updating an agent on a project.
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateAgent.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateAgent(
    _ request: Project_MsgUpdateAgent,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Project_MsgUpdateAgent, Project_MsgUpdateAgentResponse> {
    return self.makeUnaryCall(
      path: "/project.Msg/UpdateAgent",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateAgentInterceptors() ?? []
    )
  }

  /// CreateClaim defines a method for creating a claim on a project.
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateClaim.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createClaim(
    _ request: Project_MsgCreateClaim,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Project_MsgCreateClaim, Project_MsgCreateClaimResponse> {
    return self.makeUnaryCall(
      path: "/project.Msg/CreateClaim",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateClaimInterceptors() ?? []
    )
  }

  /// CreateEvaluation defines a method for creating an evaluation for a specific claim on a project.
  ///
  /// - Parameters:
  ///   - request: Request to send to CreateEvaluation.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func createEvaluation(
    _ request: Project_MsgCreateEvaluation,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Project_MsgCreateEvaluation, Project_MsgCreateEvaluationResponse> {
    return self.makeUnaryCall(
      path: "/project.Msg/CreateEvaluation",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeCreateEvaluationInterceptors() ?? []
    )
  }

  /// WithdrawFunds defines a method for project agents to withdraw their funds from a project.
  ///
  /// - Parameters:
  ///   - request: Request to send to WithdrawFunds.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func withdrawFunds(
    _ request: Project_MsgWithdrawFunds,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Project_MsgWithdrawFunds, Project_MsgWithdrawFundsResponse> {
    return self.makeUnaryCall(
      path: "/project.Msg/WithdrawFunds",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeWithdrawFundsInterceptors() ?? []
    )
  }

  /// UpdateProjectDoc defines a method for updating a project's data.
  ///
  /// - Parameters:
  ///   - request: Request to send to UpdateProjectDoc.
  ///   - callOptions: Call options.
  /// - Returns: A `UnaryCall` with futures for the metadata, status and response.
  internal func updateProjectDoc(
    _ request: Project_MsgUpdateProjectDoc,
    callOptions: CallOptions? = nil
  ) -> UnaryCall<Project_MsgUpdateProjectDoc, Project_MsgUpdateProjectDocResponse> {
    return self.makeUnaryCall(
      path: "/project.Msg/UpdateProjectDoc",
      request: request,
      callOptions: callOptions ?? self.defaultCallOptions,
      interceptors: self.interceptors?.makeUpdateProjectDocInterceptors() ?? []
    )
  }
}

internal protocol Project_MsgClientInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when invoking 'createProject'.
  func makeCreateProjectInterceptors() -> [ClientInterceptor<Project_MsgCreateProject, Project_MsgCreateProjectResponse>]

  /// - Returns: Interceptors to use when invoking 'updateProjectStatus'.
  func makeUpdateProjectStatusInterceptors() -> [ClientInterceptor<Project_MsgUpdateProjectStatus, Project_MsgUpdateProjectStatusResponse>]

  /// - Returns: Interceptors to use when invoking 'createAgent'.
  func makeCreateAgentInterceptors() -> [ClientInterceptor<Project_MsgCreateAgent, Project_MsgCreateAgentResponse>]

  /// - Returns: Interceptors to use when invoking 'updateAgent'.
  func makeUpdateAgentInterceptors() -> [ClientInterceptor<Project_MsgUpdateAgent, Project_MsgUpdateAgentResponse>]

  /// - Returns: Interceptors to use when invoking 'createClaim'.
  func makeCreateClaimInterceptors() -> [ClientInterceptor<Project_MsgCreateClaim, Project_MsgCreateClaimResponse>]

  /// - Returns: Interceptors to use when invoking 'createEvaluation'.
  func makeCreateEvaluationInterceptors() -> [ClientInterceptor<Project_MsgCreateEvaluation, Project_MsgCreateEvaluationResponse>]

  /// - Returns: Interceptors to use when invoking 'withdrawFunds'.
  func makeWithdrawFundsInterceptors() -> [ClientInterceptor<Project_MsgWithdrawFunds, Project_MsgWithdrawFundsResponse>]

  /// - Returns: Interceptors to use when invoking 'updateProjectDoc'.
  func makeUpdateProjectDocInterceptors() -> [ClientInterceptor<Project_MsgUpdateProjectDoc, Project_MsgUpdateProjectDocResponse>]
}

internal final class Project_MsgClient: Project_MsgClientProtocol {
  internal let channel: GRPCChannel
  internal var defaultCallOptions: CallOptions
  internal var interceptors: Project_MsgClientInterceptorFactoryProtocol?

  /// Creates a client for the project.Msg service.
  ///
  /// - Parameters:
  ///   - channel: `GRPCChannel` to the service host.
  ///   - defaultCallOptions: Options to use for each service call if the user doesn't provide them.
  ///   - interceptors: A factory providing interceptors for each RPC.
  internal init(
    channel: GRPCChannel,
    defaultCallOptions: CallOptions = CallOptions(),
    interceptors: Project_MsgClientInterceptorFactoryProtocol? = nil
  ) {
    self.channel = channel
    self.defaultCallOptions = defaultCallOptions
    self.interceptors = interceptors
  }
}

/// Msg defines the project Msg service.
///
/// To build a server, implement a class that conforms to this protocol.
internal protocol Project_MsgProvider: CallHandlerProvider {
  var interceptors: Project_MsgServerInterceptorFactoryProtocol? { get }

  /// CreateProject defines a method for creating a project.
  func createProject(request: Project_MsgCreateProject, context: StatusOnlyCallContext) -> EventLoopFuture<Project_MsgCreateProjectResponse>

  /// UpdateProjectStatus defines a method for updating a project's current status.
  func updateProjectStatus(request: Project_MsgUpdateProjectStatus, context: StatusOnlyCallContext) -> EventLoopFuture<Project_MsgUpdateProjectStatusResponse>

  /// CreateAgent defines a method for creating an agent on a project.
  func createAgent(request: Project_MsgCreateAgent, context: StatusOnlyCallContext) -> EventLoopFuture<Project_MsgCreateAgentResponse>

  /// UpdateAgent defines a method for updating an agent on a project.
  func updateAgent(request: Project_MsgUpdateAgent, context: StatusOnlyCallContext) -> EventLoopFuture<Project_MsgUpdateAgentResponse>

  /// CreateClaim defines a method for creating a claim on a project.
  func createClaim(request: Project_MsgCreateClaim, context: StatusOnlyCallContext) -> EventLoopFuture<Project_MsgCreateClaimResponse>

  /// CreateEvaluation defines a method for creating an evaluation for a specific claim on a project.
  func createEvaluation(request: Project_MsgCreateEvaluation, context: StatusOnlyCallContext) -> EventLoopFuture<Project_MsgCreateEvaluationResponse>

  /// WithdrawFunds defines a method for project agents to withdraw their funds from a project.
  func withdrawFunds(request: Project_MsgWithdrawFunds, context: StatusOnlyCallContext) -> EventLoopFuture<Project_MsgWithdrawFundsResponse>

  /// UpdateProjectDoc defines a method for updating a project's data.
  func updateProjectDoc(request: Project_MsgUpdateProjectDoc, context: StatusOnlyCallContext) -> EventLoopFuture<Project_MsgUpdateProjectDocResponse>
}

extension Project_MsgProvider {
  internal var serviceName: Substring { return "project.Msg" }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "CreateProject":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Project_MsgCreateProject>(),
        responseSerializer: ProtobufSerializer<Project_MsgCreateProjectResponse>(),
        interceptors: self.interceptors?.makeCreateProjectInterceptors() ?? [],
        userFunction: self.createProject(request:context:)
      )

    case "UpdateProjectStatus":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Project_MsgUpdateProjectStatus>(),
        responseSerializer: ProtobufSerializer<Project_MsgUpdateProjectStatusResponse>(),
        interceptors: self.interceptors?.makeUpdateProjectStatusInterceptors() ?? [],
        userFunction: self.updateProjectStatus(request:context:)
      )

    case "CreateAgent":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Project_MsgCreateAgent>(),
        responseSerializer: ProtobufSerializer<Project_MsgCreateAgentResponse>(),
        interceptors: self.interceptors?.makeCreateAgentInterceptors() ?? [],
        userFunction: self.createAgent(request:context:)
      )

    case "UpdateAgent":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Project_MsgUpdateAgent>(),
        responseSerializer: ProtobufSerializer<Project_MsgUpdateAgentResponse>(),
        interceptors: self.interceptors?.makeUpdateAgentInterceptors() ?? [],
        userFunction: self.updateAgent(request:context:)
      )

    case "CreateClaim":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Project_MsgCreateClaim>(),
        responseSerializer: ProtobufSerializer<Project_MsgCreateClaimResponse>(),
        interceptors: self.interceptors?.makeCreateClaimInterceptors() ?? [],
        userFunction: self.createClaim(request:context:)
      )

    case "CreateEvaluation":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Project_MsgCreateEvaluation>(),
        responseSerializer: ProtobufSerializer<Project_MsgCreateEvaluationResponse>(),
        interceptors: self.interceptors?.makeCreateEvaluationInterceptors() ?? [],
        userFunction: self.createEvaluation(request:context:)
      )

    case "WithdrawFunds":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Project_MsgWithdrawFunds>(),
        responseSerializer: ProtobufSerializer<Project_MsgWithdrawFundsResponse>(),
        interceptors: self.interceptors?.makeWithdrawFundsInterceptors() ?? [],
        userFunction: self.withdrawFunds(request:context:)
      )

    case "UpdateProjectDoc":
      return UnaryServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Project_MsgUpdateProjectDoc>(),
        responseSerializer: ProtobufSerializer<Project_MsgUpdateProjectDocResponse>(),
        interceptors: self.interceptors?.makeUpdateProjectDocInterceptors() ?? [],
        userFunction: self.updateProjectDoc(request:context:)
      )

    default:
      return nil
    }
  }
}

internal protocol Project_MsgServerInterceptorFactoryProtocol {

  /// - Returns: Interceptors to use when handling 'createProject'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreateProjectInterceptors() -> [ServerInterceptor<Project_MsgCreateProject, Project_MsgCreateProjectResponse>]

  /// - Returns: Interceptors to use when handling 'updateProjectStatus'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateProjectStatusInterceptors() -> [ServerInterceptor<Project_MsgUpdateProjectStatus, Project_MsgUpdateProjectStatusResponse>]

  /// - Returns: Interceptors to use when handling 'createAgent'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreateAgentInterceptors() -> [ServerInterceptor<Project_MsgCreateAgent, Project_MsgCreateAgentResponse>]

  /// - Returns: Interceptors to use when handling 'updateAgent'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateAgentInterceptors() -> [ServerInterceptor<Project_MsgUpdateAgent, Project_MsgUpdateAgentResponse>]

  /// - Returns: Interceptors to use when handling 'createClaim'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreateClaimInterceptors() -> [ServerInterceptor<Project_MsgCreateClaim, Project_MsgCreateClaimResponse>]

  /// - Returns: Interceptors to use when handling 'createEvaluation'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeCreateEvaluationInterceptors() -> [ServerInterceptor<Project_MsgCreateEvaluation, Project_MsgCreateEvaluationResponse>]

  /// - Returns: Interceptors to use when handling 'withdrawFunds'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeWithdrawFundsInterceptors() -> [ServerInterceptor<Project_MsgWithdrawFunds, Project_MsgWithdrawFundsResponse>]

  /// - Returns: Interceptors to use when handling 'updateProjectDoc'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeUpdateProjectDocInterceptors() -> [ServerInterceptor<Project_MsgUpdateProjectDoc, Project_MsgUpdateProjectDocResponse>]
}
