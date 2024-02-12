//
//  ShoppingCartBO.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 18/10/22.
//

import Foundation

struct ShoppingCartBO {
    let product: ProductBO
    var amount: Int
}

extension ShoppingCartBO : Identifiable {
    var id: String { product.id }
}
