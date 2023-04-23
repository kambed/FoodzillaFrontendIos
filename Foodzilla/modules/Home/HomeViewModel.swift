//
//  HomeViewModel.swift
//  Foodzilla
//
//  Created by Paweł on 12/04/2023.
//

import UIKit

struct Recipe {
    let image: UIImage
    let title: String
    let duration: String
}

class HomeViewModel {

    var recipes: [Recipe] = [
        Recipe(image: Assets.utilFood1.image, title: "Creamy pasta", duration: "20 mins"),
        Recipe(image: Assets.utilFood2.image, title: "Alfredo pasta", duration: "35 mins"),
        Recipe(image: Assets.utilFood3.image, title: "Pesto pasta", duration: "20 mins"),
        Recipe(image: Assets.utilFood4.image, title: "Frutti di mare pasta", duration: "35 mins")
    ]
}
