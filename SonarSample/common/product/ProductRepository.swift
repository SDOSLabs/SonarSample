//
//  ProductRepository.swift
//  ProductSample
//
//  Created by Rafael FERNANDEZ on 2/8/22.
//

import Foundation

enum RepositoryError: Error {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case noData
}

protocol ProductRepository {
    func loadListProduct() async throws -> [ProductBO]
}


class ProductWS: ProductRepository {
    
    func loadListProduct() async throws -> [ProductBO]  {
        guard let url = URL(string: "https://raw.githubusercontent.com/SDOSLabs/JSON-Sample/master/Products/products.json")
        else { throw RepositoryError.invalidURL }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            guard let response = response as? HTTPURLResponse else { throw RepositoryError.invalidResponse }
            guard 200 ..< 300 ~= response.statusCode else { throw RepositoryError.statusCode(response.statusCode) }
            
            do {
                let result = try JSONDecoder().decode([ProductDTO].self, from: data)
                let resultBO = result.compactMap { ProductBO(dto: $0) }
                return resultBO
            } catch {
                throw error
            }
        } catch {
            throw error
        }
    }
}
