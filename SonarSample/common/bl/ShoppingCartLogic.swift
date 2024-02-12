//
//  ShoppingCartLogic.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 18/10/22.
//

import Foundation

final class ShoppingCartLogic: ObservableObject {
    @Published var shoppingCartProducts: [ShoppingCartBO] = []
    
    @discardableResult
    func addProduct(_ product: ProductBO) -> ShoppingCartBO? {
        if let index = shoppingCartProducts.firstIndex(where: { shoppingCartBO in
            shoppingCartBO.product == product
        }) {
            var p = shoppingCartProducts[index]
            p.amount += 1
            shoppingCartProducts[index] = p
            return p
        } else {
            let p = ShoppingCartBO(product: product, amount: 1)
            shoppingCartProducts.append(p)
            return p
        }
        
    }
    
    @discardableResult
    func decreaseProduct(_ product: ProductBO) -> ShoppingCartBO? {
        if let index = shoppingCartProducts.firstIndex(where: { shoppingCartBO in
            shoppingCartBO.product == product
        }) {
            var p = shoppingCartProducts[index]
            p.amount -= 1
            if p.amount <= 0 {
                shoppingCartProducts.remove(at: index)
                return nil
            } else {
                shoppingCartProducts[index] = p
                return p
            }
        }
        return nil
    }
    
    func removeProduct(_ product: ProductBO) {
        if let index = shoppingCartProducts.firstIndex(where: { shoppingCartBO in
            shoppingCartBO.product == product
        }) {
            shoppingCartProducts.remove(at: index)
        }
    }
    
    func getAmount(for product: ProductBO) -> Int {
        return shoppingCartProducts.first() { shoppingCartBO in
            shoppingCartBO.product == product
        }?.amount ?? 0
    }
}
