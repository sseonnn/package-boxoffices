//
//  Movie.swift
//  BoxOffices
//
//  Created by 이정선 on 4/16/25.
//

import Foundation

public struct Movie: Decodable {
    public let rank: String
    public let code: String
    public let name: String
    
    private enum CodingKeys: String, CodingKey {
        case rank
        case code = "movieCd"
        case name = "movieNm"
    }
}
