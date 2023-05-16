//
//  LoginCoordinator.swift
//  Foodzilla
//
//  Created by Paweł on 16/05/2023.
//

import UIKit

class LoginCoordinator: Coordiantor {
    
    static func prepare() -> LoginViewController {
        
        let vc = LoginViewController.instantiate()
        vc.model = LoginViewModel()
        return vc
    }
}
