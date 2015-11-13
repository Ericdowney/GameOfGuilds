//
//  GuildsUITests.swift
//  GuildsUITests
//
//  Created by Downey, Eric on 10/29/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

class GuildsUITests: XCTestCase {
    
    let app: XCUIApplication = XCUIApplication()
    
    override func setUp() {
        super.setUp()
        
        continueAfterFailure = false
        self.app.launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}
