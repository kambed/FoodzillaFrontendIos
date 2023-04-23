//
//  RecipeTagFilter.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 20/04/2023.
//

import UIKit

class RecipeTagFilter: UICollectionViewCell {

    @IBOutlet weak var deleteButton: DarkButton!
    @IBOutlet weak var tagName: LandingButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpButtons()
    }

    private func setUpButtons() {
        deleteButton.title = ""
        deleteButton.configuration?.image = UIImage(systemName: "minus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 12.0, weight: .bold))
        deleteButton.configuration?.cornerStyle = .capsule
    }
}
