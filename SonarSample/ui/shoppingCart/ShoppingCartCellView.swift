//
//  ShoppingCartCellView.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 18/10/22.
//

import SwiftUI

struct ShoppingCartCellView: View {
    private let product: ProductBO
    
    @EnvironmentObject private var shoppingCartLogic: ShoppingCartLogic
    @State private var image: UIImage?
    @State private var shoppingCart: ShoppingCartBO?
    @State private var showConfirmDialog: Bool = false
    
    init(product: ProductBO) {
        self.product = product
    }
    
    var body: some View {
        VStack {
            if let shoppingCart {
                HStack(spacing: 19) {
                    AppImage(url: shoppingCart.product.imageURL)
                        .frame(width: 107, height: 107)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    VStack(alignment: .leading, spacing: 16) {
                        Text(shoppingCart.product.title)
                            .modifier(AppTextStyle(style: .black, font: .semiBold(14)))
                        Text(String(format: "%.2f €", shoppingCart.product.price))
                            .modifier(AppTextStyle(style: .marine, font: .bold(20)))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    HStack(spacing: 0) {
                        Button("-") {
                            actionDecrease()
                        }
                        .padding(.vertical, 5)
                        .buttonStyle(AppButtonStyle(style: .plain(horizontalPadding: 10)))
                        Text("\(shoppingCart.amount)")
                            .modifier(AppTextStyle(style: .light, font: .bold(16)))
                            .padding(.horizontal, 14)
                            .padding(.vertical, 10)
                            .background(Assets.Color.marine)
                            .clipShape(Circle())
                        Button("+") {
                            actionIncrease()
                        }
                        .padding(.vertical, 5)
                        .buttonStyle(AppButtonStyle(style: .plain(horizontalPadding: 10)))
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 8)
                .alignmentGuide(
                    .listRowSeparatorLeading
                ) { dimensions in
                    dimensions[.leading]
                }
                .background(alerts(shoppingCart: shoppingCart))
            }
        }
        .onAppear {
            shoppingCart = shoppingCartLogic.shoppingCartProducts.first() { shoppingCartBO in
                shoppingCartBO.product == product
            }
        }
    }
    
    private func actionDecrease() {
        guard let shoppingCart else { return }
        if shoppingCart.amount == 1 {
            showConfirmDialog = true
        } else {
            self.shoppingCart = shoppingCartLogic.decreaseProduct(product)
        }
    }
    
    private func actionIncrease() {
        self.shoppingCart = shoppingCartLogic.addProduct(product)
    }
    
    @ViewBuilder
    private func alerts(shoppingCart: ShoppingCartBO) -> some View {
        EmptyView()
            .alert("Eliminar", isPresented: $showConfirmDialog) {
                Button("Eliminar", role: .destructive) {
                    shoppingCartLogic.removeProduct(shoppingCart.product)
                }
                Button("Cancelar", role: .cancel) {
                    
                }
            } message: {
                Text("Vas a eliminar el producto \(product.title). ¿Estás seguro?")
            }

    }
    
}

struct ShoppingCartCellView_Previews: PreviewProvider {
    static let shoppingCartLogic = {
        let result = ShoppingCartLogic()
        result.addProduct(ProductBO.mock)
        return result
    }()
    
    static var previews: some View {
        List {
            ShoppingCartCellView(product: ProductBO.mock)
        }
        .listStyle(.plain)
        .modifier(DarkGradientStyle())
        .environmentObject(shoppingCartLogic)
    }
}
