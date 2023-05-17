//
//  HomeCoordinator.swift
//  Foodzilla
//
//  Created by Paweł on 17/05/2023.
//

import UIKit

class HomeCoordinator: Coordiantor {

    
    static func prepare() -> HomeViewController {
        
        let vc = HomeViewController.instantiate()
        vc.model = HomeViewModel()
        return vc
    }
}
