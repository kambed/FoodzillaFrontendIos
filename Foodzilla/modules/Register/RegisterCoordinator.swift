//
//  RegisterCoordinator.swift
//  Foodzilla
//
//  Created by Paweł on 16/05/2023.
//

import UIKit

class RegisterCoordinator: Coordiantor {
    
    static func prepare() -> RegisterViewController {
        
        let vc = RegisterViewController.instantiate()
        vc.model = RegisterViewModel()
        return vc
    }
}
