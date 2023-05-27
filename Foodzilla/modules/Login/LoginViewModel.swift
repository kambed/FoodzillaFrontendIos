//
//  LoginViewModel.swift
//  Foodzilla
//
//  Created by Paweł on 16/05/2023.
//

import UIKit

class LoginViewModel {
    
    func login() {
        Task {
            let creds = try await ApolloGraphQLClient.shared.loginUser(user: User(username: "username123", password: "Password123!"))
            ApolloGraphQLClient.shared.refreshToken(token: creds.login?.token)
        }
    }
}
