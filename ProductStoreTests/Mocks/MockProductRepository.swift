//
//  MockProductRepository.swift
//  ProductStore
//
//  Created by shagar on 28/09/26.
//

import Foundation
@testable import ProductStore

class MockProductRepository : ProductRepository {
    var result : Result<ProductList, Error> = .success(ProductList(products: [Product(id: 1, title: "pen", description: nil,
                                                                                      price: nil,
                                                                                      discountPercentage: nil,
                                                                                  rating: nil,
                                                                                  images: nil,
                                                                                  thumbnail: nil)],
                                                                   total: 1, skip: 0, limit: 50))
    func fetchProducts(limit: Int, skip: Int) async throws -> ProductStore.ProductList {
        try result.get()
    }
    
    
    
}

enum MockError : Error,LocalizedError {
    case network
    var errorDescription: String? {
        "Network error"
    }
    
}
