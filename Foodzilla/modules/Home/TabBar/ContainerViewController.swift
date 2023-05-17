//
//  ContainerViewController.swift
//  Foodzilla
//
//  Created by Paweł on 17/05/2023.
//

import UIKit

class ContainerViewController: UIViewController {
    
    private var foodzillaTabBar: FoodzillaTabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupMainTabBarController()
    }

    private func setupMainTabBarController() {
        foodzillaTabBar = FoodzillaTabBar()
        foodzillaTabBar.navigationController?.isNavigationBarHidden = true
        addChild(foodzillaTabBar)
        view.addSubview(foodzillaTabBar.view)
        foodzillaTabBar.didMove(toParent: self)
        foodzillaTabBar.view.frame = view.bounds
    }
}
