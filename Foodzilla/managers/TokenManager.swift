//
//  TokenManager.swift
//  Foodzilla
//
//  Created by Paweł on 27/05/2023.
//

import UIKit

class CredentialsManager {
    
    private init() { }
    
    public static let shared: CredentialsManager = .init()
    
    // MARK: Token
    
    func saveToken(token: Token) {
        KeychainManager.shared.save(token, service: KeychainData.token.0, account: KeychainData.token.1)
    }
    
    func getToken() -> Token? {
        KeychainManager.shared.read(service: KeychainData.token.0, account: KeychainData.token.1, type: Token.self)
    }
    
    // MARK: User
    
    func saveUser(user: User) {
        KeychainManager.shared.save(user, service: KeychainData.user.0, account: KeychainData.user.1)
    }
    
    func getUser() -> User? {
        KeychainManager.shared.read(service: KeychainData.user.0, account: KeychainData.user.1, type: User.self)
    }
}
