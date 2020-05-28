//
//  task2_2Lab9Tests.swift
//  task2.2Lab9Tests
//
//  Created by Ivan on 28.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import XCTest

class task2_2Lab9Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var a=2;
        
        
        XCTAssert(a==1, "A should be equal to one")
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
