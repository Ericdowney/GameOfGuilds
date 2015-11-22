//
//  GuildExtensionTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

@testable import Guilds

class GuildExtensionTests: XCTestCase {

    // MARK: - Navigation Controller Extension
    
    func testShouldCallCompletionHandler() {
        let navCtrl = UINavigationController()
        let nextViewCtrl = ViewControllerSpy()
        let expectation = expectationWithDescription("")
        var completed = false
        
        navCtrl.pushViewController(nextViewCtrl, animated: false) {
            completed = true
            expectation.fulfill()
        }
        
        waitForExpectationsWithTimeout(1.0) { err in
            XCTAssertTrue(completed)
        }
    }

}
