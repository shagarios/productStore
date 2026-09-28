//
//  Ap.swift
//  ProductStore
//
//  Created by shagar on 25/09/26.
//

import Foundation

protocol ApiServiceProtocol {
    func request<T:Decodable> (endpoint : APIRouter) async throws -> T
}
