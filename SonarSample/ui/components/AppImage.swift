//
//  AppImage.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 17/10/22.
//

import SwiftUI

struct AppImage: View {
    
    private let url: URL
    private let contentMode: SwiftUI.ContentMode
    private let blurImage: Bool
    @State var image: UIImage?
    
    init(url: URL, contentMode: SwiftUI.ContentMode = .fill, blurImage: Bool = false) {
        self.url = url
        self.contentMode = contentMode
        self.blurImage = blurImage
    }
    
    var body: some View {
        imageView
            .background(blurImageView)
            .clipped()
    }
    
    @ViewBuilder
    var imageView: some View {
        Color.clear.overlay {
            if let image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: contentMode)
                
            } else {
                Color.gray
                    .onAppear {
                        Task {
                            let (data, _) = try await URLSession.shared.data(from: url)
                            if let image = UIImage(data: data) {
                                await MainActor.run {
                                    self.image = image
                                }
                            }
                        }
                    }
            }
        }
    }
    
    @ViewBuilder
    var blurImageView: some View {
        if let image, blurImage {
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 10)
        }
    }
}

struct AppImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            AppImage(url: URL(string: "https://github.com/SDOSLabs/JSON-Sample/raw/master/Products/images/6.jpg")!)
                .frame(height: 300)
            AppImage(url: URL(string: "https://github.com/SDOSLabs/JSON-Sample/raw/master/Products/images/6.jpg")!, contentMode: .fit, blurImage: true)
                .frame(height: 300)
        }
    }
}
