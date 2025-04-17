//
//  RemoteImage.swift
//  Recipe
//
//  Created by Katherynne Hidalgo on 4/14/25.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image : Image? = nil
    
    func load(fromURLString urlString: String) {
        Task {
            do {
                let image = try await NetworkManager.shared.downloadImage(fromURLString: urlString)
                DispatchQueue.main.async {
                    self.image = Image(uiImage: image)
                }
            } catch {
                // handle error if necesary
            }
        }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}

struct RecipeRemoteImage : View {
    @StateObject var imageLoader = ImageLoader()
    let urlString: String
    
    var body: some View {
        RemoteImage(image: imageLoader.image)
            .onAppear() {
                imageLoader.load(fromURLString: urlString)
            }
    }
}
