//
//  ViewLogicTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

@testable import Guilds

class ViewLogicTests: XCTestCase {
    
    func testShouldDisplayAlertViewGivenValidViewController() {
        let accountLogic = ViewLogic()
        let viewCtrlSpy = ViewControllerSpy()
        
        let alert = accountLogic.showErrorAlertViewOn(viewCtrlSpy, withTitle: "Hello", andSubTitle: "how are you?")
        
        XCTAssertTrue(viewCtrlSpy.spy_presentedViewController)
        XCTAssertEqual(alert.actions.count, 1)
    }
}
