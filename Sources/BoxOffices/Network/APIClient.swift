//
//  APIClient.swift
//  BoxOffices
//
//  Created by 이정선 on 4/13/25.
//

import Foundation

// 다시 작성해보기
class APIClient {
    private let baseURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/"
    
    let key: String
    
    init(key: String) {
        self.key = key
    }
    
    func fetch<Response: Decodable>(path: String,
                                    httpMethod: HTTPMethod,
                                    queryItems: [URLQueryItem]) async throws -> Response {
        // URL Request
        let urlRequest = try URLRequest(urlString: "\(baseURL)/\(path)",
                                        httpMethod: httpMethod,
                                        key: key,
                                        queryItems: queryItems)
        
        // URL Session Data
        let (data, urlResponse) = try await URLSession.shared.data(for: urlRequest)
        
        // HTTP URL Response
        if let error = APIError(httpResponse: urlResponse as? HTTPURLResponse) {
            throw error
        }
        
        // Decoding
        let output = try JSONDecoder().decode(Response.self, from: data)
        
        return output
    }
}
