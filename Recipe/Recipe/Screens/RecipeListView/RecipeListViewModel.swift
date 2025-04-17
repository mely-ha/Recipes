//
//  RecipeListViewModel.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/13/25.
//

import SwiftUI

final class RecipeListViewModel: ObservableObject {
    @Published var recipes : [Recipe] = []
    @Published var alertItem : AlertItem?
    @Published var isLoading =  false
    @Published var showEmptyState = false
    
    func getRecipes() {
        isLoading = true
        Task {
            do {
                let recipes = try await NetworkManager.shared.getRecipes()
                DispatchQueue.main.async {
                    self.isLoading = false
                    
                    if self.isValidRecipesData(recipes: recipes) {
                        self.recipes = recipes
                     
                    } else {
                        self.alertItem = AlertContext.emptyData
                        self.showEmptyState = true
                    }
                }
            } catch {
                DispatchQueue.main.async {
                    switch error as? RecipeError {
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                    case .unableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                    case .emptyData:
                        self.alertItem = AlertContext.emptyData
                        
                    default:
                        // We probably don't want to show an error message if the image fails to load
                        // .failedToFetchImage
                        print(error)
                    }
                }
            }
        }
    }
    
    func isValidRecipesData(recipes: [Recipe]?) -> Bool {
        var isvalid = false
        if let recipesArray = recipes, !recipesArray.isEmpty {
            isvalid = true
        }
        return isvalid
    }
}
