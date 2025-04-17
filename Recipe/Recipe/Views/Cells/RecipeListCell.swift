//
//  RecipeListCell.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/12/25.
//

import SwiftUI

struct RecipeListCell: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            RecipeRemoteImage(urlString: recipe.photoUrlSmall ?? "")
                .aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90)
                .cornerRadius(8)
            
            VStack(alignment: .leading) {
                Text(recipe.cuisine)
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.trailing)
                    .padding(5)
                
                Text(recipe.name)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.trailing)
            }
        }
    }
}

struct RecipeListCell_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListCell(recipe: MockData.sampleRecipe)
    }
}
