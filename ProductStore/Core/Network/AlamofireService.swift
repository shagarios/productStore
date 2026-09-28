//
//  AlamofireService.swift
//  ProductStore
//
//  Created by shagar on 28/09/26.
//

import Foundation
import Alamofire

final class AlamofireService : ApiServiceProtocol {
    func request<T : Decodable>(endpoint: APIRouter) async throws -> T  {
        return try await AF.request(endpoint.urlRequest())
            .validate(statusCode: 200..<300)
            .serializingDecodable(T.self)
            .value
    }
}


