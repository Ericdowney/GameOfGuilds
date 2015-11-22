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
    
    func testShouldSetAccountViewLogicOnProfileViewController() {
        let parseSpy = ParseWrapperSpy()
        let accountLogicSpy = AccountViewLogicSpy(wrapper: parseSpy)
        let loginViewCtrl = LoginViewController()
        let _ = loginViewCtrl.view
        
        loginViewCtrl.accountLogic = accountLogicSpy
        loginViewCtrl.username = UITextField()
        loginViewCtrl.password = UITextField()
        parseSpy.spy_shouldLogin = true
        
        // Action
        loginViewCtrl.login(NSObject())
        
        XCTAssertTrue(parseSpy.spy_loggedIn)
        XCTAssertTrue(accountLogicSpy.spy_showStorboard)
    }
    
    func testShouldDisplayErrorAlert() {
        let parseSpy = ParseWrapperSpy()
        let accountLogic = AccountViewLogic(wrapper: parseSpy)
        let loginViewCtrl = LoginViewController()
        let _ = loginViewCtrl.view
        
        loginViewCtrl.accountLogic = accountLogic
        loginViewCtrl.username = UITextField()
        loginViewCtrl.password = UITextField()
        parseSpy.spy_shouldLogin = false
        
        // Action
        loginViewCtrl.login(NSObject())
        
        XCTAssertTrue(parseSpy.spy_loggedIn)
    }
}
