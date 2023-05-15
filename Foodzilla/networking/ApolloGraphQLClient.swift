//
//  ApolloClient.swift
//  Foodzilla
//
//  Created by Paweł on 15/05/2023.
//

import UIKit
import Apollo

class ApolloGraphQLClient {
    
    private init() { }
    
    private var apolloClient: ApolloClient = {
        let apolloClient = ApolloClient(url: URL(string: "http://localhost:4000/graphql")!)
        return apolloClient
    }()
    
    var shared: ApolloGraphQLClient = {
        return ApolloGraphQLClient()
    }()
    
    public func getTags(completion: @escaping (Result<FoodzillaGraphQL.TagsQuery.Data, GraphQLError>) -> Void) {
        apolloClient.fetch(query: FoodzillaGraphQL.TagsQuery()) { result in
            guard let data = try? result.get().data else { return completion(.failure(GraphQLError.couldntFetchData)) }
            completion(.success(data))
        }
    }
}


