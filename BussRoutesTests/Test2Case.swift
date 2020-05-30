//
//  Test2Case.swift
//  task2.2Lab9Tests
//
//  Created by Ivan on 28.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import XCTest

class Test2Case: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var b = 39;
        
        XCTAssert(b==39, "b should be equal to 39");
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
