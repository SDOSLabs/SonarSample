//
//  ProductBO.swift
//  ProductSample
//
//  Created by Rafael FERNANDEZ on 2/8/22.
//

import Foundation

struct ProductBO {
    var title: String
    var type: TypeP
    var description: String
    var imageURL: URL
    var height: Int
    var width: Int
    var price: Double
    var rating: Int
}

extension ProductBO: Identifiable {
    var id: String { title }
}

extension ProductBO: Equatable { }

extension ProductBO {
    enum TypeP: String {
        case vegan
        case fruit
        case bakery
        case dairy
        case meat
        case vegetable
    }
}

extension ProductBO {
    init?(dto: ProductDTO) {
        guard let title = dto.title,
              let type = TypeP(rawValue: dto.type ?? ""),
              let description = dto.description,
              let filename = dto.filename,
              let imageURL = URL(string: "https://raw.githubusercontent.com/SDOSLabs/JSON-Sample/master/Products/images/\(filename)"),
              let height = dto.height,
              let width = dto.width,
              let price = dto.price,
              let rating = dto.rating else {
            return nil
        }
        self.title = title
        self.type = type
        self.description = description
        self.imageURL = imageURL
        self.height = height
        self.width = width
        self.price = price
        self.rating = rating
    }
}

extension ProductBO {
    static let mock = ProductBO(dto: ProductDTO(title: "Brown eggs", type: "dairy", description: "Raw organic brown eggs in a basket", filename: "0.jpg", height: 600, width: 400, price: 28.1, rating: 4))!
    
    static let mock2 = ProductBO(dto: ProductDTO(title: "Strawberries", type: "dairy", description: "Soft, sweet, bright red berries", filename: "1.jpg", height: 600, width: 400, price: 28.1, rating: 4))!
    
    static let mock3 = ProductBO(dto: ProductDTO(title: "White eggs", type: "dairy", description: "Raw organic white eggs in a basket", filename: "2.jpg", height: 600, width: 400, price: 24.3, rating: 3))!
}
