//
//  RegisterViewModel.swift
//  Foodzilla
//
//  Created by Paweł on 16/05/2023.
//

import UIKit

class RegisterViewModel {
    
    func register(user: User, confirmPassword: String) {
        Task {
            do {
                if user.password != confirmPassword {
                    throw RegistrationError.passwordDontMatch
                }
                
                let reg = try await ApolloGraphQLClient.shared.createUser(user: user)
                let creds = try await ApolloGraphQLClient.shared.loginUser(user: user)
                ApolloGraphQLClient.shared.refreshToken(token: creds.login?.token)
                AlertManager.shared.showSuccess(message: "You have successfully created your account!")
                DispatchQueue.main.async {
                    UIApplication.shared.sceneDelegate?.changeRootViewController(viewController: ContainerCoordinator.prepare())
                }
            } catch let err {
                AlertManager.shared.showError(message: err.localizedDescription)
            }
        }
    }
}
