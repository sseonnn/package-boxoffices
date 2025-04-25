//
//  URLRequest.BoxOffices.swift
//  BoxOffices
//
//  Created by 이정선 on 4/13/25.
//

import Foundation

extension URLRequest {
    init(urlString: String, httpMethod: HTTPMethod, key: String, queryItems: [URLQueryItem]?) throws {
        // URL Components
        guard var components = URLComponents(string: urlString) else {
            throw APIError.urlIsInvalid
        }
        
        // Query Items
        components.queryItems = [URLQueryItem(name: "key", value: key)]
        if let queryItems {
            components.queryItems?.append(contentsOf: queryItems)
        }
        
        // URL Request
        guard let url = components.url else {
            throw APIError.urlIsInvalid
        }
        self.init(url: url)
        
        // HTTP Method
        self.httpMethod = httpMethod.capitalizedValue
    }
}
