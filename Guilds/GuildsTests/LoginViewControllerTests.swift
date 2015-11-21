//
//  LoginViewControllerTests.swift
//  Guilds
//
//  Created by Downey, Eric on 11/21/15.
//  Copyright © 2015 ICCT. All rights reserved.
//

import XCTest

@testable import Guilds

class LoginViewControllerTests: XCTestCase {
    
    // MARK: - Spys
    
    
    
    // MARK: - Tests

    func testShouldCreateALoginViewController() {
        let loginViewCtrl = LoginViewController()
        let _ = loginViewCtrl.view
        
        XCTAssertNotNil(loginViewCtrl.viewLogic)
        XCTAssertTrue(loginViewCtrl.viewLogic is AccountViewLogic)
    }
}
