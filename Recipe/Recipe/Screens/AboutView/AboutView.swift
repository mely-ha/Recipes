//
//  AccountView.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/12/25.
//

import SwiftUI

struct AboutView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        NavigationView {
            Text(Constants.aboutViewText.stringValue)
            .frame(width: 300, height: 525)
            .background(colorScheme == .dark ? Color(.white) : Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .multilineTextAlignment(.center)
            .font(.body)
            .foregroundColor(.black)
            .padding()
            .navigationTitle("👤 About")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
