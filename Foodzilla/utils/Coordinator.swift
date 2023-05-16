//
//  Coordinator.swift
//  Foodzilla
//
//  Created by Paweł on 16/05/2023.
//

import UIKit

protocol Coordiantor {
    associatedtype T
    
    static func prepare() -> T
}
