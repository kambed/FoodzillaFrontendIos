//
//  ApolloClient.swift
//  Foodzilla
//
//  Created by Paweł on 15/05/2023.
//

import UIKit
import Apollo

let BASE_URL: StaticString = "http://localhost:8080/graphql"

class TokenInterceptor: ApolloInterceptor {
    
    let token: String
    
    init(token: String) {
        self.token = token
    }
    
    func interceptAsync<Operation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : GraphQLOperation {
            request.addHeader(name: "Authorization", value: "Bearer \(token)")
            chain.proceedAsync(request: request, response: response, completion: completion)
        }
    
}

class NetworkInterceptorsProvider: DefaultInterceptorProvider {
    
    let interceptors: [ApolloInterceptor]
    
    init(interceptors: [ApolloInterceptor], store: ApolloStore) {
        self.interceptors = interceptors
        super.init(store: store)
    }
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        self.interceptors.forEach { interceptor in
            interceptors.insert(interceptor, at: 0)
        }
        return interceptors
    }
}

class ApolloGraphQLClient {
    
    private init() { }
    
    private lazy var apolloClient: ApolloClient = {
        return initWithBearerToken(token: KeychainManager.shared.read(service: KeychainData.token.0, account: KeychainData.token.1, type: Token.self)?.token)
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
    
    // MARK: Util methods
    
    public func initWithBearerToken(token: String?) -> ApolloClient {
        let endpointURL = URL(string: "\(BASE_URL)")!
        let store = ApolloStore()
        let interceptorProvider = NetworkInterceptorsProvider(
            interceptors: [TokenInterceptor(token: token ?? "")],
            store: store
        )
        let networkTransport = RequestChainNetworkTransport(
            interceptorProvider: interceptorProvider, endpointURL: endpointURL
        )
        return ApolloClient(networkTransport: networkTransport, store: store)
    }
    
    public func refreshToken(token: String?) {
        apolloClient = initWithBearerToken(token: token)
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
    
    // MARK: Recipes
    
    public func getRecommendations() async throws -> FoodzillaGraphQL.RecommendationsQuery.Data {
        return try await performQuery(operation: FoodzillaGraphQL.RecommendationsQuery())
    }
}


