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

    func testShouldCreateALoginViewController() {
        let loginViewCtrl = LoginViewController()
        let _ = loginViewCtrl.view
        
        XCTAssertNotNil(loginViewCtrl.accountLogic)
    }
}
