//
//  UserPanelViewModel.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 23/04/2023.
//

import UIKit

struct Tag {
    let name: String
}

class UserPanelViewModel {

    var tags: [Tag] = [
    Tag(name: "dietary"),
    Tag(name: "low-carb"),
    Tag(name: "gluten-free")
    ]
}
