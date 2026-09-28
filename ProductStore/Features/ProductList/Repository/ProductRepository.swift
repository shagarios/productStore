//
//  ProductRepository.swift
//  ProductStore
//
//  Created by shagar on 25/09/26.
//

import Foundation
protocol ProductRepository {
    func fetchProducts(limit : Int,skip : Int) async throws -> ProductList
}
