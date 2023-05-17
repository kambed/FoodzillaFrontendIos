//
//  FavouritesCoordinator.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 17/05/2023.
//

import UIKit

class FavouritesCoordinator: Coordinator {
    
    static func prepare() -> FavouriteRecipesViewController {
        
        let vc = FavouriteRecipesViewController.instantiate()
//        vc.model = UserPanelViewModel()
        return vc
    }
}
