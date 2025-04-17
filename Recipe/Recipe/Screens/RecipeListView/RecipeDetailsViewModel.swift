//
//  RecipeDetailsViewModel.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/14/25.
//

import SwiftUI

final class RecipeDetailsViewModel: ObservableObject {
    
    func goToRecipeWebsite(fromURLString urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
    
    func goToYoutube(fromURLString urlString: String) {
        if let url = URL(string: urlString) {
            UIApplication.shared.open(url)
        }
    }
    
    func shouldShowWebsiteButton(fromURLString urlString: String?) -> Bool {
        return isValidStringUrl(urlString)
    }
    
    func shouldShowYoutubeButton(fromURLString urlString: String?) -> Bool {
        return isValidStringUrl(urlString)
    }
    
    
    private func isValidStringUrl(_ urlString: String?) -> Bool {
        var isValid = false
        if let sourceUrl = urlString, !sourceUrl.isEmpty {
            isValid = true
        }
        
        return isValid
    }
}
