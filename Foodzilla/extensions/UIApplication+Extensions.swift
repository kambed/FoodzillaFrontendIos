//
//  UIApplication+Extensions.swift
//  Foodzilla
//
//  Created by Paweł on 16/05/2023.
//

import Foundation

extension UIApplication {
    
    var appDelegate: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    var sceneDelegate: SceneDelegate? {
        return connectedScenes
            .first(where: { $0.activationState == .foregroundActive })?
            .delegate as? SceneDelegate
    }
}
