//
//  APIClientTests.swift
//  BoxOffices
//
//  Created by 이정선 on 4/16/25.
//

// http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=82ca741a2844c5c180a208137bb92bd7&targetDt=20120101

import XCTest
@testable import BoxOffices

final class APIClientTests: XCTestCase {
    func test_fetch() async throws {
        struct Response: Decodable {
            let boxOfficeResult: BoxOfficeResult
            
            struct BoxOfficeResult: Decodable {
                let dailyBoxOfficeList: [DailyBoxOffice]
                
                struct DailyBoxOffice: Decodable {
                    let movieCd: String
                }
            }
        }
        
        let apiClient = APIClient(key: "769f43b5f3f763335c83db4bc31c822b")
        let response: Response = try await apiClient.fetch(path: "boxoffice/searchDailyBoxOfficeList.json",
                                                           httpMethod: .get,
                                                           queryItems: [URLQueryItem(name: "targetDt", value: "20120101")])
        
        XCTAssertEqual(response.boxOfficeResult.dailyBoxOfficeList.count, 10)
    }
}
