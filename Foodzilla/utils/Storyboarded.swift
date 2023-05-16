//
//  Storyboarded.swift
//  Foodzilla
//
//  Created by Paweł on 16/05/2023.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: className, bundle: Bundle.main)
        
        guard let viewController = storyboard.instantiateViewController(withIdentifier: className) as? Self else {
            fatalError("failed to instatiate \(className) from Storyboard")
        }
        return viewController
    }
}
