//
//  Product.swift
//  ProductStore
//
//  Created by shagar on 25/09/26.
//

import Foundation

struct ProductList: Codable {
    let products: [Product]
    let total: Int
    let skip: Int
    let limit: Int

    enum CodingKeys: String, CodingKey {
        case products = "products"
        case total = "total"
        case skip = "skip"
        case limit = "limit"
    }
}

// MARK: - Product
struct Product: Codable,Identifiable {
    let id: Int
    let title: String?
    let description: String?
    let price: Double?
    let discountPercentage: Double?
    let rating: Double?
    let images: [String]?
    let thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case price = "price"
        case discountPercentage = "discountPercentage"
        case rating = "rating"
        case images = "images"
        case thumbnail = "thumbnail"
    }
}

extension Product {
    func mock(id : Int,title : String = "Sample") -> Product {
        return Product(id: id, title: title, description: nil, price: nil,
                       discountPercentage: nil, rating: nil, images: nil,
                       thumbnail: nil)
    }
}
