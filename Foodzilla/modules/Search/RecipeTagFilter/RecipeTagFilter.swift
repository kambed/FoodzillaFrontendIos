//
//  RecipeTagFilter.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 20/04/2023.
//

import UIKit

class RecipeTagFilter: UICollectionViewCell {

    @IBOutlet weak var DeleteButton: DarkButton!
    @IBOutlet weak var TagName: LandingButton!

    override func awakeFromNib() {
        super.awakeFromNib()

        setUpButtons()
    }

    private func setUpButtons() {
        DeleteButton.configuration?.image = UIImage(systemName: "minus")
        TagName.title = "Test"
    }
}
