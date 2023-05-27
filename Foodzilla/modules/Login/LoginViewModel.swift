//
//  LoginViewModel.swift
//  Foodzilla
//
//  Created by Paweł on 16/05/2023.
//

import UIKit

class LoginViewModel {
    
    func login(user: User) {
        Task {
            do {
                let creds = try await ApolloGraphQLClient.shared.loginUser(user: User(username: user.username, password: user.password))
                ApolloGraphQLClient.shared.refreshToken(token: creds.login?.token)
                DispatchQueue.main.async {
                    UIApplication.shared.sceneDelegate?.changeRootViewController(viewController: ContainerCoordinator.prepare())
                }
            } catch let err {
                AlertManager.shared.showError(message: err.localizedDescription)
            }
        }
    }
}
