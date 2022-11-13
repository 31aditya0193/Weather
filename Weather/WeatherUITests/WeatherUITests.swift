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

    func testCityListView() {
        let app = XCUIApplication()
        app.launch()

        let searchBar = app.searchFields.firstMatch
        XCTAssertTrue(searchBar.waitForExistence(timeout: 1))
        searchBar.tap()
        searchBar.typeText("Agra")
        app.keyboards.buttons ["search"].tap()
        sleep(10)
        XCTAssert(app.staticTexts["Agra"].exists)
        XCTAssert(app.staticTexts["India"].exists)
        
        let weatherTile = app.staticTexts["India"]
        weatherTile.tap()
        
        XCTAssertTrue(app.staticTexts["Agra"].exists)
        XCTAssertFalse(app.staticTexts["India"].exists)
    }
}
