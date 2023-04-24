//
//  EnabledTagViewCell.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 23/04/2023.
//

import UIKit

class EnabledTagViewCell: UICollectionViewCell {

    @IBOutlet weak var tagLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
                setUpLabel()
    }

        private func setUpLabel() {
            tagLabel.font = FontFamily.SFProText.regular.font(size: 14)
            tagLabel.sizeToFit()
        }
}
