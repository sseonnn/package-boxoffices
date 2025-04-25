import XCTest
@testable import BoxOffices

final class BoxOfficesTests: XCTestCase {
    func test_fetchDailyTop10() async throws {
        let boxOffices = BoxOffices(key: "769f43b5f3f763335c83db4bc31c822b")
        let result = await boxOffices.fetchDailyTop10()
        let topMovies = try result.get()
        XCTAssertEqual(topMovies.count, 10)
    }
}
