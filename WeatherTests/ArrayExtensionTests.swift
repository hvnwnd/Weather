//
//  ArrayExtensionTests.swift
//  Weather
//
//  Created by Bin CHEN on 1/5/17.
//  Copyright © 2017 Fantestech. All rights reserved.
//

import XCTest
@testable import Weather

class ArrayExtensionTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testModeOfArray () {
        let list = ["a", "b", "b", "b", "c", "c", "d", "d"]
        XCTAssertEqual(list.mode, "b")
    }
}
