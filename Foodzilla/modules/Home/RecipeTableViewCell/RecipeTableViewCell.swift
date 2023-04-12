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

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpImage()
        setUpLabels()
    }

    private func setUpImage() {
        recipeImage.layer.cornerRadius = 30.0
    }

    private func setUpLabels() {

    }
}
