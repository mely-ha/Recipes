//
//  RecipeError.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/13/25.
//

import Foundation

enum RecipeError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
    case emptyData
    case failedToFetchImage
}
