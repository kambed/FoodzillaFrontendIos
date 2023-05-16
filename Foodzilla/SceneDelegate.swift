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

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
        
        // FIXME: After token imp: if token available go home, if not, go to main

        let vc = MainViewController.instantiate()
        navigationController = UINavigationController(rootViewController: vc)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
    
}
