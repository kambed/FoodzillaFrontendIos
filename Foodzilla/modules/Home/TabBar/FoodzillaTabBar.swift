//
//  FoodzillaTabBar.swift
//  Foodzilla
//
//  Created by Paweł on 17/05/2023.
//

import UIKit

public let TABBAR_HEIGHT: CGFloat = 95

class TabBarBase: UITabBar {
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        var newSize = super.sizeThatFits(size)
        newSize.height = TABBAR_HEIGHT
        return newSize
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    private func configure() {
        layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.withAlphaComponent(0.4).cgColor
    }
}

class FoodzillaTabBar: UITabBarController {
    
    lazy var homeVC: UINavigationController = {
        let vc = HomeCoordinator.prepare()
        vc.tabBarItem.image = UIImage(systemName: "house.fill")
        let navc = UINavigationController(rootViewController: vc)
        vc.didMove(toParent: navc)
        return navc
    }()
    
    lazy var searchVC: UINavigationController = {
        let vc = SearchCoordinator.prepare()
        vc.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        let navc = UINavigationController(rootViewController: vc)
        vc.didMove(toParent: navc)
        return navc
    }()
    
    lazy var favoritesVC: UINavigationController = {
        let vc = UIViewController()
        vc.tabBarItem.image = UIImage(systemName: "heart.fill")
        vc.loadViewIfNeeded()
        vc.view.backgroundColor = .white
        return UINavigationController(rootViewController: vc)
    }()
    
    lazy var dashboardVC: UINavigationController = {
        let vc = UserPanelCoordinator.prepare()
        vc.tabBarItem.image = UIImage(systemName: "person.fill")
        let navc = UINavigationController(rootViewController: vc)
        vc.didMove(toParent: navc)
        return navc
    }()
    
    override func loadView() {
        super.loadView()
        setupUI()
    }
    
    private func setupUI() {
        
        let customTabBar = TabBarBase()
        self.setValue(customTabBar, forKey: "tabBar")
        
        setViewControllers([homeVC, searchVC, favoritesVC, dashboardVC], animated: true)
        modalPresentationStyle = .fullScreen
        modalTransitionStyle = .crossDissolve
        
        tabBar.items?[0].title = "Home"
        tabBar.items?[1].title = "Search"
        tabBar.items?[2].title = "Favorites"
        tabBar.items?[3].title = "Dashboard"
//        tabBar.items?[3].setTitleTextAttributes([NSAttributedString.Key.foregroundColor: Colors.textDarkGrey.color,
//                                                 NSAttributedString.Key.font: FontConvertible.Font.tabBar], for: .normal)
    }    
}
