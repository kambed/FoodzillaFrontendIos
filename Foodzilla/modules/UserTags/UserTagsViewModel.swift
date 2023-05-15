//
//  UserTagsViewModel.swift
//  Foodzilla
//
//  Created by Paweł on 30/04/2023.
//

import UIKit
import Combine

class UserTagsViewModel {
    
    @Published var searchFilter: String = ""
    
    @Published var allTagsData: [TagsStruct] = [
        TagsStruct(id: 1, name: "dietary"),
        TagsStruct(id: 2, name: "low-carb"),
        TagsStruct(id: 3, name: "lactose"),
        TagsStruct(id: 4, name: "main-dish"),
        TagsStruct(id: 5, name: "side-dishes"),
        TagsStruct(id: 6, name: "easy"),
        TagsStruct(id: 7, name: "greens"),
        TagsStruct(id: 8, name: "gluten-free"),
        TagsStruct(id: 9, name: "vegetables"),
        TagsStruct(id: 10, name: "high-calcium")
    ]
    
    @Published var filteredAllTagsData: [TagsStruct] = []
    
    @Published var chosenTagsData: [TagsStruct] = []
}
