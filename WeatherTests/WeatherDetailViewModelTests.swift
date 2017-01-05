//
//  WeatherDetailViewModelTests.swift
//  Weather
//
//  Created by Bin CHEN on 1/5/17.
//  Copyright © 2017 Fantestech. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherDetailViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDistanceInKm() {
        XCTAssertEqual(WeatherDetailViewModel.distanceInKm(15000), "15.0km")
        XCTAssertEqual(WeatherDetailViewModel.distanceInKm(800), "0.8km")
    }
    
    func testWindDirection() {
        XCTAssertEqual(WeatherDetailViewModel.windDirection(0), "North")
        XCTAssertEqual(WeatherDetailViewModel.windDirection(100), "East")
        XCTAssertEqual(WeatherDetailViewModel.windDirection(200), "South")
        XCTAssertEqual(WeatherDetailViewModel.windDirection(300), "West")
    }
}
