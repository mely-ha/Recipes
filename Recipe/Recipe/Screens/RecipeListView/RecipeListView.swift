//
//  RecipeListView.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/12/25.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var viewModel = RecipeListViewModel()
    @State private var isShowingDetail = false
    @State private var selectedRecipe: Recipe?
    
    var body: some View {
        ZStack{
            NavigationView {
                if viewModel.showEmptyState {
                    VStack {
                        Text(Constants.noRecipesTitle.stringValue)
                            .font(.title2)
                            .padding()

                    Button {
                            viewModel.getRecipes()
                    }label: {
                        RecipeButton(tittle: Constants.tryAgainButton.stringValue)
                    }
                    }
                } else {
                    List(viewModel.recipes) { recipe in
                        RecipeListCell(recipe: recipe)
                            .onTapGesture {
                                selectedRecipe =  recipe
                                isShowingDetail = true
                            }
                    }
                    .navigationTitle(Constants.navigationTitleText.rawValue)
                    .listStyle(.plain)
                    .disabled(isShowingDetail)
                    .refreshable {
                        viewModel.getRecipes()
                    }
                }
            }
            .onAppear{
                viewModel.getRecipes()
            }
            .blur(radius: isShowingDetail ? 20 : 0)
            
            if isShowingDetail {
                RecipeDetailsView(recipe: selectedRecipe!, isShowingDetail: $isShowingDetail)
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(item: $viewModel.alertItem){alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
    }
}



