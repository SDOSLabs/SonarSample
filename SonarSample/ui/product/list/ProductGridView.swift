//
//  ProductGridView.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 17/10/22.
//

import SwiftUI

struct ProductGridView: View {
    let product: ProductBO
    @State private var image: UIImage?
    
    init(product: ProductBO) {
        self.product = product
    }
    
    var body: some View {
        VStack(spacing: 10) {
            AppImage(url: product.imageURL)
                .frame(height: 147)
                .clipShape(Rectangle())
            VStack(alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .modifier(AppTextStyle(style: .black, font: .semiBold(16)))
                        .lineLimit(1)
                    Text(String(format: "%.2f €", product.price))
                        .modifier(AppTextStyle(style: .marine, font: .semiBold(16)))
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
                .padding(.bottom, 10)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Assets.Color.white)
    }
}

struct ProductGridView_Previews: PreviewProvider {
    private static let colums = [
        GridItem(.adaptive(minimum: 140, maximum: 180), spacing: 17)
    ]
    
    static var previews: some View {
        ScrollView {
            LazyVGrid(columns: colums, spacing: 10) {
                ProductGridView(product: ProductBO.mock)
                ProductGridView(product: ProductBO.mock)
                ProductGridView(product: ProductBO.mock)
                ProductGridView(product: ProductBO.mock)
            }
            .listStyle(.plain)
            .colorScheme(.light)
            .padding(.top, 30)
            .padding(.bottom, 30)
            .padding(.horizontal, 22)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .modifier(DarkGradientStyle())
    }
}
