//
//  UserProfileCoordinator.swift
//  Foodzilla
//
//  Created by Paweł on 17/05/2023.
//

import UIKit

class UserPanelCoordinator: Coordinator {
    
    static func prepare() -> UserPanelViewController {
        
        let vc = UserPanelViewController.instantiate()
        vc.model = UserPanelViewModel()
        return vc
    }
}
