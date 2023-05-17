//
//  SceneDelegate.swift
//  Foodzilla
//
//  Created by Paweł on 15/03/2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    
    var isLoggedIn: Bool = false

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        initApp()
    }
    
    public func initApp() {
        
        let vc: UIViewController?
        
        if !isLoggedIn {
            vc = MainViewController.instantiate()
        } else {
            vc = ContainerCoordinator.prepare()
        }
        
        navigationController = UINavigationController(rootViewController: vc!)
        navigationController?.modalTransitionStyle = .crossDissolve
        navigationController?.modalPresentationStyle = .fullScreen
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
    public func changeRootViewController(viewController: UIViewController) {
        
        navigationController = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationController
        
        UIView.transition(with: window!, duration: 0.3, options: [.transitionCrossDissolve], animations: {}, completion: nil)
    }
}
