//
//  ProductViewModel.swift
//  PracticasSwiftUI
//
//  Created by Rafael FERNANDEZ on 14/10/22.
//

import Foundation

final class ProductViewModel: ObservableObject {
    @Published var state: State = .idle
    
    private lazy var productRepository: ProductRepository = ProductWS()
}

extension ProductViewModel {
    enum State {
        case idle
        case loading
        case loaded([ProductBO])
        case error(Error)
    }
}

@MainActor
extension ProductViewModel {
    
    func loadProducts() {
        state = .loading
        Task {
            do {
                let items = try await productRepository.loadListProduct()
                
                state = .loaded(items)
            } catch {
                state = .error(error)
            }
        }
    }
}
