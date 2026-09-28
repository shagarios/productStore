//
//  ProductViewModel.swift
//  ProductStore
//
//  Created by shagar on 24/09/26.
//

import Foundation
import Combine

class ProductListViewModel : ObservableObject {
    private let repository : ProductRepository
    init(repository: ProductRepository) {
        self.repository = repository
    }
    @Published var products : [Product] = []
    private var totalCount = 0
    private var offset = 0
    private let limit = 50
    @Published var isLoading = false
    @Published var errorMessage : String = ""
    
    func fetchInitialProducts() async {
        isLoading = true
        offset = 0
        do {
            let response  = try await repository.fetchProducts(limit: limit, skip: offset)
            products = response.products
            totalCount = response.total
            offset = response.products.count
        }
        catch let error {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    
    private var canLoadMore : Bool {
        products.count < totalCount
    }
    
    func fetchMoreProducts(product: Product) async {
        guard let last = products.last, last.id == product.id else {return}
        guard canLoadMore else {return}
        do {
            let response = try await repository.fetchProducts(limit: limit, skip: offset)
            products.append(contentsOf: response.products)
            offset += response.products.count
        }
        catch let error {
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }
    func refresh() async {
        offset = 0
        totalCount = 0
        await fetchInitialProducts()
    }
        
    }

