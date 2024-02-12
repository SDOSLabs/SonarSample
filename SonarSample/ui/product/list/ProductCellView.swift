//
//  ProductCellView.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 17/10/22.
//

import SwiftUI

struct ProductCellView: View {
    private let product: ProductBO
    @State private var image: UIImage?
    
    init(product: ProductBO) {
        self.product = product
    }
    
    var body: some View {
        HStack {
            AppImage(url: product.imageURL)
                .frame(width: 140, height: 140)
                .clipShape(Circle())
                .overlay(Circle().stroke(Assets.Color.black, lineWidth: 2))
            VStack(alignment: .leading, spacing: 22) {
                VStack(alignment: .leading, spacing: 12) {
                    Text(product.title)
                        .modifier(AppTextStyle(style: .black, font: .semiBold(16)))
                    Text(product.type.rawValue)
                        .modifier(AppTextStyle(style: .light, font: .regular(14)))
                        .padding(.horizontal, 8)
                        .padding(.vertical, 2)
                        .background(Assets.Color.marine)
                }
                Text(String(format: "%.2f €", product.price))
                    .modifier(AppTextStyle(style: .marine, font: .bold(20)))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.vertical, 8)
        .alignmentGuide(
            .listRowSeparatorLeading
        ) { dimensions in
            dimensions[.leading]
        }
    }
    
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            ProductCellView(product: ProductBO.mock)
        }
        .listStyle(.plain)
        .modifier(DarkGradientStyle())
    }
}
