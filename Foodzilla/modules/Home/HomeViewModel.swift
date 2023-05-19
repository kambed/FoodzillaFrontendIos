//
//  HomeViewModel.swift
//  Foodzilla
//
//  Created by Paweł on 12/04/2023.
//

import UIKit
import Combine

struct Recipe {
    let id: String
    let image: UIImage
    let name: String
    let timeOfPreparation: Int
}

class HomeViewModel {

    @Published private(set) var recipes: [Recipe] = []
    
    
    
    func fetchRecipes() async throws {
        do {
            recipes = try await ApolloGraphQLClient.shared.getRecommendations().recommendations.map({ Recipe(id: $0!.id!, image: convertBase64ToUIImage(base64String: $0!.image!)!, name: $0!.name, timeOfPreparation: $0!.timeOfPreparation!) })
        } catch let err {
            print(err)
        }
    }
}
