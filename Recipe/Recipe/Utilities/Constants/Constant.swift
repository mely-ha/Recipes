//
//  Constant.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/16/25.
//

import Foundation

enum Constants: String {
    case noRecipesTitle = "No Recipes available now"
    case navigationTitleText = "📃 Recipes"
    case tryAgainButton = "Try again"
    case errorTitle = "Error"
    case errorDismissButton = "OK"
    case invalidDataText = "The data received from the server was invalid. Please contact support."
    case invalidResponseText = "Invalid response from the server. Please try again or contact support."
    case invalidURLText = "The was an issue connecting to the server. If this persists, please contact support."
    case unableToCompleteText = "Unable to completed your request at this time. Please check your internet connection."
    case emptyDataText = "Unable to completed your request at this time. No recipes are available."
    case recipeButtonTittle = "Button Tittle"
    case recipeTabItemListTittle = "Home"
    case recipeTabItemAboutTittle = "About"
    case recipeButtonWSTittle = "Website"
    case recipeButtonYTTittle = "YouTube"
    case aboutViewText = "This is a description about our company. Is the best!"
    
    var stringValue: String {
        return self.rawValue
    }
}
