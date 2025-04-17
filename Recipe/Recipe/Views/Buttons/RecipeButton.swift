//
//  RecipeButton.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/14/25.
//

import SwiftUI

struct RecipeButton: View {
    
    let tittle: String
    
    var body: some View {
        Text(tittle)
        .font(.title3)
        .fontWeight(.semibold)
        .frame(width: 260, height: 50)
        .foregroundColor(.white)
        .background(Color.brandPrimary)
        .cornerRadius(10)
    }
}

struct RecipeButton_Previews: PreviewProvider {
    static var previews: some View {
        RecipeButton(tittle: Constants.recipeButtonTittle.stringValue)
    }
}
