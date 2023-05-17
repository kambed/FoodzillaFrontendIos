//
//  ApolloClient.swift
//  Foodzilla
//
//  Created by Paweł on 15/05/2023.
//

import UIKit
import Apollo

struct User: Codable {
    var firstName: String?
    var lastName: String?
    var username: String?
    var password: String?
}

class ApolloGraphQLClient {
    
    private init() { }
    
    private var apolloClient: ApolloClient = {
        let apolloClient = ApolloClient(url: URL(string: "http://localhost:8080/graphql")!)
        return apolloClient
    }()
    
    static let shared: ApolloGraphQLClient = {
        return ApolloGraphQLClient()
    }()
    
    private func performQuery<Operation: GraphQLOperation & GraphQLQuery>(operation: Operation) async throws -> Operation.Data {
        return try await withCheckedThrowingContinuation { continuation in
            apolloClient.fetch(query: operation) { result in
                switch result {
                    case .success(let graphQLResult):
                        if let errors = graphQLResult.errors {
                            continuation.resume(throwing: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "GraphQL Error: \(errors)"]))
                        } else if let data = graphQLResult.data {
                            continuation.resume(returning: data)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                }
            }
        }
    }
    
    private func performMutation<Operation: GraphQLOperation & GraphQLMutation>(operation: Operation) async throws -> Operation.Data {
        return try await withCheckedThrowingContinuation { continuation in
            apolloClient.perform(mutation: operation) { result in
                switch result {
                    case .success(let graphQLResult):
                        if let errors = graphQLResult.errors {
                            continuation.resume(throwing: NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "GraphQL Error: \(errors)"]))
                        } else if let data = graphQLResult.data {
                            continuation.resume(returning: data)
                        }
                    case .failure(let error):
                        continuation.resume(throwing: error)
                }
            }
        }
    }
    
    // MARK: User
    
    public func createUser(user: User) async throws -> FoodzillaGraphQL.CreateMutation.Data {
        guard let firstName = user.firstName, let lastName = user.lastName, let username = user.username, let password = user.password else {
            throw UserError.noRegistrationCredentials
        }
                
        let mutation = FoodzillaGraphQL.CreateMutation(firstname: firstName, lastname: lastName, username: username, password: password)
        return try await performMutation(operation: mutation)
    }
    
    public func loginUser(user: User) async throws -> FoodzillaGraphQL.LoginMutation.Data {
        guard let username = user.username, let password = user.password else {
            throw UserError.noLoginCredentials
        }
        
        let mutation = FoodzillaGraphQL.LoginMutation(username: username, password: password)
        return try await performMutation(operation: mutation)
    }
    
    
    // MARK: Tags
    
    public func getTags() async throws -> FoodzillaGraphQL.TagsQuery.Data {
        return try await performQuery(operation: FoodzillaGraphQL.TagsQuery())
    }
}


