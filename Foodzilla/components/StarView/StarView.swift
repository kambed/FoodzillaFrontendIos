//
//  StarView.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 27/04/2023.
//

import UIKit

class StarView: UIView {
    var rating: Float = 0 // the rating value

    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        let centerX = rect.width / 2
        let centerY = rect.height / 2
        let starWidth = min(rect.width, rect.height) / 2
        let angle = CGFloat(4 * Double.pi / 5) // the angle between two points of the star

        // draw the path for the star
        path.move(to: CGPoint(x: centerX, y: centerY - starWidth / 2))
        for i in 1...5 {
            let x = centerX + sin(CGFloat(i) * angle) * starWidth / 2
            let y = centerY - cos(CGFloat(i) * angle) * starWidth / 2
            path.addLine(to: CGPoint(x: x, y: y))
        }
        path.close()

        // fill the star based on the rating value
        let fillColor = UIColor.yellow
        let emptyColor = UIColor.lightGray
        let halfColor = UIColor.yellow.withAlphaComponent(0.5)
        for i in 1...5 {
            if Float(i) <= rating {
                // fill the star completely
                fillColor.setFill()
                path.fill()
            } else if Float(i) - 0.5 <= rating {
                // fill half of the star
                halfColor.setFill()
                path.fill()
            } else {
                // leave the star empty
                emptyColor.setFill()
                path.fill()
            }
            path.stroke()
            path.fill()
        }
    }
}
