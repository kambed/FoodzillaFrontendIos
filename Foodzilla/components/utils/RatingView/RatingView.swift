//
//  RatingView.swift
//  Foodzilla
//
//  Created by Paweł on 30/04/2023.
//

import UIKit

class RatingView: BaseView {
    
    
    @IBOutlet var starButtons: [UIButton]!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setUp()
    }
    
    var myRating: Int = 0
    
    private func setUp() {
        
        // clear button titles
        starButtons.forEach { button in
            button.setTitle("", for: .normal)
            button.addTarget(self, action: #selector(ratingViewTapped(_:)), for: .touchUpInside)
        }
    }
    
    public func startupAnimation() {
        
        // if rating for dish is already assigned, don't play startup animation
        guard myRating == 0 else { return }
        
        let animations: [(buttonIndex: Int, imageName: String, duration: Double, delay: Double)] = [
            (0, "star.fill", 0.4, 1.4),
            (1, "star.fill", 0.8, 1.3),
            (2, "star.fill", 1.2, 1.2),
            (3, "star.fill", 1.6, 1.1),
            (4, "star.fill", 2.0, 1.0)
        ]
        
        for animation in animations {
            let button = starButtons[animation.buttonIndex]
            let image = UIImage(systemName: animation.imageName)
            
            UIView.transition(with: button, duration: animation.duration, options: .transitionCrossDissolve, animations: {
                button.setImage(image, for: .normal)
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + animation.delay) {
                UIView.transition(with: button, duration: 0.4, options: .transitionCrossDissolve, animations: {
                    button.setImage(UIImage(systemName: "star"), for: .normal)
                })
            }
        }
    }
   
    @objc
    private func ratingViewTapped(_ ratingButton: UIButton) {
        
        layoutIfNeeded()
        
        for i in 0..<starButtons.count {
            let imageName = (i <= ratingButton.tag) ? "star.fill" : "star"
            let image = UIImage(systemName: imageName)
            
            UIView.transition(with: starButtons[i], duration: 0.2, options: .transitionCrossDissolve, animations: { [weak self] in
                guard let self else { return }
                starButtons[i].setImage(image, for: .normal)
            }, completion: nil)
        }
        
        // the rating of that dish is ratingButton.tag + 1
        // and then we can send request for that dish
        // the other way of doing it would be popup with stars
    }
}
