//
//  APIRouter.swift
//  ProductStore
//
//  Created by shagar on 25/09/26.
//

import Foundation

enum APIRouter  {
    case productList(limit: Int,skip: Int)
    
    //MARK: BASE URL
    
    private var baseUrl : String {
        "https://dummyjson.com"
    }
    private var path : String {
        switch self {
        case .productList(let limit,let skip):
            return "/products?limit=\(limit)&skip=\(skip)"
        }
    }
    
    //MARK: HTTP METHOD
    
    var method : String {
        switch self {
        case .productList:
            return "GET"
        }
    }
    var headers : [String : String] {
        ["Content-Type" : "Application/json",
        "Accept" : "Application/json"]}
    
    func  urlRequest() throws -> URLRequest {
        guard let  components = URLComponents(string: baseUrl + path) else {
            throw URLError(.badURL)
        }
        guard let url = components.url else {
            throw URLError(.badURL)
        }
        var request = URLRequest(url: url)
        request.httpMethod = method
        headers.forEach { key,value in
            request.setValue(value, forHTTPHeaderField: key)
        }
        return request
    }
}
