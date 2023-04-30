//
//  UIView+Extensions.swift
//  Foodzilla
//
//  Created by Paweł on 30/04/2023.
//

import UIKit

extension UIColor {
    func interpolate(to end: UIColor, with progress: CGFloat) -> UIColor {
        let lhs = self.cgColor.components!
        let rhs = end.cgColor.components!
        let r = lhs[0] + (rhs[0] - lhs[0]) * progress
        let g = lhs[1] + (rhs[1] - lhs[1]) * progress
        let b = lhs[2] + (rhs[2] - lhs[2]) * progress
        let a = lhs[3] + (rhs[3] - lhs[3]) * progress
        return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}
