//
//  RecipeDetailsView.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/14/25.
//

import SwiftUI

struct RecipeDetailsView: View {
    
    let recipe : Recipe
    
    @StateObject var viewModel = RecipeDetailsViewModel()
    @Binding var isShowingDetail: Bool
    
    
    var body: some View {
        VStack {
            VStack {
                Text(recipe.cuisine)
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding(5)
                
                Text(recipe.name)
                    .font(.title2)
                    .fontWeight(.medium)
            }
            
            RecipeRemoteImage(urlString: recipe.photoUrlLarge ?? "")
            .aspectRatio(contentMode: .fit)
            .frame(width: 350, height: 225)
            .padding()
           
            VStack {
                if viewModel.shouldShowWebsiteButton(fromURLString: recipe.sourceUrl ?? "") {
                    Button{
                        viewModel.goToRecipeWebsite(fromURLString: recipe.sourceUrl ?? "")
                    }label: {
                        RecipeButton(tittle: Constants.recipeButtonWSTittle.stringValue)
                    }
                }
                if viewModel.shouldShowYoutubeButton(fromURLString: recipe.youtubeUrl ?? "") {
                    Button{
                        viewModel.goToYoutube(fromURLString: recipe.youtubeUrl ?? "")
                }label: {
                    RecipeButton(tittle: Constants.recipeButtonYTTittle.stringValue)
                }
            }
            }
        }
        .frame(width: 350, height: 550)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(radius: 40)
        .overlay(Button {
            isShowingDetail = false
        }label:{
            XDismissButton()
        }, alignment: .topTrailing)
    }
}

struct RecipeDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailsView(recipe: MockData.sampleRecipe, isShowingDetail: .constant(true))
    }
}
