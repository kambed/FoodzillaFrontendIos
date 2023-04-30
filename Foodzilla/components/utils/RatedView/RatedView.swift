//
//  RatedView.swift
//  Foodzilla
//
//  Created by Paweł on 30/04/2023.
//

import UIKit

class RatedView: BaseView {
    
    @IBOutlet var starViews: [UIImageView]!
    private var filledStarViews: [UIImageView] = []
    
    var rating: Float = 0 {
        didSet {
            updateStarImages()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStars()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStars()
    }
    
    private func setupStars() {
        for imageView in starViews {
            imageView.image = UIImage(systemName: "star")
            imageView.tintColor = .systemYellow
            imageView.contentMode = .scaleAspectFit
        }
    }
    
    private func updateStarImages() {
        for (index, imageView) in starViews.enumerated() {
            let starNumber = Float(index + 1)
            
            if rating >= starNumber {
                imageView.image = UIImage(systemName: "star.fill")
            } else if rating > starNumber - 1 {
                let partialFill = CGFloat(rating - Float(index))
                let combinedImage = partiallyFilledStar(fillRatio: partialFill)
                imageView.image = combinedImage
            } else {
                imageView.image = UIImage(systemName: "star")
            }
        }
    }
    
    private func partiallyFilledStar(fillRatio: CGFloat) -> UIImage? {
        
        let starSize = CGSize(width: 32, height: 32)
        UIGraphicsBeginImageContextWithOptions(starSize, false, 0)
        defer { UIGraphicsEndImageContext() }
        
        UIImage(systemName: "star")?.withTintColor(.systemYellow).draw(in: CGRect(origin: .zero, size: starSize))
        
        if let context = UIGraphicsGetCurrentContext() {
            context.addRect(CGRect(x: 0, y: 0, width: starSize.width * fillRatio, height: starSize.height))
            context.clip()
            UIImage(systemName: "star.fill")?.withTintColor(.systemYellow).draw(in: CGRect(origin: .zero, size: starSize))
        }
        
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
