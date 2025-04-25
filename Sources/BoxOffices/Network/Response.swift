//
//  Response..swift
//  BoxOffices
//
//  Created by 이정선 on 4/16/25.
//

import Foundation

struct BoxOfficeResponse: Decodable {
    let boxOfficeResult: BoxOfficeResult
    
    struct BoxOfficeResult: Decodable {
        let dailyBoxOfficeList: [Movie]
    }
}
