//
//  ChipCollectionViewCell.swift
//  Foodzilla
//
//  Created by Paweł on 24/04/2023.
//

import UIKit
import MaterialComponents

//FIXME: this is only for testing purposes, change this after be connection
public struct TagsStruct {
    let id: Int
    let name: String
    var hidden: Bool = false
}

class ChipCollectionViewCell: MDCChipCollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
