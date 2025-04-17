//
//  NetworkManager.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/13/25.
//

import UIKit

final class NetworkManager {
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    static let baseURL = "https://d3jbb8n5wk0qxi.cloudfront.net/"
    private let recipeURL = baseURL + "recipes.json"
    
    private init() {}
 
    
    /// Retrieves RecipesData
    /// - Returns: a list of recipes into the RecipesView
    func getRecipes() async throws -> [Recipe] {
        guard let url = URL(string: recipeURL) else{
            throw RecipeError.invalidURL
        }
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw RecipeError.invalidResponse
            }

            let decoder = JSONDecoder()
            let decodedResponse = try decoder.decode(RecipeResponse.self, from: data)
            let recipes = decodedResponse.recipes

            return recipes
            
        } catch let error {
            print(error.localizedDescription)
            throw error
        }
    }
    
    
    /// Retrieves Recipe's Imagen
    /// - Parameter urlString: Imagen for the recipe
    /// - Returns: a list of recipe's imagen
    func downloadImage(fromURLString urlString: String) async throws -> UIImage {
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            return image
        }
        
        guard let url = URL(string: urlString) else {
            throw RecipeError.failedToFetchImage
        }
        
        do {
            let urlRequest = URLRequest(url: url)
            let (data, _) = try await URLSession.shared.data(for: urlRequest)
            if let image = UIImage(data: data) {
                self.cache.setObject(image, forKey: cacheKey)
                return image
            } else {
                throw RecipeError.failedToFetchImage
            }
            
        } catch {
            throw error
        }
    }
    
}
