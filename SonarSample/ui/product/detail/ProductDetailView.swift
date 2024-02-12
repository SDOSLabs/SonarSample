//
//  ProductDetailView.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 17/10/22.
//

import SwiftUI

struct ProductDetailView: View {
    private let product: ProductBO
    
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var shoppingCartLogic: ShoppingCartLogic
    
    private var basketAmmount: Int {
        return shoppingCartLogic.shoppingCartProducts.first() { shoppingCartBO in
            shoppingCartBO.product == product
        }?.amount ?? 0
    }
    
    init(product: ProductBO) {
        self.product = product
    }
    
    var body: some View {
        content
            .modifier(AppNavigationBar(leftView: {
                Button {
                    dismiss()
                } label: {
                    Image.leftArrow
                }

            }, titleView: {
                Text("Detalle producto")
                    .modifier(AppTextStyle(style: .light, font: .bold(20)))
            }))
            .background(Assets.Color.marine.opacity(0.05))
            .background(Assets.Color.white)
    }
    
    @ViewBuilder
    private var content: some View {
        GeometryReader { proxy in
            ScrollView {
                VStack(spacing: 24) {
                    AppImage(url: product.imageURL, contentMode: .fit, blurImage: true)
                        .frame(maxWidth: .infinity, maxHeight: 244)
                        .aspectRatio(390/244, contentMode: .fill)
                    VStack(alignment: .leading, spacing: 24) {
                        Text(product.title)
                            .modifier(AppTextStyle(style: .black, font: .semiBold(21)))
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                        Text(product.type.rawValue)
                            .modifier(AppTextStyle(style: .light, font: .regular(14)))
                            .padding(.horizontal, 8)
                            .padding(.vertical, 2)
                            .background(Assets.Color.marine)
                        starsView
                        Text(product.description)
                            .modifier(AppTextStyle(style: .black, font: .regular(16)))
                            .multilineTextAlignment(.leading)
                            .lineLimit(nil)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal)
                    Spacer()
                    basketButtonView
                }
                .frame(maxWidth: .infinity, minHeight: proxy.size.height)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
    
    @ViewBuilder
    var basketButtonView: some View {
        HStack {
            if basketAmmount > 0 {
                Button("-") {
                    shoppingCartLogic.decreaseProduct(product)
                }
                .buttonStyle(AppButtonStyle(style: .plain(horizontalPadding: 34)))
                Button(String(format: "%i x %.2f € en el carrito", basketAmmount, product.price)) {
                    shoppingCartLogic.addProduct(product)
                }
                .buttonStyle(AppButtonStyle(style: .fill(horizontalPadding: 12)))
                Button("+") {
                    shoppingCartLogic.addProduct(product)
                }
                .buttonStyle(AppButtonStyle(style: .plain(horizontalPadding: 34)))
            } else {
                Button(String(format: "Añadir por %.2f €", product.price)) {
                    shoppingCartLogic.addProduct(product)
                }
                .buttonStyle(AppButtonStyle(style: .fill(horizontalPadding: 30)))
            }
        }
        .padding(.bottom, 20)
    }
    
    @ViewBuilder
    var starsView: some View {
        HStack(spacing: 0) {
            ForEach(0..<product.rating, id: \.self) { index in
                Image(systemName: "star.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 24)
                    .foregroundColor(Assets.Color.orangeYellow)
            }
            ForEach(product.rating..<5, id: \.self) { index in
                Image(systemName: "star")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 26, height: 24)
                    .foregroundColor(Assets.Color.orangeYellow)
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductDetailView(product: ProductBO.mock)
        }
        .environmentObject(ShoppingCartLogic())
    }
}
