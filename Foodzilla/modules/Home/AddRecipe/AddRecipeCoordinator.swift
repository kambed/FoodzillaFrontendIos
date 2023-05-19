//
//  AddRecipeCoordinator.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 18/05/2023.
//

import UIKit

class AddRecipeCoordinator: Coordinator {

    
    static func prepare() -> AddRecipeViewController {
        
        let vc = AddRecipeViewController.instantiate()
        return vc
    }
}
