//
//  ProductRepositoryImplementation.swift
//  ProductStore
//
//  Created by shagar on 25/09/26.
//

import Foundation

class ProductRepositoryImplementation : ProductRepository {
    private let apiService : ApiServiceProtocol
    init(apiService: ApiServiceProtocol) {
        self.apiService = apiService
    }
    func fetchProducts(limit : Int,skip : Int) async throws -> ProductList {
        return try await apiService.request(endpoint: .productList(limit: limit, skip: skip))
    }
}
