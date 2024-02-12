//
//  ShoppingCartView.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 18/10/22.
//

import SwiftUI

struct ShoppingCartView: View {
    @EnvironmentObject var shoppingCartLogic: ShoppingCartLogic
    @EnvironmentObject var tabSelectionEnvironment: TabSelectionEnvironment
    
    @State var showPaymentConfirmation: Bool = false
    @State var showPaymentSuccess: Bool = false
    
    var totalPrice: Double {
        shoppingCartLogic.shoppingCartProducts.map {
            $0.product.price * Double($0.amount)
        }.reduce(0, +)
    }
    
    var body: some View {
        content
            .modifier(AppNavigationBar(titleView: {
                Text("Listado")
                    .modifier(AppTextStyle(style: .light, font: .bold(20)))
            }))
            .background(Assets.Color.marine.opacity(0.05))
            .background(Assets.Color.white)
            .background(alerts)
    }
    
    @ViewBuilder
    private var content: some View {
        if !shoppingCartLogic.shoppingCartProducts.isEmpty {
            List {
                ForEach(shoppingCartLogic.shoppingCartProducts) { shoppingCart in
                    ShoppingCartCellView(product: shoppingCart.product)
                }
                .listRowBackground(Color.clear)
            }
            .listStyle(.plain)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Assets.Color.marine2)
            .scrollContentBackground(.hidden)
            .colorScheme(.light)
            .safeAreaInset(edge: .bottom, spacing: 0) {
                Spacer()
                    .frame(height: 100)
            }
            .overlay {
                VStack {
                    Spacer()
                    Button("Pagar \(String(format: "%.2f €", totalPrice))") {
                        showPaymentConfirmation = true
                    }
                    .buttonStyle(AppButtonStyle(style: .fill(horizontalPadding: 20)))
                }
                .padding(.bottom, 20)
            }
        } else {
            VStack(spacing: 30) {
                Text("El carrito está vacío")
                    .multilineTextAlignment(.center)
                    .modifier(AppTextStyle(style: .dark, font: .regular(16)))
                Button("Añadir productos al carrito") {
                    tabSelectionEnvironment.selectionTab = .list
                }
                .buttonStyle(AppButtonStyle(style: .fill(horizontalPadding: 20)))
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
        }
    }
    
    @ViewBuilder
    private var alerts: some View {
        EmptyView()
            .alert("Finalizar compra", isPresented: $showPaymentConfirmation) {
                Button("Sí") {
                    showPaymentSuccess = true
                }
                Button("Cancelar", role: .cancel, action: {})
            } message: {
                Text("Vas a pagar. ¿Estás seguro?")
            }
            .alert("Pagado", isPresented: $showPaymentSuccess) {
                Button("Cerrar", role: .cancel) {
                    shoppingCartLogic.shoppingCartProducts.removeAll()
                }
            } message: {
                Text("Compra realizada correctamente")
            }

    }
}

struct ShoppingCartView_Previews: PreviewProvider {
    static let shoppingCartLogic = {
        let result = ShoppingCartLogic()
        result.addProduct(ProductBO.mock)
        return result
    }()
    
    static var previews: some View {
        ShoppingCartView()
            .environmentObject(shoppingCartLogic)
            .environmentObject(TabSelectionEnvironment())
    }
}
