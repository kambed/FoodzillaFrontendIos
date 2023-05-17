//
//  SearchCoordinator.swift
//  Foodzilla
//
//  Created by Paweł on 17/05/2023.
//

import UIKit

class SearchCoordinator: Coordinator {
    
    static func prepare() -> SearchViewController {
        
        let vc = SearchViewController.instantiate()
        vc.model = SearchViewModel()
        return vc
    }
}
