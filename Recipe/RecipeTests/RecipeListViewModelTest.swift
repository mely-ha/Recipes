//
//  RecipeTests.swift
//  RecipeTests
//
//  Created by Katherynne Hidalgo on 4/16/25.
//

import XCTest
@testable import Recipe

final class RecipeListViewModelTest: XCTestCase {
    
    func testisValidRecipesEmptyData() {
        let recipesList : [Recipe] = []
        let viewModel = RecipeListViewModel()
        let isValidShow = viewModel.isValidRecipesData(recipes: recipesList)
        XCTAssertEqual(isValidShow, false)
    }
    
    func testisValidRecipesData() {
        let recipe = [Recipe(id: "0c6ca6e7-e32a-4053-b824-1dbf749910d8", cuisine: "Malaysian", name: "Apam Balik", photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg", photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg", sourceUrl: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ", youtubeUrl: "https://www.youtube.com/watch?v=6R8ffRRJcrg")]
        let viewModel = RecipeListViewModel()
        let isValidShow = viewModel.isValidRecipesData(recipes: recipe)
        XCTAssertEqual(isValidShow, true)
    }
 
}
