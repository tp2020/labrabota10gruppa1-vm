//
//  TestUI.swift
//  task2.2Lab9Tests
//
//  Created by Ivan on 30.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import XCTest

class TestUI: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoginInput() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var app = XCUIApplication()
        
        app.textFields["Login Auth"].tap()
        
        app.keys["m"].tap()
        app.keys["a"].tap()
        app.keys["g"].tap()
        app.keys["t"].tap()
        app.keys["a"].tap()
        app.keys["r"].tap()
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertTrue(app.textFields["Login Auth"].label == "magtar","Login should be magtar")
    }
    
    
    func testRegistration() throws {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var app = XCUIApplication()
        
        app.segmentedControls.element.tap()
        
        app.textFields["Login Reg"].tap()
        
        app.keys["m"].tap()
               app.keys["a"].tap()
               app.keys["g"].tap()
               app.keys["t"].tap()
               app.keys["a"].tap()
               app.keys["r"].tap()
        
        app.keyboards.buttons["Return"].tap()
        
        
        app.textFields["Pass Reg"].tap()
        
        app.keys["p"].tap()
        app.keys["a"].tap()
        app.keys["s"].tap()
        app.keys["s"].tap()

        app.keyboards.buttons["Return"].tap()
        
        app.buttons["Register"].tap()
        
        
        
        XCTAssertTrue(app.textFields["Login Auth"] == nil, "Screen should be changed")
    }

}
