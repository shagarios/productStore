//
//  APIService.swift
//  ProductStore
//
//  Created by shagar on 25/09/26.
//

import Foundation

final class APIService : ApiServiceProtocol {
    func request<T:Decodable>(endpoint: APIRouter) async throws -> T {
        let urlRequest = try endpoint.urlRequest()
        let (data,response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpResponse = response as? HTTPURLResponse,
              (200...2009).contains(httpResponse.statusCode) else {
            throw URLError(.badServerResponse)
        }
        return try JSONDecoder().decode(T.self, from: data)
    }
    
}
