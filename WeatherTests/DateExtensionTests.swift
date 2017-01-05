//
//  DateExtensionTest.swift
//  Weather
//
//  Created by Bin CHEN on 1/4/17.
//  Copyright © 2017 Fantestech. All rights reserved.
//

import XCTest
@testable import Weather

class DateExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStartOfDay() {
        let date = Date(timeIntervalSince1970: 1483293748.0) //01.01.2017 19:02:28
        let startOfDate = Date(timeIntervalSince1970: 1483225200.0) //2017.01.01 00:00:00
        XCTAssertEqual(date.startOfDay(), startOfDate)
    }
    
    func testDayOfWeek() {
        let monday = Date(timeIntervalSince1970: 1483344000.0).dayOfWeek()
        XCTAssertEqual(monday, "Monday")
        
        let friday = Date(timeIntervalSince1970: 1480665600.0).dayOfWeek()
        XCTAssertEqual(friday, "Friday")
        
        let sunday = Date(timeIntervalSince1970: 1482048000.0).dayOfWeek()
        XCTAssertEqual(sunday, "Sunday")
    }
}
