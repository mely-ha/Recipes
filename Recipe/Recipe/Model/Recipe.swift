//
//  Recipe.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/12/25.
//

import Foundation

struct Recipe: Decodable, Identifiable {
    let id: String
    let cuisine: String
    let name: String
    let photoUrlLarge: String?
    let photoUrlSmall: String?
    let sourceUrl: String?
    let youtubeUrl: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(String.self, forKey: .id)
        cuisine = try container.decode(String.self, forKey: .cuisine)
        name = try container.decode(String.self, forKey: .name)
        photoUrlLarge = try? container.decode(String.self, forKey: .photoUrlLarge)
        photoUrlSmall = try? container.decode(String.self, forKey: .photoUrlSmall)
        sourceUrl = try? container.decode(String.self, forKey: .sourceUrl)
        youtubeUrl = try? container.decode(String.self, forKey: .youtubeUrl)
    }
    
    init(id: String, cuisine: String, name: String, photoUrlLarge: String, photoUrlSmall: String, sourceUrl: String, youtubeUrl: String) {
        self.id = id
        self.cuisine = cuisine
        self.name = name
        self.photoUrlLarge = photoUrlLarge
        self.photoUrlSmall = photoUrlSmall
        self.sourceUrl = sourceUrl
        self.youtubeUrl = youtubeUrl
        
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case photoUrlLarge = "photo_url_large"
        case photoUrlSmall = "photo_url_small"
        case sourceUrl = "source_url"
        case youtubeUrl = "youtube_url"
        case cuisine, name
    }
}



struct RecipeResponse: Decodable {
    let recipes: [Recipe]
}

//dummy data
struct MockData {
    static let sampleRecipe = Recipe(
        id: "0c6ca6e7-e32a-4053-b824-1dbf749910d8",
        cuisine: "Malaysian",
        name: "Apam Balik",
        photoUrlLarge: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/large.jpg",
        photoUrlSmall: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/b9ab0071-b281-4bee-b361-ec340d405320/small.jpg",
        sourceUrl: "https://www.nyonyacooking.com/recipes/apam-balik~SJ5WuvsDf9WQ",
        youtubeUrl: "https://www.youtube.com/watch?v=6R8ffRRJcrg"
    )

    static let recipe = [sampleRecipe, sampleRecipe, sampleRecipe, sampleRecipe]
}
