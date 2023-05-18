//
//  RecipeTableViewCell.swift
//  Foodzilla
//
//  Created by Paweł on 12/04/2023.
//

import UIKit

class RecipeTableViewCell: UICollectionViewCell {

    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    
    weak var delegate: RecipeTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpImage()
        setUpLabels()
        setUpGestureRecognizers()
    }

    private func setUpImage() {
        recipeImage.layer.cornerRadius = 30.0
    }

    private func setUpLabels() {
        titleLabel.font = FontFamily.SFProText.medium.font(size: 15)
        timeLabel.font = FontFamily.SFProText.medium.font(size: 13)
    }
    
    private func setUpGestureRecognizers() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(cellTapped))
        recipeImage.isUserInteractionEnabled = true
        recipeImage.addGestureRecognizer(tapGesture)
    }
    
    @objc private func cellTapped() {
        delegate?.didTapRecipeCell(self)
    }
}
