//
//  WeatherServiceTests.swift
//  WeatherTests
//
//  Created by Aditya Mishra on 13/11/22.
//

import XCTest
@testable import Weather

class WeatherServiceTests: XCTestCase {
    var weatherService: WeatherService?

    override func setUpWithError() throws {
        weatherService = WeatherService()
    }

    override func tearDownWithError() throws {
        weatherService = nil
    }

    func testUrlPreparation() throws {
        let components = weatherService?.prepareURL(for: "lucknow")
        XCTAssertNotNil(components?.url)
        XCTAssertEqual(components?.url?.scheme, "https")
        XCTAssertEqual(components?.url?.host, "api.openweathermap.org")
        XCTAssertEqual(components?.url?.path, "/data/2.5/weather")
        XCTAssertEqual(components?.url, URL(string: "https://api.openweathermap.org/data/2.5/weather?q=lucknow&appid=1e64ec65233345900b593cf16d21f1e5&units=imperial"))
    }

    func testUrlPreparationNegative() {
        let components = weatherService?.prepareURL(for: "")
        XCTAssertNil(components?.url)
    }
}
