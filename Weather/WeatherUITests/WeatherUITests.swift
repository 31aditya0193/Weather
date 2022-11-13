//
//  WeatherUITests.swift
//  WeatherUITests
//
//  Created by Aditya Mishra on 12/11/22.
//

import XCTest

class WeatherUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testHamburgerButton() throws {
        let app = XCUIApplication()
        app.launch()

        let hamburgerButton = app.buttons.firstMatch
        XCTAssertTrue(hamburgerButton.isHittable)
        hamburgerButton.tap()
        XCTAssertTrue(hamburgerButton.isHittable)
    }
}
