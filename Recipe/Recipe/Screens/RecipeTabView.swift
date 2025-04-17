//
//  ContentView.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/12/25.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            RecipeListView()
                .tabItem {
                    Image(systemName: "house")
                    Text(Constants.recipeTabItemListTittle.stringValue)
                }
            AboutView()
                .tabItem {
                    Image(systemName: "person")
                    Text(Constants.recipeTabItemAboutTittle.stringValue)
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
