//
//  ProductDTO.swift
//  ProductSample
//
//  Created by Rafael FERNANDEZ on 2/8/22.
//

import Foundation

struct ProductDTO: Decodable {
    
    var title: String?
    var type: String?
    var description: String?
    var filename: String?
    var height: Int?
    var width: Int?
    var price: Double?
    var rating: Int?

}
