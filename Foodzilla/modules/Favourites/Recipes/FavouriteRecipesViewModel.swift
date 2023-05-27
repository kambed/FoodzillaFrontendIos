//
//  FavouriteRecipesViewModel.swift
//  Foodzilla
//
//  Created by Paweł on 19/05/2023.
//

import UIKit

class FavouriteRecipesViewModel {
    
    @Published private(set) var recipes: [Recipe] = []
    
    func fetchRecipes() async throws {
        do {
            recipes = try await ApolloGraphQLClient.shared.getRecommendations().recommendations.recipes.map({ Recipe(id: $0!.id!, image: convertBase64ToUIImage(base64String: $0!.image!)!, name: $0!.name, timeOfPreparation: $0!.timeOfPreparation!) })
        } catch let err {
            print(err)
        }
    }
}
