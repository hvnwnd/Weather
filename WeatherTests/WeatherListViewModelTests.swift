//
//  WeatherListViewModelTests.swift
//  Weather
//
//  Created by Bin CHEN on 1/5/17.
//  Copyright © 2017 Fantestech. All rights reserved.
//

import XCTest
@testable import Weather

class WeatherListViewModelTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConvertCellViewModel() {
        
        let date = Date()
        var info1 = WeatherInfo()
        info1.tempMin = 5
        info1.tempMax = 6
        info1.weatherLabel = "clear"
        info1.updatedDate = date
        info1.icon = "test"
        var info2 = WeatherInfo()
        info2.tempMin = 4
        info2.tempMax = 4
        info2.weatherLabel = "rain"
        info2.updatedDate = date
        info2.icon = "test"
        var info3 = WeatherInfo()
        info3.tempMin = 3
        info3.tempMax = 5
        info3.weatherLabel = "clear"
        info3.updatedDate = date
        info3.icon = "test"
        let list = [info1, info2, info3]
        let cellViewModel = WeatherListViewModel.convert(list).first!
        
        XCTAssertEqual(cellViewModel.tempMax.value, "▲6°")
        XCTAssertEqual(cellViewModel.tempMin.value, "▼3°")
        XCTAssertEqual(cellViewModel.weatherLabel.value, "clear")
    }
}
