//
//  RecipesTest.swift
//  RecipeTests
//
//  Created by Katherynne Hidalgo on 4/16/25.
//

import XCTest
@testable import Recipe

final class RecipeDetailsViewModelTest: XCTestCase {
    
    func testShouldShowWebsiteButtonTrue() {
        //Given(Arrange)
        let url = "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ"
        let viewModel = RecipeDetailsViewModel()
        //When(Act)
        let isValidShow = viewModel.shouldShowWebsiteButton(fromURLString: url)
        //Then(Assert)
        XCTAssertEqual(isValidShow, true)
    
    }
    
    func testShowYoutubeButtonTrue() {
        let url = "https://www.youtube.com/watch?v=6R8ffRRJcrg"
        let viewModel = RecipeDetailsViewModel()
        let isValidShow = viewModel.shouldShowYoutubeButton(fromURLString: url)
        XCTAssertEqual(isValidShow, true)
    }
    
    func testShouldShowWebsiteButtonNil() {
        let viewModel = RecipeDetailsViewModel()
        let isValidShow = viewModel.shouldShowWebsiteButton(fromURLString: nil)
        XCTAssertEqual(isValidShow, true)
    }
    
    func testShowYoutubeButtonNil() {
        let viewModel = RecipeDetailsViewModel()
        let isValidShow = viewModel.shouldShowYoutubeButton(fromURLString: nil)
        XCTAssertEqual(isValidShow, true)
    }
    
    func testShouldShowWebsiteButtonEmpty() {
        let url = ""
        let viewModel = RecipeDetailsViewModel()
        let isValidShow = viewModel.shouldShowWebsiteButton(fromURLString: url)
        XCTAssertEqual(isValidShow, false)
    }
    
    func testShowYoutubeButtonEmpty() {
        let url = ""
        let viewModel = RecipeDetailsViewModel()
        let isValidShow = viewModel.shouldShowYoutubeButton(fromURLString: url)
        XCTAssertEqual(isValidShow, false)
    }
  
}
