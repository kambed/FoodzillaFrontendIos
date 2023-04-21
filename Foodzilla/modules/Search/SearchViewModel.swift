//
//  SearchViewModel.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 20/04/2023.
//

import UIKit

struct Tag {
    let tagButton: LandingButton
    let deleteButton: DarkButton
}

class SearchViewModel {

    var tags: [Tag] = [
        Tag(tagButton: {
            let button = LandingButton()
            button.setTitle("CREAM", for: .normal)
            return button
        }()
            , deleteButton: {
                let button = DarkButton()
                button.setImage(UIImage(systemName: "minus"), for: .normal)
                return button
            }())
    ]
}
